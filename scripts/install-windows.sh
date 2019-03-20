#!/usr/bin/env bash

echo "Installing Apache Mynewt for Windows..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

##sudo apt update -y
##sudo apt upgrade -y

##curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
##sudo apt install nodejs -y
##node --version

npm install --global xpm

echo "Done!"
