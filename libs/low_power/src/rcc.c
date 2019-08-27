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
//  RCC Functions from libopencm3 STM32F1
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include <hal/hal_system.h>
#include "rcc.h"

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
