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

Device Widget is a __Stateful Widget__ that has some interesting code inside: [`widgets/device.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/widgets/device.dart)

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

_Why do we need `createState()` in the Device Widget_

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

The above [__Bloc Widget Builder__](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/BlocConsumer/builder.html) (exposed by [`BlocConsumer<DeviceBloc, DeviceState>`](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/BlocConsumer-class.html)) takes the updated `Device` Data Model from the new State, and creates a new the Device Summary Widget...

![Rebuilding the Device Summary Widget on state updates](https://lupyuen.github.io/images/bloc-builder.png)

This explains why the Device Widget is Stateful while the Device Summary Widget (and Device Firmware Widget) is Stateless... Because Device Widget will replace the Device Summary Widget when there are updates.

_How do we trigger the `DeviceLoadSuccess` State?_

This State is triggered when we have loaded the device info from PineTime over Bluetooth LE.

That's how widgets get updated in Bloc: The widget listens for State updates and rebuilds itself with a [Bloc Widget Builder](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/BlocConsumer/builder.html).  

We'll see in a while how new States are generated in Bloc.

_(The code in this article was derived from the excellent [Weather App Tutorial from the Bloc Library](https://bloclibrary.dev/#/flutterweathertutorial))_

# PineTime Data Model

TODO

[`lib/models/device.dart`](https://github.com/lupyuen/pinetime-companion/blob/bloc/lib/models/device.dart)

```dart
class Device extends Equatable {
  final BluetoothDevice bluetoothDevice;
  final String activeFirmwareVersion;
  final String standbyFirmwareVersion;

  const Device({
    this.bluetoothDevice,
    this.activeFirmwareVersion,
    this.standbyFirmwareVersion
  });

  @override
  List<Object> get props => [
    bluetoothDevice,
    activeFirmwareVersion,
    standbyFirmwareVersion
  ];
}
```

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

# Send Bluetooth LE Request to PineTime

TODO

# Handle Bluetooth LE Response from PineTime

TODO

# Decode CBOR Response from PineTime

TODO

# Build and Run App

TODO

# Debug Log

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
