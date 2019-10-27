#!/usr/bin/env bash
#  Create Mynewt Image for macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Add toolchain to PATH.
export PATH="$PWD/xPacks/riscv-none-embed-gcc/8.2.0-3.1/bin:$PATH"

newt create-image -v gd32vf103c-start_my_sensor 1.0.0

newt size -v gd32vf103c-start_my_sensor
