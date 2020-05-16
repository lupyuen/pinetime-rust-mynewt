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
#include <console/console.h>
#include "pinetime_boot/pinetime_boot.h"

//  The button on the side of the PineTime is disabled by default. To enable it, drive the button out pin (P0.15) high.
//  While enabled, the button in pin (P0.13) will be high when the button is pressed, and low when it is not pressed. 
#define PUSH_BUTTON_IN  13  //  P0.13: PUSH BUTTON_IN
#define PUSH_BUTTON_OUT 15  //  P0.15/TRACEDATA2: PUSH BUTTON_OUT

/// Init the display and render the boot graphic. Called by sysinit() during startup, defined in pkg.yml.
void pinetime_boot_init(void) {
    console_printf("Starting MCUBoot...\n"); console_flush();

    //  Init the push button.
    hal_gpio_init_out(PUSH_BUTTON_OUT, 1);  //  Enable the button
    hal_gpio_init_in(PUSH_BUTTON_IN, HAL_GPIO_PULL_DOWN);  //  TODO: Or up / down

    //  Display the image.
    pinetime_boot_display_image();

    //  Wait 5 seconds for button press.
    console_printf("Button: %d\n", hal_gpio_read(PUSH_BUTTON_IN)); console_flush();
    for (int i = 0; i < 10000000; i++) {
        hal_gpio_read(PUSH_BUTTON_IN);
    }
    console_printf("Button: %d\n", hal_gpio_read(PUSH_BUTTON_IN)); console_flush();

    console_printf("Booting...\n"); console_flush();
}
