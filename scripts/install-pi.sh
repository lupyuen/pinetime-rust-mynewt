#!/usr/bin/env bash
#  Install Apache Mynewt for Raspberry Pi.  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html.  

echo "Installing Apache Mynewt for Raspberry Pi..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
#  echo $PATH

#  Versions to install
mynewt_version=mynewt_1_7_0_tag
nimble_version=nimble_1_2_0_tag
mcuboot_version=v1.3.1

# Don't install gcc and gdb here, will clash with PineBook
# echo "***** Installing gcc..."
# sudo apt install -y gcc-arm-none-eabi

# echo "***** Installing gdb..."
# if [ ! -e /usr/bin/arm-none-eabi-gdb ]; then
#     sudo apt install -y gdb-multiarch
#     sudo ln -s /usr/bin/gdb-multiarch /usr/bin/arm-none-eabi-gdb
# fi

#  echo "***** Installing OpenOCD..."
#  cp ~/openocd/src/openocd openocd/bin/openocd
#  sudo chown root openocd/bin/openocd
#  chmod +s openocd/bin/openocd 

echo "***** Installing go..."

#  Install go 1.13 to prevent newt build error: "go 1.12 or later is required (detected version: 1.2.X)"
golangpath=/usr/lib/go-1.13.6/bin
if [ ! -e $golangpath/go ]; then
    wget https://dl.google.com/go/go1.13.6.linux-armv6l.tar.gz
    tar xf go1.13.6.linux-armv6l.tar.gz 
    sudo mv go /usr/lib/go-1.13.6

    echo export PATH=$golangpath:\$PATH >> ~/.bashrc
    echo export PATH=$golangpath:\$PATH >> ~/.profile
    echo export GOROOT= >> ~/.bashrc
    echo export GOROOT= >> ~/.profile
    export PATH=$golangpath:$PATH
fi
#  Prevent mismatch library errors when building newt.
export GOROOT=
go version  #  Should show "go1.12.1" or later.

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

#  Build newt in /tmp/mynewt. Copy to /usr/local/bin.
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
    #  Should show: "Building newt.  This may take a minute..."
    #  "Successfully built executable: /tmp/mynewt/mynewt-newt/newt/newt"
    #  If you see "Error: go 1.10 or later is required (detected version: 1.2.X)"
    #  then install go 1.10 as shown above.
    sudo mv newt/newt /usr/local/bin
    popd
fi

#  echo "***** Installing mynewt..."

#  Remove the existing Mynewt OS in "repos"
#  if [ -d repos ]; then
#      rm -rf repos
#  fi

#  Download Mynewt OS into the current project folder, under "repos" subfolder.
#  newt install -v -f

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done! See README.md for Mynewt type conversion build fixes. Please restart Visual Studio Code to activate the extensions
