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

#include <assert.h>
#include <stddef.h>
#include <inttypes.h>
#include "os/mynewt.h"

#include <hal/hal_bsp.h>
#include <hal/hal_system.h>
#include <hal/hal_flash.h>
#include <hal/hal_gpio.h>
#include <bsp/bsp.h>
#include <console/console.h>
#include <sysflash/sysflash.h>

#define BOOT_AREA_DESC_MAX  (256)
#define AREA_DESC_MAX       (BOOT_AREA_DESC_MAX)

void *_estack;  //  End of stack, defined in Linker Script.
extern const struct flash_area sysflash_map_dflt[];  //  Contains addresses of flash sections. Defined in bin/targets/bluepill_boot/generated/src/bluepill_boot-sysflash.c

int
main(void)
{
    //  This is a stub bootloader for Blue Pill.  We jump straight into the application.
    //  This simple bootloader allows the application to take up more ROM space.
    hal_bsp_init();

    //  Previously: flash_map_init();
    //  Previously: rc = boot_go(&rsp);

    //  img_start points to the STM32 Vector Table for the app...
    //  First word contains initial MSP value (estack = end of RAM)
    //  Second word contains address of entry point (Reset_Handler = 0x0800112d)
    void *img_start = (void *) (
        sysflash_map_dflt[1].fa_off  //  Offset of FLASH_AREA_IMAGE_0 (application image): 0x08001000
        + 0x20                       //  Size of Mynewt image header
    );  //  Equals 0x08001020 (__isr_vector)

    //  Jump to Reset_Handler of the application. Uses first word and second word of img_start.
    hal_system_start(img_start);

    //  Should never come here.
    return 0;
}