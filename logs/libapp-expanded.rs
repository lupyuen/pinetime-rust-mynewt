#![feature(prelude_import)]
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
#![feature(specialization)]
#[prelude_import]
use core::prelude::v1::*;
#[macro_use]
extern crate core;
#[macro_use]
extern crate compiler_builtins;
//  Allow Specialised Traits for druid UI library

//  Declare the libraries that contain macros
extern crate cortex_m;
//  Declare the external library `cortex_m`
extern crate mynewt;
//  Declare the Mynewt library
extern crate macros as mynewt_macros;
//  Declare the Mynewt Procedural Macros library

//  Declare the modules in our application
mod app_network {
    //  Declare `app_network.rs` as Rust module `app_network` for Application Network functions
    //  Declare `app_sensor.rs` as Rust module `app_sensor` for Application Sensor functions
    //  Declare `touch_sensor.rs` as Rust module `touch_sensor` for Touch Sensor functions

    //  Declare the optional modules depending on the options in `../Cargo.toml`
    //  If graphics display app is enabled...
    //  Include the graphics display app

    //  If druid UI app is enabled...
    //  Include the druid UI app

    //  If Visual Rust app is enabled...
    //  Don't warn about unused variables
    //  Include the Visual Rust app

    //  If CHIP8 Emulator app is enabled...
    //  Include the CHIP8 Emulator app

    //  If floating-point is enabled...
    //  Include the GPS Sensor functions

    //  Declare the system modules
    //  Import `PanicInfo` type which is used by `panic()` below
    //  Import cortex_m assembly function to inject breakpoint
    //  Import Mynewt OS API
    //  Import Mynewt Console API

    //  Select the touch handler depending on the options in `../Cargo.toml`
    //  If druid UI app is enabled...
    //  Use the touch handler from druid UI app

    //  If Visual Rust app is enabled...
    //  Use the touch handler from the Visual Rust app

    //  If CHIP8 Emulator app is enabled...
    //  Use the touch handler from the CHIP8 Emulator app

    //  If neither druid UI app nor Visual Rust app are enabled...
    //  Define a touch handler that does nothing

    //  Don't mangle the name "main"
    //  Declare extern "C" because it will be called by Mynewt
    //  Initialise the Mynewt packages and internal temperature sensor driver. Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c

    //  Start Bluetooth Beacon.  TODO: Create a safe wrapper for starting Bluetooth LE.
    //  extern { fn start_ble() -> i32; }
    //  let rc = unsafe { start_ble() };
    //  assert!(rc == 0, "BLE fail");

    //  Start the display

    //  Test the display
    //  If graphics display app is enabled...

    //  Start the touch sensor

    //  Test the touch sensor
    //  touch_sensor::test()
    //      .expect("TCH test fail");

    //  Launch the druid UI app
    //  If druid UI app is enabled...

    //  Launch the Visual Rust app
    //  If Visual Rust app is enabled...

    //  Launch the CHIP8 Emulator app
    //  If CHIP8 Emulator app is enabled...

    //  Main event loop
    //  Loop forever...
    //  Processing events...
    //  From default event queue.
    //  Never comes here

    //  Display the filename and line number to the Semihosting Console.
    //  Pause in the debugger.
    //  Display the payload.
    //  Loop forever so that device won't restart.
    //!  Transmit sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
    //!  The sensor data will be transmitted over NB-IoT.
    //!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
    //!  fixes response parsing bugs.  The patched file must be present in that location.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-nbiot/apps/my_sensor_app/OLDsrc/network.c`
    use mynewt::{result::*, hw::sensor::{SensorValue, SensorValueType},
                 sys::console, encoding::coap_context::*,
                 libs::{sensor_network}, coap, d, Strn};
    use mynewt_macros::strn;
    #[cfg(not (feature = "use_float"))]
    pub fn aggregate_sensor_data(sensor_value: &SensorValue)
     -> MynewtResult<()> {
        send_sensor_data(sensor_value)
    }
    /// Compose a CoAP JSON message with the Sensor Key (field name), Value and Geolocation (optional) in `val`
    /// and send to the CoAP server.  The message will be enqueued for transmission by the CoAP / OIC 
    /// Background Task so this function will return without waiting for the message to be transmitted.
    /// Return `Ok()` if successful, `SYS_EAGAIN` if network is not ready yet.
    /// For the CoAP server hosted at thethings.io, the CoAP payload shall be encoded in JSON like this:
    /// ```json
    /// {"values":[
    ///   {"key":"t",      "value":1715, "geo": { "lat": ..., "long": ... }},
    ///   {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"}
    /// ]}
    /// ```
    fn send_sensor_data(val: &SensorValue) -> MynewtResult<()> {
        console::print("Rust send_sensor_data: ");
        if let SensorValueType::Uint(i) = val.value {
            console::print_strn(val.key);
            console::print("=");
            console::printint(i as i32);
        }
        console::print("\n");
        console::flush();
        let device_id = sensor_network::get_device_id()?;
        let rc = sensor_network::init_server_post(&Strn::new(b"\0"))?;
        if !rc { return Err(MynewtError::SYS_EAGAIN); }
        let _payload =
            {
                "begin json root";
                {
                    "begin json coap_root";
                    unsafe {
                        mynewt::libs::sensor_network::prepare_post(mynewt::encoding::APPLICATION_JSON)?;
                    }
                    unsafe {
                        mynewt::libs::sensor_coap::json_rep_start_root_object();
                    }
                    {
                        {
                            "begin json coap_array, object : COAP_CONTEXT, key : values";
                            {
                                "<< jarri , o: COAP_CONTEXT, k: values";
                                let key_with_null: &str = "values\u{0}";
                                unsafe {
                                    mynewt::libs::mynewt_rust::json_helper_set_array(COAP_CONTEXT.to_void_ptr(),
                                                                                     COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()));
                                };
                            };
                            {
                                " >>  >> val >> , \"device\" : & device_id,";
                                "--------------------";
                                {
                                    "begin json coap_item_int_val, c : COAP_CONTEXT, val : val";
                                    let geo = val.geo;
                                    if let SensorValueType::Uint(val) =
                                           val.value {
                                        {
                                            "begin json coap_item_int, key : val.key, value : val";
                                            {
                                                "begin json coap_item, array : COAP_CONTEXT";
                                                {
                                                    "<< jitmi c: COAP_CONTEXT";
                                                    let key_with_null: &str =
                                                        "COAP_CONTEXT\u{0}";
                                                    unsafe {
                                                        mynewt::libs::mynewt_rust::json_helper_object_array_start_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                                    };
                                                };
                                                {
                                                    {
                                                        "-- jtxte o: COAP_CONTEXT, k: \"key\", v: val.key";
                                                        let key_with_opt_null:
                                                                &[u8] =
                                                            "key".to_bytes_optional_nul();
                                                        let value_with_opt_null:
                                                                &[u8] =
                                                            val.key.to_bytes_optional_nul();
                                                        unsafe {
                                                            mynewt::libs::mynewt_rust::json_helper_set_text_string(COAP_CONTEXT.to_void_ptr(),
                                                                                                                   COAP_CONTEXT.key_to_cstr(key_with_opt_null),
                                                                                                                   COAP_CONTEXT.value_to_cstr(value_with_opt_null))
                                                        };
                                                    };
                                                    {
                                                        "-- jinte o: COAP_CONTEXT, k: \"value\", v: val";
                                                        let key_with_opt_null:
                                                                &[u8] =
                                                            "value".to_bytes_optional_nul();
                                                        let value =
                                                            val as u64;
                                                        unsafe {
                                                            mynewt::libs::mynewt_rust::json_helper_set_int(COAP_CONTEXT.to_void_ptr(),
                                                                                                           COAP_CONTEXT.key_to_cstr(key_with_opt_null),
                                                                                                           value)
                                                        };
                                                    };
                                                    unsafe {
                                                        COAP_CONTEXT.json_set_geolocation(&Strn::new(b"geo\x00"),
                                                                                          &Strn::new(b"lat\x00"),
                                                                                          &Strn::new(b"long\x00"),
                                                                                          geo)
                                                    };
                                                };
                                                {
                                                    ">>";
                                                    let key_with_null: &str =
                                                        "COAP_CONTEXT\u{0}";
                                                    unsafe {
                                                        mynewt::libs::mynewt_rust::json_helper_object_array_end_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                                    };
                                                };
                                                "end json coap_item";
                                            };
                                            "end json coap_item_int";
                                        };
                                    } else {
                                        unsafe {
                                            COAP_CONTEXT.fail(CoapError::VALUE_NOT_UINT)
                                        };
                                    }
                                    "end json coap_item_int_val";
                                };
                                "--------------------";
                                " >>  >> \"device\" >> : & device_id,";
                                "add1 key : \"device\" value : ::mynewt::parse!(@ json &device_id) to object :\nCOAP_CONTEXT";
                                {
                                    "begin json coap_item_str, parent : COAP_CONTEXT, key : \"device\", val :\n::mynewt::parse!(@ json &device_id)";
                                    {
                                        "begin json coap_item, array : COAP_CONTEXT";
                                        {
                                            "<< jitmi c: COAP_CONTEXT";
                                            let key_with_null: &str =
                                                "COAP_CONTEXT\u{0}";
                                            unsafe {
                                                mynewt::libs::mynewt_rust::json_helper_object_array_start_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                            };
                                        };
                                        {
                                            {
                                                "-- jtxti o: COAP_CONTEXT, k: key, v: \"device\"";
                                                let key_strn: &Strn =
                                                    &Strn::new(b"key\x00");
                                                let value_strn: &Strn =
                                                    &Strn::new(b"device\x00");
                                                unsafe {
                                                    COAP_CONTEXT.json_set_text_string(key_strn,
                                                                                      value_strn)
                                                };
                                            };
                                            {
                                                "-- jtxti o: COAP_CONTEXT, k: value, v: ::mynewt::parse!(@ json &device_id)";
                                                let key_strn: &Strn =
                                                    &Strn::new(b"value\x00");
                                                let value_strn: &Strn =
                                                    &device_id;
                                                unsafe {
                                                    COAP_CONTEXT.json_set_text_string(key_strn,
                                                                                      value_strn)
                                                };
                                            };
                                        };
                                        {
                                            ">>";
                                            let key_with_null: &str =
                                                "COAP_CONTEXT\u{0}";
                                            unsafe {
                                                mynewt::libs::mynewt_rust::json_helper_object_array_end_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                            };
                                        };
                                        "end json coap_item";
                                    };
                                    "end json coap_item_str";
                                };
                                "--------------------";
                            };
                            {
                                ">>";
                                let key_with_null: &str = "values\u{0}";
                                unsafe {
                                    mynewt::libs::mynewt_rust::json_helper_close_array(COAP_CONTEXT.to_void_ptr(),
                                                                                       COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                };
                            };
                            "end json coap_array";
                        };
                    };
                    unsafe {
                        mynewt::libs::sensor_coap::json_rep_end_root_object();
                    }
                    "end json coap_root";
                };
                "end json root";
                ()
            };
        sensor_network::do_server_post()?;
        console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=");
        console::print_strn(&device_id);
        console::print("\n");
        Ok(())
    }
}
mod app_sensor {
    //!  Poll the temperature sensor every 10 seconds. Transmit the sensor data to the CoAP server after polling.
    //!  This is the Rust version of https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/nrf52/apps/my_sensor_app/OLDsrc/sensor.c
    use mynewt::{result::*, hw::sensor_mgr, hw::sensor::{self, sensor_type_t},
                 sys::console, Strn};
    use mynewt_macros::{init_strn};
    use crate::app_network;
    ///  Sensor to be polled: `temp_stub_0` is the stub temperature sensor that simulates a temperature sensor
    static SENSOR_DEVICE: Strn =
        Strn{rep: mynewt::StrnRep::ByteStr(b"temp_stub_0\x00"),};
    ///  Poll sensor every 30,000 milliseconds (30 seconds)  
    const SENSOR_POLL_TIME: u32 = 30 * 1000;
    ///  Use key (field name) `t` to transmit raw temperature to CoAP Server
    const TEMP_SENSOR_KEY: Strn =
        Strn{rep: mynewt::StrnRep::ByteStr(b"t\x00"),};
    ///  Type of sensor: Raw temperature sensor (integer sensor values 0 to 4095)
    const TEMP_SENSOR_TYPE: sensor_type_t =
        sensor::SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;
    ///  Ask Mynewt to poll or read the temperature sensor and call `aggregate_sensor_data()`
    ///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
    #[allow(dead_code)]
    pub fn start_sensor_listener() -> MynewtResult<()> {
        console::print("Rust TMP poll\n");
        let sensor =
            sensor_mgr::find_bydevname(&SENSOR_DEVICE).next().expect("no TMP");
        sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME)?;
        let listener =
            sensor::new_sensor_listener(&TEMP_SENSOR_KEY, TEMP_SENSOR_TYPE,
                                        app_network::aggregate_sensor_data)?;
        sensor::register_listener(sensor, listener)?;
        Ok(())
    }
}
mod touch_sensor {
    use embedded_hal::{self, blocking::delay::DelayMs,
                       digital::v2::OutputPin};
    use mynewt::{self, result::*, hw::hal, kernel::os::{self, os_event},
                 sys::console, fill_zero};
    /// Reset Pin for touch controller. Note: NFC antenna pins must be reassigned as GPIO pins for this to work.
    const TOUCH_RESET_PIN: i32 = 10;
    /// Interrupt Pin for touch controller. We listen for the touch controller interrupt and trigger an event.
    const TOUCH_INTERRUPT_PIN: i32 = 28;
    /// Reset GPIO Pin
    static mut TOUCH_RESET: MynewtGPIO =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<MynewtGPIO>()],
                                     MynewtGPIO>([0;
                                                     ::core::mem::size_of::<MynewtGPIO>()])
        };
    static mut TOUCH_DELAY: MynewtDelay =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<MynewtDelay>()],
                                     MynewtDelay>([0;
                                                      ::core::mem::size_of::<MynewtDelay>()])
        };
    type MynewtGPIO = mynewt::GPIO;
    type MynewtDelay = mynewt::Delay;
    /// Initialise the touch controller. NFC antenna pins must already be reassigned as GPIO pins:
    /// Set `NFC_PINS_AS_GPIO: 1` in hw/bsp/nrf52/syscfg.yml.  To check whether whether NFC antenna 
    /// pins have been correctly reassigned as GPIO pins, use the `nrf52` crate and check that the output is `fe`:
    /// ```rust
    /// let peripherals = nrf52::Peripherals::take().unwrap();
    /// let nfcpins = peripherals.UICR.nfcpins.read().bits();
    /// console::print("nfcpins = "); console::printhex(nfcpins as u8); console::print("\n");
    /// ```
    pub fn start_touch_sensor() -> MynewtResult<()> {
        console::print("Rust touch sensor\n");
        unsafe { TOUCH_RESET.init(TOUCH_RESET_PIN)? };
        unsafe {
            TOUCH_RESET.set_low()?;
            TOUCH_DELAY.delay_ms(20);
            TOUCH_RESET.set_high()?;
            TOUCH_DELAY.delay_ms(200);
            TOUCH_DELAY.delay_ms(200);
        };
        unsafe { TOUCH_EVENT.ev_cb = Some(touch_event_callback) };
        let rc =
            unsafe {
                hal::hal_gpio_irq_init(TOUCH_INTERRUPT_PIN,
                                       Some(touch_interrupt_handler),
                                       core::ptr::null_mut(),
                                       hal::hal_gpio_irq_trigger_HAL_GPIO_TRIG_FALLING,
                                       hal::hal_gpio_pull_HAL_GPIO_PULL_UP)
            };
        {
            match (&(rc), &(0)) {
                (left_val, right_val) => {
                    if !(*left_val == *right_val) {
                        ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left == right)`\n  left: `",
                                                                                      "`,\n right: `",
                                                                                      "`: "],
                                                                                    &match (&&*left_val,
                                                                                            &&*right_val,
                                                                                            &::core::fmt::Arguments::new_v1(&["IRQ init fail"],
                                                                                                                            &match ()
                                                                                                                                 {
                                                                                                                                 ()
                                                                                                                                 =>
                                                                                                                                 [],
                                                                                                                             }))
                                                                                         {
                                                                                         (arg0,
                                                                                          arg1,
                                                                                          arg2)
                                                                                         =>
                                                                                         [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                       ::core::fmt::Debug::fmt),
                                                                                          ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                       ::core::fmt::Debug::fmt),
                                                                                          ::core::fmt::ArgumentV1::new(arg2,
                                                                                                                       ::core::fmt::Display::fmt)],
                                                                                     }),
                                                     ::core::panic::Location::caller())
                    }
                }
            }
        };
        unsafe { hal::hal_gpio_irq_enable(TOUCH_INTERRUPT_PIN) };
        Ok(())
    }
    /// Interrupt handler for the touch controller, triggered when a touch is detected
    extern "C" fn touch_interrupt_handler(arg: *mut core::ffi::c_void) {
        unsafe { TOUCH_EVENT.ev_arg = arg };
        let queue = os::eventq_dflt_get().expect("GET fail");
        unsafe { os::os_eventq_put(queue, &mut TOUCH_EVENT) };
    }
    /// Callback for the touch event that is triggered when a touch is detected
    extern "C" fn touch_event_callback(_event: *mut os_event) {
        unsafe {
            read_touchdata(&mut TOUCH_DATA).expect("touchdata fail");
            for i in 0..TOUCH_DATA.count as usize {
                let TouchInfo { x, y, action, .. } = TOUCH_DATA.touches[i];
                if x == 0 && y == 0 { continue ; }
                if action != 0 && action != 2 { continue ; }
                super::handle_touch(x, y);
            }
        }
    }
    /// Touch data will be populated here
    static mut TOUCH_DATA: TouchEventInfo =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<TouchEventInfo>()],
                                     TouchEventInfo>([0;
                                                         ::core::mem::size_of::<TouchEventInfo>()])
        };
    /// Read touch controller data. This only works when the screen has been tapped and the touch controller wakes up.
    /// Ported from https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.c#L407-L466
    fn read_touchdata(data: &mut TouchEventInfo) -> MynewtResult<()> {
        read_register_range(TOUCH_CONTROLLER_ADDRESS, 0, POINT_READ_BUF as u8,
                            unsafe {
                                &mut BUF
                            }).expect("read touchdata fail");
        *data =
            unsafe {
                ::core::mem::transmute::<[u8; ::core::mem::size_of::<TouchEventInfo>()],
                                         TouchEventInfo>([0;
                                                             ::core::mem::size_of::<TouchEventInfo>()])
            };
        data.point_num = unsafe { BUF[FT_TOUCH_POINT_NUM] & 0x0F };
        data.count = 0;
        for i in 0..CFG_MAX_TOUCH_POINTS {
            let pointid =
                unsafe { BUF[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
            if pointid >= HYN_MAX_ID { break ; }
            data.count += 1;
            let x_high =
                unsafe { BUF[HYN_TOUCH_X_H_POS + HYN_TOUCH_STEP * i] & 0x0F }
                    as u16;
            let x_low =
                unsafe { BUF[HYN_TOUCH_X_L_POS + HYN_TOUCH_STEP * i] } as u16;
            data.touches[i].x = (x_high << 8) | x_low;
            let y_high =
                unsafe { BUF[HYN_TOUCH_Y_H_POS + HYN_TOUCH_STEP * i] & 0x0F }
                    as u16;
            let y_low =
                unsafe { BUF[HYN_TOUCH_Y_L_POS + HYN_TOUCH_STEP * i] } as u16;
            data.touches[i].y = (y_high << 8) | y_low;
            data.touches[i].action =
                unsafe { BUF[HYN_TOUCH_EVENT_POS + HYN_TOUCH_STEP * i] } >> 6;
            data.touches[i].finger =
                unsafe { BUF[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
            data.touches[i].pressure =
                unsafe { BUF[HYN_TOUCH_XY_POS + HYN_TOUCH_STEP * i] };
            data.touches[i].area =
                unsafe { BUF[HYN_TOUCH_MISC + HYN_TOUCH_STEP * i] } >> 4;
            if (data.touches[i].action == 0 || data.touches[i].action == 2) &&
                   (data.point_num == 0) {
                break ;
            }
        }
        Ok(())
    }
    /// Buffer for raw touch data
    static mut BUF: [u8; POINT_READ_BUF] = [0; POINT_READ_BUF];
    /// Touch Controller I2C Address: https://github.com/lupyuen/hynitron_i2c_cst0xxse
    const TOUCH_CONTROLLER_ADDRESS: u8 = 0x15;
    /// Touch Event Info for multiple touches. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.h#L104-L115
    struct TouchEventInfo {
        /// Array of touch points
        touches: [TouchInfo; HYN_MAX_POINTS],
        /// How many touch points
        count: u8,
        point_num: u8,
    }
    /// Touch Info for a single touch. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.h#L104-L115
    struct TouchInfo {
        /// X coordinate
        x: u16,
        /// Y coordinate
        y: u16,
        /// Action: 0 = down, 1 = up, 2 = contact
        action: u8,
        /// Which finger touched
        finger: u8,
        /// Pressure of touch
        pressure: u8,
        /// Area touched
        area: u8,
    }
    /// Max touch points for the touch controller
    const CFG_MAX_TOUCH_POINTS: usize = 5;
    /// Max touch channels for the touch controller
    const HYN_MAX_POINTS: usize = 10;
    const HYN_MAX_ID: u8 = 0x0F;
    const HYN_TOUCH_STEP: usize = 6;
    const HYN_TOUCH_X_H_POS: usize = 3;
    const HYN_TOUCH_X_L_POS: usize = 4;
    const HYN_TOUCH_Y_H_POS: usize = 5;
    const HYN_TOUCH_Y_L_POS: usize = 6;
    const HYN_TOUCH_EVENT_POS: usize = 3;
    const HYN_TOUCH_ID_POS: usize = 5;
    const FT_TOUCH_POINT_NUM: usize = 2;
    const HYN_TOUCH_XY_POS: usize = 7;
    const HYN_TOUCH_MISC: usize = 8;
    const POINT_READ_BUF: usize = 3 + (HYN_TOUCH_STEP * HYN_MAX_POINTS);
    /// Event that will be forwarded to the Event Queue when a touch interrupt is triggered
    static mut TOUCH_EVENT: os_event =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<os_event>()],
                                     os_event>([0;
                                                   ::core::mem::size_of::<os_event>()])
        };
    /// Read a range of I2C registers from the I2C address `addr` (7-bit address), starting at `start_register` for count `num_registers`. Save into `buffer`.
    fn read_register_range(addr: u8, start_register: u8, num_registers: u8,
                           buffer: &mut [u8]) -> MynewtResult<()> {
        if !(buffer.len() >= num_registers as usize) {
            ::core::panicking::panic("i2c buf")
        };
        if !(start_register + num_registers < 128) {
            ::core::panicking::panic("i2c addr")
        };
        unsafe {
            I2C_BUFFER[0] = start_register;
            I2C_DATA.address = addr;
            I2C_DATA.len = I2C_BUFFER.len() as u16;
            I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
        };
        let _rc1 =
            unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };
        unsafe {
            I2C_BUFFER[0] = 0x00;
            I2C_DATA.address = addr;
            I2C_DATA.len = num_registers as u16;
            I2C_DATA.buffer = buffer.as_mut_ptr();
        };
        let rc2 =
            unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };
        if rc2 == hal::HAL_I2C_ERR_ADDR_NACK as i32 {
            console::print("i2c fail\n");
            return Ok(());
        }
        Ok(())
    }
    /// Read the I2C register for the specified I2C address (7-bit address)
    #[allow(dead_code)]
    fn read_register(addr: u8, register: u8) -> MynewtResult<()> {
        if !(register < 128) { ::core::panicking::panic("i2c addr") };
        unsafe {
            I2C_BUFFER[0] = register;
            I2C_DATA.address = addr;
            I2C_DATA.len = I2C_BUFFER.len() as u16;
            I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
        };
        let _rc1 =
            unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };
        unsafe {
            I2C_BUFFER[0] = 0x00;
            I2C_DATA.address = addr;
            I2C_DATA.len = I2C_BUFFER.len() as u16;
            I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
        };
        let rc2 =
            unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };
        if rc2 == hal::HAL_I2C_ERR_ADDR_NACK as i32 { return Ok(()); }
        console::print("addr: 0x");
        console::printhex(addr);
        console::print(", reg: 0x");
        console::printhex(register);
        console::print(" = 0x");
        console::printhex(unsafe { I2C_BUFFER[0] });
        console::print("\n");
        console::flush();
        Ok(())
    }
    /// I2C packet to be sent
    static mut I2C_DATA: hal::hal_i2c_master_data =
        hal::hal_i2c_master_data{address: 0,
                                 len: 0,
                                 buffer: core::ptr::null_mut(),};
    /// Buffer containing I2C read/write data
    static mut I2C_BUFFER: [u8; 1] = [0];
    /// Probe the I2C bus to discover I2C devices
    #[allow(dead_code)]
    pub fn probe() -> MynewtResult<()> {
        for addr in 0..128 {
            let rc = unsafe { hal::hal_i2c_master_probe(1, addr, 1000) };
            if rc != hal::HAL_I2C_ERR_ADDR_NACK as i32 {
                console::print("0x");
                console::printhex(addr);
                console::print("\n");
                console::flush();
            }
        }
        console::print("Done\n");
        console::flush();
        Ok(())
    }
    /// Test reading some registers for I2C devices
    #[allow(dead_code)]
    pub fn test() -> MynewtResult<()> {
        for _ in 0..20 {
            for addr in &[0x44] {
                for register in
                    &[0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                      0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f] {
                    read_register(*addr, *register)?;
                }
            }
            console::print("Done\n");
            console::flush();
        }
        Ok(())
    }
}
#[cfg(feature = "chip8_app")]
mod chip8 {
    use embedded_graphics::{prelude::*, pixelcolor::Rgb565,
                            primitives::{Rectangle}};
    use mynewt::{result::*, sys::console, kernel::os};
    /// Render some graphics and text to the PineTime display. `start_display()` must have been called earlier.
    pub fn on_start() -> MynewtResult<()> {
        console::print("Rust CHIP8\n");
        console::flush();
        let background =
            Rectangle::<Rgb565>::new(Coord::new(0, 0),
                                     Coord::new(239,
                                                239)).fill(Some(Rgb565::from((0x00,
                                                                              0x00,
                                                                              0x00))));
        druid::draw_to_display(background);
        let chip8 = libchip8::Chip8::new(Hardware);
        chip8.run(b"\x12%SPACE INVADERS 0.91 By David WINTER`\x00a\x00b\x08\xa3\xdd\xd0\x18q\x08\xf2\x1e1 \x12-p\x08a\x000@\x12-i\x05l\x15n\x00#\x91`\n\xf0\x15\xf0\x070\x00\x12K#\x91~\x01\x12Ef\x00h\x1ci\x00j\x04k\nl\x04m<n\x0f\x00\xe0#u#Q\xfd\x15`\x04\xe0\x9e\x12}#u8\x00x\xff#u`\x06\xe0\x9e\x12\x8b#u89x\x01#u6\x00\x12\x9f`\x05\xe0\x9e\x12\xe9f\x01e\x1b\x84\x80\xa3\xd9\xd4Q\xa3\xd9\xd4Qu\xff5\xff\x12\xadf\x00\x12\xe9\xd4Q?\x01\x12\xe9\xd4Qf\x00\x83@s\x03\x83\xb5b\xf8\x83\"b\x083\x00\x12\xc9#}\x82\x06C\x08\x12\xd33\x10\x12\xd5#}\x82\x063\x18\x12\xdd#}\x82\x06C \x12\xe73(\x12\xe9#}>\x00\x13\x07y\x06I\x18i\x00j\x04k\nl\x04}\xf4n\x0f\x00\xe0#Q#u\xfd\x15\x12o\xf7\x077\x00\x12o\xfd\x15#Q\x8b\xa4;\x12\x13\x1b|\x02j\xfc;\x02\x13#|\x02j\x04#Q<\x18\x12o\x00\xe0\xa4\xdd`\x14a\x08b\x0f\xd0\x1fp\x08\xf2\x1e0,\x133`\xff\xf0\x15\xf0\x070\x00\x13A\xf0\n\x00\xe0\xa7\x06\xfee\x12%\xa3\xc1\xf9\x1ea\x08#i\x81\x06#i\x81\x06#i\x81\x06#i{\xd0\x00\xee\x80\xe0\x80\x120\x00\xdb\xc6{\x0c\x00\xee\xa3\xd9`\x1c\xd8\x04\x00\xee#Q\x8e##Q`\x05\xf0\x18\xf0\x15\xf0\x070\x00\x13\x89\x00\xeej\x00\x8d\xe0k\x04\xe9\xa1\x12W\xa6\x0c\xfd\x1e\xf0e0\xff\x13\xafj\x00k\x04m\x01n\x01\x13\x97\xa5\n\xf0\x1e\xdb\xc6{\x08}\x01z\x01:\x07\x13\x97\x00\xee<~\xff\xff\x99\x99~\xff\xff$$\xe7~\xff<<~\xdb\x81B<~\xff\xdb\x108|\xfe\x00\x00\x7f\x00?\x00\x7f\x00\x00\x00\x01\x01\x01\x03\x03\x03\x03\x00\x00?        ?\x08\x08\xff\x00\x00\xfe\x00\xfc\x00\xfe\x00\x00\x00~BBbbbb\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\xff\x00}\x00A}\x05}}\x00\x00\xc2\xc2\xc6Dl(8\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\xff\x00\xf7\x10\x14\xf7\xf7\x04\x04\x00\x00|D\xfe\xc2\xc2\xc2\xc2\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\xff\x00\xef (\xe8\xe8//\x00\x00\xf9\x85\xc5\xc5\xc5\xc5\xf9\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\xff\x00\xbe\x00 0 \xbe\xbe\x00\x00\xf7\x04\xe7\x85\x85\x84\xf4\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\xff\x00\x00\x7f\x00?\x00\x7f\x00\x00\x00\xef(\xef\x00\xe0`o\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\xff\x00\x00\xfe\x00\xfc\x00\xfe\x00\x00\x00\xc0\x00\xc0\xc0\xc0\xc0\xc0\x00\x00\xfc\x04\x04\x04\x04\x04\x04\x04\x04\xfc\x10\x10\xff\xf9\x81\xb9\x8b\x9a\x9a\xfa\x00\xfa\x8a\x9a\x9a\x9b\x99\xf8\xe6%%\xf4444\x00\x17\x14476&\xc7\xdfPP\\\xd8\xd8\xdf\x00\xdf\x11\x1f\x12\x1b\x19\xd9|D\xfe\x86\x86\x86\xfc\x84\xfe\x82\x82\xfe\xfe\x80\xc0\xc0\xc0\xfe\xfc\x82\xc2\xc2\xc2\xfc\xfe\x80\xf8\xc0\xc0\xfe\xfe\x80\xf0\xc0\xc0\xc0\xfe\x80\xbe\x86\x86\xfe\x86\x86\xfe\x86\x86\x86\x10\x10\x10\x10\x10\x10\x18\x18\x18HHx\x9c\x90\xb0\xc0\xb0\x9c\x80\x80\xc0\xc0\xc0\xfe\xee\x92\x92\x86\x86\x86\xfe\x82\x86\x86\x86\x86|\x82\x86\x86\x86|\xfe\x82\xfe\xc0\xc0\xc0|\x82\xc2\xca\xc4z\xfe\x86\xfe\x90\x9c\x84\xfe\xc0\xfe\x02\x02\xfe\xfe\x100000\x82\x82\xc2\xc2\xc2\xfe\x82\x82\x82\xee8\x10\x86\x86\x96\x92\x92\xee\x82D88D\x82\x82\x82\xfe000\xfe\x02\x1e\xf0\x80\xfe\x00\x00\x00\x00\x06\x06\x00\x00\x00``\xc0\x00\x00\x00\x00\x00\x00\x18\x18\x18\x18\x00\x18|\xc6\x0c\x18\x00\x18\x00\x00\xfe\xfe\x00\x00\xfe\x82\x86\x86\x86\xfe\x08\x08\x08\x18\x18\x18\xfe\x02\xfe\xc0\xc0\xfe\xfe\x02\x1e\x06\x06\xfe\x84\xc4\xc4\xfe\x04\x04\xfe\x80\xfe\x06\x06\xfe\xc0\xc0\xc0\xfe\x82\xfe\xfe\x02\x02\x06\x06\x06|D\xfe\x86\x86\xfe\xfe\x82\xfe\x06\x06\x06D\xfeDD\xfeD\xa8\xa8\xa8\xa8\xa8\xa8\xa8lZ\x00\x0c\x18\xa80N~\x00\x12\x18fl\xa8ZfT$f\x00HH\x18\x12\xa8\x06\x90\xa8\x12\x00~0\x12\xa8\x840Nr\x18f\xa8\xa8\xa8\xa8\xa8\xa8\x90Tx\xa8Hxlr\xa8\x12\x18lrfT\x90\xa8r*\x18\xa80N~\x00\x12\x18fl\xa8rT\xa8Zf\x18~\x18Nr\xa8r*\x180f\xa80N~\x00l0TN\x9c\xa8\xa8\xa8\xa8\xa8\xa8\xa8HT~\x18\xa8\x90Txf\xa8l*0Z\xa8\x840r*\xa8\xd8\xa8\x00N\x12\xa8\xe4\xa2\xa8\x00N\x12\xa8l*TTr\xa8\x840r*\xa8\xde\x9c\xa8r*\x18\xa8\x0cTHZxr\x18f\xa8f\x18ZTfrl\xa8r*\x00r\xa8r*\x18\xa80N~\x00\x12\x18fl\xa8\x00f\x18\xa80N\x0cf\x18\x00l0N$\xa8r*\x180f\xa8\x1eTf\x0c\x18\x9c\xa8$TT\x12\xa8Bx\x0c<\xa8\xae\xa8\xa8\xa8\xa8\xa8\xa8\xa8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00");
        Ok(())
    }
    const SCREEN_WIDTH: usize = 64;
    const SCREEN_HEIGHT: usize = 32;
    const PIXEL_SIZE: i32 = 3;
    static mut SCREEN_BUFFER: [u8; SCREEN_WIDTH * SCREEN_HEIGHT] =
        [0; SCREEN_WIDTH * SCREEN_HEIGHT];
    struct Hardware;
    impl libchip8::Hardware for Hardware {
        fn rand(&mut self) -> u8 { 123 }
        fn key(&mut self, key: u8) -> bool { false }
        fn vram_set(&mut self, x: usize, y: usize, d: bool) {
            let i = x + y * SCREEN_WIDTH;
            unsafe { SCREEN_BUFFER[i] = if d { 1 } else { 0 } };
            let x_scaled: i32 = x as i32 * PIXEL_SIZE;
            let y_scaled: i32 = y as i32 * PIXEL_SIZE;
            let color =
                if d {
                    Rgb565::from((0x00, 0x00, 0xff))
                } else { Rgb565::from((0x00, 0x00, 0x00)) };
            let pixel =
                Rectangle::<Rgb565>::new(Coord::new(x_scaled, y_scaled),
                                         Coord::new(x_scaled + PIXEL_SIZE - 1,
                                                    y_scaled + PIXEL_SIZE -
                                                        1)).fill(Some(color));
            druid::draw_to_display(pixel);
        }
        fn vram_get(&mut self, x: usize, y: usize) -> bool {
            let i = x + y * SCREEN_WIDTH;
            unsafe { SCREEN_BUFFER[i] != 0 }
        }
        fn vram_setsize(&mut self, size: (usize, usize)) { }
        fn vram_size(&mut self) -> (usize, usize) {
            (SCREEN_WIDTH, SCREEN_HEIGHT)
        }
        fn clock(&mut self) -> u64 {
            os::os_time_get as u64 * 1000_u64 * 1000_u64
        }
        fn beep(&mut self) { }
        fn sched(&mut self) -> bool { false }
    }
    pub fn handle_touch(_x: u16, _y: u16) {
        console::print("CHIP8 touch not handled\n");
        console::flush();
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use mynewt::{kernel::os, sys::console};
#[cfg(feature = "chip8_app")]
use chip8::handle_touch;
///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
extern "C" fn main() -> ! {
    mynewt::sysinit();
    druid::start_display().expect("DSP fail");
    touch_sensor::start_touch_sensor().expect("TCH fail");

    #[cfg(feature = "chip8_app")]
    chip8::on_start().expect("CHIP8 fail");
    loop  {
        os::eventq_run(os::eventq_dflt_get().expect("GET fail")).expect("RUN fail");
    }
}
///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    console::print("panic ");
    if let Some(location) = info.location() {
        let file = location.file();
        let line = location.line();
        console::print("at ");
        console::buffer(&file);
        console::print(" line ");
        console::printint(line as i32);
        console::print("\n");
        console::flush();
    } else { console::print("no loc\n"); console::flush(); }
    bkpt();
    console::print(info.payload().downcast_ref::<&str>().unwrap());
    console::print("\n");
    console::flush();
    loop  { }
}
