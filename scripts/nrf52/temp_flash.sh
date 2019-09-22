#!/usr/bin/env bash

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd -d2 -f interface/stlink.cfg -f target/nrf52.cfg -c 'init_reset halt; program $(OUTPUT_BINARY_DIRECTORY)/$(HEX) verify; reset; exit'
