# Convert Go to Flutter and Dart for PineTime Companion App

Can we take a __single code base__... And turn it into a mobile app for __Android, iOS and Linux phones__ (like PinePhone)?

And code it in a __modern programming language__ with __Garbage Collection__... Without the scary C pointers?

And talk __Bluetooth Low Energy__ to other gadgets... Like [__PineTime Smart Watch__](https://wiki.pine64.org/index.php/PineTime)?

__Yes we can!__ Based on the quick experiment described in this article.

Read on to learn how we are building the [Flutter Companion App](https://github.com/lupyuen/pinetime-companion) for PineTime Smart Watch... By converting the Go code (on Linux) to Flutter + Dart (on Android and iOS), line by line. (It's actually not that hard!)

The code is not 100% identical, but it will save the PineTime FOSS Community a lot of effort in maintaining the Android, iOS and Linux versions of the PineTime Companion App.

I'll explain how this Linux Command Line App in Go...

![Newt Manager showing response from PineTime Smart Watch](https://lupyuen.github.io/images/companion-newtmgr.png)

_(Which will eventually be dressed up with [`gotk3`](https://github.com/gotk3/gotk3), the GTK3 library for Go)_

...Was converted line by line to this Flutter app for Android and iOS...

![Flutter Companion App showing response from PineTime Smart Watch](https://lupyuen.github.io/images/companion-response.png)

_(The highlighted part shows the identical responses returned by PineTime to both apps over Bluetooth LE. So it really works!)_

![Flutter Companion App on a real Android phone, connected to PineTime Smart Watch](https://lupyuen.github.io/images/companion-title.png)

# Dive Deep into Newt Manager in Go

TODO

Go tracing tools

# Go vs Dart Coding

TODO

# Convert Go to Dart line by line

TODO

"Static Duck Typing"

https://benhoyt.com/writings/go-intro/

https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/nmp.go

```go
const NMP_HDR_SIZE = 8

/// SMP Header
type NmpHdr struct {
	Op    uint8  //  3 bits of opcode
	Flags uint8
	Len   uint16
	Group uint16
	Seq   uint8
	Id    uint8
}

/// Return this SMP Header as a list of bytes
func (hdr *NmpHdr) Bytes() []byte {
	buf := make([]byte, 0, NMP_HDR_SIZE)

	buf = append(buf, byte(hdr.Op))
	buf = append(buf, byte(hdr.Flags))

	u16b := make([]byte, 2)
	binary.BigEndian.PutUint16(u16b, hdr.Len)
	buf = append(buf, u16b...)

	binary.BigEndian.PutUint16(u16b, hdr.Group)
	buf = append(buf, u16b...)

	buf = append(buf, byte(hdr.Seq))
	buf = append(buf, byte(hdr.Id))

	return buf
}
```

https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart

```dart
const NMP_HDR_SIZE = 8;

/// SMP Header
class NmpHdr {
  int Op;    //  uint8: 3 bits of opcode
  int Flags; //  uint8
  int Len;   //  uint16
  int Group; //  uint16
  int Seq;   //  uint8
  int Id;    //  uint8
  
  /// Construct an SMP Header
  NmpHdr(
    this.Op,    //  uint8: 3 bits of opcode
    this.Flags, //  uint8
    this.Len,   //  uint16
    this.Group, //  uint16
    this.Seq,   //  uint8
    this.Id     //  uint8
  );
  
  /// Return this SMP Header as a list of bytes
  typed.Uint8Buffer Bytes() {
    var buf = typed.Uint8Buffer();
    
    buf.add(this.Op);
    buf.add(this.Flags);

    typed.Uint8Buffer u16b = binaryBigEndianPutUint16(this.Len);
    buf.addAll(u16b);

    u16b = binaryBigEndianPutUint16(this.Group);
    buf.addAll(u16b);

    buf.add(this.Seq);
    buf.add(this.Id);
    assert(buf.length == NMP_HDR_SIZE);

    return buf;
  }  
}
```

# CBOR Encoding in Dart

TODO

# Embed Dart modules in Flutter

TODO

https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter

# Transmit GATT Requests in Flutter

TODO

# Handle GATT Responses and Notifications in Flutter

TODO

# Dart Extension for VSCode

TODO

# Install Dart on Raspberry Pi and Pinebook Pro

TODO

# What's Next

TODO

I'll be using the code in this article to create the open source __PineTime Companion App__ for Android and iOS. So that we can flash our PineTime Smart Watches wirelessly, sync the date and time, show notifications, chart our heart rate, ...

Flutter makes it really easy to maintain a single code base for Android and iOS... And `flutter_blue` makes Bluetooth LE coding so simple!

If you're keen to help out, come chat with the PineTime FOSS Community (and me) in the PineTime Chatroom!

[PineTime Chatroom on Matrix / Discord / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Further Reading

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
