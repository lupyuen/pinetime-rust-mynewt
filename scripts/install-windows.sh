#!/usr/bin/env bash
#  Install Apache Mynewt for Windows

echo "Installing Apache Mynewt for Windows..."
set -e  #  Exit when any command fails.
set -x  #  Echo all commands.
echo $PATH

#  Install npm.
if [ ! -e /usr/bin/npm ]; then
    sudo apt update  -y  #  Update all Ubuntu packages.
    sudo apt upgrade -y  #  Upgrade all Ubuntu packages.
    curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
    sudo apt install nodejs -y
    node --version
fi

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

#  Build newt tool in /tmp/mynewt.
if [ ! -e /usr/bin/newt ]; then
    #  Upgrade git to prevent "newt install" error: "Unknown subcommand: get-url".
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt update
    sudo apt install git -y
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

echo "Done!"
