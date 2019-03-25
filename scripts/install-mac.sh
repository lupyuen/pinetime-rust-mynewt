#!/usr/bin/env bash
#  Install Apache Mynewt for macOS.  Based on https://mynewt.apache.org/latest/newt/install/newt_mac.html

echo "Installing Apache Mynewt for macOS.."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
#  echo $PATH

#  Install brew.  From https://brew.sh
if [ ! -e /usr/local/bin/brew ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#  Install OpenOCD into the ./openocd folder.
if [ ! -e openocd/bin/openocd ]; then
    brew install wget unzip -f
    wget https://github.com/gnu-mcu-eclipse/openocd/releases/download/v0.10.0-11-20190118/gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
    tar xf gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
    rm gnu-mcu-eclipse-openocd-0.10.0-11-20190118-1134-macos.tgz
    mv gnu-mcu-eclipse openocd
    mv openocd/openocd/*/* openocd
    rm -rf openocd/openocd
fi

#  Install npm.
if [ ! -e /usr/local/bin/npm ]; then
    brew install node -f
    node --version
fi

#  Install Arm Toolchain into $HOME/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/*/. From https://gnu-mcu-eclipse.github.io/toolchain/arm/install/
if [ ! -d "${HOME}"/opt/gnu-mcu-eclipse/arm-none-eabi-gcc ]; then
    if [ ! -d "${HOME}"/opt ]; then
        mkdir -p "${HOME}"/opt
    fi
    pushd "${HOME}"/opt
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

exit 0
####

#  Install go 1.10 to prevent newt build error: "go 1.10 or later is required (detected version: 1.2.X)"
golangpath=/usr/local/bin
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
if [ ! -e /usr/local/bin/newt ]; then
    #  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
    #  sudo add-apt-repository ppa:git-core/ppa -y
    #  sudo apt update
    #  sudo apt install git -y
    git --version  #  Should show "git version 2.21.0" or later.

    mynewtpath=/tmp/mynewt
    if [ ! -d $mynewtpath ]; then
        mkdir $mynewtpath
    fi
    pushd $mynewtpath

    git clone https://github.com/apache/mynewt-newt/
    cd mynewt-newt/
    ./build.sh
    #  Should show: "Building newt.  This may take a minute..."
    #  "Successfully built executable: /tmp/mynewt/mynewt-newt/newt/newt"
    #  If you see "Error: go 1.10 or later is required (detected version: 1.2.X)"
    #  then install go 1.10 as shown above.
    sudo mv newt/newt /usr/bin
    popd
fi
which newt    #  Should show "/usr/bin/newt"
newt version  #  Should show "Version: 1.6.0-dev" or later.

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

#  Should show: "Downloading repository mynewt-nimble (commit: master) from https://github.com/apache/mynewt-nimble.git"
#  "apache-mynewt-nimble successfully installed version 0.0.0"
#  If you see "Error: Unknown subcommand: get-url"
#  then upgrade git as shown above.

set +x  #  Stop echoing all commands.
echo "**** Done! Please restart Visual Studio Code to activate the extensions"
