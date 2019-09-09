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
#ifndef __GPS_L70R_UTIL_H__
#define __GPS_L70R_UTIL_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Common strings here to reduce space

//  Return " OK\n" if ok, else return " FAILED\n".
const char *gps_okfailed(int ok);

//  Log a message to the console like: "NBT func OK" or "NBT func failed". Flush the console after logging.
void gps_log(const char *func, int ok);

extern const char *_gps;  //  Trailer for console output: "GPS "
extern int debug_gps_l70r;   //  Set to non-zero for debug mode

#ifdef __cplusplus
}
#endif

#endif /* __GPS_L70R_UTIL_H__ */
