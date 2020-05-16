# MCUBoot Bootloader for PineTime Smart Watch (nRF52)

![Enhanced MCUBoot Bootloader running on PineTime Smart Watch](https://lupyuen.github.io/images/mcuboot-photo2-small.jpg)

_Enhanced MCUBoot Bootloader running on PineTime Smart Watch_

Today we'll talk about the __Enhanced MCUBoot Bootloader__ for PineTime Smart Watch. Here's a sneak peek of the Enhanced MCUBoot Bootloader running on PineTime...

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

# ST7789 Display Controller on PineTime

# Render Boot Graphic from SPI Flash on PineTime

# Write Boot Graphic to SPI Flash on PineTime

# PineTime Boot Library

# Manual Firmware Rollback on PineTime

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)
