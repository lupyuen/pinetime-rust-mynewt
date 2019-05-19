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
#ifndef __REMOTE_SENSOR_MACROS_H__
#define __REMOTE_SENSOR_MACROS_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif
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

#ifdef __cplusplus
}
#endif

#endif /* __REMOTE_SENSOR_MACROS_H__ */
