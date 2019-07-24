# `sensor_network`

The Sensor Network Library simplifies the coding of Sensor Networks.  Sensor Nodes may send sensor data to a Collector Node (via nRF24L01), which transmits to a CoAP Server (via BC95-G NB-IoT or ESP8266 WiFi). 

<b>Generic Functions:</b> Instead of referring to specific network interfaces like BC95-G, ESP8266 and nRF24L01,
we may now use call generic functions like `init_server_post()` and `init_collector_post()`.
This also prevents complicated macros like

`#if MYNEWT_VAL(ESP8266) && !MYNEWT_VAL(NRF24L01) ...`

<b>Network Drivers:</b> The Sensor Network Library does not depend on BC95-G, ESP8266 and nRF24L01 drivers.
Instead, the drivers register themselves as Network Interfaces
to the Sensor Network Library.  So the drivers may be easily replaced.

<b>Address Allocation:</b> The Sensor Network Library also allocates Collector Node Address and Sensor Node Address
to the Collector and Sensor Nodes, based on the unique Hardware ID.  This allows the same
compiled firmware to run on multiple nodes, to simplify deployment.

<b>Message Encoding:</b> JSON encoding is automatically selected for CoAP Server messages. CBOR encoding is
automatically selected for Collector Node messages.
