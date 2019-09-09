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
#include <console/console.h>
#include "util.h"

///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Put common strings here to reduce space.

const char *_gps = "GPS ";  //  Trailer for console output
int debug_gps_l70r = 0;

const char *gps_okfailed(int ok) {
    if (ok) { return " OK\n"; }
    return " FAILED\n";
}

void gps_log(const char *func, int ok) {
    console_printf("%s%s%s", _gps, func, gps_okfailed(ok));
    console_flush();
}
