//  Send sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
#ifndef __SEND_COAP_H__
#define __SEND_COAP_H__
#if MYNEWT_VAL(SENSOR_COAP)  //  If we are sending sensor data to CoAP server...

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Start the network tasks for ESP8266 WiFi transceiver, including WiFi geolocation.
int start_network_tasks(void);

//  Send the sensor data "tmp" to the specified CoAP server and URI.
//  If the CoAP server is thethings.io, the CoAP body should look like:
//  {"values":[
//    {"key":"tmp", "value":28.7},
//    {"key":"...", "value":... },
//    ... ]}
void send_sensor_data(struct oc_server_handle *server, const char *uri, float tmp);

#ifdef __cplusplus
}
#endif

#endif  //  MYNEWT_VAL(SENSOR_COAP)
#endif  //  __SEND_COAP_H__
