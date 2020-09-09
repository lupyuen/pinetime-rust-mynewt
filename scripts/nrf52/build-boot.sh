#!/usr/bin/env bash
#  Build Mynewt bootloader on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Show the Arm Toolchain version.
arm-none-eabi-gcc --version

#  Build the bootloader.
newt build nrf52_boot

#  Show the size.
newt size -v nrf52_boot

#  Copy the disassembler and linker map to the logs folder. For Stub Bootloader, select "bin/targets/nrf52_boot/app/apps/boot_stub/boot_stub.elf.*"
cp bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf.lst logs
cp bin/targets/nrf52_boot/app/boot/mynewt/mynewt.elf.map logs
