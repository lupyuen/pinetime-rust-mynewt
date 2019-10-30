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
//  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server over NB-IoT.
//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes response parsing bugs.  The patched file must be present in that location.

//  Configure this application by editing `targets/bluepill_my_sensor/syscfg.yml`
//  Mynewt consolidates all app settings into `bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h`
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>            //  For Mynewt OS functions
#include <console/console.h>  //  For Mynewt console output. Actually points to libs/semihosting_console
#include <sensor_network/sensor_network.h>   //  For start_server_transport()
#include "sensor.h"                          //  For start_sensor_listener()

int main(int argc, char **argv) {
    //  Main program that initialises the sensor, network driver and starts reading 
    //  and sending sensor data in the background.

    //  Initialise the Mynewt packages and BME280 / temp_stm32 temperature sensor driver.
    //  Start the CoAP / OIC Background Task to transmit CoAP messages.  Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysinit-app.c
    sysinit();  console_flush();

    //  Starting polling the temperature sensor every 10 seconds in the background.
    int rc1 = start_sensor_listener();  assert(rc1 == 0);

    //  Start the Server Transport for sending sensor data to CoAP Server over NB-IoT.
    int rc2 = start_server_transport();  assert(rc2 == 0);

    //  Main event loop
    while (true) {                //  Loop forever...
        os_eventq_run(            //  Process events...
            os_eventq_dflt_get()  //  From default event queue.
        );
    }
    return 0;  //  Never comes here.
}
