<!--
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#  KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
-->

# Apache Mynewt Sensor Network Application for STM32 Blue Pill with ESP8266 and nRF24L01 (includes Geolocation)

<b>Requirements:</b> STM32 Blue Pill (or Super Blue Pill) with ESP8266 or nRF24L01 or both

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

# Install Apache Mynewt for Windows and macOS

To install Apache Mynewt for Windows and macOS, refer to the tutorials...

1.  [_Create your IoT gadget with Apache Mynewt and STM32 Blue Pill_](https://medium.com/@ly.lee/create-your-iot-gadget-with-apache-mynewt-and-stm32-blue-pill-d689b3ca725?source=friends_link&sk=d511426d5a2217ebd06789b3eef7df54)

1.  [_Connect STM32 Blue Pill to ESP8266 with Apache Mynewt_](https://medium.com/@ly.lee/connect-stm32-blue-pill-to-esp8266-with-apache-mynewt-7edceb9e3b8d?source=friends_link&sk=df729a82533d817ec6b2d9b626b6f66b)

# Install Apache Mynewt for Ubuntu Linux

1.  Launch Video Studio Code

1.  Click `Terminal → Run Task`

1.  Select `[0] Install Apache Mynewt`

1.  When prompted, click on the `Terminal` pane and enter the `sudo` password. The password only needs to be entered once.

1.  The [setup script](https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/master/scripts/install-linux.sh) will take a few minutes to download and install the build tools.  When it’s done, we should see Done!

1.  Exit and restart Visual Studio Code. This activates the installed extensions.

In case of problems, compare your log with this [setup log](https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/master/logs/install-linux.log).


# Installation, Build, Flash and Debug Logs

Sample logs for Windows and Ubuntu Linux may be found in the [logs folder](logs)

# How This Application Was Created

Based on 

https://mynewt.apache.org/latest/tutorials/sensors/sensor_thingy_lis2dh12_onb.html

https://mynewt.apache.org/latest/tutorials/sensors/sensor_nrf52_bno055.html

```bash
cd /mnt/c
newt new stm32bluepill-mynewt-sensor
cd stm32bluepill-mynewt-sensor
cat project.yml

newt install
newt pkg new -t app apps/my_sensor_app
newt pkg new -t lib libs/semihosting_console

newt target create bluepill_boot
newt target set bluepill_boot bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_boot app=@apache-mynewt-core/apps/boot
newt target set bluepill_boot build_profile=optimized

newt target create bluepill_my_sensor
newt target set bluepill_my_sensor bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_my_sensor app=apps/my_sensor_app
newt target set bluepill_my_sensor build_profile=debug
```

`project.yml` should contain

```yaml
project.name: "my_project"

project.repositories:
    - apache-mynewt-core

repository.apache-mynewt-core:
    type: github
    vers: 1.6.0
    user: apache
    repo: mynewt-core
```
