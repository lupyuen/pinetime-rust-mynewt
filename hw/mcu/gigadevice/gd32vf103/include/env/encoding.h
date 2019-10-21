#ifndef __MCU_GD32VF103_ENV_PLATFORM_H__
#define __MCU_GD32VF103_ENV_PLATFORM_H__

#include "../../src/ext/Firmware/RISCV/drivers/riscv_encoding.h"
#include "../../src/ext/Firmware/RISCV/drivers/riscv_const.h"
#include "../../src/ext/Firmware/RISCV/drivers/n200_timer.h"

#define _REG32(p, i) (*(volatile uint32_t *) ((p) + (i)))
#define _REG32P(p, i) ((volatile uint32_t *) ((p) + (i)))

//  Define aliases for RISC-V CLINT registers
//  For Bumblebee N200: CLINT functions are implemented in TIMER registers

#define CLINT_CTRL_ADDR TIMER_CTRL_ADDR
#define CLINT_MTIME     TIMER_MTIME
#define CLINT_MTIMECMP  TIMER_MTIMECMP
#define CLINT_MSIP      TIMER_MSIP

#define CLINT_REG(offset) _REG32(CLINT_CTRL_ADDR, offset)

#endif  //  __MCU_GD32VF103_ENV_PLATFORM_H__