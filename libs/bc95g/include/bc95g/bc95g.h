//  BC95G Driver for Apache Mynewt.  Functions for creating the BC95G device instance and performing BC95G functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __BC95G_DRIVER_H__
#define __BC95G_DRIVER_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define BC95G_DEVICE "bc95g_0"  //  Name of the BC95G device
#define BC95G_SOCKET_COUNT 2      //  Max number of concurrent TCP+UDP connections allowed.  Should be 5 or fewer, since BC95G supports up to 5 sockets.

//  Use static buffers to avoid dynamic memory allocation (new, delete)
#define BC95G_TX_BUFFER_SIZE      400  //  Must be large enough to hold sensor and geolocation CoAP UDP messages.
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
};

//  Create the device instance and configure it.  Called by sysinit() during startup, defined in pkg.yml.
//  Implemented in creator.c as function DEVICE_CREATE().
void bc95g_create(void);

//  Copy the default BC95G config into cfg.  Returns 0.
int bc95g_default_cfg(struct bc95g_cfg *cfg);

//  Configure the BC95G driver.  Called by os_dev_create().  Return 0 if successful.
int bc95g_init(struct os_dev *dev0, void *arg);

//  Apply the BC95G driver configuration.  Return 0 if successful.
int bc95g_config(struct bc95g *dev, struct bc95g_cfg *cfg);  

//  Connect to the NB-IoT network.  Return 0 if successful.
int bc95g_connect(struct bc95g *dev);  

//  Allocate a socket.  Return 0 if successful.
int bc95g_socket_open(struct bc95g *dev, void **handle);  

//  Close the socket.  Return 0 if successful.
int bc95g_socket_close(struct bc95g *dev, void *handle);  

//  Connect the socket to the host and port via UDP or TCP.  Return 0 if successful.
//  Note: Host must point to a static string that will never change.
int bc95g_socket_connect(struct bc95g *dev, void *handle, const char *host, uint16_t port);

//  Send the byte buffer to the socket.  Return number of bytes sent.
int bc95g_socket_send(struct bc95g *dev, void *handle, const void *data, unsigned size);

//  Send the chain of mbufs to the socket.  Return number of bytes sent.
int bc95g_socket_send_mbuf(struct bc95g *dev, void *handle, struct os_mbuf *m);

//  Send the byte buffer to the host and port.  Return number of bytes sent.
//  Note: Host must point to a static string that will never change.
int bc95g_socket_sendto(struct bc95g *dev, void *handle, const char *host, uint16_t port, const void *data, unsigned size);

//  Attach a callback to a socket.
void bc95g_socket_attach(struct bc95g *dev, void *handle, void (*callback)(void *), void *data);

const char *bc95g_get_ip_address(struct bc95g *dev);   //  Get the client IP address.

#ifdef __cplusplus
}
#endif

#endif /* __BC95G_DRIVER_H__ */
