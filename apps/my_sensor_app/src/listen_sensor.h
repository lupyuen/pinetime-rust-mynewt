//  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
//  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
//       This sensor is selected if BME280_OFB is defined in syscfg.yml.
//  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//       This sensor is selected if TEMP_STM32 is defined in syscfg.yml.
//  If sending to CoAP server is enabled, send the sensor data to the CoAP server after polling.
#ifndef __LISTEN_SENSOR_H__
#define __LISTEN_SENSOR_H__

//  SENSOR_DEVICE, the name of the temperature sensor device to be used to reading sensor data, 
//  will be set to "bme280_0" or "temp_stm32_0"

#if MYNEWT_VAL(BME280_OFB)             //  If BME280 Temperature Sensor is enabled...
#define SENSOR_DEVICE "bme280_0"         //  We will open sensor "bme280_0" as the temperature sensor

#elif MYNEWT_VAL(TEMP_STM32)           //  Else if Blue Pill Internal Temperature Sensor is enabled...
#include <temp_stm32/temp_stm32.h>     //  Get sensor name
#define SENSOR_DEVICE TEMP_STM32_DEVICE  //  We will open internal temperature sensor "temp_stm32_0"

#endif  //  MYNEWT_VAL(BME280_OFB), MYNEWT_VAL(TEMP_STM32)

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Starting polling the temperature sensor every 10 seconds in the background.  
//  After polling the sensor, call the listener function to send the sensor data to the CoAP server.
int start_sensor_listener(void);

#ifdef __cplusplus
}
#endif

#endif  //  __LISTEN_SENSOR_H__
