#ifndef __ESP8266_WIFI_H__
#define __ESP8266_WIFI_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/** Enum of encryption types
 *
 *  The security type specifies a particular security to use when
 *  connected to a WiFi network
 */
typedef enum nsapi_security {
    NSAPI_SECURITY_NONE         = 0x0,      /*!< open access point */
    NSAPI_SECURITY_WEP          = 0x1,      /*!< phrase conforms to WEP */
    NSAPI_SECURITY_WPA          = 0x2,      /*!< phrase conforms to WPA */
    NSAPI_SECURITY_WPA2         = 0x3,      /*!< phrase conforms to WPA2 */
    NSAPI_SECURITY_WPA_WPA2     = 0x4,      /*!< phrase conforms to WPA/WPA2 */
    NSAPI_SECURITY_PAP          = 0x5,      /*!< phrase conforms to PPP authentication context */
    NSAPI_SECURITY_CHAP         = 0x6,      /*!< phrase conforms to PPP authentication context */
    NSAPI_SECURITY_UNKNOWN      = 0xFF,     /*!< unknown/unsupported security in scan results */
} nsapi_security_t;

/** nsapi_wifi_ap structure
 *
 *  Structure representing a WiFi Access Point
 */
typedef struct nsapi_wifi_ap {
    char ssid[33]; /* 32 is what 802.11 defines as longest possible name; +1 for the \0 */
    uint8_t bssid[6];
    nsapi_security_t security;
    int8_t rssi;
    uint8_t channel;
} nsapi_wifi_ap_t;

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_WIFI_H__ */
