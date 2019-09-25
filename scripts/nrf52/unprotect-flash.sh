#!/usr/bin/env bash
# Unprotect the nRF52 module using a Raspberry Pi
# From https://stackoverflow.com/questions/52308978/problem-flashing-nrf52-chip-using-openocd/54372481#54372481

# set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

OPENOCD_DIR=/home/pi

$OPENOCD_DIR/openocd/src/openocd \
    -s $OPENOCD_DIR/openocd/tcl \
    -d4 \
    -f scripts/nrf52/swd-pi.ocd

exit

# From https://learn.adafruit.com/programming-microcontrollers-using-openocd-on-raspberry-pi?view=all
# "transport select swd; set WORKAREASIZE 0; adapter_nsrst_delay 100; adapter_nsrst_assert_width 100; source [find target/nrf51.cfg]" 
# -c "init; reset; halt; nrf51 mass_erase; reset" -c "shutdown"

# echo 18  >/sys/class/gpio/export
# echo out >/sys/class/gpio/gpio18/direction
# echo 0   >/sys/class/gpio/gpio18/value
# sleep 5
# echo 1   >/sys/class/gpio/gpio18/value
# sleep 5

$HOME/openocd/src/openocd \
    -s $HOME/openocd/tcl \
    -d4 \
    -f swd-gpio.ocd \
    -f target/nrf52.cfg \
    -c "echo init..." \
    -c "init" \
    -c "echo reset..." \
    -c "reset" \
    -c "echo halt..." \
    -c "halt" \
    -c "nrf52.dap apreg 1 0x04"

# sleep 2
# echo 18  >/sys/class/gpio/unexport

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