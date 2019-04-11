//  Main program for the sensor app that reads sensor data and sends to the cloud
/**
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
#include <sysinit/sysinit.h>
#include <os/os.h>
#include <defs/error.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include <console/console.h>  //  Actually points to libs/semihosting_console
#include "sensor_coap.h"
#include "esp8266_driver.h"
#include "esp8266_transport.h"
#include "geolocate.h"
#include "temp_sensor.h"

//  CoAP Connection Settings e.g. coap://coap.thethings.io/v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8
#define COAP_HOST   "coap.thethings.io"  //  CoAP hostname e.g. coap.thethings.io
#define COAP_PORT   COAP_PORT_UNSECURED  //  CoAP port, usually UDP port 5683
#define COAP_URI    "v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8"  //  CoAP URI

#define TRANSCEIVER_DEVICE ESP8266_DEVICE  //  Name of the transceiver device e.g. esp8266_0

static int init_tasks(void);
static void sensor_task(void *arg);
static void send_sensor_data(struct oc_server_handle *server, const char *uri, float tmp);

//  CoAP Server Configuration
static struct esp8266_server coap_server = {
    .endpoint = {
        .host = COAP_HOST,  //  CoAP hostname e.g. coap.thethings.io
        .port = COAP_PORT   //  CoAP port, usually UDP port 5683
    }
};

int main(int argc, char **argv) {
    //  Main program that creates sensors, ESP8266 drivers and starts the task to read and send
    //  sensor data.
    int rc;
    //  Initialize all packages.  Create the sensors.  Start background task for OIC to transmit CoAP requests.
    sysinit();           

    //  Initialize the sensors. 
    rc = init_temperature_sensor();  assert(rc == 0);

    //  Initialize the ESP8266 driver.
    rc = init_esp8266();  assert(rc == 0); 

    //  Start the background tasks.
    rc = init_tasks();  assert(rc == 0);

    while (true) {                //  Loop forever...
        os_eventq_run(            //  Process events...
            os_eventq_dflt_get()  //  From default event queue.
        );
    }
    return 0;  //  Never comes here.
}

#define WORK_TASK_PRIO (10)  //  TODO: Command task should be lower priority than event processing.  
#define WORK_STACK_SIZE OS_STACK_ALIGN(256)

static struct os_task work_task;
static uint8_t work_stack[sizeof(os_stack_t) * WORK_STACK_SIZE];

static int init_tasks(void) {
    //  Start the sensor task that reads sensor data and sends to the server.
    int rc = os_task_init(&work_task, "work", sensor_task, NULL,
        WORK_TASK_PRIO, OS_WAIT_FOREVER, 
        (os_stack_t *) work_stack, WORK_STACK_SIZE);
    return rc;
}

static void sensor_task(void *arg) {
    //  Background task that reads sensor data and sends to the server.

    //  Get the handle for the ESP8266 driver.
    struct sensor *trans = sensor_mgr_find_next_bydevname(TRANSCEIVER_DEVICE, NULL);  assert(trans != NULL);
    struct sensor_itf *itf = &trans->s_itf;

    //  Connect to WiFi access point.
    int rc = esp8266_connect(itf, "my_ssid", "my_password_is_secret");  assert(rc == 0);

    //  Register the ESP8266 driver as the network transport for CoAP.
    rc = esp8266_register_transport(itf, &coap_server);  assert(rc == 0);

    //  Init the Sensor CoAP module for composing CoAP requests.
    rc = init_sensor_coap();  assert(rc == 0);

    //  Geolocate the device by sending WiFi Access Point info.  Returns number of access points sent.
    rc = geolocate(itf, coap_server.handle, COAP_URI);  assert(rc > 0);

    float tmp = 28.0;  //  Simulated sensor data.
    while (true) {  //  Loop forever...        
        send_sensor_data(coap_server.handle, COAP_URI, tmp);  //  Send sensor data to server via CoAP.
        tmp += 0.1;                                           //  Simulate change in sensor data.
        console_printf("  ? free mbuf: %d\n", os_msys_num_free());  //  Display number of free mbufs, to catch memory leaks.
        os_time_delay(10 * OS_TICKS_PER_SEC);                 //  Wait 10 seconds before repeating.
    }
}

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
