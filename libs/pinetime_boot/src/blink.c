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
//  Blink the backlight for showing bootloader status
#include <inttypes.h>
#include <os/mynewt.h>
#include <hal/hal_gpio.h>

#define PUSH_BUTTON_IN  13  //  GPIO Pin P0.13: PUSH BUTTON_IN

/// GPIO settings for the backlight: LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23)
static const uint8_t backlights[] = {    
    14,  //  Low Backlight
    22,  //  Mid Backlight
    23,  //  High Backlight
};

/// Define pulse patterns from slow to fast: From Low (0) to Mid (1) to High (2) and back
static const uint8_t slower_pulse[]  = {
    1, 1, 1, 1, 1, 1, 
    0, 0, 0, 0, 0, 0, 
    1, 1, 1, 1, 1, 1, 
    2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2,
};  //  Slower pulse
static const uint8_t slow_pulse[]    = {
    1, 1, 1, 
    0, 0, 0, 
    1, 1, 1, 
    2, 2, 2,
    2, 2, 2,
    2, 2, 2,
};  //  Slow pulse
static const uint8_t fast_pulse[]    = {
    1, 1, 
    0, 0, 
    1, 1, 
    2, 2,
    2, 2,
    2, 2,
}; //  Fast pulse
static const uint8_t faster_pulse[]  = {1, 0, 1, 2, 2, 2};  //  Faster pulse
static const uint8_t fastest_pulse[] = {0, 2, 2};  //  Fastest pulse

static void blink_pattern(const uint8_t pattern[], int length);
static void delay_ms(uint32_t ms);

/// Init the backlights
static void init_backlight(void) {
    for (int b = 0; b < sizeof(backlights); b++) {
        uint8_t gpio = backlights[b];
        //  If High backlight...
        if (b == 2) {
            //  Switch to on
            hal_gpio_init_out(gpio, 0);
        } else {
            //  Switch to off
            hal_gpio_init_out(gpio, 1);
        }
    }
}

/// Blink the backlight with a pattern for the number of repetitions
void blink_backlight(int pattern_id, int repetitions) {
    //  Init the backlight the first time
    static int first_blink = 1;
    if (first_blink) {
        first_blink = 0;
        init_backlight();
    }
    for (int i = 0; i < repetitions; i++) {
        switch (pattern_id) {
            case 0:  blink_pattern(slower_pulse,  sizeof(slower_pulse));  break;
            case 1:  blink_pattern(slow_pulse,    sizeof(slow_pulse));    break;
            case 2:  blink_pattern(fast_pulse,    sizeof(fast_pulse));    break;
            case 3:  blink_pattern(faster_pulse,  sizeof(faster_pulse));  break;
            default: blink_pattern(fastest_pulse, sizeof(fastest_pulse)); break;
        }
    }
}

/// Blink backlight according to the pattern: 0=Low, 1=Mid, 2=High
static void blink_pattern(const uint8_t pattern[], int length) {
    for (int i = 0; i < length; i++) {
        //  Switch on the Low, Mid or High backlight. Backlight is active when low
        uint8_t level = pattern[i];
        for (int b = 0; b < sizeof(backlights); b++) {
            uint8_t gpio = backlights[b];
            //  If the Low / Mid / High level matches...
            if (b == level) {                
                //  Switch to on
                hal_gpio_write(gpio, 0);
            } else {
                //  Switch to off
                hal_gpio_write(gpio, 1);
            }
        }

        //uint8_t gpio = backlights[level];
        //hal_gpio_write(gpio, 0);

        //  Pause a short while
        delay_ms(10);

        //  Switch off the Low, Mid or High backlight
        uint8_t gpio = backlights[level];
        hal_gpio_write(gpio, 1);
    }
}

/// Sleep for the specified number of milliseconds
static void delay_ms(uint32_t ms) {
    //  os_time_delay() doesn't work in MCUBoot because the scheduler has not started
    uint8_t button_samples = 0;
    for (int i = 0; i < ms; i++) {
        for (int delay = 0; delay < 100000; delay++) {}
        button_samples += hal_gpio_read(PUSH_BUTTON_IN);
    }
}