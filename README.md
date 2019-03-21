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
