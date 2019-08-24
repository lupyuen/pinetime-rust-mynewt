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
//  Power Management Functions
#ifndef __APP_POWER_H__
#define __APP_POWER_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

/**
 * Reboot reason. Same as hal_reset_reason, except we add RESET_STANDBY.
 */
enum power_reset_reason {
    /** Power on Reset */
    POWER_RESET_POR = 1,
    /** Caused by Reset Pin */
    POWER_RESET_PIN = 2,
    /** Caused by Watchdog */
    POWER_RESET_WATCHDOG = 3,
    /** Soft reset, either system reset or crash */
    POWER_RESET_SOFT = 4,
    /** Low supply voltage */
    POWER_RESET_BROWNOUT = 5,
    /** Restart due to user request */
    POWER_RESET_REQUESTED = 6,
    /** Added: Restart due to exit from standby mode */
    POWER_RESET_STANDBY = 7,
};

void pwr_disable_backup_domain_write_protect(void);
enum power_reset_reason power_reset_cause(void);

#ifdef __cplusplus
}
#endif
#endif  //  __APP_POWER_H__