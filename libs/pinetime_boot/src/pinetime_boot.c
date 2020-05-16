/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
//  Render boot graphic and check for manual rollback

#include <os/os.h>
#include <hal/hal_bsp.h>
#include <hal/hal_gpio.h>
#include <hal/hal_system.h>
#include <console/console.h>
#include "bootutil/image.h"
#include <bootutil/bootutil.h>
#include "pinetime_boot/pinetime_boot.h"

#define PUSH_BUTTON_IN  13  //  P0.13: PUSH BUTTON_IN
#define PUSH_BUTTON_OUT 15  //  P0.15/TRACEDATA2: PUSH BUTTON_OUT

/// Init the display and render the boot graphic. Called by sysinit() during startup, defined in pkg.yml.
void pinetime_boot_init(void) {
    console_printf("Starting Bootloader...\n"); console_flush();

    //  Init the push button. The button on the side of the PineTime is disabled by default. To enable it, drive the button out pin (P0.15) high.
    //  While enabled, the button in pin (P0.13) will be high when the button is pressed, and low when it is not pressed. 
    hal_gpio_init_in(PUSH_BUTTON_IN, HAL_GPIO_PULL_DOWN);  //  TODO: Or up / down
    hal_gpio_init_out(PUSH_BUTTON_OUT, 1);
    hal_gpio_write(PUSH_BUTTON_OUT, 1);  //  Enable the button

    //  Display the image.
    pinetime_boot_display_image();
    console_printf("Button: %d\n", hal_gpio_read(PUSH_BUTTON_IN)); console_flush();
}

void boot_custom_start(
    uintptr_t flash_base,
    struct boot_rsp *rsp
) {
    //  Wait 5 seconds for button press.
    console_printf("Button: %d\n", hal_gpio_read(PUSH_BUTTON_IN)); console_flush();
    for (int i = 0; i < 15; i++) {
        pinetime_boot_check_button();
    }
    console_printf("Button: %d\n", hal_gpio_read(PUSH_BUTTON_IN)); console_flush();

    //  TODO: If button is pressed and held for 5 seconds, rollback the firmware.
    console_printf("Bootloader done\n"); console_flush();

    hal_system_start((void *)(flash_base + rsp->br_image_off +
                              rsp->br_hdr->ih_hdr_size));
}

/// Check whether the watch button is pressed
void pinetime_boot_check_button(void) {
    for (int i = 0; i < 1000000; i++) {
        hal_gpio_read(PUSH_BUTTON_IN);
    }
}

/* Log:
Starting Bootloader...
Displaying image...
Image displayed
Button: 0
[INF] Primary image: magic=unset, swap_type=0x1, copy_done=0x3, image_ok=0x3
[INF] Scratch: magic=unset, swap_type=0x1, copy_done=0x3, image_ok=0x3
[INF] Boot source: primary slot
[INF] Swap type: none
Button: 0
Button: 0
Bootloader done
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
Testing flash...
Read Internal Flash ROM...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x01 0x20 0xd9 0x00 0x00 0x00 
  0x0008: 0x35 0x01 0x00 0x00 0x37 0x01 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Read External SPI Flash...
Read 0x0 + 20
  0x0000: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0008: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0010: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
  0x0018: 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 
Flash OK
Rust test display
*/
