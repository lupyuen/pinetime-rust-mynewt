//  For supporting low power
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"

#if !MYNEWT_VAL(LOW_POWER)  //  TODO
/// `bc95g` driver will set this to 1 so that `power_sleep()` will not sleep when network is busy connecting. See libs/bc95g/src/transport.cpp
int network_is_busy = 0;
int network_has_transmitted = 0;

int power_standby_wakeup(void) {
    //  Return 1 if we have been woken up from Deep Sleep Standby Mode, 0 otherwise.
    return 0;
}
#endif  //  !MYNEWT_VAL(LOW_POWER)
