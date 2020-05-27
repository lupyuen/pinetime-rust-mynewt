# Porting MicroPython and wasp-os to Mynewt on PineTime Smart Watch (nRF52)

![MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch](https://lupyuen.github.io/images/micropython-title.jpg])

_MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch_

[wasp-os](https://wasp-os.readthedocs.io/en/latest/README.html), built with [MicroPython](https://micropython.org/), is highly popular with folks coding the [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) for the very first time...

1. No easier way to create a Watch App!

    Easy scripting

    repl

wasp-os works great on Bare Metal (i.e. PineTime hardware).

_How shall we make it better?_

1. Easier Installation

    What if PineTime Owners can unbox their smart watch... 

    Other FreeRTOS, Mynewt, ...

    Test drive

1. Companion App: Android, iOS and PinePhone?

    For updating wasp-os firmware? And REPL?

    Raspberry Pi (with onboard Bluetooth)

1. Simpler Firmware Debugging with Raspberry Pi, VSCode and Semihosting Console

1. Preemptive Multitasking

1. Best Buddies with other operating systems

We could port NimBLE, MCUBoot and MCU Manager Library to MicroPython

Or we could host wasp-os and MicroPython on Mynewt, which already includes NimBLE, MCUBoot and MCU Manager

Zephyr

https://github.com/micropython/micropython/tree/master/ports/zephyr

_What could go wrong?_

Plenty of risks...

1. Dynamic language

1. Heap memory

1. Multitasking single stack

1. Repl

1. Wasp-os dependency

    https://github.com/micropython/micropython/tree/master/ports/nrf

1. Task scheduler

1. Second attempt: https://github.com/lupyuen/bluepill-micropython

This is an experiment

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
