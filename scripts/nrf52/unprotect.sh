#!/usr/bin/env bash
# Unprotect the nRF52 module using a Raspberry Pi or Jetson Nano. Tested on OpenOCD for Jetson Nano 0.10.0+dev-00932-g85a460d5 (2019-09-23-09:18)
# From https://stackoverflow.com/questions/52308978/problem-flashing-nrf52-chip-using-openocd/54372481#54372481

set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

# From https://learn.adafruit.com/programming-microcontrollers-using-openocd-on-raspberry-pi?view=all
# "transport select swd; set WORKAREASIZE 0; adapter_nsrst_delay 100; adapter_nsrst_assert_width 100; source [find target/nrf51.cfg]" 
# -c "init; reset; halt; nrf51 mass_erase; reset" -c "shutdown"

sudo $HOME/openocd/src/openocd \
    -s $HOME/openocd/tcl \
    -d3 \
    -f swd-gpio.cfg \
    -f target/nrf52.cfg \
    -c "echo init..." \
    -c "init" \
    -c "echo reset..." \
    -c "reset" \
    -c "echo halt..." \
    -c "halt" \
    -c "nrf52.dap apreg 1 0x04"

# From https://github.com/blacksphere/blackmagic/issues/381:
# "init; nrf52.dap apreg 1 0x0c; nrf52.dap apreg 1 0x04 0x01; reset; nrf5 mass_erase; reset; shutdown;"

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

# Test sysfs
sudo bash
echo 11 >/sys/class/gpio/export
echo 25 >/sys/class/gpio/export
ls /sys/class/gpio
echo 11 >/sys/class/gpio/unexport
echo 25 >/sys/class/gpio/unexport
exit