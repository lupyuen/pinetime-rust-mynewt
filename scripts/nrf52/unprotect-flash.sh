#!/usr/bin/env bash
# Unprotect the nRF52 module using a Raspberry Pi or Jetson Nano. Tested on OpenOCD for Jetson Nano 0.10.0+dev-00932-g85a460d5 (2019-09-23-09:18)
# From https://stackoverflow.com/questions/52308978/problem-flashing-nrf52-chip-using-openocd/54372481#54372481

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

$HOME/openocd/src/openocd \
    -s $HOME/openocd/tcl \
    -d4 \
    -c "interface vsllink" \
    -c "adapter_khz 100" \
    -c "transport select swd" \
    -c "set WORKAREASIZE 0" \
    -c "adapter_nsrst_delay 100" \
    -c "adapter_nsrst_assert_width 100" \
    -f target/nrf52.cfg \
    -f scripts/nrf52/unprotect-flash.ocd

# $HOME/openocd/src/openocd -s $HOME/openocd/tcl -d2 -f interface/cmsis-dap.cfg -f target/nrf52.cfg

# $HOME/openocd/src/openocd -s $HOME/openocd/tcl -d2 -f interface/stlink.cfg -c "transport select hla_swd" -f target/nrf52.cfg

# $HOME/openocd/src/openocd -s $HOME/openocd/tcl -d2 -f interface/cmsis-dap.cfg -f target/nrf52.cfg

# openocd/bin/openocd -d2 -f interface/stlink.cfg -c "transport select hla_swd" -f target/nrf52.cfg

# openocd/bin/openocd -d2 -f interface/cmsis-dap.cfg -f target/nrf52.cfg

exit

# Test sysfs
sudo bash
echo 11 >/sys/class/gpio/export
echo 25 >/sys/class/gpio/export
ls /sys/class/gpio
echo 11 >/sys/class/gpio/unexport
echo 25 >/sys/class/gpio/unexport
exit