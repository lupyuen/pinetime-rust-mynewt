#!/bin/bash
set -x
#set -e
for (( ; ; ))
do
    # # gpio79 is pin 12 on the Jetson Nano
    # echo 79 > /sys/class/gpio/export
    # # Set Direction
    # echo out > /sys/class/gpio/gpio79/direction
    # # Bit Bangin'!
    # echo 1 > /sys/class/gpio/gpio79/value
    # cat /sys/kernel/debug/gpio
    # sleep 5
    # echo 0 > /sys/class/gpio/gpio79/value
    # cat /sys/kernel/debug/gpio
    # sleep 5
    # # Unmap GPIO Pin
    # echo 79 > /sys/class/gpio/unexport
    # # Query Status
    # # cat /sys/kernel/debug/gpio

    #######

    echo 18  >/sys/class/gpio/export
    echo out >/sys/class/gpio/gpio18/direction
    cat /sys/class/gpio/gpio18/direction

    echo 1   >/sys/class/gpio/gpio18/value
    cat /sys/class/gpio/gpio18/value
    sleep 10

    echo 0   >/sys/class/gpio/gpio18/value
    cat /sys/class/gpio/gpio18/value
    sleep 10

    echo 18  >/sys/class/gpio/unexport

    #######

    # ./unprotect.sh
    # sleep 10
done