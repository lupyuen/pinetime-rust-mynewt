# Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)

![Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)](https://lupyuen.github.io/images/spiflash-config.png)

TODO

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/pkg.yml

1. Configure pins for SPI Port (`syscfg.yml`):

1. Configure flash interface (`syscfg.yml`):

1. Configure flash timings (`syscfg.yml`):

1. Include spiflash.h (`hal_bsp.c`):

1. Define two flash devices (`hal_bsp.c`):
      Internal Flash ROM,
      External SPI Flash

1. Access flash devices by ID (`hal_bsp.c`):
      0 for Internal Flash ROM,
      1 for External SPI Flash

1. Add `spiflash` driver (`pkg.yml`):

TODO

# Configure pins for SPI Port (`syscfg.yml`):

TODO

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml

```yaml
syscfg.vals:
    ...
    ###########################################################################
    # Default Pins for Peripherals
    # Defined in http://files.pine64.org/doc/PineTime/PineTime%20Port%20Assignment%20rev1.0.pdf

    # SPI port 0 connected to ST7789 display and XT25F32B flash
    SPI_0_MASTER_PIN_SCK:  2  # P0.02/AIN0: SPI-SCK, LCD_SCK    SPI clock for display and flash
    SPI_0_MASTER_PIN_MOSI: 3  # P0.03/AIN1: SPI-MOSI, LCD_SDI   SPI MOSI for display and flash
    SPI_0_MASTER_PIN_MISO: 4  # P0.04/AIN2: SPI-MISO            SPI MISO for flash only
    ...
```

# Configure flash interface (`syscfg.yml`):

TODO

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/syscfg.yml

```yaml
syscfg.vals:
    ...
    ###########################################################################
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

# Configure flash timings (`syscfg.yml`):

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

# Include spiflash.h (`hal_bsp.c`):

TODO


https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota2/hw/bsp/nrf52/src/hal_bsp.c

```c
#if MYNEWT_VAL(SPIFLASH)  //  If External SPI Flash exists...
#include <spiflash/spiflash.h>
#endif  //  MYNEWT_VAL(SPIFLASH)
```

# Define two flash devices (`hal_bsp.c`):

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

# Access flash devices by ID (`hal_bsp.c`):

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

# Add `spiflash` driver (`pkg.yml`):

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
        ///////////////////////////////////////////////////
        //  Dump Sector Map

        //  Dump sector map for internal flash ROM
        //  map_cmd(0) ||

        //  Dump sector map for external SPI flash
        //  map_cmd(1) ||

        ///////////////////////////////////////////////////
        //  Read Flash: Before erasing
        //  flash <flash-id> read <offset> <size> -- reads bytes from flash        

        //  Read internal flash ROM
        flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

        //  Read external SPI flash
        flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Erase Flash: Sets all bits to 1
        //  flash <flash-id> erase <offset> <size> -- erases flash

        //  Erase external SPI flash
        flash_cmd(ERASE_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Read Flash: Shows all bits set to 1
        //  flash <flash-id> read <offset> <size> -- reads bytes from flash        

        //  Read internal flash ROM
        flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

        //  Read external SPI flash
        flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Write Flash: Write 0x01, 0x02, 0x03, ... (Must erase before writing)
        //  flash <flash-id> write <offset> <size> -- writes incrementing data pattern 0-8 to flash

        //  Write external SPI flash
        flash_cmd(WRITE_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
        //  Read Flash: Shows 0x01, 0x02, 0x03, ...
        //  flash <flash-id> read <offset> <size> -- reads bytes from flash        

        //  Read internal flash ROM
        flash_cmd(READ_COMMAND, 0, 0x0, 32) ||

        //  Read external SPI flash
        flash_cmd(READ_COMMAND, 1, 0x0, 32) ||

        ///////////////////////////////////////////////////
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
Rust test display
*/

/* Flash Sector Map:
Testing flash...
Flash 0 at 0x0 size 0x80000 with 128 sectors, alignment req 1 bytes
  0: 1000
  1: 1000
  2: 1000
  3: 1000
  4: 1000
  5: 1000
  6: 1000
  7: 1000
  8: 1000
  9: 1000
  10: 1000
  11: 1000
  12: 1000
  13: 1000
  14: 1000
  15: 1000
  16: 1000
  17: 1000
  18: 1000
  19: 1000
  20: 1000
  21: 1000
  22: 1000
  23: 1000
  24: 1000
  25: 1000
  26: 1000
  27: 1000
  28: 1000
  29: 1000
  30: 1000
  31: 1000
...  127: 1000

Flash 1 at 0x0 size 0x3ff800 with 1024 sectors, alignment req 1 bytes
  0: ffe
  1: ffe
  2: ffe
  3: ffe
  4: ffe
  5: ffe
  6: ffe
  7: ffe
  8: ffe
  9: ffe
  10: ffe
  11: ffe
  12: ffe
  13: ffe
  14: ffe
  15: ffe
  16: ffe
  17: ffe
  18: ffe
  19: ffe
  20: ffe
  21: ffe
  22: ffe
  23: ffe
  24: ffe
  25: ffe
  26: ffe
  27: ffe
  28: ffe
  29: ffe
  30: ffe
  31: ffe
...  1023: ffe
```

# SPI Flash Benchmark

TODO

# Debugging with MCUBoot

TODO

# Inside The SPI Flash Driver

TODO

Based on https://github.com/apache/mynewt-core/blob/master/hw/bsp/black_vet6/syscfg.yml

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)
