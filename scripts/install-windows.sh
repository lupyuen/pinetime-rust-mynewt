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

#  Install Arm Toolchain into $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/*/.content/. From https://gnu-mcu-eclipse.github.io/toolchain/arm/install/
##sudo npm install --global xpm
##sudo xpm install --global @gnu-mcu-eclipse/arm-none-eabi-gcc

#  Add Arm Toolchain to front of PATH.
gccpath=`ls -d $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/*/.content/bin`
echo export PATH=$gccpath:\$PATH >> ~/.bashrc
echo export PATH=$gccpath:\$PATH >> ~/.profile
export PATH=$gccpath:$PATH
arm-none-eabi-gcc --version  #  Should show "gcc version 8.2.1 20181213" or later.

#  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
git --version  #  Should show "git version 2.21.0" or later.

echo "Done!"
