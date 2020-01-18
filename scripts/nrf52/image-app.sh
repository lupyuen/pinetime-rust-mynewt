#!/usr/bin/env bash
#  Create Mynewt Image for macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

newt create-image nrf52_my_sensor 1.0.0
