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
//!  Main Rust Application for PineTime with Apache Mynewt OS
#![no_std]                              //  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]               //  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]              //  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(proc_macro_hygiene)]         //  Allow Procedural Macros like `run!()`
#![feature(exclusive_range_pattern)]    //  Allow ranges like `0..128` in `match` statements

//  Declare the libraries that contain macros
extern crate cortex_m;                  //  Declare the external library `cortex_m`
extern crate mynewt;                    //  Declare the Mynewt library
extern crate macros as mynewt_macros;   //  Declare the Mynewt Procedural Macros library

//  Declare the modules in our application
mod app_network;    //  Declare `app_network.rs` as Rust module `app_network` for Application Network functions
mod app_sensor;     //  Declare `app_sensor.rs` as Rust module `app_sensor` for Application Sensor functions
mod touch_sensor;   //  Declare `touch_sensor.rs` as Rust module `touch_sensor` for Touch Sensor functions

//  Declare the system modules
use core::panic::PanicInfo; //  Import `PanicInfo` type which is used by `panic()` below
use cortex_m::asm::bkpt;    //  Import cortex_m assembly function to inject breakpoint
use mynewt::{
    fill_zero,
    kernel::os,             //  Import Mynewt OS API
    sys::console,           //  Import Mynewt Console API
};
use watchface::{            //  Import Watch Face Framework
    WatchFace,
};

/// Declare the Watch Face Type
type WatchFaceType = barebones_watchface::BarebonesWatchFace;

/// Watch Face for the app
static mut WATCH_FACE: WatchFaceType = fill_zero!(WatchFaceType);

//  #[cfg(not(any(feature = "ui_app")))]  //  TODO: If no UI app is enabled...
pub fn handle_touch(_x: u16, _y: u16) { console::print("touch not handled\n"); console::flush(); }  //  Define a touch handler that does nothing

///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                 //  Don't mangle the name "main"
extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
    //  Initialise the Mynewt packages and internal temperature sensor driver. Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c
    mynewt::sysinit();

    //  Start Bluetooth LE, including over-the-air firmware upgrade.  TODO: Create a safe wrapper for starting Bluetooth LE.
    extern { fn start_ble() -> i32; }
    let rc = unsafe { start_ble() };
    assert!(rc == 0, "BLE fail");

    //  Create the watch face
    unsafe {  //  Unsafe because WATCH_FACE is a mutable static  
        WATCH_FACE = WatchFaceType::new()
            .expect("Create watch face fail");
    }

    //  Start rendering the watch face every minute in Rust.
    /*
    watchface::start_watch_face()
        .expect("Watch Face fail");
    */

    //  Render LVGL watch face in C.
    //  extern { fn create_watch_face() -> i32; }  //  Defined in apps/my_sensor_app/src/watch_face.c
    //  let rc = unsafe { create_watch_face() };
    //  assert!(rc == 0, "Watch Face fail");

    //  Render LVGL widgets in C for testing.
    //  extern { fn pinetime_lvgl_mynewt_test() -> i32; }  //  Defined in libs/pinetime_lvgl_mynewt/src/pinetime/lvgl.c
    //  let rc = unsafe { pinetime_lvgl_mynewt_test() };
    //  assert!(rc == 0, "LVGL test fail");

    //  Render LVGL display.
    //  extern { fn pinetime_lvgl_mynewt_render() -> i32; }  //  Defined in libs/pinetime_lvgl_mynewt/src/pinetime/lvgl.c
    //  let rc = unsafe { pinetime_lvgl_mynewt_render() };
    //  assert!(rc == 0, "LVGL render fail");    

    //  Main event loop. Don't add anything to the event loop because Bluetooth LE is extremely time sensitive.
    loop {                            //  Loop forever...
        os::eventq_run(               //  Processing events...
            os::eventq_dflt_get()     //  From default event queue.
                .expect("GET fail")
        ).expect("RUN fail");
    }
    //  Never comes here
}

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    //  Display the filename and line number to the Semihosting Console.
    console::print("panic ");
    if let Some(location) = info.location() {
        let file = location.file();
        let line = location.line();
        console::print("at ");       console::buffer(&file);
        console::print(" line ");    console::printint(line as i32);
        console::print("\n");        console::flush();
    } else {
        console::print("no loc\n");  console::flush();
    }

    //  Display the payload.
    if unsafe { !IN_PANIC } {  //  Prevent panic loop while displaying the payload
        unsafe { IN_PANIC = true };
        let payload = info.payload().downcast_ref::<&str>().unwrap();
        console::print(payload);  console::print("\n");  console::flush();    
    }

    //  Pause in the debugger.
    bkpt();

    //  Restart the device.
    extern { fn HardFault_Handler(); }  //  Defined in apps/my_sensor_app/src/support.c
    unsafe { HardFault_Handler() };

    //  Will never come here. This is needed to satisfy the return type "!"
    loop {}
}

/// Set to true if we are already in the panic handler
static mut IN_PANIC: bool = false;