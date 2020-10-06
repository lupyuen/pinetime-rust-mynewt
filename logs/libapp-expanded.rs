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
#![feature(proc_macro_hygiene)]
//  Allow Procedural Macros like `run!()`
#![feature(exclusive_range_pattern)]
#[prelude_import]
use core::prelude::v1::*;
#[macro_use]
extern crate core;
#[macro_use]
extern crate compiler_builtins;
//  Allow ranges like `0..128` in `match` statements

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
    //  Declare `watch_face.rs` as Rust module `watch_face` for Watch Face functions

    //  Declare the system modules
    //  Import `PanicInfo` type which is used by `panic()` below
    //  Import cortex_m assembly function to inject breakpoint
    //  Import Mynewt OS API
    //  Import Mynewt Console API

    //  #[cfg(not(any(feature = "ui_app")))]  //  TODO: If no UI app is enabled...
    //  Define a touch handler that does nothing

    //  Don't mangle the name "main"
    //  Declare extern "C" because it will be called by Mynewt
    //  Initialise the Mynewt packages and internal temperature sensor driver. Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c

    //  Start Bluetooth LE, including over-the-air firmware upgrade.  TODO: Create a safe wrapper for starting Bluetooth LE.

    //  Start rendering the watch face every minute in Rust.

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
    //  Loop forever...
    //  Processing events...
    //  From default event queue.
    //  Never comes here

    //  Display the filename and line number to the Semihosting Console.

    //  Display the payload.
    //  Prevent panic loop while displaying the payload

    //  Pause in the debugger.

    //  Restart the device.
    //  Defined in apps/my_sensor_app/src/support.c

    //  Will never come here. This is needed to satisfy the return type "!"

    //!  Transmit sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
    //!  The sensor data will be transmitted over NB-IoT.
    //!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
    //!  fixes response parsing bugs.  The patched file must be present in that location.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-nbiot/apps/my_sensor_app/OLDsrc/network.c`
    use mynewt::{result::*, hw::sensor::{SensorValue, SensorValueType},
                 sys::console, encoding::coap_context::*,
                 libs::{sensor_network}, coap, d, Strn};
    use mynewt_macros::strn;
    #[cfg(not(feature = "use_float"))]
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
    #[allow(dead_code)]
    const TOUCH_RESET_PIN: i32 = 10;
    /// Interrupt Pin for touch controller. We listen for the touch controller interrupt and trigger an event.
    #[allow(dead_code)]
    const TOUCH_INTERRUPT_PIN: i32 = 28;
    /// Reset GPIO Pin
    #[allow(dead_code)]
    static mut TOUCH_RESET: MynewtGPIO =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<MynewtGPIO>()],
                                     MynewtGPIO>([0;
                                                     ::core::mem::size_of::<MynewtGPIO>()])
        };
    #[allow(dead_code)]
    static mut TOUCH_DELAY: MynewtDelay =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<MynewtDelay>()],
                                     MynewtDelay>([0;
                                                      ::core::mem::size_of::<MynewtDelay>()])
        };
    #[allow(dead_code)]
    type MynewtGPIO = mynewt::GPIO;
    #[allow(dead_code)]
    type MynewtDelay = mynewt::Delay;
    /// Initialise the touch controller. NFC antenna pins must already be reassigned as GPIO pins:
    /// Set `NFC_PINS_AS_GPIO: 1` in hw/bsp/nrf52/syscfg.yml.  To check whether whether NFC antenna 
    /// pins have been correctly reassigned as GPIO pins, use the `nrf52` crate and check that the output is `fe`:
    /// ```rust
    /// let peripherals = nrf52::Peripherals::take().unwrap();
    /// let nfcpins = peripherals.UICR.nfcpins.read().bits();
    /// console::print("nfcpins = "); console::printhex(nfcpins as u8); console::print("\n");
    /// ```
    #[allow(dead_code)]
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
                                                                                     }))
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
    #[allow(dead_code)]
    static mut TOUCH_DATA: TouchEventInfo =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<TouchEventInfo>()],
                                     TouchEventInfo>([0;
                                                         ::core::mem::size_of::<TouchEventInfo>()])
        };
    /// Read touch controller data. This only works when the screen has been tapped and the touch controller wakes up.
    /// Ported from https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.c#L407-L466
    #[allow(dead_code)]
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
    #[allow(dead_code)]
    static mut BUF: [u8; POINT_READ_BUF] = [0; POINT_READ_BUF];
    /// Touch Controller I2C Address: https://github.com/lupyuen/hynitron_i2c_cst0xxse
    #[allow(dead_code)]
    const TOUCH_CONTROLLER_ADDRESS: u8 = 0x15;
    /// Touch Event Info for multiple touches. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.h#L104-L115
    #[allow(dead_code)]
    struct TouchEventInfo {
        /// Array of touch points
        touches: [TouchInfo; HYN_MAX_POINTS],
        /// How many touch points
        count: u8,
        point_num: u8,
    }
    /// Touch Info for a single touch. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.h#L104-L115
    #[allow(dead_code)]
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
    #[allow(dead_code)]
    const CFG_MAX_TOUCH_POINTS: usize = 5;
    /// Max touch channels for the touch controller
    #[allow(dead_code)]
    const HYN_MAX_POINTS: usize = 10;
    #[allow(dead_code)]
    const HYN_MAX_ID: u8 = 0x0F;
    #[allow(dead_code)]
    const HYN_TOUCH_STEP: usize = 6;
    #[allow(dead_code)]
    const HYN_TOUCH_X_H_POS: usize = 3;
    #[allow(dead_code)]
    const HYN_TOUCH_X_L_POS: usize = 4;
    #[allow(dead_code)]
    const HYN_TOUCH_Y_H_POS: usize = 5;
    #[allow(dead_code)]
    const HYN_TOUCH_Y_L_POS: usize = 6;
    #[allow(dead_code)]
    const HYN_TOUCH_EVENT_POS: usize = 3;
    #[allow(dead_code)]
    const HYN_TOUCH_ID_POS: usize = 5;
    #[allow(dead_code)]
    const FT_TOUCH_POINT_NUM: usize = 2;
    #[allow(dead_code)]
    const HYN_TOUCH_XY_POS: usize = 7;
    #[allow(dead_code)]
    const HYN_TOUCH_MISC: usize = 8;
    #[allow(dead_code)]
    const POINT_READ_BUF: usize = 3 + (HYN_TOUCH_STEP * HYN_MAX_POINTS);
    /// Event that will be forwarded to the Event Queue when a touch interrupt is triggered
    #[allow(dead_code)]
    static mut TOUCH_EVENT: os_event =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<os_event>()],
                                     os_event>([0;
                                                   ::core::mem::size_of::<os_event>()])
        };
    /// Read a range of I2C registers from the I2C address `addr` (7-bit address), starting at `start_register` for count `num_registers`. Save into `buffer`.
    #[allow(dead_code)]
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
    #[allow(dead_code)]
    static mut I2C_DATA: hal::hal_i2c_master_data =
        hal::hal_i2c_master_data{address: 0,
                                 len: 0,
                                 buffer: core::ptr::null_mut(),};
    /// Buffer containing I2C read/write data
    #[allow(dead_code)]
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
mod watch_face {
    //! Watch Face in Rust for PineTime with Apache Mynewt OS, based on apps/my_sensor_app/src/watch_face.c
    //! See https://lupyuen.github.io/pinetime-rust-riot/articles/watch_face
    use core::{fmt::Write, ptr};
    use mynewt::{fill_zero, kernel::os, result::*, sys::console, Strn};
    use mynewt_macros::strn;
    use lvgl::{core::obj, objx::label};
    /// Create the widgets for the Watch Face. Called by create_watch_face() below.
    pub fn create_widgets(widgets: &mut WatchFaceWidgets)
     -> MynewtResult<()> {
        let scr = widgets.screen;
        if !!scr.is_null() { ::core::panicking::panic("null screen") };
        let label1 = label::create(scr, ptr::null())?;
        label::set_long_mode(label1, label::LV_LABEL_LONG_BREAK)?;
        label::set_text(label1, &Strn::new(b"00:00\x00"))?;
        obj::set_width(label1, 240)?;
        obj::set_height(label1, 200)?;
        label::set_align(label1, label::LV_LABEL_ALIGN_CENTER)?;
        obj::align(label1, scr, obj::LV_ALIGN_CENTER, 0, -30)?;
        widgets.time_label = label1;
        let l_state = label::create(scr, ptr::null())?;
        obj::set_width(l_state, 50)?;
        obj::set_height(l_state, 80)?;
        label::set_text(l_state, &Strn::new(b"\x00"))?;
        label::set_recolor(l_state, true)?;
        label::set_align(l_state, label::LV_LABEL_ALIGN_LEFT)?;
        obj::align(l_state, scr, obj::LV_ALIGN_IN_TOP_LEFT, 0, 0)?;
        widgets.ble_label = l_state;
        let l_power = label::create(scr, ptr::null())?;
        obj::set_width(l_power, 80)?;
        obj::set_height(l_power, 20)?;
        label::set_text(l_power, &Strn::new(b"\x00"))?;
        label::set_recolor(l_power, true)?;
        label::set_align(l_power, label::LV_LABEL_ALIGN_RIGHT)?;
        obj::align(l_power, scr, obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0)?;
        widgets.power_label = l_power;
        let label_date = label::create(scr, ptr::null())?;
        label::set_long_mode(label_date, label::LV_LABEL_LONG_BREAK)?;
        obj::set_width(label_date, 200)?;
        obj::set_height(label_date, 200)?;
        label::set_text(label_date, &Strn::new(b"\x00"))?;
        label::set_align(label_date, label::LV_LABEL_ALIGN_CENTER)?;
        obj::align(label_date, scr, obj::LV_ALIGN_CENTER, 0, 40)?;
        widgets.date_label = label_date;
        obj::set_click(scr, true)?;
        Ok(())
    }
    /// Update the widgets in the Watch Face with the current state. Called by update_watch_face() below.
    pub fn update_widgets(widgets: &WatchFaceWidgets, state: &WatchFaceState)
     -> MynewtResult<()> {
        set_time_label(widgets, state)?;
        set_bt_label(widgets, state)?;
        set_power_label(widgets, state)?;
        Ok(())
    }
    /// Populate the Bluetooth Label with the Bluetooth status. Called by screen_time_update_screen() above.
    pub fn set_bt_label(widgets: &WatchFaceWidgets, state: &WatchFaceState)
     -> MynewtResult<()> {
        if state.ble_state == BleState::BLEMAN_BLE_STATE_DISCONNECTED {
            label::set_text(widgets.ble_label, &Strn::new(b"\x00"))?;
        } else {
            let color =
                match &state.ble_state {
                    BleState::BLEMAN_BLE_STATE_INACTIVE => "#000000",
                    BleState::BLEMAN_BLE_STATE_DISCONNECTED => "#f2495c",
                    BleState::BLEMAN_BLE_STATE_ADVERTISING => "#5794f2",
                    BleState::BLEMAN_BLE_STATE_CONNECTED => "#37872d",
                };
            static mut BLUETOOTH_STATUS: String = new_string();
            unsafe {
                BLUETOOTH_STATUS.clear();
                (&mut BLUETOOTH_STATUS).write_fmt(::core::fmt::Arguments::new_v1(&["",
                                                                                   " \u{f293}#\u{0}"],
                                                                                 &match (&color,)
                                                                                      {
                                                                                      (arg0,)
                                                                                      =>
                                                                                      [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                    ::core::fmt::Display::fmt)],
                                                                                  })).expect("bt fail");
                label::set_text(widgets.ble_label,
                                &to_strn(&BLUETOOTH_STATUS))?;
            }
        }
        Ok(())
    }
    /// Populate the Power Label with the battery status. Called by screen_time_update_screen() above.
    pub fn set_power_label(widgets: &WatchFaceWidgets, state: &WatchFaceState)
     -> MynewtResult<()> {
        let percentage = convert_battery_voltage(state.millivolts);
        let color =
            if percentage <= 20 {
                "#f2495c"
            } else if state.powered && !(state.charging) {
                "#73bf69"
            } else { "#fade2a" };
        let symbol = if state.powered { "\u{F0E7}" } else { " " };
        static mut BATTERY_STATUS: String = new_string();
        unsafe {
            BATTERY_STATUS.clear();
            (&mut BATTERY_STATUS).write_fmt(::core::fmt::Arguments::new_v1(&["",
                                                                             " ",
                                                                             "%",
                                                                             "#\nRUST (",
                                                                             "mV)\u{0}"],
                                                                           &match (&color,
                                                                                   &percentage,
                                                                                   &symbol,
                                                                                   &state.millivolts)
                                                                                {
                                                                                (arg0,
                                                                                 arg1,
                                                                                 arg2,
                                                                                 arg3)
                                                                                =>
                                                                                [::core::fmt::ArgumentV1::new(arg0,
                                                                                                              ::core::fmt::Display::fmt),
                                                                                 ::core::fmt::ArgumentV1::new(arg1,
                                                                                                              ::core::fmt::Display::fmt),
                                                                                 ::core::fmt::ArgumentV1::new(arg2,
                                                                                                              ::core::fmt::Display::fmt),
                                                                                 ::core::fmt::ArgumentV1::new(arg3,
                                                                                                              ::core::fmt::Display::fmt)],
                                                                            })).expect("batt fail");
            label::set_text(widgets.power_label, &to_strn(&BATTERY_STATUS))?;
        }
        obj::align(widgets.power_label, widgets.screen,
                   obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0)?;
        Ok(())
    }
    /// Populate the Time and Date Labels with the time and date. Called by screen_time_update_screen() above.
    pub fn set_time_label(widgets: &WatchFaceWidgets, state: &WatchFaceState)
     -> MynewtResult<()> {
        static mut TIME_BUF: String = new_string();
        unsafe {
            TIME_BUF.clear();
            (&mut TIME_BUF).write_fmt(::core::fmt::Arguments::new_v1_formatted(&["",
                                                                                 ":",
                                                                                 "\u{0}"],
                                                                               &match (&state.time.hour,
                                                                                       &state.time.minute)
                                                                                    {
                                                                                    (arg0,
                                                                                     arg1)
                                                                                    =>
                                                                                    [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                  ::core::fmt::Display::fmt),
                                                                                     ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                  ::core::fmt::Display::fmt)],
                                                                                },
                                                                               &[::core::fmt::rt::v1::Argument{position:
                                                                                                                   0usize,
                                                                                                               format:
                                                                                                                   ::core::fmt::rt::v1::FormatSpec{fill:
                                                                                                                                                       ' ',
                                                                                                                                                   align:
                                                                                                                                                       ::core::fmt::rt::v1::Alignment::Unknown,
                                                                                                                                                   flags:
                                                                                                                                                       8u32,
                                                                                                                                                   precision:
                                                                                                                                                       ::core::fmt::rt::v1::Count::Implied,
                                                                                                                                                   width:
                                                                                                                                                       ::core::fmt::rt::v1::Count::Is(2usize),},},
                                                                                 ::core::fmt::rt::v1::Argument{position:
                                                                                                                   1usize,
                                                                                                               format:
                                                                                                                   ::core::fmt::rt::v1::FormatSpec{fill:
                                                                                                                                                       ' ',
                                                                                                                                                   align:
                                                                                                                                                       ::core::fmt::rt::v1::Alignment::Unknown,
                                                                                                                                                   flags:
                                                                                                                                                       8u32,
                                                                                                                                                   precision:
                                                                                                                                                       ::core::fmt::rt::v1::Count::Implied,
                                                                                                                                                   width:
                                                                                                                                                       ::core::fmt::rt::v1::Count::Is(2usize),},}])).expect("time fail");
            label::set_text(widgets.time_label, &to_strn(&TIME_BUF))?;
        }
        let month_str = get_month_name(&state.time);
        static mut DATE_BUF: String = new_string();
        unsafe {
            DATE_BUF.clear();
            (&mut DATE_BUF).write_fmt(::core::fmt::Arguments::new_v1(&["",
                                                                       " ",
                                                                       " ",
                                                                       "\n\u{0}"],
                                                                     &match (&state.time.dayofmonth,
                                                                             &month_str,
                                                                             &state.time.year)
                                                                          {
                                                                          (arg0,
                                                                           arg1,
                                                                           arg2)
                                                                          =>
                                                                          [::core::fmt::ArgumentV1::new(arg0,
                                                                                                        ::core::fmt::Display::fmt),
                                                                           ::core::fmt::ArgumentV1::new(arg1,
                                                                                                        ::core::fmt::Display::fmt),
                                                                           ::core::fmt::ArgumentV1::new(arg2,
                                                                                                        ::core::fmt::Display::fmt)],
                                                                      })).expect("date fail");
            label::set_text(widgets.date_label, &to_strn(&DATE_BUF))?;
        }
        Ok(())
    }
    /// Start rendering the watch face every minute
    pub fn start_watch_face() -> MynewtResult<()> {
        console::print("Init Rust watch face...\n");
        console::flush();
        unsafe {
            WATCH_FACE_WIDGETS.screen =
                lv_disp_get_scr_act(obj::disp_get_default().expect("Failed to get display"));
        }
        create_widgets(unsafe { &mut WATCH_FACE_WIDGETS })?;
        let rc = unsafe { pinetime_lvgl_mynewt_render() };
        if !(rc == 0) { ::core::panicking::panic("LVGL render fail") };
        unsafe {
            os::os_callout_init(&mut WATCH_FACE_CALLOUT,
                                os::eventq_dflt_get().unwrap(),
                                Some(watch_face_callback), ptr::null_mut());
        }
        let rc =
            unsafe {
                os::os_callout_reset(&mut WATCH_FACE_CALLOUT,
                                     os::OS_TICKS_PER_SEC * 60)
            };
        if !(rc == 0) { ::core::panicking::panic("Timer fail") };
        Ok(())
    }
    /// Timer callback that is called every minute
    extern fn watch_face_callback(_ev: *mut os::os_event) {
        console::print("Update Rust watch face...\n");
        console::flush();
        let time = get_system_time().expect("Can't get system time");
        let state =
            WatchFaceState{time,
                           millivolts: 0,
                           charging: true,
                           powered: true,
                           ble_state: BleState::BLEMAN_BLE_STATE_CONNECTED,};
        update_widgets(unsafe { &WATCH_FACE_WIDGETS },
                       &state).expect("Update Watch Face fail");
        let rc = unsafe { pinetime_lvgl_mynewt_render() };
        if !(rc == 0) { ::core::panicking::panic("LVGL render fail") };
        let rc =
            unsafe {
                os::os_callout_reset(&mut WATCH_FACE_CALLOUT,
                                     os::OS_TICKS_PER_SEC * 60)
            };
        if !(rc == 0) { ::core::panicking::panic("Timer fail") };
    }
    /// Get the system time
    pub fn get_system_time() -> MynewtResult<WatchFaceTime> {
        static mut TV: os::os_timeval =
            unsafe {
                ::core::mem::transmute::<[u8; ::core::mem::size_of::<os::os_timeval>()],
                                         os::os_timeval>([0;
                                                             ::core::mem::size_of::<os::os_timeval>()])
            };
        static mut TZ: os::os_timezone =
            unsafe {
                ::core::mem::transmute::<[u8; ::core::mem::size_of::<os::os_timezone>()],
                                         os::os_timezone>([0;
                                                              ::core::mem::size_of::<os::os_timezone>()])
            };
        let rc = unsafe { os::os_gettimeofday(&mut TV, &mut TZ) };
        if !(rc == 0) { ::core::panicking::panic("Can't get time") };
        static mut CT: clocktime =
            unsafe {
                ::core::mem::transmute::<[u8; ::core::mem::size_of::<clocktime>()],
                                         clocktime>([0;
                                                        ::core::mem::size_of::<clocktime>()])
            };
        let rc = unsafe { timeval_to_clocktime(&TV, &TZ, &mut CT) };
        if !(rc == 0) { ::core::panicking::panic("Can't convert time") };
        let result =
            unsafe {
                WatchFaceTime{year: CT.year as u16,
                              month: CT.mon as u8,
                              dayofmonth: CT.day as u8,
                              hour: CT.hour as u8,
                              minute: CT.min as u8,
                              second: CT.sec as u8,
                              fracs: 0,
                              dayofweek: CT.dow as u8,}
            };
        Ok(result)
    }
    /// Get month short name
    pub fn get_month_name(time: &WatchFaceTime) -> String {
        match time.month {
            1 => String::from("JAN"),
            2 => String::from("FEB"),
            3 => String::from("MAR"),
            4 => String::from("APR"),
            5 => String::from("MAY"),
            6 => String::from("JUN"),
            7 => String::from("JUL"),
            8 => String::from("AUG"),
            9 => String::from("SEP"),
            10 => String::from("OCT"),
            11 => String::from("NOV"),
            12 => String::from("DEC"),
            _ => String::from("???"),
        }
    }
    /// Convert battery voltage to percentage
    pub fn convert_battery_voltage(_voltage: u32) -> i32 { 50 }
    /// Timer that is triggered every minute to update the watch face
    static mut WATCH_FACE_CALLOUT: os::os_callout =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<os::os_callout>()],
                                     os::os_callout>([0;
                                                         ::core::mem::size_of::<os::os_callout>()])
        };
    /// LVGL Widgets for the watch face
    static mut WATCH_FACE_WIDGETS: WatchFaceWidgets =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<WatchFaceWidgets>()],
                                     WatchFaceWidgets>([0;
                                                           ::core::mem::size_of::<WatchFaceWidgets>()])
        };
    /// Create a new String
    const fn new_string() -> String {
        heapless::String(heapless::i::String::new())
    }
    /// Convert a static String to null-terminated Strn
    fn to_strn(str: &'static String) -> Strn { Strn::new(str.as_bytes()) }
    /// Limit Strings to 64 chars (which may include multiple color codes like "#ffffff")
    type String = heapless::String<heapless::consts::U64>;
    /// State for the Watch Face, shared between GUI and control. TODO: Sync with widgets/home_time/include/home_time.h
    #[repr(C)]
    pub struct WatchFaceState {
        pub ble_state: BleState,
        pub time: WatchFaceTime,
        pub millivolts: u32,
        pub charging: bool,
        pub powered: bool,
    }
    /// Widgets for the Watch Face, private to Rust. TODO: Sync with widgets/home_time/include/home_time.h
    #[repr(C)]
    #[allow(non_camel_case_types)]
    pub struct WatchFaceWidgets {
        pub screen: *mut obj::lv_obj_t,
        pub time_label: *mut obj::lv_obj_t,
        pub date_label: *mut obj::lv_obj_t,
        pub ble_label: *mut obj::lv_obj_t,
        pub power_label: *mut obj::lv_obj_t,
    }
    #[repr(u8)]
    #[allow(non_camel_case_types)]
    #[allow(dead_code)]
    pub enum BleState {
        BLEMAN_BLE_STATE_INACTIVE = 0,
        BLEMAN_BLE_STATE_ADVERTISING = 1,
        BLEMAN_BLE_STATE_DISCONNECTED = 2,
        BLEMAN_BLE_STATE_CONNECTED = 3,
    }
    #[allow(non_camel_case_types)]
    #[allow(dead_code)]
    impl ::core::marker::StructuralPartialEq for BleState { }
    #[automatically_derived]
    #[allow(unused_qualifications)]
    #[allow(non_camel_case_types)]
    #[allow(dead_code)]
    impl ::core::cmp::PartialEq for BleState {
        #[inline]
        fn eq(&self, other: &BleState) -> bool {
            {
                let __self_vi =
                    unsafe { ::core::intrinsics::discriminant_value(&*self) };
                let __arg_1_vi =
                    unsafe {
                        ::core::intrinsics::discriminant_value(&*other)
                    };
                if true && __self_vi == __arg_1_vi {
                    match (&*self, &*other) { _ => true, }
                } else { false }
            }
        }
    }
    #[repr(C)]
    pub struct WatchFaceTime {
        pub year: u16,
        pub month: u8,
        pub dayofmonth: u8,
        pub hour: u8,
        pub minute: u8,
        pub second: u8,
        pub fracs: u8,
        pub dayofweek: u8,
    }
    /// Create the Watch Face, populated with widgets. Called by _screen_time_create() in screen_time.c.
    #[no_mangle]
    extern "C" fn create_watch_face(widgets: *mut WatchFaceWidgets) -> i32 {
        if !!widgets.is_null() { ::core::panicking::panic("widgets null") };
        unsafe { create_widgets(&mut *widgets) }.expect("create_screen fail");
        0
    }
    /// Populate the Watch Face with the current status. Called by _screen_time_update_screen() in screen_time.c.
    #[no_mangle]
    extern "C" fn update_watch_face(widgets: *const WatchFaceWidgets,
                                    state: *const WatchFaceState) -> i32 {
        if !!widgets.is_null() { ::core::panicking::panic("widgets null") };
        unsafe {
            update_widgets(&*widgets, &*state)
        }.expect("update_widgets fail");
        0
    }
    extern {
        /// Render the LVGL display. Defined in libs/pinetime_lvgl_mynewt/src/pinetime/lvgl.c
        fn pinetime_lvgl_mynewt_render()
        -> i32;
        /// Convert timeval to clocktime. From https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h
        fn timeval_to_clocktime(tv: *const os::os_timeval,
                                tz: *const os::os_timezone,
                                ct: *mut clocktime)
        -> i32;
        /// Get active screen for LVGL display. From LVGL.
        fn lv_disp_get_scr_act(disp: *mut obj::lv_disp_t)
        -> *mut obj::lv_obj_t;
        /// Style for the Time Label
        #[allow(dead_code)]
        static style_time: obj::lv_style_t ;
    }
    /// Mynewt Clock Time. From https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h
    #[repr(C)]
    #[allow(non_camel_case_types)]
    pub struct clocktime {
        pub year: i32,
        pub mon: i32,
        pub day: i32,
        pub hour: i32,
        pub min: i32,
        pub sec: i32,
        pub dow: i32,
        pub usec: i32,
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use mynewt::{kernel::os, sys::console};
pub fn handle_touch(_x: u16, _y: u16) {
    console::print("touch not handled\n");
    console::flush();
}
///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
extern "C" fn main() -> ! {
    mynewt::sysinit();
    extern {
        fn start_ble()
        -> i32;
    }
    let rc = unsafe { start_ble() };
    if !(rc == 0) { ::core::panicking::panic("BLE fail") };
    watch_face::start_watch_face().expect("Watch Face fail");
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
    if unsafe { !IN_PANIC } {
        unsafe { IN_PANIC = true };
        let payload = info.payload().downcast_ref::<&str>().unwrap();
        console::print(payload);
        console::print("\n");
        console::flush();
    }
    bkpt();
    extern {
        fn HardFault_Handler();
    }
    unsafe { HardFault_Handler() };
    loop  { }
}
/// Set to true if we are already in the panic handler
static mut IN_PANIC: bool = false;
