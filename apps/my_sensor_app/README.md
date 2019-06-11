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

The C application code in this folder is no longer in use, except `stub.c` and `vsscanf.c`. The application has been ported to Rust in [`/src`](/src)

C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\.gitignore
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\pkg.yml
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\README.md
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\src
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\syscfg.yml
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\test
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc\geolocate.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc\geolocate.h
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc\listen_sensor.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc\listen_sensor.h
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc\main.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc\send_coap.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\OLDsrc\send_coap.h
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\src\stub.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\src\vsscanf.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\test\README.md
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\test\src
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\test\src\test_hmac_prng.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\test\src\test_semihosting_console.c
C:\stm32bluepill-mynewt-sensor\apps\my_sensor_app\test\src\test_temp_stm32.c

## Patch for `vsscanf.c`

Note that we are using a patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
