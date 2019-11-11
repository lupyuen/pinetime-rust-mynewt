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
//  Helper Functions for JSON encoding. Because union types are hard to manipulate in Rust.
#include <os/os.h>
#include <console/console.h>
#include <sensor_coap/sensor_coap.h>
#include <mynewt_rust/json_helper.h>

//  Assume we are writing an object now.  Write the key name and start a child array.
//  {a:b --> {a:b, key:[
void json_helper_set_array(void *object, const char *key) {
    assert(key);
    //  console_printf("json_helper_set_array: %s\n", key); ////
    json_rep_set_array_k(object, (char *) key);
}

//  End the child array and resume writing the parent object.
//  {a:b, key:[... --> {a:b, key:[...]
void json_helper_close_array(void *object, const char *key) {
    assert(key);
    json_rep_close_array(object, key);
}

//  Assume we have called set_array.  Start an array item, assumed to be an object.
//  [... --> [...,
void json_helper_object_array_start_item(const char *key) {
    assert(key);
    //  console_printf("json_helper_object_array_start_item: %s\n", key); ////
    json_rep_object_array_start_item(key);
}

//  End an array item, assumed to be an object.
//  [... --> [...,
void json_helper_object_array_end_item(const char *key) {
    assert(key);
    json_rep_object_array_end_item(key);
}

//  Encode a value into JSON: int, unsigned int, float, text, ...
void json_helper_set_int(void *object, const char *key, uint64_t value) {
    assert(key);
    //  console_printf("json_helper_set_int: %s\n", key); ////
    json_rep_set_int_k(object, (char *) key, value);
}

void json_helper_set_uint(void *object, const char *key, uint64_t value) {
    assert(key);
    json_rep_set_uint_k(object, (char *) key, value);
}

void json_helper_set_float(void *object, const char *key, float value) {
    assert(key);
    json_rep_set_float_k(object, (char *) key, value);
}

void json_helper_set_text_string(void *object, const char *key, const char *value) {
    assert(key);
    assert(value);
    //  console_printf("json_helper_set_text_string: %s\n", key); ////
    json_rep_set_text_string_k(object, (char *) key, value);
}
