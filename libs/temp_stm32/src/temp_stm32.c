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

#include <assert.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

#include "os/mynewt.h"
#include "sensor/sensor.h"
#include "sensor/temperature.h"
#include "temp_stm32/temp_stm32.h"

//  Exports for the sensor API
static int temp_stm32_sensor_read(struct sensor *, sensor_type_t,
    sensor_data_func_t, void *, uint32_t);
static int temp_stm32_sensor_get_config(struct sensor *, sensor_type_t,
    struct sensor_cfg *);

static const struct sensor_driver g_temp_stm32_sensor_driver = {
    temp_stm32_sensor_read,
    temp_stm32_sensor_get_config
};

static int temp_stm32_default_cfg(struct temp_stm32_cfg *cfg) {
    cfg->bc_s_mask = SENSOR_TYPE_ALL;
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
    rc = temp_stm32_default_cfg(&dev->cfg);
    if (rc) { goto err; }

    sensor = &dev->sensor;
    rc = sensor_init(sensor, dev);
    if (rc != 0) { goto err; }

    //  Add the driver with all the supported type.
    rc = sensor_set_driver(sensor, SENSOR_TYPE_AMBIENT_TEMPERATURE,
        (struct sensor_driver *) &g_temp_stm32_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }
    return (0);
err:
    return (rc);
}

static int temp_stm32_sensor_read(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    struct sensor_itf *itf;
    struct temp_stm32 *dev;
    int rc;
    int32_t rawtemp;
    union {
        struct sensor_temp_data std;
    } databuf;

    if (!(type & SENSOR_TYPE_AMBIENT_TEMPERATURE)) {
        rc = SYS_EINVAL;
        goto err;
    }
    itf = SENSOR_GET_ITF(sensor);
    dev = (struct temp_stm32 *) SENSOR_GET_DEVICE(sensor);

    //  Get a new temperature sample always.
    rawtemp = 0;
    rc = temp_stm32_get_temperature(itf, &rawtemp);
    if (rc) { goto err; }

    if (type & SENSOR_TYPE_AMBIENT_TEMPERATURE) {
        databuf.std.std_temp_is_valid = 1;
        //  Call data function.
        rc = data_func(sensor, data_arg, &databuf.std, SENSOR_TYPE_AMBIENT_TEMPERATURE);
        if (rc) { goto err; }
    }
    return 0;
err:
    return rc;
}

static int temp_stm32_sensor_get_config(struct sensor *sensor, sensor_type_t type,
    struct sensor_cfg *cfg) {
    int rc;
    if (!(type & SENSOR_TYPE_AMBIENT_TEMPERATURE)) {
        rc = SYS_EINVAL;
        goto err;
    }
    cfg->sc_valtype = SENSOR_VALUE_TYPE_FLOAT;
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
    int rc;
    uint8_t id;
    uint8_t calibrating;
    struct sensor_itf *itf;

    itf = SENSOR_GET_ITF(&(dev->sensor));
    rc = sensor_set_type_mask(&(dev->sensor),  cfg->bc_s_mask);
    if (rc) { goto err; }

    dev->cfg.bc_s_mask = cfg->bc_s_mask;
    return 0;
err:
    return (rc);
}

/**
 * Get temperature from STM32 internal temperature sensor
 *
 * @param The sensor interface
 * @param temperature
 *
 * @return 0 on success, and non-zero error code on failure
 */
int temp_stm32_get_temperature(struct sensor_itf *itf, int32_t *temp) {
    int rc;
    uint8_t tmp[3];
    rc = temp_stm32_readlen(itf, TEMP_STM32_REG_ADDR_TEMP, tmp, 3);
    if (rc) { goto err; }

    *temp = (int32_t)((((uint32_t)(tmp[0])) << 12) |
                      (((uint32_t)(tmp[1])) <<  4) |
                       ((uint32_t)tmp[2] >> 4));
    return 0;
err:
    return rc;
}
