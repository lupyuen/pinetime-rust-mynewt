#!/usr/bin/env bash
#  Flash Mynewt Bootloader on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd \
    -f scripts/gd32vf103/flash-init.ocd \
    -f interface/cmsis-dap.cfg \
    -c "transport select jtag" \
    -f scripts/gd32vf103/gd32vf103.ocd \
    -f scripts/gd32vf103/flash-boot.ocd
