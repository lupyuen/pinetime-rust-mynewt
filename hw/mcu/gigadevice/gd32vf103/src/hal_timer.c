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

#include <stdint.h>
#include <errno.h>
#include <stdbool.h>
#include "os/mynewt.h"
#include <hal/hal_timer.h>
#include <mcu/plic.h>
#include <mcu/gd32vf103_hal.h>
#include "ext/Firmware/RISCV/drivers/n200_func.h"
#undef bool  //  TODO: Needed for gd32vf103.h
#include "ext/Firmware/GD32VF103_standard_peripheral/gd32vf103.h"

#define GD32VF103_HAL_TIMER_MAX     (3)

struct gd32vf103_hal_tmr {
    uint32_t periph;      //  Timer instance e.g. TIMER1
    rcu_periph_enum rcu;  //  RCU instance e.g. RCU_TIMER1
    uint32_t irq;         //  IRQ instance e.g. TIMER1_IRQn
    TAILQ_HEAD(hal_timer_qhead, hal_timer) sht_timers;  //  List of timer callbacks
};

#if MYNEWT_VAL(TIMER_0)
struct gd32vf103_hal_tmr gd32vf103_tmr0 = {
    TIMER1, RCU_TIMER1, TIMER1_IRQn
};
#endif
#if MYNEWT_VAL(TIMER_1)
struct gd32vf103_hal_tmr gd32vf103_tmr1 = {
    TIMER2, RCU_TIMER2, TIMER2_IRQn
};
#endif
#if MYNEWT_VAL(TIMER_2)
struct gd32vf103_hal_tmr gd32vf103_tmr2 = {
    TIMER3, RCU_TIMER3, TIMER2_IRQn
};
#endif

static struct gd32vf103_hal_tmr *gd32vf103_tmr_devs[GD32VF103_HAL_TIMER_MAX] = {
#if MYNEWT_VAL(TIMER_0)
    &gd32vf103_tmr0,
#else
    NULL,
#endif
#if MYNEWT_VAL(TIMER_1)
    &gd32vf103_tmr1,
#else
    NULL,
#endif
#if MYNEWT_VAL(TIMER_2)
    &gd32vf103_tmr2,
#else
    NULL,
#endif
};

#ifdef NOTUSED

    static uint8_t pwm_to_timer[GD32VF103_HAL_TIMER_MAX];

    static uint32_t
    hal_timer_cnt(struct gd32vf103_hal_tmr *tmr)
    {
        uint32_t cnt;
        int sr;
        uint32_t regs = (uint32_t) tmr->pwm_regs;

        __HAL_DISABLE_INTERRUPTS(sr);
        cnt = _REG32(regs, PWM_S) + tmr->value;
        /* Check if just overflowed */
        if (_REG32(regs, PWM_CFG) & PWM_CMP0) {
            cnt += _REG32(regs, PWM_CMP0) + 1;
        }
        __HAL_ENABLE_INTERRUPTS(sr);

        return cnt;
    }

    static void
    gd32vf103_tmr_check_first(struct gd32vf103_hal_tmr *tmr)
    {
        struct hal_timer *ht;

        ht = TAILQ_FIRST(&tmr->sht_timers);
        if (ht) {
            uint32_t cnt = hal_timer_cnt(tmr);
            int32_t ticks = (int32_t)(ht->expiry - cnt);
            if (ticks < _REG32(tmr->pwm_regs, PWM_CMP0)) {
                _REG32(tmr->pwm_regs, PWM_CMP1) = ticks;
                plic_enable_interrupt(tmr->pwmxcmp0_int + 1);
                return;
            }
        }
        _REG32(tmr->pwm_regs, PWM_CMP1) = _REG32(tmr->pwm_regs, PWM_CMP0);
        /* Disable PWMxCMP1 interrupt, leaving only CMP0 which is used all the time */
        plic_disable_interrupt(tmr->pwmxcmp0_int + 1);
    }

    /*
    * Call expired timer callbacks
    */
    static void
    gd32vf103_tmr_cbs(struct gd32vf103_hal_tmr *tmr)
    {
        uint32_t cnt;
        struct hal_timer *ht;

        while ((ht = TAILQ_FIRST(&tmr->sht_timers)) != NULL) {
            cnt = hal_timer_cnt(tmr);
            if (((int32_t)(cnt - ht->expiry)) >= 0) {
                TAILQ_REMOVE(&tmr->sht_timers, ht, link);
                ht->link.tqe_prev = NULL;
                ht->cb_func(ht->cb_arg);
            } else {
                break;
            }
        }
        gd32vf103_tmr_check_first(tmr);
    }

    void
    gd32vf103_pwm_cmp0_handler(int num)
    {
        int pwm_num = (num - INT_PWM0_BASE) >> 2;
        int timer_num = pwm_to_timer[pwm_num];
        struct gd32vf103_hal_tmr *tmr = gd32vf103_tmr_devs[timer_num];
        /* Turn of CMPxIP */
        _REG32(tmr->pwm_regs, PWM_CFG) &= ~PWM_CFG_CMP0IP;
        tmr->value += _REG32(tmr->pwm_regs, PWM_CMP0) + 1;
        gd32vf103_tmr_cbs(tmr);
    }

    void
    gd32vf103_pwm_cmp1_handler(int num)
    {
        int pwm_num = (num - INT_PWM0_BASE) >> 2;
        int timer_num = pwm_to_timer[pwm_num];
        struct gd32vf103_hal_tmr *tmr = gd32vf103_tmr_devs[timer_num];
        /* Turn of CMPxIP */
        _REG32(tmr->pwm_regs, PWM_CFG) &= ~PWM_CFG_CMP1IP;
        gd32vf103_tmr_cbs(tmr);
    }
#endif  //  NOTUSED

/**
 * hal timer init
 *
 * Initialize platform specific timer items
 *
 * @param timer_num     Timer number to initialize
 * @param cfg           Pointer to platform specific configuration
 *
 * @return int          0: success; error code otherwise
 */
int
hal_timer_init(int timer_num, void *cfg)
{
    struct gd32vf103_hal_tmr *tmr;

    if (timer_num >= GD32VF103_HAL_TIMER_MAX 
        || !(tmr = gd32vf103_tmr_devs[timer_num])) {
        return -1;
    }

    return 0;
}

/**
 * hal timer config
 *
 * Configure a timer to run at the desired frequency. This starts the timer.
 *
 * @param timer_num
 * @param freq_hz
 *
 * @return int
 */
int
hal_timer_config(int timer_num, uint32_t freq_hz)
{
    struct gd32vf103_hal_tmr *tmr;
    if (timer_num >= GD32VF103_HAL_TIMER_MAX || !(tmr = gd32vf103_tmr_devs[timer_num])) {
        return -1;
    }

    //  Based on Examples/TIMER/TIMER1_timebase/main.c
    eclic_global_interrupt_enable();
    eclic_set_nlbits(ECLIC_GROUP_LEVEL3_PRIO1);
    eclic_irq_enable(tmr->irq, 1, 0);

    /* ----------------------------------------------------------------------------
    Assume SystemCoreClock = 108 MHz max
    TIMER1 Configuration: 
    TIMER1CLK = SystemCoreClock/5400 = 20KHz.
    TIMER1 configuration is timing mode, and the timing is 0.2s(4000/20000 = 0.2s).
    CH0 update rate = TIMER1 counter clock/CH0CV = 20000/4000 = 5Hz.
    ---------------------------------------------------------------------------- */
    uint32_t prescaler = SystemCoreClock / freq_hz;
    if (prescaler > 0xffff) {
        assert(0);
        return -1;  //  Only 16 bits supported for prescaler
    }

    timer_parameter_struct timer_initpara;
    rcu_periph_clock_enable(tmr->rcu);
    timer_deinit(tmr->periph);
    //  Initialize TIMER init parameter struct
    timer_struct_para_init(&timer_initpara);
    //  TIMER1 configuration
    timer_initpara.prescaler         = prescaler;         //  Previously 5399
    timer_initpara.alignedmode       = TIMER_COUNTER_EDGE;
    timer_initpara.counterdirection  = TIMER_COUNTER_UP;  //  Count starts from 0
    timer_initpara.period            = 1;                 //  Count ends at 1, previously 4000
    timer_initpara.clockdivision     = TIMER_CKDIV_DIV1;
    timer_init(tmr->periph, &timer_initpara);

    timer_oc_parameter_struct timer_ocinitpara;
    //  Initialize TIMER channel output parameter struct
    timer_channel_output_struct_para_init(&timer_ocinitpara);
    //  CH0, CH1 and CH2 configuration in OC timing mode
    timer_ocinitpara.outputstate  = TIMER_CCX_ENABLE;
    timer_ocinitpara.ocpolarity   = TIMER_OC_POLARITY_HIGH;
    timer_ocinitpara.ocidlestate  = TIMER_OC_IDLE_STATE_LOW;
    timer_channel_output_config(            tmr->periph, TIMER_CH_0, &timer_ocinitpara);

    //  CH0 configuration in OC timing mode
    timer_channel_output_pulse_value_config(tmr->periph, TIMER_CH_0, 2000);  //  TODO: Why 2000
    timer_channel_output_mode_config(       tmr->periph, TIMER_CH_0, TIMER_OC_MODE_TIMING);
    timer_channel_output_shadow_config(     TIMER1, TIMER_CH_0, TIMER_OC_SHADOW_DISABLE);

    timer_interrupt_enable(                 tmr->periph, TIMER_INT_CH0);
    timer_enable(                           tmr->periph);

#ifdef OLD
    cpu_freq = get_cpu_freq();
    div = cpu_freq / freq_hz;

    if (div > (1 << tmr->max_scale) || div == 0) {
        return -1;
    }

    div += div >> 1;
    while (div) {
        div >>= 1;
        scale++;
    }

    _REG32(tmr->pwm_regs, PWM_CFG) = 0;
    _REG32(tmr->pwm_regs, PWM_COUNT) = 0;
    /* 15 -> 0xFFFF, 7 -> 0xFF*/
    _REG32(tmr->pwm_regs, PWM_CMP0) = (1 << (1 + tmr->max_scale)) - 1;
    _REG32(tmr->pwm_regs, PWM_CMP1) = _REG32(tmr->pwm_regs, PWM_CMP0);
    pwm_to_timer[(tmr->pwmxcmp0_int - INT_PWM0_BASE) >> 2] = (uint8_t) timer_num;
    plic_set_handler(tmr->pwmxcmp0_int, gd32vf103_pwm_cmp0_handler, 3);
    plic_set_handler(tmr->pwmxcmp0_int + 1, gd32vf103_pwm_cmp1_handler, 3);
    _REG32(tmr->pwm_regs, PWM_CFG) = PWM_CFG_ZEROCMP |
                                     PWM_CFG_ENALWAYS | scale;
    plic_enable_interrupt(tmr->pwmxcmp0_int);
#endif  //  OLD

    return 0;
}

/**
 * hal timer deinit
 *
 * De-initialize a HW timer.
 *
 * @param timer_num
 *
 * @return int
 */
int
hal_timer_deinit(int timer_num)
{
    struct gd32vf103_hal_tmr *tmr;
    int sr;

    if (timer_num >= GD32VF103_HAL_TIMER_MAX || !(tmr = gd32vf103_tmr_devs[timer_num])) {
        return -1;
    }
    __HAL_DISABLE_INTERRUPTS(sr);
#ifdef TODO
    _REG32(tmr->pwm_regs, PWM_CFG) = 0;
    plic_disable_interrupt(tmr->pwmxcmp0_int);
    plic_disable_interrupt(tmr->pwmxcmp0_int + 1);
    __HAL_ENABLE_INTERRUPTS(sr);
#endif  //  TODO
    return 0;
}

/**
 * hal timer get resolution
 *
 * Get the resolution of the timer. This is the timer period, in nanoseconds
 *
 * @param timer_num
 *
 * @return uint32_t The
 */
uint32_t
hal_timer_get_resolution(int timer_num)
{
    struct gd32vf103_hal_tmr *tmr;
    uint32_t cpu_freq;

    if (timer_num >= GD32VF103_HAL_TIMER_MAX || !(tmr = gd32vf103_tmr_devs[timer_num])) {
        return -1;
    }

    cpu_freq = get_cpu_freq();

    return 1000000000 / (cpu_freq >> (_REG32(tmr->pwm_regs, PWM_CFG) & PWM_CFG_SCALE));
}

/**
 * hal timer read
 *
 * Returns the timer counter.
 *
 * @return uint32_t The timer counter register.
 */
uint32_t
hal_timer_read(int timer_num)
{
    struct gd32vf103_hal_tmr *tmr;

    if (timer_num >= GD32VF103_HAL_TIMER_MAX || !(tmr = gd32vf103_tmr_devs[timer_num])) {
        return -1;
    }

    return hal_timer_cnt(tmr);
}

/**
 * hal timer delay
 *
 * Blocking delay for n ticks
 *
 * @param timer_num
 * @param ticks
 *
 * @return int 0 on success; error code otherwise.
 */
int
hal_timer_delay(int timer_num, uint32_t ticks)
{
    struct gd32vf103_hal_tmr *tmr;
    uint32_t until;

    if (timer_num >= GD32VF103_HAL_TIMER_MAX || !(tmr = gd32vf103_tmr_devs[timer_num])) {
        return -1;
    }

    until = hal_timer_cnt(tmr) + ticks;
    while ((int32_t)(hal_timer_cnt(tmr) - until) <= 0) {
        /* Loop here till finished */
    }

    return 0;
}

/**
 *
 * Initialize the HAL timer structure with the callback and the callback
 * argument. Also initializes the HW specific timer pointer.
 *
 * @param cb_func
 *
 * @return int
 */
int
hal_timer_set_cb(int timer_num, struct hal_timer *timer, hal_timer_cb cb_func,
                 void *arg)
{
    struct gd32vf103_hal_tmr *tmr;

    if (timer_num >= GD32VF103_HAL_TIMER_MAX || !(tmr = gd32vf103_tmr_devs[timer_num])) {
        return -1;
    }

    timer->cb_func = cb_func;
    timer->cb_arg = arg;
    timer->link.tqe_prev = NULL;
    timer->bsp_timer = tmr;

    return 0;
}

int
hal_timer_start(struct hal_timer *timer, uint32_t ticks)
{
    struct gd32vf103_hal_tmr *tmr;
    uint32_t tick;

    tmr = (struct gd32vf103_hal_tmr *)timer->bsp_timer;

    tick = ticks + hal_timer_cnt(tmr);
    return hal_timer_start_at(timer, tick);
}

int
hal_timer_start_at(struct hal_timer *timer, uint32_t tick)
{
    struct gd32vf103_hal_tmr *tmr;
    struct hal_timer *ht;
    int sr;
    bool first = true;

    tmr = (struct gd32vf103_hal_tmr *)timer->bsp_timer;

    timer->expiry = tick;

    __HAL_DISABLE_INTERRUPTS(sr);

    if (TAILQ_EMPTY(&tmr->sht_timers)) {
        TAILQ_INSERT_HEAD(&tmr->sht_timers, timer, link);
    } else {
        TAILQ_FOREACH(ht, &tmr->sht_timers, link) {
            if ((int32_t)(timer->expiry - ht->expiry) < 0) {
                TAILQ_INSERT_BEFORE(ht, timer, link);
                break;
            }
            first = false;
        }
        if (!ht) {
            TAILQ_INSERT_TAIL(&tmr->sht_timers, timer, link);
        }
    }

    if (first) {
        gd32vf103_tmr_check_first(tmr);
    }

    __HAL_ENABLE_INTERRUPTS(sr);

    return 0;
}

/**
 * hal timer stop
 *
 * Stop a timer.
 *
 * @param timer
 *
 * @return int
 */
int
hal_timer_stop(struct hal_timer *timer)
{
    struct gd32vf103_hal_tmr *tmr;
    int sr;
    bool recalc = false;

    __HAL_DISABLE_INTERRUPTS(sr);

    tmr = (struct gd32vf103_hal_tmr *)timer->bsp_timer;
    /* Is it still in the list ? */
    if (timer->link.tqe_prev != NULL) {
        /* Recalculation only if removing first timer */
        recalc = (timer == TAILQ_FIRST(&tmr->sht_timers));
        TAILQ_REMOVE(&tmr->sht_timers, timer, link);
        timer->link.tqe_prev = NULL;

        if (recalc) {
            gd32vf103_tmr_check_first(tmr);
        }
    }
    __HAL_ENABLE_INTERRUPTS(sr);

    return 0;
}
