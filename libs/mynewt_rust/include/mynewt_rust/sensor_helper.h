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


#ifndef __SENSOR_HELPER_H__
#define __SENSOR_HELPER_H__
#include <custom_sensor/custom_sensor.h>  //  For sensor_temp_raw_data

#ifdef __cplusplus
extern "C" {
#endif

//! Helper Functions for Mynewt Sensor API

struct os_dev;
struct sensor;
struct sensor_temp_data;

///  Interpret `sensor_data` as a `sensor_temp_raw_data` struct that contains raw temp.
///  Copy the sensor data into `dest`.  Return 0 if successful.
int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest);

///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
///  Copy the sensor data into `dest`.  Return 0 if successful.
int get_temp_data(void *sensor_data, struct sensor_temp_data *dest);

///  Interpret `sensor_data` as a `sensor_geolocation_data` struct that contains geolocation.
///  Copy the sensor data into `dest`.  Return 0 if successful.
int get_geolocation_data(void *sensor_data, struct sensor_geolocation_data *dest);

///  Return the Mynewt device for the Mynewt sensor.
struct os_dev *sensor_get_device(struct sensor *s);

///  Return the name for the Mynewt device.  Assumes name is non-null.
const char *device_get_name(struct os_dev *device);

///  Return the NULL sensor.
struct sensor *null_sensor(void);

///  Return non-zero if sensor is NULL.
int is_null_sensor(struct sensor *p);

///  Return non-zero if sensor data is NULL.
int is_null_sensor_data(void *p);

#ifdef __cplusplus
}
#endif

#endif /* __SENSOR_HELPER_H__ */
