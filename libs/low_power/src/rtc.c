//  Implement Real-Time Clock functions
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include <hal/hal_system.h>
#include <console/console.h>
#include "power.h"
#include "rtc.h"

#define NVIC_RTC_IRQ 3
#define NVIC_RTC_ALARM_IRQ 41
#define EXTI17                          (1 << 17)
enum exti_trigger_type {    EXTI_TRIGGER_RISING,    EXTI_TRIGGER_FALLING,    EXTI_TRIGGER_BOTH };
enum rcc_osc { RCC_PLL, RCC_PLL2, RCC_PLL3, RCC_HSE, RCC_HSI, RCC_LSE, RCC_LSI };

//  Select Oscillator for the realtime clock: 
//  RCC_HSE: 62.5 kHz, fastest oscillator, doesn't work in Stop or Standby Low Power mode. 
//  RCC_LSE: 32.768 kHz, slowest oscillator, works in Stop or Standby Low Power mode. 
//  RCC_LSI: 40 kHz, works in Stop or Standby Low Power mode. 
//  We choose RCC_LSE because we need to wake up in Low Power mode.

#define USE_RCC_LSE  //  We use Low Power Mode...

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

/** RTC Interrupt Flags */
typedef enum {
        /** Counter Second Flag */      RTC_SEC,
        /** Alarm Event Flag */         RTC_ALR,
        /** Counter Overflow Flag */    RTC_OW,
} rtcflag_t;
 
void rtc_isr(void);
void rtc_alarm_isr(void);
void nvic_enable_irq(uint8_t irqn);
void exti_set_trigger(uint32_t extis, enum exti_trigger_type trig);
void exti_enable_request(uint32_t extis);
void exti_reset_request(uint32_t extis);
void rcc_enable_rtc_clock(void);
void rcc_set_rtc_clock_source(enum rcc_osc clock_source);
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

/// rtc_setup() will set this to 1 when RTC has been configured. Used by libs/adc_stm32f1/src/adc_stm32f1.c to prevent configuring RTC twice.
int rtc_configured = 0;

static void rtc_setup(void) {
    //  Setup RTC interrupts for tick and alarm wakeup.
    rtc_configured = 1;  //  Tell adc_stm32f1 that the clocks have already been configured, don't configure again.

    rcc_enable_rtc_clock();
    rtc_interrupt_disable(RTC_SEC);
    rtc_interrupt_disable(RTC_ALR);
    rtc_interrupt_disable(RTC_OW);

    //  Note: Older versions of rtc_awake_from_off() and rtc_auto_awake() cause qemu to crash with error
    //  "hardware error: you are must enter to configuration mode for write in any registre" in hw\timer\stm32_rtc.c
    console_printf("rtc awake...\n"); // console_flush(); //  rtc_awake_from_off() fails on qemu.
    if (power_reset_cause() == POWER_RESET_STANDBY) {
        //  From: https://github.com/libopencm3/libopencm3-examples/blob/master/examples/stm32/f1/stm32vl-discovery/rtc/rtc.c
        //  rtc_auto_awake(): If the RTC is pre-configured just allow access, don't reconfigure.
        //  Otherwise enable it with the clock source and set the prescale value.
        rtc_auto_awake(clock_source, prescale);
    } else {
        //  rtc_auto_awake() will not reset the RTC when you press the RST button.
        //  It will also continue to count while the MCU is held in reset. If
        //  you want it to reset, use rtc_awake_from_off()
        rtc_awake_from_off(clock_source);  //  This will enable RTC.
        rtc_set_prescale_val(prescale);
    }
    console_printf("rtc awake ok\n"); // console_flush(); //  rtc_awake_from_off() fails on qemu.

    NVIC_SetVector(RTC_IRQn,       (uint32_t) rtc_isr);        //  Set the Interrupt Service Routine for RTC
    NVIC_SetVector(RTC_Alarm_IRQn, (uint32_t) rtc_alarm_isr);  //  Set the Interrupt Service Routine for RTC Alarm
    
    if (power_reset_cause() != POWER_RESET_STANDBY) {
        //  Set the RTC time only at power on. Don't set it when waking from standby.
        rtc_set_counter_val(0);              //  Start counting millisecond ticks from 0.
        rtc_set_alarm_time((uint32_t) -1);   //  Reset alarm to -1 or 0xffffffff so we don't trigger now.
    }

    exti_set_trigger(EXTI17, EXTI_TRIGGER_RISING);  //  Enable alarm wakeup via the interrupt.
    exti_enable_request(EXTI17);

    nvic_enable_irq(NVIC_RTC_IRQ);        //  Enable RTC tick interrupt processing.
    nvic_enable_irq(NVIC_RTC_ALARM_IRQ);  //  Enable RTC alarm wakeup interrupt processing.

    __disable_irq();
    rtc_clear_flag(RTC_SEC);
    rtc_clear_flag(RTC_ALR);
    rtc_clear_flag(RTC_OW);
    ////rtc_interrupt_enable(RTC_SEC);  //  Allow RTC to generate tick interrupts.
    rtc_interrupt_enable(RTC_ALR);  //  Allow RTC to generate alarm interrupts.
    __enable_irq();
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
//  NVIC API (from libopencm3 STM32F1)

/* Generic memory-mapped I/O accessor functions */
#define MMIO8(addr)             (*(volatile uint8_t *)(addr))
#define MMIO16(addr)            (*(volatile uint16_t *)(addr))
#define MMIO32(addr)            (*(volatile uint32_t *)(addr))
#define MMIO64(addr)            (*(volatile uint64_t *)(addr))

/** ISER: Interrupt Set Enable Registers
 * @note 8 32bit Registers
 * @note Single register on CM0
 */
#define NVIC_ISER(iser_id)              MMIO32(NVIC_BASE + 0x00 + \
                                                ((iser_id) * 4))

/* NVIC_BASE + 0x020 (0xE000 E120 - 0xE000 E17F): Reserved */

/** ICER: Interrupt Clear Enable Registers
 * @note 8 32bit Registers
 * @note Single register on CM0
 */
#define NVIC_ICER(icer_id)              MMIO32(NVIC_BASE + 0x80 + \
                                                ((icer_id) * 4))

/*---------------------------------------------------------------------------*/
/** @brief NVIC Enable Interrupt
 *
 * Enables a user interrupt.
 *
 * @param[in] irqn Unsigned int8. Interrupt number @ref CM3_nvic_defines_irqs
 */

void nvic_enable_irq(uint8_t irqn)
{
        NVIC_ISER(irqn / 32) = (1 << (irqn % 32));
}

/*---------------------------------------------------------------------------*/
/** @brief NVIC Disable Interrupt
 *
 * Disables a user interrupt.
 *
 * @param[in] irqn Unsigned int8. Interrupt number @ref CM3_nvic_defines_irqs
 */

void nvic_disable_irq(uint8_t irqn)
{
        NVIC_ICER(irqn / 32) = (1 << (irqn % 32));
}

///////////////////////////////////////////////////////////////////////////////
//  EXTI Peripheral API (from libopencm3 STM32F1)

void exti_set_trigger(uint32_t extis, enum exti_trigger_type trig)
{
    switch (trig) {
    case EXTI_TRIGGER_RISING:
        EXTI->RTSR |= extis;
        EXTI->FTSR &= ~extis;
        break;
    case EXTI_TRIGGER_FALLING:
        EXTI->RTSR &= ~extis;
        EXTI->FTSR |= extis;
        break;
    case EXTI_TRIGGER_BOTH:
        EXTI->RTSR |= extis;
        EXTI->FTSR |= extis;
        break;
    }
}

void exti_enable_request(uint32_t extis)
{
    /* Enable interrupts. */
    EXTI->IMR |= extis;

    /* Enable events. */
    EXTI->EMR |= extis;
}

void exti_disable_request(uint32_t extis)
{
    /* Disable interrupts. */
    EXTI->IMR &= ~extis;

    /* Disable events. */
    EXTI->EMR &= ~extis;
}

/*
* Reset the interrupt request by writing a 1 to the corresponding
* pending bit register.
*/
void exti_reset_request(uint32_t extis)
{
#if defined(EXTI_RPR1) && defined(EXTI_FPR1)
        EXTI_RPR1 = extis;
        EXTI_FPR1 = extis;
#else
        EXTI->PR = extis;
#endif
}
 
///////////////////////////////////////////////////////////////////////////////
//  Real-Time Clock and Alarm Functions (from libopencm3 STM32F1)

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

#define _REG_BIT(base, bit)             (((base) << 5) + (bit))

/* V = value line F100
* N = standard line F101, F102, F103
* C = communication line F105, F107
*/
enum rcc_periph_clken {

        /* AHB peripherals */
        RCC_DMA1        = _REG_BIT(0x14, 0),/*VNC*/
        RCC_DMA2        = _REG_BIT(0x14, 1),/*VNC*/
        RCC_SRAM        = _REG_BIT(0x14, 2),/*VNC*/
        RCC_FLTF        = _REG_BIT(0x14, 4),/*VNC*/
        RCC_CRC         = _REG_BIT(0x14, 6),/*VNC*/
        RCC_FSMC        = _REG_BIT(0x14, 8),/*VN-*/
        RCC_SDIO        = _REG_BIT(0x14, 10),/*-N-*/
        RCC_OTGFS       = _REG_BIT(0x14, 12),/*--C*/
        RCC_ETHMAC      = _REG_BIT(0x14, 14),/*--C*/
        RCC_ETHMACTX    = _REG_BIT(0x14, 15),/*--C*/
        RCC_ETHMACRX    = _REG_BIT(0x14, 16),/*--C*/

        /* APB2 peripherals */
        RCC_AFIO        = _REG_BIT(0x18, 0),/*VNC*/
        RCC_GPIOA       = _REG_BIT(0x18, 2),/*VNC*/
        RCC_GPIOB       = _REG_BIT(0x18, 3),/*VNC*/
        RCC_GPIOC       = _REG_BIT(0x18, 4),/*VNC*/
        RCC_GPIOD       = _REG_BIT(0x18, 5),/*VNC*/
        RCC_GPIOE       = _REG_BIT(0x18, 6),/*VNC*/
        RCC_GPIOF       = _REG_BIT(0x18, 7),/*VN-*/
        RCC_GPIOG       = _REG_BIT(0x18, 8),/*VN-*/
        RCC_ADC1        = _REG_BIT(0x18, 9),/*VNC*/
        RCC_ADC2        = _REG_BIT(0x18, 10),/*-NC*/
        RCC_TIM1        = _REG_BIT(0x18, 11),/*VNC*/
        RCC_SPI1        = _REG_BIT(0x18, 12),/*VNC*/
        RCC_TIM8        = _REG_BIT(0x18, 13),/*-N-*/
        RCC_USART1      = _REG_BIT(0x18, 14),/*VNC*/
        RCC_ADC3        = _REG_BIT(0x18, 15),/*-N-*/
        RCC_TIM15       = _REG_BIT(0x18, 16),/*V--*/
        RCC_TIM16       = _REG_BIT(0x18, 17),/*V--*/
        RCC_TIM17       = _REG_BIT(0x18, 18),/*V--*/
        RCC_TIM9        = _REG_BIT(0x18, 19),/*-N-*/
        RCC_TIM10       = _REG_BIT(0x18, 20),/*-N-*/
        RCC_TIM11       = _REG_BIT(0x18, 21),/*-N-*/

        /* APB1 peripherals */
        RCC_TIM2        = _REG_BIT(0x1C, 0),/*VNC*/
        RCC_TIM3        = _REG_BIT(0x1C, 1),/*VNC*/
        RCC_TIM4        = _REG_BIT(0x1C, 2),/*VNC*/
        RCC_TIM5        = _REG_BIT(0x1C, 3),/*VNC*/
        RCC_TIM6        = _REG_BIT(0x1C, 4),/*VNC*/
        RCC_TIM7        = _REG_BIT(0x1C, 5),/*VNC*/
        RCC_TIM12       = _REG_BIT(0x1C, 6),/*VN-*/
        RCC_TIM13       = _REG_BIT(0x1C, 7),/*VN-*/
        RCC_TIM14       = _REG_BIT(0x1C, 8),/*VN-*/
        RCC_WWDG        = _REG_BIT(0x1C, 11),/*VNC*/
        RCC_SPI2        = _REG_BIT(0x1C, 14),/*VNC*/
        RCC_SPI3        = _REG_BIT(0x1C, 15),/*VNC*/
        RCC_USART2      = _REG_BIT(0x1C, 17),/*VNC*/
        RCC_USART3      = _REG_BIT(0x1C, 18),/*VNC*/
        RCC_UART4       = _REG_BIT(0x1C, 19),/*VNC*/
        RCC_UART5       = _REG_BIT(0x1C, 20),/*VNC*/
        RCC_I2C1        = _REG_BIT(0x1C, 21),/*VNC*/
        RCC_I2C2        = _REG_BIT(0x1C, 22),/*VNC*/
        RCC_USB         = _REG_BIT(0x1C, 23),/*-N-*/
        RCC_CAN         = _REG_BIT(0x1C, 25),/*-N-*/
        RCC_CAN1        = _REG_BIT(0x1C, 25),/*--C*/
        RCC_CAN2        = _REG_BIT(0x1C, 26),/*--C*/
        RCC_BKP         = _REG_BIT(0x1C, 27),/*VNC*/
        RCC_PWR         = _REG_BIT(0x1C, 28),/*VNC*/
        RCC_DAC         = _REG_BIT(0x1C, 29),/*VNC*/
        RCC_CEC         = _REG_BIT(0x1C, 30),/*V--*/
};

/*---------------------------------------------------------------------------*/
/** @brief RCC RTC Clock Enabled Flag
@returns uint32_t. Nonzero if the RTC Clock is enabled.
*/

uint32_t rcc_rtc_clock_enabled_flag(void)
{
    return RCC->BDCR & RCC_BDCR_RTCEN;
}

/*---------------------------------------------------------------------------*/
/** @brief RCC Enable the RTC clock
*/

void rcc_enable_rtc_clock(void)
{
    RCC->BDCR |= RCC_BDCR_RTCEN;
}

#define _RCC_REG(i)             MMIO32(RCC_BASE + ((i) >> 5))
#define _RCC_BIT(i)             (1 << ((i) & 0x1f))

/*---------------------------------------------------------------------------*/
/** @brief RCC Set the Source for the RTC clock
 
@param[in] clock_source RTC clock source. Only HSE/128, LSE and LSI.
*/

void rcc_set_rtc_clock_source(enum rcc_osc clock_source)
{
        uint32_t reg32;

        switch (clock_source) {
        case RCC_LSE:
                /* Turn the LSE on and wait while it stabilises. */
                RCC->BDCR |= RCC_BDCR_LSEON;
                while ((reg32 = (RCC->BDCR & RCC_BDCR_LSERDY)) == 0);

                /* Choose LSE as the RTC clock source. */
                RCC->BDCR &= ~((1 << 8) | (1 << 9));
                RCC->BDCR |= (1 << 8);
                break;
        case RCC_LSI:
                /* Turn the LSI on and wait while it stabilises. */
                RCC->CSR |= RCC_CSR_LSION;
                while ((reg32 = (RCC->CSR & RCC_CSR_LSIRDY)) == 0);

                /* Choose LSI as the RTC clock source. */
                RCC->BDCR &= ~((1 << 8) | (1 << 9));
                RCC->BDCR |= (1 << 9);
                break;
        case RCC_HSE:
                /* Turn the HSE on and wait while it stabilises. */
                RCC->CR |= RCC_CR_HSEON;
                while ((reg32 = (RCC->CR & RCC_CR_HSERDY)) == 0);

                /* Choose HSE as the RTC clock source. */
                RCC->BDCR &= ~((1 << 8) | (1 << 9));
                RCC->BDCR |= (1 << 9) | (1 << 8);
                break;
        case RCC_PLL:
        case RCC_PLL2:
        case RCC_PLL3:
        case RCC_HSI:
                /* Unusable clock source, here to prevent warnings. */
                /* Turn off clock sources to RTC. */
                RCC->BDCR &= ~((1 << 8) | (1 << 9));
                break;
        }
}

/*---------------------------------------------------------------------------*/
/** @brief Enable Peripheral Clock in running mode.
 *
 * Enable the clock on particular peripheral.
 *
 * @param[in] clken rcc_periph_clken Peripheral RCC
 *
 * For available constants, see #rcc_periph_clken (RCC_UART1 for example)
 */

void rcc_periph_clock_enable(enum rcc_periph_clken clken)
{
        _RCC_REG(clken) |= _RCC_BIT(clken);
}

/*---------------------------------------------------------------------------*/
/** @brief Disable Peripheral Clock in running mode.
 * Disable the clock on particular peripheral.
 *
 * @param[in] clken rcc_periph_clken Peripheral RCC
 *
 * For available constants, see #rcc_periph_clken (RCC_UART1 for example)
 */

void rcc_periph_clock_disable(enum rcc_periph_clken clken)
{
        _RCC_REG(clken) &= ~_RCC_BIT(clken);
}

/*---------------------------------------------------------------------------*/
/** @brief RTC Set Operational from the Off state.
 
Power up the backup domain clocks, enable write access to the backup domain,
select the clock source, clear the RTC registers and enable the RTC.

@param[in] clock_source ::rcc_osc. RTC clock source. Only the values HSE, LSE
    and LSI are permitted.
*/

void rtc_awake_from_off(enum rcc_osc clock_source)
{
        uint32_t reg32;

        /* Enable power and backup interface clocks. */
        rcc_periph_clock_enable(RCC_PWR);
        rcc_periph_clock_enable(RCC_BKP);

        /* Enable access to the backup registers and the RTC. */
        pwr_disable_backup_domain_write_protect();

        /* Set the clock source */
        rcc_set_rtc_clock_source(clock_source);

        /* Clear the RTC Control Register */
        RTC_CRH = 0;
        RTC_CRL = 0;

        /* Enable the RTC. */
        rcc_enable_rtc_clock();

        /* Clear the Registers */
        rtc_enter_config_mode();
        RTC_PRLH = 0;
        RTC_PRLL = 0;
        RTC_CNTH = 0;
        RTC_CNTL = 0;
        RTC_ALRH = 0xFFFF;
        RTC_ALRL = 0xFFFF;
        rtc_exit_config_mode();

        /* Wait for the RSF bit in RTC_CRL to be set by hardware. */
        RTC_CRL &= ~RTC_CRL_RSF;
        while ((reg32 = (RTC_CRL & RTC_CRL_RSF)) == 0);
}

/*---------------------------------------------------------------------------*/
/** @brief RTC Configuration on Wakeup
 
Enable the backup domain clocks and write access to the backup domain.
If the RTC has not been enabled, set the clock source and prescaler value.
The parameters are not used if the RTC has already been enabled.

@param[in] clock_source ::rcc_osc. RTC clock source. Only HSE, LSE
    and LSI are permitted.
@param[in] prescale_val uint32_t. 20 bit prescale divider.
*/

void rtc_auto_awake(enum rcc_osc clock_source, uint32_t prescale_val)
{
        uint32_t reg32;

        /* Enable power and backup interface clocks. */
        rcc_periph_clock_enable(RCC_PWR);
        rcc_periph_clock_enable(RCC_BKP);

        reg32 = rcc_rtc_clock_enabled_flag();

        if (reg32 != 0) {
                rtc_awake_from_standby();
        } else {
                rtc_awake_from_off(clock_source);
                rtc_set_prescale_val(prescale_val);
        }
}

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

/*---------------------------------------------------------------------------*/
/** @brief RTC Enable Interrupt
 
@param[in] flag_val ::rtcflag_t: The flag to enable.
*/

void rtc_interrupt_enable(rtcflag_t flag_val)
{
        rtc_enter_config_mode();

        /* Set the correct interrupt enable. */
        switch (flag_val) {
        case RTC_SEC:
                RTC_CRH |= RTC_CRH_SECIE;
                break;
        case RTC_ALR:
                RTC_CRH |= RTC_CRH_ALRIE;
                break;
        case RTC_OW:
                RTC_CRH |= RTC_CRH_OWIE;
                break;
        }

        rtc_exit_config_mode();
}

/*---------------------------------------------------------------------------*/
/** @brief RTC Disable Interrupt
 
@param[in] flag_val ::rtcflag_t: The flag to disable.
*/

void rtc_interrupt_disable(rtcflag_t flag_val)
{
        rtc_enter_config_mode();

        /* Disable the correct interrupt enable. */
        switch (flag_val) {
        case RTC_SEC:
                RTC_CRH &= ~RTC_CRH_SECIE;
                break;
        case RTC_ALR:
                RTC_CRH &= ~RTC_CRH_ALRIE;
                break;
        case RTC_OW:
                RTC_CRH &= ~RTC_CRH_OWIE;
                break;
        }

        rtc_exit_config_mode();
}

/*---------------------------------------------------------------------------*/
/** @brief RTC Clear an Interrupt Flag
 
@param[in] flag_val ::rtcflag_t: The flag to clear.
*/

void rtc_clear_flag(rtcflag_t flag_val)
{
        /* Configuration mode not needed. */

        /* Clear the correct flag. */
        switch (flag_val) {
        case RTC_SEC:
                RTC_CRL &= ~RTC_CRL_SECF;
                break;
        case RTC_ALR:
                RTC_CRL &= ~RTC_CRL_ALRF;
                break;
        case RTC_OW:
                RTC_CRL &= ~RTC_CRL_OWF;
                break;
        }
}

/*---------------------------------------------------------------------------*/
/** @brief RTC Return a Flag Setting
 
@param[in] flag_val ::rtcflag_t: The flag to check.
@returns uint32_t: a nonzero value if the flag is set, zero otherwise.
*/

uint32_t rtc_check_flag(rtcflag_t flag_val)
{
        uint32_t reg32;

        /* Read correct flag. */
        switch (flag_val) {
        case RTC_SEC:
                reg32 = RTC_CRL & RTC_CRL_SECF;
                break;
        case RTC_ALR:
                reg32 = RTC_CRL & RTC_CRL_ALRF;
                break;
        case RTC_OW:
                reg32 = RTC_CRL & RTC_CRL_OWF;
                break;
        default:
                reg32 = 0;
                break;
        }

        return reg32;
}

/*---------------------------------------------------------------------------*/
/** @brief RTC Start RTC after Standby Mode.
 
Enable the backup domain clocks, enable write access to the backup
domain and the RTC, and synchronise the RTC register access.
*/

void rtc_awake_from_standby(void)
{
        uint32_t reg32;

        /* Enable power and backup interface clocks. */
        rcc_periph_clock_enable(RCC_PWR);
        rcc_periph_clock_enable(RCC_BKP);

        /* Enable access to the backup registers and the RTC. */
        pwr_disable_backup_domain_write_protect();

        /* Wait for the RSF bit in RTC_CRL to be set by hardware. */
        RTC_CRL &= ~RTC_CRL_RSF;
        while ((reg32 = (RTC_CRL & RTC_CRL_RSF)) == 0);

        /* Wait for the last write operation to finish. */
        /* TODO: Necessary? */
        while ((reg32 = (RTC_CRL & RTC_CRL_RTOFF)) == 0);
}