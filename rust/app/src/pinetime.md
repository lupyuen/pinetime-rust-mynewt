# PineTime doesn't run Linux... But that's OK!

PineTime works great with open source embedded software platforms like __Arduino, FreeRTOS, RIOT, Mynewt, wasp-os, Zephyr,__ ... None of which are based on Linux!

Think of PineTime as a supercharged BBC micro:bit (or Arduino Uno) that comes with Bluetooth LE, colour LCD display (240 x 240), touchscreen, heart rate sensor and accelerometer.

__PineTime is incredibly hackable:__ Flash our own firmware, build our own watch faces, render graphics on the touchscreen, ... The PineTime FOSS Community is always happy to help you hack PineTime!

__C is the most common language__ for coding PineTime. If you're familiar with Python, try coding PineTime with __MicroPython on wasp-os.__

If you're into cutting edge coding, check out __Rust Embedded__ (and Real Time For the Masses) on PineTime.

# Some PineTime wiring needed

PineTime ships as a __Developer Kit__... Get ready to do some wiring!

Some newbies find it tricky to connect to the SWD Port inside PineTime, please chat with us online for tips.

I recommend using a __Raspberry Pi to remove Flash ROM protection__ from PineTime (this step is mandatory), also to flash and debug the PineTime firmware.

Advanced firmware coders will find __ST-Link V2__ more efficient for flashing and debugging the firmware. (Though ST-Link V2 can't be used for removing Flash ROM protection)

[More about this in the PineTime Wiki](https://wiki.pine64.org/index.php/PineTime)

# Wireless developer tools are coming

Programming PineTime the wired way sounds tedious, but we're heading the wireless way...

After installing the wasp-os or Arduino firmware on PineTime (the wired way), we may update the wasp-os / Arduino firmware wirelessly over Bluetooth LE. wasp-os also exposes an REPL command line interface over Bluetooth LE.

The PineTime FOSS Community is now extending this wireless development concept to other types of PineTime firmware, like FreeRTOS, Mynewt and Zephyr.

We have ported to PineTime the open source MCUBoot Bootloader, and we have to hope to have it preloaded on PineTime watches soon. The new bootloader will let you switch firmware wirelessly (like from Mynewt to FreeRTOS) and try out all kinds of experimental firmware created by the PineTime FOSS Community.

With firmware updates over Bluetooth LE, PineTime programming will become so much easier!

# PineTime Companion App

Today we use a mix of mobile apps for firmware flashing and data syncing with PineTime, like nRF Connect (Android and iOS) and DaFlasher (Android only).

The __PineTime Companion App__ is under development now. It will run on Android and iOS (via Flutter) and on Linux phones like PinePhone (via GOTK3).  It will probably run on Raspberry Pi and Pinebook Pro too!

The Companion App will update PineTime firmware, sync the date/time, chart your heart rate, push your mobile notifications to PineTime, ... And let you control your smart home gadgets with PineTime!

# What's Next

The PineTime FOSS Community has accomplished so much over the past 6 months because we're all __volunteers passionate about PineTime.__

You're welcome to join us and make the open source PineTime software even better!

[Come chat with us on Matrix, Discord, Telegram and IRC](https://wiki.pine64.org/index.php/PineTime#Community)
