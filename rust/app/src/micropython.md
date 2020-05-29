# Porting MicroPython and wasp-os to Mynewt on PineTime Smart Watch (nRF52)

![MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch. VSCode Debugger is shown on the monitor](https://lupyuen.github.io/images/micropython-title.jpg)

_MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch. VSCode Debugger is shown on the monitor_

[__wasp-os__](https://wasp-os.readthedocs.io/en/latest/README.html), built with [__MicroPython__](https://micropython.org/), is highly popular with folks coding [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime) for the very first time...

_Because there's no easier way to create a Watch App for PineTime!_

Just write a simple Python script, upload it wirelessly to wasp-os and watch it run!

And if the script doesn't work right? Just connect over Bluetooth and troubleshoot live with the REPL (Read-Eval-Print Loop) command line!

Today wasp-os works great on Bare Metal (i.e. PineTime hardware). It doesn't require an embedded operating system, because the underlying MicroPython runtime serves as a bare-bones operating system.

![MicroPython and wasp-os on PineTime](https://lupyuen.github.io/images/micropython-mynewt0.png)

# Better MicroPython and wasp-os on PineTime

_How shall we make wasp-os better?_

I'm now coding these enhancements in MicroPython...

1. __Easier Installation__

    What if PineTime Owners can unbox their smart watches... And install wasp-os wirelessly through their phones? No more messy wiring to the SWD Port inside PineTime!

    And we'll let PineTime Owners switch and test drive any operating system wirelessly: wasp-os, FreeRTOS, Mynewt, RIOT, Zephyr, ... Without opening their watches!

    We're getting ready a [Common Bootloader](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot) and [Firmware Update mechanism](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu) that will be preloaded by Pine64 into PineTime watches... Would be terrific to have wasp-os and MicroPython on board!

    More about this in a while.

1. __PineTime Companion App for Android, iOS and PinePhone__

    A common Companion App for PineTime that updates the firmware, uploads Watch Apps and lets you interact via the REPL command line... That works on Android, iOS and PinePhone!

    If you have a Raspberry Pi, the Companion App will run too! (Using Pi's onboard Bluetooth hardware)

    We're creating the Companion App now... And we hope to have wasp-os adopting the [Simple Management Protocol](https://github.com/apache/mynewt-mcumgr) that's used by Mynewt, RIOT, FreeRTOS and Zephyr.

    We have a solution for this... More about this later.

1. __Simpler Firmware Debugging with Raspberry Pi and VSCode__

    For newbies who have mastered MicroPython programming on PineTime, perhaps they would like to dig deeper into the internals of wasp-os firmware, make some tweaks, experiment with the Bluetooth stack, ...

    Let's make it easier for them to explore! Just connect a Raspberry Pi to PineTime's SWD Port (yep slightly messy) and step through the firmware code with the VSCode Debugger.

    Or just study the helpful debugging messages that will be displayed in OpenOCD, thanks to the SWD Semihosting Console. 
    
    Check out this video of wasp-os and MicroPython debug messages displayed on the Semihosting Console with OpenOCD and VSCode...

    - [Watch on YouTube](https://youtu.be/_mhxvYG9Qos)

    - [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.0/micropython-semihosting-rotated.mp4)

1. __Preemptive Multitasking__

    MicroPython comes with simple task management. Perhaps we should get ready to support Watch Apps that require full multitasking?

    If we build a MicroPython Watch App that talks to other watches over Bluetooth Mesh... Surely we'll need some kind of background processing?

1. __Best Buddies with other Operating Systems__

    PineTime feels like a rowdy playground sometimes... Kids (i.e. various PineTime Firmware) come and go as they please, messing up the sandbox (e.g. PineTime's SPI Flash) for the other players.

    Can we turn PineTime into a safer, happier playground for all? 
    
    Adopting a common filesystem (like littlefs) with fixed parameters (SPI Flash location) may help.

    ![PineTime Bootloader's Boot Graphic (stored in SPI Flash) unintentionally scratched (top left) by the firmware](https://lupyuen.github.io/images/micropython-scratch.png)

    _PineTime Bootloader's Boot Graphic (stored in SPI Flash) unintentionally scratched (top left) by the firmware_

# Host MicroPython and wasp-os on Mynewt

To make wasp-os truly awesome with interoperable firmware updates (and a common companion app), we could add to MicroPython the following open source components...

1. [NimBLE Bluetooth Networking Stack](https://github.com/apache/mynewt-nimble)

1. [MCUBoot Bootloader](https://juullabs-oss.github.io/mcuboot/)

1. [MCU Manager Library](https://github.com/apache/mynewt-mcumgr) for Simple Management Protocol

1. And a sophisticated Task Scheduler

![MicroPython and wasp-os without Mynewt](https://lupyuen.github.io/images/micropython-mynewt1.png)

_Looks daunting!_

Or we could __host wasp-os and MicroPython on Mynewt,__ which already includes NimBLE, MCUBoot, MCU Manager and [Preemptive Multitasking](https://mynewt.apache.org/latest/os/core_os/mynewt_os.html)...

![MicroPython and wasp-os hosted on Mynewt](https://lupyuen.github.io/images/micropython-mynewt2.png)

That's the approach we'll explore. Hosting MicroPython on another operating system isn't new... It has been done with [Zephyr](https://github.com/micropython/micropython/tree/master/ports/zephyr), which is similar to Mynewt.

_What could go wrong?_

There are plenty of risks in running wasp-os and MicroPython on Mynewt instead of Bare Metal...

1. __MicroPython is Dynamic, Mynewt is Not__

    MicroPython allocates objects dynamically in __Heap Memory.__ When Heap Memory runs low, the Garbage Collector sweeps the memory and reclaims space for new objects.

    Traditional embedded operating systems are engineered to be highly predictable and less flexible. Objects live in __Static Memory and Stack Memory,__ not in Heap Memory.
    
    _Embedded operating systems like Mynewt will get spooked by Dynamic Objects in MicroPython!_

    Heap Memory needs to be managed really carefully with Mynewt.

1. __MicroPython is blissfully unaware of Multitasking__

    MicroPython runs mostly as a single task with a single stack. Easy peasy!

    Mynewt runs with multiple tasks and multiple stacks. Tasks communicate by passing Events.
    
    So it gets messy when we try to give MicroPython the illusion that it's running all alone by itself... MicroPython needs to share the CPU and RAM with Mynewt tasks now.

1. __wasp-os Complexity__

    By inserting an embedded operating system (Mynewt) under MicroPython, it increases the complexity of the entire wasp-os firmware.

    We'll have to manage this complexity very carefully: We shall make changes only to the MicroPython layer, not to the wasp-os layer.

1. And most ominous of all: __I have failed before!__

    My first hacking experience with MicroPython was on [STM32 Blue Pill](https://github.com/lupyuen/bluepill-micropython)... It failed miserably.

    But now I'm older, wiser and I have much better hardware (PineTime vs Blue Pill)... I might succeed!

Here goes the experiment to assess whether it's really feasible to improve wasp-os by hosting it on top of Mynewt. 

Our objective is simple: To boot up wasp-os on Mynewt and render a watch face on PineTime.

Read on for the details.

![Objective Accomplished! wasp-os rendering a watch face with Mynewt on PineTime. At right is the ST-Link debugger](https://lupyuen.github.io/images/micropython-watch.jpg)

_Objective Accomplished! wasp-os rendering a watch face with Mynewt on PineTime. At right is the ST-Link debugger_

# Hardware Abstraction Layer for PineTime

Embedded operating systems (like Mynewt) are designed to run on multuple hardware platforms (like PineTime). That's why they include a [__Hardware Abstraction Layer__](https://mynewt.apache.org/latest/os/modules/hal/hal.html) that wraps low-level __hardware-specific code__ (like writing to SPI registers) into high-level __hardware-independent functions__ (like sending a chunk of data to the SPI port).

The Hardware Abstraction Layer is used on PineTime like this...

![Hardware Abstraction Layer in PineTime](https://lupyuen.github.io/images/micropython-hal.png?1)

In MicroPython, the Hardware Abstraction Layers for various hardware platforms are located in the __Ports__ folder, coded in C...

- __MicroPython Ports:__ [`github.com/micropython/micropython/ports`](https://github.com/micropython/micropython/tree/master/ports)

PineTime uses the __nRF Port__, which runs on nRF51 and nRF52 hardware...

- __MicroPython nRF Port:__ [`ports/nrf`](https://github.com/micropython/micropython/tree/master/ports/nrf)

For this experiment we cloned the nRF Port to create a new __Mynewt Port__ that will run on Mynewt (instead of bare hardware)...

- __MicroPython Mynewt Port:__ [`ports/mynewt`](https://github.com/AppKaki/micropython/tree/wasp-os/ports/mynewt)

Let's look inside the Mynewt Port.

# Mynewt Port for MicroPython

Remember that a MicroPython Port works like a Hardware Abstraction Layer... It contains high-level functions for accessing the GPIO, SPI and I2C hardware interfaces.  Let's learn how the Mynewt Port of MicroPython implements these high-level functions in C.

## Configuration

Here are the configuration files for the Mynewt Port of MicroPython...

- [`mpconfigport.h`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/mpconfigport.h): Configures MicroPython Runtime features, like REPL and code compilation

- [`boards/pinetime/mpconfigboard.h`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/boards/pinetime/mpconfigboard.h): Configures PineTime's Hardware features, like SPI

- [`boards/pinetime/pins.csv`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/boards/pinetime/pins.csv): Defines PineTime's Hardware Pins and their functions (GPIO, SPI, I2C)

## Peripheral Drivers: GPIO, I2C, SPI

PineTime's nRF52 Microcontroller has onboard functions like GPIO, I2C, SPI, UART, Timers, ... We call them __Peripherals__.

- [`modules/machine`](https://github.com/AppKaki/micropython/tree/wasp-os/ports/mynewt/modules/machine) folder contains the driver code in C for the nRF52 Peripherals

- We have reprogrammed the GPIO, SPI and I2C Drivers to work with Mynewt's Hardware Abstraction Layer. More about this later.

- Peripheral Drivers from MicroPython that we haven't ported to Mynewt: Analog-to-Digital Converter, Pulse Width Modulation, Real Time Clock, Temperature Sensor, Timer, UART

## Other Drivers

There are other MicroPython drivers for PineTime's nRF52 Microcontroller that we haven't ported to Mynewt yet. The drivers may be found in these folders...

- [`modules`](https://github.com/AppKaki/micropython/tree/wasp-os/ports/mynewt/modules): Bluetooth LE, LED, Music, Random Number Generator, BluePy, OS, Time

- [`drivers`](https://github.com/AppKaki/micropython/tree/wasp-os/ports/mynewt/drivers): Bluetooth, Flash ROM, Soft PWM, Ticker, Watchdog

## Start MicroPython

- [`main.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/main.c) contains the `start_micropython()` function that starts the MicroPython Runtime (including the REPL command line)

- `start_micropython()` is called by Mynewt during startup

- Heap Memory for MicroPython is also defined in [`main.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/main.c) as a Static Array. More about this later.

## Reset Handler, Vector Table and Linker Script

Every PineTime Firmware requires a __Reset Handler__ function to defined. It's the first function that's called when the firmware starts.

The firmware should also contain a __Vector Table__, which is a list of pointers to functions that will handle interrupts and exceptions on PineTime.

The __Linker Script__ is used by the GCC Linker while building the firmware to determine the addresses in ROM and RAM for placing the firmware code and data.

The Reset Handler, Vector Table and Linker Script are mandatory for every MicroPython Port (including the nRF Port). But for the Mynewt Port, they are not used because we'll be using the Reset Handler, Vector Table and Linker Script from Mynewt instead.

- [`device`](https://github.com/AppKaki/micropython/tree/wasp-os/ports/mynewt/device) folder contains the MicroPython Reset Handler and Vector Table

    They are not used in the Mynewt Port, we're using the Reset Handler and Vector Table from Mynewt: [`hw/bsp/nrf52/src/arch/cortex_m4/gcc_startup_nrf52.s`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/hw/bsp/nrf52/src/arch/cortex_m4/gcc_startup_nrf52.s)

- [`boards`](https://github.com/AppKaki/micropython/tree/wasp-os/ports/mynewt/boards) folder contains the MicroPython Linker Script

    This Linker Script is not used in the Mynewt Port, we're using the Linker Script from Mynewt: [`hw/bsp/nrf52/nrf52xxaa.ld`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/hw/bsp/nrf52/nrf52xxaa.ld)

Let's study the code for the GPIO, SPI and I2C Drivers in the Mynewt Port for MicroPython... And understand how they call Mynewt's Hardware Abstraction Layer.

# GPIO Driver

TODO

The GPIO Driver is essential for our demo... Because PineTime's Backlight is controlled by GPIO and PineTime's screen will be totally black without the Backlight!

https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/pin.c

# SPI Driver

TODO

https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/spi.c

# I2C Driver

TODO

https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/i2c.c

# Heap Memory

TODO

# Semihosting Console

TODO

# Bluetooth Driver

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
