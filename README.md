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

# Bluetooth Mesh Sensor Application for nRF52 with Apache Mynewt and Embedded Rust

This `mesh` branch contains the source code for a Bluetooth Mesh Sensor Application for nRF52 with Apache Mynewt and Embedded Rust that has been tested on the [EBYTE E73-TBB Development Board](http://www.ebyte.com/product-view-news.aspx?id=644). Refer to the tutorial...

[_???_](???)

# TODO

Changes:
- Reduced buttons and LEDs to 2
- Added Rust support
- Removed srqt

Usage:
- Button1, Button2, and LED1 to application key 1. It then configures Button1 and Button2
  to publish to group 0xC000 and LED1 to subscribe to that group.
- Button3, Button4, and LED3 to application key 1. It then configures Button3 and Button4
  to publish to group 0xC000 and LED3 to subscribe to that group.

For Raspberry Pi:

Developer Study Guide: Deploying
BlueZ v5.50 on Raspberry Pi3
Part 1 - Deployment
https://3pl46c46ctx02p7rzdsvsg21-wpengine.netdna-ssl.com/wp-content/uploads/2019/03/T1804_How-to-set-up-BlueZ_LFC_FINAL-1.pdf?utm_campaign=developer&utm_source=internal&utm_medium=blog&utm_content=Deploying-BlueZ-v5.50-on-Raspberry-Pi3-Update

"2. Rebuilding the kernel for BlueZ v5.50"
To enable AEAD-AES_CCM encryption.
Instructions here are not updated for Raspberry Pi 4.
Refer to this doc instead:

Kernel Building
https://www.raspberrypi.org/documentation/linux/kernel/building.md

```bash
cd ~
sudo apt-get install -y git bc bison flex libssl-dev
uname -a
<<
Linux raspberrypi 4.19.75-v7l+ #1270 SMP Tue Sep 24 18:51:41 BST 2019 armv7l GNU/Linux
>>
git clone --depth=1 --branch rpi-4.19.y https://github.com/raspberrypi/linux
```

Configuring the kernel
https://www.raspberrypi.org/documentation/linux/kernel/configuring.md

Raspberry Pi 1, Pi Zero, Pi Zero W, and Compute Module default build configuration

```bash
cd linux
KERNEL=kernel
make bcmrpi_defconfig
```

Raspberry Pi 2, Pi 3, Pi 3+, and Compute Module 3 default build configuration
```bash
cd linux
KERNEL=kernel7
make bcm2709_defconfig
```

Raspberry Pi 4
```
cd linux
KERNEL=kernel7l
make bcm2711_defconfig
```

```bash
make menuconfig
```

Include the three modules below: (Press S to select)
Select Cryptographic API ---> CMAC support
Select Cryptographic API ---> User-space interface for hash algorithms
Select Cryptographic API ---> User-space interface for symmetric key cipher algorithms 

```bash
make -j4 zImage modules dtbs
sudo make modules_install
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
sudo cp arch/arm/boot/zImage /boot/$KERNEL.img
sudo reboot
```

How to Deploy BlueZ v5.50 on Raspberry Pi 3
and Use It
Part 2 — Provisioning 
https://3pl46c46ctx02p7rzdsvsg21-wpengine.netdna-ssl.com/wp-content/uploads/2019/03/Tutorial-How-to-set-up-BlueZ_Part2-3.pdf?utm_campaign=developer&utm_source=internal&utm_medium=blog&utm_content=Deploying-BlueZ-v5.50-on-Raspberry-Pi3-Update

"2.0 Provisioner Configuration"
Don't need to update prov_db.json 

```bash
cd ~
cp bluez-5.50/mesh/local_node.json bluez-5.50/mesh/prov_db.json .
meshctl
(Press Enter)
```

<<
Failed to parse provisioning database file prov_db.json
>>
means need to install AEAD-AES_CCM encryption

```
<<
GNU MCU Eclipse 64-bit Open On-Chip Debugger 0.10.0+dev-00462-gdd1d90111 (2019-01-15-13:49)
Licensed under GNU GPL v2
For bug reports, read
	http://openocd.org/doc/doxygen/bugs.html
WARNING: interface/stlink-v2.cfg is deprecated, please switch to interface/stlink.cfg
Info : auto-selecting first available session transport "hla_swd". To override use 'transport select <transport>'.
Info : The selected transport took over low-level target control. The results might differ compared to plain JTAG/SWD
adapter speed: 1000 kHz
debug_level: 2
Info : Listening on port 6666 for tcl connections
Info : Listening on port 4444 for telnet connections
Info : clock speed 1000 kHz
Info : STLINK V2J17S4 (API v2) VID:PID 0483:3748
Info : Target voltage: 3.253616
Info : nrf52.cpu: hardware has 6 breakpoints, 4 watchpoints
Info : Listening on port 50000 for gdb connections
Info : accepting 'gdb' connection on tcp/50000
Warn : Unknown device (HWID 0x00000147)
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000
Enable ARM Semihosting to show debug output
semihosting is enabled
Warn : using fast async flash loader. This is currently supported
Warn : only with ST-Link and CMSIS-DAP. If you have issues, add
Warn : "set WORKAREASIZE 0" before sourcing nrf51.cfg/nrf52.cfg to disable it
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x2000001e msp: 0x20010000, semihosting
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000, semihosting
target halted due to debug-request, current mode: Thread 
xPSR: 0x01000000 pc: 0x000000d8 msp: 0x20010000, semihosting
Info : halted: PC: 0x00008f08
TMP create temp_stub_0
NET hwid e2 61 11 35 36 72 66 8f 74 44 b9 13 
NET standalone node 
Rust TMP poll
Initializing...
Bluetooth initialized
Mesh initialized
power-> 100, color-> 0
Reset Counter -> 0
Reset Counter set to Zero
STB read temp sensor
Rust send_sensor_data: t=1757
NET random device id nrf52,00000000000000000000000000
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
OOB String: CPXXGX
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
Local node provisioned, primary address 0x0100
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
STB read temp sensor
Rust send_sensor_data: t=1757
>>

discover-unprovisioned on
<<
[meshctl]# discover-unprovisioned on
SetDiscoveryFilter success
Discovery started
Adapter property changed
[CHG] Controller DC:A6:32:2C:70:F1 Discovering: yes
		Mesh Provisioning Service (00001827-0000-1000-8000-00805f9b34fb)
			Device UUID: dddd0000000000000000000000000000
			OOB: 0000
[NEW] Device 0F:89:36:43:8A:CA nimble-mesh-node
>>

provision <discovered UUID>
<<
[meshctl]# provision dddd0000000000000000000000000000
Trying to connect Device 0F:89:36:43:8A:CA nimble-mesh-node
Adapter property changed
[CHG] Controller DC:A6:32:2C:70:F1 Discovering: no
Connection successful
Service added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0006
Service added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010
Char added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0011:
Char added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0013:
Services resolved yes
Found matching char: path /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0011, uuid 00002adb-0000-1000-8000-00805f9b34fb
Found matching char: path /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0013, uuid 00002adc-0000-1000-8000-00805f9b34fb
Start notification on /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0013
Characteristic property changed /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0013
AcquireNotify success: fd 7 MTU 256
Notify for Mesh Provisioning Out Data started
Open-Node: 0x1e9c360
Open-Prov: 0x1ea17d8
Open-Prov: proxy 0x1e9c450
Initiated provisioning
Characteristic property changed /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0011
AcquireWrite success: fd 8 MTU 256
GATT-TX:	 03 00 10
GATT-RX:	 03 01 02 00 01 00 00 06 00 18 00 00 00
Got provisioning data (12 bytes)
	 01 02 00 01 00 00 06 00 18 00 00 00
GATT-TX:	 03 02 00 00 02 04 06
GATT-TX:	 03 03 f2 78 1c 7f e3 ed 3a 55 3c 94 56 a0 48 3e
GATT-TX:	 4c 9e 43 86 c3 49 95 d8 2e 0e 21 9d 0b 67 9e ee
GATT-TX:	 5b ec 8e d9 89 c5 fc 46 7a a2 ca 1f d4 1e c9 36
GATT-TX:	 1a ae 0b fa 89 9f 44 d2 26 9e c7 cb 10 71 12 39
GATT-TX:	 17 d8
GATT-RX:	 03 03 2c c6 f0 22 fa 22 a7 b9 f6 47 19 2e f4 07
GATT-RX:	 01 6b 81 27 d4 4f 05 77 02 23 1c b3 e7 29 7d 03
GATT-RX:	 0b 02 ba 20 21 09 fc d7 ca 57 77 ff c8 eb f7 ed
GATT-RX:	 db c7 d3 0e 24 12 a4 dd 2a 78 47 76 b1 ee dd d6
GATT-RX:	 cf 10
Got provisioning data (65 bytes)
	 03 2c c6 f0 22 fa 22 a7 b9 f6 47 19 2e f4 07 01
	 6b 81 27 d4 4f 05 77 02 23 1c b3 e7 29 7d 03 0b
	 02 ba 20 21 09 fc d7 ca 57 77 ff c8 eb f7 ed db
	 c7 d3 0e 24 12 a4 dd 2a 78 47 76 b1 ee dd d6 cf
	 10
[nimble]# aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
Request ASCII key (max characters 6)
[mesh] Enter key (ascii string): CPXXGX
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
GATT-TX:	 03 05 2a eb 3e 07 70 78 cf db d8 1b c5 54 f6 d3
GATT-TX:	 5e 33
GATT-RX:	 03 05 fd 36 ec 24 5f 7f d9 fa ca 4e 0a c2 0f 5d
GATT-RX:	 fc 68
Got provisioning data (17 bytes)
	 05 fd 36 ec 24 5f 7f d9 fa ca 4e 0a c2 0f 5d fc
	 68
GATT-TX:	 03 06 3f 01 4b 9a 93 a8 4e 8e 62 5c c4 e0 da bd
GATT-TX:	 19 96
GATT-RX:	 03 06 ef eb dd 30 ba 63 e2 6e ad 42 28 ce 71 2b
GATT-RX:	 ab 3d
Got provisioning data (17 bytes)
	 06 ef eb dd 30 ba 63 e2 6e ad 42 28 ce 71 2b ab
	 3d
[nimble]# aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
Confirmation Validated
[nimble]# aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
S-Key	 51 7b 40 8d 18 a3 d8 55 42 be 1a 2a bb a9 a4 de
S-Nonce	 cf 87 bc ac 84 8a c2 8c 77 63 f2 67 86
DevKey	 d6 04 24 3d 60 1d a8 2a 4b 68 d6 03 8b 5c 4b 2b
Data	 18 ee d9 c2 a5 6a dd 85 04 9f fc 3c 59 ad 0e 12
Data	 00 00 00 00 00 00 05 01 00
DataEncrypted + mic	 62 43 8c e4 f9 98 68 44 26 fe ac 65 8e ea 47 f3
DataEncrypted + mic	 27 23 e0 52 8b 9a 5e 68 ec f5 47 40 83 a2 22 ce
DataEncrypted + mic	 12
GATT-TX:	 03 07 62 43 8c e4 f9 98 68 44 26 fe ac 65 8e ea
GATT-TX:	 47 f3 27 23 e0 52 8b 9a 5e 68 ec f5 47 40 83 a2
GATT-TX:	 22 ce 12
GATT-RX:	 03 08
Got provisioning data (1 bytes)
	 08
Provision success. Assigned Primary Unicast 0100
Attempting to disconnect from 0F:89:36:43:8A:CA
Characteristic property changed /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0010/char0013
Write closed
Service added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a
Char added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000b:
Char added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000d:
Services resolved no
[DEL] Device 0F:89:36:43:8A:CA nimble
SetDiscoveryFilter success
Discovery started
Adapter property changed
[CHG] Controller DC:A6:32:2C:70:F1 Discovering: yes
[meshctl]# crypto_128 1
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
crypto_128 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2

		Mesh Proxy Service (00001828-0000-1000-8000-00805f9b34fb)
		Identity for node 0100
Trying to connect to mesh
Adapter property changed
[CHG] Controller DC:A6:32:2C:70:F1 Discovering: no
Connection successful
Service added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service0006
Service added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a
Char added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000b:
Char added /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000d:
Services resolved yes
Found matching char: path /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000b, uuid 00002add-0000-1000-8000-00805f9b34fb
Found matching char: path /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000d, uuid 00002ade-0000-1000-8000-00805f9b34fb
Start notification on /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000d
Characteristic property changed /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000d
AcquireNotify success: fd 7 MTU 256
Notify for Mesh Proxy Out Data started
Trying to open mesh session
GATT-RX:	 01 01 00 d4 76 79 43 3f db 10 4a 00 00 00 05 f4
GATT-RX:	 0a 41 fa b0 af 32 0b
[nimble-Node-0100]# aes_cmac_one 1
aes_cmac_setup 1
aes_cmac_setup 2
aes_cmac_setup 3
aes_cmac_setup 4
aes_cmac_one 2
iv_upd_state = IV_UPD_NORMAL
Mesh session is open
Characteristic property changed /org/bluez/hci0/dev_0F_89_36_43_8A_CA/service000a/char000b
AcquireWrite success: fd 8 MTU 256
GATT-TX:	 02 f4 9e 64 99 fe 13 cd c8 9b 0e 1c e5 61 82 cc
GATT-TX:	 ab f5 83 70
GATT-TX:	 00 f4 03 fe 5a 4e 85 85 cd 7a 74 88 35 b6 ac 06
GATT-TX:	 d0 87 2b 8d c1 23
GATT-RX:	 02 f4 e7 02 fe d4 84 81 a3 32 e7 6e 4b 1b 74 4a
GATT-RX:	 13 95 f5 61 7f eb
Proxy Whitelist filter length: 0
GATT-RX:	 00 f4 78 22 37 79 27 72 1f a6 70 d9 cb 58 ea 60
GATT-RX:	 f6 62 de 7a 16 dc 72 78 e5 d7 39 4d cf 44
GATT-RX:	 00 f4 d7 87 d8 45 f8 c3 34 0d 45 4c c3 d9 ed 39
GATT-RX:	 33 80 f4 64 93 f2 67 64 c0 8f ab df 69 9a
GATT-RX:	 00 f4 39 d8 09 d1 de 8c a3 32 4c c2 c2 49 69 38
GATT-RX:	 91 c0 d7 18 3a 67 8e 37 29 de cf ae 35 96
GATT-RX:	 00 f4 06 60 c9 18 3d eb 0a 10 da 6a cb 2b 53 ea
GATT-RX:	 95 bf 0f 8b 1e 1e 71 01 b7 de 63 3e df 58
GATT-RX:	 00 f4 9b 5a ee 73 bb 36 eb a8 f8 e0 02 7e c0 51
GATT-RX:	 80 f5 37 13 48 37 b8 82 6e 01 f9 41 41 26
GATT-RX:	 00 f4 c5 9c 90 50 93 f6 19 74 37 65 32 42 05 7f
GATT-RX:	 a7 c0 f3 d4 56 a2 25 e7 1c e5 b3 9c 98 45
	Composition data for node 0100 {
  "cid":"05c3",
  "pid":"0000",
  "vid":"0000",
  "crpl":"0080",
  "features":{
    "relay":true,
    "proxy":true,
    "friend":false,
    "lpn":false
  },
  "elements":[
    {
      "elementIndex":0,
      "location":"0000",
      "models":[
        "0000",
        "0002",
        "1000",
        "1001",
        "1002",
        "1003",
        "1004",
        "1005",
        "1006",
        "1007",
        "1008",
        "1300",
        "1301",
        "1302",
        "1303",
        "1304",
        "1305",
        "05c34321"
      ]
    },
    {
      "elementIndex":1,
      "location":"0000",
      "models":[
        "1002",
        "1003",
        "1306"
      ]
    }
  ]
}
GATT-TX:	 00 f4 2b d6 e6 46 66 5b 65 31 1d 78 08 28 5d 16
GATT-TX:	 92 dc 86 90 14 00 e5 1c 55
>>

menu config
<<
[nimble-Node-0100]# menu config
Menu config:
Available commands:
-------------------
target <unicast>                                  Set target node to configure
composition-get [page_num]                        Get composition data
netkey-add <net_idx>                              Add network key
netkey-del <net_idx>                              Delete network key
appkey-add <app_idx>                              Add application key
appkey-del <app_idx>                              Delete application key
bind <ele_idx> <app_idx> <mod_id> [cid]           Bind app key to a model
mod-appidx-get <ele_addr> <model id>              Get model app_idx
ttl-set <ttl>                                     Set default TTL
ttl-get                                           Get default TTL
pub-set <ele_addr> <pub_addr> <app_idx> <per (step|res)> <re-xmt (cnt|per)> <mod id> [cid]
						  Set publication
pub-get <ele_addr> <model>                        Get publication
proxy-set <proxy>                                 Set proxy state
proxy-get                                         Get proxy state
ident-set <net_idx> <state>                       Set node identity state
ident-get <net_idx>                               Get node identity state
beacon-set <state>                                Set node identity state
beacon-get                                        Get node beacon state
relay-set <relay> <rexmt count> <rexmt steps>     Set relay
relay-get                                         Get relay
hb-pub-set <pub_addr> <count> <period> <ttl> <features> <net_idx> Set heartbeat publish
hb-pub-get                                        Get heartbeat publish
hb-sub-set <src_addr> <dst_addr> <period>         Set heartbeat subscribe
hb-sub-get                                        Get heartbeat subscribe
sub-add <ele_addr> <sub_addr> <model id>          Add subscription
sub-get <ele_addr> <model id>                     Get subscription
node-reset                                        Reset a node and remove it from network
back                                              Return to main menu
version                                           Display version
quit                                              Quit program
exit                                              Quit program
help                                              Display help about this program
export                                            Print evironment variables
>>

target 0100
<<
[nimble-Node-0100]# target 0100
Configuring node 0100
>>

appkey-add 1
<<
[config: Target = 0100]# appkey-add 1
GATT-TX:	 00 f4 d3 01 d7 38 0b 85 db 7f a6 aa 7c 02 80 7f
GATT-TX:	 48 cb a7 48 10 33 67 64 5d 6a 26 b2 ad a8
GATT-TX:	 00 f4 30 0e ff 65 de b2 70 59 1e 4e 60 2d c9 e8
GATT-TX:	 78 83 cd c6 c9 af 95 34 4c 6f bf d5 da 37
GATT-RX:	 00 f4 66 34 be f3 6d b4 8c f6 a5 19 33 64 3e d8
GATT-RX:	 74 07 ea 04 7b 38 2e 50 a2
GATT-RX:	 00 f4 3c 64 ed 80 45 fa 68 37 5c 5a 8f ba 0f db
GATT-RX:	 42 9a 21 a0 51 9e 33 f0 65
Node 0100 AppKey status Success
NetKey	000
AppKey	001
>>

bind 0 1 1000
<<
[config: Target = 0100]# bind 0 1 1000
GATT-TX:	 00 f4 ef 27 26 c9 5b 67 25 b0 47 13 07 f6 62 45
GATT-TX:	 fb b7 61 64 77 0c d9 55 85 79 39
GATT-RX:	 00 f4 3c 57 0c ef bd d5 3e 68 82 17 a2 38 20 91
GATT-RX:	 22 9a 51 30 a9 ce 82 9d 5b ce 9b 5d
Node 0100 Model App status Success
Element Addr	0100
Model Id	1000
AppIdx		001
>>

bind 0 1 1001
<<
 [config: Target = 0100]# bind 0 1 1001
GATT-TX:	 00 f4 b3 54 bf b4 46 f6 1a ac d1 2b 9f 64 31 15
GATT-TX:	 1d c3 73 bf 8b bd 40 60 40 43 f6
GATT-RX:	 00 f4 1e cc d4 0a 62 17 22 a8 00 24 98 21 2f 4d
GATT-RX:	 d8 30 54 0d 3b c4 e7 72 ac 6c 16 b8
Node 0100 Model App status Success
Element Addr	0100
Model Id	1001
AppIdx		001
>>

bind 0 1 1002
<<
 [config: Target = 0100]# bind 0 1 1002
GATT-TX:	 00 f4 33 a7 30 34 ff c1 18 4e bc 65 94 92 e4 b8
GATT-TX:	 32 54 35 74 8c 10 12 a3 5c 57 5d
GATT-RX:	 00 f4 ad 66 73 f8 55 9b 45 3c 01 aa a0 e8 a5 68
GATT-RX:	 d9 77 72 ba 37 12 80 5a b3 22 4f 92
Node 0100 Model App status Success
Element Addr	0100
Model Id	1002
AppIdx		001
>>

bind 0 1 1003
<<
 [config: Target = 0100]# bind 0 1 1003
GATT-TX:	 00 f4 ad 19 c0 53 b8 a5 12 96 94 9a c4 4e 26 db
GATT-TX:	 a1 cf eb a7 1a ea 34 26 b6 fa 77
GATT-RX:	 00 f4 59 05 26 7b 33 16 03 f4 0c 91 ea 24 73 e0
GATT-RX:	 78 b1 55 b4 c4 48 bb df 52 9a 77 11
Node 0100 Model App status Success
Element Addr	0100
Model Id	1003
AppIdx		001
>>

sub-add 0100 c000 1000
<<
[config: Target = 0100]# sub-add 0100 c000 1000
GATT-TX:	 00 f4 bc f4 e4 9c 14 d9 fd 7b cf 00 1b 2a 94 c2
GATT-TX:	 40 f0 d8 7b 95 20 1a 70 a5 ef 20
GATT-RX:	 00 f4 08 42 26 d0 e9 00 21 ad 83 ed 32 65 8c cf
GATT-RX:	 98 51 d7 43 fb 85 cc 63 d2 5e e1 f9

Node 0100 Subscription status Success
Element Addr	0100
Model Id	1000
Subscr Addr	c000
>>

sub-add 0100 c000 1002
<<
[config: Target = 0100]# sub-add 0100 c000 1002
GATT-TX:	 00 f4 9e 47 3e fa b2 dc 5e 60 31 e6 fb 5b 3d b1
GATT-TX:	 5d 9a e8 b1 f6 84 82 9d cf 07 87
GATT-RX:	 00 f4 2c 39 d7 32 9a 50 79 b4 9d a7 ae d6 7f f7
GATT-RX:	 82 10 12 f1 dd 71 2e 77 df a2 76 0c

Node 0100 Subscription status Success
Element Addr	0100
Model Id	1002
Subscr Addr	c000
>>

pub-set 0100 c000 1 0 5 1001
<<
[config: Target = 0100]# pub-set 0100 c000 1 0 5 1001
GATT-TX:	 00 f4 72 e8 70 b2 c1 5f 45 1c 76 67 90 75 94 82
GATT-TX:	 8e 8c 37 2a 2e 06 c5 b6 09 3a af 12 81 d1
GATT-TX:	 00 f4 ea 7e 7e 88 05 bd 0c 59 de 76 03 a4 05 e8
GATT-TX:	 5e c2 3f 42 33 c0
GATT-RX:	 00 f4 36 7f 3b e4 33 a4 93 05 cf 55 ae 0c 1a 87
GATT-RX:	 32 78 26 56 31 2c a5 43 01
GATT-RX:	 00 f4 b8 ba 82 8d 57 7f dd fa 5f db 63 81 0e fb
GATT-RX:	 e3 fb ae fd 2d 7f c9 13 ea 98 31 2b 8c 4e
GATT-RX:	 00 f4 58 16 c9 34 df 49 15 c7 7b 0f 05 bd d5 40
GATT-RX:	 34 b1 6c 00 48 c8 2b 02 b8 7f 79 45

Node 0100 Publication status Success
Element Addr	0100
Model Id	1001
Pub Addr	c000
Period		0 ms
Rexmit count	0
Rexmit steps	5
GATT-TX:	 00 f4 2d 34 5d e4 87 f9 16 a5 7f f5 d0 6d ca f8
GATT-TX:	 5c c4 b7 11 55 ee 3d fb 30
>>

pub-set 0100 c000 1 0 5 1003
<<
[config: Target = 0100]# pub-set 0100 c000 1 0 5 1003
GATT-TX:	 00 f4 b6 5c 11 2c b0 43 a2 b9 cb 0e 6e d0 ee 19
GATT-TX:	 ca 6a 99 18 03 8a b3 6b a9 9e 23 47 1e 55
GATT-TX:	 00 f4 89 88 0f f1 24 51 f2 43 53 3b a5 b4 b6 8f
GATT-TX:	 81 1f 2c 63 92 5f
GATT-RX:	 00 f4 9e 1e 7e 88 ba 91 bd 90 49 6a 49 0e 83 78
GATT-RX:	 0c ef 9f 4b e7 e2 65 c9 03
GATT-RX:	 00 f4 4e ce 81 cf 1b cb b8 e2 d9 a7 17 0d 34 20
GATT-RX:	 69 fd 0b af a1 d2 c0 ef ff 53 64 fc ac 60
GATT-RX:	 00 f4 f1 27 30 9f 0d 74 d4 a2 f0 00 5b e6 c4 7a
GATT-RX:	 26 d4 09 ad 52 44 2e 19 5c e2 0f 30

Node 0100 Publication status Success
Element Addr	0100
Model Id	1003
Pub Addr	c000
Period		0 ms
Rexmit count	0
Rexmit steps	5
GATT-TX:	 00 f4 42 aa a1 ad 08 af 07 d8 08 80 1b 3a df 95
GATT-TX:	 7b 75 3b c5 30 1b da 70 e8
[config: Target = 0100]#
>>

# sudo systemctl status bluetooth-mesh
# cd ~
# mkdir -p ~/.config/meshctl
# cp ~/bluez-5.50/mesh/prov_db.json ~/.config/meshctl/
# cp ~/bluez-5.50/mesh/local_node.json ~/.config/meshctl/
```

```
target 0100 
Set the target node to configure, 0100 is the unicast address of the
primary element.

appkey-add 1
add AppKey from prov_db.json
AppKey index: 1

bind 0 1 1000
 bind appkey to element in model
 element index: 0
 AppKey index: 1
 model id 1000: Generic On/Off Server (BT_MESH_MODEL_ID_GEN_ONOFF_SRV)
 https://github.com/apache/mynewt-nimble/blob/master/nimble/host/mesh/include/mesh/access.h

bind 0 1 1001
 bind appkey to element in model
 element index: 0
 AppKey index: 1
 model id 1001: Generic On/Off Client (BT_MESH_MODEL_ID_GEN_ONOFF_CLI)

bind 0 1 1002
 bind appkey to element in model
 element index: 0
 AppKey index: 1
 model id 1002: Generic Level Server (BT_MESH_MODEL_ID_GEN_LEVEL_SRV)

bind 0 1 1003
 bind appkey to element in model
 element index: 0
 AppKey index: 1
 model id 1003: Generic Level Client (BT_MESH_MODEL_ID_GEN_LEVEL_CLI)

sub-add 0100 c000 1000
 subscribe to element in group address
 element address a.k.a unicast address: 0100
 group address: c000, range: 0xc000 ~ 0xffff
 model id 1000: Generic On/Off Server (BT_MESH_MODEL_ID_GEN_ONOFF_SRV)

sub-add 0100 c000 1002
 subscribe to element in group address
 element address a.k.a unicast address: 0100
 group address: c000, range: 0xc000 ~ 0xffff
 model id 1002: Generic Level Server (BT_MESH_MODEL_ID_GEN_LEVEL_SRV)

pub-set 
<ele_addr> 
<pub_addr> 
<app_idx> 
<per (step|res)> <re-xmt (cnt|per)> 
<mod id> [cid]

pub-set 0100 c000 1 0 5 1001
 publish element to group address
 element address a.k.a unicast address: 0100
 group address: c000, range: 0xc000 ~ 0xffff
 AppKey index: 1
 Publish period: 0
 Publish retransmit count: 5
 model id 1001: Generic On/Off Client (BT_MESH_MODEL_ID_GEN_ONOFF_CLI)

Mesh Profile Bluetooth® Specification

3.7.6.1.3 Periodic publishing
A model may be configured to send status messages periodically regardless of whether the state has changed or not. This is done by using a Publish Period (see Section 4.2.2.2). When the Publish Period is set to a non-zero value, unless specified otherwise by a higher layer specification, a status message shall be published at least once every Publish Period. When the Publish Period is set to 0, the status messages shall only be published on a state change when enabled.

3.7.6.1.4 Publish retransmissions
When a new message is being published by a model instance, all pending retransmissions of the previous message published by the model instance shall be canceled, and the model instance shall retransmit the new message as specified by the Publish Retransmit Count and Publish Retransmit Interval Steps states.

pub-set 0100 c000 1 0 5 1003
 element address a.k.a unicast address 0100
 group address: c000, range: 0xc000 ~ 0xffff
 AppKey index: 1
 Publish period: 0
 Publish retransmit count: 5
 model id 1003: Generic Level Client (BT_MESH_MODEL_ID_GEN_LEVEL_CLI)

<<
power-> 0, color-> 0
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
power-> 100, color-> 0
STB read temp sensor
Rust send_sensor_data: t=1757
NET network not ready
power-> 0, color-> 0
STB read temp sensor
Rust send_sensor_data: t=1757
>>

back
<<
[config: Target = 0100]# back
Menu main:
Available commands:
-------------------
config                                            Configuration Model Submenu
onoff                                             On/Off Model Submenu
list                                              List available controllers
show [ctrl]                                       Controller information
select <ctrl>                                     Select default controller
security [0(low)/1(medium)/2(high)]               Display or change provision security level
info [dev]                                        Device information
connect [net_idx] [dst]                           Connect to mesh network or node on network
discover-unprovisioned <on/off>                   Look for devices to provision
provision <uuid>                                  Initiate provisioning
power <on/off>                                    Set controller power
disconnect [dev]                                  Disconnect device
mesh-info                                         Mesh networkinfo (provisioner)
local-info                                        Local mesh node info
menu <name>                                       Select submenu
version                                           Display version
quit                                              Quit program
exit                                              Quit program
help                                              Display help about this program
export                                            Print evironment variables
>>

menu onoff
<<
[config: Target = 0100]# menu onoff
Menu onoff:
Available commands:
-------------------
target <unicast>                                  Set node to configure
get                                               Get ON/OFF status
onoff <0/1>                                       Send "SET ON/OFF" command
back                                              Return to main menu
version                                           Display version
quit                                              Quit program
exit                                              Quit program
help                                              Display help about this program
export                                            Print evironment variables
>>

target 0100
<<
[config: Target = 0100]# target 0100
Controlling ON/OFF for node 0100
>>

#turn LED1 on
onoff 1
<<
[on/off: Target = 0100]# onoff 1
GATT-TX:	 00 f4 5f d0 ff a9 b2 7a 26 21 91 f1 41 2e fe 8f
GATT-TX:	 66 5e df 8b 3d 3d 1b
GATT-RX:	 00 f4 40 d3 fe 5c 11 87 32 18 df 51 41 69 ca 27
GATT-RX:	 ab 7b 34 90 04 84
On Off Model Message received (1) opcode 8204
	 01
>>

#turn LED1 off
onoff 0
<<
[on/off: Target = 0100]# onoff 0
GATT-TX:	 00 f4 15 0a 42 2f bb 3c e0 dd 6b 92 27 cb 14 3b
GATT-TX:	 53 35 78 51 ce 64 99
GATT-RX:	 00 f4 b2 70 27 58 89 4a a4 f0 33 0d eb c5 26 ac
GATT-RX:	 b5 fc bb 0c dc 23
On Off Model Message received (1) opcode 8204
	 00
>>

#turn LED1 on
onoff 1
<<
[on/off: Target = 0100]# onoff 1
GATT-TX:	 00 f4 99 6c 0b 98 11 24 d7 4c 92 59 f9 10 e0 b3
GATT-TX:	 00 d2 b6 4e 21 28 a6
GATT-RX:	 00 f4 a9 8d c3 c7 71 3d ba dc 60 a5 10 2b 2a cb
GATT-RX:	 5d c7 db 13 55 f8
On Off Model Message received (1) opcode 8204
	 01
>>

#turn LED1 off
onoff 0
<<
[on/off: Target = 0100]# onoff 0
GATT-TX:	 00 f4 95 58 11 a1 63 e2 01 05 e8 f2 d8 cf 21 0d
GATT-TX:	 fc 97 b8 1d 6e 6e be
GATT-RX:	 00 f4 56 88 e0 ab 25 26 17 15 fd 91 57 40 a5 7d
GATT-RX:	 05 88 0b 7b 19 11
On Off Model Message received (1) opcode 8204
	 00
>>

#get LED1’s status
get 
<<
[on/off: Target = 0100]# get
GATT-TX:	 00 f4 4d 95 27 5d 78 01 f9 91 dc 36 d8 7d 7f e6
GATT-TX:	 30 4d 18 80 02
GATT-RX:	 00 f4 30 ef 0e 54 2a 8e 7c 0f c5 10 b9 84 3c 9d
GATT-RX:	 54 dd 1c fd 39 27
On Off Model Message received (1) opcode 8204
	 00
>>

#turn LED1 on
onoff 1
<<
[on/off: Target = 0100]# onoff 1
GATT-TX:	 00 f4 83 a6 36 b8 c3 2b 06 1c db 2e 7d 6f 47 43
GATT-TX:	 6a b2 b4 bf 53 29 4c
GATT-RX:	 00 f4 08 b1 d9 f2 d4 32 66 75 db 98 90 d6 57 79
GATT-RX:	 e2 d1 15 bf 59 19
On Off Model Message received (1) opcode 8204
	 01
>>

#get LED1’s status
get 
<<
[on/off: Target = 0100]# get
GATT-TX:	 00 f4 b6 ac 2b 46 d7 c1 13 70 c7 49 d3 37 b3 8f
GATT-TX:	 8c 27 c9 14 b1
GATT-RX:	 00 f4 a8 2f cc e5 88 8f 32 34 6c f0 03 95 82 2b
GATT-RX:	 cd b7 43 e3 56 e0
On Off Model Message received (1) opcode 8204
	 01

[on/off: Target = 0100]#
>>

Command Description
back: Back to main menu.
menu onoff: Go to “menu onoff” menu.
target 0100 
target <unicast>
 <unicast> -- unicast address
Set the target node to configure, 0100 is the unicast address of the primary

element
onoff x onoff <0/1> -- send “SET ON/OFF” command.
get: get – Get ON/OFF status.

Button 1: LED1 On
Button 2: LED1 Off
```

#### Bluetooth: Mesh Generic OnOff, Generic Level, Lighting & Vendor Models

##### Overview
********

This is a application demonstrating a Bluetooth mesh node in
which Root element has following models

- Generic OnOff Server
- Generic OnOff Client
- Generic Level Server
- Generic Level Client
- Generic Default Transition Time Server
- Generic Default Transition Time Client
- Generic Power OnOff Server
- Generic Power OnOff Setup Server
- Generic Power OnOff Client
- Light Lightness Server
- Light Lightness Setup Server
- Light Lightness Client
- Light CTL Server
- Light CTL Setup Server
- Light CTL Client
- Vendor Model

And Secondary element has following models

- Generic Level Server
- Generic Level Client
- Light CTL Temperature Server

Prior to provisioning, an unprovisioned beacon is broadcast that contains
a unique UUID. Each button controls the state of its
corresponding LED and does not initiate any mesh activity

##### Associations of Models with hardware
************************************
For the nRF52840-PDK board, these are the model associations:

* LED1 is associated with generic OnOff Server's state which is part of Root element
* LED2 is associated with Vendor Model which is part of Root element
* LED3 is associated with generic Level (ROOT) / Light Lightness Actual value
* LED4 is associated with generic Level (Secondary) / Light CTL Temperature value
* Button1 and Button2 are associated with gen. OnOff Client or Vendor Model which is part of Root element
* Button3 and Button4 are associated with gen. Level Client / Light Lightness Client / Light CTL Client which is part of Root element

States of Servers are bounded as per Bluetooth SIG Mesh Model Specification v1.0

After provisioning, the button clients must
be configured to publish and the LED servers to subscribe.
If a server is provided with a publish address, it will
also publish its relevant status.

##### Requirements
************
This sample has been tested on the Nordic nRF52840-PDK board, but would
likely also run on the nrf52_pca10040 board.


##### Running
************

Provisioning is done using the BlueZ meshctl utility. In this example, we'll use meshctl commands to bind:

- Button1, Button2, and LED1 to application key 1. It then configures Button1 and Button2
  to publish to group 0xC000 and LED1 to subscribe to that group.
- Button3, Button4, and LED3 to application key 1. It then configures Button3 and Button4
  to publish to group 0xC000 and LED3 to subscribe to that group.

```
discover-unprovisioned on
provision <discovered UUID>
menu config
target 0100
appkey-add 1
bind 0 1 1000
bind 0 1 1001
bind 0 1 1002
bind 0 1 1003
sub-add 0100 c000 1000
sub-add 0100 c000 1002
pub-set 0100 c000 1 0 5 1001
pub-set 0100 c000 1 0 5 1003
```

Node 2:
```
sub-add 0102 c000 1000
sub-add 0102 c000 1002
pub-set 0102 c000 1 0 5 1001
pub-set 0102 c000 1 0 5 1003
```

Node 3:
```
sub-add 0104 c000 1000
sub-add 0104 c000 1002
pub-set 0104 c000 1 0 5 1001
pub-set 0104 c000 1 0 5 1003
```

Node 4:
```
sub-add 0106 c000 1000
sub-add 0106 c000 1002
pub-set 0106 c000 1 0 5 1001
pub-set 0106 c000 1 0 5 1003
```

Test:
```
back
menu onoff
target 0100
onoff 1
get
onoff 0
get
```

The meshctl utility maintains a persistent JSON database containing
the mesh configuration. As additional nodes (boards) are provisioned, it
assigns sequential unicast addresses based on the number of elements
supported by the node. This example supports 2 elements per node.

The meshctl target for configuration must be the root element's unicast
address as it is the only one that has a configuration server model. If
meshctl is gracefully exited, it can be restarted and reconnected to
network 0x0.

The meshctl utility also supports a onoff model client that can be used to
change the state of any LED that is bound to application key 0x1.
This is done by setting the target to the unicast address of the element
that has that LED's model and issuing the onoff command.
Group addresses are not supported.

# Fixes for Mynewt type conversion build warnings

These fixes should be applied manually when upgrading Mynewt or installing Mynewt from scratch.

1️⃣ `repos/apache-mynewt-core/kernel/os/include/os/os_mutex.h` line 122 <br>
```C
    return mu->mu_level;
```
Change to
```C
    return (os_error_t) mu->mu_level;
```

2️⃣ `repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h` line 847 <br>
```C
    return (sensor->s_types & sensor->s_mask & type);
```
Change to
```C
    return (sensor_type_t) (sensor->s_types & sensor->s_mask & type);
```

3️⃣ `repos/apache-mynewt-core/encoding/tinycbor/include/tinycbor/cbor.h` line 201 <br>
```C
    {   return encoder->writer->bytes_written; }
```
Change to
```C
    {   return (CborError) encoder->writer->bytes_written; }
```

# Installation, Build, Flash and Debug Logs

Sample logs for Windows may be found in the [logs folder](logs)

# Contents

This repository contains...

[`rust`](rust): Rust Application

[`Cargo.toml`](Cargo.toml): Rust Build Settings

[`.cargo`](.cargo): Rust Target Settings

[`my_sensor_app`](apps/my_sensor_app): Mynewt Application Stub

[`boot_stub`](apps/boot_stub): Mynewt Bootloader Stub

[`adc_stm32f1`](libs/adc_stm32f1): Mynewt Driver for ADC on STM32 F103 (Blue Pill). Used by `temp_stm32` internal temperature sensor.

[`adc_stm32l4`](libs/adc_stm32l4): Mynewt Driver for ADC on STM32 L476. Used by `temp_stm32` internal temperature sensor.

[`bc95g`](libs/bc95g): Mynewt Driver for Quectel BC95 NB-IoT module

[`buffered_serial`](libs/buffered_serial): Buffered Serial Library used by `bc95g` NB-IoT driver and `gps_l70r` GPS driver

[`custom_sensor`](libs/custom_sensor): Custom Sensor Definitions for Raw Temperature and Geolocation

[`esp8266`](libs/esp8266): Mynewt Driver for ESP8266 WiFi module

[`gps_l70r`](libs/gps_l70r): Mynewt Driver for Quectel L70-R GPS module

[`hmac_prng`](libs/hmac_prng): HMAC pseudorandom number generator with entropy based on internal temperature sensor

[`low_power`](libs/low_power): Low Power functions for STM32 F103 (Blue Pill)

[`mynewt_rust`](libs/mynewt_rust): Helper functions for hosting Rust on Mynewt

[`nrf24l01`](libs/nrf24l01): Mynewt Driver for nRF24L01

[`remote_sensor`](libs/remote_sensor): Mynewt Driver for Remote Sensor

[`rust_app`](libs/rust_app): Stub library that will be replaced by the compiled Rust application and Rust crates

[`rust_libcore`](libs/rust_libcore): Stub library that will be replaced by the Rust Core Library

[`semihosting_console`](libs/semihosting_console): Mynewt Console for Arm Semihosting

[`sensor_coap`](libs/sensor_coap): Sensor CoAP Library

[`sensor_network`](libs/sensor_network): Sensor Network Library

[`temp_stm32`](libs/temp_stm32): Mynewt Driver for Internal Temperature Sensor on STM32

[`temp_stub`](libs/temp_stub): Mynewt Driver for Stub Temperature Sensor that returns a fixed value

[`tiny_gps_plus`](libs/tiny_gps_plus): TinyGPS++ Library ported from Arduino. Used by `gps_l70r` GPS driver.

[`scripts`](scripts): Install, build and deploy scripts

[`.vscode`](.vscode): Visual Studio Code macros for install, build and deploy

[View Rust Documentation](https://lupyuen.github.io/stm32bluepill-mynewt-sensor/rust/app/)

# How This Application Was Created

The Windows version of the `newt` command-line tool in `newt/newt.exe` was created from 

[`github.com/lupyuen/mynewt-newt`](https://github.com/lupyuen/mynewt-newt)

The Mynewt application was originally based on: 

[`mynewt.apache.org/latest/tutorials/sensors/sensor_thingy_lis2dh12_onb.html`](https://mynewt.apache.org/latest/tutorials/sensors/sensor_thingy_lis2dh12_onb.html)

[`mynewt.apache.org/latest/tutorials/sensors/sensor_nrf52_bno055.html`](https://mynewt.apache.org/latest/tutorials/sensors/sensor_nrf52_bno055.html)

```bash
cd /mnt/c
newt new stm32bluepill-mynewt-sensor
cd stm32bluepill-mynewt-sensor
cat project.yml

newt install
newt pkg new -t app apps/my_sensor_app
newt pkg new -t lib libs/semihosting_console

newt target create bluepill_boot
newt target set bluepill_boot bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_boot app=@apache-mynewt-core/apps/boot
newt target set bluepill_boot build_profile=optimized

newt target create bluepill_my_sensor
newt target set bluepill_my_sensor bsp=@apache-mynewt-core/hw/bsp/bluepill
newt target set bluepill_my_sensor app=apps/my_sensor_app
newt target set bluepill_my_sensor build_profile=debug
```

`project.yml` should contain

```yaml
project.name: "my_project"

project.repositories:
    - apache-mynewt-core

repository.apache-mynewt-core:
    type: github
    vers: 1.7.0
    user: apache
    repo: mynewt-core
```
