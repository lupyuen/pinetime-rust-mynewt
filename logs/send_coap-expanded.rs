    use cstr_core::CStr;
    use crate::base::*;
    use crate::tinycbor::*;
    fn send_sensor_data_without_encoding() {
        ();
        "a b c";
        ();
        let int_sensor_value =
            SensorValueNew{key: int_sensor_key,
                           val: SensorValueType::Uint(2870),};
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
    }
    fn send_sensor_data_json() {
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: int_sensor_key,
                           val: SensorValueType::Uint(2870),};
    }
    fn send_sensor_data_cbor() {
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        const k: &'static [u8] = b"t\0";
        const k2: &'static str = "t";
        cbor_encode_text_string(&mut root_map, int_sensor_value.key.as_ptr(),
                                int_sensor_value.key.len());
        cbor_encode_int(&mut root_map, 1234);
        ();
        let payload =
            {
                "begin cbor root";
                let root = "root";
                {
                    "begin coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        cbor_encoder_create_map(&mut g_encoder, &mut root_map,
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
                                cbor_encode_text_string(&mut root_map,
                                                        int_sensor_value.key,
                                                        int_sensor_value.key.len());
                                cbor_encode_int(&mut root_map, 1234);
                                "end oc_rep_set_int";
                            };
                            "end coap_set_int_val";
                        };
                        "--------------------";
                    };
                    {
                        "begin oc_rep_end_root_object";
                        cbor_encoder_close_container(&mut g_encoder,
                                                     &mut root_map);
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
    ///  Defined in repos/apache-mynewt-core/net/oic/src/api/oc_rep.c
    #[link(name = "net_oic")]
    extern "C" {
        static mut g_encoder: CborEncoder;
        static mut root_map: CborEncoder;
    }
    ///  Null-terminated string "t".
    const int_sensor_key: &'static [u8] = b"t\0";
    ///  Null-terminated string "tmp".
    const float_sensor_key: &'static [u8] = b"tmp\0";
    fn test_macro2() {
        let root = "root_var";
        let values = "values_var";
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: int_sensor_key,
                           val: SensorValueType::Uint(2870),};
        {
            "begin coap_set_int_val , parent : root , val : int_sensor_value";
            "> TODO : assert ( int_sensor_value . val_type == SENSOR_VALUE_TYPE_INT32 )";
            {
                "begin oc_rep_set_int , object: root, key: int_sensor_value.key, value: 1234, child: root_map";
                cbor_encode_text_string(&mut root_map, int_sensor_value.key,
                                        int_sensor_value.key.len());
                cbor_encode_int(&mut root_map, 1234);
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
