//  Send sensor data to a CoAP Server or a Collector Node.  The CoAP payload will be encoded as JSON
//  for CoAP Server and CBOR for Collector Node.  The sensor data will be transmitted to 
//  CoAP Server over WiFi via the ESP8266 transceiver, and to Collector Node via nRF24L01 transceiver.

//  This enables transmission of Sensor Data to a local Sensor Network (via nRF24L01)
//  and to the internet (via ESP8266).  For sending to Collector Node we use raw temperature (integer) 
//  instead of computed temperature (floating-point) to make the encoding simpler and faster.

//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP Server or Collector Node...

#include <console/console.h>
#include <sensor_network/sensor_network.h>  //  For Sensor Network library
#include <sensor_coap/sensor_coap.h>        //  For Sensor CoAP library
#include "geolocate.h"                      //  For geolocate()
#include "send_coap.h"

static int send_sensor_data_to_server(struct sensor_value *val);
static int send_sensor_data_to_collector(struct sensor_value *val);

///////////////////////////////////////////////////////////////////////////////
//  Network Task

//  Storage for Network Task
#define NETWORK_TASK_STACK_SIZE OS_STACK_ALIGN(256)  //  Size of the stack (in 4-byte units)
static uint8_t network_task_stack[sizeof(os_stack_t) * NETWORK_TASK_STACK_SIZE];  //  Stack space
static struct os_task network_task;    //  Mynewt task object will be saved here
static bool network_is_ready = false;  //  Set to true when network tasks have been completed

static void network_task_func(void *arg);  //  Defined below

int start_network_task(void) {
    //  Start the Network Task in the background.  The Network Task prepares the ESP8266 transceiver for
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
    //  Return 0 if successful.

    int rc = os_task_init(  //  Create a new task and start it...
        &network_task,      //  Task object will be saved here.
        "network",          //  Name of task.
        network_task_func,  //  Function to execute when task starts.
        NULL,               //  Argument to be passed to above function.
        10,  //  Task priority: highest is 0, lowest is 255.  Main task is 127.
        OS_WAIT_FOREVER,    //  Don't do sanity / watchdog checking.
        (os_stack_t *) network_task_stack,  //  Stack space for the task.
        NETWORK_TASK_STACK_SIZE);           //  Size of the stack (in 4-byte units).
    assert(rc == 0);
    return rc;
}

static void network_task_func(void *arg) {
    //  Network Task runs this function in the background to prepare the ESP8266 transceiver for
    //  sending CoAP messages.  For Standalone Node and Collector Node, we connect the ESP8266 to 
    //  the WiFi access point and register the ESP8266 driver as the network transport for CoAP Server.  
    //  For Collector Node and Sensor Nodes, we register the nRF24L01 driver as the network transport for 
    //  CoAP Collector.  Also perform WiFi Geolocation if it is enabled.
    console_printf("NET start\n");  assert(!network_is_ready);
    int rc = 0;

    //  For Standalone Node and Collector Node: Connect ESP8266 to WiFi Access Point and register the ESP8266 driver as the network transport for CoAP Server.
    if (is_standalone_node() || is_collector_node()) {
        rc = register_server_transport();  assert(rc == 0);
    }

    //  For Collector Node and Sensor Nodes: Register the nRF24L01 driver as the network transport for CoAP Collector.
    if (is_collector_node() || is_sensor_node()) {
        rc = register_collector_transport();  assert(rc == 0);
    }

#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...
    //  Geolocate the device by sending WiFi Access Point info.  Returns number of access points sent.
    const char *device_id = get_device_id();  assert(device_id);
    rc = geolocate(SERVER_NETWORK_INTERFACE, NULL, device_id);  assert(rc >= 0);
#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)

    //  Network Task has successfully started the ESP8266 or nRF24L01 transceiver. The Sensor Listener will still continue to
    //  run in the background and send sensor data to the server.
    network_is_ready = true;  //  Indicate that network is ready.

    while (true) {  //  Loop forever...        
        console_printf("NET free mbuf %d\n", os_msys_num_free());  //  Display number of free mbufs, to catch CoAP memory leaks.
        os_time_delay(10 * OS_TICKS_PER_SEC);                      //  Wait 10 seconds before repeating.
    }
    assert(false);  //  Never comes here.  If this task function terminates, the program will crash.
}

int send_sensor_data(struct sensor_value *val) {
    //  Compose a CoAP message with sensor value in val and send to the specified CoAP server
    //  and URI or Collector Node.  The message will be enqueued for transmission by the CoAP / OIC 
    //  Background Task so this function will return without waiting for the message 
    //  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.

    if (should_send_to_collector(val)) { return send_sensor_data_to_collector(val); }
    return send_sensor_data_to_server(val);
}

///////////////////////////////////////////////////////////////////////////////
//  Send Sensor Data for ESP8266

#if MYNEWT_VAL(ESP8266)  //  If ESP8266 WiFi is enabled...

static int send_sensor_data_to_server(struct sensor_value *val) {
    //  Compose a CoAP JSON message with the Sensor Key (field name) and Value in val 
    //  and send to the CoAP server and URI.  The Sensor Value may be integer or float.
    //  For temperature, the Sensor Key is either "t" for raw temperature (integer, from 0 to 4095) 
    //  or "tmp" for computed temperature (float).
    //  The message will be enqueued for transmission by the CoAP / OIC 
    //  Background Task so this function will return without waiting for the message 
    //  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.

    //  For the CoAP server hosted at thethings.io, the CoAP payload should be encoded in JSON like this:
    //  {"values":[
    //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    //    {"key":"tmp",    "value":28.7},
    //    {"key":"...",    "value":... },
    //    ... ]}
    assert(val);
    if (!network_is_ready) { return SYS_EAGAIN; }  //  If network is not ready, tell caller (Sensor Listener) to try later.
    const char *device_id = get_device_id();  assert(device_id);

    //  Start composing the CoAP Server message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    int rc = init_server_post(NULL);  assert(rc != 0);

    //  Compose the CoAP Payload in JSON using the CP macros.  Also works for CBOR.
    CP_ROOT({                     //  Create the payload root
        CP_ARRAY(root, values, {  //  Create "values" as an array of items under the root
            //  Append to the "values" array:
            //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
            CP_ITEM_STR(values, "device", device_id);

#if MYNEWT_VAL(RAW_TEMP)  //  If we are using raw temperature (integer) instead of computed temperature (float)...
            //  Append to the "values" array the Sensor Key and Sensor Value, depending on the value type:
            //    {"key":"t",   "value":2870} for raw temperature (integer)
            CP_ITEM_INT_VAL(values, val);
#else       //    {"key":"tmp", "value":28.7} for computed temperature (float)
            CP_ITEM_FLOAT_VAL(values, val);
#endif  //  MYNEWT_VAL(RAW_TEMP)

            //  If there are more sensor values, add them here with
            //  CP_ITEM_VAL, CP_ITEM_INT, CP_ITEM_UINT, CP_ITEM_FLOAT or CP_ITEM_STR
            //  Check geolocate() for a more complex payload: apps/my_sensor_app/src/geolocate.c

        });                       //  End CP_ARRAY: Close the "values" array
    });                           //  End CP_ROOT:  Close the payload root

    //  Post the CoAP Server message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    rc = do_server_post();  assert(rc != 0);

    console_printf("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n", device_id);
    //  console_printf("NET send data: tmp "); console_printfloat(tmp); console_printf("\n");  ////

    //  The CoAP Background Task will call oc_tx_ucast() in the ESP8266 driver to 
    //  transmit the message: libs/esp8266/src/transport.cpp
    return 0;
}

#endif  //  MYNEWT_VAL(ESP8266)

///////////////////////////////////////////////////////////////////////////////
//  Send Sensor Data for nRF24L01

#if MYNEWT_VAL(NRF24L01)  //  If nRF24L01 Wireless Network is enabled...

static int send_sensor_data_to_collector(struct sensor_value *val) {
    //  Compose a CoAP CBOR message with the Sensor Key (field name) and Value in val and 
    //  transmit to the Collector Node.  The Sensor Value should be integer not float since
    //  we transmit integers only to the Collector Node.
    //  For temperature, the Sensor Key is "t" for raw temperature (integer, from 0 to 4095).
    //  The message will be enqueued for transmission by the CoAP / OIC 
    //  Background Task so this function will return without waiting for the message 
    //  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
    //  The CoAP payload needs to be very compact (under 32 bytes) so it will be encoded in CBOR like this:
    //    { t: 2870 }
    assert(val);
    if (!network_is_ready) { return SYS_EAGAIN; }  //  If network is not ready, tell caller (Sensor Listener) to try later.

    //  Start composing the CoAP Collector message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    int rc = init_collector_post();  assert(rc != 0);

    //  Compose the CoAP Payload in CBOR using the CBOR macros.
    CP_ROOT({  //  Create the payload root
        //  Set the Sensor Key and integer Sensor Value, e.g. { t: 2870 }
        CP_SET_INT_VAL(root, val);
    });  //  End CP_ROOT:  Close the payload root

    //  Post the CoAP Collector message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    rc = do_collector_post();  assert(rc != 0);

    console_printf("NRF send to collector: rawtmp %d\n", val->int_val);  ////

    //  The CoAP Background Task will call oc_tx_ucast() in the nRF24L01 driver to 
    //  transmit the message: libs/nrf24l01/src/transport.cpp
    return 0;
}

#endif  //  MYNEWT_VAL(NRF24L01)

///////////////////////////////////////////////////////////////////////////////
//  Other Functions

int __wrap_coap_receive(/* struct os_mbuf **mp */) {
    //  We override the default coap_receive() with an empty function so that we will 
    //  NOT link in any modules for receiving and parsing CoAP requests, to save ROM space.
    //  We only need to transmit CoAP requests.  The overriding is done via the Linker Flag
    //  "-Wl,-wrap,coap_receive" in apps/my_sensor_app/pkg.yml
    console_printf("coap_receive NOT IMPLEMENTED\n");
    return -1;
}

#endif  //  MYNEWT_VAL(SENSOR_COAP)
