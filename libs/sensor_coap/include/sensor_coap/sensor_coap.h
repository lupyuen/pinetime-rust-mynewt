//  Post sensor data to CoAP server with JSON or CBOR encoding.  We call the Mynewt OIC
//  interface to encode and transmit CoAP messages.  For ESP8266, the OIC interface
//  is implemented by esp8266/transport.h.
#ifndef __SENSOR_COAP_H__
#define __SENSOR_COAP_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

///////////////////////////////////////////////////////////////////////////////
//  Sensor CoAP Functions

#define COAP_PORT_UNSECURED (5683)  //  Port number for CoAP Unsecured

struct oc_server_handle;

//  Init the Sensor CoAP module. Called by sysinit() during startup, defined in pkg.yml.
void init_sensor_coap(void);

//  Return true if the Sensor CoAP is ready for sending sensor data.
bool sensor_coap_ready(void);

//  Create a new sensor post request to send to CoAP server.
bool init_sensor_post(struct oc_server_handle *server, const char *uri);

//  Send the sensor post request to CoAP server.
bool do_sensor_post(void);

///////////////////////////////////////////////////////////////////////////////
//  JSON Encoding Macros

#if MYNEWT_VAL(COAP_JSON_ENCODING)  //  If we are encoding the CoAP payload in JSON...
#include <json/json.h>
#define COAP_CONTENT_FORMAT APPLICATION_JSON   //  Specify JSON content type and accept type in the CoAP header.
#define JSON_VALUE_TYPE_EXT_FLOAT (6)          //  For custom encoding of floats.

extern struct json_encoder coap_json_encoder;  //  Note: We don't support concurrent encoding of JSON messages.
extern struct json_value coap_json_value;      //  Custom JSON value being encoded.

void json_rep_new(struct os_mbuf *m);   //  Prepare to write a new JSON CoAP payload into the mbuf.
void json_rep_reset(void);              //  Close the current JSON CoAP payload.  Erase the JSON encoder.
int json_rep_finalize(void);            //  Finalise the payload and return the payload size.
int json_encode_object_entry_ext(struct json_encoder *encoder, char *key, struct json_value *val);  //  Custom encoder for floats.

//  Start the JSON representation.  Assume top level is object.
//  --> {
void json_rep_start_root_object(void);

//  End the JSON representation.  Assume top level is object.
//  {... --> {...}
void json_rep_end_root_object(void);

#define rep_new(mbuf)           json_rep_new(mbuf)
#define rep_reset(mbuf)         json_rep_reset(mbuf)
#define rep_finalize(mbuf)      json_rep_finalize(mbuf)

//  Start the JSON representation.  Assume top level is object.
//  --> {
#define rep_start_root_object() json_rep_start_root_object()

//  End the JSON represengtation.  Assume top level is object.
//  {... --> {...}
#define rep_end_root_object()   json_rep_end_root_object()

//  Assume we are writing an object now.  Write the key name and start a child array.
//  {a:b --> {a:b, key:[
#define rep_set_array(object, key) { json_encode_array_name(&coap_json_encoder, #key); json_encode_array_start(&coap_json_encoder); }

//  End the child array and resume writing the parent object.
//  {a:b, key:[... --> {a:b, key:[...]
#define rep_close_array(object, key) json_encode_array_finish(&coap_json_encoder)

//  Assume we have called set_array.  Start an array item, assumed to be an object.
//  [... --> [...,
#define rep_object_array_start_item(key) { json_encode_object_start(&coap_json_encoder); }

//  End an array item, assumed to be an object.
//  [... --> [...,
#define rep_object_array_end_item(key) { json_encode_object_finish(&coap_json_encoder); }   

//  Define a float JSON value.
#define JSON_VALUE_EXT_FLOAT(__jv, __v)       \
(__jv)->jv_type = JSON_VALUE_TYPE_EXT_FLOAT;  \
(__jv)->jv_val.fl = (float) __v;

//  Encode a value into JSON: int, unsigned int, float, text, ...
#define rep_set_int(        object, key, value) { JSON_VALUE_INT      (&coap_json_value, value);          json_encode_object_entry    (&coap_json_encoder, #key, &coap_json_value); }
#define rep_set_uint(       object, key, value) { JSON_VALUE_UINT     (&coap_json_value, value);          json_encode_object_entry    (&coap_json_encoder, #key, &coap_json_value); }
#define rep_set_float(      object, key, value) { JSON_VALUE_EXT_FLOAT(&coap_json_value, value);          json_encode_object_entry_ext(&coap_json_encoder, #key, &coap_json_value); }
#define rep_set_text_string(object, key, value) { JSON_VALUE_STRING   (&coap_json_value, (char *) value); json_encode_object_entry    (&coap_json_encoder, #key, &coap_json_value); }
#endif  //  MYNEWT_VAL(COAP_JSON_ENCODING)

///////////////////////////////////////////////////////////////////////////////
//  CBOR Encoding Macros

#if MYNEWT_VAL(COAP_CBOR_ENCODING)  //  If we are encoding the CoAP payload in CBOR...
#include <oic/oc_rep.h>             //  Use the default Mynewt encoding in CBOR.
#define COAP_CONTENT_FORMAT APPLICATION_CBOR  //  Specify CBOR content type and accept type in the CoAP header.

#define rep_new(mbuf)                           oc_rep_new(mbuf)
#define rep_reset()                             oc_rep_reset()
#define rep_finalize()                          oc_rep_finalize()

#define rep_start_root_object()                 oc_rep_start_root_object()
#define rep_end_root_object()                   oc_rep_end_root_object()

#define rep_set_array(object, key)              oc_rep_set_array(object, key)
#define rep_close_array(object, key)            oc_rep_close_array(object, key)

#define rep_object_array_start_item(key)        oc_rep_object_array_start_item(key)
#define rep_object_array_end_item(key)          oc_rep_object_array_end_item(key)

#define rep_set_int(        object, key, value) oc_rep_set_int        (object, key, value)
#define rep_set_uint(       object, key, value) oc_rep_set_uint       (object, key, value)
#define rep_set_float(      object, key, value) oc_rep_set_double     (object, key, value)
#define rep_set_text_string(object, key, value) oc_rep_set_text_string(object, key, value)
#endif  //  MYNEWT_VAL(COAP_CBOR_ENCODING)

///////////////////////////////////////////////////////////////////////////////
//  CP Macros for composing CoAP Payloads in JSON and CBOR
//  The format defined here is used by thethings.io for receiving sensor data

//  Compose the payload root.
#define CP_ROOT(children0) { \
    rep_start_root_object();  \
    { children0; } \
    rep_end_root_object(); \
}

//  Compose an array under "object", named as "key".  Add "children" as array elements.
#define CP_ARRAY(object0, key0, children0) { \
    rep_set_array(object0, key0);  \
    { children0; } \
    rep_close_array(object0, key0); \
}

//  Append an array item under the array named "array".  Add "children" as the item key and value.
//    { <array>: [ ..., { <children> } ], ... }
#define CP_ITEM(array0, children0) { \
    rep_object_array_start_item(array0);  \
    { children0; } \
    rep_object_array_end_item(array0); \
}

//  Append a (key + int value) item to the array named "array":
//    { <array>: [ ..., {"key": <key0>, "value": <value0>} ], ... }
#define CP_ITEM_INT(array0, key0, value0) { \
    CP_ITEM(array0, { \
        rep_set_text_string(array0, key, key0); \
        rep_set_int(        array0, value, value0); \
    }) \
}

//  Append a (key + unsigned int value) item to the array named "array":
//    { <array>: [ ..., {"key": <key0>, "value": <value0>} ], ... }
#define CP_ITEM_UINT(array0, key0, value0) { \
    CP_ITEM(array0, { \
        rep_set_text_string(array0, key, key0); \
        rep_set_uint(       array0, value, value0); \
    }) \
}

//  Append a (key + float value) item to the array named "array":
//    { <array>: [ ..., {"key": <key0>, "value": <value0>} ], ... }
#define CP_ITEM_FLOAT(array0, key0, value0) { \
    CP_ITEM(array0, { \
        rep_set_text_string(array0, key, key0); \
        rep_set_float(      array0, value, value0); \
    }) \
}

//  Append a (key + string value) item to the array named "array":
//    { <array>: [ ..., {"key": <key0>, "value": <value0>} ], ... }
#define CP_ITEM_STR(array0, key0, value0) { \
    CP_ITEM(array0, { \
        rep_set_text_string(array0, key, key0); \
        rep_set_text_string(array0, value, value0); \
    }) \
}

#ifdef __cplusplus
}
#endif

#endif  //  __SENSOR_COAP_H__
