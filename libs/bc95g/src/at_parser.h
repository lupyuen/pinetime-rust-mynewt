//  Ported from https://github.com/ARMmbed/ATParser//blob/269f14532b98442669c50383782cbce1c67aced5/ATParser.h
/* Copyright (c) 2015 ARM Limited
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
 *
 * @section DESCRIPTION
 *
 * Parser for the AT command syntax
 *
 */
#ifndef AT_PARSER_H
#define AT_PARSER_H

#include <cstdarg>
#include "buffered_serial/buffered_serial.h"
#define MAX_OOBS 2  //  Up to 2 callbacks allowed.

/**
* Parser class for parsing AT commands
*
* Here are some examples:
* @code
* ATParser at = ATParser(serial, "\r\n");
* int value;
* char buffer[100];
*
* at.send("AT") && at.recv("OK");
* at.send("AT+CWMODE=%d", 3) && at.recv("OK");
* at.send("AT+CWMODE?") && at.recv("+CWMODE:%d\r\nOK", &value);
* at.recv("+IPD,%d:", &value);
* at.read(buffer, value);
* at.recv("OK");
* @endcode
*/
class ATParser
{
private:
    // Serial information
    BufferedSerial *_serial;
    char *_buffer;
    int _buffer_size;
    int _timeout;

    // Parsing information
    const char *_delimiter;
    int _delim_size;
    bool dbg_on;

    struct oob {
        unsigned len;
        const char *prefix;
        void (*cb)(void *);
        void *arg;
    };
    oob _oobs[MAX_OOBS];

public:
    /**
    * Constructor
    *
    * @param serial serial interface to use for AT commands
    * @param buffer internal buffer for transaction. Passing in the buffer avoids dynamic memory allocation (new, delete)
    * @param buffer_size size of internal buffer for transaction
    * @param delimiter string of characters to use as line delimiters
    * @param timeout timeout of the connection in milliseconds
    */
    void init(BufferedSerial &serial, char *buffer, int buffer_size, const char *delimiter = "\r\n", int timeout = 8000, bool debug = false);

    /**
    * Allows timeout to be changed between commands
    *
    * @param timeout timeout of the connection
    */
    void setTimeout(int timeout) {
        _timeout = timeout;
    }

    /**
    * Sets string of characters to use as line delimiters
    *
    * @param delimiter string of characters to use as line delimiters
    */
    void setDelimiter(const char *delimiter) {
        _delimiter = delimiter;
        _delim_size = strlen(delimiter);
    }
    
    /**
    * Allows echo to be on or off
    *
    * @param echo 1 for echo and 0 turns it off
    */
    void debugOn(uint8_t on) {
        dbg_on = (on) ? 1 : 0;
    }

    /**
    * Sends an AT command
    *
    * Sends a formatted command using printf style formatting
    * @see ::printf
    *
    * @param command printf-like format string of command to send which
    *                is appended with the specified delimiter
    * @param ... all printf-like arguments to insert into command
    * @return true only if command is successfully sent
    */
    bool send(const char *command, ...);
    bool vsend(const char *command, va_list args);

    /**
    * Receive an AT response
    *
    * Receives a formatted response using scanf style formatting
    * @see ::scanf
    *
    * Responses are parsed line at a time using the specified delimiter.
    * Any received data that does not match the response is ignored until
    * a timeout occurs.
    *
    * @param response scanf-like format string of response to expect
    * @param ... all scanf-like arguments to extract from response
    * @return true only if response is successfully matched
    */
    bool recv(const char *response, ...);
    bool vrecv(const char *response, va_list args);

    /**
    * Write a single byte to the underlying stream
    *
    * @param c The byte to write
    * @return The byte that was written or -1 during a timeout
    */
    int putc(char c);

    /**
    * Get a single byte from the underlying stream
    *
    * @return The byte that was read or -1 during a timeout
    */
    int getc();

    /**
    * Write an array of bytes to the underlying stream
    *
    * @param data the array of bytes to write
    * @param size number of bytes to write
    * @return number of bytes written or -1 on failure
    */
    int write(const char *data, int size);

    /**
    * Read an array of bytes from the underlying stream
    *
    * @param data the destination for the read bytes
    * @param size number of bytes to read
    * @return number of bytes read or -1 on failure
    */
    int read(char *data, int size);

    /**
    * Direct printf to underlying stream
    * @see ::printf
    *
    * @param format format string to pass to printf
    * @param ... arguments to printf
    * @return number of bytes written or -1 on failure
    */
    int printf(const char *format, ...);
    int vprintf(const char *format, va_list args);

    /**
    * Direct scanf on underlying stream
    * @see ::scanf
    *
    * @param format format string to pass to scanf
    * @param ... arguments to scanf
    * @return number of bytes read or -1 on failure
    */
    int scanf(const char *format, ...);
    int vscanf(const char *format, va_list args);

    /**
    * Attach a callback for out-of-band data
    * 
    * @param prefix string on when to initiate callback
    * @param func callback to call when string is read
    * @note out-of-band data is only processed during a scanf call
    */
    void oob(const char *prefix, void (*func)(void *), void *arg);

    /**
    * Flushes the underlying stream.
    * @return 0
    */
    int flush();
};
#endif
