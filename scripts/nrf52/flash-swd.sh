#!/usr/bin/env bash
# Script to flash a firmware image to STM32 Blue Pill via OpenOCD.

openocd/bin/openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -f scripts/nrf52/flash-swd.ocd
