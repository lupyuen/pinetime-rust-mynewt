//  ESP8266 Driver for Apache Mynewt.  Functions for creating the driver instance and performing ESP8266 functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __ESP8266_DRIVER_H__
#define __ESP8266_DRIVER_H__

#include <os/os.h>
#include <sensor/sensor.h>
#include "network.h"
#include "wifi.h"

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define ESP8266_DEVICE "esp8266_0"
#define ESP8266_SOCKET_COUNT 2  //  Max number of concurrent TCP+UDP connections allowed.  Should be 5 or fewer, since ESP8266 supports up to 5 sockets.

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

//  ESP8266 Driver Instance for Mynewt
struct esp8266 {
    struct os_dev dev;
    struct sensor sensor;
    struct esp8266_cfg cfg;
};

int init_esp8266(void);  //  Init the Mynewt sensor device for ESP8266.

int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg);  //  Configure the ESP8266 driver.
int esp8266_scan(struct sensor_itf *itf, nsapi_wifi_ap_t *res, unsigned limit, filter_func_t0 *filter_func);  //  Scan for WiFi access points. Assume that ESP8266::startup() has already been called.

int esp8266_connect(struct sensor_itf *itf, const char *ssid, const char *pass);  //  Connect to the WiFi access point with the SSID and password.
int esp8266_set_credentials(struct sensor_itf *itf, const char *ssid, const char *pass, nsapi_security_t security);      //  Save the credentials for the WiFi access point.
int esp8266_disconnect(struct sensor_itf *itf);  //  Disconnect from the WiFi access point.

const char *esp8266_get_ip_address(struct sensor_itf *itf);
const char *esp8266_get_mac_address(struct sensor_itf *itf);
const char *esp8266_get_gateway(struct sensor_itf *itf);
const char *esp8266_get_netmask(struct sensor_itf *itf);
int8_t esp8266_get_rssi(struct sensor_itf *itf);

int esp8266_socket_open(struct sensor_itf *itf, void **handle, nsapi_protocol_t proto);
int esp8266_socket_close(struct sensor_itf *itf, void *handle);
int esp8266_socket_connect(struct sensor_itf *itf, void *handle, const char *host, uint16_t port);
int esp8266_socket_send(struct sensor_itf *itf, void *handle, const void *data, unsigned size);
int esp8266_socket_send_mbuf(struct sensor_itf *itf, void *handle, struct os_mbuf *m);
int esp8266_socket_sendto(struct sensor_itf *itf, void *handle, const char *host, uint16_t port, const void *data, unsigned size);
void esp8266_socket_attach(struct sensor_itf *itf, void *handle, void (*callback)(void *), void *data);

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_DRIVER_H__ */
