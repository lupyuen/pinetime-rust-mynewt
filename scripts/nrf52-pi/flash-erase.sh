#!/usr/bin/env bash
#  #  Erase Flash ROM on nRF52 with Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Configure SWD Programmer
source scripts/config.sh

#  Erase the Flash ROM
openocd/bin/openocd \
    -f $swd_device \
    -f scripts/nrf52/flash-erase.ocd
