//  ESP8266 driver for Apache Mynewt
#ifndef __ESP8266_DRIVER_H__
#define __ESP8266_DRIVER_H__

#include <os/os.h>
#include <sensor/sensor.h>
#include <oic/port/oc_connectivity.h>
#include "network.h"
#include "wifi.h"

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define COAP_PORT_UNSECURED (5683)  //  Port number for CoAP Unsecured
#define ESP8266_DEVICE "esp8266_0"
#define ESP8266_SOCKET_COUNT 2  //  Max number of concurrent TCP+UDP connections allowed.

struct oc_server_handle;

//  ESP8266 Endpoint
struct esp8266_endpoint {
    struct oc_ep_hdr ep;  //  Don't change, must be first field.  Will be initialised upon use.
    const char *host;     //  Must point to static string that will not change.
    uint16_t port;
};

//  ESP8266 Server Endpoint
struct esp8266_server {
    struct esp8266_endpoint endpoint;  //  Don't change, must be first field.
    struct oc_server_handle *handle;   //  Actually points back to itself.  Set here for convenience.
};

//  ESP8266 Socket
struct esp8266_socket {
    int id;
    nsapi_protocol_t proto;
    bool connected;
    const char *host;  //  Must point to static string that will not change.
    uint16_t port;
};

//  ESP8266 Configuration
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

void init_esp8266(void);  //  Init the Mynewt sensor device for ESP8266.
void init_esp8266_endpoint(struct esp8266_endpoint *endpoint);  //  Init the endpoint before use.
void init_esp8266_server(struct esp8266_server *server);        //  Init the server endpoint before use.
void esp8266_register_transport(void);  //  Register the CoAP transport for ESP8266.

int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg);
int esp8266_scan(struct sensor_itf *itf, nsapi_wifi_ap_t *res, unsigned limit);
int esp8266_send_udp(struct sensor_itf *itf, const char *host, uint16_t port, const char *buffer, int length);

int esp8266_connect(struct sensor_itf *itf, const char *ssid, const char *pass);
int esp8266_set_credentials(struct sensor_itf *itf, const char *ssid, const char *pass, nsapi_security_t security);
int esp8266_disconnect(struct sensor_itf *itf);

const char *esp8266_get_ip_address(struct sensor_itf *itf);
const char *esp8266_get_mac_address(struct sensor_itf *itf);
const char *esp8266_get_gateway(struct sensor_itf *itf);
const char *esp8266_get_netmask(struct sensor_itf *itf);
int8_t esp8266_get_rssi(struct sensor_itf *itf);

int esp8266_socket_open(struct sensor_itf *itf, void **handle, nsapi_protocol_t proto);
int esp8266_socket_close(struct sensor_itf *itf, void *handle);
int esp8266_socket_connect(struct sensor_itf *itf, void *handle, const char *host, uint16_t port);
int esp8266_socket_send(struct sensor_itf *itf, void *handle, const void *data, unsigned size);
int esp8266_socket_sendto(struct sensor_itf *itf, void *handle, const char *host, uint16_t port, const void *data, unsigned size);
void esp8266_socket_attach(struct sensor_itf *itf, void *handle, void (*callback)(void *), void *data);

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_DRIVER_H__ */
