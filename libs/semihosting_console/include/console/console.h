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
#ifndef __SEMIHOSTING_CONSOLE_H__
#define __SEMIHOSTING_CONSOLE_H__

#include <inttypes.h>
#include "os/mynewt.h"

#ifdef __cplusplus
extern "C" {
#endif

struct os_eventq;

/** @struct console_input
 * The console_input data structure represents a console input buffer.
 *
 * Each event added to the console avail_queue must have the
 * ev_arg field point to a console_input structure.
 */
struct console_input {
    /** Data buffer that the console uses to save received
     *  characters until a new line is received. */
    char line[MYNEWT_VAL(CONSOLE_MAX_INPUT_LEN)];
};

typedef void (*console_rx_cb)(void);
typedef int (*console_append_char_cb)(char *line, uint8_t byte);
typedef void (*completion_cb)(char *str, console_append_char_cb cb);

//  Implemented only for Semihosting Console.
void console_buffer(const char *buffer, unsigned int length);  //  Add the string to the output buffer.
void console_printhex(uint8_t v);    //  Write a char in hexadecimal to the output buffer.
void console_printint(int i);        //  Write an int i the output buffer.
void console_printfloat(float f);    //  Write a float to the output buffer, with 2 decimal places.
void console_printdouble(double f);  //  Write a double to the output buffer, with 6 decimal places.
void console_dump(const uint8_t *buffer, unsigned int len);  //  Append "length" number of bytes from "buffer" to the output buffer in hex format.
void console_flush(void);  //  Flush the output buffer to the console.

void console_deinit(void);
void console_reinit(void);
int console_init(console_rx_cb rx_cb);
int console_is_init(void);
void console_write(const char *str, int cnt);
void console_blocking_mode(void);
void console_non_blocking_mode(void);
void console_echo(int on);

int console_printf(const char *fmt, ...)
    __attribute__ ((format (printf, 1, 2)));;

void console_set_completion_cb(completion_cb cb);
int console_handle_char(uint8_t byte);

/* Set queue to send console line events to */
void console_line_queue_set(struct os_eventq *evq);
/* Put (handled) line event to console */
void console_line_event_put(struct os_event *ev);
/**
 * Global indicating whether console is silent or not
 */
extern bool g_silence_console;
/**
 * Global indicating whether console input is disabled or not
 */
extern bool g_console_input_ignore;


/**
 * Silences console output, input is still active
 *
 * @param silent Let console know if it needs to be silent,
 *        true for silence, false otherwise
 */
static void inline
console_silence(bool silent)
{
    g_silence_console = silent;
}


/**
 * Ignores console input, output is still active
 *
 * @param ignore Lets console know if input should be disabled,
 *        true for ignore input, false otherwise
 */
static void inline
console_input_ignore(bool ignore)
{
    g_console_input_ignore = ignore;
}

extern int console_is_midline;
extern int console_out(int character);
extern void console_rx_restart(void);

int console_lock(int timeout);
int console_unlock(void);

#ifdef __cplusplus
}
#endif

#endif /* __SEMIHOSTING_CONSOLE_H__ */
