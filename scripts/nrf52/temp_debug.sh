#!/usr/bin/env bash

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd -f interface/stlink.cfg -f target/nrf52.cfg -c "gdb_flash_program enable" -c "gdb_breakpoint_override hard"
