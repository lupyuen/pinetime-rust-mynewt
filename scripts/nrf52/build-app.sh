#!/usr/bin/env bash
#  Build Mynewt application on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Build the application.
newt build ada_feather_nrf52_my_sensor

#  Show the size.
newt size -v ada_feather_nrf52_my_sensor
