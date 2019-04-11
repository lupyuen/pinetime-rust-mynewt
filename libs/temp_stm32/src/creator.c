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
////  #if MYNEWT_VAL(ADC_1) && MYNEWT_VAL(TEMP_STM32_ONB)

//  Create STM32 Internal Temperature sensor.  For STM32F1, the sensor is accessed via ADC1 channel 16.
#include "os/mynewt.h"
#include "sensor/sensor.h"
#include "temp_stm32/temp_stm32.h"  //  Specific to sensor

//  Define the sensor specifics here so the code below can be generic.
#define DEVICE_NAME        TEMP_STM32_DEVICE  //  Name of device
#define DEVICE_DEV         temp_stm32         //  Device type
#define DEVICE_INSTANCE    temp_stm32_dev     //  Device instance
#define DEVICE_CFG         temp_stm32_cfg     //  Device config
#define DEVICE_CFG_DEFAULT temp_stm32_default_cfg  //  Device default config
#define DEVICE_CFG_FUNC    temp_stm32_config  //  Device config function
#define DEVICE_INIT        temp_stm32_init    //  Device init function
#define DEVICE_CREATE      temp_stm32_create  //  Device create function
#define DEVICE_ITF         adc_1_itf_temp_stm32   //  Device interface

static struct DEVICE_DEV DEVICE_INSTANCE;  //  Global instance of the sensor device.

static struct sensor_itf DEVICE_ITF = {    //  Global sensor interface for the sensor device.
    .si_type = 0,  //  TODO: Should be ADC.
    .si_num  = 0,
};

///////////////////////////////////////////////////////////////////////////////
//  Generic Sensor Creator Code based on repos\apache-mynewt-core\hw\sensor\creator\src\sensor_creator.c

//  Sensor default configuration.
static int config_sensor(void) {
    int rc;
    struct os_dev *dev;
    struct DEVICE_CFG cfg;

    //  Fetch the sensor device.
    dev = (struct os_dev *) os_dev_open(DEVICE_NAME, OS_TIMEOUT_NEVER, NULL);
    assert(dev != NULL);

    //  Get the default config for the sensor.
    rc = DEVICE_CFG_DEFAULT(&cfg);
    assert(rc == 0);

    //  Apply the sensor config.
    rc = DEVICE_CFG_FUNC((struct DEVICE_DEV *)dev, &cfg);
    os_dev_close(dev);
    return rc;
}

//  Create the sensor device instance and configure it.
void DEVICE_CREATE(void) {
    int rc = os_dev_create((struct os_dev *) &DEVICE_INSTANCE, DEVICE_NAME,
        OS_DEV_INIT_PRIMARY, 0, 
        DEVICE_INIT, (void *) &DEVICE_ITF);
    assert(rc == 0);

    rc = config_sensor();
    assert(rc == 0);
}

////  #endif
