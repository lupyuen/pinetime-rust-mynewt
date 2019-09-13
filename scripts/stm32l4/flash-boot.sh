#!/usr/bin/env bash
#  Flash Mynewt Bootloader

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#openocd/bin/openocd -f scripts/stm32l4/flash-init.ocd -f interface/stlink.cfg -f target/stm32l4x.cfg -f scripts/stm32l4/flash-boot.ocd
$HOME/openocd-0.10.0/bin/openocd -s /Users/Luppy/openocd-0.10.0/scripts -f scripts/stm32l4/flash-init.ocd -f interface/stlink-v2-1.cfg -c "transport select hla_swd" -f target/stm32l4x.cfg -f scripts/stm32l4/flash-boot.ocd
