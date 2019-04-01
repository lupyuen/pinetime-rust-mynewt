#ifndef __WIFI_H__
#define __WIFI_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/** Enum of standardized error codes
 *
 *  Valid error codes have negative values and may
 *  be returned by any network operation.
 *
 *  @enum nsapi_error
 */
enum nsapi_error {
    NSAPI_ERROR_OK                  =  0,        /*!< no error */
    NSAPI_ERROR_WOULD_BLOCK         = -3001,     /*!< no data is not available but call is non-blocking */
    NSAPI_ERROR_UNSUPPORTED         = -3002,     /*!< unsupported functionality */
    NSAPI_ERROR_PARAMETER           = -3003,     /*!< invalid configuration */
    NSAPI_ERROR_NO_CONNECTION       = -3004,     /*!< not connected to a network */
    NSAPI_ERROR_NO_SOCKET           = -3005,     /*!< socket not available for use */
    NSAPI_ERROR_NO_ADDRESS          = -3006,     /*!< IP address is not known */
    NSAPI_ERROR_NO_MEMORY           = -3007,     /*!< memory resource not available */
    NSAPI_ERROR_NO_SSID             = -3008,     /*!< ssid not found */
    NSAPI_ERROR_DNS_FAILURE         = -3009,     /*!< DNS failed to complete successfully */
    NSAPI_ERROR_DHCP_FAILURE        = -3010,     /*!< DHCP failed to complete successfully */
    NSAPI_ERROR_AUTH_FAILURE        = -3011,     /*!< connection to access point failed */
    NSAPI_ERROR_DEVICE_ERROR        = -3012,     /*!< failure interfacing with the network processor */
    NSAPI_ERROR_IN_PROGRESS         = -3013,     /*!< operation (eg connect) in progress */
    NSAPI_ERROR_ALREADY             = -3014,     /*!< operation (eg connect) already in progress */
    NSAPI_ERROR_IS_CONNECTED        = -3015,     /*!< socket is already connected */
    NSAPI_ERROR_CONNECTION_LOST     = -3016,     /*!< connection lost */
    NSAPI_ERROR_CONNECTION_TIMEOUT  = -3017,     /*!< connection timed out */
    NSAPI_ERROR_ADDRESS_IN_USE      = -3018,     /*!< Address already in use */
    NSAPI_ERROR_TIMEOUT             = -3019,     /*!< operation timed out */
    NSAPI_ERROR_BUSY                = -3020,     /*!< device is busy and cannot accept new operation */
};

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

#endif /* __WIFI_H__ */
