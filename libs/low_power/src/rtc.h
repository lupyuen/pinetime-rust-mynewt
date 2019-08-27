 /*
  * This file is part of the libopencm3 project.
  *
  * Copyright (C) 2009 Federico Ruiz-Ugalde <memeruiz at gmail dot com>
  * Copyright (C) 2009 Uwe Hermann <uwe@hermann-uwe.de>
  * Copyright (C) 2010 Thomas Otto <tommi@viadmin.org>
  *
  * This library is free software: you can redistribute it and/or modify
  * it under the terms of the GNU Lesser General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public License
  * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  */
//  Real-Time Clock Functions from libopencm3 STM32F1
#ifndef __LOW_POWER_RTC_H__
#define __LOW_POWER_RTC_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define NVIC_RTC_IRQ 3
#define NVIC_RTC_ALARM_IRQ 41
#define EXTI17                          (1 << 17)

enum exti_trigger_type {    
    EXTI_TRIGGER_RISING,    
    EXTI_TRIGGER_FALLING,    
    EXTI_TRIGGER_BOTH 
};

/** RTC Interrupt Flags */
typedef enum {
        /** Counter Second Flag */      RTC_SEC,
        /** Alarm Event Flag */         RTC_ALR,
        /** Counter Overflow Flag */    RTC_OW,
} rtcflag_t;

void nvic_enable_irq(uint8_t irqn);
void exti_set_trigger(uint32_t extis, enum exti_trigger_type trig);
void exti_enable_request(uint32_t extis);
void exti_reset_request(uint32_t extis);
void rtc_awake_from_standby(void);
void rtc_awake_from_off(enum rcc_osc clock_source);
void rtc_auto_awake(enum rcc_osc clock_source, uint32_t prescale_val);
void rtc_set_prescale_val(uint32_t prescale_val);
void rtc_set_alarm_time(uint32_t alarm_time);
uint32_t rtc_get_counter_val(void);
uint32_t rtc_get_alarm_val(void);
void rtc_set_counter_val(uint32_t counter_val);
void rtc_interrupt_enable(rtcflag_t flag_val);
void rtc_interrupt_disable(rtcflag_t flag_val);
void rtc_clear_flag(rtcflag_t flag_val);
uint32_t rtc_check_flag(rtcflag_t flag_val);
void rtc_enter_config_mode(void);
void rtc_exit_config_mode(void);

#ifdef __cplusplus
}
#endif
#endif  //  __LOW_POWER_RTC_H__