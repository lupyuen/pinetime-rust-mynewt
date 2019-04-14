//  Initialise the temperature sensor and poll it every 10 seconds.  We support 2 types of temperature sensors:
//  (1)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//  (2)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1
#ifndef __TEMP_SENSOR_H__
#define __TEMP_SENSOR_H__

#if MYNEWT_VAL(TEMP_STM32)   //  If Blue Pill Internal Temperature Sensor is enabled...
#include <adc_stm32f1/adc_stm32f1.h>
#include <temp_stm32/temp_stm32.h>
#define MY_SENSOR_DEVICE TEMP_STM32_DEVICE  //  Name of the internal temperature sensor is "temp_stm32_0"

#elif MYNEWT_VAL(BME280_OFB)  //  Else if BME280 Temperature Sensor is enabled...
#define MY_SENSOR_DEVICE "bme280_0"          //  Name of the BME280 driver
#endif  //  MYNEWT_VAL(BME280_OFB)

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Initialize the temperature sensor.  Start polling the sensor every 10 seconds.
int init_temperature_sensor(void);

#ifdef __cplusplus
}
#endif

#endif  //  __TEMP_SENSOR_H__
