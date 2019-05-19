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
#ifndef __SENSOR_VALUE_TYPE_H__
#define __SENSOR_VALUE_TYPE_H__
#include "remote_sensor_macros.h"  //  Define macros

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

/////////////////////////////////////////////////////////
//  Sensor Value Type: Map Value Type to TYPE, TYPE_UPPER and TYPE_UPPER2 

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD  //  If Remote Sensor Type 1 is configured...
  #if MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, INT)        //  If type is int...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__TYPE         (int)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__TYPE_UPPER   (INT)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__TYPE_UPPER2  (INT32)
  #elif MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_1, DOUBLE)   //  If type is double...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__TYPE         (double)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__TYPE_UPPER   (DOUBLE)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__TYPE_UPPER2  (FLOAT)
  #else
    #error Unknown Value Type for REMOTE_SENSOR_TYPE_1
  #endif
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_1__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD  //  If Remote Sensor Type 2 is configured...
  #if MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, INT)        //  If type is int...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__TYPE         (int)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__TYPE_UPPER   (INT)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__TYPE_UPPER2  (INT32)
  #elif MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_2, DOUBLE)   //  If type is double...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__TYPE         (double)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__TYPE_UPPER   (DOUBLE)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__TYPE_UPPER2  (FLOAT)
  #else
    #error Unknown Value Type for REMOTE_SENSOR_TYPE_2
  #endif
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_2__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD  //  If Remote Sensor Type 3 is configured...
  #if MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, INT)        //  If type is int...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__TYPE         (int)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__TYPE_UPPER   (INT)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__TYPE_UPPER2  (INT32)
  #elif MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_3, DOUBLE)   //  If type is double...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__TYPE         (double)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__TYPE_UPPER   (DOUBLE)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__TYPE_UPPER2  (FLOAT)
  #else
    #error Unknown Value Type for REMOTE_SENSOR_TYPE_3
  #endif
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_3__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD  //  If Remote Sensor Type 4 is configured...
  #if MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, INT)        //  If type is int...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__TYPE         (int)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__TYPE_UPPER   (INT)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__TYPE_UPPER2  (INT32)
  #elif MYNEWT_VAL_CHOICE(REMOTE_SENSOR_TYPE_4, DOUBLE)   //  If type is double...
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__TYPE         (double)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__TYPE_UPPER   (DOUBLE)
    #define MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__TYPE_UPPER2  (FLOAT)
  #else
    #error Unknown Value Type for REMOTE_SENSOR_TYPE_4
  #endif
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_4__FIELD

#ifdef MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD  //  If Remote Sensor Type 5 is configured...
  #error Sensor Type Map not defined for Remote Sensor Type 5
#endif  //  MYNEWT_VAL_REMOTE_SENSOR_TYPE_5__FIELD

#ifdef __cplusplus
}
#endif

#endif /* __SENSOR_VALUE_TYPE_H__ */
