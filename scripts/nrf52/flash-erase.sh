#!/usr/bin/env bash
#  Erase Flash ROM on nRF52 with ST-Link on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd \
    -f scripts/nrf52/flash-init.ocd \
    -f interface/stlink.cfg \
    -c "transport select hla_swd" \
    -f target/nrf52.cfg \
    -f scripts/nrf52/flash-erase.ocd
