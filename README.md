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

![PineTime Smart Watch with Apache Mynewt and Embedded Rust](https://lupyuen.github.io/images/pinetime-title.jpg)

This `master` branch contains the firmware source code for PineTime Smart Watch with Apache Mynewt and Embedded Rust, with Wireless Firmware Updates, LVGL 7 (by embedding [`pinetime_lvgl_mynewt`](https://gitlab.com/lupyuen/pinetime_lvgl_mynewt)), Bluetooth LE Time Sync and Rust Watch Face.

This branch no longer supports `druid` and `embedded-graphics`. Check out the older version in the [`pre-lvgl`](https://github.com/lupyuen/pinetime-rust-mynewt/tree/pre-lvgl) branch.

Refer to the articles...

1. [_PineTime doesn't run Linux... But that's OK!_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/pinetime)

1. [_Bluetooth Time Sync, Rust Watch Faces and LVGL on PineTime Mynewt_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/timesync)

1. [_Firmware Update over Bluetooth Low Energy on PineTime Smart Watch_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)

1. [_Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)

1. [_MCUBoot Bootloader for PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)

1. [_Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)

1. [_Your First Bluetooth Low Energy App with Flutter_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)

1. [_Convert Go to Flutter and Dart for PineTime Companion App_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)

1. [_Your First GTK App with Go and VSCodium_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)

1. [_Flutter State Management with Bloc for PineTime Companion App_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/bloc)

1. [_Auto Convert Go to Dart with an Abstract Syntax Tree_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/ast)

1. [_My First Week As Embedded FOSS Advocate_](https://medium.com/@ly.lee/my-first-week-as-embedded-foss-advocate-106d625deae?source=friends_link&sk=4128d2bb8a7098658fafc462a1531d34)

1. [_Rust Documentation_](https://lupyuen.github.io/pinetime-rust-mynewt/?1)

The following articles were written for the older version of this firmware. Refer to the [`pre-lvgl`](https://github.com/lupyuen/pinetime-rust-mynewt/tree/pre-lvgl) branch for the source code...

1. [_Visual Rust for PineTime Smart Watch_](https://marketplace.visualstudio.com/items?itemName=LeeLupYuen.visual-embedded-rust)

1. [_Build and Flash Rust+Mynewt Firmware for PineTime Smart Watch_](https://medium.com/@ly.lee/build-and-flash-rust-mynewt-firmware-for-pinetime-smart-watch-5e14259c55?source=friends_link&sk=150b2a73b84144e5ef25b985e65aebe9)

1. [_Debug Rust+Mynewt Firmware for PineTime on Raspberry Pi_](https://medium.com/@ly.lee/debug-rust-mynewt-firmware-for-pinetime-on-raspberry-pi-4b9ac2d093a9?source=friends_link&sk=edb508c31e43d3ec40ecd8554f3405f6)

1. [_Sneak Peek of PineTime Smart Watch… And why it's perfect for teaching IoT_](https://medium.com/swlh/sneak-peek-of-pinetime-smart-watch-and-why-its-perfect-for-teaching-iot-81b74161c159?source=friends_link&sk=d9301466f5499bece3e7b638e99ec20d)

1. [_Building a Rust Driver for PineTime’s Touch Controller_](https://medium.com/@ly.lee/building-a-rust-driver-for-pinetimes-touch-controller-cbc1a5d5d3e9?source=friends_link&sk=d8cf73fc943d9c0e960627d768f309cb)

1. [_Porting [druid] Rust Widgets to PineTime Smart Watch_](https://medium.com/@ly.lee/porting-druid-rust-widgets-to-pinetime-smart-watch-7e1d5a5d977a?source=friends_link&sk=09b153c68483f7fa9e63350efd167b07)

1. [_Optimising PineTime’s Display Driver with Rust and Mynewt_](https://medium.com/@ly.lee/optimising-pinetimes-display-driver-with-rust-and-mynewt-3ba269ea2f5c?source=friends_link&sk=4d2cbd2e6cd2343eed62d214814f7b81)

1. [_OpenOCD on Raspberry Pi: Better with SWD on SPI_](https://medium.com/@ly.lee/openocd-on-raspberry-pi-better-with-swd-on-spi-7dea9caeb590?source=friends_link&sk=df399bfd913d3e262447d28aa5af6b63)

1. [_CHIP-8 Game Emulator in Rust for PineTime Smart Watch_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/chip8)

1. [_Porting MicroPython and wasp-os to Mynewt on PineTime Smart Watch (nRF52)_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/micropython)

1.  The firmware design is similar to this earlier article on nRF52: [_Coding nRF52 with Rust and Apache Mynewt on Visual Studio Code_](https://medium.com/@ly.lee/coding-nrf52-with-rust-and-apache-mynewt-on-visual-studio-code-9521bcba6004?source=friends_link&sk=bb4e2523b922d0870259ab3fa696c7da)

[More Articles](https://lupyuen.github.io)

[RSS Feed](https://lupyuen.github.io/rss.xml)

# Automated Build with GitHub Actions

The MCUBoot Bootloader and Rust+Mynewt Firmware are __built automatically__ in the GitHub Cloud. 

Just fork this repo, update the source code and the built firmware will be available for download under __"Actions"__.

The Automated Build is performed according to the following __GitHub Actions Workflow__...

[`.github/workflows/main.yml`](.github/workflows/main.yml)

The Worklow is similar to the one described in this article...

[_Build PineTime Firmware in the Cloud with GitHub Actions_](https://lupyuen.github.io/pinetime-rust-mynewt/articles/cloud)


# Build Instructions

If you are building from this repository from scratch instead of the Released Packages, here are the steps for Linux (x64, Arm32 and Arm64, including Raspberry Pi), macOS and Windows (no need for WSL, MinGW and Docker)...

## Install Build Tools

1. Download and extract [xPack OpenOCD](https://xpack.github.io/openocd/install/). Other versions of OpenOCD are known to have problems flashing with ST-Link.

    - [xPack OpenOCD for Linux x64](https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-15/xpack-openocd-0.10.0-15-linux-x64.tar.gz)

    - [xPack OpenOCD for Linux Arm32](https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-15/xpack-openocd-0.10.0-15-linux-arm.tar.gz)

    - [xPack OpenOCD for Linux Arm64](https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-15/xpack-openocd-0.10.0-15-linux-arm64.tar.gz)

    - [xPack OpenOCD for macOS](https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-15/xpack-openocd-0.10.0-15-darwin-x64.tar.gz)

    - [xPack OpenOCD for Windows x64](https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-15/xpack-openocd-0.10.0-15-win32-x64.zip)

    For Raspberry Pi: Install `openocd-spi` according to the instructions here...

    [_"OpenOCD on Raspberry Pi: Better with SWD on SPI"_](https://medium.com/@ly.lee/openocd-on-raspberry-pi-better-with-swd-on-spi-7dea9caeb590?source=friends_link&sk=df399bfd913d3e262447d28aa5af6b63)

1.  Download the [Arm Embedded Toolchain 9-2020-q2-update](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads). Other versions of the toolchain are known to have problems building the firmware.

    __For Linux and macOS:__ Unzip the toolchain and add it to your PATH

    __For Windows:__ Run the installer and check the option for `Add to PATH`. Also install the ST-Link v2 Driver for Windows...

    - Download the ST-Link USB driver from [ST-Link Driver Website](https://www.st.com/en/development-tools/stsw-link009.html) (email registration required)

    - Click Get Software

    - Unzip the downloaded file. Double-click the driver installer: `dpinst_amd64.exe`

1. Install `rustup` with support for nightly target `thumbv7em-none-eabihf`. 
   
   Follow the instructions at https://rustup.rs/
   
   Press Enter to select `1) Proceed with installation (default)`

   __For Linux and macOS:__ Open a command prompt and enter...

   ```bash
   source $HOME/.cargo/env
   rustup update
   rustup default nightly
   rustup target add thumbv7em-none-eabihf
   ```

   __For Windows:__ Enter the above commands in a Windows Command Prompt (not WSL Terminal). Omit the `source` line.

1. __For Linux and macOS:__ Install the `newt` build tool for Mynewt.  Refer to these scripts...

    - [`scripts/install-version.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/install-version.sh): To set the version numbers

    - [`scripts/install-pi.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/install-pi.sh): To build and install `newt`, look under the section `"Build newt"`    

    __For Windows:__ The `newt` tool has been prebuilt at `pinetime-rust-mynewt/newt/newt.exe`

## Download Source Files

1. Download the source files to `~/pinetime`...

    __For Linux and macOS:__

    ```bash
    mkdir ~/pinetime
    cd ~/pinetime
    git clone --recursive https://github.com/lupyuen/pinetime-rust-mynewt
    ```

    __For Windows:__

    ```cmd
    cd \
    mkdir pinetime
    cd pinetime
    git clone --recursive https://github.com/lupyuen/pinetime-rust-mynewt
    ```

1. Update the MCUBoot version number to 1.3.1. Edit [`pinetime/pinetime-rust-mynewt/project.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/project.yml)

    Change...

    ```yaml
    repository.mcuboot:
        type: github
        vers: 1.5.0
    ```

    to...

    ```yaml
    repository.mcuboot:
        type: github
        vers: 1.3.1
    ```

1. Download the source code for Mynewt, NimBLE and MCUBoot...

    __For Linux and macOS:__

    ```bash
    cd ~/pinetime/pinetime-rust-mynewt
    newt install
    ```

    We should see...

    ```
    Downloading repository mynewt-core (commit: master) from https://github.com/apache/mynewt-core.git
    Downloading repository mynewt-mcumgr (commit: master) from https://github.com/apache/mynewt-mcumgr.git
    Downloading repository mynewt-nimble (commit: master) from https://github.com/apache/mynewt-nimble.git
    Downloading repository mcuboot (commit: master) from https://github.com/JuulLabs-OSS/mcuboot.git
    Making the following changes to the project:
        install apache-mynewt-core (1.7.0)
        install apache-mynewt-nimble (1.2.0)
        install mcuboot (1.3.1)
    apache-mynewt-core successfully installed version 1.7.0
    apache-mynewt-nimble successfully installed version 1.2.0
    Error: Error updating "mcuboot": error: The following untracked working tree files would be overwritten by checkout:
            ext/mbedtls/include/mbedtls/check_config.h
            ext/mbedtls/include/mbedtls/config.h
    Please move or remove them before you switch branches.
    Aborting
    ```

    Ignore the `mcuboot` error above and proceed to the next step.

    __For Windows:__

    ```cmd
    cd \pinetime\pinetime-rust-mynewt
    mkdir repos
    cd repos
    git clone --recursive --branch mynewt_1_7_0_tag https://github.com/apache/mynewt-core.git apache-mynewt-core
    git clone --recursive --branch nimble_1_2_0_tag https://github.com/apache/mynewt-nimble.git apache-mynewt-nimble
    ```

1. Restore the MCUBoot version number to 1.5.0. Edit [`pinetime/pinetime-rust-mynewt/project.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/project.yml)

    Change...

    ```yaml
    repository.mcuboot:
        type: github
        vers: 1.3.1
    ```

    to...

    ```yaml
    repository.mcuboot:
        type: github
        vers: 1.5.0
    ```

1. Download version 1.5.0 of MCUBoot to `repos/mcuboot`

    __For Linux and macOS:__

    ```bash
    cd ~/pinetime/pinetime-rust-mynewt/repos
    rm -rf mcuboot
    git clone --recursive --branch v1.5.0 https://github.com/JuulLabs-OSS/mcuboot
    ```

    __For Windows:__

    ```cmd
    cd \pinetime\pinetime-rust-mynewt\repos
    git clone --recursive --branch v1.5.0 https://github.com/JuulLabs-OSS/mcuboot
    ```

    Why are we doing this? Because we are using a more recent version of MCUBoot (1.5.0), but that's not in sync with the older Mynewt version (1.7.0). This will cause `newt install` to fail. Hence we do this workaround to force Mynewt to build with the newer MCUBoot.

1. Copy the unzipped OpenOCD from [xPack OpenOCD](https://xpack.github.io/openocd/install/) or `openocd-spi` to the folder...

    ```
    pinetime-rust-mynewt/openocd
    ```

    The `openocd` executable should be located at `pinetime-rust-mynewt/openocd/bin/openocd`

## Build MCUBoot Bootloader

Build the MCUBoot Bootloader...

__For Linux and macOS:__

```bash
cd ~/pinetime/pinetime-rust-mynewt
scripts/nrf52/build-boot.sh
```

__For Windows:__

```cmd
cd \pinetime\pinetime-rust-mynewt
scripts\nrf52\build-boot.cmd
```

We should see...

```
Linking pinetime/pinetime-rust-mynewt/bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf
Target successfully built: targets/nrf52_boot
+ newt size -v nrf52_boot
Size of Application Image: app
Mem FLASH: 0x0-0x6000
Mem RAM: 0x20000000-0x20010000
  FLASH     RAM 
     90     229 *fill*
   6823    5996 boot_bootutil.a
    124       0 boot_mynewt.a
     18       0 boot_mynewt_flash_map_backend.a
   1182       0 crypto_mbedtls.a
    392     444 hw_bsp_nrf52.a
     52       0 hw_cmsis-core.a
   1280      80 hw_drivers_flash_spiflash.a
    654       1 hw_hal.a
   4192      72 hw_mcu_nordic_nrf52xxx.a
   2006   18776 kernel_os.a
   1930      12 libc_baselibc.a
   1478     256 libs_pinetime_boot.a
    529      40 libs_semihosting_console.a
    544     128 sys_flash_map.a
      2       0 sys_log_modlog.a
    632      29 sys_mfg.a
     30       5 sys_sysinit.a
     48       0 util_mem.a
    100       0 nrf52_boot-sysinit-app.a
    756       0 libgcc.a
Loading compiler pinetime/pinetime-rust-mynewt/repos/apache-mynewt-core/compiler/arm-none-eabi-m4, buildProfile debug

objsize
   text    data     bss     dec     hex filename
  22792     132   25504   48428    bd2c pinetime/pinetime-rust-mynewt/bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf
```

## Select the OpenOCD Interface: ST-Link or Raspberry Pi SPI

Edit [`pinetime/pinetime-rust-mynewt/scripts/config.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/config.sh)

If we're using ST-Link v2 for flashing PineTime, set `swd_device` as follows...

```bash
#  Select ST-Link v2 as SWD Programmer
swd_device=scripts/nrf52/swd-stlink.ocd
```

If we're using [Raspberry Pi SPI](https://medium.com/@ly.lee/openocd-on-raspberry-pi-better-with-swd-on-spi-7dea9caeb590?source=friends_link&sk=df399bfd913d3e262447d28aa5af6b63) for flashing PineTime, set `swd_device` as follows...

```bash
#  Select Raspberry Pi as SWD Programmer
swd_device=scripts/nrf52-pi/swd-pi.ocd
```

__For Windows:__ We don't need to edit `config.sh`

## Flash MCUBoot Bootloader

1.  __For Linux and macOS:__ Edit [`pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-boot.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/nrf52/flash-boot.sh)

    __For Windows:__ Edit [`pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-boot.cmd`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/nrf52/flash-boot.cmd)

1.  Change `openocd/bin/openocd` to the path of our installed `openocd` (for ST-Link) or `openocd-spi` (for Raspberry Pi)...

    ```bash
    #  Flash the device
    openocd/bin/openocd \
        -f $swd_device \
        -f scripts/nrf52/flash-boot.ocd
    ```

1.  The path of the built firmware file is defined in [`pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-boot.ocd`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/nrf52/flash-boot.ocd). We shouldn't need to change this.

    ```
    # For MCUBoot (debugging not supported):
    program bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf.bin verify 0x00000000
    ```

1. Flash the bootloader...

    __For Linux and macOS:__

    ```bash
    scripts/nrf52/flash-boot.sh
    ```

    __Windows:__

    ```cmd
    scripts\nrf52\flash-boot.cmd
    ```

1. We should see...

    ```
    > Executing task in folder pinetime-rust-mynewt: bash -c -l ' scripts/nrf52/flash-boot.sh && echo ✅ ◾ ️Done! ' <

    + source scripts/config.sh
    ++ swd_device=scripts/nrf52/swd-stlink.ocd
    + openocd/bin/openocd -f scripts/nrf52/swd-stlink.ocd -f scripts/nrf52/flash-boot.ocd
    GNU MCU Eclipse 64-bit Open On-Chip Debugger 0.10.0+dev-00462-gdd1d90111 (2019-01-15-13:49)
    Licensed under GNU GPL v2
    For bug reports, read
            http://openocd.org/doc/doxygen/bugs.html
    debug_level: 0
    adapter speed: 1000 kHz
    force hard breakpoints
    Stopping...
    target halted due to breakpoint, current mode: Thread 
    xPSR: 0x21000000 pc: 0x000023a4 msp: 0x2000ff9c

    Flashing Bootloader...
    target halted due to debug-request, current mode: Thread 
    xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000
    Enabled ARM Semihosting to show debug output
    semihosting is enabled
    ** Programming Started **
    auto erase enabled
    target halted due to breakpoint, current mode: Thread 
    xPSR: 0x61000000 pc: 0x2000001e msp: 0x20010000, semihosting
    wrote 24576 bytes from file bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf.bin in 0.729124s (32.916 KiB/s)
    ** Programming Finished **
    ** Verify Started **
    target halted due to breakpoint, current mode: Thread 
    xPSR: 0x61000000 pc: 0x2000002e msp: 0x20010000, semihosting
    verified 22876 bytes in 0.114145s (195.715 KiB/s)
    ** Verified OK **

    Restarting...
    target halted due to debug-request, current mode: Thread 
    xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000, semihosting

    **** Done!
    ```
    
1.  For ST-Link, check that the Adapter Speed is set to 1000 kHz. OpenOCD won't work at higher speeds.

    ```
    adapter speed: 1000 kHz
    ```

1.  If the flashing fails, check whether any `openocd` processes are running in the background, and kill them.

## Build Application Firmware

1. Build the Application Firmware...

    __For Linux and macOS:__

    ```bash
    scripts/build-app.sh
    ```

    __For Windows:__

    ```cmd
    scripts\build-app.cmd
    ```

    If we see the error `Undefined main`, run `build-app` again. It should fix the error.

    We should see...

    ```
    ```

1. Create the application firmware image...

    __For Linux and macOS:__

    ```bash
    scripts/nrf52/image-app.sh
    ```

    __For Windows:__

    ```cmd
    scripts\nrf52\image-app.cmd
    ```

    We should see...

    ```
    ```

## Flash Application Firmware

1.  __For Linux and macOS:__ Edit [`pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-app.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/nrf52/flash-app.sh)

    __For Windows:__ Edit [`pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-app.cmd`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/nrf52/flash-app.cmd)

1.  Change `openocd/bin/openocd` to the path of our installed `openocd` (for ST-Link) or `openocd-spi` (for Raspberry Pi)...

    ```bash
    #  Flash the device
    openocd/bin/openocd \
        -f $swd_device \
        -f scripts/nrf52/flash-app.ocd
    ```

1.  The path of the built firmware file is defined in [`pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-app.ocd`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/nrf52/flash-app.ocd). We shouldn't need to change this.

    ```
    program bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img verify 0x00008000
    ```

1. Flash the application...

    __For Linux and macOS:__

    ```bash
    scripts/nrf52/flash-app.sh
    ```

    __Windows:__
    
    ```bash
    scripts\nrf52\flash-app.cmd
    ```

1. We should see...

    ```
    > Executing task in folder pinetime-rust-mynewt: bash -c -l ' scripts/nrf52/flash-app.sh && echo ✅ ◾ ️Done! ' <

    + source scripts/config.sh
    ++ swd_device=scripts/nrf52/swd-stlink.ocd
    + openocd/bin/openocd -f scripts/nrf52/swd-stlink.ocd -f scripts/nrf52/flash-app.ocd
    GNU MCU Eclipse 64-bit Open On-Chip Debugger 0.10.0+dev-00462-gdd1d90111 (2019-01-15-13:49)
    Licensed under GNU GPL v2
    For bug reports, read
            http://openocd.org/doc/doxygen/bugs.html
    debug_level: 0
    adapter speed: 1000 kHz
    force hard breakpoints
    Stopping...
    target halted due to debug-request, current mode: Thread 
    xPSR: 0x61000000 pc: 0x000001ca msp: 0x2000ffd8

    Flashing Application...
    target halted due to debug-request, current mode: Thread 
    xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000
    Enabled ARM Semihosting to show debug output
    semihosting is enabled
    ** Programming Started **
    auto erase enabled
    target halted due to breakpoint, current mode: Thread 
    xPSR: 0x61000000 pc: 0x2000001e msp: 0x20010000, semihosting
    wrote 143360 bytes from file bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img in 3.606276s (38.821 KiB/s)
    ** Programming Finished **
    ** Verify Started **
    target halted due to breakpoint, current mode: Thread 
    xPSR: 0x61000000 pc: 0x2000002e msp: 0x20010000, semihosting
    verified 139268 bytes in 0.363909s (373.731 KiB/s)
    ** Verified OK **
    ```

1.  For ST-Link, check that the Adapter Speed is set to 1000 kHz. OpenOCD won't work at higher speeds.

    ```
    adapter speed: 1000 kHz
    ```

1.  If the flashing fails, check whether any `openocd` processes are running in the background, and kill them.

1. PineTime reboots (with the `reset init` OpenOCD Command)...

    ```
    Restarting...
    target halted due to debug-request, current mode: Thread 
    xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000, semihosting
    Enabled ARM Semihosting to show debug output
    semihosting is enabled
    ```

1. PineTime starts MCUBoot Bootloader...

    ```
    **** Done! Press Ctrl-C to exit...
    Starting Bootloader...
    Displaying image...
    Image displayed
    Check button: 0
    [INF] Primary image: magic=good, swap_type=0x4, copy_done=0x1, image_ok=0x1
    [INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
    [INF] Boot source: none
    [INF] Swap type: none
    Waiting 5 seconds for button...
    Waited for button: 0
    Bootloader done
    ```

1. Finally PineTime starts the Application Firmware...

    ```
    TMP create temp_stub_0
    NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
    NET standalone node 
    ```

# PineTime Updater

Alternatively, flash the following two files to PineTime with [__PineTime Updater__](https://github.com/lupyuen/pinetime-updater)...

1.  __MCUBoot Bootloader__

    File: `bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf`

    Address: `0x0`

1.  __Rust+Mynewt Firmware__

    File: `bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf`

    Address: `0x8000`

# Installation, Build, Flash and Debug Logs

Sample logs for Linux, macOS and Windows may be found in the [logs folder](logs)

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
