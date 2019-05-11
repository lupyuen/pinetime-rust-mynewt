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

//  Create Remote Sensor
#include "os/mynewt.h"
#include "console/console.h"
#include "sensor/sensor.h"
#include "sensor_network/sensor_network.h"
#include "nrf24l01/nrf24l01.h"
#include "remote_sensor/remote_sensor.h"  //  Specific to device

//  Define the device specifics here so the device creation code below can be generic.
#define DEVICE_NAME        get_sensor_node_names()  //  Name of device
#define DEVICE_DEV         remote_sensor         //  Device type
#define DEVICE_INSTANCE    remote_sensor_dev     //  Device instance
#define DEVICE_CFG         remote_sensor_cfg     //  Device config
#define DEVICE_CFG_DEFAULT remote_sensor_default_cfg  //  Device default config
#define DEVICE_CFG_FUNC    remote_sensor_config  //  Device config function
#define DEVICE_INIT        remote_sensor_init    //  Device init function
#define DEVICE_CREATE      remote_sensor_create  //  Device create function
#define DEVICE_START       remote_sensor_start   //  Device start function, called after device creation
#define DEVICE_ITF         itf_remote_sensor     //  Device interface
#define DEVICE_COUNT       NRL24L01_MAX_RX_PIPES //  Number of instances

static struct DEVICE_DEV DEVICE_INSTANCE[DEVICE_COUNT];  //  Global instances of the device

static struct sensor_itf DEVICE_ITF[DEVICE_COUNT];   //  Global sensor interfaces for the device, init to 0
//  {.si_type = 0, .si_num  = 0};  //  Interface Type should be nRF24L01
    

///////////////////////////////////////////////////////////////////////////////
//  Generic Device Creator Code based on repos\apache-mynewt-core\hw\sensor\creator\src\sensor_creator.c

//  Device configuration
static int config_device(const char *name) {
    int rc;
    struct os_dev *dev;
    struct DEVICE_CFG cfg;

    //  Fetch the device.
    dev = (struct os_dev *) os_dev_open(name, OS_TIMEOUT_NEVER, NULL);
    assert(dev != NULL);

    //  Get the default config for the device.
    rc = DEVICE_CFG_DEFAULT(&cfg);
    assert(rc == 0);

    //  Apply the device config.
    rc = DEVICE_CFG_FUNC((struct DEVICE_DEV *)dev, &cfg);
    os_dev_close(dev);
    return rc;
}

//  Create the device instance and configure it. Called by sysinit() during startup, defined in pkg.yml.
void DEVICE_CREATE(void) {
    for (int i = 0; i < DEVICE_COUNT; i++) {
        console_printf("RSN listen %s\n", DEVICE_NAME[i]);  ////

        //  Create the device.
        int rc = os_dev_create((struct os_dev *) &DEVICE_INSTANCE[i], DEVICE_NAME[i],
            OS_DEV_INIT_PRIMARY, 0, 
            DEVICE_INIT, (void *) &DEVICE_ITF[i]);
        assert(rc == 0);

        //  Configure the device.
        rc = config_device(DEVICE_NAME[i]);
        assert(rc == 0);
    }
#ifdef DEVICE_START
    //  Start the device after creation.
    DEVICE_START();
#endif  //  DEVICE_START
}
