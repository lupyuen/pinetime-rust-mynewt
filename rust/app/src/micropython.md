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
    SPI_0_MASTER: 1  # Enable SPI port 0 for ST7789 display and SPI Flash
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

We'll see the SPI Driver in action when wasp-os's ST7789 Driver calls our SPI Driver to render the watch face: [`wasp/drivers/st7789.py`](https://github.com/lupyuen/wasp-os/blob/master/wasp/drivers/st7789.py)

Finally, I2C...

![I2C Driver](https://lupyuen.github.io/images/micropython-hal3.png)

# I2C Driver

We won't be using the I2C Driver in the demo, because we won't be handling touch events from PineTime's Touch Controller.  But for completeness, here's how we ported MicroPython's I2C Driver to Mynewt...

Mynewt starts the I2C port automatically upon startup because of the settings in [`apps/my_sensor_app/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/syscfg.yml)

```yaml
# System Configuration Setting Values:
#   Below we override the driver and library settings. Settings defined in
#   targets/nrf52_my_sensor/syscfg.yml will override the settings below.

syscfg.vals:
    I2C_1: 1  # Enable I2C port 1 for CST816S touch controller, BMA421 accelerometer, HRS3300 heart rate sensor
```

The I2C pins are configured in [`hw/bsp/nrf52/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/hw/bsp/nrf52/syscfg.yml)

```yaml
syscfg.vals:
    ###########################################################################
    # Default Pins for Peripherals
    # Defined in http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf

    # I2C port 1 connected to CST816S touch controller, BMA421 accelerometer, HRS3300 heart rate sensor 
    I2C_1_PIN_SCL: 7  # P0.07: BMA421-SCL, HRS3300-SCL, TP-SCLOUT
    I2C_1_PIN_SDA: 6  # P0.06: BMA421-SDA, HRS3300-SDA, TP-SDAI/O
```

Note that the SPI and I2C ports are numbered globally in Mynewt... SPI goes to port 0 (`SPI_0`) and I2C goes to port 1 (`I2C_1`).  Thus we should never attempt to configure `SPI_1` or `I2C_0`.

Here's how we configure the I2C frequency for MicroPython: [`modules/machine/i2c.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/i2c.c)

```c
/// Called by MicroPython to initialise the I2C port
mp_obj_t machine_hard_i2c_make_new(
    const mp_obj_type_t *type,
    size_t n_args, 
    size_t n_kw, 
    const mp_obj_t *all_args
) {
    struct hal_i2c_settings settings = {
        .frequency = 400,     //  Set to the highest I2C frequency: 400 Kbps
    };
    int rc = hal_i2c_config(  //  Call Mynewt I2C HAL
        I2C_PORT,             //  Mynewt I2C Port (hardcoded to 1)
        &settings
    );
    if (rc != 0) { mp_raise_ValueError("I2C init failed"); }
    const machine_hard_i2c_obj_t *self = &machine_hard_i2c_obj[I2C_PORT];
    return MP_OBJ_FROM_PTR(self);
}
```

The code above calls [`hal_i2c_config()`](https://mynewt.apache.org/latest/os/modules/hal/hal_i2c/hal_i2c.html#c.hal_i2c_config) from Mynewt's I2C Hardware Abstraction Layer.

Here's how we transmit and receive I2C packets for MicroPython: [`modules/machine/i2c.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/modules/machine/i2c.c)

```c
/// Transmit or receive the buffer via I2C. Return the number of bytes transferred, or in case of error, a negative MP error code.
int machine_hard_i2c_transfer_single(
    mp_obj_base_t *self_in,  //  MicroPython instance of the I2C Driver (not used here)
    uint16_t addr,           //  I2C target address
    size_t len,              //  Number of bytes to transfer / receive
    uint8_t *buf,            //  Buffer to transfer and receive
    unsigned int flags       //  Whether this is a read or write operation
) {
    //  Set the transmit/receive parameters
    struct hal_i2c_master_data master_data = {
        .address = addr,
        .len = len,
        .buffer = buf,
    };
    if (flags & MP_MACHINE_I2C_FLAG_READ) {   //  If reading from I2C...
        int rc_read = hal_i2c_master_read(    //  Call Mynewt I2C HAL to receive data
            I2C_PORT,                         //  Mynewt I2C Port (hardcoded to 1)
            &master_data,                     //  Data will be received here
            I2C_TIMEOUT,                      //  Timeout in milliseconds (1,000)
            1  //  1 means this is the last I2C operation. So we can terminate after this.
        );    
        if (rc_read != 0) { return check_i2c_return_code(rc_read); }
    } else {                                  //  If writing to I2C...
        int rc_write = hal_i2c_master_write(  //  Call Mynewt I2C HAL to transmit data
            I2C_PORT,                         //  Mynewt I2C Port (hardcoded to 1)
            &master_data,                     //  Data to be transmitted
            I2C_TIMEOUT,                      //  Timeout in milliseconds (1,000)
            1  //  1 means this is the last I2C operation. So we can terminate after this.
        );
        if (rc_write != 0) { return check_i2c_return_code(rc_write); }
    }
    return len;
}
```

The code above calls [`hal_i2c_master_read()`](https://mynewt.apache.org/latest/os/modules/hal/hal_i2c/hal_i2c.html#c.hal_i2c_master_read) and [`hal_i2c_master_write()`](https://mynewt.apache.org/latest/os/modules/hal/hal_i2c/hal_i2c.html#c.hal_i2c_master_write) from Mynewt's I2C Hardware Abstraction Layer.

_How is this I2C Driver used in wasp-os?_

Check out the driver for the CST816S Touch Controller: [`wasp/drivers/cst816s.py`](https://github.com/lupyuen/wasp-os/blob/master/wasp/drivers/cst816s.py)

# Heap Memory in MicroPython

_How is RAM used by MicroPython?_

When MicroPython runs on Bare Metal (without an operating system), it uses three chunks of RAM to store objects...

1. __Static Memory__: Contains C objects that are Global or Static

1. __Stack Memory__: Contains C objects allocated on the stack inside function calls

1. __Heap Memory__: Contains MicroPython objects allocated dynamically, similar to calling `malloc()` in C

![RAM Usage with MicroPython](https://lupyuen.github.io/images/micropython-heap2.png)

Note that the Heap Memory and Stack Memory are not fixed.  They are allowed to grow and shrink, as long as the combined size fits within RAM.

_What happens when Stack Memory gets too close to Heap Memory?_

MicroPython performs Garbage Collection. It scans the Heap Memory and reclaims unused space for new objects.

_What happens when we run MicroPython on a multitasking operating system like Mynewt?_

With multitasking, all RAM needs to be carefully budgeted and partitioned like this...

![RAM Usage with Mynewt and MicroPython](https://lupyuen.github.io/images/micropython-heap.png)

1. __Mbuf Memory__: [Mbufs (Memory Buffers)](https://mynewt.apache.org/latest/os/core_os/mbuf/mbuf.html) are used for Bluetooth LE networking and by the Semihosting Console in Mynewt. Mbufs are fixed-size blocks of 110 bytes that may be chained together to form larger objects.

    _Why are Mbufs fixed size?_ 
    
    To prevent [fragmentation of the memory space](https://stackoverflow.com/questions/3770457/what-is-memory-fragmentation). Though coding with Mbufs is slightly more difficult.

1. __Idle Task__: With multitasking, there is no longer a common stack. Each task now requires its own Stack Memory. Even the Idle Task, which runs when no other tasks are running.

1. __Main Task__: This is the task that runs the MicroPython Runtime. The Stack Memory in the Main Task is used by MicroPython.

1. __Bluetooth Task__: This is the background task that handles Bluetooth LE packets. It requires its own Stack Memory too.

We no longer enjoy the grow-and-shink memory model that we have seen earlier... Every memory space must have a fixed size!

That's why we often discourage the use of Heap Memory on embedded operating systems... We can't really be sure when we'll run out of Heap Memory!

Let's find out how we allocated the Heap Memory in Mynewt.

# Heap Memory in Mynewt

For the Mynewt port of MicroPython, the Heap Memory is defined as a static array of 32 KB: [`ports/mynewt/main.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/main.c)

```c
/// Heap Memory for MicroPython
#define MICROPYTHON_HEAP_SIZE 32768
uint8_t micropython_heap[MICROPYTHON_HEAP_SIZE];

/// Called my Mynewt to start the MicroPython runtime
int start_micropython(void) {
    ...
    // Set the top of the stack
    void *stack_start = get_micropython_stack_start();
    void *stack_end   = get_micropython_stack_end();
    mp_stack_set_top(stack_end);

    // Stack limit not applicable to Mynewt, since stack and heap are in different regions
    mp_stack_set_limit((char*) stack_end - (char*) stack_start);

    // Initialise the Mynewt port
    machine_init();

    //  Allocate the MicroPython heap memory
    void *heap_start = &micropython_heap[0];
    void *heap_end   = &micropython_heap[MICROPYTHON_HEAP_SIZE];
    gc_init(heap_start, heap_end);
```

Note that the Stack Limit checking has been disabled, since we don't support grow-and-shrink Heap Memory with Mynewt.

32 KB is not a lot of Heap Memory... But it's sufficient for wasp-os to render a watch face on PineTime (which has 64 KB RAM).

The Stack Memory and Mbuf Memory sizes are defined in Mynewt: [`apps/my_sensor_app/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/syscfg.yml)

```yaml
syscfg.vals:
    OS_MAIN_STACK_SIZE: 2048  #  Main stack (includes MicroPython) is 8 KB. Previously 4096 (16 KB)

    # For Bluetooth LE: Lots of smaller mbufs are required for newtmgr using typical BLE ATT MTU values.
    MSYS_1_BLOCK_COUNT:   22  #  Defaults to 12. Previously 64
    MSYS_1_BLOCK_SIZE:   110  #  Defaults to 292
```

We reserved 8 KB of Stack Memory for Mynewt's Main Task, which also executes the MicroPython Runtime.

For the Mbuf Memory we allocated 22 Mbufs of 110 bytes each (total 2,420 bytes).

This Mbuf Memory setting was recommended because we'll be using [MCU Manager](https://github.com/apache/mynewt-mcumgr) (Simple Management Protocol) to upload firmware files during firmware update. See [`apache-mynewt-nimble/apps/bleprph/syscfg.yml`](https://github.com/JuulLabs-OSS/mynewt-travis-ci/blob/master/newt_dump/proj/repos/apache-mynewt-nimble/apps/bleprph/syscfg.yml)

_How much RAM and ROM are used by MicroPython on Mynewt?_

According to the build output, the MicroPython Runtime takes up __33 KB of RAM__. That includes 32 KB of Heap Memory that we have allocated above.

The compiled MicroPython Runtime code occupies __210 KB__ of Flash ROM.

```
  FLASH     RAM 
 214606   33557 libs_micropython.a
```

The MicroPython Runtime is compiled as a custom library in Mynewt, hence the name `libs_micropython.a`. [See the build script](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/build-app.sh#L164-L189)

The combined MicroPython + Mynewt firmware (including the NimBLE Bluetooth Stack) occupies __340 KB of Flash ROM, 53 KB of RAM__...

```
   text    data     bss
 347992     984   54728
```

Hence MicroPython takes up 62% of the firmware ROM, 61% of the firmware RAM.

Here are the ROM and RAM sizes of all code modules in the MicroPython + Mynewt firmware...

```
+ newt size -v nrf52_my_sensor
Size of Application Image: app
Mem FLASH: 0x8000-0x7bc00
Mem RAM: 0x20000000-0x20010000
  FLASH     RAM 
    800     324 *fill*
   1018      98 apps_my_sensor_app.a
   2268     116 boot_bootutil.a
     18       0 boot_mynewt_flash_map_backend.a
    438      26 boot_split.a
   1180       0 crypto_mbedtls.a
   2302       0 crypto_tinycrypt.a
    401       0 encoding_base64.a
   1622       0 encoding_cborattr.a
   3002       0 encoding_tinycbor.a
    452     444 hw_bsp_nrf52.a
     52       0 hw_cmsis-core.a
   1560      92 hw_drivers_flash_spiflash.a
    706       1 hw_hal.a
   6646      89 hw_mcu_nordic_nrf52xxx.a
      2       0 hw_sensor_creator.a
   1264     260 hw_sensor.a
   8790   11296 kernel_os.a
   3152      50 libc_baselibc.a
 214606   33557 libs_micropython.a
     16       0 libs_mynewt_rust.a
   1410       0 libs_rust_app.a
   1014       0 libs_rust_libcore.a
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
   2016       0 libgcc.a
Loading compiler /Users/Luppy/PineTime/pinetime-rust-mynewt/repos/apache-mynewt-core/compiler/arm-none-eabi-m4, buildProfile debug

objsize
   text    data     bss     dec     hex filename
 347992     984   54728  403704   628f8 /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
```

# NimBLE Bluetooth Stack

Mynewt includes the open-source [NimBLE Bluetooth LE networking stack](https://github.com/apache/mynewt-nimble), so we won't be using the [Nordic SoftDevice](https://infocenter.nordicsemi.com/topic/ug_gsg_ses/UG/gsg/softdevices.html) Bluetooth stack from the nRF Port of MicroPython.

Let's flip NimBLE on and watch what happens. We'll add these NimBLE libraries to our firmware: [`apps/my_sensor_app/pkg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/pkg.yml)

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

Here are the libraries that we have added to our Mynewt + MicroPython firmware to support [Firmware Updates over Bluetooth LE](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)...

- `mcuboot` is the open-source [MCUBoot Bootloader](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot) that we're using on PineTime. We include the `mcuboot` library so that PineTime Owners may query via Bluetooth LE the version number of the firmware that's installed.

- `imgmgr` writes the received firmware image to SPI Flash during Firmware Update

- `newtmgr` implements the [MCU Manager](https://github.com/apache/mynewt-mcumgr)
 Simple Management Protocol for uploading firmware images over Bluetooth LE

- `nimble` implements the Bluetooth LE Host and Transport functions (including GATT Services for Simple Management Protocol) by talking to the Bluetooth hardware on PineTime's nRF52 Microcontroller

_How do we start the Bluetooth LE services on PineTime?_

In Mynewt's startup function `main()`, we call `start_ble()` to start the Bluetooth LE services: [`rust/app/src/lib.rs`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/rust/app/src/lib.rs)

```rust
/// Rust Main Function main() will be called at Mynewt startup. 
/// It replaces the C version of the main() function.
#[no_mangle]                 //  Don't mangle the name "main"
extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
    //  Initialise the Mynewt drivers. Any startup functions defined in pkg.yml 
    //  of our custom drivers and libraries will be called by sysinit().  
    //  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c
    mynewt::sysinit();

    //  Start Bluetooth LE, including over-the-air firmware upgrade
    extern { fn start_ble() -> i32; }
    let rc = unsafe { start_ble() };
    assert!(rc == 0, "BLE fail");

    //  Start MicroPython
    extern { fn start_micropython() -> i32; }
    let rc = unsafe { start_micropython() };
    assert!(rc == 0, "MP fail");
    ...
```

`start_ble()` is defined in [`my_sensor_app/src/ble_main.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/src/ble_main.c), which calls supporting Bluetooth LE functions in  [`ble_gatt_svr.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/src/ble_gatt_svr.c), [`ble_misc.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/src/ble_misc.c), [`ble_phy.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/src/ble_phy.c) and [`ble_prph.h`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/apps/my_sensor_app/src/ble_prph.h)

Then `main()` calls `start_micropython()` to start the MicroPython Runtime, including wasp-os. We have seen `start_micropython()` in [`ports/mynewt/main.c`](https://github.com/AppKaki/micropython/blob/wasp-os/ports/mynewt/main.c)

At the end of `main()` we see this: [`rust/app/src/lib.rs`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/rust/app/src/lib.rs)

```rust
extern "C" fn main() -> ! {
    ...
    //  Mynewt Event Loop
    loop {                            //  Loop forever...
        os::eventq_run(               //  Processing events...
            os::eventq_dflt_get()     //  From default event queue.
                .expect("GET fail")
        ).expect("RUN fail");
    }
```

This is the __Event Loop__ for Mynewt. It's critical because any Bluetooth LE packets received will be treated as Mynewt Events and will be handled in this loop.

_So does Bluetooth LE work?_

Sadly no! There's a conflict with the Task Scheduling in Mynewt and MicroPython. More about this in the next section.

_Wait a minute... The `main()` function is in Rust not C!_

Yep! We're using a [variant of Mynewt that supports Rust](https://medium.com/@ly.lee/debug-rust-mynewt-firmware-for-pinetime-on-raspberry-pi-4b9ac2d093a9?source=friends_link&sk=edb508c31e43d3ec40ecd8554f3405f6)!

So technically we're calling: __C (Mynewt) → Rust → MicroPython!__

_But won't Rust bloat our Mynewt + MicroPython firmware unnecessarily?_

Not at all! The Rust Application and Rust Core Library occupy only 2.4 KB of ROM, 0 KB of RAM! Amazing!

```
  FLASH     RAM 
   1410       0 libs_rust_app.a
   1014       0 libs_rust_libcore.a
```

# Task Scheduling: MicroPython vs Mynewt

We have just enabled the NimBLE Bluetooth Stack on our Mynewt + MicroPython firmware... But we can't scan our PineTime device on the [Nordic nRF Connect mobile app](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest). Why?

Let's look again at the `main()` function: [`rust/app/src/lib.rs`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/rust/app/src/lib.rs)

```rust
///  Rust Main Function main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                 //  Don't mangle the name "main"
extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
    //  Initialise the Mynewt packages and internal temperature sensor driver. Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c
    mynewt::sysinit();

    //  Start Bluetooth LE, including over-the-air firmware upgrade
    extern { fn start_ble() -> i32; }
    let rc = unsafe { start_ble() };
    assert!(rc == 0, "BLE fail");

    //  Start MicroPython
    extern { fn start_micropython() -> i32; }
    let rc = unsafe { start_micropython() };
    assert!(rc == 0, "MP fail");

    //  OOPS: start_micropython() will never return,
    //  because it's stuck in a MicroPython Event Loop. So the
    //  Mynewt Event Loop below will never run...

    //  Mynewt Event Loop
    loop {                            //  Loop forever...
        os::eventq_run(               //  Processing events...
            os::eventq_dflt_get()     //  From default event queue.
                .expect("GET fail")
        ).expect("RUN fail");
    }
    //  Never comes here
}
```

We see the watch face rendered by MicroPython and wasp-os, so `start_micropython()` must be working.

But there's a problem here... `start_micropython()` will be stuck in its own MicroPython Event Loop taking care of MicroPython tasks, so it never returns!

As a result, the Mynewt Event Loop will never be executed. And we know that the Mynewt Event Loop is critical for handling Bluetooth packets. Thus Bluetooth fails!

We have a conflict here between MicroPython and Mynewt and the way they handle tasks and events. We don't have a solution right now, but we'll probably need to modify the wasp-os / MicroPython Event Loop to handle Mynewt Events as well.

But for now, we have accomplished our objective of rendering a watch face on PineTime with wasp-os, MicroPython and Mynewt. Yay!

In the next section we'll learn to build the Mynewt + MicroPython firmware and flash it to PineTime.

![MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch. VSCode Debugger is shown on the monitor](https://lupyuen.github.io/images/micropython-title.jpg)

_MicroPython and wasp-os hosted on Mynewt on PineTime Smart Watch. VSCode Debugger is shown on the monitor_

# Build and Flash Mynewt + MicroPython Firmware

Follow these steps to build the Mynewt + MicroPython Firmware on Linux (including Raspberry Pi) and macOS...

## Install Build Tools

1. Install GCC and Python build tools for Linux (or the macOS equivalent)...

    ```bash
    sudo apt install gcc gcc-arm-none-eabi python3 make
    ```

1. Install `rustup` with support for nightly target `thumbv7em-none-eabihf`. 
   
   Follow the instructions at https://rustup.rs/
   
   Press Enter to select `1) Proceed with installation (default)`

   Then execute...

   ```bash
   # Latest nightly-2020-04-20 fails with asm error, so we use nightly-2020-02-16
   source $HOME/.cargo/env
   rustup default nightly-2020-02-16
   rustup update
   rustup target add thumbv7em-none-eabihf
   ```

1. Install the `newt` build tool for Mynewt.  Refer to these scripts...

    - [`scripts/install-version.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/install-version.sh): To set the version numbers

    - [`scripts/install-pi.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/install-pi.sh): To build and install `newt`, look under the section `"Build newt"`

## Dowload Source Files

We'll download the source files into these folders...

![Build folders for Mynewt + MicroPython Firmware](https://lupyuen.github.io/images/micropython-folders.jpg)

1. Download the source files to `~/pinetime`...

    ```bash
    mkdir ~/pinetime
    cd ~/pinetime
    git clone --recursive --branch master https://github.com/lupyuen/wasp-os
    git clone --recursive --branch micropython https://github.com/lupyuen/pinetime-rust-mynewt
    ```

1. Update the MCUBoot version number. Edit [`~/pinetime/pinetime-rust-mynewt/project.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/project.yml)

    Change...

    ```yaml
    repository.mcuboot:
        type: github
        vers: 1.5.0
    ```

    to...

    ```yaml
    repository.mcuboot:
        type: github
        vers: 1.3.1
    ```

1. Download the Mynewt source code...

    ```bash
    cd ~/pinetime/pinetime-rust-mynewt
    newt install
    ```

    We should see...

    ```
    Downloading repository mynewt-core (commit: master) from https://github.com/apache/mynewt-core.git
    Downloading repository mynewt-mcumgr (commit: master) from https://github.com/apache/mynewt-mcumgr.git
    Downloading repository mynewt-nimble (commit: master) from https://github.com/apache/mynewt-nimble.git
    Downloading repository mcuboot (commit: master) from https://github.com/JuulLabs-OSS/mcuboot.git
    Making the following changes to the project:
        install apache-mynewt-core (1.7.0)
        install apache-mynewt-nimble (1.2.0)
        install mcuboot (1.3.1)
    apache-mynewt-core successfully installed version 1.7.0
    apache-mynewt-nimble successfully installed version 1.2.0
    Error: Error updating "mcuboot": error: The following untracked working tree files would be overwritten by checkout:
            ext/mbedtls/include/mbedtls/check_config.h
            ext/mbedtls/include/mbedtls/config.h
    Please move or remove them before you switch branches.
    Aborting
    ```

    Ignore the `mcuboot` error above and proceed to the next step.

## Build Mynewt Firmware

Build the Mynewt firmware (and generate the `syscfg.h` config file)...

```bash
cd ~/pinetime/pinetime-rust-mynewt
scripts/build-app.sh
```

We should see...

```
Linking my_sensor_app.elf
Error: ld: libc_baselibc.a(start.o): in function `_start':
start.c:39: undefined reference to `main'
collect2: error: ld returned 1 exit status
```

Ignore the `Undefined reference to main` error above and proceed to the next step.

## Build wasp-os and MicroPython

```bash
cd ~/pinetime/wasp-os
export BUILD_VERBOSE=1
make -j 1 BOARD=pinetime micropython
```

We should see...

```
arm-none-eabi-size build-pinetime/micropython.a
   text    data     bss     dec     hex filename
      0       0       0       0       0 mpstate.o (ex build-pinetime/micropython.a)
     32       0       0      32      20 nlr.o (ex build-pinetime/micropython.a)
      0       0       0       0       0 nlrx86.o (ex build-pinetime/micropython.a)
...
   1041       0       0    1041     411 pins_gen.o (ex build-pinetime/micropython.a)
make[1]: Leaving directory 'pinetime/wasp-os/micropython/ports/mynewt'   
```

## Build Mynewt + MicroPython Firmware

1. Build the Mynewt firmware again...

    ```bash
    cd ~/pinetime/pinetime-rust-mynewt
    scripts/build-app.sh
    ```

    We should see...

    ```
    objsize
    text    data     bss     dec     hex filename
    346216     984   54720  401920   62200 pinetime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
    + set +x
    + newt create-image nrf52_my_sensor 1.0.0
    App image successfully generated: pinetime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img    
    ```

    If you see the error `Undefined main`, run `scripts/build-app.sh` again. It should fix the error.

1. Create the Firmware Image...

    ```bash
    scripts/nrf52/image-app.sh
    ```

    We should see...

    ```
    App image successfully generated: pinetime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img    
    ```

## Select the OpenOCD Interface: ST-Link or Raspberry Pi SPI

Edit [`~/pinetime/pinetime-rust-mynewt/scripts/config.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/config.sh)

If we're using ST-Link v2 for flashing PineTime, set `swd_device` as follows...

```bash
#  Select ST-Link v2 as SWD Programmer
swd_device=scripts/nrf52/swd-stlink.ocd
```

If we're using [Raspberry Pi SPI](https://medium.com/@ly.lee/openocd-on-raspberry-pi-better-with-swd-on-spi-7dea9caeb590?source=friends_link&sk=df399bfd913d3e262447d28aa5af6b63) for flashing PineTime, set `swd_device` as follows...

```bash
#  Select Raspberry Pi as SWD Programmer
swd_device=scripts/nrf52-pi/swd-pi.ocd
```

## Flash MCUBoot Bootloader

1. Download the [MCUBoot Bootloader for PineTime](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)...

    [`mynewt.elf.bin`](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.1.7/mynewt.elf.bin)

    For other versions of the bootloader, [see this article](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)

1.  Edit [`~/pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-boot.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/nrf52/flash-boot.sh)

1.  Change `openocd/bin/openocd` to the path of our installed `openocd` (for ST-Link) or `openocd-spi` (for Raspberry Pi)...

    ```bash
    #  Flash the device
    openocd/bin/openocd \
        -f $swd_device \
        -f scripts/nrf52/flash-boot.ocd
    ```

1.  Edit [`~/pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-boot.ocd`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/nrf52/flash-boot.ocd)

1. Change `bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf.bin` to the path of the downloaded `mynewt.elf.bin`

    ```
    # For MCUBoot (debugging not supported):
    program bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf.bin verify 0x00000000
    ```

1. Flash the bootloader...

    ```bash
    scripts/nrf52/flash-boot.sh
    ```

## Flash Mynewt + MicroPython Firmware

1.  Edit [`~/pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-app.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/nrf52/flash-app.sh)

1.  Change `openocd/bin/openocd` to the path of our installed `openocd` (for ST-Link) or `openocd-spi` (for Raspberry Pi)...

    ```bash
    #  Flash the device
    openocd/bin/openocd \
        -f $swd_device \
        -f scripts/nrf52/flash-app.ocd
    ```

1.  The path of the built firmware file is defined in [`~/pinetime/pinetime-rust-mynewt/scripts/nrf52/flash-app.ocd`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/micropython/scripts/nrf52/flash-app.ocd). We shouldn't need to change this.

    ```
    program bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img verify 0x00008000
    ```

1. Flash the application...

    ```bash
    scripts/nrf52/flash-app.sh
    ```

1. PineTime reboots, starts wasp-os and renders the watch face

![Build Mynewt + MicroPython Firmware on Raspberry Pi](https://lupyuen.github.io/images/micropython-build.png)

# Debug Log

Here's the debug log that appears in OpenOCD when we run `flash-app.sh`...

The firmware is flashed to PineTime via OpenOCD and ST-Link...

```
> Executing task in folder pinetime-rust-mynewt: bash -c -l ' scripts/nrf52/flash-app.sh && echo ✅ ◾ ️Done! ' <

+ source scripts/config.sh
++ swd_device=scripts/nrf52/swd-stlink.ocd
+ openocd/bin/openocd -f scripts/nrf52/swd-stlink.ocd -f scripts/nrf52/flash-app.ocd
GNU MCU Eclipse 64-bit Open On-Chip Debugger 0.10.0+dev-00462-gdd1d90111 (2019-01-15-13:49)
Licensed under GNU GPL v2
For bug reports, read
        http://openocd.org/doc/doxygen/bugs.html
debug_level: 0
adapter speed: 1000 kHz
force hard breakpoints
Stopping...
target halted due to debug-request, current mode: Thread 
xPSR: 0x61000000 pc: 0x000001c6 msp: 0x2000ffd8

Flashing Application...
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000
Enabled ARM Semihosting to show debug output
semihosting is enabled
** Programming Started **
auto erase enabled
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x2000001e msp: 0x20010000, semihosting
wrote 352256 bytes from file bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.img in 8.465226s (40.637 KiB/s)
** Programming Finished **
** Verify Started **
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x2000002e msp: 0x20010000, semihosting
verified 349048 bytes in 0.803118s (424.430 KiB/s)
** Verified OK **

Restarting...
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000, semihosting
Enabled ARM Semihosting to show debug output
semihosting is enabled
**** Done! Press Ctrl-C to exit...
```

PineTime reboots after flashing. The MCUBoot Booloader starts...

```
Starting Bootloader...
Displaying image...
Image displayed
Check button: 0
[INF] Primary image: magic=good, swap_type=0x4, copy_done=0x1, image_ok=0x1
[INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
[INF] Boot source: none
[INF] Swap type: none
Waiting 5 seconds for button: 0...
Waited for button: 0
Bootloader done
```

Mynewt starts running...

```
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
```

MicroPython initialises the stack and heap...

```
stack_start: 20000618
stack_end: 20002618
heap_start: 20004bfa
heap_end: 2000cbfa
TODO adc_init0
TODO timer_init0
TODO microbit_filesystem_init
TODO machine_rtc_make_new
TODO machine_rtc_start
TODO machine_adc_make_new
1 chips detected. Total flash size 4MiB.
stack_end: 20002618
gc_collect: sp=20001dc0, len=216
stack_end: 20002618
gc_collect: sp=20001f28, len=1bc
TODO machine_adc_value_read
TODO machine_adc_value_read
```

The ADC is probably used for reading the battery status.

wasp-os starts the REPL loop and renders the watch face...

```
Watch is running, use Ctrl-C to stop
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
stack_end: 20002618
gc_collect: sp=20001f38, len=1b8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
```

After a while PineTime reboots, probably because of the Mynewt watchdog.

And PineTime runs the same thing again and again...

```
Starting Bootloader...
Displaying image...
Image displayed
Check button: 0
[INF] Primary image: magic=good, swap_type=0x4, copy_done=0x1, image_ok=0x1
[INF] Scratch: magic=bad, swap_type=0x1, copy_done=0x2, image_ok=0x2
[INF] Boot source: none
[INF] Swap type: none
Waiting 5 seconds for button: 0...
Waited for button: 0
Bootloader done
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
stack_start: 20000618
stack_end: 20002618
heap_start: 20004bfa
heap_end: 2000cbfa
TODO adc_init0
TODO timer_init0
TODO microbit_filesystem_init
TODO machine_rtc_make_new
TODO machine_rtc_start
TODO machine_adc_make_new
1 chips detected. Total flash size 4MiB.
stack_end: 20002618
gc_collect: sp=20001dc0, len=216
stack_end: 20002618
gc_collect: sp=20001f28, len=1bc
TODO machine_adc_value_read
TODO machine_adc_value_read
Watch is running, use Ctrl-C to stop
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
stack_end: 20002618
gc_collect: sp=20001f38, len=1b8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
TODO machine_adc_value_read
stack_end: 20002618
gc_collect: sp=200022b8, len=d8
```

# Loose Ends

This article is getting waaaaay too long, and I haven't covered all the topics yet. Drop me a note if you would like me to cover the following...

1. VSCode Workspace for wasp-os and MicroPython: The Build Task for wasp-os and MicroPython is defined here: [`.vscode/tasks.json`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/.vscode/tasks.json)

1. Debugging wasp-os and MicroPython with VSCode and ST-Link

1. How debug messages from wasp-os and MicroPython are routed to OpenOCD's Semihosting Console (i.e. replacing `printf` by `console_printf`)

1. REPL Command Line: Will probably be implemented as a UART driver in MicroPython that talks to NimBLE

1. Supporting the other wasp-os drivers in [`wasp-os/wasp/drivers`](https://github.com/lupyuen/wasp-os/tree/master/wasp/drivers): SPI Flash, Battery, nRF Real Time Clock, Signal, Vibrator

# What's Next

_Will we see wasp-os and MicroPython run on Mynewt someday?_

The work continues! We have a showstopper: Unable to handle Bluetooth packets due to conflicts with the Mynewt and the MicroPython task scheduler.

I'll continue to experiment on wasp-os with guidance from [Daniel](https://github.com/daniel-thompson) and keep this article updated!

# Further Reading

[wasp-os documentation](https://wasp-os.readthedocs.io/en/latest/)

[wasp-os Application Writer’s Guide](https://wasp-os.readthedocs.io/en/latest/appguide.html)

[wasp-os Reference Manual](https://wasp-os.readthedocs.io/en/latest/wasp.html)

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
