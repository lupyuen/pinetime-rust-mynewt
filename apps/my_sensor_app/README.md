# my_sensor_app: Apache Mynewt Sensor Network Application for STM32 Blue Pill with ESP8266 and nRF24L01 (includes Geolocation)

The program runs in 4 modes:

<b>1️⃣ Standalone Node (Blue Pill with ESP8266):</b> The program polls the 
Blue Pill internal temperature sensor every 10 seconds and transmits the 
sensor data (JSON format) to a CoAP (UDP) Server, such as thethings.io.  

Edit the settings in `targets/bluepill_my_sensor/syscfg.yml` as follows: 

```yml
syscfg.vals:
    # TUTORIAL1: 1
    TUTORIAL2: 1
    # TUTORIAL3: 1
    ...
```

<b>2️⃣ Sensor Node (Blue Pill with nRF24L01):</b> The program polls the 
Blue Pill internal temperature sensor every 10 seconds and transmits the 
sensor data (CBOR format) to the Collector Node.  

Edit the settings 
in `targets/bluepill_my_sensor/syscfg.yml` as follows: 

```yml
syscfg.vals:
    # TUTORIAL1: 1
    # TUTORIAL2: 1
    TUTORIAL3: 1
    ...
```

Set `SENSOR_NODE_HW_ID_1` to the Hardware ID of the Blue Pill.

<b>3️⃣ Collector Node (Blue Pill with nRF24L01 and ESP8266):</b> The program
receives sensor data (CBOR format) from the Sensor Node, and transmits the 
sensor data (JSON format) to a CoAP (UDP) Server, such as thethings.io.

Edit the settings in `targets/bluepill_my_sensor/syscfg.yml` as follows: 

```yml
syscfg.vals:
    # TUTORIAL1: 1
    # TUTORIAL2: 1
    TUTORIAL3: 1
    ...
```

Set `COLLECTOR_NODE_HW_ID` to the Hardware ID of the Blue Pill.

<b>4️⃣ WiFi Geolocation (Blue Pill with ESP8266):</b> The program sends WiFi Access Point MAC Addresses and Signal Strength scanned by ESP8266 to a CoAP (UDP) Server, such as thethings.io.  See https://github.com/lupyuen/thethingsio-wifi-geolocation

thethings.io will call the Google Geolocation API to compute the latitude and longitude based on the WiFi data.  For public display, the computed geolocation is pushed to a web application hosted on Google Cloud App Engine. See https://github.com/lupyuen/gcloud-wifi-geolocation

Edit the settings in `targets/bluepill_my_sensor/syscfg.yml` as follows: 

```yml
syscfg.vals:
    # TUTORIAL1: 1
    TUTORIAL2: 1
    # TUTORIAL3: 1
    WIFI_GEOLOCATION: 1
    ...
```

# Patch for `vsscanf.c`

Note that we are using a patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
