#![feature(prelude_import)]
#![no_std]
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
//!  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server over NB-IoT.
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/main.c`

#![no_std]
//  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]
//  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]
//  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(const_transmute)]
//  Allow `transmute` for initialising Mynewt structs
#![feature(proc_macro_hygiene)]
//  Allow Procedural Macros like `run!()`
#![feature(custom_attribute)]
#[prelude_import]
use ::core::prelude::v1::*;
#[macro_use]
extern crate core as core;
#[macro_use]
extern crate compiler_builtins as compiler_builtins;
//  Allow Custom Attributes like `#[safe_wrap]`

extern crate cortex_m;
//  Declare the external library `cortex_m`
extern crate mynewt;
//  Declare the Mynewt library
extern crate macros as proc_macros;
//  Declare the Mynewt Procedural Macros library

//  Suppress warnings of unused constants and vars
#[allow(dead_code)]
mod app_base {
    //  Declare `app_base.rs` as Rust module `app_base`

    //  Declare `app_sensor.rs` as Rust module `app_sensor`
    //  Declare `app_network.rs` as Rust module `app_network`

    //  Import `PanicInfo` type which is used by `panic()` below
    //  Import cortex_m assembly function to inject breakpoint
    //  Import Mynewt OS API
    //  Import Mynewt Sensor Network Library
    //  Import `app_base.rs` for common declarations

    //  Don't mangle the name "main"
    //  Declare extern "C" because it will be called by Mynewt
    //  Initialise the Mynewt packages and BME280 / temp_stm32 temperature sensor driver.
    //  Start the CoAP / OIC Background Task to transmit CoAP messages.  Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysinit-app.c


    //  Starting polling the temperature sensor every 10 seconds in the background.

    //  Start the Server Transport for sending sensor data to CoAP Server over NB-IoT.

    //  Main event loop
    //  Loop forever...
    //  Processing events...
    //  From default event queue.
    //  Never comes here.

    //  Display the filename and line number to the Semihosting Console.
    //  TODO: Print in decimal not hex. Allow more than 255 lines.
    //  Pause in the debugger.
    //  Loop forever so that device won't restart.
    //!  Common declarations for the application.  Includes custom sensor declarations.
    use cty::c_char;
    use mynewt::kernel::os::os_dev;
    use mynewt::hw::sensor::{self, sensor_ptr, sensor_data_ptr,
                             sensor_temp_data, sensor_type_t};
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
        pub fn get_temp_raw_data(sensor_data: sensor_data_ptr,
                                 dest: *mut sensor_temp_raw_data) -> i32;
        ///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
        ///  Copy the sensor data into `dest`.  Return 0 if successful.
        ///  C API: `int get_temp_data(void *sensor_data, struct sensor_temp_data *dest)`
        pub fn get_temp_data(sensor_data: sensor_data_ptr,
                             dest: *mut sensor_temp_data) -> i32;
        ///  Return the Mynewt device for the Mynewt sensor.
        ///  C API: `struct os_dev *sensor_get_device(struct sensor *s)`
        pub fn sensor_get_device(sensor: sensor_ptr) -> *mut os_dev;
        ///  Return the name for the Mynewt device.  Assumes name is non-null.
        ///  C API: `const char *device_get_name(struct os_dev *device)`
        pub fn device_get_name(device: *mut os_dev) -> *const c_char;
        ///  Return the NULL sensor.
        ///  C API: `struct sensor *null_sensor(void)`
        pub fn null_sensor() -> sensor_ptr;
        ///  Return non-zero if sensor is NULL.
        ///  C API: `int is_null_sensor(struct sensor *p)`
        pub fn is_null_sensor(sensor: sensor_ptr) -> bool;
        ///  Return non-zero if sensor data is NULL.
        ///  C API: `int is_null_sensor_data(void *p)`
        pub fn is_null_sensor_data(sensor_data: sensor_data_ptr) -> bool;
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
    ///  We will open internal temperature sensor `temp_stm32_0`.
    ///  Must sync with apps/my_sensor_app/src/listen_sensor.h
    pub const SENSOR_DEVICE: *const c_char = TEMP_STM32_DEVICE;
    pub const TEMP_STM32_DEVICE: *const c_char =
        b"temp_stm32_0\0".as_ptr() as *const c_char;
    ///  Set to raw sensor type
    pub const TEMP_SENSOR_TYPE: sensor_type_t =
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;
    ///  Return integer sensor values
    pub const TEMP_SENSOR_VALUE_TYPE: i32 =
        sensor::SENSOR_VALUE_TYPE_INT32 as i32;
    ///  Use key (field name) `t` to transmit raw temperature to CoAP Server or Collector Node
    pub const TEMP_SENSOR_KEY: &str = "t";
    ///  Sensor type for raw temperature sensor.
    ///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
    pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: sensor_type_t =
        sensor::sensor_type_t_SENSOR_TYPE_USER_DEFINED_1;
    ///  Represents a decoded sensor data value. Since temperature may be integer (raw)
    ///  or float (computed), we use the struct to return both integer and float values.
    pub struct SensorValue {
        ///  Null-terminated string for the key.  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
        pub key: &'static str,
        ///  The type of the sensor value and the value.
        pub val: SensorValueType,
    }
    ///  Default sensor value is `None`
    impl Default for SensorValue {
        #[inline]
        fn default() -> SensorValue {
            SensorValue{key: "", val: SensorValueType::None,}
        }
    }
    ///  Represents the type and value of a sensor data value.
    pub enum SensorValueType {

        ///  No value.
        None,

        ///  32-bit unsigned integer. For raw temp, contains the raw temp integer value
        Uint(u32),

        ///  32-bit float. For computed temp, contains the computed temp float value
        Float(f32),
    }
    ///  Represents a single temperature sensor raw value.
    ///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
    #[repr(C, packed)]
    pub struct sensor_temp_raw_data {
        ///  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
        pub strd_temp_raw: u32,
        ///  1 if data is valid
        pub strd_temp_raw_is_valid: u8,
    }
}
mod app_sensor {
    //!  Poll the temperature sensor every 10 seconds. Transmit the sensor data to the CoAP server after polling.
    use cstr_core::CStr;
    use cty::c_char;
    use proc_macros::{out, strn, init_strn};
    use mynewt::{result::*,
                 hw::sensor::{self, sensor_ptr, sensor_arg, sensor_data_ptr,
                              sensor_listener, sensor_temp_data,
                              sensor_type_t}, fill_zero, Strn};
    use crate::app_base::*;
    use crate::app_network::send_sensor_data;
    ///  Sensor to be polled
    static SENSOR_DEVICE: Strn = Strn{bytestr: b"temp_stm32_0\0",};
    ///  Poll sensor every 10,000 milliseconds (10 seconds)  
    const SENSOR_POLL_TIME: u32 = (10 * 1000);
    ///  Ask Mynewt to poll the temperature sensor every 10 seconds and call `handle_sensor_data()`.
    ///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
    pub fn start_sensor_listener() -> MynewtResult<()> {
        console_print(b"Rust TMP poll \n");
        sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME)?;
        let sensor =
            sensor::mgr_find_next_bydevname(&SENSOR_DEVICE,
                                            unsafe { null_sensor() })?;
        if !unsafe { !is_null_sensor(sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !is_null_sensor(sensor) }",
                                           "rust/app/src/app_sensor.rs",
                                           56u32, 5u32))
            }
        };
        let listener =
            sensor_listener{sl_sensor_type: TEMP_SENSOR_TYPE,
                            sl_func:
                                sensor::as_untyped(handle_sensor_data),
                                                                          ..unsafe
                                                                            {
                                                                                ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_listener>()],
                                                                                                         sensor_listener>([0;
                                                                                                                              ::core::mem::size_of::<sensor_listener>()])
                                                                            }};
        sensor::register_listener(sensor, listener)?;
        Ok(())
    }
    ///  This listener function is called every 10 seconds by Mynewt to handle the polled sensor data.
    ///  Return 0 if we have handled the sensor data successfully.
    extern "C" fn handle_sensor_data(sensor: sensor_ptr, _arg: sensor_arg,
                                     sensor_data: sensor_data_ptr,
                                     sensor_type: sensor_type_t)
     -> MynewtError {
        console_print(b"Rust handle_sensor_data\n");
        if unsafe { is_null_sensor_data(sensor_data) } {
            return MynewtError::SYS_EINVAL;
        }
        if !unsafe { !is_null_sensor(sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !is_null_sensor(sensor) }",
                                           "rust/app/src/app_sensor.rs",
                                           80u32, 5u32))
            }
        };
        let sensor_value = get_temperature(sensor_data, sensor_type);
        if let SensorValueType::None = sensor_value.val {
            if !false {
                {
                    ::core::panicking::panic(&("assertion failed: false",
                                               "rust/app/src/app_sensor.rs",
                                               84u32, 55u32))
                }
            };
        }
        let rc = send_sensor_data(&sensor_value);
        if let Err(err) = rc {
            if err == MynewtError::SYS_EAGAIN {
                console_print(b"TMP network not ready\n");
                return MynewtError::SYS_EOK;
            }
        }
        MynewtError::SYS_EOK
    }
    ///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
    ///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
    ///  the raw or computed temperature, as well as the key and value type.
    #[allow(unreachable_patterns)]
    #[allow(unused_variables)]
    fn get_temperature(sensor_data: sensor_data_ptr,
                       sensor_type: sensor_type_t) -> SensorValue {
        let mut return_value = SensorValue::default();
        match sensor_type {
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {
                let mut rawtempdata =
                    unsafe {
                        ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_temp_raw_data>()],
                                                 sensor_temp_raw_data>([0;
                                                                           ::core::mem::size_of::<sensor_temp_raw_data>()])
                    };
                let rc =
                    unsafe {
                        get_temp_raw_data(sensor_data, &mut rawtempdata)
                    };
                if !(rc == 0) {
                    {
                        ::core::panicking::panic(&("assertion failed: rc == 0",
                                                   "rust/app/src/app_sensor.rs",
                                                   116u32, 13u32))
                    }
                };
                if rawtempdata.strd_temp_raw_is_valid == 0 {
                    return return_value;
                }
                return_value.val =
                    SensorValueType::Uint(rawtempdata.strd_temp_raw);
                console_print(b"TMP listener got rawtmp \n");
            }
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {
                let mut tempdata =
                    unsafe {
                        ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_temp_data>()],
                                                 sensor_temp_data>([0;
                                                                       ::core::mem::size_of::<sensor_temp_data>()])
                    };
                let rc = unsafe { get_temp_data(sensor_data, &mut tempdata) };
                if !(rc == 0) {
                    {
                        ::core::panicking::panic(&("assertion failed: rc == 0",
                                                   "rust/app/src/app_sensor.rs",
                                                   129u32, 13u32))
                    }
                };
                if tempdata.std_temp_is_valid() == 0 { return return_value; }
                return_value.val = SensorValueType::Float(tempdata.std_temp);
            }
            _ => {
                if !false {
                    {
                        ::core::panicking::panic(&("assertion failed: false",
                                                   "rust/app/src/app_sensor.rs",
                                                   143u32, 13u32))
                    }
                };
                return return_value;
            }
        }
        return_value.key = TEMP_SENSOR_KEY;
        return_value
    }
}
mod app_network {
    //!  Transmit sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
    //!  The sensor data will be transmitted over NB-IoT.
    //!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
    //!  fixes response parsing bugs.  The patched file must be present in that location.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/send_coap.c`
    use cstr_core::CStr;
    use cty::*;
    use proc_macros::{out, strn, init_strn};
    use mynewt::{result::*,
                 kernel::os::{self, os_task, os_stack_t, os_task_func_t,
                              os_time_t},
                 encoding::{coap_context::{self, COAP_CONTEXT,
                                           ToBytesOptionalNull}, tinycbor},
                 libs::{mynewt_rust, sensor_network,
                        sensor_coap::{self, sensor_value}}, coap, d,
                 fill_zero, NULL, Out, Ptr, Strn};
    use crate::app_base::*;
    /// Compose a CoAP JSON message with the Sensor Key (field name) and Value in `val`
    /// and send to the CoAP server.  The message will be enqueued for transmission by the CoAP / OIC 
    /// Background Task so this function will return without waiting for the message to be transmitted.
    /// Return `Ok()` if successful, `SYS_EAGAIN` if network is not ready yet.
    /// For the CoAP server hosted at thethings.io, the CoAP payload should be encoded in JSON like this:
    /// ```json
    /// {"values":[
    ///   {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    ///   {"key":"t",      "value":1715}
    /// ]}
    /// ```
    pub fn send_sensor_data(val: &SensorValue) -> MynewtResult<()> {
        console_print(b"Rust send_sensor_data\n");
        if let SensorValueType::None = val.val {
            if !false {
                {
                    ::core::panicking::panic(&("assertion failed: false",
                                               "rust/app/src/app_network.rs",
                                               71u32, 46u32))
                }
            };
        }
        let rc = sensor_network::init_server_post(&Strn::new(b"\0"))?;
        if !rc { return Err(MynewtError::SYS_EAGAIN); }
        let _payload =
            {
                "begin cbor root";
                {
                    "begin cbor coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        (/*ERROR*/);
                        "end oc_rep_start_root_object";
                    };
                    {
                        {
                            "begin cbor coap_array , object : COAP_CONTEXT , key : values";
                            {
                                "begin oc_rep_set_array , object: COAP_CONTEXT, key: values, child: COAP_CONTEXT_map";
                                let key_with_opt_null: &[u8] =
                                    values.to_bytes_optional_nul();
                                (/*ERROR*/)
                            };
                            {
                                " >>  >> val >> ,";
                                "--------------------";
                                {
                                    "begin cbor coap_set_int_val , c : COAP_CONTEXT , val : val";
                                    if let SensorValueType::Uint(val) =
                                           val.val {
                                        "-- cinte c: COAP_CONTEXT, k: val.key, v: val";
                                        let key_with_opt_null: &[u8] =
                                            val.key.to_bytes_optional_nul();
                                        let value = val as i64;
                                        unsafe {
                                            let encoder =
                                                COAP_CONTEXT.encoder("COAP_CONTEXT",
                                                                     "_map");
                                            let res =
                                                tinycbor::cbor_encode_text_string(encoder,
                                                                                  COAP_CONTEXT.key_to_cstr(key_with_opt_null),
                                                                                  COAP_CONTEXT.cstr_len(key_with_opt_null));
                                            COAP_CONTEXT.check_result(res);
                                            let res =
                                                tinycbor::cbor_encode_int(encoder,
                                                                          value);
                                            COAP_CONTEXT.check_result(res);
                                        };
                                    } else {
                                        unsafe {
                                            COAP_CONTEXT.fail(coap_context::CoapError::VALUE_NOT_UINT)
                                        };
                                    }
                                    "end cbor coap_set_int_val";
                                };
                                "--------------------";
                            };
                            {
                                "begin oc_rep_close_array , object: COAP_CONTEXT, key: values, child: COAP_CONTEXT_map";
                                {
                                    "begin oc_rep_end_array , parent: COAP_CONTEXT_map, key: values, child: values_array";
                                    unsafe {
                                        let encoder =
                                            COAP_CONTEXT.encoder("COAP_CONTEXT",
                                                                 "_array");
                                        cbor_encoder_close_container(&mut COAP_CONTEXT,
                                                                     &mut COAP_CONTEXT_map)
                                    };
                                    "end oc_rep_end_array";
                                };
                                "end oc_rep_close_array";
                            };
                            "end cbor coap_array";
                        };
                    };
                    {
                        "begin oc_rep_end_root_object";
                        (/*ERROR*/);
                        "end oc_rep_end_root_object";
                    };
                    "end cbor coap_root";
                };
                "end cbor root";
                ()
            };
        sensor_network::do_server_post()?;
        console_print(b"NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n");
        Ok(())
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use mynewt::kernel::os;
use mynewt::libs::sensor_network;
use crate::app_base::*;
///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
extern "C" fn main() -> ! {
    unsafe { app_base::rust_sysinit(); console_flush() };
    app_sensor::start_sensor_listener().expect("TMP fail");
    sensor_network::start_server_transport().expect("NET fail");
    loop  {
        os::eventq_run(os::eventq_dflt_get().expect("GET fail")).expect("RUN fail");
    }
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
