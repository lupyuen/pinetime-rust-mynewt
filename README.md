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

# Bluetooth Mesh Sensor Application for nRF52 with Apache Mynewt and Embedded Rust

This `mesh` branch contains the source code for a Bluetooth Mesh Sensor Application for nRF52 with Apache Mynewt and Embedded Rust that has been tested on the [EBYTE E73-TBB Development Board](http://www.ebyte.com/product-view-news.aspx?id=644). Refer to the tutorial...

[_???_](???)

# TODO

- Button1, Button2, and LED1 to application key 1. It then configures Button1 and Button2
  to publish to group 0xC000 and LED1 to subscribe to that group.
- Button3, Button4, and LED3 to application key 1. It then configures Button3 and Button4
  to publish to group 0xC000 and LED3 to subscribe to that group.

For Raspberry Pi:
https://learn.adafruit.com/install-bluez-on-the-raspberry-pi?view=all

```
wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.51.tar.xz
tar -xvf bluez-5.51.tar.xz
cd bluez-5.51/
sudo apt-get update
sudo apt-get install -y libusb-dev libdbus-1-dev libglib2.0-dev libudev-dev libical-dev libreadline-dev libjson-c-dev
nano src/main.conf
<<
AutoEnable=false
>>
./configure --enable-mesh --enable-debug
make
sudo make install
sudo systemctl disable bluetooth
sudo systemctl disable bluetooth-mesh

sudo systemctl daemon-reload
sudo systemctl restart bluetooth
sudo systemctl restart bluetooth-mesh
systemctl status bluetooth
systemctl status bluetooth-mesh

meshctl
discover-unprovisioned on
provision <discovered UUID>
menu config
target 0100
appkey-add 1
bind 0 1 1000
bind 0 1 1001
bind 0 1 1002
bind 0 1 1003
sub-add 0100 c000 1000
sub-add 0100 c000 1002
pub-set 0100 c000 1 0 5 1001
pub-set 0100 c000 1 0 5 1003
```

#### Bluetooth: Mesh Generic OnOff, Generic Level, Lighting & Vendor Models

##### Overview
********

This is a application demonstrating a Bluetooth mesh node in
which Root element has following models

- Generic OnOff Server
- Generic OnOff Client
- Generic Level Server
- Generic Level Client
- Generic Default Transition Time Server
- Generic Default Transition Time Client
- Generic Power OnOff Server
- Generic Power OnOff Setup Server
- Generic Power OnOff Client
- Light Lightness Server
- Light Lightness Setup Server
- Light Lightness Client
- Light CTL Server
- Light CTL Setup Server
- Light CTL Client
- Vendor Model

And Secondary element has following models

- Generic Level Server
- Generic Level Client
- Light CTL Temperature Server

Prior to provisioning, an unprovisioned beacon is broadcast that contains
a unique UUID. Each button controls the state of its
corresponding LED and does not initiate any mesh activity

##### Associations of Models with hardware
************************************
For the nRF52840-PDK board, these are the model associations:

* LED1 is associated with generic OnOff Server's state which is part of Root element
* LED2 is associated with Vendor Model which is part of Root element
* LED3 is associated with generic Level (ROOT) / Light Lightness Actual value
* LED4 is associated with generic Level (Secondary) / Light CTL Temperature value
* Button1 and Button2 are associated with gen. OnOff Client or Vendor Model which is part of Root element
* Button3 and Button4 are associated with gen. Level Client / Light Lightness Client / Light CTL Client which is part of Root element

States of Servers are bounded as per Bluetooth SIG Mesh Model Specification v1.0

After provisioning, the button clients must
be configured to publish and the LED servers to subscribe.
If a server is provided with a publish address, it will
also publish its relevant status.

##### Requirements
************
This sample has been tested on the Nordic nRF52840-PDK board, but would
likely also run on the nrf52_pca10040 board.


##### Running
************

Provisioning is done using the BlueZ meshctl utility. In this example, we'll use meshctl commands to bind:

- Button1, Button2, and LED1 to application key 1. It then configures Button1 and Button2
  to publish to group 0xC000 and LED1 to subscribe to that group.
- Button3, Button4, and LED3 to application key 1. It then configures Button3 and Button4
  to publish to group 0xC000 and LED3 to subscribe to that group.

```
discover-unprovisioned on
provision <discovered UUID>
menu config
target 0100
appkey-add 1
bind 0 1 1000
bind 0 1 1001
bind 0 1 1002
bind 0 1 1003
sub-add 0100 c000 1000
sub-add 0100 c000 1002
pub-set 0100 c000 1 0 5 1001
pub-set 0100 c000 1 0 5 1003
```

The meshctl utility maintains a persistent JSON database containing
the mesh configuration. As additional nodes (boards) are provisioned, it
assigns sequential unicast addresses based on the number of elements
supported by the node. This example supports 2 elements per node.

The meshctl target for configuration must be the root element's unicast
address as it is the only one that has a configuration server model. If
meshctl is gracefully exited, it can be restarted and reconnected to
network 0x0.

The meshctl utility also supports a onoff model client that can be used to
change the state of any LED that is bound to application key 0x1.
This is done by setting the target to the unicast address of the element
that has that LED's model and issuing the onoff command.
Group addresses are not supported.

# Fixes for Mynewt type conversion build warnings

These fixes should be applied manually when upgrading Mynewt or installing Mynewt from scratch.

1️⃣ `repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h` line 122 <br>
```C
    return mu->mu_level;
```
Change to
```C
    return (os_error_t) mu->mu_level;
```

2️⃣ `repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h` line 847 <br>
```C
    return (sensor->s_types & sensor->s_mask & type);
```
Change to
```C
    return (sensor_type_t) (sensor->s_types & sensor->s_mask & type);
```

3️⃣ `repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h` line 201 <br>
```C
    {   return encoder->writer->bytes_written; }
```
Change to
```C
    {   return (CborError) encoder->writer->bytes_written; }
```

# Installation, Build, Flash and Debug Logs

Sample logs for Windows may be found in the [logs folder](logs)

# Contents

This repository contains...

[`rust`](rust): Rust Application

[`Cargo.toml`](Cargo.toml): Rust Build Settings

[`.cargo`](.cargo): Rust Target Settings

[`my_sensor_app`](apps/my_sensor_app): Mynewt Application Stub

[`boot_stub`](apps/boot_stub): Mynewt Bootloader Stub

[`adc_stm32f1`](libs/adc_stm32f1): Mynewt Driver for ADC on STM32 F103 (Blue Pill). Used by `temp_stm32` internal temperature sensor.

[`adc_stm32l4`](libs/adc_stm32l4): Mynewt Driver for ADC on STM32 L476. Used by `temp_stm32` internal temperature sensor.

[`bc95g`](libs/bc95g): Mynewt Driver for Quectel BC95 NB-IoT module

[`buffered_serial`](libs/buffered_serial): Buffered Serial Library used by `bc95g` NB-IoT driver and `gps_l70r` GPS driver

[`custom_sensor`](libs/custom_sensor): Custom Sensor Definitions for Raw Temperature and Geolocation

[`esp8266`](libs/esp8266): Mynewt Driver for ESP8266 WiFi module

[`gps_l70r`](libs/gps_l70r): Mynewt Driver for Quectel L70-R GPS module

[`hmac_prng`](libs/hmac_prng): HMAC pseudorandom number generator with entropy based on internal temperature sensor

[`low_power`](libs/low_power): Low Power functions for STM32 F103 (Blue Pill)

[`mynewt_rust`](libs/mynewt_rust): Helper functions for hosting Rust on Mynewt

[`nrf24l01`](libs/nrf24l01): Mynewt Driver for nRF24L01

[`remote_sensor`](libs/remote_sensor): Mynewt Driver for Remote Sensor

[`rust_app`](libs/rust_app): Stub library that will be replaced by the compiled Rust application and Rust crates

[`rust_libcore`](libs/rust_libcore): Stub library that will be replaced by the Rust Core Library

[`semihosting_console`](libs/semihosting_console): Mynewt Console for Arm Semihosting

[`sensor_coap`](libs/sensor_coap): Sensor CoAP Library

[`sensor_network`](libs/sensor_network): Sensor Network Library

[`temp_stm32`](libs/temp_stm32): Mynewt Driver for Internal Temperature Sensor on STM32

[`temp_stub`](libs/temp_stub): Mynewt Driver for Stub Temperature Sensor that returns a fixed value

[`tiny_gps_plus`](libs/tiny_gps_plus): TinyGPS++ Library ported from Arduino. Used by `gps_l70r` GPS driver.

[`scripts`](scripts): Install, build and deploy scripts

[`.vscode`](.vscode): Visual Studio Code macros for install, build and deploy

[View Rust Documentation](https://lupyuen.github.io/stm32bluepill-mynewt-sensor/rust/app/)

# How This Application Was Created

The Windows version of the `newt` command-line tool in `newt/newt.exe` was created from 

[`github.com/lupyuen/mynewt-newt`](https://github.com/lupyuen/mynewt-newt)

The Mynewt application was originally based on: 

[`mynewt.apache.org/latest/tutorials/sensors/sensor_thingy_lis2dh12_onb.html`](https://mynewt.apache.org/latest/tutorials/sensors/sensor_thingy_lis2dh12_onb.html)

[`mynewt.apache.org/latest/tutorials/sensors/sensor_nrf52_bno055.html`](https://mynewt.apache.org/latest/tutorials/sensors/sensor_nrf52_bno055.html)

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
    vers: 1.7.0
    user: apache
    repo: mynewt-core
```
