# `patch`

This folder contains Mynewt files that will be patched by the "Install Apache Mynewt" task.

`repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld` <br>
`repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml` <br>
are patched versions of <br>
https://github.com/apache/mynewt-core/tree/master/hw/bsp/bluepill/bluepill.ld <br>
https://github.com/apache/mynewt-core/tree/master/hw/bsp/bluepill/bsp.yml <br>
that change the memory layout so that the bootloader and the application image both fit within 64 KB,
the official ROM size of Blue Pill.

- FLASH_AREA_BOOTLOADER: Bootloader <br>
    offset: 0x08000000 <br>
    size: 16kB
    
- FLASH_AREA_IMAGE_0: First application image. Must sync with scripts/flash-app.ocd, repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld <br>
    offset: 0x08004000 <br>
    size: 48kB

The other memory sections are not critical and have been moved to the higher 64 KB of ROM: 

- FLASH_AREA_REBOOT_LOG: Reboot log <br>
    offset: 0x08010000 <br>
    size: 8kB

- FLASH_AREA_NFFS: User filesystem <br>
    offset: 0x08012000 <br>
    size: 8kB

- FLASH_AREA_IMAGE_1: Second application image. Not supported. <br>
    offset: 0x08014010 <br>
    size: 0kB

- FLASH_AREA_IMAGE_SCRATCH:  Space for swapping application image. Not supported. <br>
    offset: 0x08014020 <br>
    size: 0kB
