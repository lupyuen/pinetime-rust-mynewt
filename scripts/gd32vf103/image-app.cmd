::  Create Mynewt Image for Windows

::  Add toolchain to PATH.
@set PATH=%PATH%;%cd%\xPack\RISC-V Embedded GCC\8.2.0-3.1\bin

newt\newt.exe create-image -v gd32vf103c-start_my_sensor 1.0.0

newt\newt.exe size -v gd32vf103c-start_my_sensor
