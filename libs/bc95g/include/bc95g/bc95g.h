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
//  BC95G Driver for Apache Mynewt.  Functions for creating the BC95G device instance and performing BC95G functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __BC95G_DRIVER_H__
#define __BC95G_DRIVER_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define BC95G_DEVICE "bc95g_0"  //  Name of the BC95G device
#define BC95G_SOCKET_COUNT 1    //  Max number of concurrent UDP operations allowed

//  Use static buffers to avoid dynamic memory allocation (new, delete)
#define BC95G_TX_BUFFER_SIZE      900  //  Must be large enough to hold sensor and geolocation CoAP UDP messages. 1 byte is represented by 3 chars.
#define BC95G_RX_BUFFER_SIZE      256
#define BC95G_PARSER_BUFFER_SIZE  256

//  Various timeouts for different BC95G operations, in milliseconds.
#define BC95G_CONNECT_TIMEOUT     10000  //  10  seconds: Timeout for connecting to WiFi access point
#define BC95G_SEND_TIMEOUT        10000  //  10  seconds: Timeout for sending a packet
#define BC95G_RECV_TIMEOUT            0  //   0  seconds: Timeout for receiving a packet
#define BC95G_SCAN_TIMEOUT        30000  //  30  seconds: Timeout for scanning WiFi access points
#define BC95G_MISC_TIMEOUT         2000  //   2  seconds: Timeout for opening a socket

//  BC95G Socket: Represents an BC95G socket that has been allocated.
struct bc95g_socket {
    uint16_t local_port;  //  Local UDP port number, or 0 if not allocated.
    struct {
        void (*callback)(void *);
        void *data;
    } callback;  //  Callback for the socket, when data is received.
};

//  BC95G Configuration: UART and Socket Configuration
struct bc95g_cfg {
    //  UART Configuration
    int uart;    
    //  Socket Configuration
    struct bc95g_socket sockets[BC95G_SOCKET_COUNT];
};

//  BC95G Device Instance for Mynewt
struct bc95g {
    struct os_dev dev;
    struct bc95g_cfg cfg;
    //  Last error encountered
    int last_error;
};

//  Create the device instance and configure it.  Called by sysinit() during startup, defined in pkg.yml.
//  Implemented in creator.c as function DEVICE_CREATE().
void bc95g_create(void);

//  Copy the default BC95G config into cfg.  Returns 0.
int bc95g_default_cfg(struct bc95g_cfg *cfg);

//  Configure the BC95G driver.  Called by os_dev_create().  Return 0 if successful.
int bc95g_init(struct os_dev *dev0, void *arg);

//  Copy the BC95G driver configuration from cfg into drv.  Return 0 if successful.
int bc95g_config(struct bc95g *drv, struct bc95g_cfg *cfg);  

//  Connect to the NB-IoT network.  Return 0 if successful.
int bc95g_connect(struct bc95g *dev);  

//  Attach to the NB-IoT network.  Return 0 if successful.
int bc95g_attach(struct bc95g *dev);

//  Detach from the NB-IoT network.  Return 0 if successful.
int bc95g_detach(struct bc95g *dev);

//  Allocate a socket and save to `socket_ptr`.  Return 0 if successful.
int bc95g_socket_open(struct bc95g *dev, struct bc95g_socket **socket_ptr);

//  Close the socket.  Return 0 if successful.
int bc95g_socket_close(struct bc95g *dev, struct bc95g_socket *socket);  

//  Transmit the buffer through the socket.  `length` is the number of bytes in `data`.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
int bc95g_socket_tx(struct bc95g *dev, struct bc95g_socket *socket, const char *host, uint16_t port, const uint8_t *data, uint16_t length, uint8_t sequence);

//  Transmit the chain of mbufs through the socket.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
int bc95g_socket_tx_mbuf(struct bc95g *dev, struct bc95g_socket *socket, const char *host, uint16_t port, uint8_t sequence, struct os_mbuf *mbuf);

//  Attach a callback to a socket.
void bc95g_socket_attach(struct bc95g *dev, struct bc95g_socket *socket, void (*callback)(void *), void *data);

const char *bc95g_get_ip_address(struct bc95g *dev);   //  Get the client IP address.

#ifdef __cplusplus
}
#endif

#endif /* __BC95G_DRIVER_H__ */