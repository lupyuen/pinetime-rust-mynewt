//  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>
#include <defs/error.h>
#include <console/console.h>  //  Actually points to libs/semihosting_console
#include "temp_sensor.h"
#include "send_coap.h"
#include "geolocate.h"

#if MYNEWT_VAL(SENSOR_COAP)         //  If we are sending sensor data to CoAP server...
static int init_tasks(void);
#endif  //  MYNEWT_VAL(SENSOR_COAP)

void test_semihosting_console(void) {  ////
    //  Test floats.
    console_printf("12.34=");  console_printfloat(12.34f);  console_printf("\n");
    console_printf("9.87=");   console_printfloat(9.87f);   console_printf("\n");
    console_printf("0.89=");   console_printfloat(0.89f);   console_printf("\n");
    console_printf("0.12=");   console_printfloat(0.12f);   console_printf("\n");
    console_printf("-0.12=");  console_printfloat(-0.12f);  console_printf("\n");
    console_printf("-0.89=");  console_printfloat(-0.89f);  console_printf("\n");
    console_printf("-9.87=");  console_printfloat(-9.87f);  console_printf("\n");
    console_printf("-12.34="); console_printfloat(-12.34f); console_printf("\n");
    console_flush();
}

///////////////////////////////////////////////////////////////////////////////
//  Read Sensor Data from Temperature Sensor

int main(int argc, char **argv) {
    //  Main program that creates sensors, ESP8266 drivers and starts the task to read and send sensor data.
    //  Initialize all packages.  Create the BME280 driver instance.  Start background task for OIC to transmit CoAP requests.
    sysinit();           

    test_semihosting_console();  ////

#if MYNEWT_VAL(SENSOR_COAP)  //  If we are sending sensor data to CoAP server...
    //  Start the background tasks, including WiFi geolocation.
    int rc1 = init_tasks();  assert(rc1 == 0);
#endif  //  MYNEWT_VAL(SENSOR_COAP)

#ifdef TEMP_SENSOR  //  If BME280 or internal temperature sensor is enabled...
    //  Start polling the temperature sensor every 10 seconds.
    int rc2 = start_temperature_listener();  assert(rc2 == 0);
#endif  //  TEMP_SENSOR

    //  Main event loop
    while (true) {                //  Loop forever...
        os_eventq_run(            //  Process events...
            os_eventq_dflt_get()  //  From default event queue.
        );
    }
    return 0;  //  Never comes here.
}

///////////////////////////////////////////////////////////////////////////////
//  Other Functions

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
