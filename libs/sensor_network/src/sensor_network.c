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

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <bsp/bsp.h>
#include <hal/hal_bsp.h>
#include <sensor/sensor.h>            //  For SENSOR_VALUE_TYPE_INT32
#include <oic/messaging/coap/coap.h>  //  For APPLICATION_JSON
#include <console/console.h>
#include <hmac_prng/hmac_prng.h>      //  Pseudorandom number generator for device ID
#include <sensor_coap/sensor_coap.h>  //  Sensor CoAP library
#include "sensor_network/sensor_network.h"

/////////////////////////////////////////////////////////
//  Hardware IDs To Identify Collector Node and Sensor Nodes

#define HARDWARE_ID_LENGTH 12  //  Hardware ID is 12 bytes for STM32
static const uint8_t COLLECTOR_NODE_HW_ID[HARDWARE_ID_LENGTH] = { 0x57 };  //  TODO: Mac
static const uint8_t SENSOR_NODE_HW_IDS[SENSOR_NETWORK_SIZE][HARDWARE_ID_LENGTH] = { 
    { 0x38 },  //  TODO: Windows
    { 0x38 },
    { 0x38 },
    { 0x38 },
    { 0x38 },
};  //  TODO

//#define COLLECTOR_NODE_HWID 0x57  //  My Mac is Collector Node
//#define COLLECTOR_NODE_HWID 0x38  //  My Windows is Collector Node

/////////////////////////////////////////////////////////
//  Collector Node + Sensor Nodes Configuration: Follows page 13 of https://www.sparkfun.com/datasheets/Components/nRF24L01_prelim_prod_spec_1_2.pdf

#define COLLECTOR_NODE_ADDRESS 0x7878787878ull //  Collector Node Address (Pipe 0)
#define SENSOR_NETWORK_ADDRESS 0xB3B4B5B6ull   //  Sensor Nodes have addresses 0xB3B4B5B6??  (Pipes 1 to 5)
#define SENSOR_NETWORK_SIZE    5               //  5 Sensor Nodes in the Sensor Network  (Pipes 1 to 5)

//  Map a Sensor Network Address + Node ID to Sensor Node Address e.g. ADDR(0xB3B4B5B6, 0xf1) = 0xB3B4B5B6f1
#define ADDR(network_addr, node_id) (node_id + (network_addr << 8))

//  Addresses of the 5 Sensor Nodes
static const unsigned long long sensor_node_addresses[SENSOR_NETWORK_SIZE] = {
    ADDR(SENSOR_NETWORK_ADDRESS, 0xf1),  //  Pipe 1 e.g. 0xB3B4B5B6f1
    ADDR(SENSOR_NETWORK_ADDRESS, 0xcd),  //  Pipe 2
    ADDR(SENSOR_NETWORK_ADDRESS, 0xa3),  //  Pipe 3
    ADDR(SENSOR_NETWORK_ADDRESS, 0x0f),  //  Pipe 4
    ADDR(SENSOR_NETWORK_ADDRESS, 0x05),  //  Pipe 5
};

#define NODE_NAME_LENGTH 11  //  Enough for "B3B4B5B6f1" and terminating null.
static char sensor_node_names_buf[SENSOR_NETWORK_SIZE * NODE_NAME_LENGTH];  //  Buffer for node names.

//  Names (text addresses e.g. B3B4B5B6f1) of the Sensor Nodes, exported to remote_sensor_create() for setting the device name.
const char *sensor_node_names[SENSOR_NETWORK_SIZE] = {
    sensor_node_names_buf,
    sensor_node_names_buf + NODE_NAME_LENGTH,
    sensor_node_names_buf + 2 * NODE_NAME_LENGTH,
    sensor_node_names_buf + 3 * NODE_NAME_LENGTH,
    sensor_node_names_buf + 4 * NODE_NAME_LENGTH,
};

/////////////////////////////////////////////////////////
//  CoAP Connection Settings e.g. coap://coap.thethings.io/v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8
//  COAP_HOST, COAP_PORT, COAP_URI are defined in targets/bluepill_my_sensor/syscfg.yml
static const char COAP_HOST[] = MYNEWT_VAL(COAP_HOST);  //  CoAP hostname e.g. coap.thethings.io
static const char COAP_URI[]  = MYNEWT_VAL(COAP_URI);   //  CoAP URI e.g. v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8

/////////////////////////////////////////////////////////
//  Sensor Networks: Interfaces, Endpoints and Encoding

struct sensor_network_endpoint {  //  Represents one Server Endpoint e.g. ESP8266, nRF24L01
    uint8_t endpoint[MAX_ENDPOINT_SIZE];
};

static struct sensor_network_interface sensor_network_interfaces[MAX_INTERFACE_TYPES];  //  All Network Interfaces
static struct sensor_network_endpoint sensor_network_endpoints[MAX_INTERFACE_TYPES];    //  All Server Endpoints
static int sensor_network_encoding[MAX_INTERFACE_TYPES] = {                      //  Encoding for each Network Interface
    APPLICATION_JSON,  //  Send to Server: JSON encoding for payload
    APPLICATION_CBOR,  //  Send to Collector: CBOR encoding for payload
};

int sensor_network_register_interface(const struct sensor_network_interface *iface) {
    //  Register the Network Interface (e.g. ESP8266, nRF24L01) for the Sensor Network.
    assert(iface);
    uint8_t i = iface->iface_type;  assert(i >= 0 && i < MAX_INTERFACE_TYPES);
    assert(iface->network_device);  assert(iface->server_endpoint_size);  assert(iface->register_transport_func);
    assert(iface->server_endpoint_size <= MAX_ENDPOINT_SIZE);     //  Need to increase MAX_ENDPOINT_SIZE.
    assert(sensor_network_interfaces[i].network_device == NULL);  //  Interface already registered.
    memcpy(&sensor_network_interfaces[i], iface, sizeof(struct sensor_network_interface));  //  Copy the interface.
    sensor_network_interfaces[i].transport_registered = 0;        //  We defer the registration of the transport till first use.
    console_printf("SN %s %s\n", (i == 0) ? "svr" : "col", sensor_network_interfaces[i].network_device);
    return 0;
}

bool sensor_network_init_post(uint8_t iface_type, const char *uri) {
    if (uri == NULL) { uri = COAP_URI; }
    assert(uri);  assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    struct sensor_network_interface *iface = &sensor_network_interfaces[iface_type];
    assert(iface->network_device);  assert(iface->register_transport_func);
    void *endpoint = &sensor_network_endpoints[iface_type];
    int encoding = sensor_network_encoding[iface_type];
    if (!iface->transport_registered) {
        //  If transport has not been registered, register the transport for the interface and create the endpoint.
        int rc = sensor_network_register_transport(iface_type);
        assert(rc == 0);
    }
    //  Start composing the CoAP message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    bool status = init_sensor_post(endpoint, uri, encoding);
    assert(status);
    return status;
}

int register_server_transport(void) {
    uint8_t i = SERVER_INTERFACE_TYPE;
    int rc = sensor_network_register_transport(i);
    assert(rc == 0);
    return rc;
}

int register_collector_transport(void) {
    uint8_t i = COLLECTOR_INTERFACE_TYPE;
    int rc = sensor_network_register_transport(i);
    assert(rc == 0);
    return rc;
}

int sensor_network_register_transport(uint8_t iface_type) {
    assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    struct sensor_network_interface *iface = &sensor_network_interfaces[iface_type];
    if (iface->transport_registered) { return 0; }  //  Quit if transport already registered and endpoint has been created.

    void *endpoint = &sensor_network_endpoints[iface_type];
    //  If endpoint has not been created, register the transport for the interface and create the endpoint.
    assert(iface->network_device);  assert(iface->register_transport_func);
    const char *network_device = iface->network_device;
    //  TODO: Host and port are not needed for Collector.
    int rc = iface->register_transport_func(network_device, endpoint, COAP_HOST, MYNEWT_VAL(COAP_PORT), MAX_ENDPOINT_SIZE);
    assert(rc == 0);
    iface->transport_registered = 1;
    return rc;
}

bool sensor_network_do_post(uint8_t iface_type) {
    assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    bool status = do_sensor_post();
    assert(status);
    return status;
}

bool init_server_post(const char *uri) {
    uint8_t i = SERVER_INTERFACE_TYPE;
    bool status = sensor_network_init_post(i, uri);
    assert(status);
    return status;
}

bool init_collector_post(void) {
    uint8_t i = COLLECTOR_INTERFACE_TYPE;
    const char *uri = NULL;
    bool status = sensor_network_init_post(i, uri);
    assert(status);
    return status;
}

bool do_server_post(void) {    
    uint8_t i = SERVER_INTERFACE_TYPE;
    bool status = sensor_network_do_post(i);
    assert(status);
    return status;
}

bool do_collector_post(void) {    
    uint8_t i = COLLECTOR_INTERFACE_TYPE;
    bool status = sensor_network_do_post(i);
    assert(status);
    return status;
}

static uint8_t hw_id[HARDWARE_ID_LENGTH];
static int hw_id_len = 0;  //  Actual length of hardware ID
static unsigned long long sensor_node_address = 0;

const uint8_t *get_hardware_id(void) {
    //  Return the Hardware ID, which is unique across all microcontrollers.
    if (hw_id_len == 0) {
        hw_id_len = hal_bsp_hw_id_len();     //  Fetch the length, i.e. 12
        assert((unsigned) hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.
        hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));  assert(hw_id_len > 0);  //  Get the hardware ID.
    }
    return hw_id;
}

bool is_collector_node(void) {
    //  Return true if this is the Collector Node.
    //  This is the Collector Node if the Hardware ID matches the Collector Node Hardware ID.
    //  Fetch the hardware ID.  This is unique across all microcontrollers.
    const uint8_t *hardware_id = get_hardware_id();
    assert(false);  ////  TODO
    if (memcmp(hardware_id, COLLECTOR_NODE_HW_ID, HARDWARE_ID_LENGTH) == 0) {
        console_printf("*** collector node\n");
        return true; 
    }
    return false; 
}

bool is_sensor_node(void) {
    //  Return true if this is a Sensor Node.
    //  This is the Collector Node if the Hardware ID matches the Sensor Node Hardware ID.
    const uint8_t *hardware_id = get_hardware_id();
    assert(false);  ////  TODO
    int i;
    for (i = 0; i < SENSOR_NETWORK_SIZE; i++) {
        if (memcmp(hardware_id, SENSOR_NODE_HW_IDS[i], HARDWARE_ID_LENGTH) == 0) {
            console_printf("*** sensor node %d\n", i);
            return true; 
        }
    }
    return false;
}

bool is_standalone_node(void) {
    //  Return true if this is a Standalone Node, i.e. not a Collector or Sensor Node.
    if (!is_collector_node() && !is_sensor_node()) { 
        console_printf("*** standalone node\n");
        return true; 
    }
    return false;
}

bool should_send_to_collector(struct sensor_value *val) {
    //  Return true if this node should send to a Collector Node.  Which means this must be a Sensor Node.
    assert(val);
    if (is_sensor_node()) { return true; }
    return false;
}

//  Randomly assigned device ID that will be sent in every CoAP request.
#define DEVICE_ID_LENGTH      16                          //  16 random bytes in binary device ID
#define DEVICE_ID_TEXT_LENGTH (1 + DEVICE_ID_LENGTH * 2)  //  33 bytes in the text device ID (including terminating null)
static uint8_t device_id     [DEVICE_ID_LENGTH];          //  Binary device ID e.g. 0xab 0xcd 0xef ...
static char    device_id_text[DEVICE_ID_TEXT_LENGTH];     //  Text version of the binary device ID, 2 hex digits per byte
                                                          //  e.g. abcdef...

void sensor_network_init(void) {
    //  Set the Sensor Node names for remote_sensor_create().
    for (int i = 0; i < SENSOR_NETWORK_SIZE; i++) {
        int len = sprintf((char *) sensor_node_names[i], "%010llx", sensor_node_addresses[i]);
        assert(len + 1 <= NODE_NAME_LENGTH);
    }
    //  Get Sensor Node address if applicable.
    const uint8_t *hardware_id = get_hardware_id();
    int i;
    for (i = 0; i < SENSOR_NETWORK_SIZE; i++) {
        if (memcmp(hardware_id, SENSOR_NODE_HW_IDS[i], HARDWARE_ID_LENGTH) == 0) {
            sensor_node_address = sensor_node_addresses[i];
            console_printf("*** sensor node %d\n", i);
            break;
        }
    }
}

const char *get_device_id(void) {
    if (device_id_text[0]) { return device_id_text; }
#if MYNEWT_VAL(ESP8266)  //  If ESP8266 WiFi is enabled...
    //  Create a random device ID based on HMAC pseudorandom number generator e.g. 0xab 0xcd 0xef ...
    int rc = hmac_prng_generate(device_id, DEVICE_ID_LENGTH);  assert(rc == 0);
    char *s = device_id_text; int i;
    //  Convert to text e.g. abcdef...
    for (i = 0; i < DEVICE_ID_LENGTH; i++) {
        sprintf(s, "%02x", device_id[i]);
        s += 2;
    }
    device_id_text[DEVICE_ID_TEXT_LENGTH - 1] = 0;
    console_printf("NET random device id %s\n", device_id_text);
#else  //  If ESP8266 WiFi is NOT enabled...
    device_id_text[0] = 0;  //  Don't need device ID since we are transmitting locally.
    device_id[0] = 0;
#endif  //  MYNEWT_VAL(ESP8266)
    return device_id_text;
}
