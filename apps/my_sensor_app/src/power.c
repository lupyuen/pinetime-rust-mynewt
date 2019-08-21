//  Implement Power Management functions
#include <os/mynewt.h>
#include <bsp/bsp.h>

void platform_set_alarm(uint32_t millisec);
void target_enter_sleep_mode(void);
void pwr_voltage_regulator_low_power_in_stop(void);
void pwr_disable_backup_domain_write_protect(void);
void pwr_set_stop_mode(void);
void pwr_set_standby_mode(void);
void pwr_clear_wakeup_flag(void);
uint32_t rtc_get_counter_val(void);
void rtc_set_alarm_time(uint32_t alarm_time);

void sleep_ticks(os_time_t ticks) {
    //  Set the wakeup alarm for current time + ticks milliseconds.
    platform_set_alarm(ticks);

    //  Enter sleep mode.  Note: Don't enter deep sleep too soon, because Blue Pill will not allow reflashing while sleeping.
    target_enter_sleep_mode();
    //  target_enter_deep_sleep_stop_mode();
    //  target_enter_deep_sleep_standby_mode();
}

void platform_set_alarm(uint32_t millisec) {
	//  Set alarm for millisec milliseconds from now.
	//  debug_print("alm <"); debug_print_unsigned(millisec / 1000); ////
	//  if (!alarmFunc) { debug_print("alm? "); } ////
	volatile uint32_t now = rtc_get_counter_val();

	//  Not documented, but you must disable write protection else the alarm time will not be set and rtc_exit_config_mode() will hang.
	//  TODO: Disable only if write protection is enabled.
	pwr_disable_backup_domain_write_protect();
	rtc_set_alarm_time(now + millisec);

#ifdef NOTUSED
	//  Must disable interrupts otherwise rtc_exit_config_mode() will hang after setting alarm. 
	cm_disable_interrupts();

	//  Not documented, but you must disable write protection else the alarm time will not be set.
	pwr_disable_backup_domain_write_protect();

	rtc_interrupt_disable(RTC_SEC);
	rtc_interrupt_disable(RTC_ALR);
	rtc_interrupt_disable(RTC_OW);
	
	rtc_set_alarm_time(now + millisec);
	exti_set_trigger(EXTI17, EXTI_TRIGGER_RISING);  //  Enable alarm wakeup via the interrupt.
	exti_enable_request(EXTI17);

	nvic_enable_irq(NVIC_RTC_IRQ);        //  Enable RTC tick interrupt processing.
	nvic_enable_irq(NVIC_RTC_ALARM_IRQ);  //  Enable RTC alarm wakeup interrupt processing.

	rtc_clear_flag(RTC_SEC);
	rtc_clear_flag(RTC_ALR);
	rtc_clear_flag(RTC_OW);
	rtc_interrupt_enable(RTC_SEC);  //  Allow RTC to generate tick interrupts.
	rtc_interrupt_enable(RTC_ALR);  //  Allow RTC to generate alarm interrupts.

	cm_enable_interrupts();
#endif  //  NOTUSED

	//  debug_print("> "); ////
	//  TODO: rtc_enable_alarm()
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
         PWR_CR |= PWR_CR_DBP;
 }

 /*---------------------------------------------------------------------------*/
 /** @brief Voltage Regulator On in Stop Mode.
 
 */
 
 void pwr_voltage_regulator_on_in_stop(void)
 {
         PWR_CR &= ~PWR_CR_LPDS;
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief Voltage Regulator Low Power in Stop Mode.
 
 */
 
 void pwr_voltage_regulator_low_power_in_stop(void)
 {
         PWR_CR |= PWR_CR_LPDS;
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief Clear the Standby Flag.
 
 This is set when the processor returns from a standby mode.
 */
 
 void pwr_clear_standby_flag(void)
 {
         PWR_CR |= PWR_CR_CSBF;
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief Clear the Wakeup Flag.
 
 This is set when the processor receives a wakeup signal.
 */
 
 void pwr_clear_wakeup_flag(void)
 {
         PWR_CR |= PWR_CR_CWUF;
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief Set Standby Mode in Deep Sleep.
 
 */
 
 void pwr_set_standby_mode(void)
 {
         PWR_CR |= PWR_CR_PDDS;
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief Set Stop Mode in Deep Sleep.
 
 */
 
 void pwr_set_stop_mode(void)
 {
         PWR_CR &= ~PWR_CR_PDDS;
 }

///////////////////////////////////////////////////////////////////////////////
//  Real-Time Clock and Alarm Functions (from libopencm3 STM32F1)

/*---------------------------------------------------------------------------*/
/** @brief RTC Enter Configuration Mode.
Prime the RTC for configuration changes by giving access to the prescaler,
and counter and alarm registers.
*/

void rtc_enter_config_mode(void)
{
	uint32_t reg32;

	/* Wait until the RTOFF bit is 1 (no RTC register writes ongoing). */
	while ((reg32 = (RTC_CRL & RTC_CRL_RTOFF)) == 0);

	/* Enter configuration mode. */
	RTC_CRL |= RTC_CRL_CNF;
}

/*---------------------------------------------------------------------------*/
/** @brief RTC Leave Configuration Mode.
Revert the RTC to operational state.
*/

void rtc_exit_config_mode(void)
{
	uint32_t reg32;

	/* Exit configuration mode. */
	RTC_CRL &= ~RTC_CRL_CNF;

	/* Wait until the RTOFF bit is 1 (our RTC register write finished). */
	while ((reg32 = (RTC_CRL & RTC_CRL_RTOFF)) == 0);
}

 /*---------------------------------------------------------------------------*/
 /** @brief RTC Set the Alarm Time.
 
 @param[in] alarm_time uint32_t. time at which the alarm event is triggered.
 */
 
 void rtc_set_alarm_time(uint32_t alarm_time)
 {
         rtc_enter_config_mode();
         RTC_ALRL = (alarm_time & 0x0000ffff);
         RTC_ALRH = (alarm_time & 0xffff0000) >> 16;
         rtc_exit_config_mode();
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief RTC Enable the Alarm.
 
 */
 
 void rtc_enable_alarm(void)
 {
         rtc_enter_config_mode();
         RTC_CRH |= RTC_CRH_ALRIE;
         rtc_exit_config_mode();
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief RTC Disable the Alarm.
 
 */
 
 void rtc_disable_alarm(void)
 {
         rtc_enter_config_mode();
         RTC_CRH &= ~RTC_CRH_ALRIE;
         rtc_exit_config_mode();
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief RTC Set the prescaler Value
 
 @param[in] prescale_val uint32_t. 20 bit prescale divider.
 */
 
 void rtc_set_prescale_val(uint32_t prescale_val)
 {
         rtc_enter_config_mode();
         RTC_PRLL = prescale_val & 0x0000ffff;         /* PRL[15:0] */
         RTC_PRLH = (prescale_val & 0x000f0000) >> 16; /* PRL[19:16] */
         rtc_exit_config_mode();
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief RTC return the Counter Value
 
 @returns uint32_t: the 32 bit counter value.
 */
 
 uint32_t rtc_get_counter_val(void)
 {
         return (RTC_CNTH << 16) | RTC_CNTL;
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief RTC return the prescaler Value
 
 @returns uint32_t: the 20 bit prescale divider.
 */
 
 uint32_t rtc_get_prescale_div_val(void)
 {
         return (RTC_DIVH << 16) | RTC_DIVL;
 }

 /*---------------------------------------------------------------------------*/
 /** @brief RTC return the Alarm Value
 
 @returns uint32_t: the 32 bit alarm value.
 */
 
 uint32_t rtc_get_alarm_val(void)
 {
         return (RTC_ALRH << 16) | RTC_ALRL;
 }
 
 /*---------------------------------------------------------------------------*/
 /** @brief RTC set the Counter
 
 @param[in] counter_val 32 bit time setting for the counter.
 */
 
 void rtc_set_counter_val(uint32_t counter_val)
 {
         rtc_enter_config_mode();
         RTC_CNTH = (counter_val & 0xffff0000) >> 16; /* CNT[31:16] */
         RTC_CNTL = counter_val & 0x0000ffff;         /* CNT[15:0] */
         rtc_exit_config_mode();
 }
 
