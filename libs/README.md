<!--
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#  KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
-->

# `libs`: Custom Libraries and Drivers for Mynewt

1. [`adc_stm32f1`](adc_stm32f1): Mynewt Driver for ADC on STM32 F103 (Blue Pill). Used by `temp_stm32` internal temperature sensor.

1. [`adc_stm32l4`](adc_stm32l4): Mynewt Driver for ADC on STM32 L476. Used by `temp_stm32` internal temperature sensor.

1. [`bc95g`](bc95g): Mynewt Driver for Quectel BC95 NB-IoT module

1. [`buffered_serial`](buffered_serial): Buffered Serial Library used by `bc95g` NB-IoT driver and `gps_l70r` GPS driver

1. [`custom_sensor`](custom_sensor): Custom Sensor Definitions for Raw Temperature and Geolocation

1. [`esp8266`](esp8266): Mynewt Driver for ESP8266 WiFi module

1. [`gps_l70r`](gps_l70r): Mynewt Driver for Quectel L70-R GPS module

1. [`hmac_prng`](hmac_prng): HMAC pseudorandom number generator with entropy based on internal temperature sensor

1. [`low_power`](low_power): Low Power functions for STM32 F103 (Blue Pill)

1. [`mynewt_rust`](mynewt_rust): Helper functions for hosting Rust on Mynewt

1. [`nrf24l01`](nrf24l01): Mynewt Driver for nRF24L01

1. [`remote_sensor`](remote_sensor): Mynewt Driver for Remote Sensor

1. [`rust_app`](rust_app): Stub library that will be replaced by the compiled Rust application and Rust crates

1. [`rust_libcore`](rust_libcore): Stub library that will be replaced by the Rust Core Library

1. [`semihosting_console`](semihosting_console): Mynewt Console for Arm Semihosting

1. [`sensor_coap`](sensor_coap): Sensor CoAP Library

1. [`sensor_network`](sensor_network): Sensor Network Library

1. [`temp_stm32`](temp_stm32): Mynewt Driver for Internal Temperature Sensor on STM32

1. [`temp_stub`](temp_stub): Mynewt Driver for Stub Temperature Sensor that returns a fixed value

1. [`tiny_gps_plus`](tiny_gps_plus): TinyGPS++ Library ported from Arduino. Used by `gps_l70r` GPS driver.