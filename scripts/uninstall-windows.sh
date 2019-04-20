#!/usr/bin/env bash
#  Uninstall Apache Mynewt for Windows

set -x  #  Echo all commands.

sudo apt remove newt -y
sudo rm /usr/bin/newt
rm -rf /tmp/mynewt

sudo apt remove golang-1.10 -y

sudo rm -rf ~/opt/xPacks

sudo npm uninstall --global xpm

sudo apt remove nodejs -y

rm openocd/bin/openocd.exe

sudo apt autoremove -y
