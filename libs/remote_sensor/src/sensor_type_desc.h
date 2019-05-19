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
#ifndef __SENSOR_TYPE_DESC_H__
#define __SENSOR_TYPE_DESC_H__
#include "remote_sensor_macros.h"  //  Define macros

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

/////////////////////////////////////////////////////////
//  Sensor Type Descriptor

struct sensor_type_descriptor {  //  Describes a Sensor Type e.g. raw temperature sensor
    const char *name;  //  Sensor Name in CBOR Payload e.g. "t"
    int type;          //  Sensor Type e.g. SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW
    int valtype;       //  Sensor Value Type e.g. SENSOR_VALUE_TYPE_INT32 (from Mynewt Sensor Framework)
    void *(*save_func)(sensor_data_union *data, oc_rep_t *rep);  //  Save the sensor value from the oc_rep_t into data.
};

/////////////////////////////////////////////////////////
//  Supported Sensor Types

//  For temp_raw, the macro generates:
//  { "t", SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW, SENSOR_VALUE_TYPE_INT32, save_temp_raw }
#define _SENSOR_TYPE_DESC(_name, _field, _type_upper2, _stype) \
    { \
        _field, \
        _SENSOR_TYPE(_stype), \
        _SENSOR_VALUE_TYPE(_type_upper2), \
        _SAVE(_name) \
    }

//  List of Sensor Types that Remote Sensor supports
static const struct sensor_type_descriptor sensor_types[] = {  

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

#ifdef __cplusplus
}
#endif

#endif /* __SENSOR_TYPE_DESC_H__ */
