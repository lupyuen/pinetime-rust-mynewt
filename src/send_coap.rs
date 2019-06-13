//!  Send sensor data to a CoAP Server or a Collector Node.  The CoAP payload will be encoded as JSON
//!  for CoAP Server and CBOR for Collector Node.  The sensor data will be transmitted to 
//!  CoAP Server over WiFi via the ESP8266 transceiver, and to Collector Node via nRF24L01 transceiver.
//!
//!  This enables transmission of Sensor Data to a local Sensor Network (via nRF24L01)
//!  and to the internet (via ESP8266).  For sending to Collector Node we use raw temperature (integer) 
//!  instead of computed temperature (floating-point) to make the encoding simpler and faster.
//!
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/send_coap.c`

use cstr_core::CStr;                    //  Import string utilities from cstr_core library: https://crates.io/crates/cstr_core
use crate::base::*;                     //  Import base.rs for common declarations
use crate::sensor::*;

//  From https://docs.serde.rs/src/serde_json/macros.rs.html

#[macro_export(local_inner_macros)]
macro_rules! coap {
  // Hide distracting implementation details from the generated rustdoc.
  ($($json:tt)+) => {
    coap_internal!($($json)+)
  };
}

#[macro_export(local_inner_macros)]
#[doc(hidden)]
macro_rules! coap_internal {
  //////////////////////////////////////////////////////////////////////////
  // TT muncher for parsing the inside of an array [...]. Produces a vec![...]
  // of the elements.
  //
  // Must be invoked as: coap_internal!(@array [] $($tt)*)
  //////////////////////////////////////////////////////////////////////////

  // Done with trailing comma.
  (@array [$($elems:expr,)*]) => {
    coap_internal_vec![$($elems,)*]
  };

  // Done without trailing comma.
  (@array [$($elems:expr),*]) => {
    coap_internal_vec![$($elems),*]
  };

  // Next element is `null`.
  (@array [$($elems:expr,)*] null $($rest:tt)*) => {
    coap_internal!(@array [$($elems,)* coap_internal!(null)] $($rest)*)
  };

  // Next element is `true`.
  (@array [$($elems:expr,)*] true $($rest:tt)*) => {
    coap_internal!(@array [$($elems,)* coap_internal!(true)] $($rest)*)
  };

  // Next element is `false`.
  (@array [$($elems:expr,)*] false $($rest:tt)*) => {
    coap_internal!(@array [$($elems,)* coap_internal!(false)] $($rest)*)
  };

  // Next element is an array.
  (@array [$($elems:expr,)*] [$($array:tt)*] $($rest:tt)*) => {
    coap_internal!(@array [$($elems,)* coap_internal!([$($array)*])] $($rest)*)
  };

  // Next element is a map.
  (@array [$($elems:expr,)*] {$($map:tt)*} $($rest:tt)*) => {
    coap_internal!(@array [$($elems,)* coap_internal!({$($map)*})] $($rest)*)
  };

  // Next element is an expression followed by comma.
  (@array [$($elems:expr,)*] $next:expr, $($rest:tt)*) => {
    coap_internal!(@array [$($elems,)* coap_internal!($next),] $($rest)*)
  };

  // Last element is an expression with no trailing comma.
  (@array [$($elems:expr,)*] $last:expr) => {
    coap_internal!(@array [$($elems,)* coap_internal!($last)])
  };

  // Comma after the most recent element.
  (@array [$($elems:expr),*] , $($rest:tt)*) => {
    coap_internal!(@array [$($elems,)*] $($rest)*)
  };

  // Unexpected token after most recent element.
  (@array [$($elems:expr),*] $unexpected:tt $($rest:tt)*) => {
    coap_unexpected!($unexpected)
  };

  //////////////////////////////////////////////////////////////////////////
  // TT muncher for parsing the inside of an object {...}. Each entry is
  // inserted into the given map variable.
  //
  // Must be invoked as: coap_internal!(@object $map () ($($tt)*) ($($tt)*))
  //
  // We require two copies of the input tokens so that we can match on one
  // copy and trigger errors on the other copy.
  //////////////////////////////////////////////////////////////////////////

  // Done.
  (@object $object:ident () () ()) => {};

  // Insert the current entry followed by trailing comma.
  (@object $object:ident [$($key:tt)+] ($value:expr) , $($rest:tt)*) => {
    let _ = "TODO: add (_key, _value) to _object_key";
    let _key = $($key)+;
    let _value = $value;
    let _object_key = $object;

    //  Append to the "values" array e.g.
    //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    //  coap_item_str!(_object_key, _key, _value);
    coap_item_str!($object, $($key)+, $value);
    let _ = "--------------------";

    //  Previously:
    //  let _ = $object.insert(($($key)+).into(), $value);

    //  Continue expanding the rest of the JSON.
    coap_internal!(@object $object () ($($rest)*) ($($rest)*));
  };

  // Current entry followed by unexpected token.
  (@object $object:ident [$($key:tt)+] ($value:expr) $unexpected:tt $($rest:tt)*) => {
    coap_unexpected!($unexpected);
  };

  // Insert the last entry without trailing comma.
  (@object $object:ident [$($key:tt)+] ($value:expr)) => {
    //  TODO
    let _ = $object.insert(($($key)+).into(), $value);
  };

  // Next value is `null`.
  (@object $object:ident ($($key:tt)+) (: null $($rest:tt)*) $copy:tt) => {
    coap_internal!(@object $object [$($key)+] (coap_internal!(null)) $($rest)*);
  };

  // Next value is `true`.
  (@object $object:ident ($($key:tt)+) (: true $($rest:tt)*) $copy:tt) => {
    coap_internal!(@object $object [$($key)+] (coap_internal!(true)) $($rest)*);
  };

  // Next value is `false`.
  (@object $object:ident ($($key:tt)+) (: false $($rest:tt)*) $copy:tt) => {
    coap_internal!(@object $object [$($key)+] (coap_internal!(false)) $($rest)*);
  };

  // Next value is an array.
  (@object $object:ident ($($key:tt)+) (: [$($array:tt)*] $($rest:tt)*) $copy:tt) => {
    coap_internal!(@object $object [$($key)+] (coap_internal!([$($array)*])) $($rest)*);
  };

  // Next value is a map.
  (@object $object:ident ($($key:tt)+) (: {$($map:tt)*} $($rest:tt)*) $copy:tt) => {
    coap_internal!(@object $object [$($key)+] (coap_internal!({$($map)*})) $($rest)*);
  };

  // Next value is an expression followed by comma.
  (@object $object:ident ($($key:tt)+) (: $value:expr , $($rest:tt)*) $copy:tt) => {
    coap_internal!(@object $object [$($key)+] (coap_internal!($value)) , $($rest)*);
  };

  // Last value is an expression with no trailing comma.
  (@object $object:ident ($($key:tt)+) (: $value:expr) $copy:tt) => {
    coap_internal!(@object $object [$($key)+] (coap_internal!($value)));
  };

  // Missing value for last entry. Trigger a reasonable error message.
  (@object $object:ident ($($key:tt)+) (:) $copy:tt) => {
    // "unexpected end of macro invocation"
    coap_internal!();
  };

  // Missing colon and value for last entry. Trigger a reasonable error
  // message.
  (@object $object:ident ($($key:tt)+) () $copy:tt) => {
    // "unexpected end of macro invocation"
    coap_internal!();
  };

  // Misplaced colon. Trigger a reasonable error message.
  (@object $object:ident () (: $($rest:tt)*) ($colon:tt $($copy:tt)*)) => {
    // Takes no arguments so "no rules expected the token `:`".
    coap_unexpected!($colon);
  };

  // TODO: Found a key followed by a comma. Assume this is a SensorValue type with key and value.
  (@object $object:ident ($($key:tt)*) (, $($rest:tt)*) ($comma:tt $($copy:tt)*)) => {
    let _ = "TODO: Expand _sensor_value (key, value) and add to _object_key";
    let _sensor_value = $($key)*;
    let _object_key = $object;
    coap_set_int_val!(
      $object,  //  _object_key, 
      $($key)*  //  _sensor_value
    );

    let _ = "--------------------";
    coap_internal!(@object $object () ($($rest)*) ($($rest)*));

    // Previously: Found a comma inside a key. Trigger a reasonable error message.
    // Takes no arguments so "no rules expected the token `,`".
    ////coap_unexpected!($comma);
  };

  // Key is fully parenthesized. This avoids clippy double_parens false
  // positives because the parenthesization may be necessary here.
  (@object $object:ident () (($key:expr) : $($rest:tt)*) $copy:tt) => {
    coap_internal!(@object $object ($key) (: $($rest)*) (: $($rest)*));
  };

  // Munch a token into the current key.
  (@object $object:ident ($($key:tt)*) ($tt:tt $($rest:tt)*) $copy:tt) => {
    let _ = "token ident";
    coap_internal!(@object $object ($($key)* $tt) ($($rest)*) ($($rest)*));
  };

  //////////////////////////////////////////////////////////////////////////
  // The main implementation.
  //
  // Must be invoked as: coap_internal!($($json)+)
  //////////////////////////////////////////////////////////////////////////

  (null) => {
    //  TODO
    { _ = "null"; "null" }
    //  Previously:
    //  $crate::Value::Null
  };

  (true) => {
    //  TODO
    { _ = "true"; "true" }
    //  Previously:
    //  $crate::Value::Bool(true)
  };

  (false) => {
    //  TODO
    { _ = "false"; "false" }
    //  Previously:
    //  $crate::Value::Bool(false)
  };

  ([]) => {
    //  TODO
    { _ = "[]"; "[]" }
    //  Previously:
    //  $crate::Value::Array(coap_internal_vec![])
  };

  ([ $($tt:tt)+ ]) => {
    //  TODO
    {
      _ = "begin array";
      _array = coap_internal!(@array [] $($tt)+);
      _ = "end array";
      "TODO: array"
    }
    //  Previously:
    //  $crate::Value::Array(coap_internal!(@array [] $($tt)+))
  };

  ({}) => {
    //  TODO
    { _ = "{}"; "{}" }
    //  Previously:
    //  $crate::Value::Object($crate::Map::new())
  };

  //  If we match the top level of the JSON: { ... }
  ({ $($tt:tt)+ }) => {
    //  Substitute with this code...
    {
      let _ = "begin root";
      let root = "root";  //  Top level object is named "root".
      let values = "values";  //  "values" will be an array of items under the root
      coap_root!({  //  Create the payload root

        //  For sending to CoAP Server...
        coap_array!(root, values, {  //  Create "values" as an array of items under the root
          //  Expand the items inside { ... }
          coap_internal!(@object values () ($($tt)+) ($($tt)+));
        });  //  Close the "values" array

        //  For sending to Collector Node...
        //  coap_internal!(@object root () ($($tt)+) ($($tt)+));

      });  //  Close the payload root
      //  Previously: coap_internal!(@object root () ($($tt)+) ($($tt)+));            
      let _ = "end root";
      let _ = "return root to caller";
      root
    }
    /* Previously:
    $crate::Value::Object({
      let mut object = $crate::Map::new();
      coap_internal!(@object object () ($($tt)+) ($($tt)+));
      object
    })
    */
  };

  // Any Serialize type: numbers, strings, struct literals, variables etc.
  // Must be below every other rule.
  ($other:expr) => {
    { let _expr = $other; $other }
    //  Previously:
    //  $crate::to_value(&$other).unwrap()
  };
}

#[macro_export]
#[doc(hidden)]
macro_rules! coap_internal_vec {
  ($($content:tt)*) => {
    vec![$($content)*]
  };
}

#[macro_export]
#[doc(hidden)]
macro_rules! coap_unexpected {
  () => {};
}

///////////////////////////////////////////////////////////////////////////////
//  CoAP macros ported from C to Rust:
//  https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-coap/libs/sensor_coap/include/sensor_coap/sensor_coap.h

///  Compose the payload root.
#[macro_export(local_inner_macros)]
macro_rules! coap_root {
  ($children0:block) => {{
    let _ = "begin coap_root";
    oc_rep_start_root_object!();
    $children0;
    oc_rep_end_root_object!();
    let _ = "end coap_root";
  }};
}

///  Compose an array under "object", named as "key".  Add "children" as array elements.
#[macro_export(local_inner_macros)]
macro_rules! coap_array {
  ($object0:ident, $key0:ident, $children0:block) => {{
    let _ = "begin coap_array with _object0, _key0";
    let _object0 = $object0;
    let _key0 = $key0;
    oc_rep_set_array!($object0, $key0);
    $children0;
    oc_rep_close_array!($object0, $key0);
    let _ = "end coap_array";
  }};
}

///  Append a (`key` + `val` string value) item to the array named `parent`:
///    `{ <parent>: [ ..., {"key": <key>, "value": <val>} ] }`
#[macro_export(local_inner_macros)]
macro_rules! coap_item_str {
  //  TODO: Allow key to be ident.
  ($parent:ident, $key:expr, $val:expr) => {{
    let _ = "begin coap_item_str with _parent, _key, _val";
    let _parent = $parent;
    let _key = $key;
    let _val = $val;
    coap_item!(
      $parent,  //  _parent,
      {
        oc_rep_set_text_string!(
          $parent,  //  _parent, 
          "key",   
          $key      //  _key
        );
        oc_rep_set_text_string!(
          $parent,  //  _parent, 
          "value", 
          $val      //  _val
        );
      }
    );
    let _ = "end coap_item_str";
  }};
}

///  Append an array item under the array named `array0`.  Add `children0` as the items (key and value).
///    `{ <array0>: [ ..., { <children0> } ] }`
#[macro_export(local_inner_macros)]
macro_rules! coap_item {
  ($array0:ident, $children0:block) => {{
    let _ = "begin coap_item";
    oc_rep_object_array_start_item!($array0);
    $children0;
    oc_rep_object_array_end_item!($array0);
    let _ = "end coap_item";
  }};
}

///  Given an object parent and an integer Sensor Value val, set the val's key/value in the object.
#[macro_export(local_inner_macros)]
macro_rules! coap_set_int_val {
  ($parent0:ident, $val0:expr) => {{
    let _ = "begin coap_set_int_val with _parent0, _val0";
    let _parent0 = $parent0;
    let _ = "TODO: let _val0 = $val0;";
    //  TODO
    let _ = "TODO: let _key = _sensor_value.key;";
    let _ = "TODO: let _value = _sensor_value.value;";
    let _ = "TODO: assert(val0->val_type == SENSOR_VALUE_TYPE_INT32);";
    let _ = "TODO: rep_set_int_k(parent0, val0->key, val0->int_val);";
  oc_rep_set_int_k!($parent0, "TODO: val0->key", "TODO: val0->int_val");  //  TODO
    let _ = "end coap_set_int_val";
  }};
}

//  `rep` macros

#[macro_export(local_inner_macros)]
macro_rules! rep_start_root_object {
  () => {{
    let _ = "begin rep_start_root_object";
    //  TODO: Handle JSON
    oc_rep_start_root_object!();
    let _ = "end rep_start_root_object";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! rep_end_root_object {
  () => {{
    let _ = "begin rep_end_root_object";
    //  TODO: Handle JSON
    oc_rep_end_root_object!();
    let _ = "end rep_end_root_object";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! rep_set_array {
  ($object:ident, $key:ident) => {{
    let _ = "begin rep_set_array";
    //  TODO: Handle JSON
    oc_rep_set_array!($object, $key);
    let _ = "end rep_set_array";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! rep_close_array {
  ($object:ident, $key:ident) => {{
    let _ = "begin rep_close_array";
    //  TODO: Handle JSON
    oc_rep_close_array!($object, $key);
    let _ = "end rep_close_array";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! rep_set_text_string {
  ($object:ident, $key:expr, $value:expr) => {{
    let _ = "begin rep_set_text_string";
    //  TODO: Handle JSON
    oc_rep_set_text_string!($object, $key, $value);
    let _ = "end rep_set_text_string";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! rep_object_array_start_item {
  ($key:ident) => {{
    let _ = "begin rep_object_array_start_item";
    //  TODO: Handle JSON
    oc_rep_object_array_start_item!($key);
    let _ = "end rep_object_array_start_item";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! rep_object_array_end_item {
  ($key:ident) => {{
    let _ = "begin rep_object_array_end_item";
    //  TODO: Handle JSON
    oc_rep_object_array_end_item!($key);
    let _ = "end rep_object_array_end_item";
  }};
}

///////////////////////////////////////////////////////////////////////////////
//  CoAP macros ported from C to Rust:
//  https://github.com/apache/mynewt-core/blob/master/net/oic/include/oic/oc_rep.h

#[macro_export(local_inner_macros)]
macro_rules! oc_rep_start_root_object {
  () => {{
    let _ = "begin oc_rep_start_root_object";
    //  TODO
    let _ = "TODO: g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength);";
    let _ = "end oc_rep_start_root_object";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! oc_rep_end_root_object {
  () => {{
    let _ = "begin oc_rep_end_root_object";
    //  TODO
    let _ = "TODO: g_err |= cbor_encoder_close_container(&g_encoder, &root_map);";
    let _ = "end oc_rep_end_root_object";
  }};
}

#[macro_export]
macro_rules! oc_rep_start_object {
  ($parent:ident, $key:ident) => {{
    let _ = "begin oc_rep_start_object";
    let _parent0 = $parent;
    let _key0 = $key;
    let _child = concat!(
      stringify!($key), "_map"  //  key##_map
    );
    //  TODO
    //  let _ = "TODO: CborEncoder key##_map;";
    let _ = concat!("TODO: CborEncoder ", 
      stringify!($key), "_map"  //  key##_map
    );
    //  let _ = "TODO: g_err |= cbor_encoder_create_map(&parent, &key##_map, CborIndefiniteLength);";
    let _ = concat!("TODO: g_err |= cbor_encoder_create_map(&parent, &",
      stringify!($key), "_map",  //  key##_map
      ", CborIndefiniteLength);");
    let _ = "end oc_rep_start_object";
  }};
}

#[macro_export]
macro_rules! oc_rep_end_object {
  ($parent:ident, $key:ident) => {{
    let _ = "begin oc_rep_end_object";
    let _parent0 = $parent;
    let _key0 = $key;
    let _child = concat!(
      stringify!($key), "_map"
    );
    //  TODO
    //  let _ = "TODO: g_err |= cbor_encoder_close_container(&parent, &key##_map);";
    let _ = concat!("TODO: g_err |= cbor_encoder_close_container(&parent, &", 
      stringify!($key), "_map",
      ");"
    );
    let _ = "end oc_rep_end_object";
  }};
}

#[macro_export]
macro_rules! oc_rep_start_array {
  ($parent:ident, $key:ident, $parent_suffix:literal) => {{
    let _ = "begin oc_rep_start_array";
    let _parent = concat!(
      stringify!($parent), $parent_suffix
    );
    let _key = $key;
    let _child = concat!(
      stringify!($key), "_array"  //  key##_array
    );
    //  let _ = "TODO: CborEncoder key##_array;";
    let _ = concat!("TODO: CborEncoder ",
      stringify!($key), "_array",  //  key##_array
      ";"
    );

    //  let _ = "TODO: g_err |= cbor_encoder_create_array(&parent, &key##_array, CborIndefiniteLength);";
    let _ = concat!("TODO: g_err |= cbor_encoder_create_array(&", 
      stringify!($parent), $parent_suffix,  //  parent
      ", &",
      stringify!($key), "_array",  //  key##_array
      ", CborIndefiniteLength);"
    );
    let _ = "end oc_rep_start_array";
  }};
}

#[macro_export]
macro_rules! oc_rep_end_array {
  ($parent:ident, $key:ident) => {{
    let _ = "begin oc_rep_end_array";
    let _parent = $parent;
    let _key = $key;
    let _child = concat!(
      stringify!($key), "_array"
    );
    //  TODO
    //  let _ = "TODO: g_err |= cbor_encoder_close_container(&parent, &key##_array);";
    let _ = concat!("TODO: g_err |= cbor_encoder_close_container(&parent, &",
      stringify!($key), "_array",
      ");"
    );
    let _ = "end oc_rep_end_array";
  }};
}

#[macro_export]
macro_rules! oc_rep_set_array {
  ($object:ident, $key:ident) => {{
    let _ = "begin oc_rep_set_array";
    let _object = $object;
    let _key = $key;    
    let _child = concat!(
      stringify!($object), "_map"  //  object##_map
    );
    //  TODO
    //  let _ = concat!("TODO: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key));");
    let _ = concat!("TODO: g_err |= cbor_encode_text_string(&",
      stringify!($object), "_map",  //  object##_map
      ", #key, strlen(#key));"
    );

    //  let _ = concat!("TODO: oc_rep_start_array!(object##_map, key);");
    let _ = concat!("TODO: oc_rep_start_array!(",
      stringify!($object), "_map",  //  object##_map
      ", key);"
    );
    oc_rep_start_array!(
      $object,
      $key,
      "_map"
    );  //  TODO
    let _ = "end oc_rep_set_array";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! oc_rep_close_array {
  ($object:ident, $key:ident) => {{
    let _ = "begin oc_rep_close_array";
    let _object = $object;
    let _key = $key;
    //  TODO
    let _ = "TODO: oc_rep_end_array(object##_map, key);";
    oc_rep_end_array!($key, $key);  //  TODO
    let _ = "end oc_rep_close_array";
  }};
}

#[macro_export]
macro_rules! oc_rep_object_array_start_item {
  ($key:ident) => {{
    let _ = "begin oc_rep_object_array_start_item";
    let _ = "TODO: oc_rep_start_object(key##_array, key);";        
    oc_rep_start_object!($key, $key);  //  TODO
    let _ = "end oc_rep_object_array_start_item";
  }};
}

#[macro_export]
macro_rules! oc_rep_object_array_end_item {
  ($key:ident) => {{
    let _ = "begin oc_rep_object_array_end_item";
    let _ = "TODO: oc_rep_end_object(key##_array, key);";
    oc_rep_end_object!($key, $key);  //  TODO
    let _ = "end oc_rep_object_array_end_item";
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! oc_rep_set_text_string {
  ($object:ident, $key:expr, $value:expr) => {{
    let _ = "begin oc_rep_set_text_string with _object, _key, _value";
    let _object = $object;
    let _key = $key;
    let _value = $value;
    //  TODO
    let _ = "TODO: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key));";
    let _ = "TODO: g_err |= cbor_encode_text_string(&object##_map, value, strlen(value));";
    let _ = "end oc_rep_set_text_string";
  }};
}

///  Same as oc_rep_set_int but changed "#key" to "key" so that the key won't be stringified.
#[macro_export(local_inner_macros)]
macro_rules! oc_rep_set_int_k {
  ($object:ident, $key:expr, $value:expr) => {{
    let _ = "begin oc_rep_set_int_k with _object, _key, _value";
    let _object = $object;
    let _key = $key;
    let _value = $value;
    //  TODO
    let _ = "TODO: g_err |= cbor_encode_text_string(&object##_map, key, strlen(key));";
    let _ = "TODO: g_err |= cbor_encode_int(&object##_map, value);";
    let _ = "end oc_rep_set_int_k";
  }};
}

#[macro_export]
macro_rules! test_literal {
  ($key:literal) => {{
    let _ = concat!($key, "_zzz");
  }};
}

#[macro_export]
macro_rules! test_ident {
  ($key:ident) => {{
    let $key = stringify!($key);
    //  concat_idents!($key, _map);
  }};
}

///////////////////////////////////////////////////////////////////////////////
//  Test CoAP macros

///  Compose a CoAP message (CBOR or JSON) with the sensor value in `val` and transmit to the
///  Collector Node (if this is a Sensor Node) or to the CoAP Server (if this is a Collector Node
///  or Standalone Node).
fn send_sensor_data_rust() {
  let abc = "def";
  trace_macros!(true);
  //test_literal!("abc");
  test_ident!(abc);
  trace_macros!(false);

  let device_id = b"0102030405060708090a0b0c0d0e0f10";
  let node_id = b"b3b4b5b6f1";

  //  Sensor `t` has int value 2870.
  let int_sensor_value = SensorValueNew {
    key: "t",
    val: SensorValueType::Uint(2870)
  };
  //  Sensor `tmp` has float value 28.70.
  let float_sensor_value = SensorValueNew {
    key: "tmp",
    val: SensorValueType::Float(28.70)
  };

  trace_macros!(true);

  //  Compose the CoAP Payload in JSON or CBOR using the `coap` macro.
  let payload = coap!({
    "device": device_id,
    //  int_sensor_value,    //  Send `{t: 2870}`
    //  float_sensor_value,  //  Send `{tmp: 28.70}`
    //  "node":   node_id,
  });

  trace_macros!(false);

}

pub struct SensorValueNew {
  ///  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
  pub key: &'static str,
  ///  The type of the sensor value and the value.
  pub val: SensorValueType,
}

pub enum SensorValueType {
  ///  32-bit unsigned integer. For raw temp, contains the raw temp integer value
  Uint(u32),
  ///  32-bit float. For computed temp, contains the computed temp float value
  Float(f32),
}

fn test_macro2() {
  //  Send the payload.
  //  On Collector Node: Device sends JSON to CoAP server via ESP8266...
  // {"values":[
  //   {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
  //   {"key":"node",   "value":"b3b4b5b6f1"},
  //   {"key":"t",      "value":2870},
  //   {"key":"tmp",    "value":28.7}
  // ]}

  //  On Sensor Node: Device sends CBOR to Collector Node via nRF24L01...
  //  { "t": 2870 }

  let root = "root_var";
  let values = "values_var";
  let device_id = b"0102030405060708090a0b0c0d0e0f10";
  let node_id = b"b3b4b5b6f1";
  //  Sensor `t` has int value 2870.
  let int_sensor_value = SensorValueNew {
    key: "t",
    val: SensorValueType::Uint(2870)
  };

  coap_item_str! (values, "device", device_id);  ////
  //  coap_set_int_val! (root, int_sensor_value);

  coap_array! (root, values, {  //  Create "values" as an array of items under the root
    coap_item_str! (values, "device", device_id);
    coap_item_str! (values, "node", node_id);
    //  coap_set_int_val! (root, int_sensor_value);
  });  ////

  let payload = coap_root! ({  //  Create the payload root
    coap_array! (root, values, {  //  Create "values" as an array of items under the root
      //  Append to the "values" array:
      //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
      coap_item_str! (values, "device", device_id);

      //    {"key":"node", "value":"b3b4b5b6f1"},
      coap_item_str! (values, "node", node_id);

      //  For Sensor Node: Set the Sensor Key and integer Sensor Value, e.g. { t: 2870 }
      coap_set_int_val! (root, int_sensor_value);
      
      //  If we are using raw temperature (integer) instead of computed temperature (float)...
      //  Append to the "values" array the Sensor Key and Sensor Value, depending on the value type:
      //    {"key":"t",   "value":2870} for raw temperature (integer)
      ////TODO: coap_item_int_val! (values, val);
      //    {"key":"tmp", "value":28.7} for computed temperature (float)
      //  coap_item_float_val! (values, val);

      //  If there are more sensor values, add them here with
      //  coap_item_int_val, coap_item_int, coap_item_uint, coap_item_float or coap_item_str

    }) //  Close the "values" array
  }); //  Close the payload root
}

macro_rules! calculate {
  (eval $e:expr) => {{
    {
      let val: usize = $e; // Force types to be integers
      //  println!("{} = {}", stringify!{$e}, val);
    }
  }};
}

fn test_macro() {
  calculate! {
    eval 1 + 2 // hehehe `eval` is _not_ a Rust keyword!
  }

  calculate! {
    eval (1 + 2) * (3 / 4)
  }
}

///  TODO: Start the Network Task in the background.  The Network Task prepares the network drivers
///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
pub fn start_network_task() -> Result<(), i32>  {  //  Returns an error code upon error.
//  pub fn start_network_task() -> i32  {
  console_print(b"start_network_task\n");
  test_macro();
  test_macro2();
  send_sensor_data_rust();
  Ok(())
  //  0
}

///  TODO: Compose a CoAP message (CBOR or JSON) with the sensor value in `val` and transmit to the
///  Collector Node (if this is a Sensor Node) or to the CoAP Server (if this is a Collector Node
///  or Standalone Node).  
///  For Sensor Node or Standalone Node: sensor_node is the sensor name (`bme280_0` or `temp_stm32_0`)
///  For Collector Node: sensor_node is the Sensor Node Address of the Sensor Node that transmitted
///  the sensor data (like `b3b4b5b6f1`)
///  The message will be enqueued for transmission by the CoAP / OIC Background Task 
///  so this function will return without waiting for the message to be transmitted.  
///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
pub fn send_sensor_data(_val: *const SensorValue, _sensor_node: &'static CStr) -> i32 {
  console_print(b"send_sensor_data\n");

/*
  //  Compose the CoAP Payload in JSON using the CP macros.  Also works for CBOR.
  CP_ROOT({                     //  Create the payload root
    CP_ARRAY(root, values, {  //  Create "values" as an array of items under the root
      //  Append to the "values" array:
      //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
      CP_ITEM_STR(values, "device", device_id);

      //    {"key":"node", "value":"b3b4b5b6f1"},
      CP_ITEM_STR(values, "node", node_id);

#if MYNEWT_VAL(RAW_TEMP)  //  If we are using raw temperature (integer) instead of computed temperature (float)...
      //  Append to the "values" array the Sensor Key and Sensor Value, depending on the value type:
      //    {"key":"t",   "value":2870} for raw temperature (integer)
      CP_ITEM_INT_VAL(values, val);
#else       //    {"key":"tmp", "value":28.7} for computed temperature (float)
      CP_ITEM_FLOAT_VAL(values, val);
#endif  //  MYNEWT_VAL(RAW_TEMP)

      //  If there are more sensor values, add them here with
      //  CP_ITEM_VAL, CP_ITEM_INT, CP_ITEM_UINT, CP_ITEM_FLOAT or CP_ITEM_STR
      //  Check geolocate() for a more complex payload: apps/my_sensor_app/src/geolocate.c

    });                       //  End CP_ARRAY: Close the "values" array
  });                           //  End CP_ROOT:  Close the payload root

*/

  ;
  0
}

/*
static int send_sensor_data_to_server(struct sensor_value *val, const char *node_id) {
  //  Compose a CoAP JSON message with the Sensor Key (field name) and Value in val 
  //  and send to the CoAP server and URI.  The Sensor Value may be integer or float.
  //  For temperature, the Sensor Key is either "t" for raw temperature (integer, from 0 to 4095) 
  //  or "tmp" for computed temperature (float).
  //  The message will be enqueued for transmission by the CoAP / OIC 
  //  Background Task so this function will return without waiting for the message 
  //  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.

  //  For the CoAP server hosted at thethings.io, the CoAP payload should be encoded in JSON like this:
  //  {"values":[
  //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
  //    {"key":"tmp",    "value":28.7},
  //    {"key":"...",    "value":... },
  //    ... ]}
  assert(val);  assert(node_id);
  if (!network_is_ready) { return SYS_EAGAIN; }  //  If network is not ready, tell caller (Sensor Listener) to try later.
  const char *device_id = get_device_id();  assert(device_id);

  //  Start composing the CoAP Server message with the sensor data in the payload.  This will 
  //  block other tasks from composing and posting CoAP messages (through a semaphore).
  //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
  int rc = init_server_post(NULL);  assert(rc != 0);

  //  Compose the CoAP Payload in JSON using the CP macros.  Also works for CBOR.
  CP_ROOT({                     //  Create the payload root
    CP_ARRAY(root, values, {  //  Create "values" as an array of items under the root
      //  Append to the "values" array:
      //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
      CP_ITEM_STR(values, "device", device_id);

      //    {"key":"node", "value":"b3b4b5b6f1"},
      CP_ITEM_STR(values, "node", node_id);

#if MYNEWT_VAL(RAW_TEMP)  //  If we are using raw temperature (integer) instead of computed temperature (float)...
      //  Append to the "values" array the Sensor Key and Sensor Value, depending on the value type:
      //    {"key":"t",   "value":2870} for raw temperature (integer)
      CP_ITEM_INT_VAL(values, val);
#else       //    {"key":"tmp", "value":28.7} for computed temperature (float)
      CP_ITEM_FLOAT_VAL(values, val);
#endif  //  MYNEWT_VAL(RAW_TEMP)

      //  If there are more sensor values, add them here with
      //  CP_ITEM_VAL, CP_ITEM_INT, CP_ITEM_UINT, CP_ITEM_FLOAT or CP_ITEM_STR
      //  Check geolocate() for a more complex payload: apps/my_sensor_app/src/geolocate.c

    });                       //  End CP_ARRAY: Close the "values" array
  });                           //  End CP_ROOT:  Close the payload root

  //  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
  //  message to the background task, we release a semaphore that unblocks other requests
  //  to compose and post CoAP messages.
  rc = do_server_post();  assert(rc != 0);

  console_printf("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n", device_id);
  //  console_printf("NET send data: tmp "); console_printfloat(tmp); console_printf("\n");  ////

  //  The CoAP Background Task will call oc_tx_ucast() in the ESP8266 driver to 
  //  transmit the message: libs/esp8266/src/transport.cpp
  return 0;
}

static int send_sensor_data_to_collector(struct sensor_value *val, const char *node_id) {
  //  Compose a CoAP CBOR message with the Sensor Key (field name) and Value in val and 
  //  transmit to the Collector Node.  The Sensor Value should be integer not float since
  //  we transmit integers only to the Collector Node.
  //  For temperature, the Sensor Key is "t" for raw temperature (integer, from 0 to 4095).
  //  The message will be enqueued for transmission by the CoAP / OIC 
  //  Background Task so this function will return without waiting for the message 
  //  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
  //  The CoAP payload needs to be very compact (under 32 bytes) so it will be encoded in CBOR like this:
  //    { t: 2870 }
  assert(val);
  if (!network_is_ready) { return SYS_EAGAIN; }  //  If network is not ready, tell caller (Sensor Listener) to try later.

  //  Start composing the CoAP Collector message with the sensor data in the payload.  This will 
  //  block other tasks from composing and posting CoAP messages (through a semaphore).
  //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
  int rc = init_collector_post();  assert(rc != 0);

  //  Compose the CoAP Payload in CBOR using the CBOR macros.
  CP_ROOT({  //  Create the payload root
    //  Set the Sensor Key and integer Sensor Value, e.g. { t: 2870 }
    CP_SET_INT_VAL(root, val);
  });  //  End CP_ROOT:  Close the payload root

  //  Post the CoAP Collector message to the CoAP Background Task for transmission.  After posting the
  //  message to the background task, we release a semaphore that unblocks other requests
  //  to compose and post CoAP messages.
  rc = do_collector_post();  assert(rc != 0);

  console_printf("NRF send to collector: rawtmp %d\n", val->int_val);  ////

  //  The CoAP Background Task will call oc_tx_ucast() in the nRF24L01 driver to 
  //  transmit the message: libs/nrf24l01/src/transport.cpp
  return 0;
}
*/