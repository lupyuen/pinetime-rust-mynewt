# Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)

![Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)](https://lupyuen.github.io/images/spiflash-config.png)

[_Larger image here_](https://lupyuen.github.io/images/spiflash-config.png)

There's one thing truly remarkable about the [__Apache Mynewt__](https://mynewt.apache.org/) embedded operating system... __Almost any feature may be switched on by editing a configuration file!__

Today we'll learn to configure Mynewt OS to enable access to __SPI Flash Memory__ on [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime)... Just by editing two configuration files ([`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml) and [`pkg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml)), and making some minor code changes ([`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)).

These steps will work for any Nordic nRF52 device, and probably STM32 devices too ([see diagram above](https://lupyuen.github.io/images/spiflash-config.png))...

1. __Configure pins for SPI Port__ in [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

1. __Configure flash interface__ in [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

1. __Configure flash timings__ in[`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

1. __Include `spiflash.h`__ in [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)

1. __Define internal and external flash devices__ in [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)

1. __Access flash devices by ID__ in [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)

1. __Add `spiflash` driver__ to [`pkg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml)

Read on for the details...

![`syscfg.yml`: Configuration for Board Support Package](https://lupyuen.github.io/images/spiflash-config1.png)

_`syscfg.yml`: Configuration for Board Support Package_

# `syscfg.yml:` Configure Pins for SPI Port

The first configuration file we'll edit is `syscfg.yml` from Mynewt's Board Support Package. For PineTime, this file is located at...

[`hw/bsp/nrf52/syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)

Let's add the PineTime SPI settings according to the [PineTime Wiki](https://wiki.pine64.org/index.php/PineTime): [PineTime Port Assignment](http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf)...

| nRF52 Pin&nbsp;&nbsp;&nbsp;&nbsp; | Function | Description |
| :--- | :--- | :--- 
| `P0.02` | `SPI-SCK, LCD_SCK` | SPI Clock
| `P0.03` | `SPI-MOSI, LCD_SDI`&nbsp;&nbsp;&nbsp;&nbsp; | SPI MOSI (master to slave)
| `P0.04` | `SPI-MISO` | SPI MISO (slave to master)
| `P0.05` | `SPI-CE# (SPI-NOR)` | SPI Chip Select<br><br>

Here's how it looks in [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)...

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

For pin numbers on nRF52, we may drop the `P0` prefix and write `P02.02` as `2`.

We'll add SPI Chip Select (`Pin 5`) in a while.

# `syscfg.yml:` Configure flash interface

Now we'll edit [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml) to tell Mynewt how to access our Flash Memory.  From the [PineTime Wiki](https://wiki.pine64.org/index.php/PineTime)...

> __SPI Flash information:__ 
[XTX XT25F32B](https://www.elnec.com/en/device/XTX/XT25F32B+%28QuadSPI%29+%5BSOP8-200%5D/) 32 Mb (4 MB) SPI NOR Flash <br><br>
Data sheets for this part are hard to find but it acts similar to other QuadSPI SPI NOR Flash such as [Macronix](https://www.macronix.com/Lists/Datasheet/Attachments/7426/MX25L3233F,%203V,%2032Mb,%20v1.6.pdf) 32 Mb (4 MB) SPI NOR Flash <br><br>
IDs for XT25F32B are: __Manufacturer (`0x0b`)__, Device (`0x15`), __Memory Type (`0x40`)__, __Density (`0x16`)__

Confused about `MB` and `Mb`? `MB` stands for Mega Byte (roughly a million bytes), whereas `Mb` stands for Mega Bit (roughly a million bits). Divide `Mb` by 8 to get `MB`.

We don't have the datasheet for [XT25F32B](https://www.elnec.com/en/device/XTX/XT25F32B+%28QuadSPI%29+%5BSOP8-200%5D/) Flash Memory... But fortunately the [JEDEC IDs](https://en.wikipedia.org/wiki/Common_Flash_Memory_Interface) for Manufacturer, Memory Type and Density (Capacity) are all that we need for [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml)...

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
    SPIFLASH_SECTOR_SIZE:   4094    # TODO Number of bytes that can be erased at a time: 4 KB sector size
    SPIFLASH_PAGE_SIZE:     256     # TODO Number of bytes that can be written at a time
    ...
```

The JEDEC Device ID (`0x15`) is not used.

`SPIFLASH_SECTOR_COUNT` and `SPIFLASH_SECTOR_SIZE` were copied from [Macronix MX25L3233F](https://www.macronix.com/Lists/Datasheet/Attachments/7426/MX25L3233F,%203V,%2032Mb,%20v1.6.pdf) since it's similar to our XT25F32B.

`SPIFLASH_PAGE_SIZE` was copied from another Mynewt configuration: [`black_vet6`](https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/syscfg.yml)

# `syscfg.yml:` Configure Flash Timings

Finally we edit [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml) to tell Mynewt the timing characteristics of our Flash Memory...

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

If we have the Flash Memory Datasheet, fill in the numbers from the datasheet.

The above settings were copied from another Mynewt configuration: [`black_vet6`](https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/syscfg.yml)

![`hal_bsp.c`: Code for Board Support Package](https://lupyuen.github.io/images/spiflash-config2.png)

_`hal_bsp.c`: Code for Board Support Package_ 

# `hal_bsp.c:` Include `spiflash.h`

After editing [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml) in the Board Support Package, let's make some minor tweaks to the source code (`hal_bsp.c`) of the Board Support Package.

For PineTime, the source file is located at...

[`hw/bsp/nrf52/src/hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c)

First we insert the header file for the SPI Flash Driver into [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c) like this...

```c
#if MYNEWT_VAL(SPIFLASH)  //  If External SPI Flash exists...
#include <spiflash/spiflash.h>
#endif  //  MYNEWT_VAL(SPIFLASH)
```

# `hal_bsp.c:` Define Internal and External Flash Devices

Next we define two Mynewt Flash Devices...

- __Internal Flash ROM__ with Flash Device ID 0
- __External SPI Flash__ with Flash Device ID 1

Edit [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c) and insert this block of code...

```c
/// Array of Flash Devices
static const struct hal_flash *flash_devs[] = {
    [0] = &nrf52k_flash_dev,  //  Internal Flash ROM
#if MYNEWT_VAL(SPIFLASH)      //  If External SPI Flash exists...
    [1] = &spiflash_dev.hal,  //  External SPI Flash
#endif                        //  MYNEWT_VAL(SPIFLASH)
};
```

Later we'll use Flash Device ID 1 when accessing SPI Flash.

# `hal_bsp.c:` Access Flash Devices by ID

Finally we edit the code to fetch the Flash Devices by the Flash Device ID.

Edit [`hal_bsp.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c). Look for the function `hal_bsp_flash_dev()` and replace the function by this code...

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

This function returns the Internal Flash ROM for ID 0, and External SPI Flash for ID 1.

![`pkg.yml`: Drivers for Board Support Package`](https://lupyuen.github.io/images/spiflash-config3.png)

_`pkg.yml`: Drivers for Board Support Package_

# `pkg.yml:` Add `spiflash` driver

The last file we'll edit is `pkg.yml` from the Board Support Package. For PineTime this file is located at...

[`hw/bsp/nrf52/pkg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml)

Edit [`pkg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml). Look for the `pkg.deps` section and add `spiflash` like this...

```yaml
pkg.deps:
    ...
    - "@apache-mynewt-core/hw/drivers/flash/spiflash"  # SPI Flash Driver
```

This starts up the SPI Flash Driver whenever Mynewt boots.  And we're done!

Now let's write a simple program to read, write and erase the SPI Flash.

# Test SPI Flash

Here's the C code to test reading, writing and erasing SPI Flash on Mynewt: [`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c). The code was derived from [Mynewt's test code for Flash Devices](https://github.com/apache/mynewt-core/blob/master/test/flash_test/src/flash_test.c).

The test code calls Mynewt's Flash HAL (Hardware Adaptation Layer) to access the flash memory...

1. __Erase Flash__ `hal_flash_erase(id, offset, size)`

    Erase internal / external flash memory at the `offset` address, for `size` bytes. [See `hal_flash_erase`](https://mynewt.apache.org/latest/os/modules/hal/hal_flash/hal_flash.html#c.hal_flash_erase)

1. __Read Flash__ `hal_flash_read(id, offset, buf, sector_count)`

    Read internal / external flash memory from the `offset` address into the `buf` buffer, for `sector_count` sectors. On PineTime, one sector contains 4 KB. [See `hal_flash_read`](https://mynewt.apache.org/latest/os/modules/hal/hal_flash/hal_flash.html#c.hal_flash_read)

1. __Write Flash__ `hal_flash_write(id, offset, buf, sector_count)`

    Write internal / external flash memory from the `buf` buffer to the `offset` address, for `sector_count` sectors. On PineTime, one sector contains 4 KB. [See `hal_flash_write`](https://mynewt.apache.org/latest/os/modules/hal/hal_flash/hal_flash.html#c.hal_flash_write)

For the above functions, `id` is 0 for Internal Flash ROM, 1 for External SPI Flash.

For easier testing, the above functions are wrapped inside the `flash_cmd()` function, which is also defined in [`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c)

Let's call `flash_cmd()` to test the SPI Flash functions...

## Read SPI Flash

Here's the test code in [`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c) to read Internal Flash ROM and External SPI Flash...

```c
/// Test internal flash ROM and external SPI flash
int test_flash() {
  //  Keep running tests until a test returns an error (non-zero result)
  if (
    ////////////////////////////////
    //  Read Flash
    //  <flash-id> <offset> <size>

    //  Read internal flash ROM
    flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

    //  Read external SPI flash
    flash_cmd(READ_COMMAND, 1, 0x0, 32) ||
    ...
    0
  ) { return -1; }  //  Tests failed
    return 0;  //  Tests OK
}
```

This code reads 32 bytes, starting at offset 0, from both Internal Flash ROM and External SPI Flash. As expected, the flash memory contents are different for Internal Flash ROM and External SPI Flash...

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
```

## Erase SPI Flash

Next in [`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c) we erase the External SPI Flash...

```c
/////////////////////////////////////
//  Erase Flash: Set all bits to 1
//  <flash-id> <offset> <size>

//  Erase external SPI flash
flash_cmd(ERASE_COMMAND, 1, 0x0, 32) ||
```

```
Erase External SPI Flash...
Erase 0x0 + 20
Done!
```

After erasing, let's read both Internal Flash ROM and External SPI Flash ([`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c))...

```c
////////////////////////////////////////
//  Read Flash
//  <flash-id> read <offset> <size>

//  Read internal flash ROM
flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

//  Read external SPI flash
flash_cmd(READ_COMMAND, 1, 0x0, 32) ||
```

Here are the contents...

```
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
```

_Why was SPI Flash wiped out with `0xff`?_

That's expected when we erase [NOR Flash Memory](https://en.wikipedia.org/wiki/Flash_memory#NOR_memories)... All bits will get set to `1`.

When we write to NOR Flash Memory, we may only flip `1` bits to `0`, not `0` to `1`.

Hence before writing any data into NOR Flash Memory, we need to erase all bits to `1`. Then we write the data to flash, flipping some `1` bits to `0`.

## Write SPI Flash

Now that SPI Flash has been flipped to `1`, let's write some data ([`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c))...

```c
//////////////////////////////////////////////
//  Write Flash: Write 0x01, 0x02, 0x03, ... 
//  (Must erase before writing)
//  <flash-id> <offset> <size>

//  Write external SPI flash
flash_cmd(WRITE_COMMAND, 1, 0x0, 32) ||
```

This shows...

```
Write External SPI Flash...
Write 0x0 + 20
Done!
```

`flash_cmd()` writes to SPI Flash the bytes `0x01`, `0x02`, `0x03`, ... 

Let's read SPI Flash and check ([`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c))...

```c
////////////////////////////////////////////
//  Read Flash
//  <flash-id> <offset> <size>

//  Read internal flash ROM
flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

//  Read external SPI flash
flash_cmd(READ_COMMAND, 1, 0x0, 32) ||
```

Here's the result...

```
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
```

Yep the flipping of bits from `1` to `0` worked!

## SPI Flash Sector Map

To check whether SPI Flash is correctly configured, we may dump the Flash Sector Map like this ([`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c))...

```c
////////////////////
//  Dump Sector Map

//  Dump sector map for internal flash ROM
map_cmd(0) ||

//  Dump sector map for external SPI flash
map_cmd(1) ||

```

Here's the output...

```
Sector Map for Internal Flash ROM...
Flash 0 at 0x0 size 0x80000 with 128 sectors, alignment req 1 bytes
  0:   1000
  1:   1000
  2:   1000
  ...
  127: 1000

Sector Map for External SPI Flash...
Flash 1 at 0x0 size 0x3ff800 with 1024 sectors, alignment req 1 bytes
  0:    ffe
  1:    ffe
  2:    ffe
  ...  
  1023: ffe
```

This says that SPI Flash has been configured with 1024 sectors, each sector 4 KB in size.

# SPI Flash Benchmark

TODO

[`flash_test.c`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/apps/my_sensor_app/src/flash_test.c)

```c
//////////////////////
//  Test Flash Speed
//  <flash_id> <addr> <rd_sz>|range [move]
//  range=0 for size mode, range=1 for range mode, move=1 for move

//  Internal flash ROM, size mode, no move
speed_cmd(0, 0x0, 32, 0, 0) ||

//  External SPI flash, size mode, no move
speed_cmd(1, 0x0, 32, 0, 0) ||

//  Internal flash ROM, range mode, no move
speed_cmd(0, 0x0, 0, 1, 0) ||

//  External SPI flash, range mode, no move
speed_cmd(1, 0x0, 0, 1, 0) ||

```

# MCUBoot Bootloader with SPI Flash

[__MCUBoot__](https://juullabs-oss.github.io/mcuboot/) is an open-source Bootloader that supports Mynewt, [RIOT](https://www.riot-os.org) and [Zephyr](https://www.zephyrproject.org) operating systems... It's the first thing that will [run on PineTime when it boots](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu).

During firmware updates, MCUBoot stores the previous version of the firmware into Internal Flash ROM, and rolls back to the previous firmware if the new firmware doesn't start properly. 

But on constrained devices like PineTime, this robustness will cost us... We might run out of space in Internal Flash ROM to store the old firmware!

Fortunately MCUBoot on Mynewt works seamlessly with SPI Flash... Watch how the new firmware `FLASH_AREA_IMAGE_0` coexists with the old firmware `FLASH_AREA_IMAGE_1` in this Flash Memory Map for MCUBoot for Mynewt: [`hw/bsp/black_vet6/bsp.yml`](https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/bsp.yml)

```yaml
bsp.flash_map:
    areas:
        # System areas.
        FLASH_AREA_BOOTLOADER:
            device: 0
            offset: 0x08000000
            size: 32kB
        FLASH_AREA_IMAGE_0:
            device: 0
            offset: 0x08020000
            size: 256kB
        FLASH_AREA_IMAGE_SCRATCH:
            device: 0
            offset: 0x08060000
            size: 128kB

        # User areas.
        FLASH_AREA_REBOOT_LOG:
            user_id: 0
            device: 0
            offset: 0x08008000
            size: 32kB

        FLASH_AREA_IMAGE_1:
            device: 1
            offset: 0x00000000
            size: 256kB

        FLASH_AREA_NFFS:
            user_id: 1
            device: 1
            offset: 0x00040000
            size: 32kB
```

Note that the new firmware `FLASH_AREA_IMAGE_0` resides on __Flash Device 0 (Internal Flash ROM)__, while the old firmware `FLASH_AREA_IMAGE_1` resides on __Flash Device 1 (External SPI Flash)__.

This means that we won't waste any previous space in Internal Flash ROM for storing the old firmware... MCUBoot automatically swaps the old firmware into External SPI Flash! Using MCUBoot Bootloader with SPI Flash is really that easy!

# Debug SPI Flash with MCUBoot Bootloader

If we're using the MCUBoot Bootloader (like on PineTime), debugging and testing SPI Flash can be somewhat challenging.

Remember that we added the SPI Flash Driver to the Board Support Package?

The Board Support Package is used by _both_ the MCUBoot Bootloader as well as the Application Firmware. Which means that the SPI Flash Driver is loaded when MCUBoot starts.

_What happens if the SPI Flash Driver is configured incorrectly?_

MCUBoot may crash... Before starting the Application Firmware! (This happened to me)

Hence for debugging and testing SPI Flash, I strongly recommend switching the Bootloader to a simpler one that doesn't require any drivers: the [__Stub Bootloader__](https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota2/apps/boot_stub).

The Stub Bootloader doesn't do anything... It simply jumps to the Application Firmware.

This will enable us to debug and test SPI Flash with our Application Firmware, before using it with MCUBoot.

Also MCUBoot expects the Application Firmware Image to start with the MCUBoot Image Header. When the GDB debugger flashes the Firmware ELF File into ROM, the Image Header is empty. So MCUBoot won't work start the Application Firmware properly when the debugger is running. Switching MCUBoot to the Stub Bootloader will solve this.

[_Source code for Stub Bootloader_](https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota2/apps/boot_stub)

# Switch MCUBoot to Stub Bootloader

To switch the PineTime Bootloader from MCUBoot to the Stub Bootloader, edit the Bootloader Target Settings [`targets/nrf52_boot/target.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/targets/nrf52_boot/target.yml).

Comment out this line (insert `#` at the beginning of the line)...

```yaml
# target.app: "@mcuboot/boot/mynewt"  # Use MCUBoot, which doesn't support debugging
```

And uncomment this line (remove `#` from the beginning of the line)...

```yaml
target.app: "apps/boot_stub"  # Use Stub Bootloader, which supports debugging
```

Then edit the Bootloader OpenOCD Script [`scripts/nrf52/flash-boot.ocd`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/scripts/nrf52/flash-boot.ocd)

Comment out the `program` line below (insert `#` at the beginning of the line)...

```
# For MCUBoot (debugging not supported):
# program bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf.bin verify 0x00000000
```

And uncomment the `program` line below (remove `#` from the beginning of the line)...

```
# For Stub Bootloader (supports debugging):
program bin/targets/nrf52_boot/app/apps/boot_stub/boot_stub.elf.bin verify 0x00000000
```

Build the Stub Bootloader by clicking `Terminal -> Run Task -> Build Bootloader`. Or run the Bootloader Build Script: [`scripts/nrf52/build-boot.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/scripts/nrf52/build-boot.sh)

Flash the Stub Bootloader to PineTime by clicking `Terminal -> Run Task -> Flash Bootloader`. Or run the Bootloader Flash Script: [`scripts/nrf52/flash-boot.sh`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/scripts/nrf52/flash-boot.sh)

Our PineTime now boots with the Stub Bootloader... Ready for debugging!

# Inside the SPI Flash Driver

We have been using Mynewt's SPI Flash Driver: [`spiflash.h`](https://github.com/apache/mynewt-core/blob/master/hw/drivers/flash/spiflash/include/spiflash/spiflash.h) and [`spiflash.c`](https://github.com/apache/mynewt-core/blob/master/hw/drivers/flash/spiflash/src/spiflash.c)

Remember the configuration we have set in [`syscfg.yml`](https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml) like `SPIFLASH_MANUFACTURER`, `SPIFLASH_MEMORY_TYPE`, `SPIFLASH_MEMORY_CAPACITY`?

The flash driver uses these configuration settings to determine how to access our SPI flash memory.

Based on https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/syscfg.yml

https://www.winbond.com/resource-files/w25q16jv%20spi%20revh%2004082019%20plus.pdf

# SPI Flash File System

We have seen [Mynewt's Flash HAL](https://mynewt.apache.org/latest/os/modules/hal/hal_flash/hal_flash.html) functions for reading, writing and erasing SPI Flash at the byte and sector level. That's too low-level for us firmware programmers.

_Can we have files and directories in SPI Flash?_

Yes we can, with a Flash File System like [__littlefs__](https://github.com/ARMmbed/littlefs).

Earlier we saw this Flash Memory Map: [`hw/bsp/black_vet6/bsp.yml`](https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/bsp.yml)

```yaml
bsp.flash_map:
    areas:
        ...
        FLASH_AREA_NFFS:
            user_id: 1
            device: 1
            offset: 0x00040000
            size: 32kB
```

`FLASH_AREA_NFFS` is a Flash Area that's available for use by the Application Firmware for storing application data. Note that it's located on Flash Device 1, which is the External SPI Flash.

Mynewt will let us install a File System into the `FLASH_AREA_NFFS` Flash Area for storing our files and directories.

Here's a simple example that updates a file named `boot_count` every time main runs. The program can be interrupted at any time without losing track of how many times it has been booted and without corrupting the filesystem (from [`littlefs/README.md`](https://github.com/ARMmbed/littlefs/blob/master/README.md))...

```c
#include "lfs.h"

// variables used by the filesystem
lfs_t lfs;
lfs_file_t file;

// configuration of the filesystem is provided by this struct
const struct lfs_config cfg = {
    // block device operations
    .read  = user_provided_block_device_read,   //  TODO: Integrate with hal_flash_read()
    .prog  = user_provided_block_device_prog,   //  TODO: Integrate with hal_flash_write()
    .erase = user_provided_block_device_erase,  //  TODO: Integrate with hal_flash_erase()
    .sync  = user_provided_block_device_sync,   //  TODO: Provide a dummy function

    // block device configuration
    .read_size = 16,
    .prog_size = 16,
    .block_size = 4096,
    .block_count = 128,
    .cache_size = 16,
    .lookahead_size = 16,
    .block_cycles = 500,
};

// entry point
int test_littlefs(void) {
    // mount the filesystem
    int err = lfs_mount(&lfs, &cfg);

    // reformat if we can't mount the filesystem
    // this should only happen on the first boot
    if (err) {
        lfs_format(&lfs, &cfg);
        lfs_mount(&lfs, &cfg);
    }

    // read current count
    uint32_t boot_count = 0;
    lfs_file_open(&lfs, &file, "boot_count", LFS_O_RDWR | LFS_O_CREAT);
    lfs_file_read(&lfs, &file, &boot_count, sizeof(boot_count));

    // update boot count
    boot_count += 1;
    lfs_file_rewind(&lfs, &file);
    lfs_file_write(&lfs, &file, &boot_count, sizeof(boot_count));

    // remember the storage is not updated until the file is closed successfully
    lfs_file_close(&lfs, &file);

    // release any resources we were using
    lfs_unmount(&lfs);

    // print the boot count
    console_printf("boot_count: %d\n", boot_count); console_flush();
}
```

`lfs_config` is documented here: [`lfs.h`](https://github.com/ARMmbed/littlefs/blob/master/lfs.h)

[More about littlefs](https://github.com/ARMmbed/littlefs/blob/master/README.md)

[Design of littlefs](https://github.com/ARMmbed/littlefs/blob/master/DESIGN.md)

[Specification of littlefs](https://github.com/ARMmbed/littlefs/blob/master/SPEC.md)

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)
