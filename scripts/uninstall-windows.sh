#!/usr/bin/env bash
#  Uninstall Apache Mynewt for Windows

set -x  #  Echo all commands.

sudo rm /usr/bin/newt
rm -rf /tmp/mynewt

sudo apt remove golang-1.10 -y

sudo xpm uninstall --global @gnu-mcu-eclipse/arm-none-eabi-gcc
sudo npm uninstall --global xpm

sudo apt remove nodejs -y
sudo apt autoremove -y
