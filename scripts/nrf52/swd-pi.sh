#!/usr/bin/env bash
# Unprotect the nRF52 module using a Raspberry Pi
# From https://stackoverflow.com/questions/52308978/problem-flashing-nrf52-chip-using-openocd/54372481#54372481

set -x  #  Echo all commands.

# Parent Directory of the locally-built OpenOCD
OPENOCD_DIR=/home/pi

$OPENOCD_DIR/openocd/src/openocd \
    -s $OPENOCD_DIR/openocd/tcl \
    -d2 \
    -f scripts/nrf52/swd-pi.ocd
