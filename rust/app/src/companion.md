# Convert Go to Flutter and Dart for PineTime Companion App

![Convert Go to Flutter and Dart for PineTime Companion App](https://lupyuen.github.io/images/companion-title.png)

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

# Go vs Dart Coding

Let's learn to convert this chunk of Go code from [`nmxact/nmp/nmp.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/nmp.go#L36-L45)...

```go
//  In Go...
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

...To Dart: [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L27-L67)

```dart
//  In Dart...
const NMP_HDR_SIZE = 8;

/// SMP Header
class NmpHdr {
  int Op;    //  Previously uint8
  int Flags; //  Previously uint8
  int Len;   //  Previously uint16
  int Group; //  Previously uint16
  int Seq;   //  Previously uint8
  int Id;    //  Previously uint8
  
  /// Construct an SMP Header
  NmpHdr(
    this.Op,
    this.Flags,
    this.Len,
    this.Group,
    this.Seq,
    this.Id
  );
  
  /// Return this SMP Header as a list of bytes
  typed.Uint8Buffer Bytes() {  //  Previously returns []byte
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

_How shall we begin the code conversion from Go to Dart?_

1. __Add the trailing semicolons (`;`)__

   Semicolons are optional in Go, but mandatory in Dart. So every line in Dart needs to terminate with a semicolon. Hence this code in Go...

   ```go
   //  In Go...
   const NMP_HDR_SIZE = 8
   ```

   Becomes this code in Dart...

   ```dart
   //  In Dart...
   const NMP_HDR_SIZE = 8;
   ```

1. __Flip the names and types of variables__

   Go puts the variable name before the type name... Dart does it the other way around. Hence this code in Go...

   ```go
   //  In Go...
   Op uint8
   ```

   Becomes this code in Dart...

   ```dart
   //  In Dart...
   int Op;
   ```

1. Dart doesn't have specific numeric types like `uint8` (unsigned 8-bit integer). So we use `int` to represent a byte.

    We write assertions in Dart to make sure that the `int` values are indeed bytes...

    ```dart
    //  In Dart...
    assert(val >= 0 && val <= 255);  //  val must be a byte
    ```

1. We rewrite Go byte arrays `[]byte` as the Dart type `typed.Uint8Buffer` (from the helper library [`typed_data`](https://pub.dev/packages/typed_data))...

    ```go
    //  In Go...
    //  Bytes() is a function that returns a byte array
    func (hdr *NmpHdr) Bytes() []byte {
    ```

    Becomes this...

    ```dart
    //  In Dart...
    //  Bytes() is a function that returns a byte array
    typed.Uint8Buffer Bytes() {
    ```

Read on for more conversion steps.

# Convert Go Structs, Methods and Interfaces to Dart

These language overview docs are very helpful when converting Go to Dart...

1. [_"An intro to Go for non-Go developers"_](https://benhoyt.com/writings/go-intro/)

1. [_"A tour of the Dart language"_](https://dart.dev/guides/language/language-tour)

I'm new to Dart and it looks like a mix of Java and JavaScript. But like Go (and unlike JavaScript), Dart is Static Typed with Type Inference, which simplifies the code conversion.

## Go Structs Become Dart Classes

We rewrite a Go `struct` as a Dart `class`...

```go
//  In Go...
type NmpHdr struct {
  Op uint8
  ...
}
```

Becomes this...

```dart
//  In Dart...
class NmpHdr {
  int Op;
  ...
}
```

## Move Methods Inside Classes

We move Go methods inside Dart classes...

```go
//  In Go...
type NmpHdr struct {
  Op uint8
  ...
}

//  Bytes() method for NmpHdr
func (hdr *NmpHdr) Bytes() []byte { ...
```

Becomes this...

```dart
//  In Dart...
class NmpHdr {
  int Op;
  ...
  //  Bytes() method for NmpHdr
  typed.Uint8Buffer Bytes() { ...
}
```

## Add Dart Constructors

Go has implicit constructors for `structs`. We'll have to add Dart constructors like this...

```dart
//  In Dart...
class NmpHdr {
  int Op;

  //  Constructor for NmpHdr
  NmpHdr(
    this.Op
  );
}
```

`NmpHdr` is the common Message Header that we'll be transmit to PineTime (and receive from PineTime) for all our Bluetooth LE messages.

## Go Interfaces Become Dart Abstract Classes

We rewrite a Go `interface` ([`nmxact/nmp/nmp.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/nmp.go#L53-L59))...

```go
//  In Go...
type NmpReq interface {
  Hdr() *NmpHdr
  SetHdr(hdr *NmpHdr)
```

...As a Dart `abstract class` ([`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L78-L86))

```dart
//  In Dart...
abstract class NmpReq {
  NmpHdr Hdr();
  void SetHdr(NmpHdr hdr);
```

`NmpReq` is the abstract base class for Request Messages that we'll be transmitting to PineTime over Bluetooth LE.

# But Some Go Structs Become Dart Mixins

TODO

[`nmxact/nmp/nmp.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/nmp.go#L67-L79)

```go
/// In Go...
/// SMP Base Message
type NmpBase struct {
  hdr NmpHdr `codec:"-"`
}

/// Get the SMP Message Header
func (b *NmpBase) Hdr() *NmpHdr {
  return &b.hdr
}

/// Set the SMP Message Header
func (b *NmpBase) SetHdr(h *NmpHdr) {
  b.hdr = *h
}
```

[`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L95-L107)

```dart
/// In Dart...
/// SMP Base Message
mixin NmpBase {
  NmpHdr hdr;  //  Will not be encoded: `codec:"-"`
  
  /// Get the SMP Message Header
  NmpHdr Hdr() {
    return hdr;
  }
  
  /// Set the SMP Message Header
  void SetHdr(NmpHdr h) {
    hdr = h;
  }
}
```

[`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L345-L377)

```dart
/// In Dart...
/// SMP Request Message to Read Image State
class ImageStateReadReq 
  with NmpBase       //  Mixin to get and set SMP Message Header
  implements NmpReq  //  Interface for SMP Request Message  
{
  NmpBase base;      //  Will not be encoded in CBOR. Previously `codec:"-"`

  /// Get the SMP Request Message
  NmpMsg Msg() { return MsgFromReq(this); }

  /// Encode the SMP Request fields to CBOR
  void Encode(cbor.MapBuilder builder) {
      //  Encode an empty body
  }
}
```

"Static Duck Typing"

https://benhoyt.com/writings/go-intro/

Interfaces are a little different from those in other languages like Java, where you have to say class MyThing implements ThatInterface explicitly. In Go, if you define all of an interface’s methods on a type, the type implicitly implements that interface, and you can use it wherever the interface is called for – no implements keyword in sight.

Go’s approach has often been called “static duck typing”, and it’s a form of structural typing (TypeScript is another popular language that uses structural typing).

# Convert Go to Dart line by line

TODO

make

append

# CBOR Encoding in Dart

TODO

Attributes

# Dive Deep into Newt Manager in Go

TODO

Go tracing tools

# Embed Dart modules in Flutter

TODO

https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter

https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart

https://gist.github.com/lupyuen/1354b090a989a818b403685ecfa12d55

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
