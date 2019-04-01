//  Ported from https://github.com/ARMmbed/ATParser//blob/269f14532b98442669c50383782cbce1c67aced5/BufferedSerial/BufferedSerial.cpp
/**
 * @file    BufferedSerial.cpp
 * @brief   Software Buffer - Extends mbed Serial functionallity adding irq driven TX and RX
 * @author  sam grove
 * @version 1.0
 * @see
 *
 * Copyright (c) 2013
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdarg.h>
#include <assert.h>
#include <os/os.h>
#include <console/console.h>
#include <hal/hal_uart.h>     //  UART functions.
#include "BufferedSerial.h"

extern "C" int BufferedPrintfC(void *stream, int size, const char* format, va_list arg);

//  #define TEST_UART  //  Uncomment to test locally.

#ifdef TEST_UART
    #define MY_UART 0  //  Select UART port: 0 means UART2.
#endif  //  TEST_UART

static char rx_buf[256];        //  ESP8266 receive buffer.  TODO: Support multiple instances.
static char *rx_ptr = NULL;     //  Pointer to next ESP8266 receive buffer byte to be received.  TODO: Support multiple instances.

#ifdef TEST_UART
    static const char *cmds[] = {     //  List of ESP8266 commands to be sent.
        "AT+CWMODE_CUR=3\r\n",  //  Set to WiFi Client mode (not WiFi Access Point mode).
        "AT+CWLAP\r\n",         //  List all WiFi access points.
        NULL                    //  No more commands.
    };
    static const char **cmd_ptr = NULL;   //  Pointer to ESP8266 command being sent.
    static const char *tx_buf = NULL;     //  ESP8266 command buffer being sent.
    static const char *tx_ptr = NULL;     //  Pointer to next ESP8266 command buffer byte to be sent.
    static struct os_callout next_cmd_callout;  //  Callout to switch to next ESP8266 command after a delay.
#endif  //  TEST_UART

static int uart_tx_char(void *arg) {    
    //  UART driver asks for more data to send. Return -1 if no more data is available for TX.
#ifndef TEST_UART
    if (arg == NULL) { return -1; }
    BufferedSerial *serial = (BufferedSerial *) arg;
    return serial->txIrq();
#else
    if (tx_ptr == NULL || *tx_ptr == 0) { return -1; }
    char byte = *tx_ptr++;  //  Fetch next byte from tx buffer.
    return byte;
#endif  //  TEST_UART
}

static int uart_rx_char(void *arg, uint8_t byte) {
    //  UART driver reports incoming byte of data. Return -1 if data was dropped.
#ifndef TEST_UART
    if (arg == NULL) { return -1; }
    BufferedSerial *serial = (BufferedSerial *) arg;
    return serial->rxIrq(byte);
#else
    if (rx_ptr - rx_buf < sizeof(rx_buf)) { *rx_ptr++ = byte; }  //  Save to rx buffer.
    return 0;
#endif  //  TEST_UART
}

static void uart_tx_done(void *arg) {
    //  UART driver reports that transmission is complete.
#ifdef TEST_UART
    //  We wait 5 seconds for the current command to complete, 
    //  then trigger the next_cmd callout to switch to next ESP8266 command.
    int rc = os_callout_reset(&next_cmd_callout, OS_TICKS_PER_SEC * 5);
    assert(rc == 0);
#endif  //  TEST_UART
}

#ifdef TEST_UART
    static void next_cmd(struct os_event *ev) {
        //  Switch to next ESP8266 command.
        assert(ev);
        if (rx_buf[0]) {  //  If UART data has been received...
            console_printf("< %s\n", rx_buf);   //  Show the UART data.
            memset(rx_buf, 0, sizeof(rx_buf));  //  Empty the rx buffer.
            rx_ptr = rx_buf;
        }
        if (*cmd_ptr == NULL) {      //  No more commands.
            tx_buf = NULL;
            tx_ptr = NULL;
            return; 
        }
        tx_buf = *cmd_ptr++;         //  Fetch next command.
        tx_ptr = tx_buf;
        hal_uart_start_rx(MY_UART);  //  Start receiving UART data.
        hal_uart_start_tx(MY_UART);  //  Start transmitting UART data.
    }
#endif  //  TEST_UART

static int setup_uart(BufferedSerial *serial) {
    int rc;
#ifndef TEST_UART
    int uart = serial->_uart;
    uint32_t baud = serial->_baud;
#else
    int uart = MY_UART;
    uint32_t baud = 115200;
#endif  //  TEST_UART
    //  Init rx buffer.
    memset(rx_buf, 0, sizeof(rx_buf));
    rx_ptr = rx_buf;
    #ifdef TEST_UART
        //  Init tx buffer.
        cmd_ptr = cmds;
        if (*cmd_ptr == NULL) {  //  No more commands.
            tx_buf = NULL;
            tx_ptr = NULL;
            return -1; 
        }
        tx_buf = *cmd_ptr++;  //  Fetch first command.
        tx_ptr = tx_buf;
        //  Define the next_cmd callout to switch to next ESP8266 command.
        os_callout_init(&next_cmd_callout, os_eventq_dflt_get(), next_cmd, NULL);
    #endif  //  TEST_UART
    //  Define the UART callbacks.
    rc = hal_uart_init_cbs(uart,
        uart_tx_char, uart_tx_done,
        uart_rx_char, serial);
    if (rc != 0) { return rc; }
    //  Set UART parameters.
    assert(baud != 0);
    rc = hal_uart_config(uart,
        baud,
        8,
        1,
        HAL_UART_PARITY_NONE,
        HAL_UART_FLOW_CTL_NONE
    );
    if (rc != 0) { return rc; }
    #ifdef TEST_UART
        //  Don't call console_printf() tx/rx or some UART data will be dropped.
        hal_uart_start_rx(MY_UART);  //  Start receiving UART data.
        hal_uart_start_tx(MY_UART);  //  Start transmitting UART data.
    #endif  //  TEST_UART
    return 0;
}

BufferedSerial::BufferedSerial(uint32_t buf_size, uint32_t tx_multiple, const char* name)
    : _rxbuf(buf_size), _txbuf((uint32_t)(tx_multiple*buf_size))
{
    this->_initialised = 0;
    this->_buf_size = buf_size;
    this->_tx_multiple = tx_multiple;   
    this->_uart = 0;
    this->_baud = 0;
    os_error_t rc = os_sem_init(&this->_rx_sem, 0);  //  Init to 0 tokens, so caller will block until data is available.
    assert(rc == OS_OK);
}

BufferedSerial::~BufferedSerial(void)
{
}

void BufferedSerial::configure(int uart) {
    _uart = uart;
}

int BufferedSerial::readable(void)
{
    return _rxbuf.available();  // note: look if things are in the buffer
}

int BufferedSerial::writeable(void)
{
    return 1;   // buffer allows overwriting by design, always true
}

int BufferedSerial::getc(int timeout)
{
    //  If no data available, wait until the timeout for data.
    os_error_t rc = os_sem_pend(&_rx_sem, timeout * OS_TICKS_PER_SEC / 1000);
    assert(rc == OS_OK);
    if (_rxbuf.available()) { return _rxbuf.get(); }
    return -1;
}

int BufferedSerial::putc(int c)
{
    _txbuf = (char)c;
    BufferedSerial::prime();
    return c;
}

int BufferedSerial::puts(const char *s)
{
    if (s != NULL) {
        const char* ptr = s;    
        while(*(ptr) != 0) {
            _txbuf = *(ptr++);
        }
        _txbuf = '\n';  // done per puts definition
        BufferedSerial::prime();
        return (ptr - s) + 1;
    }
    return 0;
}

extern "C" size_t BufferedSerialThunk(void *buf_serial, const void *s, size_t length)
{
    BufferedSerial *buffered_serial = (BufferedSerial *)buf_serial;
    return buffered_serial->write(s, length);
}

int BufferedSerial::printf(const char* format, ...)
{
    va_list arg;
    va_start(arg, format);
    int r = BufferedPrintfC((void*)this, this->_buf_size, format, arg);
    va_end(arg);
    return r;
}

size_t BufferedSerial::write(const void *s, size_t length)
{
    if (s != NULL && length > 0) {
        const char* ptr = (const char*)s;
        const char* end = ptr + length;    
        while (ptr != end) {
            _txbuf = *(ptr++);
        }
        BufferedSerial::prime();    
        return ptr - (const char*)s;
    }
    return 0;
}

int BufferedSerial::rxIrq(uint8_t byte)
{
    //  UART driver reports incoming byte of data. Return -1 if data was dropped.
    _rxbuf.put(byte);  //  Add to TX buffer.
    os_error_t rc = os_sem_release(&_rx_sem);  //  Signal to semaphore that data is available.
    assert(rc == OS_OK);
    //  Trigger callback if necessary
    if (_cbs[RxIrq]) { _cbs[RxIrq](_cbs_arg[RxIrq]); }
    return 0;
}

int BufferedSerial::txIrq(void)
{
    //  UART driver asks for more data to send. Return -1 if no more data is available for TX.
    if(_txbuf.available()) {
        uint8_t byte = _txbuf.get();  //  Get data from TX buffer.
        return byte;
    }
    //  Trigger callback if no more data to send.
    if (_cbs[TxIrq]) { _cbs[TxIrq](_cbs_arg[TxIrq]); }
    return -1;
}

void BufferedSerial::prime(void)
{
    if (!_initialised) {
        //  Configure the UART port on first use.
        _initialised = 1;
        int rc = setup_uart(this);
        assert(rc == 0);
    }
    hal_uart_start_rx(_uart);  //  Start receiving UART data.
    hal_uart_start_tx(_uart);  //  Start transmitting UART data.
}

void BufferedSerial::attach(void (*func)(void *), void *arg, IrqType type)
{
    _cbs[type] = func;
    _cbs_arg[type] = arg;
}

void BufferedSerial::baud(uint32_t baud0)
{
    _baud = baud0;
}
