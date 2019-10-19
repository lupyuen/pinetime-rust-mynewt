::  Flash Mynewt Bootloader on Windows

openocd\bin\openocd.exe ^
    -f scripts/gd32vf103/flash-init.ocd ^
    -f interface/stlink.cfg ^
    -c "transport select jtag" ^
    -f scripts/gd32vf103/gd32vf103.ocd ^
    -f scripts/gd32vf103/flash-boot.ocd
