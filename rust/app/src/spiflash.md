# Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)

![Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)](https://lupyuen.github.io/images/spiflash-config.png)

There's one thing truly remarkable about the __Apache Mynewt__ embedded operating system... __Almost any feature can be switched on by editing a configuration file!__

Today we'll learn to enable access to __SPI Flash Memory__ with Mynewt OS on PineTime Smart Watch... Just by editing two configuration files ([`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml) and [`pkg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml)), and making some minor code changes ([`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)).

These steps will work for any Nordic nRF52 device, and probably STM32 devices too (see diagram above)...

1. __Configure pins for SPI Port__ in [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

1. __Configure flash interface__ in [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

1. __Configure flash timings__ in[`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

1. __Include `spiflash.h`__ in [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)

1. __Define internal and external flash devices__ in [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)

1. __Access flash devices by ID__ in [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)

1. __Add `spiflash` driver__ to [`pkg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml)

Read on for the details...

# `syscfg.yml:` Configure pins for SPI Port

The first configuration file we'll edit is `syscfg.yml` from the Board Support Package. For PineTime, this file is located at...

[`hw/bsp/nrf52/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

Let's add the PineTime SPI settings according to this document: [PineTime Port Assignment](http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf)...

| nRF52 Pin | Function | Description |
| :--- | :--- | :--- 
| P0.02 | SPI-SCK, LCD_SCK | SPI Clock
| P0.03 | SPI-MOSI, LCD_SDI | SPI MOSI (master to slave)
| P0.04 | SPI-MISO | SPI MISO (slave to master)
| P0.05 | SPI-CE# (SPI-NOR) | SPI Chip Select

Here's how it looks in `syscfg.yml`...

```yaml
syscfg.vals:
    ...
    # Default Pins for Peripherals
    # Defined in http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf

    # SPI port 0 connected to ST7789 display and XT25F32B flash
    SPI_0_MASTER_PIN_SCK:  2  # P0.02/AIN0: SPI-SCK, LCD_SCK    SPI clock for display and flash
    SPI_0_MASTER_PIN_MOSI: 3  # P0.03/AIN1: SPI-MOSI, LCD_SDI   SPI MOSI for display and flash
    SPI_0_MASTER_PIN_MISO: 4  # P0.04/AIN2: SPI-MISO            SPI MISO for flash only
    ...
```

We'll add SPI Chip Select in a while.

# `syscfg.yml:` Configure flash interface

TODO

https://wiki.pine64.org/index.php/PineTime

> __SPI Flash information:__ <br><br>
XTX XT25F32B 32Mb (4MB) SPI NOR Flash <br><br>
(data sheets for this part are hard to find but it acts similar to other QuadSPI SPI NOR Flash such as Macronix 32Mb (4MB) SPI NOR Flash) <br><br>
IDs for XT25F32B are: __manufacturer (`0x0b`)__, device (`0x15`), __memory type (`0x40`)__, __density (`0x16`)__

device ID (`0x15`) is not used

https://www.elnec.com/en/device/XTX/XT25F32B+%28QuadSPI%29+%5BSOP8-200%5D/

https://www.macronix.com/Lists/Datasheet/Attachments/7426/MX25L3233F,%203V,%2032Mb,%20v1.6.pdf

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml

```yaml
syscfg.vals:
    ...
    # SPI Flash
    # XTX XT25F32B 32 Mb (4 MB) SPI NOR Flash (similar to QuadSPI SPI NOR Flash like Macronix 32 Mb (4 MB) MX25L3233F)
    # manufacturer (0x0b), device (0x15), memory type (0x40), density (0x16)
    # Settings below are documented at https://github.com/apache/mynewt-core/blob/master/hw/drivers/flash/spiflash/syscfg.yml

    SPIFLASH:               1   # Enable SPI Flash
    SPIFLASH_SPI_NUM:       0   # SPI Interface 0
    SPIFLASH_SPI_CS_PIN:    5   # SPI interface CS pin: P0.05/AIN3, SPI-CE# (SPI-NOR)
    SPIFLASH_BAUDRATE:      8000    # Requested baudrate, 8000 is the fastest baudrate supported by nRF52832
    SPIFLASH_MANUFACTURER:  0x0B    # Expected SpiFlash manufacturer as read by Read JEDEC ID command 9FH
    SPIFLASH_MEMORY_TYPE:   0x40    # Expected SpiFlash memory type as read by Read JEDEC ID command 9FH
    SPIFLASH_MEMORY_CAPACITY: 0x16  # Expected SpiFlash memory capactity as read by Read JEDEC ID command 9FH (2 ^ 0x16 = 32 Mb)
    SPIFLASH_SECTOR_COUNT:  1024    # Number of sectors: 1024 sectors of 4 KB each
    SPIFLASH_SECTOR_SIZE:   4094    # Number of bytes that can be erased at a time: 4 KB sector size
    SPIFLASH_PAGE_SIZE:     256     # TODO Number of bytes that can be written at a time
    ...
```

# `syscfg.yml:` Configure flash timings

TODO

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml

```yaml
syscfg.vals:
    ...
    # Copied from https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/syscfg.yml
    SPIFLASH_TBP1_TYPICAL:  20      # Byte program time (first byte) (us)
    SPIFLASH_TBP1_MAXIMUM:  50      # Maximum byte program time (first byte) (us)
    SPIFLASH_TPP_TYPICAL:   700     # Page program time (us)
    SPIFLASH_TPP_MAXIMUM:   3000    # Maximum page program time (us)
    SPIFLASH_TSE_TYPICAL:   30000   # Sector erase time (4KB) (us)
    SPIFLASH_TSE_MAXIMUM:   400000  # Maximum sector erase time (us)
    SPIFLASH_TBE1_TYPICAL:  120000  # Block erase time (32KB) (us)
    SPIFLASH_TBE1_MAXIMUM:  800000  # Maximum block erase time (32KB) (us)
    SPIFLASH_TBE2_TYPICAL:  150000  # Block erase time (64KB) (us)
    SPIFLASH_TBE2_MAXIMUM:  1000000 # Maximum block erase time (64KB) (us)
    SPIFLASH_TCE_TYPICAL:   3000000 # Chip erase time (us)
    SPIFLASH_TCE_MAXIMUM:   10000000 # Maximum chip erase time (us)
    ...
```

# `hal_bsp.c:` Include `spiflash.h`

TODO


https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c

```c
#if MYNEWT_VAL(SPIFLASH)  //  If External SPI Flash exists...
#include <spiflash/spiflash.h>
#endif  //  MYNEWT_VAL(SPIFLASH)
```

# `hal_bsp.c:` Define internal and external flash devices

TODO

Internal Flash ROM,
External SPI Flash

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c

```c
/// Array of Flash Devices
static const struct hal_flash *flash_devs[] = {
    [0] = &nrf52k_flash_dev,  //  Internal Flash ROM
#if MYNEWT_VAL(SPIFLASH)      //  If External SPI Flash exists...
    [1] = &spiflash_dev.hal,  //  External SPI Flash
#endif                        //  MYNEWT_VAL(SPIFLASH)
};
```

# `hal_bsp.c:` Access flash devices by ID

0 for Internal Flash ROM,
1 for External SPI Flash

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c

```c
/// Return the Flash Device for the ID. 0 for Internal Flash ROM, 1 for External SPI Flash
const struct hal_flash *
hal_bsp_flash_dev(uint8_t id)
{
    if (id >= ARRAY_SIZE(flash_devs)) {
        return NULL;
    }
    return flash_devs[id];
}
```

# `pkg.yml:` Add `spiflash` driver

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml

```yaml
pkg.deps:
    ...
    - "@apache-mynewt-core/hw/drivers/flash/spiflash"  # SPI Flash Driver
```

# Test SPI Flash

TODO

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c

Based on https://github.com/apache/mynewt-core/blob/master/test/flash_test/src/flash_test.c

```c
////////////////////
//  Dump Sector Map

//  Dump sector map for internal flash ROM
map_cmd(0) ||

//  Dump sector map for external SPI flash
map_cmd(1) ||

////////////////////////////////
//  Read Flash: Before erasing
//  flash <flash-id> read <offset> <size> -- reads bytes from flash        

//  Read internal flash ROM
flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

//  Read external SPI flash
flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

/////////////////////////////////////
//  Erase Flash: Set all bits to 1
//  flash <flash-id> erase <offset> <size> -- erases flash

//  Erase external SPI flash
flash_cmd(ERASE_COMMAND, 1, 0x0, 32) ||

////////////////////////////////////////
//  Read Flash: Shows all bits set to 1
//  flash <flash-id> read <offset> <size> -- reads bytes from flash        

//  Read internal flash ROM
flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

//  Read external SPI flash
flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

//////////////////////////////////////////////
//  Write Flash: Write 0x01, 0x02, 0x03, ... (Must erase before writing)
//  flash <flash-id> write <offset> <size> -- writes incrementing data pattern 0-8 to flash

//  Write external SPI flash
flash_cmd(WRITE_COMMAND, 1, 0x0, 32) ||

////////////////////////////////////////////
//  Read Flash: Shows 0x01, 0x02, 0x03, ...
//  flash <flash-id> read <offset> <size> -- reads bytes from flash        

//  Read internal flash ROM
flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

//  Read external SPI flash
flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

//////////////////////
//  Test Flash Speed
//  flash_speed <flash_id> <addr> <rd_sz>|range [move]
//  range=0 for size mode, range=1 for range mode, move=1 for move

//  Internal flash ROM, size mode, no move
//  speed_cmd(0, 0x0, 32, 0, 0) ||

//  External SPI flash, size mode, no move
//  speed_cmd(1, 0x0, 32, 0, 0) ||

//  Internal flash ROM, range mode, no move
//  speed_cmd(0, 0x0, 0, 1, 0) ||

//  External SPI flash, range mode, no move
//  speed_cmd(1, 0x0, 0, 1, 0) ||
0
```

# SPI Flash Test Output

TODO

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
  0x0000: 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 
  0x0008: 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f 0x10 
  0x0010: 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 
  0x0018: 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 0x20 
Erase External SPI Flash...
Erase 0x0 + 20
Done!
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
  0x0008: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
  0x0010: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
  0x0018: 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 
Write External SPI Flash...
Write 0x0 + 20
Done!
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 
  0x0008: 0x09 0x0a 0x0b 0x0c 0x0d 0x0e 0x0f 0x10 
  0x0010: 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 
  0x0018: 0x19 0x1a 0x1b 0x1c 0x1d 0x1e 0x1f 0x20 
Flash OK

Flash Sector Map:
Flash 0 at 0x0 size 0x80000 with 128 sectors, alignment req 1 bytes
  0:   1000
  1:   1000
  2:   1000
  ...
  127: 1000

Flash 1 at 0x0 size 0x3ff800 with 1024 sectors, alignment req 1 bytes
  0:    ffe
  1:    ffe
  2:    ffe
  ...  
  1023: ffe
```

# SPI Flash Benchmark

TODO

# Debugging with MCUBoot

If we're using the MCUBoot Bootloader (like on PineTime), debugging and testing SPI Flash can be somewhat challenging.

Remember that we added the SPI Flash Driver to the Board Support Package?

The Board Support Package is used by _both_ the MCUBoot Bootloader as well as the Application Firmware. Which means that the SPI Flash Driver is loaded when MCUBoot starts.

_What happens if the SPI Flash Driver is configured incorrectly?_

MCUBoot may crash... Before starting the Application Firmware! (This happened to me)

Hence for debugging and testing SPI Flash, I strongly recommend switching the Bootloader to a simpler one that doesn't require any drivers: the Stub Bootloader.

This will enable us to debug and test SPI Flash with our Application Firmware, before using it with MCUBoot.

Also MCUBoot expects the Application Firmware Image to start with the MCUBoot Image Header. When the GDB debugger flashes the Firmware ELF File into ROM, the Image Header is empty. So MCUBoot won't work start the Application Firmware properly when the debugger is running. Switching MCUBoot to the Stub Bootloader will solve this.

# Switching MCUBoot to Stub Bootloader

TODO

# Inside The SPI Flash Driver

TODO

Based on https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/syscfg.yml

https://www.winbond.com/resource-files/w25q16jv%20spi%20revh%2004082019%20plus.pdf


# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)
