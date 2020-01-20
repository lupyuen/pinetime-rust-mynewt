#!/usr/bin/env bash
#  Flash Mynewt Bootloader to nRF52 with ST-Link on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Identify SWD programmer. /proc/device-tree/model contains
#  Raspberry Pi 4 Model B Rev 1.1
#  Raspberry Pi 3 Model B Plus Rev 1.3
swd_device=stlink
if [ -e /proc/device-tree/model ]; then
    swd_device=pi
fi

openocd/bin/openocd \
    -f scripts/nrf52/swd-$swd_device.ocd \
    -f scripts/nrf52/flash-boot.ocd
