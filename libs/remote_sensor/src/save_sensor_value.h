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
#ifndef __SAVE_SENSOR_VALUE_H__
#define __SAVE_SENSOR_VALUE_H__
#include "remote_sensor_macros.h"  //  Define macros

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

/////////////////////////////////////////////////////////
//  Save Sensor Value

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

/* Previously: static void *save_temp(sensor_data_union *data, oc_rep_t *r) {
    //  Save computed temperature into the sensor data union.
    struct sensor_temp_data *d = &data->std;
    assert(r->type == DOUBLE);
    d->std_temp = (float) r->value_double;
    d->std_temp_is_valid = 1;
    return d;
} */

/* Previously: static void *save_press(sensor_data_union *data, oc_rep_t *r) {
    //  Save pressure into the sensor data union.
    struct sensor_press_data *d = &data->spd;
    assert(r->type == DOUBLE);
    d->spd_press = r->value_double;
    d->spd_press_is_valid = 1;
    return d;
} */

/* Previously: static void *save_humid(sensor_data_union *data, oc_rep_t *r) {
    //  Save humidity into the sensor data union.
    struct sensor_humid_data *d = &data->shd;
    assert(r->type == DOUBLE);
    d->shd_humid = r->value_double;
    d->shd_humid_is_valid = 1;
    return d;
} */

#ifdef __cplusplus
}
#endif

#endif /* __SAVE_SENSOR_VALUE_H__ */
