# Wayland and LVGL on PinePhone with Ubuntu Touch

![Work-in-progress LVGL GUI Framework ported to Wayland EGL on PinePhone with Ubuntu Touch](https://lupyuen.github.io/images/wayland-title.jpg)

_Work-in-progress LVGL GUI Framework ported to Wayland EGL on PinePhone with Ubuntu Touch_

__We ❤️ Old Underwear...__

They feel comfy, they fit our contours. Nevermind the holes and the old stains 🤢

__X11 is like Old Underwear.__ It's been around for 30 years... Yet we still use it inspite of its feature gaps and wonky quirks.

__PinePhone on Ubuntu Touch feels like... New Underwear.__

It runs Linux but it has none of the legacy X11 code. Because it's optimised for a great mobile experience with __Wayland.__

But New Underwear feels uncomfortable. So today we'll learn Wayland and understand how apps are built with Wayland.

Hopefully someday we'll move on to newer, simpler app frameworks (like [LVGL](https://lvgl.io/) and Flutter) as we discard our Old Underwear: X11, SDL, GTK, Qt, ...

The source code for this article may be found here...

https://github.com/lupyuen/lvgl-wayland

https://github.com/lupyuen/pinephone-mir

# Wayland vs X11

TODO

Why so complex? So many hops?

Because X11 was designed for Distributed Computing Systems.

In 1990 I was doing this at UIUC Systems Research Group...

Things are a lot simpler now, lemme explain...

# Wayland on Ubuntu Touch

TODO

I lied about Wayland being New Underwear... It's not really that New!

Now much simpler

No window decorations

No windows in fact

Everything runs fullscreen

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

Rust wrapper for lvgl

# Overcome AppArmor Security on Ubuntu Touch

TODO

Why AppArmor?

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
