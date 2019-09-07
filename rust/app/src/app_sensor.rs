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
//!  Poll the temperature sensor every 10 seconds. Transmit the sensor data to the CoAP server after polling.
//!  This is the Rust version of https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-nbiot/apps/my_sensor_app/OLDsrc/sensor.c

use mynewt::{
    result::*,                              //  Import Mynewt API Result and Error types
    kernel::os,                             //  Import Mynewt OS API
    hw::sensor::{        
        self,                               //  Import Mynewt Sensor API functions
        sensor_ptr,                         //  Import Mynewt Sensor API types
        sensor_arg, sensor_data_ptr, sensor_listener,
        sensor_temp_raw_data, sensor_type_t,
        SensorValue, SensorValueType,
    },
    sys::console,                           //  Import Mynewt Console API
    fill_zero, Strn,                        //  Import Mynewt macros    
};
use mynewt_macros::{ init_strn };           //  Import Mynewt procedural macros
use crate::app_network::send_sensor_data;   //  Import `app_network.rs` for sending sensor data

///  Sensor to be polled: `temp_stm32_0` is the internal temperature sensor
static SENSOR_DEVICE: Strn      = init_strn!("temp_stm32_0");
///  Poll sensor every 10,000 milliseconds (10 seconds)  
const SENSOR_POLL_TIME: u32     = (10 * 1000);  
///  Use key (field name) `t` to transmit raw temperature to CoAP Server
const TEMP_SENSOR_KEY: Strn     = init_strn!("t");
///  Type of sensor: Raw temperature sensor (integer sensor values 0 to 4095)
const TEMP_SENSOR_TYPE: sensor_type_t = sensor::SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;

///  Ask Mynewt to poll or read the temperature sensor and call `handle_sensor_data()`
///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
pub fn start_sensor_listener() -> MynewtResult<()>  {  //  Returns an error code upon error.
    console::print("Rust TMP poll\n");

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    let sensor = sensor::mgr_find_next_bydevname(&SENSOR_DEVICE, core::ptr::null_mut()) ? ;
    assert!(!sensor.is_null(), "no sensor");

    //  Read the sensor by polling (at power on) or directly (at sleep wakeup).
    if !standby_wakeup() {
        //  At power on, we ask Mynewt to poll our sensor every 20 seconds.
        sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;

        //  Define the listener function to be called after polling the temperature sensor.
        let listener = sensor_listener {
            sl_sensor_type: TEMP_SENSOR_TYPE,       //  Type of sensor: Raw ambient temperature
            sl_func       : sensor::as_untyped(handle_sensor_data),  //  Listener function
            ..fill_zero!(sensor_listener)           //  Set other fields to 0
        };

        //  Register the Listener Function to be called with the polled sensor data.
        sensor::register_listener(sensor, listener) ? ;  //  `?` means in case of error, return error now.
    } else {
        //  At sleep wakeup, read the sensor directly instead of polling.
        sensor::read(
            sensor, 
            TEMP_SENSOR_TYPE,  //  Type of sensor: Raw ambient temperature
            sensor::as_untyped(handle_sensor_data),  //  Handler function
            core::ptr::null_mut(), 
            os::OS_TIMEOUT_NEVER
        ) ? ;
    }
    //  Return `Ok()` to indicate success.  This line should not end with a semicolon (;).
    Ok(())
}

///  This listener function is called every 10 seconds by Mynewt to handle the polled sensor data.
///  Return 0 if we have handled the sensor data successfully.
extern fn handle_sensor_data(sensor: sensor_ptr, _arg: sensor_arg, 
    sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> MynewtError {
    console::print("Rust handle_sensor_data\n");

    //  Check that the temperature data is valid.
    if sensor_data.is_null() { return MynewtError::SYS_EINVAL; }  //  Exit if data is missing
    assert!(!sensor.is_null(), "null sensor");

    //  Get the temperature sensor value. It could be raw or computed.
    let sensor_value = convert_sensor_data(sensor_data, sensor_type);
    if let SensorValueType::None = sensor_value.val { assert!(false, "bad type"); }

    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    let res = send_sensor_data(&sensor_value);

    //  `SYS_EAGAIN` means that the Network Task is still starting up the network.
    //  We drop the sensor data and send at the next poll.
    if let Err(err) = res {  //  `if let` will assign `err` to the error code inside `res`
        if err == MynewtError::SYS_EAGAIN {
            console::print("TMP network not ready\n");
            return MynewtError::SYS_EOK; 
        }            
    }
    //  Return 0 to Mynewt to indicate no error.  Should not end with a semicolon (;).
    MynewtError::SYS_EOK
}

///  Convert the raw temperature value received from Mynewt into a `SensorValue` for transmission, which includes the sensor data key `t`. 
///  `sensor_type` indicates the type of data in `sensor_data`.
#[allow(non_snake_case, unused_variables)]
fn convert_sensor_data(sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> SensorValue {
    console::print("TMP listener got rawtmp\n");
    //  Construct and return a new `SensorValue` (without semicolon)
    SensorValue {
        key: &TEMP_SENSOR_KEY,  //  Sensor data key is `t`
        val: match sensor_type {
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
                //  Interpret the sensor data as a `sensor_temp_raw_data` struct that contains raw temp.
                let mut rawtempdata = fill_zero!(sensor_temp_raw_data);
                let rc = unsafe { sensor::get_temp_raw_data(sensor_data, &mut rawtempdata) };
                assert_eq!(rc, 0, "rawtmp fail");
                //  Check that the raw temperature data is valid.
                assert_ne!(rawtempdata.strd_temp_raw_is_valid, 0, "bad rawtmp");                
                //  Raw temperature data is valid.  Return it.
                SensorValueType::Uint(rawtempdata.strd_temp_raw)  //  Raw Temperature in integer (0 to 4095)
            }
            //  Unknown type of sensor value
            //  _ => { assert!(false, "sensor type"); SensorValueType::Uint(0) }
        }
    }
}

extern {
    fn power_standby_wakeup() -> i32;
}
fn standby_wakeup() -> bool {
    if unsafe { power_standby_wakeup() == 0 } { false }
    else { true }
}