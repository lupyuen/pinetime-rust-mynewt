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
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/send_coap.c`

use mynewt::{
    result::*,            //  Import Mynewt result and error types
    hw::sensor::{        
        SensorValue,
        SensorValueType,
    },
    sys::console,         //  Import Mynewt Console API
    encoding::{
        coap_context::{   //  Import Mynewt JSON Encoder Context
            self,
            COAP_CONTEXT,
            ToBytesOptionalNull,
        },
        tinycbor,         //  Import Mynewt TinyCBOR API
    },
    libs::{
        sensor_network,   //  Import Mynewt Sensor Network API
    },
    coap, d,              //  Import Mynewt macros
    Strn,
};
use proc_macros::{ strn }; //  Import procedural macros
 
/// Compose a CoAP JSON message with the Sensor Key (field name) and Value in `val`
/// and send to the CoAP server.  The message will be enqueued for transmission by the CoAP / OIC 
/// Background Task so this function will return without waiting for the message to be transmitted.
/// Return `Ok()` if successful, `SYS_EAGAIN` if network is not ready yet.
/// For the CoAP server hosted at thethings.io, the CoAP payload should be encoded in JSON like this:
/// ```json
/// {"values":[
///   {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
///   {"key":"t",      "value":1715}
/// ]}
/// ```
pub fn send_sensor_data(val: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
    console::print(b"Rust send_sensor_data\n");
    if let SensorValueType::None = val.val { assert!(false); }

    //  Start composing the CoAP Server message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    let rc = sensor_network::init_server_post(strn!("")) ? ;
    if !rc { return Err(MynewtError::SYS_EAGAIN); }  //  If network transport not ready, tell caller (Sensor Listener) to try again later.

    //  Compose the CoAP Payload using the coap!() macro.
    let _payload = coap!(
        //  To encode payload in JSON format: (`COAP_JSON_ENCODING: 1` in `syscfg.yml`)
        //  @json {
        
        //  To encode payload in CBOR format: (`COAP_CBOR_ENCODING: 1` in `syscfg.yml`)
        @cbor {
            //  Create "values" as an array of items under the root.
            //  Append to the "values" array:
            //  {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
            //  TODO: "device": device_id,

            //  Append to the "values" array the Sensor Key and Sensor Value:
            //  {"key": "t", "value": 2870}
            val,
        }
    );

    //  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    sensor_network::do_server_post() ? ;

    console::print(b"NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n");  //  , device_id);

    //  The CoAP Background Task will call oc_tx_ucast() in the network driver to transmit the message.
    Ok(())
}