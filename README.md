<!--
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#  KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
-->

# Apache Mynewt Geolocation Application for STM32 Blue Pill with ESP8266

This program runs on an STM32 Blue Pill connected to ESP8266. It sends WiFi Access Point MAC Addresses and Signal Strength scanned by ESP8266 to a CoAP (UDP) server, such as thethings.io:

https://github.com/lupyuen/thethingsio-wifi-geolocation

thethings.io will call the Google Geolocation API to compute the latitude and longitude based on the WiFi data.  For public display, the computed geolocation is pushed to a web application hosted on Google Cloud App Engine:

https://github.com/lupyuen/gcloud-wifi-geolocation

More details will be revealed in my upcoming article.  Check out the earlier article...

https://medium.com/@ly.lee/create-your-iot-gadget-with-apache-mynewt-and-stm32-blue-pill-d689b3ca725

# Sample Log for Install Apache Mynewt on Windows

```bash
> Executing task in folder stm32bluepill-mynewt-sensor: bash -c -l ' scripts/install-windows.sh ' <

Installing Apache Mynewt for Windows...
+ echo /usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files '(x86)/Common' Files/Oracle/Java/javapath_target_637921:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/Windows/System32:/mnt/c/Windows:/mnt/c/Windows/System32/wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Program Files/Git/cmd:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files/PuTTY:/mnt/c/Program Files '(x86)/GNU' Tools Arm Embedded/7 2018-q2-update/bin:/mnt/c/Users/voyo/AppData/Local/Microsoft/WindowsApps:/snap/bin
/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath_target_637921:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/Windows/System32:/mnt/c/Windows:/mnt/c/Windows/System32/wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Program Files/Git/cmd:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files/PuTTY:/mnt/c/Program Files (x86)/GNU Tools Arm Embedded/7 2018-q2-update/bin:/mnt/c/Users/voyo/AppData/Local/Microsoft/WindowsApps:/snap/bin
+ '[' '!' -e /usr/bin/npm ']'
+ sudo apt update -y
[sudo] password for user:
Hit:1 http://ppa.launchpad.net/git-core/ppa/ubuntu bionic InRelease
Get:2 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]                            
Hit:3 https://deb.nodesource.com/node_10.x bionic InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:5 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]          
Reading package lists... Done
Building dependency tree
Reading state information... Done
2 packages can be upgraded. Run 'apt list --upgradable' to see them.
+ sudo apt upgrade -y
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
The following packages will be upgraded:
  libntfs-3g88 ntfs-3g
2 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 530 kB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 ntfs-3g amd64 1:2017.3.23-2ubuntu0.18.04.1 [385 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 libntfs-3g88 amd64 1:2017.3.23-2ubuntu0.18.04.1 [146 kB]
Fetched 530 kB in 4s (146 kB/s)      
(Reading database ... 34096 files and directories currently installed.)
Preparing to unpack .../ntfs-3g_1%3a2017.3.23-2ubuntu0.18.04.1_amd64.deb ...
Unpacking ntfs-3g (1:2017.3.23-2ubuntu0.18.04.1) over (1:2017.3.23-2) ...
Preparing to unpack .../libntfs-3g88_1%3a2017.3.23-2ubuntu0.18.04.1_amd64.deb ...
Unpacking libntfs-3g88 (1:2017.3.23-2ubuntu0.18.04.1) over (1:2017.3.23-2) ...
Processing triggers for initramfs-tools (0.130ubuntu3.7) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Setting up libntfs-3g88 (1:2017.3.23-2ubuntu0.18.04.1) ...
Setting up ntfs-3g (1:2017.3.23-2ubuntu0.18.04.1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Processing triggers for initramfs-tools (0.130ubuntu3.7) ...
+ curl -sL https://deb.nodesource.com/setup_10.x
+ sudo bash -

## Installing the NodeSource Node.js 10.x repo...


## Populating apt-get cache...

+ apt-get update
Hit:1 https://deb.nodesource.com/node_10.x bionic InRelease
Hit:2 http://security.ubuntu.com/ubuntu bionic-security InRelease
Hit:3 http://ppa.launchpad.net/git-core/ppa/ubuntu bionic InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:5 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:6 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Reading package lists... Done

## Confirming "bionic" is supported...

+ curl -sLf -o /dev/null 'https://deb.nodesource.com/node_10.x/dists/bionic/Release'

## Adding the NodeSource signing key to your keyring...

+ curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
OK

## Creating apt sources list file for the NodeSource Node.js 10.x repo...

+ echo 'deb https://deb.nodesource.com/node_10.x bionic main' > /etc/apt/sources.list.d/nodesource.list
+ echo 'deb-src https://deb.nodesource.com/node_10.x bionic main' >> /etc/apt/sources.list.d/nodesource.list

## Running `apt-get update` for you...

+ apt-get update
Hit:1 https://deb.nodesource.com/node_10.x bionic InRelease
Hit:2 http://security.ubuntu.com/ubuntu bionic-security InRelease
Preparing to unpack .../2-python-minimal_2.7.15~rc1-1_amd64.deb ...
Unpacking python-minimal (2.7.15~rc1-1) ...
Selecting previously unselected package libpython2.7-stdlib:amd64.
Preparing to unpack .../3-libpython2.7-stdlib_2.7.15~rc1-1ubuntu0.1_amd64.deb ...
Unpacking libpython2.7-stdlib:amd64 (2.7.15~rc1-1ubuntu0.1) ...
Selecting previously unselected package python2.7.
Preparing to unpack .../4-python2.7_2.7.15~rc1-1ubuntu0.1_amd64.deb ...
Unpacking python2.7 (2.7.15~rc1-1ubuntu0.1) ...
Selecting previously unselected package libpython-stdlib:amd64.
Preparing to unpack .../5-libpython-stdlib_2.7.15~rc1-1_amd64.deb ...
Unpacking libpython-stdlib:amd64 (2.7.15~rc1-1) ...
Setting up libpython2.7-minimal:amd64 (2.7.15~rc1-1ubuntu0.1) ...
Setting up python2.7-minimal (2.7.15~rc1-1ubuntu0.1) ...
Linking and byte-compiling packages for runtime python2.7...
Setting up python-minimal (2.7.15~rc1-1) ...
Selecting previously unselected package python.
(Reading database ... 34841 files and directories currently installed.)
Preparing to unpack .../python_2.7.15~rc1-1_amd64.deb ...
Unpacking python (2.7.15~rc1-1) ...
Selecting previously unselected package nodejs.
Preparing to unpack .../nodejs_10.15.3-1nodesource1_amd64.deb ...
Unpacking nodejs (10.15.3-1nodesource1) ...
Processing triggers for mime-support (3.60ubuntu1) ...
Setting up nodejs (10.15.3-1nodesource1) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Setting up libpython2.7-stdlib:amd64 (2.7.15~rc1-1ubuntu0.1) ...
Setting up python2.7 (2.7.15~rc1-1ubuntu0.1) ...
Setting up libpython-stdlib:amd64 (2.7.15~rc1-1) ...
Setting up python (2.7.15~rc1-1) ...
+ node --version
v10.15.3
+ '[' '!' -d /home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc ']'
+ sudo npm install --global xpm
/usr/bin/xpm -> /usr/lib/node_modules/xpm/bin/xpm.js
+ xpm@0.5.0
added 262 packages from 147 contributors in 125.755s
+ sudo xpm install --global @gnu-mcu-eclipse/arm-none-eabi-gcc
xPack manager - install package(s)

Processing @gnu-mcu-eclipse/arm-none-eabi-gcc@8.2.1-1.4.1...
Installing globally in '/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1'...
Extracting 'gnu-mcu-eclipse-arm-none-eabi-gcc-8.2.1-1.4-20190214-0604-centos64.tgz'...
3243 files extracted.

'xpm install' completed in 114.268 sec.
++ ls -d /home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin
+ gccpath=/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin
+ echo export 'PATH=/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:$PATH'
+ echo export 'PATH=/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:$PATH'
+ export 'PATH=/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath_target_637921:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/Windows/System32:/mnt/c/Windows:/mnt/c/Windows/System32/wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Program Files/Git/cmd:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files/PuTTY:/mnt/c/Program
Files (x86)/GNU Tools Arm Embedded/7 2018-q2-update/bin:/mnt/c/Users/voyo/AppData/Local/Microsoft/WindowsApps:/snap/bin'
+ PATH='/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath_target_637921:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/Windows/System32:/mnt/c/Windows:/mnt/c/Windows/System32/wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Program Files/Git/Get:5 http://archive.ubuntu.com/ubuntu bionic/main amd64 golang-1.10-race-detector-runtime amd64 0.0+svn285455-0ubuntu1 [478 kB]Get:6 http://archive.ubuntu.com/ubuntu bionic/main amd64 pkg-config amd64 0.29.1-0ubuntu2 [45.0 kB]Fetched 42.7 MB in 35s (1226 kB/s)Selecting previously unselected package golang-1.10-src.(Reading database ... 38790 files and directories currently installed.)Preparing to unpack .../0-golang-1.10-src_1.10.4-2ubuntu1~18.04.1_amd64.deb ...Unpacking golang-1.10-src (1.10.4-2ubuntu1~18.04.1) ...Selecting previously unselected package golang-1.10-go.Preparing to unpack .../1-golang-1.10-go_1.10.4-2ubuntu1~18.04.1_amd64.deb ...Unpacking golang-1.10-go (1.10.4-2ubuntu1~18.04.1) ...Selecting previously unselected package golang-1.10-doc.Preparing to unpack .../2-golang-1.10-doc_1.10.4-2ubuntu1~18.04.1_all.deb ...Unpacking golang-1.10-doc (1.10.4-2ubuntu1~18.04.1) ...Selecting previously unselected package golang-1.10.Preparing to unpack .../3-golang-1.10_1.10.4-2ubuntu1~18.04.1_all.deb ...Unpacking golang-1.10 (1.10.4-2ubuntu1~18.04.1) ...Selecting previously unselected package golang-1.10-race-detector-runtime.Preparing to unpack .../4-golang-1.10-race-detector-runtime_0.0+svn285455-0ubuntu1_amd64.deb ...Unpacking golang-1.10-race-detector-runtime (0.0+svn285455-0ubuntu1) ...Selecting previously unselected package pkg-config.Preparing to unpack .../5-pkg-config_0.29.1-0ubuntu2_amd64.deb ...Unpacking pkg-config (0.29.1-0ubuntu2) ...Setting up golang-1.10-race-detector-runtime (0.0+svn285455-0ubuntu1) ...Setting up pkg-config (0.29.1-0ubuntu2) ...Setting up golang-1.10-src (1.10.4-2ubuntu1~18.04.1) ...Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Setting up golang-1.10-go (1.10.4-2ubuntu1~18.04.1) ...Setting up golang-1.10-doc (1.10.4-2ubuntu1~18.04.1) ...Setting up golang-1.10 (1.10.4-2ubuntu1~18.04.1) ...
+ echo export 'PATH=/usr/lib/go-1.10/bin:$PATH'
+ echo export 'PATH=/usr/lib/go-1.10/bin:$PATH'
+ echo export GOROOT=
+ echo export GOROOT=
+ export 'PATH=/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath_target_637921:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/Windows/System32:/mnt/c/Windows:/mnt/c/Windows/System32/wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Program Files/Git/cmd:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files/PuTTY:/mnt/c/Program Files (x86)/GNU Tools Arm Embedded/7 2018-q2-update/bin:/mnt/c/Users/voyo/AppData/Local/Microsoft/WindowsApps:/snap/bin'
+ PATH='/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/lib/go-1.10/bin:/home/user/opt/xPacks/@gnu-mcu-eclipse/arm-none-eabi-gcc/8.2.1-1.4.1/.content/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath_target_637921:/mnt/c/ProgramData/Oracle/Java/javapath:/mnt/c/Windows/System32:/mnt/c/Windows:/mnt/c/Windows/System32/wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Program Files/Git/cmd:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Program Files/PuTTY:/mnt/c/Program Files (x86)/GNU Tools Arm Embedded/7 2018-q2-update/bin:/mnt/c/Users/voyo/AppData/Local/Microsoft/WindowsApps:/snap/bin'
+ export GOROOT=
+ GOROOT=
+ go version
go version go1.10.4 linux/amd64
+ '[' '!' -e /usr/bin/newt ']'
+ sudo add-apt-repository ppa:git-core/ppa -y
Hit:1 https://deb.nodesource.com/node_10.x bionic InRelease
Get:2 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Hit:3 http://ppa.launchpad.net/git-core/ppa/ubuntu bionic InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:5 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:6 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Fetched 252 kB in 19s (13.5 kB/s)
Reading package lists... Done
+ sudo apt update
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 https://deb.nodesource.com/node_10.x bionic InRelease                                                          
Get:3 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Hit:4 http://ppa.launchpad.net/git-core/ppa/ubuntu bionic InRelease
Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]                             
Get:6 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]                   
Fetched 252 kB in 22s (11.7 kB/s)                                                                                              
Reading package lists... Done
Building dependency tree
Reading state information... Done
All packages are up to date.
+ sudo apt install git -y
Reading package lists... Done
Building dependency tree
Reading state information... Done
git is already the newest version (1:2.21.0-0ppa1~ubuntu18.04.1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
+ git --version
git version 2.21.0
+ mynewtpath=/tmp/mynewt
+ '[' '!' -d /tmp/mynewt ']'
+ mkdir /tmp/mynewt
+ pushd /tmp/mynewt
/tmp/mynewt /mnt/c/stm32bluepill-mynewt-sensor
+ git clone https://github.com/apache/mynewt-newt/
Cloning into 'mynewt-newt'...
remote: Enumerating objects: 10, done.
remote: Counting objects: 100% (10/10), done.
remote: Compressing objects: 100% (10/10), done.
remote: Total 10686 (delta 2), reused 4 (delta 0), pack-reused 10676
Receiving objects: 100% (10686/10686), 11.23 MiB | 1.53 MiB/s, done.
Resolving deltas: 100% (6554/6554), done.
Checking out files: 100% (614/614), done.
+ cd mynewt-newt/
+ ./build.sh
Building newt.  This may take a minute...
Successfully built executable: /tmp/mynewt/mynewt-newt/newt/newt
+ sudo mv newt/newt /usr/bin
+ popd
/mnt/c/stm32bluepill-mynewt-sensor
+ which newt
/usr/bin/newt
+ newt version
Apache Newt
   Version: 1.6.0-dev
  Git Hash: c5632c2
Build Date: 2019-03-22_02:23
+ '[' -d repos ']'
+ rm -rf repos
+ '[' -d .git ']'
+ mv .git git-backup
+ newt install -v
[apache-mynewt-core]:
Downloading repository description
Downloading repository mynewt-core (commit: master) from https://github.com/apache/mynewt-core.git
Cloning into '/tmp/newt-repo137534273'...
remote: Enumerating objects: 85, done.
remote: Counting objects: 100% (85/85), done.
remote: Compressing objects: 100% (71/71), done.
remote: Total 102496 (delta 22), reused 36 (delta 12), pack-reused 102411
Receiving objects: 100% (102496/102496), 156.93 MiB | 3.92 MiB/s, done.
Resolving deltas: 100% (62445/62445), done.
Checking out files: 100% (5602/5602), done.
Will checkout origin/master
Fetching repo mynewt-core
Download of "repository.yml" from repo:apache-mynewt-core commit:master successful
[apache-mynewt-nimble]:
Downloading repository description
Downloading repository mynewt-nimble (commit: master) from https://github.com/apache/mynewt-nimble.git
Cloning into '/tmp/newt-repo197825452'...
remote: Enumerating objects: 161, done.
remote: Counting objects: 100% (161/161), done.
remote: Compressing objects: 100% (121/121), done.
remote: Total 33437 (delta 89), reused 69 (delta 38), pack-reused 33276
Receiving objects: 100% (33437/33437), 9.66 MiB | 1.61 MiB/s, done.
Resolving deltas: 100% (19639/19639), done.
Checking out files: 100% (564/564), done.
Will checkout origin/master
Fetching repo mynewt-nimble
Download of "repository.yml" from repo:apache-mynewt-nimble commit:master successful
Making the following changes to the project:
    install apache-mynewt-core (0.0.0)
    install apache-mynewt-nimble (0.0.0)
Will checkout origin/master
Merging changes from origin/master: error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.

Will checkout origin/master
apache-mynewt-core successfully installed version 0.0.0
Will checkout origin/master
Merging changes from origin/master: error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.

Will checkout origin/master
apache-mynewt-nimble successfully installed version 0.0.0
+ '[' -d git-backup ']'
+ mv git-backup .git
+ echo 'Done!'
Done!
```

# Sample Log for Building Bootloader

```bash
> Executing task in folder stm32bluepill-mynewt-sensor: bash -c -l ' newt build -v bluepill_boot && newt size -v bluepill_boot && echo Done! ' <

Building target targets/bluepill_boot
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/apps/boot/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/boot/bootutil/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src
Compiling architecture specific src pkgs in directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/cmsis-core/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/hal/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src
Compiling architecture specific src pkgs in directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/flash_map/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/modlog/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/stub/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/mfg/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysdown/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysinit/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/mem/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/rwlock/src
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/apps/boot/src/boot.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/src/bluepill_boot-sysflash.c -
rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/src/bluepill_boot-sysinit-app.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/src/bluepill_boot-sysdown-app.c - rebuild required; different command
Compiling bin/targets/bluepill_boot/generated/src/bluepill_boot-sysinit-app.c
Compiling bin/targets/bluepill_boot/generated/src/bluepill_boot-sysdown-app.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/boot/bootutil/src/bootutil_misc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/boot/bootutil/src/image_ec.c - rebuild required; different command
Compiling bin/targets/bluepill_boot/generated/src/bluepill_boot-sysflash.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/boot/bootutil/src/image_ec256.c - rebuild
required; different command
Compiling repos/apache-mynewt-core/apps/boot/src/boot.c
Compiling repos/apache-mynewt-core/boot/bootutil/src/bootutil_misc.c
Compiling repos/apache-mynewt-core/boot/bootutil/src/image_ec.c
Compiling repos/apache-mynewt-core/boot/bootutil/src/image_ec256.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/boot/bootutil/src/image_rsa.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/boot/bootutil/src/image_validate.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/boot/bootutil/src/loader.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/aes.c - rebuild required; different command
Compiling repos/apache-mynewt-core/boot/bootutil/src/image_rsa.c
Compiling repos/apache-mynewt-core/boot/bootutil/src/image_validate.c
Compiling repos/apache-mynewt-core/boot/bootutil/src/loader.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/aesni.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/aes.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/arc4.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/aria.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/aesni.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/arc4.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/aria.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/asn1parse.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/asn1write.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/base64.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/bignum.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/asn1parse.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/base64.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/asn1write.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/bignum.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/blowfish.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/camellia.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ccm.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/blowfish.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/camellia.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ccm.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/certs.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/chacha20.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/chachapoly.c - rebuild
required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/cipher.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/certs.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/chacha20.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/chachapoly.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/cipher_wrap.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/cipher.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/cmac.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ctr_drbg.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/cmac.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ctr_drbg.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/cipher_wrap.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/debug.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/des.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/dhm.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ecdh.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/des.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/debug.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/dhm.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ecdh.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ecdsa.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ecjpake.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ecp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ecp_curves.c - rebuild
required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ecdsa.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ecjpake.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ecp_curves.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ecp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/entropy.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/entropy_poll.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/error.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/entropy.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/entropy_poll.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/gcm.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/error.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/havege.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/hkdf.c - rebuild required; different commandCompiling repos/apache-mynewt-core/crypto/mbedtls/src/gcm.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/hkdf.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/havege.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/hmac_drbg.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/md.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/md2.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/md4.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/hmac_drbg.cCompiling repos/apache-mynewt-core/crypto/mbedtls/src/md2.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/md4.cCompiling repos/apache-mynewt-core/crypto/mbedtls/src/md.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/md5.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/md_wrap.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/memory_buffer_alloc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/md5.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/net_sockets.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/memory_buffer_alloc.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/md_wrap.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/nist_kw.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/net_sockets.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/oid.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/nist_kw.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/padlock.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pem.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/oid.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pk.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/padlock.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pem.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pk.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pk_wrap.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pkcs11.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pkcs12.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pkcs5.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pk_wrap.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pkcs11.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pkcs12.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pkparse.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pkcs5.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/pkwrite.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/platform.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pkparse.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/platform_util.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/pkwrite.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/platform.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/platform_util.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/poly1305.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ripemd160.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/rsa.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/rsa_internal.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/poly1305.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ripemd160.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/rsa_internal.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/rsa.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/sha1.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/sha256.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/sha512.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/sha1.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/sha256.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/sha512.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cache.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_ciphersuites.c - rebuild required; different
command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cli.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cookie.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ssl_ciphersuites.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cache.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cli.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cookie.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_srv.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_ticket.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_tls.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ssl_srv.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/threading.c - rebuild required; different commandCompiling repos/apache-mynewt-core/crypto/mbedtls/src/ssl_tls.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/ssl_ticket.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/timing.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/threading.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/version.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/timing.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/version_features.c - rebuild required; different
command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/version.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/x509.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/version_features.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/x509_create.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/x509_crl.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/x509.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/x509_create.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/x509_crt.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/x509_crl.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/x509_csr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/x509write_crt.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/x509_crt.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/x509write_csr.c - rebuild required; different command
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/x509write_crt.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/x509_csr.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/x509write_csr.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/crypto/mbedtls/src/xtea.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/hal_bsp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/system_stm32f1xx.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/bsp/bluepill/src/system_stm32f1xx.c
Compiling repos/apache-mynewt-core/crypto/mbedtls/src/xtea.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/startup_stm32f103xb.s - rebuild required; different command
Assembling repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/startup_stm32f103xb.s
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/cmsis-core/src/cmsis_nvic.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/src/uart.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/drivers/uart/src/uart.c
Compiling repos/apache-mynewt-core/hw/cmsis-core/src/cmsis_nvic.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src/uart_hal.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/bsp/bluepill/src/hal_bsp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/hal/src/hal_common.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/hal/src/hal_common.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/hal/src/hal_flash.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_flash.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src/uart_hal.c
Compiling repos/apache-mynewt-core/hw/hal/src/hal_flash.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_gpio.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_i2c.c - rebuild required; different
command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_flash.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_gpio.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_nvreg.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_i2c.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_nvreg.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_os_tick.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_spi.c - rebuild required; different
command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_os_tick.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system_start.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_spi.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system_start.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_timer.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_uart.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_watchdog.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_timer.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/sbrk.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/sbrk.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v1.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_watchdog.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_uart.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v1.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v2.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_spi.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_timer.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v2.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_hw_id.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_hw_id.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_spi.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_timer.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_can.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cec.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cec.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_can.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc_ex.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_crc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac_ex.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_crc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac_ex.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_eth.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_eth.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_hcd.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2c.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_hcd.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2c.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2s.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_irda.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_iwdg.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2s.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_irda.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_iwdg.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_mmc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nand.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_mmc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nor.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pccard.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nand.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nor.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pccard.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sd.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sd.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_smartcard.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sram.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_smartcard.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sram.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_usart.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_usart.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_wwdg.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_adc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_wwdg.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_adc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_crc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dac.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_crc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dma.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dac.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dma.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_fsmc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_i2c.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_i2c.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rtc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_fsmc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rtc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_sdmmc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_spi.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_spi.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_tim.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_tim.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usart.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usart.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_sdmmc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_flash.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_reset_cause.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_flash.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_timer_freq.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_reset_cause.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/endian.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_callout.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_timer_freq.c
Compiling repos/apache-mynewt-core/kernel/os/src/endian.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_callout.c
Compiling repos/apache-mynewt-core/kernel/os/src/os.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime_1mhz.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime_high.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime_pwr2.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime_1mhz.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime_high.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime_pwr2.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_dev.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_eventq.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_heap.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_mbuf.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_eventq.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_dev.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_heap.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_mbuf.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_mempool.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_msys_init.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_mutex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_sanity.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_mempool.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_msys_init.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_mutex.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_sanity.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_sched.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_sem.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_stacktrace.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_task.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_sched.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_sem.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_stacktrace.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_task.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_time.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_fault.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_arch_arm.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/HAL_CM3.s - rebuild required; different command
Assembling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/HAL_CM3.s
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/SVC_Table.s - rebuild required; different command
Assembling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/SVC_Table.s
Compiling repos/apache-mynewt-core/kernel/os/src/os_time.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/asprintf.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_arch_arm.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/asprintf.c
Compiling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_fault.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/atoi.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/atoi.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/atol.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/atoll.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/bsearch.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/atol.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/bsearch.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/atoll.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/bzero.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/calloc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/fgets.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/bzero.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/inline.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/jrand48.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/fgets.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/calloc.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/inline.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/jrand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/lrand48.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/malloc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memccpy.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memchr.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memccpy.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memchr.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/malloc.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/lrand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memcmp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memcpy.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memcmp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memfile.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memmem.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memcpy.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memmove.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memmem.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memfile.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memmove.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memrchr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memset.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memswap.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/mrand48.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memrchr.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memswap.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memset.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/mrand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/mynewt.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/nrand48.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/qsort.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/realloc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/mynewt.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/nrand48.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/qsort.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/realloc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/sprintf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/srand48.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/sscanf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/start.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/sscanf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/srand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcasecmp.c - rebuild required; different commandCompiling repos/apache-mynewt-core/libc/baselibc/src/sprintf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/start.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcat.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcasecmp.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcat.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strchr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcmp.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strchr.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcmp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcpy.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcpy.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcspn.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strdup.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strlcat.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strlcpy.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcspn.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strlcat.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strlcpy.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strdup.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strlen.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncasecmp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncat.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strlen.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncasecmp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncmp.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncat.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncpy.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncmp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strndup.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strnlen.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncpy.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strndup.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strntoimax.c - rebuild required; different commandCompiling repos/apache-mynewt-core/libc/baselibc/src/strnlen.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strntoumax.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strpbrk.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strrchr.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strntoimax.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strntoumax.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strpbrk.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strrchr.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strsep.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strspn.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strstr.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strsep.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strspn.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoimax.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strstr.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtok.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtok_r.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtol.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoimax.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtok.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtok_r.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoll.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoul.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtol.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoull.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoll.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoul.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoull.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoumax.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/tinyprintf.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vasprintf.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoumax.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vprintf.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/vasprintf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/vprintf.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vsprintf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vsscanf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/flash_map/src/flash_map.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/tinyprintf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/vsscanf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/vsprintf.c
Compiling repos/apache-mynewt-core/sys/flash_map/src/flash_map.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/modlog/src/modlog.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/stub/src/log.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/mfg/src/mfg.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/log/modlog/src/modlog.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysdown/src/sysdown.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/log/stub/src/log.c
Compiling repos/apache-mynewt-core/sys/mfg/src/mfg.c
Compiling repos/apache-mynewt-core/sys/sysdown/src/sysdown.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysinit/src/sysinit.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/mem/src/mem.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/rwlock/src/rwlock.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/sysinit/src/sysinit.c
Compiling repos/apache-mynewt-core/util/mem/src/mem.c
Compiling repos/apache-mynewt-core/util/rwlock/src/rwlock.c
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/apps/boot/apps_boot.a - rebuild required; different command
Archiving apps_boot.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/apps/boot/repos/apache-mynewt-core/apps/boot/src/boot.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/bin/bluepill_boot-sysinit-app.a - rebuild required; different command
Archiving bluepill_boot-sysinit-app.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/bin/bin/targets/bluepill_boot/generated/src/bluepill_boot-sysdown-app.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/bin/bin/targets/bluepill_boot/generated/src/bluepill_boot-sysflash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/bin/bin/targets/bluepill_boot/generated/src/bluepill_boot-sysinit-app.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/boot_bootutil.a - rebuild required; different command
Archiving boot_bootutil.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/repos/apache-mynewt-core/boot/bootutil/src/bootutil_misc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/repos/apache-mynewt-core/boot/bootutil/src/image_ec.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/repos/apache-mynewt-core/boot/bootutil/src/image_ec256.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/repos/apache-mynewt-core/boot/bootutil/src/image_rsa.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/repos/apache-mynewt-core/boot/bootutil/src/image_validate.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/repos/apache-mynewt-core/boot/bootutil/src/loader.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/crypto_mbedtls.a - rebuild required; different command
Archiving crypto_mbedtls.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/aes.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/aesni.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/arc4.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/aria.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/asn1parse.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/asn1write.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/base64.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/bignum.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/blowfish.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/camellia.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ccm.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/certs.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/chacha20.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/chachapoly.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/cipher.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/cipher_wrap.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/cmac.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ctr_drbg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/debug.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/des.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/dhm.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ecdh.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ecdsa.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ecjpake.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ecp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ecp_curves.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/entropy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/entropy_poll.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/error.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/gcm.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/havege.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/hkdf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/hmac_drbg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/md.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/md2.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/md4.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/md5.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/md_wrap.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/memory_buffer_alloc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/net_sockets.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/nist_kw.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/oid.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/padlock.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pem.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pk.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pk_wrap.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pkcs11.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pkcs12.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pkcs5.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pkparse.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/pkwrite.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/platform.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/platform_util.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/poly1305.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ripemd160.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/rsa.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/rsa_internal.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/sha1.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/sha256.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/sha512.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cache.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_ciphersuites.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cli.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_cookie.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_srv.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_ticket.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/ssl_tls.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/threading.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/timing.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/version.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/version_features.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/x509.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/x509_create.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/x509_crl.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/x509_crt.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/x509_csr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/x509write_crt.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/x509write_csr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/repos/apache-mynewt-core/crypto/mbedtls/src/xtea.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/bsp/bluepill/hw_bsp_bluepill.a - rebuild required; different command
Archiving hw_bsp_bluepill.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/bsp/bluepill/repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/startup_stm32f103xb.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/bsp/bluepill/repos/apache-mynewt-core/hw/bsp/bluepill/src/hal_bsp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/bsp/bluepill/repos/apache-mynewt-core/hw/bsp/bluepill/src/system_stm32f1xx.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/cmsis-core/hw_cmsis-core.a - rebuild required; different command
Archiving hw_cmsis-core.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/cmsis-core/repos/apache-mynewt-core/hw/cmsis-core/src/cmsis_nvic.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/drivers/uart/hw_drivers_uart.a - rebuild required; different command
Archiving hw_drivers_uart.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/drivers/uart/repos/apache-mynewt-core/hw/drivers/uart/src/uart.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/drivers/uart/uart_hal/hw_drivers_uart_uart_hal.a - rebuild required; different command
Archiving hw_drivers_uart_uart_hal.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/drivers/uart/uart_hal/repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src/uart_hal.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/hal/hw_hal.a - rebuild required; different command
Archiving hw_hal.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/hal/repos/apache-mynewt-core/hw/hal/src/hal_common.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/hal/repos/apache-mynewt-core/hw/hal/src/hal_flash.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/hw_mcu_stm_stm32_common.a - rebuild required; different command
Archiving hw_mcu_stm_stm32_common.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_flash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_gpio.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_i2c.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_nvreg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_os_tick.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system_start.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_timer.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_uart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_watchdog.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/sbrk.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v1.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v2.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_timer.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_hw_id.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/hw_mcu_stm_stm32f1xx.a - rebuild required; different command
Archiving hw_mcu_stm_stm32f1xx.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_can.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cec.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_crc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_eth.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_hcd.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2c.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2s.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_irda.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_iwdg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_mmc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nand.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nor.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pccard.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sd.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_smartcard.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sram.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_usart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_wwdg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_adc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_crc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dac.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dma.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_fsmc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_i2c.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rtc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_sdmmc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_tim.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_flash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_reset_cause.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_timer_freq.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/kernel_os.a - rebuild required; different command
Archiving kernel_os.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/HAL_CM3.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/SVC_Table.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_arch_arm.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_fault.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/endian.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_callout.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime_1mhz.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime_high.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime_pwr2.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_dev.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_eventq.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_heap.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_mbuf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_mempool.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_msys_init.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_mutex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_sanity.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_sched.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_sem.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_stacktrace.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_task.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_time.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/libc_baselibc.a - rebuild required; different command
Archiving libc_baselibc.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/asprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/atoi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/atol.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/atoll.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/bsearch.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/bzero.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/calloc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/fgets.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/inline.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/jrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/lrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/malloc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memccpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memcmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memcpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memfile.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memmem.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memmove.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memrchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memset.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memswap.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/mrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/mynewt.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/nrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/qsort.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/realloc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/sprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/srand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/sscanf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/start.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcasecmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcat.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcspn.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strdup.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strlcat.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strlcpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strlen.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncasecmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncat.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strndup.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strnlen.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strntoimax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strntoumax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strpbrk.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strrchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strsep.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strspn.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strstr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoimax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtok.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtok_r.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtol.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoll.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoul.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoull.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoumax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/tinyprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vasprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vsprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vsscanf.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/flash_map/sys_flash_map.a - rebuild required; different command
Archiving sys_flash_map.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/flash_map/repos/apache-mynewt-core/sys/flash_map/src/flash_map.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/log/modlog/sys_log_modlog.a - rebuild required; different command
Archiving sys_log_modlog.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/log/modlog/repos/apache-mynewt-core/sys/log/modlog/src/modlog.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/log/stub/sys_log_stub.a - rebuild required; different command
Archiving sys_log_stub.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/log/stub/repos/apache-mynewt-core/sys/log/stub/src/log.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/mfg/sys_mfg.a - rebuild required; different command
Archiving sys_mfg.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/mfg/repos/apache-mynewt-core/sys/mfg/src/mfg.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/sysdown/sys_sysdown.a - rebuild required; different commandArchiving sys_sysdown.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/sysdown/repos/apache-mynewt-core/sys/sysdown/src/sysdown.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/sysinit/sys_sysinit.a - rebuild required; different commandArchiving sys_sysinit.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/sysinit/repos/apache-mynewt-core/sys/sysinit/src/sysinit.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/util/mem/util_mem.a - rebuild required; different command
Archiving util_mem.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/util/mem/repos/apache-mynewt-core/util/mem/src/mem.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/util/rwlock/util_rwlock.a - rebuild required; different commandArchiving util_rwlock.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/util/rwlock/repos/apache-mynewt-core/util/rwlock/src/rwlock.o
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/apps/boot/boot.elf - rebuild required; different command
Linking /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/apps/boot/boot.elf
Linking /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/apps/boot/boot.elf with input files [/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/apps/boot/apps_boot.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/boot/bootutil/boot_bootutil.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/crypto/mbedtls/crypto_mbedtls.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/bsp/bluepill/hw_bsp_bluepill.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/cmsis-core/hw_cmsis-core.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/drivers/uart/hw_drivers_uart.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/drivers/uart/uart_hal/hw_drivers_uart_uart_hal.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/hal/hw_hal.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32_common/hw_mcu_stm_stm32_common.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/hw/mcu/stm/stm32f1xx/hw_mcu_stm_stm32f1xx.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/kernel/os/kernel_os.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/libc/baselibc/libc_baselibc.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/flash_map/sys_flash_map.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/log/modlog/sys_log_modlog.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/log/stub/sys_log_stub.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/mfg/sys_mfg.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/sysdown/sys_sysdown.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/sys/sysinit/sys_sysinit.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/util/mem/util_mem.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/util/rwlock/util_rwlock.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/generated/bin/bluepill_boot-sysinit-app.a]
Mem RAM: 0x20000000-0x20005000
Mem FLASH: 0x8000000-0x8004000
Target successfully built: targets/bluepill_boot
Size of Application Image: app
Mem FLASH: 0x8000000-0x8004000
Mem RAM: 0x20000000-0x20005000
  FLASH     RAM
     37     274 *fill*
     42       0 apps_boot.a
   2275    4004 boot_bootutil.a
   1162       0 crypto_mbedtls.a
    652      64 hw_bsp_bluepill.a
     40       0 hw_cmsis-core.a
    380       0 hw_drivers_uart_uart_hal.a
    418       1 hw_hal.a
   1666      68 hw_mcu_stm_stm32_common.a
   2406      32 hw_mcu_stm_stm32f1xx.a
    498     120 kernel_os.a
    480      32 libc_baselibc.a
    492     128 sys_flash_map.a
    510      29 sys_mfg.a
      6       4 sys_sysinit.a
     72       0 bluepill_boot-sysinit-app.a
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile optimized

objsize
   text    data     bss     dec     hex filename
  11136      52    4704   15892    3e14 /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_boot/app/apps/boot/boot.elf
Done!
```

# Sample Log for Building Sensor Application

```bash
> Executing task in folder stm32bluepill-mynewt-sensor: bash -c -l ' newt build -v bluepill_my_sensor && newt size -v bluepill_my_sensor && echo Done! ' <

Building target targets/bluepill_my_sensor
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/apps/my_sensor_app/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src
Compiling architecture specific src pkgs in directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/cmsis-core/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/sensors/bme280/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/hal/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/sensor/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/sensor/creator/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/util/i2cn/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src
Compiling architecture specific src pkgs in directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/libs/semihosting_console/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/flash_map/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/modlog/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/stub/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/mfg/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysdown/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysinit/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/mem/src
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
Compiling src in base directory: /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/rwlock/src
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysinit-app.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/apps/my_sensor_app/src/main.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysflash.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysdown-app.c - rebuild required; different command
Compiling bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysdown-app.c
Compiling bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysinit-app.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/hal_bsp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/system_stm32f1xx.c - rebuild required; different command
Compiling bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysflash.c
Compiling repos/apache-mynewt-core/hw/bsp/bluepill/src/system_stm32f1xx.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/startup_stm32f103xb.s - rebuild required; different command
Assembling repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/startup_stm32f103xb.s
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/cmsis-core/src/cmsis_nvic.c - rebuild required; different command/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/sensors/bme280/src/bme280.c - rebuild required; different command
Compiling apps/my_sensor_app/src/main.c
Compiling repos/apache-mynewt-core/hw/cmsis-core/src/cmsis_nvic.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/sensors/bme280/src/bme280_shell.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/bsp/bluepill/src/hal_bsp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/src/uart.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/drivers/uart/src/uart.c
Compiling repos/apache-mynewt-core/hw/drivers/sensors/bme280/src/bme280_shell.c
Compiling repos/apache-mynewt-core/hw/drivers/sensors/bme280/src/bme280.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src/uart_hal.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/hal/src/hal_common.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src/uart_hal.c
Compiling repos/apache-mynewt-core/hw/hal/src/hal_common.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/hal/src/hal_flash.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_flash.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_gpio.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/hal/src/hal_flash.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_i2c.c - rebuild required; different
command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_gpio.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_flash.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_nvreg.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_i2c.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_os_tick.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_nvreg.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_spi.c - rebuild required; different
command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_os_tick.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system_start.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_spi.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_timer.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system_start.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_timer.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_uart.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_watchdog.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/sbrk.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/sbrk.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_uart.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v1.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_watchdog.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v2.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v1.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_spi.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_timer.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v2.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_hw_id.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_spi.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_timer.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_hw_id.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_can.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cec.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_can.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cec.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_crc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac_ex.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_crc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_eth.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_eth.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_hcd.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2c.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_hcd.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2c.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2s.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_irda.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_iwdg.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2s.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_irda.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_iwdg.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_mmc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nand.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nor.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pccard.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nor.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_mmc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nand.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pccard.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sd.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sd.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_smartcard.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sram.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_smartcard.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sram.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_usart.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_usart.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_wwdg.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_adc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_crc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_crc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_adc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dac.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dac.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_wwdg.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dma.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dma.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_fsmc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_i2c.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_i2c.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_fsmc.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rtc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_sdmmc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rtc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_spi.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_spi.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_tim.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_tim.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usart.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usart.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_sdmmc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_flash.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.c
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_reset_cause.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_flash.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_timer_freq.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_reset_cause.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/sensor/src/sensor.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/sensor/src/sensor_oic.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/sensor/src/sensor_shell.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_timer_freq.c
Compiling repos/apache-mynewt-core/hw/sensor/src/sensor_oic.c
Compiling repos/apache-mynewt-core/hw/sensor/src/sensor_shell.c
Compiling repos/apache-mynewt-core/hw/sensor/src/sensor.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/sensor/creator/src/sensor_creator.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/hw/util/i2cn/src/i2cn.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/endian.c - rebuild required; different command
Compiling repos/apache-mynewt-core/hw/util/i2cn/src/i2cn.c
Compiling repos/apache-mynewt-core/hw/sensor/creator/src/sensor_creator.c
Compiling repos/apache-mynewt-core/kernel/os/src/endian.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_callout.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime_1mhz.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_callout.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime_1mhz.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime_high.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_cputime_pwr2.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_dev.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_eventq.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime_high.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_cputime_pwr2.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_dev.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_eventq.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_heap.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_mbuf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_mempool.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_msys_init.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_heap.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_mbuf.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_msys_init.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_mempool.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_mutex.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_mutex.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_sanity.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_sched.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_sem.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_sanity.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_sched.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_sem.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_stacktrace.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_stacktrace.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_task.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/os_time.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_arch_arm.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/os_task.c
Compiling repos/apache-mynewt-core/kernel/os/src/os_time.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_fault.c - rebuild required; different command
Compiling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_arch_arm.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/HAL_CM3.s - rebuild required; different command
Assembling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/HAL_CM3.s
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/SVC_Table.s - rebuild required; different command
Assembling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/SVC_Table.s
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/asprintf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/atoi.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/atol.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/asprintf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/atoi.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/atol.c
Compiling repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_fault.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/atoll.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/bsearch.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/bzero.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/atoll.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/bzero.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/bsearch.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/calloc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/fgets.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/inline.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/fgets.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/calloc.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/inline.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/jrand48.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/lrand48.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/jrand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/malloc.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/lrand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memccpy.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memccpy.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/malloc.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memchr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memcmp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memcpy.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memchr.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memcmp.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memcpy.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memfile.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memmem.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memmove.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memmem.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memmove.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memfile.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memrchr.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memset.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/memswap.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memrchr.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/mrand48.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/memswap.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/memset.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/mynewt.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/nrand48.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/mrand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/qsort.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/nrand48.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/qsort.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/realloc.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/sprintf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/srand48.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/realloc.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/mynewt.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/srand48.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/sscanf.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/sscanf.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/start.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/sprintf.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcasecmp.c - rebuild required; different commandCompiling repos/apache-mynewt-core/libc/baselibc/src/strcasecmp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcat.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strchr.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcat.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strchr.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/start.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcmp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcpy.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strcspn.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcmp.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcpy.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strcspn.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strdup.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strlcat.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strlcpy.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strlcpy.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strlcat.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strdup.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strlen.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncasecmp.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncat.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncmp.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncasecmp.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strlen.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncat.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncmp.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strncpy.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strndup.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strnlen.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strncpy.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strntoimax.c - rebuild required; different commandCompiling repos/apache-mynewt-core/libc/baselibc/src/strnlen.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strndup.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strntoumax.c - rebuild required; different commandCompiling repos/apache-mynewt-core/libc/baselibc/src/strntoimax.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strpbrk.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strrchr.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strpbrk.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strntoumax.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strrchr.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strsep.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strspn.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strstr.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strsep.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strspn.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strstr.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoimax.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtok.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtok_r.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtol.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtok.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtok_r.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoimax.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoll.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoul.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtol.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoull.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoll.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoul.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/strtoumax.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/strtoull.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/tinyprintf.c - rebuild required; different commandCompiling repos/apache-mynewt-core/libc/baselibc/src/strtoumax.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vasprintf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vprintf.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/vasprintf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/vprintf.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vsprintf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/libc/baselibc/src/vsscanf.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/libs/semihosting_console/src/console.c - rebuild required; different command
Compiling repos/apache-mynewt-core/libc/baselibc/src/tinyprintf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/vsscanf.c
Compiling repos/apache-mynewt-core/libc/baselibc/src/vsprintf.c
/mnt/c/stm32bluepill-mynewt-sensor/libs/semihosting_console/src/console_fmt.c - rebuild required; different command
Compiling libs/semihosting_console/src/console.c
/mnt/c/stm32bluepill-mynewt-sensor/libs/semihosting_console/src/semihosting_console.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/libs/semihosting_console/src/ticks.c - rebuild required; different command
Compiling libs/semihosting_console/src/console_fmt.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/flash_map/src/flash_map.c - rebuild required; different command
Compiling libs/semihosting_console/src/ticks.c
Compiling libs/semihosting_console/src/semihosting_console.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/modlog/src/modlog.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/flash_map/src/flash_map.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/log/stub/src/log.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/mfg/src/mfg.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/log/modlog/src/modlog.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysdown/src/sysdown.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/log/stub/src/log.c
Compiling repos/apache-mynewt-core/sys/mfg/src/mfg.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/sys/sysinit/src/sysinit.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/sysdown/src/sysdown.c
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/mem/src/mem.c - rebuild required; different command
/mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/util/rwlock/src/rwlock.c - rebuild required; different command
Compiling repos/apache-mynewt-core/sys/sysinit/src/sysinit.c
Compiling repos/apache-mynewt-core/util/mem/src/mem.c
Compiling repos/apache-mynewt-core/util/rwlock/src/rwlock.c
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/apps_my_sensor_app.a - rebuild required; different command
Archiving apps_my_sensor_app.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/apps/my_sensor_app/src/main.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/bin/bluepill_my_sensor-sysinit-app.a - rebuild required; different command
Archiving bluepill_my_sensor-sysinit-app.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/bin/bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysdown-app.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/bin/bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysflash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/bin/bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysinit-app.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/bsp/bluepill/hw_bsp_bluepill.a - rebuild required; different command
Archiving hw_bsp_bluepill.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/bsp/bluepill/repos/apache-mynewt-core/hw/bsp/bluepill/src/arch/cortex_m3/startup_stm32f103xb.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/bsp/bluepill/repos/apache-mynewt-core/hw/bsp/bluepill/src/hal_bsp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/bsp/bluepill/repos/apache-mynewt-core/hw/bsp/bluepill/src/system_stm32f1xx.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/cmsis-core/hw_cmsis-core.a - rebuild required; different command
Archiving hw_cmsis-core.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/cmsis-core/repos/apache-mynewt-core/hw/cmsis-core/src/cmsis_nvic.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/sensors/bme280/hw_drivers_sensors_bme280.a - rebuild required; different command
Archiving hw_drivers_sensors_bme280.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/sensors/bme280/repos/apache-mynewt-core/hw/drivers/sensors/bme280/src/bme280.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/sensors/bme280/repos/apache-mynewt-core/hw/drivers/sensors/bme280/src/bme280_shell.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/uart/hw_drivers_uart.a - rebuild required; different command
Archiving hw_drivers_uart.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/uart/repos/apache-mynewt-core/hw/drivers/uart/src/uart.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/uart/uart_hal/hw_drivers_uart_uart_hal.a - rebuild required; different command
Archiving hw_drivers_uart_uart_hal.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/uart/uart_hal/repos/apache-mynewt-core/hw/drivers/uart/uart_hal/src/uart_hal.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/hal/hw_hal.a - rebuild required; different command
Archiving hw_hal.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/hal/repos/apache-mynewt-core/hw/hal/src/hal_common.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/hal/repos/apache-mynewt-core/hw/hal/src/hal_flash.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/hw_mcu_stm_stm32_common.a - rebuild required; different command
Archiving hw_mcu_stm_stm32_common.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_flash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_gpio.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_i2c.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_nvreg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_os_tick.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_system_start.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_timer.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_uart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_watchdog.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/sbrk.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v1.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_i2c_v2.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_driver_mod_timer.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_hw_id.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/hw_mcu_stm_stm32f1xx.a - rebuild required; different command
Archiving hw_mcu_stm_stm32f1xx.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_adc_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_can.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cec.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_crc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dac_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_eth.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_hcd.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2c.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2s.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_irda.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_iwdg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_mmc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nand.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_nor.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pccard.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rtc_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sd.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_smartcard.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_spi_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sram.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_usart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_wwdg.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_adc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_crc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dac.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_dma.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_fsmc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_i2c.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rtc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_sdmmc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_spi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_tim.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usart.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/ext/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_flash.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_reset_cause.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/repos/apache-mynewt-core/hw/mcu/stm/stm32f1xx/src/hal_timer_freq.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/hw_sensor.a - rebuild required; different command
Archiving hw_sensor.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/repos/apache-mynewt-core/hw/sensor/src/sensor.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/repos/apache-mynewt-core/hw/sensor/src/sensor_oic.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/repos/apache-mynewt-core/hw/sensor/src/sensor_shell.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/creator/hw_sensor_creator.a - rebuild required;
different command
Archiving hw_sensor_creator.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/creator/repos/apache-mynewt-core/hw/sensor/creator/src/sensor_creator.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/util/i2cn/hw_util_i2cn.a - rebuild required; different
command
Archiving hw_util_i2cn.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/util/i2cn/repos/apache-mynewt-core/hw/util/i2cn/src/i2cn.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/kernel_os.a - rebuild required; different command
Archiving kernel_os.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/HAL_CM3.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/m3/SVC_Table.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_arch_arm.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/arch/cortex_m3/os_fault.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/endian.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_callout.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime_1mhz.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime_high.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_cputime_pwr2.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_dev.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_eventq.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_heap.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_mbuf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_mempool.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_msys_init.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_mutex.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_sanity.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_sched.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_sem.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_stacktrace.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_task.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/repos/apache-mynewt-core/kernel/os/src/os_time.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/libc_baselibc.a - rebuild required; different command
Archiving libc_baselibc.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/asprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/atoi.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/atol.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/atoll.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/bsearch.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/bzero.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/calloc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/fgets.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/inline.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/jrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/lrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/malloc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memccpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memcmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memcpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memfile.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memmem.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memmove.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memrchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memset.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/memswap.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/mrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/mynewt.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/nrand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/qsort.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/realloc.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/sprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/srand48.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/sscanf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/start.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcasecmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcat.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strcspn.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strdup.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strlcat.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strlcpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strlen.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncasecmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncat.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncmp.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strncpy.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strndup.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strnlen.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strntoimax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strntoumax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strpbrk.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strrchr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strsep.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strspn.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strstr.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoimax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtok.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtok_r.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtol.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoll.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoul.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoull.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/strtoumax.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/tinyprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vasprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vsprintf.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/repos/apache-mynewt-core/libc/baselibc/src/vsscanf.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libs/semihosting_console/libs_semihosting_console.a - rebuild required; different command
Archiving libs_semihosting_console.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libs/semihosting_console/libs/semihosting_console/src/console.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libs/semihosting_console/libs/semihosting_console/src/console_fmt.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libs/semihosting_console/libs/semihosting_console/src/semihosting_console.o /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libs/semihosting_console/libs/semihosting_console/src/ticks.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/flash_map/sys_flash_map.a - rebuild required; different command
Archiving sys_flash_map.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/flash_map/repos/apache-mynewt-core/sys/flash_map/src/flash_map.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/log/modlog/sys_log_modlog.a - rebuild required; different command
Archiving sys_log_modlog.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/log/modlog/repos/apache-mynewt-core/sys/log/modlog/src/modlog.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/log/stub/sys_log_stub.a - rebuild required; different
command
Archiving sys_log_stub.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/log/stub/repos/apache-mynewt-core/sys/log/stub/src/log.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/mfg/sys_mfg.a - rebuild required; different command
Archiving sys_mfg.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/mfg/repos/apache-mynewt-core/sys/mfg/src/mfg.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/sysdown/sys_sysdown.a - rebuild required; different command
Archiving sys_sysdown.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/sysdown/repos/apache-mynewt-core/sys/sysdown/src/sysdown.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/sysinit/sys_sysinit.a - rebuild required; different command
Archiving sys_sysinit.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/sysinit/repos/apache-mynewt-core/sys/sysinit/src/sysinit.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/util/mem/util_mem.a - rebuild required; different command
Archiving util_mem.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/util/mem/repos/apache-mynewt-core/util/mem/src/mem.o
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/util/rwlock/util_rwlock.a - rebuild required; different command
Archiving util_rwlock.a with object files /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/util/rwlock/repos/apache-mynewt-core/util/rwlock/src/rwlock.o
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug
/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf - rebuild required; different command
Linking /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
Linking /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf with input files [/mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/apps_my_sensor_app.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/bsp/bluepill/hw_bsp_bluepill.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/cmsis-core/hw_cmsis-core.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/sensors/bme280/hw_drivers_sensors_bme280.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/uart/hw_drivers_uart.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/drivers/uart/uart_hal/hw_drivers_uart_uart_hal.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/hal/hw_hal.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32_common/hw_mcu_stm_stm32_common.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/mcu/stm/stm32f1xx/hw_mcu_stm_stm32f1xx.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/creator/hw_sensor_creator.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/sensor/hw_sensor.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/hw/util/i2cn/hw_util_i2cn.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/kernel/os/kernel_os.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libc/baselibc/libc_baselibc.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/libs/semihosting_console/libs_semihosting_console.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/flash_map/sys_flash_map.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/log/modlog/sys_log_modlog.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/log/stub/sys_log_stub.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/mfg/sys_mfg.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/sysdown/sys_sysdown.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/sys/sysinit/sys_sysinit.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/util/mem/util_mem.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/util/rwlock/util_rwlock.a /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/generated/bin/bluepill_my_sensor-sysinit-app.a]
Mem FLASH: 0x8008000-0x8013800
Mem RAM: 0x20000000-0x20005000
Target successfully built: targets/bluepill_my_sensor
Size of Application Image: app
Mem FLASH: 0x8008000-0x8013800
Mem RAM: 0x20000000-0x20005000
  FLASH     RAM
    124     297 *fill*
   3308       0 libgcc.a
    223      24 apps_my_sensor_app.a
    724      84 hw_bsp_bluepill.a
     52       0 hw_cmsis-core.a
   3440       8 hw_drivers_sensors_bme280.a
    430       0 hw_drivers_uart_uart_hal.a
    154       0 hw_hal.a
   5082     352 hw_mcu_stm_stm32_common.a
   4208      32 hw_mcu_stm_stm32f1xx.a
    225     316 hw_sensor_creator.a
   1526     260 hw_sensor.a
   5192    8217 kernel_os.a
   1574      12 libc_baselibc.a
    483      36 libs_semihosting_console.a
    330     128 sys_flash_map.a
      2       0 sys_log_modlog.a
    682      29 sys_mfg.a
     30       5 sys_sysinit.a
     48       0 util_mem.a
    104       0 bluepill_my_sensor-sysinit-app.a
Loading compiler /mnt/c/stm32bluepill-mynewt-sensor/repos/apache-mynewt-core/compiler/arm-none-eabi-m3, buildProfile debug

objsize
   text    data     bss     dec     hex filename
  27900     132    9700   37732    9364 /mnt/c/stm32bluepill-mynewt-sensor/bin/targets/bluepill_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
Done!
```

# How this sensor sample was created under macOS

Based on 

https://mynewt.apache.org/latest/tutorials/sensors/sensor_thingy_lis2dh12_onb.html

https://mynewt.apache.org/latest/tutorials/sensors/sensor_nrf52_bno055.html

```
cd /mnt/c/mynewt
newt new stm32bluepill-mynewt-sensor
cd stm32bluepill-mynewt-sensor
nano project.yml
Change
    vers: 1-latest
to
    vers: 0-dev

newt install
newt pkg new -t app apps/my_sensor_app
newt pkg new -t lib libs/semihosting_console

nano apps/my_sensor_app/pkg.yml
Add 
    - "@apache-mynewt-core/hw/sensor"
    - "@apache-mynewt-core/hw/sensor/creator"
Change
    - "@apache-mynewt-core/sys/console/full"
    - "@apache-mynewt-core/sys/log/full"
    - "@apache-mynewt-core/sys/stats/full"
to
    - "@apache-mynewt-core/sys/console/stub"
    - "@apache-mynewt-core/sys/log/stub"
    - "@apache-mynewt-core/sys/stats/stub"

newt target create bluepill_boot
newt target set bluepill_boot bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_boot app=@apache-mynewt-core/apps/boot
newt target set bluepill_boot build_profile=optimized

newt target create bluepill_my_sensor
newt target set bluepill_my_sensor bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_my_sensor app=apps/my_sensor_app
newt target set bluepill_my_sensor build_profile=debug

newt target set bluepill_my_sensor syscfg=SPI_0_MASTER=1:BME280_OFB=1:SENSOR_OIC=0:CONSOLE_RTT=0:CONSOLE_UART=0:LOG_CLI=0:LOG_LEVEL=255:STATS_CLI=0:SHELL_CMD_HELP=0:SHELL_OS_MODULE=0:SHELL_TASK=0

TODO: Edit repos/apache-mynewt-core/hw/sensor/creator/src/sensor_creator.c
Change to:
#if MYNEWT_VAL(SPI_0_MASTER) && MYNEWT_VAL(BME280_OFB)
static struct sensor_itf spi_0_itf_bme = {
    .si_type = SENSOR_ITF_SPI,
    .si_num = 0,
    //// TODO: .si_cs_pin = 3,
    .si_cs_pin = 4  ////  TODO
};
#endif

```

# Apache Blinky

## Overview

Apache Blinky is a skeleton for new Apache Mynewt projects.  The user downloads
this skeleton by issuing the "newt new" command (using Apache Newt).  Apache
blinky also contains an example app and target for use with Apache Mynewt to
help you get started.

## Building

Apache Blinky contains an example Apache Mynewt application called blinky.
When executed on suitably equipped hardware, this application repeatedly blinks
an LED.  The below procedure describes how to build this application for the
Apache Mynewt simulator.

1. Download and install Apache Newt.

You will need to download the Apache Newt tool, as documented in the [Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).

2. Download the Apache Mynewt Core package (executed from the blinky directory).

```no-highlight
    $ newt install
```

3. Build the blinky app for the sim platform using the "my_blinky_sim" target
(executed from the blinky directory).

```no-highlight
    $ newt build my_blinky_sim
```

The Apache Newt tool should indicate the location of the generated blinky
executable.  Since the simulator does not have an LED to blink, this version of
blinky is not terribly exciting - a printed message indicating the current LED
state.  To learn how to build blinky for actual hardware, please see the
[Getting Started Guide](https://mynewt.apache.org/latest/get_started/index.html).
