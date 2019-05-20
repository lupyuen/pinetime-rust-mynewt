//  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
//  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
//       This sensor is selected if BME280_OFB is defined in syscfg.yml.
//  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//       This sensor is selected if TEMP_STM32 is defined in syscfg.yml.
//  If this is the Collector Node, send the sensor data to the CoAP Server after polling.
#ifndef __LISTEN_SENSOR_H__
#define __LISTEN_SENSOR_H__

//  SENSOR_DEVICE, the name of the temperature sensor device to be used to reading sensor data, 
//  will be set to "bme280_0" or "temp_stm32_0"

#if MYNEWT_VAL(BME280_OFB)               //  If BME280 Temperature Sensor is enabled...
#define SENSOR_DEVICE "bme280_0"         //  We will open sensor "bme280_0" as the temperature sensor

#elif MYNEWT_VAL(TEMP_STM32)             //  Else if Blue Pill Internal Temperature Sensor is enabled...
#include <temp_stm32/temp_stm32.h>       //  For sensor name TEMP_STM32_DEVICE
#define SENSOR_DEVICE TEMP_STM32_DEVICE  //  We will open internal temperature sensor "temp_stm32_0"

#endif  //  MYNEWT_VAL(BME280_OFB), MYNEWT_VAL(TEMP_STM32)

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  For Sensor Node and Standalone Node: Start polling the temperature sensor 
//  every 10 seconds in the background.  After polling the sensor, call the 
//  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
//  or CoAP Server (is this is a Standalone Node).
//  For Collector Node: Start the Listeners for Remote Sensor 
int start_sensor_listener(void);

#ifdef __cplusplus
}
#endif

#endif  //  __LISTEN_SENSOR_H__
