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
//  Watch Face for PineTime on Mynewt
#include <assert.h>
#include <os/os.h>
#include <console/console.h>
#include <datetime/datetime.h>
#include <pinetime_lvgl_mynewt/pinetime_lvgl_mynewt.h>  //  This includes "lvgl.h"

int pinetime_lvgl_mynewt_render(void);  //  TODO: Move to pinetime_lvgl_mynewt.h
static void watch_face_callback(struct os_event *ev);

static lv_obj_t *btn;    //  Button
static lv_obj_t *label;  //  Label
static struct os_callout watch_face_callout;  //  Timer that is triggered every minute

/// Render a watch face. Called by main() in rust/app/src/lib.rs
int create_watch_face(void) {
    console_printf("Create watch face...\n"); console_flush();
    btn = lv_btn_create(lv_scr_act(), NULL);     //  Add a button the current screen
    lv_obj_set_pos(btn, 10, 10);                 //  Set its position
    lv_obj_set_size(btn, 220, 50);               //  Set its size

    label = lv_label_create(btn, NULL);          //  Add a label to the button
    lv_label_set_text(label, "Time Sync");       //  Set the label text

    //  Set a timer to update the watch face every minute
    //  TODO: Move this code to the caller
    os_callout_init(
        &watch_face_callout,   //  Timer for the watch face
        os_eventq_dflt_get(),  //  Use default event queue
        watch_face_callback,   //  Callback function for the timer
        NULL
    );
    //  Trigger the timer in 60 seconds
    os_callout_reset(
        &watch_face_callout,   //  Timer for the watch face
        OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
    );
    return 0;
}

/// Update the watch face
int update_watch_face(void) {
    console_printf("Update watch face...\n"); console_flush();
    //  If button or label not created, quit
    if (btn == NULL || label == NULL) { return 1; }

    //  Get the system time
    struct os_timeval tv;
    struct os_timezone tz;
    int rc = os_gettimeofday(&tv, &tz);
    if (rc != 0) { console_printf("Can't get time: %d\n", rc); return 2; }

    //  Convert the time
    struct clocktime ct;
    rc = timeval_to_clocktime(&tv, &tz, &ct);
    if (rc != 0) { console_printf("Can't convert time: %d\n", rc); return 3; }

    //  Format the time as 2020-10-04T13:20:26.839843+00:00
    char buf[50];
    rc = datetime_format(&tv, &tz, buf, sizeof(buf));
    if (rc != 0) { console_printf("Can't format time: %d\n", rc); return 4; }

    //  Truncate after minute: 2020-10-04T13:20
    buf[16] = 0;

    //  Set the label text
    lv_label_set_text(label, buf);
    return 0;
}

/// Timer callback that is called every minute
static void watch_face_callback(struct os_event *ev) {
    assert(ev != NULL);

    //  Update the watch face
    update_watch_face();

    //  Render the watch face
    pinetime_lvgl_mynewt_render();

    //  Set the watch face timer
    os_callout_reset(
        &watch_face_callout,   //  Timer for the watch face
        OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
    );
}

#ifdef NOTUSED
Debug Log:
TMP create temp_stub_0
NET hwid 4a f8 cf 95 6a be c1 f6 89 ba 12 1a 
NET standalone node 
Init LVGL...
Create watch face...
Render LVGL display...
Flush display: left=0, top=0, right=239, bottom=9...
Flush display: left=0, top=10, right=239, bottom=19...
Flush display: left=0, top=20, right=239, bottom=29...
Flush display: left=0, top=30, right=239, bottom=39...
Flush display: left=0, top=40, right=239, bottom=49...
Flush display: left=0, top=50, right=239, bottom=59...
Flush display: left=0, top=60, right=239, bottom=69...
Flush display: left=0, top=70, right=239, bottom=79...
Flush display: left=0, top=80, right=239, bottom=89...
Flush display: left=0, top=90, right=239, bottom=99...
Remote PineTime Log
Flush display: left=0, top=100, right=239, bottom=109...
Flush display: left=0, top=110, right=239, bottom=119...
Flush display: left=0, top=120, right=239, bottom=129...
Flush display: left=0, top=130, right=239, bottom=139...
Flush display: left=0, top=140, right=239, bottom=149...
Flush display: left=0, top=150, right=239, bottom=159...
Flush display: left=0, top=160, right=239, bottom=169...
Flush display: left=0, top=170, right=239, bottom=179...
Flush display: left=0, top=180, right=239, bottom=189...
Flush display: left=0, top=190, right=239, bottom=199...
Flush display: left=0, top=200, right=239, bottom=209...
Flush display: left=0, top=210, right=239, bottom=219...
Flush display: left=0, top=220, right=239, bottom=229...
Flush display: left=0, top=230, right=239, bottom=239...
Starting BLE...
BLE started
Render LVGL display...
Remote PineTime Log
Flush display: left=63, top=27, right=196, bottom=42...
Remote PineTime Log
connection established; status=0 handle=1 our_ota_addr_type=1 our_ota_addr= our_id_addr_type=1 our_id_addr= peer_ota_addr_type=1 peer_ota_addr= peer_id_addr_type=1 peer_id_addr= conn_itvl=36 conn_latency=0 supervision_timeout=500 encrypted=0 authenticated=0 bonded=0
connection updated; status=0 handle=1 our_ota_addr_type=1 our_ota_addr= our_id_addr_type=1 our_id_addr= peer_ota_addr_type=1 peer_ota_addr= peer_id_addr_type=1 peer_id_addr= conn_itvl=6 conn_latency=0 supervision_timeout=500 encrypted=0 authenticated=0 bonded=0
Service discovery complete; status=0 conn_handle=1
Read complete; status=0 conn_handle=1 attr_handle=67 value=e4 07 0a 04 0e 05 29 07 87 00 
Current Time: 2020-10-04T14:05:41.527343+00:00
connection updated; status=0 handle=1 our_ota_addr_type=1 our_ota_addr= our_id_addr_type=1 our_id_addr= peer_ota_addr_type=1 peer_ota_addr= peer_id_addr_type=1 peer_id_addr= conn_itvl=36 conn_latency=0 supervision_timeout=500 encrypted=0 authenticated=0 bonded=0
disconnect; reason=531 handle=1 our_ota_addr_type=1 our_ota_addr= our_id_addr_type=1 our_id_addr= peer_ota_addr_type=1 peer_ota_addr= peer_id_addr_type=1 peer_id_addr= conn_itvl=36 conn_latency=0 supervision_timeout=500 encrypted=0 authenticated=0 bonded=0
Remote PineTime Log
Render LVGL display...
Remote PineTime Log
Flush display: left=60, top=27, right=183, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=59, top=27, right=181, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=59, top=27, right=180, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=59, top=27, right=181, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=59, top=27, right=180, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=59, top=27, right=180, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=61, top=27, right=178, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=62, top=27, right=179, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=62, top=27, right=178, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=61, top=27, right=179, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=61, top=27, right=178, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=61, top=27, right=179, bottom=42...
Remote PineTime Log
Render LVGL display...
Flush display: left=61, top=27, right=178, bottom=42...
Remote PineTime Log
#endif  //  NOTUSED