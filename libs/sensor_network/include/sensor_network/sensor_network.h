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

//  The Sensor Network Library simplifies the coding of Sensor Networks.
//  Instead of referring to specific network interfaces like ESP8266 and nRF24L01,
//  we may now use call generic functions like init_server_post() and init_collector_post().
//  This also prevents complicated macros like
//  #if MYNEWT_VAL(ESP8266) && !MYNEWT_VAL(NRF24L01) ...

//  The Sensor Network Library does not depend on ESP8266 and nRF24L01 drivers.
//  Instead, the ESP8266 and nRF24L01 drivers register themselves as Network Interfaces
//  to the Sensor Network Library.  So the drivers may be easily replaced.

//  The Sensor Network Library also allocates Collector Node Address and Sensor Node Address
//  to the Collector and Sensor Nodes, based on the unique Hardware ID.  This allows the same
//  compiled firmware to run on multiple nodes, to simplify deployment.

#ifndef __SENSOR_NETWORK_H__
#define __SENSOR_NETWORK_H__

#include "os/mynewt.h"
#include "sensor/sensor.h"

#ifdef __cplusplus
extern "C" {
#endif

/////////////////////////////////////////////////////////
//  Network Interface Types: Server Interface (ESP8266 + CoAP) and Collector Interface (nRF24L01 + CBOR)

#define SERVER_INTERFACE_TYPE       0
#define COLLECTOR_INTERFACE_TYPE    1
#define MAX_INTERFACE_TYPES         2
#define MAX_ENDPOINT_SIZE           16

struct sensor_network_interface {
    uint8_t iface_type;          //  Interface Type: Server or Collector
    const char *network_device;  //  Network device name.  Must be a static string.
    uint8_t server_endpoint_size;       //  Endpoint size
    int (*register_transport_func)(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);  //  Register transport function
    uint8_t transport_registered;    //  For internal use: Set to non-zero if transport has been registered.
};

struct sensor_value;

int register_server_transport(void);
int register_collector_transport(void);
int sensor_network_register_transport(uint8_t iface_type);

bool init_server_post(const char *uri);
bool init_collector_post(void);
bool do_server_post(void);
bool do_collector_post(void);
bool sensor_network_init_post(uint8_t iface_type, const char *uri);
bool sensor_network_do_post(uint8_t iface_type);

bool is_collector_node(void);
bool is_sensor_node(void);
bool is_standalone_node(void);
bool should_send_to_collector(struct sensor_value *val);
const char *get_device_id(void);

void sensor_network_init(void);
int sensor_network_register_interface(const struct sensor_network_interface *iface);

#ifdef __cplusplus
}
#endif

#endif /* __SENSOR_NETWORK_H__ */
