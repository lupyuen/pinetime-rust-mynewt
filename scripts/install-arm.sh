#!/usr/bin/env bash
#  Install Rust and Mynewt Build Tools for Ubuntu Arm (e.g. Nvidia Jetson Nano).  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html.  

echo "Installing Rust and Mynewt Build Tools for Linux..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

set +x; echo; echo "----- Setting versions..."; set -x
source scripts/install-version.sh

#  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
set +x; echo; echo "----- Installing curl, git..."; set -x
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update -y
sudo apt install curl git -y
git --version  #  Should show "git version 2.21.0" or later.

#  Install the ST-Link V2 driver: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
set +x; echo; echo "----- Installing ST-Link V2 driver..."; set -x
if [ ! -e /etc/udev/rules.d/99-platformio-udev.rules ]; then
    curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
fi

#  Install OpenOCD into the ./openocd folder.  Use "apt install" because Ubuntu build is not available for OpenOCD for gnu-mcu-eclipse.
set +x; echo; echo "----- Installing openocd..."; set -x
if [ ! -e openocd/bin/openocd ]; then
    sudo apt install openocd -y
    if [ ! -d openocd/bin ]; then
        mkdir -p openocd/bin
    fi
    ln -s /usr/bin/openocd openocd/bin/openocd
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

set +x; echo; echo "----- Installing Arm Toolchain..."; set -x
sudo apt install gcc-arm-none-eabi -y
arm-none-eabi-gcc --version  #  Should show "7.3.1 20180622" or later

#  Install go for building newt
set +x; echo; echo "----- Installing go..."; set -x 
golangpath=/usr/lib/go-1.13.6/bin
if [ ! -e $golangpath/go ]; then
    wget https://dl.google.com/go/go1.13.6.linux-armv6l.tar.gz
    tar xf go*.tar.gz
    sudo mv go /usr/lib/go-1.13.6
    rm go*.tar.gz

    echo export PATH=$golangpath:\$PATH >> ~/.bashrc
    echo export PATH=$golangpath:\$PATH >> ~/.profile
    echo export GOROOT= >> ~/.bashrc
    echo export GOROOT= >> ~/.profile
fi
export PATH=$golangpath:$PATH
#  Prevent mismatch library errors when building newt.
export GOROOT=
go version  #  Should show "go1.13" or later.

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

#  Build newt in /tmp/mynewt. Copy to /usr/local/bin.
set +x; echo; echo "----- Installing newt..."
if [ ! -e /usr/local/bin/newt ]; then
    mynewtpath=/tmp/mynewt
    if [ -d $mynewtpath ]; then
        rm -rf $mynewtpath
    fi
    mkdir $mynewtpath
    pushd $mynewtpath

    git clone --branch $mynewt_version https://github.com/apache/mynewt-newt/
    cd mynewt-newt/
    ./build.sh
    sudo mv newt/newt /usr/local/bin
    popd
fi
newt version  #  Should show "Version: 1.7.0" or later.  Should NOT show "...-dev".

#  echo "----- Installing mynewt..."
#  Remove the existing Mynewt OS in "repos"
#  if [ -d repos ]; then
#      rm -rf repos
#  fi
#  Download Mynewt OS into the current project folder, under "repos" subfolder.
#  newt install -v -f

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done!
