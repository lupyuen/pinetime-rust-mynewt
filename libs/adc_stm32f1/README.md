# `adc_stm32f1`

Mynewt Driver for ADC on STM32F1 (Blue Pill). Only blocking reads are implemented,
not DMA.  It works for accessing the internal temperature sensor at port ADC1, channel 16.

This driver is derived from the STM32F4 ADC driver.  This driver is used by
`temp_stm32`, the STM32 internal temperature sensor driver, located in the parent folder.
