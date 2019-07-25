#!/usr/bin/env bash
#  Flash Mynewt Bootloader

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

openocd/bin/openocd -f scripts/flash-init.ocd -f interface/stlink-v2.cfg -f target/stm32l4x.cfg -f scripts/stm32l4/flash-boot.ocd
