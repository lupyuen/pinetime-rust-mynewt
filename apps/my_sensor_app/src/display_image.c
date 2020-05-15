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

#define INVERTED 1  //  Display colours are inverted
#define RGB      1  //  Display colours are RGB    

//  From https://github.com/lupyuen/st7735-lcd-batch-rs/blob/master/src/instruction.rs
#define NOP 0x00
#define SWRESET 0x01
#define RDDID 0x04
#define RDDST 0x09
#define SLPIN 0x10
#define SLPOUT 0x11
#define PTLON 0x12
#define NORON 0x13
#define INVOFF 0x20
#define INVON 0x21
#define DISPOFF 0x28
#define DISPON 0x29
#define CASET 0x2A
#define RASET 0x2B
#define RAMWR 0x2C
#define RAMRD 0x2E
#define PTLAR 0x30
#define COLMOD 0x3A
#define MADCTL 0x36
#define FRMCTR1 0xB1
#define FRMCTR2 0xB2
#define FRMCTR3 0xB3
#define INVCTR 0xB4
#define DISSET5 0xB6
#define PWCTR1 0xC0
#define PWCTR2 0xC1
#define PWCTR3 0xC2
#define PWCTR4 0xC3
#define PWCTR5 0xC4
#define VMCTR1 0xC5
#define RDID1 0xDA
#define RDID2 0xDB
#define RDID3 0xDC
#define RDID4 0xDD
#define PWCTR6 0xFC
#define GMCTRP1 0xE0
#define GMCTRN1 0xE1

//  From https://github.com/lupyuen/st7735-lcd-batch-rs/blob/master/src/lib.rs#L52-L58
#define Portrait 0x00
#define Landscape 0x60
#define PortraitSwapped 0xC0
#define LandscapeSwapped 0xA0

static int init_display(void);
static int hard_reset(void);
static int set_orientation(uint8_t orientation);
static int write_command(uint8_t command, const uint8_t *params, uint16_t len);
static int write_data(const uint8_t *data, uint16_t len);
static int transmit_spi(const uint8_t *data, uint16_t len);
static void delay_ms(uint32_t ms);

/// Display an image from SPI Flash to ST7789 display controller
int display_image(void) {
    int rc = init_display();  assert(rc == 0);
    rc = set_orientation(Landscape);  assert(rc == 0);
    return 0;
}

/// Runs commands to initialize the display. From https://github.com/lupyuen/st7735-lcd-batch-rs/blob/master/src/lib.rs
static int init_display(void) {
    //  Assume that SPI port 0 has been initialised by the SPI Flash Driver at startup.
    int rc;
    rc = hal_gpio_init_out(DISPLAY_RST, 1); assert(rc == 0);
    rc = hal_gpio_init_out(DISPLAY_CS, 1); assert(rc == 0);
    rc = hal_gpio_init_out(DISPLAY_DC, 0); assert(rc == 0);
    //  Switch on backlight
    rc = hal_gpio_init_out(DISPLAY_HIGH, 0); assert(rc == 0);

    hard_reset();
    write_command(SWRESET, NULL, 0);
    delay_ms(200);
    write_command(SLPOUT, NULL, 0);
    delay_ms(200);

    static const uint8_t FRMCTR1_PARA[] = { 0x01, 0x2C, 0x2D };
    write_command(FRMCTR1, FRMCTR1_PARA, sizeof(FRMCTR1_PARA));

    static const uint8_t FRMCTR2_PARA[] = { 0x01, 0x2C, 0x2D };
    write_command(FRMCTR2, FRMCTR2_PARA, sizeof(FRMCTR2_PARA));

    static const uint8_t FRMCTR3_PARA[] = { 0x01, 0x2C, 0x2D, 0x01, 0x2C, 0x2D };
    write_command(FRMCTR3, FRMCTR3_PARA, sizeof(FRMCTR3_PARA));

    static const uint8_t INVCTR_PARA[] = { 0x07 };
    write_command(INVCTR, INVCTR_PARA, sizeof(INVCTR_PARA));

    static const uint8_t PWCTR1_PARA[] = { 0xA2, 0x02, 0x84 };
    write_command(PWCTR1, PWCTR1_PARA, sizeof(PWCTR1_PARA));

    static const uint8_t PWCTR2_PARA[] = { 0xC5 };
    write_command(PWCTR2, PWCTR2_PARA, sizeof(PWCTR2_PARA));
    
    static const uint8_t PWCTR3_PARA[] = { 0x0A, 0x00 };
    write_command(PWCTR3, PWCTR3_PARA, sizeof(PWCTR3_PARA));
    
    static const uint8_t PWCTR4_PARA[] = { 0x8A, 0x2A };
    write_command(PWCTR4, PWCTR4_PARA, sizeof(PWCTR4_PARA));
    
    static const uint8_t PWCTR5_PARA[] = { 0x8A, 0xEE };
    write_command(PWCTR5, PWCTR5_PARA, sizeof(PWCTR5_PARA));
    
    static const uint8_t VMCTR1_PARA[] = { 0x0E };
    write_command(VMCTR1, VMCTR1_PARA, sizeof(VMCTR1_PARA));

    if (INVERTED) {
        write_command(INVON, NULL, 0);
    } else {
        write_command(INVOFF, NULL, 0);
    }
    if (RGB) {
        static const uint8_t MADCTL1_PARA[] = { 0x00 };
        write_command(MADCTL, MADCTL1_PARA, sizeof(MADCTL1_PARA));
    } else {
        static const uint8_t MADCTL2_PARA[] = { 0x08 };
        write_command(MADCTL, MADCTL2_PARA, sizeof(MADCTL2_PARA));
    }
    static const uint8_t COLMOD_PARA[] = { 0x05 };
    write_command(COLMOD, COLMOD_PARA, sizeof(COLMOD_PARA));
    
    write_command(DISPON, NULL, 0);
    delay_ms(200);
    return 0;
}

/// Reset the display controller
static int hard_reset(void) {
    hal_gpio_write(DISPLAY_RST, 1);
    hal_gpio_write(DISPLAY_RST, 0);
    hal_gpio_write(DISPLAY_RST, 1);
}

/// Set the display orientation
static int set_orientation(uint8_t orientation) {
    if (RGB) {
        uint8_t orientation_para = { orientation };
        int rc = write_command(MADCTL, orientation_para, 1);
        assert(rc == 0);
    } else {
        uint8_t orientation_para = { orientation | 0x08 };
        int rc = write_command(MADCTL, orientation_para, 1);
        assert(rc == 0);
    }
    return 0;
}

/// Transmit ST7789 command
static int write_command(uint8_t command, const uint8_t *params, uint16_t len) {
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
static int write_data(const uint8_t *data, uint16_t len) {
    hal_gpio_write(DISPLAY_DC, 1);
    transmit_spi(data, len);
    return 0;
}

/// Write to the SPI port. From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/mynewt/src/hal.rs
static int transmit_spi(const uint8_t *data, uint16_t len) {
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

/// Sleep for the specified number of milliseconds
static void delay_ms(uint32_t ms) {
    uint32_t delay_ticks = ms * OS_TICKS_PER_SEC / 1000;
    os_time_delay(delay_ticks);
}
