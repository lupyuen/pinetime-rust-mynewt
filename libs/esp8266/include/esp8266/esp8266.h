//  ESP8266 Driver for Apache Mynewt.  Functions for creating the ESP8266 device instance and performing ESP8266 functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __ESP8266_DRIVER_H__
#define __ESP8266_DRIVER_H__

#include <esp8266/network.h>
#include <esp8266/wifi.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define ESP8266_DEVICE "esp8266_0"  //  Name of the ESP8266 device
#define ESP8266_SOCKET_COUNT 2      //  Max number of concurrent TCP+UDP connections allowed.  Should be 5 or fewer, since ESP8266 supports up to 5 sockets.

//  Use static buffers to avoid dynamic memory allocation (new, delete)
#define ESP8266_TX_BUFFER_SIZE      400  //  Must be large enough to hold sensor and geolocation CoAP UDP messages.
#define ESP8266_RX_BUFFER_SIZE      256
#define ESP8266_PARSER_BUFFER_SIZE  256

//  Various timeouts for different ESP8266 operations, in milliseconds.
#define ESP8266_CONNECT_TIMEOUT     10000  //  10  seconds: Timeout for connecting to WiFi access point
#define ESP8266_SEND_TIMEOUT        10000  //  10  seconds: Timeout for sending a packet
#define ESP8266_RECV_TIMEOUT            0  //   0  seconds: Timeout for receiving a packet
#define ESP8266_SCAN_TIMEOUT        30000  //  30  seconds: Timeout for scanning WiFi access points
#define ESP8266_MISC_TIMEOUT         2000  //   2  seconds: Timeout for opening a socket

typedef bool filter_func_t0(nsapi_wifi_ap_t *, unsigned);

//  ESP8266 Socket: Represents an ESP8266 socket that has been allocated.
struct esp8266_socket {
    int id;
    nsapi_protocol_t proto;
    bool connected;
    const char *host;  //  Must point to static string that will not change.
    uint16_t port;
};

//  ESP8266 Configuration: SSID and socket configuration
struct esp8266_cfg {
    //  UART Configuration
    int uart;
    
    //  SSID Configuration
    char ap_ssid[33]; /* 32 is what 802.11 defines as longest possible name; +1 for the \0 */
    nsapi_security_t ap_sec;
    uint8_t ap_ch;
    char ap_pass[64]; /* The longest allowed passphrase */

    //  Socket Configuration
    uint8_t _ids[ESP8266_SOCKET_COUNT];  //  Set to true if the socket is in use.
    struct esp8266_socket _sockets[ESP8266_SOCKET_COUNT];
    struct {
        void (*callback)(void *);
        void *data;
    } _cbs[ESP8266_SOCKET_COUNT];
};

//  ESP8266 Device Instance for Mynewt
struct esp8266 {
    struct os_dev dev;
    struct esp8266_cfg cfg;
    void *controller;  //  Pointer to controller instance (ESP8266 *)
};

//  Create the Mynewt device for ESP8266.  Use the default ESP8266 config.  Return 0 if successful.
int esp8266_create(void);

//  Copy the default ESP8266 config into cfg.  Returns 0.
int esp8266_default_cfg(struct esp8266_cfg *cfg);

//  Configure the ESP8266 driver.  Called by os_dev_create().  Return 0 if successful.
int esp8266_init(struct os_dev *dev0, void *arg);

//  Apply the ESP8266 driver configuration.  Return 0 if successful.
int esp8266_config(struct esp8266 *dev, struct esp8266_cfg *cfg);  

//  Scan for WiFi access points and save into "res". Save up to "limit" number of access points.
//  "filter_func" (if not null) will be called with the current access point, and the number of access points
//  saved into "res".  If "filer_func" returns true, then the access point is saved into "res".
//  Return the number of access points actually saved into "res".
//  Assume that ESP8266::startup() has already been called.
int esp8266_scan(struct esp8266 *dev, nsapi_wifi_ap_t *res, unsigned limit, filter_func_t0 *filter_func);  

//  Connect to the WiFi access point with the SSID and password.  Return 0 if successful.
int esp8266_connect(struct esp8266 *dev, const char *ssid, const char *pass);  

//  Save the credentials for the WiFi access point.  Return 0 if successful.
int esp8266_set_credentials(struct esp8266 *dev, const char *ssid, const char *pass, nsapi_security_t security);      

//  Disconnect from the WiFi access point.  Return 0 if successful.
int esp8266_disconnect(struct esp8266 *dev);  

//  Allocate a socket.  Return 0 if successful.
int esp8266_socket_open(struct esp8266 *dev, void **handle, nsapi_protocol_t proto);  

//  Close the socket.  Return 0 if successful.
int esp8266_socket_close(struct esp8266 *dev, void *handle);  

//  Connect the socket to the host and port via UDP or TCP.  Return 0 if successful.
//  Note: Host must point to a static string that will never change.
int esp8266_socket_connect(struct esp8266 *dev, void *handle, const char *host, uint16_t port);

//  Send the byte buffer to the socket.  Return number of bytes sent.
int esp8266_socket_send(struct esp8266 *dev, void *handle, const void *data, unsigned size);

//  Send the chain of mbufs to the socket.  Return number of bytes sent.
int esp8266_socket_send_mbuf(struct esp8266 *dev, void *handle, struct os_mbuf *m);

//  Send the byte buffer to the host and port.  Return number of bytes sent.
//  Note: Host must point to a static string that will never change.
int esp8266_socket_sendto(struct esp8266 *dev, void *handle, const char *host, uint16_t port, const void *data, unsigned size);

//  Attach a callback to a socket.
void esp8266_socket_attach(struct esp8266 *dev, void *handle, void (*callback)(void *), void *data);

const char *esp8266_get_ip_address(struct esp8266 *dev);   //  Get the client IP address.
const char *esp8266_get_mac_address(struct esp8266 *dev);  //  Get the client MAC address.
const char *esp8266_get_gateway(struct esp8266 *dev);  //  Get the gateway address.
const char *esp8266_get_netmask(struct esp8266 *dev);  //  Get the netmask.
int8_t esp8266_get_rssi(struct esp8266 *dev);          //  Get the WiFi signal strength.

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_DRIVER_H__ */
