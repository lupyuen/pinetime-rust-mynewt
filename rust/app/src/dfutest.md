# Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)

![Wireless Firmware Update In Action on PineTime Smart Watch](https://lupyuen.github.io/images/dfutest-title.png)

_Wireless Firmware Update In Action on PineTime Smart Watch_

We have implemented a __Wireless Firmware Update__ feature for [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) that's described here...

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)_

Now let's observe step-by-step the Wireless Firmware Update running on PineTime with __MCUBoot Bootloader, NimBLE Bluetooth LE Stack and Apache Mynewt.__

Watch what happens in the PineTime Debug Log (captured with ST-Link Debugger and OpenOCD) as we perform Wireless Firmware Update in two ways...

1. With the [__Nordic nRF Connect__](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app

1. With the [__Newt Manager__](http://mynewt.apache.org/latest/newtmgr/index.html) command-line tool

Here's the video of the Firmware Update with nRF Connect...

- [Watch on YouTube](https://youtu.be/thLhGUl9-CU)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.3)

Read on to learn what happens inside PineTime during Firmware Update.

# Test Firmware for PineTime Firmware Update

The PineTime firmware files used for testing Firmware Update are documented in the table below.

We provide 2 versions of each firmware file to be flashed...

1. __Arm Semihosting Enabled:__ These files should be selected if you're debugging with ST-Link or Raspberry Pi. They will display debugging messages on the Arm Semihosting Console via OpenOCD. These files will hang when used with JLink.

1. __Arm Semihosting Disabled:__ Files named `nosemi` should be selected if you're debugging with JLink. They will not display debugging messages via Arm Semihosting.

The Semihosting Build Options are defined here: [Bootloader Options](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/targets/nrf52_boot/pkg.yml), [Application Firmware Options](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/targets/nrf52_my_sensor/pkg.yml)

Before testing Firmware Update, the MCUBoot Bootloader AND Mynewt Firmware should be flashed manually to PineTime (via ST-Link or Raspberry Pi). Select either the Semihosting version or the JLink version...

| Firmware Component | Version | Binary File | From | Flash To | At Address | Remarks |
| :--- | :--- |  :--- |  :--- |  :--- |  :--- | :--- |
| MCUBoot Bootloader for Semihosting | 1.0.0 | [`mynewt`<br>`.elf.bin`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.7/mynewt.elf.bin) | [`v4.1.7`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.7) | Internal Flash ROM | `0x0000 0000` | Use this bootloader if you're debugging with ST-Link or Raspberry Pi (Semihosting is enabled)
| MCUBoot Bootloader for JLink | 1.0.0 | [`mynewt`<br>`-nosemi`<br>`.elf.bin`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.7/mynewt_nosemi.elf.bin) | [`v4.1.7`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.7) | Internal Flash ROM | `0x0000 0000` | Use this bootloader if you're debugging with JLink (Semihosting is disabled)
| Mynewt Firmware for Semihosting | 1.0.0 | [`my_sensor_app`<br>`.img`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.1/my_sensor_app.img) | [`v4.1.1`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.1) | Internal Flash ROM | `0x0000 8000` | Contains MCUBoot Image Header and Mynewt OS with Rust. Shows "`I AM PINETIME`" (Semihosting is enabled)
| Mynewt Firmware for JLink | 1.0.0 | [`my_sensor_app`<br>`_nosemi`<br>`.img`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.4/my_sensor_app_nosemi.img) | [`v4.1.4`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.4) | Internal Flash ROM | `0x0000 8000` | Contains MCUBoot Image Header and Mynewt OS with Rust. Shows "`I AM PINETIME`" (Semihosting is disabled)
| Boot Graphic (Optional) | 1.0.0 | [`boot-graphic`<br>`.bin`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.1/boot-graphic.bin) | [`v4.1.1`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.1) | External SPI Flash | `0x0000 0000` | Hand-drawn PineTime Logo in RGB565 format, 240 x 240 pixels, 2 bytes per pixel

[ Update: The above links have been updated with the new MCUBoot Bootloader that relocates the Vector Table ]

If MCUBoot Bootloader for Semihosting doesn't start on PineTime, try using MCUBoot Bootloader for JLink.

While testing Firmware Update, download and select one of the following Firmware Images in nRF Connect (or Newt Manager)...

| Firmware Image | Version | Binary File | From | Flash To | At Address | Remarks |
| :--- | :--- |  :--- |  :--- |  :--- |  :--- | :--- |
| Mynewt Firmware for Semihosting | 1.1.0 | [`my_sensor_app`<br>`_1.1.img`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.2/my_sensor_app_1.1.img) | [`v4.1.2`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.2) | External SPI Flash | `0x0004 0000` | Contains MCUBoot Image Header and Mynewt OS with Rust. Shows "`PINETIME 1.1`" (Semihosting is enabled)
| Mynewt Firmware for JLink | 1.1.0 | [`my_sensor_app`<br>`_nosemi`<br>`_1.1.img`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.2/my_sensor_app_nosemi_1.1.img) | [`v4.1.2`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.2) | External SPI Flash | `0x0004 0000` | Contains MCUBoot Image Header and Mynewt OS with Rust. Shows "`PINETIME 1.1`" (Semihosting is disabled)
| Mynewt Firmware for Semihosting | 1.2.0 | [`my_sensor_app`<br>`_1.2.img`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.2/my_sensor_app_1.2.img) | [`v4.1.2`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.2) | External SPI Flash | `0x0004 0000` | Contains MCUBoot Image Header and Mynewt OS with Rust. Shows "`PINETIME 1.2`" (Semihosting is enabled)
| Mynewt Firmware for JLink | 1.2.0 | [`my_sensor_app`<br>`_nosemi`<br>`_1.2.img`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.2/my_sensor_app_nosemi_1.2.img) | [`v4.1.2`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.2) | External SPI Flash | `0x0004 0000` | Contains MCUBoot Image Header and Mynewt OS with Rust. Shows "`PINETIME 1.2`" (Semihosting is disabled)
| FreeRTOS Firmware | 1.1.0 | [`jf.bin`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.5/jf.bin) | [`v4.1.5`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.5) | External SPI Flash | `0x0004 0000` | Contains MCUBoot Image Header and [FreeRTOS](https://github.com/JF002/Pinetime). Shows a digital watch face (Semihosting is disabled)

We provide two Mynewt firmware versions (1.1.0 and 1.2.0) for testing firmware swapping. The Mynewt firmware files were built from [`pinetime-rust-mynewt/ota2`](https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota2) and the build version numbers were specified in [`scripts/nrf52/image-app.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/scripts/nrf52/image-app.sh)

To use the Firmware Image Files with the nRF Connect App, we need to rename the file extension from `.img` to `.bin` after downloading (e.g. `my_sensor_app_1.1.bin`)

Note that `.bin` files may be found in the [`v4.1.1`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.1) and [`v4.1.2`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.2) downloads, but these `.bin` files should not be used for Firmware Updates because they don't have the MCUBoot Image Header.

So always download the `.img` files and then rename them to `.bin`.

The `.img` files were created with the `imgtool.py` command-line tool [described here](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu).

Note that the Mynewt firmware files were built with the [`ota2` branch of `pinetime-rust-mynewt`](https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota2) branch which supports MCUBoot (instead of the default `master` branch which uses the Stub Bootloader).

The `ota2` branch has a conflict in the MCUBoot version numbers. [Check this link](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot#download-source-files) for the instructions to download MCUBoot version 1.5.0.

_Can we customise the Boot Graphic?_

Use this tool to convert a 240 x 240 PNG file to RGB565: [`github.com/lupyuen/pinetime-graphic`](https://github.com/lupyuen/pinetime-graphic)

Unfortunately we don't have an easy way to flash the RGB565 Boot Graphic to External SPI Flash at address `0x0`. The flashing needs to be done in C like this: [`libs/pinetime_boot/write.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/pinetime_boot/src/write.c)

# Update: Relocate the Interrupt Vector Table

[ Update: This section is new ]

While testing [FreeRTOS](https://github.com/JF002/Pinetime) with MCUBoot, we encountered a problem with the Interrupt Vector Table...

_What is the Interrupt Vector Table?_

It's a table of pointers to functions that will handle Interrupts (like from the Touch Controller) and Exceptions (like invalid memory access).

Arm Cortex-M firmware must have this table located at the start of Internal Flash ROM (address `0x0`).

With MCUBoot Bootloader, we will have two Vector Tables...

1. __Vector Table for MCUBoot:__ Used when the bootloader runs. Located at Flash ROM Address `0x0`

1. __Vector Table for Application Firmware:__ Used when the Application Firmware runs. Located at Flash ROM Address `0x8020`

_Will the two Vector Tables have conflicts?_

Yes, because most Application Firmware is written with the assumption that the Vector Table is at address `0x0`.

Now that the Application Firmware Vector Table is located elsewhere at `0x8020`, we need to switch the Vector Tables correctly.

_How do we switch between the two Vector Tables?_

We need to __Relocate the Vector Table.__ When the MCUBoot Bootloader is about to start the Application Firmware, it copies the firmware's Vector Table (from `0x8020`) to a page-aligned address in Internal Flash ROM: `0x7F00`

Then MCUBoot sets the VTOR Register in the Arm CPU's System Control Block to point to the Relocated Vector Table: `0x7F00`. The code for Vector Table Relocation is here: [`libs/pinetime_boot/src/pinetime_boot.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/pinetime_boot/src/pinetime_boot.c#L102-L132)

```c
/// Relocate the Arm Vector Table from vector_table to relocated_vector_table.
/// relocated_vector_table must be aligned to 0x100 page boundary.
static void relocate_vector_table(void *vector_table, void *relocated_vector_table) {
    uint32_t *current_location = (uint32_t *) vector_table;
    uint32_t *new_location     = (uint32_t *) relocated_vector_table;
    if (new_location == current_location) { return; }  //  No need to relocate
    //  Check whether we need to copy the vectors.
    int vector_diff = 0;  //  Non-zero if a vector is different
    for (int i = 0; i < NVIC_NUM_VECTORS; i++) {
        if (new_location[i] != current_location[i]) {
            vector_diff = 1;
            break;
        }
    }
    //  If we need to copy the vectors, erase the flash ROM and write the vectors.
    if (vector_diff) {
        hal_flash_erase(  //  Erase...
            0,            //  Internal Flash ROM
            (uint32_t) relocated_vector_table,  //  At the relocated address
            0x100         //  Assume that we erase an entire page
        );
        hal_flash_write(  //  Write...
            0,            //  Internal Flash ROM
            (uint32_t) relocated_vector_table,  //  To the relocated address
            vector_table, //  From the original address
            0x100         //  Assume that we copy an entire page
        );  
    }
    //  Point VTOR Register in the System Control Block to the relocated vector table.
    *SCB_VTOR = (uint32_t) relocated_vector_table;
}
```

Here is the updated MCUBoot Bootloader that correctly relocates the Interrupt Vector Table before starting the Application Firmware...

[`pinetime-rust-mynewt/releases/tag/v4.1.7`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.7)

[Arm Documentation on Vector Table](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0552a/BABIFJFG.html)

[More about the Vector Table](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.5)

# Video of PineTime Firmware Update Test

Here's the video of the Wireless Firmware Upgrade from version 1.0.0 to 1.1.0...

- [Watch on YouTube](https://youtu.be/thLhGUl9-CU)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.3)

![Wireless Firmware Update In Action on PineTime Smart Watch](https://lupyuen.github.io/images/dfutest-title.png)

__Left:__ PineTime Smart Watch

__Centre:__ Debug Log from PineTime, captured with ST-Link debugger and OpenOCD

__Right:__ Android Phone with [Nordic nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app

What happens step by step, by timecode...

- `00:00` - PineTime is preloaded with...

    1. MCUBoot Bootloader for Semihosting

    1. Application Firmware Image v1.0.0

    1. Boot Graphic

    The Application Firmware is running, showing "`I AM PINETIME`"

    ST-Link debugger is connected, showing the debug log. `Swap type` is set to `perm` because we have previously used nRF Connect to mark the Firmware image as "Confirmed"...

    ```
    [INF] Primary image: magic=good, swap_type=0x2, copy_done=0x1, image_ok=0x1
    [INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
    [INF] Boot source: none
    [INF] Swap type: perm
    ```
    _From [`mcuboot/main.c`](https://github.com/JuulLabs-OSS/mcuboot/blob/master/boot/mynewt/src/main.c#L239-L245)_

- `00:03` - Start the [Nordic nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app on an Android phone.

    Tap on `pinetime` and the `DFU` icon to start the Firmware Update

- `00:12` - __Select the firmware file__ to be flashed...

    Application Firmware Image v1.1.0 <br>
    `my_sensor_app_1.1.img` <br>
    Downloaded from [`v4.1.2`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.2) 

    We renamed the file to `my_sensor_app_1.1.bin` after downloading, because nRF Connect only accepts `.bin` files.

    Wireless upload to PineTime begins. PineTime receives the firmware file via the NimBLE Bluetooth Stack and the MCU Manager Library.
    
    The new firmware will be staged in PineTime's External SPI Flash at address `0x0004 0000`.

- `02:11` - __Upload completed__. PineTime attempts to reboot, but because we are running ST-Link, the reboot attempt was caught by the debugger. We restart the OpenOCD debugger to reboot PineTime manually.

    ```
    target halted due to breakpoint, current mode: Thread 
    xPSR: 0x61000000 pc: 0x000081d8 psp: 0x20006a78, semihosting
    ```

    nRF Connect took 60 seconds to upload the 205 KB firmware file to PineTime. We'll see later that Newt Manager can upload the firmware file faster: 31 seconds.

- `02:13` - PineTime __reboots__. MCUBoot Bootloader starts.

    ```
    Starting Bootloader...
    ```
    _From [`libs/pinetime_boot/pinetime_boot.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/pinetime_boot/src/pinetime_boot.c#L35)_

- `02:14` - MCUBoot Bootloader renders the __Boot Graphic__ (hand-drawn PineTime logo) in under 1 second

    ```
    Displaying image...
    Image displayed
    ```
    _From [`libs/pinetime_boot/display.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/pinetime_boot/src/display.c#L112-L183)_

    MCUBoot checks whether the watch button is pressed, for __Manual Firmware Rollback.__ (The checking of Manual Firmware Rollback is presently simulated, pending implementation)

    ```
    Button: 0
    ```
    _From [`libs/pinetime_boot/pinetime_boot.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/pinetime_boot/src/pinetime_boot.c#L45)_

- `02:16` - __MCUBoot starts swapping__ the new firmware (External SPI Flash) with the old firmware (Internal Flash ROM)

- `02:30` - __MCUBoot swapping completed.__ New firmware is now in Internal Flash ROM, old firmware is now in External SPI Flash.

    `Swap type: test` means that the swapping to new firmware has been completed successfully.

    ```
    [INF] Primary image: magic=good, swap_type=0x3, copy_done=0x1, image_ok=0x1
    [INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
    [INF] Boot source: none
    [INF] Swap type: test
    ```
    _From [`mcuboot/main.c`](https://github.com/JuulLabs-OSS/mcuboot/blob/master/boot/mynewt/src/main.c#L239-L245)_

- `02:30` - MCUBoot waits 5 seconds and checks whether the watch button is pressed, for __Manual Firmware Rollback__ (Simulated)

    ```
    Button: 0
    Button: 0
    ```
    _From [`libs/pinetime_boot/pinetime_boot.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/pinetime_boot/src/pinetime_boot.c#L54-L58)_

- `02:36` - MCUBoot starts the __New Application Firmware__

    ```
    Bootloader done
    ```
    _From [`pinetime_boot/pinetime_boot.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/pinetime_boot/src/pinetime_boot.c#L61)_

    Mynewt Application Firmware starts the Temperature Stub Driver and dsplays the Hardware ID    

    ```
    TMP create temp_stub_0
    NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
    NET standalone node 
    ```
    _From [`libs/temp_stub/creator.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/temp_stub/src/creator.c#L69-L70), [`libs/sensor_network/sensor_network.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/libs/sensor_network/src/sensor_network.c#L369-L370)_

    Mynewt Application Firmware reads the Internal Flash ROM and External SPI Flash for testing 

    ```
    Testing flash...
    Read Internal Flash ROM...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
    0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Read External SPI Flash...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0008: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Flash OK
    ```
    _From [`apps/my_sensor_app/flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c#L218-L298)_

- `02:37` - Mynewt Application Firmware __resets the Backlight and Display Controller,__ causing the screen to blank (needs to be fixed)

- `02:43` - Mynewt Application Firmware __switches on the Backlight__ via the Rust driver for ST7789 Display Controller. The hand-drawn PineTime logo previously rendered is now visible.

    Mynewt Application Firmware __erases the screen very slowly__ via the Rust driver for ST7789 Display Controller

    ```
    Rust test display
    ```
    _From [`rust/app/display.rs`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/rust/app/src/display.rs#L23)_

- `02:55` - Mynewt Application Firmware __renders some shapes__ and the message "`PINETIME 1.1`"

# Test Log for PineTime Firmware Update

Here's the PineTime log for the above test, captured from the ST-Link OpenOCD debugger...

## Before PineTime Reboot

```
# From PineTime Log
Starting Bootloader...
Displaying image...
Image displayed
Button: 0
[INF] Primary image: magic=good, swap_type=0x2, copy_done=0x1, image_ok=0x1
[INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
[INF] Boot source: none
[INF] Swap type: perm
Button: 0
Button: 0
Bootloader done
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
Testing flash...
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0008: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Flash OK
Rust test display
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x000081d8 psp: 0x20006a78, semihosting
```

## After PineTime Reboot

```
# From PineTime Log
Starting Bootloader...
Displaying image...
Image displayed
Button: 0
[INF] Primary image: magic=good, swap_type=0x3, copy_done=0x1, image_ok=0x1
[INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
[INF] Boot source: none
[INF] Swap type: test
Button: 0
Button: 0
Bootloader done
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
Testing flash...
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0008: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Flash OK
Rust test display
```

# PineTime Firmware Update with Newt Mananger

To understand the Firmware Update in detail, we'll use the [__Newt Manager__](http://mynewt.apache.org/latest/newtmgr/index.html) command-line tool to reproduce each step of the Firmware Update.  The shell script may be found here: [`test-dfu.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/scripts/nrf52/test-dfu.sh)

For this test we're using Ubuntu 20.04 on Raspberry Pi 4, connected to a USB Bluetooth Dongle (because the onboard Bluetooth adapter is not detected by Ubuntu).

1. __Build Newt Manager__ on Raspberry Pi...

    We'll build the Newt Manager tool, which is a Go program that works best on Linux. Source code for Newt Manager: [`mynewt-newtmgr`](https://github.com/apache/mynewt-newtmgr)

    ```bash
    # Build Newt Manager on Raspberry Pi
    cd ~/go
    mkdir -p src/mynewt.apache.org
    cd src/mynewt.apache.org/
    git clone https://github.com/apache/mynewt-newtmgr
    mv mynewt-newtmgr newtmgr
    cd newtmgr/newtmgr
    export GO111MODULE=on
    go build
    ```

1. __Create a Connection Profile__ in Newt Manager

    PineTime sets and advertises `pinetime` as its Bluetooth LE device name. We create a Connection Profile that uses this peer name to communicate with the device over Bluetooth LE...

    ```bash
    cd ~/go/src/mynewt.apache.org/newtmgr/newtmgr
    sudo ./newtmgr conn add pinetime type=ble connstring="peer_name=pinetime"
    ```

    We'll see...

    ```
    Connection profile pinetime successfully added
    ```

1. __Connect to PineTime and List Firmware Images__

    Next we connect to PineTime over Bluetooth LE and list the firmware images stored in PineTime's Internal Flash ROM (Active Firmware) and External SPI Flash (Standby Firmware). 
    
    Note that we're using the `--loglevel debug` option, which shows all Bluetooth request and response packets.

    ```bash
    sudo ./newtmgr image list -c pinetime --loglevel debug
    ```

    For Manjaro on Pinebook Pro (and other systems) we may need to specify the Bluetooth HCI interface with `--hci` like this...

    ```bash
    sudo ./newtmgr image list -c pinetime --loglevel debug --hci 1
    ```

    We'll see...

    ```
    DEBU[2020-05-19 04:46:13.693] Using connection profile: name=pinetime type=ble connstring=peer_name=pinetime 
    DEBU[2020-05-19 04:46:14.023] Connecting to peer                           
    DEBU[2020-05-19 04:46:14.244] Exchanging MTU                               
    DEBU[2020-05-19 04:46:14.256] Exchanged MTU; ATT MTU = 256                 
    DEBU[2020-05-19 04:46:14.256] Discovering profile                          
    DEBU[2020-05-19 04:46:14.503] Subscribing to NMP response characteristic   
    DEBU[2020-05-19 04:46:14.518] {add-nmp-listener} [bll_sesn.go:392] seq=66  
    DEBU[2020-05-19 04:46:14.519] Encoded &{NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:1 Seq:66 Id:0}}} to:
    00000000  a0                                                |.| 
    DEBU[2020-05-19 04:46:14.519] Encoded:
    00000000  00 00 00 01 00 01 42 00  a0                       |......B..| 
    DEBU[2020-05-19 04:46:14.519] Tx NMP request: 00000000  00 00 00 01 00 01 42 00  a0                       |......B..| 
    DEBU[2020-05-19 04:46:14.542] rx nmp response: 00000000  01 00 00 86 00 01 42 00  bf 66 69 6d 61 67 65 73  |......B..fimages|
    00000010  9f bf 64 73 6c 6f 74 00  67 76 65 72 73 69 6f 6e  |..dslot.gversion|
    00000020  65 31 2e 30 2e 30 64 68  61 73 68 58 20 70 3e bb  |e1.0.0dhashX p>.|
    00000030  f8 11 45 8b 1f ad 18 9e  64 e3 a5 e0 f8 09 cb e6  |..E.....d.......|
    00000040  ba d8 83 c7 6b 3d d7 12  79 1c 82 2f b5 68 62 6f  |....k=..y../.hbo|
    00000050  6f 74 61 62 6c 65 f5 67  70 65 6e 64 69 6e 67 f4  |otable.gpending.|
    00000060  69 63 6f 6e 66 69 72 6d  65 64 f5 66 61 63 74 69  |iconfirmed.facti|
    00000070  76 65 f5 69 70 65 72 6d  61 6e 65 6e 74 f4 ff ff  |ve.ipermanent...|
    00000080  6b 73 70 6c 69 74 53 74  61 74 75 73 00 ff        |ksplitStatus..| 
    DEBU[2020-05-19 04:46:14.542] Received nmp rsp: &{NmpBase:{hdr:{Op:1 Flags:0 Len:134 Group:1 Seq:66 Id:0}} Rc:0 Images:[{NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:0 Seq:0 Id:0}} Image:0 Slot:0 Version:1.0.0 Hash:[112 62 187 248 17 69 139 31 173 24 158 100 227 165 224 248 9 203 230 186 216 131 199 107 61 215 18 121 28 130 47 181] Bootable:true Pending:false Confirmed:true Active:true Permanent:false}] SplitStatus:N/A} 
    DEBU[2020-05-19 04:46:14.543] {remove-nmp-listener} [bll_sesn.go:392] seq=66 
    Images:
    image=0 slot=0
        version: 1.0.0
        bootable: true
        flags: active confirmed
        hash: 703ebbf811458b1fad189e64e3a5e0f809cbe6bad883c76b3dd712791c822fb5
    Split status: N/A (0)    
    ```

    This shows that the Active Firmware Image (version 1.0.0) in Internal Flash ROM has been set as Confirmed, which means that the existing firmware is running OK.

1. __Upload a Firmware Image to PineTime__

    We upload to PineTime version 1.1.0 of the firmware image: `my_sensor_app_1.1.img` (previously downloaded from [`pinetime-rust-mynewt/releases/tag/v4.1.2`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.2))

    ```bash
    sudo ./newtmgr image upload -c pinetime \
       ~/my_sensor_app_1.1.img 
    ```

    The upload completes in 31 seconds for the 205 KB firmware file.

    ```
        205.27 KiB / 205.27 KiB [=====================================================================] 100.00% 6.47 KiB/s 31s
    Done
    ```

    We list the firmware images again...

    ```bash
    sudo ./newtmgr image list -c pinetime
    ```

    The new firmware as been loaded to Slot 1 (External SPI Flash). Note that the `flags` are empty.

    ```
    Images:
    image=0 slot=0
        version: 1.0.0
        bootable: true
        flags: active confirmed
        hash: 703ebbf811458b1fad189e64e3a5e0f809cbe6bad883c76b3dd712791c822fb5
    image=0 slot=1
        version: 1.1.0
        bootable: true
        flags: 
        hash: 66a23f4f8f5766b5150711eb8c7c4be326cebabef37429fd21879f6e0eacffe5
    Split status: N/A (0)
    ```

    The hash value for the new firmware is `66a2...`. We'll use this in the next step.

1. __Set the New Firmware Image Status to Pending__ 

    The new firmware has been uploaded to the External SPI Flash but is not yet active. 
    We run the `image test` command to set the firmware status to Pending so that it will be started after rebooting...

    ```bash
    sudo ./newtmgr image test -c pinetime \
       66a23f4f8f5766b5150711eb8c7c4be326cebabef37429fd21879f6e0eacffe5
    ```

    Note that `66a2...` is the hash value for the new firmware, obtained from the previous step.

    ```
    Images:
    image=0 slot=0
        version: 1.0.0
        bootable: true
        flags: active confirmed
        hash: 703ebbf811458b1fad189e64e3a5e0f809cbe6bad883c76b3dd712791c822fb5
    image=0 slot=1
        version: 1.1.0
        bootable: true
        flags: pending
        hash: 66a23f4f8f5766b5150711eb8c7c4be326cebabef37429fd21879f6e0eacffe5
    Split status: N/A (0)
    ```

    The `flags` for the new firmware is now set to `pending`. MCUBoot will swap the new firmware into Internal Flash ROM on reboot.

1. __Reboot PineTime__

    We reboot PineTime to test the new firmware. Here's the PineTime debug log captured with ST-Link and OpenOCD...

    ```
    # From PineTime Log
    Starting Bootloader...
    Displaying image...
    Image displayed
    Button: 0
    [INF] Primary image: magic=unset, swap_type=0x1, copy_done=0x3, image_ok=0x3
    [INF] Scratch: magic=unset, swap_type=0x1, copy_done=0x3, image_ok=0x3
    [INF] Boot source: primary slot
    [INF] Swap type: test
    Button: 0
    ```

    Note that `Swap type` is set to `test`, which means that MCUBoot has swapped in the new firmware from External SPI Flash into Internal Flash ROM.

    The old firmware has been swapped out to External SPI Flash.

    But somehow the new firmware failed to start (maybe because the ST-Link debugger was still attached).  PineTime rebooted by itself and showed this debug log...

    ```
    # From PineTime Log
    Starting Bootloader...
    Displaying image...
    Image displayed
    Button: 0
    [INF] Primary image: magic=good, swap_type=0x2, copy_done=0x1, image_ok=0x3
    [INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
    [INF] Boot source: none
    [INF] Swap type: revert
    Button: 0
    Button: 0
    Bootloader done
    ```

    Note that `Swap type` is set to `revert`, which means that MCUBoot thinks the new firmware is faulty and has swapped the old firmware back.

    The old firmware is now in the Internal Flash ROM and begins running...

    ```
    # From PineTime Log
    TMP create temp_stub_0
    NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
    NET standalone node 
    Testing flash...
    Read Internal Flash ROM...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
    0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Read External SPI Flash...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0008: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Flash OK
    Rust test display
    ```

1. __Set the New Firmware Image Status to Pending (Again)__ 

    Let's retry the Firmware Update. We set the status for the new firmware to Pending...
    
    ```bash
    # Set my_sensor_app_1.1.img to pending
    sudo ./newtmgr image test -c pinetime \
       66a23f4f8f5766b5150711eb8c7c4be326cebabef37429fd21879f6e0eacffe5
    ```

1. __Reboot PineTime (Again)__

    After rebooting, the new firmware runs correctly...

    ```
    # From PineTime Log
    Starting Bootloader...
    Displaying image...
    Image displayed
    Button: 0
    [INF] Primary image: magic=good, swap_type=0x4, copy_done=0x1, image_ok=0x1
    [INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
    [INF] Boot source: none
    [INF] Swap type: test
    Button: 0
    Button: 0
    Bootloader done
    ```

    `Swap type` has been set to `test`, which means that MCUBoot has swapped the new firmware into Internal Flash ROM.

    The new firmware runs OK...

    ```
    # From PineTime Log
    TMP create temp_stub_0
    NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
    NET standalone node 
    Testing flash...
    Read Internal Flash ROM...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
    0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Read External SPI Flash...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0008: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Flash OK
    Rust test display
    ```

1. __Confirm the New Firmware Image__

    We run the `image confirm` command to confirm and make the uploaded image permanent. 
    Since the uploaded image is currently the active image, we can confirm the image setup 
    without specifying the image hash value in the command...

    ```bash
    sudo ./newtmgr image confirm -c pinetime
    ```

    This command shows an error...

    ```
    + sudo ./newtmgr image confirm -c pinetime
    Error: 1
    ```

    But when we list the firmware images, the `flags` for the new firmware (Slot 0) are indeed set to `confirmed`.

    ```
    + sudo ./newtmgr image list -c pinetime
    Images:
    image=0 slot=0
        version: 1.1.0
        bootable: true
        flags: active confirmed
        hash: 66a23f4f8f5766b5150711eb8c7c4be326cebabef37429fd21879f6e0eacffe5
    image=0 slot=1
        version: 1.0.0
        bootable: true
        flags: 
        hash: 703ebbf811458b1fad189e64e3a5e0f809cbe6bad883c76b3dd712791c822fb5
    Split status: N/A (0)
    ```

    The `flags` for the old firmware (in External SPI Flash) are set to empty.

1. __Reboot PineTime to Verify Firmware Update__

    Finally we reboot PineTime and verify that the new firmware runs properly...

    ```
    # From PineTime Log
    Starting Bootloader...
    Displaying image...
    Image displayed
    Button: 0
    [INF] Primary image: magic=good, swap_type=0x2, copy_done=0x1, image_ok=0x1
    [INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
    [INF] Boot source: none
    [INF] Swap type: none
    Button: 0
    Button: 0
    Bootloader done
    TMP create temp_stub_0
    NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
    NET standalone node 
    Testing flash...
    Read Internal Flash ROM...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
    0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Read External SPI Flash...
    Read 0x0 + 20
    0x0000: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0008: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
    Flash OK
    Rust test display
    ```

    Note that `Swap type` is `none`, which means that MCUBoot didn't swap any firmware images.

The steps were derived from this Mynewt tutorial: [`ota_upgrade_nrf52.html`](https://mynewt.apache.org/latest/tutorials/devmgmt/ota_upgrade_nrf52.html)

# Update: Test Firmware Update with FreeRTOS

[ Update: This section is new ]

[FreeRTOS](https://github.com/JF002/Pinetime) has been tested successfully with Firmware Update on PineTime...

1. PineTime installed with Mynewt firmware can be updated wirelessly to FreeRTOS...

    - [Watch on YouTube](https://youtu.be/OeHS3SEOB88)

    - [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.8/dfu-freertos-rotated.mp4)

    Here's the PineTime log captured with ST-Link and OpenOCD...

    ```
    Starting Bootloader...
    Displaying image...
    Image displayed
    Check button: 0
    [INF] Primary image: magic=good, swap_type=0x4, copy_done=0x1, image_ok=0x1
    [INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
    [INF] Boot source: none
    [INF] Swap type: test
    Waiting 5 seconds for button: 0...
    Waited for button: 0
    Bootloader done    
    ```

1. And after rebooting, PineTime rolls back the firmware from FreeRTOS to Mynewt...

    - [Watch on YouTube](https://youtu.be/0FIYZ9tlI-Q)

    - [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.8/freertos-rollback-rotated.mp4)

The testing was done with the new version of MCUBoot that relocates the Vector Table...

[`pinetime-rust-mynewt/releases/tag/v4.1.7`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/tag/v4.1.7)

And this FreeRTOS firmware image: [`jf.bin`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.5/jf.bin)

With a newer build of FreeRTOS, we were able to switch wirelessly from FreeRTOS to Mynewt...

[`twitter.com/codingfield/status/1264280065799368705`](https://twitter.com/codingfield/status/1264280065799368705?s=20)

Hence we have successfully accomplished Two-Way Wireless Firmware Switching: From Mynewt to FreeRTOS and back.

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
