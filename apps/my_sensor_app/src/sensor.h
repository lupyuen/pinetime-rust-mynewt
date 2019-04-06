#ifndef __SENSOR_H__
#define __SENSOR_H__

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#ifdef POLL_SENSOR
void init_sensors(void);
#endif  //  POLL_SENSOR

#ifdef __cplusplus
}
#endif

#endif  //  __SENSOR_H__
