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
#include "temp_stub/temp_stub.h"

//  Exports for the sensor API
static int temp_stub_sensor_read(struct sensor *, sensor_type_t, sensor_data_func_t, void *, uint32_t);
static int temp_stub_sensor_get_config(struct sensor *, sensor_type_t, struct sensor_cfg *);

//  Global instance of the sensor driver
static const struct sensor_driver g_temp_stub_sensor_driver = {
    temp_stub_sensor_read,
    temp_stub_sensor_get_config
};

int temp_stub_default_cfg(struct temp_stub_cfg *cfg) {
    //  Return the default sensor configuration.
    memset(cfg, 0, sizeof(struct temp_stub_cfg));  //  Zero the entire object.
    cfg->bc_s_mask       = SENSOR_TYPE_ALL;         //  Return all sensor values, i.e. temperature.
    return 0;
}

static int temp_stub_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  Setup configuration for temperature sensor.  Return 0 if successful.
    struct temp_stub *dev;    
    struct temp_stub_cfg *cfg;
    dev = (struct temp_stub *) dev0;  assert(dev);  
    cfg = &dev->cfg; assert(cfg);
    return 0;
}

static int temp_stub_close(struct os_dev *dev0) {
    //  Close the sensor.  Return 0 if successful.
    return 0;
}

/**
 * Expects to be called back through os_dev_create().
 *
 * @param The device object associated with temp_stub
 * @param Argument passed to OS device init, unused
 *
 * @return 0 on success, non-zero error on failure.
 */
int temp_stub_init(struct os_dev *dev0, void *arg) {
    struct temp_stub *dev;
    struct sensor *sensor;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct temp_stub *) dev0;

    //  Get the default config.
    rc = temp_stub_default_cfg(&dev->cfg);
    if (rc) { goto err; }

    //  Init the sensor.
    sensor = &dev->sensor;
    rc = sensor_init(sensor, dev0);
    if (rc != 0) { goto err; }

    //  Add the driver with all the supported sensor data types.
    rc = sensor_set_driver(sensor, TEMP_SENSOR_TYPE,
        (struct sensor_driver *) &g_temp_stub_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }

    //  Set the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, temp_stub_open, temp_stub_close);
    return (0);
err:
    return (rc);
}

static int temp_stub_sensor_read(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    //  Read the sensor values depending on the sensor types specified in the sensor config.
    union {  //  Union that represents all possible sensor values.
#if MYNEWT_VAL(RAW_TEMP)                   //  If we are returning raw temperature (integers)...
        struct sensor_temp_raw_data strd;  //  For passing raw temperature sensor value
#else                                      //  If we are returning computed temperature (floating-point)...
        struct sensor_temp_data std;       //  For passing computed temperature sensor value
#endif  //  MYNEWT_VAL(RAW_TEMP)
    } databuf;
    struct temp_stub *dev;
    int rc = 0, rawtemp;

    //  We only allow reading of temperature values.
    if (!(type & TEMP_SENSOR_TYPE)) { rc = SYS_EINVAL; goto err; }
    dev = (struct temp_stub *) SENSOR_GET_DEVICE(sensor); assert(dev);
    rawtemp = -1;
    {   //  Begin ADC Lock: Open and lock port ADC1, configure channel 16.
        rc = temp_stub_open((struct os_dev *) dev, 0, NULL);
        if (rc) { goto err; }

        //  Get a new temperature sample from temperature sensor (channel 16 of port ADC1).
        rc = temp_stub_get_raw_temperature(dev, 1, &rawtemp, NULL);

        temp_stub_close((struct os_dev *) dev);
    }   //  End ADC Lock: Close and unlock port ADC1.
    if (rc) { goto err; }  //  console_printf("rawtemp: %d\n", rawtemp);  ////

#if MYNEWT_VAL(RAW_TEMP)  //  If we are returning raw temperature (integers)...    
    //  Save the raw temperature.
    struct sensor_temp_raw_data *temp_data = &databuf.strd;
    temp_data->strd_temp_raw = rawtemp;  //  rawtemp must be between 0 and 4,095 (based on 12-bit ADC)
    temp_data->strd_temp_raw_is_valid = 1;

#else  //  If we are returning computed temperature (floating-point)...
    //  Save the floating-point temperature.
    struct sensor_temp_data *temp_data = &databuf.std;
    temp_data->std_temp = 28.3;
    temp_data->std_temp_is_valid = 1;
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
 * Get raw temperature from stub temperature sensor.
 *
 * @param dev The temp_stub device
 * @param num_readings How many readings to take
 * @param temp_sum Pointer to an int. Will store the sum of the raw temperature readings. Each reading ranges from 0 to 4095.
 * @param temp_diff An array of (num_readings / 2) uint8_t. If non-null, will store the array of temperature differences between each reading and the last one.  Each byte in the array consists of two difference values, 4 bits each.
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stub_get_raw_temperature(struct temp_stub *dev, int num_readings, int *temp_sum, uint8_t *temp_diff) {
    console_printf("STB read temp sensor\n");  ////
    assert(temp_sum);
    *temp_sum = 1757 * num_readings;
    return 0;
}

static int temp_stub_sensor_get_config(struct sensor *sensor, sensor_type_t type,
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
 * Configure stub temperature sensor
 *
 * @param Sensor device temp_stub structure
 * @param Sensor device temp_stub_cfg config
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stub_config(struct temp_stub *dev, struct temp_stub_cfg *cfg) {
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
