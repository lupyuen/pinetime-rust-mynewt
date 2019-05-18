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

//  Identity macro, which expands the value of x if x is a macro:
//  _ID (abc) = abc
#define _ID(x) x

//  Convert token x to a string: _STR(abc) = "abc"
#define _STR(x) # x

//  _SENSOR_DATA((abc)) = sensor_abc_data
#define _SENSOR_DATA(x)  _SENSOR_DATA0 x
#define _SENSOR_DATA0(x) sensor_ ## x ## _data

//  _SENSOR_TYPE((abc)) = SENSOR_TYPE_abc
#define _SENSOR_TYPE(x)  _SENSOR_TYPE0 x
#define _SENSOR_TYPE0(x) SENSOR_TYPE_ ## x

//  _SENSOR_VALUE_TYPE((abc)) = SENSOR_VALUE_TYPE_abc
#define _SENSOR_VALUE_TYPE(x)  _SENSOR_VALUE_TYPE0 x
#define _SENSOR_VALUE_TYPE0(x) SENSOR_VALUE_TYPE_ ## x

//  _SAVE((abc)) = save_abc
#define _SAVE(x)  _SAVE0 x
#define _SAVE0(x) save_ ## x

//  _VALUE_TYPE((abc)) = value_abc
#define _VALUE_TYPE(x)  _VALUE_TYPE0 x
#define _VALUE_TYPE0(x) value_ ## x

//  _CONCAT((abc), (def)) = abc_def
#define _CONCAT(x, y)  _CONCAT1(_ID x, _ID y)
#define _CONCAT1(x, y) _CONCAT2(x, y)
#define _CONCAT2(x, y) x##_##y

//  _IS_VALID((abc), (def)) = abc_def_is_valid
#define _IS_VALID(x, y)  _IS_VALID1(_ID x, _ID y)
#define _IS_VALID1(x, y) _IS_VALID2(x, y)
#define _IS_VALID2(x, y) x##_##y##_is_valid

//  Test Hex
#define _ID3(a,b,c) {a,b,c}
#define _HEX3(x) _ID(_ID3 x)
const uint8_t _test_hex[3] = _HEX3(MYNEWT_VAL(TEST_HEX));

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
//  Sensor Data Union

//  For temp_raw, the macro generates: struct sensor_temp_raw_data strd
#define _SENSOR_DATA_UNION(_name, _union) \
    struct _SENSOR_DATA(_name) _ID _union

typedef union {  //  Union that represents all possible sensor values

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD  //  If Remote Sensor Type 1 is configured...
    //  For temp_raw, the macro generates: 
    //  struct sensor_temp_raw_data strd
    _SENSOR_DATA_UNION(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, UNION)
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD  //  If Remote Sensor Type 2 is configured...
    //  For temp, the macro generates: 
    //  struct sensor_temp_data std
    _SENSOR_DATA_UNION(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, UNION)
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD  //  If Remote Sensor Type 3 is configured...
    //  For press, the macro generates: 
    //  struct sensor_press_data spd
    _SENSOR_DATA_UNION(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, UNION)
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD  //  If Remote Sensor Type 4 is configured...
    //  For humid, the macro generates: 
    //  struct sensor_humid_data shd
    _SENSOR_DATA_UNION(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, UNION)
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD  //  If Remote Sensor Type 5 is configured...
#error _SENSOR_DATA_UNION() not defined for Remote Sensor Type 5
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD

} sensor_data_union;

/////////////////////////////////////////////////////////
//  Sensor Type Descriptor

struct sensor_type_descriptor {  //  Describes a Sensor Type e.g. raw temperature sensor
    const char *name;  //  Sensor Name in CBOR Payload e.g. "t"
    int type;          //  Sensor Type e.g. SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW
    int valtype;       //  Sensor Value Type e.g. SENSOR_VALUE_TYPE_INT32 (from Mynewt Sensor Framework)
    void *(*save_func)(sensor_data_union *data, oc_rep_t *rep);  //  Save the sensor value from the oc_rep_t into data.
};

/////////////////////////////////////////////////////////
//  Sensor Values

//  For each Sensor Type: Define the function to read the parsed CBOR sensor value in "r" and 
//  save into the sensor_data_union "data".
//  Return the sensor_data_union field that is specfic fpr the sensor value.

/*  For temp_raw, this macro generates:
static void *save_temp_raw(sensor_data_union *data, oc_rep_t *r) {
    struct sensor_temp_raw_data *d = &data->strd;
    assert(r->type == INT);
    d->strd_temp_raw = r->value_int;
    d->strd_temp_raw_is_valid = 1;
    return d;
} */
#define _SAVE_SENSOR_VALUE(_name, _type, _type_upper, _union) \
    static void *_SAVE(_name)(sensor_data_union *data, oc_rep_t *r) { \
        struct _SENSOR_DATA(_name) *d = &data->_ID _union; \
        assert(r->type == _ID _type_upper); \
        d->_CONCAT(_union, _name) = r->_VALUE_TYPE(_type); \
        d->_IS_VALID(_union, _name) = 1; \
        return d; \
    }

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD  //  If Remote Sensor Type 1 is configured...
    _SAVE_SENSOR_VALUE(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, TYPE),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, TYPE_UPPER),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, UNION)    
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD  //  If Remote Sensor Type 2 is configured...
    _SAVE_SENSOR_VALUE(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, TYPE),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, TYPE_UPPER),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, UNION)    
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD  //  If Remote Sensor Type 3 is configured...
    _SAVE_SENSOR_VALUE(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, TYPE),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, TYPE_UPPER),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, UNION)    
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD  //  If Remote Sensor Type 4 is configured...
    _SAVE_SENSOR_VALUE(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, NAME),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, TYPE),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, TYPE_UPPER),
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, UNION)    
    );
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD  //  If Remote Sensor Type 5 is configured...
#error _SAVE_SENSOR_VALUE() not defined for Remote Sensor Type 5
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD

/* static void *save_temp(sensor_data_union *data, oc_rep_t *r) {
    //  Save computed temperature into the sensor data union.
    struct sensor_temp_data *d = &data->std;
    assert(r->type == DOUBLE);
    d->std_temp = (float) r->value_double;
    d->std_temp_is_valid = 1;
    return d;
} */

/* static void *save_press(sensor_data_union *data, oc_rep_t *r) {
    //  Save pressure into the sensor data union.
    struct sensor_press_data *d = &data->spd;
    assert(r->type == DOUBLE);
    d->spd_press = r->value_double;
    d->spd_press_is_valid = 1;
    return d;
} */

/* static void *save_humid(sensor_data_union *data, oc_rep_t *r) {
    //  Save humidity into the sensor data union.
    struct sensor_humid_data *d = &data->shd;
    assert(r->type == DOUBLE);
    d->shd_humid = r->value_double;
    d->shd_humid_is_valid = 1;
    return d;
} */

/////////////////////////////////////////////////////////
//  Supported Sensor Types

//  For temp_raw, the macro generates { "t", SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW, SENSOR_VALUE_TYPE_INT32, save_temp_raw }
#define _SENSOR_TYPE_DESC(_name, _field, _type_upper2, _stype) \
    { \
        _field, \
        _SENSOR_TYPE(_stype), \
        _SENSOR_VALUE_TYPE(_type_upper2), \
        _SAVE(_name) \
    }

static const struct sensor_type_descriptor sensor_types[] = {  
    //  List of Sensor Types that Remote Sensor supports

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD  //  If Remote Sensor Type 1 is configured...
    //  For temp_raw, the macro generates:
    //  { "t", SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW, SENSOR_VALUE_TYPE_INT32, save_temp_raw }
    _SENSOR_TYPE_DESC(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, NAME), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, FIELD), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, TYPE_UPPER2), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, SENSOR_TYPE)
    ),
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD  //  If Remote Sensor Type 2 is configured...
    //  For temp, the macro generates:
    //  { "tf", SENSOR_TYPE_AMBIENT_TEMPERATURE, SENSOR_VALUE_TYPE_FLOAT, save_temp },
    _SENSOR_TYPE_DESC(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, NAME), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, FIELD), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, TYPE_UPPER2), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, SENSOR_TYPE)
    ),
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD  //  If Remote Sensor Type 3 is configured...
    //  For press, the macro generates:
    //  { "p", SENSOR_TYPE_PRESSURE, SENSOR_VALUE_TYPE_FLOAT, save_press },
    _SENSOR_TYPE_DESC(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, NAME), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, FIELD), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, TYPE_UPPER2), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, SENSOR_TYPE)
    ),
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD  //  If Remote Sensor Type 4 is configured...
    //  For humid, the macro generates:
    //  { "h", SENSOR_TYPE_RELATIVE_HUMIDITY, SENSOR_VALUE_TYPE_FLOAT, save_humid },
    _SENSOR_TYPE_DESC(
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, NAME), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, FIELD), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, TYPE_UPPER2), 
        MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, SENSOR_TYPE)
    ),
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD  //  If Remote Sensor Type 5 is configured...
#error _SENSOR_TYPE_DESC() not defined for Remote Sensor Type 5
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD

    { NULL, 0, 0, NULL }  //  Ends with 0
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
    sensor_data_union data;
    void *d = st->save_func(&data, rep);  
    
    //  Save the value.
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

#ifdef NOTUSED  //  Test data
    #define SENSOR_VALUE_NAME (temp_raw)
    #define SENSOR_VALUE_FIELD ("t")
    #define SENSOR_VALUE_UNION (strd)
    #define SENSOR_VALUE_TYPE (int)
    #define SENSOR_VALUE_TYPE_UPPER (INT)     //  Custom Sensor Value Type
    #define SENSOR_VALUE_TYPE_UPPER2 (INT32)  //  Sensor Framework Type
    #define SENSOR_VALUE_SENSOR_TYPE (AMBIENT_TEMPERATURE_RAW)
#endif  //  NOTUSED
