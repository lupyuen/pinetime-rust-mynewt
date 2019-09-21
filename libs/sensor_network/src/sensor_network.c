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
#if MYNEWT_VAL(HMAC_PRNG)
#include <hmac_prng/hmac_prng.h>      //  Pseudorandom number generator for device ID
#endif  //  MYNEWT_VAL(HMAC_PRNG)
#include <sensor_coap/sensor_coap.h>  //  Sensor CoAP library
#include "sensor_network/sensor_network.h"

static const char *_net = "NET ";     //  Prefix for console messages
static const char *_node = " node ";  //  Common string

//  Identity macro, which expands the value of x if x is a macro:
//  _ID (abc) = abc
#define _ID(x) x

//  Encode a 12-byte Hardware ID: _HWID (0x01, 0x02, 0x03, ..., 0x0c) = { 0x01, 0x02, 0x03, ..., 0x0c }
#define _ID12(a,b,c,d,e,f,g,h,i,j,k,l) {a,b,c,d,e,f,g,h,i,j,k,l}
#define _HWID(x) _ID(_ID12 x)

/////////////////////////////////////////////////////////
//  Hardware IDs To Identify Collector Node and Sensor Nodes

#define HARDWARE_ID_LENGTH 12                  //  Hardware ID is 12 bytes for STM32
static const uint8_t COLLECTOR_NODE_HW_ID[HARDWARE_ID_LENGTH] = 
    _HWID(MYNEWT_VAL(COLLECTOR_NODE_HW_ID));  //  Hardware ID of Collector Node (ESP8266 + nRF24L01) e.g. { 0x57, 0xff, 0x6a, 0x06, 0x78, 0x78, 0x54, 0x50, 0x49, 0x29, 0x24, 0x67 }

static const uint8_t SENSOR_NODE_HW_IDS[SENSOR_NETWORK_SIZE][HARDWARE_ID_LENGTH] = { 
    _HWID(MYNEWT_VAL(SENSOR_NODE_HW_ID_1)),   //  Hardware ID of Sensor Node 1 (nRF24L01) e.g. { 0x38, 0xff, 0x6d, 0x06, 0x4e, 0x57, 0x34, 0x36, 0x25, 0x58, 0x08, 0x43 }
    _HWID(MYNEWT_VAL(SENSOR_NODE_HW_ID_2)),   //  Hardware ID of Sensor Node 2 (nRF24L01) e.g. { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x02 }
    _HWID(MYNEWT_VAL(SENSOR_NODE_HW_ID_3)),   //  Hardware ID of Sensor Node 3 (nRF24L01) e.g. { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x03 }
    _HWID(MYNEWT_VAL(SENSOR_NODE_HW_ID_4)),   //  Hardware ID of Sensor Node 4 (nRF24L01) e.g. { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x04 }
    _HWID(MYNEWT_VAL(SENSOR_NODE_HW_ID_5)),   //  Hardware ID of Sensor Node 5 (nRF24L01) e.g. { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x05 }
};

/////////////////////////////////////////////////////////
//  Collector Node + Sensor Nodes Configuration: Follows page 13 of https://www.sparkfun.com/datasheets/Components/nRF24L01_prelim_prod_spec_1_2.pdf

#define COLLECTOR_NODE_ADDRESS MYNEWT_VAL(COLLECTOR_NODE_ADDRESS)   //  Collector Node Address (Pipe 0)
#define SENSOR_NETWORK_ADDRESS MYNEWT_VAL(SENSOR_NETWORK_ADDRESS)   //  Sensor Nodes have addresses 0xB3B4B5B6??  (Pipes 1 to 5)

//  Map a Sensor Network Address + Node ID to Sensor Node Address e.g. ADDR(0xB3B4B5B6, 0xf1) = 0xB3B4B5B6f1
#define ADDR(network_addr, node_id) (node_id + (network_addr << 8))

//  Addresses of the 5 Sensor Nodes
static const unsigned long long sensor_node_addresses[SENSOR_NETWORK_SIZE] = {
    ADDR(SENSOR_NETWORK_ADDRESS, MYNEWT_VAL(SENSOR_NODE_OFFSET_1)),  //  Pipe 1 e.g. 0xB3B4B5B6f1
    ADDR(SENSOR_NETWORK_ADDRESS, MYNEWT_VAL(SENSOR_NODE_OFFSET_2)),  //  Pipe 2
    ADDR(SENSOR_NETWORK_ADDRESS, MYNEWT_VAL(SENSOR_NODE_OFFSET_3)),  //  Pipe 3
    ADDR(SENSOR_NETWORK_ADDRESS, MYNEWT_VAL(SENSOR_NODE_OFFSET_4)),  //  Pipe 4
    ADDR(SENSOR_NETWORK_ADDRESS, MYNEWT_VAL(SENSOR_NODE_OFFSET_5)),  //  Pipe 5
};

//  Assigned Sensor Network Address for this node, if this is a Sensor Node.
static unsigned long long sensor_node_address = 0;

#define NODE_NAME_LENGTH 11  //  Enough for "B3B4B5B6f1" and terminating null.
static char sensor_node_names_buf[SENSOR_NETWORK_SIZE * NODE_NAME_LENGTH];  //  Buffer for node names.

//  Names (text addresses e.g. B3B4B5B6f1) of the Sensor Nodes, exported to remote_sensor_create() for setting the device name.
static const char *sensor_node_names[SENSOR_NETWORK_SIZE] = {
    sensor_node_names_buf,
    sensor_node_names_buf + NODE_NAME_LENGTH,
    sensor_node_names_buf + 2 * NODE_NAME_LENGTH,
    sensor_node_names_buf + 3 * NODE_NAME_LENGTH,
    sensor_node_names_buf + 4 * NODE_NAME_LENGTH,
};

static uint8_t hw_id[HARDWARE_ID_LENGTH];   //  Hardware ID
static int hw_id_len = 0;                   //  Actual length of Hardware ID

//  Randomly-assigned Device ID that will be sent in every CoAP Server message.
#define DEVICE_ID_LENGTH      16                          //  16 random bytes in binary device ID
#define DEVICE_ID_TEXT_LENGTH (1 + DEVICE_ID_LENGTH * 2)  //  33 bytes in the text device ID (including terminating null)
static uint8_t device_id     [DEVICE_ID_LENGTH];          //  Binary device ID e.g. 0xab 0xcd 0xef ...
static char    device_id_text[DEVICE_ID_TEXT_LENGTH];     //  Text version of the binary device ID, 2 hex digits per byte
                                                          //  e.g. abcdef...

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
static int sensor_network_encoding[MAX_INTERFACE_TYPES] = {  //  Default encoding for each Network Interface
    APPLICATION_JSON,  //  Send to Server:    Default to JSON encoding for payload
    APPLICATION_CBOR,  //  Send to Collector: Default to CBOR encoding for payload
};
static const char *sensor_network_shortname[MAX_INTERFACE_TYPES] = {  //  Short name of each Network Interface
    "svr",  //  Send to Server
    "col",  //  Send to Collector
};

/////////////////////////////////////////////////////////
//  Start Network Interface for CoAP Transport as Background Task (Server and Collector)

static void start_transport_callback(struct os_event *ev);  //  Defined below

int start_server_transport(void) {
    //  For Standalone Node and Collector Node: In a background task, connect to NB-IoT or WiFi Access Point and register the driver as the network transport for CoAP Server.
    //  Return 0 if successful.
    uint8_t i = SERVER_INTERFACE_TYPE;
    int rc = sensor_network_start_transport(i);
    assert(rc == 0);
    return rc;
}

int start_collector_transport(void) {
    //  For Collector Node and Sensor Nodes: In a background task, register the nRF24L01 driver as the network transport for CoAP Collector.
    //  Return 0 if successful.
    uint8_t i = COLLECTOR_INTERFACE_TYPE;
    int rc = sensor_network_start_transport(i);
    assert(rc == 0);
    return rc;
}

extern int power_standby_wakeup();

int sensor_network_start_transport(uint8_t iface_type) {
    //  Start a callout to register the Network Interface as the network transport for CoAP Server or CoAP Collector.
    //  We use a callout because connecting to NB-IoT or WiFi Access Point may be slow.
    //  Return 0 if successful.
    assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    struct sensor_network_interface *iface = &sensor_network_interfaces[iface_type];
    if (iface->transport_registered) { return 0; }  //  Quit if transport already registered and endpoint has been created.

    if (!power_standby_wakeup()) {
        //  On power up: Define the callout and trigger it in 1 second.
        static struct os_callout callout;
        os_callout_init(&callout, os_eventq_dflt_get(), start_transport_callback, (void *)(uint32_t)iface_type);
        os_callout_reset(&callout, 1 * OS_TICKS_PER_SEC);  //  Trigger the callout in 1 second
        return 0;       
    } else {
        //  On standby wakeup: Register the network transport directly.
        int rc = sensor_network_register_transport(iface_type);  assert(rc == 0);
        return rc;
    }
}

static void start_transport_callback(struct os_event *ev) {
    //  For Collector Node and Standalone Node: We connect to NB-IoT network or WiFi access point. 
    //  Connecting to the NB-IoT network or WiFi access point may be slow so we do this in the background.
    //  Register the driver as the network transport for CoAP Server.  
    //  For Collector Node and Sensor Nodes: We register the nRF24L01 driver as the network transport for 
    //  CoAP Collector.
    uint8_t iface_type = (uint8_t)(uint32_t)ev->ev_arg;
    console_printf("NET start\n");
    int rc = 0;

    //  Register the network transport.
    rc = sensor_network_register_transport(iface_type);  assert(rc == 0);
}

/////////////////////////////////////////////////////////
//  Register Network Interface for CoAP Transport (Server and Collector)

int register_server_transport(void) {
    //  For Standalone Node and Collector Node: Connect to NB-IoT or WiFi Access Point and register the driver as the network transport for CoAP Server.
    //  Return 0 if successful.
    uint8_t i = SERVER_INTERFACE_TYPE;
    int rc = sensor_network_register_transport(i);
    assert(rc == 0);
    return rc;
}

int register_collector_transport(void) {
    //  For Collector Node and Sensor Nodes: Register the nRF24L01 driver as the network transport for CoAP Collector.
    //  Return 0 if successful.
    uint8_t i = COLLECTOR_INTERFACE_TYPE;
    int rc = sensor_network_register_transport(i);
    assert(rc == 0);
    return rc;
}

int sensor_network_register_transport(uint8_t iface_type) {
    //  Register the Network Interface as the network transport for CoAP Server or CoAP Collector.
    //  Return 0 if successful.
    assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    struct sensor_network_interface *iface = &sensor_network_interfaces[iface_type];
    if (iface->transport_registered) { return 0; }  //  Quit if transport already registered and endpoint has been created.

    void *endpoint = &sensor_network_endpoints[iface_type];
    //  If endpoint has not been created, register the transport for the interface and create the endpoint.
    assert(iface->network_device);  assert(iface->register_transport_func);
    const char *network_device = iface->network_device;
    console_printf("%s%s %s\n", _net, sensor_network_shortname[iface_type], network_device);

    //  TODO: Host and port are not needed for Collector.
    int rc = iface->register_transport_func(network_device, endpoint, COAP_HOST, MYNEWT_VAL(COAP_PORT), MAX_ENDPOINT_SIZE);
    assert(rc == 0);
    iface->transport_registered = 1;
    return rc;
}

/////////////////////////////////////////////////////////
//  Compose CoAP Messages

bool init_server_post(const char *uri) {
    //  Start composing the CoAP Server message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    //  Return true if successful, false if network has not been registered.
    uint8_t i = SERVER_INTERFACE_TYPE;
    bool status = sensor_network_init_post(i, uri);
    return status;
}

bool init_collector_post(void) {
    //  Start composing the CoAP Collector message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    //  Return true if successful, false if network has not been registered.
    uint8_t i = COLLECTOR_INTERFACE_TYPE;
    const char *uri = NULL;
    bool status = sensor_network_init_post(i, uri);
    return status;
}

//  Interface type and URI of the CoAP message being composed.
static uint8_t current_iface_type = 0xff;
static const char *current_uri = NULL;

bool sensor_network_init_post(uint8_t iface_type, const char *uri) {
    //  Start composing the CoAP Server or Collector message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    //  Return true if successful, false if network has not been registered.
    if (uri == NULL || uri[0] == 0) { uri = COAP_URI; }
    assert(uri);  assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    struct sensor_network_interface *iface = &sensor_network_interfaces[iface_type];
    if (!iface->transport_registered) {
        //  If transport has not been registered, wait for the transport to be registered.
        console_printf("NET network not ready\n");
        return false;
    }
    void *endpoint = &sensor_network_endpoints[iface_type];
    assert(iface->network_device);  assert(iface->register_transport_func);  assert(endpoint);
    current_iface_type = iface_type;
    current_uri = uri;
    bool status = init_sensor_post(endpoint);
    assert(status);
    return status;
}

bool sensor_network_prepare_post(int encoding) {
    //  Set the encoding format for the CoAP message: APPLICATION_JSON or APPLICATION_CBOR.  If set to 0, use the default encoding format.
    //  Return true if successful.
    uint8_t iface_type = current_iface_type;
    const char *uri = current_uri;
    assert(uri);  assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    void *endpoint = &sensor_network_endpoints[iface_type];
    assert(endpoint);

    //  Use the specified encoding. If not specified, select the default encoding for the interface type.
    int enc = (encoding > 0) ? encoding : sensor_network_encoding[iface_type];
    bool status = prepare_sensor_post(endpoint, uri, enc);
    assert(status);
    return status;
}

/////////////////////////////////////////////////////////
//  Post CoAP Messages

bool do_server_post(void) {    
    //  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    uint8_t i = SERVER_INTERFACE_TYPE;
    bool status = sensor_network_do_post(i);
    assert(status);
    return status;
}

bool do_collector_post(void) {    
    //  Post the CoAP Collector message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    uint8_t i = COLLECTOR_INTERFACE_TYPE;
    bool status = sensor_network_do_post(i);
    assert(status);
    return status;
}

bool sensor_network_do_post(uint8_t iface_type) {
    //  Post the CoAP Server or Collector message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    assert(iface_type >= 0 && iface_type < MAX_INTERFACE_TYPES);
    bool status = do_sensor_post();
    assert(status);
    return status;
}

/////////////////////////////////////////////////////////
//  Query Collector and Sensor Nodes

bool is_collector_node(void) {
    //  Return true if this is the Collector Node.
    //  This is the Collector Node if the Hardware ID matches the Collector Node Hardware ID.

    //  Fetch the hardware ID.  This is unique across all microcontrollers.
    const uint8_t *hardware_id = get_hardware_id();
    //  if the Hardware ID matches the Collector Node Hardware ID...
    if (memcmp(hardware_id, COLLECTOR_NODE_HW_ID, HARDWARE_ID_LENGTH) == 0) { return true; }
    return false; 
}

bool is_sensor_node(void) {
    //  Return true if this is a Sensor Node.
    //  This is a Sensor Node if the Hardware ID matches one of the Sensor Node Hardware IDs.
    if (sensor_node_address) { return true; }  //  sensor_node_address is set in sensor_network_init().
    return false;
}

bool is_standalone_node(void) {
    //  Return true if this is a Standalone Node, i.e. not a Collector or Sensor Node.
    if (!is_collector_node() && !is_sensor_node()) { return true; }
    return false;
}

bool should_send_to_collector(struct sensor_value *val, const char *device_name) {
    //  Return true if this node should send to a Collector Node instead of CoAP Server.  Which means this must be a Sensor Node.
    assert(val);
    if (is_sensor_node()) { return true; }
    return false;
}

/////////////////////////////////////////////////////////
//  Sensor Network Addresses

const uint8_t *get_hardware_id(void) {
    //  Return the Hardware ID, which is unique across all microcontrollers.
    if (hw_id_len == 0) {
        hw_id_len = hal_bsp_hw_id_len();     //  Fetch the length, i.e. 12
        assert((unsigned) hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.
        hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));  assert(hw_id_len > 0);  //  Get the hardware ID.
        console_printf("%shwid ", _net);  console_dump(hw_id, hw_id_len);  console_printf("\n");
    }
    return hw_id;
}

//  Device Type e.g. l476
static const char *DEVICE_TYPE = MYNEWT_VAL(DEVICE_TYPE);

const char *get_device_id(void) {
    //  Get the randomly-generated Device ID that will be sent in every CoAP Server message.  Changes upon restart.
    if (device_id_text[0]) { return device_id_text; }
#if MYNEWT_VAL(HMAC_PRNG)
    //  Create a random device ID based on HMAC pseudorandom number generator e.g. 0xab 0xcd 0xef ...
    int rc = hmac_prng_generate(device_id, DEVICE_ID_LENGTH);  assert(rc == 0);
#endif  //  MYNEWT_VAL(HMAC_PRNG)
    char *s = device_id_text; int i;
    //  Convert to text e.g. abcdef...
    for (i = 0; i < DEVICE_ID_LENGTH; i++) {
        sprintf(s, "%02x", device_id[i]);
        s += 2;
    }
    device_id_text[DEVICE_ID_TEXT_LENGTH - 1] = 0;
    //  Overwrite the start of the device ID by the device type followed by ",", e.g. "l476,010203".
    if (strlen(DEVICE_TYPE) > 0) {
        assert(strlen(DEVICE_TYPE) < DEVICE_ID_TEXT_LENGTH - 1);  //  DEVICE_TYPE too long
        strcpy(device_id_text, DEVICE_TYPE);
        device_id_text[strlen(DEVICE_TYPE)] = ',';
    }
    console_printf("%srandom device id %s\n", _net, device_id_text);
    return device_id_text;
}

//  Return the Collector Node address for this Sensor Network.
unsigned long long get_collector_node_address(void) { return COLLECTOR_NODE_ADDRESS; }

//  Return the Sensor Node address for this node, if this is a Sensor Node.
unsigned long long get_sensor_node_address(void) { return sensor_node_address; }

//  Return the list of Sensor Node addresses for this Sensor Network.
const unsigned long long *get_sensor_node_addresses(void) { return sensor_node_addresses; }

//  Return the list of Sensor Node names for this Sensor Network.
const char **get_sensor_node_names(void) { return sensor_node_names; }

/////////////////////////////////////////////////////////
//  Sensor Network Configuration

void sensor_network_init(void) {
    //  Allocate Sensor Node address for this node.

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
            console_printf("%ssensor%s#%d\n", _net, _node, i + 1);
            break;
        }
    }
    //  Display the type of node.
    if (is_collector_node()) { console_printf("%scollector%s\n", _net, _node); }
    else if (is_standalone_node()) { console_printf("%sstandalone%s\n", _net, _node); }
}

int sensor_network_register_interface(const struct sensor_network_interface *iface) {
    //  Register the Network Interface (e.g. BC95-G, ESP8266, nRF24L01) for the Sensor Network.
    assert(iface);
    uint8_t i = iface->iface_type;  assert(i >= 0 && i < MAX_INTERFACE_TYPES);
    assert(iface->network_device);  assert(iface->server_endpoint_size);  assert(iface->register_transport_func);
    assert(iface->server_endpoint_size <= MAX_ENDPOINT_SIZE);     //  Need to increase MAX_ENDPOINT_SIZE.
    assert(sensor_network_interfaces[i].network_device == NULL);  //  Interface already registered.
    memcpy(&sensor_network_interfaces[i], iface, sizeof(struct sensor_network_interface));  //  Copy the interface.
    sensor_network_interfaces[i].transport_registered = 0;        //  We defer the registration of the transport till first use.
    console_printf("%s%s %s\n", _net, sensor_network_shortname[i], sensor_network_interfaces[i].network_device);
    return 0;
}
