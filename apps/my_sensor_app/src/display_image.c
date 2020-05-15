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
//  Display image on ST7789 display controller (240 x 240)
#include <inttypes.h>
#include "os/mynewt.h"
#include <console/console.h>
#include <hal/hal_bsp.h>
#include <hal/hal_flash.h>
#include <hal/hal_flash_int.h>
#include <hal/hal_gpio.h>
#include <hal/hal_spi.h>
#include <stdio.h>
#include <string.h>

//  From rust\piet-embedded\piet-embedded-graphics\src\display.rs
#define DISPLAY_SPI   0  //  Mynewt SPI port 0
#define DISPLAY_CS   25  //  LCD_CS (P0.25): Chip select
#define DISPLAY_DC   18  //  LCD_RS (P0.18): Clock/data pin (CD)
#define DISPLAY_RST  26  //  LCD_RESET (P0.26): Display reset
#define DISPLAY_HIGH 23  //  LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23): Backlight (active low)

/// Display an image from SPI Flash to ST7789 display controller
int display_image(void) {
    //  Assume that SPI port 0 has been initialised by the SPI Flash Driver at startup.
    int rc;
    //  rc = hal_gpio_init_out(DISPLAY_RST, 0); assert(rc == 0);
    rc = hal_gpio_init_out(DISPLAY_CS, 1); assert(rc == 0);
    rc = hal_gpio_init_out(DISPLAY_DC, 0); assert(rc == 0);
    //  Switch on backlight
    rc = hal_gpio_init_out(DISPLAY_HIGH, 0); assert(rc == 0);
}

/// Transmit ST7789 command
static int write_command(uint8_t command, uint8_t *params, uint16_t len) {
    hal_gpio_write(DISPLAY_DC, 0);
    int rc = transmit_spi(&command, 1);
    assert(rc == 0);
    if (params != NULL && len > 0) {
        rc = write_data(params, len);
        assert(rc == 0);
    }
    return 0;
}

/// Transmit ST7789 data
static int write_data(uint8_t *data, uint16_t len) {
    hal_gpio_write(DISPLAY_DC, 1);
    transmit_spi(data, len);
    return 0;
}

/// Write to the SPI port
static int transmit_spi(uint8_t *data, uint16_t len) {
    if (len == 0) { return 0; }
    //  Select the device
    hal_gpio_write(DISPLAY_CS, 0);
    //  Send the data
    int rc = hal_spi_txrx(DISPLAY_SPI, 
        data,  //  TX Buffer
        NULL,  //  RX Buffer (don't receive)
        len);  //  Length
    assert(rc == 0);
    //  De-select the device
    hal_gpio_write(DISPLAY_CS, 1);
    return 0;
}
