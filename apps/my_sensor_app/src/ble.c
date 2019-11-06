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
//  Bluetooth LE Functions. Based on https://mynewt.apache.org/latest/tutorials/ble/ibeacon.html
#include "sysinit/sysinit.h"
#include "os/os.h"
#include "console/console.h"
#include "host/ble_hs.h"

static void ble_app_on_sync(void);
static void ble_app_set_addr(void);
static void ble_app_advertise(void);

int start_ble(void) {
    //  Set the callback for starting Bluetooth LE.
    ble_hs_cfg.sync_cb = ble_app_on_sync;
    return 0;
}

static void ble_app_on_sync(void) {
    //  Called upon starting Bluetooth LE.
    //  Generate a non-resolvable private address.
    ble_app_set_addr();

    //  Advertise indefinitely as an iBeacon.
    ble_app_advertise();
}

static void ble_app_set_addr(void) {
    //  Generate a non-resolvable private address.
    ble_addr_t addr;
    int rc;

    rc = ble_hs_id_gen_rnd(1, &addr);
    assert(rc == 0);

    rc = ble_hs_id_set_rnd(addr.val);
    assert(rc == 0);
}

static void ble_app_advertise(void) {
    //  Advertise indefinitely as an iBeacon.
    struct ble_gap_adv_params adv_params;
    uint8_t uuid128[16];
    int rc;

    //  Arbitrarily set the UUID to a string of 0x11 bytes.
    memset(uuid128, 0x11, sizeof uuid128);

    //  Set iBeacon parameters: Major=2, Minor=10, RSSI=-60.
    //  RSSI is the Measured Power ranging data (Calibrated tx power at 1 meters). Must be > -126 and < 20.
    rc = ble_ibeacon_set_adv_data(uuid128, 2, 10, -60);  //  TODO: Verify RSSI for your device.
    assert(rc == 0);

    //  Begin advertising as an iBeacon.
    adv_params = (struct ble_gap_adv_params){ 0 };
    rc = ble_gap_adv_start(BLE_OWN_ADDR_RANDOM, NULL, BLE_HS_FOREVER,
                           &adv_params, NULL, NULL);
    assert(rc == 0);
}
