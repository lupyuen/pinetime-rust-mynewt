//  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server or Collector Node.
//  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>
#include <defs/error.h>
#include <console/console.h>  //  Actually points to libs/semihosting_console
#include "send_coap.h"        //  For start_network_task()
#include "listen_sensor.h"    //  For start_sensor_listener()

///////////////////////////////////////////////////////////////////////////////
//  Read Sensor Data from Temperature Sensor and Send to CoAP Server or Collector Node

int main2(int argc, char **argv) {
    //  Main program that initialises the sensor, network driver and starts reading 
    //  and sending sensor data in the background.

    //  Initialise the Mynewt packages and BME280 / temp_stm32 temperature sensor driver.
    //  Start the CoAP / OIC Background Task to transmit CoAP messages.  Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/bluepill_my_sensor/generated/src/bluepill_my_sensor-sysinit-app.c
    sysinit();  console_flush();

#if defined(SERVER_NETWORK_INTERFACE) || defined(SENSOR_NETWORK_INTERFACE)  //  If the ESP8266 or nRF24L01 is enabled...
    //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
    int rc1 = start_network_task();  assert(rc1 == 0);
#endif  //  NETWORK_DEVICE

#ifdef SENSOR_DEVICE   //  If BME280 or internal temperature sensor is enabled...
    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
    //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.
    int rc2 = start_sensor_listener();  assert(rc2 == 0);
#endif  //  SENSOR_DEVICE

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

//  Dummy destructor for global C++ objects, since our program never terminates.  
//  From https://arobenko.gitbooks.io/bare_metal_cpp/content/compiler_output/static.html.
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
