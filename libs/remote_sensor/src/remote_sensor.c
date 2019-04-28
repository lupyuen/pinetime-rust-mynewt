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
#include "remote_sensor/remote_sensor.h"

//  Exports for the sensor API
static int sensor_read(struct sensor *, sensor_type_t, sensor_data_func_t, void *, uint32_t);
static int sensor_get_config(struct sensor *, sensor_type_t, struct sensor_cfg *);

//  Global instance of the sensor driver
static const struct sensor_driver g_sensor_driver = {
    sensor_read,
    sensor_get_config
};

int remote_sensor_default_cfg(struct remote_sensor_cfg *cfg) {
    //  Return the default sensor configuration.
    memset(cfg, 0, sizeof(struct remote_sensor_cfg));  //  Zero the entire object.
    cfg->bc_s_mask = SENSOR_TYPE_ALL;  //  Return all sensor values, i.e. temperature.
    return 0;
}

static int sensor_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  Setup the sensor.  Return 0 if successful.
    int rc = -1;
    struct remote_sensor *dev;    
    struct remote_sensor_cfg *cfg;
    dev = (struct remote_sensor *) dev0;  assert(dev);  
    cfg = &dev->cfg; assert(cfg);

    return 0;
err:
    assert(rc == 0);
    return rc;
}

static int sensor_close(struct os_dev *dev0) {
    //  Close the sensor.  Return 0 if successful.
    struct remote_sensor *dev;    
    dev = (struct remote_sensor *) dev0;
    return 0;
}

/**
 * Expects to be called back through os_dev_create().
 *
 * @param The device object associated with remote_sensor
 * @param Argument passed to OS device init, unused
 *
 * @return 0 on success, non-zero error on failure.
 */
int remote_sensor_init(struct os_dev *dev0, void *arg) {
    struct remote_sensor *dev;
    struct sensor *sensor;
    int rc;
    if (!dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct remote_sensor *) dev0;

    //  Get the default config.
    rc = remote_sensor_default_cfg(&dev->cfg);
    if (rc) { goto err; }

    //  Init the sensor.
    sensor = &dev->sensor;
    rc = sensor_init(sensor, dev0);
    if (rc != 0) { goto err; }

    //  Add the driver with all the supported sensor data types.
    rc = sensor_set_driver(sensor, SENSOR_TYPE_AMBIENT_TEMPERATURE,
        (struct sensor_driver *) &g_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }

    //  Set the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, sensor_open, sensor_close);
    return (0);
err:
    return (rc);
}

static int sensor_read(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    //  Read the sensor values depending on the sensor types specified in the sensor config.
    union {  //  Union that represents all possible sensor values.
        struct sensor_temp_data std;  //  Temperature sensor value.
    } databuf;
    struct remote_sensor *dev;
    int rc, rawtemp;
    float temp;

    //  We only allow reading of temperature values.
    if (!(type & SENSOR_TYPE_AMBIENT_TEMPERATURE)) { rc = SYS_EINVAL; goto err; }
    dev = (struct remote_sensor *) SENSOR_GET_DEVICE(sensor); assert(dev);
    rawtemp = -1;
    {   //  Begin ADC Lock: Open and lock port ADC1, configure channel 16.
        rc = sensor_open((struct os_dev *) dev, 0, NULL);
        if (rc) { goto err; }

        //  Get a new temperature sample from temperature sensor (channel 16 of port ADC1).
        rc = remote_sensor_get_raw_temperature(dev, 1, &rawtemp, NULL);

        sensor_close((struct os_dev *) dev);
    }   //  End ADC Lock: Close and unlock port ADC1.
    if (rc) { goto err; }  //  console_printf("rawtemp: %d\n", rawtemp);  ////

    //  Save the temperature.
    databuf.std.std_temp = temp;
    databuf.std.std_temp_is_valid = 1;  //  console_printf("temp: ");  console_printfloat(temp);  console_printf("\n");  ////
    
    if (data_func) {  //  Call the listener function to process the sensor data.
        rc = data_func(sensor, data_arg, &databuf.std, SENSOR_TYPE_AMBIENT_TEMPERATURE);
        if (rc) { goto err; }
    }
    return 0;
err:
    return rc;
}

static int sensor_get_config(struct sensor *sensor, sensor_type_t type,
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
 * Configure Remote Sensor
 *
 * @param Sensor device remote_sensor structure
 * @param Sensor device remote_sensor_cfg config
 *
 * @return 0 on success, and non-zero error code on failure
 */
int remote_sensor_config(struct remote_sensor *dev, struct remote_sensor_cfg *cfg) {
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
