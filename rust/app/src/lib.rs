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

#![no_std]  //  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]        //  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]       //  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(const_transmute)]     //  Allow `transmute` for initialising Mynewt structs
#![feature(proc_macro_hygiene)]  //  Allow Procedural Macros like `run!()`
#![feature(custom_attribute)]    //  Allow Custom Attributes like `#[safe_wrap]`

extern crate cortex_m;                  //  Declare the external library `cortex_m`
extern crate mynewt;                    //  Declare the Mynewt library
extern crate macros as proc_macros;     //  Declare the Mynewt Procedural Macros library

#[allow(dead_code)] //  Suppress warnings of unused constants and vars
mod app_base;           //  Declare `app_base.rs` as Rust module `app_base`

mod app_sensor;   //  Declare `app_sensor.rs` as Rust module `app_sensor`
mod app_network;  //  Declare `app_network.rs` as Rust module `app_network`

use core::panic::PanicInfo;         //  Import `PanicInfo` type which is used by `panic()` below
use cortex_m::asm::bkpt;            //  Import cortex_m assembly function to inject breakpoint
use mynewt::kernel::os;             //  Import Mynewt OS API
use mynewt::libs::sensor_network;   //  Import Mynewt Sensor Network Library
use crate::app_base::*;             //  Import `app_base.rs` for common declarations

///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                     //  Don't mangle the name "main"
extern "C" fn rust_main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
    //  Initialise the Mynewt packages and BME280 / temp_stm32 temperature sensor driver.
    //  Start the CoAP / OIC Background Task to transmit CoAP messages.  Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysinit-app.c
    unsafe { app_base::rust_sysinit(); console_flush() };

    //  Starting polling the temperature sensor every 10 seconds in the background.
    app_sensor::start_sensor_listener()
        .expect("TMP fail");

    //  Start the Server Transport for sending sensor data to CoAP Server over NB-IoT.
    sensor_network::start_server_transport()
        .expect("NET fail");

    //  Main event loop
    loop {                            //  Loop forever...
        os::eventq_run(               //  Processing events...
            os::eventq_dflt_get()     //  From default event queue.
                .expect("GET fail")
        ).expect("RUN fail");
    }
    //  Never comes here.
}

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    //  Display the filename and line number to the Semihosting Console.
    if let Some(location) = info.location() {
        let file = location.file();
        let line = location.line();
        console_print(b"panic at ");
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
        console_print(b" line 0x");
        unsafe { console_printhex(line as u8) }  //  TODO: Print in decimal not hex. Allow more than 255 lines.
        console_print(b"\n");
        unsafe { console_flush() }
    } else {
        console_print(b"panic unknown loc\n");
        unsafe { console_flush() }
    }
    //  Pause in the debugger.
    bkpt();
    //  Loop forever so that device won't restart.
    loop {}
}
