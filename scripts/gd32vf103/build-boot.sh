#!/usr/bin/env bash
#  Build Mynewt bootloader on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Build the bootloader.
newt build gd32vf103c-start_boot

#  Show the size.
newt size -v gd32vf103c-start_boot
