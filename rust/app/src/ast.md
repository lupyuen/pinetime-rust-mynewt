# Auto Convert Go to Dart with an Abstract Syntax Tree

![Work-in-progress PineTime Companion App on iPhone, converted from Go to Flutter and Dart](https://lupyuen.github.io/images/bloc-ios.jpg)

_Work-in-progress PineTime Companion App on iPhone, converted from Go to Flutter and Dart_

# Why Auto Convert Go to Dart?

TODO

Both languages were created at Google, yet so different

Minimise errors in conversion

Huge volume of code

Consistency of conversion

Easy cross reference

# Manual Conversion Gets Tiring

TODO

Semicolons

Name Type -> Type Name

# Auto Convert Go Struct to Dart

TODO

https://github.com/lupyuen/mynewt-newtmgr/blob/ast/dart/convert.go

# Auto Convert Go Function to Dart

TODO

# Test Auto Conversion

TODO

```
> Executing task: /usr/local/go/bin/go run dart/convert.go <

//  Go Code...

package main

type ImageUploadReq struct {
        NmpBase  `codec:"-"`
        ImageNum uint8  `codec:"image"`
        Off      uint32 `codec:"off"`
        Len      uint32 `codec:"len,omitempty"`
        DataSha  []byte `codec:"sha,omitempty"`
        Upgrade  bool   `codec:"upgrade,omitempty"`
        Data     []byte `codec:"data"`
}

func NewImageUploadReq() *ImageUploadReq {
        r := &ImageUploadReq{}
        fillNmpReq(r, NMP_OP_WRITE, NMP_GROUP_IMAGE, NMP_ID_IMAGE_UPLOAD)
        return r
}

//  Converted To Dart...

class ImageUploadReq 
  with NmpBase       //  Get and set SMP Message Header
  implements NmpReq  //  SMP Request Message
{
  int ImageNum; //  image: uint8
  int Off;      //  off: uint32
  int Len;      //  len: uint32
  typed.Uint8Buffer DataSha;    //  sha: []byte
  bool Upgrade; //  upgrade: bool
  typed.Uint8Buffer Data;       //  data: []byte

  NmpMsg Msg() { return MsgFromReq(this); }

  /// Encode the SMP Request fields to CBOR
  void Encode(cbor.MapBuilder builder) {
    builder.writeString("image");
    builder.writeInt(ImageNum); // uint8
    builder.writeString("off");
    builder.writeInt(Off);      // uint32
    builder.writeString("len");
    builder.writeInt(Len);      // uint32
    builder.writeString("sha");
    builder.writeArray(DataSha);        // []byte
    builder.writeString("upgrade");
    builder.writeBool(Upgrade); // bool
    builder.writeString("data");
    builder.writeArray(Data);   // []byte
  }
}

ImageUploadReq NewImageUploadReq() {
  var r = ImageUploadReq();
  fillNmpReq(r, NMP_OP_WRITE, NMP_GROUP_IMAGE, NMP_ID_IMAGE_UPLOAD);
  return r;
}
```

# What's Next

The code in this article is part of the upcoming open source [__PineTime Companion App__](https://github.com/lupyuen/pinetime-companion) for Android and iOS. So that we can update the firmware on our PineTime Smart Watches wirelessly, sync the date and time, show notifications from our phone, chart our heart rate, ... Maybe even control our smart home gadgets! 

We'll be doing lots more coding...

1. __Handle Other PineTime Commands:__ Update firmware, sync date and time, show mobile notifications, control smart home gadgets (via IFTTT and MQTT), ...

    We shall do this by taking the [Newt Manager](https://github.com/apache/mynewt-newtmgr) code in Go and converting it to Flutter and Dart, as explained here...

    _["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_

1. __Companion App for Linux Phones (like PinePhone):__ We shall take the [Newt Manager](https://github.com/apache/mynewt-newtmgr) code in Go and wrap it into a GTK3 app, using the [`gotk3` library](https://github.com/gotk3/gotk3)...

    _["Your First GTK App with Go and VSCodium"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)_

1. __PineTime Firmware Support:__ Today our PineTime Companion App talks to Mynewt and Zephyr operating systems on PineTime. We hope to implement the same Bluetooth LE protocol (Simple Management Protocol) on other operating systems, so that they may also enjoy wireless firmware updates...

    _["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_Why are we maintaining two code bases: Flutter (for Android and iOS) and Go (for Linux phones)?_

Because Flutter is probably the best way to build mobile apps... But it's not officially supported for Linux phones.  The `flutter_blue` plugin doesn't support Linux either.  

So we need to stick with Go for Linux phones.

We're now exploring [__`go-flutter`__](https://github.com/go-flutter-desktop/go-flutter) for porting the Flutter App to Linux. And recode `flutter_blue` via FFI to a Linux Bluetooth LE library (in Go or C).

_(Maybe someday when Flutter is officially supported on Linux phones, we can scrap the Go version!)_

If you're keen to help out with the PineTime Companion App (or anything else in PineTime), __come chat with the PineTime FOSS Community (and me) in the PineTime Chatroom!__

[PineTime Chatroom on Matrix / Discord / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Further Reading

_["Flutter State Management with Bloc for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/bloc)_

_["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

_["Your First GTK App with Go and VSCodium"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/gotk3)_

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
