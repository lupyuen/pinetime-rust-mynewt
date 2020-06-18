# Your First GTK3 App with Go and VSCodium

![???](https://lupyuen.github.io/images/gotk3-title.png)

https://github.com/gotk3/gotk3

Pinebook Pro and Raspberry Pi
Debian Mate and Manjaro Xfce
Ubuntu Deskto 20.04 64-bit

# Coding GTK3 with Go

Why use Go to code GTK3 apps?

```go

```

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

Note that VSCodium uses its own Extensions Marketplace, so that it doesn't violate Microsoft's terms of use. VSCodium Marketplace Extensions may be slightly different from the VSCode Marketplace.

__1️⃣ For Manjaro and Arch Linux...__

Enable __Arch User Repository (AUR)__ in the Arch Package Manager `pamac-manager`... 

[_"How to Use AUR on Arch and Manjaro Linux?"_](https://itsfoss.com/aur-arch-linux/)

In the Package Manager, search for `vscodium-bin` and install it.

__2️⃣ For Ubuntu and Debian...__

Follow the instructions here to install VSCodium:

[`github.com/VSCodium/vscodium`](https://github.com/VSCodium/vscodium)

# Download Source Code For Our App

Let's download the `gotk3` sample code...

1. Launch VSCodium, click `View → Command Palette`

1. Enter `Git Clone`

1. Enter `https://github.com/gotk3/gotk3-examples`

1. Select a folder to download the source code

1. When prompted to open the cloned repository, click `Open`

1. In the `Explorer → Workspace` pane at left, browse to `gtk-examples → stack`

1. Double-click on `stack.go`. This is the Go app that we shall be building.

???

# Build And Run Our App

1. In VSCode, click `Terminal → New Terminal`

1. At the Terminal prompt, enter...

    ```bash
    cd gtk-examples/stack
    go get github.com/gotk3/gotk3/gtk
    go build stack.go
    ls -l
    ```

    ???

    The `go get` command may take 10 minutes or longer to build the `gotk3` library... Be patient! This only needs to be done once.  Our CPU may hit 100% utilisation like this...

    The `ls -l` command should show the compiled Go executable...

    ???

1. At the Terminal prompt, enter...

    ```bash
    ./stack
    ```

    This runs our newly-built GTK3 app...

    ???

# What's Next

Glade UI Builder for GTK

https://glade.gnome.org/

Seems feasible to build https://github.com/mrccnt/gotk3-glade-example

The code in this article is part of the upcoming open source __PineTime Companion App__ for Linux phones (like PinePhone). So that we can flash our PineTime Smart Watches wirelessly, sync the date and time, show notifications from our phone, chart our heart rate, ... Maybe even control our smart home gadgets! 

If you're keen to help out, come chat with the PineTime FOSS Community (and me) in the PineTime Chatroom!

[PineTime Chatroom on Matrix / Discord / Telegram / IRC](https://wiki.pine64.org/index.php/PineTime#Community)

# Further Reading

_["Your First Bluetooth Low Energy App with Flutter"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/flutter)_

_["Convert Go to Flutter and Dart for PineTime Companion App"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/companion)_

_["MCUBoot Bootloader for PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/mcuboot)_

_["Firmware Update over Bluetooth Low Energy on PineTime Smart Watch"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfu)_

_["Wireless Firmware Update In Action on PineTime Smart Watch (nRF52)"](https://lupyuen.github.io/pinetime-rust-mynewt/articles/dfutest)_

[Check out the other PineTime articles](https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/README.md)

[RSS Feed](https://lupyuen.github.io/rss.xml)
