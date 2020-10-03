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
#include <pinetime_lvgl_mynewt/pinetime_lvgl_mynewt.h>  //  This includes "lvgl.h"

/// Render a watch face. Called by main() in rust/app/src/lib.rs
int create_watch_face(void) {
    console_printf("Create watch face...\n"); console_flush();
    lv_obj_t *btn = lv_btn_create(lv_scr_act(), NULL);     //  Add a button the current screen
    lv_obj_set_pos(btn, 10, 10);                           //  Set its position
    lv_obj_set_size(btn, 120, 50);                         //  Set its size

    lv_obj_t *label = lv_label_create(btn, NULL);          //  Add a label to the button
    lv_label_set_text(label, "Time Sync");                //  Set the label text
    return 0;
}