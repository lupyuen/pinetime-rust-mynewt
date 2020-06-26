# Flutter State Management with Bloc for PineTime Companion App

![PineTime Companion App running on an Android phone, fetching the firmware versions from PineTime Smart Watch wirelessly](https://lupyuen.github.io/images/bloc-title.jpg)

_PineTime Companion App running on an Android phone, fetching the firmware versions from PineTime Smart Watch wirelessly_

[__Flutter is awesome__](https://flutter.dev/) for creating mobile apps for Android and iOS... The programming language is modern [__(Dart)__](https://dart.dev/), the debugging tools are excellent [__(VSCode and Dart DevTools)__](https://flutter.dev/docs/development/tools/vs-code).

That's why we have selected Flutter for creating the open source __[Android and iOS Companion App](https://github.com/lupyuen/pinetime-companion/tree/bloc)__ for __[PineTime Smart Watch](https://lupyuen.github.io/pinetime-rust-mynewt/articles/pinetime)__: For updating firmware, syncing date/time, pushing mobile notifications, controlling our smart home gadgets, ... and so much more!

In the previous article _["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_ we have built a technically functional (but barely human) app that sends Bluetooth Low Energy commands to PineTime. 

Today we'll recode the app so that it's more human-friendly, like this...

- [Watch on YouTube](https://youtu.be/VUYqcD8VGzE)

- [Download the video](https://github.com/lupyuen/pinetime-companion/releases/download/v1.0.0/companion-version.mp4)

Read on to learn how we do this with the __[Bloc Library for State Management](https://bloclibrary.dev/)__...

# Why Manage State?

_It's easy to build a mobile app for Android and iOS with Flutter... What could go wrong?_

A mobile app is a simple thing... It just reacts to our tapping and updates the display...

![Mobile app reacts to our tapping and updates the display](https://lupyuen.github.io/images/bloc-state1.png)

_Is it really so simple?_

Nope! Behind the scenes, the app could be calling some REST API on the web. Or talking to Bluetooth gadgets like PineTime...

![Mobile app calls REST API and talks to Bluetooth gadgets](https://lupyuen.github.io/images/bloc-state2.png)

_What happens when the app loses track of its state?_

Things can become really complicated...

![Mobile app gets complicated](https://lupyuen.github.io/images/bloc-state3.png)

There's a good way to handle this messy state in Flutter apps... __[Bloc Library for State Management](https://bloclibrary.dev/)__! 

Read on to learn how.

_(If you're familiar with React Redux: Yep Bloc sounds a lot like React Redux, because they are both State Management Frameworks)_

# Flutter Widgets for PineTime

Our PineTime Companion App calls the __[Bloc Library](https://bloclibrary.dev/)__ to connect our Flutter Widgets with our application data and processing logic. 

Let's look at three Flutter Widgets that we have created for the app...

1. __Device Firmware Widget (Stateless):__ Shows firmware version numbers

1. __Device Summary Widget (Stateless):__ Summarises the PineTime info

1. __Device Widget (Stateful):__ The entire PineTime Companion screen

We'll learn why the widgets are Stateless / Stateful in a while.

## Device Firmware Widget

Our Flutter App talks to PineTime over Bluetooth LE (Low Energy) to fetch the firmware version numbers and display them. Here's how it looks...

![Device Firmware Widget](https://lupyuen.github.io/images/bloc-widgets1.png)

_(PineTime contains two firmware images: Active and Standby. If the Active Firmware fails to start, PineTime rolls back to the Standby Firmware)_

The __Device Firmware Widget__ that displays the firmware version numbers is really simple: [`widgets/device_firmware.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/widgets/device_firmware.dart)

```dart
/// Widget to display firmware versions fetched from PineTime
class DeviceFirmware extends StatelessWidget {
  final String activeFirmwareVersion;   //  Version number of firmware that's running on PineTime (e.g. '1.0.0')
  final String standbyFirmwareVersion;  //  Version number of firmware that's in external flash memory (e.g. '1.1.0')

  /// Construct the widget with the active and standby firmware version numbers
  DeviceFirmware({
    Key key,
    this.activeFirmwareVersion,
    this.standbyFirmwareVersion
  }) : super(key: key);

  /// Render the widget UI with two lines of text
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Show active firmware version number
        Text(
          'Active Firmware: $activeFirmwareVersion',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        //  Show standby firmware version number
        Text(
          'Standby Firmware: $standbyFirmwareVersion',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
```

`DeviceFirmware` contains two fields `activeFirmwareVersion` and `standbyFirmwareVersion`, that store the version numbers of the Active and Standby Firmware on PineTime.

`DeviceFirmware` is a [__Stateless Widget__](https://flutter.dev/docs/development/ui/interactive) because its State (`activeFirmwareVersion` and `standbyFirmwareVersion`) doesn't change.

_What happens if PineTime gets updated with new firmware?_

Our Flutter App shall create a new instance of `DeviceFirmware` with new values for `activeFirmwareVersion` and `standbyFirmwareVersion`.

That's why the Device Firmware widget will never change its State... Though the widget may get replaced altogether.

## Device Summary Widget

The Device Firmware widget we've seen is wrapped into a __Device Summary Widget__ like this...

![Device Summary Widget](https://lupyuen.github.io/images/bloc-widgets2.png)

`DeviceSummary` is defined in [`widgets/device_summary.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/widgets/device_summary.dart)...

```dart
/// Widget to display PineTime summary
class DeviceSummary extends StatelessWidget {
  /// Data Model that contains PineTime info and Bluetooth device
  final model.Device device;

  /// Render the PineTime summary
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...,
        //  Construct a DeviceFirmware Widget to show the firmware versions
        DeviceFirmware(
          activeFirmwareVersion: device.activeFirmwareVersion,
          standbyFirmwareVersion: device.standbyFirmwareVersion,
        )
```

_What's with the Data Model named `Device`?_

```dart
/// Data Model that contains PineTime info and Bluetooth device
final model.Device device;
```

To render the Device Summary, this widget needs to know everything about our PineTime gadget... That's why the widget keeps a copy of the PineTime info inside the __Data Model__ named `Device`.

Note that the Device Summary Widget passes two fields from the `Device` Data Model to the Device Firmware Widget: `activeFirmwareVersion` and `standbyFirmwareVersion`.

`DeviceSummary` is another __Stateless Widget__ that doesn't change its State (i.e. the `Device` Data Model). If the device info changes, our app creates a new `DeviceSummary` widget to replace the old one.

The Data Model is a core concept in the Bloc Library. More about this later.

## Device Widget

The Device Summary Widget above is wrapped into a __Device Widget__ that renders the entire screen...

![Device Widget](https://lupyuen.github.io/images/bloc-widgets3.png)

Device Widget is a [__Stateful Widget__]((https://flutter.dev/docs/development/ui/interactive)) that has some interesting code inside: [`widgets/device.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/widgets/device.dart)

```dart
/// Widget for the PineTime Companion screen
class Device extends StatefulWidget {
  /// Construct the Stateful Widget with an initial state
  @override
  State<Device> createState() => _DeviceState();
}

/// Implement the Stateful Widget for the PineTime Companion screen
class _DeviceState extends State<Device> {
  /// Render the PineTime Companion screen
  @override
  Widget build(BuildContext context) {
    //  Render the screen with Button Bar above, followed by the Body
    return Scaffold(
      //  Button Bar for the screen (omitted)
      appBar: ...,

      //  Body for the screen
      body: 
        ...
        //  Construct a BlocConsumer to listen for updates to the state and rebuild the widget
        BlocConsumer<DeviceBloc, DeviceState>(
          //  Listen for updates to the state
          listener: ...,

          //  Rebuild the widget when the state has been updated
          builder: (context, state) {
            //  When we have loaded the device info...
            if (state is DeviceLoadSuccess) {...
              //  Get the device info from the new state
              final device = state.device;

              //  Construct the Device Summary with the device info
              return 
                ...
                DeviceSummary(
                  device: device,
                ),
                ...
```

_Why do we need `createState()` in the Device Widget?_

Device Widget is a [__Stateful Widget__](https://flutter.dev/docs/development/ui/interactive), so it needs to be created with an initial state, like this...

```dart
/// Widget for the PineTime Companion screen
class Device extends StatefulWidget {
  /// Construct the Stateful Widget with an initial state
  @override
  State<Device> createState() => _DeviceState();
```

_Why is the Device Widget Stateful, unlike the other Widgets?_

Because the Device Widget will magically transform itself when something happens!

The code below says that the Device Widget will rebuild its Device Summary Widget when the State has changed to `DeviceLoadSuccess`...

```dart
//  Rebuild the widget when we receive an event
builder: (context, state) {
  //  When we have loaded the device info...
  if (state is DeviceLoadSuccess) {...
    //  Get the device info from the new state
    final device = state.device;

    //  Construct the Device Summary with the device info
    return 
      ...
      DeviceSummary(
        device: device,
      ),
```

The above [__Bloc Widget Builder__](https://bloclibrary.dev/#/flutterbloccoreconcepts?id=blocbuilder) (exposed by [`BlocConsumer`](https://bloclibrary.dev/#/flutterbloccoreconcepts?id=blocconsumer)) takes the updated `Device` Data Model from the new State, and creates a new Device Summary Widget...

![Rebuilding the Device Summary Widget on state updates](https://lupyuen.github.io/images/bloc-builder.png)

This explains why the Device Widget is Stateful while the Device Summary Widget (and Device Firmware Widget) is Stateless... Because Device Widget will replace the Device Summary Widget when there are updates.

_How do we trigger the `DeviceLoadSuccess` State?_

This State is triggered when we have loaded the device info from PineTime over Bluetooth LE.

That's how widgets get updated in Bloc: The widget listens for State updates and rebuilds itself with a [Bloc Widget Builder](https://bloclibrary.dev/#/flutterbloccoreconcepts?id=blocbuilder).  

We'll see in a while how the `DeviceLoadSuccess` State is generated in Bloc.

_(The code in this article was derived from the excellent [Weather App Tutorial from the Bloc Library](https://bloclibrary.dev/#/flutterweathertutorial))_

# PineTime Data Model

The __Data Model__ is important in Bloc apps... It gets passed to widgets for rendering the user interface. 

Let's look at the Data Model for our PineTime Device, as defined in [`lib/models/device.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/models/device.dart)...

```dart
import 'package:equatable/equatable.dart';        //  Object Equality Helper from https://pub.dev/packages/equatable
import 'package:flutter_blue/flutter_blue.dart';  //  Bluetooth LE API from https://github.com/pauldemarco/flutter_blue

/// Data Model for PineTime Device
class Device extends Equatable {
  final BluetoothDevice bluetoothDevice;  //  Bluetooth device for connecting to PineTime
  final String activeFirmwareVersion;     //  Version number of firmware that's running on PineTime (e.g. '1.0.0')
  final String standbyFirmwareVersion;    //  Version number of firmware that's in external flash memory (e.g. '1.1.0')

  /// Constructor for PineTime Device
  const Device({
    this.bluetoothDevice,
    this.activeFirmwareVersion,
    this.standbyFirmwareVersion
  });

  /// Return the properties of PineTime Device
  @override
  List<Object> get props => [
    bluetoothDevice,
    activeFirmwareVersion,
    standbyFirmwareVersion
  ];
}
```

The `Device` Data Model for PineTime contains two fields `activeFirmwareVersion` and `standbyFirmwareVersion`, that store the version numbers of the Active and Standby Firmware on PineTime. 

The two fields are rendered by the Device Firmware Widget that we have seen earlier.

_What's `BluetoothDevice`?_

That's the Bluetooth Device returned by the [`flutter_blue` library for Bluetooth LE networking](https://github.com/pauldemarco/flutter_blue).

In a while we'll see how our Flutter App stores `BluetoothDevice` into the `Device` Data Model. And how our app calls `BluetoothDevice` to send Bluetooth LE requests to PineTime.

To recap, the `Device` Data Model contains everything we know about PineTime, and provides the means to access PineTime (through `BluetoothDevice`).

_Why does `Device` inherit from the `Equatable` class?_

[`Equatable`](https://pub.dev/packages/equatable) is a helper library that lets us compare two objects for equality.

Two `Device` Data Models are deemed equivalent if the fields have identical values. This checking for equality is required by Bloc.

Let's find how out `BluetoothDevice` is used to fetch `activeFirmwareVersion` and `standbyFirmwareVersion` from PineTime.

# Send Bluetooth LE Request to PineTime

Sending a Bluetooth LE command to PineTime is remarkably simple, straightforward, top to bottom... Thanks to Dart's support for [__Asynchronous Programming__](https://dart.dev/codelabs/async-await)!

Here are the steps...

1. __Connect to PineTime__ over Bluetooth LE

1. __Discover the GATT Services__ exposed by PineTime

1. __Find the right GATT Characteristic__ exposed by PineTime

1. __Transmit a Write Request__ to the GATT Characteristic

1. __Receive the response__ via a GATT Notification

1. __Decode the CBOR__ response

![Sending a Bluetooth LE command to PineTime](https://lupyuen.github.io/images/bloc-bluetooth.png)

## Connect to PineTime

Let's start by connecting to PineTime over Bluetooth LE: [`repositories/device_api_client.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/repositories/device_api_client.dart)

```dart
class DeviceApiClient {
  /// Connect to the PineTime device and query the firmare inside
  Future<Device> fetchDevice(BluetoothDevice bluetoothDevice) async {
    //  Connect to PineTime
    await bluetoothDevice.connect();
    ...
```

`DeviceApiClient` is the [__Data Repository__](https://bloclibrary.dev/#/architecture?id=repository) class that we expose to our Flutter App for sending Bluetooth LE commands to PineTime.

_(Yes the name `DeviceApiClient` is rather odd... It shall be renamed!)_

`fetchDevice()` is the method that sends the Bluetooth LE command to query PineTime's firmware images.

The method returns a `Device` Data Model that contains the Active and Standby Firmware version numbers.

`bluetoothDevice` is the Bluetooth interface returned by the [`flutter_blue` library for Bluetooth LE networking](https://github.com/pauldemarco/flutter_blue). (More about this later)

_Why do we use `await` when connecting to PineTime?_

```dart
  //  Connect to PineTime
  await bluetoothDevice.connect();
```

Connecting to PineTime over Bluetooth LE may take a while... And we should wait for it to complete before proceeding.

But we can't let the rest of the app freeze while waiting... What if the human taps the `Cancel` button!

`await` is exactly what we need. It waits for the `connect()` method to complete before proceeding to the next step... While keeping the user interface responsive!

That's the beauty of [__Asynchronous Programming__](https://dart.dev/codelabs/async-await) in Dart... No more Deeply Nested Callbacks and Promises! (Yep React Native gets really messy because of this)

_Why is the `fetchDevice()` method declared `async`?_

```dart
  /// Connect to the PineTime device and query the firmare inside
  Future<Device> fetchDevice(BluetoothDevice bluetoothDevice) async {
```

To use `await` we need two things...

1. Declare the method as `async` (like above)

1. Instead of returning a plain `Device` object, the method now returns a `Future<Device>` (like above)

Later we'll see that we may simply return a `Device` object as `Future<Device>`...

```dart
  //  Construct a Device object
  final device = Device( ... );
  //  Return it as Future<Device>
  return device;
```

Let's move on to discover GATT Services and Characteristics exposed by PineTime.

## Discover GATT Services

[In the previous article](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion) we learnt about the [__Simple Management Protocol__](https://github.com/apache/mynewt-mcumgr) that's exposed by PineTime for querying and updating firmware. We'll be sending the Query Firmware Command to PineTime through this protocol.

The Simple Management Protocol is implemented over Bluetooth LE as a [GATT Service](https://learn.adafruit.com/introduction-to-bluetooth-low-energy/gatt). Thus to query the firmware on PineTime, we need to discover the GATT Services exposed by PineTime: [`repositories/device_api_client.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/repositories/device_api_client.dart)

```dart
//  Discover the services on PineTime
List<BluetoothService> services = await bluetoothDevice.discoverServices();
```

`discoverServices()` talks to PineTine over Bluetooth LE and returns a list of GATT Services exposed by PineTime.

We use `await` to discover GATT Services, so that the app won't freeze while waiting for the Bluetooth LE response.

The GATT Service for Simple Management Protocol has a UUID (unique ID) of `8D53DC1D-1DB7-4CD3-868B-8A527460AA84`...

```dart
//  Look for Simple Mgmt Protocol Service
for (BluetoothService service in services) {
  if (!listEquals(
    service.uuid.toByteArray(), 
    [0x8d,0x53,0xdc,0x1d,0x1d,0xb7,0x4c,0xd3,0x86,0x8b,0x8a,0x52,0x74,0x60,0xaa,0x84]
  )) { continue; }
```

That's how we hunt for the GATT Service.

## Find GATT Characteristic

Next we hunt for the GATT Characteristic (within the GATT Service) for Simple Management Protocol.

To transmit a command to PineTime, we shall write a request message ([in CBOR format](https://en.wikipedia.org/wiki/CBOR)) to the GATT Characteristic.

Here's how we find the GATT Characteristic `DA2E7828-FBCE-4E01-AE9E-261174997C48` for the Simple Management Protocol: [`repositories/device_api_client.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/repositories/device_api_client.dart)

```dart
//  Look for Simple Mgmt Protocol Characteristic
var smpCharac;
var characteristics = service.characteristics;
for (BluetoothCharacteristic charac in characteristics) {
  if (!listEquals(
    charac.uuid.toByteArray(),
    [0xda,0x2e,0x78,0x28,0xfb,0xce,0x4e,0x01,0xae,0x9e,0x26,0x11,0x74,0x99,0x7c,0x48]
  )) { continue; }

  //  Found the characteristic
  smpCharac = charac;
  break;
}
```

If we can't find the GATT Service or the GATT Characteristic, we throw an exception...

```dart
//  If Simple Mgmt Protocol Service or Characteristic not found...
if (smpCharac == null) {
  bluetoothDevice.disconnect();
  throw new Exception('Device doesn\'t support Simple Management Protocol. You may need to flash a suitable firmware.');
}
```

## Write to GATT Characteristic

Now that we have the GATT Characteristic for the Simple Management Protocol, let's talk to the characteristic to send PineTime our Query Firmware Command.

First we compose a request message in CBOR (that includes an 8-byte header): [`repositories/device_api_client.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/repositories/device_api_client.dart)

```dart
//  Compose the Query Firmware request (Simple Mgmt Protocol)
final request = composeRequest();
```

`composeRequest()` has been documented [in our previous article](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion).  It sets `request` to a byte buffer that contains our request message for the Query Firmware Command...

```
00 00 00 01 00 01 3f 00 a0
```

_(8 bytes for the SMP Message Header, 1 byte for the CBOR Message Body, total 9 bytes)_

To transmit the request message to PineTime, we write to the GATT Characteristic for the Simple Management Protocol...

```dart
//  Transmit the Query Firmware request by writing to the SMP charactertistic
await smpCharac.write(request, withoutResponse: true);
```

Again we use `await` so that the app won't freeze while waiting for the writing to complete.

`withoutResponse` is set to `true` because we don't expect a synchronous response from the GATT Write operation... Instead we expect the response to be delivered via a GATT Notification. (More about this later)

Yay we have completed 67% of the work needed to send a Bluetooth LE command to PineTime!

Let's move on to receive the Bluetooth LE response from PineTime and decode the response.

![Handle Bluetooth LE Response from PineTime](https://lupyuen.github.io/images/bloc-bluetooth2.png)

# Handle Bluetooth LE Response from PineTime

Our story thus far...

1. We have connected to PineTime over Bluetooth LE

1. We have discovered the GATT Service for the Simple Management Protocol

1. We have located the GATT Characteristic for the Simple Management Protocol

1. We have transmitted our Query Firmware Request Message to PineTime... By writing the message to the GATT Characteristic

Now let's get the Query Firmware Response from PineTime in a special way...

_Will PineTime return the response immediately after writing to the GATT Characteristic?_

_Will PineTime let us read the response from the GATT Characteristic?_

Surprisingly, no and no! 

PineTime delivers the response via a __GATT Notification__. (Somewhat similar to Push Notifications on Android and iOS)

The response is __Asynchronous.__ Which is probably good for PineTime because it gives PineTime's Firmware more time to prepare and deliver the response. (Remember: PineTime isn't as powerful as a mobile phone)

First we subscribe to GATT Notifications like this: [`repositories/device_api_client.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/repositories/device_api_client.dart)

```dart
class DeviceApiClient {
  /// Connect to the PineTime device and query the firmare inside
  Future<Device> fetchDevice(BluetoothDevice bluetoothDevice) async {
    //  Omitted: Transmit the Query Firmware request by writing to the SMP charactertistic
    ...
    //  Subscribe to GATT Notifications from PineTime
    await smpCharac.setNotifyValue(true);
```

`setNotifyValue(true)` tells PineTime that we would like to receive GATT Notifications from our GATT Characteristic (the one from Simple Management Protocol).

```dart
    //  Create a completer to wait for response from PineTime
    final completer = Completer<typed.Uint8Buffer>();
    //  Create a byte buffer for the response
    final response = typed.Uint8Buffer();
```

Next we create a `Completer` and a byte buffer to hold the response.

_What's a `Completer`?_

It's something that we may `await` while waiting for our response to be received.

_(If you're familiar with JavaScript: A `Completer` is equivalent to a `Promise`)_

_Why can't we just `await` the response without a `Completer`?_

The Bluetooth LE API is somewhat quirky: To receive response bytes we need to use a __Callback Function__ like this...

```dart
    //  Receive response bytes, chunk by chunk
    smpCharac.value.listen((value) {
      //  Add the chunk to our response buffer
      response.addAll(value);

      //  Get the expected message length
      if (response.length < 4) { return; }           //  Length field not available
      final len = (response[2] << 8) + response[3];  //  Length field in bytes 2 and 3
      final responseLength = len + 8;  //  Response includes 8 bytes for header

      //  If the received response length is already the expected response length, mark response as complete
      if (response.length >= responseLength && !completer.isCompleted) {
        completer.complete(response);
      }
    });
```

The code in the above Callback Function will be called every time our Flutter App receives a chunk of GATT Notification bytes (`value`) from PineTime.  We append each chunk to our response buffer.

When we have received the final chunk of response bytes, we call `Completer.complete()` like this...

```dart
    completer.complete(response);
```

This signals to `await` that the response is complete...

```dart
    //  Wait for the completer to finish receiving the entire response
    final response2 = await completer.future;
```

And that's how `await` and `Completer` work together to simplify Callback Functions!

_(If you're familiar with JavaScript: `Completer.complete()` is equivalent to `Promise.resolve()`)_

_How will we know when we have received the final chunk of response bytes?_

Earlier we saw this code for handling the response bytes...

```dart
    //  Get the expected message length
    if (response.length < 4) { return; }           //  Length field not available
    final len = (response[2] << 8) + response[3];  //  Length field in bytes 2 and 3
    final responseLength = len + 8;  //  Response includes 8 bytes for header
```

The response message length is stored in bytes 2 and 3 of the response message.

That's how we know when there are no more bytes to be received, and trigger `Completer.complete()`.

![Decode CBOR Response from PineTime](https://lupyuen.github.io/images/bloc-bluetooth3.png)

# Decode CBOR Response from PineTime

Finally we come to the last piece of the puzzle... How `BluetoothDevice` is used to fetch `activeFirmwareVersion` and `standbyFirmwareVersion` from PineTime.

Earlier we have obtained a byte buffer `response2` that contains the response bytes: 
[`repositories/device_api_client.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/repositories/device_api_client.dart)

```dart
class DeviceApiClient {
  /// Connect to the PineTime device and query the firmare inside
  Future<Device> fetchDevice(BluetoothDevice bluetoothDevice) async {
    //  Omitted: Transmit request to PineTime over Bluetooth LE
    ...
    //  Wait for the completer to finish receiving the entire response
    final response2 = await completer.future;
```

Before decoding `response2`, let's disconnect the Bluetooth LE connection to PineTime (and conserve battery power)...

```dart
    //  Disconnect the PineTime device
    bluetoothDevice.disconnect();
```

_What's inside `response2`?_

`response2` contains...

- __Response Message Header:__ 8 bytes, followed by...

- __Response Message Body:__ 244 bytes, encoded in [CBOR](https://en.wikipedia.org/wiki/CBOR)

It looks like this...

```
00000000  01 00 00 f4 00 01 3f 00  bf 66 69 6d 61 67 65 73  |.........fimages|
00000010  9f bf 64 73 6c 6f 74 00  67 76 65 72 73 69 6f 6e  |..dslot.gversion|
00000020  65 31 2e 30 2e 30 64 68  61 73 68 58 20 ea bc 3a  |e1.0.0dhashX ..:|
00000030  ce 74 a8 28 4c 6f 78 c2  bc ad 3a e1 8d 39 26 75  |.t.(Lox...:..9&u|
00000040  c7 66 c5 1f 95 23 0f 13  39 3f 08 1c 5d 68 62 6f  |.f...#..9?..]hbo|
00000050  6f 74 61 62 6c 65 f5 67  70 65 6e 64 69 6e 67 f4  |otable.gpending.|
00000060  69 63 6f 6e 66 69 72 6d  65 64 f5 66 61 63 74 69  |iconfirmed.facti|
00000070  76 65 f5 69 70 65 72 6d  61 6e 65 6e 74 f4 ff bf  |ve.ipermanent...|
00000080  64 73 6c 6f 74 01 67 76  65 72 73 69 6f 6e 65 31  |dslot.gversione1|
00000090  2e 31 2e 30 64 68 61 73  68 58 20 0d 78 49 f7 fe  |.1.0dhashX .xI..|
000000a0  43 92 7a 87 d7 b4 d5 54  f8 43 08 82 33 d8 02 d5  |C.z....T.C..3...|
000000b0  09 0c 20 da a1 e6 a7 77  72 99 6e 68 62 6f 6f 74  |.. ....wr.nhboot|
000000c0  61 62 6c 65 f5 67 70 65  6e 64 69 6e 67 f4 69 63  |able.gpending.ic|
000000d0  6f 6e 66 69 72 6d 65 64  f4 66 61 63 74 69 76 65  |onfirmed.factive|
000000e0  f4 69 70 65 72 6d 61 6e  65 6e 74 f4 ff ff 6b 73  |.ipermanent...ks|
000000f0  70 6c 69 74 53 74 61 74  75 73 00 ff              |plitStatus..| 
```

_What's in the Response Message Header?_

Let's decode the first 8 bytes above according to the Simple Management Protocol message header definition in [`mynewt-mcumgr/mgmt.h`](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h)...

| Header Field | Value | Description
| :--- | :--- | :--- 
| `Op`    | `01`    | [Operation Code](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h#L33-L37) (1 for Read Response)
| `Flags` | `00`    | Unused
| `Len`   | `00 f4` | Length of Message Body (244 bytes)
| `Group` | `00 01` | [Group ID](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h#L39-L53) (1 for Image Management)
| `Seq`   | `3f` | Message Sequence Number (should match the request message)
| `Id`    | `00` | Message ID (0 for Image Listing)

Yep, this confirms that we have received a response to our Query Firmware (Image Listing) Command.

_What's all the mumbo jumbo in the Response Message Body?_

The Response Message Body is encoded in [CBOR](https://en.wikipedia.org/wiki/CBOR), a compact binary form of JSON.

We decode the message body like this...

```dart
    //  Extract the CBOR message body
    final body = typed.Uint8Buffer();
    body.addAll(response2.sublist(8));  //  Remove the 8-byte header

    //  Decode the CBOR message body
    final decodedBody = decodeCBOR(body);
```

`decodeCBOR()` calls the [CBOR Library](https://pub.dev/packages/cbor) to decode the CBOR data into JSON...

```dart
/// Decode the CBOR message body
List<dynamic> decodeCBOR(typed.Uint8Buffer payload) {
  //  Get our CBOR instance. Always do this, it correctly initialises the decoder.
  final inst = cbor.Cbor();

  //  Decode from the buffer
  inst.decodeFromBuffer(payload);
  return inst.getDecodedData();
}
```

The decoded JSON in `decodedBody` looks like this...

```json
{
    "images": [
        {
            "slot": 0,
            "version": "1.0.0",
            "hash": [
                234,188,58,206,116,168,40,76,111,120,194,188,173,58,225,141,57,38,117,199,102,197,31,149,35,15,19,57,63,8,28,93
            ],
            "bootable": true,
            "pending": false,
            "confirmed": true,
            "active": true,
            "permanent": false
        },
        {
            "slot": 1,
            "version": "1.1.0",
            "hash": [
                13,120,73,247,254,67,146,122,135,215,180,213,84,248,67,8,130,51,216,2,213,9,12,32,218,161,230,167,119,114,153,110
            ],
            "bootable": true,
            "pending": false,
            "confirmed": false,
            "active": false,
            "permanent": false
        }
    ],
    "splitStatus": 0
}
```

_Is PineTime telling us what it's hiding?_

Yes, our PineTime is keeping two firmware images...

1. __Active Firmware:__ Version 1.0.0 (Slot 0, in Internal Flash ROM)

1. __Standby Firmware:__ Version 1.1.0 (Slot 1, in External SPI Flash)

Remember that PineTime always boots from the Active Firmware Image. The Standby Firmware Image is used when updating or rolling back the firmware.

The hash values of the firmware images will be used later when we update the PineTime firmware.

_How shall we extract the Active and Standby Firmware Versions from the JSON?_

By accessing the Dynamic List like this...

```dart
    //  Get the list of firmware images
    final images = decodedBody[0]['images'] as List<dynamic>;

    //  Construct the Device Data Model with the firmware versions
    final device = Device(
      bluetoothDevice:        bluetoothDevice,
      activeFirmwareVersion:  (images.length >= 1) ? images[0]['version'] : '',
      standbyFirmwareVersion: (images.length >= 2) ? images[1]['version'] : '',
    );

    //  Return the Device Data Model
    return device;
```

And that's how we fetch the the Active and Standby Firmware Versions to construct the `Device` Data Model!

# State Transitions

TODO

DeviceInitial (DeviceRequested) -> DeviceLoadInProgress

DeviceLoadInProgress (DeviceRequested) -> DeviceLoadSuccess

??? ThemeState (DeviceChanged) -> ThemeState

[`widgets/device.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/widgets/device.dart)

```dart
class Device extends StatefulWidget {
  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ...,
      body: 
        ...
        BlocConsumer<DeviceBloc, DeviceState>(

          listener: (context, state) {
            if (state is DeviceLoadSuccess) {
              BlocProvider
                .of<ThemeBloc>(context)
                .add(
                  DeviceChanged(
                    condition: state.device.condition
                  ),
              );
              ...
            }
            ...
```

Transitions:

```
I/flutter (20366): onEvent DeviceRequested
I/flutter (20366): Fetching device...
I/flutter (20366): onTransition Transition { currentState: DeviceInitial, event: DeviceRequested, nextState: DeviceLoadInProgress }
...(Transmit Bluetooth LE Request to PineTime)...
...(Receive Bluetooth LE Response from PineTime)...
I/flutter (20366): onTransition Transition { currentState: DeviceLoadInProgress, event: DeviceRequested, nextState: DeviceLoadSuccess }
I/flutter (20366): onEvent DeviceChanged
I/flutter (20366): onTransition Transition { currentState: ThemeState, event: DeviceChanged, nextState: ThemeState }
```

AppBar: [`widgets/device.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/widgets/device.dart)

```dart
class Device extends StatefulWidget {
  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ...
          IconButton(
            icon: Icon(Icons.search),

            onPressed: () async {
              final device = await Navigator.push(
                context,
                MaterialPageRoute(
                  //  Browse Bluetooth LE devices
                  builder: (context) => FindDevice(),
                ),
              );

              if (device != null) {
                BlocProvider
                  .of<DeviceBloc>(context)
                  .add(
                    DeviceRequested(
                      device: device
                    )
                  );
              }
```


[`blocs/device_bloc.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/blocs/device_bloc.dart)

```dart
class DeviceRequested extends DeviceEvent {
  final BluetoothDevice device;

  const DeviceRequested({@required this.device}) : assert(device != null);

  @override
  List<Object> get props => [device];
}
```

DeviceRequested -> DeviceLoadSuccess

[`blocs/device_bloc.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/blocs/device_bloc.dart)

```dart
class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final DeviceRepository deviceRepository;

  DeviceBloc({@required this.deviceRepository})
      : assert(deviceRepository != null);

  @override
  DeviceState get initialState => DeviceInitial();

  @override
  Stream<DeviceState> mapEventToState(DeviceEvent event) async* {
    if (event is DeviceRequested) {
      yield* _mapDeviceRequestedToState(event);
    } else if (event is DeviceRefreshRequested) {
      yield* _mapDeviceRefreshRequestedToState(event);
    }
  }

  Stream<DeviceState> _mapDeviceRequestedToState(
    DeviceRequested event,
  ) async* {
    yield DeviceLoadInProgress();
    try {
      final Device device = await deviceRepository.getDevice(event.device);
      yield DeviceLoadSuccess(device: device);
    } catch (_) {
      yield DeviceLoadFailure();
    }
  }
```

# Build and Run App

TODO

![PineTime Companion App on iPhone](https://lupyuen.github.io/images/bloc-ios.jpg)

_PineTime Companion App on iPhone_

# Android Log

TODO 

```
Launching lib/main.dart on Pixel 4 XL in debug mode...
✓ Built build/app/outputs/apk/debug/app-debug.apk.
I/FlutterBluePlugin(20366): setup
Connecting to VM Service at ws://127.0.0.1:56153/XI6AjAwoNUM=/ws
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->copyMemory(JJJ)V (greylist, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->getByte(J)B (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->getByte(Ljava/lang/Object;J)B (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->getLong(J)J (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->putByte(JB)V (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->putByte(Ljava/lang/Object;JB)V (greylist,core-platform-api, linking, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/er_blue_exampl(20366): Accessing hidden method Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J (greylist,core-platform-api, reflection, allowed)
W/er_blue_exampl(20366): Accessing hidden field Ljava/nio/Buffer;->address:J (greylist, reflection, allowed)
D/FlutterBluePlugin(20366): mDevices size: 0
D/FlutterBluePlugin(20366): mDevices size: 0
D/BluetoothAdapter(20366): isLeEnabled(): ON
D/BluetoothLeScanner(20366): onScannerRegistered() - status=0 scannerId=8 mScannerId=0
D/FlutterBluePlugin(20366): mDevices size: 0
I/flutter (20366): onEvent DeviceRequested
I/flutter (20366): Fetching device...
I/flutter (20366): onTransition Transition { currentState: DeviceInitial, event: DeviceRequested, nextState: DeviceLoadInProgress }
D/BluetoothGatt(20366): connect() - device: E8:C1:1A:12:BA:89, auto: true
D/BluetoothGatt(20366): registerApp()
D/BluetoothGatt(20366): registerApp() - UUID=e0c4eada-3709-4f5c-80c4-2d39b4cc0309
D/BluetoothGatt(20366): onClientRegistered() - status=0 clientIf=9
D/FlutterBluePlugin(20366): mDevices size: 1
D/BluetoothGatt(20366): onClientConnectionState() - status=0 clientIf=9 device=E8:C1:1A:12:BA:89
D/FlutterBluePlugin(20366): [onConnectionStateChange] status: 0 newState: 2
I/flutter (20366): Device: BluetoothDevice{id: E8:C1:1A:12:BA:89, name: pinetime, type: BluetoothDeviceType.le, isDiscoveringServices: false, _services: []
D/BluetoothGatt(20366): discoverServices() - device: E8:C1:1A:12:BA:89
D/BluetoothAdapter(20366): isLeEnabled(): ON
D/BluetoothGatt(20366): onConnectionUpdated() - Device=E8:C1:1A:12:BA:89 interval=6 latency=0 timeout=500 status=0
D/BluetoothGatt(20366): onSearchComplete() = Device=E8:C1:1A:12:BA:89 Status=0
D/FlutterBluePlugin(20366): [onServicesDiscovered] count: 6 status: 0
D/BluetoothGatt(20366): setCharacteristicNotification() - uuid: da2e7828-fbce-4e01-ae9e-261174997c48 enable: true
D/FlutterBluePlugin(20366): [onDescriptorWrite] uuid: 00002902-0000-1000-8000-00805f9b34fb status: 0
I/flutter (20366): Encoded {NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:1 Seq:63 Id:0}}} {} to:
I/flutter (20366): a0
I/flutter (20366): Encoded:
I/flutter (20366): 00 00 00 01 00 01 3f 00 a0
I/flutter (20366): Notify:
D/BluetoothGatt(20366): onConnectionUpdated() - Device=E8:C1:1A:12:BA:89 interval=36 latency=0 timeout=500 status=0
D/FlutterBluePlugin(20366): [onCharacteristicWrite] uuid: da2e7828-fbce-4e01-ae9e-261174997c48 status: 0
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/chatty  (20366): uid=10302(com.pauldemarco.flutter_blue_example) Binder:20366_2 identical 2 lines
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/flutter (20366): Notify: 01 00 00 f4 00 01 3f 00 bf 66 69 6d 61 67 65 73 9f bf 64 73
I/flutter (20366): Notify: 6c 6f 74 00 67 76 65 72 73 69 6f 6e 65 31 2e 30 2e 30 64 68
I/flutter (20366): Notify: 61 73 68 58 20 ea bc 3a ce 74 a8 28 4c 6f 78 c2 bc ad 3a e1
I/flutter (20366): Notify: 8d 39 26 75 c7 66 c5 1f 95 23 0f 13 39 3f 08 1c 5d 68 62 6f
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/flutter (20366): Notify: 6f 74 61 62 6c 65 f5 67 70 65 6e 64 69 6e 67 f4 69 63 6f 6e
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/chatty  (20366): uid=10302(com.pauldemarco.flutter_blue_example) Binder:20366_2 identical 2 lines
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/flutter (20366): Notify: 66 69 72 6d 65 64 f5 66 61 63 74 69 76 65 f5 69 70 65 72 6d
I/flutter (20366): Notify: 61 6e 65 6e 74 f4 ff bf 64 73 6c 6f 74 01 67 76 65 72 73 69
I/flutter (20366): Notify: 6f 6e 65 31 2e 31 2e 30 64 68 61 73 68 58 20 0d 78 49 f7 fe
I/flutter (20366): Notify: 43 92 7a 87 d7 b4 d5 54 f8 43 08 82 33 d8 02 d5 09 0c 20 da
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/chatty  (20366): uid=10302(com.pauldemarco.flutter_blue_example) Binder:20366_2 identical 1 line
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/flutter (20366): Notify: a1 e6 a7 77 72 99 6e 68 62 6f 6f 74 61 62 6c 65 f5 67 70 65
I/flutter (20366): Notify: 6e 64 69 6e 67 f4 69 63 6f 6e 66 69 72 6d 65 64 f4 66 61 63
I/flutter (20366): Notify: 74 69 76 65 f4 69 70 65 72 6d 61 6e 65 6e 74 f4 ff ff 6b 73
D/FlutterBluePlugin(20366): [onCharacteristicChanged] uuid: da2e7828-fbce-4e01-ae9e-261174997c48
I/flutter (20366): Notify: 70 6c 69 74 53 74 61 74 75 73 00 ff
I/flutter (20366): Response Length: 252 vs 252
D/BluetoothGatt(20366): cancelOpen() - device: E8:C1:1A:12:BA:89
D/BluetoothGatt(20366): onClientConnectionState() - status=0 clientIf=9 device=E8:C1:1A:12:BA:89
D/FlutterBluePlugin(20366): [onConnectionStateChange] status: 0 newState: 0
D/BluetoothGatt(20366): close()
D/BluetoothGatt(20366): unregisterApp() - mClientIf=9
I/flutter (20366): Decoded CBOR:
I/flutter (20366): Entry 0   : Value is => {images: [{slot: 0, version: 1.0.0, hash: [234, 188, 58, 206, 116, 168, 40, 76, 111, 120, 194, 188, 173, 58, 225, 141, 57, 38, 117, 199, 102, 197, 31, 149, 35, 15, 19, 57, 63, 8, 28, 93], bootable: true, pending: false, confirmed: true, active: true, permanent: false}, {slot: 1, version: 1.1.0, hash: [13, 120, 73, 247, 254, 67, 146, 122, 135, 215, 180, 213, 84, 248, 67, 8, 130, 51, 216, 2, 213, 9, 12, 32, 218, 161, 230, 167, 119, 114, 153, 110], bootable: true, pending: false, confirmed: false, active: false, permanent: false}], splitStatus: 0}
I/flutter (20366): {"images":[{"slot":0,"version":"1.0.0","hash":[234,188,58,206,116,168,40,76,111,120,194,188,173,58,225,141,57,38,117,199,102,197,31,149,35,15,19,57,63,8,28,93],"bootable":true,"pending":false,"confirmed":true,"active":true,"permanent":false},{"slot":1,"version":"1.1.0","hash":[13,120,73,247,254,67,146,122,135,215,180,213,84,248,67,8,130,51,216,2,213,9,12,32,218,161,230,167,119,114,153,110],"bootable":true,"pending":false,"confirmed":false,"active":false,"permanent":false}],"splitStatus":0}
I/flutter (20366): Decoded Response: [{images: [{slot: 0, version: 1.0.0, hash: [234, 188, 58, 206, 116, 168, 40, 76, 111, 120, 194, 188, 173, 58, 225, 141, 57, 38, 117, 199, 102, 197, 31, 149, 35, 15, 19, 57, 63, 8, 28, 93], bootable: true, pending: false, confirmed: true, active: true, permanent: false}, {slot: 1, version: 1.1.0, hash: [13, 120, 73, 247, 254, 67, 146, 122, 135, 215, 180, 213, 84, 248, 67, 8, 130, 51, 216, 2, 213, 9, 12, 32, 218, 161, 230, 167, 119, 114, 153, 110], bootable: true, pending: false, confirmed: false, active: false, permanent: false}], splitStatus: 0}]
I/flutter (20366): onTransition Transition { currentState: DeviceLoadInProgress, event: DeviceRequested, nextState: DeviceLoadSuccess }
I/flutter (20366): onEvent DeviceChanged
I/flutter (20366): onTransition Transition { currentState: ThemeState, event: DeviceChanged, nextState: ThemeState }
Application finished.
Exited (sigterm)
```

# iOS Log

TODO

```
Launching lib/main.dart on iPhone 6 Plus in debug mode...
Warning: Missing build name (CFBundleShortVersionString).
Warning: Missing build number (CFBundleVersion).
Action Required: You must set a build name and number in the pubspec.yaml file version field before submitting to the App Store.
Automatically signing iOS for device deployment using specified development team in Xcode project:
Running pod install...                                              3.0s
Xcode build done.                                           131.8s
Installing and launching...                                        24.7s
Connecting to VM Service at ws://localhost:1024/ws
getConnectedDevices periphs size: 0
getConnectedDevices periphs size: 0
flutter: onEvent DeviceRequested
flutter: Fetching device...
flutter: onTransition Transition { currentState: DeviceInitial, event: DeviceRequested, nextState: DeviceLoadInProgress }
didConnectPeripheral
flutter: Device: BluetoothDevice{id: CED8A589-7B65-508A-F6B6-F0B3EFE3DFFC, name: pinetime, type: BluetoothDeviceType.le, isDiscoveringServices: false, _services: []
didDiscoverServices
Found service: 1811
Found service: 180A
Found service: 8D53DC1D-1DB7-4CD3-868B-8A527460AA84
Found service: 59462F12-9543-9999-12C8-58B459A2712D
didDiscoverCharacteristicsForService
didDiscoverCharacteristicsForService
didDiscoverCharacteristicsForService
didDiscoverCharacteristicsForService
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
didDiscoverDescriptorsForCharacteristic
peripheral uuid:CED8A589-7B65-508A-F6B6-F0B3EFE3DFFC
service uuid:00001811-0000-1000-8000-00805f9b34fb
uuid: 00002a47-0000-1000-8000-00805f9b34fb value: (null)
uuid: 00002a46-0000-1000-8000-00805f9b34fb value: (null)
uuid: 00002a48-0000-1000-8000-00805f9b34fb value: (null)
uuid: 00002a45-0000-1000-8000-00805f9b34fb value: (null)
uuid: 00002a44-0000-1000-8000-00805f9b34fb value: (null)
peripheral uuid:CED8A589-7B65-508A-F6B6-F0B3EFE3DFFC
service uuid:0000180a-0000-1000-8000-00805f9b34fb
uuid: 00002a24-0000-1000-8000-00805f9b34fb value: (null)
uuid: 00002a26-0000-1000-8000-00805f9b34fb value: (null)
peripheral uuid:CED8A589-7B65-508A-F6B6-F0B3EFE3DFFC
service uuid:8d53dc1d-1db7-4cd3-868b-8a527460aa84
uuid: da2e7828-fbce-4e01-ae9e-261174997c48 value: (null)
peripheral uuid:CED8A589-7B65-508A-F6B6-F0B3EFE3DFFC
service uuid:59462f12-9543-9999-12c8-58b459a2712d
uuid: 5c3a659e-897e-45e1-b016-007107c96df6 value: (null)
uuid: 5c3a659e-897e-45e1-b016-007107c96df7 value: (null)
didUpdateNotificationStateForCharacteristic
uuid: da2e7828-fbce-4e01-ae9e-261174997c48 value: (null)
flutter: Encoded {NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:1 Seq:18 Id:0}}} {} to:
a0
flutter: Encoded:
00 00 00 01 00 01 12 00 a0
flutter: Notify:
didUpdateValueForCharacteristic CED8A589-7B65-508A-F6B6-F0B3EFE3DFFC
uuid: da2e7828-fbce-4e01-ae9e-261174997c48 value: <010000f4 00011200 bf66696d 61676573 9fbf6473 6c6f7400 67766572 73696f6e 65312e30 2e306468 61736858 20eabc3a ce74a828 4c6f78c2 bcad3ae1 8d392675 c766c51f 95230f13 393f081c 5d68626f 6f746162 6c65f567 70656e64 696e67f4 69636f6e 6669726d 6564f566 61637469 7665f569 7065726d 616e656e 74f4ffbf 64736c6f 74016776 65727369 6f6e6531 2e312e30 64686173 6858200d 7849f7fe 43927a87 d7b4d554 f8430882 33d802d5 090c20da a1e6>
uuid: da2e7828-fbce-4e01-ae9e-261174997c48 value: <010000f4 00011200 bf66696d 61676573 9fbf6473 6c6f7400 67766572 73696f6e 65312e30 2e306468 61736858 20eabc3a ce74a828 4c6f78c2 bcad3ae1 8d392675 c766c51f 95230f13 393f081c 5d68626f 6f746162 6c65f567 70656e64 696e67f4 69636f6e 6669726d 6564f566 61637469 7665f569 7065726d 616e656e 74f4ffbf 64736c6f 74016776 65727369 6f6e6531 2e312e30 64686173 6858200d 7849f7fe 43927a87 d7b4d554 f8430882 33d802d5 090c20da a1e6>
didUpdateValueForCharacteristic CED8A589-7B65-508A-F6B6-F0B3EFE3DFFC
uuid: da2e7828-fbce-4e01-ae9e-261174997c48 value: <a7777299 6e68626f 6f746162 6c65f567 70656e64 696e67f4 69636f6e 6669726d 6564f466 61637469 7665f469 7065726d 616e656e 74f4ffff 6b73706c 69745374 61747573 00ff>
uuid: da2e7828-fbce-4e01-ae9e-261174997c48 value: <a7777299 6e68626f 6f746162 6c65f567 70656e64 696e67f4 69636f6e 6669726d 6564f466 61637469 7665f469 7065726d 616e656e 74f4ffff 6b73706c 69745374 61747573 00ff>
flutter: Notify: 01 00 00 f4 00 01 12 00 bf 66 69 6d 61 67 65 73 9f bf 64 73 6c 6f 74 00 67 76 65 72 73 69 6f 6e 65 31 2e 30 2e 30 64 68 61 73 68 58 20 ea bc 3a ce 74 a8 28 4c 6f 78 c2 bc ad 3a e1 8d 39 26 75 c7 66 c5 1f 95 23 0f 13 39 3f 08 1c 5d 68 62 6f 6f 74 61 62 6c 65 f5 67 70 65 6e 64 69 6e 67 f4 69 63 6f 6e 66 69 72 6d 65 64 f5 66 61 63 74 69 76 65 f5 69 70 65 72 6d 61 6e 65 6e 74 f4 ff bf 64 73 6c 6f 74 01 67 76 65 72 73 69 6f 6e 65 31 2e 31 2e 30 64 68 61 73 68 58 20 0d 78 49 f7 fe 43 92 7a 87 d7 b4 d5 54 f8 43 08 82 33 d8 02 d5 09 0c 20 da a1 e6
flutter: Notify: a7 77 72 99 6e 68 62 6f 6f 74 61 62 6c 65 f5 67 70 65 6e 64 69 6e 67 f4 69 63 6f 6e 66 69 72 6d 65 64 f4 66 61 63 74 69 76 65 f4 69 70 65 72 6d 61 6e 65 6e 74 f4 ff ff 6b 73 70 6c 69 74 53 74 61 74 75 73 00 ff
flutter: Response Length: 252 vs 252
didDisconnectPeripheral
flutter: Decoded CBOR:
Entry 0   : Value is => {images: [{slot: 0, version: 1.0.0, hash: [234, 188, 58, 206, 116, 168, 40, 76, 111, 120, 194, 188, 173, 58, 225, 141, 57, 38, 117, 199, 102, 197, 31, 149, 35, 15, 19, 57, 63, 8, 28, 93], bootable: true, pending: false, confirmed: true, active: true, permanent: false}, {slot: 1, version: 1.1.0, hash: [13, 120, 73, 247, 254, 67, 146, 122, 135, 215, 180, 213, 84, 248, 67, 8, 130, 51, 216, 2, 213, 9, 12, 32, 218, 161, 230, 167, 119, 114, 153, 110], bootable: true, pending: false, confirmed: false, active: false, permanent: false}], splitStatus: 0}
flutter: {"images":[{"slot":0,"version":"1.0.0","hash":[234,188,58,206,116,168,40,76,111,120,194,188,173,58,225,141,57,38,117,199,102,197,31,149,35,15,19,57,63,8,28,93],"bootable":true,"pending":false,"confirmed":true,"active":true,"permanent":false},{"slot":1,"version":"1.1.0","hash":[13,120,73,247,254,67,146,122,135,215,180,213,84,248,67,8,130,51,216,2,213,9,12,32,218,161,230,167,119,114,153,110],"bootable":true,"pending":false,"confirmed":false,"active":false,"permanent":false}],"splitStatus":0}
flutter: Decoded Response: [{images: [{slot: 0, version: 1.0.0, hash: [234, 188, 58, 206, 116, 168, 40, 76, 111, 120, 194, 188, 173, 58, 225, 141, 57, 38, 117, 199, 102, 197, 31, 149, 35, 15, 19, 57, 63, 8, 28, 93], bootable: true, pending: false, confirmed: true, active: true, permanent: false}, {slot: 1, version: 1.1.0, hash: [13, 120, 73, 247, 254, 67, 146, 122, 135, 215, 180, 213, 84, 248, 67, 8, 130, 51, 216, 2, 213, 9, 12, 32, 218, 161, 230, 167, 119, 114, 153, 110], bootable: true, pending: false, confirmed: false, active: false, permanent: false}], splitStatus: 0}]
flutter: onTransition Transition { currentState: DeviceLoadInProgress, event: DeviceRequested, nextState: DeviceLoadSuccess }
flutter: onEvent DeviceChanged
flutter: onTransition Transition { currentState: ThemeState, event: DeviceChanged, nextState: ThemeState }
Lost connection to device.
Exited (sigterm)
```

# What's Next

TODO

The code in this article is part of the upcoming open source __PineTime Companion App__ for Android and iOS. So that we can flash our PineTime Smart Watches wirelessly, sync the date and time, show notifications from our phone, chart our heart rate, ... Maybe even control our smart home gadgets! 

We'll be adding more code to the Flutter app...

1. __Response Handling:__ We shall handle response messages received from PineTime over Bluetooth LE (i.e. handle the GATT Notifications)

1. __Handle Other PineTime Commands:__ Update firmware, sync date and time, show mobile notifications, ...

1. __Companion App for Linux Phones (like PinePhone):__ We shall take the [Newt Manager](https://github.com/apache/mynewt-newtmgr) code in Go and wrap it into a GTK3 app, using the [`gotk3` library](https://github.com/gotk3/gotk3)...

    _["Your First GTK App with Go and VSCodium"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)_

If you're keen to help out, come chat with the PineTime FOSS Community (and me) in the PineTime Chatroom!

[PineTime Chatroom on Matrix / Discord / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Further Reading

_["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

_["Your First GTK App with Go and VSCodium"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)_

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
