#!/usr/bin/env bash
#  Flash Mynewt Application to nRF52 with Raspberry Pi

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Sleep a while for CPU to drop
sleep 1

#  Flash at the highest priority because flashing is time-sensitive
sudo nice --20 \
    /home/pi/openocd/src/openocd \
    -s /home/pi/openocd/tcl \
    -f scripts/nrf52-pi/swd-pi.ocd \
    -f scripts/nrf52/flash-app.ocd
