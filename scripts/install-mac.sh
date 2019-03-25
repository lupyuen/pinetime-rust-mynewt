#!/usr/bin/env bash
#  Install Apache Mynewt for macOS.  Based on https://mynewt.apache.org/latest/newt/install/newt_mac.html

echo "Installing Apache Mynewt for macOS.."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
#  echo $PATH

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

#  Install OpenOCD into the ./openocd folder.
if [ ! -e openocd/bin/openocd ]; then
    brew install wget unzip -f
    rm gnu-mcu-eclipse*tgz*
    wget https://github.com/gnu-mcu-eclipse/openocd/releases/download/v0.10.0-11-20190118/gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
    tar xf gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
    rm gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
    mv gnu-mcu-eclipse openocd
    mv openocd/openocd/*/* openocd
    rm -rf openocd/openocd
fi

#  Install npm.
if [ ! -e "${brewdir}"/bin/npm ]; then
    brew install node -f
    node --version
fi

#  Install Arm Toolchain into $HOME/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/*/. From https://gnu-mcu-eclipse.github.io/toolchain/arm/install/
if [ ! -d "${HOME}"/opt/gnu-mcu-eclipse/arm-none-eabi-gcc ]; then
    if [ ! -d "${HOME}"/opt ]; then
        mkdir -p "${HOME}"/opt
    fi
    pushd "${HOME}"/opt

    #  Remove partial downloads.
    if [ -d gnu-mcu-eclipse ]; then
        rm -rf gnu-mcu-eclipse
    fi
    rm gnu-mcu-eclipse*tgz*
    
    wget https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/download/v8.2.1-1.4/gnu-mcu-eclipse-arm-none-eabi-gcc-8.2.1-1.4-20190214-0604-macos.tgz
    tar xf gnu-mcu-eclipse-arm-none-eabi-gcc-8.2.1-1.4-20190214-0604-macos.tgz
    rm gnu-mcu-eclipse-arm-none-eabi-gcc-8.2.1-1.4-20190214-0604-macos.tgz
    chmod -R -w "${HOME}"/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/*
    gccpath=`ls -d "${HOME}"/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/*/bin`
    echo export PATH=\"$gccpath:\$PATH\" >> ~/.bashrc
    echo export PATH=\"$gccpath:\$PATH\" >> ~/.profile
    export PATH="$gccpath:$PATH"
    popd
fi
arm-none-eabi-gcc --version  #  Should show "gcc version 8.2.1 20181213" or later.

#  Install go 1.10 to prevent newt build error: "go 1.10 or later is required (detected version: 1.2.X)"
golangpath="${brewdir}"/bin
if [ ! -e $golangpath/go ]; then
    brew install go -f
    echo export PATH=\"$golangpath:\$PATH\" >> ~/.bashrc
    echo export PATH=\"$golangpath:\$PATH\" >> ~/.profile
    echo export GOROOT= >> ~/.bashrc
    echo export GOROOT= >> ~/.profile
    export PATH="$golangpath:$PATH"
    export GOROOT=
fi
go version  #  Should show "go1.10.1" or later.

#  Install newt tool.
if [ ! -e "${brewdir}"/bin/newt ]; then
    # Add the Mynewt brew package repository.
    brew tap JuulLabs-OSS/mynewt
    # Must install the main branch, which has Blue Pill support.
    brew install mynewt-newt --HEAD -f
fi
which newt    #  Should show "/usr/local/bin/newt"
newt version  #  Should show "Version: 1.6.0-dev" or later.

exit 0
####

#  Download Mynewt OS into the current project folder, under "repos" subfolder. We must rename and recover .git else newt will get confused.
if [ -d repos ]; then
    rm -rf repos
fi
if [ -d .git ]; then
    mv .git git-backup
fi
newt install -v
if [ -d git-backup ]; then
    mv git-backup .git
fi

set +x  #  Stop echoing all commands.
echo "**** Done! Please restart Visual Studio Code to activate the extensions"
