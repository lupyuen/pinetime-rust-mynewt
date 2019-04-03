//  ESP8266 driver for Apache Mynewt
#ifndef __ESP8266_DRIVER_H__
#define __ESP8266_DRIVER_H__

#include <os/os.h>
#include <sensor/sensor.h>
#include "network.h"
#include "wifi.h"

#ifdef __cplusplus
extern "C" {
#endif

#define ESP8266_DEVICE "esp8266_0"
#define ESP8266_SOCKET_COUNT 3  //  Max number of concurrent TCP+UDP connections allowed.

//  ESP8266 Configuration
struct esp8266_cfg {
    uint8_t _ids[ESP8266_SOCKET_COUNT];
    char ap_ssid[33]; /* 32 is what 802.11 defines as longest possible name; +1 for the \0 */
    nsapi_security_t ap_sec;
    uint8_t ap_ch;
    char ap_pass[64]; /* The longest allowed passphrase */
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

void esp8266_sensor_dev_create(void);  //  Create the Mynewt sensor device for ESP8266.
int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg);
int esp8266_scan(struct sensor_itf *itf, nsapi_wifi_ap_t *res, unsigned limit);
int esp8266_connect(struct sensor_itf *itf, const char *ssid, const char *pass, nsapi_security_t security, uint8_t channel);
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
