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

//  Create device
#include <os/mynewt.h>
#include <console/console.h>
#include <sensor/sensor.h>
#include "util.h"
#include "gps_l70r/gps_l70r.h"  //  Specific to device

//  Define the device specifics here so the device creation code below can be generic.
#define DEVICE_NAME        GPS_L70R_DEVICE  //  Name of device
#define DEVICE_DEV         gps_l70r         //  Device type
#define DEVICE_INSTANCE    gps_l70r         //  Device instance
#define DEVICE_CFG         gps_l70r_cfg     //  Device config
#define DEVICE_CFG_DEFAULT gps_l70r_default_cfg  //  Device default config
#define DEVICE_CFG_FUNC    gps_l70r_config  //  Device config function
#define DEVICE_INIT        gps_l70r_init    //  Device init function
#define DEVICE_CREATE      gps_l70r_create  //  Device create function
#define DEVICE_ITF         uart_0_itf_gps_l70r   //  Device interface

static struct DEVICE_DEV DEVICE_INSTANCE;  //  Global instance of the device

static struct sensor_itf DEVICE_ITF = {    //  Global sensor interface for the device
    .si_type = SENSOR_ITF_UART,            //  Sensor interface type: UART
    .si_num  = MYNEWT_VAL(GPS_L70R_UART),  //  Sensor interface number: 0 for UART1, 1 for UART2
};

///////////////////////////////////////////////////////////////////////////////
//  Generic Device Creator Code based on repos\apache-mynewt-core\hw\sensor\creator\src\sensor_creator.c

static int config_device(void);

//  Create the device instance and configure it.  Called by sysinit() during startup, defined in pkg.yml.
void DEVICE_CREATE(void) {
    console_printf("%screate " DEVICE_NAME "\n", _gps);

    //  Create the device.
    int rc = os_dev_create((struct os_dev *) &DEVICE_INSTANCE, DEVICE_NAME,
        OS_DEV_INIT_PRIMARY, 0,  //  For BSP: OS_DEV_INIT_KERNEL, OS_DEV_INIT_PRIO_DEFAULT,
        DEVICE_INIT, (void *) &DEVICE_ITF);
    assert(rc == 0);

    //  Configure the device.
    rc = config_device();
    assert(rc == 0);
}

//  Device configuration
static int config_device(void) {
    int rc;
    struct os_dev *dev;
    struct DEVICE_CFG cfg;

    //  Fetch the device.
    dev = (struct os_dev *) os_dev_open(DEVICE_NAME, OS_TIMEOUT_NEVER, NULL);
    assert(dev != NULL);

    //  Get the default config for the device.
    rc = DEVICE_CFG_DEFAULT(&cfg);
    assert(rc == 0);

    //  Copy the default config into the device.
    rc = DEVICE_CFG_FUNC((struct DEVICE_DEV *)dev, &cfg);
    os_dev_close(dev);
    return rc;
}
