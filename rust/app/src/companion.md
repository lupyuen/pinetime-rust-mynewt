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

Here'a the video demo...

- [Watch on YouTube](https://youtu.be/n396JA62NDk)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.3/companion-query-firmware.mov)

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
    //  Import the helper library for Byte Buffers: https://pub.dev/packages/typed_data
    import 'package:typed_data/typed_data.dart' as typed;

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

In some cases, a Go `struct` should be converted to a Dart `mixin`. Consider this Go `struct` defined in [`nmxact/nmp/nmp.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/nmp.go#L67-L79)...

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

`NmpBase` appears to be a base class for Request and Response Messages.

But if we look closely at the above code, `NmpBase` is actually a helper class for getting and setting the Message Header for Request and Response Messages.  

Helper classes are implemented in Dart as a [`mixin`](https://dart.dev/guides/language/language-tour#adding-features-to-a-class-mixins). Here's our `mixin` implementation of `NmpBase` in [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L95-L107)...

```dart
/// In Dart...
/// SMP Message Helper
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

We use our `NmpBase mixin` like this ([`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L345-L377))...

```dart
/// In Dart...
/// SMP Request Message to Read Image State
class ImageStateReadReq 
  with NmpBase       //  Mixin to get and set SMP Message Header
  implements NmpReq  //  Interface for SMP Request Message  
{
  /// Get the SMP Request Message
  NmpMsg Msg() { return MsgFromReq(this); }

  /// Encode the SMP Request Message fields to CBOR
  void Encode(cbor.MapBuilder builder) {
      //  Encode an empty body
  }
}
```

_How are the Dart message classes and mixins connected?_

Like this...

![Message Class and Mixin for PineTime Companion App](https://lupyuen.github.io/images/companion-class.png)

It looks complicated, and yes we need to understand the Go code before converting to Dart.

Go uses ["Static Duck Typing"](https://benhoyt.com/writings/go-intro/) thus it's not obvious whether a Go `struct` should be a Dart `class`, `abstract class` or `mixin`. But with a bit of practice... We'll get the hang of it!

# Convert Go Arrays to Dart

Let's convert this Go code that creates a byte array and appends some bytes: [`nmxact/nmp/nmp.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/nmp.go#L111-L115)

```go
//  In Go: Create a byte array with max size NMP_HDR_SIZE
buf := make([]byte, 0, NMP_HDR_SIZE)

//  Append bytes to the array
buf = append(buf, byte(hdr.Op))
buf = append(buf, byte(hdr.Flags))
```

In Dart we use `typed.Uint8Buffer` to represent a byte buffer. It works like a Dart List, so we may call `add()` to add bytes: [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L48-L66)

```dart
//  In Dart: Create a byte buffer
var buf = typed.Uint8Buffer();

//  Append bytes to the byte buffer
buf.add(this.Op);
buf.add(this.Flags);
...
//  Verify the buffer has size NMP_HDR_SIZE
assert(buf.length == NMP_HDR_SIZE);
```

To add a Dart List to another List, we call `addAll()`: [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L55-L57)

```dart
//  In Dart: Convert 16-bit length to a list of 2 bytes
typed.Uint8Buffer u16b = binaryBigEndianPutUint16(this.Len);

//  Append the 2 bytes to the byte buffer
buf.addAll(u16b);
```

![Newt Manager with over 100 Go source files](https://lupyuen.github.io/images/companion-newtmgrsize.png)

# Dive Deep into Go and Newt Manager

_The Go code in this article that connects to PineTime Smart Watch over Bluetooth LE... Where does it come from?_

The Go code comes from [__Newt Manager__](https://github.com/apache/mynewt-newtmgr), the Linux command line tool that updates PineTime's firmware over Bluetooth LE. Newt Manager implements the Simple Management Protocol for talking to PineTime's Firmware Update Service.

_Newt Manager has over a hundred Go source files... Which source files should we convert to Dart?_

[__Go Tracing__](https://blog.gopheracademy.com/advent-2017/go-execution-tracer/) can help! Let's enable Go Tracing like this: [`newtmgr.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr/newtmgr.go)

```go
import "runtime/trace"

func main() {
  trace.Start(os.Stderr)
  defer trace.Stop()
  ...
```

This tells the Go Tracing Library to dump the traces to Standard Error.

Here's how we run Newt Manager to transmit a command to PineTime (list firmware images) and capture the Go Tracing data...

```bash
# Install graphviz for Go tracing
sudo apt install graphviz

# Download Newt Manager
cd ~/go
mkdir -p src/mynewt.apache.org
cd src/mynewt.apache.org/
git clone https://github.com/lupyuen/mynewt-newtmgr
mv mynewt-newtmgr newtmgr

# TODO: Edit the source files to enable Go tracing

# Build Newt Manager
cd ~/go/src/mynewt.apache.org/newtmgr/newtmgr
export GO111MODULE=on
go build

# Run Newt Manager and add connection for PineTime
cd ~/go/src/mynewt.apache.org/newtmgr/newtmgr
sudo ./newtmgr conn add pinetime type=ble connstring="peer_name=pinetime" 2> /dev/null

# Run Newt Manager and list firmware images on PineTime
sudo ./newtmgr image list -c pinetime 2> trace.out

# Display the captured Go trace in a web browser
go tool trace trace.out
```

The Go Tracing web page appears, showing the following links...

```
  View trace
  Goroutine analysis
  Network blocking profile (⬇)
  Synchronization blocking profile (⬇)
  Syscall blocking profile (⬇)
  Scheduler latency profile (⬇)
  User-defined tasks
  User-defined regions
  Minimum mutator utilization
```

Click `Synchronization Blocking Profile` to show a [highly detailed graph of the Go function calls](https://lupyuen.github.io/images/companion-tracedelay.pdf)...

![Call Graph from Go Trace](https://lupyuen.github.io/images/companion-tracedelay.png)

[_PDF version_](https://lupyuen.github.io/images/companion-tracedelay.pdf)

Now we know which Go functions were called to list firmware images on PineTime... But soooo many functions!

Let's eliminate the Go modules `bll`, `ble` and the stuff underneath... These Bluetooth LE functions are already implemented in Dart by `flutter_blue`.

What's remaining is this `xact` trail of Go function calls...

![Call Graph highlighting the code to be converted](https://lupyuen.github.io/images/companion-tracedelay2.png)

That's why we chose to convert code like `ImageStateReadCmd` to Dart... Because it was called when Newt Manager connected to PineTime to query its firmware images.

Some functions (like `BodyBytes` below) may not appear in Go Tracing because they are invoked by Bluetooth callbacks. We may force them to appear in Go Tracing like this...

```go
import (
  "context"
  "runtime/trace"
  "time"
)

func BodyBytes(body interface{}) ([]byte, error) {
  _, task := trace.NewTask(
    context.Background(), 
    "nmxact/nmp/nmp.go/BodyBytes"
  )
  time.Sleep(100 * time.Millisecond)
  defer task.End()
  ...
```

In the Go Tracing web page, click `User-Defined Tasks` to see the traces...

![Go Trace for User Defined Tasks](https://lupyuen.github.io/images/companion-tracetasks.png)

_Why did we sleep 100 milliseconds during tracing?_

So that we can look at the call duration in the above chart... And figure out which Go function is calling which other function.

# CBOR Encoding in Dart

There's something odd about the Bluetooth LE messages that we transmit to (and receive from) PineTime...

```
00000000                           bf 66 69 6d 61 67 65 73  |        .fimages|
00000010  9f bf 64 73 6c 6f 74 00  67 76 65 72 73 69 6f 6e  |..dslot.gversion|
00000020  65 31 2e 30 2e 30 64 68  61 73 68 58 20 70 3e bb  |e1.0.0dhashX p>.|
00000030  f8 11 45 8b 1f ad 18 9e  64 e3 a5 e0 f8 09 cb e6  |..E.....d.......|
00000040  ba d8 83 c7 6b 3d d7 12  79 1c 82 2f b5 68 62 6f  |....k=..y../.hbo|
00000050  6f 74 61 62 6c 65 f5 67  70 65 6e 64 69 6e 67 f4  |otable.gpending.|
00000060  69 63 6f 6e 66 69 72 6d  65 64 f5 66 61 63 74 69  |iconfirmed.facti|
00000070  76 65 f5 69 70 65 72 6d  61 6e 65 6e 74 f4 ff ff  |ve.ipermanent...|
00000080  6b 73 70 6c 69 74 53 74  61 74 75 73 00 ff        |ksplitStatus..| 
```

_Why is there a mix of ASCII text and binary data in the message?_

That's because our Bluetooth LE messages are encoded in [__Concise Binary Object Representation (CBOR)__](https://en.wikipedia.org/wiki/CBOR)!

CBOR is like a compact binary form of JSON. The above chunk of data is equivalent to this human-readable JSON...

```json
{
    "images": [
        {
            "slot": 0,
            "version": "1.0.0",
            "hash": [ 112, 62, 187, 248, 17, 69, 139, 31, 173, 24, 158, 100, 227, 165, 224, 248, 9, 203, 230, 186, 216, 131, 199, 107, 61, 215, 18, 121, 28, 130, 47, 181 ],
            "bootable":  true,
            "pending":   false,
            "confirmed": true,
            "active":    true,
            "permanent": false
        }
    ],
    "splitStatus": 0
}
```

Comparing their sizes...

- __JSON__ is __264__ bytes
- __CBOR__ is __134__ bytes

CBOR is half the size of JSON! Wow!

In Newt Manager (the Go code that runs on Linux), we encode a Go  `struct` into CBOR like this: [`nmxact/nmp/nmp.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/nmp.go#L129-L144)

```go
//  In Go...
//  Import the codec library for CBOR Encoding and Decoding: https://godoc.org/github.com/ugorji/go/codec
import "github.com/ugorji/go/codec"
    
/// Encode SMP Request Body with CBOR and return the byte array
func BodyBytes(body interface{}) ([]byte, error) {
    data := make([]byte, 0)
    enc := codec.NewEncoderBytes(&data, new(codec.CborHandle))
    if err := enc.Encode(body); err != nil {
        return nil, fmt.Errorf("Failed to encode message %s", err.Error())
    }
    log.Debugf("Encoded %+v to:\n%s", body, hex.Dump(data))
    return data, nil
}
```

Here's the equivalent code in Dart that encodes our Dart `class` into a Bluetooth LE message: [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L141-L176)

```dart
//  In Dart...
//  Import the CBOR Encoder and Decoder library: https://pub.dev/packages/cbor
import 'package:cbor/cbor.dart' as cbor;

/// Encode SMP Request Body with CBOR and return the byte array
typed.Uint8Buffer BodyBytes(  //  Previously returns []byte
  NmpReq body                 //  Previously interface{}
) {
  //  Get our CBOR instance. Always do this, it correctly initialises the decoder.
  final inst = cbor.Cbor();

  //  Get our encoder and map builder
  final encoder = inst.encoder;
  final mapBuilder = cbor.MapBuilder.builder();

  //  Encode the body as a CBOR map
  body.Encode(mapBuilder);
  final mapData = mapBuilder.getData();
  encoder.addBuilderOutput(mapData);

  //  Get the encoded body
  final data = inst.output.getData();

  //  Decode the encoded body and pretty print it
  inst.decodeFromInput();
  final hdr = body.Hdr();
  print(
    "Encoded {NmpBase:{hdr:{"
    "Op:${ hdr.Op } "
    "Flags:${ hdr.Flags } "
    "Len:${ hdr.Len } "
    "Group:${ hdr.Group } "
    "Seq:${ hdr.Seq } "
    "Id:${ hdr.Id }}}} "
    "${ inst.decodedToJSON() } "
    "to:\n${ hexDump(data) }"
  );

  //  Return the encoded data
  return data;
}
```

Yep the Dart code for encoding CBOR looks longer than Go... And we're not done yet!

For each specific type of message, we need to write Dart code to __encode each field of the message__.

Here's the request message `ImageStateReadReq` that we'll be transmitting to PineTime (to query the firmware inside): [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L345-L376)

```dart
class ImageStateReadReq 
  with NmpBase       //  Get and set SMP Message Header
  implements NmpReq  //  SMP Request Message  
{
  //  No message fields needed

  /// Encode the SMP Request fields to CBOR
  void Encode(cbor.MapBuilder builder) {
    //  No message fields needed, so we encode an empty map: {}
  }
}
```

`ImageStateReadReq` doesn't have any message fields, so the `Encode()` method is empty.  The message is encoded as an empty map: `{}`

For other messages, the `Encode()` method will encode the message fields (key and value) like this...

```dart
builder.writeString('slot');  //  Key
builder.writeInt(0);          //  Integer Value

builder.writeString('version');  //  Key
builder.writeString('1.0.0');    //  String Value

builder.writeString('hash');  //  Key
builder.writeArray(<int>[112, 62, 187, 248, 17, 69, 139, 31, 173, 24, 158, 100, 227, 165, 224, 248, 9, 203, 230, 186, 216, 131, 199, 107, 61, 215, 18, 121, 28, 130, 47, 181]);  //  Byte Array Value
```

This field encoding code is missing from Go because the CBOR Encoder in Go uses Field Tags (like `codec:"slot"`). Check this for an example of CBOR field encoding in Go: [`nmxact/nmp/image.go`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/nmxact/nmp/image.go#L97-L108)

# Test Dart Code on Command Line

Now that we have the Dart code to create a CBOR request message for PineTime... Let's test it!

Dart makes testing really easy because Dart programs can be run from the command line.

First we add a `main()` function that creates a CBOR request message: [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L646-L661)

```dart
/// Our Dart program starts jere
void main() {
  //  Compose a CBOR request for PineTime
  composeRequest();
}

/// Compose a request to query firmware images on PineTime
typed.Uint8Buffer composeRequest() {
  //  Create the SMP Request
  final req = NewImageStateReadReq();

  //  Encode the SMP Message with CBOR
  final msg = req.Msg();
  final data = EncodeNmpPlain(msg);
  return data;
}
```

Add the dependent libraries to [`pubspec.yaml`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/pubspec.yaml)...

```yaml
name: newtmgr

dependencies:
  cbor:       ^3.2.0  #  CBOR Encoder and Decoder. From https://pub.dev/packages/cbor
  typed_data: ^1.1.6  #  Helpers for Byte Buffers. From https://pub.dev/packages/typed_data
```

Download the Dart SDK: [`dart.dev`](https://dart.dev/get-dart)

If we're using 32-bit ARMv7 (like Pinebook Pro or Raspberry Pi), browse to the [Dart SDK Archive](https://dart.dev/tools/sdk/archive) and download the __Linux ARMv7 Dart SDK__.

Unzip to `~/dartsdk`. Edit `~/.bashrc` (or equivalent) and add `dartsdk/bin` to `PATH`...

```bash
export PATH=$PATH:$HOME/dartsdk/bin
```

Compile and run our dart program...

```bash
pub get
dart newtmgr.dart 
```

We'll see this...

```
Encoded {NmpBase:{hdr:{Op:0 Flags:0 Len:0 Group:1 Seq:187 Id:0}}} {} to:
a0
Encoded:
00 00 00 01 00 01 bb 00 a0
```

_How did we get the 9 bytes `00` ... `a0` for our PineTime request message?_

`a0` is the CBOR Encoding for the empty Message Body `{}`. Yep CBOR needs only one byte to encode the two-byte JSON!

The preceding 8 bytes `00 00 00 01 00 01 bb 00` are the Message Header, defined in [`newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart#L29-L37)

```dart
/// SMP Message Header
class NmpHdr {
  int Op;    //  Previously int8, 3 bits of opcode
  int Flags; //  Previously uint8
  int Len;   //  Previously uint16
  int Group; //  Previously uint16
  int Seq;   //  Previously uint8
  int Id;    //  Previously uint8
```

According to the [Simple Managememt Protocol](https://github.com/apache/mynewt-mcumgr) definition from [`mgmt.h`](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h)...

| Header Field | Value | Description
| :--- | :--- | :--- 
| `Op`    | `00`    | [Operation Code](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h#L33-L37) (0 for Read Request)
| `Flags` | `00`    | Unused
| `Len`   | `00 01` | Length of Message Body
| `Group` | `00 01` | [Group ID](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h#L39-L53) (1 for Image Management)
| `Seq`   | `bb` | Message Sequence Number (first number is random, subsequent numbers are sequential)
| `Id`    | `00` | Message ID (0 for Image Listing)

Thus we have created a valid PineTime Request Message that will list the firmware images stored in PineTime.

In a while we'll integrate this tested Dart code into our Flutter mobile app for Android and iOS. And watch happens when we send this Request Message to PineTime over Bluetooth LE!

[More about Simple Management Protocol]((https://github.com/apache/mynewt-mcumgr))

[SMP Message Format](https://github.com/apache/mynewt-mcumgr/blob/master/smp/include/smp/smp.h)

For more about Dart and Flutter testing, check the [Dart Testing Guide](https://dart.dev/guides/testing)

# Add Dart Code to Flutter App

Let's add our new Dart code (for composing PineTime request messages) to the Bluetooth LE Flutter App from our previous article...

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

Here's the new repository for our integrated Flutter App:

[`github.com/lupyuen/pinetime-companion`](https://github.com/lupyuen/pinetime-companion)

We take the Dart code from [`mynewt-newtmgr/newtmgr.dart`](https://github.com/lupyuen/mynewt-newtmgr/blob/master/newtmgr.dart) and add it to the new repository at [`pinetime-companion//lib/newtmgr.dart`](https://github.com/lupyuen/pinetime-companion/blob/master/lib/newtmgr.dart)

Let's find the right spot to inject our new code, to compose a PineTime request message and transmit to PineTime: [`main.dart`](https://github.com/lupyuen/pinetime-companion/blob/master/lib/main.dart#L154-L197)

```dart
/// Screen that displays GATT Services and Characteristics for a Bluetooth LE device
class DeviceScreen extends StatelessWidget {
  ...
  /// Return a list of widgets that renders the GATT Services and Characteristics
  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        //  For each GATT Service...
        .map(
          //  Render the GATT Service
          (s) => ServiceTile(
            service: s,
            characteristicTiles: s.characteristics
              //  For each GATT Characteristic...
              .map(
                //  Render the GATT Characteristic and the Read, Write, Notify icons
                (c) => CharacteristicTile(
                  characteristic: c,

                  /// When the Read icon is pressed: Read the GATT Characteristic
                  onReadPressed: () => c.read(),

                  /// When the Write icon is pressed...
                  onWritePressed: () async {
                    //  Write our PineTime Request Message to the GATT Characteristic
                    await c.write(_getRequestBytes(), withoutResponse: true);
                    //  Causes read not ready exception:
                    //  await c.read();
                  },

                  /// When the Notify icon is pressed...
                  onNotificationPressed: () async {
                    //  Subcribe to notifications from the GATT Characteristic
                    await c.setNotifyValue(!c.isNotifying);
                    //  Causes read not ready exception:
                    //  await c.read();
                  },
```

The above code renders the GATT Services and Characteristics exposed by PineTime over Bluetooth LE...

![Characteristic Tile with Read, Write, Notify icons](https://lupyuen.github.io/images/companion-characteristic.png)

In the code above we have set an event handler on the Write icon to transmit our request message to PineTime... 

```dart
/// When the Write icon is pressed...
onWritePressed: () async {
  //  Write our PineTime Request Message to the GATT Characteristic
  await c.write(_getRequestBytes(), withoutResponse: true);
```

That's how we transmit requests to PineTime: We write to the GATT Characteristic that's defined by the [Simple Management Protocol](https://github.com/apache/mynewt-mcumgr).

(Simple Management Protocol is exposed by PineTime as Service `8D53DC1D-1DB7-4CD3-868B-8A527460AA84`, Characteristic `DA2E7828-FBCE-4E01-AE9E-261174997C48`, shortened to `0xDC1D` and `0x7828` respectively in the screen above)

Tapping the Write icon will trigger our function `_getRequestBytes()` defined in [`main.dart`](https://github.com/lupyuen/pinetime-companion/blob/master/lib/main.dart#L154-L197)

```dart
//  Import the Dart code for composing PineTime requests
import 'newtmgr.dart';

/// Screen that displays GATT Services and Characteristics for a Bluetooth LE device
class DeviceScreen extends StatelessWidget {
  ...
  /// Compose a PineTime Request Message and return the message bytes
  List<int> _getRequestBytes() {
    final data = composeRequest();
    return data;
  }
```

We have seen `composeRequest()` in the previous section. This is our new function that composes a PineTime request message.

We add the dependent Dart libraries to [`pubspec.yaml`](https://github.com/lupyuen/pinetime-companion/blob/14df42acb796de6a8f60ace1994d3d39c0f9fb5d/pubspec.yaml#L8-L12)...

```yaml
dependencies:
  cbor:         ^3.2.0  #  CBOR Encoder and Decoder. From https://pub.dev/packages/cbor
  typed_data:   ^1.1.6  #  Helpers for Byte Buffers. From https://pub.dev/packages/typed_data
```

And we're ready to run this on a real phone!

_The Flutter code is getting harder to read... And we haven't handled the PineTime response messages yet! How shall we fix this?_

We may use the [Bloc State Management Library](https://bloclibrary.dev/#/) to keep the code modular.

Tapping the icons and handling responses from PineTime may be treated as a __stream of events__ that the Bloc framework will consume to transform the current state. (Think [React Redux](https://react-redux.js.org/))

Check out this Flutter App built with Bloc: [`flutterweathertutorial`](https://bloclibrary.dev/#/flutterweathertutorial)

# Run Our Flutter App

Here's the video of our Flutter App running on a real Android phone. The app sends the `ImageStateReadReq` request to PineTime over Bluetooth LE to query the firmware images stored in PineTime...

- [Watch on YouTube](https://youtu.be/n396JA62NDk)

- [Download the video](https://github.com/lupyuen/pinetime-rust-mynewt/releases/download/v4.2.3/companion-query-firmware.mov)

Here's the response from PineTime...

![Flutter Companion App showing response from PineTime Smart Watch](https://lupyuen.github.io/images/companion-response.png)

The response is truncated because we haven't implemented response processing.

_In the demo, why did we subscribe to GATT Notifications from PineTime? Why not just read the GATT Characteristic to get the response from PineTime?_

That's how the [Simple Managememt Protocol](https://github.com/apache/mynewt-mcumgr) works...

1. We send a request to PineTime by __writing to the GATT Characteristic__

1. Response from PineTime will be __returned as a GATT Notification__

This kind of Asynchronous Messaging is common for networking apps.

_The response from PineTime appears truncated in our unfinished app. What does the entire response look like?_

The full response message from PineTime (returned via GATT Notification) looks like this...

```
00000000  01 00 00 86 00 01 42 00  bf 66 69 6d 61 67 65 73  |......B..fimages|
00000010  9f bf 64 73 6c 6f 74 00  67 76 65 72 73 69 6f 6e  |..dslot.gversion|
00000020  65 31 2e 30 2e 30 64 68  61 73 68 58 20 70 3e bb  |e1.0.0dhashX p>.|
00000030  f8 11 45 8b 1f ad 18 9e  64 e3 a5 e0 f8 09 cb e6  |..E.....d.......|
00000040  ba d8 83 c7 6b 3d d7 12  79 1c 82 2f b5 68 62 6f  |....k=..y../.hbo|
00000050  6f 74 61 62 6c 65 f5 67  70 65 6e 64 69 6e 67 f4  |otable.gpending.|
00000060  69 63 6f 6e 66 69 72 6d  65 64 f5 66 61 63 74 69  |iconfirmed.facti|
00000070  76 65 f5 69 70 65 72 6d  61 6e 65 6e 74 f4 ff ff  |ve.ipermanent...|
00000080  6b 73 70 6c 69 74 53 74  61 74 75 73 00 ff        |ksplitStatus..|
```

The response message structure is similar to the request message we have seen earlier...

- Message Header: 8 bytes, followed by...

- Message Body: Encoded in [CBOR](https://en.wikipedia.org/wiki/CBOR)

Here's the Message Header according to the definition in [`mgmt.h`](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h)...

| Header Field | Value | Description
| :--- | :--- | :--- 
| `Op`    | `01`    | [Operation Code](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h#L33-L37) (1 for Read Response)
| `Flags` | `00`    | Unused
| `Len`   | `00 86` | Length of Message Body
| `Group` | `00 01` | [Group ID](https://github.com/apache/mynewt-mcumgr/blob/master/mgmt/include/mgmt/mgmt.h#L39-L53) (1 for Image Management)
| `Seq`   | `42` | Message Sequence Number (should match the request message)
| `Id`    | `00` | Message ID (0 for Image Listing)

The message body (in CBOR format) decodes to this JSON...

```json
{
    "images": [
        {
            "slot": 0,
            "version": "1.0.0",
            "hash": [ 112, 62, 187, 248, 17, 69, 139, 31, 173, 24, 158, 100, 227, 165, 224, 248, 9, 203, 230, 186, 216, 131, 199, 107, 61, 215, 18, 121, 28, 130, 47, 181 ],
            "bootable":  true,
            "pending":   false,
            "confirmed": true,
            "active":    true,
            "permanent": false
        }
    ],
    "splitStatus": 0
}
```

This is a response from PineTime's firmware update service saying...

1. I have one firmware image, stored in Slot 0 (Internal Flash ROM)

1. The firmware version number is `1.0.0`

1. This firmware is active and has been confirmed OK

_Can PineTime store a second firmware image?_

Yes in Slot 1, which is the Standby Firmware Slot in External SPI Flash. So the above response may contain up to two firmware images.

Slot 1 is used for staging new firmware images during updates, also for rolling back to the old firmware if the new firmware doesn't work.

_Why does PineTime's firmware update service return a hash?_

The hash will be used in subsequent commands when updating firmware or to roll back the firmware.

# Dart Extension for VSCode

TODO

# What's Next

TODO

1. Response Handling

1. Handle more requests and responses

1. Bloc Library

1. Companion App for PinePhone

I'll be using the code in this article to create the open source __PineTime Companion App__ for Android and iOS. So that we can flash our PineTime Smart Watches wirelessly, sync the date and time, show notifications, chart our heart rate, ...

Flutter makes it really easy to maintain a single code base for Android and iOS... And `flutter_blue` makes Bluetooth LE coding so simple!

If you're keen to help out, come chat with the PineTime FOSS Community (and me) in the PineTime Chatroom!

[PineTime Chatroom on Matrix / Discord / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Further Reading

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
