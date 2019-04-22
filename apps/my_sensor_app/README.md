# my_sensor_app

This application reads sensor data from a temperature sensor every 10 seconds and sends the sensor data to a CoAP server.
The temperature sensors supported are BME280 and Blue Pill's internal temperature sensor (`temp_stm32`).

Note that we are using a patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
