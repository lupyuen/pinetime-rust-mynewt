//  Implement Power Management functions
#include <assert.h>
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include <hal/hal_system.h>
#include <console/console.h>
#include "rtc.h"
#include "power.h"

#define _SET_BIT(var, bit)   { var |= bit; }   //  Set the specified bit of var to 1, e.g. _SET_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP) sets bit SCB_SCR_SLEEPDEEP of SCB_SCR to 1.
#define _CLEAR_BIT(var, bit) { var &= ~bit; }  //  Set the specified bit of var to 0, e.g. _CLEAR_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP) sets bit SCB_SCR_SLEEPDEEP of SCB_SCR to 0.

void power_sync_time();
void target_enter_sleep_mode(void);
void target_enter_deep_sleep_stop_mode(void);
void target_enter_deep_sleep_standby_mode(void);
void pwr_voltage_regulator_low_power_in_stop(void);
void pwr_set_stop_mode(void);
void pwr_set_standby_mode(void);
void pwr_clear_wakeup_flag(void);

/// Mynewt maintains the current time here
extern os_time_t g_os_time;

/// `bc95g` driver will set this to 1 so that `power_sleep()` will not sleep when network is busy connecting. See libs/bc95g/src/transport.cpp
int network_is_busy = 0;

int network_has_transmitted = 0;

static uint32_t last_ticks = 0;  //  Expected ticks to be slept for last call to power_sleep()
static uint32_t start_time = 0;  //  Start time (in ticks) for last call to power_sleep()
static uint32_t end_time = 0;    //  End time (in ticks) for last call to power_sleep()
static uint32_t max_sleep = 1;

void power_sleep(os_time_t ticks) {    
    //  Set the wakeup alarm for current time + ticks milliseconds.
    //  if (ticks < 2000) { ticks = 2000; }  //  Force to sleep in blocks of 2 seconds
    if (ticks < 10) { ticks = 10; }  //  Force to sleep at least 10 milliseconds

    //  If network is busy connecting, or ticks is 0, don't sleep.  AT response may be garbled if we sleep.
    if (network_is_busy || ticks == 0) { power_sync_time(); return; }

    //  After transmission, sleep for 60 seconds.
    if (network_has_transmitted) { 
        ticks = 60 * 1000; 
        int reset_cause = power_reset_cause();
        console_printf("reset_cause %d\n", reset_cause); console_flush();
        uint32_t time = rtc_get_counter_val();
        console_printf("time %d secs\n", (int) (time / 1000)); console_flush();
        console_printf("deep sleep %d secs\n", (int) (ticks / 1000)); console_flush();
    }

    //  Compute the ticks slept for last call.  Display the expected and actual ticks slept.
    uint32_t diff_time = end_time - start_time;
    if (diff_time > max_sleep) { max_sleep = diff_time; }    
    //  if (last_ticks > 1000) { console_printf("sleep expected %ld ms / actual %ld ms\n", last_ticks, diff_time); console_flush(); }

    //  Stop the system timer.  TODO: Start the timer after sleeping.
    NVIC_DisableIRQ(TIM2_IRQn);
#ifdef NOTUSED    
    NVIC_DisableIRQ(TIM1_BRK_IRQn);
    NVIC_DisableIRQ(TIM1_UP_IRQn);
    NVIC_DisableIRQ(TIM1_TRG_COM_IRQn );
    NVIC_DisableIRQ(TIM1_CC_IRQn);
    NVIC_DisableIRQ(TIM3_IRQn);
#endif  //  NOTUSED

    //  Set the alarm to wake up in `ticks` milliseconds from now.
    platform_set_alarm(ticks);

    //  Remember the sleep info to be displayed at next call.
    last_ticks = ticks;
    start_time = rtc_get_counter_val();

    //  Note: Don't enter deep sleep too soon, because Blue Pill will not allow reflashing while sleeping.
    //  if (ticks < 10 * 1000) {
    if (!network_has_transmitted) {
        target_enter_sleep_mode();  //  Enter Sleep Now Mode
    } else {
        //  target_enter_sleep_mode();               //  Enter Sleep Now Mode
        //  target_enter_deep_sleep_stop_mode();     //  Enter Deep Sleep Stop Mode
        target_enter_deep_sleep_standby_mode();      //  Enter Deep Sleep Standby Mode. Will not return. Device will restart upon waking.
    }
    //  Remember the sleep end time to be displayed at next call.
    end_time = rtc_get_counter_val();

    //  Upon waking, sync the OS time.
    power_sync_time();
}

void target_enter_sleep_mode(void) {
    //  To enter Sleep Now Mode: WFI (Wait for Interrupt) or WFE (Wait for Event) while:
    //  – SLEEPDEEP = 0 and
    //  – SLEEPONEXIT = 0 
    //  Assume caller has set RTC Wakeup Alarm.
    _CLEAR_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP_Msk);    //  Clear SLEEPDEEP bit of Cortex System Control Register.
    _CLEAR_BIT(SCB->SCR, SCB_SCR_SLEEPONEXIT_Msk);  //  Clear SLEEPONEXIT bit of Cortex System Control Register.
    __DSB();
    __WFI();  //  Wait for interrupt from RTC Alarm.
}

void target_enter_deep_sleep_stop_mode(void) {
    //  The Stop mode is based on the Cortex®-M3 deepsleep mode combined with peripheral
    //  clock gating. The voltage regulator can be configured either in normal or low-power mode.
    //  In Stop mode, all clocks in the 1.8 V domain are stopped, the PLL, the HSI and the HSE RC
    //  oscillators are disabled. SRAM and register contents are preserved.
    //  In the Stop mode, all I/O pins keep the same state as in the Run mode.
    //  To enter Stop Mode: 
    //  WFI (Wait for Interrupt) or WFE (Wait for Event) while:
    //  – Set SLEEPDEEP bit in Cortex®-M3 System Control register
    //  – Clear PDDS bit in Power Control register (PWR_CR)
    //  – Select the voltage regulator mode by configuring LPDS bit in PWR_CR
    //  Note: To enter Stop mode, all EXTI Line pending bits (in Pending register
    //  (EXTI_PR)), all peripheral interrupt pending bits, and RTC Alarm flag must
    //  be reset. Otherwise, the Stop mode entry procedure is ignored and
    //  program execution continues. 
    //  Assume caller has set RTC Wakeup Alarm.

    pwr_set_stop_mode();   //  Clear PWR_CR_PDDS.
    pwr_voltage_regulator_low_power_in_stop();  //  Switch voltage regulator to low power mode.
    _SET_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP_Msk);        //  Set SLEEPDEEP bit of Cortex System Control Register.
    __DSB();
    __WFI();  //  Wait for interrupt from RTC Alarm.
}

void target_enter_deep_sleep_standby_mode(void) {
    //  The Standby mode allows to achieve the lowest power consumption. It is based on the
    //  Cortex®-M3 deepsleep mode, with the voltage regulator disabled. The 1.8 V domain is
    //  consequently powered off. The PLL, the HSI oscillator and the HSE oscillator are also
    //  switched off. SRAM and register contents are lost except for registers in the Backup domain
    //  and Standby circuitry.  To enter Standby Mode: 
    //  WFI (Wait for Interrupt) or WFE (Wait for Event) while:
    //  – Set SLEEPDEEP in Cortex®-M3 System Control register
    //  – Set PDDS bit in Power Control register (PWR_CR)
    //  – Clear WUF bit in Power Control/Status register (PWR_CSR)
    //  – No interrupt (for WFI) or event (for WFI) is pending
    //  Assume caller has set RTC Wakeup Alarm.

    pwr_set_standby_mode();   //  Set PWR_CR_PDDS.
    pwr_clear_wakeup_flag();  //  Clear WUF.    
    _SET_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP_Msk);  //  Set SLEEPDEEP bit of Cortex System Control Register.
    __DSB();
    __WFI();  //  Wait for interrupt from RTC Alarm.
}

void power_sync_time() {
    //  Sync the OS time to the RTC time.  Warning: This function must be safe to be called from an interrupt handler.

    //  Compute the ticks elapsed.
    volatile uint32_t now = rtc_get_counter_val();
    int diff_ticks = now - g_os_time;

    //  If ticks elapsed is above 0, update the OS clock.
    if (diff_ticks <= 0) { return; }
    os_time_advance(diff_ticks);
}

void power_timer_tick() {
    //  This is called every millisecond.
    //  Warning: This is called from an interrupt handler.
    power_sync_time();
}

void power_timer_alarm() {
    //  This is called when the Real-Time Clock alarm is triggered.
    //  Warning: This is called from an interrupt handler.
    power_sync_time();
}

void power_init(uint32_t os_ticks_per_sec, uint32_t reload_val, int prio) {
    //  Init the power management.
    assert(os_ticks_per_sec == 1000);  //  Assume 1 millisecond tick.
    platform_start_timer(power_timer_tick, power_timer_alarm);
    //  When waking from standby, set the Mynewt time.
    if (power_reset_cause() == POWER_RESET_STANDBY) {
        g_os_time = rtc_get_counter_val();
        //  power_sync_time();
    }
}

void power_init_systick(uint32_t reload_val, int prio) {
    /* Set the system time ticker up */
    SysTick->LOAD = reload_val;
    SysTick->VAL = 0;

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
}

void power_start_systick() {
    //  Start the system time ticker.
    _SET_BIT(SysTick->CTRL, 0x0007);
}

void power_stop_systick() {
    //  Stop the system time ticker.
    _CLEAR_BIT(SysTick->CTRL, 0x0007);
}

enum power_reset_reason power_reset_cause(void) {
    //  Same as hal_reset_cause() except we added RESET_STANDBY.
    static enum power_reset_reason reason;
    uint32_t reg;

    if (reason) {
        return reason;
    }

    reg = RCC->CSR;

    if (reg & RCC_CSR_WWDGRSTF) {
        reason = POWER_RESET_WATCHDOG;
    } else if (reg & RCC_CSR_SFTRSTF) {
        reason = POWER_RESET_SOFT;
    } else if (reg & RCC_CSR_PINRSTF) {
        reason = POWER_RESET_PIN;
    } else if (reg & RCC_CSR_LPWRRSTF) {
        /* For L1xx this is low-power reset */
        reason = POWER_RESET_BROWNOUT;
    } else if (reg & PWR_CSR_SBF) {
        //  Added: Reset due to exit from standby mode
        reason = POWER_RESET_STANDBY;
    } else {
        reason = POWER_RESET_POR;
    }
    RCC->CSR |= RCC_CSR_RMVF;
    return reason;
}

///////////////////////////////////////////////////////////////////////////////
//  Power Management Functions (from libopencm3 STM32F1)

/*---------------------------------------------------------------------------*/
/** @brief Disable Backup Domain Write Protection.
 
This allows backup domain registers to be changed. These registers are write
protected after a reset.
*/

void pwr_disable_backup_domain_write_protect(void)
{
        PWR->CR |= PWR_CR_DBP;
}

/*---------------------------------------------------------------------------*/
/** @brief Voltage Regulator On in Stop Mode.
 
*/

void pwr_voltage_regulator_on_in_stop(void)
{
        PWR->CR &= ~PWR_CR_LPDS;
}

/*---------------------------------------------------------------------------*/
/** @brief Voltage Regulator Low Power in Stop Mode.
 
*/

void pwr_voltage_regulator_low_power_in_stop(void)
{
        PWR->CR |= PWR_CR_LPDS;
}

/*---------------------------------------------------------------------------*/
/** @brief Clear the Standby Flag.
 
This is set when the processor returns from a standby mode.
*/

void pwr_clear_standby_flag(void)
{
        PWR->CR |= PWR_CR_CSBF;
}

/*---------------------------------------------------------------------------*/
/** @brief Clear the Wakeup Flag.
 
This is set when the processor receives a wakeup signal.
*/

void pwr_clear_wakeup_flag(void)
{
        PWR->CR |= PWR_CR_CWUF;
}

/*---------------------------------------------------------------------------*/
/** @brief Set Standby Mode in Deep Sleep.
 
*/

void pwr_set_standby_mode(void)
{
        PWR->CR |= PWR_CR_PDDS;
}

/*---------------------------------------------------------------------------*/
/** @brief Set Stop Mode in Deep Sleep.
 
*/

void pwr_set_stop_mode(void)
{
        PWR->CR &= ~PWR_CR_PDDS;
}
