# nrf52: Build and Flash Scripts for nRF52

[`build-boot.cmd`](build-boot.cmd), [`.sh`](build-boot.sh): Build the bootloader by running `newt build nrf52_boot`

[`build-app.cmd`](../build-app.cmd), [`.sh`](../build-app.sh): Build the application by running `newt build nrf52_my_sensor`. Also builds the Rust application and injects the compiled Rust code into the build.

[`image-app.cmd`](image-app.cmd), [`.sh`](image-app.sh): Create the application firmware image: `newt create-image -v nrf52_my_sensor 1.0.0`

[`flash-boot.cmd`](flash-boot.cmd), [`.sh`](flash-boot.sh): Flash the bootloader with OpenOCD

[`flash-boot.ocd`](flash-boot.ocd): OpenOCD script for flashing the bootloader

[`flash-app.cmd`](flash-app.cmd), [`.sh`](flash-app.sh): Flash the application with OpenOCD

[`flash-app.ocd`](flash-app.ocd): OpenOCD script for flashing the application

[`flash-init.ocd`](flash-init.ocd): OpenOCD initialisation script called by `flash-boot.ocd` and `flash-app.ocd`

[`debug.ocd`](debug.ocd): OpenOCD script for debugging the application. Called by `.vscode/launch-nrf52.json`

[`swd-pi.ocd`](swd-pi.ocd): OpenOCD script for removing nRF52 flash protection on Raspberry Pi

[`swd-pi.sh`](swd-pi.sh): Shell script that invokes `swd-pi.ocd`

[`swd-pi.log`](swd-pi.log): Sample log from `swd-pi.sh`
