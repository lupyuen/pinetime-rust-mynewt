//  Implement Real-Time Clock functions
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include <console/console.h>
#include "power.h"
#include "rtc.h"

//  Select Oscillator for the realtime clock: 
//  RCC_HSE: 62.5 kHz, fastest oscillator, doesn't work in Stop or Standby Low Power mode. 
//  RCC_LSE: 32.768 kHz, slowest oscillator, works in Stop or Standby Low Power mode. 
//  RCC_LSI: 40 kHz, works in Stop or Standby Low Power mode. 
//  We choose RCC_LSE because we need to wake up in Low Power mode.

#define USE_RCC_LSE  //  We use Low Power Mode...

#ifdef USE_RCC_LSE   //  If using Low Power Mode...
const rcc_osc clock_source = RCC_LSE;
#else   //  If not using Low Power Mode...
const rcc_osc clock_source = RCC_HSE;
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

void rtc_set_prescale_val(uint32_t prescale_val);

static void rtc_setup(void) {
	//  Setup RTC interrupts for tick and alarm wakeup.
	rcc_enable_rtc_clock();
	rtc_interrupt_disable(RTC_SEC);
	rtc_interrupt_disable(RTC_ALR);
	rtc_interrupt_disable(RTC_OW);

	//  Note: Older versions of rtc_awake_from_off() and rtc_auto_awake() cause qemu to crash with error
	//  "hardware error: you are must enter to configuration mode for write in any registre" in hw\timer\stm32_rtc.c
	console_printf("rtc awake...\n"); console_flush(); //  rtc_awake_from_off() fails on qemu.
#ifdef AUTO_AWAKE	
	//  From: https://github.com/libopencm3/libopencm3-examples/blob/master/examples/stm32/f1/stm32vl-discovery/rtc/rtc.c
	//  rtc_auto_awake(): If the RTC is pre-configured just allow access, don't reconfigure.
	//  Otherwise enable it with the clock source and set the prescale value.
	rtc_auto_awake(clock_source, prescale);
#else
	//  rtc_auto_awake() will not reset the RTC when you press the RST button.
	//  It will also continue to count while the MCU is held in reset. If
	//  you want it to reset, use custom_rtc_awake_from_off()
	rtc_awake_from_off(clock_source);  //  This will enable RTC.
	rtc_set_prescale_val(prescale);
#endif  //  AUTO_AWAKE
	console_printf("rtc awake ok\n"); console_flush(); //  rtc_awake_from_off() fails on qemu.
	
	rtc_set_counter_val(0);              //  Start counting millisecond ticks from 0.
	rtc_set_alarm_time((uint32_t) -1);   //  Reset alarm to -1 or 0xffffffff so we don't trigger now.
	exti_set_trigger(EXTI17, EXTI_TRIGGER_RISING);  //  Enable alarm wakeup via the interrupt.
	exti_enable_request(EXTI17);

	nvic_enable_irq(NVIC_RTC_IRQ);        //  Enable RTC tick interrupt processing.
	nvic_enable_irq(NVIC_RTC_ALARM_IRQ);  //  Enable RTC alarm wakeup interrupt processing.

	cm_disable_interrupts();
	rtc_clear_flag(RTC_SEC);
	rtc_clear_flag(RTC_ALR);
	rtc_clear_flag(RTC_OW);
	rtc_interrupt_enable(RTC_SEC);  //  Allow RTC to generate tick interrupts.
	rtc_interrupt_enable(RTC_ALR);  //  Allow RTC to generate alarm interrupts.
	cm_enable_interrupts();
}

void platform_start_timer(void (*tickFunc0)(void), void (*alarmFunc0)(void)) {
    //  Start the STM32 Timer to generate interrupt ticks to perform task switching.
  	tickFunc = tickFunc0;    //  Allow tickFunc to be modified at every call to platform_start_timer().
  	alarmFunc = alarmFunc0;  //  Allow alarmFunc to be modified at every call to platform_start_timer().
	
	//  But system timer will only be started once.
	static bool timerStarted = false;
	if (timerStarted) { return; }
	timerStarted = true;
	console_printf("platform_start_timer\n"); ////
	rtc_setup();
}

void platform_set_alarm(uint32_t millisec) {
	//  Set alarm for millisec milliseconds from now.
	//  debug_print("alm <"); debug_print_unsigned(millisec / 1000); ////
	if (!alarmFunc) { console_printf("alm? "); } ////
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

volatile uint32_t platform_get_alarm(void) {
	//  Get alarm time.
	return rtc_get_alarm_val();
}

void rtc_isr(void) {
	//  Interrupt Service Routine for RTC Tick, Alarm, Overflow.  Don't call any I/O functions here.
	if (rtc_check_flag(RTC_SEC)) {
		//  We hit an RTC tick interrupt.
		rtc_clear_flag(RTC_SEC);
		tickCount++;
		//  Call the tick function.
		if (tickFunc != NULL) { tickFunc(); }
		return;
	}
#ifdef NOTUSED  //  Alarm handled by rtc_alarm_isr()
	if (rtc_check_flag(RTC_ALR)) {
		//  We hit an RTC alarm interrupt.
		rtc_clear_flag(RTC_ALR);
		alarmCount++;
		//  Call the alarm function.
		if (alarmFunc != NULL) { alarmFunc(); }
		return;
	}
#endif  //  NOTUSED
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
	//  TODO: Compensate for clock slowdown because we truncated RCC_LSE 32.768 kHz to 32.
	return rtc_get_counter_val();  //  More accurate, uses hardware counters.
	// return tickCount;  //  Less accurate, excludes ARM Semihosting time. 
}

volatile uint32_t platform_alarm_count(void) {
	//  Return the number of alarms triggered since startup.
	return alarmCount;  //  For testing whether alarm ISR was called.
}

volatile uint32_t platform_tick_count(void) {
	//  Return the number of alarms triggered since startup.  Less accurate, excludes ARM Semihosting time.
	return tickCount;  //  For testing whether tick ISR was called.
}


///////////////////////////////////////////////////////////////////////////////
//  Real-Time Clock and Alarm Functions (from libopencm3 STM32F1)

/* Generic memory-mapped I/O accessor functions */
#define MMIO8(addr)             (*(volatile uint8_t *)(addr))
#define MMIO16(addr)            (*(volatile uint16_t *)(addr))
#define MMIO32(addr)            (*(volatile uint32_t *)(addr))
#define MMIO64(addr)            (*(volatile uint64_t *)(addr))

/* --- RTC registers ------------------------------------------------------- */

/* RTC control register high (RTC_CRH) */
#define RTC_CRH                         MMIO32(RTC_BASE + 0x00)

/* RTC control register low (RTC_CRL) */
#define RTC_CRL                         MMIO32(RTC_BASE + 0x04)

/* RTC prescaler load register (RTC_PRLH / RTC_PRLL) */
#define RTC_PRLH                        MMIO32(RTC_BASE + 0x08)
#define RTC_PRLL                        MMIO32(RTC_BASE + 0x0c)

/* RTC prescaler divider register (RTC_DIVH / RTC_DIVL) */
#define RTC_DIVH                        MMIO32(RTC_BASE + 0x10)
#define RTC_DIVL                        MMIO32(RTC_BASE + 0x14)

/* RTC counter register (RTC_CNTH / RTC_CNTL) */
#define RTC_CNTH                        MMIO32(RTC_BASE + 0x18)
#define RTC_CNTL                        MMIO32(RTC_BASE + 0x1c)

/* RTC alarm register high (RTC_ALRH / RTC_ALRL) */
#define RTC_ALRH                        MMIO32(RTC_BASE + 0x20)
#define RTC_ALRL                        MMIO32(RTC_BASE + 0x24)

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

