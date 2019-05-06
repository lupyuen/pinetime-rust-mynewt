//  Send sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
//  The sensor data will be transmitted over WiFi via the ESP8266 transceiver.
//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.

//  We also support Remote Sensors. A Sensor Node will transmit sensor data to a Collector Node over
//  nRF24L01.  Due to limited space, we encode the CoAP payload as CBOR.  Also we use raw temperature
//  (integer) instead of computed temperature (floating-point) to make the encoding simpler and faster.

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server...

#include <sensor/sensor.h>            //  For SENSOR_VALUE_TYPE_INT32
#include <console/console.h>
#include <sensor_coap/sensor_coap.h>  //  Sensor CoAP library
#include "geolocate.h"                //  For geolocate()
#include "send_coap.h"

#if MYNEWT_VAL(ESP8266)          //  If ESP8266 WiFi is enabled...
#include <esp8266/esp8266.h>     //  ESP8266 driver functions
#include <esp8266/transport.h>   //  ESP8266 transport for CoAP
#include <hmac_prng/hmac_prng.h> //  Pseudorandom number generator for device ID
static int send_sensor_data_to_server(struct sensor_value *val);
#endif  //  MYNEWT_VAL(ESP8266)

#if MYNEWT_VAL(NRF24L01)         //  If nRF24L01 Wireless Network is enabled...
#include <nrf24l01/nrf24l01.h>   //  nRF24L01 driver functions
#include <nrf24l01/transport.h>  //  nRF24L01 transport for CoAP
static int send_sensor_data_to_collector(struct sensor_value *val);
#endif  //  MYNEWT_VAL(NRF24L01)

//  CoAP Connection Settings e.g. coap://coap.thethings.io/v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8
//  COAP_HOST, COAP_PORT, COAP_URI are defined in targets/bluepill_my_sensor/syscfg.yml
static const char COAP_HOST[] = MYNEWT_VAL(COAP_HOST);  //  CoAP hostname e.g. coap.thethings.io
static const char COAP_URI[]  = MYNEWT_VAL(COAP_URI);   //  CoAP URI e.g. v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8

#if MYNEWT_VAL(ESP8266)  //  If ESP8266 WiFi is enabled...
//  ESP8266 WiFi Connection Settings, defined in targets/bluepill_my_sensor/syscfg.yml
static const char WIFI_SSID[]     = MYNEWT_VAL(WIFI_SSID);      //  Connect to the WiFi access point with this SSID e.g. my_ssid
static const char WIFI_PASSWORD[] = MYNEWT_VAL(WIFI_PASSWORD);  //  Password for WiFi access point e.g. my_password
#endif  //  MYNEWT_VAL(ESP8266)

//  CoAP Server and Collector Configuration

#if MYNEWT_VAL(ESP8266)         //  If ESP8266 WiFi is enabled...
static struct esp8266_server coap_server = {
    .endpoint = {                       //  CoAP Server that will receive sensor data from this Collector Node or Standalone Node
        .host = COAP_HOST,              //  CoAP hostname e.g. coap.thethings.io
        .port = MYNEWT_VAL(COAP_PORT),  //  CoAP port, usually UDP port 5683
    }
};
#endif  //  MYNEWT_VAL(ESP8266)

#if MYNEWT_VAL(NRF24L01)        //  If nRF24L01 Wireless Network is enabled...
static struct nrf24l01_server coap_collector = {
    .endpoint = {                       //  CoAP Collector Node that will receive sensor data from the Sensor Node
        .host = COAP_HOST,              //  TODO Remove: CoAP hostname e.g. coap.thethings.io
        .port = MYNEWT_VAL(COAP_PORT),  //  TODO Remove: CoAP port, usually UDP port 5683
    }
};
#endif  //  MYNEWT_VAL(NRF24L01)

//  Randomly assigned device ID that will be sent in every CoAP request.
#define DEVICE_ID_LENGTH      16                          //  16 random bytes in binary device ID
#define DEVICE_ID_TEXT_LENGTH (1 + DEVICE_ID_LENGTH * 2)  //  33 bytes in the text device ID (including terminating null)
static uint8_t device_id     [DEVICE_ID_LENGTH];          //  Binary device ID e.g. 0xab 0xcd 0xef ...
static char    device_id_text[DEVICE_ID_TEXT_LENGTH];     //  Text version of the binary device ID, 2 hex digits per byte
                                                          //  e.g. abcdef...

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
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
    console_printf("NET start\n");  assert(!network_is_ready);
    int rc = 0;

#if MYNEWT_VAL(ESP8266)  //  If ESP8266 WiFi is enabled...
    //  Create a random device ID based on HMAC pseudorandom number generator e.g. 0xab 0xcd 0xef ...
    rc = hmac_prng_generate(device_id, DEVICE_ID_LENGTH);  assert(rc == 0);
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

#if MYNEWT_VAL(ESP8266)  //  If ESP8266 WiFi is enabled...
    {   //  Lock the ESP8266 or nRF24L01 driver for exclusive use.
        //  Find the ESP8266 or nRF24L01 device by name e.g. "esp8266_0", "nrf24l01_0"
        struct os_dev *dev0 = os_dev_open(SERVER_NETWORK_INTERFACE, OS_TIMEOUT_NEVER, NULL);  //  SERVER_NETWORK_INTERFACE is "esp8266_0" or "nrf24l01_0"
        assert(dev0 != NULL);

        //  Connect to WiFi access point.  This may take a while to complete (or fail), thus we
        //  need to run this in the Network Task in background.  The Main Task will run the Event Loop
        //  to pass ESP8266 events to this function.
        struct esp8266 *dev = (struct esp8266 *) dev0;
        rc = esp8266_connect(dev, WIFI_SSID, WIFI_PASSWORD);  
        assert(rc == 0);

        //  Close the ESP8266 or nRF24L01 device when we are done.
        os_dev_close(dev0);
    }  //  Unlock the ESP8266 or nRF24L01 driver for exclusive use.
#endif  //  MYNEWT_VAL(ESP8266)

#if MYNEWT_VAL(ESP8266)  //  If ESP8266 WiFi is enabled...
    //  Register the ESP8266 driver as the network transport for CoAP Server.
    rc = esp8266_register_transport(SERVER_NETWORK_INTERFACE, &coap_server);  
    assert(rc == 0);
#endif  //  MYNEWT_VAL(ESP8266)

#if MYNEWT_VAL(NRF24L01) //  If nRF24L01 Wireless Network is enabled...
    //  Register the nRF24L01 driver as the network transport for CoAP Collector.
    rc = nrf24l01_register_transport(SENSOR_NETWORK_INTERFACE, &coap_collector);  
    assert(rc == 0);
#endif  //  MYNEWT_VAL(NRF24L01)

#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...
    //  Geolocate the device by sending WiFi Access Point info.  Returns number of access points sent.
    rc = geolocate(SERVER_NETWORK_INTERFACE, coap_server.handle, COAP_URI, device_id_text);  assert(rc >= 0);
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

#if MYNEWT_VAL(NRF24L01)  //  If nRF24L01 Wireless Network is enabled...
    //  For Collector Node: Send to CoAP Server.  Requires ESP8266.
    if (nrf24l01_collector_node()) { return send_sensor_data_to_server(val); }
    //  For Sensor Node: Send to Collector Node.
    else if (nrf24l01_sensor_node()) { return send_sensor_data_to_collector(val); }
    assert(0);  //  Don't know how to send sensor data
#endif  //  MYNEWT_VAL(NRF24L01)

#if MYNEWT_VAL(ESP8266)  //  If ESP8266 WiFi is enabled...
    //  For Standalone Node: Send to CoAP Server.
    return send_sensor_data_to_server(val);
#endif  //  MYNEWT_VAL(ESP8266)
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
    struct oc_server_handle *server = coap_collector.handle;
    const char *uri = COAP_URI;
    const char *device_str = device_id_text;
    assert(server);  assert(uri);  assert(device_str);

#if MYNEWT_VAL(NRF24L01)  //  If nRF24L01 Wireless Network is enabled...
    if (nrf24l01_collector_node()) {  //  If this is a Collector Node...
        console_printf("RSN remote sensor rx: rawtmp %d\n", val->int_val);  ////
        console_printf("ESP send to coap svr: rawtmp %d\n", val->int_val);  ////
        console_flush();  ////
    }
#endif  //  MYNEWT_VAL(NRF24L01)

    //  Start composing the CoAP message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    int rc = init_sensor_post(server, uri, 0);  assert(rc != 0);

    //  Compose the CoAP Payload in JSON using the CP macros.  Also works for CBOR.
    CP_ROOT({                     //  Create the payload root
        CP_ARRAY(root, values, {  //  Create "values" as an array of items under the root
            //  Append to the "values" array:
            //    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
            CP_ITEM_STR(values, "device", device_str);

            //  Append to the "values" array the key and value:
            //    {"key":"t",   "value":2870} for raw temperature
            //    {"key":"tmp", "value":28.7} for computed temperature

#if MYNEWT_VAL(RAW_TEMP)  //  If we are transmitting raw temperature (integer)...
            assert(val->val_type == SENSOR_VALUE_TYPE_INT32);
            CP_ITEM_INT(values, val->key, val->int_val);      //  Raw temperature (integer)
            
#else  //  If we are transmitting computed temperature (float)
            assert(val->val_type == SENSOR_VALUE_TYPE_FLOAT);
            CP_ITEM_FLOAT(values, val->key, val->float_val);  //  Computed temperature (float)
#endif  //  MYNEWT_VAL(RAW_TEMP) 

            //  If there are more sensor values, add them here with
            //  CP_ITEM_INT, CP_ITEM_UINT, CP_ITEM_FLOAT or CP_ITEM_STR
            //  Check geolocate() for a more complex payload: apps/my_sensor_app/src/geolocate.c

        });                       //  End CP_ARRAY: Close the "values" array
    });                           //  End CP_ROOT:  Close the payload root

    //  Post the CoAP message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    rc = do_sensor_post();  assert(rc != 0);

    console_printf("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n", device_str);
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
    struct oc_server_handle *server = coap_server.handle;
    const char *uri = COAP_URI;
    const char *device_str = device_id_text;
    assert(server);  assert(uri);  assert(device_str);

    //  Start composing the CoAP message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    int rc = init_sensor_post(server, uri, 0);  assert(rc != 0);

    //  Compose the CoAP Payload in CBOR using the CBOR macros.
    CBOR_ROOT({  //  Create the payload root
        //  Insert the sensor key and value, e.g. t: 2870
        assert(val->val_type == SENSOR_VALUE_TYPE_INT32);  //  We only send raw sensor values (integer), not computed values.
        cbor_set_int(root, val->key, val->int_val);   //  Insert the sensor key and value.
    });  //  End CBOR_ROOT:  Close the payload root

    //  Post the CoAP message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    rc = do_sensor_post();  assert(rc != 0);

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
