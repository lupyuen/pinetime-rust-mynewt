# `temp_stm32`

Mynewt Driver for STM32 internal temperature sensor. For STM32F1 (Blue Pill),
the temperature sensor is accessed via port ADC1, channel 16.

This driver works exactly like a regular temperature sensor driver, e.g. BME280.
It supports Mynewt sensor listeners.

This package depends on `adc_stm32f1`, the ADC driver for STM32F1, located in the parent folder.
