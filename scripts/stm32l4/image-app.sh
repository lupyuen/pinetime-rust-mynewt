#!/usr/bin/env bash
#  Create Mynewt Image

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

newt create-image -v stm32l4_my_sensor 1.0.0 && newt size -v stm32l4_my_sensor
