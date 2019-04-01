#ifndef __ESP8266_DRIVER_H__
#define __ESP8266_DRIVER_H__

#include "os/os.h"
#include "sensor/sensor.h"

#ifdef __cplusplus
extern "C" {
#endif

struct esp8266_cfg {
};

struct esp8266 {
    struct os_dev dev;
    struct sensor sensor;
    struct esp8266_cfg cfg;
};

int esp8266_init(struct os_dev *dev, void *arg);
int esp8266_config(struct esp8266 *drv, struct esp8266_cfg *cfg);
int esp8266_scan(struct sensor_itf *itf, nsapi_wifi_ap_t *res, unsigned limit);

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_DRIVER_H__ */
