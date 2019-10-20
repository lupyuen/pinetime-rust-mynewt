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

# Sensor Application for GigaDevice GD32VF103 with Apache Mynewt and Embedded Rust

This `gd32vf103` branch contains the source code for a Sensor Application for GigaDevice GD32VF103 with Apache Mynewt and Embedded Rust that has been tested on the [GigaDevice GD32VF103C-START board](https://www.gigadevice.com/products/microcontrollers/gd32/risc-v/). Refer to the tutorial...

[_???_](???)

# TODO

repos/apache-mynewt-core/kernel/os/src/arch/rv32imac/ctx.s

repos/apache-mynewt-core/kernel/os/src/arch/rv32imac/os_arch_rv32imac.c

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
