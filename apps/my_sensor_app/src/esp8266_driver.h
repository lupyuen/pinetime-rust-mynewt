//  ESP8266 driver for Apache Mynewt
#ifndef __ESP8266_DRIVER_H__
#define __ESP8266_DRIVER_H__

#include "os/os.h"
#include "sensor/sensor.h"
#include "wifi.h"

#ifdef __cplusplus
extern "C" {
#endif

#define ESP8266_DEVICE "esp8266_0"
#define ESP8266_SOCKET_COUNT 5

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

void esp8266_sensor_dev_create(void);
int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg);
int esp8266_scan(struct sensor_itf *itf, nsapi_wifi_ap_t *res, unsigned limit);
int esp8266_connect(struct sensor_itf *itf, const char *ssid, const char *pass, nsapi_security_t security, uint8_t channel);
int esp8266_set_credentials(struct sensor_itf *itf, const char *ssid, const char *pass, nsapi_security_t security);

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_DRIVER_H__ */
