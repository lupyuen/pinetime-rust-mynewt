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
//  Alarm Functions
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include <hal/hal_system.h>
#include <console/console.h>
#include "rcc.h"
#include "rtc.h"
#include "pwr.h"
#include "low_power.h"
#include "alarm.h"

//  Select Oscillator for the realtime clock: 
//  RCC_HSE: 62.5 kHz, fastest oscillator, doesn't work in Stop or Standby Low Power mode. 
//  RCC_LSE: 32.768 kHz, slowest oscillator, works in Stop or Standby Low Power mode. 
//  RCC_LSI: 40 kHz, works in Stop or Standby Low Power mode. 
//  We choose RCC_LSE because we need to wake up in Low Power mode.

#define USE_RCC_LSE  //  We use Low Power Mode

#ifdef USE_RCC_LSE   //  If using Low Power Mode...
const enum rcc_osc clock_source = RCC_LSE;
#else   //  If not using Low Power Mode...
const enum rcc_osc clock_source = RCC_HSE;
#endif  //  USE_RCC_LSE

//  Set the clock prescaling value, so that we will get a tick interrupt every 1 millisecond. Dependent on LSE or HSE clock selection.
#ifdef USE_RCC_LSE
const uint32_t prescale = 32;        //  For RCC_LSE: 1 millisecond tick (should actually be 32.7)
// const uint32_t prescale = 327;    //  For RCC_LSE: 10 millisecond tick
#else
const uint32_t prescale = 62;        //  For RCC_HSE: 1 millisecond tick (should actually be 62.5)
// const uint32_t prescale = 62500;  //  For RCC_HSE: 1 second tick
#endif  //  USE_RCC_LSE

static void (*tickFunc)(void) = NULL;     //  This is the tick function we will call every millisecond.  
static void (*alarmFunc)(void) = NULL;    //  This is the alarm function we will upon getting an RTC alarm.
static volatile uint32_t tickCount = 0;   //  Number of millisecond ticks elapsed.
static volatile uint32_t alarmCount = 0;  //  Number of alarms elapsed.
 
void rtc_isr(void);
void rtc_alarm_isr(void);

/// alarm_setup() will set this to 1 when RTC has been configured. Used by libs/adc_stm32f1/src/adc_stm32f1.c to prevent configuring RTC twice.
int rtc_configured = 0;

static void alarm_setup(void) {
    //  Setup RTC interrupts for tick and alarm wakeup.
    rtc_configured = 1;  //  Tell adc_stm32f1 that the clocks have already been configured, don't configure again.

    //  Power on the RTC before using.
    rcc_enable_rtc_clock();
    rtc_interrupt_disable(RTC_SEC);
    rtc_interrupt_disable(RTC_ALR);
    rtc_interrupt_disable(RTC_OW);

    if (!power_standby_wakeup()) {  //  At power on...
        //  rtc_auto_awake() will not reset the RTC when you press the RST button.
        //  It will also continue to count while the MCU is held in reset. If
        //  you want it to reset, use rtc_awake_from_off()
        rtc_awake_from_off(clock_source);  //  This will enable RTC.
        rtc_set_prescale_val(prescale);

        //  Set the RTC time only at power on. Don't set it when waking from standby.
        rtc_set_counter_val(0);              //  Start counting millisecond ticks from 0
        rtc_set_alarm_time((uint32_t) -1);   //  Reset alarm to -1 or 0xffffffff so we don't trigger now

    } else {  //  At standby wakeup...
        //  From: https://github.com/libopencm3/libopencm3-examples/blob/master/examples/stm32/f1/stm32vl-discovery/rtc/rtc.c
        //  rtc_auto_awake(): If the RTC is pre-configured just allow access, don't reconfigure.
        //  Otherwise enable it with the clock source and set the prescale value.
        rtc_auto_awake(clock_source, prescale);
    }
    
    exti_set_trigger(EXTI17, EXTI_TRIGGER_RISING);  //  Enable alarm wakeup via the interrupt
    exti_enable_request(EXTI17);

    NVIC_SetVector(RTC_IRQn,       (uint32_t) rtc_isr);        //  Set the Interrupt Service Routine for RTC
    NVIC_SetVector(RTC_Alarm_IRQn, (uint32_t) rtc_alarm_isr);  //  Set the Interrupt Service Routine for RTC Alarm
    
    nvic_enable_irq(NVIC_RTC_IRQ);        //  Enable RTC tick interrupt processing
    nvic_enable_irq(NVIC_RTC_ALARM_IRQ);  //  Enable RTC alarm wakeup interrupt processing

    __disable_irq();                      //  Disable interrupts while we make changes
    rtc_clear_flag(RTC_SEC);
    rtc_clear_flag(RTC_ALR);
    rtc_clear_flag(RTC_OW);
    rtc_interrupt_enable(RTC_ALR);        //  Allow RTC to generate alarm interrupts
    //  rtc_interrupt_enable(RTC_SEC);    //  Not used: Allow RTC to generate tick interrupts
    __enable_irq();                       //  Enable interrupts
}

void platform_start_timer(void (*tickFunc0)(void), void (*alarmFunc0)(void)) {
    //  Start the STM32 Timer to generate interrupt ticks to perform task switching.
    tickFunc = tickFunc0;    //  Allow tickFunc to be modified at every call to platform_start_timer().
    alarmFunc = alarmFunc0;  //  Allow alarmFunc to be modified at every call to platform_start_timer().
    
    //  But system timer will only be started once.
    static bool timerStarted = false;
    if (timerStarted) { return; }
    timerStarted = true;
    console_printf("platform_start_timer\n");
    alarm_setup();
}

void platform_set_alarm(uint32_t millisec) {
    //  Set alarm for millisec milliseconds from now.
    //  debug_print("alm <"); debug_print_unsigned(millisec / 1000);
    if (!alarmFunc) { console_printf("alm? "); }
    volatile uint32_t now = rtc_get_counter_val();

    //  Not documented, but you must disable write protection else the alarm time will not be set and rtc_exit_config_mode() will hang.
    //  TODO: Disable only if write protection is enabled.
    pwr_disable_backup_domain_write_protect();
    rtc_set_alarm_time(now + millisec);
}

volatile uint32_t platform_get_alarm(void) {
    //  Get alarm time.
    return rtc_get_alarm_val();
}

void rtc_isr(void) {
    //  Interrupt Service Routine for RTC Tick, Alarm, Overflow.  Don't call any I/O functions here.
    //  Alarm handled by rtc_alarm_isr()
    if (rtc_check_flag(RTC_SEC)) {
        //  We hit an RTC tick interrupt.
        rtc_clear_flag(RTC_SEC);
        tickCount++;
        //  Call the tick function.
        if (tickFunc != NULL) { tickFunc(); }
        return;
    }
}

void rtc_alarm_isr(void) {
    //  Interrupt Service Routine for RTC Alarm Wakeup.  Don't call any I/O functions here.
    //  The RTC alarm appears as EXTI 17 which must be reset independently of the RTC alarm flag.
    exti_reset_request(EXTI17);
    rtc_clear_flag(RTC_ALR);
    alarmCount++;
    //  Call the alarm function.
    if (alarmFunc != NULL) { alarmFunc(); }
}

volatile uint32_t millis(void) {
    //  Return the number of millisecond ticks since startup.
    //  Compatible with Arduino's millis() function.
    return rtc_get_counter_val();
}

volatile uint32_t platform_alarm_count(void) {
    //  Return the number of alarms triggered since startup.
    return alarmCount;  //  For testing whether alarm ISR was called.
}

volatile uint32_t platform_tick_count(void) {
    //  Return the number of alarms triggered since startup.  Less accurate, excludes ARM Semihosting time.
    return tickCount;  //  For testing whether tick ISR was called.
}