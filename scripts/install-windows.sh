#!/usr/bin/env bash
#  Install Apache Mynewt for Windows.  Based on https://mynewt.apache.org/latest/newt/install/newt_windows.html.  
#  Except we use Ubuntu on Windows instead of MinGW because it provides a cleaner, Linux build environment.
#  gdb and openocd will run under Windows not Ubuntu because the ST Link USB driver only works under Windows.

echo "Installing Apache Mynewt for Windows..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
#  echo $PATH

#  Versions to install
mynewt_version=mynewt_1_7_0_tag
nimble_version=nimble_1_2_0_tag
mcuboot_version=v1.3.1

#  Previously:
#  mynewt_version=mynewt_1_6_0_tag
#  nimble_version=nimble_1_1_0_tag
#  mcuboot_version=v1.3.0

echo "***** Installing git..."

#  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt update -y
sudo apt install git -y
git --version  #  Should show "git version 2.21.0" or later.

echo "***** Installing openocd for Arm..."

#  Install Arm version of OpenOCD into the ./openocd folder.
if [ ! -e openocd/bin/openocd.exe ]; then
    sudo apt install wget unzip -y
    wget https://github.com/gnu-mcu-eclipse/openocd/releases/download/v0.10.0-11-20190118/gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip
    unzip -q gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip -d openocd
    rm gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-win64.zip
    mv "openocd/GNU MCU Eclipse/OpenOCD/"*/* openocd
    rm -rf "openocd/GNU MCU Eclipse"
fi

echo "***** Installing openocd for RISC-V..."

#  Install RISC-V version of OpenOCD into the ./riscv-openocd folder, cross-compiled for Windows.
#  Based on http://dangerousprototypes.com/docs/Compile_OpenOCD_for_Windows
#  https://github.com/artynet/openocd-mingw-w64-build-scripts/blob/master/build-openocd-win-cross-linux-new.sh
#  http://developer.intra2net.com/git/?p=libftdi;a=blob;f=README.mingw;h=771204cd495ea725a1b8e74a975b11ae5690268a;hb=HEAD
if [ ! -d riscv-openocd ]; then
    #  Install mingw toolchain for cross-compiling Windows programs on macOS http://mingw-w64.org/doku.php
    sudo port install mingw-w64 mingw-w64-tools
    #  Uninstall libusb and libusb-compat-0.1 if already installed.
    set +e
    brew uninstall libusb-compat
    brew uninstall libftdi
    brew uninstall hidapi
    brew uninstall libimobiledevice
    brew uninstall usbmuxd
    brew uninstall libusb
    set -e

    #  Download libusb binaries for Windows.
    brew install p7zip
    wget https://github.com/libusb/libusb/releases/download/v1.0.22/libusb-1.0.22.7z
    7z x libusb-1.0.22.7z -olibusb-1.0.22

    #  Download and cross-compile libftdi for Windows.
    wget https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.4.tar.bz2
    tar -xf libftdi1-1.4.tar.bz2
    cd libftdi1-1.4    
    #  For Linux add: -DPKG_CONFIG_EXECUTABLE=`which i686-w64-mingw32-pkg-config`
    cmake -DCMAKE_TOOLCHAIN_FILE=../scripts/Toolchain-cross-mingw32-linux.cmake    
    make ftdi1-static
    cd ..

    #  Download and cross-compile libhidapi for Windows.
	git clone git://github.com/signal11/hidapi.git
    cd hidapi/windows
    make -f Makefile.mingw \
        CC=i686-w64-mingw32-gcc \
        hid.o
    ar -r libhid.a hid.o
    i686-w64-mingw32-ranlib libhid.a
    cd ../..

    #  Download RISC-V version of OpenOCD.
    git clone https://github.com/riscv-mcu/riscv-openocd
    cd riscv-openocd
    #  Download embedded source files.
    ./bootstrap
    #  Specify locations of libraries built for Windows.
    #  TODO: Fix LIBUSB error during build
    export PKG_CONFIG_PATH=../scripts/pkg-config
    export LIBUSB1_LIBS=
    export LIBFTDI_LIBS=
    export HIDAPI_LIBS=
    #export LIBUSB1_LIBS=../libusb-1.0.22/MinGW64/static/libusb-1.0.a
    #export LIBFTDI_LIBS=../libftdi1-1.4/src/libftdi1.a
    #export HIDAPI_LIBS=../hidapi/windows/libhid.a
    #  Cross-compile OpenOCD for Windows.
    ./configure --enable-cmsis-dap --enable-ftdi --build=i686-pc-linux-gnu --host=i686-w64-mingw32
    make
    cd ..
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

#  Install RISC-V Toolchain into xPacks/riscv-none-embed-gcc/*/. From https://xpack.github.io/riscv-none-embed-gcc/, https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/tag/v8.2.0-3.1/
if [ ! -d xPacks/riscv-none-embed-gcc ]; then
    #  Remove partial downloads.
    if [ -d xPacks ]; then
        rm -rf xPacks
    fi
    rm xpack-riscv-none-embed-gcc*zip*
    
    wget https://github.com/xpack-dev-tools/riscv-none-embed-gcc-xpack/releases/download/v8.2.0-3.1/xpack-riscv-none-embed-gcc-8.2.0-3.1-win32-x64.zip
    unzip xpack-riscv-none-embed-gcc-8.2.0-3.1-win32-x64.zip
    rm xpack-riscv-none-embed-gcc-8.2.0-3.1-win32-x64.zip
    # chmod -R -w xPacks/riscv-none-embed-gcc/*
    # gccpath=`ls -d xPacks/riscv-none-embed-gcc/*/bin`
    # echo export PATH=\"$gccpath:\$PATH\" >> ~/.bashrc
    # echo export PATH=\"$gccpath:\$PATH\" >> ~/.profile
    # export PATH="$gccpath:$PATH"
fi
xPacks/riscv*gcc/*/bin/riscv-none-embed-gcc --version  #  Should show "riscv-none-embed-gcc 8.2.0" or later.

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

wget -qO - https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master/mynewt.gpg.key | sudo apt-key add -
sudo tee /etc/apt/sources.list.d/mynewt.list <<EOF
deb https://raw.githubusercontent.com/JuulLabs-OSS/debian-mynewt/master latest main
EOF
sudo apt update -y
sudo apt install newt -y
which newt    #  Should show "/usr/bin/newt"
newt version  #  Should show "Version: 1.7.0" or later.  Should NOT show "...-dev".

# echo "***** Installing mynewt..."

# #  Remove the existing Mynewt OS in "repos"
# if [ -d repos ]; then
#     rm -rf repos
# fi

# #  Download Mynewt OS into the current project folder, under "repos" subfolder.
# set +e              #  TODO: Remove this when newt install is fixed
# newt install -v -f  #  TODO: "git checkout" fails due to uncommitted files
# set -e              #  TODO: Remove this when newt install is fixed

# #  If you see "Error: Unknown subcommand: get-url"
# #  then upgrade git as shown above.

# echo "***** Reparing mynewt..."

# #  TODO: newt install fails due to uncommitted files. Need to check out manually.

# #  Check out core
# if [ -d repos/apache-mynewt-core ]; then
#     pushd repos/apache-mynewt-core
#     git checkout $mynewt_version -f
#     popd
# fi
# #  Check out nimble
# if [ -d repos/apache-mynewt-nimble ]; then
#     pushd repos/apache-mynewt-nimble
#     git checkout $nimble_version -f
#     popd
# fi
# #  Check out mcuboot
# if [ -d repos/mcuboot ]; then
#     pushd repos/mcuboot
#     git checkout $mcuboot_version -f
#     popd
# fi

# #  If apache-mynewt-core is missing, then the installation failed.
# if [ ! -d repos/apache-mynewt-core ]; then
#     echo "***** newt install failed"
#     exit 1
# fi

# #  If apache-mynewt-nimble is missing, then the installation failed.
# if [ ! -d repos/apache-mynewt-nimble ]; then
#     echo "***** newt install failed"
#     exit 1
# fi
# echo ✅ ◾ ️Done! See README.md for Mynewt type conversion build fixes. Please restart Visual Studio Code to activate the extensions

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done! Please restart Visual Studio Code to activate the extensions