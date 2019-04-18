#!/usr/bin/env bash
#  Install Apache Mynewt for Windows.  Based on https://mynewt.apache.org/latest/newt/install/newt_windows.html.  
#  Except we use Ubuntu on Windows instead of MinGW because it provides a cleaner, Linux build environment.
#  gdb and openocd will run under Windows not Ubuntu because the ST Link USB driver only works under Windows.

echo "Installing Apache Mynewt for Windows..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
#  echo $PATH

echo "***** Installing openocd..."

#  Install OpenOCD into the ./openocd folder.
if [ ! -e openocd/bin/openocd.exe ]; then
    sudo apt install wget unzip -y
    wget https://github.com/gnu-mcu-eclipse/openocd/releases/download/v0.10.0-11-20190118/gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip
    unzip -q gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip -d openocd
    rm gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip
    mv "openocd/GNU MCU Eclipse/OpenOCD/"*/* openocd
    rm -rf "openocd/GNU MCU Eclipse"
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

#  Install Arm Toolchain into $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/*/.content/. From https://gnu-mcu-eclipse.github.io/toolchain/arm/install/
if [ ! -d $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc ]; then
    sudo npm install --global xpm
    sudo xpm install --global @gnu-mcu-eclipse/arm-none-eabi-gcc
    gccpath=`ls -d $HOME/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/*/.content/bin`
    echo export PATH=$gccpath:\$PATH >> ~/.bashrc
    echo export PATH=$gccpath:\$PATH >> ~/.profile
    export PATH=$gccpath:$PATH
fi
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
    export GOROOT=
fi
go version  #  Should show "go1.10.1" or later.

echo "***** Installing newt..."

#  Install latest official release of newt.  If dev version from Tutorial 1 is installed, it will be overwritten.
#  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html

wget -qO - https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master/mynewt.gpg.key | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/mynewt.list <<EOF
deb https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master latest main
EOF
sudo apt update -y
sudo apt install newt -y
which newt    #  Should show "/usr/bin/newt"
newt version  #  Should show "Version: 1.6.0" or later.  Should NOT show "...-dev".

#  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update -y
sudo apt install git -y
git --version  #  Should show "git version 2.21.0" or later.

#  Change owner from root back to user for the installed packages.
sudo chown -R $USER:$USER "$HOME/.caches" "$HOME/.config" "$HOME/opt"

echo "***** Installing mynewt..."

#  Before installing Mynewt OS, need to rename .git else the installation will fail.
# if [ -d .git ]; then
#    mv .git git-backup
# fi

#  Remove the existing Mynewt OS in "repos"
if [ -d repos ]; then
    rm -rf repos
fi

#  Download Mynewt OS into the current project folder, under "repos" subfolder.
set +e  #  TODO: Remove this when newt install is fixed
newt install -v -f
set -e  #  TODO: Remove this when newt install is fixed

#  TODO: newt install fails due to dirty files. Need to check out manually.

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

#  Restore .git.
# if [ -d git-backup ]; then
#    mv git-backup .git
# fi

#  If apache-mynewt-core is missing, then the installation failed.
if [ ! -d repos/apache-mynewt-core ]; then
    echo "***** newt install failed"
    exit 1
fi
if [ ! -d repos/apache-mynewt-nimble ]; then
    echo "***** newt install failed"
    exit 1
fi

#  Should show: "Downloading repository mynewt-nimble (commit: master) from https://github.com/apache/mynewt-nimble.git"
#  "apache-mynewt-nimble successfully installed version 0.0.0"
#  If you see "Error: Unknown subcommand: get-url"
#  then upgrade git as shown above.

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions


#  Remove development version of newt installed during Tutorial 1.
# if [ -e /usr/bin/newt ]; then
#     newtver=`/usr/bin/newt version`
#     echo $newtver
#     case "$newtver" in
#         #  Found development version of newt. Remove it.
#         *1.6.0-dev* ) sudo rm /usr/bin/newt ;;
#         #  Development version of newt not found.  Skip.
#         * ) echo "newt is not dev version, skipping" ;;
#     esac
# fi
