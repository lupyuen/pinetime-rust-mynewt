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
#include "network.h"                        //  For send_sensor_data()
#include "sensor.h"

//  Defined later below
static int handle_sensor_data(struct sensor* sensor, void *arg, void *sensor_data, sensor_type_t type);

//  Define the listener function to be called after polling the temperature sensor.
static struct sensor_listener listener = {
    .sl_sensor_type = SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW,  //  Type of sensor: raw ambient temperature (integer)
    .sl_func        = handle_sensor_data,                   //  Listener function to be called with the sensor data
    .sl_arg         = NULL,
};

int start_sensor_listener(void) {
    //  Ask Mynewt to poll the temperature sensor every 10 seconds and call `handle_sensor_data()`.
    //  Return 0 if successful.
    if (strlen(MYNEWT_VAL(SENSOR_DEVICE)) == 0) { return 0; }  //  Sensor device not defined.
    console_printf("TMP poll %s\n", MYNEWT_VAL(SENSOR_DEVICE));

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is "temp_stm32_0", SENSOR_POLL_TIME is 10,000.
    int rc = sensor_set_poll_rate_ms(MYNEWT_VAL(SENSOR_DEVICE), MYNEWT_VAL(SENSOR_POLL_TIME));
    assert(rc == 0);

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    struct sensor *listen_sensor = sensor_mgr_find_next_bydevname(MYNEWT_VAL(SENSOR_DEVICE), NULL);
    assert(listen_sensor != NULL);

    //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
    rc = sensor_register_listener(listen_sensor, &listener);
    assert(rc == 0);
    return 0;
}

static int handle_sensor_data(struct sensor* sensor, void *arg, void *sensor_data, sensor_type_t type) {
    //  This listener function is called every 10 seconds by Mynewt to handle the polled sensor data.
    //  Return 0 if we have handled the sensor data successfully.
    if (sensor_data == NULL) { return SYS_EINVAL; }                  //  Exit if data is missing
    assert(sensor && type == SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW);   //  We only support raw temperature (integer).

    //  Interpret the sensor data as a struct that contains raw temp.
    struct sensor_temp_raw_data *rawtempdata = (struct sensor_temp_raw_data *) sensor_data;
    if (!rawtempdata->strd_temp_raw_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

    //  Convert into a sensor value for transmission.
    struct sensor_value sensor_value;
    sensor_value.key = "t";                              //  Sensor field name is `t`
    sensor_value.val_type = SENSOR_VALUE_TYPE_INT32;    //  Type is integer
    sensor_value.int_val = rawtempdata->strd_temp_raw;  //  Value is raw temperature (0 to 4095)

    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    int rc = send_sensor_data(&sensor_value);

    //  SYS_EAGAIN means that the network is still starting up. We send at the next poll.
    if (rc == SYS_EAGAIN) { return 0; }
    assert(rc == 0);
    return rc;
}
