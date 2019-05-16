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

//  Driver for STM32 Internal Temperature Sensor.  On Blue Pill, the sensor is connected to port ADC1 on channel 16
//  This sensor is selected if TEMP_STM32=1 in syscfg.yml.

//  Temperature sensor values may be Computed or Raw:
//  Computed Temperature Sensor Value (default): Sensor values are in degrees Celsius with 2 decimal places.
//    Slower and harder to process. Requires more ROM. Used for the ESP8266 tutorial.
//  Raw Temperature Sensor Value (if RAW_TEMP=1 in syscfg.yml): Sensor values are integers from 0 to 4095.
//    Faster and easier to process. Requires less ROM. Used for the nRF24L01 tutorial. Generally the preferred way.

#ifndef __TEMP_STM32_H__
#define __TEMP_STM32_H__

#include "os/mynewt.h"
#include "sensor/sensor.h"

//  Define Sensor Type, Sensor Value Type and Sensor Key (Raw and Computed Temperature)

#if MYNEWT_VAL(RAW_TEMP)                                       //  If we are returning raw temperature (integers)...
#include "custom_sensor/custom_sensor.h"                       //  For SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW
#define TEMP_SENSOR_TYPE       SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW  //  Set to raw sensor type
#define TEMP_SENSOR_VALUE_TYPE SENSOR_VALUE_TYPE_INT32         //  Return integer sensor values
#define TEMP_SENSOR_KEY        "t"                             //  Use key (field name) "t" to transmit raw temperature to CoAP Server or Collector Node

#else                                                          //  If we are returning computed temperature (floating-point)...
#define TEMP_SENSOR_TYPE       SENSOR_TYPE_AMBIENT_TEMPERATURE //  Set to floating-point sensor type
#define TEMP_SENSOR_VALUE_TYPE SENSOR_VALUE_TYPE_FLOAT         //  Return floating-point sensor values
#define TEMP_SENSOR_KEY        "tmp"                           //  Use key (field name) "tmp" to transmit computed temperature to CoAP Server or Collector Node
#endif  //  MYNEWT_VAL(RAW_TEMP)

#ifdef __cplusplus
extern "C" {
#endif

#define TEMP_STM32_DEVICE "temp_stm32_0"

struct adc_dev;  //  ADC device

//  Configuration for the STM32 internal temperature sensor
struct temp_stm32_cfg {
    sensor_type_t bc_s_mask;   //  Sensor data types that will be returned, i.e. temperature.
    const char *adc_dev_name;  //  Name of the ADC device that will be opened to access the sensor. For STM32F1: "adc1"
    uint8_t adc_channel;       //  ADC channel that will be configured to access the sensor. For STM32F1: 16
    void *adc_open_arg;        //  Argument that will be passed to os_dev_open() when opening ADC device.
    void *adc_channel_cfg;     //  Argument that will be passed to adc_chan_config() when configuring ADC channel.
};

//  Device for the STM32 internal temperature sensor
struct temp_stm32 {
    struct os_dev dev;     //  Mynewt device
    struct sensor sensor;  //  Mynewt sensor
    struct temp_stm32_cfg cfg;  //  Sensor configuration
    os_time_t last_read_time;   //  Last time the sensor was read.
    struct adc_dev *adc;        //  ADC device that will be used to access the sensor.
};

/**
 * Create the STM32 internal temperature sensor instance.  Implemented in creator.c, function DEVICE_CREATE().
 */
void temp_stm32_create(void);

/**
 * Return the default configuration for the STM32 internal temperature sensor.
 *
 * @param cfg  Pointer to the temp_stm32_cfg device config
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_default_cfg(struct temp_stm32_cfg *cfg);

/**
 * Initialize the STM32 internal temperature sensor.
 *
 * @param dev  Pointer to the temp_stm32_dev device descriptor
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_init(struct os_dev *dev, void *arg);

/**
 * Configure STM32 internal temperature sensor
 *
 * @param Sensor device temp_stm32 structure
 * @param Sensor device temp_stm32_cfg config
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_config(struct temp_stm32 *temp_stm32, struct temp_stm32_cfg *cfg);

/**
 * Get raw temperature from STM32 internal temperature sensor by reading from ADC. Will block until data is available.
 *
 * @param dev The temp_stm32 device
 * @param num_readings How many readings to take
 * @param temp_sum Pointer to an int. Will store the sum of the raw temperature readings. Each reading ranges from 0 to 4095.
 * @param temp_diff An array of (num_readings / 2) uint8_t. If non-null, will store the array of temperature differences between each reading and the last one.  Each byte in the array consists of two difference values, 4 bits each.
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_get_raw_temperature(struct temp_stm32 *dev, int num_readings, int *temp_sum, uint8_t *temp_diff);

#ifdef __cplusplus
}
#endif

#endif /* __TEMP_STM32_H__ */
