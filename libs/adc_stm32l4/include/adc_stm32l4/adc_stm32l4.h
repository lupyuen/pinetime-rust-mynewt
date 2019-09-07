/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#ifndef __ADC_STM32L4_H__
#define __ADC_STM32L4_H__

#include <adc/adc.h>

#ifdef __cplusplus
extern "C" {
#endif

#define MYNEWT_ADC_CHANNEL_COUNT       19  //  Total 19 channels
#define MYNEWT_ADC_CHANNEL_0           ( 0x00000000U)
#define MYNEWT_ADC_CHANNEL_1           ( 0x00000001U)
#define MYNEWT_ADC_CHANNEL_2           ( 0x00000002U)
#define MYNEWT_ADC_CHANNEL_3           ( 0x00000003U)
#define MYNEWT_ADC_CHANNEL_4           ( 0x00000004U)
#define MYNEWT_ADC_CHANNEL_5           ( 0x00000005U)
#define MYNEWT_ADC_CHANNEL_6           ( 0x00000006U)
#define MYNEWT_ADC_CHANNEL_7           ( 0x00000007U)
#define MYNEWT_ADC_CHANNEL_8           ( 0x00000008U)
#define MYNEWT_ADC_CHANNEL_9           ( 0x00000009U)
#define MYNEWT_ADC_CHANNEL_10          ( 0x0000000AU)
#define MYNEWT_ADC_CHANNEL_11          ( 0x0000000BU)
#define MYNEWT_ADC_CHANNEL_12          ( 0x0000000CU)
#define MYNEWT_ADC_CHANNEL_13          ( 0x0000000DU)
#define MYNEWT_ADC_CHANNEL_14          ( 0x0000000EU)
#define MYNEWT_ADC_CHANNEL_15          ( 0x0000000FU)
#define MYNEWT_ADC_CHANNEL_16          ( 0x00000010U)
#define MYNEWT_ADC_CHANNEL_17          ( 0x00000011U)
#define MYNEWT_ADC_CHANNEL_18          ( 0x00000012U)
#define MYNEWT_ADC_CHANNEL_VREFINT     MYNEWT_ADC_CHANNEL_0
#define MYNEWT_ADC_CHANNEL_TEMPSENSOR  MYNEWT_ADC_CHANNEL_17
#define MYNEWT_ADC_CHANNEL_VBAT        MYNEWT_ADC_CHANNEL_18

//  STM32L4 ADC1 device name
#define STM32L4_ADC1_DEVICE "adc1"

/* Mynewt HAL Port pin mapping */
#define ADC123_CH0_PIN    0
#define ADC123_CH1_PIN    1
#define ADC123_CH2_PIN    2
#define ADC123_CH3_PIN    3
#define ADC12_CH4_PIN     4
#define ADC12_CH5_PIN     5
#define ADC12_CH6_PIN     6
#define ADC12_CH7_PIN     7
#define ADC12_CH8_PIN     16
#define ADC12_CH9_PIN     17
#define ADC3_CH4_PIN      86
#define ADC3_CH5_PIN      87
#define ADC3_CH6_PIN      88
#define ADC3_CH7_PIN      89
#define ADC3_CH8_PIN      90
#define ADC3_CH9_PIN      83
#define ADC123_CH10_PIN   32
#define ADC123_CH11_PIN   33
#define ADC123_CH12_PIN   34
#define ADC123_CH13_PIN   35
#define ADC12_CH14_PIN    36
#define ADC12_CH15_PIN    37
#define ADC3_CH14_PIN     84
#define ADC3_CH15_PIN     85

struct stm32l4_adc_dev_cfg {
    uint8_t sac_chan_count;
    void *sac_chans;
    void *primarybuf;
    void *secondarybuf;
    int buflen;
    ADC_HandleTypeDef *sac_adc_handle;
};

//  Create the STM32L4 ADC1 device.  Implemented in creator.c, function DEVICE_CREATE().
void stm32l4_adc_create(void);

//  Initialise the STM32L4 ADC device with the configuration.
int stm32l4_adc_dev_init(struct os_dev *dev, void *cfg);

#ifdef __cplusplus
}
#endif

#endif /* __ADC_STM32L4_H__ */
