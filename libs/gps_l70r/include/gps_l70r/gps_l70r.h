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
//  Quectel L70-R GPS Driver for Apache Mynewt
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __GPS_L70R_DRIVER_H__
#define __GPS_L70R_DRIVER_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define GPS_L70R_DEVICE "gps_l70r_0"  //  Name of the BC95G device
#define GPS_L70R_SOCKET_COUNT 1    //  Max number of concurrent UDP operations allowed

//  Use static buffers to avoid dynamic memory allocation (new, delete)
#define GPS_L70R_TX_BUFFER_SIZE      400  //  Must be large enough to hold sensor and geolocation CoAP UDP messages.
#define GPS_L70R_RX_BUFFER_SIZE      256
#define GPS_L70R_PARSER_BUFFER_SIZE  256

//  Various timeouts for different BC95G operations, in milliseconds.
#define GPS_L70R_CONNECT_TIMEOUT     10000  //  10  seconds: Timeout for connecting to WiFi access point
#define GPS_L70R_SEND_TIMEOUT        10000  //  10  seconds: Timeout for sending a packet
#define GPS_L70R_RECV_TIMEOUT            0  //   0  seconds: Timeout for receiving a packet
#define GPS_L70R_SCAN_TIMEOUT        30000  //  30  seconds: Timeout for scanning WiFi access points
#define GPS_L70R_MISC_TIMEOUT         2000  //   2  seconds: Timeout for opening a socket

//  BC95G Socket: Represents an BC95G socket that has been allocated.
struct gps_l70r_socket {
    uint16_t local_port;  //  Local UDP port number, or 0 if not allocated.
    struct {
        void (*callback)(void *);
        void *data;
    } callback;  //  Callback for the socket, when data is received.
};

//  BC95G Configuration: UART and Socket Configuration
struct gps_l70r_cfg {
    //  UART Configuration
    int uart;    
    //  Socket Configuration
    struct gps_l70r_socket sockets[GPS_L70R_SOCKET_COUNT];
};

//  BC95G Device Instance for Mynewt
struct bc95g {
    struct os_dev dev;
    struct gps_l70r_cfg cfg;
    //  Last error encountered
    int last_error;
};

//  Create the device instance and configure it.  Called by sysinit() during startup, defined in pkg.yml.
//  Implemented in creator.c as function DEVICE_CREATE().
void gps_l70r_create(void);

//  Copy the default BC95G config into cfg.  Returns 0.
int gps_l70r_default_cfg(struct gps_l70r_cfg *cfg);

//  Configure the BC95G driver.  Called by os_dev_create().  Return 0 if successful.
int gps_l70r_init(struct os_dev *dev0, void *arg);

//  Copy the BC95G driver configuration from cfg into drv.  Return 0 if successful.
int gps_l70r_config(struct bc95g *drv, struct gps_l70r_cfg *cfg);  

//  Connect to the NB-IoT network.  Return 0 if successful.
int gps_l70r_connect(struct bc95g *dev);  

//  Attach to the NB-IoT network.  Return 0 if successful.
int gps_l70r_attach(struct bc95g *dev);

//  Detach from the NB-IoT network.  Return 0 if successful.
int gps_l70r_detach(struct bc95g *dev);

//  Allocate a socket and save to `socket_ptr`.  Return 0 if successful.
int gps_l70r_socket_open(struct bc95g *dev, struct gps_l70r_socket **socket_ptr);

//  Close the socket.  Return 0 if successful.
int gps_l70r_socket_close(struct bc95g *dev, struct gps_l70r_socket *socket);  

//  Transmit the buffer through the socket.  `length` is the number of bytes in `data`.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
int gps_l70r_socket_tx(struct bc95g *dev, struct gps_l70r_socket *socket, const char *host, uint16_t port, const uint8_t *data, uint16_t length, uint8_t sequence);

//  Transmit the chain of mbufs through the socket.  `sequence` is a running message sequence number 1 to 255.  Return number of bytes transmitted.
int gps_l70r_socket_tx_mbuf(struct bc95g *dev, struct gps_l70r_socket *socket, const char *host, uint16_t port, uint8_t sequence, struct os_mbuf *mbuf);

//  Attach a callback to a socket.
void gps_l70r_socket_attach(struct bc95g *dev, struct gps_l70r_socket *socket, void (*callback)(void *), void *data);

const char *gps_l70r_get_ip_address(struct bc95g *dev);   //  Get the client IP address.

#ifdef __cplusplus
}
#endif

#endif /* __GPS_L70R_DRIVER_H__ */