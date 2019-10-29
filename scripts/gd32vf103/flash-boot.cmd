::  Flash Mynewt Bootloader on Windows

riscv-openocd\src\openocd.exe ^
    -s riscv-openocd/tcl ^
    -f scripts/gd32vf103/flash-init.ocd ^
    -f interface/cmsis-dap.cfg ^
    -f scripts/gd32vf103/gd32vf103.ocd ^
    -f scripts/gd32vf103/flash-boot.ocd
