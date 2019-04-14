//  Send sensor data to a CoAP server like thethings.io.  The CoAP payload will be encoded as JSON.
//  The sensor data will be transmitted over WiFi via the ESP8266 transceiver.
//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server...

#include <console/console.h>
#include <esp8266/esp8266.h>  //  Declare ESP8266 and CoAP functions.
#include <esp8266/transport.h>
#include <sensor_coap/sensor_coap.h>
#include <hmac_prng/hmac_prng.h>
#include "send_coap.h"

//  CoAP Connection Settings e.g. coap://coap.thethings.io/v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8
//  COAP_HOST, COAP_PORT, COAP_URI are defined in targets/bluepill_my_sensor/syscfg.yml
static const char COAP_HOST[] = MYNEWT_VAL(COAP_HOST);  //  CoAP hostname e.g. coap.thethings.io
static const char COAP_URI[]  = MYNEWT_VAL(COAP_URI);   //  CoAP URI e.g. v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8

//  ESP8266 WiFi Connection Settings, defined in targets/bluepill_my_sensor/syscfg.yml
static const char WIFI_SSID[]     = MYNEWT_VAL(WIFI_SSID);      //  Connect to the WiFi access point with this SSID e.g. my_ssid
static const char WIFI_PASSWORD[] = MYNEWT_VAL(WIFI_PASSWORD);  //  Password for WiFi access point e.g. my_password

//  CoAP Server Configuration. 
static struct esp8266_server coap_server = {
    .endpoint = {
        .host = COAP_HOST,              //  CoAP hostname e.g. coap.thethings.io
        .port = MYNEWT_VAL(COAP_PORT),  //  CoAP port, usually UDP port 5683
    }
};

//  Randomly assigned device ID that will be sent in every CoAP request.
static uint8_t device_id[16];

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
        "sensor",           //  Name of task.
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
    console_printf("run network task\n");  assert(!network_is_ready);

    //  Create a random device ID based on HMAC pseudorandom number generator.
    int rc = hmac_prng_generate(device_id, sizeof(device_id));  assert(rc == 0);
    console_printf("device_id: "); console_dump(device_id, sizeof(device_id)); console_printf("\n");

    {   //  Lock the ESP8266 driver
        //  Find the ESP8266 device by name "esp8266_0".
        struct esp8266 *dev = (struct esp8266 *) os_dev_open(ESP8266_DEVICE, OS_TIMEOUT_NEVER, NULL);  //  ESP8266_DEVICE is "esp8266_0"
        assert(dev != NULL);
        //  Connect to WiFi access point.  This may take a while to complete (or fail), thus we
        //  need to run this in the Network Task in background.  The Main Task will run the Event Loop
        //  to pass ESP8266 events to this function.
        rc = esp8266_connect(dev, WIFI_SSID, WIFI_PASSWORD);  assert(rc == 0);

        //  Register the ESP8266 driver as the network transport for CoAP.
        rc = esp8266_register_transport(dev, &coap_server);  assert(rc == 0);

#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...
        //  Geolocate the device by sending WiFi Access Point info.  Returns number of access points sent.
        rc = geolocate(dev, coap_server.handle, COAP_URI);  assert(rc >= 0);
#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)

        //  Close the ESP8266 device when we are done sending.
        os_dev_close((struct os_dev *) dev);
        //  Unlock the ESP8266 driver
    }

    network_is_ready = true;  //  Indicate that network is ready.

    //  Network Task terminates here. The Sensor Listener will still continue to
    //  run in the background and send sensor data to the server.
}

int send_sensor_data(float tmp) {
    //  Compose a CoAP message with sensor data "tmp" and send to the CoAP server
    //  and URI.  The message will be enqueued for transmission by the CoAP / OIC 
    //  Background Task so this function will return without waiting for the message 
    //  to be transmitted.  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
    if (!network_is_ready) { return SYS_EAGAIN; }

    //  For the CoAP server hosted at thethings.io, the CoAP payload should look like:
    //  {"values":[
    //    {"key":"tmp", "value":28.7},
    //    {"key":"...", "value":... },
    //    ... ]}
    assert(server);  assert(uri);

    //  Compose the CoAP message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    int rc = init_sensor_post(server, uri);  assert(rc != 0);

    //  Compose the CoAP Payload in JSON using the CP macros.  Also works for CBOR.
    CP_ROOT({                     //  Create the payload root
        CP_ARRAY(root, values, {  //  Create "values" as an array of items under the root
            //  Append to the "values" array: {"key":"tmp", "value":28.7}
            CP_ITEM_FLOAT(values, "tmp", tmp);
            //  If there are more sensor values, add them here with
            //  CP_ITEM_INT, CP_ITEM_UINT, CP_ITEM_FLOAT or CP_ITEM_STR
        });                       //  End CP_ARRAY: Close the "values" array
    });                           //  End CP_ROOT:  Close the payload root

    //  Post the CoAP message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    rc = do_sensor_post();  assert(rc != 0);
    console_printf("  > send sensor data tmp="); console_printfloat(tmp); console_printf("\n");  ////
    return 0;
}

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

#ifdef NOTUSED  //  Previously
    float tmp = 28.00f;  //  Simulated sensor data.
    while (true) {  //  Loop forever...        
        send_sensor_data(coap_server.handle, COAP_URI, tmp);  //  Send sensor data to server via CoAP.
        tmp += 0.01f;                                         //  Simulate change in sensor data.
        console_printf("  ? free mbuf: %d\n", os_msys_num_free());  //  Display number of free mbufs, to catch memory leaks.
        os_time_delay(10 * OS_TICKS_PER_SEC);                 //  Wait 10 seconds before repeating.
    }

    //  Previous code without the CP Macros
    rep_start_root_object();                              //  Create the root.
        rep_set_array(root, values);                      //  Create "values" as an array of objects.
            rep_object_array_start_item(values);          //  Create a new item in the "values" array.
                //  Each child of "values" is an object like {"key":"tmp","value":28.7}.
                rep_set_text_string(values, key,   "tmp");  //  Set the key.
                rep_set_float      (values, value, tmp);    //  Set the value.
            rep_object_array_end_item(values);            //  Close the item in the "values" array.
        rep_close_array(root, values);                    //  Close the "values" array.
    rep_end_root_object();                                //  Close the root.
#endif  //  NOTUSED
