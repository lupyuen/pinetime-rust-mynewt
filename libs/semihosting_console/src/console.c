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

#include <assert.h>
#include <inttypes.h>
#include <ctype.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "os/mynewt.h"
#include "os/os_task.h"
#include "console/console.h"
#include "console/ticks.h"
#include "console_priv.h"

/* Control characters */
#define ESC                0x1b
#define DEL                0x7f
#define BS                 0x08

/* ANSI escape sequences */
#define ANSI_ESC           '['
#define ANSI_UP            'A'
#define ANSI_DOWN          'B'
#define ANSI_FORWARD       'C'
#define ANSI_BACKWARD      'D'
#define ANSI_END           'F'
#define ANSI_HOME          'H'
#define ANSI_DEL           '~'

#define ESC_ESC         (1 << 0)
#define ESC_ANSI        (1 << 1)
#define ESC_ANSI_FIRST  (1 << 2)
#define ESC_ANSI_VAL    (1 << 3)
#define ESC_ANSI_VAL_2  (1 << 4)

#define CONSOLE_NLIP_PKT_START1 (6)
#define CONSOLE_NLIP_PKT_START2 (9)
#define CONSOLE_NLIP_DATA_START1 (4)
#define CONSOLE_NLIP_DATA_START2 (20)

#define NLIP_PKT_START1  (1 << 0)
#define NLIP_PKT_START2  (1 << 1)
#define NLIP_DATA_START1 (1 << 2)
#define NLIP_DATA_START2 (1 << 3)

/* Indicates whether the previous line of output was completed. */
int console_is_midline;

static int echo = MYNEWT_VAL(CONSOLE_ECHO);
static bool rx_stalled;

static struct os_eventq avail_queue;
static struct os_eventq *lines_queue;
static completion_cb completion;
bool g_silence_console;
bool g_console_input_ignore;
static struct os_mutex console_write_lock;

/*
 * Default implementation in case all consoles are disabled - we just ignore any
 * output to console.
 */
int __attribute__((weak)) console_out_nolock(int c) {
    return c;
}

void console_echo(int on) { echo = on; }

int console_lock(int timeout) { return OS_OK; }

int console_unlock(void) { return OS_OK; }

int console_out(int c) { return console_out_nolock(c); }

void console_write(const char *str, int cnt) {
    int i;
    for (i = 0; i < cnt; i++) {
        if (console_out_nolock((int)str[i]) == EOF) { break; }
    }
}

void console_blocking_mode(void) {
    disable_buffer();
}

void console_non_blocking_mode(void) {
    enable_buffer();
}

static inline void cursor_forward(unsigned int count) {
    console_printf("\x1b[%uC", count);
}

static inline void cursor_backward(unsigned int count) {
    console_printf("\x1b[%uD", count);
}

static inline void cursor_save(void) {
    console_out(ESC);
    console_out('[');
    console_out('s');
}

static inline void cursor_restore(void) {
    console_out(ESC);
    console_out('[');
    console_out('u');
}

int console_handle_char(uint8_t byte) { return 0; }

int console_is_init(void) {
#if MYNEWT_VAL(CONSOLE_SEMIHOSTING)
    return semihosting_console_is_init();
#endif
    return 0;
}

void console_line_queue_set(struct os_eventq *evq) {
    lines_queue = evq;
}

void console_line_event_put(struct os_event *ev) {
    os_eventq_put(&avail_queue, ev);
    if (rx_stalled) {
        rx_stalled = false;
        console_rx_restart();
    }
}

void console_set_completion_cb(completion_cb cb) {
    completion = cb;
}

void console_deinit(void) {}

void console_reinit(void) {}

void console_pkg_init(void) {
    int rc = 0;

    /* Ensure this function only gets called by sysinit. */
    SYSINIT_ASSERT_ACTIVE();

    os_eventq_init(&avail_queue);
    os_mutex_init(&console_write_lock);

#if MYNEWT_VAL(CONSOLE_SEMIHOSTING)
    rc = semihosting_console_init();
#endif
    SYSINIT_PANIC_ASSERT(rc == 0);
}
