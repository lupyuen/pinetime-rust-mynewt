#!/usr/bin/env bash
#  Flash Mynewt Bootloader to nRF52 with ST-Link on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd \
    -f scripts/nrf52/swd-stlink.ocd \
    -f scripts/nrf52/flash-boot.ocd
