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
//!  Transmit sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
//!  The sensor data will be transmitted over NB-IoT.
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust-nbiot/apps/my_sensor_app/OLDsrc/network.c`

use mynewt::{
    result::*,                  //  Import Mynewt result and error types
    hw::sensor::{               //  Import Mynewt Sensor API
        SensorValue, SensorValueType,
    },
    sys::console,               //  Import Mynewt Console API
    encoding::coap_context::*,  //  Import Mynewt Encoding API
    libs::{
        sensor_network,         //  Import Mynewt Sensor Network API
    },
    coap, d, Strn,              //  Import Mynewt macros
};
use mynewt_macros::strn;        //  Import Mynewt procedural macros

///  Aggregate the sensor value with other sensor data before transmitting to server.
///  If the sensor value is a GPS geolocation, we remember it and attach it to other sensor data for transmission.
#[cfg(feature = "use_float")]  //  If floating-point is enabled...
pub fn aggregate_sensor_data(sensor_value: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
    if let SensorValueType::Geolocation {..} = sensor_value.value {
        //  If this is a geolocation, save the geolocation for later transmission.
        unsafe { CURRENT_GEOLOCATION = sensor_value.value };  //  Current geolocation is unsafe because it's a mutable static
        Ok(())
    } else {
        //  If this is temperature sensor data, attach the current geolocation to the sensor data for transmission.
        let transmit_value = SensorValue {
            geo: unsafe { CURRENT_GEOLOCATION },  //  Current geolocation is unsafe because it's a mutable static
            ..*sensor_value                       //  Copy the sensor name and value for transmission
        };
        //  Transmit sensor value with geolocation and return the result
        send_sensor_data(&transmit_value)
    }
}

#[cfg(not(feature = "use_float"))]  //  If floating-point and geolocation are disabled, send sensor data without geolocation
pub fn aggregate_sensor_data(sensor_value: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
    //  Transmit sensor value without geolocation and return the result
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
fn send_sensor_data(val: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
    console::print("Rust send_sensor_data: ");
    if let SensorValueType::Uint(i) = val.value {
        console::print_strn(val.key);
        console::print("=");
        console::printint(i as i32);
    }
    console::print("\n");
    console::flush(); ////

    //  Get a randomly-generated device ID that changes each time we restart the device.
    let device_id = strn!("NO_DEVICE_ID"); //  TODO: sensor_network::get_device_id() ? ;

    //  Start composing the CoAP Server message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    let rc = sensor_network::init_server_post( strn!(()) ) ? ;  //  `strn!(())` means use default CoAP URI in `syscfg.yml`

    //  If network transport not ready, tell caller (Sensor Listener) to try again later.
    if !rc { return Err(MynewtError::SYS_EAGAIN); }

    //  Compose the CoAP Payload using the coap!() macro.
    //  Select @json or @cbor To encode CoAP Payload in JSON or CBOR format.
    let _payload = coap!( @json {        
        //  Create `values` as an array of items under the root.
        //  Assume `val` contains `key: "t", val: 2870, geo: { lat, long }`. 
        //  Append to the `values` array the Sensor Key, Value and optional Geolocation:
        //  `{"key": "t", "value": 2870, "geo": { "lat": ..., "long": ... }}`
        val,

        //  Append to the `values` array the random device ID:
        //  `{"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"}`
        "device": &device_id,
    });

    //  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    sensor_network::do_server_post() ? ;

    //  Display the URL with the random device ID for viewing the sensor data.
    console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=");
    console::print_strn(&device_id); console::print("\n");

    //  The CoAP Background Task will transmit the message in the background.
    Ok(())
}

///  Current geolocation recorded from GPS
#[cfg(feature = "use_float")]  //  If floating-point is enabled...
static mut CURRENT_GEOLOCATION: SensorValueType = SensorValueType::None;