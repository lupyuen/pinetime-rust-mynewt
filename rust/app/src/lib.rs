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
#![feature(const_transmute)]            //  Allow `transmute` for initialising Mynewt structs
#![feature(proc_macro_hygiene)]         //  Allow Procedural Macros like `run!()`
#![feature(specialization)]             //  Allow Specialised Traits for druid UI library
#![feature(exclusive_range_pattern)]    //  Allow ranges like `0..128` in `match` statements

//  Declare the libraries that contain macros
extern crate cortex_m;                  //  Declare the external library `cortex_m`
extern crate mynewt;                    //  Declare the Mynewt library
extern crate macros as mynewt_macros;   //  Declare the Mynewt Procedural Macros library

//  Declare the modules in our application
mod app_network;    //  Declare `app_network.rs` as Rust module `app_network` for Application Network functions
mod app_sensor;     //  Declare `app_sensor.rs` as Rust module `app_sensor` for Application Sensor functions
mod touch_sensor;   //  Declare `touch_sensor.rs` as Rust module `touch_sensor` for Touch Sensor functions

//  Declare the optional modules depending on the options in `../Cargo.toml`
#[cfg(feature = "display_app")]  //  If graphics display app is enabled...
mod display;                     //  Include the graphics display app

#[cfg(feature = "ui_app")]       //  If druid UI app is enabled...
mod ui;                          //  Include the druid UI app

#[cfg(feature = "visual_app")]   //  If Visual Rust app is enabled...
#[allow(unused_variables)]       //  Don't warn about unused variables
mod visual;                      //  Include the Visual Rust app

#[cfg(feature = "chip8_app")]    //  If CHIP8 Emulator app is enabled...
mod chip8;                       //  Include the CHIP8 Emulator app

#[cfg(feature = "use_float")]    //  If floating-point is enabled...
mod gps_sensor;                  //  Include the GPS Sensor functions

//  Declare the system modules
use core::panic::PanicInfo; //  Import `PanicInfo` type which is used by `panic()` below
use cortex_m::asm::bkpt;    //  Import cortex_m assembly function to inject breakpoint
use mynewt::{
    kernel::os,             //  Import Mynewt OS API
    sys::console,           //  Import Mynewt Console API
};

//  Select the touch handler depending on the options in `../Cargo.toml`
#[cfg(feature = "ui_app")]      //  If druid UI app is enabled...
use ui::handle_touch;           //  Use the touch handler from druid UI app

#[cfg(feature = "visual_app")]  //  If Visual Rust app is enabled...
use visual::handle_touch;       //  Use the touch handler from the Visual Rust app

#[cfg(feature = "chip8_app")]   //  If CHIP8 Emulator app is enabled...
use chip8::handle_touch;        //  Use the touch handler from the CHIP8 Emulator app

#[cfg(not(any(feature = "ui_app", feature = "visual_app", feature = "chip8_app")))]  //  If neither druid UI app nor Visual Rust app are enabled...
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

    //  Write graphic image to SPI Flash. Must run before testing the display, to avoid contention for SPI port.
    //  extern { fn write_image() -> i32; }
    //  let rc = unsafe { write_image() };
    //  assert!(rc == 0, "IMG fail");
    
    //  Display image from SPI Flash. Must run before testing the display, to avoid contention for SPI port.
    /*
    extern { fn display_image() -> i32; }
    let rc = unsafe { display_image() };
    assert!(rc == 0, "IMG fail");
    */
    
    //  Test External SPI Flash. Must run before testing the display, to avoid contention for SPI port.
    extern { fn test_flash() -> i32; }
    let rc = unsafe { test_flash() };
    assert!(rc == 0, "FLASH fail");

    //  Start Bluetooth LE, including over-the-air firmware upgrade.  TODO: Create a safe wrapper for starting Bluetooth LE.
    extern { fn start_ble() -> i32; }
    let rc = unsafe { start_ble() };
    assert!(rc == 0, "BLE fail");

    //  Start the display
    druid::start_display()
        .expect("DSP fail");

    //  Test the display
    #[cfg(feature = "display_app")]  //  If graphics display app is enabled...
    display::test_display()
        .expect("DSP test fail");

    //  Start the touch sensor
    touch_sensor::start_touch_sensor()
        .expect("TCH fail");

    //  Test the touch sensor
    //  touch_sensor::test()
    //      .expect("TCH test fail");

    //  Launch the druid UI app
    #[cfg(feature = "ui_app")]  //  If druid UI app is enabled...
    ui::launch();

    //  Launch the Visual Rust app
    #[cfg(feature = "visual_app")]  //  If Visual Rust app is enabled...
    visual::on_start()
        .expect("VIS fail");

    //  Launch the CHIP8 Emulator app
    #[cfg(feature = "chip8_app")]  //  If CHIP8 Emulator app is enabled...
    chip8::on_start()
        .expect("CHIP8 fail");

    //  Main event loop
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
    //  Pause in the debugger.
    bkpt();
    //  Display the payload.
    console::print(info.payload().downcast_ref::<&str>().unwrap());
    console::print("\n");  console::flush();
    //  Loop forever so that device won't restart.
    loop {}
}