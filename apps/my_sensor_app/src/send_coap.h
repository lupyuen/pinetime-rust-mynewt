//  Send sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
//  The sensor data will be transmitted over WiFi via the ESP8266 transceiver.
#ifndef __SEND_COAP_H__
#define __SEND_COAP_H__
#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server...

//  Define NETWORK_DEVICE, the name of the network transceiver device to be used for sending CoAP messages,

#if MYNEWT_VAL(ESP8266)       //  If ESP8266 WiFi is enabled...
#include <esp8266/esp8266.h>  //  For ESP8266_DEVICE
#define NETWORK_DEVICE ESP8266_DEVICE  //  Will be set to "esp8266_0"
#endif  //  MYNEWT_VAL(ESP8266)

#if MYNEWT_VAL(NRF24L01)       //  If nRF24L01 Wireless Network is enabled...
#include <nrf24l01.h>          //  For NRF24L01_DEVICE
#define NETWORK_DEVICE NRF24L01_DEVICE  //  Will be set to "nrf24l01_0"
#endif  //  MYNEWT_VAL(NRF24L01)

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Start the Network Task in the background.  The Network Task prepares the ESP8266 transceiver for
//  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
//  the ESP8266 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
//  Return 0 if successful.
int start_network_task(void);

//  Compose a CoAP message with sensor data "tmp" and send to the specified CoAP server
//  and URI.  The message will be enqueued for transmission by the CoAP / OIC 
//  Background Task so this function will return without waiting for the message 
//  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
int send_sensor_data(float tmp);

#ifdef __cplusplus
}
#endif

#endif  //  MYNEWT_VAL(SENSOR_COAP)
#endif  //  __SEND_COAP_H__
