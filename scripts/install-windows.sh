#!/usr/bin/env bash
#  Install Rust and Mynewt Build Tools for Windows.  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html.  

echo "Installing Rust and Mynewt Build Tools for Windows..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

set +x; echo; echo "----- Setting versions..."; set -x; set -x
source scripts/install-version.sh

#  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
set +x; echo; echo "----- Installing git..."; set -x
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update -y
sudo apt install git -y
git --version  #  Should show "git version 2.21.0" or later.

#  Install Arm version of OpenOCD into the ./openocd folder.
set +x; echo; echo "----- Installing openocd..."; set -x
if [ ! -e openocd/bin/openocd.exe ]; then
    sudo apt install wget unzip -y
    wget https://github.com/gnu-mcu-eclipse/openocd/releases/download/v0.10.0-11-20190118/gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip
    unzip -q gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip -d openocd
    rm gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip
    mv "openocd/GNU MCU Eclipse/OpenOCD/"*/* openocd
    rm -rf "openocd/GNU MCU Eclipse"
fi

#  Install npm.
set +x; echo; echo "----- Installing npm..."; set -x
if [ ! -e /usr/bin/npm ]; then
    sudo apt update  -y  #  Update all Ubuntu packages.
    sudo apt upgrade -y  #  Upgrade all Ubuntu packages.
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    sudo apt install nodejs -y
    node --version
fi

#  Assume Arm Toolchain already installed
set +x; echo; echo "----- Installing Arm Toolchain..."; set -x

#  Change owner from root back to user for the installed packages.
set +x; echo; echo "----- Fixing ownership..."; set -x
if [ -d "$HOME/.caches" ]; then
    sudo chown -R $USER:$USER "$HOME/.caches"
fi
if [ -d "$HOME/.config" ]; then
    sudo chown -R $USER:$USER "$HOME/.config"
fi
if [ -d "$HOME/opt" ]; then
    sudo chown -R $USER:$USER "$HOME/opt"
fi

#  Assume Windows version of newt already installed
set +x; echo; echo "----- Skipping newt..."; set -x

# #  Install the existing Mynewt OS in "repos"
# set +x; echo; echo "-----  Installing mynewt..."; set -x
# if [ -d repos ]; then
#     rm -rf repos
# fi

# #  Download Mynewt OS into the current project folder, under "repos" subfolder.
# newt install -v -f
# echo ✅ ◾ ️Done! See README.md for Mynewt type conversion build fixes

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions