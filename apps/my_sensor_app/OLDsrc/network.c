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
//  Transmit sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
//  The sensor data will be transmitted over NB-IoT or WiFi.
//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes response parsing bugs.  The patched file must be present in that location.

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <console/console.h>  //  For Mynewt console output. Actually points to libs/semihosting_console
#include <sensor_network/sensor_network.h>  //  For Sensor Network library
#include <sensor_coap/sensor_coap.h>        //  For Sensor CoAP library
#include "geolocate.h"                      //  For geolocate()
#include "network.h"

int send_sensor_data(struct sensor_value *val) {
    //  Compose a CoAP JSON message with the Sensor Key (field name) and Value in val 
    //  and send to the CoAP server.  The message will be enqueued for transmission by the CoAP / OIC 
    //  Background Task so this function will return without waiting for the message 
    //  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.

    //  For the CoAP server hosted at thethings.io, the CoAP payload should be encoded in JSON like this:
    //  {"values":[
    //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    //    {"key":"t",      "value":1715}
    //  ]}
    assert(val);
    const char *device_id = get_device_id();  assert(device_id);

    //  Start composing the CoAP Server message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    bool rc = init_server_post(NULL);
    if (!rc) { return SYS_EAGAIN; }  //  If network transport not ready, tell caller (Sensor Listener) to try again later.

    assert(false);  //  TODO: Call sensor_network_prepare_post() in CP_ROOT

    //  Compose the CoAP Payload in JSON using the CP macros.
    CP_ROOT({                     //  Create the payload root
        CP_ARRAY(root, values, {  //  Create "values" as an array of items under the root
            //  Append to the "values" array:
            //  {"key": "device", "value": "0102030405060708090a0b0c0d0e0f10"},
            CP_ITEM_STR(values, "device", device_id);

            //  Append to the "values" array the Sensor Key and Sensor Value:
            //  {"key": "t", "value": 2870}
            CP_ITEM_INT_VAL(values, val);
        });                       //  End CP_ARRAY: Close the "values" array
    });                           //  End CP_ROOT:  Close the payload root

    //  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    rc = do_server_post();  assert(rc);
    console_printf("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n", device_id);

    //  The CoAP Background Task will call oc_tx_ucast() in the network driver to transmit the message.
    return 0;
}
