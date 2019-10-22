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
//  Patched functions for repos/apache-mynewt-core/kernel/os/src/arch/rv32imac/os_arch_rv32imac.c
//  Based on hw/mcu/gigadevice/gd32vf103/src/ext/Firmware/RISCV/env_Eclipse/init.c.TODO
//  and https://github.com/nucleisys/Bumblebee_Core_Doc/blob/master/Bumblebee%20Core%20Architecture%20Manual.pdf

#include "os/mynewt.h"
//#include "os_priv.h"
#include <hal/hal_bsp.h>
#include <hal/hal_os_tick.h>
#include <env/encoding.h>
#include <mcu/plic.h>
#include "ext/Firmware/RISCV/drivers/n200_func.h"
#undef bool  //  TODO: Needed for gd32vf103.h
#include "ext/Firmware/GD32VF103_standard_peripheral/gd32vf103.h"

extern void trap_entry();                   //  Defined in repos/apache-mynewt-core/kernel/os/src/arch/rv32imac/ctx.s
extern uint32_t disable_mcycle_minstret();  //  Defined in start.S

#define OS_TICK_PRIO 0

os_error_t
os_arch_os_init(void)
{
    os_error_t err = OS_OK;

	//  Enable the ECLIC unit for handling interrupts.
	eclic_init(ECLIC_NUM_INTERRUPTS);
	eclic_mode_enable();
	//  printf("After ECLIC mode enabled, the mtvec value is %x \n\n\r", read_csr(mtvec));

    //  Before enter into main, add the cycle/instret disable by default to save power,
    //  only use them when needed to measure the cycle/instret
	disable_mcycle_minstret();
    
    /*  Each interrupt source of the ECLIC can be set to vectored or non-vectored interrupt (via the
    shv field of the register clicintattr[i]). The key points are as follows:

    - If the interrupt is configured as a vectored interrupt, then the core will jump to the
    corresponding target address of this interrupt in the Vector Table Entry when this
    interrupt is taken. For details about the Interrupt Vector Table, please refer to Section
    5.8. For details of the vectored processing mode, please refer to Section 5.13.2. 

    - If the interrupt is configured as a non-vectored interrupt, then the core will jump to a
    common base address shared by all interrupts (mtvec). For details of the non-vectored
    processing mode, please refer to Section 5.13.1 */

    //  Set all external interrupts to default handler. 
    //  For External Interrupts we are using trap_entry() at mtvec.
    int i;
    for (i = 0; i < ECLIC_NUM_INTERRUPTS; ++i) {
        plic_interrupts[i] = plic_default_isr;
        //  Default priority set to 0, never interrupt
        eclic_set_irq_priority(i, 0);
    }

    //  Disable all interrupts
    for (i = 0; i < ECLIC_NUM_INTERRUPTS; ++i) {
        eclic_disable_interrupt(i);
    }

    //  Enable interrupts at 0 level (min threshold = 0)
    eclic_set_mth(0);

    //  Set main trap handler, which will call external_interrupt_handler() for external interrupts.
    write_csr(mtvec, &trap_entry);

    os_arch_init();

    return err;
}

#ifdef NOTUSED
    /* Set all external interrupts to default handler */
    for (i = 0; i < PLIC_NUM_INTERRUPTS; ++i) {
        plic_interrupts[i] = plic_default_isr;
        /* Default priority set to 0, never interrupt */
        PLIC_REG(PLIC_PRIORITY_OFFSET + i * 4) = 0;
    }

    /* Disable all interrupts */
    for (i = 0; i < (31 + PLIC_NUM_INTERRUPTS) / 8; i  += 4) {
        PLIC_REG(PLIC_ENABLE_OFFSET + i) = 0;
    }

    /* Enable interrupts at 0 level */
    PLIC_REG(PLIC_THRESHOLD_OFFSET) = 0;

    /* Set main trap handler */
    write_csr(mtvec, &trap_entry);
#endif  //  NOTUSED

#ifdef NOTUSED
uint32_t
os_arch_start(void)
{
    struct os_task *t;
    struct os_task fake_task;

    /* Get the highest priority ready to run to set the current task */
    t = os_sched_next_task();

    /* Clean software interrupt, and enable it */
    CLINT_REG(CLINT_MSIP) = 0;
    set_csr(mie, MIP_MSIP);
    /* Enable external interrupts */
    set_csr(mie, MIP_MEIP);

    /* Intitialize and start system clock timer, this enable timer interrupt */
    os_tick_init(OS_TICKS_PER_SEC, OS_TICK_PRIO);

    /* Mark the OS as started, right before we run our first task */
    g_os_started = 1;

    /* Perform context switch */
    os_arch_ctx_sw(t);

    /*
     * First time setup fake os_task struct that only has one pointer for SP
     * Having that will make context switch function work same for first
     * and every other time.
     * This fake SP will be used during initial context switch to store SP
     * that will never be used.
     */
    os_sched_set_current_task(&fake_task);

    /* Enable interrupts */
    set_csr(mstatus, MSTATUS_MIE);

    /* This should not be reached */
    return (uint32_t) (t->t_arg);
}
#endif  //  NOTUSED

#ifdef NOTUSED
    struct context_switch_frame {
        uint32_t  pc;
        /* Callee saved registers */
        uint32_t  s0;
        uint32_t  s1;
        uint32_t  s2;
        uint32_t  s3;
        uint32_t  s4;
        uint32_t  s5;
        uint32_t  s6;
        uint32_t  s7;
        uint32_t  s8;
        uint32_t  s9;
        uint32_t  s10;
        uint32_t  s11;
        /* Caller saved register */
        uint32_t  ra;
        uint32_t  gp;
        uint32_t  tp;
        uint32_t  t0;
        uint32_t  t1;
        uint32_t  t2;
        uint32_t  t3;
        uint32_t  t4;
        uint32_t  t5;
        uint32_t  t6;
        uint32_t  a0;
        uint32_t  a1;
        uint32_t  a2;
        uint32_t  a3;
        uint32_t  a4;
        uint32_t  a5;
        uint32_t  a6;
        uint32_t  a7;
    };

    uint32_t
    mtime_lo(void)
    {
        return CLINT_REG(CLINT_MTIME);
    }

    uint32_t
    mtime_hi(void)
    {
        return CLINT_REG(CLINT_MTIME + 4);
    }

    uint64_t
    get_timer_value(void)
    {
        while (1) {
            uint32_t hi = mtime_hi();
            uint32_t lo = mtime_lo();
            if (hi == mtime_hi())
                return ((uint64_t)hi << 32) | lo;
        }
    }

    void
    set_mtimecmp(uint64_t time)
    {
        CLINT_REG(CLINT_MTIMECMP + 4) = -1;
        CLINT_REG(CLINT_MTIMECMP) = (uint32_t) time;
        CLINT_REG(CLINT_MTIMECMP + 4) = (uint32_t) (time >> 32);
    }

    unsigned long
    get_timer_freq()
    {
    return 32768;
    }

    /* XXX: determine how to deal with running un-privileged */
    /* only priv currently supported */
    uint32_t os_flags = OS_RUN_PRIV;

    extern struct os_task g_idle_task;

    #define OS_TICK_PRIO 0

    static int
    os_in_isr(void)
    {
        // TODO:
        return 0;
    }

    void
    timer_handler(void)
    {
        os_time_advance(1);
    }

    void
    os_arch_ctx_sw(struct os_task *t)
    {
        if ((os_sched_get_current_task() != 0) && (t != 0)) {
            os_sched_ctx_sw_hook(t);
        }

        /*
        * This request software interrupt that is used for contect switching
        */
        CLINT_REG(CLINT_MSIP) = 1;
    }

    os_sr_t
    os_arch_save_sr(void)
    {
        uint32_t isr_ctx;

        isr_ctx = clear_csr(mstatus, MSTATUS_MIE) & MSTATUS_MIE;

        return isr_ctx;
    }

    void
    os_arch_restore_sr(os_sr_t isr_ctx)
    {
        if (isr_ctx) {
            set_csr(mstatus, MSTATUS_MIE);
        }
    }

    int
    os_arch_in_critical(void)
    {
        return !(read_csr(mstatus) & MSTATUS_MIE);
    }

    /* assumes stack_top will be 8 aligned */

    os_stack_t *
    os_arch_task_stack_init(struct os_task *t, os_stack_t *stack_top, int size)
    {
        struct context_switch_frame *sf;
        uint32_t *reg;

        /* Get stack frame pointer */
        sf = (struct context_switch_frame *) ((uint8_t *) stack_top - sizeof(*sf));
        reg = &sf->a7;

        /* Zero out registers except PC which will be set */
        while (reg != &sf->pc) {
            *reg-- = 0;
        }

        /* Set remaining portions of stack frame */
        sf->pc = (uint32_t) t->t_func;
        sf->a0 = (uint32_t) t->t_arg;

        return (os_stack_t *) sf;
    }

    void
    os_arch_init(void)
    {
        os_init_idle_task();
    }

    os_error_t
    os_arch_os_start(void)
    {
        os_error_t err;

        err = OS_ERR_IN_ISR;
        if (os_in_isr() == 0) {
            err = OS_OK;
            /* should be in kernel mode here */
            os_arch_start();
        }

        return err;
    }

    void
    software_interrupt_handler(uintptr_t mcause)
    {
    }
#endif  //  NOTUSED
