//  Initialise the temperature sensor and poll it every 10 seconds.  We support 2 types of temperature sensors:
//  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1
//  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//  BME280 is selected if BME280_OFB is defined in syscfg.yml.
//  Blue Pill internal temperature sensor is selected if TEMP_STM32 is defined in syscfg.yml.
#ifndef __TEMP_SENSOR_H__
#define __TEMP_SENSOR_H__

#if MYNEWT_VAL(BME280_OFB)             //  If BME280 Temperature Sensor is enabled...
#define TEMP_SENSOR "bme280_0"         //  Open sensor "bme280_0" as the temperature sensor

#elif MYNEWT_VAL(TEMP_STM32)           //  Else if Blue Pill Internal Temperature Sensor is enabled...
#include <temp_stm32/temp_stm32.h>
#define TEMP_SENSOR TEMP_STM32_DEVICE  //  Open internal temperature sensor "temp_stm32_0"

#endif  //  MYNEWT_VAL(BME280_OFB), MYNEWT_VAL(TEMP_STM32)

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Start polling the temperature sensor every 10 seconds.
int start_temperature_listener(void);

#ifdef __cplusplus
}
#endif

#endif  //  __TEMP_SENSOR_H__
