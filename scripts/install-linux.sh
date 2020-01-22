#!/usr/bin/env bash
#  Install Rust and Mynewt Build Tools for Ubuntu x64.  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html.  

echo "Installing Rust and Mynewt Build Tools for Linux..."; set -x
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

set +x; echo; echo "----- Setting versions..."; set -x
source scripts/install-version.sh

set +x; echo; echo "-----  Installing curl, git..."; set -x

#  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update -y
sudo apt install curl git -y
git --version  #  Should show "git version 2.21.0" or later.

#  Install the ST-Link V2 driver: https://docs.platformio.org/en/latest/faq.html#platformio-udev-rules
set +x; echo; echo "-----  Installing ST-Link V2 driver..."; set -x
if [ ! -e /etc/udev/rules.d/99-platformio-udev.rules ]; then
    curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
fi

#  Install OpenOCD into the ./openocd folder.  Use "apt install" because Ubuntu build is not available for OpenOCD for gnu-mcu-eclipse.
set +x; echo; echo "-----  Installing openocd..."; set -x
if [ ! -e openocd/bin/openocd ]; then
    sudo apt install openocd -y
    if [ ! -d openocd/bin ]; then
        mkdir -p openocd/bin
    fi
    ln -s /usr/bin/openocd openocd/bin/openocd
fi

#  Install npm.
set +x; echo; echo "-----  Installing npm..."; set -x
if [ ! -e /usr/bin/npm ]; then
    sudo apt update  -y  #  Update all Ubuntu packages.
    sudo apt upgrade -y  #  Upgrade all Ubuntu packages.
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    sudo apt install nodejs -y
    node --version
fi

#  Install Arm Toolchain into $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/*/.content/. From https://gnu-mcu-eclipse.github.io/toolchain/arm/install/
set +x; echo; echo "-----  Installing Arm Toolchain..."; set -x
if [ ! -d $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc ]; then
    sudo npm install --global xpm
    sudo xpm install --global @gnu-mcu-eclipse/arm-none-eabi-gcc
    gccpath=`ls -d $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/*/.content/bin`
    echo export PATH=$gccpath:\$PATH >> ~/.bashrc
    echo export PATH=$gccpath:\$PATH >> ~/.profile
    export PATH=$gccpath:$PATH
fi
arm-none-eabi-gcc --version  #  Should show "gcc version 8.2.1 20181213" or later.

#  Install go 1.10 to prevent newt build error: "go 1.10 or later is required (detected version: 1.2.X)"
set +x; echo; echo "-----  Installing go..."; set -x
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

#  Change owner from root back to user for the installed packages.
set +x; echo; echo "-----  Fixing ownership..."; set -x
if [ -d "$HOME/.caches" ]; then
    sudo chown -R $USER:$USER "$HOME/.caches"
fi
if [ -d "$HOME/.config" ]; then
    sudo chown -R $USER:$USER "$HOME/.config"
fi
if [ -d "$HOME/opt" ]; then
    sudo chown -R $USER:$USER "$HOME/opt"
fi

#  Install latest official release of newt.  If dev version from Tutorial 1 is installed, it will be overwritten.
#  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html
set +x; echo; echo "-----  Installing newt..."; set -x
wget -qO - https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master/mynewt.gpg.key | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/mynewt.list <<EOF
deb https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master latest main
EOF
sudo apt update -y
sudo apt install newt -y
which newt    #  Should show "/usr/bin/newt"
newt version  #  Should show "Version: 1.7.0" or later.  Should NOT show "...-dev".

#  set +x; echo; echo "-----  Installing mynewt..."; set -x
#  Remove the existing Mynewt OS in "repos"
#  if [ -d repos ]; then
#      rm -rf repos
#  fi

#  Download Mynewt OS into the current project folder, under "repos" subfolder.
#  newt install -v -f

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done!
