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

# PineTime Smart Watch Firmware with Apache Mynewt, Embedded Rust and MicroPython

This `micropython` branch contains the firmware source code for PineTime Smart Watch with Apache Mynewt, Embedded Rust, Wireless Firmware Updates and MicroPython based on these repos...

https://github.com/lupyuen/wasp-os

https://github.com/AppKaki/micropython/tree/wasp-os

Refer to the articles...

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

1. [_My First Week As Embedded FOSS Advocate_](https://medium.com/@ly.lee/my-first-week-as-embedded-foss-advocate-106d625deae?source=friends_link&sk=4128d2bb8a7098658fafc462a1531d34)

1. [_Rust Documentation_](https://lupyuen.github.io/pinetime-rust-mynewt/?1)

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

# Build Log

```bash

> Executing task in folder pinetime-rust-mynewt: bash -c -l ' scripts/build-app.sh && cp .vscode/launch-nrf52.json .vscode/launch.json && echo ✅ ◾ ️Done! ' <

+ mynewt_build_app=nrf52_my_sensor
+ rust_build_target=thumbv7em-none-eabihf
+ launch_config=launch-nrf52-pi.json
+ set +x

----- Building Rust app and Mynewt OS for thumbv7em-none-eabihf / nrf52_my_sensor...

----- Build Rust app
+ cargo build --target thumbv7em-none-eabihf
   Compiling app v0.1.0 (/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app)
warning: constant item is never used: `TOUCH_RESET_PIN`
  --> rust/app/src/touch_sensor.rs:19:1
   |
19 | const TOUCH_RESET_PIN: i32 = 10;  //  P0.10/NFC2: TP_RESET
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

warning: constant item is never used: `TOUCH_INTERRUPT_PIN`
  --> rust/app/src/touch_sensor.rs:22:1
   |
22 | const TOUCH_INTERRUPT_PIN: i32 = 28;  //  P0.28/AIN4: TP_INT
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: static item is never used: `TOUCH_RESET`
  --> rust/app/src/touch_sensor.rs:25:1
   |
25 | static mut TOUCH_RESET: MynewtGPIO =  fill_zero!(MynewtGPIO);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: static item is never used: `TOUCH_DELAY`
  --> rust/app/src/touch_sensor.rs:26:1
   |
26 | static mut TOUCH_DELAY: MynewtDelay = fill_zero!(MynewtDelay);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: type alias is never used: `MynewtGPIO`
  --> rust/app/src/touch_sensor.rs:27:1
   |
27 | type MynewtGPIO = mynewt::GPIO;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: type alias is never used: `MynewtDelay`
  --> rust/app/src/touch_sensor.rs:28:1
   |
28 | type MynewtDelay = mynewt::Delay;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: function is never used: `start_touch_sensor`
  --> rust/app/src/touch_sensor.rs:38:8
   |
38 | pub fn start_touch_sensor() -> MynewtResult<()> {
   |        ^^^^^^^^^^^^^^^^^^

warning: function is never used: `touch_interrupt_handler`
  --> rust/app/src/touch_sensor.rs:71:15
   |
71 | extern "C" fn touch_interrupt_handler(arg: *mut core::ffi::c_void) {
   |               ^^^^^^^^^^^^^^^^^^^^^^^

warning: function is never used: `touch_event_callback`
  --> rust/app/src/touch_sensor.rs:82:15
   |
82 | extern "C" fn touch_event_callback(_event: *mut os_event) {
   |               ^^^^^^^^^^^^^^^^^^^^

warning: static item is never used: `TOUCH_DATA`
   --> rust/app/src/touch_sensor.rs:132:1
    |
132 | static mut TOUCH_DATA: TouchEventInfo = fill_zero!(TouchEventInfo);
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: function is never used: `read_touchdata`
   --> rust/app/src/touch_sensor.rs:136:4
    |
136 | fn read_touchdata(data: &mut TouchEventInfo) -> MynewtResult<()> {
    |    ^^^^^^^^^^^^^^

warning: static item is never used: `BUF`
   --> rust/app/src/touch_sensor.rs:184:1
    |
184 | static mut BUF: [u8; POINT_READ_BUF] = [0; POINT_READ_BUF];
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `TOUCH_CONTROLLER_ADDRESS`
   --> rust/app/src/touch_sensor.rs:187:1
    |
187 | const TOUCH_CONTROLLER_ADDRESS: u8 = 0x15;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: struct is never constructed: `TouchEventInfo`
   --> rust/app/src/touch_sensor.rs:190:8
    |
190 | struct TouchEventInfo {
    |        ^^^^^^^^^^^^^^

warning: struct is never constructed: `TouchInfo`
   --> rust/app/src/touch_sensor.rs:199:8
    |
199 | struct TouchInfo {
    |        ^^^^^^^^^

warning: constant item is never used: `CFG_MAX_TOUCH_POINTS`
   --> rust/app/src/touch_sensor.rs:217:1
    |
217 | const CFG_MAX_TOUCH_POINTS: usize = 5;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_MAX_POINTS`
   --> rust/app/src/touch_sensor.rs:220:1
    |
220 | const HYN_MAX_POINTS: usize = 10;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_MAX_ID`
   --> rust/app/src/touch_sensor.rs:222:1
    |
222 | const HYN_MAX_ID: u8             = 0x0F;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_STEP`
   --> rust/app/src/touch_sensor.rs:223:1
    |
223 | const HYN_TOUCH_STEP: usize      = 6;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_X_H_POS`
   --> rust/app/src/touch_sensor.rs:225:1
    |
225 | const HYN_TOUCH_X_H_POS: usize   = 3;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_X_L_POS`
   --> rust/app/src/touch_sensor.rs:226:1
    |
226 | const HYN_TOUCH_X_L_POS: usize   = 4;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_Y_H_POS`
   --> rust/app/src/touch_sensor.rs:227:1
    |
227 | const HYN_TOUCH_Y_H_POS: usize   = 5;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_Y_L_POS`
   --> rust/app/src/touch_sensor.rs:228:1
    |
228 | const HYN_TOUCH_Y_L_POS: usize   = 6;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_EVENT_POS`
   --> rust/app/src/touch_sensor.rs:229:1
    |
229 | const HYN_TOUCH_EVENT_POS: usize = 3;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_ID_POS`
   --> rust/app/src/touch_sensor.rs:230:1
    |
230 | const HYN_TOUCH_ID_POS: usize    = 5;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `FT_TOUCH_POINT_NUM`
   --> rust/app/src/touch_sensor.rs:231:1
    |
231 | const FT_TOUCH_POINT_NUM: usize  = 2;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_XY_POS`
   --> rust/app/src/touch_sensor.rs:232:1
    |
232 | const HYN_TOUCH_XY_POS: usize    = 7;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `HYN_TOUCH_MISC`
   --> rust/app/src/touch_sensor.rs:233:1
    |
233 | const HYN_TOUCH_MISC: usize      = 8;
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: constant item is never used: `POINT_READ_BUF`
   --> rust/app/src/touch_sensor.rs:234:1
    |
234 | const POINT_READ_BUF: usize      = 3 + ( HYN_TOUCH_STEP * HYN_MAX_POINTS );
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: static item is never used: `TOUCH_EVENT`
   --> rust/app/src/touch_sensor.rs:237:1
    |
237 | static mut TOUCH_EVENT: os_event = fill_zero!(os_event);  //  Init all fields to 0 or NULL
    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

warning: function is never used: `read_register_range`
   --> rust/app/src/touch_sensor.rs:240:4
    |
240 | fn read_register_range(addr: u8, start_register: u8, num_registers: u8, buffer: &mut[u8]) -> MynewtResult<()> {
    |    ^^^^^^^^^^^^^^^^^^^

warning: function is never used: `test_display`
  --> rust/app/src/display.rs:22:8
   |
22 | pub fn test_display() -> MynewtResult<()> {
   |        ^^^^^^^^^^^^

warning: function is never used: `test_backlight`
  --> rust/app/src/display.rs:61:4
   |
61 | fn test_backlight() -> MynewtResult<()> {
   |    ^^^^^^^^^^^^^^

warning: function is never used: `flash_backlight`
   --> rust/app/src/display.rs:108:4
    |
108 | fn flash_backlight(
    |    ^^^^^^^^^^^^^^^

    Finished dev [unoptimized + debuginfo] target(s) in 0.49s
+ set +x

----- Consolidate Rust app and crates
+ cp /Users/Luppy/PineTime/pinetime-rust-mynewt/tmprustlib/rustlib.a /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/libs/rust_app/libs_rust_app.a
+ set +x

----- Copy Rust libcore
+ cp /Users/Luppy/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/thumbv7em-none-eabihf/lib/libcore-3fc7142f73d60a74.rlib /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/libs/rust_libcore/libs_rust_libcore.a
+ set +x

----- Copy MicroPython Library
+ cp /Users/Luppy/PineTime/pinetime-rust-mynewt/../wasp-os/micropython/ports/mynewt/build-pinetime/micropython.a /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/libs/micropython/libs_micropython.a
+ set +x

----- Build Mynewt and link with Rust and MicroPython
+ newt build nrf52_my_sensor
Building target targets/nrf52_my_sensor
Linking /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
Target successfully built: targets/nrf52_my_sensor
+ newt size -v nrf52_my_sensor
Size of Application Image: app
Mem RAM: 0x20000000-0x20010000
Mem FLASH: 0x8000-0x7bc00
  FLASH     RAM 
    771     319 *fill*
     54       0 apps_my_sensor_app.a
   2268     116 boot_bootutil.a
     18       0 boot_mynewt_flash_map_backend.a
    438      26 boot_split.a
   1180       0 crypto_mbedtls.a
   2302       0 crypto_tinycrypt.a
    401       0 encoding_base64.a
   1622       0 encoding_cborattr.a
   3002       0 encoding_tinycbor.a
    452     444 hw_bsp_nrf52.a
     52       0 hw_cmsis-core.a
   1560      92 hw_drivers_flash_spiflash.a
    706       1 hw_hal.a
   6646      89 hw_mcu_nordic_nrf52xxx.a
      2       0 hw_sensor_creator.a
   1264     260 hw_sensor.a
   8790   11296 kernel_os.a
   3152      50 libc_baselibc.a
 214646   33557 libs_micropython.a
     16       0 libs_mynewt_rust.a
   1342       0 libs_rust_app.a
   1014       0 libs_rust_libcore.a
    738      42 libs_semihosting_console.a
     40       9 libs_sensor_coap.a
    583      99 libs_sensor_network.a
    677     212 libs_temp_stub.a
   3428      72 mgmt_imgmgr.a
    231      20 mgmt_mgmt.a
    884     100 mgmt_newtmgr.a
   1410      44 mgmt_newtmgr_nmgr_os.a
    454     108 mgmt_newtmgr_transport_ble.a
    405     388 net_oic.a
  35496    2107 nimble_controller.a
   4026    1203 nimble_drivers_nrf52.a
  38080    2796 nimble_host.a
    822     218 nimble_host_services_ans.a
    229     112 nimble_host_services_dis.a
    348     118 nimble_host_services_gap.a
    204      62 nimble_host_services_gatt.a
   1814     648 nimble_host_store_config.a
    692    1096 nimble_transport_ram.a
   1578      54 sys_config.a
    634     128 sys_flash_map.a
      2       0 sys_log_modlog.a
    686      29 sys_mfg.a
    847      51 sys_reboot.a
    226      37 sys_sysdown.a
     30       5 sys_sysinit.a
   1746       0 time_datetime.a
    120       0 util_mem.a
    208       0 nrf52_my_sensor-sysinit-app.a
   2016       0 libgcc.a
Loading compiler /Users/Luppy/PineTime/pinetime-rust-mynewt/repos/apache-mynewt-core/compiler/arm-none-eabi-m4, buildProfile debug

objsize
   text    data     bss     dec     hex filename
 343104     912   54696  398712   61578 /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
+ set +x
+ newt create-image nrf52_my_sensor 1.0.0
App image successfully generated: /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img
✅ ◾ ️Done!

Terminal will be reused by tasks, press any key to close it.
```

# Debug Log

```
GNU MCU Eclipse 64-bit Open On-Chip Debugger 0.10.0+dev-00462-gdd1d90111 (2019-01-15-13:49)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
WARNING: interface/stlink-v2.cfg is deprecated, please switch to interface/stlink.cfg
Info : auto-selecting first available session transport "hla_swd". To override use 'transport select <transport>'.
Info : The selected transport took over low-level target control. The results might differ compared to plain JTAG/SWD
adapter speed: 1000 kHz
debug_level: 2
Info : Listening on port 6666 for tcl connections
Info : Listening on port 4444 for telnet connections
Info : clock speed 1000 kHz
Info : STLINK V2J17S4 (API v2) VID:PID 0483:3748
Info : Target voltage: 3.252024
Info : nrf52.cpu: hardware has 6 breakpoints, 4 watchpoints
Info : Listening on port 50000 for gdb connections
Info : accepting 'gdb' connection on tcp/50000
target halted due to debug-request, current mode: Handler HardFault
xPSR: 0x21000003 pc: 0x0000b190 msp: 0x2000feb8
Info : nRF52832-QFAA(build code: E0) 512kB Flash
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000
Enable ARM Semihosting to show debug output
semihosting is enabled
Warn : using fast async flash loader. This is currently supported
Warn : only with ST-Link and CMSIS-DAP. If you have issues, add
Warn : "set WORKAREASIZE 0" before sourcing nrf51.cfg/nrf52.cfg to disable it
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x2000001e msp: 0x20010000, semihosting
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000, semihosting
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000, semihosting
Info : halted: PC: 0x000087d4
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
stack_start: 200005b8
stack_end: 200025b8
heap_start: 20004b88
heap_end: 2000cb88
TODO adc_init0
TODO timer_init0
TODO microbit_filesystem_init
TODO machine_rtc_make_new
TODO machine_rtc_counter
TODO machine_rtc_start
TODO machine_adc_make_new
1 chips detected. Total flash size 4MiB.
TODO machine_rtc_counter
stack_end: 200025b8
gc_collect: sp=20001d68, len=214
stack_end: 200025b8
gc_collect: sp=20001ed0, len=1ba
TODO machine_adc_value_read
TODO machine_adc_value_read
Watch is running, use Ctrl-C to stop
TODO machine_rtc_counter
TODO machine_rtc_counter
Info : dropped 'gdb' connection
shutdown command invoked
```
