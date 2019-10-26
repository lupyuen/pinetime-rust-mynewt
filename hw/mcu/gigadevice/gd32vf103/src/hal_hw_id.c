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
//  Based on repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/stm32_hw_id.c

#include <inttypes.h>
#include <string.h>

#include "mcu/gd32vf103_hal.h"
#include <hal/hal_bsp.h>

#ifndef min
#define min(a, b) ((a)<(b)?(a):(b))
#endif

#define GD32VF103_HW_ID_LEN     12

int
hal_bsp_hw_id_len(void)
{
    return GD32VF103_HW_ID_LEN;
}

int
hal_bsp_hw_id(uint8_t *id, int max_len)
{
    int cnt;

    cnt = min(GD32VF103_HW_ID_LEN, max_len);
    memcpy(id, (void *)UID_BASE, cnt);

    return cnt;
}
