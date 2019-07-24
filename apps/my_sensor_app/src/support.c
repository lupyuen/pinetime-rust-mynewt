//  For Rust: main() is defined in Rust: src/lib.rs
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <console/console.h>

void mynewt_app_stub() {
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
