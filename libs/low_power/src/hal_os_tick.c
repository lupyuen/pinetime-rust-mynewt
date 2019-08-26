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
//  Updated HAL to support low power tickless task scheduler. Derived from repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_os_tick.c
#define LOW_POWER

#include <assert.h>
#include "os/mynewt.h"
#include <hal/hal_os_tick.h>

extern void console_buffer(const char *buffer, unsigned int length);
extern void console_printhex(uint8_t v);
extern void power_init(uint32_t os_ticks_per_sec, uint32_t reload_val, int prio);
extern void power_sleep(os_time_t ticks);

void
__wrap_os_tick_idle(os_time_t ticks)
{
    OS_ASSERT_CRITICAL();
#ifdef LOW_POWER
    //  Sleep for the number of ticks.
    power_sleep(ticks);
#else
    //  console_buffer(".", 1);
    //  console_printhex(ticks);
    __DSB();
    __WFI();
#endif  //  LOW_POWER
}

void
__wrap_os_tick_init(uint32_t os_ticks_per_sec, int prio)
{
    uint32_t reload_val;

    reload_val = ((uint64_t)SystemCoreClock / os_ticks_per_sec) - 1;

#ifdef LOW_POWER
    //  Init the power management.
    power_init(os_ticks_per_sec, reload_val, prio);
#else
    /* Set the system time ticker up */
    SysTick->LOAD = reload_val;
    SysTick->VAL = 0;
    SysTick->CTRL = 0x0007;

    /* Set the system tick priority */
    NVIC_SetPriority(SysTick_IRQn, prio);

    /*
     * Keep clocking debug even when CPU is sleeping, stopped or in standby.
     */
#if !MYNEWT_VAL(MCU_STM32F0)
    DBGMCU->CR |= (DBGMCU_CR_DBG_SLEEP | DBGMCU_CR_DBG_STOP | DBGMCU_CR_DBG_STANDBY);
#else
    DBGMCU->CR |= (DBGMCU_CR_DBG_STOP | DBGMCU_CR_DBG_STANDBY);
#endif
#endif  //  LOW_POWER
}
