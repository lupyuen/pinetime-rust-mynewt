#!/usr/bin/env bash
#  Remove Flash Protection on nRF52 with Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

sudo /home/pi/openocd/src/openocd \
    -s /home/pi/openocd/tcl \
    -f swd-pi.ocd \
    -f flash-unprotect.ocd
