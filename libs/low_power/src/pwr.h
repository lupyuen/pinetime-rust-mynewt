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
#ifndef __LOW_POWER_PWR_H__
#define __LOW_POWER_PWR_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

void pwr_disable_backup_domain_write_protect(void);
void pwr_voltage_regulator_low_power_in_stop(void);
void pwr_set_stop_mode(void);
void pwr_set_standby_mode(void);
void pwr_clear_wakeup_flag(void);

#ifdef __cplusplus
}
#endif
#endif  //  __LOW_POWER_PWR_H__