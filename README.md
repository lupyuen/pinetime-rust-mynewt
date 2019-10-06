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

Developer Study Guide: Deploying
BlueZ v5.50 on Raspberry Pi3
Part 1 - Deployment
https://3pl46c46ctx02p7rzdsvsg21-wpengine.netdna-ssl.com/wp-content/uploads/2019/03/T1804_How-to-set-up-BlueZ_LFC_FINAL-1.pdf?utm_campaign=developer&utm_source=internal&utm_medium=blog&utm_content=Deploying-BlueZ-v5.50-on-Raspberry-Pi3-Update

Kernel Building
https://www.raspberrypi.org/documentation/linux/kernel/building.md

```bash
uname -a
<<
Linux raspberrypi 4.19.66-v7l+ #1253 SMP Thu Aug 15 12:02:08 BST 2019 armv7l GNU/Linux
>>
git clone --depth=1 --branch rpi-4.19.y https://github.com/raspberrypi/linux
```

Configuring the kernel
https://www.raspberrypi.org/documentation/linux/kernel/configuring.md

Raspberry Pi 1, Pi Zero, Pi Zero W, and Compute Module default build configuration

```bash
cd linux
KERNEL=kernel
make bcmrpi_defconfig
```

Raspberry Pi 2, Pi 3, Pi 3+, and Compute Module 3 default build configuration
```bash
cd linux
KERNEL=kernel7
make bcm2709_defconfig
```

Raspberry Pi 4
```
cd linux
KERNEL=kernel7l
make bcm2711_defconfig
```

```bash
make menuconfig
```

Please include the three modules below: (Press S to select)
Select Cryptographic API ---> CMAC support
Select Cryptographic API ---> User-space interface for hash algorithms
Select Cryptographic API ---> User-space interface for symmetric key cipher algorithms 

```bash
make -j4 zImage modules dtbs
sudo make modules_install
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
sudo cp arch/arm/boot/zImage /boot/$KERNEL.img
```

How to Deploy BlueZ v5.50 on Raspberry Pi 3
and Use It
Part 2 — Provisioning 
https://3pl46c46ctx02p7rzdsvsg21-wpengine.netdna-ssl.com/wp-content/uploads/2019/03/Tutorial-How-to-set-up-BlueZ_Part2-3.pdf?utm_campaign=developer&utm_source=internal&utm_medium=blog&utm_content=Deploying-BlueZ-v5.50-on-Raspberry-Pi3-Update

```bash
sudo systemctl status bluetooth-mesh

cd ~
mkdir -p ~/.config/meshctl
cp ~/bluez-5.50/mesh/prov_db.json ~/.config/meshctl/
cp ~/bluez-5.50/mesh/local_node.json ~/.config/meshctl/

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
