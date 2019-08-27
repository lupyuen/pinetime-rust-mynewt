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
//  PWR Functions from libopencm3 STM32F1
#include <os/mynewt.h>
#include <bsp/bsp.h>
#include <hal/hal_system.h>
#include "pwr.h"

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