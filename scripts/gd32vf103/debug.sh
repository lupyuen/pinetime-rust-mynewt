#!/usr/bin/env bash
#  Debug Mynewt Application on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd \
    -c gdb_port 50000 \
    -f scripts/gd32vf103/flash-init.ocd \
    -f interface/cmsis-dap.cfg \
    -f scripts/gd32vf103/gd32vf103.ocd \
    -f scripts/gd32vf103/debug.ocd
