# my_sensor_app: Apache Mynewt Application for PineTime Smart Watch

This folder contains the C source code for the application. The Rust source code is located at [`/rust/app/src`](/rust/app/src).

[`pkg.yml`](pkg.yml): Mynewt application info and dependencies

[`syscfg.yml`](syscfg.yml): Mynewt application settings

[`src`](src): Application source files in C for Mynewt build. These C files are compiled into the Mynewt ROM image. 

[`src/ble_beacon.c`](src/ble_beacon.c): Bluetooth LE Beacon service

`src/ble_*.c, ble_*.h`: Bluetooth LE Firmware Update service (MCU Manager / Simple Management Protocol)

[`src/support.c`](src/support.c): Low-level C supporting functions needed for the Mynewt application

[`src/vsscanf.c`](src/vsscanf.c): Patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes BC95-G and ESP8266 response parsing bugs.  The patched file must be present in that location.

[`test`](test): Test scripts (incomplete)

[`OLDsrc`](OLDsrc): (NOT USED) Previous C version of the application

## Patch for `vsscanf.c`

Note that we are using a patched version of `apps/my_sensor_app/src/vsscanf.c` that
fixes BC95-G and ESP8266 response parsing bugs.  The patched file must be present in that location.
