#!/usr/bin/env bash
# Unprotect the nRF52 module in macOS and Linux. Tested on OpenOCD for macOS 0.10.0+dev-00462-gdd1d90111 (2019-01-15-13:49).
# From https://stackoverflow.com/questions/52308978/problem-flashing-nrf52-chip-using-openocd/54372481#54372481

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

sudo $HOME/openocd/src/openocd -s $HOME/openocd/tcl -f interface/sysfsgpio-raspberrypi.cfg -c "transport select swd" -f target/nrf52.cfg

# $HOME/openocd/src/openocd -s $HOME/openocd/tcl -d2 -f interface/cmsis-dap.cfg -f target/nrf52.cfg

# $HOME/openocd/src/openocd -s $HOME/openocd/tcl -d2 -f interface/stlink.cfg -c "transport select hla_swd" -f target/nrf52.cfg

# $HOME/openocd/src/openocd -s $HOME/openocd/tcl -d2 -f interface/cmsis-dap.cfg -f target/nrf52.cfg

# openocd/bin/openocd -d2 -f interface/stlink.cfg -c "transport select hla_swd" -f target/nrf52.cfg

# openocd/bin/openocd -d2 -f interface/cmsis-dap.cfg -f target/nrf52.cfg

exit

# Enter these commands in another command prompt
telnet localhost 4444

nrf52.dap apreg 1 0x04
# Should return 0 (protected)

nrf52.dap apreg 1 0x04 0x01

nrf52.dap apreg 1 0x04
# Should return 1 (unprotected)
