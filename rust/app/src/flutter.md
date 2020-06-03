# Your First Bluetooth Low Energy App with Flutter

![Flutter App with Bluetooth Low Energy running on a real Android phone, connected to VSCode Debugger](https://lupyuen.github.io/images/flutter-title.png)

_Flutter App with Bluetooth Low Energy running on a real Android phone, connected to VSCode Debugger_

Ready to create your very first _"Hello World"_ app with [__Flutter__](https://flutter.dev/)?

Why not make a sophisticated app that says...

_"Hello Bluetooth Low Energy gadgets nearby... Tell me what's inside you!"_

With Flutter, Bluetooth LE (Low Energy) apps for Android AND iOS are ridiculously easy to build, let me show you how!

# Download Flutter SDK

The Flutter SDK works on Windows, macOS and Linux (Intel, not Arm, so Raspberry Pi is no-go).

1. [Download the Flutter SDK](https://flutter.dev/docs/get-started/install)

1. Unzip the Flutter SDK to our Home Directory. 

1. Add `flutter/bin` to our PATH.

    For macOS and Linux, we may edit `~/.bashrc` (or equivalent) and add this...

    ```bash
    export PATH="$PATH:$HOME/flutter/bin"
    ```

1. Open a new Command Prompt. Check the Flutter SDK by entering...

    ```bash
    flutter
    ```

    We should see this helpful message...

![Flutter Tool](https://lupyuen.github.io/images/flutter-doctor1.png)

# Install Flutter Tools

1. [Download and install VSCode](https://code.visualstudio.com/)

1. At the Command Prompt, enter...

    ```bash
    flutter doctor
    ```

    We will see something like this...

    ![Flutter Doctor](https://lupyuen.github.io/images/flutter-doctor2.png)

1. Whoa that's a long list of complaints! But we shall fix only 3 things: __Android Toolchain__, __VSCode__ and __Connected Device__

1. __Android Toolchain__: Follow the instructions shown in your screen. 
    
    You may need to run `sdkmanager` and `flutter doctor --android-licenses`

1. __VSCode__: Launch VSCode. Click `View → Extensions`
    
    Install the Flutter Extension for VSCode...

    ![Flutter Extension for VSCode](https://lupyuen.github.io/images/flutter-vscode.png)

1. __Connected Device__: Connect our Android phone (with debugging enabled) to the USB port...

    ![Connect phone to USB port](https://lupyuen.github.io/images/flutter-usb.jpg)

1. After connecting our Android phone, enter...

    ```bash
    flutter -v devices
    ```

    We should see our phone...

    ```
    List of devices attached
    99031FFG device usb:3376X product:coral model:Pixel_4_XL device:coral
    Pixel 4 XL • 99031FFG • android-arm64 • Android 10 (API 29)
    ```

1. Finally enter...

    ```bash
    flutter doctor
    ```

    We should see ticks for __Flutter__, __Android Toolchain__, __VSCode__ and __Connected Device__...

    ![Flutter Doctor After Fixes](https://lupyuen.github.io/images/flutter-doctor3.png)

1. We may ignore the other issues for now

# Download Source Code for Flutter App

The source code for our Flutter app is located here...

[`github.com/lupyuen/flutter-blue-sample`](https://github.com/lupyuen/flutter-blue-sample)

Our app is derived from the [sample app](https://github.com/pauldemarco/flutter_blue/tree/master/example) that comes with the [`flutter_blue`](https://github.com/pauldemarco/flutter_blue) Bluetooth LE plugin for Flutter.

1. In VSCode, click `View → Command Palette`

1. Enter `Git Clone`

1. Enter `https://github.com/lupyuen/flutter-blue-sample`

1. Select a folder to download the source code

1. When prompted to open the cloned repository, click `Open`

1. When prompted get missing packages, click `Get Packages`

Check this video for the steps to download the source code for our Flutter app...

- [Watch on YouTube](https://youtu.be/QSrg9DgLwjk)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.1/flutter-debug.mov)

# Debug Flutter App

We're now ready to debug our Flutter app on a real Android phone!

1. Check that our Android phone is connected to the USB port. We should see the phone in the VSCode status bar...

    ![Flutter Device in VSCode](https://lupyuen.github.io/images/flutter-device.png)

1. In VSCode, click `Run → Start Debugging`

    ![Start Debugging in VSCode](https://lupyuen.github.io/images/flutter-debug1.png)

1. Select the `Dart & Flutter` debugger

    ![Select Debugger in VSCode](https://lupyuen.github.io/images/flutter-debug2.png)

1. Wait for the Flutter app to be compiled and deployed to our phone (May take a minute for the first time)

1. When the Flutter app starts, we'll be able to Scan, Connect, Reload and Expand devices over Bluetooth LE like this...

![Scanning for Bluetooth LE devices](https://lupyuen.github.io/images/flutter-scan.png)

And that's our very first Flutter app with Bluetooth LE!

VSCode Debugger has many useful features for debugging Flutter apps. Here's what we see when we hit an unhandled exception in our Flutter app...

![Flutter App with VSCode Debugger](https://lupyuen.github.io/images/flutter-debug.png)

[_Larger image_](https://lupyuen.github.io/images/flutter-debug.png)

- __Dev Tools__:

- __Variables__:

- __Call Stack__:

- __Debug Console__:

- __Source Code__:

- __Debug Toolbar__:

    https://code.visualstudio.com/docs/editor/debugging

Hot Reload

https://flutter.dev/docs/development/tools/vs-code

Here's a video of the steps for debugging a Flutter app with VSCode...

- [Watch on YouTube](https://youtu.be/QSrg9DgLwjk)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.1/flutter-debug.mov)

![PineTime Smart Watch](https://lupyuen.github.io/images/micropython-title.jpg)

_PineTime Smart Watch_

# Bluetooth LE Services

- [Watch on YouTube](https://youtu.be/pt-BYs_7qOE)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.1/flutter-pinetime-rotated.mp4)

GATT defines the standard way for a Bluetooth LE Client (like our Flutter app) to access a Bluetooth LE Service (like on the PineTime Smart Watch). [More about GATT](https://learn.adafruit.com/introduction-to-bluetooth-low-energy/gatt)

![Bluetooth LE Services on PineTime Smart Watch](https://lupyuen.github.io/images/flutter-services.png)

Here are the GATT Services that appear when the [Nordic nRF Connect](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-mobile) mobile app is connected to PineTime...

Let's examine the GATT Services shown above...

PineTime also exposes [__Standard GATT Services__](https://www.bluetooth.com/specifications/gatt/services/) that are defined in the Bluetooth LE Specifications...

1. __Generic Access__ (`0x1800`):
Device Name (`pinetime`) and Appearance. [Specifications](https://www.bluetooth.com/xml-viewer/?src=https://www.bluetooth.com/wp-content/uploads/Sitecore-Media-Library/Gatt/Xml/Services/org.bluetooth.service.generic_access.xml)

1. __Generic Attribute__ (`0x1801`): Notify the mobile app of any changes in PineTime's GATT Services.
[Specifications](https://www.bluetooth.com/xml-viewer/?src=https://www.bluetooth.com/wp-content/uploads/Sitecore-Media-Library/Gatt/Xml/Services/org.bluetooth.service.generic_attribute.xml)

1. __Device Information__ (`0x180A`): Model Number (`Apache Mynewt NimBLE`) and Firmware Revision (`1.0.0`).
[Specifications](https://www.bluetooth.com/xml-viewer/?src=https://www.bluetooth.com/wp-content/uploads/Sitecore-Media-Library/Gatt/Xml/Services/org.bluetooth.service.device_information.xml)

1. __Alert Notification Service__	(`0x1811`): Alerts and Notifications.
[Specifications](https://www.bluetooth.com/xml-viewer/?src=https://www.bluetooth.com/wp-content/uploads/Sitecore-Media-Library/Gatt/Xml/Services/org.bluetooth.service.alert_notification.xml)


__Simple Management Protocol (SMP) Service__ (`8D53DC1D-1DB7-4CD3-868B-8A527460AA84`) is managed by the MCU Manager Library as [Command Handlers](https://github.com/apache/mynewt-mcumgr/tree/master/cmd)...

1. __Image Management:__ For querying and updating firmware images in PineTime's Flash ROM. This is the Command Handler that we have implemented to support firmware update on PineTime. See [`img_mgmt`](https://github.com/apache/mynewt-mcumgr/tree/master/cmd/img_mgmt)

1. __File System Management:__ For accessing the user file system in PineTime's Flash ROM. See [`fs_mgmt`](https://github.com/apache/mynewt-mcumgr/tree/master/cmd/fs_mgmt)

1. __Log Management:__ For browsing the debugging messages logged by the firmware. See [`log_mgmt`](https://github.com/apache/mynewt-mcumgr/tree/master/cmd/log_mgmt)

1. __OS Management:__ Execute Operating System functions. See [`os_mgmt`](https://github.com/apache/mynewt-mcumgr/tree/master/cmd/os_mgmt)

1. __Statistics Management:__ Runtime statistics useful for troubleshooting. See [`stat_mgmt`](https://github.com/apache/mynewt-mcumgr/tree/master/cmd/stat_mgmt)

PineTime Firmware Developers only need to implement the Image Management Command Handler to support firmware updates. The other Command Handlers are optional, though they may be useful for diagnostics and troubleshooting.

The final GATT Service (`59462f12-9543-9999-12c8-58b459a2712d`) in the screen above is the __Security Test Service__, which is also optional. See [`gatt_svr.c`](https://github.com/apache/mynewt-nimble/blob/master/apps/btshell/src/gatt_svr.c#L67-L94)

![GATT Services exposed by MCU Manager on PineTime](https://lupyuen.github.io/images/dfu-gattservices.jpg)

_GATT Services exposed by MCU Manager on PineTime_

# Bluetooth LE Code

I'm new to Flutter and Dart... And I find it absolutely amazing that a few lines of code can do so much!

Our app is structured like this to scan Bluetooth LE devices and display them...

<< pic >>

Here's the code that implements the screen for scanning Bluetooth LE devices: [`lib/main.dart`](https://github.com/lupyuen/flutter-blue-sample/blob/master/lib/main.dart#L67-L153)

```dart
//  Screen for finding devices
class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Title for the screen
      appBar: AppBar(
        title: Text('Find Devices'),
      ),

      body: RefreshIndicator(
        //  Start scanning for Bluetooth LE devices
        onRefresh: () =>
            FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)),

        //  List of Bluetooth LE devices
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ...
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBlue.instance.scanResults,
                initialData: [],

                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map(
                        //  For each Bluetooth LE device, show the ScanResultTile widget when tapped
                        (r) => ScanResultTile(
                          result: r,
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            r.device.connect();
                            return DeviceScreen(device: r.device);
                          })),
                        ),
                      )
                      .toList(),
                ),
              ),
            ...
```

And here's the code that renders each Bluetooth LE device found: [`lib/widgets.dart`](https://github.com/lupyuen/flutter-blue-sample/blob/master/lib/widgets.dart#L8-L121)

```dart
//  Widget for displaying a Bluetooth LE device
class ScanResultTile extends StatelessWidget {
  ...
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      //  Show the device name and signal strength
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()),

      //  Show the Connect button and call onTap when tapped
      trailing: RaisedButton(
        child: Text('CONNECT'),
        color: Colors.black,
        textColor: Colors.white,
        onPressed: (result.advertisementData.connectable) ? onTap : null,
      ),

      //  Display the device's name, signal strength, manufacturer data, service UUIDs and service data
      children: <Widget>[
        _buildAdvRow(
            context, 'Complete Local Name', result.advertisementData.localName),
        _buildAdvRow(context, 'Tx Power Level',
            '${result.advertisementData.txPowerLevel ?? 'N/A'}'),
        _buildAdvRow(
            context,
            'Manufacturer Data',
            getNiceManufacturerData(
                result.advertisementData.manufacturerData) ??
                'N/A'),
        _buildAdvRow(
            context,
            'Service UUIDs',
            (result.advertisementData.serviceUuids.isNotEmpty)
                ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        _buildAdvRow(context, 'Service Data',
            getNiceServiceData(result.advertisementData.serviceData) ?? 'N/A'),
      ],
    );
  }
  ...
```

Yes the code looks similar to JavaScript (because Dart is meant to [compile to JavaScript efficiently](https://dart.dev/faq#q-why-isnt-dart-more-like-haskell--smalltalk--python--scala--other-language)).

But overall the User Interface code looks Declarative and Functional... A huge improvement over JavaScript and React Native!

https://github.com/lupyuen/flutter-blue-sample/blob/master/pubspec.yaml

```
dependencies:
  flutter_blue: ^0.7.2
```

# What's Next

Companion App

If you're keen to help out, come chat with us on the PineTime Chatroom!

# Further Reading

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
