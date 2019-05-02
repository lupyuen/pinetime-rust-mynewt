# `temp_stm32`

Mynewt Driver for STM32 internal temperature sensor. For STM32F1 (Blue Pill),
the temperature sensor is accessed via port ADC1, channel 16.

This driver works exactly like a regular temperature sensor driver, e.g. BME280.
It supports Mynewt sensor listeners.

The driver provides the computed temperature in degrees Celsius (floating-point, 2 decimal places), and the raw temperature (integer, 0 to 4095) if RAW_TEMP is set to 1 in the application's syscfg.yml.

This package depends on `adc_stm32f1`, the ADC driver for STM32F1, located in the parent folder.
