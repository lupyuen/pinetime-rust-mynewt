//!  Mynewt Macros for Rust. Note that macros defined locally should be called with `$crate::`, like `$crate::parse`.
//!  This works with Rust compiler versions 1.30 and later.  See https://doc.rust-lang.org/stable/edition-guide/rust-2018/macros/macro-changes.html
//!  To see the expanded macros: `cargo rustc -- -Z unstable-options --pretty expanded`
 
///////////////////////////////////////////////////////////////////////////////
//  CoAP Macros

///  Macro to compose a CoAP payload with JSON or CBOR encoding.
///  First parameter is `@none`, `@json`, `@cbor` or `@cbormin`, to indicate
///  no encoding (testing), JSON encoding, CBOR encoding for thethings.io or CBOR minimal key-value encoding.
///  Second parameter is the JSON message to be transmitted.
///  Adapted from the `json!()` macro: https://docs.serde.rs/src/serde_json/macros.rs.html
#[macro_export]
macro_rules! coap {
  //  No encoding
  (@none $($tokens:tt)+) => {
    $crate::parse!(@none $($tokens)+)
  };
  //  JSON encoding
  (@json $($tokens:tt)+) => {
    $crate::parse!(@json $($tokens)+)
  };
  //  CBOR encoding
  (@cbor $($tokens:tt)+) => {
    $crate::parse!(@cbor $($tokens)+)
  };
  //  CBOR Minimal key-value encoding
  (@cbormin $($tokens:tt)+) => {
    $crate::parse!(@cbormin $($tokens)+)
  };
}

///  Parse the JSON code in the parameter and compose the CoAP payload.
///  This macro takes these parameters:
///  - __Encoding__: `@json`, `@cbor` or `@none`
///  - __State__: Current parsing state (`@object`, `@array` or omitted)
///  - __Context__: JSON or CBOR parsing context (`JsonContext` or `CborContext`)
///  - __Remaining tokens__ to be parsed
///  - __Remaining tokens__ again, for error display
#[macro_export]
macro_rules! parse {

  //////////////////////////////////////////////////////////////////////////
  // TT muncher for parsing the inside of an object {...}. Each entry is
  // inserted into the given map variable.
  //
  // Must be invoked as: $crate::parse!(@$enc @object $map () ($($tt)*) ($($tt)*))
  //
  // We require two copies of the input tokens so that we can match on one
  // copy and trigger errors on the other copy.
  //////////////////////////////////////////////////////////////////////////

  // Done.
  (@$enc:ident @object $object:ident () () ()) => {};

  // No Encoding: Insert the current entry followed by trailing comma.
  (@none @object $object:ident [$($key:tt)+] ($value:expr) , $($rest:tt)*) => {
    d!(TODO: add key: $($key)+, value: $value, to object: $object);

    //  Previously:
    //  let _ = $object.insert(($($key)+).into(), $value);

    //  Continue expanding the rest of the JSON.
    $crate::parse!(@none @object $object () ($($rest)*) ($($rest)*));
  };

  // JSON and CBOR Encoding: Insert the current entry followed by trailing comma.
  (@$enc:ident @object $object:ident [$($key:tt)+] ($value:expr) , $($rest:tt)*) => {
    d!(add1 key: $($key)+ value: $value to object: $object);

    //  Append to the "values" array e.g.
    //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    $crate::coap_item_str!(@$enc $object, $($key)+, $value);
    "--------------------";

    //  Previously:
    //  let _ = $object.insert(($($key)+).into(), $value);

    //  Continue expanding the rest of the JSON.
    $crate::parse!(@$enc @object $object () ($($rest)*) ($($rest)*));
  };

  // Current entry followed by unexpected token.
  (@$enc:ident @object $object:ident [$($key:tt)+] ($value:expr) $unexpected:tt $($rest:tt)*) => {
    unexpected_token!($unexpected);
  };

  // Insert the last entry without trailing comma.
  (@$enc:ident @object $object:ident [$($key:tt)+] ($value:expr)) => {
    //  TODO
    d!(TODO: add2 key: $($key)+ value: $value to object: $object);
    //  let _ = $object.insert(($($key)+).into(), $value);
  };

  // Next value is `null`.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: null $($rest:tt)*) $copy:tt) => {
    $crate::parse!(@$enc @object $object [$($key)+] 
      ($crate::parse!(@$enc null)) $($rest)*);
  };

  // Next value is `true`.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: true $($rest:tt)*) $copy:tt) => {
    $crate::parse!(@$enc @object $object [$($key)+] 
      ($crate::parse!(@$enc true)) $($rest)*);
  };

  // Next value is `false`.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: false $($rest:tt)*) $copy:tt) => {
    $crate::parse!(@$enc @object $object [$($key)+] 
      ($crate::parse!(@$enc false)) $($rest)*);
  };

  // Next value is an array.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: [$($array:tt)*] $($rest:tt)*) $copy:tt) => {
    $crate::parse!(@$enc @object $object [$($key)+] 
      ($crate::parse!(@$enc [$($array)*])) $($rest)*);
  };

  // Next value is a map.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: {$($map:tt)*} $($rest:tt)*) $copy:tt) => {
    $crate::parse!(@$enc @object $object [$($key)+] 
      ($crate::parse!(@$enc {$($map)*})) $($rest)*);
  };

  // Next value is an expression followed by comma.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: $value:expr , $($rest:tt)*) $copy:tt) => {
    $crate::parse!(@$enc @object $object [$($key)+] 
      ($crate::parse!(@$enc $value)) , $($rest)*);
  };

  // Last value is an expression with no trailing comma.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: $value:expr) $copy:tt) => {
    $crate::parse!(@$enc @object $object [$($key)+] 
      ($crate::parse!(@$enc $value)));
  };

  // Missing value for last entry. Trigger a reasonable error message.
  (@$enc:ident @object $object:ident ($($key:tt)+) (:) $copy:tt) => {
    // "unexpected end of macro invocation"
    $crate::parse!();
  };

  // Missing colon and value for last entry. Trigger a reasonable error
  // message.
  (@$enc:ident @object $object:ident ($($key:tt)+) () $copy:tt) => {
    // "unexpected end of macro invocation"
    $crate::parse!();
  };

  // Misplaced colon. Trigger a reasonable error message.
  (@$enc:ident @object $object:ident () (: $($rest:tt)*) ($colon:tt $($copy:tt)*)) => {
    // Takes no arguments so "no rules expected the token `:`".
    $crate::unexpected_token!($colon);
  };

  // No Encoding: Found a key followed by a comma. Assume this is a SensorValue type with key and value.
  (@none @object $object:ident ($($key:tt)*) (, $($rest:tt)*) ($comma:tt $($copy:tt)*)) => {
    d!(TODO: extract key, value from _sensor_value: $($key)* and add to _object: $object);
    "--------------------";
    //  Continue expanding the rest of the JSON.
    $crate::parse!(@none @object $object () ($($rest)*) ($($rest)*));
  };

  // JSON Encoding: Found a key followed by a comma. Assume this is a SensorValue type with key and value.
  (@json @object $object:ident ($($key:tt)*) (, $($rest:tt)*) ($comma:tt $($copy:tt)*)) => {
    "--------------------";
    $crate::coap_item_int_val!(@json
      $object,  //  _object, 
      $($key)*  //  _sensor_value
    );
    "--------------------";
    //  Continue expanding the rest of the JSON.
    $crate::parse!(@json @object $object () ($($rest)*) ($($rest)*));
  };

  // CBOR Encoding: Found a key followed by a comma. Assume this is a SensorValue type with key and value.
  (@cbor @object $object:ident ($($key:tt)*) (, $($rest:tt)*) ($comma:tt $($copy:tt)*)) => {
    "--------------------";
    $crate::coap_set_int_val!(@cbor
      $object,  //  _object, 
      $($key)*  //  _sensor_value
    );
    "--------------------";
    //  Continue expanding the rest of the JSON.
    $crate::parse!(@cbor @object $object () ($($rest)*) ($($rest)*));
  };

  // Previously: Found a comma inside a key. Trigger a reasonable error message.
  // Takes no arguments so "no rules expected the token `,`".
  ////unexpected_token!($comma);

  // Key is fully parenthesized. This avoids clippy double_parens false
  // positives because the parenthesization may be necessary here.
  (@$enc:ident @object $object:ident () (($key:expr) : $($rest:tt)*) $copy:tt) => {
    d!( got () );
    $crate::parse!(@$enc @object $object ($key) (: $($rest)*) (: $($rest)*));
  };

  // Munch a token into the current key.
  (@$enc:ident @object $object:ident ($($key:tt)*) ($tt:tt $($rest:tt)*) $copy:tt) => {    
    $crate::nx!( ($($key)*), ($tt), ($($rest)*) );
    //  Parse the next token while we are in the @object state.
    $crate::parse!(@$enc @object $object ($($key)* $tt) ($($rest)*) ($($rest)*));
  };


  //////////////////////////////////////////////////////////////////////////
  // TT muncher for parsing the inside of an array [...]. Produces a vec![...]
  // of the elements.
  //
  // Must be invoked as: $crate::parse!(@$enc @array [] $($tt)*)
  //////////////////////////////////////////////////////////////////////////

  // Done with trailing comma.
  (@$enc:ident @array [$($elems:expr,)*]) => {
    parse_vector![$($elems,)*]
  };

  // Done without trailing comma.
  (@$enc:ident @array [$($elems:expr),*]) => {
    parse_vector![$($elems),*]
  };

  // Next element is `null`.
  (@$enc:ident @array [$($elems:expr,)*] null $($rest:tt)*) => {
    $crate::parse!(@$enc @array [$($elems,)* 
      $crate::parse!(@$enc null)] $($rest)*)
  };

  // Next element is `true`.
  (@$enc:ident @array [$($elems:expr,)*] true $($rest:tt)*) => {
    $crate::parse!(@$enc @array [$($elems,)* 
      $crate::parse!(@$enc true)] $($rest)*)
  };

  // Next element is `false`.
  (@$enc:ident @array [$($elems:expr,)*] false $($rest:tt)*) => {
    $crate::parse!(@$enc @array [$($elems,)* 
      $crate::parse!(@$enc false)] $($rest)*)
  };

  // Next element is an array.
  (@$enc:ident @array [$($elems:expr,)*] [$($array:tt)*] $($rest:tt)*) => {
    $crate::parse!(@$enc @array [$($elems,)* 
      $crate::parse!(@$enc [$($array)*])] $($rest)*)
  };

  // Next element is a map.
  (@$enc:ident @array [$($elems:expr,)*] {$($map:tt)*} $($rest:tt)*) => {
    $crate::parse!(@$enc @array [$($elems,)* 
      $crate::parse!(@$enc {$($map)*})] $($rest)*)
  };

  // Next element is an expression followed by comma.
  (@$enc:ident @array [$($elems:expr,)*] $next:expr, $($rest:tt)*) => {
    $crate::parse!(@$enc @array [$($elems,)* 
      $crate::parse!(@$enc $next),] $($rest)*)
  };

  // Last element is an expression with no trailing comma.
  (@$enc:ident @array [$($elems:expr,)*] $last:expr) => {
    $crate::parse!(@$enc @array [$($elems,)* 
      $crate::parse!(@$enc $last)])
  };

  // Comma after the most recent element.
  (@$enc:ident @array [$($elems:expr),*] , $($rest:tt)*) => {
    $crate::parse!(@$enc @array [$($elems,)*] $($rest)*)
  };

  // Unexpected token after most recent element.
  (@$enc:ident @array [$($elems:expr),*] $unexpected:tt $($rest:tt)*) => {
    $crate::unexpected_token!($unexpected)
  };


  //////////////////////////////////////////////////////////////////////////
  // The main implementation.
  //
  // Must be invoked as: $crate::parse!(@$enc $($tokens)+) where $enc is json, cbor or none
  //////////////////////////////////////////////////////////////////////////

  (@$enc:ident null) => {{ 
    d!(TODO: null); "null" 
  }};  //  Previously: $crate::Value::Null

  (@$enc:ident true) => {
    //  TODO
    { d!(true); "true" }
    //  Previously:
    //  $crate::Value::Bool(true)
  };

  (@$enc:ident false) => {
    //  TODO
    { d!(false); "false" }
    //  Previously:
    //  $crate::Value::Bool(false)
  };

  (@$enc:ident []) => {
    //  TODO
    { d!([ TODO ]); "[ TODO ]" }
    //  Previously:
    //  $crate::Value::Array(parse_vector![])
  };

  (@$enc:ident [ $($tt:tt)+ ]) => {
    //  TODO
    {
      d!(begin array);
      _array = $crate::parse!(@$enc @array [] $($tt)+);
      d!(end array);
      "[ TODO ]"
    }
    //  Previously:
    //  $crate::Value::Array($crate::parse!(@array [] $($tt)+))
  };

  (@$enc:ident {}) => {
    //  TODO
    { d!({ TODO }); "{ TODO }" }
    //  Previously:
    //  $crate::Value::Object($crate::Map::new())
  };

  //  No encoding: If we match the top level of the JSON: { ... }
  (@none { $($tt:tt)+ }) => {{
    //  Substitute with this code...
    d!(begin none root);
    let root = "root";  //  Top level object is named "root".
    //  Expand the items inside { ... } and add them to root.
    $crate::parse!(@none @object root () ($($tt)+) ($($tt)+));
    d!(end none root);
    d!(return none root to caller);
    root
  }};
  
  //  JSON encoding: If we match the top level of the JSON: { ... }
  (@json { $($tt:tt)+ }) => {{
    //  Substitute with this code...
    d!(begin json root);
    $crate::coap_root!(@json COAP_CONTEXT {  //  Create the payload root
        $crate::coap_array!(@json COAP_CONTEXT, values, {  //  Create "values" as an array of items under the root
          //  Expand the items inside { ... } and add them to values.
          $crate::parse!(@json @object COAP_CONTEXT () ($($tt)+) ($($tt)+));
        });  //  Close the "values" array
    });  //  Close the payload root
    d!(end json root);
    ()
  }};

  //  CBOR encoding: If we match the top level of the JSON: { ... }
  (@cbor { $($tt:tt)+ }) => {{
    //  Substitute with this code...
    d!(begin cbor root);
    $crate::coap_root!(@cbor root {  //  Create the payload root
        $crate::coap_array!(@cbor root, values, {  //  Create "values" as an array of items under the root
          //  Expand the items inside { ... } and add them to values.
          $crate::parse!(@cbor @object values () ($($tt)+) ($($tt)+));
        });  //  Close the "values" array
    });  //  Close the payload root
    d!(end cbor root);
    ()
  }};

  //  CBOR minimal encoding: If we match the top level of the JSON: { ... }
  (@cbormin { $($tt:tt)+ }) => {{
    //  Substitute with this code...
    d!(begin cbor root);
    $crate::coap_root!(@cbor COAP_CONTEXT {  //  Create the payload root
        //  Expand the items inside { ... } and add them to root.
        $crate::parse!(@cbor @object COAP_CONTEXT () ($($tt)+) ($($tt)+));  //  TODO: Change COAP_CONTEXT to CBOR
    });  //  Close the payload root
    d!(end cbor root);
    ()
  }};

  /* Previously substitute with:
  $crate::Value::Object({
    let mut object = $crate::Map::new();
    $crate::parse!(@object object () ($($tt)+) ($($tt)+));
    object
  })
  */

  // Any Serialize type: numbers, strings, struct literals, variables etc.
  // Must be below every other rule.
  (@$enc:ident $other:expr) => {
    //  Return itself.
    $other
  };  //  Previously: $crate::to_value(&$other).unwrap()
}

///  TODO: Parse the vector e.g. array items
#[macro_export]
macro_rules! parse_vector {
  ($($content:tt)*) => {
    $crate::vec![$($content)*]
  };
}

///  Show an unexpected token error
#[macro_export]
macro_rules! unexpected_token {
  () => {};
}

///////////////////////////////////////////////////////////////////////////////
//  CoAP macros ported from C to Rust:
//  https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-coap/libs/sensor_coap/include/sensor_coap/sensor_coap.h

///  Compose the payload root.
#[macro_export]
macro_rules! coap_root {  
  (@cbor $context:ident $children0:block) => {{  //  CBOR
    d!(begin cbor coap_root);
    $crate::oc_rep_start_root_object!($context);
    $children0;
    $crate::oc_rep_end_root_object!($context);
    d!(end cbor coap_root);
  }};

  (@json $context:ident $children0:block) => {{  //  JSON
    d!(begin json coap_root);
    unsafe { sensor_coap::json_rep_start_root_object() }
    $children0;
    unsafe { sensor_coap::json_rep_end_root_object() }
    d!(end json coap_root);
  }};
}

///  Compose an array under `object`, named as `key` (e.g. `values`).  Add `children` as array elements.
#[macro_export]
macro_rules! coap_array {
  (@cbor $object0:ident, $key0:ident, $children0:block) => {{  //  CBOR
    d!(begin cbor coap_array, object: $object0, key: $key0);
    $crate::oc_rep_set_array!($object0, $key0);
    $children0;
    $crate::oc_rep_close_array!($object0, $key0);
    d!(end cbor coap_array);
  }};

  (@json $object0:ident, $key0:ident, $children0:block) => {{  //  JSON
    d!(begin json coap_array, object: $object0, key: $key0);
    $crate::json_rep_set_array!($object0, $key0);
    $children0;
    $crate::json_rep_close_array!($object0, $key0);
    d!(end json coap_array);
  }};
}

///  Append a (key + int value) item to the array named `array`:
///    `{ <array>: [ ..., {"key": <key0>, "value": <value0>} ], ... }`
#[macro_export]
macro_rules! coap_item_int {
  (@cbor $array0:ident, $key0:expr, $value0:expr) => {{  //  CBOR
    d!(begin cbor coap_item_int, key: $key0, value: $value0);
    $crate::coap_item!(@cbor $array0, {
      $crate::oc_rep_set_text_string!($array0, "key",   $key0);
      $crate::oc_rep_set_int!(        $array0, "value", $value0);
    });
    d!(end cbor coap_item_int);
  }};

  (@json $array0:ident, $key0:expr, $value0:expr) => {{  //  JSON
    d!(begin json coap_item_int, key: $key0, value: $value0);
    $crate::coap_item!(@json $array0, {
      $crate::json_rep_set_text_string!($array0, "key",   $key0);
      $crate::json_rep_set_int!(        $array0, "value", $value0);
    });
    d!(end json coap_item_int);
  }};
}

///  Append a (`key` + `val` string value) item to the array named `parent`:
///    `{ <parent>: [ ..., {"key": <key>, "value": <val>} ] }`
#[macro_export]
macro_rules! coap_item_str {
  (@cbor $parent:ident, $key:expr, $val:expr) => {{  //  CBOR
    d!(begin cbor coap_item_str, parent: $parent, key: $key, val: $val);
    $crate::coap_item!(@cbor
      $parent,
      {
        $crate::oc_rep_set_text_string!($parent, "key", $key);
        $crate::oc_rep_set_text_string!($parent, "value", $val);
      }
    );
    d!(end cbor coap_item_str);
  }};

  (@json $parent:ident, $key:expr, $val:expr) => {{  //  JSON
    d!(begin json coap_item_str, parent: $parent, key: $key, val: $val);
    $crate::coap_item!(@json
      $parent,
      {
        $crate::json_rep_set_text_string!($parent, key, $key);
        $crate::json_rep_set_text_string!($parent, value, $val);
      }
    );
    d!(end json coap_item_str);
  }};
}

///  Append an array item under the current object item.  Add `children0` as the array items.
///    `{ <array0>: [ ..., { <children0> } ] }`
#[macro_export]
macro_rules! coap_item {
  (@cbor $context:ident, $children0:block) => {{  //  CBOR
    d!(begin cbor coap_item, array: $context);
    $crate::oc_rep_object_array_start_item!($context);
    $children0;
    $crate::oc_rep_object_array_end_item!($context);
    d!(end cbor coap_item);
  }};

  (@json $context:ident, $children0:block) => {{  //  JSON
    d!(begin json coap_item, array: $context);
    $crate::json_rep_object_array_start_item!($context);
    $children0;
    $crate::json_rep_object_array_end_item!($context);
    d!(end json coap_item);
  }};
}

///  Given an object parent and an integer Sensor Value `val`, set the `val`'s key/value in the object.
#[macro_export]
macro_rules! coap_set_int_val {
  (@cbor $context:ident, $val0:expr) => {{  //  CBOR
    d!(begin cbor coap_set_int_val, c: $context, val: $val0);
    if let SensorValueType::Uint(val) = $val0.val {
      $crate::oc_rep_set_int!($context, $val0.key, val);
    } else {
      unsafe { COAP_CONTEXT.fail(coap_context::CoapError::VALUE_NOT_UINT) };  //  Value not uint
    }
    d!(end cbor coap_set_int_val);
  }};

  (@json $context:ident, $val0:expr) => {{  //  JSON
    d!(begin json coap_set_int_val, c: $context, val: $val0);
    if let SensorValueType::Uint(val) = $val0.val {
      $crate::json_rep_set_int!($context, $val0.key, val);
    } else {
      unsafe { COAP_CONTEXT.fail(coap_context::CoapError::VALUE_NOT_UINT) };  //  Value not uint
    }
    d!(end json coap_set_int_val);
  }};
}

///  Create a new Item object in the parent array and set the Sensor Value's key/value (integer).
#[macro_export]
macro_rules! coap_item_int_val {
  (@cbor $context:ident, $val0:expr) => {{  //  CBOR
    d!(begin cbor coap_item_int_val, c: $context, val: $val0);
    if let SensorValueType::Uint(val) = $val0.val {
      $crate::coap_item_int!(@cbor $context, $val0.key, val);
    } else {
      unsafe { COAP_CONTEXT.fail(coap_context::CoapError::VALUE_NOT_UINT) };  //  Value not uint
    }
    d!(end cbor coap_item_int_val);
  }};

  (@json $context:ident, $val0:expr) => {{  //  JSON
    d!(begin json coap_item_int_val, c: $context, val: $val0);
    if let SensorValueType::Uint(val) = $val0.val {
      $crate::coap_item_int!(@json $context, $val0.key, val);
    } else {
      unsafe { COAP_CONTEXT.fail(coap_context::CoapError::VALUE_NOT_UINT) };  //  Value not uint
    }
    d!(end json coap_item_int_val);
  }};
}

///////////////////////////////////////////////////////////////////////////////
//  JSON Sensor CoAP macros ported from C to Rust:
//  https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-coap/libs/sensor_coap/include/sensor_coap/sensor_coap.h

///  Assume we are writing an object now.  Write the key name and start a child array.
///  ```
///  {a:b --> {a:b, key:[
///  ```
#[macro_export]
macro_rules! json_rep_set_array {
  ($context:ident, $key:ident) => {{  //  If $key is identifier...
    concat!(
      "<< jarri ",
      ", o: ", stringify!($context),
      ", k: ", stringify!($key)
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = $crate::stringify_null!($key);
    unsafe {
      mynewt_rust::json_helper_set_array(
        $context.to_void_ptr(),
        $context.key_to_cstr(key_with_null.as_bytes())
      ); 
    };
  }};

  ($context:ident, $key:expr) => {{  //  If $key is expression...
    concat!(
      "<< jarre ",
      ", o: ", stringify!($context),
      ", k: ", stringify!($key)
    );
    //  Convert key to char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $key.to_bytes_optional_nul();
    unsafe {
      mynewt_rust::json_helper_set_array(
        $context.to_void_ptr(),
        $context.key_to_cstr(key_with_opt_null)
      ); 
    };
  }};
}

///  End the child array and resume writing the parent object.
///  ```
///  {a:b, key:[... --> {a:b, key:[...]
///  ```
#[macro_export]
macro_rules! json_rep_close_array {
  ($context:ident, $key:ident) => {{  //  If $key is identifier...
    concat!(
      ">>"
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = $crate::stringify_null!($key);
    unsafe { 
      mynewt_rust::json_helper_close_array(
        $context.to_void_ptr(),
        $context.key_to_cstr(key_with_null.as_bytes())
      ) 
    };
  }};

  ($context:ident, $key:expr) => {{  //  If $key is expression...
    concat!(
      ">>"
    );
    //  Convert key to char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $key.to_bytes_optional_nul();
    unsafe { 
      mynewt_rust::json_helper_close_array(
        $context.to_void_ptr(),
        $context.key_to_cstr(key_with_opt_null)
      ) 
    };
  }};
}

///  Assume we have called `set_array`.  Start an array item, assumed to be an object.
///  ```
///  [... --> [...,
///  ```
#[macro_export]
macro_rules! json_rep_object_array_start_item {
  ($context:ident) => {{  //  If $key is identifier...
    concat!(
      "<< jitmi",
      " c: ", stringify!($context)
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = $crate::stringify_null!($context);    //  TODO
    unsafe { 
      mynewt_rust::json_helper_object_array_start_item(
        $context.key_to_cstr(key_with_null.as_bytes())
      ) 
    };
  }};

  ($context:ident) => {{  //  If $key is expression...
    concat!(
      "<< jitme",
      " c: ", stringify!($context)
    );
    //  Convert key char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $context.to_bytes_optional_nul();  //  TODO
    unsafe { 
      mynewt_rust::json_helper_object_array_start_item(
        $context.key_to_cstr(key_with_opt_null)
      ) 
    };
  }};
}

///  End an array item, assumed to be an object.
///  ```
///  [... --> [...,
///  ```
#[macro_export]
macro_rules! json_rep_object_array_end_item {
  ($context:ident) => {{  //  If $key is identifier...
    concat!(
      ">>"
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = $crate::stringify_null!($context);  //  TODO
    unsafe { 
      mynewt_rust::json_helper_object_array_end_item(
        $context.key_to_cstr(key_with_null.as_bytes())
      ) 
    };
  }};

  ($context:ident) => {{  //  If $key is expression...
    concat!(
      ">>"
    );
    //  Convert key char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $context.to_bytes_optional_nul();  //  TODO
    unsafe { 
      mynewt_rust::json_helper_object_array_end_item(
        $context.key_to_cstr(key_with_opt_null)
      ) 
    };
  }};
}

///  Encode an int value into the current JSON encoding value `coap_json_value`
#[macro_export]
macro_rules! json_rep_set_int {
  ($context:ident, $key:ident, $value:expr) => {{  //  If $key is identifier...
    concat!(
      "-- jinti",
      " o: ", stringify!($context),
      ", k: ", stringify!($key),
      ", v: ", stringify!($value)
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = $crate::stringify_null!($key);
    let value = $value as u64;
    unsafe {
      mynewt_rust::json_helper_set_int(
        $context.to_void_ptr(),
        $context.key_to_cstr(key_with_null.as_bytes()),
        value
      )
    };
  }};

  ($context:ident, $key:expr, $value:expr) => {{  //  If $key is expression...
    concat!(
      "-- jinte",
      " o: ", stringify!($context),
      ", k: ", stringify!($key),
      ", v: ", stringify!($value)
    );
    //  Convert key to char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $key.to_bytes_optional_nul();
    let value = $value as u64;
    unsafe {
      mynewt_rust::json_helper_set_int(
        $context.to_void_ptr(), 
        $context.key_to_cstr(key_with_opt_null),
        value
      )
    };
  }};
}

///  Encode a text value into the current JSON encoding value `coap_json_value`
#[macro_export]
macro_rules! json_rep_set_text_string {
  ($context:ident, $key:ident, $value:expr) => {{  //  If $key is identifier...
    concat!(
      "-- jtxti",
      " o: ", stringify!($context),
      ", k: ", stringify!($key),
      ", v: ", stringify!($value)
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = $crate::stringify_null!($key);
    //  Convert value to char array, which may or may not be null-terminated.
    let value_with_opt_null: &[u8] = $value.to_bytes_optional_nul();
    unsafe {
      mynewt_rust::json_helper_set_text_string(
        $context.to_void_ptr(),
        $context.key_to_cstr(key_with_null.as_bytes()),
        $context.value_to_cstr(value_with_opt_null)
      )
    };
  }};

  ($context:ident, $key:expr, $value:expr) => {{  //  If $key is expression...
    concat!(
      "-- jtxte",
      " o: ", stringify!($context),
      ", k: ", stringify!($key),
      ", v: ", stringify!($value)
    );
    //  Convert key and value to char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $key.to_bytes_optional_nul();
    let value_with_opt_null: &[u8] = $value.to_bytes_optional_nul();
    unsafe {
      mynewt_rust::json_helper_set_text_string(
        $context.to_void_ptr(), 
        $context.key_to_cstr(key_with_opt_null),
        $context.value_to_cstr(value_with_opt_null)
      )
    };
  }};
}

//  TODO
//  Encode an unsigned int value into the current JSON encoding value `coap_json_value`
//  void json_helper_set_uint(void *object, const char *key, uint64_t value);

//  Encode a float value into the current JSON encoding value `coap_json_value`
//  void json_helper_set_float(void *object, const char *key, float value);

///////////////////////////////////////////////////////////////////////////////
//  CBOR macros ported from C to Rust. First parameter `obj` is the name of the current object or array being encoded.
//  Based on: https://github.com/apache/mynewt-core/blob/master/net/oic/include/oic/oc_rep.h

#[macro_export]
macro_rules! oc_rep_start_root_object {
  ($obj:ident) => {{
    d!(begin oc_rep_start_root_object);
    proc_macros::try_cbor!({
      let encoder = COAP_CONTEXT.encoder("root", "_map");
      //  Previously: g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength)
      cbor_encoder_create_map(
        COAP_CONTEXT.global_encoder(),
        encoder,
        tinycbor::CborIndefiniteLength
      ); 
    });
    d!(end oc_rep_start_root_object);
  }};
}

#[macro_export]
macro_rules! oc_rep_end_root_object {
  ($obj:ident) => {{
    d!(begin oc_rep_end_root_object);
    proc_macros::try_cbor!({
      let encoder = COAP_CONTEXT.encoder("root", "_map");
      //  Previously: g_err |= cbor_encoder_close_container(&g_encoder, &root_map)
      cbor_encoder_close_container(
        COAP_CONTEXT.global_encoder(),
        encoder
      ); 
    });
    d!(end oc_rep_end_root_object);
  }};
}

#[macro_export]
macro_rules! oc_rep_start_object {
  ($parent:ident, $key:ident, $parent_suffix:ident) => {{
    concat!(
      "begin oc_rep_start_object ",
      ", parent: ", stringify!($parent), stringify!($parent_suffix),  //  parent##parent_suffix
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($key), "_map"  //  key##_map
    );
    proc_macros::try_cbor!({
      let parent_encoder = COAP_CONTEXT.encoder(
        stringify!($parent), 
        stringify!($parent_suffix)
      );
      //  Previously: CborEncoder key##_map
      let encoder = COAP_CONTEXT.new_encoder(
        stringify!($key), 
        "_map"
      );
      //  Previously: g_err |= cbor_encoder_create_map(&parent, &key##_map, CborIndefiniteLength)
      cbor_encoder_create_map(
        parent_encoder,
        encoder,
        tinycbor::CborIndefiniteLength
      );
    });
    d!(end oc_rep_start_object);
  }};
}

#[macro_export]
macro_rules! oc_rep_end_object {
  ($parent:ident, $key:ident, $parent_suffix:ident) => {{
    concat!(
      "begin oc_rep_end_object ",
      ", parent: ", stringify!($parent), stringify!($parent_suffix),  //  parent##parent_suffix
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($key), "_map"  //  key##_map
    );
    proc_macros::try_cbor!({
      let parent_encoder = COAP_CONTEXT.encoder(
        stringify!($parent), 
        stringify!($parent_suffix)
      );
      let encoder = COAP_CONTEXT.encoder(
        stringify!($key), 
        "_map"
      );
      //  Previously: g_err |= cbor_encoder_close_container(&parent, &key##_map)
      cbor_encoder_close_container(
        parent_encoder,
        encoder
      );
    });
    d!(end oc_rep_end_object);
  }};
}

#[macro_export]
macro_rules! oc_rep_start_array {
  ($parent:ident, $key:ident, $parent_suffix:ident) => {{
    concat!(
      "begin oc_rep_start_array ",
      ", parent: ", stringify!($parent), stringify!($parent_suffix),  //  parent##parent_suffix
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($key), "_array"  //  key##_array
    );
    proc_macros::try_cbor!({
      let parent_encoder = COAP_CONTEXT.encoder(
        stringify!($parent), 
        stringify!($parent_suffix)
      );
      let encoder = COAP_CONTEXT.encoder(
        stringify!($key), 
        "_array"
      );
      //  Previously: g_err |= cbor_encoder_create_array(&parent, &key##_array, CborIndefiniteLength));
      cbor_encoder_create_array(
        parent_encoder, 
        encoder,
        tinycbor::CborIndefiniteLength
      );
    });
    d!(end oc_rep_start_array);
  }};
}

#[macro_export]
macro_rules! oc_rep_end_array {
  ($parent:ident, $key:ident, $parent_suffix:ident) => {{
    concat!(
      "begin oc_rep_end_array ",
      ", parent: ", stringify!($parent), stringify!($parent_suffix),  //  parent##parent_suffix
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($key), "_array"  //  key##_array
    );
    proc_macros::try_cbor!({
      let parent_encoder = COAP_CONTEXT.encoder(
        stringify!($parent), 
        stringify!($parent_suffix)
      );
      let encoder = COAP_CONTEXT.encoder(
        stringify!($key), 
        "_array"
      );
      //  Previously: g_err |= cbor_encoder_close_container(&parent, &key##_array)
      cbor_encoder_close_container(
        parent_encoder, 
        encoder
      );
    });
    d!(end oc_rep_end_array);
  }};
}

///  Assume we are writing an object now.  Write the key name and start a child array.
///  ```
///  {a:b --> {a:b, key:[
///  ```
#[macro_export]
macro_rules! oc_rep_set_array {
  ($object:ident, $key:ident) => {{
    concat!(
      "begin oc_rep_set_array ",
      ", object: ", stringify!($object),
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($object), "_map"  //  object##_map
    );
    //  Convert key to char array, which may or may not be null-terminated.
    let key_with_opt_null:   &[u8] = stringify!($key).to_bytes_optional_nul();
    proc_macros::try_cbor!({
      let encoder = COAP_CONTEXT.encoder(
        stringify!($object), 
        "_map"
      );
      //  Previously: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key))
      cbor_encode_text_string(
        encoder, 
        COAP_CONTEXT.key_to_cstr(key_with_opt_null), 
        COAP_CONTEXT.cstr_len(key_with_opt_null)
      );
    });
    //  Previously: oc_rep_start_array!(object##_map, key)
    $crate::oc_rep_start_array!($object, $key, _map);
    d!(end oc_rep_set_array);
  }};
}

///  End the child array and resume writing the parent object.
///  ```
///  {a:b, key:[... --> {a:b, key:[...]
///  ```
#[macro_export]
macro_rules! oc_rep_close_array {
  ($object:ident, $key:ident) => {{
    concat!(
      "begin oc_rep_close_array ",
      ", object: ", stringify!($object),
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($object), "_map"  //  object##_map
    );
    //  Previously: oc_rep_end_array(object##_map, key));
    $crate::oc_rep_end_array!($object, $key, _map);
    d!(end oc_rep_close_array);
  }};
}

///  Assume we have called `set_array`.  Start an array item, assumed to be an object.
///  ```
///  [... --> [...,
///  ```
#[macro_export]
macro_rules! oc_rep_object_array_start_item {
  ($key:ident) => {{
    concat!(
      "begin oc_rep_object_array_start_item ",
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($key), "_array",  //  key##_array
    );
    //  Previously: oc_rep_start_object(key##_array, key));        
    $crate::oc_rep_start_object!($key, $key, _array);
    d!(end oc_rep_object_array_start_item);
  }};
}

///  End an array item, assumed to be an object.
///  ```
///  [... --> [...,
///  ```
#[macro_export]
macro_rules! oc_rep_object_array_end_item {
  ($key:ident) => {{
    concat!(
      "begin oc_rep_object_array_end_item ",
      ", key: ",    stringify!($key),
      ", child: ",  stringify!($key), "_array",  //  key##_array
    );
    //  Previously: oc_rep_end_object(key##_array, key));
    $crate::oc_rep_end_object!($key, $key, _array);
    d!(end oc_rep_object_array_end_item);
  }};
}

///  Encode an int value 
#[macro_export]
macro_rules! oc_rep_set_int {
  ($obj:ident, $key:ident, $value:expr) => {  //  If $key is identifier...
    concat!(
      "-- cinti",
      " c: ",  stringify!($obj),
      ", k: ", stringify!($key),
      ", v: ", stringify!($value)
    );
    //  Convert key to null-terminated char array. If key is `t`, convert to `"t\u{0}"`
    let key_with_null: &str = $crate::stringify_null!($key);
    let value = $value as i64;
    proc_macros::try_cbor!({
      let encoder = COAP_CONTEXT.encoder(
        stringify!($obj), 
        "_map"
      );
      //  Previously: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key))
      cbor_encode_text_string(
        encoder,
        COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()),
        COAP_CONTEXT.cstr_len(key_with_null.as_bytes())
      );
      //  Previously: g_err |= cbor_encode_int(&object##_map, value)
      cbor_encode_int(
        encoder,
        value
      );
    });
  };

  ($obj:ident, $key:expr, $value:expr) => {  //  If $key is expression...
    concat!(
      "-- cinte",
      " c: ",  stringify!($obj),
      ", k: ", stringify!($key),
      ", v: ", stringify!($value)
    );
    //  Convert key to char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $key.to_bytes_optional_nul();
    let value = $value as i64;
    proc_macros::try_cbor!({
      let encoder = COAP_CONTEXT.encoder(
        stringify!($obj), 
        "_map"
      );
      //  Previously: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key))
      cbor_encode_text_string(
        encoder,
        COAP_CONTEXT.key_to_cstr(key_with_opt_null),
        COAP_CONTEXT.cstr_len(   key_with_opt_null)
      );
      //  Previously: g_err |= cbor_encode_int(&object##_map, value)
      cbor_encode_int(
        encoder,
        value
      );
    });
  };
}

///  Encode a text value 
#[macro_export]
macro_rules! oc_rep_set_text_string {
  ($object:ident, $key:expr, $value:expr) => {{
    concat!(
      "begin oc_rep_set_text_string ",
      ", object: ", stringify!($object),
      ", key: ",    stringify!($key),
      ", value: ",  stringify!($value),
      ", child: ",  stringify!($object), "_map"  //  object##_map
    );
    //  Convert key and value to char array, which may or may not be null-terminated.
    let key_with_opt_null:   &[u8] = $key.to_bytes_optional_nul();
    let value_with_opt_null: &[u8] = $value.to_bytes_optional_nul();
    proc_macros::try_cbor!({
      let encoder = COAP_CONTEXT.encoder(
        stringify!($obj), 
        "_map"
      );
      //  Previously: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key))
      cbor_encode_text_string(
        encoder, 
        COAP_CONTEXT.key_to_cstr(key_with_opt_null), 
        COAP_CONTEXT.cstr_len(   key_with_opt_null)
      );
      //  Previously: g_err |= cbor_encode_text_string(&object##_map, value, strlen(value))
      cbor_encode_text_string(
        encoder, 
        COAP_CONTEXT.value_to_cstr(value_with_opt_null), 
        COAP_CONTEXT.cstr_len(     value_with_opt_null)
      );
    });
    d!(end oc_rep_set_text_string);
  }};
}

//  TODO
//  Encode an unsigned int value 
//  void oc_rep_set_uint(void *object, const char *key, uint64_t value);

//  Encode a float value 
//  void oc_rep_set_float(void *object, const char *key, float value);
