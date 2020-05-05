# Firmware Upgrade over Bluetooth Low Energy on PineTime Smart Watch

![Platforms in development for PineTime Smart Watch](https://lupyuen.github.io/images/dfu-platforms.png)

Thanks to the FOSS Community, [PineTime Smart Watch](https://wiki.pine64.org/index.php/PineTime) has an incredible variety of FOSS operating systems in the works: [FreeRTOS](https://github.com/JF002/Pinetime), [MicroPython](https://github.com/daniel-thompson/wasp-os), [Mynewt](https://github.com/lupyuen/pinetime-rust-mynewt), [RIOT](https://github.com/bosmoment/PineTime-apps), Rust [RTFM](https://github.com/wose/xochron) ([another](https://github.com/dbrgn/pinetime-rtfm)), [TinyGo](https://github.com/aykevl/go-smartwatch), [Tock](https://www.tockos.org/), [Zephyr](https://github.com/najnesnaj/pinetime-zephyr) ([another](https://github.com/Dejvino/pinetime-hermes-firmware.git)), ...

But these embedded platforms are accessible only by brave PineTime Owners who dare to pry open their watches very carefully... And connect a Raspberry Pi (or ST-Link) to the tiny delicate 4-pin SWD port recessed deep inside... Just to flash the PineTime firmware.

_What if we could flash any firmware to PineTime from our mobile phone... Without opening the watch?_

Yes we can! Just download the firmware file into our phone and push it wirelessly to our watch, like this...

![Firmware Upgrade over Bluetooth Low Energy for PineTime Smart Watch](https://lupyuen.github.io/images/dfu-flow.png)

_Firmware Upgrade over Bluetooth Low Energy for PineTime Smart Watch_

What's the magic behind this? It's the __[Simple Management Protocol (SMP)](https://github.com/apache/mynewt-mcumgr)__

By transmitting a bunch of SMP messages over Bluetooth Low Energy (LE), it's possible to send a file to PineTime and update its firmware. (Assuming that our PineTime supports SMP)

_What mobile app would we use for flashing PineTime over Bluetooth LE?_

The [Nordic nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app for iOS and Android is all that we need for flashing PineTime. Here's how it looks when the app is connected to a PineTime that supports SMP...

![nRF Connect mobile app connected to PineTime for Firmware Update](https://lupyuen.github.io/images/dfu-nrfconnect.png)

_nRF Connect mobile app connected to PineTime for Firmware Update_

See the circular `DFU` icon at the top right? That stands for __Direct Firmware Upgrade__.

Tapping the `DFU` icon will let us select a downloaded firmware file for flashing our watch. It's really that easy!

_What about PinePhone? Raspberry Pi?_

PinePhone, Raspberry Pi and other Linux devices may use the open-source [Newt Manager](https://github.com/apache/mynewt-newtmgr) tool.  (I have tested Newt Manager on Raspberry Pi with PineTime)

It runs on a command line, but it should be easy to wrap up in a graphical user interface.

_What needs to be done on PineTime?_

If you're developing firmware for PineTime: Thanks for the great job! I strongly urge you to implement the SMP protocol in your firmware... It will make PineTime Owners a lot happier when updating their watch firmware!

And we'll give PineTime Owners an easy way to try out all the awesome platforms that the PineTime FOSS Community has to offer!

We would like Pine64 to ship PineTime with a FOSS firmware (created by the PineTime Community) that implements the SMP protocol. So PineTime owners can just unbox their watch and start flashing right away from their phones.

In this article I'll walk you through the steps of implementing the SMP protocol in your PineTime firmware. I'll show you my implementation for Mynewt OS, which you may use for reference.

# Simple Management Procotol for Firmware Update

The open-source Simple Management Protocol (SMP) was originally created for flashing firmware on devices running Mynewt and Zephyr operating systems.  SMP is based on the Bluetooth LE Generic Attribute (GATT) Profile. 

GATT defines the standard way for a Bluetooth LE Client (like our mobile phone) to access a Bluetooth LE Service (like the firmware upgrade service on PineTime). [More about GATT](https://learn.adafruit.com/introduction-to-bluetooth-low-energy/gatt)

Here's how the SMP protocol works...

![SMP Firmware Upgrade over Bluetooth LE](https://lupyuen.github.io/images/dfu-gatt.png)

_SMP Firmware Upgrade over Bluetooth LE_

1. PineTime broadcasts its name `pinetime` over Bluetooth LE to allow mobile phones to discover the smart watch

1. Mobile App connects to PineTime via the advertised name `pinetime`

1. Mobile App queries PineTime for a GATT Service that has ID `8D53DC1D-1DB7-4CD3-868B-8A527460AA84`. This is the GATT Service ID for SMP.

1. Mobile App then queries PineTime for the GATT Characteristic ID `DA2E7828-FBCE-4E01-AE9E-261174997C48`. This is the GATT Characteristic ID for SMP.

1. Mobile App uses the GATT Characteristic ID for SMP to transmit an encoded request to update PineTime's firmware. In GATT lingo, we call this sending a "Write Request" to the GATT Characteristic for SMP.

1. PineTime performs the firmware update using the firmware file that was embedded in the request

This flow becomes clearer when we look at the nRF Connect mobile app connected to PineTime. Observe how we connect to PineTime by the device name `pinetime`, also note the SMP Service and SMP Characteristic that appear under PineTime...

![nRF Connect mobile app connected to PineTime's SMP Service](https://lupyuen.github.io/images/dfu-gattapp3.png)

_nRF Connect mobile app connected to PineTime's SMP Service_

The circular `DFU` icon at top right (Direct Firmware Upgrade) appears when the mobile app detects the presence of the SMP Service and Characteristic. Tapping the `DFU` icon will transmit a firmware update request to PineTime.

_How shall we implement the SMP protocol in PineTime firmware?_

Fortunately there's an open-source library that implements the SMP protocol: the [__MCU Manager Library__](https://github.com/apache/mynewt-mcumgr). More about this in a while.

For reference, the generic SMP protocol is [documented here](https://github.com/apache/mynewt-mcumgr). The SMP protocol based on Bluetooth LE is [documented here](https://github.com/apache/mynewt-mcumgr/blob/master/transport/smp-bluetooth.md).

# Robust Firmware Update on PineTime with Rollback

PineTime Smart Watch will be worn by people of all ages (maybe pets too)... Thus we shall _plan for failure!_

_What happens if the firmware gets corrupted or truncated while transmitting the firmware update over Bluetooth LE? Will PineTime get bricked?_

We won't overwrite the existing firmware as we receive the new firmware.  We'll stage the new firmware in a separate area in PineTime's Flash ROM. 

We'll overwrite the existing firmware only when we're absolutely sure that the new firmware has passed our integrity checks.

_What happens if there's a bug in the new firmware that causes PineTime to crash during startup?_

We'll roll back the firmware to the previous version. Here's how it works...

![Firmware Update with Rollback on PineTime](https://lupyuen.github.io/images/dfu-rollback.png)

_Firmware Update with Rollback on PineTime_

1. PineTime stores two firmware images in Flash ROM: __Active and Standby.__ PineTime boots from the Active Firmware Image. It activates the SMP service for firmware upgrade over Bluetooth LE.

1. During firmware update, PineTime writes the received firmware image into the Standby Firmware slot. PineTime checks that the firmware image has been received correctly, and reboots itself.

1. On reboot, the bootloader (MCUBoot) swaps the Active and Standby Firmware images. The bootloader starts the Active Firmware Image (containing the new firmware)

1. If the new firmware doesn't start properly, at the next reboot the bootloader swaps back the Active and Standby Firmware images. The bootloader starts the Active Firmware Image (now containing the old firmware)

1. PineTime should start correctly with the old firmware with SMP service operational. We may perform the firmware upgrade again when the new firmware is fixed.

Thankfully most of this firmware update and rollback logic is built into the [MCU Manager Library](https://github.com/apache/mynewt-mcumgr). For the swapping of firmware we'll use another open-source component: [__MCUBoot Bootloader__](https://juullabs-oss.github.io/mcuboot/).  More about MCUBoot in a while.

# PineTime Flash ROM Layout

To support firmware update (with rollback) via Bluetooth LE, PineTime Firmware Developers would have to adopt a common layout for storing flash images in Flash ROM.

Here's the proposed __Flash ROM Layout__ that supports Active and Standby Firmware Images for firmware update and rollback...

| &nbsp;&nbsp;&nbsp;&nbsp; PineTime Flash Area | ROM Address        | Size |
| :---                  | :---              | ---:        |
| &nbsp;&nbsp;&nbsp;&nbsp; Bootloader (MCUBoot)  | `0x0000 0000`  | 16 KB |
| &nbsp;&nbsp;&nbsp;&nbsp; Reboot Log            | `0x0000 4000`  | 16 KB |
| &nbsp;&nbsp;&nbsp;&nbsp; __Active Firmware Image__  &nbsp;&nbsp;&nbsp;&nbsp;    | __`0x0000 8000`__  | &nbsp;&nbsp;&nbsp; __232 KB__ |
| &nbsp;&nbsp;&nbsp;&nbsp; _Standby Firmware Image_      | `0x0004 2000`  | _232 KB_ |
| &nbsp;&nbsp;&nbsp;&nbsp; Scratch Area          | `0x0007 F000`  | 4 KB |
| &nbsp;&nbsp;&nbsp;&nbsp; User File System      | `0x0007 D000`  | 12 KB |
|<br>|||

_Proposed Flash ROM Layout for PineTime. Derived from this [Flash ROM layout for nRF52832](https://github.com/apache/mynewt-core/blob/master/hw/bsp/nordic_pca10040/bsp.yml)._

1. __Bootloader__: Located at the start of PineTime's Flash ROM, the open-source [MCUBoot Bootloader](https://juullabs-oss.github.io/mcuboot) is the first thing that PineTime runs upon booting. 

    For firmware update and rollback, the Bootloader swaps the Active and Standby Firmware Images. Then it jumps to the Active Firmware code.

1. __Reboot Log__: This is a log of debugging messages generated by the firmware upon starting. Useful for debugging startup failures.

1. __Active Firmware Image__: Contains PineTime firmware code that will be executed. The image starts with a Firmware Image Header (`0x20` bytes) followed by the Arm Cortex-M4 Interrupt Vector Table (`0xD8` bytes).

   Hence the executable firmware code begins at address `0x0000 80F8`. PineTime Firmware Developers should assume that their firmware code will be located at this address.

1. __Standby Firmware Image__: Staging area for receiving the new firmware over Bluetooth LE. During firmware update, the Bootloader swaps the Active and Standby Firmware Images, so that the new firmware becomes active.

   If the new firmware fails to start, the Bootloader swaps the old firmware back so that the old firmware becomes active.

1. __Scratch Area__: Temporary storage used by the Bootloader for swapping the Active and Standby Firmware Images.

1. __User File System__: PineTime Firmware Developers may store the user's settings here. The contents of this flash area are preserved during firmware updates.

Now we'll learn how the MCU Manager Library manages the Active and Standby Firmware Images to perform firmware updates.

# MCU Manager Library for Firmware Update

Let's look at the [MCU Manager Library](https://github.com/apache/mynewt-mcumgr) (coded in C) and how it handles firmware updates...

![Firmware Update with MCU Manager Library](https://lupyuen.github.io/images/dfu-mcumgr.png)

_Firmware Update with MCU Manager Library_

1. Mobile App transmits the new firmware to PineTime over Bluetooth LE in _mutiple chunks_. Mobile App writes each chunk of firmware as an __Image Upload Request__ to the SMP Characteristic on PineTime's GATT interface.

1. The open-source __NimBLE Bluetooth LE__ networking stack interprets each Image Upload Request request and calls the __Command Handler for Image Management__, part of the MCU Manager Library. More about NimBLE in a while.

1. Image Management Command Handler (in MCU Manager Library) inspects the Image Upload Request, by calling `img_mgmt_impl_upload_inspect`

1. Image Management Command Handler erases the Standby Firmware Image in PineTime's Flash ROM, by calling `img_mgmt_impl_erase_if_needed`

1. Then it writes the received firmware chunk into the Standby Firmware slot by calling `img_mgmt_impl_write_image_data`

PineTime Firmware Developers would need to implement these functions in C to inspect, erase and write firmware images in Flash ROM...

1. __Inspect Upload:__ `img_mgmt_impl_upload_inspect(&req, &action, &errstr)`

    Inspects the Image Upload Request in `req` ([defined here](https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/include/img_mgmt/img_mgmt.h#L75-L84)) and returns 0 if valid: 

    `off`: Offset of this chunk. Starts at 0. <br>
    `size`: Total size of the firmware image <br>
    `data_len`: Size of this chunk <br>
    `data_sha_len`: Size of the SHA hash <br>
    `upgrade`: If true, the version number of the new firmware must be greater than the Active Firmware version in Flash ROM
    
    The function also sets `action` ([defined here](https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/include/img_mgmt/img_mgmt.h#L103-L115)) to specify how the Image Upload Request should be handled:

    `size`: Total size of the firmware image <br>
    `write_bytes`: Number of image bytes to write to flash for the chunk <br>
    `area_id`: The flash area to write to <br>
    `proceed`: Whether to process the request; false if offset is wrong. <br>
    `erase`: Whether to erase the destination flash area.

    Refer to the reference implementation here: [`mynewt_img_mgmt.c`](https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/port/mynewt/src/mynewt_img_mgmt.c#L102-L252)

1. __Erase Image:__ `img_mgmt_impl_erase_if_needed(offset, num_bytes)`

    Erase a sector in Flash ROM. Erasing the entire Flash ROM at one time can take significant time, causing Bluetooth disconnect or significant battery sag. That's why we will erase a sector immediately before writing it.

    Refer to the reference implementation here: [`mynewt_img_mgmt.c`](https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/port/mynewt/src/mynewt_img_mgmt.c#L481-L509)

1. __Write Image:__ `img_mgmt_impl_write_image_data(offset, data, num_bytes, last)`

    Write the chunk of uploaded firmware to the Standby Firmware slot. We'll cover this function in the next section.

The usage of these functions may be found in [`img_mgmt.c`](https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/src/img_mgmt.c#L364-L534)

The complete list of C functions for Image Management to be implemented by PineTime Firmware Developers may be found here: [`img_mgmt_impl.h`](https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/include/img_mgmt/img_mgmt_impl.h)

Note that the Active Firmware is stored in Slot 0 and the Standby Firmware is stored in Slot 1 (or the Spare Slot).

# Write Firmware Image to PineTime's Flash ROM

In the previous section we have seen how the MCU Manager Library calls `img_mgmt_impl_write_image_data` to write a chunk of firmware to PineTime's Flash ROM. PineTime Firmware Developers would be required to implement this function in C, so let's look inside the function...

```c
int img_mgmt_impl_write_image_data(
    unsigned int offset, 
    const void *data,
    unsigned int num_bytes, 
    bool last);
```

`img_mgmt_impl_write_image_data` writes the chunk of firmware in `data` to the Standby Firmware Image (Slot 1), at the target offset indicated by `offset`. 

`num_bytes` is the number of bytes to write. `last` is true if this is the last chunk of firmware for the entire firmware update. The function returns 0 on success.

According to the [reference implementation](https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/port/mynewt/src/mynewt_img_mgmt.c#L391-L435), the function performs the following steps...

1. Call `flash_area_open( STANDBY_FIRMWARE_AREA, &fa)` to get a handle to the Standby Firmware Flash Area and store the handle in `fa`

1. For every Flash Sector that will be written:

    Call `flash_area_getnext_sector( fa->fa_id, &sector_id, &sector)` to get the Flash Sector ID (`sector_id`) and Flash Sector details (`sector`)

    Then erase the Flash Sector by calling `flash_area_erase( &sector, 0, sector.fa_size)`

1. Write the firmware data to the Standby Firmware Flash Area by calling `flash_area_write( fa, offset, data, num_bytes)`

1. Close the Standby Firmware Flash Area by calling `flash_area_close(fa)`

For details on the parameters of the `flash_area_*` functions, refer to the function declarations in [`flash_map.h`](https://github.com/apache/mynewt-core/blob/master/sys/flash_map/include/flash_map/flash_map.h)

_How do we implement these functions and write to PineTime's Flash ROM?_

Here's the [official documentation](https://infocenter.nordicsemi.com/pdf/nRF52832_PS_v1.0.pdf)...

![Writing to Flash ROM on nRF52832](https://lupyuen.github.io/images/dfu-flash.png)

_Writing to Flash ROM on nRF52832. From [Nordic nRF52832 Product Specification](https://infocenter.nordicsemi.com/pdf/nRF52832_PS_v1.0.pdf)_

If you're used to writing Flash ROM byte by byte on [STM32 Blue Pill](http://libopencm3.org/docs/latest/stm32f1/html/group__flash__file.html#gaf5077b5726c70fa9418db9d73182f89d) and other microcontrollers... Good News! Writing to PineTime's Flash ROM is almost as easy as writing to RAM.

Check out the reference implementation of 
`flash_area_write` in [Mynewt's Flash Driver for nRF52](https://github.com/apache/mynewt-core/blob/master/hw/mcu/nordic/nrf52xxx/src/hal_flash.c#L109-L179)

For reference implementations of `flash_area_open` and `flash_area_erase`, check out [`nrf52k_flash_init`](https://github.com/apache/mynewt-core/blob/master/hw/mcu/nordic/nrf52xxx/src/hal_flash.c#L217-L221) and [`nrf52k_flash_erase_sector`](https://github.com/apache/mynewt-core/blob/master/hw/mcu/nordic/nrf52xxx/src/hal_flash.c#L181-L205) in [Mynewt's Flash Driver for nRF52](https://github.com/apache/mynewt-core/blob/master/hw/mcu/nordic/nrf52xxx/src/hal_flash.c).

`flash_area_close` is [currently unused](https://github.com/apache/mynewt-core/blob/master/sys/flash_map/include/flash_map/flash_map.h#L80-L81).

The reference implementation of `flash_area_getnext_sector` may be found in [`flash_map.c`](https://github.com/apache/mynewt-core/blob/master/sys/flash_map/src/flash_map.c#L193-L229)

# NimBLE Bluetooth Stack

TODO

MCU Manager runs on the Bluetooth LE transport based on the open-source NimBLE Bluetooth LE stack. The following NimBLE modules need to be ported to the PineTime platform:

```
- "@apache-mynewt-nimble/nimble/host"
- "@apache-mynewt-nimble/nimble/host/services/ans"
- "@apache-mynewt-nimble/nimble/host/services/dis"
- "@apache-mynewt-nimble/nimble/host/services/gap"
- "@apache-mynewt-nimble/nimble/host/services/gatt"
- "@apache-mynewt-nimble/nimble/host/store/config"
- "@apache-mynewt-nimble/nimble/host/util"
- "@apache-mynewt-nimble/nimble/transport"
```

Refer to the NimBLE source code at https://github.com/apache/mynewt-nimble

# MCUBoot Bootloader

TODO

# Other Command Handlers for MCU Manager

TODO

For upgrading firmware over Bluetooth, the MCU Manager Library is supported on Mynewt OS and Zephyr OS. 

MCU Manager Library is documented here:

https://github.com/apache/mynewt-mcumgr

MCU Manager includes Command Handlers for managing Firmware Images, File System, Logging, OS and Runtime Statistics:

https://github.com/apache/mynewt-mcumgr/tree/master/cmd

# Firmware Upgrade via Bluetooth LE

TODO

__Objective:__ To allow firmware for PineTime Smart Watch to be upgraded Over-The-Air via Bluetooth LE from a mobile phone or a Linux desktop

__Devices To Be Supported:__ iOS, Android, PinePhone, Raspberry Pi (includes Linux desktops)

# Proposed Solution

TODO

We are exploring the OTA Firmware Update solution based on Apache NimBLE Bluetooth stack and Apache Mynewt OS, which are open source:

https://mynewt.apache.org/latest/tutorials/devmgmt/ota_upgrade_nrf52.html

This solution uses the Newt Manager command-line tool, coded in Go and supported on Linux and macOS:

https://github.com/apache/mynewt-newtmgr

https://mynewt.apache.org/latest/newtmgr/index.html

Or we may use the MCU Manager command-line tool, which is a thin wrapper over the Newt Manager command-line tool:

https://github.com/apache/mynewt-mcumgr-cli

For the firmware, the Newt Manager library (based on the NimBLE stack) needs to be embedded. The Newt Manager library receives the firmware image transmitted by the Newt Manager command-line tool:

https://mynewt.apache.org/latest/tutorials/devmgmt/add_newtmgr.html

https://mynewt.apache.org/latest/os/modules/devmgmt/newtmgr.html

Or we may embed the MCU Manager library (also based on the NimBLE stack):

https://github.com/apache/mynewt-mcumgr/blob/master/README-mynewt.md

https://mynewt.apache.org/latest/os/modules/mcumgr/mcumgr.html

(Newt Manager library vs MCU Manager library: newtmgr supports two wire formats - NMP (plain newtmgr protocol) and OMP (CoAP newtmgr protocol). mcumgr only supports NMP (called “Simple Management Procotol” in mcumgr))

Upon reboot, the MCUboot bootloader swaps the firmware images.  If there is a problem, MCUbot restores the previous firmware image. MCUboot is supported on Mynewt, Zephyr and RIOT OS. More about MCUboot:

https://juullabs-oss.github.io/mcuboot/

The Newt Manager / MCU Manager library is probably portable to other firmware, like FreeRTOS and RIOT OS.  MCU Manager is already supported in Zephyr OS.

PineTime should probably ship with a firmware image containing Newt Manager or MCU Manager so that we may upgrade PineTime to other firmware easily.

The NimBLE Bluetooth stack is now supported on PineTime with the FreeRTOS, Mynewt, RIOT and Zephyr firmwares.

The proposed solution is similar to the Bluetooth OTA Firmware Upgrade solution for Zephyr OS (based on MCU Manager):

https://docs.zephyrproject.org/latest/guides/device_mgmt/dfu.html#


# PineTime Firmware

TODO

Now testing PineTime Mynewt firmware built with Newt Manager library, located at the `ota` branch of `/pinetime-rust-mynewt`:

https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota

The Newt Manager library files have been added here: (`ble_*.c` and `ble_*.h`)

https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota/apps/my_sensor_app/src

The files were derived from the Mynewt `bleprph` sample:

https://github.com/apache/mynewt-nimble/tree/master/apps/bleprph

PineTime now appears in nRF Connect with DFU enabled:

https://twitter.com/MisterTechBlog/status/1255305379766042626?s=20

Need to implement MCUboot for DFU to work.

# Newt Manager Modules used in PineTime Firmware

TODO

The following modules were added to PineTime firmware to support Newt Manager:

```yaml
# Bluetooth LE
pkg.deps.BLUETOOTH_LE:
    - "@apache-mynewt-core/boot/split"
    - "@mcuboot/boot/bootutil"
    - "@apache-mynewt-core/mgmt/imgmgr"
    - "@apache-mynewt-core/mgmt/newtmgr"
    - "@apache-mynewt-core/mgmt/newtmgr/transport/ble"
    - "@apache-mynewt-nimble/nimble/host"
    - "@apache-mynewt-nimble/nimble/host/services/ans"
    - "@apache-mynewt-nimble/nimble/host/services/dis"
    - "@apache-mynewt-nimble/nimble/host/services/gap"
    - "@apache-mynewt-nimble/nimble/host/services/gatt"
    - "@apache-mynewt-nimble/nimble/host/store/config"
    - "@apache-mynewt-nimble/nimble/host/util"
    - "@apache-mynewt-nimble/nimble/transport"
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota/apps/my_sensor_app/pkg.yml_

# nRF Connect Client for iOS and Android

TODO

The nRF Connect Client for iOS and Android works OK with Newt Manager Library on PineTime, connecting via Simple Management Protocol over Bluetooth LE:

https://twitter.com/MisterTechBlog/status/1255305379766042626?s=20

The DFU function is enabled in nRF Client, but PineTime needs MCUboot to be installed for firmware upgrading to work.

More about nRF Connect: https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile

# Raspberry Pi Client

TODO

Newt Manager builds OK on Raspberry Pi 4 and works OK with PineTime.  See the log below.

Now studying the Go code (with debug messages enabled) to understand the firmware upload process:

https://mynewt.apache.org/latest/newtmgr/command_list/newtmgr_image.html

Also how to set the device date/time:

https://mynewt.apache.org/latest/newtmgr/command_list/newtmgr_datetime.html

And whether we can push notifications to the device.

# PinePhone Client

TODO

Waiting for PinePhone to be delivered. Client will probably be based on Newt Manager or MCU Manager, since Go is supported on Ubuntu Touch.

Will probably wrap the Go client in a Qt GUI app.  Or wrap with a Go GUI library: https://github.com/avelino/awesome-go#gui

# Android Client

TODO

Not started. Will explore this Android MCU Manager client for OTA Firmware Upgrade, coded in Java:

https://github.com/JuulLabs-OSS/mcumgr-android

# iOS Client

TODO

Not started. Will explore this iOS MCU Manager client for OTA Firmware Upgrade, coded in Swift:

https://github.com/JuulLabs-OSS/mcumgr-ios

Among all MCU Manager clients, the Swift version is easiest to understand because it calls high-level BLE functions:

https://github.com/JuulLabs-OSS/mcumgr-ios/blob/master/Source/Bluetooth/McuMgrBleTransport.swift

Now using this code to understand the MCU Manager upload protocol.

Refer to the iOS Core Bluetooth API:

https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/AboutCoreBluetooth/Introduction.html#//apple_ref/doc/uid/TP40013257-CH1-SW1

https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/PerformingCommonCentralRoleTasks/PerformingCommonCentralRoleTasks.html#//apple_ref/doc/uid/TP40013257-CH3-SW1

# Flutter Client for iOS and Android

TODO

Alternatively, we may build iOS and Android clients for MCU Manager in Flutter based on this BLE library:

https://github.com/pauldemarco/flutter_blue

This allows us to maintain a single code base to target both iOS and Android clients.

It looks feasible to build a Flutter client (coded in Dart) based on on this Dart BLE sample:

https://github.com/pauldemarco/flutter_blue/tree/master/example/lib

And adapting the iOS MCU Client code.

The Flutter app for PineTime would the MCU Manager functions from scratch. The app would be a great reference to teach how to talk to BLE and GATT services from iOS and Android, even though it won't be a polished app.

# Implementing MCUboot

TODO

MCUboot is not implemented in the Mynewt firmware for PineTime because it doesn't have an allocated slot in Flash ROM for storing the new firmware image. Refer to the Flash Memory Map:

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota/hw/bsp/nrf52/bsp.yml

Note that `FLASH_AREA_IMAGE_1` and `FLASH_AREA_IMAGE_SCRATCH` are not usable. 

The Flash Memory Map needs to be fixed for MCUboot to work.  The flashing scripts depend on these flash addresses, so the scripts may have to be changed too.

The Flash Memory Map should follow the Mynewt memory map for nRF52:

https://github.com/apache/mynewt-core/blob/master/hw/bsp/nordic_pca10040/bsp.yml

# MCUboot Enhancements

TODO

MCUboot should detect button press upon startup. If the button is pressed, rollback the old firmware. This allows the user to roll back faulty firmware that does not respond to OTA Firmware Upgrade commands.

The OTA Firmware Upgrade tool needs to ensure that the same firmware version doesn't get flashed twice.

The firmware must still implement a "Reset" or watchdog feature, or the user will have to wait for the battery to drain completely before running MCUboot.

The PineTime Mynewt firmware size is 205 KB with Newt Manager Library included. This is quite close to the 232 KB size limit, assuming 2 firmware images plus scratch storage in PineTime's 512 KB ROM.

MCUboot and MCU Manager should be enhanced to store the new and backup firmware images on PineTime's External SPI Flash (4 MB).

```
----- Build Mynewt and link with Rust app
+ newt build nrf52_my_sensor
Building target targets/nrf52_my_sensor
Linking /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
Target successfully built: targets/nrf52_my_sensor
+ newt size -v nrf52_my_sensor
Size of Application Image: app
Mem FLASH: 0x8000-0x7bc00
Mem RAM: 0x20000000-0x20010000
  FLASH     RAM 
    740     330 *fill*
   1018      98 apps_my_sensor_app.a
   1810     112 boot_bootutil.a
    438      26 boot_split.a
   1180       0 crypto_mbedtls.a
   2302       0 crypto_tinycrypt.a
    401       0 encoding_base64.a
   1622       0 encoding_cborattr.a
   3002       0 encoding_tinycbor.a
    440     444 hw_bsp_nrf52.a
     52       0 hw_cmsis-core.a
    706       1 hw_hal.a
   7074     154 hw_mcu_nordic_nrf52xxx.a
      2       0 hw_sensor_creator.a
   1264     260 hw_sensor.a
   8756   35712 kernel_os.a
   3044      50 libc_baselibc.a
     16       0 libs_mynewt_rust.a
  57400    9582 libs_rust_app.a
  12912       0 libs_rust_libcore.a
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
   4086    1203 nimble_drivers_nrf52.a
  41721    2797 nimble_host.a
    822     218 nimble_host_services_ans.a
    241     112 nimble_host_services_dis.a
    396     118 nimble_host_services_gap.a
    204      62 nimble_host_services_gatt.a
   1814     648 nimble_host_store_config.a
    114       0 nimble_host_util.a
    692    1096 nimble_transport_ram.a
   1578      54 sys_config.a
    634     128 sys_flash_map.a
      2       0 sys_log_modlog.a
    686      29 sys_mfg.a
    839      51 sys_reboot.a
    226      37 sys_sysdown.a
     30       5 sys_sysinit.a
   1746       0 time_datetime.a
    120       0 util_mem.a
    208       0 nrf52_my_sensor-sysinit-app.a
    166       0 libg.a
    968       0 libgcc.a
Loading compiler /Users/Luppy/PineTime/pinetime-rust-mynewt/repos/apache-mynewt-core/compiler/arm-none-eabi-m4, buildProfile debug

objsize
   text    data     bss     dec     hex filename
 205760     904   55224  261888   3ff00 /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
```

# Other PineTime Bluetooth Firmware Upgrade Solutions

1. Nordic SoftDevice includes a proprietary BLE DFU implementation: https://infocenter.nordicsemi.com/topic/com.nordic.infocenter.sdk5.v15.0.0/lib_bootloader_dfu_process.html

1. wasp-os with Adafruit NRF52 Bootloader (based on Nordic SoftDevice): https://github.com/daniel-thompson/wasp-os

1. Gadgetbridge for Android: https://gadgetbridge.org/

1. DaFlasher for Android: https://github.com/atc1441/DaFlasherFiles

# Log for Raspberry Pi Client

```
# Build Newt Manager on Raspberry Pi

$ cd ~/go
$ mkdir -p src/mynewt.apache.org
$ cd src/mynewt.apache.org/
$ git clone https://github.com/apache/mynewt-newtmgr
$ mv mynewt-newtmgr newtmgr
$ cd newtmgr/newtmgr
$ export GO111MODULE=on
$ go build

# Run Newt Manager on Raspberry Pi

$ cd ~/go/src/mynewt.apache.org/newtmgr/newtmgr
$ sudo ./newtmgr conn add mybleprph type=ble connstring="peer_name=pinetime"
Connection profile mybleprph successfully added

# List firmware images
$ sudo ./newtmgr image list -c mybleprph --loglevel debug
DEBU[2020-04-29 08:23:56.54] Using connection profile: name=mybleprph type=ble connstring=peer_name=pinetime
DEBU[2020-04-29 08:23:56.701] Connecting to peer
DEBU[2020-04-29 08:23:56.773] Exchanging MTU
DEBU[2020-04-29 08:23:56.822] Connecting to peer
DEBU[2020-04-29 08:23:56.907] Exchanging MTU
DEBU[2020-04-29 08:23:56.922] Exchanged MTU; ATT MTU = 256
DEBU[2020-04-29 08:23:56.922] Discovering profile
DEBU[2020-04-29 08:23:57.176] Subscribing to NMP response characteristic
DEBU[2020-04-29 08:23:57.191] {add-nmp-listener} [bll_sesn.go:392] seq=66
DEBU[2020-04-29 08:23:57.191] Encoded &{NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:1 Seq:66 Id:0}}} to:
00000000  a0                                                |.|
DEBU[2020-04-29 08:23:57.191] Encoded:
00000000  00 00 00 01 00 01 42 00  a0                       |......B..|
DEBU[2020-04-29 08:23:57.191] Tx NMP request: 00000000  00 00 00 01 00 01 42 00  a0                       |......B..|
DEBU[2020-04-29 08:23:57.213] rx nmp response: 00000000  01 00 00 86 00 01 42 00  bf 66 69 6d 61 67 65 73  |......B..fimages|
00000010  9f bf 64 73 6c 6f 74 00  67 76 65 72 73 69 6f 6e  |..dslot.gversion|
00000020  65 31 2e 30 2e 30 64 68  61 73 68 58 20 ea b2 88  |e1.0.0dhashX ...|
00000030  69 47 a1 df 6f 85 04 63  60 1f 3d ad 40 94 11 d7  |iG..o..c`.=.@...|
00000040  ea 21 85 5e b0 a7 0e 96  57 32 25 8c 92 68 62 6f  |.!.^....W2%..hbo|
00000050  6f 74 61 62 6c 65 f5 67  70 65 6e 64 69 6e 67 f4  |otable.gpending.|
00000060  69 63 6f 6e 66 69 72 6d  65 64 f5 66 61 63 74 69  |iconfirmed.facti|
00000070  76 65 f5 69 70 65 72 6d  61 6e 65 6e 74 f4 ff ff  |ve.ipermanent...|
00000080  6b 73 70 6c 69 74 53 74  61 74 75 73 00 ff        |ksplitStatus..|
DEBU[2020-04-29 08:23:57.214] Received nmp rsp: &{NmpBase:{hdr:{Op:1 Flags:0 Len:134 Group:1 Seq:66 Id:0}} Rc:0 Images:[{NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:0 Seq:0 Id:0}} Image:0 Slot:0 Version:1.0.0 Hash:[234 178 136 105 71 161 223 111 133 4 99 96 31 61 173 64 148 17 215 234 33 133 94 176 167 14 150 87 50 37 140 146] Bootable:true Pending:false Confirmed:true Active:true Permanent:false}] SplitStatus:N/A}
DEBU[2020-04-29 08:23:57.214] {remove-nmp-listener} [bll_sesn.go:392] seq=66
Images:
 image=0 slot=0
    version: 1.0.0
    bootable: true
    flags: active confirmed
    hash: eab2886947a1df6f850463601f3dad409411d7ea21855eb0a70e965732258c92
Split status: N/A (0)
```

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)