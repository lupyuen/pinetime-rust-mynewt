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
#ifndef __LOW_POWER_RCC_H__
#define __LOW_POWER_RCC_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define _REG_BIT(base, bit)             (((base) << 5) + (bit))

/* Generic memory-mapped I/O accessor functions */
#define MMIO8(addr)             (*(volatile uint8_t *)(addr))
#define MMIO16(addr)            (*(volatile uint16_t *)(addr))
#define MMIO32(addr)            (*(volatile uint32_t *)(addr))
#define MMIO64(addr)            (*(volatile uint64_t *)(addr))

enum rcc_osc { RCC_PLL, RCC_PLL2, RCC_PLL3, RCC_HSE, RCC_HSI, RCC_LSE, RCC_LSI };

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

uint32_t rcc_rtc_clock_enabled_flag(void);
void rcc_enable_rtc_clock(void);
void rcc_set_rtc_clock_source(enum rcc_osc clock_source);
void rcc_periph_clock_enable(enum rcc_periph_clken clken);
void rcc_periph_clock_disable(enum rcc_periph_clken clken);

#ifdef __cplusplus
}
#endif
#endif  //  __LOW_POWER_RCC_H__