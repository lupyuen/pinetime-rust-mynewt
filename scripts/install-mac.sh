#!/usr/bin/env bash
#  Install Rust and Mynewt Build Tools for macOS.  Based on https://mynewt.apache.org/latest/newt/install/newt_linux.html.  

echo "Installing Rust and Mynewt Build Tools for macOS.."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.

set +x; echo; echo "----- Setting versions..."; set -x; set -x
source scripts/install-version.sh

set +x; echo; echo "-----  Installing brew..."; set -x

#  For Testing: Install brew locally.
#  mkdir "${HOME}"/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "${HOME}"/homebrew
#  echo export PATH=\"${HOME}/homebrew/bin:\$PATH\" >> ~/.bashrc
#  echo export PATH=\"${HOME}/homebrew/bin:\$PATH\" >> ~/.profile

#  Where brew files are installed.
brewdir=/usr/local

#  Install brew.  From https://brew.sh
if [ ! -e /usr/local/bin/brew ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
fi

#  If brew exists locally, use the local installation.
if [ -e "${HOME}"/homebrew/bin/brew ]; then
    brewdir="${HOME}"/homebrew
fi

set +x; echo; echo "-----  Installing wget and unzip..."; set -x

#  Install wget and unzip.
if [ ! -e "${brewdir}"/bin/wget ]; then
    brew install wget unzip -f
fi

# set +x; echo; echo "-----  Installing openocd..."; set -x

#  Install Arm version of OpenOCD into the ./openocd folder.
# if [ ! -e openocd/bin/openocd ]; then
#     if [ -e gnu-mcu-eclipse*tgz* ]; then
#         rm gnu-mcu-eclipse*tgz*
#     fi
#     wget https://github.com/gnu-mcu-eclipse/openocd/releases/download/v0.10.0-11-20190118/gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
#     tar xf gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
#     rm gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
#     mv gnu-mcu-eclipse openocd
#     mv openocd/openocd/*/* openocd
#     rm -rf openocd/openocd
# fi

# set +x; echo; echo "-----  Installing npm..."; set -x

#  Install npm.
# if [ ! -e "${brewdir}"/bin/npm ]; then
#     brew install node -f
#     node --version
# fi

# set +x; echo; echo "-----  Installing Arm Toolchain..."; set -x

#  Install Arm Toolchain into $HOME/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/*/. From https://gnu-mcu-eclipse.github.io/toolchain/arm/install/
# if [ ! -d "${HOME}"/opt/gnu-mcu-eclipse/arm-none-eabi-gcc ]; then
#     if [ ! -d "${HOME}"/opt ]; then
#         mkdir -p "${HOME}"/opt
#     fi
#     pushd "${HOME}"/opt

#     #  Remove partial downloads.
#     if [ -d gnu-mcu-eclipse ]; then
#         rm -rf gnu-mcu-eclipse
#     fi
#     rm gnu-mcu-eclipse*tgz*
    
#     wget https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/download/v8.2.1-1.4/gnu-mcu-eclipse-arm-none-eabi-gcc-8.2.1-1.4-20190214-0604-macos.tgz
#     tar xf gnu-mcu-eclipse-arm-none-eabi-gcc-8.2.1-1.4-20190214-0604-macos.tgz
#     rm gnu-mcu-eclipse-arm-none-eabi-gcc-8.2.1-1.4-20190214-0604-macos.tgz
#     chmod -R -w "${HOME}"/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/*
#     gccpath=`ls -d "${HOME}"/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/*/bin`
#     echo export PATH=\"$gccpath:\$PATH\" >> ~/.bashrc
#     echo export PATH=\"$gccpath:\$PATH\" >> ~/.profile
#     export PATH="$gccpath:$PATH"
#     popd
# fi
# arm-none-eabi-gcc --version  #  Should show "gcc version 8.2.1 20181213" or later.

set +x; echo; echo "-----  Installing go..."; set -x

#  Install go 1.12 to prevent newt build error: "go 1.12 or later is required (detected version: 1.2.X)"
golangpath="${brewdir}"/bin
if [ ! -e $golangpath/go ]; then
    brew install go -f
    echo export PATH=\"$golangpath:\$PATH\" >> ~/.bashrc
    echo export PATH=\"$golangpath:\$PATH\" >> ~/.profile
    echo export GOROOT= >> ~/.bashrc
    echo export GOROOT= >> ~/.profile
    export PATH="$golangpath:$PATH"
fi
#  Prevent mismatch library errors when building newt.
export GOROOT=
go version  #  Should show "go1.12.1" or later.

#  set +x; echo; echo "-----  Fixing ownership..."; set -x
#  Change owner from root back to user for the installed packages.
# if [ -d "$HOME/.caches" ]; then
#     sudo chown -R $USER:$USER "$HOME/.caches"
# fi
# if [ -d "$HOME/.config" ]; then
#     sudo chown -R $USER:$USER "$HOME/.config"
# fi
# if [ -d "$HOME/opt" ]; then
#     sudo chown -R $USER:$USER "$HOME/opt"
# fi

set +x; echo; echo "-----  Installing newt..."; set -x

#  Uninstall the brew version of newt.
# if [ -e "${brewdir}"/bin/newt ]; then
#     brew uninstall mynewt-newt -f
# fi

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

#  Install latest official release of newt from brew.
#  Based on https://mynewt.apache.org/latest/newt/install/newt_mac.html
#  NOTUSED because brew currently has version 1.5.0 only 
# if [ ! -e "${brewdir}"/bin/newt ]; then
#     # Add the Mynewt brew package repository.
#     brew tap JuulLabs-OSS/mynewt
#     brew update
#     # Install latest release which has Blue Pill support.
#     brew install mynewt-newt -f
# fi

which newt    #  Should show "/usr/local/bin/newt"
newt version  #  Should show "Version: 1.7.0" or later.  Should NOT show "...-dev".

# #  Install the existing Mynewt OS in "repos"
# set +x; echo; echo "-----  Installing mynewt..."; set -x
# if [ -d repos ]; then
#     rm -rf repos
# fi

# #  Download Mynewt OS into the current project folder, under "repos" subfolder.
# newt install -v -f
# echo ✅ ◾ ️Done! See README.md for Mynewt type conversion build fixes

set +x  #  Stop echoing all commands.
echo ✅ ◾ ️Done!