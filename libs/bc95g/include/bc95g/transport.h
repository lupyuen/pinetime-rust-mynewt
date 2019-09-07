/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
//  BC95G Network Transport for Apache Mynewt.  This provides the OIC (Open Interconnect Consortium)
//  interface for the BC95G Driver, so that we may compose and transmit CoAP requests using Mynewt's
//  OIC implementation.  More about Mynewt OIC: https://mynewt.apache.org/latest/os/modules/devmgmt/newtmgr.html
#ifndef __BC95G_TRANSPORT_H__
#define __BC95G_TRANSPORT_H__

#include <oic/port/oc_connectivity.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

struct bc95g;
struct oc_server_handle;

//  BC95G Endpoint
struct bc95g_endpoint {
    struct oc_ep_hdr ep;  //  OIC network endpoint.  Don't change, must be first field.  Will be initialised upon use.
    const char *host;     //  Destination host name.  Must point to static string that will not change.
    uint16_t port;        //  Destination port number.
};

//  BC95G Server Endpoint
struct bc95g_server {
    struct bc95g_endpoint endpoint;  //  BC95G network endpoint.  Don't change, must be first field.
    struct oc_server_handle *handle;   //  Points back to itself.  Set here for convenience.
};

//  Register the BC95G device as the transport for the specifed CoAP server.  
//  network_device is the BC95G device name e.g. "bc95g_0".  Return 0 if successful.
int bc95g_register_transport(const char *network_device, struct bc95g_server *server0, const char *host, uint16_t port);

//  Init the endpoint before use.  Returns 0.
int init_bc95g_endpoint(struct bc95g_endpoint *endpoint, const char *host, uint16_t port);  

//  Init the server endpoint before use.  Returns 0.
int init_bc95g_server(struct bc95g_server *server, const char *host, uint16_t port);        

#ifdef __cplusplus
}
#endif

#endif  //  __BC95G_TRANSPORT_H__
