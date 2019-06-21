#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <mynewt_rust/mynewt_rust.h>
#include <mynewt_rust/sensor_helper.h>
#include <mynewt_rust/json_helper.h>

///  Initialise the Mynewt system.  Start the Mynewt drivers and libraries.  Equivalent to `sysinit()` macro in C.
void rust_sysinit() {
    sysinit();
}
