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

/* Exports for the sensor API */
static int temp_stm32_sensor_read(struct sensor *, sensor_type_t,
        sensor_data_func_t, void *, uint32_t);
static int temp_stm32_sensor_get_config(struct sensor *, sensor_type_t,
        struct sensor_cfg *);

static const struct sensor_driver g_temp_stm32_sensor_driver = {
    temp_stm32_sensor_read,
    temp_stm32_sensor_get_config
};

static int
temp_stm32_default_cfg(struct temp_stm32_cfg *cfg)
{
    cfg->bc_iir = TEMP_STM32_FILTER_OFF;
    cfg->bc_mode = TEMP_STM32_MODE_NORMAL;

    cfg->bc_boc[0].boc_type = SENSOR_TYPE_AMBIENT_TEMPERATURE;
    cfg->bc_boc[0].boc_oversample = TEMP_STM32_SAMPLING_NONE;
    cfg->bc_boc[1].boc_type = SENSOR_TYPE_PRESSURE;
    cfg->bc_boc[1].boc_oversample = TEMP_STM32_SAMPLING_NONE;
    cfg->bc_boc[2].boc_type = SENSOR_TYPE_RELATIVE_HUMIDITY;
    cfg->bc_boc[2].boc_oversample = TEMP_STM32_SAMPLING_NONE;
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
int
temp_stm32_init(struct os_dev *dev, void *arg)
{
    struct temp_stm32 *temp_stm32;
    struct sensor *sensor;
    int rc;

    if (!arg || !dev) {
        rc = SYS_ENODEV;
        goto err;
    }

    temp_stm32 = (struct temp_stm32 *) dev;

    rc = temp_stm32_default_cfg(&temp_stm32->cfg);
    if (rc) {
        goto err;
    }

    sensor = &temp_stm32->sensor;

    /* Initialise the stats entry */
    rc = stats_init(
        STATS_HDR(g_temp_stm32stats),
        STATS_SIZE_INIT_PARMS(g_temp_stm32stats, STATS_SIZE_32),
        STATS_NAME_INIT_PARMS(temp_stm32_stat_section));
    SYSINIT_PANIC_ASSERT(rc == 0);
    /* Register the entry with the stats registry */
    rc = stats_register(dev->od_name, STATS_HDR(g_temp_stm32stats));
    SYSINIT_PANIC_ASSERT(rc == 0);

    rc = sensor_init(sensor, dev);
    if (rc != 0) {
        goto err;
    }

    /* Add the driver with all the supported type */
    rc = sensor_set_driver(sensor, SENSOR_TYPE_AMBIENT_TEMPERATURE |
                           SENSOR_TYPE_PRESSURE            |
                           SENSOR_TYPE_RELATIVE_HUMIDITY,
                           (struct sensor_driver *) &g_temp_stm32_sensor_driver);
    if (rc != 0) {
        goto err;
    }

    /* Set the interface */
    rc = sensor_set_interface(sensor, arg);
    if (rc) {
        goto err;
    }

    rc = sensor_mgr_register(sensor);
    if (rc != 0) {
        goto err;
    }

    return (0);
err:
    return (rc);

}

static int
temp_stm32_sensor_read(struct sensor *sensor, sensor_type_t type,
        sensor_data_func_t data_func, void *data_arg, uint32_t timeout)
{
    int32_t rawtemp;
    int32_t rawpress;
    int32_t rawhumid;
    struct sensor_itf *itf;
    struct temp_stm32 *temp_stm32;
    int rc;
    union {
        struct sensor_temp_data std;
        struct sensor_press_data spd;
        struct sensor_humid_data shd;
    } databuf;

    if (!(type & SENSOR_TYPE_PRESSURE)    &&
        !(type & SENSOR_TYPE_AMBIENT_TEMPERATURE) &&
        !(type & SENSOR_TYPE_RELATIVE_HUMIDITY)) {
        rc = SYS_EINVAL;
        goto err;
    }

    itf = SENSOR_GET_ITF(sensor);

    temp_stm32 = (struct temp_stm32 *)SENSOR_GET_DEVICE(sensor);

    /*
     * For forced mode the sensor goes to sleep after setting the sensor to
     * forced mode and grabbing sensor data
     */
    if (temp_stm32->cfg.bc_mode == TEMP_STM32_MODE_FORCED) {
        rc = temp_stm32_forced_mode_measurement(itf);
        if (rc) {
            goto err;
        }
    }

    rawtemp = rawpress = rawhumid = 0;

    /* Get a new temperature sample always */
    rc = temp_stm32_get_temperature(itf, &rawtemp);
    if (rc) {
        goto err;
    }
    databuf.std.std_temp = temp_stm32_compensate_temperature(rawtemp, &(temp_stm32->pdd));

    /* Get a new pressure sample */
    if (type & SENSOR_TYPE_PRESSURE) {
        rc = temp_stm32_get_pressure(itf, &rawpress);
        if (rc) {
            goto err;
        }
    }

    /* Get a new relative humidity sample */
    if (type & SENSOR_TYPE_RELATIVE_HUMIDITY) {
        rc = temp_stm32_get_humidity(itf, &rawhumid);
        if (rc) {
            goto err;
        }
    }

    if (type & SENSOR_TYPE_AMBIENT_TEMPERATURE) {
        if (databuf.std.std_temp != NAN) {
            databuf.std.std_temp_is_valid = 1;
        }

        /* Call data function */
        rc = data_func(sensor, data_arg, &databuf.std, SENSOR_TYPE_AMBIENT_TEMPERATURE);
        if (rc) {
            goto err;
        }
    }

    if (type & SENSOR_TYPE_PRESSURE) {
        databuf.spd.spd_press = temp_stm32_compensate_pressure(itf, rawpress, &(temp_stm32->pdd));

        if (databuf.spd.spd_press != NAN) {
            databuf.spd.spd_press_is_valid = 1;
        }

        /* Call data function */
        rc = data_func(sensor, data_arg, &databuf.spd, SENSOR_TYPE_PRESSURE);
        if (rc) {
            goto err;
        }
    }

    if (type & SENSOR_TYPE_RELATIVE_HUMIDITY) {
        databuf.shd.shd_humid = temp_stm32_compensate_humidity(itf, rawhumid, &(temp_stm32->pdd));

        if (databuf.shd.shd_humid != NAN) {
            databuf.shd.shd_humid_is_valid = 1;
        }

        /* Call data function */
        rc = data_func(sensor, data_arg, &databuf.shd, SENSOR_TYPE_RELATIVE_HUMIDITY);
        if (rc) {
            goto err;
        }
    }

    return 0;
err:
    return rc;
}

static int
temp_stm32_sensor_get_config(struct sensor *sensor, sensor_type_t type,
        struct sensor_cfg *cfg)
{
    int rc;

    if (!(type & SENSOR_TYPE_PRESSURE)    ||
        !(type & SENSOR_TYPE_AMBIENT_TEMPERATURE) ||
        !(type & SENSOR_TYPE_RELATIVE_HUMIDITY)) {
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
int
temp_stm32_config(struct temp_stm32_dev *temp_stm32, struct temp_stm32_cfg *cfg)
{
    int rc;
    uint8_t id;
    uint8_t calibrating;
    struct sensor_itf *itf;

    itf = SENSOR_GET_ITF(&(temp_stm32->sensor));

    /* Check if we can read the chip address */
    rc = temp_stm32_get_chipid(itf, &id);
    if (rc) {
        goto err;
    }

    if (id != TEMP_STM32_CHIPID && id != BMP280_CHIPID) {
        os_time_delay((OS_TICKS_PER_SEC * 100)/1000 + 1);

        rc = temp_stm32_get_chipid(itf, &id);
        if (rc) {
            goto err;
        }

        if(id != TEMP_STM32_CHIPID && id != BMP280_CHIPID) {
            rc = SYS_EINVAL;
            goto err;
        }
    }

    rc = temp_stm32_reset(itf);
    if (rc) {
        goto err;
    }

    os_time_delay((OS_TICKS_PER_SEC * 300)/1000 + 1);

    calibrating = 1;

    while(calibrating) {
        rc = temp_stm32_is_calibrating(itf, &calibrating);
        if (rc) {
            goto err;
        }
    }

    rc = temp_stm32_get_calibinfo(itf, &(temp_stm32->pdd.bcd));
    if (rc) {
        goto err;
    }

    rc = temp_stm32_set_iir(itf, cfg->bc_iir);
    if (rc) {
        goto err;
    }

    os_time_delay((OS_TICKS_PER_SEC * 200)/1000 + 1);

    temp_stm32->cfg.bc_iir = cfg->bc_iir;

    rc = temp_stm32_set_mode(itf, cfg->bc_mode);
    if (rc) {
        goto err;
    }

    os_time_delay((OS_TICKS_PER_SEC * 200)/1000 + 1);

    temp_stm32->cfg.bc_mode = cfg->bc_mode;

    rc = temp_stm32_set_sby_duration(itf, cfg->bc_sby_dur);
    if (rc) {
        goto err;
    }

    os_time_delay((OS_TICKS_PER_SEC * 200)/1000 + 1);

    temp_stm32->cfg.bc_sby_dur = cfg->bc_sby_dur;

    if (cfg->bc_boc[0].boc_type) {
        rc = temp_stm32_set_oversample(itf, cfg->bc_boc[0].boc_type,
                                   cfg->bc_boc[0].boc_oversample);
        if (rc) {
            goto err;
        }
    }

    temp_stm32->cfg.bc_boc[0].boc_type = cfg->bc_boc[0].boc_type;
    temp_stm32->cfg.bc_boc[0].boc_oversample = cfg->bc_boc[0].boc_oversample;

    if (cfg->bc_boc[1].boc_type) {
        rc = temp_stm32_set_oversample(itf, cfg->bc_boc[1].boc_type,
                                   cfg->bc_boc[1].boc_oversample);
        if (rc) {
            goto err;
        }
    }

    temp_stm32->cfg.bc_boc[1].boc_type = cfg->bc_boc[1].boc_type;
    temp_stm32->cfg.bc_boc[1].boc_oversample = cfg->bc_boc[1].boc_oversample;

    if (cfg->bc_boc[2].boc_type) {
        rc = temp_stm32_set_oversample(itf, cfg->bc_boc[2].boc_type,
                                   cfg->bc_boc[2].boc_oversample);
        if (rc) {
            goto err;
        }
    }

    temp_stm32->cfg.bc_boc[2].boc_type = cfg->bc_boc[2].boc_type;
    temp_stm32->cfg.bc_boc[2].boc_oversample = cfg->bc_boc[2].boc_oversample;

    os_time_delay((OS_TICKS_PER_SEC * 200)/1000 + 1);

    rc = sensor_set_type_mask(&(temp_stm32->sensor),  cfg->bc_s_mask);
    if (rc) {
        goto err;
    }

    temp_stm32->cfg.bc_s_mask = cfg->bc_s_mask;

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
int
temp_stm32_get_temperature(struct sensor_itf *itf, int32_t *temp)
{
    int rc;
    uint8_t tmp[3];

    rc = temp_stm32_readlen(itf, TEMP_STM32_REG_ADDR_TEMP, tmp, 3);
    if (rc) {
        goto err;
    }

    *temp = (int32_t)((((uint32_t)(tmp[0])) << 12) |
                      (((uint32_t)(tmp[1])) <<  4) |
                       ((uint32_t)tmp[2] >> 4));

    return 0;
err:
    return rc;
}
