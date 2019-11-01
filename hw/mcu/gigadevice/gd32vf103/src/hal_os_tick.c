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
#include "os/mynewt.h"
#include "hal/hal_os_tick.h"
#include <env/encoding.h>

static uint64_t last_tick_time;
static uint32_t ticks_per_ostick;

#define RTC_FREQ        32768

uint64_t get_timer_value(void);
void timer_interrupt_handler(void);
void set_mtimecmp(uint64_t time);

void
os_tick_idle(os_time_t ticks)
{
    //  Wait for the specified number of ticks.  By default, we will use tickless sleep.
    if (MYNEWT_VAL(OS_TICKLESS_SLEEP) && ticks > 1) {
        //  Set mtimecmp to trigger an interrupt later.  If the value of mtime is greater 
        //  than the value of mtimecmp, then a timer interrupt is generated.
        set_mtimecmp(last_tick_time + ticks_per_ostick * ticks);
    }
    //  Wait for an interrupt, timer or otherwise.
    __asm volatile ("wfi");
    if (MYNEWT_VAL(OS_TICKLESS_SLEEP) && ticks > 1) {
        //  Upon receiving an interrupt, update the current time.
        timer_interrupt_handler();
    }
}

void
os_tick_init(uint32_t os_ticks_per_sec, int prio)
{
    //  Set mtimecmp to trigger an interrupt 1 tick later.
    ticks_per_ostick = RTC_FREQ / os_ticks_per_sec;
    last_tick_time = get_timer_value();
    set_mtimecmp(last_tick_time + ticks_per_ostick);
    //  TODO: mie is not used in ECLIC mode.
    set_csr(mie, MIP_MTIP);
}

void
timer_interrupt_handler(void)
{
    //  Upon receiving an interrupt, update the current time.  Trigger an interrupt 1 tick later.
    int delta;
    int ticks;
    uint64_t time = get_timer_value();

    delta = (int)(time - last_tick_time);
    ticks = (int)(delta / ticks_per_ostick);

    last_tick_time += ticks * ticks_per_ostick;

    //  Set mtimecmp to trigger an interrupt 1 tick later.
    set_mtimecmp(last_tick_time + ticks_per_ostick);

    os_time_advance(ticks);
}

//  From repos/apache-mynewt-core/kernel/os/src/arch/rv32imac/os_arch_rv32imac.c
void
set_mtimecmp(uint64_t time)
{
    //  Set mtimecmp to trigger an interrupt later at the specified time.  If the value of mtime is greater than the value of mtimecmp, then a timer interrupt is generated.
    CLINT_REG(CLINT_MTIMECMP + 4) = -1;
    CLINT_REG(CLINT_MTIMECMP) = (uint32_t) time;
    CLINT_REG(CLINT_MTIMECMP + 4) = (uint32_t) (time >> 32);
}
