//  ESP8266 Network Transport for Apache Mynewt.  This provides the OIC (Open Interconnect Consortium)
//  interface for the ESP8266 Driver, so that we may compose and transmit CoAP requests using Mynewt's
//  OIC implementation.  More about Mynewt OIC: https://mynewt.apache.org/latest/os/modules/devmgmt/newtmgr.html
#ifndef __ESP8266_TRANSPORT_H__
#define __ESP8266_TRANSPORT_H__

#include <oic/port/oc_connectivity.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

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

int esp8266_register_transport(struct sensor_itf *itf, struct esp8266_server *server);  //  Register the ESP8266 driver (itf) as the transport for the specifed CoAP server.
int init_esp8266_endpoint(struct esp8266_endpoint *endpoint);  //  Init the endpoint before use.
int init_esp8266_server(struct esp8266_server *server);        //  Init the server endpoint before use.

#ifdef __cplusplus
}
#endif

#endif  //  __ESP8266_TRANSPORT_H__
