//!  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server or Collector Node.
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/main.c`

#![no_std]                   //  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]    //  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]   //  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(const_transmute)] //  Allow `transmute` for initialising Mynewt structs
extern crate cortex_m;       //  Declare the external library `cortex_m`

#[macro_use]
mod mynewt;         //  Declare `mynewt/mod.rs` as Rust module `mynewt`. Use macros from the module.
mod base;           //  Declare `base.rs` as Rust module `base`
mod listen_sensor;  //  Declare `listen_sensor.rs` as Rust module `listen_sensor`
mod send_coap;      //  Declare `send_coap.rs` as Rust module `send_coap`

use core::panic::PanicInfo;     //  Import the PanicInfo type which is used by panic() below
use cortex_m::asm::bkpt;        //  Import the cortex_m assembly function to inject breakpoint
use crate::base::*;             //  Import base.rs for common declarations
use crate::listen_sensor::*;    //  Import listen_sensor.rs for polling the temperature sensor
use crate::send_coap::*;        //  Import send_coap.rs for sending sensor data

///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                     //  Don't mangle the name "main"
pub extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
    //  Init Mynewt system.
    unsafe { rust_sysinit()  };
    unsafe { console_flush() };

    //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
    start_network_task()
        .expect("NET fail");

    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
    //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.
    start_sensor_listener()
        .expect("TMP fail");

    //  Main event loop
    loop {                            //  Loop forever...
        unsafe {
            os_eventq_run(            //  Process events...
                os_eventq_dflt_get()  //  From default event queue.
            )
        }
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
