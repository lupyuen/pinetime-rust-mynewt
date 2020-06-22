# Flutter State Management with Bloc for PineTime Companion App

![PineTime Companion App running on an Android phone, fetching the firmware versions from PineTime Smart Watch wirelessly](https://lupyuen.github.io/images/bloc-title.jpg)

_PineTime Companion App running on an Android phone, fetching the firmware versions from PineTime Smart Watch wirelessly_

[__Flutter is awesome__](https://flutter.dev/) for creating mobile apps for Android and iOS... The programming language is modern [__(Dart)__](https://dart.dev/), the debugging tools are excellent [__(VSCode and Dart DevTools)__](https://flutter.dev/docs/development/tools/vs-code).

That's why we have selected Flutter for creating the __[Android and iOS Companion App](https://github.com/lupyuen/pinetime-companion/tree/bloc)__ for __[PineTime Smart Watch](https://wiki.pine64.org/index.php/PineTime)__: For updating firmware, syncing date/time, pushing mobile notifications, controlling your smart home gadgets, ... and so much more!

In the previous article _["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_ we have built a technical functional (barely human) app that sends Bluetooth Low Energy commands to PineTime. Today we'll recode the app so that it's more human-friendly.

Read on to learn how we do this with the __[Bloc Library for State Management](https://bloclibrary.dev/)__...

# Why Manage State?

_It's easy to build a mobile app for Android and iOS with Flutter... What could go wrong?_

There's a better way to handle this... State Management! Read on to learn how.

_(If you're familiar with React Redux: Yep Bloc sounds a lot like React Redux, because they are both State Management Frameworks)_

# Bluetooth Low Energy Callbacks

TODO

# Decode CBOR

TODO

# Build and Run App

TOD

device.dart

```dart
IconButton(
    icon: Icon(Icons.search),
    onPressed: () async {
        final device = await Navigator.push(
        context,
        MaterialPageRoute(
            //  TODO: Browse Bluetooth LE devices
            builder: (context) => FindDevice(),
        ),
        );
        if (device != null) {
        BlocProvider.of<DeviceBloc>(context)
            .add(DeviceRequested(device: device));
        }
    },
)
```

device_bloc.dart

```dart
class DeviceRequested extends DeviceEvent {
  final BluetoothDevice device;

  const DeviceRequested({@required this.device}) : assert(device != null);

  @override
  List<Object> get props => [device];
}
```

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

# Debug Log

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

The code in this article is part of the upcoming open source __PineTime Companion App__ for Android and iOS. So that we can flash our PineTime Smart Watches wirelessly, sync the date and time, show notifications from our phone, chart our heart rate, ... Maybe even control our smart home gadgets! 

We'll be adding more code to the Flutter app...

1. __Response Handling:__ We shall handle response messages received from PineTime over Bluetooth LE (i.e. handle the GATT Notifications)

1. __Handle Other PineTime Commands:__ Update firmware, sync date and time, show mobile notifications, ...

1. __State Management with Bloc Library:__ We shall integrate the [Bloc State Management Library](https://bloclibrary.dev/#/) to keep the Flutter code modular and maintainable

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
