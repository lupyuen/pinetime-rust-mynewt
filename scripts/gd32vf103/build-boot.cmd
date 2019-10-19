::  Build Mynewt bootloader on Windows

::  Add toolchain to PATH.
set PATH=%PATH%;%cd%\xPack\RISC-V Embedded GCC\8.2.0-3.1\bin

::  Build the bootloader.
newt\newt.exe build gd32vf103_boot

::  Show the size.
newt\newt.exe size -v gd32vf103_boot
