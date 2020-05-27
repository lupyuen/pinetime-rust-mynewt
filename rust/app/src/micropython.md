# Porting MicroPython and wasp-os to Mynewt on PineTime Smart Watch (nRF52)

![MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch](https://lupyuen.github.io/images/micropython-title.jpg])

_MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch_

[wasp-os](https://wasp-os.readthedocs.io/en/latest/README.html), built with [MicroPython](https://micropython.org/), is highly popular with folks coding the [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) for the very first time...

_Because there's no easier way to create a Watch App for PineTime!_

Just write a simple Python script, upload it wirelessly to wasp-os and watch it run!

And if the script doesn't work right? Just connect over Bluetooth and troubleshoot live with the REPL (Read-Eval-Print Loop) command line!

Today wasp-os works great on Bare Metal (i.e. PineTime hardware). It doesn't require an embedded operating system, because the underlying MicroPython runtime serves as a bare-bones operating system.

_How shall we make wasp-os better?_

Here's what I think...

1. __Easier Installation__

    What if PineTime Owners can unbox their smart watches... And install wasp-os wirelessly through their phones? No more messy wiring to the SWD Port inside PineTime!

    And we'll let PineTime Owners switch and test drive any operating system wirelessly: wasp-os, FreeRTOS, Mynewt, RIOT, Zephyr, ... Without opening their watches!

    We're getting ready a common bootloader and common firmware update mechanism that will be preloaded by Pine64 into PineTime watches... Would be terrific to have wasp-os and MicroPython on board!

1. __PineTime Companion App for Android, iOS and PinePhone__

    A common Companion App for PineTime that updates the firmware, uploads Watch Apps and lets you interact via the REPL command line... That works on Android, iOS and PinePhone!

    If you have a Raspberry Pi, the Companion App will run too! (Using Pi's onboard Bluetooth hardware)

    We're creating the Companion App now... And we hope to have wasp-os adopting the Simple Management Protocol that's used by Mynewt, RIOT, FreeRTOS and Zephyr.

1. __Simpler Firmware Debugging with Raspberry Pi and VSCode__

    For newbies who have mastered MicroPython programming on PineTime, perhaps they would like to dig deeper into the internals of wasp-os firmware, make some tweaks, experiment with the Bluetooth stack, ...

    Let's make it easier for them to explore! Just connect a Raspberry Pi to PineTime's SWD Port (yep slightly messy) and step through the firmware code with the VSCode Debugger.

    Or just study the helpful debugging messages that will be displayed in OpenOCD, thanks to the SWD Semihosting Console. (Shown in the photo above)

1. __Preemptive Multitasking__

    MicroPython comes with simple task management. Perhaps we should get ready to support Watch Apps that require full multitasking?

    If we build a MicroPython Watch App that talks to other watches over Bluetooth Mesh... Surely we'll need some kind of background processing?

1. __Best Buddies with other Operating Systems__

    PineTime feels like a rowdy playground sometimes... Kids (i.e. various PineTime Firmware) come and go as they please, messing up the sandbox (e.g. PineTime's SPI Flash) for the other players.

    Can we turn PineTime into a safer, happier playground for all? 
    
    Adopting a common filesystem (like littlefs) with fixed parameters (SPI Flash location) may help.

We could port NimBLE, MCUBoot and MCU Manager Library to MicroPython. And add a sophisticated Task Scheduler.

_Sounds daunting!_

Or we could host wasp-os and MicroPython on Mynewt, which already includes NimBLE, MCUBoot, MCU Manager and preemptive multitasking.

Hosting MicroPython on another operating system isn't that new... It has been done with [Zephyr](https://github.com/micropython/micropython/tree/master/ports/zephyr), which is similar to Mynewt.

_What could go wrong?_

There are plenty of risks in running wasp-os and MicroPython on Mynewt instead of Bare Metal...

1. __MicroPython is Dynamic__

    vs static and stack

1. Heap memory

1. Multitasking single stack

1. Repl

1. Wasp-os dependency

    https://github.com/micropython/micropython/tree/master/ports/nrf

1. Task scheduler

1. And most ominous of all: I have failed before!

    But now I'm older, wiser and I have much better hardware (PineTime vs Blue Pill)

    Second attempt: https://github.com/lupyuen/bluepill-micropython

This is an experimental assessment feasibility and it seems hopeful. Read on for the details.

Bare bones

Display clock: SPI, GPIO

And the challenges ahead

# Porting nRF to Mynewt

TODO

# GPIO Driver

TODO

# SPI Driver

TODO

# I2C Driver

TODO

# Heap Memory

TODO

# Semihosting Console

TODO

# Task Scheduler

TODO

# VSCode Workspace

TODO

# Debug with VSCode and ST-Link

TODO

# Testing wasp-os and MicroPython with Mynewt

TODO

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)_

WASP-OS’s documentation

https://wasp-os.readthedocs.io/en/latest/

Application Writer’s Guide

https://wasp-os.readthedocs.io/en/latest/appguide.html

Wasp-os Reference Manual

https://wasp-os.readthedocs.io/en/latest/wasp.html

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
