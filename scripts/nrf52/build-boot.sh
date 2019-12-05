#!/usr/bin/env bash
#  Build Mynewt bootloader on macOS and Linux

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

#  Build the bootloader.
newt build nrf52_boot

#  Show the size.
newt size -v nrf52_boot

#  Copy the disassembler and linker map to the logs folder.
cp bin/targets/nrf52_boot/app/apps/boot_stub/boot_stub.elf.lst logs
cp bin/targets/nrf52_boot/app/apps/boot_stub/boot_stub.elf.map logs
