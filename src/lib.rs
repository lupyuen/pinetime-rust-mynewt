#![no_std]

// pick a panicking behavior
extern crate panic_halt; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// extern crate panic_abort; // requires nightly
// extern crate panic_itm; // logs messages over ITM; requires ITM support
// extern crate panic_semihosting; // logs messages to the host stderr; requires a debugger

mod base;
mod listen_sensor;
mod send_coap;

use cortex_m_rt::entry;
use crate::base::*;
use crate::listen_sensor::*;
use crate::send_coap::*;

#[entry]
fn main() -> ! {
    //  Init Mynewt system.
    unsafe {
        rust_sysinit();
        console_flush();

        //#if defined(SERVER_NETWORK_INTERFACE) || defined(SENSOR_NETWORK_INTERFACE)  //  If the ESP8266 or nRF24L01 is enabled...
        //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
        //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
        //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
        let rc1 = start_network_task();  assert!(rc1 == 0);
        //#endif  //  NETWORK_DEVICE

        //#ifdef SENSOR_DEVICE   //  If BME280 or internal temperature sensor is enabled...
        //  Starting polling the temperature sensor every 10 seconds in the background.  
        //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
        //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.
        let rc2 = start_sensor_listener();  assert!(rc2 == 0);
        //#endif  //  SENSOR_DEVICE

        //  Main event loop
        loop {                //  Loop forever...
            os_eventq_run(            //  Process events...
                os_eventq_dflt_get()  //  From default event queue.
            );
        }
    }
    //  Never comes here.
}

/*
    //  Message to be displayed.
    let msg = "Testing 123\n";
    let buf = msg.as_bytes();
    let len = buf.len();

    //  Display message on Arm Semihosting console (openocd).
    unsafe {
        console_buffer(buf.as_ptr(), len as u32);
        console_flush();
    }
*/
