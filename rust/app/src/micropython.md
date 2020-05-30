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

![GPIO Driver](https://lupyuen.github.io/images/micropython-hal1.png)

# GPIO Driver

The GPIO Driver is essential for our demo... Because PineTime's Backlight is controlled by GPIO and PineTime's screen will be totally dark without the Backlight!

Let's look at the current implementation of the GPIO Driver on MicroPython: [`ports/nrf/mphalport.h`](https://github.com/micropython/micropython/blob/master/ports/nrf/mphalport.h)

```c
#define mp_hal_pin_high(p) \
        nrf_gpio_pin_set(p->pin)

#define mp_hal_pin_low(p) \     
        nrf_gpio_pin_clear(p->pin)
```

To set a pin high or low, the GPIO Driver (from the nRF Port) calls the functions `nrf_gpio_pin_set()` and `nrf_gpio_pin_clear()`, which are provided by the [Nordic nRF5 SDK](https://infocenter.nordicsemi.com/topic/sdk_nrf5_v16.0.0/group__nrf__gpio__hal.html)

Clearly this GPIO Driver (nRF Port) is directly manipulating the bare hardware of PineTime.

Compare that with the Mynewt Port: [`ports/mynewt/mphalport.h`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/mphalport.h)

```c
#define mp_hal_pin_high(p) \
        hal_gpio_write(p->pin, 1)

#define mp_hal_pin_low(p) \
        hal_gpio_write(p->pin, 0)
```

This GPIO Driver calls the functions `hal_gpio_write()` and `hal_gpio_write()` provided by [__Mynewt's Hardware Abstraction Layer__](https://mynewt.apache.org/latest/os/modules/hal/hal_gpio/hal_gpio.html).

Thus we are no longer manipulating PineTime hardware directly... We are doing it through an embedded operating system (Mynewt).  

And we get to enjoy all the benefits of the embedded operating system! Multitasking, firmware updates, Bluetooth support, ...

Here's how we configure and read a GPIO pin by calling [Mynewt's Hardware Abstraction Layer](https://mynewt.apache.org/latest/os/modules/hal/hal_gpio/hal_gpio.html)... 

```c
#define mp_hal_pin_read(p) \
        hal_gpio_read(p->pin)

#define mp_hal_pin_open_drain(p) \
        hal_gpio_init_in(p->pin, HAL_GPIO_PULL_NONE)
```

With this simple reprogramming, we have done enough to switch on PineTime's Backlight for our experiment.

Some GPIO functions have yet to be implemented, like in [`modules/machine/pin.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/pin.c)...

```c
STATIC mp_obj_t pin_irq(
    size_t n_args, 
    const mp_obj_t *pos_args, 
    mp_map_t *kw_args) { ...
```

`pin_irq()` is called by MicroPython to configure the interrupt that will be triggered when an input GPIO pin switches its state from high to low (or low to high). This will be useful for handling the pressing of PineTime's watch button, since it's connected to a GPIO pin.

Eventually `pin_irq()` shall be reprogrammed to call the equivalent function in Mynewt: [`hal_gpio_irq_init()`](https://mynewt.apache.org/latest/os/modules/hal/hal_gpio/hal_gpio.html#c.hal_gpio_irq_init)

Moving on to SPI...

![SPI Driver](https://lupyuen.github.io/images/micropython-hal2.png)

# SPI Driver

Now that we have reprogrammed the GPIO Driver from Bare Metal PineTime to Mynewt, let's do the same for the SPI Driver. 

PineTime's [Sitronix ST77889 Display Controller](https://wiki.pine64.org/images/5/54/ST7789V_v1.6.pdf) is controlled via SPI, thus we shall port the SPI Driver to Mynewt for rendering graphics.

Porting the SPI Driver really is really easy... No initialisation needed!

Mynewt starts its SPI Driver automatically upon startup, according to the settings in [`apps/my_sensor_app/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/syscfg.yml)

```yaml
# System Configuration Setting Values:
#   Below we override the driver and library settings. Settings defined in
#   targets/nrf52_my_sensor/syscfg.yml will override the settings below.

syscfg.vals:
    SPI_0_MASTER:           1  # Enable SPI port 0 for ST7789 display and SPI Flash
```

The pins for the SPI port are defined in [`hw/bsp/nrf52/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/hw/bsp/nrf52/syscfg.yml)

```yaml
syscfg.vals:
    ###########################################################################
    # Default Pins for Peripherals
    # Defined in http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf

    # SPI port 0 connected to ST7789 display and XT25F32B flash
    SPI_0_MASTER_PIN_SCK:  2  # P0.02/AIN0: SPI-SCK, LCD_SCK    SPI clock for display and flash
    SPI_0_MASTER_PIN_MOSI: 3  # P0.03/AIN1: SPI-MOSI, LCD_SDI   SPI MOSI for display and flash
    SPI_0_MASTER_PIN_MISO: 4  # P0.04/AIN2: SPI-MISO            SPI MISO for flash only
```

What about the MicroPython driver code? Only one SPI Driver function needs to be reprogrammed in [`modules/machine/spi.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/spi.c)

```c
/// Called by MicroPython to transmit and receive a chunk of data over the SPI port
void spi_transfer(
    const machine_hard_spi_obj_t * self,  //  MicroPython instance of the SPI Driver (not used here)
    size_t len,         //  Number of bytes to send / receive
    const void * src,   //  Transmit Buffer
    void * dest         //  Receive Buffer
) {
    int rc = hal_spi_txrx(
        SPI_PORT,       //  Mynewt SPI Port (hardcoded to 0)
        (void *) src,   //  Transmit Buffer
        dest,           //  Receive Buffer
        len             //  Length
    );
    if (rc != 0) { mp_raise_ValueError("SPI TX failed"); }
}
```

Whenever MicroPython calls `spi_transfer()` in our Mynewt Port to transmit and receive a chunk of data over SPI, we forward the call to [`hal_spi_txrx()`](https://mynewt.apache.org/latest/os/modules/hal/hal_spi/hal_spi.html#c.hal_spi_txrx). That's the equivalent SPI function in the Mynewt Hardware Abstraction Layer.

_The SPI Driver in the Mynewt Port for MicroPython is now ready!_

We'll see the SPI Driver in action when [wasp-os's ST7789 Driver](https://github.com/lupyuen/wasp-os/blob/master/wasp/drivers/st7789.py) calls our SPI Driver to render the watch face.

Finally, I2C...

![I2C Driver](https://lupyuen.github.io/images/micropython-hal3.png)

# I2C Driver

TODO

The GPIO Driver is essential for our demo... Because PineTime's Backlight is controlled by GPIO and PineTime's screen will be totally dark without the Backlight!

[`hw/bsp/nrf52/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/hw/bsp/nrf52/syscfg.yml)

```yaml
syscfg.vals:
    # Enable nRF52832 MCU
    MCU_TARGET: nRF52832

    ###########################################################################
    # Default Pins for Peripherals
    # Defined in http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf

    # SPI port 0 connected to ST7789 display and XT25F32B flash
    SPI_0_MASTER_PIN_SCK:  2  # P0.02/AIN0: SPI-SCK, LCD_SCK    SPI clock for display and flash
    SPI_0_MASTER_PIN_MOSI: 3  # P0.03/AIN1: SPI-MOSI, LCD_SDI   SPI MOSI for display and flash
    SPI_0_MASTER_PIN_MISO: 4  # P0.04/AIN2: SPI-MISO            SPI MISO for flash only

    # I2C port 1 connected to CST816S touch controller, BMA421 accelerometer, HRS3300 heart rate sensor 
    I2C_1_PIN_SCL: 7  # P0.07: BMA421-SCL, HRS3300-SCL, TP-SCLOUT
    I2C_1_PIN_SDA: 6  # P0.06: BMA421-SDA, HRS3300-SDA, TP-SDAI/O
```

[`apps/my_sensor_app/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/syscfg.yml)

```yaml
# System Configuration Setting Values:
#   Below we override the driver and library settings. Settings defined in
#   targets/nrf52_my_sensor/syscfg.yml will override the settings below.

syscfg.vals:
    ###########################################################################
    # Hardware Settings

    SPI_0_MASTER:           1  # Enable SPI port 0 for ST7789 display and SPI Flash
    I2C_1:                  1  # Enable I2C port 1 for CST816S touch controller, BMA421 accelerometer, HRS3300 heart rate sensor
```

https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/i2c.c

```c
mp_obj_t machine_hard_i2c_make_new(
    const mp_obj_type_t *type, 
    size_t n_args, 
    size_t n_kw, 
    const mp_obj_t *all_args
) {
    struct hal_i2c_settings settings = {
        .frequency = 400,  //  Set to the highest I2C frequency 400 Kbps
    };
    int rc = hal_i2c_config(
        I2C_PORT, 
        &settings
    );
    if (rc != 0) { mp_raise_ValueError("I2C init failed"); }

    const machine_hard_i2c_obj_t *self = &machine_hard_i2c_obj[I2C_PORT];
    return MP_OBJ_FROM_PTR(self);
}
```

https://mynewt.apache.org/latest/os/modules/hal/hal_i2c/hal_i2c.html#c.hal_i2c_config

```c
/// Return the number of bytes transferred, or in case of error, a negative MP error code.
int machine_hard_i2c_transfer_single(
    mp_obj_base_t *self_in, 
    uint16_t addr, 
    size_t len, 
    uint8_t *buf, 
    unsigned int flags
) {
    struct hal_i2c_master_data master_data = {
        .address = addr,
        .len = len,
        .buffer = buf,
    };
    if (flags & MP_MACHINE_I2C_FLAG_READ) {  //  If reading from I2C...
        int rc_read = hal_i2c_master_read(
            I2C_PORT, 
            &master_data, 
            I2C_TIMEOUT, 
            1          //  1 means this is the last I2C operation. So we can terminate after this.
        );    
        if (rc_read != 0) { return check_i2c_return_code(rc_read); }
    } else {  //  If writing to I2C...
        int rc_write = hal_i2c_master_write(
            I2C_PORT, 
            &master_data, 
            I2C_TIMEOUT, 
            1        //  1 means this is the last I2C operation. So we can terminate after this.
        );
        if (rc_write != 0) { return check_i2c_return_code(rc_write); }
    }
    return len;
}
```

https://mynewt.apache.org/latest/os/modules/hal/hal_i2c/hal_i2c.html#c.hal_i2c_master_read

https://mynewt.apache.org/latest/os/modules/hal/hal_i2c/hal_i2c.html#c.hal_i2c_master_write

https://github.com/lupyuen/wasp-os/blob/master/wasp/drivers/cst816s.py

# Heap Memory

TODO

Mynewt config

https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/syscfg.yml

```yaml
syscfg.vals:
    OS_MAIN_STACK_SIZE: 2048  #  8 KB. Previously 4096 (16 KB)

    # For Bluetooth LE: Lots of smaller mbufs are required for newtmgr using typical BLE ATT MTU values.
    MSYS_1_BLOCK_COUNT:   22  #  Defaults to 12. Previously 64
    MSYS_1_BLOCK_SIZE:   110  #  Defaults to 292
```

# Semihosting Console

TODO

printf

# Bluetooth Driver

TODO

UART

# Task Scheduler

TODO

# Other Drivers

https://github.com/lupyuen/wasp-os/tree/master/wasp/drivers

SPI Flash

battery

nrf_rtc

signal

vibrator.py

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
