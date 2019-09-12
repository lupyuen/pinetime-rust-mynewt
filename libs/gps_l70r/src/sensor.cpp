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
//  Sensor Interface for Quectel L70-R GPS module
#include <string.h>
#include <os/mynewt.h>
#include <console/console.h>
#include <sensor/sensor.h>
#include <custom_sensor/custom_sensor.h>
#include <tiny_gps_plus/tiny_gps_plus.h>
#include "gps_l70r/gps_l70r.h"

extern TinyGPSPlus gps_parser;  //  Shared with sensor.cpp

//  Exports for the sensor API
static int gps_l70r_sensor_read(struct sensor *, sensor_type_t, sensor_data_func_t, void *, uint32_t);
static int gps_l70r_sensor_get_config(struct sensor *, sensor_type_t, struct sensor_cfg *);

//  Global instance of the sensor driver
static const struct sensor_driver g_gps_l70r_sensor_driver = {
    gps_l70r_sensor_read,
    gps_l70r_sensor_get_config
};

int gps_l70r_sensor_init(struct gps_l70r *dev, void *arg) {
    //  Configure the GPS driver as a Mynewt Sensor.  `arg` is the Sensor Interface `sensor_itf`.  Return 0 if successful.
    struct sensor *sensor;
    int rc;
    if (!arg || !dev) { rc = SYS_ENODEV; goto err; }

    //  Get the default config.
    rc = gps_l70r_default_cfg(&dev->cfg);
    if (rc) { goto err; }

    //  Init the sensor.
    sensor = &dev->sensor;
    rc = sensor_init(sensor, (struct os_dev *) dev);
    if (rc != 0) { goto err; }

    //  Add the driver with all the supported sensor data types.
    rc = sensor_set_driver(sensor, SENSOR_TYPE_GEOLOCATION,
        (struct sensor_driver *) &g_gps_l70r_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, (struct sensor_itf *) arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }

    return (0);
err:
    return (rc);
}

static int gps_l70r_sensor_read(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    //  Read the sensor values depending on the sensor types specified in the sensor config.
    union {  //  Union that represents all possible sensor values.
        struct sensor_geolocation_data sgd;  //  Geolocation sensor data
    } databuf;
    struct sensor_geolocation_data *sensor_data = &databuf.sgd;  //  Sensor data will be passed through this
    int rc = 0;

    //  We only allow reading of geolocation
    if (!(type & SENSOR_TYPE_GEOLOCATION)) { rc = SYS_EINVAL; goto err; }

    //  Save the GPS geolocation based on the parsed NMEA data
    memset(sensor_data, 0, sizeof(struct sensor_geolocation_data));  //  Init all fields to 0
    if (gps_parser.location.isValid()) {  //  If we have parsed a valid latitude / longtude
        sensor_data->sgd_latitude           = gps_parser.location.lat();
        sensor_data->sgd_longitude          = gps_parser.location.lng();
        sensor_data->sgd_latitude_is_valid  = 1;
        sensor_data->sgd_longitude_is_valid = 1;
    }
    if (gps_parser.altitude.isValid()) {  //  If we have parsed a valid altitude
        sensor_data->sgd_altitude           = gps_parser.altitude.meters();
        sensor_data->sgd_altitude_is_valid  = 1;
    }
    if (data_func) {  //  Call the Listener Function to process the sensor data.
        rc = data_func(sensor, data_arg, sensor_data, SENSOR_TYPE_GEOLOCATION);
        if (rc) { goto err; }
    }
    return 0;
err:
    return rc;
}

static int gps_l70r_sensor_get_config(struct sensor *sensor, sensor_type_t type,
    struct sensor_cfg *cfg) {
    //  Return the type of the sensor value returned by the sensor.
    int rc;
    if (!(type & SENSOR_TYPE_GEOLOCATION)) {
        rc = SYS_EINVAL;
        goto err;
    }
    cfg->sc_valtype = SENSOR_VALUE_TYPE_FLOAT_TRIPLET;  //  We return 3 floats: latitude, longitude, altitude
    return (0);
err:
    return (rc);
}

int gps_l70r_sensor_default_cfg(struct gps_l70r_cfg *cfg) {
    //  Copy the default sensor config into cfg.  Returns 0.
    cfg->bc_s_mask = SENSOR_TYPE_ALL;  //  Return all sensor values
    return 0;
}

/**
 * Configure GPS sensor
 *
 * @param Sensor device gps_l70r structure
 * @param Sensor device gps_l70r_cfg config
 *
 * @return 0 on success, and non-zero error code on failure
 */
int gps_l70r_sensor_config(struct gps_l70r *dev, struct gps_l70r_cfg *cfg) {
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
