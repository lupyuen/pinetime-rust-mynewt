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
//  Poll the GPS sensor every 10 seconds. Transmit the sensor data to the CoAP server after polling.

//  Configure SENSOR_DEVICE and  SENSOR_POLL_TIME by editing `targets/bluepill_my_sensor/syscfg.yml`
//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>            //  For Mynewt OS functions
#include <console/console.h>  //  For Mynewt console output. Actually points to libs/semihosting_console
#include <sensor/sensor.h>    //  For Mynewt Sensor Framework
#include <sensor/temperature.h>             //  For temperature sensor definitions
#include <sensor_network/sensor_network.h>  //  For Sensor Network Library
#include <sensor_coap/sensor_coap.h>        //  For sensor_value
#include <custom_sensor/custom_sensor.h>    //  For sensor_temp_raw_data

#define GPS_DEVICE      "gps_l70r_0"
#define GPS_POLL_TIME   (10 * 1000)

//  Defined later below
static int handle_gps_data(struct sensor* sensor, void *arg, void *sensor_data, sensor_type_t type);
static void printfloat(float f);

//  Define the listener function to be called after polling the GPS sensor.
static struct sensor_listener listener = {
    .sl_sensor_type = SENSOR_TYPE_GEOLOCATION,  //  Type of sensor: Geolocation
    .sl_func        = handle_gps_data,          //  Listener function to be called with the sensor data
    .sl_arg         = NULL,
};

int start_gps_listener(void) {
    //  Ask Mynewt to poll the GPS sensor every 10 seconds and call `handle_gps_data()`.
    //  Return 0 if successful.
    if (strlen(GPS_DEVICE) == 0) { return 0; }  //  Sensor device not defined.
    console_printf("GPS poll %s\n", GPS_DEVICE);

    //  Set the sensor polling time to 10 seconds.  GPS_DEVICE is "gps_l70r_0", GPS_POLL_TIME is 10,000.
    int rc = sensor_set_poll_rate_ms(GPS_DEVICE, GPS_POLL_TIME);
    assert(rc == 0);

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    struct sensor *listen_sensor = sensor_mgr_find_next_bydevname(GPS_DEVICE, NULL);
    assert(listen_sensor != NULL);

    //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
    rc = sensor_register_listener(listen_sensor, &listener);
    assert(rc == 0);
    return 0;
}

static int handle_gps_data(struct sensor* sensor, void *arg, void *sensor_data, sensor_type_t type) {
    //  This listener function is called every 10 seconds by Mynewt to handle the polled sensor data.
    //  Return 0 if we have handled the sensor data successfully.
    if (sensor_data == NULL) { return SYS_EINVAL; }      //  Exit if data is missing
    assert(sensor && type == SENSOR_TYPE_GEOLOCATION);   //  We only support Geolocation sensor data

    //  Interpret the sensor data as a struct that contains geolocation.
    struct sensor_geolocation_data *geolocation = (struct sensor_geolocation_data *) sensor_data;
    if (
        !geolocation->sgd_latitude_is_valid  ||
        !geolocation->sgd_longitude_is_valid ||
        !geolocation->sgd_altitude_is_valid
    ) { 
        console_printf("GPS not ready\n"); console_flush(); ////
        return SYS_EINVAL;  //  Exit if data is not valid
    }

    console_printf("handle_gps_data lat: "); printfloat(geolocation->sgd_latitude);
    console_printf(" / lng: ");  printfloat(geolocation->sgd_longitude);
    console_printf(" / alt: ");  console_printfloat(geolocation->sgd_altitude);
    console_printf("\n"); console_flush(); ////

    int rc = 0;
#ifdef NOTUSED
    //  Convert into a sensor value for transmission.
    struct sensor_value sensor_value;
    sensor_value.key = "t";                             //  Sensor field name is `t`
    sensor_value.val_type = SENSOR_VALUE_TYPE_INT32;    //  Type is integer
    sensor_value.int_val = geolocation->sgd_latitude;  //  Value is raw temperature (0 to 4095)
    sensor_value.int_val = geolocation->sgd_longitude;  //  Value is raw temperature (0 to 4095)
    sensor_value.int_val = geolocation->sgd_altitude;  //  Value is raw temperature (0 to 4095)

    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    int rc = send_sensor_data(&sensor_value);

    //  SYS_EAGAIN means that the network is still starting up. We send at the next poll.
    if (rc == SYS_EAGAIN) { return 0; }
    assert(rc == 0);
#endif  //  NOTUSED    
    return rc;
}

static void split_float(float f, bool *neg, int *i, int *d) {
    //  Split the float f into 3 parts: neg is true if negative, the absolute integer part i, and the decimal part d, with 6 decimal places.
    *neg = (f < 0.0f);                    //  True if f is negative
    float f_abs = *neg ? -f : f;          //  Absolute value of f
    *i = (int) f_abs;                     //  Integer part
    *d = ((int) (1000000.0f * f_abs)) % 1000000;  //  6 decimal places
}

static void printfloat(float f) {
    //  Write a float to the output buffer, with 6 decimal places.
    bool neg; int i, d;
    split_float(f, &neg, &i, &d);      //  Split the float into neg, integer and decimal parts to 6 decimal places
    console_printf("%s%d.%06d", neg ? "-" : "", i, d);   //  Combine the sign, integer and decimal parts
}