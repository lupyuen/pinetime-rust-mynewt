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
#include <string.h>
#include "os/mynewt.h"
#include "console/console.h"
#include "sensor/sensor.h"
#include "sensor/temperature.h"
#include "temp_stm32/temp_stm32.h"

//  Exports for the sensor API
static int temp_stm32_sensor_read(struct sensor *, sensor_type_t, sensor_data_func_t, void *, uint32_t);
static int temp_stm32_sensor_get_config(struct sensor *, sensor_type_t, struct sensor_cfg *);

//  Global instance of the sensor driver
static const struct sensor_driver g_temp_stm32_sensor_driver = {
    temp_stm32_sensor_read,
    temp_stm32_sensor_get_config
};

#ifdef STM32L476xx  //  STM32L476
#include "stm32l4xx_hal_dma.h"
#include "stm32l4xx_hal_adc.h"
#include "adc_stm32l4/adc_stm32l4.h"

//  Config for the temperature channel on ADC1.
static ADC_ChannelConfTypeDef temp_channel_config = {
    .Channel      = ADC_CHANNEL_TEMPSENSOR,      //  Channel number of temperature sensor on ADC1.
    .Rank         = ADC_REGULAR_RANK_1,          //  Every ADC1 channel should be assigned a rank to indicate which channel gets converted first.  Rank 1 is the first to be converted.
    .SamplingTime = ADC_SAMPLETIME_640CYCLES_5,  //  Sampling time 640 ADC clock cycles.
};

int temp_stm32_default_cfg(struct temp_stm32_cfg *cfg) {
    //  Return the default sensor configuration.
    memset(cfg, 0, sizeof(struct temp_stm32_cfg));  //  Zero the entire object.
    cfg->bc_s_mask       = SENSOR_TYPE_ALL;         //  Return all sensor values, i.e. temperature.
    cfg->adc_dev_name    = STM32L4_ADC1_DEVICE;     //  For STM32L4: adc1
    cfg->adc_channel     = MYNEWT_ADC_CHANNEL_TEMPSENSOR;
    cfg->adc_open_arg    = NULL;
    cfg->adc_channel_cfg = &temp_channel_config;    //  Configure the temperature channel.
    return 0;
}
#endif  //  STM32L476xx

#ifdef STM32F103xB  //  Blue Pill
#include "stm32f1xx_hal_dma.h"
#include "stm32f1xx_hal_adc.h"
#include "adc_stm32f1/adc_stm32f1.h"

//  Config for the temperature channel on ADC1.
static ADC_ChannelConfTypeDef temp_channel_config = {
    .Channel      = ADC_CHANNEL_TEMPSENSOR,      //  Channel number of temperature sensor on ADC1.  For Blue Pill: 16
    .Rank         = ADC_REGULAR_RANK_1,          //  Every ADC1 channel should be assigned a rank to indicate which channel gets converted first.  Rank 1 is the first to be converted.
    .SamplingTime = ADC_SAMPLETIME_239CYCLES_5,  //  Sampling time 239.5 ADC clock cycles. ADC clock (APB2/PCLK2) runs at 8 MHz
};

int temp_stm32_default_cfg(struct temp_stm32_cfg *cfg) {
    //  Return the default sensor configuration.
    memset(cfg, 0, sizeof(struct temp_stm32_cfg));  //  Zero the entire object.
    cfg->bc_s_mask       = SENSOR_TYPE_ALL;         //  Return all sensor values, i.e. temperature.
    cfg->adc_dev_name    = STM32F1_ADC1_DEVICE;     //  For STM32F1: adc1
    cfg->adc_channel     = ADC_CHANNEL_TEMPSENSOR;  //  For STM32F1: 16
    cfg->adc_open_arg    = NULL;
    cfg->adc_channel_cfg = &temp_channel_config;    //  Configure the temperature channel.
    return 0;
}
#endif  //  DSTM32F103xB

static int temp_stm32_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  Setup ADC channel configuration for temperature sensor.  Return 0 if successful.
    //  This locks the ADC channel until the sensor is closed.
    int rc = -1;
    struct temp_stm32 *dev;    
    struct temp_stm32_cfg *cfg;
    dev = (struct temp_stm32 *) dev0;  assert(dev);  
    cfg = &dev->cfg; assert(cfg); assert(cfg->adc_channel);  assert(cfg->adc_channel_cfg);  assert(cfg->adc_dev_name);

    //  Open port ADC1.
    dev->adc = (struct adc_dev *) os_dev_open(cfg->adc_dev_name, timeout, cfg->adc_open_arg);
    assert(dev->adc);
    if (!dev->adc) { goto err; }
    console_printf("ADC open\n");  ////

    //  Configure port ADC1 channel 16 for temperature sensor.
    rc = adc_chan_config(dev->adc, cfg->adc_channel, cfg->adc_channel_cfg);
    if (rc) { 
        if (dev->adc) { os_dev_close((struct os_dev *) dev->adc); }
        goto err; 
    }
    return 0;
err:
    assert(rc == 0);
    return rc;
}

static int temp_stm32_close(struct os_dev *dev0) {
    //  Close the sensor.  This unlocks the ADC channel.  Return 0 if successful.
    //  console_printf("ADC close\n");  ////
    struct temp_stm32 *dev;    
    dev = (struct temp_stm32 *) dev0;
    if (dev->adc) {
        //  Close port ADC1.
        os_dev_close((struct os_dev *) dev->adc);
        dev->adc = NULL;
    }
    return 0;
}

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
    rc = sensor_set_driver(sensor, TEMP_SENSOR_TYPE,
        (struct sensor_driver *) &g_temp_stm32_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }

    //  Set the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, temp_stm32_open, temp_stm32_close);
    return (0);
err:
    return (rc);
}

static int temp_stm32_sensor_read(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    //  Read the sensor values depending on the sensor types specified in the sensor config.
    union {  //  Union that represents all possible sensor values.
#if MYNEWT_VAL(RAW_TEMP)                   //  If we are returning raw temperature (integers)...
        struct sensor_temp_raw_data strd;  //  For passing raw temperature sensor value
#else                                      //  If we are returning computed temperature (floating-point)...
        struct sensor_temp_data std;       //  For passing computed temperature sensor value
#endif  //  MYNEWT_VAL(RAW_TEMP)
    } databuf;
    struct temp_stm32 *dev;
    int rc = 0, rawtemp;

    //  We only allow reading of temperature values.
    if (!(type & TEMP_SENSOR_TYPE)) { rc = SYS_EINVAL; goto err; }
    dev = (struct temp_stm32 *) SENSOR_GET_DEVICE(sensor); assert(dev);
    rawtemp = -1;
    {   //  Begin ADC Lock: Open and lock port ADC1, configure channel 16.
        rc = temp_stm32_open((struct os_dev *) dev, 0, NULL);
        if (rc) { goto err; }

        //  Get a new temperature sample from temperature sensor (channel 16 of port ADC1).
        rc = temp_stm32_get_raw_temperature(dev, 1, &rawtemp, NULL);

        temp_stm32_close((struct os_dev *) dev);
    }   //  End ADC Lock: Close and unlock port ADC1.
    if (rc) { goto err; }  //  console_printf("rawtemp: %d\n", rawtemp);  ////

    //  Convert the raw temperature to actual temperature. From https://github.com/cnoviello/mastering-stm32/blob/master/nucleo-f446RE/src/ch12/main-ex1.c
#ifdef NOTUSED_FLOAT_TEMP
    //  Original floating point code, which is not efficient on microcontrollers.
    temp = (((float) rawtemp) / 4095.0) * 3300.0;
    temp = ((temp - 760.0) / 2.5) + 25.0;
    temp = temp / 10.0;
#endif  //  NOTUSED_FLOAT_TEMP

#if MYNEWT_VAL(RAW_TEMP)  //  If we are returning raw temperature (integers)...    
    //  Save the raw temperature.
    struct sensor_temp_raw_data *temp_data = &databuf.strd;
    temp_data->strd_temp_raw = rawtemp;  //  rawtemp must be between 0 and 4,095 (based on 12-bit ADC)
    temp_data->strd_temp_raw_is_valid = 1;

#else  //  If we are returning computed temperature (floating-point)...
    //  We use this updated code, which uses only integer computations.
    int32_t t = rawtemp;  //  rawtemp must be between 0 and 4,095 (based on 12-bit ADC)
    t = t * 3300;  //  t must be between 0 and 13,513,500. Will not overflow 32-bit int (2,147,483,647)
    t = t >> 12;   //  Integer version of (t / 4,096), instead of original version (t / 4,095).
                   //  t must be between 0 and 3,299. Max error due to truncation is 1.8
    t = t - 760;   //  t must be between -760 and 2,539. Max error is 1.8

    //  Instead of computing the float (t / 2.5), we compute it 100 times: (t * 100 / 2.5) = (t * 40)
    //  We name (t * 100) as t100. t100 must be between -30,400 and 101,560.  Max error of t100 is 72
    int32_t t100 = t * 40;
    t100 = t100 + 2500;  // (t + 25) becomes (t100 + 2500).  t100 must be between -27,900 and 104,060. Max error of t100 is 72
    t100 = t100 / 10;    // (t / 10) becomes (t100 / 10), with integer division.  
    //  t100 must be between -2,790 (-27.9 deg C) and 10,406 (104.06 deg C). 
    //  Max error of t100 is 7.2 (0.072 deg C).  Avg error is 0.036 deg C.
    float temp = t100 / 100.0f;

    //  TODO: Compensate with the expected error: https://docs.google.com/spreadsheets/d/1O-4UyEO8UQmNkaZ0WB5iyUhZO5TalkRULxYF9busBLE/edit?usp=sharing
    //  Return only 1 decimal place.    

    //  Save the floating-point temperature.
    struct sensor_temp_data *temp_data = &databuf.std;
    temp_data->std_temp = temp;
    temp_data->std_temp_is_valid = 1;  //  console_printf("temp: ");  console_printfloat(temp);  console_printf("\n");  ////
#endif  //  MYNEWT_VAL(RAW_TEMP)
    
    if (data_func) {  //  Call the Listener Function to process the sensor data.
        rc = data_func(sensor, data_arg, temp_data, TEMP_SENSOR_TYPE);
        if (rc) { goto err; }
    }
    return 0;
err:
    return rc;
}

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
int temp_stm32_get_raw_temperature(struct temp_stm32 *dev, int num_readings, int *temp_sum, uint8_t *temp_diff) {
    //  If adc_read_channel() fails to return a value, check that
    //  ExternalTrigConv is set to ADC_SOFTWARE_START for STM32F1.
    //  Also the STM32 HAL should be called in this sequence:
    //    __HAL_RCC_ADC1_CLK_ENABLE();
    //    HAL_ADC_Init(hadc1);
    //    HAL_ADC_ConfigChannel(hadc1, &temp_config);
    //    HAL_ADC_Start(hadc1);
    //    HAL_ADC_PollForConversion(hadc1, 10 * 1000);
    //    HAL_ADC_Stop(hadc1);
    //  See https://github.com/cnoviello/mastering-stm32/blob/master/nucleo-f446RE/src/ch12/main-ex1.c
    //  and https://os.mbed.com/users/hudakz/code/Internal_Temperature_F103RB/file/f5c604b5eceb/main.cpp/
    console_printf("STM read int temp sensor\n");  ////
    assert(dev->adc);  assert(temp_sum);
    int rc = 0, i;
    int rawtemp;           //  Raw temperature read from the 12-bit ADC, i.e. 0 to 4095
    int lasttemp = 0;      //  Previous raw temperature
    uint8_t lastdiff = 0;  //  Delta between current raw temperature and previous raw temperature
    *temp_sum = 0;

    //  When called with num_readings = 1:  This function returns a valid raw temperature value (0 to 4095)
    //  When called with num_readings = 64: This function is used to generate 32 noisy bytes as the entropy 
    //    seed for the pseudorandom number generator "hmac_prng": libs/hmac_prng/src/hmac_prng.c

    //  How do we generate random numbers on a simple microcontroller like Blue Pill, without connecting 
    //  to an external sensor to create the noisy seed?  The internal temperature sensor is actually 
    //  sufficient for generating the noisy seed.  But it needs some coaxing to make it sufficiently noisy...
    //
    //  (1) Take 64 (num_readings) integer samples from the internal temperature sensor. Each sample is 12 bits (0 to 4095)
    //
    //  (2) Compute the delta (difference) between successive samples. The deltas are usually very small: 
    //      mostly 0, some +/- 1, +/- 2, occasionally some odd ones like 88.
    //
    //  (3) To prevent the seed from becoming all zeros, keep only the lower 4 bits of each delta.  
    //      Combine 64 deltas of 4 bits each, and we get the 32-byte seed.  This is written into temp_diff.

    for (i = 0; i < num_readings; i++) {  //  For each sample to be read...
        //  Read the ADC value: rawtemp will be in the range 0 to 4095.
        rawtemp = -1;
        //  Block until the temperature is read from the ADC channel.
        rc = adc_read_channel(dev->adc, 0, &rawtemp);  //  Channel number is not used
        assert(rc == 0);
        if (rc) { goto err; }
        assert(rawtemp > 0);  //  If equals 0, it means we haven't sampled any values.  Check the above note.

        //  Populate the temp_diff array with the deltas.
        uint8_t diff = (rawtemp - lasttemp) & 0xf;  //  Delta between this and last reading, keeping lower 4 bits.
        if (i % 2 == 1) {
            uint8_t i2 = i >> 1;  //  i2 is (i / 2)
            uint8_t b = diff + (lastdiff << 4);    //  Combine current delta (4 bits) and previous delta (4 bits) to make 8 bits.
            if (temp_diff) { temp_diff[i2] = b; }  //  Save the combined delta into temp_diff as entropy.
        }
        *temp_sum += rawtemp;  //  Accumulate the raw temperature.
        lasttemp = rawtemp;    //  Remember the previous raw temperature and previous delta.
        lastdiff = diff;
    }
    return 0;
err:
    return rc;
}

static int temp_stm32_sensor_get_config(struct sensor *sensor, sensor_type_t type,
    struct sensor_cfg *cfg) {
    //  Return the type of the sensor value returned by the sensor.
    int rc;
    if (!(type & TEMP_SENSOR_TYPE)) {
        rc = SYS_EINVAL;
        goto err;
    }
    cfg->sc_valtype = TEMP_SENSOR_VALUE_TYPE;  //  We return float (computed values) or int (raw values).
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
