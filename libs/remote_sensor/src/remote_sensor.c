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
#include "oic/oc_rep.h"
#include "sensor/sensor.h"
#include "sensor/temperature.h"
#include "sensor/pressure.h"
#include "sensor/humidity.h"
#include "custom_sensor/custom_sensor.h"  //  For SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW
#include "remote_sensor/remote_sensor.h"

//  Macros for Remote Sensors
#include "remote_sensor_macros.h"  //  Define macros
#include "sensor_value_type.h"     //  Instances of sensor value types
#include "sensor_data_union.h"     //  Instances of sensor data union
#include "save_sensor_value.h"     //  Instances of save sensor value functions
#include "sensor_type_desc.h"      //  Instances of sensor type descriptors

static int sensor_read_internal(struct sensor *, sensor_type_t, sensor_data_func_t, void *, uint32_t);
static int sensor_get_config_internal(struct sensor *, sensor_type_t, struct sensor_cfg *);
static int sensor_open_internal(struct os_dev *dev0, uint32_t timeout, void *arg);
static int sensor_close_internal(struct os_dev *dev0);

//  Global instance of the sensor driver
static const struct sensor_driver g_sensor_driver = {
    sensor_read_internal,
    sensor_get_config_internal
};

/////////////////////////////////////////////////////////
//  Read Sensor Functions

static int sensor_read_internal(struct sensor *sensor, sensor_type_t type,
    sensor_data_func_t data_func, void *data_arg, uint32_t timeout) {
    //  Read the sensor value depending on the sensor type specified in the sensor config.
    //  Call the Listener Function (may be NULL) with the sensor value.
    //  data_arg is a sensor_read_ctx whose user_arg is an (oc_rep_t *) with type and value passed by process_coap_message().
    assert(sensor);
    if (!data_func) { return 0; }  //  If no Listener Function, then don't continue.
    assert(data_arg);
    struct sensor_read_ctx *src = (struct sensor_read_ctx *) data_arg;
    oc_rep_t *rep = (oc_rep_t *) src->user_arg;  //  Contains type and value.
    assert(rep);
    int rc = 0;

    //  Find the Sensor Type.
    const struct sensor_type_descriptor *st = sensor_types;
    while (st->type && type != st->type) { st++; }
    if (type != st->type) { rc = SYS_EINVAL; goto err; }

    //  Convert the value.
    union sensor_data_union data;
    void *d = st->save_func(&data, rep);  
    
    //  Call the Listener Function to process the sensor data.
    rc = data_func(sensor, data_arg, d, type);
    assert(rc == 0);
    if (rc) { goto err; }
    return 0;
err:
    return rc;
}

/////////////////////////////////////////////////////////
//  Sensor Data Functions

sensor_type_t remote_sensor_lookup_type(const char *name) {
    //  Return the Sensor Type given the CBOR field name.  Return 0 if not found.
    assert(name);
    const struct sensor_type_descriptor *st = sensor_types;
    while (st->type) {
        assert(st->name);
        if (strcmp(name, st->name) == 0) { return st->type; }
        st++; 
    }    
    return 0;
}

/////////////////////////////////////////////////////////
//  Device Creation Functions

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
    int all_types = 0;  const struct sensor_type_descriptor *st = sensor_types;
    while (st->type) { all_types |= st->type; st++; }

    rc = sensor_set_driver(sensor, all_types, (struct sensor_driver *) &g_sensor_driver);
    if (rc != 0) { goto err; }

    //  Set the interface.
    rc = sensor_set_interface(sensor, arg);
    if (rc) { goto err; }

    //  Register with the Sensor Manager.
    rc = sensor_mgr_register(sensor);
    if (rc != 0) { goto err; }

    //  Set the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, sensor_open_internal, sensor_close_internal);
    return (0);
err:
    return (rc);
}

static int sensor_get_config_internal(struct sensor *sensor, sensor_type_t type,
    struct sensor_cfg *cfg) {
    //  Return the type of the sensor value returned by the sensor.    
    const struct sensor_type_descriptor *st = sensor_types;
    while (st->type) { 
        if (type & st->type) {
            cfg->sc_valtype = st->valtype;
            return 0;
        }
        st++; 
    }
    return SYS_EINVAL;
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

int remote_sensor_default_cfg(struct remote_sensor_cfg *cfg) {
    //  Return the default sensor configuration.
    memset(cfg, 0, sizeof(struct remote_sensor_cfg));  //  Zero the entire object.
    cfg->bc_s_mask = SENSOR_TYPE_ALL;  //  Return all sensor values, i.e. temperature.
    return 0;
}

/////////////////////////////////////////////////////////
//  Device Open and Close Functions

static int sensor_open_internal(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  Setup the sensor.  Return 0 if successful.
    struct remote_sensor *dev;    
    struct remote_sensor_cfg *cfg;
    dev = (struct remote_sensor *) dev0;  assert(dev);  
    cfg = &dev->cfg; assert(cfg);
    return 0;
}

static int sensor_close_internal(struct os_dev *dev0) {
    //  Close the sensor.  Return 0 if successful.
    return 0;
}
