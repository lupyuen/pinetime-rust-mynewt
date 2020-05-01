# Firmware Upgrade over Bluetooth Low Energy on PineTime Smart Watch

![Platforms in development for PineTime Smart Watch](https://lupyuen.github.io/images/dfu-platforms.png)

Thanks to the FOSS Community, [PineTime Smart Watch](https://wiki.pine64.org/index.php/PineTime) has an incredible variety of FOSS operating systems in the works: [FreeRTOS](https://github.com/JF002/Pinetime), [MicroPython](https://github.com/daniel-thompson/wasp-os), [Mynewt](https://github.com/lupyuen/pinetime-rust-mynewt), [RIOT](https://github.com/bosmoment/PineTime-apps), Rust [RTFM](https://github.com/wose/xochron) ([another](https://github.com/dbrgn/pinetime-rtfm)), [TinyGo](https://github.com/aykevl/go-smartwatch), [Tock](https://www.tockos.org/), [Zephyr](https://github.com/najnesnaj/pinetime-zephyr) ([another](https://github.com/Dejvino/pinetime-hermes-firmware.git)), ...

But these embedded platforms are accessible only by brave PineTime Owners who dare to pry open their watches very carefully... And connect a Raspberry Pi (or ST-Link) to the tiny delicate 4-pin SWD port recessed deep inside... Just to flash the PineTime firmware.

_What if we could flash any firmware to PineTime from our mobile phone... Without opening the watch?_

Yes we can! Just download the firmware file into our phone and push it wirelessly to our watch, like this...

![Firmware Upgrade over Bluetooth Low Energy for PineTime Smart Watch](https://lupyuen.github.io/images/dfu-flow.png)

_Firmware Upgrade over Bluetooth Low Energy for PineTime Smart Watch_

What's the magic behind this? It's the __[Simple Management Protocol (SMP)](https://github.com/apache/mynewt-mcumgr)__

By transmitting a bunch of SMP messages over Bluetooth Low Energy (LE), it's possible to send a file to PineTime and upgrade its firmware. (Assuming that our PineTime supports SMP)

_What mobile app would we use for flashing PineTime over Bluetooth LE?_

The [Nordic nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app for iOS and Android is all that we need for flashing PineTime. Here's how it looks when the app is connected to a PineTime that supports SMP...

![nRF Connect mobile app for Firmware Upgrade](https://lupyuen.github.io/images/dfu-nrfconnect.png)

_nRF Connect mobile app connected to PineTime for Firmware Upgrade_

See the circular `DFU` icon at the top right? That stands for __Direct Firmware Upgrade__.

Tapping the `DFU` icon will let us select a downloaded firmware file for flashing our watch. It's really that easy!

_What about PinePhone? Raspberry Pi?_

PinePhone, Raspberry Pi and other Linux devices may use the open-source [Newt Manager](https://github.com/apache/mynewt-newtmgr) tool.  (I have tested Newt Manager on Raspberry Pi with PineTime)

It runs on a command line, but it should be easy to wrap up in a graphical user interface.

_What needs to be done on PineTime?_

If you're developing firmware for PineTime: Thanks for the great job! I strongly urge you to implement the SMP protocol in your firmware... It will make PineTime Owners a lot happier when updating their watch firmware!

And we'll give PineTime Owners an easy way to try out all the awesome platforms that the PineTime FOSS Community has to offer!

We would like Pine64 to ship PineTime with a FOSS firmware (created by the PineTime Community) that implements the SMP protocol. So PineTime owners can just unbox their watch and start flashing right away from their phones.

In this article I'll walk you through the steps of implementing the SMP protocol in your PineTime firmware. I'll show you my implementation for Mynewt OS, which you may use for reference.

# Simple Management Procotol for Firmware Upgrade

The open-source Simple Management Protocol (SMP) was originally created for flashing the firmware on devices running Mynewt and Zephyr operating systems.

TODO

The MCU Manager Simple Management Procotol (SMP) Bluetooth LE protocol is documented here:

https://github.com/apache/mynewt-mcumgr

https://github.com/apache/mynewt-mcumgr/blob/master/transport/smp-bluetooth.md

Comparing the documented protocol with the iOS client for MCU Manager...

https://github.com/JuulLabs-OSS/mcumgr-ios/blob/master/Source/Bluetooth/McuMgrBleTransport.swift

```swift
public static let SMP_SERVICE = CBUUID(string: "8D53DC1D-1DB7-4CD3-868B-8A527460AA84")
public static let SMP_CHARACTERISTIC = CBUUID(string: "DA2E7828-FBCE-4E01-AE9E-261174997C48")
```

1. MCU Manager client (e.g. mobile phone) communicates with the device (e.g. PineTime) via Bluetooth LE Generic Attribute Profile (GATT). More about GATT: https://learn.adafruit.com/introduction-to-bluetooth-low-energy/gatt

1. MCU Manager client searches for a device that supports GATT Service ID `8D53DC1D-1DB7-4CD3-868B-8A527460AA84`

1. MCU Manager client writes the firmware upgrade request to GATT Characteristic ID `DA2E7828-FBCE-4E01-AE9E-261174997C48`

Additional Swift files to be analysed:

https://github.com/JuulLabs-OSS/mcumgr-ios/blob/master/Source/McuManager.swift

https://github.com/JuulLabs-OSS/mcumgr-ios/blob/master/Source/Managers/ImageManager.swift

https://github.com/JuulLabs-OSS/mcumgr-ios/blob/master/Source/Managers/DFU/FirmwareUpgradeManager.swift

Also refer to the LightBlue app demo:

https://mynewt.apache.org/latest/tutorials/ble/bleprph/bleprph-sections/bleprph-app.html

See the Raspberry Pi Client Log below for the messages sent by Newt Manager tool to PineTime.

# Firmware Upgrade via Bluetooth LE

TODO

__Objective:__ To allow firmware for PineTime Smart Watch to be upgraded Over-The-Air via Bluetooth LE from a mobile phone or a Linux desktop

__Devices To Be Supported:__ iOS, Android, PinePhone, Raspberry Pi (includes Linux desktops)

# Proposed Solution

TODO

We are exploring the OTA Firmware Update solution based on Apache NimBLE Bluetooth stack and Apache Mynewt OS, which are open source:

https://mynewt.apache.org/latest/tutorials/devmgmt/ota_upgrade_nrf52.html

This solution uses the Newt Manager command-line tool, coded in Go and supported on Linux and macOS:

https://github.com/apache/mynewt-newtmgr

https://mynewt.apache.org/latest/newtmgr/index.html

Or we may use the MCU Manager command-line tool, which is a thin wrapper over the Newt Manager command-line tool:

https://github.com/apache/mynewt-mcumgr-cli

For the firmware, the Newt Manager library (based on the NimBLE stack) needs to be embedded. The Newt Manager library receives the firmware image transmitted by the Newt Manager command-line tool:

https://mynewt.apache.org/latest/tutorials/devmgmt/add_newtmgr.html

https://mynewt.apache.org/latest/os/modules/devmgmt/newtmgr.html

Or we may embed the MCU Manager library (also based on the NimBLE stack):

https://github.com/apache/mynewt-mcumgr/blob/master/README-mynewt.md

https://mynewt.apache.org/latest/os/modules/mcumgr/mcumgr.html

(Newt Manager library vs MCU Manager library: newtmgr supports two wire formats - NMP (plain newtmgr protocol) and OMP (CoAP newtmgr protocol). mcumgr only supports NMP (called “Simple Management Procotol” in mcumgr))

Upon reboot, the MCUboot bootloader swaps the firmware images.  If there is a problem, MCUbot restores the previous firmware image. MCUboot is supported on Mynewt, Zephyr and RIOT OS. More about MCUboot:

https://juullabs-oss.github.io/mcuboot/

The Newt Manager / MCU Manager library is probably portable to other firmware, like FreeRTOS and RIOT OS.  MCU Manager is already supported in Zephyr OS.

PineTime should probably ship with a firmware image containing Newt Manager or MCU Manager so that we may upgrade PineTime to other firmware easily.

The NimBLE Bluetooth stack is now supported on PineTime with the FreeRTOS, Mynewt, RIOT and Zephyr firmwares.

The proposed solution is similar to the Bluetooth OTA Firmware Upgrade solution for Zephyr OS (based on MCU Manager):

https://docs.zephyrproject.org/latest/guides/device_mgmt/dfu.html#


# PineTime Firmware

TODO

Now testing PineTime Mynewt firmware built with Newt Manager library, located at the `ota` branch of `/pinetime-rust-mynewt`:

https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota

The Newt Manager library files have been added here: (`ble_*.c` and `ble_*.h`)

https://github.com/lupyuen/pinetime-rust-mynewt/tree/ota/apps/my_sensor_app/src

The files were derived from the Mynewt `bleprph` sample:

https://github.com/apache/mynewt-nimble/tree/master/apps/bleprph

PineTime now appears in nRF Connect with DFU enabled:

https://twitter.com/MisterTechBlog/status/1255305379766042626?s=20

Need to implement MCUboot for DFU to work.

# Newt Manager Modules used in PineTime Firmware

TODO

The following modules were added to PineTime firmware to support Newt Manager:

```yaml
# Bluetooth LE
pkg.deps.BLUETOOTH_LE:
    - "@apache-mynewt-core/boot/split"
    - "@mcuboot/boot/bootutil"
    - "@apache-mynewt-core/mgmt/imgmgr"
    - "@apache-mynewt-core/mgmt/newtmgr"
    - "@apache-mynewt-core/mgmt/newtmgr/transport/ble"
    - "@apache-mynewt-nimble/nimble/host"
    - "@apache-mynewt-nimble/nimble/host/services/ans"
    - "@apache-mynewt-nimble/nimble/host/services/dis"
    - "@apache-mynewt-nimble/nimble/host/services/gap"
    - "@apache-mynewt-nimble/nimble/host/services/gatt"
    - "@apache-mynewt-nimble/nimble/host/store/config"
    - "@apache-mynewt-nimble/nimble/host/util"
    - "@apache-mynewt-nimble/nimble/transport"
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota/apps/my_sensor_app/pkg.yml_

# Porting MCU Manager Library to other PineTime platforms

TODO

For upgrading firmware over Bluetooth, the MCU Manager Library is supported on Mynewt OS and Zephyr OS. How do we support MCU Manager on other PineTime platforms like FreeRTOS, RIOT, MicroPython, Rust RTFM and TinyGo?

MCU Manager Library is documented here:

https://github.com/apache/mynewt-mcumgr

MCU Manager runs on the Bluetooth LE transport based on the open-source NimBLE Bluetooth LE stack. The following NimBLE modules need to be ported to the PineTime platform:

```
- "@apache-mynewt-nimble/nimble/host"
- "@apache-mynewt-nimble/nimble/host/services/ans"
- "@apache-mynewt-nimble/nimble/host/services/dis"
- "@apache-mynewt-nimble/nimble/host/services/gap"
- "@apache-mynewt-nimble/nimble/host/services/gatt"
- "@apache-mynewt-nimble/nimble/host/store/config"
- "@apache-mynewt-nimble/nimble/host/util"
- "@apache-mynewt-nimble/nimble/transport"
```

Refer to the NimBLE source code at https://github.com/apache/mynewt-nimble

MCU Manager includes Command Handlers for managing Firmware Images, File System, Logging, OS and Runtime Statistics:

https://github.com/apache/mynewt-mcumgr/tree/master/cmd

We'll look at the Command Handler for Firmware Images:

https://github.com/apache/mynewt-mcumgr/tree/master/cmd/img_mgmt

The following Image Management interfaces need to be implemented on the PineTime platform:

```c
int img_mgmt_impl_erase_slot(void);
int img_mgmt_impl_write_pending(int slot, bool permanent);
int img_mgmt_impl_write_confirmed(void);
int img_mgmt_impl_read(int slot, unsigned int offset, void *dst,
                       unsigned int num_bytes);
int img_mgmt_impl_write_image_data(unsigned int offset, const void *data,
                                   unsigned int num_bytes, bool last);
int img_mgmt_impl_swap_type(void);
uint8_t img_mgmt_state_flags(int query_slot);
int img_mgmt_impl_erase_image_data(unsigned int off, unsigned int num_bytes);
int img_mgmt_impl_erase_if_needed(uint32_t off, uint32_t len);
int img_mgmt_impl_upload_inspect(const struct img_mgmt_upload_req *req,
                                 struct img_mgmt_upload_action *action,
                                 const char **errstr);
int img_mgmt_impl_log_upload_start(int status);
int img_mgmt_impl_log_upload_done(int status, const uint8_t *hashp);
int img_mgmt_impl_log_pending(int status, const uint8_t *hash);
int img_mgmt_impl_log_confirm(int status, const uint8_t *hash);
```
_From https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/include/img_mgmt/img_mgmt_impl.h_

For reference, see the Mynewt implementation of Image Management:

https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/port/mynewt/src/mynewt_img_mgmt.c

And the Zephyr implementation of Image Management:

https://github.com/apache/mynewt-mcumgr/blob/master/cmd/img_mgmt/port/zephyr/src/zephyr_img_mgmt.c

# nRF Connect Client for iOS and Android

TODO

The nRF Connect Client for iOS and Android works OK with Newt Manager Library on PineTime, connecting via Simple Management Protocol over Bluetooth LE:

https://twitter.com/MisterTechBlog/status/1255305379766042626?s=20

The DFU function is enabled in nRF Client, but PineTime needs MCUboot to be installed for firmware upgrading to work.

More about nRF Connect: https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile

# Raspberry Pi Client

TODO

Newt Manager builds OK on Raspberry Pi 4 and works OK with PineTime.  See the log below.

Now studying the Go code (with debug messages enabled) to understand the firmware upload process:

https://mynewt.apache.org/latest/newtmgr/command_list/newtmgr_image.html

Also how to set the device date/time:

https://mynewt.apache.org/latest/newtmgr/command_list/newtmgr_datetime.html

And whether we can push notifications to the device.

# PinePhone Client

TODO

Waiting for PinePhone to be delivered. Client will probably be based on Newt Manager or MCU Manager, since Go is supported on Ubuntu Touch.

Will probably wrap the Go client in a Qt GUI app.  Or wrap with a Go GUI library: https://github.com/avelino/awesome-go#gui

# Android Client

TODO

Not started. Will explore this Android MCU Manager client for OTA Firmware Upgrade, coded in Java:

https://github.com/JuulLabs-OSS/mcumgr-android

# iOS Client

TODO

Not started. Will explore this iOS MCU Manager client for OTA Firmware Upgrade, coded in Swift:

https://github.com/JuulLabs-OSS/mcumgr-ios

Among all MCU Manager clients, the Swift version is easiest to understand because it calls high-level BLE functions:

https://github.com/JuulLabs-OSS/mcumgr-ios/blob/master/Source/Bluetooth/McuMgrBleTransport.swift

Now using this code to understand the MCU Manager upload protocol.

Refer to the iOS Core Bluetooth API:

https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/AboutCoreBluetooth/Introduction.html#//apple_ref/doc/uid/TP40013257-CH1-SW1

https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/PerformingCommonCentralRoleTasks/PerformingCommonCentralRoleTasks.html#//apple_ref/doc/uid/TP40013257-CH3-SW1

# Flutter Client for iOS and Android

TODO

Alternatively, we may build iOS and Android clients for MCU Manager in Flutter based on this BLE library:

https://github.com/pauldemarco/flutter_blue

This allows us to maintain a single code base to target both iOS and Android clients.

It looks feasible to build a Flutter client (coded in Dart) based on on this Dart BLE sample:

https://github.com/pauldemarco/flutter_blue/tree/master/example/lib

And adapting the iOS MCU Client code.

The Flutter app for PineTime would the MCU Manager functions from scratch. The app would be a great reference to teach how to talk to BLE and GATT services from iOS and Android, even though it won't be a polished app.

# Implementing MCUboot

TODO

MCUboot is not implemented in the Mynewt firmware for PineTime because it doesn't have an allocated slot in Flash ROM for storing the new firmware image. Refer to the Flash Memory Map:

https://github.com/lupyuen/pinetime-rust-mynewt/blob/ota/hw/bsp/nrf52/bsp.yml

Note that `FLASH_AREA_IMAGE_1` and `FLASH_AREA_IMAGE_SCRATCH` are not usable. 

The Flash Memory Map needs to be fixed for MCUboot to work.  The flashing scripts depend on these flash addresses, so the scripts may have to be changed too.

The Flash Memory Map should follow the Mynewt memory map for nRF52:

https://github.com/apache/mynewt-core/blob/master/hw/bsp/nordic_pca10040/bsp.yml

# MCUboot Enhancements

TODO

MCUboot should detect button press upon startup. If the button is pressed, rollback the old firmware. This allows the user to roll back faulty firmware that does not respond to OTA Firmware Upgrade commands.

The OTA Firmware Upgrade tool needs to ensure that the same firmware version doesn't get flashed twice.

The firmware must still implement a "Reset" or watchdog feature, or the user will have to wait for the battery to drain completely before running MCUboot.

The PineTime Mynewt firmware size is 205 KB with Newt Manager Library included. This is quite close to the 232 KB size limit, assuming 2 firmware images plus scratch storage in PineTime's 512 KB ROM.

MCUboot and MCU Manager should be enhanced to store the new and backup firmware images on PineTime's External SPI Flash (4 MB).

```
----- Build Mynewt and link with Rust app
+ newt build nrf52_my_sensor
Building target targets/nrf52_my_sensor
Linking /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
Target successfully built: targets/nrf52_my_sensor
+ newt size -v nrf52_my_sensor
Size of Application Image: app
Mem FLASH: 0x8000-0x7bc00
Mem RAM: 0x20000000-0x20010000
  FLASH     RAM 
    740     330 *fill*
   1018      98 apps_my_sensor_app.a
   1810     112 boot_bootutil.a
    438      26 boot_split.a
   1180       0 crypto_mbedtls.a
   2302       0 crypto_tinycrypt.a
    401       0 encoding_base64.a
   1622       0 encoding_cborattr.a
   3002       0 encoding_tinycbor.a
    440     444 hw_bsp_nrf52.a
     52       0 hw_cmsis-core.a
    706       1 hw_hal.a
   7074     154 hw_mcu_nordic_nrf52xxx.a
      2       0 hw_sensor_creator.a
   1264     260 hw_sensor.a
   8756   35712 kernel_os.a
   3044      50 libc_baselibc.a
     16       0 libs_mynewt_rust.a
  57400    9582 libs_rust_app.a
  12912       0 libs_rust_libcore.a
    738      42 libs_semihosting_console.a
     40       9 libs_sensor_coap.a
    583      99 libs_sensor_network.a
    677     212 libs_temp_stub.a
   3428      72 mgmt_imgmgr.a
    231      20 mgmt_mgmt.a
    884     100 mgmt_newtmgr.a
   1410      44 mgmt_newtmgr_nmgr_os.a
    454     108 mgmt_newtmgr_transport_ble.a
    405     388 net_oic.a
  35496    2107 nimble_controller.a
   4086    1203 nimble_drivers_nrf52.a
  41721    2797 nimble_host.a
    822     218 nimble_host_services_ans.a
    241     112 nimble_host_services_dis.a
    396     118 nimble_host_services_gap.a
    204      62 nimble_host_services_gatt.a
   1814     648 nimble_host_store_config.a
    114       0 nimble_host_util.a
    692    1096 nimble_transport_ram.a
   1578      54 sys_config.a
    634     128 sys_flash_map.a
      2       0 sys_log_modlog.a
    686      29 sys_mfg.a
    839      51 sys_reboot.a
    226      37 sys_sysdown.a
     30       5 sys_sysinit.a
   1746       0 time_datetime.a
    120       0 util_mem.a
    208       0 nrf52_my_sensor-sysinit-app.a
    166       0 libg.a
    968       0 libgcc.a
Loading compiler /Users/Luppy/PineTime/pinetime-rust-mynewt/repos/apache-mynewt-core/compiler/arm-none-eabi-m4, buildProfile debug

objsize
   text    data     bss     dec     hex filename
 205760     904   55224  261888   3ff00 /Users/Luppy/PineTime/pinetime-rust-mynewt/bin/targets/nrf52_my_sensor/app/apps/my_sensor_app/my_sensor_app.elf
```

# Other PineTime Bluetooth Firmware Upgrade Solutions

1. Nordic SoftDevice includes a proprietary BLE DFU implementation: https://infocenter.nordicsemi.com/topic/com.nordic.infocenter.sdk5.v15.0.0/lib_bootloader_dfu_process.html

1. wasp-os with Adafruit NRF52 Bootloader (based on Nordic SoftDevice): https://github.com/daniel-thompson/wasp-os

1. Gadgetbridge for Android: https://gadgetbridge.org/

1. DaFlasher for Android: https://github.com/atc1441/DaFlasherFiles

# Log for Raspberry Pi Client

```
# Build Newt Manager on Raspberry Pi

$ cd ~/go
$ mkdir -p src/mynewt.apache.org
$ cd src/mynewt.apache.org/
$ git clone https://github.com/apache/mynewt-newtmgr
$ mv mynewt-newtmgr newtmgr
$ cd newtmgr/newtmgr
$ export GO111MODULE=on
$ go build

# Run Newt Manager on Raspberry Pi

$ cd ~/go/src/mynewt.apache.org/newtmgr/newtmgr
$ sudo ./newtmgr conn add mybleprph type=ble connstring="peer_name=pinetime"
Connection profile mybleprph successfully added

# List firmware images
$ sudo ./newtmgr image list -c mybleprph --loglevel debug
DEBU[2020-04-29 08:23:56.54] Using connection profile: name=mybleprph type=ble connstring=peer_name=pinetime
DEBU[2020-04-29 08:23:56.701] Connecting to peer
DEBU[2020-04-29 08:23:56.773] Exchanging MTU
DEBU[2020-04-29 08:23:56.822] Connecting to peer
DEBU[2020-04-29 08:23:56.907] Exchanging MTU
DEBU[2020-04-29 08:23:56.922] Exchanged MTU; ATT MTU = 256
DEBU[2020-04-29 08:23:56.922] Discovering profile
DEBU[2020-04-29 08:23:57.176] Subscribing to NMP response characteristic
DEBU[2020-04-29 08:23:57.191] {add-nmp-listener} [bll_sesn.go:392] seq=66
DEBU[2020-04-29 08:23:57.191] Encoded &{NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:1 Seq:66 Id:0}}} to:
00000000  a0                                                |.|
DEBU[2020-04-29 08:23:57.191] Encoded:
00000000  00 00 00 01 00 01 42 00  a0                       |......B..|
DEBU[2020-04-29 08:23:57.191] Tx NMP request: 00000000  00 00 00 01 00 01 42 00  a0                       |......B..|
DEBU[2020-04-29 08:23:57.213] rx nmp response: 00000000  01 00 00 86 00 01 42 00  bf 66 69 6d 61 67 65 73  |......B..fimages|
00000010  9f bf 64 73 6c 6f 74 00  67 76 65 72 73 69 6f 6e  |..dslot.gversion|
00000020  65 31 2e 30 2e 30 64 68  61 73 68 58 20 ea b2 88  |e1.0.0dhashX ...|
00000030  69 47 a1 df 6f 85 04 63  60 1f 3d ad 40 94 11 d7  |iG..o..c`.=.@...|
00000040  ea 21 85 5e b0 a7 0e 96  57 32 25 8c 92 68 62 6f  |.!.^....W2%..hbo|
00000050  6f 74 61 62 6c 65 f5 67  70 65 6e 64 69 6e 67 f4  |otable.gpending.|
00000060  69 63 6f 6e 66 69 72 6d  65 64 f5 66 61 63 74 69  |iconfirmed.facti|
00000070  76 65 f5 69 70 65 72 6d  61 6e 65 6e 74 f4 ff ff  |ve.ipermanent...|
00000080  6b 73 70 6c 69 74 53 74  61 74 75 73 00 ff        |ksplitStatus..|
DEBU[2020-04-29 08:23:57.214] Received nmp rsp: &{NmpBase:{hdr:{Op:1 Flags:0 Len:134 Group:1 Seq:66 Id:0}} Rc:0 Images:[{NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:0 Seq:0 Id:0}} Image:0 Slot:0 Version:1.0.0 Hash:[234 178 136 105 71 161 223 111 133 4 99 96 31 61 173 64 148 17 215 234 33 133 94 176 167 14 150 87 50 37 140 146] Bootable:true Pending:false Confirmed:true Active:true Permanent:false}] SplitStatus:N/A}
DEBU[2020-04-29 08:23:57.214] {remove-nmp-listener} [bll_sesn.go:392] seq=66
Images:
 image=0 slot=0
    version: 1.0.0
    bootable: true
    flags: active confirmed
    hash: eab2886947a1df6f850463601f3dad409411d7ea21855eb0a70e965732258c92
Split status: N/A (0)
```

# Further Reading

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)