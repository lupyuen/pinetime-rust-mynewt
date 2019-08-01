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

mod app_sensor {
    //  Declare `app_sensor.rs` as Rust module `app_sensor` for Application Sensor functions
    //  Declare `app_network.rs` as Rust module `app_network` for Application Network functions

    //  Import `PanicInfo` type which is used by `panic()` below
    //  Import cortex_m assembly function to inject breakpoint
    //  Import Mynewt OS API
    //  Import Mynewt Console API
    //  Import Mynewt Sensor Network Library

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
    //!  Poll the temperature sensor every 10 seconds. Transmit the sensor data to the CoAP server after polling.
    use mynewt::{result::*,
                 hw::sensor::{self, sensor_ptr, sensor_arg, sensor_data_ptr,
                              sensor_listener, sensor_temp_data,
                              sensor_temp_raw_data, sensor_type_t,
                              SensorValue, SensorValueType}, sys::console,
                 fill_zero, Strn};
    use proc_macros::{init_strn};
    use crate::app_network::send_sensor_data;
    ///  Sensor to be polled
    static SENSOR_DEVICE: Strn = Strn{bytestr: b"temp_stm32_0\0",};
    ///  Poll sensor every 10,000 milliseconds (10 seconds)  
    const SENSOR_POLL_TIME: u32 = (10 * 1000);
    ///  Use key (field name) `t` to transmit raw temperature to CoAP Server
    const TEMP_SENSOR_KEY: &str = "t";
    ///  Set to raw sensor type
    const TEMP_SENSOR_TYPE: sensor_type_t =
        sensor::SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;
    ///  Ask Mynewt to poll the temperature sensor every 10 seconds and call `handle_sensor_data()`.
    ///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
    pub fn start_sensor_listener() -> MynewtResult<()> {
        console::print("Rust TMP poll \n");
        sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME)?;
        let sensor =
            sensor::mgr_find_next_bydevname(&SENSOR_DEVICE,
                                            unsafe {
                                                sensor::null_sensor()
                                            })?;
        if !unsafe { !sensor::is_null_sensor(sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !sensor::is_null_sensor(sensor) }",
                                           "rust/app/src/app_sensor.rs",
                                           61u32, 5u32))
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
        console::print("Rust handle_sensor_data\n");
        if unsafe { sensor::is_null_sensor_data(sensor_data) } {
            return MynewtError::SYS_EINVAL;
        }
        if !unsafe { !sensor::is_null_sensor(sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !sensor::is_null_sensor(sensor) }",
                                           "rust/app/src/app_sensor.rs",
                                           85u32, 5u32))
            }
        };
        let sensor_value = get_temperature(sensor_data, sensor_type);
        if let SensorValueType::None = sensor_value.val {
            if !false {
                {
                    ::core::panicking::panic(&("assertion failed: false",
                                               "rust/app/src/app_sensor.rs",
                                               89u32, 55u32))
                }
            };
        }
        let rc = send_sensor_data(&sensor_value);
        if let Err(err) = rc {
            if err == MynewtError::SYS_EAGAIN {
                console::print("TMP network not ready\n");
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
                        sensor::get_temp_raw_data(sensor_data,
                                                  &mut rawtempdata)
                    };
                if !(rc == 0) {
                    {
                        ::core::panicking::panic(&("assertion failed: rc == 0",
                                                   "rust/app/src/app_sensor.rs",
                                                   121u32, 13u32))
                    }
                };
                if rawtempdata.strd_temp_raw_is_valid == 0 {
                    return return_value;
                }
                return_value.val =
                    SensorValueType::Uint(rawtempdata.strd_temp_raw);
                console::print("TMP listener got rawtmp \n");
            }
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {
                let mut tempdata =
                    unsafe {
                        ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_temp_data>()],
                                                 sensor_temp_data>([0;
                                                                       ::core::mem::size_of::<sensor_temp_data>()])
                    };
                let rc =
                    unsafe {
                        sensor::get_temp_data(sensor_data, &mut tempdata)
                    };
                if !(rc == 0) {
                    {
                        ::core::panicking::panic(&("assertion failed: rc == 0",
                                                   "rust/app/src/app_sensor.rs",
                                                   134u32, 13u32))
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
                                                   148u32, 13u32))
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
    use mynewt::{result::*, hw::sensor::{SensorValue, SensorValueType},
                 sys::console,
                 encoding::{coap_context::{self, COAP_CONTEXT,
                                           ToBytesOptionalNull}, tinycbor},
                 libs::{sensor_network}, coap, d, Strn};
    use proc_macros::{strn};
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
        console::print("Rust send_sensor_data\n");
        if let SensorValueType::None = val.val {
            if !false {
                {
                    ::core::panicking::panic(&("assertion failed: false",
                                               "rust/app/src/app_network.rs",
                                               61u32, 46u32))
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
                        unsafe {
                            let encoder =
                                COAP_CONTEXT.encoder("root", "_map");
                            let res =
                                tinycbor::cbor_encoder_create_map(COAP_CONTEXT.global_encoder(),
                                                                  encoder,
                                                                  tinycbor::CborIndefiniteLength);
                            COAP_CONTEXT.check_result(res);
                        };
                        "end oc_rep_start_root_object";
                    };
                    {
                        {
                            "begin cbor coap_array , object : root , key : values";
                            {
                                "begin oc_rep_set_array , object: root, key: values, child: root_map";
                                let key_with_opt_null: &[u8] =
                                    "values".to_bytes_optional_nul();
                                unsafe {
                                    let encoder =
                                        COAP_CONTEXT.encoder("root", "_map");
                                    let res =
                                        tinycbor::cbor_encode_text_string(encoder,
                                                                          COAP_CONTEXT.key_to_cstr(key_with_opt_null),
                                                                          COAP_CONTEXT.cstr_len(key_with_opt_null));
                                    COAP_CONTEXT.check_result(res);
                                };
                                {
                                    "begin oc_rep_start_array , parent: root_map, key: values, child: values_array";
                                    unsafe {
                                        let parent_encoder =
                                            COAP_CONTEXT.encoder("root",
                                                                 "_map");
                                        let encoder =
                                            COAP_CONTEXT.encoder("values",
                                                                 "_array");
                                        let res =
                                            tinycbor::cbor_encoder_create_array(parent_encoder,
                                                                                encoder,
                                                                                tinycbor::CborIndefiniteLength);
                                        COAP_CONTEXT.check_result(res);
                                    };
                                    "end oc_rep_start_array";
                                };
                                "end oc_rep_set_array";
                            };
                            {
                                " >>  >> val >> ,";
                                "--------------------";
                                {
                                    "begin cbor coap_set_int_val , c : values , val : val";
                                    if let SensorValueType::Uint(val) =
                                           val.val {
                                        "-- cinte c: values, k: val.key, v: val";
                                        let key_with_opt_null: &[u8] =
                                            val.key.to_bytes_optional_nul();
                                        let value = val as i64;
                                        unsafe {
                                            let encoder =
                                                COAP_CONTEXT.encoder("values",
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
                                "begin oc_rep_close_array , object: root, key: values, child: root_map";
                                {
                                    "begin oc_rep_end_array , parent: root_map, key: values, child: values_array";
                                    unsafe {
                                        let parent_encoder =
                                            COAP_CONTEXT.encoder("root",
                                                                 "_map");
                                        let encoder =
                                            COAP_CONTEXT.encoder("values",
                                                                 "_array");
                                        let res =
                                            tinycbor::cbor_encoder_close_container(parent_encoder,
                                                                                   encoder);
                                        COAP_CONTEXT.check_result(res);
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
                        unsafe {
                            let encoder =
                                COAP_CONTEXT.encoder("root", "_map");
                            let res =
                                tinycbor::cbor_encoder_close_container(COAP_CONTEXT.global_encoder(),
                                                                       encoder);
                            COAP_CONTEXT.check_result(res);
                        };
                        "end oc_rep_end_root_object";
                    };
                    "end cbor coap_root";
                };
                "end cbor root";
                ()
            };
        sensor_network::do_server_post()?;
        console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n");
        Ok(())
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use mynewt::{kernel::os, sys::console, libs::sensor_network};
///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
extern "C" fn main() -> ! {
    mynewt::sysinit();
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
        console::print("panic at ");
        console::buffer(&file);
        console::print(" line 0x");
        console::printhex(line as u8);
        console::print("\n");
        console::flush();
    } else { console::print("panic unknown loc\n"); console::flush(); }
    bkpt();
    loop  { }
}
