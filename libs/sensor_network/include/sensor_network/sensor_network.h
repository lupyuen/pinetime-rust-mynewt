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

//  Generic Functions: Instead of referring to specific network interfaces like ESP8266 and nRF24L01,
//  we may now use call generic functions like init_server_post() and init_collector_post().
//  This also prevents complicated macros like
//  #if MYNEWT_VAL(ESP8266) && !MYNEWT_VAL(NRF24L01) ...

//  Network Drivers: The Sensor Network Library does not depend on BC95-G, ESP8266 and nRF24L01 drivers.
//  Instead, the drivers register themselves as Network Interfaces
//  to the Sensor Network Library.  So the drivers may be easily replaced.

//  Address Allocation: The Sensor Network Library also allocates Collector Node Address and Sensor Node Address
//  to the Collector and Sensor Nodes, based on the unique Hardware ID.  This allows the same
//  compiled firmware to run on multiple nodes, to simplify deployment.

//  Message Encoding: JSON encoding is automatically selected for CoAP Server messages. CBOR encoding is
//  automatically selected for Collector Node messages.

#ifndef __SENSOR_NETWORK_H__
#define __SENSOR_NETWORK_H__

#include "os/mynewt.h"
#include "sensor/sensor.h"

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

/////////////////////////////////////////////////////////
//  Network Interface Definitions

//  Network Interface Types: Server Interface (ESP8266 + CoAP) and Collector Interface (nRF24L01 + CBOR)

#define SERVER_INTERFACE_TYPE       0   //  Server Network Interface (BC95-G or ESP8266)
#define COLLECTOR_INTERFACE_TYPE    1   //  Collector Network Interface (nRF24L01)
#define MAX_INTERFACE_TYPES         2   //  Max network interfaces supported
#define MAX_ENDPOINT_SIZE           16  //  Max byte size of Server or Collector endpoint
#define SENSOR_NETWORK_SIZE         5   //  5 Sensor Nodes in the Sensor Network (Pipes 1 to 5 for nRF24L01)

//  Represents a Network Interface: BC95-G, ESP8266 or nRF24L01
struct sensor_network_interface {
    uint8_t iface_type;          //  Interface Type: Server or Collector
    const char *network_device;  //  Network device name.  Must be a static string.
    uint8_t server_endpoint_size;  //  Endpoint size
    int (*register_transport_func)(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);  //  Register transport function
    uint8_t transport_registered;  //  For internal use: Set to non-zero if transport has been registered.
};

struct sensor_value;

/////////////////////////////////////////////////////////
//  Start Network Interface for CoAP Transport as Background Task (Server and Collector)

//  For Standalone Node and Collector Node: In a background task, connect to NB-IoT or WiFi Access Point and register the driver as the network transport for CoAP Server.
//  Return 0 if successful.
int start_server_transport(void);

//  For Collector Node and Sensor Nodes: In a background task, register the nRF24L01 driver as the network transport for CoAP Collector.
//  Return 0 if successful.
int start_collector_transport(void);

//  Start a background task to register the Network Interface as the network transport for CoAP Server or CoAP Collector.
//  We use a background task because connecting to NB-IoT or WiFi Access Point may be slow.
//  Return 0 if successful.
int sensor_network_start_transport(uint8_t iface_type);

/////////////////////////////////////////////////////////
//  Register Network Interface for CoAP Transport (Server and Collector)

//  For Standalone Node and Collector Node: Connect to NB-IoT or WiFi Access Point and register the driver as the network transport for CoAP Server.
//  Return 0 if successful.
int register_server_transport(void);

//  For Collector Node and Sensor Nodes: Register the nRF24L01 driver as the network transport for CoAP Collector.
//  Return 0 if successful.
int register_collector_transport(void);

//  Register the Network Interface as the network transport for CoAP Server or CoAP Collector.
int sensor_network_register_transport(uint8_t iface_type);

/////////////////////////////////////////////////////////
//  Compose CoAP Messages

//  Start composing the CoAP Server message with the sensor data in the payload.  This will 
//  block other tasks from composing and posting CoAP messages (through a semaphore).
//  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
//  Return true if successful, false if network has not been registered.
bool init_server_post(const char *uri);

//  Start composing the CoAP Collector message with the sensor data in the payload.  This will 
//  block other tasks from composing and posting CoAP messages (through a semaphore).
//  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
//  Return true if successful, false if network has not been registered.
bool init_collector_post(void);

//  Start composing the CoAP Server or Collector message with the sensor data in the payload.  This will 
//  block other tasks from composing and posting CoAP messages (through a semaphore).
//  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
//  Return true if successful, false if network has not been registered.
bool sensor_network_init_post(uint8_t iface_type, const char *uri);

/////////////////////////////////////////////////////////
//  Post CoAP Messages

//  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
//  message to the background task, we release a semaphore that unblocks other requests
//  to compose and post CoAP messages.
bool do_server_post(void);

//  Post the CoAP Collector message to the CoAP Background Task for transmission.  After posting the
//  message to the background task, we release a semaphore that unblocks other requests
//  to compose and post CoAP messages.
bool do_collector_post(void);

//  Post the CoAP Server or Collector message to the CoAP Background Task for transmission.  After posting the
//  message to the background task, we release a semaphore that unblocks other requests
//  to compose and post CoAP messages.
bool sensor_network_do_post(uint8_t iface_type);

/////////////////////////////////////////////////////////
//  Query Collector and Sensor Nodes

//  Return true if this is the Collector Node.
//  This is the Collector Node if the Hardware ID matches the Collector Node Hardware ID.
bool is_collector_node(void);

//  Return true if this is a Sensor Node.
//  This is a Sensor Node if the Hardware ID matches one of the Sensor Node Hardware IDs.
bool is_sensor_node(void);

//  Return true if this is a Standalone Node, i.e. not a Collector or Sensor Node.
bool is_standalone_node(void);

//  Return true if this node should send to a Collector Node instead of CoAP Server.  Which means this must be a Sensor Node.
bool should_send_to_collector(struct sensor_value *val, const char *device_name);

/////////////////////////////////////////////////////////
//  Sensor Network Addresses

//  Return the Hardware ID, which is unique across all microcontrollers.
const uint8_t *get_hardware_id(void);

//  Get the randomly-generated Device ID that will be sent in every CoAP Server message.  Changes upon restart.
const char *get_device_id(void);

//  Return the Collector Node address for this Sensor Network.
unsigned long long get_collector_node_address(void);

//  Return the Sensor Node address for this node, if this is a Sensor Node.
unsigned long long get_sensor_node_address(void);

//  Return the list of Sensor Node addresses for this Sensor Network.
const unsigned long long *get_sensor_node_addresses(void);

//  Return the list of Sensor Node names for this Sensor Network.
const char **get_sensor_node_names(void);

/////////////////////////////////////////////////////////
//  Sensor Network Configuration

//  Allocate Sensor Node address for this node.
void sensor_network_init(void);

//  Register the Network Interface (e.g. BC95-G, ESP8266, nRF24L01) for the Sensor Network.
int sensor_network_register_interface(const struct sensor_network_interface *iface);

#ifdef __cplusplus
}
#endif

#endif /* __SENSOR_NETWORK_H__ */
