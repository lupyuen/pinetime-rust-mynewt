//!  Send sensor data to a CoAP Server or a Collector Node.  The CoAP payload will be encoded as JSON
//!  for CoAP Server and CBOR for Collector Node.  The sensor data will be transmitted to 
//!  CoAP Server over WiFi via the ESP8266 transceiver, and to Collector Node via nRF24L01 transceiver.
//!  This enables transmission of Sensor Data to a local Sensor Network (via nRF24L01)
//!  and to the internet (via ESP8266).  For sending to Collector Node we use raw temperature (integer) 
//!  instead of computed temperature (floating-point) to make the encoding simpler and faster.
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/send_coap.c`

use cstr_core::CStr;             //  Import string utilities from `cstr_core` library: https://crates.io/crates/cstr_core
use crate::base;              //  Import `base.rs` for common declarations
use crate::mynewt::encoding::tinycbor;  //  Import `mynewt/tinycbor.rs` for TinyCBOR C API
use crate::mynewt::kernel::os::{ self, os_task, os_stack_t };        //  Import `mynewt/os.rs` for Mynewt `kernel/os` API
use crate::mynewt::libs::sensor_network;      //  Import `mynewt/sensor_network.rs` for Mynewt `sensor_network` library
use crate::mynewt::{ MynewtResult, g_encoder, root_map };  //  Import Mynewt TinyCBOR encoder and root map

///////////////////////////////////////////////////////////////////////////////
//  Network Task

///  Storage for Network Task: Mynewt task object will be saved here.
static mut NETWORK_TASK: os_task = fill_zero!(os_task);
///  Stack space for Network Task, initialised to 0.
static mut NETWORK_TASK_STACK: [os_stack_t; NETWORK_TASK_STACK_SIZE] = 
  [0; NETWORK_TASK_STACK_SIZE];
///  Size of the stack (in 4-byte units). Previously `OS_STACK_ALIGN(256)`  
const NETWORK_TASK_STACK_SIZE: usize = 256;  
///  Set to true when network tasks have been completed
static mut NETWORK_IS_READY: bool = false;

///  Start the Network Task in the background.  The Network Task prepares the network drivers
///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
pub fn start_network_task() -> MynewtResult<()>  {  //  Returns an error code upon error.
    console_print(b"NET start\n");
    let rc = unsafe { os::os_task_init( //  Create a new task and start it...
        &mut NETWORK_TASK,            //  Task object will be saved here.
        b"network\0".as_ptr(),        //  Name of task.
        Some(network_task_func),      //  Function to execute when task starts.
        0 as *mut ::cty::c_void,      //  Argument to be passed to above function.
        10,  //  Task priority: highest is 0, lowest is 255.  Main task is 127.
        os::OS_WAIT_FOREVER as u32,       //  Don't do sanity / watchdog checking.
        NETWORK_TASK_STACK.as_ptr() as *mut os_stack_t,  //  Stack space for the task.
        NETWORK_TASK_STACK_SIZE as u16) };  //  Size of the stack (in 4-byte units).
    assert_eq!(rc, 0);
    Ok(())
}

///  Network Task runs this function in the background to prepare the network drivers
///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  Also perform WiFi Geolocation if it is enabled.
///  For Collector Node and Standalone Node: We connect the ESP8266 to the WiFi access point. 
///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
///  Register the ESP8266 driver as the network transport for CoAP Server.  
///  For Collector Node and Sensor Nodes: We register the nRF24L01 driver as the network transport for 
///  CoAP Collector.
extern "C" fn network_task_func(_arg: *mut ::cty::c_void) {
    console_print(b"NET start\n");  assert!(unsafe { !NETWORK_IS_READY });

    //  For Standalone Node and Collector Node: Connect ESP8266 to WiFi Access Point and register the ESP8266 driver as the network transport for CoAP Server.
    //  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
    if unsafe { 
        sensor_network::is_standalone_node() || 
        sensor_network::is_collector_node() 
        } {
        let rc = unsafe { sensor_network::register_server_transport() };  assert_eq!(rc, 0);
    }

    //  For Collector Node and Sensor Nodes: Register the nRF24L01 driver as the network transport for CoAP Collector.
    if unsafe { 
        sensor_network::is_collector_node() || 
        sensor_network::is_sensor_node() 
        } {
        let rc = unsafe { sensor_network::register_collector_transport() };  assert_eq!(rc, 0);
    }

    //  Network Task has successfully started the ESP8266 or nRF24L01 transceiver. The Sensor Listener will still continue to
    //  run in the background and send sensor data to the server.
    unsafe { NETWORK_IS_READY = true; }  //  Indicate that network is ready.

    loop {  //  Loop forever...        
        console_print(b"NET free mbuf %d\n");  //  , os_msys_num_free());  //  Display number of free mbufs, to catch CoAP memory leaks.
        unsafe { os::os_time_delay(10 * os::OS_TICKS_PER_SEC); }                   //  Wait 10 seconds before repeating.
    }
    //  Never comes here.  If this task function terminates, the program will crash.
}

///  Compose a CoAP message (CBOR or JSON) with the sensor value in `val` and transmit to the
///  Collector Node (if this is a Sensor Node) or to the CoAP Server (if this is a Collector Node
///  or Standalone Node).  
///  For Sensor Node or Standalone Node: sensor_node is the sensor name (`bme280_0` or `temp_stm32_0`)
///  For Collector Node: sensor_node is the Sensor Node Address of the Sensor Node that transmitted
///  the sensor data (like `b3b4b5b6f1`)
///  The message will be enqueued for transmission by the CoAP / OIC Background Task 
///  so this function will return without waiting for the message to be transmitted.  
///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
pub fn send_sensor_data(sensor_val: &SensorValue, sensor_node: &CStr) -> MynewtResult<()>  {  //  Returns an error code upon error.
    console_print(b"send_sensor_data\n");
    //  TODO: Remove val
    let mut val = fill_zero!(sensor_value);
    //  For Sensor Node: Transmit the sensor data to the Collector Node as CBOR.
    if unsafe { sensor_network::should_send_to_collector(&mut val, sensor_node.as_ptr()) } { 
        return send_sensor_data_to_collector(sensor_val, sensor_node); 
    }
    //  For Collector Node and Standalone Node: Transmit the sensor data to the CoAP Server as CoAP JSON.
    send_sensor_data_to_server(sensor_val, sensor_node)
}

///////////////////////////////////////////////////////////////////////////////
//  For Collector Node or Standalone Node: Send Sensor Data to CoAP Server (ESP8266)

///  Compose a CoAP JSON message with the Sensor Key (field name) and Value in val 
///  and send to the CoAP server and URI.  The Sensor Value may be integer or float.
///  For temperature, the Sensor Key is either `t` for raw temperature (integer, from 0 to 4095) 
///  or `tmp` for computed temperature (float).
///  The message will be enqueued for transmission by the CoAP / OIC 
///  Background Task so this function will return without waiting for the message 
///  to be transmitted.  Return 0 if successful, `SYS_EAGAIN` if network is not ready yet.
///  For the CoAP server hosted at thethings.io, the CoAP payload should be encoded in JSON like this:
///  ```
///  {"values":[
///    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
///    {"key":"tmp",    "value":28.7},
///    {"key":"...",    "value":... },
///    ... ]}
///  ```
fn send_sensor_data_to_server(sensor_val: &SensorValue, node_id: &CStr) -> MynewtResult<()>  {  //  Returns an error code upon error.
    if let SensorValueType::None = sensor_val.val { assert!(false); }
    //  assert!(node_id.to_str().unwrap().len() > 0);
    assert_ne!(node_id.to_bytes()[0], 0);
    if unsafe { !NETWORK_IS_READY } { return Err(MynewtError::SYS_EAGAIN); }  //  If network is not ready, tell caller (Sensor Listener) to try later.
    let device_id = unsafe { sensor_network::get_device_id() };  assert_ne!(device_id, 0 as *const ::cty::c_char);

    //  Start composing the CoAP Server message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    let rc = unsafe { sensor_network::init_server_post(0 as *const c_char) };  assert!(rc);

    //  Compose the CoAP Payload in JSON using the coap!() macro.
    let _payload = coap!(@json {
        //  Create "values" as an array of items under the root.
        //  Append to the "values" array:
        //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
        "device": device_id,
        //    {"key":"node", "value":"b3b4b5b6f1"},
        "node":   node_id,
        //  Append to the "values" array the Sensor Key and Sensor Value, depending on the value type:
        //    {"key":"t",   "value":2870} for raw temperature (integer)
        //    {"key":"tmp", "value":28.7} for computed temperature (float)
        sensor_val,
    });

    //  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    let rc = unsafe { sensor_network::do_server_post() };  assert!(rc);

    console_print(b"NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n");  //  , device_id);
    //  console_printf("NET send data: tmp "); console_printfloat(tmp); console_printf("\n");  ////

    //  The CoAP Background Task will call oc_tx_ucast() in the ESP8266 driver to 
    //  transmit the message: libs/esp8266/src/transport.cpp
    Ok(())
}

///////////////////////////////////////////////////////////////////////////////
//  For Sensor Node: Send Sensor Data to Collector Node (nRF24L01)

///  Compose a CoAP CBOR message with the Sensor Key (field name) and Value in val and 
///  transmit to the Collector Node.  The Sensor Value should be integer not float since
///  we transmit integers only to the Collector Node.
///  For temperature, the Sensor Key is `t` for raw temperature (integer, from 0 to 4095).
///  The message will be enqueued for transmission by the CoAP / OIC 
///  Background Task so this function will return without waiting for the message 
///  to be transmitted.  Return 0 if successful, `SYS_EAGAIN` if network is not ready yet.
///  The CoAP payload needs to be very compact (under 32 bytes) so it will be encoded in CBOR like this:
///  `{ t: 2870 }`
fn send_sensor_data_to_collector(sensor_val: &SensorValue, _node_id: &CStr) -> MynewtResult<()>  {  //  Returns an error code upon error.
    ////  TODO: if let SensorValueType::None = sensor_val.val { assert!(false); }
    if unsafe { !NETWORK_IS_READY } { return Err(SYS_EAGAIN); }  //  If network is not ready, tell caller (Sensor Listener) to try later.

    //  Start composing the CoAP Collector message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    let rc = unsafe { init_collector_post() };  assert!(rc);

    //  Compose the CoAP Payload in CBOR using the `coap!()` macro.
    let _payload = coap!(@cbor {
        //  Set the Sensor Key and integer Sensor Value, e.g. `{ t: 2870 }`
        sensor_val,
    });

    //  Post the CoAP Collector message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    let rc = unsafe { do_collector_post() };  assert!(rc);

    console_print(b"NRF send to collector: rawtmp %d\n");  //  , val->int_val);  ////

    //  The CoAP Background Task will call oc_tx_ucast() in the nRF24L01 driver to 
    //  transmit the message: libs/nrf24l01/src/transport.cpp
    Ok(())
}

/*
fn send_sensor_data_cbor() {
  //  Sensor `t` has int value 2870.
  let int_sensor_value = SensorValue {
    key: "t",
    val: SensorValueType::Uint(2870)
  };
  //  Compose the CoAP Payload in CBOR using the `coap` macro.
  trace_macros!(true);
  let payload = coap!(@cbor {
    int_sensor_value,    //  Send `{t: 2870}`
  });
  trace_macros!(false);
}

///  Null-terminated string "t".
const int_sensor_key: &'static [u8] = b"t\0";
///  Null-terminated string "tmp".
const float_sensor_key: &'static [u8] = b"tmp\0";
const k: &'static [u8] = b"t\0";
const k2: &'static str = "t";
cbor_encode_text_string(&mut root_map,
                        int_sensor_value.key.as_ptr(),
                        int_sensor_value.key.len());
cbor_encode_int(&mut root_map, 1234);
*/

/*
fn send_sensor_data_without_encoding() {
  trace_macros!(true);   //  Start tracing macros
  d!(a b c);             //  Will expand to "a b c" (for debugging)
  trace_macros!(false);  //  Stop tracing macros

  //  Sensor `t` has int value 2870.
  let int_sensor_value = SensorValue {
    key: "t",
    val: SensorValueType::Uint(2870)
  };
  let device_id = b"0102030405060708090a0b0c0d0e0f10";
  let node_id =   b"b3b4b5b6f1";

  //  Compose the CoAP Payload without encoding using the `coap` macro.
  trace_macros!(true);   //  Start tracing macros
  let payload = coap!(@none {
    "device": device_id,
    "node":   node_id,
    int_sensor_value,  //  Send `{t: 2870}`
  });
  trace_macros!(false);  //  Stop tracing macros
}

fn send_sensor_data_json() {
  let device_id = b"0102030405060708090a0b0c0d0e0f10";
  let node_id  =  b"b3b4b5b6f1";

  //  Sensor `t` has int value 2870.
  let int_sensor_value = SensorValue {
    key: "t",
    val: SensorValueType::Uint(2870)
  };
  //  Compose the CoAP Payload in JSON using the `coap` macro.
  trace_macros!(true);
  let payload = coap!(@json {
    //  "device": device_id,
    //  "node":   node_id,
    int_sensor_value,  //  Send `{t: 2870}`
  });
  trace_macros!(false);
}


//  static mut g_encoder: CborEncoder = CborEncoder{};
static mut root_map: CborEncoder = CborEncoder{  //  TODO: Prevent concurrent access.
  writer: 0 as *mut cbor_encoder_writer,
  writer_arg: 0 as *mut ::cty::c_void,
  added: 0,
  flags: 0,
};

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
  let int_sensor_value = SensorValue {
    key: "t",
    val: SensorValueType::Uint(2870)
  };

  coap_set_int_val! (@cbor root, int_sensor_value);
  coap_item_str! (@json values, "device", device_id);  ////
  coap_array! (@json root, values, {  //  Create "values" as an array of items under the root
    coap_item_str! (@json values, "device", device_id);
    coap_item_str! (@json values, "node", node_id);
    //  coap_set_int_val! (root, int_sensor_value);
  });  ////

  let payload = coap_root!(@json {  //  Create the payload root
    coap_array! (@json root, values, {  //  Create "values" as an array of items under the root
      //  Append to the "values" array:
      //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
      coap_item_str! (@json values, "device", device_id);

      //    {"key":"node", "value":"b3b4b5b6f1"},
      coap_item_str! (@json values, "node", node_id);

      //  For Sensor Node: Set the Sensor Key and integer Sensor Value, e.g. { t: 2870 }
      coap_set_int_val! (@json root, int_sensor_value);
      
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
*/
