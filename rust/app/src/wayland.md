# Wayland and LVGL on PinePhone with Ubuntu Touch

![Work-in-progress LVGL GUI Framework ported to Wayland EGL on PinePhone with Ubuntu Touch](https://lupyuen.github.io/images/wayland-title.jpg)

_Work-in-progress LVGL GUI Framework ported to Wayland EGL on PinePhone with Ubuntu Touch_

__We ❤️ &nbsp; Old Underwear...__

They feel comfy, they fit our contours. Nevermind the holes and the old stains 🤢

__X11 is like Old Underwear.__ It's been around for 30 years... Yet we still use it inspite of its feature gaps and wonky quirks.

__PinePhone on Ubuntu Touch feels like... New Underwear.__

It runs Linux but it has none of the legacy X11 code. Because it's optimised for a great mobile experience with __Wayland.__

But New Underwear feels uncomfortable. So today we'll learn Wayland and understand how apps are built with Wayland.

Hopefully someday we'll move on to newer, simpler app frameworks (like [LVGL](https://lvgl.io/) and Flutter) as we discard our Old Underwear: X11, SDL, GTK, Qt, ...

The source code for this article may be found here...

- [`github.com/lupyuen/lvgl-wayland`](https://github.com/lupyuen/lvgl-wayland)

- [`github.com/lupyuen/pinephone-mir`](https://github.com/lupyuen/pinephone-mir)

# How X11 works

[X11](https://en.wikipedia.org/wiki/X_Window_System) is the Graphical Display Service that runs on most Linux desktops and notebooks.

Let's hunt for the X11 Service on Pinebook Pro...

![X11 Service on Pinebook Pro](https://lupyuen.github.io/images/wayland-pinebook.png)

That's the X11 Service... A __2.2 MB__ executable named __`Xorg`__. 

The X11 Service controls the rendering of Linux apps (as well as the keyboard and mouse input) like this...

![X11 Architecture](https://lupyuen.github.io/images/wayland-x11.png)

(Adapted from ["Wayland Architecture"](https://wayland.freedesktop.org/architecture.html))

1. At the top we have the Linux programs running on our Linux machine: __Terminal, Editor, Web Browser__.

    Each program renders its graphical display and transmits the raw graphics to the X11 Service (via a local TCP socket).

1. X11 Service forwards the rendered graphics to the [__Window Manager / Compositor__](https://en.wikipedia.org/wiki/Compositing_window_manager).

    The Window Manager / Compositor is provided by the __Desktop Environment__: Xfce, KDE, Gnome, ...

1. The Window Manager / Compositor wraps the rendered graphics into Display Windows and __"decorates"__ them with scrollbars, title bar and minimise / maximise / close buttons.

    The Window Manager / Compositor then draws the Display Windows into a __Screen Buffer__ according to their screen coordinates.

1. The Screen Buffer is rendered to our screen by the X11 Service, talking to the __Linux Display Driver__.

1. Any keyboard and mouse input is captured by the X11 Service, and forwarded to the programs.

_Why is X11 so complex? So many hops?_

Because X11 was designed for Distributed Computing Systems.

Here's how I used (abused?) X11R4 at [UIUC Systems Research Group](http://srg.cs.illinois.edu/) way back in 1990 (30 years ago!)...

![Distributed X11 System](https://lupyuen.github.io/images/wayland-uiuc.png)

Thankfully things are a lot simpler now, lemme explain...

# Wayland on Ubuntu Touch

_Do we need overlapping or tiled windows on PinePhone?_

_Do we need to need to decorate PinePhone windows with a title bar and minimise / maximise / close buttons?_

_Do we even need any windows on PinePhone?_

No! Because each PinePhone app takes control of the entire screen!

PinePhone uses a simpler Graphical Display Service: the [__Wayland Compositor__](https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)#Wayland_compositors).

Let's hunt for the Wayland Compositor on PinePhone...

![Wayland Compositor on PinePhone](https://lupyuen.github.io/images/wayland-compositor.png)

That's the Wayland Compositor... A __262 KB__ executable named `unity-system-compositor`. 

_Compare that with the 2.2 MB X11 Server on Pinebook Pro!_

Here's how the Wayland Compositor controls apps and manages touchscreen input on PinePhone with Ubuntu Touch...

TODO

(Adapted from ["Wayland Architecture"](https://wayland.freedesktop.org/architecture.html) and ["EGL API"](https://en.wikipedia.org/wiki/EGL_(API)))

I lied about Wayland being New Underwear... It's not really that New!

TODO

# Wayland EGL and OpenGL ES

TODO

Yes the opengl we use for games

And still used today for webgl

Geo location map: https://youtu.be/DNBk9hnPkTY

Since it can handle 3d, why not 2d?

GPU Scaling

# Port LVGL to Wayland

TODO

SDL, GTK, Qt are complex because they handle X11 legacy stuff

SDL and GTK will work on Wayland... but needs X11 compatibilty!

I applaud the maintainers of x11, gtk, qt, sdl because every new release needs to support so many legacy features. Kudos!

What if we could start from scratch, drop the legacy stuff, and build a ui toolkit for Wayland and opengl?

Lvgl is that experiment that we're undertaking today

Rust wrapper for lvgl

# Overcome AppArmor Security on Ubuntu Touch

TODO

Why AppArmor?

# Start SSH on PinePhone

To start SSH on PinePhone, open the Terminal app.

Create a file named `a`...

```bash
nano a
```

Type this script into the `a` file...

```bash
#!/bin/sh
# Script to start SSH service and show IP address

# Start SSH service
sudo service ssh start

# Show IP address
ifconfig | \
    grep -v "127.0.0.1" | \
    grep "inet addr:"

# Ping repeatedly to keep WiFi alive
ping google.com
```

Save the file and exit `nano`.

TODO: How to install the script on PinePhone via SD card or Bluetooth

When we're ready do coding on PinePhone, enter this at the command line...

```bash
. a 
```

(There's a space between "`.`" and "`a`")

The script starts the SSH Service and displays the IP address for PinePhone...

![Starting SSH Service on PinePhone](https://lupyuen.github.io/images/wayland-ssh.jpg)

We'll connect to PinePhone at the IP adddress indicated by `inet addr`. 

Tap on `Ctrl-C` to stop the `ping`.

TODO: How to install SSH key on PinePhone via SD card or Bluetooth

When we press PinePhone's power button to switch off PinePhone, we'll see ths amusing message from olden times...

![Powering off PinePhone](https://lupyuen.github.io/images/wayland-halt.jpg)

# Build LVGL on PinePhone

TODO

# Run LVGL on PinePhone

TODO

Mir Server Log may be found on PinePhone here...

```
/home/phablet/.cache/upstart/unity8.log
```

Copy the log to our machine like this...

```bash
scp -i ~/.ssh/pinebook_rsa phablet@192.168.1.10:/home/phablet/.cache/upstart/u
```

# Wayland Gotchas

TODO

GPU on X11:

https://qoto.org/@lupyuen/104541068127168291

GNOME and GTK on Wayland:

https://mastodon.social/@ebassi/104511735257435944

UBports on Mir:

https://twitter.com/UBports/status/1282935946711904257?s=09

https://twitter.com/UBports/status/1282934927806398464?s=09

https://twitter.com/UBports/status/1282936886311428096?s=09

Wayland on Xfce:

https://twitter.com/XfceNation/status/1284842929895301120?s=09

https://twitter.com/XfceNation/status/1284854254092513285?s=09

Mir / Lomiri / Unity8's complicated history:

https://www.phoronix.com/scan.php?page=news_item&px=Mir-2019-Kicking

https://www.phoronix.com/scan.php?page=news_item&px=Unity-8-Renamed-To-Lomiri

# What I like about Ubuntu Touch on PinePhone

TODO

AppArmor is good, because iOS and Android have similar apps security

Read-only file system is good (system files are read-only by default, user files are read-write). Helps to prevent security holes. (Even PineTime has a read-only Flash ROM)

Why is Qt supported on Ubuntu Touch and not GTK? Because building a Linux mobile app requires mobile-friendly widgets.

I think Qt has more mobile-friendly widgets, even through the internal plumbing is way too complicated.

When I get GTK running on Ubuntu Touch, I will face the same problem with widgets. And I have to make GTK widgets look and feel consistent with Qt / Ubuntu Touch widgets.

Older kernel base in Ubuntu Touch... I don't do kernel hacking much so it doesn't matter to me.

I think for mobiles we only need to support a few common chipsets, so an older kernel is probably fine.

That explains why Raspberry Pi 4 isn't supported by Ubuntu Touch... The hardware is just too new.

The issues I'm struggling with now... Wayland, GTK3, ... are actually really old stuff. Updating the kernel won't help.

Ubuntu Touch is pure Wayland, none of the legacy X11 stuff. Xwayland is not even there (unless you use the Libertine containers ugh).

The pure Wayland environment causes GTK to break, because GTK assumes some minimal X11 support (i.e. Xwayland).

So Ubuntu Touch is not really that bad for PinePhone... It's just painful for building non-Qt apps. 🙂

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
