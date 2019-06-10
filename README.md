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

[_Hosting Embedded Rust apps on Apache Mynewt with STM32 Blue Pill_](https://medium.com/@ly.lee/hosting-embedded-rust-apps-on-apache-mynewt-with-stm32-blue-pill-c86b119fe5f?source=friends_link&sk=f58f4cf6c608fded4b354063e474a93b)

# Requirements

1. [STM32 Blue Pill](http://wiki.stm32duino.com/index.php?title=Blue_Pill) or [Super Blue Pill](https://medium.com/swlh/super-blue-pill-like-stm32-blue-pill-but-better-6d341d9347da)

1. ST-Link V2 USB Adapter ([or compatible](https://www.lazada.sg/-i105322107-s106873847.html?urlFlag=true&mp=1)). [Connect Blue Pill to ST-Link like this](https://gist.github.com/lupyuen/30c6197403878630c0cd0630f8fce71b)

1. Windows 10, macOS or Ubuntu computer

# Install Windows Subsystem for Linux (Windows)

_(Windows Subsystem for Linux is needed for building Rust and Mynewt programs)_

1. Follow the instructions [in this article](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to install Windows Subsystem for Linux


1. The PowerShell command in the article should be run as Administrator…

    Right-click `Windows PowerShell` in the Windows menu

    Select `Run As Administrator`

1. For the `Linux Distribution`, select `Ubuntu`

1. Click `Get`

1. Click `Windows → Ubuntu`

1. When prompted, enter a simple user ID (e.g. `user`) without any spaces

1. Enter a password of your choice

# Install ST-Link Driver and Arm Cross-Compiler (Windows)

1. Download the ST-Link USB driver from

    [ST-Link Driver Website](https://www.st.com/en/development-tools/stsw-link009.html) (email registration required)

    Click `Get Software`

1. Unzip the downloaded file. Double-click the driver installer: 

    `dpinst_amd64.exe`

1. Install Arm Cross-Compiler and Linker for Windows from

    [Arm Developer Website](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)

1. Look for the first Windows 32-bit Download without SHA, e.g. 

    `gcc-arm-none-eabi-...-major-win32.exe`

1. Click `Download`

1. Run the installer

1. Select this option at the last install step: 
    
    `"Add path to environment variable"`

# Install Rust (Windows)

_(Rust on Windows is needed to support the Rust RLS extension for Visual Studio Code)_

1.  Install `rustup` according to the instructions at https://rustup.rs

1.  When downloading `rustup‑init.exe`, Windows may block the execution. 

    Click `Run Anyway`

1.  Open the Windows Command Prompt (not Windows Ubuntu).  Enter into the command prompt:
    ```
    c:
    cd \stm32bluepill-mynewt-sensor
    rustup update
    rustc -V
    ```

    The reported version of `rustc` should be `1.36.0` or later:

    ```
    rustc 1.36.0-nightly (50a0defd5 2019-05-21)
    ```

1.  Enter into the Windows Command Prompt (not Windows Ubuntu):
    ```
    rustup target add thumbv7m-none-eabi
    rustup component add rls rust-analysis rust-src
    ```

    If you see an error like `error: component 'rls' for target 'x86_64-apple-darwin' is unavailable for download for channel 'nightly'`, enter these commands to select an older working build of RLS (2019-05-22)...

    ```
    rustup override set nightly-2019-05-22
    rustup target add thumbv7m-none-eabi
    rustup component add rls rust-analysis rust-src --toolchain nightly-2019-05-22
    ```

    The above commands should be executed in the `stm32bluepill-mynewt-sensor` folder. To find the last successful build of RLS:
    https://rust-lang.github.io/rustup-components-history/

# Install Rust on Windows Subsystem for Linux (Windows)

_(Rust on Windows Subsystem for Linux is needed for building Rust and Mynewt programs)_

1. Click `Windows → Ubuntu`

1. Enter into the Windows Ubuntu command prompt (not Windows Command Prompt):

    ```
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```

1.  Enter into the Windows Ubuntu command prompt (not Windows Command Prompt):
    ```
    cd /mnt/c/stm32bluepill-mynewt-sensor
    rustup update
    rustc -V
    ```

    The reported version of `rustc` should be `1.36.0` or later:

    ```
    rustc 1.36.0-nightly (50a0defd5 2019-05-21)
    ```

1.  Enter into the Windows Ubuntu command prompt (not Windows Command Prompt):
    ```
    rustup target add thumbv7m-none-eabi
    rustup component add rls rust-analysis rust-src
    ```

    If you see an error like `error: component 'rls' for target 'x86_64-apple-darwin' is unavailable for download for channel 'nightly'`, enter these commands to select an older working build of RLS (2019-05-22)...

    ```
    rustup override set nightly-2019-05-22
    rustup target add thumbv7m-none-eabi
    rustup component add rls rust-analysis rust-src --toolchain nightly-2019-05-22
    ```

    The above commands should be executed in the `stm32bluepill-mynewt-sensor` folder.

# Install Rust (macOS and Ubuntu)

1.  Install `rustup` according to the instructions at https://rustup.rs

1.  Enter into the command prompt:
    ```
    cd $HOME/stm32bluepill-mynewt-sensor
    rustup update
    rustc -V
    ```

    The reported version of `rustc` should be `1.36.0` or later:

    ```
    rustc 1.36.0-nightly (50a0defd5 2019-05-21)
    ```

1.  Enter into the command prompt:
    ```
    rustup target add thumbv7m-none-eabi
    rustup component add rls rust-analysis rust-src
    ```

    If you see an error like `error: component 'rls' for target 'x86_64-apple-darwin' is unavailable for download for channel 'nightly'`, enter these commands to select an older working build of RLS (2019-05-22)...

    ```
    rustup override set nightly-2019-05-22
    rustup target add thumbv7m-none-eabi
    rustup component add rls rust-analysis rust-src --toolchain nightly-2019-05-22
    ```

    The above commands should be executed in the `stm32bluepill-mynewt-sensor` folder. To find the last successful build of RLS:
    https://rust-lang.github.io/rustup-components-history/
    
# Install Apache Mynewt (Windows, macOS and Ubuntu)

1. Install [Visual Studio Code](https://code.visualstudio.com/) if you haven’t. Launch Visual Studio Code.

1. Click `View → Command Palette`

1. Type `git clone` then press Enter

1. For `Repository URL`, enter

    ```
    https://github.com/lupyuen/stm32bluepill-mynewt-sensor/tree/rust
    ```

    _Note: This is the `rust` branch of the repository that contains Mynewt with Rust support_

1. When prompted to `Select Repository Location…`

    _For Windows:_ Select your `Local Disk C:` drive

    _For macOS and Ubuntu:_ Select your `Home` folder

    If you have previously downloaded `stm32bluepill-mynewt-sensor`, rename the old folder before downloading

    The source code will be downloaded to `C:\stm32bluepill-mynewt-sensor` (Windows) or `$HOME/stm32bluepill-mynewt-sensor` (macOS)

1. When prompted, click `Open Repository` and `Open Workspace`

1. Click `Terminal → Run Task`

1. Select `[0] Install Apache Mynewt`

1. When prompted, click `Continue Without Scanning The Task Output`

1. When prompted, click on the Terminal pane and enter the password from the _"Install Windows Subsystem for Linux"_ steps above. For macOS and Ubuntu, enter your user password.

    The password only needs to be entered once.

1. The setup script will take a few minutes to download and install the build tools.

    When it’s done, we should see `Done!`

    [Windows Setup Script](scripts/install-windows.sh)

    [macOS Setup Script](scripts/install-mac.sh)

    [Ubuntu Setup Script](scripts/install-linux.sh)

1. Exit and restart Visual Studio Code. This activates the installed extensions.

    [Windows VSCode Extensions](scripts/install-ext-windows.cmd)

    [macOS VSCode Extensions](scripts/install-ext-mac.sh)

    [Ubuntu VSCode Extensions](scripts/install-ext-linux.sh)

1. In case of problems, compare your log with the setup log below:

    [Windows Setup Log](logs/install-windows.log)

    [Ubuntu Setup Log](logs/install-linux.log)

# Build and Flash Bootloader and Application (Windows, macOS and Ubuntu)

## _Build Bootloader_

Click 
    `Terminal → Run Task → 
    [1] Build bluepill_boot`

## _Flash Bootloader to Blue Pill_

1. Connect ST-Link to Blue Pill and the USB port

1. Click `Terminal → Run Task → 
[4] Load bluepill_boot`

## _Build Application_ 

1. Click `Terminal → Run Task → 
    [2] Build bluepill_my_sensor`

1. Click `Terminal → Run Task → 
    [3] Image bluepill_my_sensor`

1. [Check this video](https://youtu.be/QTTqRlsiBfk) for the build process

## _Flash Application to Blue Pill_

1. Connect ST-Link to Blue Pill and the USB port

1. Click `Terminal → Run Task → 
[5] Load bluepill_my_sensor`

# Run The Application (Windows, macOS and Ubuntu)

1. Connect ST-Link to Blue Pill and the USB port

1. Click `Debug → Start Debugging`

1. [Check this video](https://youtu.be/Pj3pl6GaztU) for the debug steps

1. To re-run the application after making code changes:

    Click `Terminal → Run Task → 
    [2] Build bluepill_my_sensor`

    Click `Debug → Start Debugging`

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
