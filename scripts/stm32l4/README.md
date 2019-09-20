# stm32l4: Build and Flash Scripts for STM32 L4xx

[`build-boot.cmd`](build-boot.cmd), [`.sh`](build-boot.sh): Build the bootloader by running `newt build stm32l4_boot`

build-app.cmd, .sh: Build the application by running newt build stm32l4_my_sensor

image-app.cmd, .sh: Create the application firmware image: newt create-image -v stm32l4_my_sensor 1.0.0

flash-boot.cmd, .sh: Flash the bootloader with OpenOCD

flash-boot.ocd: OpenOCD script for flashing the bootloader

flash-app.cmd, .sh: Flash the application with OpenOCD

flash-app.ocd: OpenOCD script for flashing the application

flash-init.ocd: OpenOCD initialisation script called by flash-boot.ocd and flash-app.ocd

debug.ocd: OpenOCD script for debugging the application. Called by .vscode/launch-stm32l4.json
