//  Ported from https://github.com/ARMmbed/ATParser//blob/269f14532b98442669c50383782cbce1c67aced5/BufferedSerial/BufferedSerial.h
/**
 * @file    BufferedSerial.h
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

#ifndef BUFFEREDSERIAL_H
#define BUFFEREDSERIAL_H

#include <os/os.h>  //  For os_sem.
#include "ring_buffer.h"
#undef putc      //  Avoid conflict with putc() below.

#define IrqType int
#define RxIrq 0  //  First callback in _cbs is rx.
#define TxIrq 1  //  Second callback in _cbs is tx.

/** A serial port (UART) for communication with other serial devices
 *
 * Can be used for Full Duplex communication, or Simplex by specifying
 * one pin as NC (Not Connected)
 *
 * Example:
 * @code
 *  #include "mbed.h"
 *  #include "BufferedSerial.h"
 *
 *  BufferedSerial pc(USBTX, USBRX);
 *
 *  int main()
 *  { 
 *      while(1)
 *      {
 *          Timer s;
 *        
 *          s.start();
 *          pc.printf("Hello World - buffered\n");
 *          int buffered_time = s.read_us();
 *          wait(0.1f); // give time for the buffer to empty
 *        
 *          s.reset();
 *          printf("Hello World - blocking\n");
 *          int polled_time = s.read_us();
 *          s.stop();
 *          wait(0.1f); // give time for the buffer to empty
 *        
 *          pc.printf("printf buffered took %d us\n", buffered_time);
 *          pc.printf("printf blocking took %d us\n", polled_time);
 *          wait(0.5f);
 *      }
 *  }
 * @endcode
 */

/**
 *  @class BufferedSerial
 *  @brief Software buffers and interrupt driven tx and rx for Serial. Should not have any virtual methods because we don't support vtables.
 */  
class BufferedSerial
{
private:
    RingBuffer <char> _txbuf;
    RingBuffer <char> _rxbuf;
    uint32_t      _txbuf_size;
    uint32_t      _rxbuf_size; 
    uint8_t       _initialised;  //  Set to non-zero if UART port has been initialised.
    os_sem        _rx_sem;     //  Semaphore that is signalled for every byte received.
    void (*_cbs[2])(void *);   //  RX, TX callbacks, indexed by RxIrq, TxIrq.
    void *_cbs_arg[2];         //  RX, TX callback arguments, indexed by RxIrq, TxIrq.
    
public:
    /** Create a BufferedSerial port
     *  @param uart UART port number. 0 means UART2
     *  @param txbuf TX static buffer. Passing in the buffer avoids dynamic memory allocation (new, delete)
     *  @param txbuf_size TX buffer size
     *  @param rxbuf RX static buffer. Passing in the buffer avoids dynamic memory allocation (new, delete)
     *  @param txbuf_size RX buffer size
     *  @param name optional name
     */
    void init(char *txbuf, uint32_t txbuf_size, char *rxbuf, uint32_t rxbuf_size, const char* name = NULL);
    
    /** Configure the BufferedSerial port
     *  @param uart UART port number. 0 means UART2
     */
    void configure(int uart);

    /** Set the baud rate
     *  @param baud baud rate e.g. 115200
     */
    void baud(uint32_t baud);
    
    /** Check on how many bytes are in the rx buffer
     *  @return 1 if something exists, 0 otherwise
     */
    int readable(void);
    
    /** Check to see if the tx buffer has room
     *  @return 1 always has room and can overwrite previous content if too small / slow
     */
    int writeable(void);
    
    /** Get a single byte from the BufferedSerial Port.
     *  Should check readable() before calling this.
     *  @param timeout if no data is available, wait until this timeout in milliseconds
     *  @return A byte that came in on the Serial Port. If no data available, return -1
     */
    int getc(int timeout);
    
    /** Write a single byte to the BufferedSerial Port.
     *  @param c The byte to write to the Serial Port
     *  @return The byte that was written to the Serial Port Buffer
     */
    int putc(int c);
    
    /** Write a string to the BufferedSerial Port. Must be NULL terminated
     *  @param s The string to write to the Serial Port
     *  @return The number of bytes written to the Serial Port Buffer
     */
    int puts(const char *s);
    
    /** Write data to the Buffered Serial Port
     *  @param s A pointer to data to send
     *  @param length The amount of data being pointed to
     *  @return The number of bytes written to the Serial Port Buffer
     */
    size_t write(const void *s, size_t length);

    /** Attach a function to call whenever a serial interrupt is generated
     *  @param func A pointer to a void function, or 0 to set as none
     *  @param type Which serial interrupt to attach the member function to (Serial::RxIrq for receive, TxIrq for transmit buffer empty)
     */
    void attach(void (*func)(void *), void *arg, IrqType type=RxIrq);

    //  TODO: Move these internal variables to protected section.
    int rxIrq(uint8_t byte);
    int txIrq(void);
    void prime(void);
    int _uart;
    uint32_t _baud;
};

#endif
