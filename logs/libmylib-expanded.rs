#![feature(prelude_import)]
#![no_std]
//!  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server or Collector Node.
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/main.c`

#![no_std]
//  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]
//  To support macro tracing: trace_macros!(true)
#![feature(concat_idents)]
#[prelude_import]
use ::core::prelude::v1::*;
#[macro_use]
extern crate core as core;
#[macro_use]
extern crate compiler_builtins as compiler_builtins;
//  To support concat_idents!() macro used in coap!() macro
extern crate cortex_m;
//  Declare the external library cortex_m

#[macro_use]
mod macros {
    //  Declare macros.rs as Rust module `macros` and import the macros
    //  Declare base.rs as Rust module `base`
    //  Declare tinycbor.rs as Rust module `tinycbor` and import the C API for TinyCBOR
    //  Declare sensor.rs as Rust module `sensor`
    //  Declare listen_sensor.rs as Rust module `listen_sensor`
    //  Declare send_coap.rs as Rust module `send_coap`

    //  Import the PanicInfo type which is used by panic() below
    //  Import the cortex_m assembly function to inject breakpoint
    //  Import base.rs for common declarations
    //  Import listen_sensor.rs for polling the temperature sensor
    //  Import send_coap.rs for sending sensor data

    //  Don't mangle the name "main"
    //  Declare extern "C" because it will be called by Mynewt
    //  Init Mynewt system.


    //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
    //  assert!(rc == 0);

    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
    //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.

    /* `assert!(rc == 0)` expands to:
    if !(rc == 0) {
        {
            ::core::panicking::panic(&("assertion failed: rc == 0",
                                       "src/lib.rs", 39u32, 40u32))
        }
    }; */
    // ::core::panicking::panic(expr_file_line_col: &(&'static str, &'static str, u32, u32))

    //  Main event loop
    //  Loop forever...
    //  Process events...
    //  From default event queue.
    //  Never comes here.

    //  Display the filename and line number to the Semihosting Console.
    //  TODO: Print in decimal not hex. Allow more than 255 lines.
    //  Pause in the debugger.
    //  Loop forever so that device won't restart.
    ///  Macros for composing CoAP payloads with JSON or CBOR encoding
    ///  Adapted From https://docs.serde.rs/src/serde_json/macros.rs.html
    #[macro_export(local_inner_macros)]
    macro_rules! coap(( @ none $ ( $ tokens : tt ) + ) => {
                      parse ! ( @ none $ ( $ tokens ) + ) } ; (
                      @ json $ ( $ tokens : tt ) + ) => {
                      parse ! ( @ json $ ( $ tokens ) + ) } ; (
                      @ cbor $ ( $ tokens : tt ) + ) => {
                      parse ! ( @ cbor $ ( $ tokens ) + ) } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! parse((
                       @ $ enc : ident @ object $ object : ident (  ) (  ) (
                       ) ) => {  } ; (
                       @ none @ object $ object : ident [ $ ( $ key : tt ) + ]
                       ( $ value : expr ) , $ ( $ rest : tt ) * ) => {
                       d ! (
                       TODO : add key : $ ( $ key ) + , value : $ value , to
                       object : $ object ) ; parse ! (
                       @ none @ object $ object (  ) ( $ ( $ rest ) * ) (
                       $ ( $ rest ) * ) ) ; } ; (
                       @ $ enc : ident @ object $ object : ident [
                       $ ( $ key : tt ) + ] ( $ value : expr ) , $ (
                       $ rest : tt ) * ) => {
                       d ! (
                       add1 key : $ ( $ key ) + value : $ value to object : $
                       object ) ; coap_item_str ! (
                       @ $ enc $ object , $ ( $ key ) + , $ value ) ;
                       "--------------------" ; parse ! (
                       @ $ enc @ object $ object (  ) ( $ ( $ rest ) * ) (
                       $ ( $ rest ) * ) ) ; } ; (
                       @ $ enc : ident @ object $ object : ident [
                       $ ( $ key : tt ) + ] ( $ value : expr ) $ unexpected :
                       tt $ ( $ rest : tt ) * ) => {
                       unexpected_token ! ( $ unexpected ) ; } ; (
                       @ $ enc : ident @ object $ object : ident [
                       $ ( $ key : tt ) + ] ( $ value : expr ) ) => {
                       d ! (
                       TODO : add2 key : $ ( $ key ) + value : $ value to
                       object : $ object ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) ( : null $ ( $ rest : tt ) * ) $
                       copy : tt ) => {
                       parse ! (
                       @ $ enc @ object $ object [ $ ( $ key ) + ] (
                       parse ! ( @ $ enc null ) ) $ ( $ rest ) * ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) ( : true $ ( $ rest : tt ) * ) $
                       copy : tt ) => {
                       parse ! (
                       @ $ enc @ object $ object [ $ ( $ key ) + ] (
                       parse ! ( @ $ enc true ) ) $ ( $ rest ) * ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) ( : false $ ( $ rest : tt ) * ) $
                       copy : tt ) => {
                       parse ! (
                       @ $ enc @ object $ object [ $ ( $ key ) + ] (
                       parse ! ( @ $ enc false ) ) $ ( $ rest ) * ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) (
                       : [ $ ( $ array : tt ) * ] $ ( $ rest : tt ) * ) $ copy
                       : tt ) => {
                       parse ! (
                       @ $ enc @ object $ object [ $ ( $ key ) + ] (
                       parse ! ( @ $ enc [ $ ( $ array ) * ] ) ) $ ( $ rest )
                       * ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) (
                       : { $ ( $ map : tt ) * } $ ( $ rest : tt ) * ) $ copy :
                       tt ) => {
                       parse ! (
                       @ $ enc @ object $ object [ $ ( $ key ) + ] (
                       parse ! ( @ $ enc { $ ( $ map ) * } ) ) $ ( $ rest ) *
                       ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) (
                       : $ value : expr , $ ( $ rest : tt ) * ) $ copy : tt )
                       => {
                       parse ! (
                       @ $ enc @ object $ object [ $ ( $ key ) + ] (
                       parse ! ( @ $ enc $ value ) ) , $ ( $ rest ) * ) ; } ;
                       (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) ( : $ value : expr ) $ copy : tt )
                       => {
                       parse ! (
                       @ $ enc @ object $ object [ $ ( $ key ) + ] (
                       parse ! ( @ $ enc $ value ) ) ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) ( : ) $ copy : tt ) => {
                       parse ! (  ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) + ) (  ) $ copy : tt ) => {
                       parse ! (  ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (  ) (
                       : $ ( $ rest : tt ) * ) (
                       $ colon : tt $ ( $ copy : tt ) * ) ) => {
                       unexpected_token ! ( $ colon ) ; } ; (
                       @ none @ object $ object : ident ( $ ( $ key : tt ) * )
                       ( , $ ( $ rest : tt ) * ) (
                       $ comma : tt $ ( $ copy : tt ) * ) ) => {
                       d ! (
                       TODO : extract key , value from _sensor_value : $ (
                       $ key ) * and add to _object : $ object ) ;
                       "--------------------" ; parse ! (
                       @ none @ object $ object (  ) ( $ ( $ rest ) * ) (
                       $ ( $ rest ) * ) ) ; } ; (
                       @ json @ object $ object : ident ( $ ( $ key : tt ) * )
                       ( , $ ( $ rest : tt ) * ) (
                       $ comma : tt $ ( $ copy : tt ) * ) ) => {
                       d ! (
                       TODO : extract key , value from _sensor_value : $ (
                       $ key ) * and add to _object : $ object ) ;
                       "--------------------" ; coap_item_int_val ! (
                       @ json $ object , $ ( $ key ) * ) ;
                       "--------------------" ; parse ! (
                       @ json @ object $ object (  ) ( $ ( $ rest ) * ) (
                       $ ( $ rest ) * ) ) ; } ; (
                       @ cbor @ object $ object : ident ( $ ( $ key : tt ) * )
                       ( , $ ( $ rest : tt ) * ) (
                       $ comma : tt $ ( $ copy : tt ) * ) ) => {
                       d ! (
                       TODO : extract key , value from _sensor_value : $ (
                       $ key ) * and add to _object : $ object ) ;
                       "--------------------" ; coap_set_int_val ! (
                       @ cbor $ object , $ ( $ key ) * ) ;
                       "--------------------" ; parse ! (
                       @ cbor @ object $ object (  ) ( $ ( $ rest ) * ) (
                       $ ( $ rest ) * ) ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (  ) (
                       ( $ key : expr ) : $ ( $ rest : tt ) * ) $ copy : tt )
                       => {
                       d ! ( got (  ) ) ; parse ! (
                       @ $ enc @ object $ object ( $ key ) ( : $ ( $ rest ) *
                       ) ( : $ ( $ rest ) * ) ) ; } ; (
                       @ $ enc : ident @ object $ object : ident (
                       $ ( $ key : tt ) * ) ( $ tt : tt $ ( $ rest : tt ) * )
                       $ copy : tt ) => {
                       nx ! (
                       ( $ ( $ key ) * ) , ( $ tt ) , ( $ ( $ rest ) * ) ) ;
                       parse ! (
                       @ $ enc @ object $ object ( $ ( $ key ) * $ tt ) (
                       $ ( $ rest ) * ) ( $ ( $ rest ) * ) ) ; } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ] )
                       => { parse_vector ! [ $ ( $ elems , ) * ] } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr ) , * ] )
                       => { parse_vector ! [ $ ( $ elems ) , * ] } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ]
                       null $ ( $ rest : tt ) * ) => {
                       parse ! (
                       @ $ enc @ array [
                       $ ( $ elems , ) * parse ! ( @ $ enc null ) ] $ ( $ rest
                       ) * ) } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ]
                       true $ ( $ rest : tt ) * ) => {
                       parse ! (
                       @ $ enc @ array [
                       $ ( $ elems , ) * parse ! ( @ $ enc true ) ] $ ( $ rest
                       ) * ) } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ]
                       false $ ( $ rest : tt ) * ) => {
                       parse ! (
                       @ $ enc @ array [
                       $ ( $ elems , ) * parse ! ( @ $ enc false ) ] $ (
                       $ rest ) * ) } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ] [
                       $ ( $ array : tt ) * ] $ ( $ rest : tt ) * ) => {
                       parse ! (
                       @ $ enc @ array [
                       $ ( $ elems , ) * parse ! ( @ $ enc [ $ ( $ array ) * ]
                       ) ] $ ( $ rest ) * ) } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ] {
                       $ ( $ map : tt ) * } $ ( $ rest : tt ) * ) => {
                       parse ! (
                       @ $ enc @ array [
                       $ ( $ elems , ) * parse ! ( @ $ enc { $ ( $ map ) * } )
                       ] $ ( $ rest ) * ) } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ] $
                       next : expr , $ ( $ rest : tt ) * ) => {
                       parse ! (
                       @ $ enc @ array [
                       $ ( $ elems , ) * parse ! ( @ $ enc $ next ) , ] $ (
                       $ rest ) * ) } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr , ) * ] $
                       last : expr ) => {
                       parse ! (
                       @ $ enc @ array [
                       $ ( $ elems , ) * parse ! ( @ $ enc $ last ) ] ) } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr ) , * ] ,
                       $ ( $ rest : tt ) * ) => {
                       parse ! (
                       @ $ enc @ array [ $ ( $ elems , ) * ] $ ( $ rest ) * )
                       } ; (
                       @ $ enc : ident @ array [ $ ( $ elems : expr ) , * ] $
                       unexpected : tt $ ( $ rest : tt ) * ) => {
                       unexpected_token ! ( $ unexpected ) } ; (
                       @ $ enc : ident null ) => {
                       { d ! ( TODO : null ) ; "null" } } ; (
                       @ $ enc : ident true ) => { { d ! ( true ) ; "true" } }
                       ; ( @ $ enc : ident false ) => {
                       { d ! ( false ) ; "false" } } ; ( @ $ enc : ident [  ]
                       ) => { { d ! ( [ TODO ] ) ; "[ TODO ]" } } ; (
                       @ $ enc : ident [ $ ( $ tt : tt ) + ] ) => {
                       {
                       d ! ( begin array ) ; _array = parse ! (
                       @ $ enc @ array [  ] $ ( $ tt ) + ) ; d ! ( end array )
                       ; "[ TODO ]" } } ; ( @ $ enc : ident {  } ) => {
                       { d ! ( { TODO } ) ; "{ TODO }" } } ; (
                       @ none { $ ( $ tt : tt ) + } ) => {
                       {
                       d ! ( begin none root ) ; let root = "root" ; parse ! (
                       @ none @ object root (  ) ( $ ( $ tt ) + ) (
                       $ ( $ tt ) + ) ) ; d ! ( end none root ) ; d ! (
                       return none root to caller ) ; root } } ; (
                       @ json { $ ( $ tt : tt ) + } ) => {
                       {
                       d ! ( begin json root ) ; let root = "root" ; coap_root
                       ! (
                       @ json {
                       let values = "values" ; coap_array ! (
                       @ json root , values , {
                       parse ! (
                       @ json @ object values (  ) ( $ ( $ tt ) + ) (
                       $ ( $ tt ) + ) ) ; } ) ; } ) ; d ! ( end json root ) ;
                       d ! ( return json root to caller ) ; root } } ; (
                       @ cbor { $ ( $ tt : tt ) + } ) => {
                       {
                       d ! ( begin cbor root ) ; let root = "root" ; coap_root
                       ! (
                       @ cbor {
                       parse ! (
                       @ cbor @ object root (  ) ( $ ( $ tt ) + ) (
                       $ ( $ tt ) + ) ) ; } ) ; d ! ( end cbor root ) ; d ! (
                       return cbor root to caller ) ; root } } ; (
                       @ $ enc : ident $ other : expr ) => { $ other } ;);
    #[macro_export]
    #[doc(hidden)]
    macro_rules! parse_vector(( $ ( $ content : tt ) * ) => {
                              vec ! [ $ ( $ content ) * ] } ;);
    #[macro_export]
    #[doc(hidden)]
    macro_rules! unexpected_token((  ) => {  } ;);
    ///  Compose the payload root.
    #[macro_export(local_inner_macros)]
    macro_rules! coap_root(( @ $ enc : ident $ children0 : block ) => {
                           {
                           d ! ( begin coap_root ) ; oc_rep_start_root_object
                           ! (  ) ; $ children0 ; oc_rep_end_root_object ! (
                           ) ; d ! ( end coap_root ) ; } } ;);
    ///  Compose an array under "object", named as "key".  Add "children" as array elements.
    #[macro_export(local_inner_macros)]
    macro_rules! coap_array((
                            @ $ enc : ident $ object0 : ident , $ key0 : ident
                            , $ children0 : block ) => {
                            {
                            d ! (
                            begin coap_array _object0 : $ object0 _key0 : $
                            key0 ) ; oc_rep_set_array ! ( $ object0 , $ key0 )
                            ; $ children0 ; oc_rep_close_array ! (
                            $ object0 , $ key0 ) ; d ! ( end coap_array ) ; }
                            } ;);
    ///  Append a (`key` + `val` string value) item to the array named `parent`:
    ///    `{ <parent>: [ ..., {"key": <key>, "value": <val>} ] }`
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item_str((
                               @ $ enc : ident $ parent : ident , $ key : expr
                               , $ val : expr ) => {
                               {
                               d ! (
                               begin coap_item_str _parent : $ parent _key : $
                               key _val : $ val ) ; coap_item ! (
                               @ $ enc $ parent , {
                               oc_rep_set_text_string ! (
                               $ parent , "key" , $ key ) ;
                               oc_rep_set_text_string ! (
                               $ parent , "value" , $ val ) ; } ) ; d ! (
                               end coap_item_str ) ; } } ;);
    ///  Append an array item under the array named `array0`.  Add `children0` as the items (key and value).
    ///    `{ <array0>: [ ..., { <children0> } ] }`
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item((
                           @ $ enc : ident $ array0 : ident , $ children0 :
                           block ) => {
                           {
                           d ! ( begin coap_item array : $ array0 ) ;
                           oc_rep_object_array_start_item ! ( $ array0 ) ; $
                           children0 ; oc_rep_object_array_end_item ! (
                           $ array0 ) ; d ! ( end coap_item ) ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item_int((
                               @ $ enc : ident $ array0 : ident , $ key0 :
                               expr , $ value0 : expr ) => {
                               {
                               d ! (
                               begin coap_item_int , key : $ key0 , value : $
                               value0 ) ; coap_item ! (
                               @ $ enc $ array0 , {
                               oc_rep_set_text_string ! (
                               $ array0 , "key" , $ key0 ) ; oc_rep_set_int !
                               ( $ array0 , "value" , $ value0 ) ; } ) ; d ! (
                               end coap_item_int ) ; } } ;);
    ///  Given an object parent and an integer Sensor Value val, set the val's key/value in the object.
    #[macro_export(local_inner_macros)]
    macro_rules! coap_set_int_val((
                                  @ $ enc : ident $ parent0 : ident , $ val0 :
                                  expr ) => {
                                  {
                                  d ! (
                                  begin coap_set_int_val , parent : $ parent0
                                  , val : $ val0 ) ; d ! (
                                  > TODO : assert (
                                  $ val0 . val_type == SENSOR_VALUE_TYPE_INT32
                                  ) ) ; oc_rep_set_int ! (
                                  $ parent0 , $ val0 . key , 1234 ) ; d ! (
                                  end coap_set_int_val ) ; } } ;);
    ///  Create a new Item object in the parent array and set the Sensor Value's key/value (integer).
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item_int_val((
                                   @ $ enc : ident $ parent0 : ident , $ val0
                                   : expr ) => {
                                   {
                                   d ! (
                                   begin coap_item_int_val , parent : $
                                   parent0 , val : $ val0 ) ; d ! (
                                   > TODO : assert (
                                   $ val0 . val_type ==
                                   SENSOR_VALUE_TYPE_INT32 ) ) ; d ! (
                                   > TODO : coap_item_int (
                                   $ parent0 , $ val0 . key , $ val0 . int_val
                                   ) ) ; coap_item_int ! (
                                   @ $ enc $ parent0 , $ val0 . key , 1234 ) ;
                                   d ! ( end coap_item_int_val ) ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! oc_rep_start_root_object((  ) => {
                                          {
                                          d ! ( begin oc_rep_start_root_object
                                          ) ; cbor_encoder_create_map (
                                          & g_encoder , & root_map ,
                                          CborIndefiniteLength ) ; d ! (
                                          end oc_rep_start_root_object ) ; } }
                                          ;);
    #[macro_export(local_inner_macros)]
    macro_rules! oc_rep_end_root_object((  ) => {
                                        {
                                        d ! ( begin oc_rep_end_root_object ) ;
                                        cbor_encoder_close_container (
                                        & g_encoder , & root_map ) ; d ! (
                                        end oc_rep_end_root_object ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_start_object((
                                     $ parent : ident , $ key : ident , $
                                     parent_suffix : ident ) => {
                                     {
                                     concat ! (
                                     "begin oc_rep_start_object " ,
                                     ", parent: " , stringify ! ( $ parent ) ,
                                     stringify ! ( $ parent_suffix ) ,
                                     ", key: " , stringify ! ( $ key ) ,
                                     ", child: " , stringify ! ( $ key ) ,
                                     "_map" ) ; concat_idents ! ( $ key , _map
                                     ) = CborEncoder {  } ;
                                     cbor_encoder_create_map (
                                     & $ parent , & concat_idents ! (
                                     $ key , _map ) , CborIndefiniteLength ) ;
                                     d ! ( end oc_rep_start_object ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_end_object((
                                   $ parent : ident , $ key : ident , $
                                   parent_suffix : ident ) => {
                                   {
                                   concat ! (
                                   "begin oc_rep_end_object " , ", parent: " ,
                                   stringify ! ( $ parent ) , stringify ! (
                                   $ parent_suffix ) , ", key: " , stringify !
                                   ( $ key ) , ", child: " , stringify ! (
                                   $ key ) , "_map" ) ;
                                   cbor_encoder_close_container (
                                   & concat_idents ! (
                                   $ parent , $ parent_suffix ) , &
                                   concat_idents ! ( $ key , # # _map ) ) ; d
                                   ! ( end oc_rep_end_object ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_start_array((
                                    $ parent : ident , $ key : ident , $
                                    parent_suffix : ident ) => {
                                    {
                                    concat ! (
                                    "begin oc_rep_start_array " , ", parent: "
                                    , stringify ! ( $ parent ) , stringify ! (
                                    $ parent_suffix ) , ", key: " , stringify
                                    ! ( $ key ) , ", child: " , stringify ! (
                                    $ key ) , "_array" ) ; concat_idents ! (
                                    $ key , _array ) = CborEncoder {  } ;
                                    cbor_encoder_create_array (
                                    & concat_idents ! (
                                    $ parent , $ parent_suffix ) , &
                                    concat_idents ! ( $ key , _array ) ,
                                    CborIndefiniteLength ) ; d ! (
                                    end oc_rep_start_array ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_end_array((
                                  $ parent : ident , $ key : ident , $
                                  parent_suffix : literal ) => {
                                  {
                                  concat ! (
                                  "begin oc_rep_end_array " , ", parent: " ,
                                  stringify ! ( $ parent ) , $ parent_suffix ,
                                  ", key: " , stringify ! ( $ key ) ,
                                  ", child: " , stringify ! ( $ key ) ,
                                  "_array" ) ; concat ! (
                                  "> TODO: g_err |= cbor_encoder_close_container(&"
                                  , stringify ! ( $ parent ) , $ parent_suffix
                                  , ", &" , stringify ! ( $ key ) , "_array" ,
                                  ");" ) ; d ! ( end oc_rep_end_array ) ; } }
                                  ;);
    #[macro_export]
    macro_rules! oc_rep_set_array(( $ object : ident , $ key : ident ) => {
                                  {
                                  concat ! (
                                  "begin oc_rep_set_array " , ", object: " ,
                                  stringify ! ( $ object ) , ", key: " ,
                                  stringify ! ( $ key ) , ", child: " ,
                                  stringify ! ( $ object ) , "_map" ) ;
                                  cbor_encode_text_string (
                                  concat_idents ! ( $ object , _map ) , $ key
                                  , $ key . len (  ) ) ; oc_rep_start_array !
                                  ( $ object , $ key , _map ) ; d ! (
                                  end oc_rep_set_array ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_close_array(( $ object : ident , $ key : ident ) => {
                                    {
                                    concat ! (
                                    "begin oc_rep_close_array " , ", object: "
                                    , stringify ! ( $ object ) , ", key: " ,
                                    stringify ! ( $ key ) , ", child: " ,
                                    stringify ! ( $ object ) , "_map" ) ;
                                    oc_rep_end_array ! (
                                    $ object , $ key , "_map" ) ; d ! (
                                    end oc_rep_close_array ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_object_array_start_item(( $ key : ident ) => {
                                                {
                                                concat ! (
                                                "begin oc_rep_object_array_start_item "
                                                , ", key: " , stringify ! (
                                                $ key ) , ", child: " ,
                                                stringify ! ( $ key ) ,
                                                "_array" , ) ;
                                                oc_rep_start_object ! (
                                                $ key , $ key , _array ) ; d !
                                                (
                                                end
                                                oc_rep_object_array_start_item
                                                ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_object_array_end_item(( $ key : ident ) => {
                                              {
                                              concat ! (
                                              "begin oc_rep_object_array_end_item "
                                              , ", key: " , stringify ! (
                                              $ key ) , ", child: " ,
                                              stringify ! ( $ key ) , "_array"
                                              , ) ; oc_rep_end_object ! (
                                              $ key , $ key , _array ) ; d ! (
                                              end oc_rep_object_array_end_item
                                              ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_set_int((
                                $ object : ident , $ key : expr , $ value :
                                expr ) => {
                                {
                                concat ! (
                                "begin oc_rep_set_int " , ", object: " ,
                                stringify ! ( $ object ) , ", key: " ,
                                stringify ! ( $ key ) , ", value: " ,
                                stringify ! ( $ value ) , ", child: " ,
                                stringify ! ( $ object ) , "_map" ) ;
                                cbor_encode_text_string (
                                & concat_idents ! ( $ object , _map ) , $ key
                                , $ key . len (  ) ) ; cbor_encode_int (
                                & concat_idents ! ( $ object , _map ) , $
                                value ) ; d ! ( end oc_rep_set_int ) ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_set_text_string((
                                        $ object : ident , $ key : expr , $
                                        value : expr ) => {
                                        {
                                        concat ! (
                                        "begin oc_rep_set_text_string " ,
                                        ", object: " , stringify ! ( $ object
                                        ) , ", key: " , stringify ! ( $ key )
                                        , ", value: " , stringify ! ( $ value
                                        ) , ", child: " , stringify ! (
                                        $ object ) , "_map" ) ;
                                        cbor_encode_text_string (
                                        & concat_idents ! ( $ object , _map )
                                        , $ key , $ key . len (  ) ) ;
                                        cbor_encode_text_string (
                                        & concat_idents ! ( $ object , _map )
                                        , $ value , $ value . len (  ) ) ; d !
                                        ( end oc_rep_set_text_string ) ; } }
                                        ;);
    #[macro_export]
    macro_rules! test_literal(( $ key : literal ) => {
                              { concat ! ( $ key , "_zzz" ) ; } } ;);
    #[macro_export]
    macro_rules! test_ident(( $ key : ident ) => {
                            { let $ key = stringify ! ( $ key ) ; } } ;);
    #[macro_export]
    macro_rules! test_internal_rules2(( @ json $ key : ident ) => {
                                      let _ = concat ! (
                                      "json2: " , stringify ! ( $ key ) ) ; }
                                      ; ( @ cbor $ key : ident ) => {
                                      let _ = concat ! (
                                      "cbor2: " , stringify ! ( $ key ) ) ; }
                                      ; ( @ $ encoding : ident $ key : ident )
                                      => {
                                      let _ = concat ! (
                                      "other2: " , stringify ! ( $ encoding )
                                      , " / " , stringify ! ( $ key ) ) ; }
                                      ;);
    #[macro_export]
    macro_rules! test_internal_rules(( @ json $ key : ident ) => {
                                     let _ = concat ! (
                                     "json: " , stringify ! ( $ key ) ) ;
                                     test_internal_rules2 ! ( @ json $ key ) ;
                                     } ; ( @ cbor $ key : ident ) => {
                                     let _ = concat ! (
                                     "cbor: " , stringify ! ( $ key ) ) ;
                                     test_internal_rules2 ! ( @ cbor $ key ) ;
                                     } ; ( @ $ encoding : ident $ key : ident
                                     ) => {
                                     let _ = concat ! (
                                     "other: " , stringify ! ( $ encoding ) ,
                                     " / " , stringify ! ( $ key ) ) ;
                                     test_internal_rules2 ! (
                                     @ $ encoding $ key ) ; } ;);
    ///  Macro to dump all tokens received as a literal string, e.g.
    ///  `d!(a b c)` returns `"a b c"`
    #[macro_export]
    macro_rules! d(( $ ( $ token : tt ) * ) => {
                   stringify ! ( $ ( $ token ) * ) } ;);
    ///  Macro to display the token being parsed and the remaining tokens
    #[macro_export]
    macro_rules! nx((
                    ( $ ( $ current : tt ) * ) , ( $ ( $ next : tt ) * ) , (
                    $ ( $ rest : tt ) * ) ) => {
                    concat ! (
                    " >> " , stringify ! ( $ ( $ current ) * ) , " >> " ,
                    stringify ! ( $ ( $ next ) * ) , " >> " , stringify ! (
                    $ ( $ rest ) * ) ) ; } ;);
}
mod base {
    //!  Common declarations for the application.  Includes custom sensor declarations.
    use cty::*;
    use crate::sensor::*;
    ///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
    pub fn console_print(msg: &[u8]) {
        let len = msg.len();
        unsafe { console_buffer(msg.as_ptr(), len as u32); console_flush(); }
    }
    ///  Import the custom interop helper library at `libs/mynewt_rust`
    #[link(name = "libs_mynewt_rust")]
    extern "C" {
        ///  Initialise the Mynewt system.  Start the Mynewt drivers and libraries.  Equivalent to `sysinit()` macro in C.
        ///  C API: `void rust_sysinit()`
        pub fn rust_sysinit();
        ///  Interpret `sensor_data` as a `sensor_temp_raw_data` struct that contains raw temp.
        ///  Copy the sensor data into `dest`.  Return 0 if successful.
        ///  C API: `int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest)`
        pub fn get_temp_raw_data(sensor_data: SensorDataPtr,
                                 dest: *mut SensorTempRawData) -> i32;
        ///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
        ///  Copy the sensor data into `dest`.  Return 0 if successful.
        ///  C API: `int get_temp_data(void *sensor_data, struct sensor_temp_data *dest)`
        pub fn get_temp_data(sensor_data: SensorDataPtr,
                             dest: *mut SensorTempData) -> i32;
        ///  Return the Mynewt device for the Mynewt sensor.
        ///  C API: `struct os_dev *sensor_get_device(struct sensor *s)`
        pub fn sensor_get_device(sensor: SensorPtr) -> DevicePtr;
        ///  Return the name for the Mynewt device.  Assumes name is non-null.
        ///  C API: `const char *device_get_name(struct os_dev *device)`
        pub fn device_get_name(device: DevicePtr) -> *const c_char;
        ///  Return the NULL sensor.
        ///  C API: `struct sensor *null_sensor(void)`
        pub fn null_sensor() -> SensorPtr;
        ///  Return non-zero if sensor is NULL.
        ///  C API: `int is_null_sensor(struct sensor *p)`
        pub fn is_null_sensor(sensor: SensorPtr) -> bool;
        ///  Return non-zero if sensor data is NULL.
        ///  C API: `int is_null_sensor_data(void *p)`
        pub fn is_null_sensor_data(sensor_data: SensorDataPtr) -> bool;
    }
    ///  Import the custom Mynewt library for displaying messages on the Arm Semihosting Console (via OpenOCD).
    ///  The library is located at `libs/semihosting_console`
    #[link(name = "libs_semihosting_console")]
    extern "C" {
        ///  Add the string to the output buffer.
        ///  C API: `void console_buffer(const char *buffer, unsigned int length)`
        pub fn console_buffer(buffer: *const u8, length: u32);
        ///  Write a byte in hexadecimal to the output buffer.
        ///  C API: `void console_printhex(uint8_t v)`
        pub fn console_printhex(v: u8);
        ///  Write a float to the output buffer, with 1 decimal place.
        ///  C API: `void console_printfloat(float f)`
        pub fn console_printfloat(f: f32);
        ///  Append "length" number of bytes from "buffer" to the output buffer in hex format.
        ///  C API: `void console_dump(const uint8_t *buffer, unsigned int len)`
        pub fn console_dump(buffer: *const u8, len: u32);
        ///  Flush the output buffer to the console.
        ///  C API: `void console_flush(void)`
        pub fn console_flush();
    }
    ///  Import the Mynewt Kernel API.  TODO: Move to `kernel.rs`.
    ///  Must sync with repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h
    #[link(name = "kernel_os")]
    extern "C" {
        ///  Pull a single item off the event queue and call it's event
        ///  callback.
        ///  `evq`: The event queue to pull the item off.
        pub fn os_eventq_run(evq: *const CVoid);
        ///  Retrieves the default event queue processed by OS main task.
        ///  Return the default event queue.
        pub fn os_eventq_dflt_get() -> *const CVoid;
    }
    ///  We will open internal temperature sensor `temp_stm32_0`.
    ///  Must sync with apps/my_sensor_app/src/listen_sensor.h
    pub const SENSOR_DEVICE: *const u8 = TEMP_STM32_DEVICE;
    pub const TEMP_STM32_DEVICE: *const u8 = b"temp_stm32_0\0".as_ptr();
    ///  Set to raw sensor type
    pub const TEMP_SENSOR_TYPE: SensorType =
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;
    ///  Return integer sensor values
    pub const TEMP_SENSOR_VALUE_TYPE: i32 = SENSOR_VALUE_TYPE_INT32;
    ///  Use key (field name) `t` to transmit raw temperature to CoAP Server or Collector Node
    pub const TEMP_SENSOR_KEY: *const u8 = b"t\0".as_ptr();
    ///  Sensor type for raw temperature sensor.
    ///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
    pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: SensorType =
        SENSOR_TYPE_USER_DEFINED_1;
    ///  `sensor_value` represents a decoded sensor data value. Since temperature may be integer (raw)
    ///  or float (computed), we use the struct to return both integer and float values.
    ///  `val_type` indicates whether it's an integer or float.
    ///  Must sync with libs/sensor_coap/include/sensor_coap/sensor_coap.h
    #[repr(C)]
    pub struct SensorValue {
        ///  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
        pub key: *const u8,
        ///  The type of the sensor value. `SENSOR_VALUE_TYPE_INT32` for int, `SENSOR_VALUE_TYPE_FLOAT` for float.
        pub val_type: i32,
        ///  For raw temp, contains the raw temp integer value
        pub int_val: u16,
        ///  For computed temp, contains the computed temp float value
        pub float_val: f32,
    }
    ///  Represents a decoded sensor data value. Since temperature may be integer (raw)
    ///  or float (computed), we use the struct to return both integer and float values.
    pub struct SensorValueNew {
        ///  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
        pub key: &'static str,
        ///  The type of the sensor value and the value.
        pub val: SensorValueType,
    }
    ///  Represents the type and value of a sensor data value.
    pub enum SensorValueType {

        ///  32-bit unsigned integer. For raw temp, contains the raw temp integer value
        Uint(u32),

        ///  32-bit float. For computed temp, contains the computed temp float value
        Float(f32),
    }
    ///  Represents a single temperature sensor raw value.
    ///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
    #[repr(C, packed)]
    pub struct SensorTempRawData {
        ///  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
        pub strd_temp_raw: u32,
        ///  1 if data is valid
        pub strd_temp_raw_is_valid: u8,
    }
}
mod tinycbor {
    pub type __uint8_t = ::cty::c_uchar;
    pub type __uint16_t = ::cty::c_ushort;
    pub type __uint32_t = ::cty::c_ulong;
    pub type __int64_t = ::cty::c_longlong;
    pub type __uint64_t = ::cty::c_ulonglong;
    pub type __uintptr_t = ::cty::c_uint;
    pub type FILE = File;
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct File_methods {
        pub write: ::core::option::Option<unsafe extern "C" fn(instance:
                                                                   *mut FILE,
                                                               bp:
                                                                   *const ::cty::c_char,
                                                               n: usize)
                                              -> usize>,
        pub read: ::core::option::Option<unsafe extern "C" fn(instance:
                                                                  *mut FILE,
                                                              bp:
                                                                  *mut ::cty::c_char,
                                                              n: usize)
                                             -> usize>,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for File_methods {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                File_methods { write: ref __self_0_0, read: ref __self_0_1 }
                => {
                    let mut debug_trait_builder =
                        f.debug_struct("File_methods");
                    let _ =
                        debug_trait_builder.field("write", &&(*__self_0_0));
                    let _ =
                        debug_trait_builder.field("read", &&(*__self_0_1));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for File_methods { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for File_methods {
        #[inline]
        fn clone(&self) -> File_methods {
            {
                let _:
                        ::core::clone::AssertParamIsClone<::core::option::Option<unsafe extern "C" fn(instance:
                                                                                                          *mut FILE,
                                                                                                      bp:
                                                                                                          *const ::cty::c_char,
                                                                                                      n:
                                                                                                          usize)
                                                                                     ->
                                                                                         usize>>;
                let _:
                        ::core::clone::AssertParamIsClone<::core::option::Option<unsafe extern "C" fn(instance:
                                                                                                          *mut FILE,
                                                                                                      bp:
                                                                                                          *mut ::cty::c_char,
                                                                                                      n:
                                                                                                          usize)
                                                                                     ->
                                                                                         usize>>;
                *self
            }
        }
    }
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct File {
        pub vmt: *const File_methods,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for File {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                File { vmt: ref __self_0_0 } => {
                    let mut debug_trait_builder = f.debug_struct("File");
                    let _ = debug_trait_builder.field("vmt", &&(*__self_0_0));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for File { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for File {
        #[inline]
        fn clone(&self) -> File {
            {
                let _: ::core::clone::AssertParamIsClone<*const File_methods>;
                *self
            }
        }
    }
    pub const CborType_CborIntegerType: CborType = 0;
    pub const CborType_CborByteStringType: CborType = 64;
    pub const CborType_CborTextStringType: CborType = 96;
    pub const CborType_CborArrayType: CborType = 128;
    pub const CborType_CborMapType: CborType = 160;
    pub const CborType_CborTagType: CborType = 192;
    pub const CborType_CborSimpleType: CborType = 224;
    pub const CborType_CborBooleanType: CborType = 245;
    pub const CborType_CborNullType: CborType = 246;
    pub const CborType_CborUndefinedType: CborType = 247;
    pub const CborType_CborHalfFloatType: CborType = 249;
    pub const CborType_CborFloatType: CborType = 250;
    pub const CborType_CborDoubleType: CborType = 251;
    pub const CborType_CborInvalidType: CborType = 255;
    pub type CborType = u32;
    pub type CborTag = u64;
    pub const CborKnownTags_CborDateTimeStringTag: CborKnownTags = 0;
    pub const CborKnownTags_CborUnixTime_tTag: CborKnownTags = 1;
    pub const CborKnownTags_CborPositiveBignumTag: CborKnownTags = 2;
    pub const CborKnownTags_CborNegativeBignumTag: CborKnownTags = 3;
    pub const CborKnownTags_CborDecimalTag: CborKnownTags = 4;
    pub const CborKnownTags_CborBigfloatTag: CborKnownTags = 5;
    pub const CborKnownTags_CborExpectedBase64urlTag: CborKnownTags = 21;
    pub const CborKnownTags_CborExpectedBase64Tag: CborKnownTags = 22;
    pub const CborKnownTags_CborExpectedBase16Tag: CborKnownTags = 23;
    pub const CborKnownTags_CborUriTag: CborKnownTags = 32;
    pub const CborKnownTags_CborBase64urlTag: CborKnownTags = 33;
    pub const CborKnownTags_CborBase64Tag: CborKnownTags = 34;
    pub const CborKnownTags_CborRegularExpressionTag: CborKnownTags = 35;
    pub const CborKnownTags_CborMimeMessageTag: CborKnownTags = 36;
    pub const CborKnownTags_CborSignatureTag: CborKnownTags = 55799;
    pub type CborKnownTags = u32;
    pub const CborError_CborNoError: CborError = 0;
    pub const CborError_CborUnknownError: CborError = 1;
    pub const CborError_CborErrorUnknownLength: CborError = 2;
    pub const CborError_CborErrorAdvancePastEOF: CborError = 3;
    pub const CborError_CborErrorIO: CborError = 4;
    pub const CborError_CborErrorGarbageAtEnd: CborError = 256;
    pub const CborError_CborErrorUnexpectedEOF: CborError = 257;
    pub const CborError_CborErrorUnexpectedBreak: CborError = 258;
    pub const CborError_CborErrorUnknownType: CborError = 259;
    pub const CborError_CborErrorIllegalType: CborError = 260;
    pub const CborError_CborErrorIllegalNumber: CborError = 261;
    pub const CborError_CborErrorIllegalSimpleType: CborError = 262;
    pub const CborError_CborErrorUnknownSimpleType: CborError = 512;
    pub const CborError_CborErrorUnknownTag: CborError = 513;
    pub const CborError_CborErrorInappropriateTagForType: CborError = 514;
    pub const CborError_CborErrorDuplicateObjectKeys: CborError = 515;
    pub const CborError_CborErrorInvalidUtf8TextString: CborError = 516;
    pub const CborError_CborErrorTooManyItems: CborError = 768;
    pub const CborError_CborErrorTooFewItems: CborError = 769;
    pub const CborError_CborErrorDataTooLarge: CborError = 1024;
    pub const CborError_CborErrorNestingTooDeep: CborError = 1025;
    pub const CborError_CborErrorUnsupportedType: CborError = 1026;
    pub const CborError_CborErrorJsonObjectKeyIsAggregate: CborError = 1027;
    pub const CborError_CborErrorJsonObjectKeyNotString: CborError = 1028;
    pub const CborError_CborErrorJsonNotImplemented: CborError = 1029;
    pub const CborError_CborErrorOutOfMemory: CborError = 2147483648;
    pub const CborError_CborErrorInternalError: CborError = 4294967295;
    pub type CborError = u32;
    extern "C" {
        pub fn cbor_error_string(error: CborError) -> *const ::cty::c_char;
    }
    pub type cbor_encoder_write
        =
        ::core::option::Option<unsafe extern "C" fn(arg1:
                                                        *mut cbor_encoder_writer,
                                                    data:
                                                        *const ::cty::c_char,
                                                    len: ::cty::c_int)
                                   -> ::cty::c_int>;
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct cbor_encoder_writer {
        pub write: cbor_encoder_write,
        pub bytes_written: ::cty::c_int,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for cbor_encoder_writer {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                cbor_encoder_writer {
                write: ref __self_0_0, bytes_written: ref __self_0_1 } => {
                    let mut debug_trait_builder =
                        f.debug_struct("cbor_encoder_writer");
                    let _ =
                        debug_trait_builder.field("write", &&(*__self_0_0));
                    let _ =
                        debug_trait_builder.field("bytes_written",
                                                  &&(*__self_0_1));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for cbor_encoder_writer { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for cbor_encoder_writer {
        #[inline]
        fn clone(&self) -> cbor_encoder_writer {
            {
                let _: ::core::clone::AssertParamIsClone<cbor_encoder_write>;
                let _: ::core::clone::AssertParamIsClone<::cty::c_int>;
                *self
            }
        }
    }
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct cbor_iovec {
        pub iov_base: *mut ::cty::c_void,
        pub iov_len: usize,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for cbor_iovec {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                cbor_iovec { iov_base: ref __self_0_0, iov_len: ref __self_0_1
                } => {
                    let mut debug_trait_builder =
                        f.debug_struct("cbor_iovec");
                    let _ =
                        debug_trait_builder.field("iov_base",
                                                  &&(*__self_0_0));
                    let _ =
                        debug_trait_builder.field("iov_len", &&(*__self_0_1));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for cbor_iovec { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for cbor_iovec {
        #[inline]
        fn clone(&self) -> cbor_iovec {
            {
                let _: ::core::clone::AssertParamIsClone<*mut ::cty::c_void>;
                let _: ::core::clone::AssertParamIsClone<usize>;
                *self
            }
        }
    }
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct CborEncoder {
        pub writer: *mut cbor_encoder_writer,
        pub writer_arg: *mut ::cty::c_void,
        pub added: usize,
        pub flags: ::cty::c_int,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for CborEncoder {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                CborEncoder {
                writer: ref __self_0_0,
                writer_arg: ref __self_0_1,
                added: ref __self_0_2,
                flags: ref __self_0_3 } => {
                    let mut debug_trait_builder =
                        f.debug_struct("CborEncoder");
                    let _ =
                        debug_trait_builder.field("writer", &&(*__self_0_0));
                    let _ =
                        debug_trait_builder.field("writer_arg",
                                                  &&(*__self_0_1));
                    let _ =
                        debug_trait_builder.field("added", &&(*__self_0_2));
                    let _ =
                        debug_trait_builder.field("flags", &&(*__self_0_3));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for CborEncoder { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for CborEncoder {
        #[inline]
        fn clone(&self) -> CborEncoder {
            {
                let _:
                        ::core::clone::AssertParamIsClone<*mut cbor_encoder_writer>;
                let _: ::core::clone::AssertParamIsClone<*mut ::cty::c_void>;
                let _: ::core::clone::AssertParamIsClone<usize>;
                let _: ::core::clone::AssertParamIsClone<::cty::c_int>;
                *self
            }
        }
    }
    pub const CborIndefiniteLength: usize = 4294967295;
    extern "C" {
        pub fn cbor_encoder_init(encoder: *mut CborEncoder,
                                 pwriter: *mut cbor_encoder_writer,
                                 flags: ::cty::c_int);
    }
    extern "C" {
        pub fn cbor_encode_uint(encoder: *mut CborEncoder, value: u64)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_int(encoder: *mut CborEncoder, value: i64)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_negative_int(encoder: *mut CborEncoder,
                                        absolute_value: u64) -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_simple_value(encoder: *mut CborEncoder, value: u8)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_tag(encoder: *mut CborEncoder, tag: CborTag)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_text_string(encoder: *mut CborEncoder,
                                       string: *const ::cty::c_char,
                                       length: usize) -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_byte_string(encoder: *mut CborEncoder,
                                       string: *const u8, length: usize)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_byte_iovec(encoder: *mut CborEncoder,
                                      iov: *const cbor_iovec,
                                      iov_len: ::cty::c_int) -> CborError;
    }
    extern "C" {
        pub fn cbor_encode_floating_point(encoder: *mut CborEncoder,
                                          fpType: CborType,
                                          value: *const ::cty::c_void)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encoder_create_array(encoder: *mut CborEncoder,
                                         arrayEncoder: *mut CborEncoder,
                                         length: usize) -> CborError;
    }
    extern "C" {
        pub fn cbor_encoder_create_map(encoder: *mut CborEncoder,
                                       mapEncoder: *mut CborEncoder,
                                       length: usize) -> CborError;
    }
    extern "C" {
        pub fn cbor_encoder_create_indef_byte_string(encoder:
                                                         *mut CborEncoder,
                                                     stringEncoder:
                                                         *mut CborEncoder)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encoder_close_container(encoder: *mut CborEncoder,
                                            containerEncoder:
                                                *const CborEncoder)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_encoder_close_container_checked(encoder: *mut CborEncoder,
                                                    containerEncoder:
                                                        *const CborEncoder)
         -> CborError;
    }
    pub const CborParserIteratorFlags_CborIteratorFlag_IntegerValueTooLarge:
              CborParserIteratorFlags =
        1;
    pub const CborParserIteratorFlags_CborIteratorFlag_NegativeInteger:
              CborParserIteratorFlags =
        2;
    pub const CborParserIteratorFlags_CborIteratorFlag_UnknownLength:
              CborParserIteratorFlags =
        4;
    pub const CborParserIteratorFlags_CborIteratorFlag_ContainerIsMap:
              CborParserIteratorFlags =
        32;
    pub type CborParserIteratorFlags = u32;
    pub type cbor_reader_get8
        =
        ::core::option::Option<unsafe extern "C" fn(d:
                                                        *mut cbor_decoder_reader,
                                                    offset: ::cty::c_int)
                                   -> u8>;
    pub type cbor_reader_get16
        =
        ::core::option::Option<unsafe extern "C" fn(d:
                                                        *mut cbor_decoder_reader,
                                                    offset: ::cty::c_int)
                                   -> u16>;
    pub type cbor_reader_get32
        =
        ::core::option::Option<unsafe extern "C" fn(d:
                                                        *mut cbor_decoder_reader,
                                                    offset: ::cty::c_int)
                                   -> u32>;
    pub type cbor_reader_get64
        =
        ::core::option::Option<unsafe extern "C" fn(d:
                                                        *mut cbor_decoder_reader,
                                                    offset: ::cty::c_int)
                                   -> u64>;
    pub type cbor_memcmp
        =
        ::core::option::Option<unsafe extern "C" fn(d:
                                                        *mut cbor_decoder_reader,
                                                    buf: *mut ::cty::c_char,
                                                    offset: ::cty::c_int,
                                                    len: usize) -> usize>;
    pub type cbor_memcpy
        =
        ::core::option::Option<unsafe extern "C" fn(d:
                                                        *mut cbor_decoder_reader,
                                                    buf: *mut ::cty::c_char,
                                                    offset: ::cty::c_int,
                                                    len: usize) -> usize>;
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct cbor_decoder_reader {
        pub get8: cbor_reader_get8,
        pub get16: cbor_reader_get16,
        pub get32: cbor_reader_get32,
        pub get64: cbor_reader_get64,
        pub cmp: cbor_memcmp,
        pub cpy: cbor_memcpy,
        pub message_size: usize,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for cbor_decoder_reader {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                cbor_decoder_reader {
                get8: ref __self_0_0,
                get16: ref __self_0_1,
                get32: ref __self_0_2,
                get64: ref __self_0_3,
                cmp: ref __self_0_4,
                cpy: ref __self_0_5,
                message_size: ref __self_0_6 } => {
                    let mut debug_trait_builder =
                        f.debug_struct("cbor_decoder_reader");
                    let _ =
                        debug_trait_builder.field("get8", &&(*__self_0_0));
                    let _ =
                        debug_trait_builder.field("get16", &&(*__self_0_1));
                    let _ =
                        debug_trait_builder.field("get32", &&(*__self_0_2));
                    let _ =
                        debug_trait_builder.field("get64", &&(*__self_0_3));
                    let _ = debug_trait_builder.field("cmp", &&(*__self_0_4));
                    let _ = debug_trait_builder.field("cpy", &&(*__self_0_5));
                    let _ =
                        debug_trait_builder.field("message_size",
                                                  &&(*__self_0_6));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for cbor_decoder_reader { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for cbor_decoder_reader {
        #[inline]
        fn clone(&self) -> cbor_decoder_reader {
            {
                let _: ::core::clone::AssertParamIsClone<cbor_reader_get8>;
                let _: ::core::clone::AssertParamIsClone<cbor_reader_get16>;
                let _: ::core::clone::AssertParamIsClone<cbor_reader_get32>;
                let _: ::core::clone::AssertParamIsClone<cbor_reader_get64>;
                let _: ::core::clone::AssertParamIsClone<cbor_memcmp>;
                let _: ::core::clone::AssertParamIsClone<cbor_memcpy>;
                let _: ::core::clone::AssertParamIsClone<usize>;
                *self
            }
        }
    }
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct CborParser {
        pub d: *mut cbor_decoder_reader,
        pub end: ::cty::c_int,
        pub flags: ::cty::c_int,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for CborParser {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                CborParser {
                d: ref __self_0_0, end: ref __self_0_1, flags: ref __self_0_2
                } => {
                    let mut debug_trait_builder =
                        f.debug_struct("CborParser");
                    let _ = debug_trait_builder.field("d", &&(*__self_0_0));
                    let _ = debug_trait_builder.field("end", &&(*__self_0_1));
                    let _ =
                        debug_trait_builder.field("flags", &&(*__self_0_2));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for CborParser { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for CborParser {
        #[inline]
        fn clone(&self) -> CborParser {
            {
                let _:
                        ::core::clone::AssertParamIsClone<*mut cbor_decoder_reader>;
                let _: ::core::clone::AssertParamIsClone<::cty::c_int>;
                let _: ::core::clone::AssertParamIsClone<::cty::c_int>;
                *self
            }
        }
    }
    #[repr(C)]
    #[rustc_copy_clone_marker]
    pub struct CborValue {
        pub parser: *const CborParser,
        pub offset: ::cty::c_int,
        pub remaining: u32,
        pub extra: u16,
        pub type_: u8,
        pub flags: u8,
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::fmt::Debug for CborValue {
        fn fmt(&self, f: &mut ::core::fmt::Formatter) -> ::core::fmt::Result {
            match *self {
                CborValue {
                parser: ref __self_0_0,
                offset: ref __self_0_1,
                remaining: ref __self_0_2,
                extra: ref __self_0_3,
                type_: ref __self_0_4,
                flags: ref __self_0_5 } => {
                    let mut debug_trait_builder = f.debug_struct("CborValue");
                    let _ =
                        debug_trait_builder.field("parser", &&(*__self_0_0));
                    let _ =
                        debug_trait_builder.field("offset", &&(*__self_0_1));
                    let _ =
                        debug_trait_builder.field("remaining",
                                                  &&(*__self_0_2));
                    let _ =
                        debug_trait_builder.field("extra", &&(*__self_0_3));
                    let _ =
                        debug_trait_builder.field("type_", &&(*__self_0_4));
                    let _ =
                        debug_trait_builder.field("flags", &&(*__self_0_5));
                    debug_trait_builder.finish()
                }
            }
        }
    }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::marker::Copy for CborValue { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    impl ::core::clone::Clone for CborValue {
        #[inline]
        fn clone(&self) -> CborValue {
            {
                let _: ::core::clone::AssertParamIsClone<*const CborParser>;
                let _: ::core::clone::AssertParamIsClone<::cty::c_int>;
                let _: ::core::clone::AssertParamIsClone<u32>;
                let _: ::core::clone::AssertParamIsClone<u16>;
                let _: ::core::clone::AssertParamIsClone<u8>;
                let _: ::core::clone::AssertParamIsClone<u8>;
                *self
            }
        }
    }
    extern "C" {
        pub fn cbor_parser_init(d: *mut cbor_decoder_reader,
                                flags: ::cty::c_int, parser: *mut CborParser,
                                it: *mut CborValue) -> CborError;
    }
    extern "C" {
        pub fn cbor_value_advance_fixed(it: *mut CborValue) -> CborError;
    }
    extern "C" {
        pub fn cbor_value_advance(it: *mut CborValue) -> CborError;
    }
    extern "C" {
        pub fn cbor_value_enter_container(it: *const CborValue,
                                          recursed: *mut CborValue)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_value_leave_container(it: *mut CborValue,
                                          recursed: *const CborValue)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_value_get_int64_checked(value: *const CborValue,
                                            result: *mut i64) -> CborError;
    }
    extern "C" {
        pub fn cbor_value_get_int_checked(value: *const CborValue,
                                          result: *mut ::cty::c_int)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_value_skip_tag(it: *mut CborValue) -> CborError;
    }
    extern "C" {
        pub fn cbor_value_calculate_string_length(value: *const CborValue,
                                                  length: *mut usize)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_value_text_string_equals(value: *const CborValue,
                                             string: *const ::cty::c_char,
                                             result: *mut bool) -> CborError;
    }
    extern "C" {
        pub fn cbor_value_map_find_value(map: *const CborValue,
                                         string: *const ::cty::c_char,
                                         element: *mut CborValue)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_value_get_half_float(value: *const CborValue,
                                         result: *mut ::cty::c_void)
         -> CborError;
    }
    extern "C" {
        pub fn cbor_value_to_pretty_advance(out: *mut FILE,
                                            value: *mut CborValue)
         -> CborError;
    }
    pub const CborMajorTypes_UnsignedIntegerType: CborMajorTypes = 0;
    pub const CborMajorTypes_NegativeIntegerType: CborMajorTypes = 1;
    pub const CborMajorTypes_ByteStringType: CborMajorTypes = 2;
    pub const CborMajorTypes_TextStringType: CborMajorTypes = 3;
    pub const CborMajorTypes_ArrayType: CborMajorTypes = 4;
    pub const CborMajorTypes_MapType: CborMajorTypes = 5;
    pub const CborMajorTypes_TagType: CborMajorTypes = 6;
    pub const CborMajorTypes_SimpleTypesType: CborMajorTypes = 7;
    pub type CborMajorTypes = u32;
    pub const CborSimpleTypes_FalseValue: CborSimpleTypes = 20;
    pub const CborSimpleTypes_TrueValue: CborSimpleTypes = 21;
    pub const CborSimpleTypes_NullValue: CborSimpleTypes = 22;
    pub const CborSimpleTypes_UndefinedValue: CborSimpleTypes = 23;
    pub const CborSimpleTypes_SimpleTypeInNextByte: CborSimpleTypes = 24;
    pub const CborSimpleTypes_HalfPrecisionFloat: CborSimpleTypes = 25;
    pub const CborSimpleTypes_SinglePrecisionFloat: CborSimpleTypes = 26;
    pub const CborSimpleTypes_DoublePrecisionFloat: CborSimpleTypes = 27;
    pub const CborSimpleTypes_Break: CborSimpleTypes = 31;
    pub type CborSimpleTypes = u32;
}
mod sensor {
    //!  Import the Mynewt Sensor API and export the safe version of the API. Based on
    //!  `repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h`
    ///  Register a sensor listener. This allows a calling application to receive
    ///  callbacks for data from a given sensor object. This is the safe version of `sensor_register_listener()`
    ///  that copies the listener locally before passing to Mynewt.
    ///
    ///  For more information on the type of callbacks available, see the documentation
    ///  for the sensor listener structure.
    ///
    ///  `sensor`: The sensor to register a listener on.
    ///  `listener`: The listener to register onto the sensor.
    ///  Return 0 on success, non-zero error code on failure.
    pub fn register_listener(sensor: SensorPtr, listener: SensorListener)
     -> i32 {
        unsafe {
            if !(LISTENER_INTERNAL.sl_sensor_type == 0) {
                {
                    ::core::panicking::panic(&("assertion failed: LISTENER_INTERNAL.sl_sensor_type == 0",
                                               "src/sensor.rs", 15u32, 14u32))
                }
            }
        };
        unsafe { LISTENER_INTERNAL = listener };
        unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) }
    }
    ///  Define the listener function to be called after polling the sensor.
    ///  This is a static mutable copy of the listener passed in through `register_listener`.
    ///  Must be static so it won't go out of scope.  Must be mutable so that Rust won't move it while Mynewt is using it.
    static mut LISTENER_INTERNAL: SensorListener =
        SensorListener{sl_sensor_type: 0,
                       sl_func: null_sensor_data_func,
                       sl_arg: 0,
                       sl_next: 0,};
    ///  Define a dummy sensor data function in case there is none.
    extern "C" fn null_sensor_data_func(_sensor: SensorPtr, _arg: SensorArg,
                                        _sensor_data: SensorDataPtr,
                                        _sensor_type: SensorType) -> i32 {
        0
    }
    ///  Import the Mynewt Sensor API for C.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
    #[link(name = "hw_sensor")]
    extern "C" {
        ///  Set the sensor poll rate.
        ///  `devname`: Name of the sensor.
        ///  `poll_rate`: The poll rate in milli seconds.
        pub fn sensor_set_poll_rate_ms(devname: *const u8, poll_rate: u32)
         -> i32;
        ///  Search the sensor list and find the next sensor that corresponds
        ///  to a given device name.
        ///  `devname`: The device name to search for.
        ///  `sensor`: The previous sensor found with this device name.
        ///  Return 0 on success, non-zero error code on failure
        pub fn sensor_mgr_find_next_bydevname(devname: *const u8,
                                              prev_cursor: SensorPtr)
         -> SensorPtr;
        ///  Register a sensor listener. This allows a calling application to receive
        ///  callbacks for data from a given sensor object.
        ///
        ///  For more information on the type of callbacks available, see the documentation
        ///  for the sensor listener structure.
        ///
        ///  `sensor`: The sensor to register a listener on.
        ///  `listener`: The listener to register onto the sensor.
        ///  Return 0 on success, non-zero error code on failure.
        pub fn sensor_register_listener(sensor: SensorPtr,
                                        listener: *mut SensorListener) -> i32;
    }
    ///  Import the Mynewt SensorListener struct for C, which defines the listener function to be called after polling a sensor.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
    #[repr(C)]
    pub struct SensorListener {
        ///  The type of sensor data to listen for, this is interpreted as a
        ///  mask, and this listener is called for all sensor types on this
        ///  sensor that match the mask.
        pub sl_sensor_type: SensorType,
        ///  Sensor data handler function, called when has data
        pub sl_func: SensorDataFunc,
        ///  Argument for the sensor listener
        pub sl_arg: SensorArg,
        ///  Next item in the sensor listener list.  The head of this list is
        ///  contained within the sensor object.
        pub sl_next: u32,
    }
    ///  Data representing a singular read from a temperature sensor. All values are in Deg C.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/temperature.h
    #[repr(C, packed)]
    pub struct SensorTempData {
        pub std_temp: f32,
        pub std_temp_is_valid: u8,
    }
    ///  Mynewt User-Defined Sensor Type 1.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
    pub const SENSOR_TYPE_USER_DEFINED_1: SensorType = (1 << 26);
    ///  Mynewt Sensor Value Types.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
    pub const SENSOR_VALUE_TYPE_OPAQUE: i32 = 0;
    pub const SENSOR_VALUE_TYPE_INT32: i32 = 1;
    pub const SENSOR_VALUE_TYPE_FLOAT: i32 = 2;
    ///  Mynewt Sensor Types.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
    pub type SensorDataFunc
        =
        extern "C" fn(SensorPtr, SensorArg, SensorDataPtr, SensorType) -> i32;
    pub type SensorType = i64;
    pub type SensorArg = i32;
    pub type SensorPtr = *const CVoid;
    pub type SensorMutPtr = *mut CVoid;
    pub type SensorDataPtr = *const CVoid;
    ///  Declare a pointer to the Mynewt `os_dev` struct.  The contents are hidden.
    pub type DevicePtr = *const CVoid;
    ///  Declare the void C type.  From https://github.com/hashmismatch/freertos.rs/blob/master/src/base.rs
    #[repr(u32)]
    pub enum CVoid { _Variant1, _Variant2, }
    unsafe impl Send for CVoid { }
    ///  Mynewt error codes.
    ///  Must sync with repos/apache-mynewt-core/sys/defs/include/defs/error.h
    pub const SYS_EOK: i32 = 0;
    pub const SYS_ENOMEM: i32 = -1;
    pub const SYS_EINVAL: i32 = -2;
    pub const SYS_ETIMEOUT: i32 = -3;
    pub const SYS_ENOENT: i32 = -4;
    pub const SYS_EIO: i32 = -5;
    pub const SYS_EAGAIN: i32 = -6;
    pub const SYS_EACCES: i32 = -7;
    pub const SYS_EBUSY: i32 = -8;
    pub const SYS_ENODEV: i32 = -9;
    pub const SYS_ERANGE: i32 = -10;
    pub const SYS_EALREADY: i32 = -11;
    pub const SYS_ENOTSUP: i32 = -12;
    pub const SYS_EUNKNOWN: i32 = -13;
    pub const SYS_EREMOTEIO: i32 = -14;
    pub const SYS_EDONE: i32 = -15;
    pub const SYS_EPERUSER: i32 = -65535;
}
mod listen_sensor {
    //!  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
    //!  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
    //!       This sensor is selected if BME280_OFB is defined in syscfg.yml.
    //!  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
    //!       This sensor is selected if TEMP_STM32 is defined in syscfg.yml.
    //!  If this is the Collector Node, send the sensor data to the CoAP Server after polling.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/listen_sensor.c`
    use cty::*;
    use cstr_core::CStr;
    use crate::base::*;
    use crate::sensor::*;
    use crate::send_coap::send_sensor_data;
    ///  Poll every 10,000 milliseconds (10 seconds)  
    const SENSOR_POLL_TIME: u32 = (10 * 1000);
    ///  Indicate that this is a listener callback
    const LISTENER_CB: SensorArg = 1;
    ///  For Sensor Node and Standalone Node: Start polling the temperature sensor 
    ///  every 10 seconds in the background.  After polling the sensor, call the 
    ///  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
    ///  or CoAP Server (is this is a Standalone Node).
    ///  For Collector Node: Start the Listeners for Remote Sensor 
    ///  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
    ///  Return 0 if successful.
    pub fn start_sensor_listener() -> i32 {
        console_print(b"TMP poll \n");
        let rc =
            unsafe {
                sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME)
            };
        if !(rc == 0) {
            {
                ::core::panicking::panic(&("assertion failed: rc == 0",
                                           "src/listen_sensor.rs", 35u32,
                                           5u32))
            }
        };
        let listen_sensor =
            unsafe {
                sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor())
            };
        if !!unsafe { is_null_sensor(listen_sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: !unsafe { is_null_sensor(listen_sensor) }",
                                           "src/listen_sensor.rs", 39u32,
                                           5u32))
            }
        };
        let listener =
            SensorListener{sl_sensor_type: TEMP_SENSOR_TYPE,
                           sl_func: read_temperature,
                           sl_arg: LISTENER_CB,
                           sl_next: 0,};
        let rc = register_listener(listen_sensor, listener);
        if !(rc == 0) {
            {
                ::core::panicking::panic(&("assertion failed: rc == 0",
                                           "src/listen_sensor.rs", 51u32,
                                           5u32))
            }
        };
        0
    }
    ///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
    ///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
    ///  If this is a Sensor Node, we send the sensor data to the Collector Node.
    ///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    ///  Return 0 if we have processed the sensor data successfully.
    extern "C" fn read_temperature(sensor: SensorPtr, _arg: SensorArg,
                                   sensor_data: SensorDataPtr,
                                   sensor_type: SensorType) -> i32 {
        unsafe {
            console_print(b"read_temperature\n");
            if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }
            if !!is_null_sensor(sensor) {
                {
                    ::core::panicking::panic(&("assertion failed: !is_null_sensor(sensor)",
                                               "src/listen_sensor.rs", 76u32,
                                               9u32))
                }
            };
            let device = sensor_get_device(sensor);
            let c_buf: *const c_char = device_get_name(device);
            let device_name: &CStr = CStr::from_ptr(c_buf);
            let temp_sensor_value = get_temperature(sensor_data, sensor_type);
            if !(temp_sensor_value.val_type != 0) {
                {
                    ::core::panicking::panic(&("assertion failed: temp_sensor_value.val_type != 0",
                                               "src/listen_sensor.rs", 87u32,
                                               9u32))
                }
            };
            if temp_sensor_value.val_type == 0 { return -1; }
            let rc = send_sensor_data(&temp_sensor_value, device_name);
            if rc == SYS_EAGAIN {
                console_print(b"TMP network not ready\n");
                return 0;
            }
            if !(rc == 0) {
                {
                    ::core::panicking::panic(&("assertion failed: rc == 0",
                                               "src/listen_sensor.rs", 103u32,
                                               9u32))
                }
            };
        }
        0
    }
    ///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
    ///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
    ///  the raw or computed temperature, as well as the key and value type.
    fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType)
     -> SensorValue {
        let mut return_value =
            SensorValue{key: b"\0".as_ptr(),
                        val_type: 0,
                        int_val: 0,
                        float_val: 0.0,};
        unsafe {
            match sensor_type {
                SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {
                    let mut rawtempdata =
                        SensorTempRawData{strd_temp_raw: 0,
                                          strd_temp_raw_is_valid: 0,};
                    let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
                    if !(rc == 0) {
                        {
                            ::core::panicking::panic(&("assertion failed: rc == 0",
                                                       "src/listen_sensor.rs",
                                                       129u32, 17u32))
                        }
                    };
                    if rawtempdata.strd_temp_raw_is_valid == 0 {
                        return return_value;
                    }
                    return_value.int_val = rawtempdata.strd_temp_raw as u16;
                    console_print(b"TMP listener got rawtmp \n");
                }
                SENSOR_TYPE_AMBIENT_TEMPERATURE => {
                    let mut tempdata =
                        SensorTempData{std_temp: 0.0, std_temp_is_valid: 0,};
                    let rc = get_temp_data(sensor_data, &mut tempdata);
                    if !(rc == 0) {
                        {
                            ::core::panicking::panic(&("assertion failed: rc == 0",
                                                       "src/listen_sensor.rs",
                                                       145u32, 17u32))
                        }
                    };
                    if tempdata.std_temp_is_valid == 0 {
                        return return_value;
                    }
                    return_value.float_val = tempdata.std_temp;
                }
                _ => {
                    if !false {
                        {
                            ::core::panicking::panic(&("assertion failed: false",
                                                       "src/listen_sensor.rs",
                                                       159u32, 17u32))
                        }
                    };
                    return return_value;
                }
            }
            return_value.key = TEMP_SENSOR_KEY;
            return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
        };
        return_value
    }
}
mod send_coap {
    use cstr_core::CStr;
    use crate::base::*;
    use crate::sensor::*;
    use crate::tinycbor::*;
    fn send_sensor_data_without_encoding() {
        ();
        "a b c";
        ();
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
    }
    fn send_sensor_data_json() {
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
    }
    fn send_sensor_data_cbor() {
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        ();
        let payload =
            {
                "begin cbor root";
                let root = "root";
                {
                    "begin coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        cbor_encoder_create_map(&g_encoder, &root_map,
                                                CborIndefiniteLength);
                        "end oc_rep_start_root_object";
                    };
                    {
                        " >>  >> int_sensor_value >> ,";
                        "TODO : extract key , value from _sensor_value : int_sensor_value and add to\n_object : root";
                        "--------------------";
                        {
                            "begin coap_set_int_val , parent : root , val : int_sensor_value";
                            "> TODO : assert ( int_sensor_value . val_type == SENSOR_VALUE_TYPE_INT32 )";
                            {
                                "begin oc_rep_set_int , object: root, key: int_sensor_value.key, value: 1234, child: root_map";
                                cbor_encode_text_string(&root_map,
                                                        int_sensor_value.key,
                                                        int_sensor_value.key.len());
                                cbor_encode_int(&root_map, 1234);
                                "end oc_rep_set_int";
                            };
                            "end coap_set_int_val";
                        };
                        "--------------------";
                    };
                    {
                        "begin oc_rep_end_root_object";
                        cbor_encoder_close_container(&g_encoder, &root_map);
                        "end oc_rep_end_root_object";
                    };
                    "end coap_root";
                };
                "end cbor root";
                "return cbor root to caller";
                root
            };
        ();
    }
    static mut g_encoder: CborEncoder = CborEncoder{};
    static mut root_map: CborEncoder = CborEncoder{};
    fn test_macro2() {
        let root = "root_var";
        let values = "values_var";
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        {
            "begin coap_set_int_val , parent : root , val : int_sensor_value";
            "> TODO : assert ( int_sensor_value . val_type == SENSOR_VALUE_TYPE_INT32 )";
            {
                "begin oc_rep_set_int , object: root, key: int_sensor_value.key, value: 1234, child: root_map";
                cbor_encode_text_string(&root_map, int_sensor_value.key,
                                        int_sensor_value.key.len());
                cbor_encode_int(&root_map, 1234);
                "end oc_rep_set_int";
            };
            "end coap_set_int_val";
        };
    }
    ///  TODO: Start the Network Task in the background.  The Network Task prepares the network drivers
    ///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
    ///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
    ///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
    pub fn start_network_task() -> Result<(), i32> {
        console_print(b"start_network_task\n");
        send_sensor_data_without_encoding();
        send_sensor_data_json();
        send_sensor_data_cbor();
        Ok(())
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
    pub fn send_sensor_data(_val: *const SensorValue,
                            _sensor_node: &'static CStr) -> i32 {
        console_print(b"send_sensor_data\n");
        0
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use crate::base::*;
use crate::listen_sensor::*;
use crate::send_coap::*;
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
pub extern "C" fn main() -> ! {
    unsafe { rust_sysinit() };
    unsafe { console_flush() };
    let rc = start_network_task();
    rc.expect("");
    let rc = start_sensor_listener();
    if !(rc == 0) {
        {
            ::core::panicking::panic(&("assertion failed: rc == 0",
                                       "src/lib.rs", 42u32, 40u32))
        }
    };
    loop  { unsafe { os_eventq_run(os_eventq_dflt_get()) } }
}
///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    if let Some(location) = info.location() {
        let file = location.file();
        let line = location.line();
        console_print(b"panic at ");
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
        console_print(b" line 0x");
        unsafe { console_printhex(line as u8) }
        console_print(b"\n");
        unsafe { console_flush() }
    } else {
        console_print(b"panic unknown loc\n");
        unsafe { console_flush() }
    }
    bkpt();
    loop  { }
}
