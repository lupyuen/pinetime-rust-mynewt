//  Post sensor data to CoAP server with JSON or CBOR encoding.  We call the Mynewt OIC
//  interface to encode and transmit CoAP messages.  For ESP8266, the OIC interface
//  is implemented by esp8266/transport.h.
#ifndef __SENSOR_COAP_H__
#define __SENSOR_COAP_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  sensor_value represents a decoded sensor data value. Since temperature may be integer (raw)
//  or float (computed), we use the struct to return both integer and float values.
//  val_type indicates whether it's an integer or float.
struct sensor_value {
    const char *key;        //  "t" for raw temp, "tmp" for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
    int         val_type;   //  The type of the sensor value. SENSOR_VALUE_TYPE_INT32 for int, SENSOR_VALUE_TYPE_FLOAT for float.
    uint16_t    int_val;    //  For raw temp, contains the raw temp integer value
    float       float_val;  //  For computed temp, contains the computed temp float value
};

///////////////////////////////////////////////////////////////////////////////
//  Sensor CoAP Functions

#define COAP_PORT_UNSECURED (5683)  //  Port number for CoAP Unsecured

struct oc_server_handle;

//  Init the Sensor CoAP module. Called by sysinit() during startup, defined in pkg.yml.
void init_sensor_coap(void);

//  Return true if the Sensor CoAP is ready for sending sensor data.
bool sensor_coap_ready(void);

//  Create a new sensor post request to send to CoAP server.  coap_content_format is 
//  APPLICATION_JSON or APPLICATION_CBOR. If coap_content_format is 0, use the default format.
bool init_sensor_post(struct oc_server_handle *server, const char *uri, int coap_content_format);

//  Send the sensor post request to CoAP server.
bool do_sensor_post(void);

///////////////////////////////////////////////////////////////////////////////
//  JSON Common Encoding Macros

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

//  Assume we are writing an object now.  Write the key name and start a child array.
//  {a:b --> {a:b, key:[
#define json_rep_set_array(object, key) { json_encode_array_name(&coap_json_encoder, #key); json_encode_array_start(&coap_json_encoder); }

//  End the child array and resume writing the parent object.
//  {a:b, key:[... --> {a:b, key:[...]
#define json_rep_close_array(object, key) json_encode_array_finish(&coap_json_encoder)

//  Assume we have called set_array.  Start an array item, assumed to be an object.
//  [... --> [...,
#define json_rep_object_array_start_item(key) { json_encode_object_start(&coap_json_encoder); }

//  End an array item, assumed to be an object.
//  [... --> [...,
#define json_rep_object_array_end_item(key) { json_encode_object_finish(&coap_json_encoder); }   

//  Define a float JSON value.
#define JSON_VALUE_EXT_FLOAT(__jv, __v)       \
(__jv)->jv_type = JSON_VALUE_TYPE_EXT_FLOAT;  \
(__jv)->jv_val.fl = (float) __v;

//  Encode a value into JSON: int, unsigned int, float, text, ...
#define json_rep_set_int(        object, key, value) { JSON_VALUE_INT      (&coap_json_value, value);          json_encode_object_entry    (&coap_json_encoder, #key, &coap_json_value); }
#define json_rep_set_uint(       object, key, value) { JSON_VALUE_UINT     (&coap_json_value, value);          json_encode_object_entry    (&coap_json_encoder, #key, &coap_json_value); }
#define json_rep_set_float(      object, key, value) { JSON_VALUE_EXT_FLOAT(&coap_json_value, value);          json_encode_object_entry_ext(&coap_json_encoder, #key, &coap_json_value); }
#define json_rep_set_text_string(object, key, value) { JSON_VALUE_STRING   (&coap_json_value, (char *) value); json_encode_object_entry    (&coap_json_encoder, #key, &coap_json_value); }

#endif  //  MYNEWT_VAL(COAP_JSON_ENCODING)

///////////////////////////////////////////////////////////////////////////////
//  JSON-Only Encoding Macros

#if MYNEWT_VAL(COAP_JSON_ENCODING) && !MYNEWT_VAL(COAP_CBOR_ENCODING)  //  If we are encoding the CoAP payload in JSON only...

//  Alias the generic rep* macros as json_rep*
#define rep_start_root_object() json_rep_start_root_object()
#define rep_end_root_object()   json_rep_end_root_object()

#define rep_set_array(  object, key) json_rep_set_array(  object, key)
#define rep_close_array(object, key) json_rep_close_array(object, key)

#define rep_object_array_start_item(key) json_rep_object_array_start_item(key)
#define rep_object_array_end_item(key)   json_rep_object_array_end_item(key)

#define rep_set_int(        object, key, value) json_rep_set_int(        object, key, value)
#define rep_set_uint(       object, key, value) json_rep_set_uint(       object, key, value)
#define rep_set_float(      object, key, value) json_rep_set_float(      object, key, value)
#define rep_set_text_string(object, key, value) json_rep_set_text_string(object, key, value)

#endif  //  MYNEWT_VAL(COAP_JSON_ENCODING) && !MYNEWT_VAL(COAP_CBOR_ENCODING)

///////////////////////////////////////////////////////////////////////////////
//  CBOR-Only Encoding Macros

#if MYNEWT_VAL(COAP_CBOR_ENCODING) && !MYNEWT_VAL(COAP_JSON_ENCODING)  //  If we are encoding the CoAP payload in CBOR only...
#include <oic/oc_rep.h>             //  Use the default Mynewt encoding in CBOR.

#define COAP_CONTENT_FORMAT APPLICATION_CBOR  //  Specify CBOR content type and accept type in the CoAP header.

#define rep_start_root_object()                 oc_rep_start_root_object()
#define rep_end_root_object()                   oc_rep_end_root_object()

#define rep_set_array(object, key)              oc_rep_set_array(object, key)
#define rep_close_array(object, key)            oc_rep_close_array(object, key)

#define rep_object_array_start_item(key)        oc_rep_object_array_start_item(key)
#define rep_object_array_end_item(key)          oc_rep_object_array_end_item(key)

#define rep_set_int(        object, key, value) oc_rep_set_int(        object, key, value)
#define rep_set_uint(       object, key, value) oc_rep_set_uint(       object, key, value)
#define rep_set_float(      object, key, value) oc_rep_set_double(     object, key, value)
#define rep_set_text_string(object, key, value) oc_rep_set_text_string(object, key, value)

#endif  //  MYNEWT_VAL(COAP_CBOR_ENCODING) && !MYNEWT_VAL(COAP_JSON_ENCODING)

///////////////////////////////////////////////////////////////////////////////
//  JSON and CBOR Coexistence Encoding Macros

#if MYNEWT_VAL(COAP_CBOR_ENCODING) && MYNEWT_VAL(COAP_JSON_ENCODING)  //  If we are encoding the CoAP payload in CBOR and JSON...

//  JSON or CBOR encoding will be selected by the Sensor Network, which depends on whether we're sending
//  to CoAP Server (JSON) or Collector Node (CBOR)

#include <oic/oc_rep.h>        //  Import Mynewt's CBOR encoding functions.
#include <oic/messaging/coap/constants.h>  //  For APPLICATION_JSON

#undef COAP_CONTENT_FORMAT     //  Must manually specify CoAP Payload encoding format
extern int oc_content_format;  //  CoAP Payload encoding format: APPLICATION_JSON or APPLICATION_CBOR
#define JSON_ENC (oc_content_format == APPLICATION_JSON)  //  True if encoding format is JSON

//  From repos\apache-mynewt-core\net\oic\include\oic\oc_rep.h
//  Changed "#key" to "key" so that the key won't be stringified.

#define oc_rep_set_int_k(object, key, value)                                     \
  do {                                                                         \
    g_err |= cbor_encode_text_string(&object##_map, key, strlen(key));       \
    g_err |= cbor_encode_int(&object##_map, value);                            \
  } while (0)

#define oc_rep_set_uint_k(object, key, value)                                    \
  do {                                                                         \
    g_err |= cbor_encode_text_string(&object##_map, key, strlen(key));       \
    g_err |= cbor_encode_uint(&object##_map, value);                           \
  } while (0)

#define oc_rep_set_float_k(object, key, value)                                    \
  do {                                                                         \
    g_err |= cbor_encode_text_string(&object##_map, key, strlen(key));       \
    g_err |= cbor_encode_float(&object##_map, value);                           \
  } while (0)

#define oc_rep_set_text_string_k(object, key, value)                             \
  do {                                                                         \
    g_err |= cbor_encode_text_string(&object##_map, key, strlen(key));       \
    g_err |= cbor_encode_text_string(&object##_map, value, strlen(value));     \
  } while (0)

#define rep_start_root_object()                 oc_rep_start_root_object(); \
                                                  if (JSON_ENC) { json_rep_start_root_object(); }

#define rep_end_root_object()                     if (JSON_ENC) { json_rep_end_root_object(); } \
                                                oc_rep_end_root_object();

#define rep_set_array(object, key)              oc_rep_set_array(object, key); \
                                                  if (JSON_ENC) { json_rep_set_array(object, key); }

#define rep_close_array(object, key)              if (JSON_ENC) { json_rep_close_array(object, key); } \
                                                oc_rep_close_array(object, key);

#define rep_object_array_start_item(key)        oc_rep_object_array_start_item(key); \
                                                  if (JSON_ENC) { json_rep_object_array_start_item(key); }

#define rep_object_array_end_item(key)            if (JSON_ENC) { json_rep_object_array_end_item(key); } \
                                                oc_rep_object_array_end_item(key);

//  oc_rep_set_int(object, key, value)
//  -> cbor_encode_text_string(&object##_map, #key, strlen(#key));
//     cbor_encode_int(&object##_map, value);      
//  oc_rep_set_key(parent, key)
//  -> cbor_encode_text_string(&parent, key, strlen(key))

#define rep_set_int(object, key, value)    { if (JSON_ENC) { json_rep_set_int(object, key, value); } else { oc_rep_set_int(object, key, value); } }
#define rep_set_uint(object, key, value)   { if (JSON_ENC) { json_rep_set_uint(object, key, value); } else { oc_rep_set_uint(object, key, value); } }
#define rep_set_float(object, key, value)  { if (JSON_ENC) { json_rep_set_float(object, key, value); } else { oc_rep_set_double(object, key, value); } }
#define rep_set_text_string(object, key, value)  { if (JSON_ENC) { json_rep_set_text_string(object, key, value); } else { oc_rep_set_text_string(object, key, value); } }

//  Same as above, except that the key is not stringified.
#define rep_set_int_k(object, key, value)    { if (JSON_ENC) { json_rep_set_int(object, key, value); } else { oc_rep_set_int_k(object, key, value); } }
#define rep_set_uint_k(object, key, value)   { if (JSON_ENC) { json_rep_set_uint(object, key, value); } else { oc_rep_set_uint_k(object, key, value); } }
#define rep_set_float_k(object, key, value)  { if (JSON_ENC) { json_rep_set_float(object, key, value); } else { oc_rep_set_double_k(object, key, value); } }
#define rep_set_text_string_k(object, key, value)  { if (JSON_ENC) { json_rep_set_text_string(object, key, value); } else { oc_rep_set_text_string_k(object, key, value); } }

#endif  //  MYNEWT_VAL(COAP_CBOR_ENCODING) && MYNEWT_VAL(COAP_JSON_ENCODING)

///////////////////////////////////////////////////////////////////////////////
//  CP Macros for composing CoAP Payloads in JSON and CBOR
//  The format defined here is used by thethings.io for receiving sensor data

//  Compose the payload root.
#define CP_ROOT(children0) { \
    rep_start_root_object();  \
    { children0; } \
    rep_end_root_object(); \
}

//  Given an object parent and an integer Sensor Value val, set the val's key/value in the object.
#define CP_SET_INT_VAL(parent0, val0) { \
    assert(val0->val_type == SENSOR_VALUE_TYPE_INT32); \
    rep_set_int_k(parent0, val0->key, val0->int_val); \
}

//  Given an object parent and a float Sensor Value val, set the val's key/value in the object.
#define CP_SET_FLOAT_VAL(parent0, val0) { \
    assert(val0->val_type == SENSOR_VALUE_TYPE_FLOAT); \
    rep_set_int_k(parent0, val0->key, val0->float_val); \
}

//  Set the key/value (integer) in the parent object.
#define CP_SET_INT(parent0, key0, value0) { \
    rep_set_int(parent0, key0, value0); \
}

//  Set the key/value (float) in the parent object.
#define CP_SET_FLOAT(parent0, key0, value0) { \
    rep_set_float(parent0, key0, value0); \
}

//  Create a new Item object in the parent array and set the Sensor Value's key/value.
//  Note: This macro is NOT recommended because it bloats the ROM size with float functions.  Call CP_ITEM_INT_VAL and CP_ITEM_FLOAT_VAL instead.
#define CP_ITEM_VAL(parent0, val0) { \
    switch (val0->val_type) { \
        case SENSOR_VALUE_TYPE_INT32: { CP_ITEM_INT_VAL(parent0, val0); break; } \
        case SENSOR_VALUE_TYPE_FLOAT: { CP_ITEM_FLOAT_VAL(parent0, val0); break; } \
        default: { assert(0); } /* Unknown type */ \
    } \
}

//  Create a new Item object in the parent array and set the Sensor Value's key/value (integer).
#define CP_ITEM_INT_VAL(parent0, val0) { \
    assert(val0->val_type == SENSOR_VALUE_TYPE_INT32); \
    CP_ITEM_INT(parent0, val0->key, val0->int_val); \
}

//  Create a new Item object in the parent array and set the Sensor Value's key/value (float).
#define CP_ITEM_FLOAT_VAL(parent0, val0) { \
    assert(val0->val_type == SENSOR_VALUE_TYPE_FLOAT); \
    CP_ITEM_FLOAT(parent0, val0->key, val0->float_val); \
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
