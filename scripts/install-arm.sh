#!/usr/bin/env bash
#  Install Apache Mynewt for Ubuntu Arm (e.g. Nvidia Jetson Nano).  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html.  

echo "Installing Apache Mynewt for Linux..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
#  echo $PATH

echo "***** Installing curl, git..."

#  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update -y
sudo apt install curl git -y
git --version  #  Should show "git version 2.21.0" or later.

echo "***** Installing ST-Link V2 driver..."

#  Install the ST-Link V2 driver: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
if [ ! -e /etc/udev/rules.d/99-platformio-udev.rules ]; then
    curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
fi

echo "***** Installing openocd..."

#  Install OpenOCD into the ./openocd folder.  Use "apt install" because Ubuntu build is not available for OpenOCD for gnu-mcu-eclipse.
if [ ! -e openocd/bin/openocd ]; then
    sudo apt install openocd -y
    if [ ! -d openocd/bin ]; then
        mkdir -p openocd/bin
    fi
    ln -s /usr/bin/openocd openocd/bin/openocd
fi

echo "***** Installing npm..."

#  Install npm.
if [ ! -e /usr/bin/npm ]; then
    sudo apt update  -y  #  Update all Ubuntu packages.
    sudo apt upgrade -y  #  Upgrade all Ubuntu packages.
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    sudo apt install nodejs -y
    node --version
fi

echo "***** Installing Arm Toolchain..."

sudo apt install gcc-arm-none-eabi
arm-none-eabi-gcc --version  #  Should show "gcc version 8.2.1 20181213" or later.

echo "***** Installing go..."

#  Install go 1.10 to prevent newt build error: "go 1.10 or later is required (detected version: 1.2.X)"
golangpath=/usr/lib/go-1.10/bin
if [ ! -e $golangpath/go ]; then
    sudo apt install golang-1.10 -y
    echo export PATH=$golangpath:\$PATH >> ~/.bashrc
    echo export PATH=$golangpath:\$PATH >> ~/.profile
    echo export GOROOT= >> ~/.bashrc
    echo export GOROOT= >> ~/.profile
    export PATH=$golangpath:$PATH
fi
#  Prevent mismatch library errors when building newt.
export GOROOT=
go version  #  Should show "go1.10.1" or later.

echo "***** Fixing ownership..."

#  Change owner from root back to user for the installed packages.
if [ -d "$HOME/.caches" ]; then
    sudo chown -R $USER:$USER "$HOME/.caches"
fi
if [ -d "$HOME/.config" ]; then
    sudo chown -R $USER:$USER "$HOME/.config"
fi
if [ -d "$HOME/opt" ]; then
    sudo chown -R $USER:$USER "$HOME/opt"
fi

echo "***** Installing newt..."

#  Install latest official release of newt.  If dev version from Tutorial 1 is installed, it will be overwritten.
#  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html

#  Build newt mynewt_1_6_0_tag in /tmp/mynewt. Copy to /usr/local/bin.
if [ ! -e /usr/local/bin/newt ]; then
    mynewtpath=/tmp/mynewt
    if [ -d $mynewtpath ]; then
        rm -rf $mynewtpath
    fi
    mkdir $mynewtpath
    pushd $mynewtpath

    git clone --branch mynewt_1_6_0_tag https://github.com/apache/mynewt-newt/
    cd mynewt-newt/
    ./build.sh
    #  Should show: "Building newt.  This may take a minute..."
    #  "Successfully built executable: /tmp/mynewt/mynewt-newt/newt/newt"
    #  If you see "Error: go 1.10 or later is required (detected version: 1.2.X)"
    #  then install go 1.10 as shown above.
    sudo mv newt/newt /usr/local/bin
    popd
fi

echo "***** Installing mynewt..."

#  Remove the existing Mynewt OS in "repos"
if [ -d repos ]; then
    rm -rf repos
fi

#  Download Mynewt OS into the current project folder, under "repos" subfolder.
set +e              #  TODO: Remove this when newt install is fixed
newt install -v -f  #  TODO: "git checkout" fails due to uncommitted files
set -e              #  TODO: Remove this when newt install is fixed

#  If you see "Error: Unknown subcommand: get-url"
#  then upgrade git as shown above.

echo "***** Reparing mynewt..."

#  TODO: newt install fails due to uncommitted files. Need to check out manually.

#  Check out core mynewt_1_6_0_tag.
if [ -d repos/apache-mynewt-core ]; then
    pushd repos/apache-mynewt-core
    git checkout mynewt_1_6_0_tag -f
    popd
fi
#  Check out nimble nimble_1_1_0_tag, which matches mynewt_1_6_0_tag.
if [ -d repos/apache-mynewt-nimble ]; then
    pushd repos/apache-mynewt-nimble
    git checkout nimble_1_1_0_tag -f
    popd
fi
#  Check out mcuboot v1.3.0, which matches mynewt_1_6_0_tag.
if [ -d repos/mcuboot ]; then
    pushd repos/mcuboot
    git checkout v1.3.0 -f
    popd
fi

#  If apache-mynewt-core is missing, then the installation failed.
if [ ! -d repos/apache-mynewt-core ]; then
    echo "***** newt install failed"
    exit 1
fi

#  If apache-mynewt-nimble is missing, then the installation failed.
if [ ! -d repos/apache-mynewt-nimble ]; then
    echo "***** newt install failed"
    exit 1
fi

echo "***** Patching mynewt with custom files..."

#  Change the ROM layout to reduce bootloader size. Move application image to lower 64 KB ROM.
if [ ! -e repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld.old ]; then
    cp repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld \
       repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld.old
fi
cp patch/bluepill.ld \
       repos/apache-mynewt-core/hw/bsp/bluepill/bluepill.ld

if [ ! -e repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml.old ]; then
    cp repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml \
       repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml.old
fi
cp patch/bsp.yml \
       repos/apache-mynewt-core/hw/bsp/bluepill/bsp.yml

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions
