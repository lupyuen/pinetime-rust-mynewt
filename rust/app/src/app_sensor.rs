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

use mynewt::{
    result::*,                              //  Import Mynewt API Result and Error types
    hw::sensor::{        
        self,                               //  Import Mynewt Sensor API functions
        sensor_ptr,                         //  Import Mynewt Sensor API types
        sensor_arg,
        sensor_data_ptr,
        sensor_listener,
        sensor_temp_data,
        sensor_temp_raw_data,
        sensor_type_t,
        SensorValue,
        SensorValueType,
    },
    sys::console,                           //  Import Mynewt Console API
    fill_zero,                              //  Import Mynewt macros
    Strn,
};
use proc_macros::{ init_strn };             //  Import procedural macros
use crate::app_network::send_sensor_data;   //  Import `app_network.rs` for sending sensor data

///  Sensor to be polled
static SENSOR_DEVICE: Strn = init_strn!("temp_stm32_0");
///  Poll sensor every 10,000 milliseconds (10 seconds)  
const SENSOR_POLL_TIME: u32  = (10 * 1000);  
///  Use key (field name) `t` to transmit raw temperature to CoAP Server
const TEMP_SENSOR_KEY: &str = "t";
///  Set to raw sensor type
const TEMP_SENSOR_TYPE: sensor_type_t = sensor::SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;  

///  Ask Mynewt to poll the temperature sensor every 10 seconds and call `handle_sensor_data()`.
///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
pub fn start_sensor_listener() -> MynewtResult<()>  {  //  Returns an error code upon error.
    console::print(b"Rust TMP poll \n");  //  SENSOR_DEVICE "\n";

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is "temp_stm32_0", SENSOR_POLL_TIME is 10,000.
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    let sensor = sensor::mgr_find_next_bydevname(&SENSOR_DEVICE, unsafe { sensor::null_sensor() }) ? ;
    assert!(unsafe{ !sensor::is_null_sensor(sensor) });

    //  Define the listener function to be called after polling the temperature sensor.
    let listener = sensor_listener {
        sl_sensor_type: TEMP_SENSOR_TYPE,       //  Type of sensor: ambient temperature
        sl_func       : sensor::as_untyped(handle_sensor_data),  //  Listener function
        ..fill_zero!(sensor_listener)           //  Set other fields to 0
    };

    //  Register the Listener Function to be called every 10 seconds, with the polled sensor data.
    sensor::register_listener(sensor, listener)?;  //  `?` means in case of error, return error now.

    //  Return `Ok()` to indicate success.  This line should not end with a semicolon (;).
    Ok(())
}

///  This listener function is called every 10 seconds by Mynewt to handle the polled sensor data.
///  Return 0 if we have handled the sensor data successfully.
extern fn handle_sensor_data(sensor: sensor_ptr, _arg: sensor_arg, 
    sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> MynewtError {
    console::print(b"Rust handle_sensor_data\n");
    //  Check that the temperature data is valid.
    //  TODO
    if unsafe { sensor::is_null_sensor_data(sensor_data) } { return MynewtError::SYS_EINVAL; }  //  Exit if data is missing
    assert!(unsafe { !sensor::is_null_sensor(sensor) });

    //  Get the temperature sensor value. It could be raw or computed.
    let sensor_value = get_temperature(sensor_data, sensor_type);
    if let SensorValueType::None = sensor_value.val { assert!(false); }  //  Invalid type

    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    let rc = send_sensor_data(&sensor_value);

    //  SYS_EAGAIN means that the Network Task is still starting up the ESP8266.
    //  We drop the sensor data and send at the next poll.
    if let Err(err) = rc {  //  `if let` will assign `err` to the error code inside `rc`
        if err == MynewtError::SYS_EAGAIN {
            console::print(b"TMP network not ready\n");
            return MynewtError::SYS_EOK; 
        }            
    }
    //  Return 0 to Mynewt to indicate no error.  Should not end with a semicolon (;).
    MynewtError::SYS_EOK
}

///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
///  the raw or computed temperature, as well as the key and value type.
#[allow(unreachable_patterns)]
#[allow(unused_variables)]
fn get_temperature(sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> SensorValue {
    let mut return_value = SensorValue::default();
    match sensor_type {                           //  Is this raw or computed temperature?
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
            //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
            let mut rawtempdata = fill_zero!(sensor_temp_raw_data);
            let rc = unsafe { sensor::get_temp_raw_data(sensor_data, &mut rawtempdata) };
            assert!(rc == 0);

            //  Check that the raw temperature data is valid.
            if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid

            //  Raw temperature data is valid.  Copy and display it.
            return_value.val = SensorValueType::Uint(rawtempdata.strd_temp_raw);  //  Raw Temperature in integer (0 to 4095)
            console::print(b"TMP listener got rawtmp \n");  // return_value->int_val);
        },
        SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
            //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
            let mut tempdata = fill_zero!(sensor_temp_data);
            let rc = unsafe { sensor::get_temp_data(sensor_data, &mut tempdata) };
            assert!(rc == 0);

            //  Check that the computed temperature data is valid.
            if tempdata.std_temp_is_valid() == 0 { return return_value; }  //  Exit if data is not valid

            //  Computed temperature data is valid.  Copy and display it.
            return_value.val = SensorValueType::Float(tempdata.std_temp);  //  Temperature in floating point.
            /*
            #if !MYNEWT_VAL(RAW_TEMP)  //  The following line contains floating-point code. We should compile only if we are not using raw temp.
                        console::printf("TMP poll data: tmp ");  console::printfloat(return_value->float_val);  console::printf("\n");  ////
            #endif  //  !MYNEWT_VAL(RAW_TEMP)
            */
        },
        _ => {
            assert!(false);  //  Unknown temperature sensor type
            return return_value;
        }
    }
    //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
    return_value.key = TEMP_SENSOR_KEY;
    return_value  //  Should not end with a semicolon (;)
}
