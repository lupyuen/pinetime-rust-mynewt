#!/usr/bin/env bash
#  Enable Flash Protection on nRF52 with Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

sudo /home/pi/openocd/src/openocd \
    -d2 \
    -s /home/pi/openocd/tcl \
    -f scripts/nrf52-pi/swd-pi.ocd \
    -f scripts/nrf52-pi/flash-protect.ocd
