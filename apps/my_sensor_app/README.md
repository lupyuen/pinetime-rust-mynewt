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

The application has been ported to Rust in [`/src`](/src)

The C application code in this folder is no longer in use, except `stub.c` and `vsscanf.c`

[`src`](src): Stub application source files in C for Mynewt build. These C files are compiled into the Mynewt ROM image. These files are stubs, the actual application source files have been ported to Rust in [`/src`](/src)

[`src/stub.c`](src/stub.c): Low-level C functions needed for the Mynewt application

[`src/vsscanf.c`](src/vsscanf.c): Patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes ESP8266 response parsing bugs.  The patched file must be present in that location.

[`pkg.yml`](pkg.yml): Mynewt application info and dependencies

[`syscfg.yml`](syscfg.yml): Mynewt application settings

[`test`](test): Test scripts (incomplete)

[`OLDsrc`](OLDsrc): (NOTUSED) Previous C version of the application

[`OLDsrc/main.c`](OLDsrc/main.c): (NOTUSED) Previous C version of the main program. Contains `main()`

[`OLDsrc/geolocate.c`](OLDsrc/geolocate.c): (NOTUSED) WiFi geolocation functions

[`OLDsrc/geolocate.h`](OLDsrc/geolocate.h): (NOTUSED) WiFi geolocation functions

[`OLDsrc/listen_sensor.c`](OLDsrc/listen_sensor.c): (NOTUSED) Register Listener Function to be called by Mynewt after polling the temperature sensor every 10 seconds

[`OLDsrc/listen_sensor.h`](OLDsrc/listen_sensor.h): (NOTUSED) Register Listener Function to be called by Mynewt after polling the temperature sensor every 10 seconds

[`OLDsrc/send_coap.c`](OLDsrc/send_coap.c): (NOTUSED) Send and receive sensor data via ESP8266 and nRF24L01

[`OLDsrc/send_coap.h`](OLDsrc/send_coap.h): (NOTUSED) Send and receive sensor data via ESP8266 and nRF24L01

## Patch for `vsscanf.c`

Note that we are using a patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
