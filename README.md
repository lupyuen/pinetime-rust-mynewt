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

# PineTime Smart Watch Firmware with Apache Mynewt and Embedded Rust

This `master` branch contains the firmware source code for PineTime Smart Watch with Apache Mynewt and Embedded Rust. Refer to the articles...

1. [_PineTime doesn't run Linux... But that's OK!_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/pinetime)

1. [_Visual Rust for PineTime Smart Watch_](https://marketplace.visualstudio.com/items?itemName=LeeLupYuen.visual-embedded-rust)

1. [_Build and Flash Rust+Mynewt Firmware for PineTime Smart Watch_](https://medium.com/@ly.lee/build-and-flash-rust-mynewt-firmware-for-pinetime-smart-watch-5e14259c55?source=friends_link&sk=150b2a73b84144e5ef25b985e65aebe9)

1. [_Debug Rust+Mynewt Firmware for PineTime on Raspberry Pi_](https://medium.com/@ly.lee/debug-rust-mynewt-firmware-for-pinetime-on-raspberry-pi-4b9ac2d093a9?source=friends_link&sk=edb508c31e43d3ec40ecd8554f3405f6)

1. [_Sneak Peek of PineTime Smart Watch… And why it's perfect for teaching IoT_](https://medium.com/swlh/sneak-peek-of-pinetime-smart-watch-and-why-its-perfect-for-teaching-iot-81b74161c159?source=friends_link&sk=d9301466f5499bece3e7b638e99ec20d)

1. [_Building a Rust Driver for PineTime’s Touch Controller_](https://medium.com/@ly.lee/building-a-rust-driver-for-pinetimes-touch-controller-cbc1a5d5d3e9?source=friends_link&sk=d8cf73fc943d9c0e960627d768f309cb)

1. [_Porting [druid] Rust Widgets to PineTime Smart Watch_](https://medium.com/@ly.lee/porting-druid-rust-widgets-to-pinetime-smart-watch-7e1d5a5d977a?source=friends_link&sk=09b153c68483f7fa9e63350efd167b07)

1. [_Optimising PineTime’s Display Driver with Rust and Mynewt_](https://medium.com/@ly.lee/optimising-pinetimes-display-driver-with-rust-and-mynewt-3ba269ea2f5c?source=friends_link&sk=4d2cbd2e6cd2343eed62d214814f7b81)

1. [_CHIP-8 Game Emulator in Rust for PineTime Smart Watch_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/chip8)

1. [_Firmware Update over Bluetooth Low Energy on PineTime Smart Watch_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)

1. [_Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)

1. [_MCUBoot Bootloader for PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)

1. [_Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)

1. [_Porting MicroPython and wasp-os to Mynewt on PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/micropython)

1. [_Your First Bluetooth Low Energy App with Flutter_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)

1. [_Convert Go to Flutter and Dart for PineTime Companion App_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)

1. [_Your First GTK App with Go and VSCodium_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)

1. [_Flutter State Management with Bloc for PineTime Companion App_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/bloc)

1. [_My First Week As Embedded FOSS Advocate_](https://medium.com/@ly.lee/my-first-week-as-embedded-foss-advocate-106d625deae?source=friends_link&sk=4128d2bb8a7098658fafc462a1531d34)

1. [_Rust Documentation_](https://lupyuen.github.io/pinetime-rust-mynewt/?1)

[RSS Feed](https://lupyuen.github.io/rss.xml)

The code structure is similar to the earlier article on nRF52...

[_Coding nRF52 with Rust and Apache Mynewt on Visual Studio Code_](https://medium.com/@ly.lee/coding-nrf52-with-rust-and-apache-mynewt-on-visual-studio-code-9521bcba6004?source=friends_link&sk=bb4e2523b922d0870259ab3fa696c7da)

# Build Instructions

If you are building from this repository from scratch instead of the Released Packages, here are the steps:

1. Install `rustup` with support for nightly target `thumbv7em-none-eabihf`. 
   
   Follow the instructions at https://rustup.rs/
   
   Then execute...

   ```bash
   rustup default nightly
   rustup update
   rustup target add thumbv7em-none-eabihf
   ```

1. Install Arm toolchain `gcc-arm-none-eabi` and the `newt` build tool for Mynewt.  Refer to this script...

    [`scripts/install-pi.sh`](scripts/install-pi.sh)

1. Clone this repository...

   ```bash
   git clone --recursive https://github.com/lupyuen/pinetime-rust-mynewt
   ```

1. [`repos`](repos) folder should contain the Mynewt source code. If your `repos` folder is empty, install the Mynewt source code with the `newt install` command:

    ```bash
    cd pinetime-rust-mynewt
    newt install
    ```

    Ignore the error `Error: Error updating "mcuboot"`

1. Build the bootloader...

    ```bash
    cd pinetime-rust-mynewt
    scripts/nrf52/build-boot.sh
    ```

1. Build the application...

    ```bash
    scripts/build-app.sh
    ```

    If you see the error `Undefined main`, run `scripts/build-app.sh` again. It should fix the error.

1. Create the application firmware image...

    ```bash
    scripts/nrf52/image-app.sh
    ```

1. Flash the bootloader...

    ```bash
    scripts/nrf52-pi/flash-boot.sh
    ```

1. Flash the application and run it...

    ```bash
    scripts/nrf52-pi/flash-app.sh
    ```
    
1. You may need to edit the scripts to set the right path of OpenOCD. 

   Also for Windows, the ST-Link interface for OpenOCD is `stlink-v2.cfg` instead of `stlink.cfg`.

1. Check these articles in case of problems...

    - [_Visual Rust for PineTime Smart Watch_](https://marketplace.visualstudio.com/items?itemName=LeeLupYuen.visual-embedded-rust)

    - [_Build and Flash Rust+Mynewt Firmware for PineTime Smart Watch_](https://medium.com/@ly.lee/build-and-flash-rust-mynewt-firmware-for-pinetime-smart-watch-5e14259c55?source=friends_link&sk=150b2a73b84144e5ef25b985e65aebe9)

# Fixes for Mynewt type conversion build warnings

These fixes should be applied manually when upgrading Mynewt or installing Mynewt from scratch. They suppress the compiler warning messages that stop the Mynewt build for C++ source files.

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
