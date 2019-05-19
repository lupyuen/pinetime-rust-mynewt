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
#ifndef __SENSOR_DATA_UNION_H__
#define __SENSOR_DATA_UNION_H__
#include "remote_sensor_macros.h"  //  Define macros

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

/////////////////////////////////////////////////////////
//  Sensor Data Union

union sensor_data_union {  //  Union that represents all possible sensor values

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

};

#ifdef __cplusplus
}
#endif

#endif /* __SENSOR_DATA_UNION_H__ */
