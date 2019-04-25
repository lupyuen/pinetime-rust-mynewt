//  nRF24L01 Network Transport for Apache Mynewt.  This provides the OIC (Open Interconnect Consortium)
//  interface for the nRF24L01 Driver, so that we may compose and transmit CoAP requests using Mynewt's
//  OIC implementation.  More about Mynewt OIC: https://mynewt.apache.org/latest/os/modules/devmgmt/newtmgr.html
#ifndef __NRF24L01_TRANSPORT_H__
#define __NRF24L01_TRANSPORT_H__

#include <oic/port/oc_connectivity.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

struct nrf24l01;
struct oc_server_handle;

//  nRF24L01 Endpoint
struct nrf24l01_endpoint {
    struct oc_ep_hdr ep;  //  OIC network endpoint.  Don't change, must be first field.  Will be initialised upon use.
    const char *host;     //  Destination host name.  Must point to static string that will not change.
    uint16_t port;        //  Destination port number.
};

//  nRF24L01 Server Endpoint
struct nrf24l01_server {
    struct nrf24l01_endpoint endpoint;  //  nrf24l01 network endpoint.  Don't change, must be first field.
    struct oc_server_handle *handle;   //  Points back to itself.  Set here for convenience.
};

//  Register the nRF24L01 device as the transport for the specifed CoAP server.  
//  network_device is the nRF24L01 device name e.g. "nrf24l01_0".  Return 0 if successful.
int nrf24l01_register_transport(const char *network_device, struct nrf24l01_server *server0);

//  Init the endpoint before use.  Returns 0.
int init_nrf24l01_endpoint(struct nrf24l01_endpoint *endpoint);  

//  Init the server endpoint before use.  Returns 0.
int init_nrf24l01_server(struct nrf24l01_server *server);        

#ifdef __cplusplus
}
#endif

#endif  //  __NRF24L01_TRANSPORT_H__
