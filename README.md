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

# Embedded Rust Application hosted on Apache Mynewt for STM32 Blue Pill

_Note: This is the `rust` branch that contains a Rust application hosted on Mynewt_

Check the article...

[_Hosting Embedded Rust apps on Apache Mynewt with STM32 Blue Pill_](https://medium.com/@ly.lee/hosting-embedded-rust-apps-on-apache-mynewt-with-stm32-blue-pill-c86b119fe5f)

# Requirements

1. STM32 Blue Pill or [_Super Blue Pill_](https://medium.com/swlh/super-blue-pill-like-stm32-blue-pill-but-better-6d341d9347da)

# Install Apache Mynewt for Windows and macOS

To install Apache Mynewt for Windows and macOS, refer to the tutorials...

1.  [_Build Your IoT Sensor Network — STM32 Blue Pill + nRF24L01 + ESP8266 + Apache Mynewt + thethings.io_](https://medium.com/@ly.lee/build-your-iot-sensor-network-stm32-blue-pill-nrf24l01-esp8266-apache-mynewt-thethings-io-ca7486523f5d)

1.  [_Connect STM32 Blue Pill to ESP8266 with Apache Mynewt_](https://medium.com/@ly.lee/connect-stm32-blue-pill-to-esp8266-with-apache-mynewt-7edceb9e3b8d?source=friends_link&sk=df729a82533d817ec6b2d9b626b6f66b)

1.  [_Create your IoT gadget with Apache Mynewt and STM32 Blue Pill_](https://medium.com/@ly.lee/create-your-iot-gadget-with-apache-mynewt-and-stm32-blue-pill-d689b3ca725?source=friends_link&sk=d511426d5a2217ebd06789b3eef7df54)

# Install Apache Mynewt for Ubuntu Linux

1.  Launch Video Studio Code

1.  Click `Terminal → Run Task`

1.  Select `[0] Install Apache Mynewt`

1.  When prompted, click on the `Terminal` pane and enter the `sudo` password. The password only needs to be entered once.

1.  The [setup script](https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/master/scripts/install-linux.sh) will take a few minutes to download and install the build tools.  When it’s done, we should see Done!

1.  Exit and restart Visual Studio Code. This activates the installed extensions.

In case of problems, compare your log with this [setup log](https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/master/logs/install-linux.log).


# Install Rust

1.  Install `rustup` by following the instructions at https://rustup.rs.


```


macOS:
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

Windows: 
rustup‑init.exe, run anyway
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

rustc -V
rustc 1.35.0 (3c235d560 2019-05-20)
or
rustc 1.36.0-nightly (50a0defd5 2019-05-21)
or later

rustup target add thumbv7m-none-eabi


-----
error: component 'rls' for target 'x86_64-apple-darwin' is unavailable for download for channel 'nightly'

check
https://rust-lang.github.io/rustup-components-history/
rls: Last available - 2019-05-22

cd $HOME/stm32bluepill-mynewt-sensor
cd /mnt/c/stm32bluepill-mynewt-sensor

rustup override set nightly-2019-05-22

info: override toolchain for '/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor' set to 'nightly-2019-05-22-x86_64-apple-darwin'

rustup component add rls rust-analysis rust-src --toolchain nightly-2019-05-22

-----

libcore

target/.rustc_info.json
<<
        "16168332780710089770": [
            "___\nlib___.rlib\nlib___.a\n/Users/Luppy/.rustup/toolchains/nightly-2019-05-22-x86_64-apple-darwin\ndebug_assertions\nproc_macro\ntarget_arch=\"arm\"\ntarget_endian=\"little\"\ntarget_env=\"\"\ntarget_feature=\"mclass\"\ntarget_feature=\"v5te\"\ntarget_feature=\"v6\"\ntarget_feature=\"v6k\"\ntarget_feature=\"v6t2\"\ntarget_feature=\"v7\"\ntarget_has_atomic=\"16\"\ntarget_has_atomic=\"32\"\ntarget_has_atomic=\"8\"\ntarget_has_atomic=\"cas\"\ntarget_has_atomic=\"ptr\"\ntarget_os=\"none\"\ntarget_pointer_width=\"32\"\ntarget_vendor=\"\"\n",
            "warning: dropping unsupported crate type `dylib` for target `thumbv7m-none-eabi`\n\nwarning: dropping unsupported crate type `cdylib` for target `thumbv7m-none-eabi`\n\nwarning: dropping unsupported crate type `proc-macro` for target `thumbv7m-none-eabi`\n\n"
        ],
>>

copy libcore*.rlib from 
~/.rustup/toolchains/nightly-2019-05-22-x86_64-apple-darwin/lib/rustlib/thumbv7m-none-eabi/lib
~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/thumbv7m-none-eabi/lib
to
libs/rust_libcore/src

-----

```


# Installation, Build, Flash and Debug Logs

Sample logs for Windows and Ubuntu Linux may be found in the [logs folder](logs)

# Contents

This repository contains...

1. [`src`](src): Rust Application

1. [`Cargo.toml`](Cargo.toml): Rust Build Settings

1. [`.cargo`](.cargo): Rust Target Settings

1. [`my_sensor_app`](apps/my_sensor_app): Mynewt Application Stub

1. [`boot_stub`](apps/boot_stub): Mynewt Bootloader Stub

1. [`adc_stm32f1`](libs/adc_stm32f1): Mynewt Driver for ADC on STM32F1

1. [`custom_sensor`](libs/custom_sensor): Custom Sensor Definitions

1. [`esp8266`](libs/esp8266): Mynewt Driver for ESP8266

1. [`hmac_prng`](libs/hmac_prng): HMAC pseudorandom number generator with entropy based on internal temperature sensor

1. [`nrf24l01`](libs/nrf24l01): Mynewt Driver for nRF24L01

1. [`remote_sensor`](libs/remote_sensor): Mynewt Driver for Remote Sensor

1. [`semihosting_console`](libs/semihosting_console): Mynewt Console for Arm Semihosting

1. [`sensor_coap`](libs/sensor_coap): Sensor CoAP Library

1. [`sensor_network`](libs/sensor_network): Sensor Network Library

1. [`temp_stm32`](libs/temp_stm32): Mynewt Driver for Internal Temperature Sensor on STM32

1. [`scripts`](scripts): Install, build and deploy scripts

1. [`.vscode`](.vscode): Visual Studio Code macros for install, build and deploy


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
