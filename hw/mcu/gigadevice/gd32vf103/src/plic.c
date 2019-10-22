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
#include "os/mynewt.h"
#include <mcu/plic.h>
#include "ext/Firmware/RISCV/drivers/n200_func.h"
#undef bool  //  TODO: Needed for gd32vf103.h
#include "ext/Firmware/GD32VF103_standard_peripheral/gd32vf103.h"

//  ECLIC Interrupt Handler based on hw/mcu/gigadevice/gd32vf103/src/ext/Firmware/RISCV/env_Eclipse/init.c.TODO
//  and https://github.com/nucleisys/Bumblebee_Core_Doc/blob/master/Bumblebee%20Core%20Architecture%20Manual.pdf

//  For External Interrupts we are using trap_entry() at mtvec.
/*  Each interrupt source of the ECLIC can be set to vectored or non-vectored interrupt (via the
shv field of the register clicintattr[i]). The key points are as follows:

- If the interrupt is configured as a vectored interrupt, then the core will jump to the
corresponding target address of this interrupt in the Vector Table Entry when this
interrupt is taken. For details about the Interrupt Vector Table, please refer to Section
5.8. For details of the vectored processing mode, please refer to Section 5.13.2. 

- If the interrupt is configured as a non-vectored interrupt, then the core will jump to a
common base address shared by all interrupts (mtvec). For details of the non-vectored
processing mode, please refer to Section 5.13.1 */

interrupt_handler_t plic_interrupts[ECLIC_NUM_INTERRUPTS];

void
plic_set_handler(int int_num, interrupt_handler_t handler, int priority)
{
    if (int_num > 0 && int_num < ECLIC_NUM_INTERRUPTS) {
        plic_interrupts[int_num] = handler;
        //  Set priority of the handler.
        eclic_set_irq_priority(int_num, priority);
    }
}

void
plic_enable_interrupt(int int_num)
{
    if (int_num > 0 && int_num < ECLIC_NUM_INTERRUPTS) {
        //  Enable the interrupt.
        eclic_enable_interrupt(int_num);
    }
}

void
plic_disable_interrupt(int int_num)
{
    if (int_num > 0 && int_num < ECLIC_NUM_INTERRUPTS) {
        //  Disable the interrupt.
        eclic_disable_interrupt(int_num);
    }
}

void
external_interrupt_handler(uintptr_t mcause)
{
    //  Called by trap_entry() in repos/apache-mynewt-core/kernel/os/src/arch/rv32imac/ctx.s
    int num = PLIC_REG(PLIC_CLAIM_OFFSET);
    //  TODO: Handle all pending interrupts.
    while (num) {
        //  Claim the interrupt
        PLIC_REG(PLIC_CLAIM_OFFSET) = num;
        //  Call interrupt handler
        plic_interrupts[num](num);
        //  Check if other interupt is already pending
        num = PLIC_REG(PLIC_CLAIM_OFFSET);
    }
}
