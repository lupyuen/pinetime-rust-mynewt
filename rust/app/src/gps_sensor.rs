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
//!  Poll the GPS sensor every 10 seconds. Transmit the sensor data to the CoAP server after polling.
//!  This is the Rust version of https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-nbiot/apps/my_sensor_app/OLDsrc/gps_sensor.c

use mynewt::{
    result::*,                              //  Import Mynewt API Result and Error types
    kernel::os,                             //  Import Mynewt OS API
    hw::sensor::{        
        self,                               //  Import Mynewt Sensor API functions
        sensor_ptr,                         //  Import Mynewt Sensor API types
        sensor_arg, sensor_data_ptr, sensor_listener,
        sensor_geolocation_data, sensor_type_t,
        SensorValue, SensorValueType,
    },
    sys::console,                           //  Import Mynewt Console API
    fill_zero, Strn,                        //  Import Mynewt macros    
};
use mynewt_macros::{ init_strn };           //  Import Mynewt procedural macros
use crate::app_network::send_sensor_data;   //  Import `app_network.rs` for sending sensor data

///  Sensor to be polled: `gps_l70r_0` is the Quectel L70-R GPS module
static GPS_DEVICE: Strn      = init_strn!("gps_l70r_0");
///  Poll sensor every 10,000 milliseconds (10 seconds)  
const GPS_POLL_TIME: u32     = (10 * 1000);  
///  Use key (field name) `geolocation` to transmit GPS geolocation to CoAP Server
const GPS_SENSOR_KEY: Strn   = init_strn!("geolocation");
///  Type of sensor: Raw temperature sensor (integer sensor values 0 to 4095)
const GPS_SENSOR_TYPE: sensor_type_t = sensor::SENSOR_TYPE_GEOLOCATION;

///  Ask Mynewt to poll the GPS sensor and call `handle_gps_data()`
///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
pub fn start_gps_listener() -> MynewtResult<()>  {  //  Returns an error code upon error.
    console::print("Rust GPS poll\n");

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    let sensor = sensor::mgr_find_next_bydevname(&GPS_DEVICE, core::ptr::null_mut()) ? ;
    assert!(!sensor.is_null(), "no gps");

    //  At power on, we ask Mynewt to poll our sensor every 10 seconds.
    sensor::set_poll_rate_ms(&GPS_DEVICE, GPS_POLL_TIME) ? ;

    //  Define the listener function to be called after polling the temperature sensor.
    let listener = sensor_listener {
        sl_sensor_type: GPS_SENSOR_TYPE,       //  Type of sensor: GPS Geolocation
        sl_func       : sensor::as_untyped(handle_gps_data),  //  Listener function
        ..fill_zero!(sensor_listener)           //  Set other fields to 0
    };

    //  Register the Listener Function to be called with the polled sensor data.
    sensor::register_listener(sensor, listener) ? ;  //  `?` means in case of error, return error now.

    //  Return `Ok()` to indicate success.  This line should not end with a semicolon (;).
    Ok(())
}

///  This listener function is called every 10 seconds by Mynewt to handle the polled GPS data.
///  Return 0 if we have handled the GPS data successfully.
extern fn handle_gps_data(sensor: sensor_ptr, _arg: sensor_arg, 
    sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> MynewtError {
    console::print("Rust handle_sensor_data\n");

    //  Check that the GPS geolocation data is available.
    if sensor_data.is_null() { return MynewtError::SYS_EINVAL; }  //  Exit if GPS is not ready
    assert!(!sensor.is_null(), "null sensor");

    //  Convert the GPS geolocation for transmission.
    let sensor_value = convert_gps_data(sensor_data, sensor_type);
    if let SensorValueType::None = sensor_value.val { assert!(false, "bad type"); }

    //  Show the GPS geolocation.
    if let SensorValueType::Geolocation { latitude, longitude, altitude } = sensor_value.val {
        console::print("lat: ");   console::printdouble(latitude);
        console::print(", lng: "); console::printdouble(longitude);
        console::print(", alt: "); console::printfloat(altitude as f32);
        console::print("\n"); console::flush();
    }

    //  Aggregate the GPS geolocation with other sensor data before transmitting to server.
    aggregate_sensor_data(&sensor_value);

    //  Return 0 to Mynewt to indicate no error.  Should not end with a semicolon (;).
    MynewtError::SYS_EOK
}

///  Convert the geolocation value received from Mynewt into a Geolocation `SensorValue` for transmission. 
///  `sensor_type` indicates the type of data in `sensor_data`.
#[allow(non_snake_case, unused_variables)]
fn convert_gps_data(sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> SensorValue {
    console::print("GPS listener got geolocation\n");
    //  Construct and return a new `SensorValue` (without semicolon)
    SensorValue {
        key: &GPS_SENSOR_KEY,  //  Sensor data key is `geolocation`
        val: match sensor_type {
            SENSOR_TYPE_GEOLOCATION => {  //  If sensor data is GPS geolocation...
                //  Interpret the sensor data as a `sensor_geolocation_data` struct that contains GPS geolocation.
                let mut geolocation = fill_zero!(sensor_geolocation_data);
                let rc = unsafe { sensor::get_geolocation_data(sensor_data, &mut geolocation) };
                assert_eq!(rc, 0, "geodata fail");
                //  Check that the geolocation data is valid.
                assert!(
                    geolocation.sgd_latitude_is_valid  != 0 &&
                    geolocation.sgd_longitude_is_valid != 0 &&
                    geolocation.sgd_altitude_is_valid  != 0, 
                    "bad geodata");                
                //  Geolocation data is valid.  Return it.
                SensorValueType::Geolocation {
                    latitude:  geolocation.sgd_latitude,
                    longitude: geolocation.sgd_longitude,
                    altitude:  geolocation.sgd_altitude,
                }
            }
            //  Unknown type of sensor value
            //  _ => { assert!(false, "sensor type"); SensorValueType::Uint(0) }
        }
    }
}

//  Aggregate the sensor value with other sensor data before transmitting to server.
fn aggregate_sensor_data(sensor_value: &SensorValue) {
}