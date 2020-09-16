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
#include <hal/hal_flash.h>
#include <console/console.h>
#include "bootutil/image.h"
#include <bootutil/bootutil.h>
#include "pinetime_boot/pinetime_boot.h"

#define PUSH_BUTTON_IN  13  //  GPIO Pin P0.13: PUSH BUTTON_IN
#define PUSH_BUTTON_OUT 15  //  GPIO Pin P0.15/TRACEDATA2: PUSH BUTTON_OUT

/// Vector Table will be relocated here.
#define RELOCATED_VECTOR_TABLE 0x7F00

/// Number of entries in the Vector Table.
#define NVIC_NUM_VECTORS (16 + 38)

/// Address of the VTOR Register in the System Control Block.
#define SCB_VTOR ((uint32_t *) 0xE000ED08)

void init_backlight(void);  //  Defined in blink.c
void blink_backlight(int pattern_id, int repetitions);  //  Defined in blink.c
static void relocate_vector_table(void *vector_table, void *relocated_vector_table);

/// Init the display and render the boot graphic. Called by sysinit() during startup, defined in pkg.yml.
void pinetime_boot_init(void) {
    init_backlight();
    console_printf("Starting Bootloader...\n");
    console_flush();

    //  Init the push button. The button on the side of the PineTime is disabled by default. To enable it, drive the button out pin (P0.15) high.
    //  While enabled, the button in pin (P0.13) will be high when the button is pressed, and low when it is not pressed. 
    hal_gpio_init_in(PUSH_BUTTON_IN, HAL_GPIO_PULL_DOWN);  //  TODO: Doesn't seem to work
    hal_gpio_init_out(PUSH_BUTTON_OUT, 1);
    hal_gpio_write(PUSH_BUTTON_OUT, 1);  //  Enable the button
    ////blink_backlight(0, 1);

    //  Display the image.
    pinetime_boot_display_image();
    console_printf("Check button: %d\n", hal_gpio_read(PUSH_BUTTON_IN));
    console_flush();
    blink_backlight(0, 5);

    uint8_t button_samples = 0;
    //  Wait 5 seconds for button press.
    console_printf("Waiting 5 seconds for button...\n");
    console_flush();

    for (int i = 0; i < 64 * 5; i++) {
        for (int delay = 0; delay < 100000; delay++);
        button_samples += hal_gpio_read(PUSH_BUTTON_IN);
    }
    ////blink_backlight(0, 1);

    if (button_samples > 1 /* TODO: this needs to be set higher to avoid accidental rollbacks */) {
        console_printf("Flashing and resetting...\n");
        console_flush();
        ////blink_backlight(0, 1);
        boot_set_pending(0);
        ////blink_backlight(0, 1);
        hal_system_reset();
        return;
    }
}

void setup_watchdog() {
  NRF_WDT->CONFIG &= ~(WDT_CONFIG_SLEEP_Msk << WDT_CONFIG_SLEEP_Pos);
  NRF_WDT->CONFIG |= (WDT_CONFIG_HALT_Run << WDT_CONFIG_SLEEP_Pos);

  NRF_WDT->CONFIG &= ~(WDT_CONFIG_HALT_Msk << WDT_CONFIG_HALT_Pos);
  NRF_WDT->CONFIG |= (WDT_CONFIG_HALT_Pause << WDT_CONFIG_HALT_Pos);

  /* timeout (s) = (CRV + 1) / 32768 */
  const int timeoutSeconds = 7; // 7 seconds
  uint32_t crv = (((timeoutSeconds*1000u) << 15u) / 1000) - 1;
  NRF_WDT->CRV = crv;

  /* Enable reload requests */
  NRF_WDT->RREN = (WDT_RREN_RR0_Enabled << WDT_RREN_RR0_Pos);
  
  /* Start */
  NRF_WDT->TASKS_START = 1;
}



/// Called by MCUBoot when it has completed its work.
void boot_custom_start(
    uintptr_t flash_base,
    struct boot_rsp *rsp
) {
    ////blink_backlight(0, 1);
    console_printf("Bootloader done\n");
    console_flush();

    //  vector_table points to the Arm Vector Table for the appplication...
    //  First word contains initial MSP value (estack = end of RAM)
    //  Second word contains address of entry point (Reset_Handler)
    void *vector_table = (void *) (  //  Copied from MCUBoot main()
        flash_base +                 //  0
        rsp->br_image_off +          //  Offset of FLASH_AREA_IMAGE_0 (application image): 0x8000
        rsp->br_hdr->ih_hdr_size     //  Size of MCUBoot image header (0x20)
    );                               //  Equals 0x8020 (__isr_vector)
    //  console_printf("vector_table=%lx, flash_base=%lx, image_off=%lx, hdr_size=%lx\n", (uint32_t) vector_table, (uint32_t) flash_base, (uint32_t) rsp->br_image_off, (uint32_t) rsp->br_hdr->ih_hdr_size); console_flush();

    //  Relocate the application vector table to a 0x100 page boundary in ROM.
    relocate_vector_table(  //  Relocate the vector table...
        vector_table,       //  From the non-aligned application address (0x8020)
        (void *) RELOCATED_VECTOR_TABLE  //  To the relocated address aligned to 0x100 page boundary
    );
    ////blink_backlight(0, 1);

    setup_watchdog();
    
    //  Start the Active Firmware Image at the Reset_Handler function.
    hal_system_start(vector_table);
}

/// Relocate the Arm Vector Table from vector_table to relocated_vector_table.
/// relocated_vector_table must be aligned to 0x100 page boundary.
static void relocate_vector_table(void *vector_table, void *relocated_vector_table) {
    uint32_t *current_location = (uint32_t *) vector_table;
    uint32_t *new_location = (uint32_t *) relocated_vector_table;
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
