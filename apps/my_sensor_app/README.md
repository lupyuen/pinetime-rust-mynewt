# my_sensor_app: Apache Mynewt Sensor Network Application for STM32 Blue Pill with ESP8266 and nRF24L01 (includes Geolocation)

This C program runs in 4 modes, as described in [_Build Your IoT Sensor Network — STM32 Blue Pill + nRF24L01 + ESP8266 + Apache Mynewt + thethings.io_](https://medium.com/@ly.lee/build-your-iot-sensor-network-stm32-blue-pill-nrf24l01-esp8266-apache-mynewt-thethings-io-ca7486523f5d)

<b>1️⃣ Standalone Node (Blue Pill with ESP8266):</b> The program polls the 
Blue Pill internal temperature sensor every 10 seconds and transmits the 
sensor data (JSON format) to a CoAP (UDP) Server, such as thethings.io.  

<b>2️⃣ Sensor Node (Blue Pill with nRF24L01):</b> The program polls the 
Blue Pill internal temperature sensor every 10 seconds and transmits the 
sensor data (CBOR format) to the Collector Node.  

<b>3️⃣ Collector Node (Blue Pill with nRF24L01 and ESP8266):</b> The program
receives sensor data (CBOR format) from the Sensor Node, and transmits the 
sensor data (JSON format) to a CoAP (UDP) Server, such as thethings.io.

<b>4️⃣ WiFi Geolocation (Blue Pill with ESP8266):</b> The program sends WiFi Access Point MAC Addresses and Signal Strength scanned by ESP8266 to a CoAP (UDP) Server, such as thethings.io.  See https://github.com/lupyuen/thethingsio-wifi-geolocation

For Rust version: The Rust version of the application has been ported to Rust in [`/src`](/src).  The C application code in this folder is not used in the Rust version, except `support.c` and `vsscanf.c`

[`pkg.yml`](pkg.yml): Mynewt application info and dependencies

[`syscfg.yml`](syscfg.yml): Mynewt application settings

[`src`](src): Application source files in C for Mynewt build. These C files are compiled into the Mynewt ROM image. Fo Rust version: The actual application source files have been ported to Rust in [`/src`](/src)

[`src/main.c`](src/main.c): Previous C version of the main program. Contains `main()`

[`src/geolocate.c`](src/geolocate.c): WiFi geolocation functions

[`src/geolocate.h`](src/geolocate.h): WiFi geolocation functions

[`src/sensor.c`](src/sensor.c): Register Listener Function to be called by Mynewt after polling the temperature sensor every 10 seconds

[`src/sensor.h`](src/sensor.h): Register Listener Function to be called by Mynewt after polling the temperature sensor every 10 seconds

[`src/network.c`](src/network.c): Send sensor data to IoT network

[`src/network.h`](src/network.h): Send sensor data to IoT network

[`src/support.c`](src/stub.c): Low-level C support functions needed for the Mynewt application

[`src/vsscanf.c`](src/vsscanf.c): Patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes BC95-G and ESP8266 response parsing bugs.  The patched file must be present in that location.

[`test`](test): Test scripts (incomplete)

[`OLDsrc`](OLDsrc): (NOTUSED) Previous C version of the application

## Patch for `vsscanf.c`

Note that we are using a patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes BC95-G and ESP8266 response parsing bugs.  The patched file must be present in that location.
