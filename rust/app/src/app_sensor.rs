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
//!  This is the Rust version of https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/nrf52/apps/my_sensor_app/OLDsrc/sensor.c

use mynewt::{
    result::*,                              //  Import Mynewt API Result and Error types
    hw::sensor_mgr,                         //  Import Mynewt Sensor Manager API
    hw::sensor::{        
        self,                               //  Import Mynewt Sensor API
        sensor_type_t,
    },
    sys::console,                           //  Import Mynewt Console API
    Strn,                                   //  Import Mynewt macros    
};
use mynewt_macros::{ init_strn };           //  Import Mynewt procedural macros
use crate::app_network;                     //  Import `app_network.rs` for sending sensor data

///  Sensor to be polled: `temp_stub_0` is the stub temperature sensor that simulates a temperature sensor
static SENSOR_DEVICE: Strn      = init_strn!("temp_stub_0");
///  Poll sensor every 10,000 milliseconds (10 seconds)  
const SENSOR_POLL_TIME: u32     = (10 * 1000);  
///  Use key (field name) `t` to transmit raw temperature to CoAP Server
const TEMP_SENSOR_KEY: Strn     = init_strn!("t");
///  Type of sensor: Raw temperature sensor (integer sensor values 0 to 4095)
const TEMP_SENSOR_TYPE: sensor_type_t = sensor::SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;

///  Ask Mynewt to poll or read the temperature sensor and call `aggregate_sensor_data()`
///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
pub fn start_sensor_listener() -> MynewtResult<()>  {  //  Returns an error code upon error.
    console::print("Rust TMP poll\n");

    //  Fetch the sensor by name.
    let sensor = sensor_mgr::find_bydevname(&SENSOR_DEVICE)
        .next()             //  Fetch the first sensor that matches
        .expect("no TMP");  //  Stop if no sensor found

    //  At power on, we ask Mynewt to poll our temperature sensor every 10 seconds.
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;

    // Create a sensor listener that will call function `aggregate_sensor_data` after polling the sensor data
    let listener = sensor::new_sensor_listener(
        &TEMP_SENSOR_KEY,   //  Transmit as field: `t`
        TEMP_SENSOR_TYPE,   //  Type of sensor data: Raw temperature (integer from 0 to 4095)
        app_network::aggregate_sensor_data  //  Call this function with the polled data: `aggregate_sensor_data`
    ) ? ;

    //  Register the Listener Function to be called with the polled sensor data.
    sensor::register_listener(sensor, listener) ? ;  //  `?` means in case of error, return error now.

    //  Return `Ok()` to indicate success.  This line should not end with a semicolon (;).
    Ok(())
}