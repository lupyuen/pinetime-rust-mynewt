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

#define OUTPUT_BUFFER_SIZE 2048  //  Use a larger buffer size so that we don't affect interrupt processing.
static char output_buffer[OUTPUT_BUFFER_SIZE + 1] = { 0 };  //  Buffer to hold output before flushing.
static volatile uint16_t output_buffer_length = 0;         //  Number of bytes in buffer.
static bool log_enabled = true;  //  Logging is on by default.

void enable_log(void)  { log_enabled = true; }
void disable_log(void) { log_enabled = false; }

//  ARM Semihosting code from 
//  http://www.keil.com/support/man/docs/ARMCC/armcc_pge1358787046598.htm
//  http://www.keil.com/support/man/docs/ARMCC/armcc_pge1358787048379.htm
//  http://www.keil.com/support/man/docs/ARMCC/armcc_chr1359125001592.htm
//  https://wiki.dlang.org/Minimal_semihosted_ARM_Cortex-M_%22Hello_World%22

static int __semihost(int command, void* message) {
	//  Send an ARM Semihosting command to the debugger, e.g. to print a message.
	//  To see the message you need to run opencd:
	//    openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -f scripts/debug.ocd

	//  Warning: This code will trigger a breakpoint and hang unless a debugger is connected.
	//  That's how ARM Semihosting sends a command to the debugger to print a message.
	//  This code MUST be disabled on production devices.
    if (!log_enabled) return -1;
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

void console_flush(void) {
    //  Flush output buffer to the console log.  This will be slow.
    if (!log_enabled) { output_buffer_length = 0; return; }  //  Skip if log not enabled.
    if (output_buffer_length == 0) { return; }  //  Buffer is empty, nothing to write.
    if (os_arch_in_isr()) { return; }  //  Don't flush if we are called during an interrupt.
	semihost_write(SEMIHOST_HANDLE, (const unsigned char *) output_buffer, output_buffer_length);
    output_buffer[0] = 0;
    output_buffer_length = 0;
}

void console_buffer(const char *buffer, unsigned int length) {
    //  Append "length" number of bytes from "buffer" to the output buffer.
    if (length >= OUTPUT_BUFFER_SIZE) { return; }  //  Don't allow logging of very long messages.
    if (output_buffer_length + length >= OUTPUT_BUFFER_SIZE) {  //  If output buffer is full...
        console_flush();  //  Display the output buffer.
    }
    if (output_buffer_length + length >= OUTPUT_BUFFER_SIZE) {  //  If output buffer is still full...
        //  Erase the entire buffer.  Latest log is more important than old log.
        strcpy(output_buffer, "[DROPPED]");
        output_buffer_length = 9;
        //  Still can't fit after clearing.  Quit.
        if (output_buffer_length + length >= OUTPUT_BUFFER_SIZE) { return; }
    }
    //  Else append to the buffer.
    memcpy(&output_buffer[output_buffer_length], buffer, length);
    output_buffer_length += length;
}

static void semihosting_console_write_ch(char c) {
    if (c == '\r') { return; }  //  Don't display \r.
    console_buffer(&c, 1);  //  Append the char to the output buffer.
    //  if (c == '\n') { console_flush(); }  //  If we see a newline, flush the buffer.
}

int console_out_nolock(int character) {
    char c = (char)character;
    if (g_silence_console) { return c; }
    if ('\n' == c) {
        semihosting_console_write_ch('\r');
        console_is_midline = 0;
    } else {
        console_is_midline = 1;
    }
    semihosting_console_write_ch(c);
    return character;
}

void console_rx_restart(void) {}

int semihosting_console_is_init(void) { return 1; }

int semihosting_console_init(void) { return 0; }

#endif /* MYNEWT_VAL(CONSOLE_SEMIHOSTING) */
