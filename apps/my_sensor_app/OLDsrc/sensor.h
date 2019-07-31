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
//  Poll the temperature sensor every 10 seconds. Transmit the sensor data to the CoAP server after polling.
#ifndef __APP_SENSOR_H__
#define __APP_SENSOR_H__
#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Ask Mynewt to poll the temperature sensor every 10 seconds and call `handle_sensor_data()`.
//  Return 0 if successful.
int start_sensor_listener(void);

#ifdef __cplusplus
}
#endif
#endif  //  __APP_SENSOR_H__
