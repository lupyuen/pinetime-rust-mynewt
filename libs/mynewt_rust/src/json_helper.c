//  Helper Functions for JSON encoding. Because union types are hard to manipulate in Rust.
#include <os/os.h>
#include <console/console.h>
#include <sensor_coap/sensor_coap.h>

//  Assume we are writing an object now.  Write the key name and start a child array.
//  {a:b --> {a:b, key:[
void json_helper_set_array(void *object, const char *key) {
    assert(key);
    json_rep_set_array(object,key);
}

//  End the child array and resume writing the parent object.
//  {a:b, key:[... --> {a:b, key:[...]
void json_helper_close_array(void *object, const char *key) {
    assert(key);
    json_rep_close_array(object,key);
}

//  Assume we have called set_array.  Start an array item, assumed to be an object.
//  [... --> [...,
void json_helper_object_array_start_item(const char *key) {
    assert(key);
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
    json_rep_set_int(object,key,value);
}

void json_helper_set_uint(void *object, const char *key, uint64_t value) {
    assert(key);
    json_rep_set_uint(object,key,value);
}

void json_helper_set_float(void *object, const char *key, float value) {
    assert(key);
    json_rep_set_float(object,key,value);
}

void json_helper_set_text_string(void *object, const char *key, const char *value) {
    assert(key);
    assert(value);
    json_rep_set_text_string(object,key,value);
}
