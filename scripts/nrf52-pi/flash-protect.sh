#!/usr/bin/env bash
#  Enable Flash Protection on nRF52 with Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd \
    -f scripts/nrf52-pi/swd-pi.ocd \
    -f scripts/nrf52-pi/flash-protect.ocd
