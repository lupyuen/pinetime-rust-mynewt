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

/// Vector Table will be relocated here.
#define RELOCATED_VECTOR_TABLE 0x7F00

/// Number of entries in the Vector Table.
#define NVIC_NUM_VECTORS (16 + 38)

/// Address of the VTOR Register in the System Control Block.
#define SCB_VTOR ((uint32_t *) 0xE000ED08)

/// Contains addresses of flash sections. Defined in bin/targets/nrf52_boot/generated/src/nrf52_boot-sysflash.c
extern const struct flash_area sysflash_map_dflt[];

static void relocate_vector_table(void *vector_table, void *relocated_vector_table);

/// This is a Stub Bootloader.  We jump straight into the application without doing any processing.
/// This simple bootloader allows the application to take up more ROM space.
/// And it allows debugging of application firmware that doesn't have a valid MCUBoot Image Header.
int main(void) {
    //  Init the Board Support Package.
    hal_bsp_init();

    //  Previously: flash_map_init();
    //  Previously: rc = boot_go(&rsp);

    //  vector_table points to the Arm Vector Table for the appplication...
    //  First word contains initial MSP value (estack = end of RAM)
    //  Second word contains address of entry point (Reset_Handler)
    void *vector_table = (void *) (
        sysflash_map_dflt[1].fa_off  //  Offset of FLASH_AREA_IMAGE_0 (application image): 0x8000
        + 0x20                       //  Size of MCUBoot image header
    );                               //  Equals 0x8020 (__isr_vector)

    //  Relocate the application vector table to a 0x100 page boundary in ROM.
    relocate_vector_table(  //  Relocate the vector table...
        vector_table,       //  From the non-aligned application address (0x8020)
        (void *) RELOCATED_VECTOR_TABLE  //  To the relocated address aligned to 0x100 page boundary
    );

    //  Jump to Reset_Handler of the application. Uses first word and second word of vector table at img_start.
    hal_system_start(vector_table);

    //  Should never come here.
    return 0;
}

/// Relocate the Arm Vector Table from vector_table to relocated_vector_table.
/// relocated_vector_table must be aligned to 0x100 page boundary.
static void relocate_vector_table(void *vector_table, void *relocated_vector_table) {
    uint32_t *current_location = (uint32_t *) vector_table;
    uint32_t *new_location     = (uint32_t *) relocated_vector_table;
    if (new_location == current_location) { return; }  //  No need to relocate
    //  Check whether we need to copy the vectors.
    int vector_diff = 0;  //  Non-zero if a vector is different
    for (int i = 0; i < NVIC_NUM_VECTORS; i++) {
        if (new_location[i] != current_location[i]) {
            vector_diff = 1;
            break;
        }
    }
    //  If we need to copy the vectors, erase the flash ROM and write the vectors.
    if (vector_diff) {
        hal_flash_erase(  //  Erase...
            0,            //  Internal Flash ROM
            (uint32_t) relocated_vector_table,  //  At the relocated address
            0x100         //  Assume that we erase an entire page
        );
        hal_flash_write(  //  Write...
            0,            //  Internal Flash ROM
            (uint32_t) relocated_vector_table,  //  To the relocated address
            vector_table, //  From the original address
            0x100         //  Assume that we copy an entire page
        );  
    }
    //  Point VTOR Register in the System Control Block to the relocated vector table.
    *SCB_VTOR = (uint32_t) relocated_vector_table;
}