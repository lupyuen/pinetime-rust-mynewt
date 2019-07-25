#!/usr/bin/env bash
#  Build Mynewt application on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Build the application.
newt build stm32l4_my_sensor

#  Show the size.
newt size -v stm32l4_my_sensor
