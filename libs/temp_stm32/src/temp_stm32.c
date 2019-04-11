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
////  #if MYNEWT_VAL(TEMP_STM32_ONB)

#include <assert.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

#include "os/mynewt.h"
#include "sensor/sensor.h"
#include "sensor/temperature.h"
#include "stm32f1xx_hal_adc.h"
#include "adc_stm32f1/adc_stm32f1.h"
#include "temp_stm32/temp_stm32.h"

//  Exports for the sensor API
static int temp_stm32_sensor_read(struct sensor *, sensor_type_t,
    sensor_data_func_t, void *, uint32_t);
static int temp_stm32_sensor_get_config(struct sensor *, sensor_type_t,
    struct sensor_cfg *);

//  Global instance of the sensor driver
static const struct sensor_driver g_temp_stm32_sensor_driver = {
    temp_stm32_sensor_read,
    temp_stm32_sensor_get_config
};

//  Config for the temperature channel on ADC1.
static ADC_ChannelConfTypeDef temp_config = {
    .Channel      = ADC_CHANNEL_TEMPSENSOR,      //  Channel number of temperature sensor on ADC1.  For Blue Pill: 16
    .Rank         = ADC_REGULAR_RANK_1,          //  Every ADC1 channel must be assigned a rank to indicate which channel gets converted first.  Rank 1 is the first to be converted.
    .SamplingTime = ADC_SAMPLETIME_239CYCLES_5,  //  Sampling time 239.5 ADC clock cycles
};

int temp_stm32_default_cfg(struct temp_stm32_cfg *cfg) {
    //  Return the default sensor configuration.
    memset(&cfg, 0, sizeof(struct temp_stm32_cfg));  //  Zero the entire object.
    cfg->bc_s_mask = SENSOR_TYPE_ALL;  //  Return all sensor values, i.e. temperature.
    return 0;
}

static int internal_init(struct temp_stm32 *dev) {
    //  Setup ADC channel configuration for temperature sensor.
    //  TODO: Move to temp_stm32_open.
    int rc = -1;
    dev->adc = (struct adc_dev *)os_dev_open(STM32F1_ADC1_DEVICE, 0, NULL);
    assert(dev->adc);
    if (!dev->adc) { goto err; }

    rc = adc_chan_config(dev->adc, ADC_CHANNEL_TEMPSENSOR, &temp_config);
    assert(rc == 0);
    if (rc) { goto err; }
    return 0;
err:
    return rc;
}
/* Previously: 
    struct adc_dev my_dev_adc1;
    rc = adc_chan_config(&my_dev_adc1, ADC_CHANNEL_TEMPSENSOR, &temp_config); */

/**
 * Expects to be called back through os_dev_create().
 *
 * @param The device object associated with temp_stm32
 * @param Argument passed to OS device init, unused
 *
 * @return 0 on success, non-zero error on failure.
 */
int temp_stm32_init(struct os_dev *dev0, void *arg) {
    struct temp_stm32 *dev;
    struct sensor *sensor;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct temp_stm32 *) dev0;
    dev->adc = NULL;

    //  Get the default config.
    rc = temp_stm32_default_cfg(&dev->cfg);
    if (rc) { goto err; }

    //  Init the sensor.
    sensor = &dev->sensor;
    rc = sensor_init(sensor, dev0);
    if (rc != 0) { goto err; }

    //  Add the driver with all the supported sensor data types.
    rc = sensor_set_driver(sensor, SENSOR_TYPE_AMBIENT_TEMPERATURE,
        (struct sensor_driver *) &g_temp_stm32_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }

    //  Configure the temperature sensor channel of the ADC driver.
    rc = internal_init(dev);
    if (rc != 0) { goto err; }

    //  TODO: OS_DEV_SETHANDLERS(dev, temp_stm32_open, temp_stm32_close);

    return (0);
err:
    return (rc);
}

static int temp_stm32_sensor_read(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    //  Read the sensor values depending on the sensor types specified in the sensor config.
    union {  //  Union that represents all possible sensor values.
        struct sensor_temp_data std;
    } databuf;
    struct sensor_itf *itf;
    struct temp_stm32 *dev;
    int rc;
    int32_t rawtemp;

    //  We only allow reading of temperature values.
    if (!(type & SENSOR_TYPE_AMBIENT_TEMPERATURE)) { rc = SYS_EINVAL; goto err; }
    itf = SENSOR_GET_ITF(sensor); assert(itf);
    dev = (struct temp_stm32 *) SENSOR_GET_DEVICE(sensor); assert(dev);

    //  Get a new temperature sample always.
    rawtemp = 0;
    rc = temp_stm32_get_temperature(itf, &rawtemp);
    if (rc) { goto err; }

    //  Convert the raw temperature to actual temperature.
    float vtemp = rawtemp * 3300.0 / 4095.0;
    databuf.std.std_temp = (1.43 - vtemp) / 4.5 + 25.00;
    databuf.std.std_temp_is_valid = 1;
    
    //  Call the user function to process the data.
    rc = data_func(sensor, data_arg, &databuf.std, SENSOR_TYPE_AMBIENT_TEMPERATURE);
    if (rc) { goto err; }
    return 0;
err:
    return rc;
}

/**
 * Get raw temperature from STM32 internal temperature sensor by reading from ADC. Will block until data is available.
 *
 * @param itf The sensor interface
 * @param rawtemp Raw temperature
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_get_raw_temperature(struct sensor_itf *itf, int32_t *rawtemp) {
    int rc = 0;
    *rawtemp = -1;

    //  Block until the temperature is read from the ADC channel.
    struct temp_stm32 *dev = NULL;  //  TODO
    rc = adc_read_channel(&my_dev_adc1, ADC_CHANNEL_TEMPSENSOR, rawtemp);
    assert(rc == 0);
    if (rc) { goto err; }

    assert(*rawtemp > 0);  //  If rawValue = 0, it means we haven't sampled any values.
    console_printf("rawValue: %d\n", *rawtemp); console_flush(); ////
    return 0;
err:
    return rc;
}

static int temp_stm32_sensor_get_config(struct sensor *sensor, sensor_type_t type,
    struct sensor_cfg *cfg) {
    //  Return the type of the sensor value returned by the sensor.
    int rc;
    if (!(type & SENSOR_TYPE_AMBIENT_TEMPERATURE)) {
        rc = SYS_EINVAL;
        goto err;
    }
    cfg->sc_valtype = SENSOR_VALUE_TYPE_FLOAT;  //  We return float.
    return (0);
err:
    return (rc);
}

/**
 * Configure STM32 internal temperature sensor
 *
 * @param Sensor device temp_stm32 structure
 * @param Sensor device temp_stm32_cfg config
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_config(struct temp_stm32 *dev, struct temp_stm32_cfg *cfg) {
    struct sensor_itf *itf;
    int rc;
    itf = SENSOR_GET_ITF(&(dev->sensor)); assert(itf);
    rc = sensor_set_type_mask(&(dev->sensor),  cfg->bc_s_mask);
    if (rc) { goto err; }

    dev->cfg.bc_s_mask = cfg->bc_s_mask;
    return 0;
err:
    return (rc);
}

////  #endif  //  MYNEWT_VAL(TEMP_STM32_ONB)
