//  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server
//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>
#include <defs/error.h>
#include <console/console.h>  //  Actually points to libs/semihosting_console
#if MYNEWT_VAL(SENSOR_COAP)   //  If Sensor CoAP is enabled...
#include <sensor_coap/sensor_coap.h>
#endif  //  MYNEWT_VAL(SENSOR_COAP)
#if MYNEWT_VAL(ESP8266)       //  If ESP8266 is enabled...
#include <esp8266/esp8266.h>
#endif  //  MYNEWT_VAL(ESP8266)
#if MYNEWT_VAL(ESP8266) && MYNEWT_VAL(SENSOR_COAP)  //  If ESP8266 and Sensor CoAP are enabled...
#include <esp8266/transport.h>
#endif  //  MYNEWT_VAL(ESP8266) && MYNEWT_VAL(SENSOR_COAP)
#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...
#include "geolocate.h"
#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)
#include "temp_sensor.h"

//  CoAP Connection Settings e.g. coap://coap.thethings.io/v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8
//  COAP_HOST, COAP_PORT, COAP_URI are defined in targets/bluepill_my_sensor/syscfg.yml
static const char COAP_HOST[] = MYNEWT_VAL(COAP_HOST);  //  CoAP hostname e.g. coap.thethings.io
static const int  COAP_PORT   = MYNEWT_VAL(COAP_PORT);  //  CoAP UDP port, usually 5683
static const char COAP_URI[]  = MYNEWT_VAL(COAP_URI);   //  CoAP URI e.g. v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8

//  ESP8266 WiFi Connection Settings, defined in targets/bluepill_my_sensor/syscfg.yml
static const char WIFI_SSID[]     = MYNEWT_VAL(WIFI_SSID);      //  Connect to the WiFi access point with this SSID e.g. my_ssid
static const char WIFI_PASSWORD[] = MYNEWT_VAL(WIFI_PASSWORD);  //  Password for WiFi access point e.g. my_password

//  CoAP Server Configuration. 
static struct esp8266_server coap_server = {
    .endpoint = {
        .host = COAP_HOST,  //  CoAP hostname e.g. coap.thethings.io
        .port = COAP_PORT,  //  CoAP port, usually UDP port 5683
    }
};

//  Storage for Sensor Task
#define SENSOR_TASK_STACK_SIZE OS_STACK_ALIGN(256)  //  Size of the stack (in 4-byte units).
static uint8_t sensor_task_stack[sizeof(os_stack_t) * SENSOR_TASK_STACK_SIZE];  //  Stack space.
static struct os_task sensor_task;  //  Task object will be saved here.

//  Static Functions
static int init_tasks(void);
static void sensor_task_func(void *arg);
static void send_sensor_data(struct oc_server_handle *server, const char *uri, float tmp);

int main(int argc, char **argv) {
    //  Main program that creates sensors, ESP8266 drivers and starts the task to read and send sensor data.
    int rc;
    //  Initialize all packages.  Create the BME280 driver instance.  Start background task for OIC to transmit CoAP requests.
    sysinit();           

#if MYNEWT_VAL(ESP8266) && MYNEWT_VAL(SENSOR_COAP)  //  If ESP8266 and Sensor CoAP are enabled...
    //  TODO: Allocate device ID.

    //  Initialize the ESP8266 driver.
    ////  rc = esp8266_create();  assert(rc == 0); 
    console_printf("esp8266_create=%x\n", (unsigned) esp8266_create);  ////

    //  Start the background tasks, including WiFi geolocation.
    ////  rc = init_tasks();  assert(rc == 0);
    console_printf("init_tasks=%x\n", (unsigned) init_tasks);  ////
#endif  //  MYNEWT_VAL(ESP8266) && MYNEWT_VAL(SENSOR_COAP)

    //  Initialize the temperature sensor.  Start polling the sensor every 10 seconds.
    rc = init_temperature_sensor();  assert(rc == 0);

    //  Main event loop
    while (true) {                //  Loop forever...
        os_eventq_run(            //  Process events...
            os_eventq_dflt_get()  //  From default event queue.
        );
    }
    return 0;  //  Never comes here.
}

#if MYNEWT_VAL(ESP8266) && MYNEWT_VAL(SENSOR_COAP)  //  If ESP8266 and Sensor CoAP are enabled...
static int init_tasks(void) {
    //  Start the sensor task that reads sensor data and sends to the server.
    int rc = os_task_init(  //  Create a new task and start it...
        &sensor_task,       //  Task object will be saved here.
        "sensor",           //  Name of task.
        sensor_task_func,   //  Function to execute when task starts.
        NULL,               //  Argument to be passed to above function.
        10,  //  Task priority: highest is 0, lowest is 255.  Main task is 127.
        OS_WAIT_FOREVER,    //  Don't do sanity / watchdog checking.
        (os_stack_t *) sensor_task_stack,  //  Stack space for the task.
        SENSOR_TASK_STACK_SIZE);           //  Size of the stack (in 4-byte units).
    assert(rc == 0);
    return rc;
}

static void sensor_task_func(void *arg) {
    //  Background task that reads sensor data and sends to the server.
    console_printf("sensor_task\n");
    //  Find the ESP8266 device by name: "esp8266_0".
    struct esp8266 *dev = (struct esp8266 *) os_dev_open(ESP8266_DEVICE, OS_TIMEOUT_NEVER, NULL);
    assert(dev != NULL);

    //  Connect to WiFi access point.
    int rc = esp8266_connect(dev, WIFI_SSID, WIFI_PASSWORD);  assert(rc == 0);

    //  Register the ESP8266 driver as the network transport for CoAP.
    rc = esp8266_register_transport(dev, &coap_server);  assert(rc == 0);

    //  Init the Sensor CoAP module for composing CoAP requests.
    rc = init_sensor_coap();  assert(rc == 0);

#if MYNEWT_VAL(WIFI_GEOLOCATION)  //  If WiFi Geolocation is enabled...
    //  Geolocate the device by sending WiFi Access Point info.  Returns number of access points sent.
    rc = geolocate(dev, coap_server.handle, COAP_URI);  assert(rc > 0);
#endif  //  MYNEWT_VAL(WIFI_GEOLOCATION)

    ////  TODO
    float tmp = 28.0;  //  Simulated sensor data.
    while (true) {  //  Loop forever...        
        send_sensor_data(coap_server.handle, COAP_URI, tmp);  //  Send sensor data to server via CoAP.
        tmp += 0.1;                                           //  Simulate change in sensor data.
        console_printf("  ? free mbuf: %d\n", os_msys_num_free());  //  Display number of free mbufs, to catch memory leaks.
        os_time_delay(10 * OS_TICKS_PER_SEC);                 //  Wait 10 seconds before repeating.
    }
}
#endif  //  MYNEWT_VAL(ESP8266) && MYNEWT_VAL(SENSOR_COAP)

#if MYNEWT_VAL(SENSOR_COAP)   //  If Sensor CoAP is enabled...
static void send_sensor_data(struct oc_server_handle *server, const char *uri, float tmp) {
    //  Send the sensor data over CoAP to the specified thethings.io server and uri.
    //  The CoAP body should look like:
    //  {"values":[
    //    {"key":"tmp", "value":28.7}
    //  ]}
    //  Create a CoAP request.  This will call a semaphore to block other tasks from creating a CoAP request.
    assert(server);  assert(uri);
    int rc = init_sensor_post(server, uri);  assert(rc != 0);

    //  Populate the CoAP request body in JSON format.
    rep_start_root_object();                              //  Create the root.
        rep_set_array(root, values);                      //  Create "values" as an array of objects.
            rep_object_array_start_item(values);          //  Create a new item in the "values" array.
                //  Each child of "values" is an object like {"key":"tmp","value":28.7}.
                rep_set_text_string(values, key,   "tmp");  //  Set the key.
                rep_set_double     (values, value, tmp);    //  Set the value.
            rep_object_array_end_item(values);            //  Close the item in the "values" array.
        rep_close_array(root, values);                    //  Close the "values" array.
    rep_end_root_object();                                //  Close the root.

    //  Forward the CoAP request to the CoAP Background Task for transmission.  This will release a semaphore to allow other tasks to create CoAP requests.
    rc = do_sensor_post();  assert(rc != 0);
    console_printf("  > send sensor data tmp=%d.%d\n", (int) tmp, (int) (10.0 * tmp) % 10);
}
#endif  //  MYNEWT_VAL(SENSOR_COAP)

int __wrap_coap_receive(/* struct os_mbuf **mp */) {
    //  We override the default coap_receive() with an empty function so that we will 
    //  NOT link in any modules for receiving and parse CoAP requests, to save ROM space.
    //  We only need to transmit CoAP requests.
    console_printf("coap_receive NOT IMPLEMENTED\n");
    return -1;
}

//  Dummy destructor for global C++ objects, since our program never terminates.  From https://arobenko.gitbooks.io/bare_metal_cpp/content/compiler_output/static.html.
void* __dso_handle = NULL;
void _fini(void) { }
int __aeabi_atexit(void *object, void (*destructor)(void *), void *dso_handle) { return 0; }

/** About directory "my_sensor_app" for BSP "bluepill" and MCU "stm32f1xx"...
 * Depending on the type of package, there are different
 * compilation rules for this directory.  This comment applies
 * to packages of type "app."  For other types of packages,
 * please view the documentation at http://mynewt.apache.org/.
 *
 * Put source files in this directory.  All files that have a *.c
 * ending are recursively compiled in the src/ directory and its
 * descendants.  The exception here is the arch/ directory, which
 * is ignored in the default compilation.
 *
 * The arch/<your-arch>/ directories are manually added and
 * recursively compiled for all files that end with either *.c
 * or *.a.  Any directories in arch/ that don't match the
 * architecture being compiled are not compiled.
 *
 * Architecture is set by the BSP/MCU combination.
 */
