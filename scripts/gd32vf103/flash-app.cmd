::  Flash Mynewt Application on Windows

openocd\bin\openocd.exe ^
    -f scripts/gd32vf103/flash-init.ocd ^
    -f interface/stlink.cfg ^
    -f scripts/gd32vf103/gd32vf103.ocd ^
    -f scripts/gd32vf103/flash-app.ocd
