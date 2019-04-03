//  TCP/IP Network Definitions
#ifndef __ESP8266_NETWORK_H__
#define __ESP8266_NETWORK_H__

#ifdef __cplusplus
extern "C" {
#endif

/** Enum of socket protocols
 *
 *  The socket protocol specifies a particular protocol to
 *  be used with a newly created socket.
 *
 *  @enum nsapi_protocol
 */
typedef enum nsapi_protocol {
    NSAPI_TCP, /*!< Socket is of TCP type */
    NSAPI_UDP, /*!< Socket is of UDP type */
} nsapi_protocol_t;

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_NETWORK_H__ */
