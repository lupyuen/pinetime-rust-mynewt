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


#ifndef __JSON_HELPER_H__
#define __JSON_HELPER_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

//! Helper Functions for Mynewt JSON Encoding API

///  Assume we are writing an object now.  Write the key name and start a child array.
///  ```
///  {a:b --> {a:b, key:[
///  ```
void json_helper_set_array(void *object, const char *key);

///  End the child array and resume writing the parent object.
///  ```
///  {a:b, key:[... --> {a:b, key:[...]
///  ```
void json_helper_close_array(void *object, const char *key);

///  Assume we have called `set_array`.  Start an array item, assumed to be an object.
///  ```
///  [... --> [...,
///  ```
void json_helper_object_array_start_item(const char *key);

///  End an array item, assumed to be an object.
///  ```
///  [... --> [...,
///  ```
void json_helper_object_array_end_item(const char *key) ;

///  Encode an int value into the current JSON encoding value `coap_json_value`
void json_helper_set_int(void *object, const char *key, uint64_t value);

///  Encode an unsigned int value into the current JSON encoding value `coap_json_value`
void json_helper_set_uint(void *object, const char *key, uint64_t value);

///  Encode a float value into the current JSON encoding value `coap_json_value`
void json_helper_set_float(void *object, const char *key, float value);

///  Encode a text value into the current JSON encoding value `coap_json_value`
void json_helper_set_text_string(void *object, const char *key, const char *value);

#ifdef __cplusplus
}
#endif

#endif /* __JSON_HELPER_H__ */
