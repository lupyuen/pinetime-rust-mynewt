# Your First Bluetooth Low Energy App with Flutter

![Flutter App with Bluetooth Low Energy running on a real Android phone, connected to VSCode Debugger](https://lupyuen.github.io/images/flutter-title.png)

_Flutter App with Bluetooth Low Energy running on a real Android phone, connected to VSCode Debugger_

Ready to create your very first _"Hello World"_ app with Flutter?

Why not make a sophisticated app that says...

_"Hello Bluetooth Low Energy gadgets nearby... Tell me what's inside you!"_

With Flutter, Bluetooth LE (Low Energy) apps for Android AND iOS are ridiculously easy to build, let me show you how!

# Download Flutter SDK

Install VSCode

Not Pi

add path

![Flutter Tool](https://lupyuen.github.io/images/flutter-doctor1.png)

# Install Flutter Tools

![Flutter Doctor](https://lupyuen.github.io/images/flutter-doctor2.png)

![Flutter Extension for VSCode](https://lupyuen.github.io/images/flutter-vscode.png)

Connect Phone

![Connect phone to USB port](https://lupyuen.github.io/images/flutter-usb.jpg)

![Flutter Doctor After Fixes](https://lupyuen.github.io/images/flutter-doctor3.png)

```bash
flutter -v devices
```

```
List of devices attached
99031FFG device usb:3376X product:coral model:Pixel_4_XL device:coral
Pixel 4 XL • 99031FFG • android-arm64 • Android 10 (API 29)
```

# Download Source Code for Flutter App

https://github.com/pauldemarco/flutter_blue/tree/master/example

```bash
git clone https://github.com/lupyuen/flutter-blue-sample
```

Get Packages


# Debug Flutter App

Connect Phone

![Flutter Device in VSCode](https://lupyuen.github.io/images/flutter-device.png)

![Start Debugging in VSCode](https://lupyuen.github.io/images/flutter-debug1.png)

![Select Debugger in VSCode](https://lupyuen.github.io/images/flutter-debug2.png)

![Scanning for Bluetooth LE devices](https://lupyuen.github.io/images/flutter-scan.png)

![Flutter App with VSCode Debugger](https://lupyuen.github.io/images/flutter-debug.png)

[_Larger image_](https://lupyuen.github.io/images/flutter-debug.png)

Left to right

https://code.visualstudio.com/docs/editor/debugging

- [Watch on YouTube](https://youtu.be/QSrg9DgLwjk)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.1/flutter-debug.mov)

![PineTime Smart Watch](https://lupyuen.github.io/images/micropython-title.jpg)

_PineTime Smart Watch_

# Bluetooth LE Services

- [Watch on YouTube](https://youtu.be/pt-BYs_7qOE)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.1/flutter-pinetime-rotated.mp4)

![Bluetooth LE Services on PineTime Smart Watch](https://lupyuen.github.io/images/flutter-services.png)

nRF Connect

# Bluetooth LE Code

Declarative UI

BLE code

https://github.com/lupyuen/flutter-blue-sample/blob/master/lib/main.dart#L67-L153

```dart
//  Widget for finding devices
class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Title screen
      appBar: AppBar(
        title: Text('Find Devices'),
      ),

      body: RefreshIndicator(
        //  Scan scanning for Bluetooth LE devices
        onRefresh: () =>
            FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)),

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
                        //  For each Bluetooth LE device found, add a ScanResultTile widget
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

https://github.com/lupyuen/flutter-blue-sample/blob/master/lib/widgets.dart#L8-L121

```dart
//  Widget for displaying a Bluetooth LE device
class ScanResultTile extends StatelessWidget {
  ...
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()),
      trailing: RaisedButton(
        child: Text('CONNECT'),
        color: Colors.black,
        textColor: Colors.white,
        onPressed: (result.advertisementData.connectable) ? onTap : null,
      ),
      children: <Widget>[
        //  Display the device's name, signal strength, manufacturer data, service UUIDs and service data
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

# What's Next?

Companion App

# Further Reading

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Configure Mynewt for SPI Flash on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/spiflash)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
