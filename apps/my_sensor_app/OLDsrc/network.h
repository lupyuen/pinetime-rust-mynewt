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
#ifndef __APP_NETWORK_H__
#define __APP_NETWORK_H__
#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

struct sensor_value;

//  Compose a CoAP JSON message with the Sensor Key (field name) and Value in val 
//  and send to the CoAP server.  The message will be enqueued for transmission by the CoAP / OIC 
//  Background Task so this function will return without waiting for the message 
//  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
int send_sensor_data(struct sensor_value *val);

#ifdef __cplusplus
}
#endif
#endif  //  __APP_NETWORK_H__
