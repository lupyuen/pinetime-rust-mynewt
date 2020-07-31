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

#define BATCH_SIZE  4096  //  Max number of data bytes to be written in a batch

//  Flash Device for Image
#define FLASH_DEVICE 1  //  0 for Internal Flash ROM, 1 for External SPI Flash


//  Converted from PNG file by https://github.com/lupyuen/pinetime-graphic
static const uint8_t image_data[] = {  //  Should be 115,200 bytes
#include "graphic.inc"
};

/// Write a converted graphic file to SPI Flash
int pinetime_boot_write_image(void) {
    console_printf("Writing graphic to flash...\n"); console_flush();
    uint32_t offset = 0;
    for (;;) {
        if (offset >= sizeof(image_data)) { break; }
        //  How many bytes we will write.
        uint16_t len = BATCH_SIZE;
        if (offset + len >= sizeof(image_data)) {
            len = sizeof(image_data) - offset;
        }        
        //  Erase the bytes.
        int rc = hal_flash_erase(FLASH_DEVICE, offset, len); assert(rc == 0);

        //  Write the bytes.
        rc = hal_flash_write(FLASH_DEVICE, offset, (void *) &image_data[offset], len); assert(rc == 0);
        offset += len;
    }
    console_printf("Graphic written to flash\n"); console_flush();
    return 0;
}