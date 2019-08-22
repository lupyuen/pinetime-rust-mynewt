//  Implement Power Management functions
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include <assert.h>
#include "rtc.h"
#include "power.h"

#define _SET_BIT(var, bit)   { var |= bit; }   //  Set the specified bit of var to 1, e.g. _SET_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP) sets bit SCB_SCR_SLEEPDEEP of SCB_SCR to 1.
#define _CLEAR_BIT(var, bit) { var &= ~bit; }  //  Set the specified bit of var to 0, e.g. _CLEAR_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP) sets bit SCB_SCR_SLEEPDEEP of SCB_SCR to 0.

void target_enter_sleep_mode(void);
void pwr_voltage_regulator_low_power_in_stop(void);
void pwr_set_stop_mode(void);
void pwr_set_standby_mode(void);
void pwr_clear_wakeup_flag(void);

extern os_time_t g_os_time;

void power_sync_time() {
    //  Sync the OS time to the RTC time.
    volatile uint32_t now = rtc_get_counter_val();
    int diff_ticks = now - g_os_time;
    os_time_advance(diff_ticks);
}

void power_init(uint32_t os_ticks_per_sec, uint32_t reload_val, int prio) {
    //  Init the power management.
    assert(os_ticks_per_sec == 1000);  //  Assume 1 millisecond tick.
    platform_start_timer(NULL, NULL);

    //  TODO: Start the SysTick.
}

void power_sleep(os_time_t ticks) {    
    //  Set the wakeup alarm for current time + ticks milliseconds.

    //  TODO: Stop the SysTick.

    platform_set_alarm(ticks);

    //  Enter sleep mode.  Note: Don't enter deep sleep too soon, because Blue Pill will not allow reflashing while sleeping.
    target_enter_sleep_mode();
    //  target_enter_deep_sleep_stop_mode();
    //  target_enter_deep_sleep_standby_mode();

    //  TODO: Resume the SysTick.
}

void power_init_systick(uint32_t reload_val, int prio) {
    /* Set the system time ticker up */
    SysTick->LOAD = reload_val;
    SysTick->VAL = 0;

    /* Set the system tick priority */
    NVIC_SetPriority(SysTick_IRQn, prio);
}

void power_start_systick() {
    //  Start the system time ticker.
    _SET_BIT(SysTick->CTRL, 0x0007);
}

void power_stop_systick() {
    //  Stop the system time ticker.
    _CLEAR_BIT(SysTick->CTRL, 0x0007);
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
