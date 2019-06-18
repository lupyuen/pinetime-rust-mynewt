    //!  Send sensor data to a CoAP Server or a Collector Node.  The CoAP payload will be encoded as JSON
    //!  for CoAP Server and CBOR for Collector Node.  The sensor data will be transmitted to 
    //!  CoAP Server over WiFi via the ESP8266 transceiver, and to Collector Node via nRF24L01 transceiver.
    //!  This enables transmission of Sensor Data to a local Sensor Network (via nRF24L01)
    //!  and to the internet (via ESP8266).  For sending to Collector Node we use raw temperature (integer) 
    //!  instead of computed temperature (floating-point) to make the encoding simpler and faster.
    //!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
    //!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/send_coap.c`
    use cstr_core::CStr;
    use crate::base::*;
    use crate::mynewt::tinycbor::*;
    use crate::mynewt::os::*;
    use crate::mynewt::sensor_network::*;
    use crate::mynewt::{g_encoder, root_map};
    fn send_sensor_data_cbor() {
        let int_sensor_value =
            SensorValue{key: "t", val: SensorValueType::Uint(2870),};
        ();
        let payload =
            {
                "begin cbor root";
                let root = "root";
                {
                    "begin coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        unsafe {
                            cbor_encoder_create_map(&mut g_encoder,
                                                    &mut root_map,
                                                    CborIndefiniteLength)
                        };
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
                                unsafe {
                                    cbor_encode_text_string(&mut root_map,
                                                            int_sensor_value.key.as_ptr(),
                                                            int_sensor_value.key.len());
                                    cbor_encode_int(&mut root_map, 1234);
                                }
                                "end oc_rep_set_int";
                            };
                            "end coap_set_int_val";
                        };
                        "--------------------";
                    };
                    {
                        "begin oc_rep_end_root_object";
                        unsafe {
                            cbor_encoder_close_container(&mut g_encoder,
                                                         &mut root_map);
                        }
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
    ///  Storage for Network Task: Mynewt task object will be saved here.
    static mut network_task: os_task =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<os_task>()],
                                     os_task>([0;
                                                  ::core::mem::size_of::<os_task>()])
        };
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
    pub fn start_network_task() -> Result<(), i32> {
        console_print(b"start_network_task\n");
        let rc =
            unsafe {
                os_task_init(&mut network_task, b"network\0".as_ptr(),
                             Some(network_task_func), 0 as *mut ::cty::c_void,
                             10, OS_WAIT_FOREVER as u32,
                             NETWORK_TASK_STACK.as_ptr() as *mut os_stack_t,
                             NETWORK_TASK_STACK_SIZE as u16)
            };
        {
            match (&rc, &0) {
                (left_val, right_val) => {
                    if !(*left_val == *right_val) {
                        {
                            ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left == right)`\n  left: `",
                                                                                          "`,\n right: `",
                                                                                          "`"],
                                                                                        &match (&&*left_val,
                                                                                                &&*right_val)
                                                                                             {
                                                                                             (arg0,
                                                                                              arg1)
                                                                                             =>
                                                                                             [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                           ::core::fmt::Debug::fmt),
                                                                                              ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                           ::core::fmt::Debug::fmt)],
                                                                                         }),
                                                         &("src/send_coap.rs",
                                                           77u32, 3u32))
                        }
                    }
                }
            }
        };
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
        console_print(b"NET start\n");
        if !unsafe { !NETWORK_IS_READY } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !NETWORK_IS_READY }",
                                           "src/send_coap.rs", 90u32, 34u32))
            }
        };
        if unsafe { is_standalone_node() } || unsafe { is_collector_node() } {
            let rc = unsafe { register_server_transport() };
            {
                match (&rc, &0) {
                    (left_val, right_val) => {
                        if !(*left_val == *right_val) {
                            {
                                ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left == right)`\n  left: `",
                                                                                              "`,\n right: `",
                                                                                              "`"],
                                                                                            &match (&&*left_val,
                                                                                                    &&*right_val)
                                                                                                 {
                                                                                                 (arg0,
                                                                                                  arg1)
                                                                                                 =>
                                                                                                 [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                               ::core::fmt::Debug::fmt),
                                                                                                  ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                               ::core::fmt::Debug::fmt)],
                                                                                             }),
                                                             &("src/send_coap.rs",
                                                               95u32, 53u32))
                            }
                        }
                    }
                }
            };
        }
        if unsafe { is_collector_node() } || unsafe { is_sensor_node() } {
            let rc = unsafe { register_collector_transport() };
            {
                match (&rc, &0) {
                    (left_val, right_val) => {
                        if !(*left_val == *right_val) {
                            {
                                ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left == right)`\n  left: `",
                                                                                              "`,\n right: `",
                                                                                              "`"],
                                                                                            &match (&&*left_val,
                                                                                                    &&*right_val)
                                                                                                 {
                                                                                                 (arg0,
                                                                                                  arg1)
                                                                                                 =>
                                                                                                 [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                               ::core::fmt::Debug::fmt),
                                                                                                  ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                               ::core::fmt::Debug::fmt)],
                                                                                             }),
                                                             &("src/send_coap.rs",
                                                               100u32, 56u32))
                            }
                        }
                    }
                }
            };
        }
        unsafe { NETWORK_IS_READY = true; }
        loop  {
            console_print(b"NET free mbuf %d\n");
            unsafe { os_time_delay(10 * OS_TICKS_PER_SEC); }
        }
        if !false {
            {
                ::core::panicking::panic(&("assertion failed: false",
                                           "src/send_coap.rs", 111u32, 2u32))
            }
        };
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
    pub fn send_sensor_data(sensor_val: &SensorValue, sensor_node: &CStr)
     -> i32 {
        console_print(b"send_sensor_data\n");
        let mut val =
            sensor_value{key: b"\0".as_ptr(),
                         val_type: 0,
                         int_val: 0,
                         float_val: 0.0,};
        if unsafe { should_send_to_collector(&mut val, sensor_node.as_ptr()) }
           {
            return send_sensor_data_to_collector(sensor_val, sensor_node);
        }
        send_sensor_data_to_server(sensor_val, sensor_node)
    }
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
    fn send_sensor_data_to_server(sensor_val: &SensorValue, node_id: &CStr)
     -> i32 {
        {
            match (&node_id.to_bytes()[0], &0) {
                (left_val, right_val) => {
                    if *left_val == *right_val {
                        {
                            ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left != right)`\n  left: `",
                                                                                          "`,\n right: `",
                                                                                          "`"],
                                                                                        &match (&&*left_val,
                                                                                                &&*right_val)
                                                                                             {
                                                                                             (arg0,
                                                                                              arg1)
                                                                                             =>
                                                                                             [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                           ::core::fmt::Debug::fmt),
                                                                                              ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                           ::core::fmt::Debug::fmt)],
                                                                                         }),
                                                         &("src/send_coap.rs",
                                                           161u32, 5u32))
                        }
                    }
                }
            }
        };
        if unsafe { !NETWORK_IS_READY } { return SYS_EAGAIN; }
        let device_id = unsafe { get_device_id() };
        {
            match (&device_id, &(0 as *const ::cty::c_char)) {
                (left_val, right_val) => {
                    if *left_val == *right_val {
                        {
                            ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left != right)`\n  left: `",
                                                                                          "`,\n right: `",
                                                                                          "`"],
                                                                                        &match (&&*left_val,
                                                                                                &&*right_val)
                                                                                             {
                                                                                             (arg0,
                                                                                              arg1)
                                                                                             =>
                                                                                             [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                           ::core::fmt::Debug::fmt),
                                                                                              ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                           ::core::fmt::Debug::fmt)],
                                                                                         }),
                                                         &("src/send_coap.rs",
                                                           163u32, 47u32))
                        }
                    }
                }
            }
        };
        let rc = unsafe { init_server_post(0 as *const ::cty::c_char) };
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "src/send_coap.rs", 168u32, 68u32))
            }
        };
        let rc = unsafe { do_server_post() };
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "src/send_coap.rs", 187u32, 44u32))
            }
        };
        console_print(b"NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n");
        0
    }
    ///  Compose a CoAP CBOR message with the Sensor Key (field name) and Value in val and 
    ///  transmit to the Collector Node.  The Sensor Value should be integer not float since
    ///  we transmit integers only to the Collector Node.
    ///  For temperature, the Sensor Key is `t` for raw temperature (integer, from 0 to 4095).
    ///  The message will be enqueued for transmission by the CoAP / OIC 
    ///  Background Task so this function will return without waiting for the message 
    ///  to be transmitted.  Return 0 if successful, `SYS_EAGAIN` if network is not ready yet.
    ///  The CoAP payload needs to be very compact (under 32 bytes) so it will be encoded in CBOR like this:
    ///  `{ t: 2870 }`
    fn send_sensor_data_to_collector(sensor_val: &SensorValue, node_id: &CStr)
     -> i32 {
        if unsafe { !NETWORK_IS_READY } { return SYS_EAGAIN; }
        let rc = unsafe { init_collector_post() };
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "src/send_coap.rs", 216u32, 49u32))
            }
        };
        let _payload =
            {
                "begin cbor root";
                let root = "root";
                {
                    "begin coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        unsafe {
                            cbor_encoder_create_map(&mut g_encoder,
                                                    &mut root_map,
                                                    CborIndefiniteLength)
                        };
                        "end oc_rep_start_root_object";
                    };
                    {
                        " >>  >> sensor_val >> ,";
                        "TODO : extract key , value from _sensor_value : sensor_val and add to _object\n: root";
                        "--------------------";
                        {
                            "begin coap_set_int_val , parent : root , val : sensor_val";
                            "> TODO : assert ( sensor_val . val_type == SENSOR_VALUE_TYPE_INT32 )";
                            {
                                "begin oc_rep_set_int , object: root, key: sensor_val.key, value: 1234, child: root_map";
                                unsafe {
                                    cbor_encode_text_string(&mut root_map,
                                                            sensor_val.key.as_ptr(),
                                                            sensor_val.key.len());
                                    cbor_encode_int(&mut root_map, 1234);
                                }
                                "end oc_rep_set_int";
                            };
                            "end coap_set_int_val";
                        };
                        "--------------------";
                    };
                    {
                        "begin oc_rep_end_root_object";
                        unsafe {
                            cbor_encoder_close_container(&mut g_encoder,
                                                         &mut root_map);
                        }
                        "end oc_rep_end_root_object";
                    };
                    "end coap_root";
                };
                "end cbor root";
                "return cbor root to caller";
                root
            };
        let rc = unsafe { do_collector_post() };
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "src/send_coap.rs", 227u32, 47u32))
            }
        };
        console_print(b"NRF send to collector: rawtmp %d\n");
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
                                       "src/lib.rs", 41u32, 40u32))
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
