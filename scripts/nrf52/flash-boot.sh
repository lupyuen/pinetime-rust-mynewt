#!/usr/bin/env bash
#  Flash Mynewt Bootloader to nRF52 on macOS, Linux and Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Configure SWD Programmer
source scripts/config.sh

#  Flash the device
openocd/bin/openocd \
    -f $swd_device \
    -f scripts/nrf52/flash-boot.ocd
