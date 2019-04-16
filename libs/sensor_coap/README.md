# `sensor_coap`

Mynewt Library for posting sensor data to a CoAP UDP server with JSON or CBOR encoding.  Calls the Mynewt OIC interface to encode and transmit CoAP messages.  

The CoAP transport is implemented for ESP8266 by the `esp8266` driver, located
in the parent folder.  This is a simpler version of `oc_client_api` 
that adds support for JSON encoding.
