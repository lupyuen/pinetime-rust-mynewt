//  Send sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
//  The sensor data will be transmitted over WiFi via the ESP8266 transceiver.
#ifndef __SEND_COAP_H__
#define __SEND_COAP_H__
#if MYNEWT_VAL(SENSOR_COAP)  //  If we are sending sensor data to CoAP server...

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Start the Network Task in the background.  The Network Task prepares the ESP8266 transceiver for
//  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
//  the ESP8266 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
//  Return 0 if successful.
int start_network_task(void);

//  Send the sensor data "tmp" to the specified CoAP server and URI.
//  For CoAP server hosted at thethings.io, the CoAP body should look like:
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
