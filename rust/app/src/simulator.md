# Preview PineTime Watch Faces in your Web Browser with WebAssembly

![Custom PineTime Watch Face created in C++ by SravanSenthiln1: PineTime Watch Face Simulator vs Real PineTime](https://lupyuen.github.io/images/pinetime-simulator.png)

_Custom PineTime Watch Face created in C++ by [SravanSenthiln1](https://twitter.com/SravanSenthiln1): PineTime Watch Face Simulator vs Real PineTime_

TODO

Today we'll learn [__GitHub Actions__](https://github.com/features/actions) for building [__InfiniTime Simulator__](https://github.com/JF002/Pinetime) for [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) in the GitHub Cloud.

# Create a Fork of PineTime Source Files

_(Nope no knife!)_

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

Read on to learn how we add GitHub Actions to our Fork to preview our Custom Watch Face automagically...

# Enable GitHub Pages

1.  In our Fork on GitHub, click `...` and `Settings` at top right

    ![GitHub Settings](https://lupyuen.github.io/images/simulator-settings.png)

1.  Scroll down the `Settings` page (`Options` tab) and look for __GitHub Pages__

1.  Set `Branch` to `master`

    Set the folder to `docs`

    Click `Save`

    ![GitHub Pages](https://lupyuen.github.io/images/simulator-pages.png)

# Add GitHub Actions to our Fork

1.  In our Fork on GitHub, click `Actions` at the top bar

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions.png)

1.  Click `Skip this and set up a workflow yourself`

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions2.png)

1.  GitHub brings us to a page to edit `.github/workflows/main.yml`

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions3.png)

1.  Change `main.yml` to `simulate.yml`

    ![Rename to main.yml to simulate.yml Pages](https://lupyuen.github.io/images/simulator-rename.png)

1.  Open a new web browser tab. 

    Browse to this page...

    [`github.com/pinetime-lab/.github/workflows/simulate.yml`](https://raw.githubusercontent.com/lupyuen/pinetime-lab/master/.github/workflows/simulate.yml)
    
    Copy the contents of this page. 

1.  Switch back to the earlier page: `.github/workflows/simulate.yml`

    Paste and overwrite the contents of the file...

    ![GitHub Actions](https://lupyuen.github.io/images/simulator-actions.png)

1.  Click `Start Commit` at the right or bottom of the page...

    ![GitHub Actions](https://lupyuen.github.io/images/cloud-actions5.png)

1.  Click `Commit New File`

    ![GitHub Actions](https://lupyuen.github.io/images/simulator-actions2.png)

We have just created a __Workflow__... An automated job that will be run by GitHub whenever we update our source files.

If we ever need to edit the Workflow, just browse to this URL...

```
https://github.com/ACCOUNT_NAME/Pinetime/blob/master/.github/workflows/simulate.yml
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

We have just triggered __Our Very First PineTime Simulator Build In The Cloud!__

(Because the Simulator Build is triggered by any file update)

Let's check the result of our Firmware Build in the Cloud...

[Check out this article to learn more about Clock.cpp](https://wiki.pine64.org/index.php?title=PineTime_Custom_Watchface_Tutorial)

# Our First PineTime Simulator Build

1.  Click `Actions` at the top.

    Click the first row that says: `Update Clock.cpp - Simulate PineTime Firmware`

    (Make sure it's `Simulate PineTime Firmware` not `Build PineTime Firmware`)

    ![Build Result](https://lupyuen.github.io/images/simulator-result.png)

1.  Click `build` at left...

    ![Build Result](https://lupyuen.github.io/images/simulator-result2.png)

1.  We'll see each step of the firmware building process...

    ![Build Result](https://lupyuen.github.io/images/simulator-result3.png)

1.  Click `Build LVGL for WebAssembly`

    This shows the messages that were generated by the WebAssembly Compiler (emscripten)...

    ![Build Result](https://lupyuen.github.io/images/simulator-result4.png)

[Check out my build logs](https://github.com/lupyuen/pinetime-lab/actions?query=workflow%3A%22Build+PineTime+Firmware%22)

# Preview our PineTime Watch Face

1.  On our computer or mobile phone, launch the Web Browser.

1.  Browse to this URL to see PineTime Simulator for our Fork...

    ```
    https://ACCOUNT_NAME.github.io/Pinetime
    ```

    (Change `ACCOUNT_NAME` to our GitHub Account Name)

    ![Custom PineTime Watch Face created in C++ by SravanSenthiln1: PineTime Watch Face Simulator vs Real PineTime](https://lupyuen.github.io/images/pinetime-simulator.png)

1.  If we are happy with the Watch Face, we may __flash the built firmware__ to PineTime over Bluetooth. See ["Test Our PineTime Fimware"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/cloud#download-and-test-our-pinetime-firmware)

    We will need to install the GitHub Actions Workflow for building the PineTime Firmware: [`.github/workflows/main.yml`](https://github.com/lupyuen/pinetime-lab/blob/master/.github/workflows/main.yml)

_I have a request..._

If you could... With your kind permission... Please post to Twitter and/or Mastodon a pic of your PineTime Simulator with the new Watch Face.

Tag the post with `#PineTime` so we know that simulating PineTime Firmware in the Cloud works OK for you. Thanks! :-)

If you're stuck, please chat with us in the PineTime Chatroom...

[PineTime Chatroom on Discord / Matrix / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Other Options

TODO

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

TODO

1. __Show date and time__, current and selected

1. __Accept Touch Input__ for LVGL

1. __Convert `Clock.cpp` from C++ to Rust__ with [`lvgl-rs`](https://github.com/rafaelcaricio/lvgl-rs)

1. Allow PineTime Watch Faces to be __built online in Rust with online preview__

    Like with WebAssembly Studio: https://webassembly.studio/

We have a lot to do, please chat with us if you're keen to help...

[PineTime Chatroom on Discord / Matrix / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

And remember to enjoy your PineTime :-)

[Check out my RSS Feed](https://lupyuen.github.io/rss.xml)

# How It Works

(Warning: The topics below are deeply technical... If you're keen please read on!)

Let's look at the GitHub Actions Workflow we used for previewing PineTime Watch Faces: [`.github/workflows/simulate.yml`](https://github.com/lupyuen/pinetime-lab/blob/master/.github/workflows/simulate.yml)

TODO

```yaml
# GitHub Actions Workflow to build PineTime Watch Face Simulator with LVGL and WebAssembly
# See https://github.com/AppKaki/lvgl-wasm/blob/master/README.md 
# and https://lupyuen.github.io/pinetime-rust-mynewt/articles/cloud

# Name of this Workflow
name: Simulate PineTime Firmware

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

## Checkout Source Files

```yaml
    steps:
    - uses: actions/checkout@v2
```

TODO

## Check Cache for emscripten

```yaml
    - name: Check cache for emscripten
      id:   cache-emsdk
      uses: actions/cache@v2
      env:
        cache-name: cache-emsdk
      with:
        path: /tmp/emsdk
        key:  ${{ runner.os }}-build-${{ env.cache-name }}
        restore-keys: ${{ runner.os }}-build-${{ env.cache-name }}
```

TODO

## Install emscripten

```yaml
    - name: Install emscripten
      if:   steps.cache-emsdk.outputs.cache-hit != 'true'  # Install emscripten if not found in cache
      run:  |
        # Based on https://emscripten.org/docs/getting_started/downloads.html
        cd /tmp

        # Get the emsdk repo
        git clone https://github.com/emscripten-core/emsdk.git

        # Enter that directory
        cd emsdk

        # Download and install the latest SDK tools.
        ./emsdk install latest

        # Make the "latest" SDK "active" for the current user. (writes .emscripten file)
        ./emsdk activate latest

        # Activate PATH and other environment variables in the current terminal
        source ./emsdk_env.sh

        # Show version
        emcc --version
        emcc --version        
```

TODO

## Check Cache for wabt

```yaml
    - name: Check cache for wabt
      id:   cache-wabt
      uses: actions/cache@v2
      env:
        cache-name: cache-wabt
      with:
        path: /tmp/wabt
        key:  ${{ runner.os }}-build-${{ env.cache-name }}
        restore-keys: ${{ runner.os }}-build-${{ env.cache-name }}
```

TODO

## Install wabt

```yaml
    - name: Install wabt
      if:   steps.cache-wabt.outputs.cache-hit != 'true'  # Install wabt if not found in cache
      run:  |
        cd /tmp
        git clone --recursive https://github.com/WebAssembly/wabt
        cd wabt
        mkdir build
        cd build
        cmake ..
        cmake --build .
```

TODO

## Checkout LVGL for WebAssembly

```yaml
    - name: Checkout LVGL for WebAssembly
      run:  |
        cd /tmp
        git clone https://github.com/AppKaki/lvgl-wasm
```

TODO

## Copy Watch Face Clock.cpp to LVGL for WebAssembly

```yaml
    - name: Copy Watch Face Clock.cpp to LVGL for WebAssembly
      run:  |
        cp src/DisplayApp/Screens/Clock.cpp /tmp/lvgl-wasm/clock
```

TODO

## Build LVGL for WebAssembly

```yaml
    - name: Build LVGL for WebAssembly
      run:  |
        # Add emscripten and wabt to the PATH
        source /tmp/emsdk/emsdk_env.sh
        export PATH=$PATH:/tmp/wabt/build

        # Build LVGL app: wasm/lvgl.html, lvgl.js, lvgl.wasm
        cd /tmp/lvgl-wasm
        wasm/lvgl.sh
```

TODO

## Show Files

```yaml
    - name: Show files
      run:  set ; pwd ; ls -l /tmp/lvgl-wasm
```

TODO

## Copy WebAssembly to GitHub Pages

```yaml
    - name: Copy WebAssembly to GitHub Pages
      run:  |
        if [ ! -d docs ]; then
          mkdir docs
        fi
        export src=/tmp/lvgl-wasm
        export docs=$src/docs
        export wasm=$src/wasm
        cp \
          $docs/index.md \
          $docs/lvgl.html \
          $wasm/*.html \
          $wasm/*.js \
          $wasm/*.wasm \
          $wasm/*.txt \
          docs
```

TODO

## Commit GitHub Pages

```yaml
    - name: Commit GitHub Pages
      uses: EndBug/add-and-commit@v4.4.0
      with:
        add: docs
```

TODO

## Upload Outputs

```yaml
    - name: Upload Outputs
      uses: actions/upload-artifact@v2
      with:
        name: wasm
        path: |
          /tmp/lvgl-wasm/wasm/*.html
          /tmp/lvgl-wasm/wasm/*.js
          /tmp/lvgl-wasm/wasm/*.wasm
          /tmp/lvgl-wasm/wasm/*.txt
```

TODO

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

TODO

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