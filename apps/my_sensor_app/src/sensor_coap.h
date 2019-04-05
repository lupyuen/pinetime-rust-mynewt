//  Post sensor data to CoAP server with JSON or CBOR encoding.
#ifndef __SENSOR_COAP_H__
#define __SENSOR_COAP_H__
#include <oic/oc_api.h>

#ifdef __cplusplus
extern "C" {
#endif

//  Create a new sensor post request to send to CoAP server.
bool init_sensor_post(oc_server_handle_t *server, const char *uri);

//  Send the sensor post request to CoAP server.
bool do_sensor_post(void);

#ifdef COAP_JSON_ENCODING  //  If we are encoding the CoAP payload in JSON...

    #include <json/json.h>

    extern struct json_encoder coap_json_encoder;  //  Note: We don't support concurrent encoding of JSON messages.
    extern struct json_value coap_json_value;

    //  Start the JSON representation.  Assume top level is object.
    //  --> {
    void json_rep_start_root_object(void);

    //  End the JSON represengtation.  Assume top level is object.
    //  {... --> {...}
    void json_rep_end_root_object(void);

    //  Start the JSON representation.  Assume top level is object.
    //  --> {
    #define rep_start_root_object() json_rep_start_root_object()

    //  End the JSON represengtation.  Assume top level is object.
    //  {... --> {...}
    #define rep_end_root_object() json_rep_end_root_object()

    //  Assume we are writing an object now.  Write the key name and start a child array.
    //  {a:b --> {a:b, key:[
    #define rep_set_array(object, key) { json_encode_array_name(&coap_json_encoder, #key); json_encode_array_start(&coap_json_encoder); }
    //  CBOR: cbor_encode_text_string(&object##_map, #key, strlen(#key));  

    //  End the child array and resume writing the parent object.
    //  {a:b, key:[... --> {a:b, key:[...]
    #define rep_close_array(object, key) json_encode_array_finish(&coap_json_encoder)
    //  CBOR: oc_rep_end_array(object##_map, key)

    //  Assume we have called set_array.  Start an array item, assumed to be an object.
    //  [... --> [...,
    #define rep_object_array_start_item(key) { json_encode_object_start(&coap_json_encoder); }
    //  CBOR: oc_rep_start_object(key##_array, key)

    //  End an array item, assumed to be an object.
    //  [... --> [...,
    #define rep_object_array_end_item(key) { json_encode_object_finish(&coap_json_encoder); }   
    //  CBOR: oc_rep_end_object(key##_array, key)

    #define rep_set_text_string(object, key, value) { JSON_VALUE_STRING(&coap_json_value, value); json_encode_object_entry(&coap_json_encoder, #key, &coap_json_value); }

    #define rep_set_double(object, key, value) {  JSON_VALUE_INT(&coap_json_value, value); json_encode_object_entry(&coap_json_encoder, #key, &coap_json_value); }

#endif  //  COAP_JSON_ENCODING

#ifdef COAP_CBOR_ENCODING  //  If we are encoding the CoAP payload in CBOR...

    //  Use the default Mynewt encoding in CBOR.
    #define rep_start_root_object()                 oc_rep_start_root_object()
    #define rep_end_root_object()                   oc_rep_end_root_object()

    #define rep_set_array(object, key)              oc_rep_set_array(object, key)
    #define rep_close_array(object, key)            oc_rep_close_array(object, key)

    #define rep_object_array_start_item(key)        oc_rep_object_array_start_item(key)
    #define rep_object_array_end_item(key)          oc_rep_object_array_end_item(key)

    #define rep_set_text_string(object, key, value) oc_rep_set_text_string(object, key, value)
    #define rep_set_double     (object, key, value) oc_rep_set_double     (object, key, value)

#endif  //  COAP_CBOR_ENCODING

#ifdef __cplusplus
}
#endif

#endif  //  __SENSOR_COAP_H__
