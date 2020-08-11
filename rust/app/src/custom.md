# Your Very Own PineTime Firmware... Built by GitLab and GitHub

# Logo Loader

# Custom Firmware

GitLab Web IDE

Languages

Loadable Apps: WebAssembly, Sandbox

Security

apt / npm style repos

Optimisation

Updates

![PineTime Firmware Programming vs Fortnite](https://lupyuen.github.io/images/cloud-title.jpg)

Programming the firmware of our gadgets (like [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime)) has always been cumbersome...

1. Get a proper computer _(Windows tends to be problematic)_

1. Install the right tools and libraries to cross-compile our firmware _(Depends on our operating system)_

1. If the build fails, tweak the build scripts _(It's probably just Windows)_

1. If the build still fails... __We're stuck!__ _(Good Luck!)_

Nowhere as fun as a game like Fortnite!

_Can Firmware Programming be as fun as Fortnite?_

Well Fortnite runs in the Cloud on massive servers...

_Can we build our firmware in the Cloud?_

_In under 2 minutes?_

_Without any computer setup!_

Yes we can!

Today we'll learn [__GitHub Actions__](https://github.com/features/actions) for building [__InfiniTime Firmware__](https://github.com/JF002/Pinetime) for [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) in the GitHub Cloud.

It's __Fully Automated__...

1. __Check in our updated source files__ to GitHub

1. Wait __2 Minutes__

1. Out comes a piping-hot __New Firmware Image__ for testing on PineTime!

_(Feels like a Microwave!)_

We'll make PineTime Programming as enjoyable as Fortnite... But less violent... And in 3D!

# Create a Fork of PineTime Source Files

_(Nope no spoon!)_

1.  __Create a free GitHub Account__ if we haven't got one...

    ▶️ &nbsp; [`github.com`](https://github.com/)

1.  __Browse to the GitHub Repository__ for the PineTime Firmware...

    ▶️ &nbsp; [`github.com/JF002/Pinetime`](https://github.com/JF002/Pinetime)

    Here's the complete Source Code for the InfiniTime Firmware (based on FreeRTOS).

1.  Click the `Fork` button at top right...

    ![Create a fork](https://lupyuen.github.io/images/cloud-fork.png)

1.  This creates a __Fork__ of the PineTime Repository under our GitHub Account...

    ![Created the fork](https://lupyuen.github.io/images/cloud-fork2.png)

    The URL looks like this...
    
    ```
    https://github.com/ACCOUNT_NAME/Pinetime
    ```

1.  The Fork contains __our own copy__ of the entire Source Code for the PineTime Firmware... Ready for us to make any updates!

    GitHub helpfully __tracks updates to our Fork,__ so that one day we may submit a __Pull Request__ to sync our updates (only the useful ones) back to the original PineTime Repository.

    And we may also __Pull Updates__ from the original PineTime Repository and apply them to our Fork.

    That's how we maintain Open Source Projects!

Read on to learn how we add GitHub Actions to our Fork to build the firmware automagically...

# Add GitHub Actions to our Fork

1.  In our Fork on GitHub, click `Actions`

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions.png)

1.  Click `Skip this and set up a workflow yourself`

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions2.png)

1.  GitHub brings us to a page to edit `.github/workflows/main.yml`

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions3.png)

1.  Open a new web browser tab. 

    Browse to this page...

    [`github.com/pinetime-lab/.github/workflows/main.yml`](https://raw.githubusercontent.com/lupyuen/pinetime-lab/master/.github/workflows/main.yml)
    
    Copy the contents of this page. 

1.  Switch back to the earlier page: `.github/workflows/main.yml`

    Paste and overwrite the contents of the file...

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions4.png)

1.  Click `Start Commit` at the right or bottom of the page...

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions5.png)

1.  Click `Commit New File`

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions6.png)

We have just created a __Workflow__... An automated job that will be run by GitHub whenever we update our source files.

If we ever need to edit the Workflow, just browse to this URL...

```
https://github.com/ACCOUNT_NAME/Pinetime/blob/master/.github/workflows/main.yml
```

(Change `ACCOUNT_NAME` to our GitHub Account Name)

Let's change a PineTime source file... And trigger our very first PineTime Firmware Build in the Cloud!

# Modify the PineTime Source Code

We shall modify the source code so that the PineTime Watch Face shows our own special message...

1.  Browse to this URL...

    ```
    https://github.com/ACCOUNT_NAME/Pinetime/blob/master/src/DisplayApp/Screens/Clock.cpp
    ```

    (Change `ACCOUNT_NAME` to our GitHub Account Name)

1.  Click the `Edit` icon at the right...

    ![Edit Source File](https://lupyuen.github.io/images/cloud-edit.png)

1.  Look for the line with `"BPM"` (line 71)...

    ![Edit Source File](https://lupyuen.github.io/images/cloud-edit2.png)

1.  `BPM` is the text that's displayed on the PineTime Watch Face.

    Change `BPM` to our own short message, like `LOVE`...

    ![Edit Source File](https://lupyuen.github.io/images/cloud-edit3.png)

1.  Scroll to the bottom of the page.

    Click `Commit Changes`

    ![Edit Source File](https://lupyuen.github.io/images/cloud-edit4.png)

Guess what?

We have just triggered __Our Very First PineTime Firmware Build In The Cloud!__

(Because the Firmware Build is triggered by any file update)

Let's check the result of our Firmware Build in the Cloud...

# Our First PineTime Firmware Build

(Sorry our first build may fail with an error in `TwiMaster.cpp`... More about this in a while)

1.  Click `Actions` at the top.

    Click the first row that appears: `Update Clock.cpp`

    ![Build Result](https://lupyuen.github.io/images/cloud-result.png)

1.  Click `build` at left...

    ![Build Result](https://lupyuen.github.io/images/cloud-result2.png)

1.  We'll see each step of the firmware building process...

    ![Build Result](https://lupyuen.github.io/images/cloud-result3.png)

1.  Click `Make`

    This shows the messages that were generated by the cross-compiler...

    ![Build Result](https://lupyuen.github.io/images/cloud-result4.png)

If we see this error...

```
/home/runner/work/Pinetime/Pinetime/src/drivers/TwiMaster.cpp:1:10: fatal error: sdk/integration/nrfx/nrfx_log.h: No such file or directory
 #include <sdk/integration/nrfx/nrfx_log.h>
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [src/CMakeFiles/pinetime-app.dir/drivers/TwiMaster.cpp.o] Error 1
```

Browse to...

```
https://github.com/ACCOUNT_NAME/Pinetime/blob/master/src/drivers/TwiMaster.cpp
```

(Change `ACCOUNT_NAME` to our GitHub Account Name)

Edit the first two lines...

```c
#include <sdk/integration/nrfx/nrfx_log.h>
#include <sdk/modules/nrfx/hal/nrf_gpio.h>
```

To...

```c
#include <nrfx_log.h>
#include <nrf_gpio.h>
```

Click `Commit Changes` to save the file.

This triggers a new Firmware Build, which should succeed now.

[Check out my build logs](https://github.com/lupyuen/pinetime-lab/actions?query=workflow%3A%22Build+PineTime+Firmware%22)

# Download and Test Our PineTime Firmware

Now let's download and flash the new firmware to PineTime!

(We assume that our PineTime has been [flashed with the latest firmware](https://github.com/lupyuen/pinetime-updater/blob/master/README.md) that supports wireless firmware updates)

1.  On our Android Phone, launch the Web Browser.

    Browse to this URL to see GitHub Actions for our Fork...

    ```
    https://github.com/ACCOUNT_NAME/Pinetime/actions
    ```

    (Change `ACCOUNT_NAME` to our GitHub Account Name)

1.  Tap on the first row that appears: `Update Clock.cpp`

    Tap `Sign In For Full Log View` at top right.

    Sign in with our GitHub Account.

1.  Tap `Artifacts` at the top.

    Tap `pinetime-mcuboot-app-dfu.zip`

    When the file has been downloaded, tap `Open`

    ![Build Artifact](https://lupyuen.github.io/images/cloud-dfu.jpg)

    The file should appear under `Downloads` like above.

1.  Launch the [nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app.

    Scan for devices and look for `Pinetime-JF`

    Tap `Connect`

    ![Build Artifact](https://lupyuen.github.io/images/cloud-dfu2.jpg)

    Tap on the `DFU` circular icon at the top right.

    DFU means __Device Firmware Update__. We'll be uploading the __DFU Package__ `pinetime-mcuboot-app-dfu.zip` to update the firmware on PineTime.

1.  For File Type, select `Distribution Packet (ZIP)` and tap `OK`

    ![Build Artifact](https://lupyuen.github.io/images/cloud-dfu3.jpg)

    In the Search Box, enter `dfu`

    Our downloaded file `pinetime-mcuboot-app-dfu.zip` should appear.

    Tap on `pinetime-mcuboot-app-dfu.zip`

1.  The nRF Connect app begins transmitting the file to PineTime over Bluetooth LE.

    ![Build Artifact](https://lupyuen.github.io/images/cloud-dfu4.jpg)

    When it's done, it shows `Disconnecting`

1.  PineTime restarts with the new firmware and shows our message "LOVE"!

![PineTime shows some LOVE](https://lupyuen.github.io/images/cloud-love.jpg)

[Watch the video on YouTube](https://youtu.be/_U8oQqzW8Ck)

_Will this work on iPhone?_

Yes, with the iPhone version of the [nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app.

_I have a request..._

If you could... With your kind permission... Please post to Twitter and/or Mastodon a pic of your PineTime with the new firmware.

Tag the post with `#PineTime` so we know that building PineTime Firmware in the Cloud works OK for you. Thanks! :-)

If you're stuck, please chat with us in the PineTime Chatroom...

[PineTime Chatroom on Discord / Matrix / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Set PineTime Date and Time with nRF Connect

To set the date and time on PineTime, we use the [nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app...

1. In nRF Connect, browse for the `Pinetime-JF` device and tap `Connect`

1. Tap on `Menu` → `Configure GATT Server` → `Add Service`

1. Set `Server Configuration` to `Current Time Service`

1. Tap `OK`

PineTime should automatically sync the date and time.

This works only Android, not iPhone. If you can help fix this, please chat with us in the PineTime Chatroom...

[PineTime Chatroom on Discord / Matrix / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Other Options

1.  _Can we edit our files in GitHub without using the web browser?_

    We recommend [__VSCode__](https://code.visualstudio.com/) or [__VSCodium__](https://vscodium.com/) for editing files with [Git Version Control](https://code.visualstudio.com/docs/editor/versioncontrol). (Which works with GitHub files)

    Remember to [Commit any updated files](https://code.visualstudio.com/docs/editor/versioncontrol#_commit) and [Push the Commits](https://code.visualstudio.com/docs/editor/versioncontrol#_remotes) to the `master` Branch to trigger the firmware build.

1.  _Can we build the firmware on our own computers?_

    Follow the instructions in [the firmware building doc](https://github.com/JF002/Pinetime/blob/master/doc/buildAndProgram.md) and the [DFU packaging doc](https://github.com/JF002/Pinetime/blob/master/bootloader/README.md).

    To troubleshoot the build, compare with [my build logs](https://github.com/lupyuen/pinetime-lab/actions?query=workflow%3A%22Build+PineTime+Firmware%22).

1.  _What if we don't wish to make our repos public?_

    Only public repos get GitHub Actions for free... But there's an alternative:

    [Self-Hosted Runners for GitHub Actions](https://docs.github.com/en/actions/hosting-your-own-runners)

1.  _What's in the artifact `pinetime-app.out`?_

    This is the __Standalone PineTime Firmware__... It's self-contained firmware that works without the MCUBoot Bootloader. Which makes it simpler for GDB debugging.

1.  _How do we flash `pinetime-app.out`?_

    Download the artifact `pinetime-app.out` from GitHub Actions.

    We'll get a ZIP file. Extract the PineTime Firmware Image inside: `pinetime-app.out`

    Flash with [__PineTime Updater__](https://github.com/lupyuen/pinetime-updater/blob/master/README.md)...

    -  Run `./run.sh`. Select `Latest Bootloader` to flash the latest bootloader

    -  Then run `./run.sh` again. Select `Downloaded File` and `pinetime-app.out`

    -  Flash to address `0x0`

1.  _Is it really necessary to build the Standalone Firmware `pinetime-app.out`?_

    Nope. To speed up the build, we may comment out the "Make `pinetime-app`" and "Upload Standalone Firmware" steps in the GitHub Actions Workflow.

1.  _Can GitHub Actions build other flavours of PineTime Firmware?_

    Yes! GitHub Actions can build [__RIOT__](https://github.com/lupyuen/pinetime-rust-riot/blob/master/.github/workflows/main.yml), [__Mynewt__](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/.github/workflows/main.yml) and [__wasp-os__](https://github.com/daniel-thompson/wasp-os/pull/53) firmware for PineTime.

# What's Next?

The PineTime Community shall extend this Build Firmware Workflow into a centralised system for maintaining the [__PineTime Community Firmware__](https://github.com/JF002/Pinetime) that will be preloaded at the PineTime Factory.

The centralised [__Continuous Integration__](https://docs.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration) system is helpful because...

1.  It compiles the PineTime Community Firmware source code whenever there are updates.

    And instantly catches any bad code that can't be compiled.

1.  It can run [__Automated Tests__](https://medium.com/@ly.lee/stm32-blue-pill-unit-testing-with-qemu-blue-pill-emulator-9d88002a68b2?source=friends_link&sk=9a9389cdea5828cb48713f963c8f7615) in the Cloud after building the PineTime Community Firmware.

    So we will know rightaway if the firmware won't boot on an emulated PineTime. (Hopefully)

1.  And it can publish __New Firmware Releases__ for the PineTime Community to download... If the Automated Tests pass.

We have a lot to do, please chat with us if you're keen to help...

[PineTime Chatroom on Discord / Matrix / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

And remember to enjoy your PineTime :-)

[Check out my RSS Feed](https://lupyuen.github.io/rss.xml)

# How It Works

(Warning: The topics below are deeply technical... If you're keen please read on!)

Let's look at the GitHub Actions Workflow we used for building PineTime Firmware: [`.github/workflows/main.yml`](https://github.com/lupyuen/pinetime-lab/blob/master/.github/workflows/main.yml)

```yaml
# GitHub Actions Workflow to build FreeRTOS Firmware for PineTime Smart Watch
# See https://lupyuen.github.io/pinetime-rust-mynewt/articles/cloud
# Based on https://github.com/JF002/Pinetime/blob/master/doc/buildAndProgram.md
# and https://github.com/JF002/Pinetime/blob/master/bootloader/README.md

# Name of this Workflow
name: Build PineTime Firmware

# When to run this Workflow...
on:

  # Run this Workflow when files are updated (Pushed) in the "master" Branch
  push:
    branches: [ master ]
    
  # Also run this Workflow when a Pull Request is created or updated in the "master" Branch
  pull_request:
    branches: [ master ]
```

Here we see the conditions that will trigger our Workflow...

1. When files are __updated (or Pushed)__ in the `master` Branch

1. When a __Pull Request is created or updated__ in the `master` Branch

[More details](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#pull_request)

Next we specify which Operating System GitHub should use to execute the Workflow Steps...

```yaml
# Steps to run for the Workflow
jobs:
  build:

    # Run these steps on Ubuntu
    runs-on: ubuntu-latest

    steps:
      ...
```

This asks GitHub to allocate a free Virtual Machine (Docker Container) to build our firmware, based on Ubuntu 18.04.

We're using Ubuntu, but GitHub supports Windows and macOS as well.

[More details](https://docs.github.com/en/actions/reference/virtual-environments-for-github-hosted-runners)

After that we specify the steps to be executed for our Workflow...

## Install `cmake`

The steps for building PineTime Firmware are based on [the firmware building doc](https://github.com/JF002/Pinetime/blob/master/doc/buildAndProgram.md) and the [DFU packaging doc](https://github.com/JF002/Pinetime/blob/master/bootloader/README.md).


We use a popular tool called [`cmake`](https://cmake.org/). (It's like an evolved `make`)

Here's how we install `cmake`...

```yaml
    - name: Install cmake
      uses: lukka/get-cmake@v3.18.0
```

_Why do we need to install build tools like `cmake`?_

Because GitHub only provides bare bones Ubuntu with simple command-line tools like `make`.

For special tools like `cmake`, we'll have to install ourselves.

_What's `get-cmake`?_

That's a GitHub Action provided by the community for [installing `cmake`](https://github.com/marketplace/actions/get-cmake)

[Browse the available GitHub Actions](https://github.com/marketplace?type=actions)

## Check Cache for Embedded Arm Toolchain

Our Ubuntu Virtual Machine in the GitHub Cloud is based on the Intel x64 platform... But we're building firmware for PineTime, which is based on Arm Cortex-M4.

To do that, we need to install a cross-compiler: [__Embedded Arm Toolchain__](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm) `arm-none-eabi-gcc`

We'll install this in the next step, but first we check whether the toolchain is in our cache...

```yaml
    - name: Check cache for Embedded Arm Toolchain arm-none-eabi-gcc
      id:   cache-toolchain
      uses: actions/cache@v2
      env:
        cache-name: cache-toolchain
      with:
        path: ${{ runner.temp }}/arm-none-eabi
        key:  ${{ runner.os }}-build-${{ env.cache-name }}
        restore-keys: ${{ runner.os }}-build-${{ env.cache-name }}
```

_Why cache the Embedded Arm Toolchain?_

The [Embedded Arm Toolchain](https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2) is a huge 102 MB download (compressed).

Every time GitHub builds our firmware, it creates a fresh new empty Virtual Machine.

(So that our firmware builds may be reproduced consistently... And for security too)

GitHub will take roughly a minute to download and unpack the toolchain... Unless we cache it.

```yaml
    - name: Check cache for Embedded Arm Toolchain arm-none-eabi-gcc
      id:   cache-toolchain
      uses: actions/cache@v2
```

The [`actions/cache`](https://docs.github.com/en/actions/configuring-and-managing-workflows/caching-dependencies-to-speed-up-workflows) GitHub Action lets us cache the toolchain for future builds.

We can have multiple caches. Here's our cache for the toolchain...

```yaml
      env:
        cache-name: cache-toolchain
```

Next we tell GitHub what to cache...

```yaml
      with:
        path: ${{ runner.temp }}/arm-none-eabi
        key:  ${{ runner.os }}-build-${{ env.cache-name }}
        restore-keys: ${{ runner.os }}-build-${{ env.cache-name }}
```

Given these build settings...

```bash
runner.temp    = /home/runner/work/_temp
runner.os      = Linux
env.cache-name = cache-toolchain
```

This means...

-  GitHub shall cache the temporary toolchain folder `/home/runner/work/_temp/arm-none-eabi`

    (We'll download the toolchain to this folder in the next step)

- The unique cache key for our toolchain cache shall be `Linux-build-cache-toolchain`

- In future builds, GitHub shall attempt to restore the cache for `Linux-build-cache-toolchain` into our toolchain folder `/home/runner/work/_temp/arm-none-eabi`

## Install Embedded Arm Toolchain

Now we download and unpack the Embedded Arm Toolchain into the temporary toolchain folder `/home/runner/work/_temp/arm-none-eabi`...

```yaml
    - name: Install Embedded Arm Toolchain arm-none-eabi-gcc
      if:   steps.cache-toolchain.outputs.cache-hit != 'true'  # Install toolchain if not found in cache
      uses: fiam/arm-none-eabi-gcc@v1.0.2
      with:
        # GNU Embedded Toolchain for Arm release name, in the V-YYYY-qZ format (e.g. "9-2019-q4")
        release: 8-2019-q3
        # Directory to unpack GCC to. Defaults to a temporary directory.
        directory: ${{ runner.temp }}/arm-none-eabi
```

We use the community GitHub Action [`fiam/arm-none-eabi-gcc`](https://github.com/marketplace/actions/arm-none-eabi-gcc) to do this. So easy!

_Why is there a condition for the step?_

```yaml
      # Install toolchain if not found in cache
      if:   steps.cache-toolchain.outputs.cache-hit != 'true'
```

This says that GitHub shall download the toolchain only if the previous step `cache-toolchain` couldn't find an existing cache for the toolchain.

Huge downloads and reinstallation averted... So neat!

_What software is preinstalled on the GitHub Virtual Machine?_

[Check out the preinstalled software on Ubuntu 18.04 for GitHub Actions](https://github.com/actions/virtual-environments/blob/ubuntu18/20200726.1/images/linux/Ubuntu1804-README.md)

## Check Cache for nRF5 SDK

Next we download the [nRF5 SDK](https://www.nordicsemi.com/Software-and-tools/Software/nRF5-SDK) by Nordic Semiconductor.

The SDK is needed for building PineTime Firmware because PineTime is based on the [nRF52832 Microcontroller](https://infocenter.nordicsemi.com/pdf/nRF52832_PS_v1.0.pdf).

Before downloading and unpacking the SDK into `/home/runner/work/_temp/nrf5_sdk`, we check whether the cache exists for the unique cache key `Linux-build-cache-nrf5sdk`...

```yaml
    - name: Check cache for nRF5 SDK
      id:   cache-nrf5sdk
      uses: actions/cache@v2
      env:
        cache-name: cache-nrf5sdk
      with:
        path: ${{ runner.temp }}/nrf5_sdk
        key:  ${{ runner.os }}-build-${{ env.cache-name }}
        restore-keys: ${{ runner.os }}-build-${{ env.cache-name }}
```

## Install nRF5 SDK

_Can we download and install packages into the GitHub Virtual Machine without using a GitHub Action?_

Yes we can, through the Ubuntu command line...

```yaml
    - name: Install nRF5 SDK
      if:   steps.cache-nrf5sdk.outputs.cache-hit != 'true'  # Install SDK if not found in cache
      run:  |
        cd ${{ runner.temp }}
        curl https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip -o nrf5_sdk.zip
        unzip nrf5_sdk.zip
        mv nRF5_SDK_15.3.0_59ac345 nrf5_sdk
```

This expands to...

```bash
cd /home/runner/work/_temp
curl \
  https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.3.0_59ac345.zip \
  -o nrf5_sdk.zip
unzip nrf5_sdk.zip
mv nRF5_SDK_15.3.0_59ac345 nrf5_sdk
```

Here we call `curl` to download the [nRF5 SDK](https://www.nordicsemi.com/Software-and-tools/Software/nRF5-SDK) by Nordic Semiconductor.

We unpack the SDK into `/home/runner/work/_temp/nrf5_sdk`, which is cached by the previous step.

```yaml
      if:   steps.cache-nrf5sdk.outputs.cache-hit != 'true'  # Install SDK if not found in cache
```

Again, GitHub shall download the SDK only if the cache couldn't be found.

GitHub will remove any cache entries that have not been accessed in over 7 days.

## Install Adafruit `nrfutil` Library

We install the Adafruit `nrfutil` Library to create the DFU Package for flashing over Bluetooth LE...

```yaml
    - name: Install adafruit-nrfutil
      run:  |
        pip3 install --user wheel
        pip3 install --user setuptools
        pip3 install --user adafruit-nrfutil
```

Yes `pip3` is available for installing Python 3 packages.

But in the GitHub Ubuntu environment, the installed Python packages are not accessible via the default `PATH`

In a while we'll see that they are accessible via `~/.local/bin/...`

## Checkout Source Files

Now we fetch a complete set of source files from our Fork...

```yaml
    - name: Checkout source files
      uses: actions/checkout@v2
```

The [`actions/checkout`](https://docs.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow#using-the-checkout-action) GitHub Action copies the source files into `/home/runner/work/Pinetime/Pinetime`

## Show Files

Let's take a peek at the environment variables and the files that have been checked out...

```yaml
    - name: Show files
      run:  set ; pwd ; ls -l
```

The current directory `pwd` is shown as...

```
/home/runner/work/Pinetime/Pinetime
```

The list of files and folders in that directory...

```
total 48
-rw-r--r--  1 runner docker 2194 Jul 26 14:39 CMakeLists.txt
-rw-r--r--  1 runner docker 5079 Jul 26 14:39 README.md
drwxr-xr-x  3 runner docker 4096 Jul 26 14:39 bootloader
drwxr-xr-x  3 runner docker 4096 Jul 26 14:39 cmake-nRF5x
drwxr-xr-x  3 runner docker 4096 Jul 26 14:39 doc
-rw-r--r--  1 runner docker 2952 Jul 26 14:39 gcc_nrf52-mcuboot.ld
-rw-r--r--  1 runner docker 2952 Jul 26 14:39 gcc_nrf52.ld
drwxr-xr-x  4 runner docker 4096 Jul 26 14:39 images
-rw-r--r--  1 runner docker 4475 Jul 26 14:39 nrf_common.ld
drwxr-xr-x 10 runner docker 4096 Jul 26 14:39 src
```

Check the section "Environment Variables" below for the complete list of environment variables.

## CMake

Now that we have `cmake` installed and the complete set of source files, let's start building the firmware...

```yaml
    - name: CMake
      run:  mkdir -p build && cd build && cmake -DARM_NONE_EABI_TOOLCHAIN_PATH=${{ runner.temp }}/arm-none-eabi -DNRF5_SDK_PATH=${{ runner.temp }}/nrf5_sdk -DUSE_OPENOCD=1 ../
```

This expands to...

```bash
mkdir -p build
cd build
cmake \
  -DARM_NONE_EABI_TOOLCHAIN_PATH=/home/runner/work/_temp/arm-none-eabi \
  -DNRF5_SDK_PATH=/home/runner/work/_temp/nrf5_sdk \
  -DUSE_OPENOCD=1 \
  ../
```

We call `cmake` passing the locations of the Embedded Arm Toolchain and the nRF5 SDK. 

This is exactly as prescribed by [the build doc](https://github.com/JF002/Pinetime/blob/master/doc/buildAndProgram.md).

## Make DFU Firmware `pinetime-mcuboot-app`

```yaml
    - name: Make pinetime-mcuboot-app
      run:  |
        cd build
        make pinetime-mcuboot-app
```

This generates the PineTime Firmware File `pinetime-mcuboot-app.out`, as shown in the log...

```
[100%] Linking CXX executable pinetime-mcuboot-app.out
post build steps for pinetime-mcuboot-app
   text	   data	    bss	    dec	    hex	filename
 238012	    772	  35784	 274568	  43088	pinetime-mcuboot-app.out
```

This says...

- Firmware will occupy 233 KB of Flash ROM for compiled machine code and data (`text`, `data`)

- Firmware will need 34 KB of RAM for storing global static variables (`bss`)

_If the build fails, can we see the complete list of options passed to the cross-compiler?_

Add the `--trace` option like so...

```bash
# For Debugging Builds: Add "--trace" to see details.
make --trace pinetime-mcuboot-app
```

_The log shows that the `make` step takes 2.5 minutes to execute. Can we compile faster?_

Add the `-j` option like so...

```bash
# For Faster Builds: Add "make" option "-j"
make -j pinetime-mcuboot-app
```

This runs a parallel build with multiple processes. It shaves about 30 seconds off the build time.

We don't recommend adding `-j` for normal builds because it becomes harder to spot the compiler error.

## Create Firmware Image

PineTime uses the [__MCUBoot Bootloader__](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot) to do nifty tricks... Like rolling back the PineTime firmware to the previous version if the new one fails to start.

To do this the MCUBoot Bootloader needs our firmware to be formatted in a way that it understands.

We call this format the __MCUBoot Firmware Image__. We create the Firmware Image like so...

```yaml
    - name: Create firmware image
      run:  |
        ${{ runner.temp }}/mcuboot/scripts/imgtool.py create --align 4 --version 1.0.0 --header-size 32 --slot-size 475136 --pad-header build/src/pinetime-mcuboot-app.bin build/src/pinetime-mcuboot-app-img.bin
        ${{ runner.temp }}/mcuboot/scripts/imgtool.py verify build/src/pinetime-mcuboot-app-img.bin
```

The above expands to...

```bash
  /home/runner/work/_temp/mcuboot/scripts/imgtool.py create --align 4 --version 1.0.0 --header-size 32 --slot-size 475136 --pad-header build/src/pinetime-mcuboot-app.bin build/src/pinetime-mcuboot-app-img.bin

  /home/runner/work/_temp/mcuboot/scripts/imgtool.py verify build/src/pinetime-mcuboot-app-img.bin
```

This is prescribed by the [DFU packaging doc](https://github.com/JF002/Pinetime/blob/master/bootloader/README.md).

`imgtool` comes from the MCUBoot Bootloader, as explained here...

["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)

## Create DFU Package

We'll be using the nRF Connect mobile app to transmit a DFU Package to update PineTime's firmware.

We wrap up the Firmware Image (from the previous step) into a DFU Package by calling `adafruit-nrfutil `...

```yaml
    - name: Create DFU package
      run:  |
        ~/.local/bin/adafruit-nrfutil dfu genpkg --dev-type 0x0052 --application build/src/pinetime-mcuboot-app-img.bin build/src/pinetime-mcuboot-app-dfu.zip
        unzip -v build/src/pinetime-mcuboot-app-dfu.zip
        # Unzip the package because Upload Artifact will zip up the files
        unzip build/src/pinetime-mcuboot-app-dfu.zip -d build/src/pinetime-mcuboot-app-dfu
```

The above expands to...

```bash
  ~/.local/bin/adafruit-nrfutil dfu genpkg --dev-type 0x0052 --application build/src/pinetime-mcuboot-app-img.bin build/src/pinetime-mcuboot-app-dfu.zip

  # Display the contents of the package
  unzip -v build/src/pinetime-mcuboot-app-dfu.zip

  # Unzip the package because Upload Artifact will zip up the files
  unzip build/src/pinetime-mcuboot-app-dfu.zip -d build/src/pinetime-mcuboot-app-dfu
```

This creates the DFU Package `pinetime-mcuboot-app-dfu.zip`.

The DFU Package contains 3 files...

```
Archive:  build/src/pinetime-mcuboot-app-dfu.zip
 Length   Method    Size  Cmpr    Date    Time   CRC-32   Name
--------  ------  ------- ---- ---------- ----- --------  ----
      14  Stored       14   0% 2020-07-30 06:47 8cf6f003  pinetime-mcuboot-app-img.dat
     498  Stored      498   0% 2020-07-30 06:47 b0b12660  manifest.json
  238856  Stored   238856   0% 2020-07-30 06:47 ded98812  pinetime-mcuboot-app-img.bin
--------          -------  ---                            -------
  239368           239368   0%                            3 files
```

_Why did we unzip the DFU Package?_

Let's say we didn't unzip the DFU Package... And we pass `pinetime-mcuboot-app-dfu.zip` to GitHub Actions to store as an Arfitact for downloading.

GitHub Actions __always__ zips up artifacts for downloading... And we'll end up with a DFU Package that's __zipped twice!__

nRF Connect doesn't like double-zipped DFU Packages.

So to work around this issue, we unzip the DFU Package and pass the 3 files inside to be stored as an Artifact.

GitHub Actions will gladly zip up the 3 files to create our DFU Package.

## Upload DFU Package

GitHub will wipe out our entire Virtual Machine and the files inside (like Langoliers)... So we need to save the PineTime DFU Package `pinetime-mcuboot-app-dfu.zip`

```yaml
    - name: Upload DFU package
      uses: actions/upload-artifact@v2
      with:
        name: pinetime-mcuboot-app-dfu.zip
        path: build/src/pinetime-mcuboot-app-dfu/*
```

The [`actions/upload-artifact`](https://docs.github.com/en/actions/configuring-and-managing-workflows/persisting-workflow-data-using-artifacts) GitHub Action saves the PineTime DFU Package `pinetime-mcuboot-app-dfu.zip` as an __Artifact__ for us to download and flash to PineTime.

Remember that this path contains 3 files...

```
        path: build/src/pinetime-mcuboot-app-dfu/*
```

So this step will zip up the 3 files to create our DFU Package `pinetime-mcuboot-app-dfu.zip`

## Make Standalone Firmware `pinetime-app`

Our Workflow also creates the __Standalone PineTime Firmware__... It's self-contained firmware that runs without the MCUBoot Bootloader. Which makes it simpler for GDB debugging.

```yaml
    - name: Make pinetime-app
      run:  |
        cd build
        make pinetime-app
```

This generates the PineTime Firmware File `pinetime-app.out`, as shown in the log...

```
[100%] Linking CXX executable pinetime-app.out
post build steps for pinetime-app
  text	   data	    bss	    dec	    hex	filename
238012	    772	  35784	 274568	  43088	pinetime-app.out
```

## Upload Standalone Firmware

This step uploads the Standalone Firmware as an Artifact for us to download...

```yaml
    - name: Upload standalone firmware
      uses: actions/upload-artifact@v2
      with:
        name: pinetime-app.out
        path: build/src/pinetime-app.out
```

To flash the Standalone Firmware to PineTime, check the instructions below.

_Why is the `pinetime-app.out` firmware 6.4 MB in size when the build log shows that the cross-compiler output (`text`) is 233 KB?_

Because `pinetime-app.out` is an [__ELF File__](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format). It contains the firmware image as well as the debugging symbols.

(Useful for a debugger like GDB)

## Find Output

For curiosity, let's discover what other outputs are generated during the PineTime Firmware Build...

```yaml
    - name: Find output
      run:  |
        find . -name "pinetime-app.*" -ls
        find . -name "pinetime-mcuboot-app.*" -ls
```

Some of these files may be useful for troubleshooting our firmware (like the Linker Maps `*.map`)...

```
  1327374    656 -rw-r--r--   1 runner   docker     671691 Jul 30 06:50 ./build/src/pinetime-app.hex
  1327372   6504 -rwxr-xr-x   1 runner   docker    6740720 Jul 30 06:50 ./build/src/pinetime-app.out
  1326257      4 drwxr-xr-x  11 runner   docker       4096 Jul 30 06:48 ./build/src/CMakeFiles/pinetime-app.dir
  1327371   5004 -rw-r--r--   1 runner   docker    5122576 Jul 30 06:50 ./build/src/pinetime-app.map
  1327373    236 -rwxr-xr-x   1 runner   docker     238784 Jul 30 06:50 ./build/src/pinetime-app.bin
  1326403      4 drwxr-xr-x  11 runner   docker       4096 Jul 30 06:45 ./build/src/CMakeFiles/pinetime-mcuboot-app.dir
  1326990    236 -rwxr-xr-x   1 runner   docker     238784 Jul 30 06:47 ./build/src/pinetime-mcuboot-app.bin
  1326989   6504 -rwxr-xr-x   1 runner   docker    6740728 Jul 30 06:47 ./build/src/pinetime-mcuboot-app.out
  1326988   5304 -rw-r--r--   1 runner   docker    5427760 Jul 30 06:47 ./build/src/pinetime-mcuboot-app.map
  1326991    656 -rw-r--r--   1 runner   docker     671708 Jul 30 06:47 ./build/src/pinetime-mcuboot-app.hex
```

## Caching At The End

Here's a tip about the caches we have created for the Embedded Arm Toolchain and the nRF5 SDK...

```yaml
# Embedded Arm Toolchain and nRF5 SDK will only be cached if the build succeeds.
# So make sure that the first build always succeeds, e.g. comment out the "Make" step.
```

__The files get cached only if the build succeeds__

If the first few builds fail (say due to coding errors), the files will never get cached. And restarting the build becomes painfully slow.

Therefore it's good to tweak the Workflow to make sure that the first build always succeeds... Like commenting out the `make` section.

Subsequent builds will be a lot faster with the caching.

And that's how we build PineTime Firmware in the Cloud!

[GitHub Actions Workflow Syntax](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)

# Environment Variables

This step in our GitHub Actions Workflow...

```yaml
    - name: Show files
      run:  set ; pwd ; ls -l
```

Shows these environment variables...

```bash
AGENT_TOOLSDIRECTORY=/opt/hostedtoolcache
ANDROID_HOME=/usr/local/lib/android/sdk
ANDROID_SDK_ROOT=/usr/local/lib/android/sdk
ANT_HOME=/usr/share/ant
AZURE_EXTENSION_DIR=/opt/az/azcliextensions
BASH=/bin/bash
lquote:extquote:force_fignore:hostcomplete:interactive_comments:progcomp:p
BASH_ALIASES=()
BASH_ARGC=()
BASH_ARGV=()
BASH_CMDS=()
BASH_LINENO=([0]="0")
BASH_SOURCE=([0]="/home/runner/work/_temp/a3bba1d.sh")
BASH_VERSINFO=([0]="4" [1]="4" [2]="20" [3]="1" [4]="release" [5]
BASH_VERSION='4.4.20(1)-release'
BOOST_ROOT_1_69_0=/opt/hostedtoolcache/boost/1.69.0/x64
BOOST_ROOT_1_72_0=/opt/hostedtoolcache/boost/1.72.0/x64
CHROMEWEBDRIVER=/usr/local/share/chrome_driver
CHROME_BIN=/usr/bin/google-chrome
CI=true
CONDA=/usr/share/miniconda
DEBIAN_FRONTEND=noninteractive
DEPLOYMENT_BASEPATH=/opt/runner
DIRSTACK=()
DOTNET_NOLOGO='"1"'
DOTNET_SKIP_FIRST_TIME_EXPERIENCE='"1"'
EUID=1001
GECKOWEBDRIVER=/usr/local/share/gecko_driver
GITHUB_ACTION=run2
GITHUB_ACTIONS=true
GITHUB_ACTOR=lupyuen
GITHUB_API_URL=https://api.github.com
GITHUB_BASE_REF=
GITHUB_EVENT_NAME=push
GITHUB_EVENT_PATH=/home/runner/work/_temp/_github_workflow/event.json
GITHUB_GRAPHQL_URL=https://api.github.com/graphql
GITHUB_HEAD_REF=
GITHUB_JOB=build
GITHUB_REF=refs/heads/master
GITHUB_REPOSITORY=AppKaki/Pinetime
GITHUB_REPOSITORY_OWNER=AppKaki
GITHUB_RUN_ID=183212738
GITHUB_RUN_NUMBER=2
GITHUB_SERVER_URL=https://github.com
GITHUB_SHA=bce10a451e6cef08c30b1d6ac297e1f50cf57bf3
GITHUB_WORKFLOW='Build PineTime Firmware'
GITHUB_WORKSPACE=/home/runner/work/Pinetime/Pinetime
GOROOT=/opt/hostedtoolcache/go/1.14.4/x64
GOROOT_1_11_X64=/opt/hostedtoolcache/go/1.11.13/x64
GOROOT_1_12_X64=/opt/hostedtoolcache/go/1.12.17/x64
GOROOT_1_13_X64=/opt/hostedtoolcache/go/1.13.12/x64
GOROOT_1_14_X64=/opt/hostedtoolcache/go/1.14.4/x64
GRADLE_HOME=/usr/share/gradle
GROUPS=()
HOME=/home/runner
HOMEBREW_CELLAR='"/home/linuxbrew/.linuxbrew/Cellar"'
HOMEBREW_PREFIX='"/home/linuxbrew/.linuxbrew"'
HOMEBREW_REPOSITORY='"/home/linuxbrew/.linuxbrew/Homebrew"'
HOSTNAME=fv-az20
HOSTTYPE=x86_64
IFS=$' \t\n'
INVOCATION_ID=cc632305776e4c49848d4644a457d167
ImageOS=ubuntu18
ImageVersion=20200717.1
JAVA_HOME=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64
JAVA_HOME_11_X64=/usr/lib/jvm/adoptopenjdk-11-hotspot-amd64
JAVA_HOME_12_X64=/usr/lib/jvm/adoptopenjdk-12-hotspot-amd64
JAVA_HOME_7_X64=/usr/lib/jvm/zulu-7-azure-amd64
JAVA_HOME_8_X64=/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64
JOURNAL_STREAM=9:31251
LANG=C.UTF-8
LEIN_HOME=/usr/local/lib/lein
LEIN_JAR=/usr/local/lib/lein/self-installs/leiningen-2.9.4-standalone.jar
M2_HOME=/usr/share/apache-maven-3.6.3
MACHTYPE=x86_64-pc-linux-gnu
OPTERR=1
OPTIND=1
OSTYPE=linux-gnu
PATH=/home/runner/work/_temp/arm-none-eabi/bin:/home/runner/work/_temp/-x86_64/bin/:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/in:/home/runner/.config/composer/vendor/bin:/home/runner/.dotnet/tools://local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
PERFLOG_LOCATION_SETTING=RUNNER_PERFLOG
POWERSHELL_DISTRIBUTION_CHANNEL=GitHub-Actions-ubuntu18
PPID=2451
PS4='+ '
PWD=/home/runner/work/Pinetime/Pinetime
RUNNER_OS=Linux
RUNNER_PERFLOG=/home/runner/perflog
RUNNER_TEMP=/home/runner/work/_temp
RUNNER_TOOL_CACHE=/opt/hostedtoolcache
RUNNER_TRACKING_ID=github_3a45354c-437f-42c1-b8fb-cff7fa3cf2a0
RUNNER_USER=runner
RUNNER_WORKSPACE=/home/runner/work/Pinetime
SELENIUM_JAR_PATH=/usr/share/java/selenium-server-standalone.jar
SHELL=/bin/bash
SHELLOPTS=braceexpand:errexit:hashall:interactive-comments
SHLVL=1
SWIFT_PATH=/usr/share/swift/usr/bin
TERM=dumb
UID=1001
USER=runner
VCPKG_INSTALLATION_ROOT=/usr/local/share/vcpkg
_=/bin/bash
```