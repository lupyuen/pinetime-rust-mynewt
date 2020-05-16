# MCUBoot Bootloader for PineTime Smart Watch (nRF52)

![Enhanced MCUBoot Bootloader running on PineTime Smart Watch](https://lupyuen.github.io/images/mcuboot-photo2-small.jpg)

_Enhanced MCUBoot Bootloader running on PineTime Smart Watch_

Today we'll talk about the __Enhanced MCUBoot Bootloader__ for [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime). 

Here's a sneak peek of the Enhanced MCUBoot Bootloader running on PineTime...

[Watch video on Twitter](https://twitter.com/MisterTechBlog/status/1261568945728876544?s=20)

[Watch video on Mastodon](https://qoto.org/@lupyuen/104177098953236703)

We'll learn how the open-source MCUBoot Bootloader ([covered in an earlier article](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)) has been enhanced to support...

1. __SPI Flash__ for storing the Standby Firmware Image

1. __Rendering the Boot Graphic__ that's stored in SPI Flash 

    _(Because PineTime Owners should have the freedom to customise the way it looks!)_

1. __Manual Firmware Rollback__ when the watch button is pressed during startup

_...Without making any code changes to MCUBoot! (Amazing!)_

We'll see that the enhancements to MCUBoot were done through configuration files, and by adding some new functions.

_Isn't it easier to fork MCUBoot and change the code?_

We shall always resist the temptation to modify MCUBoot code... Because MCUBoot is a __Critical and Secure__ part of PineTime!

1. MCUBoot must __not be allowed to crash or hang__ due to buggy code.

    MCUBoot is the first thing that runs when PineTime starts up. If MCUBoot crashes or hangs, PineTime Owners will have a bricked watch on their wrists.

1. MCUBoot is designed to __start firmware securely,__ protected by digital signatures.

    Although we don't secure PineTime firmware today, MCUBoot may someday be used to verify that our firmware hasn't been tampered with.

    _(Because the data collected by our smart watches may be misused to harm us someday)_

# Updated Flash Memory Map for PineTime

[If you haven't read the earlier article on MCUBoot... Please do so now!](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)

Our earlier design for MCUBoot hit a showstopper... The Application Firmware size was limited to __232 KB__, which is too small acccording to PineTime Firmware Developers.

With Enhanced MCUBoot, we can now support firmware twice that size... Up to __464 KB__!  (Remember that PineTime's Flash ROM is only 512 KB)

_How did we get so much ROM space?_

We moved the Standby Firmware Image from PineTime's Flash ROM (512 KB) to PineTime's SPI Flash (4 MB).

During firmware update, the Standby Firmware slot is used as the staging area for the new firmware. On reboot, MCUBoot swaps the new firmware with the old firmware. If the new firmware doesn't start properly, MCUBoot swaps them back.

Here's the updated Flash Memory Map for PineTime. Note that the Standby Firmware Image is now stored in Flash Device 1 (SPI Flash) instead of Flash Device 0 (Internal ROM): [`hw/bsp/nrf52/bsp.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/bsp.yml)

```yaml
# Flash Memory Map for PineTime: Internal Flash ROM and External SPI Flash
bsp.flash_map:
    areas:
        # System areas.
        FLASH_AREA_BOOTLOADER:       # MCUBoot
            device:  0               # Internal Flash ROM
            offset:  0x00000000      # Start of Internal Flash ROM
            size:    24kB
        FLASH_AREA_IMAGE_0:          # Active Firmware Image
            device:  0               # Internal Flash ROM
            offset:  0x00008000
            size:    464kB           # Max size of Firmware Image
        FLASH_AREA_IMAGE_1:          # Standby Firmware Image
            device:  1               # External SPI Flash
            offset:  0x00040000
            size:    464kB           # Max size of Firmware Image
        FLASH_AREA_IMAGE_SCRATCH:    # Used by MCUBoot for swapping Active and Standby Firmware
            device:  0               # Internal Flash ROM
            offset:  0x0007c000
            size:    4kB

        # User areas.
        FLASH_AREA_REBOOT_LOG:       # For logging debug messages during startup
            user_id: 0
            device:  0               # Internal Flash ROM
            offset:  0x00006000
            size:    8kB
        # FLASH_AREA_BOOTLOADER_ASSET: # Bootloader Assets, like Boot Graphic
        #   user_id: 1
        #   device:  1               # External SPI Flash
        #   offset:  0x00000000      # Start of External SPI Flash
        #   size:    256kB
        FLASH_AREA_NFFS:             # For user files
            user_id: 1
            device:  1               # External SPI Flash
            offset:  0x000b4000
            size:    3376kB
```

[More about PineTime's SPI Flash](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)

Here's the layout for __PineTime's Flash ROM__...

| &nbsp;&nbsp;&nbsp;&nbsp; Flash ROM Area | Address        | Size |
| :---                  | :---              | ---:        |
| &nbsp;&nbsp;&nbsp;&nbsp; Bootloader (MCUBoot)  | `0x0000 0000`  | 24 KB |
| &nbsp;&nbsp;&nbsp;&nbsp; Reboot Log            | `0x0000 6000`  | 8 KB |
| &nbsp;&nbsp;&nbsp;&nbsp; __Active Firmware Image__  &nbsp;&nbsp;&nbsp;&nbsp;    | __`0x0000 8000`__  | &nbsp;&nbsp;&nbsp; __464 KB__ |
| &nbsp;&nbsp;&nbsp;&nbsp; Scratch Area          | `0x0007 C000`  | 4 KB |
|<br>|||

And the layout for __PineTime's SPI Flash__...

| &nbsp;&nbsp;&nbsp;&nbsp; SPI Flash Area | Address        | Size |
| :---                  | :---              | ---:        |
| &nbsp;&nbsp;&nbsp;&nbsp; Bootloader Assets     | `0x0000 0000`  | 256 KB |
| &nbsp;&nbsp;&nbsp;&nbsp; _Standby Firmware Image_ &nbsp;&nbsp;&nbsp;&nbsp; | `0x0004 0000`  | _464 KB_ |
| &nbsp;&nbsp;&nbsp;&nbsp; User File System      | `0x000B 4000`  | &nbsp;&nbsp;&nbsp;&nbsp; 3,376 KB |
|<br>|||

The __User File System__ has been bumped up to a whopping __3.2 MB__ (from 12 KB).

PineTime Watch Apps may store graphical assets and other app data in the User File System, once we install a Flash File System like littlefs.

[More about littlefs](https://github.com/ARMmbed/littlefs/blob/master/README.md)

[Supporting littlefs on PineTime](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)

_Bootloader Assets (256 KB) is a new flash area in SPI Flash. What's inside?_

The Enhanced MCUBoot Bootloader now renders a Boot Graphic that's 112.5 KB in size. The Boot Graphic is stored in the __Bootloader Assets__ flash area.

Half of the Bootloader Assets area is unused. We expect to use the free space to store fonts and other graphical assets that will be rendered by Enhanced MCUBoot.

Let's discover how PineTime's ST7789 Display Controller renders graphics...

# ST7789 Display Controller on PineTime

TODO

# Render Boot Graphic from SPI Flash on PineTime

TODO

Will not crash

# Write Boot Graphic to SPI Flash on PineTime

TODO

# PineTime Boot Library

TODO

# Manual Firmware Rollback on PineTime

TODO

# Test MCUBoot on PineTime

TOOD

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)
