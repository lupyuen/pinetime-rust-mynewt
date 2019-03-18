/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#include "os/mynewt.h"

#if MYNEWT_VAL(CONSOLE_SEMIHOSTING)
#include <ctype.h>

#include "console/console.h"
#include "console_priv.h"

#if MYNEWT_VAL(CONSOLE_INPUT)
static struct hal_timer semihosting_timer;
#endif

static bool logEnabled = true;  //  Logging is on by default.

void enable_log(void) { logEnabled = true; }
void disable_log(void) { logEnabled = false; }

//  ARM Semihosting code from 
//  http://www.keil.com/support/man/docs/ARMCC/armcc_pge1358787046598.htm
//  http://www.keil.com/support/man/docs/ARMCC/armcc_pge1358787048379.htm
//  http://www.keil.com/support/man/docs/ARMCC/armcc_chr1359125001592.htm
//  https://wiki.dlang.org/Minimal_semihosted_ARM_Cortex-M_%22Hello_World%22

static int __semihost(int command, void* message) {
	//  Send an ARM Semihosting command to the debugger, e.g. to print a message.
	//  To see the message you need to run opencd:
	//    openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -f scripts/connect.ocd

	//  Warning: This code will trigger a breakpoint and hang unless a debugger is connected.
	//  That's how ARM Semihosting sends a command to the debugger to print a message.
	//  This code MUST be disabled on production devices.
    if (!logEnabled) return -1;
    __asm( 
      "mov r0, %[cmd] \n"
      "mov r1, %[msg] \n" 
      "bkpt #0xAB \n"
	:  //  Output operand list: (nothing)
	:  //  Input operand list:
		[cmd] "r" (command), 
		[msg] "r" (message)
	:  //  Clobbered register list:
		"r0", "r1", "memory"
	);
	return 0;  //  TODO
}

//  ARM Semihosting code from https://github.com/ARMmbed/mbed-os/blob/master/platform/mbed_semihost_api.c

// ARM Semihosting Commands
// #define SYS_OPEN   (0x1)
// #define SYS_CLOSE  (0x2)
#define SYS_WRITE  (0x5)
// #define SYS_READ   (0x6)
// #define SYS_ISTTY  (0x9)
// #define SYS_SEEK   (0xa)
// #define SYS_ENSURE (0xb)
// #define SYS_FLEN   (0xc)
// #define SYS_REMOVE (0xe)
// #define SYS_RENAME (0xf)
// #define SYS_EXIT   (0x18)

// We normally set the file handle to 2 to write to the debugger's stderr output.
#define SEMIHOST_HANDLE 2

static int semihost_write(uint32_t fh, const unsigned char *buffer, unsigned int length) {
    //  Write "length" number of bytes from "buffer" to the debugger's file handle fh.
    //  We normally set fh=2 to write to the debugger's stderr output.
    if (length == 0) { return 0; }
    uint32_t args[3];
    args[0] = (uint32_t)fh;
    args[1] = (uint32_t)buffer;
    args[2] = (uint32_t)length;
    return __semihost(SYS_WRITE, args);
}

#if MYNEWT_VAL(CONSOLE_SEMIHOSTING_RETRY_COUNT) > 0

static void
semihosting_console_wait_for_retry(void)
{
    uint32_t ticks;

    if (os_arch_in_isr()) {
#if MYNEWT_VAL(CONSOLE_SEMIHOSTING_RETRY_IN_ISR)
        os_cputime_delay_usecs(MYNEWT_VAL(CONSOLE_SEMIHOSTING_RETRY_DELAY_MS) * 1000);
#endif
    } else {
        ticks = max(1, os_time_ms_to_ticks32(MYNEWT_VAL(CONSOLE_SEMIHOSTING_RETRY_DELAY_MS)));
        os_time_delay(ticks);
    }
}

static void
semihosting_console_write_ch(char c)
{
    static int semihosting_console_retries_left = MYNEWT_VAL(CONSOLE_SEMIHOSTING_RETRY_COUNT);
    os_sr_t sr;
    int ret;

    while (1) {
        OS_ENTER_CRITICAL(sr);
        //  Previously: SEGGER_RTT_WriteNoLock(0, &c, 1);
        semihost_write(SEMIHOST_HANDLE, &c, 1);
        //  Set ret to 1 to indicate success.
        ret = 1;
        OS_EXIT_CRITICAL(sr);

        /*
         * In case write failed we can wait a bit and retry to allow host pull
         * some data from buffer. However, in case there is no host connected
         * we should not spend time retrying over and over again so need to be
         * smarter here:
         * - each successful write resets retry counter to predefined value
         * - each failed write will retry until success or retry counter drops
         *   to zero
         * This means that if we failed to write some character after number of
         * retries (which means that most likely there is no host connected to
         * read data), we stop retrying until successful write (which means that
         * host is reading data).
         */

        if (ret) {
            semihosting_console_retries_left = MYNEWT_VAL(CONSOLE_SEMIHOSTING_RETRY_COUNT);
            break;
        }

        if (!semihosting_console_retries_left) {
            break;
        }

        semihosting_console_wait_for_retry();
        semihosting_console_retries_left--;
    }
}

#else

static void
semihosting_console_write_ch(char c)
{
    os_sr_t sr;

    OS_ENTER_CRITICAL(sr);
    //  Previously: SEGGER_RTT_WriteNoLock(0, &c, 1);
    semihost_write(SEMIHOST_HANDLE, &c, 1);
    OS_EXIT_CRITICAL(sr);
}

#endif

int
console_out_nolock(int character)
{
    char c = (char)character;

    if (g_silence_console) {
        return c;
    }

    if ('\n' == c) {
        semihosting_console_write_ch('\r');
        console_is_midline = 0;
    } else {
        console_is_midline = 1;
    }

    semihosting_console_write_ch(c);

    return character;
}

void
console_rx_restart(void)
{
    os_cputime_timer_relative(&semihosting_timer, 0);
}

#if MYNEWT_VAL(CONSOLE_INPUT)

#define SEMIHOSTING_INPUT_POLL_INTERVAL_MIN     10 /* ms */
#define SEMIHOSTING_INPUT_POLL_INTERVAL_STEP    10 /* ms */
#define SEMIHOSTING_INPUT_POLL_INTERVAL_MAX     MYNEWT_VAL(CONSOLE_SEMIHOSTING_INPUT_POLL_INTERVAL_MAX)

static void
semihosting_console_poll_func(void *arg)
{
    static uint32_t itvl_ms = SEMIHOSTING_INPUT_POLL_INTERVAL_MIN;
    static int key = -1;
    int ret;

    if (key < 0) {
        //  TODO: key = SEGGER_RTT_GetKey();
    }

    if (key < 0) {
        itvl_ms += SEMIHOSTING_INPUT_POLL_INTERVAL_STEP;
        itvl_ms = min(itvl_ms, SEMIHOSTING_INPUT_POLL_INTERVAL_MAX);
    } else {
        while (key >= 0) {
            ret = console_handle_char((char)key);
            if (ret < 0) {
                return;
            }
            //  TODO: key = SEGGER_RTT_GetKey();
        }
        itvl_ms = SEMIHOSTING_INPUT_POLL_INTERVAL_MIN;
    }

    os_cputime_timer_relative(&semihosting_timer, itvl_ms * 1000);
}
#endif

int
semihosting_console_is_init(void)
{
    return 1;
}

int
semihosting_console_init(void)
{
#if MYNEWT_VAL(CONSOLE_INPUT)
    os_cputime_timer_init(&semihosting_timer, semihosting_console_poll_func, NULL);
    /* start after a second */
    os_cputime_timer_relative(&semihosting_timer, 1000000);
#endif
    return 0;
}

#endif /* MYNEWT_VAL(CONSOLE_SEMIHOSTING) */
