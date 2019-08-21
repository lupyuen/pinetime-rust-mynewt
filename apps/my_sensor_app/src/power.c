//  Implement Power Management functions
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include "rtc.h"
#include "power.h"

void platform_set_alarm(uint32_t millisec);
void target_enter_sleep_mode(void);
void pwr_voltage_regulator_low_power_in_stop(void);
void pwr_set_stop_mode(void);
void pwr_set_standby_mode(void);
void pwr_clear_wakeup_flag(void);

void sleep_ticks(os_time_t ticks) {
    //  Set the wakeup alarm for current time + ticks milliseconds.
    platform_set_alarm(ticks);

    //  Enter sleep mode.  Note: Don't enter deep sleep too soon, because Blue Pill will not allow reflashing while sleeping.
    target_enter_sleep_mode();
    //  target_enter_deep_sleep_stop_mode();
    //  target_enter_deep_sleep_standby_mode();
}

#define _SET_BIT(var, bit)   { var |= bit; }   //  Set the specified bit of var to 1, e.g. _SET_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP) sets bit SCB_SCR_SLEEPDEEP of SCB_SCR to 1.
#define _CLEAR_BIT(var, bit) { var &= ~bit; }  //  Set the specified bit of var to 0, e.g. _CLEAR_BIT(SCB->SCR, SCB_SCR_SLEEPDEEP) sets bit SCB_SCR_SLEEPDEEP of SCB_SCR to 0.

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
