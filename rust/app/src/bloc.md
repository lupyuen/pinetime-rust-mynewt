# Flutter State Management with Bloc for PineTime Companion App

![PineTime Smart Watch with PineTime Companion App](https://lupyuen.github.io/images/bloc-title.jpg)

# Why Manage State

# Bluetooth Low Energy Callbacks

# Decode CBOR

# Build and Run App

# Debug Log

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

# Further Reading

_["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

_["Your First GTK App with Go and VSCodium"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)_

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
