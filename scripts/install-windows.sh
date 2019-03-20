#!/usr/bin/env bash
#  Install Apache Mynewt for Windows

echo "Installing Apache Mynewt for Windows..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

##sudo apt update  -y  #  Update all Ubuntu packages.
##sudo apt upgrade -y  #  Upgrade all Ubuntu packages.

#  Install npm.
##curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
##sudo apt install nodejs -y
##node --version

#  Install Arm Toolchain. From https://gnu-mcu-eclipse.github.io/toolchain/arm/install/
sudo npm install --global xpm
sudo xpm install --global @gnu-mcu-eclipse/arm-none-eabi-gcc

echo "Done!"
