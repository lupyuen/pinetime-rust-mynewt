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
#include <oic/oc_api.h>
#include <oic/port/mynewt/ip.h>
#include <console/console.h>  //  Actually points to libs/semihosting_console
#include "esp8266_driver.h"

#define COAP_URI "coap://coap.thethings.io/v2/things/IVRiBCcR6HPp_CcZIFfOZFxz_izni5xc_KO-kgSA2Y8/"
#define TRANSCEIVER_DEVICE "esp8266_0"
#define MAX_WIFI_AP 3  //  Read at most 3 WiFi access points.

//  static void init_sensors(void);
static int init_tasks(void);

static nsapi_wifi_ap_t wifi_aps[MAX_WIFI_AP];  //  List of scanned WiFi access points.

void __wrap_oc_buffer_init(void) {  ////  TODO: Prevent OIC receive process from being linked in.
    // os_mqueue_init(&oc_inq, oc_buffer_rx, NULL);
    // os_mqueue_init(&oc_outq, oc_buffer_tx, NULL);
}

static struct esp8266_server_handle coap_server = {
    .endpoint = {
        .host = "coap.thethings.io",
        .port = COAP_PORT_UNSECURED  //  UDP port 5683.
    }
};

static void handle_coap(oc_client_response_t *data) {
    console_printf("handle_coap\n"); console_flush();
}

static void init_coap(void) {
    //  Send the sensor data over CoAP to the cloud.
    esp8266_register_transport();
    init_esp8266_endpoint(&coap_server.endpoint);
    if (oc_init_post(COAP_URI, (oc_server_handle_t *) &coap_server, NULL, handle_coap, LOW_QOS)) {
        oc_rep_start_root_object();
        oc_rep_set_double(root, state, 28.1);
        oc_rep_end_root_object();
        console_flush();  ////
        if (oc_do_post()) {
            console_printf("Sent POST request\n"); console_flush();
        } else {
            console_printf("Could not send POST\n"); console_flush();
        }
    } else {
        console_printf("Could not init POST\n"); console_flush();
    }
}

#ifdef NOTUSED
    #include <oic/messaging/coap/coap.h>
    static struct coap_packet packet;
    static void init_coap(void) {
        //  Send the sensor data over CoAP to the cloud.  We manipulate the message directly
        //  instead of using Mynewt OIC library because the OIC library is too large for Blue Pill.
        packet.version = 1;
    }
#endif  //  NOTUSED

int main(int argc, char **argv) {
    int rc;
    sysinit();  //  Initialize all packages.  Create the sensors.
    //  init_sensors();  //  Init the sensors.    
    init_esp8266();  //  Init the ESP8266 transceiver.
    init_coap();  //  Init CoAP request.

    rc = init_tasks();            //  Start the background tasks.
    assert(rc == 0);

    while (1) {                   //  Loop forever...
        os_eventq_run(            //  Process events...
            os_eventq_dflt_get()  //  From default event queue.
        );
    }
    return 0;  //  Never comes here.
}

#define WORK_TASK_PRIO (10)  //  Command task is lower priority than event processing.  
#define WORK_STACK_SIZE OS_STACK_ALIGN(256)

static struct os_task work_task;
static uint8_t work_stack[sizeof(os_stack_t) * WORK_STACK_SIZE];

static void work_task_handler(void *arg) {
    struct sensor *trans = sensor_mgr_find_next_bydevname(TRANSCEIVER_DEVICE, NULL);
    assert(trans != NULL);

    int rc = esp8266_scan(&trans->s_itf, wifi_aps, MAX_WIFI_AP);
    assert(rc > 0 && rc <= MAX_WIFI_AP);

    while (1) {  //  Loop forever...        
        os_time_delay(1000);  //  Wait one second.
    }
}

static int init_tasks(void) {
    os_task_init(&work_task, "work", work_task_handler, NULL,
            WORK_TASK_PRIO, OS_WAIT_FOREVER, 
            (os_stack_t *) work_stack, WORK_STACK_SIZE);
    return 0;
}

#ifdef POLL_SENSOR
    #define MY_SENSOR_DEVICE "bme280_0"
    #define MY_SENSOR_POLL_TIME 2000
    #define LISTENER_CB 1
    #define READ_CB 2

    static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type);

    static struct sensor *my_sensor;

    static struct sensor_listener listener = {
        .sl_sensor_type = SENSOR_TYPE_AMBIENT_TEMPERATURE,
        .sl_func = read_temperature,
        .sl_arg = (void *)LISTENER_CB,
    };

    static void init_sensors(void) {
        int rc;
        rc = sensor_set_poll_rate_ms(MY_SENSOR_DEVICE, MY_SENSOR_POLL_TIME);
        assert(rc == 0);

        my_sensor = sensor_mgr_find_next_bydevname(MY_SENSOR_DEVICE, NULL);
        assert(my_sensor != NULL);

        rc = sensor_register_listener(my_sensor, &listener);
        assert(rc == 0);
    }

    static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type) {
        struct sensor_temp_data *temp;
        if (!databuf) { return SYS_EINVAL; }
        temp = (struct sensor_temp_data *)databuf;
        if (!temp->std_temp_is_valid) { return SYS_EINVAL; }
        console_printf(
            "temp = %d.%d\n",
            (int) (temp->std_temp),
            (int) (10.0 * temp->std_temp) % 10
        );
        return 0;
    }
#endif  //  POLL_SENSOR

//  Dummy destructor for global C++ objects, since our program never terminates.  From https://arobenko.gitbooks.io/bare_metal_cpp/content/compiler_output/static.html.
void* __dso_handle = NULL;
void _fini(void) { }
int __aeabi_atexit(void *object, void (*destructor)(void *), void *dso_handle) { return 0; }
