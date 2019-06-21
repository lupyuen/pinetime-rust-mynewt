//!  Mynewt Macros for Rust

///  Return a const struct that has all fields set to 0. Used for initialising static mutable structs like `os_task`.
///  `fill_zero!(os_task)` expands to
///  ```
/// unsafe { 
///	::core::mem::transmute::
///	<
///	  [
///		u8; 
///		::core::mem::size_of::<os_task>()
///	  ], 
///	  os_task
///	>
///	(
///	  [
///		0; 
///		::core::mem::size_of::<os_task>()
///	  ]
///	) 
/// }
///  ```
#[macro_export]
macro_rules! fill_zero {
  ($type:ident) => {
    unsafe { 
        ::core::mem::transmute::
        <
        [
            u8; 
            ::core::mem::size_of::<$type>()
        ], 
        $type
        >
        (
        [
            0; 
            ::core::mem::size_of::<$type>()
        ]
        ) 
    }      
  };
}

///  Macro to compose a CoAP payload with JSON or CBOR encoding.
///  First parameter is `@none`, `@json` or `@cbor`, to indicate
///  no encoding (testing), JSON encoding or CBOR encoding.
///  Second parameter is the JSON message to be transmitted.
///  Adapted from the `json!()` macro: https://docs.serde.rs/src/serde_json/macros.rs.html
#[macro_export]
macro_rules! coap {
  //  No encoding
  (@none $($tokens:tt)+) => {
    parse!(@none $($tokens)+)
  };
  //  JSON encoding
  (@json $($tokens:tt)+) => {
    parse!(@json $($tokens)+)
  };
  //  CBOR encoding
  (@cbor $($tokens:tt)+) => {
    parse!(@cbor $($tokens)+)
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
  // Must be invoked as: parse!(@$enc @object $map () ($($tt)*) ($($tt)*))
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
    parse!(@none @object $object () ($($rest)*) ($($rest)*));
  };

  // JSON and CBOR Encoding: Insert the current entry followed by trailing comma.
  (@$enc:ident @object $object:ident [$($key:tt)+] ($value:expr) , $($rest:tt)*) => {
    d!(add1 key: $($key)+ value: $value to object: $object);

    //  Append to the "values" array e.g.
    //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    coap_item_str!(@$enc $object, $($key)+, $value);
    "--------------------";

    //  Previously:
    //  let _ = $object.insert(($($key)+).into(), $value);

    //  Continue expanding the rest of the JSON.
    parse!(@$enc @object $object () ($($rest)*) ($($rest)*));
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
    parse!(@$enc @object $object [$($key)+] (parse!(@$enc null)) $($rest)*);
  };

  // Next value is `true`.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: true $($rest:tt)*) $copy:tt) => {
    parse!(@$enc @object $object [$($key)+] (parse!(@$enc true)) $($rest)*);
  };

  // Next value is `false`.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: false $($rest:tt)*) $copy:tt) => {
    parse!(@$enc @object $object [$($key)+] (parse!(@$enc false)) $($rest)*);
  };

  // Next value is an array.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: [$($array:tt)*] $($rest:tt)*) $copy:tt) => {
    parse!(@$enc @object $object [$($key)+] (parse!(@$enc [$($array)*])) $($rest)*);
  };

  // Next value is a map.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: {$($map:tt)*} $($rest:tt)*) $copy:tt) => {
    parse!(@$enc @object $object [$($key)+] (parse!(@$enc {$($map)*})) $($rest)*);
  };

  // Next value is an expression followed by comma.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: $value:expr , $($rest:tt)*) $copy:tt) => {
    parse!(@$enc @object $object [$($key)+] (parse!(@$enc $value)) , $($rest)*);
  };

  // Last value is an expression with no trailing comma.
  (@$enc:ident @object $object:ident ($($key:tt)+) (: $value:expr) $copy:tt) => {
    parse!(@$enc @object $object [$($key)+] (parse!(@$enc $value)));
  };

  // Missing value for last entry. Trigger a reasonable error message.
  (@$enc:ident @object $object:ident ($($key:tt)+) (:) $copy:tt) => {
    // "unexpected end of macro invocation"
    parse!();
  };

  // Missing colon and value for last entry. Trigger a reasonable error
  // message.
  (@$enc:ident @object $object:ident ($($key:tt)+) () $copy:tt) => {
    // "unexpected end of macro invocation"
    parse!();
  };

  // Misplaced colon. Trigger a reasonable error message.
  (@$enc:ident @object $object:ident () (: $($rest:tt)*) ($colon:tt $($copy:tt)*)) => {
    // Takes no arguments so "no rules expected the token `:`".
    unexpected_token!($colon);
  };

  // No Encoding: Found a key followed by a comma. Assume this is a SensorValue type with key and value.
  (@none @object $object:ident ($($key:tt)*) (, $($rest:tt)*) ($comma:tt $($copy:tt)*)) => {
    d!(TODO: extract key, value from _sensor_value: $($key)* and add to _object: $object);
    "--------------------";
    //  Continue expanding the rest of the JSON.
    parse!(@none @object $object () ($($rest)*) ($($rest)*));
  };

  // JSON Encoding: Found a key followed by a comma. Assume this is a SensorValue type with key and value.
  (@json @object $object:ident ($($key:tt)*) (, $($rest:tt)*) ($comma:tt $($copy:tt)*)) => {
    d!(TODO: extract key, value from _sensor_value: $($key)* and add to _object: $object);
    "--------------------";
    coap_item_int_val!(@json
      $object,  //  _object, 
      $($key)*  //  _sensor_value
    );
    "--------------------";
    //  Continue expanding the rest of the JSON.
    parse!(@json @object $object () ($($rest)*) ($($rest)*));
  };

  // CBOR Encoding: Found a key followed by a comma. Assume this is a SensorValue type with key and value.
  (@cbor @object $object:ident ($($key:tt)*) (, $($rest:tt)*) ($comma:tt $($copy:tt)*)) => {
    d!(TODO: extract key, value from _sensor_value: $($key)* and add to _object: $object);
    "--------------------";
    coap_set_int_val!(@cbor
      $object,  //  _object, 
      $($key)*  //  _sensor_value
    );
    "--------------------";
    //  Continue expanding the rest of the JSON.
    parse!(@cbor @object $object () ($($rest)*) ($($rest)*));
  };

  // Previously: Found a comma inside a key. Trigger a reasonable error message.
  // Takes no arguments so "no rules expected the token `,`".
  ////unexpected_token!($comma);

  // Key is fully parenthesized. This avoids clippy double_parens false
  // positives because the parenthesization may be necessary here.
  (@$enc:ident @object $object:ident () (($key:expr) : $($rest:tt)*) $copy:tt) => {
    d!( got () );
    parse!(@$enc @object $object ($key) (: $($rest)*) (: $($rest)*));
  };

  // Munch a token into the current key.
  (@$enc:ident @object $object:ident ($($key:tt)*) ($tt:tt $($rest:tt)*) $copy:tt) => {    
    nx!( ($($key)*), ($tt), ($($rest)*) );
    //  Parse the next token while we are in the @object state.
    parse!(@$enc @object $object ($($key)* $tt) ($($rest)*) ($($rest)*));
  };


  //////////////////////////////////////////////////////////////////////////
  // TT muncher for parsing the inside of an array [...]. Produces a vec![...]
  // of the elements.
  //
  // Must be invoked as: parse!(@$enc @array [] $($tt)*)
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
    parse!(@$enc @array [$($elems,)* parse!(@$enc null)] $($rest)*)
  };

  // Next element is `true`.
  (@$enc:ident @array [$($elems:expr,)*] true $($rest:tt)*) => {
    parse!(@$enc @array [$($elems,)* parse!(@$enc true)] $($rest)*)
  };

  // Next element is `false`.
  (@$enc:ident @array [$($elems:expr,)*] false $($rest:tt)*) => {
    parse!(@$enc @array [$($elems,)* parse!(@$enc false)] $($rest)*)
  };

  // Next element is an array.
  (@$enc:ident @array [$($elems:expr,)*] [$($array:tt)*] $($rest:tt)*) => {
    parse!(@$enc @array [$($elems,)* parse!(@$enc [$($array)*])] $($rest)*)
  };

  // Next element is a map.
  (@$enc:ident @array [$($elems:expr,)*] {$($map:tt)*} $($rest:tt)*) => {
    parse!(@$enc @array [$($elems,)* parse!(@$enc {$($map)*})] $($rest)*)
  };

  // Next element is an expression followed by comma.
  (@$enc:ident @array [$($elems:expr,)*] $next:expr, $($rest:tt)*) => {
    parse!(@$enc @array [$($elems,)* parse!(@$enc $next),] $($rest)*)
  };

  // Last element is an expression with no trailing comma.
  (@$enc:ident @array [$($elems:expr,)*] $last:expr) => {
    parse!(@$enc @array [$($elems,)* parse!(@$enc $last)])
  };

  // Comma after the most recent element.
  (@$enc:ident @array [$($elems:expr),*] , $($rest:tt)*) => {
    parse!(@$enc @array [$($elems,)*] $($rest)*)
  };

  // Unexpected token after most recent element.
  (@$enc:ident @array [$($elems:expr),*] $unexpected:tt $($rest:tt)*) => {
    unexpected_token!($unexpected)
  };


  //////////////////////////////////////////////////////////////////////////
  // The main implementation.
  //
  // Must be invoked as: parse!(@$enc $($tokens)+) where $enc is json, cbor or none
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
      _array = parse!(@$enc @array [] $($tt)+);
      d!(end array);
      "[ TODO ]"
    }
    //  Previously:
    //  $crate::Value::Array(parse!(@array [] $($tt)+))
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
    parse!(@none @object root () ($($tt)+) ($($tt)+));
    d!(end none root);
    d!(return none root to caller);
    root
  }};
  
  //  JSON encoding: If we match the top level of the JSON: { ... }
  (@json { $($tt:tt)+ }) => {{
    //  Substitute with this code...
    d!(begin json root);
    //  let root = "root";  //  Top level object is named "root".
    //  let values = "values";  //  "values" will be an array of items under the root
    //  let mut local_json_encoder = &mut sensor_coap::coap_json_encoder;
    //  let mut local_json_value   = &mut sensor_coap::coap_json_value;
    coap_root!(@json {  //  Create the payload root
        coap_array!(@json root, values, {  //  Create "values" as an array of items under the root
          //  Expand the items inside { ... } and add them to values.
          parse!(@json @object values () ($($tt)+) ($($tt)+));
        });  //  Close the "values" array
    });  //  Close the payload root
    d!(end json root);
    d!(return json root to caller);
    ()
  }};

  //  CBOR encoding: If we match the top level of the JSON: { ... }
  (@cbor { $($tt:tt)+ }) => {{
    //  Substitute with this code...
    d!(begin cbor root);
    //  let root = "root";  //  Top level object is named "root".
    //  let mut values_map: CborEncoder = fill_zero!(CborEncoder);
    //  let mut values_array: CborEncoder = fill_zero!(CborEncoder);
    coap_root!(@cbor {  //  Create the payload root
        //  Expand the items inside { ... } and add them to root.
        parse!(@cbor @object root () ($($tt)+) ($($tt)+));
    });  //  Close the payload root
    d!(end cbor root);
    d!(return cbor root to caller);
    root
  }};

  /* Previously substitute with:
  $crate::Value::Object({
    let mut object = $crate::Map::new();
    parse!(@object object () ($($tt)+) ($($tt)+));
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
#[doc(hidden)]
macro_rules! parse_vector {
  ($($content:tt)*) => {
    vec![$($content)*]
  };
}

///  Show an unexpected token error
#[macro_export]
#[doc(hidden)]
macro_rules! unexpected_token {
  () => {};
}

///////////////////////////////////////////////////////////////////////////////
//  CoAP macros ported from C to Rust:
//  https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-coap/libs/sensor_coap/include/sensor_coap/sensor_coap.h

///  Compose the payload root.
#[macro_export(local_inner_macros)]
macro_rules! coap_root {  
  (@cbor $children0:block) => {{  //  CBOR
    d!(begin cbor coap_root);
    oc_rep_start_root_object!();
    $children0;
    oc_rep_end_root_object!();
    d!(end cbor coap_root);
  }};

  (@json $children0:block) => {{  //  JSON
    d!(begin json coap_root);
    unsafe { sensor_coap::json_rep_start_root_object() }
    $children0;
    unsafe { sensor_coap::json_rep_end_root_object() }
    d!(end json coap_root);
  }};
}

///  Compose an array under `object`, named as `key` (e.g. `values`).  Add `children` as array elements.
#[macro_export(local_inner_macros)]
macro_rules! coap_array {
  (@cbor $object0:ident, $key0:ident, $children0:block) => {{  //  CBOR
    d!(begin cbor coap_array, object: $object0, key: $key0);
    oc_rep_set_array!($object0, $key0);
    $children0;
    oc_rep_close_array!($object0, $key0);
    d!(end cbor coap_array);
  }};

  (@json $object0:ident, $key0:ident, $children0:block) => {{  //  JSON
    d!(begin json coap_array, object: $object0, key: $key0);
    json_rep_set_array!($object0, $key0);
    $children0;
    json_rep_close_array!($object0, $key0);
    d!(end json coap_array);
  }};
}

///  Append a (key + int value) item to the array named `array`:
///    `{ <array>: [ ..., {"key": <key0>, "value": <value0>} ], ... }`
#[macro_export(local_inner_macros)]
macro_rules! coap_item_int {
  (@cbor $array0:ident, $key0:expr, $value0:expr) => {{  //  CBOR
    d!(begin cbor coap_item_int, key: $key0, value: $value0);
    coap_item!(@$enc $array0, {
      oc_rep_set_text_string!($array0, "key",   $key0);
      oc_rep_set_int!(        $array0, "value", $value0);
    });
    d!(end cbor coap_item_int);
  }};

  (@json $array0:ident, $key0:expr, $value0:expr) => {{  //  JSON
    d!(begin json coap_item_int, key: $key0, value: $value0);
    coap_item!(@json $array0, {
      json_rep_set_text_string!($array0, "key",   $key0.to_str());
      json_rep_set_int!(        $array0, "value", $value0);
    });
    d!(end json coap_item_int);
  }};
}

///  Append a (`key` + `val` string value) item to the array named `parent`:
///    `{ <parent>: [ ..., {"key": <key>, "value": <val>} ] }`
#[macro_export(local_inner_macros)]
macro_rules! coap_item_str {
  (@cbor $parent:ident, $key:expr, $val:expr) => {{  //  CBOR
    d!(begin cbor coap_item_str, parent: $parent, key: $key, val: $val);
    coap_item!(@cbor
      $parent,
      {
        oc_rep_set_text_string!($parent, "key", $key);
        oc_rep_set_text_string!($parent, "value", $val);
      }
    );
    d!(end cbor coap_item_str);
  }};

  (@json $parent:ident, $key:expr, $val:expr) => {{  //  JSON
    d!(begin json coap_item_str, parent: $parent, key: $key, val: $val);
    coap_item!(@json
      $parent,
      {
        json_rep_set_text_string!($parent, key, $key);
        json_rep_set_text_string!($parent, value, $val);
      }
    );
    d!(end json coap_item_str);
  }};
}

///  Append an array item under the array named `array0`.  Add `children0` as the items (key and value).
///    `{ <array0>: [ ..., { <children0> } ] }`
#[macro_export(local_inner_macros)]
macro_rules! coap_item {
  (@cbor $array0:ident, $children0:block) => {{  //  CBOR
    d!(begin cbor coap_item, array: $array0);
    oc_rep_object_array_start_item!($array0, $array0);  //  TODO
    $children0;
    oc_rep_object_array_end_item!($array0, $array0);  //  TODO
    d!(end cbor coap_item);
  }};

  (@json $array0:ident, $children0:block) => {{  //  JSON
    d!(begin json coap_item, array: $array0);
    json_rep_object_array_start_item!($array0, $array0);
    $children0;
    json_rep_object_array_end_item!($array0, $array0);
    d!(end json coap_item);
  }};
}

///  Given an object parent and an integer Sensor Value `val`, set the `val`'s key/value in the object.
#[macro_export(local_inner_macros)]
macro_rules! coap_set_int_val {
  (@cbor $parent0:ident, $val0:expr) => {{  //  CBOR
    d!(begin cbor coap_set_int_val, parent: $parent0, val: $val0);
    if let SensorValueType::Uint(val) = $val0.val {
      oc_rep_set_int!($parent0, $val0.key, val);
    } else {
      assert!(false);  //  Value not uint
    }
    d!(end cbor coap_set_int_val);
  }};

  (@json $parent0:ident, $val0:expr) => {{  //  JSON
    d!(begin json coap_set_int_val, parent: $parent0, val: $val0);
    if let SensorValueType::Uint(val) = $val0.val {
      json_rep_set_int!($parent0, $val0.key, val);
    } else {
      assert!(false);  //  Value not uint
    }
    d!(end json coap_set_int_val);
  }};
}

///  Create a new Item object in the parent array and set the Sensor Value's key/value (integer).
#[macro_export(local_inner_macros)]
macro_rules! coap_item_int_val {
  (@cbor $parent0:ident, $val0:expr) => {{  //  CBOR
    d!(begin cbor coap_item_int_val, parent: $parent0, val: $val0);
    if let SensorValueType::Uint(val) = $val0.val {
      coap_item_int!(@cbor $parent0, $val0.key, val);
    } else {
      assert!(false);  //  Value not uint
    }
    d!(end cbor coap_item_int_val);
  }};

  (@json $parent0:ident, $val0:expr) => {{  //  JSON
    d!(begin json coap_item_int_val, parent: $parent0, val: $val0);
    d!(> TODO: assert($val0.val_type == SENSOR_VALUE_TYPE_INT32));
    d!(> TODO: coap_item_int(@json $parent0, $val0.key, $val0.int_val));
    if let SensorValueType::Uint(val) = $val0.val {
      coap_item_int!(@json $parent0, $val0.key, val);
    } else {
      assert!(false);  //  Value not uint
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
    let key_with_null: &str = stringify_null!($key);
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
    let key_with_null: &str = stringify_null!($key);
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
  ($context:ident, $key:ident) => {{  //  If $key is identifier...
    concat!(
      "<< jitmi",
      " k: ", stringify!($key)
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = stringify_null!($key);    
    unsafe { 
      mynewt_rust::json_helper_object_array_start_item(
        $context.key_to_cstr(key_with_null.as_bytes())
      ) 
    };
  }};

  ($context:ident, $key:expr) => {{  //  If $key is expression...
    concat!(
      "<< jitme",
      " k: ", stringify!($key)
    );
    //  Convert key char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $key.to_bytes_optional_nul();
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
  ($context:ident, $key:ident) => {{  //  If $key is identifier...
    concat!(
      ">>"
    );
    //  Convert key to null-terminated char array. If key is `device`, convert to `"device\u{0}"`
    let key_with_null: &str = stringify_null!($key);
    unsafe { 
      mynewt_rust::json_helper_object_array_end_item(
        $context.key_to_cstr(key_with_null.as_bytes())
      ) 
    };
  }};

  ($context:ident, $key:expr) => {{  //  If $key is expression...
    concat!(
      ">>"
    );
    //  Convert key char array, which may or may not be null-terminated.
    let key_with_opt_null: &[u8] = $key.to_bytes_optional_nul();
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
    let key_with_null: &str = stringify_null!($key);
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
    let key_with_null: &str = stringify_null!($key);
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
//  CBOR macros ported from C to Rust:
//  https://github.com/apache/mynewt-core/blob/master/net/oic/include/oic/oc_rep.h

#[macro_export(local_inner_macros)]
macro_rules! oc_rep_start_root_object {
  () => {{
    d!(begin oc_rep_start_root_object);
    //  TODO
    //  d!(> TODO: g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength));
    unsafe { cbor_encoder_create_map(&mut g_encoder, &mut root_map, CborIndefiniteLength) };
    d!(end oc_rep_start_root_object);
  }};
}

#[macro_export(local_inner_macros)]
macro_rules! oc_rep_end_root_object {
  () => {{
    d!(begin oc_rep_end_root_object);
    //  d!(> TODO: g_err |= cbor_encoder_close_container(&g_encoder, &root_map));
    unsafe { cbor_encoder_close_container(&mut g_encoder, &mut root_map); }
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
    //  d!(> TODO: CborEncoder key##_map);
    //  concat_idents!($key, _map) = CborEncoder{};
    //  d!(> TODO: g_err |= cbor_encoder_create_map(&parent, &key##_map, CborIndefiniteLength));
    unsafe { cbor_encoder_create_map(
      &mut $parent, 
      &mut concat_idents!($key, _map), 
      CborIndefiniteLength) 
    };
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
    //  d!(> TODO: g_err |= cbor_encoder_close_container(&parent, &key##_map));
    unsafe { cbor_encoder_close_container(
      &mut concat_idents!($parent, $parent_suffix), 
      &mut concat_idents!($key, _map)) 
    };
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
    //  d!(> TODO: CborEncoder key##_array);
    //  concat_idents!($key, _array) = CborEncoder{};
    //  d!(> TODO: g_err |= cbor_encoder_create_array(&parent, &key##_array, CborIndefiniteLength));
    unsafe { cbor_encoder_create_array(
      &mut concat_idents!($parent, $parent_suffix), 
      &mut concat_idents!($key, _array), 
      CborIndefiniteLength) 
    };
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
    //  d!(> TODO: g_err |= cbor_encoder_close_container(&parent, &key##_array));
    unsafe { cbor_encoder_close_container(
      &mut $parent, 
      &mut concat_idents!($parent, $parent_suffix)) 
    };
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
    //  concat!("> TODO: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key));");
    unsafe { cbor_encode_text_string(&mut concat_idents!($object, _map), $key.as_ptr(), $key.len()) };
    //  concat!("> TODO: oc_rep_start_array!(object##_map, key);");
    oc_rep_start_array!($object, $key, _map);
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
    //  d!(> TODO: oc_rep_end_array(object##_map, key));
    oc_rep_end_array!($object, $key, _map);
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
    //  d!(> TODO: oc_rep_start_object(key##_array, key));        
    oc_rep_start_object!($key, $key, _array);
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
    //  d!(> TODO: oc_rep_end_object(key##_array, key));
    oc_rep_end_object!($key, $key, _array);
    d!(end oc_rep_object_array_end_item);
  }};
}

///  Encode an int value 
#[macro_export]
macro_rules! oc_rep_set_int {
  ($object:ident, $key:expr, $value:expr) => {{
    concat!(
      "begin oc_rep_set_int ",
      ", object: ", stringify!($object),
      ", key: ",    stringify!($key),
      ", value: ",  stringify!($value),
      ", child: ",  stringify!($object), "_map"  //  object##_map
    );
    unsafe {
      //  d!(> TODO: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key)));
      cbor_encode_text_string(&mut concat_idents!($object,_map), $key.as_ptr(), $key.len());
      //  d!(> TODO: g_err |= cbor_encode_int(&object##_map, value));
      cbor_encode_int(&mut concat_idents!($object,_map), $value);
    }
    d!(end oc_rep_set_int);
  }};
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
    unsafe {
      //  d!(> TODO: g_err |= cbor_encode_text_string(&object##_map, #key, strlen(#key)));
      cbor_encode_text_string(&mut concat_idents!($object, _map), $key.as_ptr(), $key.len());
      //  d!(> TODO: g_err |= cbor_encode_text_string(&object##_map, value, strlen(value)));
      cbor_encode_text_string(&mut concat_idents!($object, _map), $value.as_ptr(), $value.len());
    }
    d!(end oc_rep_set_text_string);
  }};
}

//  TODO
//  Encode an unsigned int value 
//  void oc_rep_set_uint(void *object, const char *key, uint64_t value);

//  Encode a float value 
//  void oc_rep_set_float(void *object, const char *key, float value);


///////////////////////////////////////////////////////////////////////////////
//  Utility Macros

///  Macro that takes an identifier and returns a `[u8]` containing the identifier, terminated by 0.
///  Used to convert an identifier to a C null-terminated string.
#[macro_export]
macro_rules! stringify_null {
  ($key:ident) => {  //  If $key is identifier...
    concat!(
      stringify!($key),
      "\0"
    )
  };
}

///  Macro to dump all tokens received as a literal string, e.g.
///  `d!(a b c)` returns `"a b c"`
#[macro_export]
macro_rules! d {
  //  This rule matches zero or more tokens.
  ($($token:tt)*) => {
    //  For all matched tokens, convert into a string.
    stringify!($($token)*)
  };
}

///  Macro to display the token being parsed and the remaining tokens
#[macro_export]
macro_rules! nx {
  (($($current:tt)*), ($($next:tt)*), ($($rest:tt)*)) => {
    concat!(
      " >> ",
      stringify!($($current)*), 
      " >> ",
      stringify!($($next)*), 
      " >> ",
      stringify!($($rest)*)
    );
  };
}
