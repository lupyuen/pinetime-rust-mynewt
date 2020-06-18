# Your First GTK3 App with Go and VSCodium

![???](https://lupyuen.github.io/images/gotk3-title.png)

https://github.com/gotk3/gotk3

Pinebook Pro and Raspberry Pi
Debian Mate and Manjaro Xfce
Ubuntu Deskto 20.04 64-bit

# Install Build Tools

__1️⃣ For Manjaro and Arch Linux...__

At the command prompt enter...

```bash
sudo pacman -S gtk3 cairo glib2 go
```

__2️⃣ For Ubuntu and Debian...__

At the command prompt enter...

```bash
sudo apt install libgtk-3-dev libcairo2-dev libglib2.0-dev
```

Follow the instructions here to install the Go build tools:

[`golang.org/doc/install`](https://golang.org/doc/install)

# Install VSCodium

We'll be installing [__VSCodium__](https://github.com/VSCodium/vscodium), the community build of VSCode that doesn't have Microsoft branding and telemetry. VSCodium has better support for Arm Linux than VSCode.

Note that VSCodium uses its own Extensions Marketplace, so that it doesn't violate Microsoft's terms of use.

__1️⃣ For Manjaro and Arch Linux...__

Enable __Arch User Repository (AUR)__ in the Arch Package Manager `pamac-manager`... 

[_"How to Use AUR on Arch and Manjaro Linux?"_](https://itsfoss.com/aur-arch-linux/)

In the Package Manager, search for `vscodium-bin` and install it.

__2️⃣ For Ubuntu and Debian...__

Follow the instructions here to install VSCodium:

[`github.com/VSCodium/vscodium`](https://github.com/VSCodium/vscodium)

# Download Source Code

```bash

https://github.com/gotk3/gotk3-examples/blob/master/gtk-examples/stack/stack.go

Clone https://github.com/gotk3/gotk3-examples

cd gtk-examples/stack
go get github.com/gotk3/gotk3/gtk
go build stack.go

ls -l

./stack


```

# What's Next

The code in this article is part of the upcoming open source __PineTime Companion App__ for Android and iOS. So that we can flash our PineTime Smart Watches wirelessly, sync the date and time, show notifications from our phone, chart our heart rate, ... Maybe even control our smart home gadgets! 

We'll be adding more code to the Flutter app...

1. __Response Handling:__ We shall handle response messages received from PineTime over Bluetooth LE (i.e. handle the GATT Notifications)

1. __Handle Other PineTime Commands:__ Update firmware, sync date and time, show mobile notifications, ...

1. __State Management with Bloc Library:__ We shall integrate the [Bloc State Management Library](https://bloclibrary.dev/#/) to keep the Flutter code modular and maintainable

1. __Companion App for Linux Phones (like PinePhone):__ We shall take the [Newt Manager](https://github.com/apache/mynewt-newtmgr) code in Go and wrap it into a GTK3 app, using the [`gotk3` library](https://github.com/gotk3/gotk3)

If you're keen to help out, come chat with the PineTime FOSS Community (and me) in the PineTime Chatroom!

[PineTime Chatroom on Matrix / Discord / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Further Reading

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
