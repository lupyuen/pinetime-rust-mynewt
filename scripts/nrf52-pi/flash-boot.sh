#!/usr/bin/env bash
#  Flash Mynewt Bootloader to nRF52 with Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd \
    -f scripts/nrf52-pi/swd-pi.ocd \
    -f scripts/nrf52/flash-boot.ocd
