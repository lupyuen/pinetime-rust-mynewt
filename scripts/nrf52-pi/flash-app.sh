#!/usr/bin/env bash
#  Flash Mynewt Application to nRF52 with Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

$HOME/openocd-spi/src/openocd \
    -s $HOME/openocd-spi/tcl \
    -f scripts/nrf52-pi/swd-pi.ocd \
    -f scripts/nrf52/flash-app.ocd
