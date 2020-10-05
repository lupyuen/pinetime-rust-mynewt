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
//! Watch Face in Rust for PineTime with Apache Mynewt OS. See https://lupyuen.github.io/pinetime-rust-riot/articles/watch_face
use core::{
    fmt::Write,
    ptr,
};
use mynewt::{
    result::*,
    //  sys::console,
    Strn,
};
use mynewt_macros::strn;
use lvgl::{
    core::obj,
    objx::label,
};

/// Create the widgets for the Watch Face. Called by create_watch_face() below.
pub fn create_widgets(widgets: &mut WatchFaceWidgets) -> MynewtResult<()> {
    let scr = widgets.screen;
    assert!(!scr.is_null(), "null screen");

    //  Create a label for time (00:00)
    let label1 = label::create(scr, ptr::null()) ? ;  //  `?` will terminate the function in case of error
    label::set_long_mode(label1, label::LV_LABEL_LONG_BREAK) ? ;
    label::set_text(label1, strn!("00:00")) ? ;  //  strn creates a null-terminated string
    obj::set_width(label1, 240) ? ;
    obj::set_height(label1, 200) ? ;
    label::set_align(label1, label::LV_LABEL_ALIGN_CENTER) ? ;
    obj::align(label1, scr, obj::LV_ALIGN_CENTER, 0, -30) ? ;
    //  #[cfg(not(target_arch = "wasm32"))]  //  TODO: obj::set_style doesn't work for WebAssembly Simulator
    //  TODO: obj::set_style(label1, unsafe { &style_time }) ? ;  //  Previously: label::set_style
    widgets.time_label = label1;

    //  Create a label for Bluetooth state
    let l_state = label::create(scr, ptr::null()) ? ;
    obj::set_width(l_state, 50) ? ;
    obj::set_height(l_state, 80) ? ;
    label::set_text(l_state, strn!("")) ? ;  //  strn creates a null-terminated string
    label::set_recolor(l_state, true) ? ;
    label::set_align(l_state, label::LV_LABEL_ALIGN_LEFT) ? ;
    obj::align(l_state, scr, obj::LV_ALIGN_IN_TOP_LEFT, 0, 0) ? ;
    widgets.ble_label = l_state;

    //  Create a label for Power indicator
    let l_power = label::create(scr, ptr::null()) ? ;
    obj::set_width(l_power, 80) ? ;
    obj::set_height(l_power, 20) ? ;
    label::set_text(l_power, strn!("")) ? ;  //  strn creates a null-terminated string
    label::set_recolor(l_power, true) ? ;
    label::set_align(l_power, label::LV_LABEL_ALIGN_RIGHT) ? ;
    obj::align(l_power, scr, obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0) ? ;
    widgets.power_label = l_power;

    //  Create a label for Date
    let label_date = label::create(scr, ptr::null()) ? ;
    label::set_long_mode(label_date, label::LV_LABEL_LONG_BREAK) ? ;
    obj::set_width(label_date, 200) ? ;
    obj::set_height(label_date, 200) ? ;
    label::set_text(label_date, strn!("")) ? ;  //  strn creates a null-terminated string
    label::set_align(label_date, label::LV_LABEL_ALIGN_CENTER) ? ;
    obj::align(label_date, scr, obj::LV_ALIGN_CENTER, 0, 40) ? ;
    widgets.date_label = label_date;

    //  Allow touch events
    obj::set_click(scr, true) ? ;
    Ok(())
}

/// Update the widgets in the Watch Face with the current state. Called by update_watch_face() below.
pub fn update_widgets(widgets: &WatchFaceWidgets, state: &WatchFaceState) -> MynewtResult<()> {
    set_time_label(widgets, state) ? ;
    set_bt_label(widgets, state) ? ;
    set_power_label(widgets, state) ? ;
    Ok(())
}

/// Populate the Bluetooth Label with the Bluetooth status. Called by screen_time_update_screen() above.
pub fn set_bt_label(widgets: &WatchFaceWidgets, state: &WatchFaceState) -> MynewtResult<()> {
    if state.ble_state == BleState::BLEMAN_BLE_STATE_DISCONNECTED {
        label::set_text(
            widgets.ble_label, 
            strn!("")
        ) ? ;
    } else {
        //  Get the color of the Bluetooth icon
        let color = 
            match &state.ble_state {
                BleState::BLEMAN_BLE_STATE_INACTIVE     => "#000000",  //  Black
                BleState::BLEMAN_BLE_STATE_DISCONNECTED => "#f2495c",  //  GUI_COLOR_LBL_BASIC_RED
                BleState::BLEMAN_BLE_STATE_ADVERTISING  => "#5794f2",  //  GUI_COLOR_LBL_BASIC_BLUE
                BleState::BLEMAN_BLE_STATE_CONNECTED    => "#37872d",  //  GUI_COLOR_LBL_DARK_GREEN
            };
        //  Create a string buffer to format the Bluetooth status
        static mut BLUETOOTH_STATUS: String = new_string();
        //  Format the Bluetooth status and set the label
        unsafe {  //  Unsafe because BLUETOOTH_STATUS is a mutable static
            BLUETOOTH_STATUS.clear();
            write!(
                &mut BLUETOOTH_STATUS, 
                "{} \u{F293}#\0",  //  LV_SYMBOL_BLUETOOTH. Must terminate Rust strings with null.
                color
            ).expect("bt fail");
            label::set_text(
                widgets.ble_label, 
                &to_strn(&BLUETOOTH_STATUS)
            ) ? ;
        }
    }
    Ok(())
}

/// Populate the Power Label with the battery status. Called by screen_time_update_screen() above.
pub fn set_power_label(widgets: &WatchFaceWidgets, state: &WatchFaceState) -> MynewtResult<()> {
    let percentage = unsafe { hal_battery_get_percentage(state.millivolts) };
    let color =   //  Charging color
        if percentage <= 20  //  battery_low 
            { "#f2495c" }    //  battery_low_color
        else if state.powered && !(state.charging) 
            { "#73bf69" }    //  battery_full_color: Battery charge cycle finished
        else 
            { "#fade2a" };   //  battery_mid_color
    let symbol =  //  Charging symbol
        if state.powered { "\u{F0E7}" }  //  LV_SYMBOL_CHARGE
        else { " " };
    //  Create a string buffer to format the battery status
    static mut BATTERY_STATUS: String = new_string();
    //  Format the battery status and set the label
    unsafe {  //  Unsafe because BATTERY_STATUS is a mutable static
        BATTERY_STATUS.clear();
        write!(
            &mut BATTERY_STATUS, 
            "{} {}%{}#\nRUST ({}mV)\0",  //  Must terminate Rust strings with null
            color,
            percentage,
            symbol,
            state.millivolts
        ).expect("batt fail");
        label::set_text(
            widgets.power_label, 
            &to_strn(&BATTERY_STATUS)
        ) ? ; 
    }
    obj::align(
        widgets.power_label, widgets.screen, 
        obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0
    ) ? ;
    Ok(())
}

/// Populate the Time and Date Labels with the time and date. Called by screen_time_update_screen() above.
pub fn set_time_label(widgets: &WatchFaceWidgets, state: &WatchFaceState) -> MynewtResult<()> {
    //  Create a string buffer to format the time
    static mut TIME_BUF: String = new_string();
    //  Format the time and set the label
    unsafe {  //  Unsafe because TIME_BUF is a mutable static
        TIME_BUF.clear();
        write!(
            &mut TIME_BUF, 
            "{:02}:{:02}\0",  //  Must terminate Rust strings with null
            state.time.hour,
            state.time.minute
        ).expect("time fail");
        label::set_text(
            widgets.time_label, 
            &to_strn(&TIME_BUF)
        ) ? ;
    }

    //  Get the short month name
    let month_cstr = unsafe { controller_time_month_get_short_name(&state.time) };  //  Returns null-terminated C string
    assert!(!month_cstr.is_null(), "month null");
    let month_str = unsafe { cstr_core::CStr::from_ptr(month_cstr).to_str() }       //  Convert C string to Rust string
        .expect("month fail");

    //  Create a string buffer to format the date
    static mut DATE_BUF: String = new_string();
    //  Format the date and set the label
    unsafe {  //  Unsafe because DATE_BUF is a mutable static
        DATE_BUF.clear();
        write!(
            &mut DATE_BUF, 
            "{} {} {}\n\0",  //  Must terminate Rust strings with null
            state.time.dayofmonth,
            month_str,
            state.time.year
        ).expect("date fail");
        label::set_text(
            widgets.date_label, 
            &to_strn(&DATE_BUF)
        ) ? ;
    }
    Ok(())
}

/// Create the Watch Face, populated with widgets. Called by _screen_time_create() in screen_time.c.
#[no_mangle]  //  Don't mangle the function name
extern "C" fn create_watch_face(widgets: *mut WatchFaceWidgets) -> i32 {  //  Declare extern "C" because it will be called by RIOT OS firmware
    assert!(!widgets.is_null(), "widgets null");
    unsafe { create_widgets(&mut *widgets) }
        .expect("create_screen fail");
    0  //  Return OK
}

/// Populate the Watch Face with the current status. Called by _screen_time_update_screen() in screen_time.c.
#[no_mangle]  //  Don't mangle the function name
extern "C" fn update_watch_face(widgets: *const WatchFaceWidgets, state: *const WatchFaceState) -> i32 {
    assert!(!widgets.is_null(), "widgets null");
    unsafe { update_widgets(&*widgets, &*state) }
        .expect("update_widgets fail");
    0  //  Return OK
}

/// Create a new String
const fn new_string() -> String {
    heapless::String(heapless::i::String::new())
}

/// Convert a static String to null-terminated Strn
fn to_strn(str: &'static String) -> Strn {
    Strn::new(str.as_bytes())
}

/// Limit Strings to 64 chars (which may include multiple color codes like "#ffffff")
type String = heapless::String::<heapless::consts::U64>;

/// State for the Watch Face, shared between GUI and control. TODO: Sync with widgets/home_time/include/home_time.h
#[repr(C)]
pub struct WatchFaceState {
    pub ble_state:  BleState,  //  bleman_ble_state_t
    pub time:       controller_time_spec_t,
    pub millivolts: u32,
    pub charging:   bool,
    pub powered:    bool,
}

/// Widgets for the Watch Face, private to Rust. TODO: Sync with widgets/home_time/include/home_time.h
#[repr(C)]
#[allow(non_camel_case_types)]
pub struct WatchFaceWidgets {
    pub screen:      *mut obj::lv_obj_t,  //  TODO: Shared with home_time_widget_t
    pub time_label:  *mut obj::lv_obj_t,  //  TODO: Should be private to Rust
    pub date_label:  *mut obj::lv_obj_t,  //  TODO: Should be private to Rust
    pub ble_label:   *mut obj::lv_obj_t,  //  TODO: Should be private to Rust
    pub power_label: *mut obj::lv_obj_t,  //  TODO: Should be private to Rust
}

//  TODO: Sync with modules/bleman/include/bleman.h
#[repr(u8)]
#[derive(PartialEq)]
#[allow(non_camel_case_types)]
#[allow(dead_code)]
pub enum BleState {  //  bleman_ble_state_t
    BLEMAN_BLE_STATE_INACTIVE = 0,
    BLEMAN_BLE_STATE_ADVERTISING = 1,
    BLEMAN_BLE_STATE_DISCONNECTED = 2,
    BLEMAN_BLE_STATE_CONNECTED = 3,
}

//  TODO: Sync with modules/controller/include/controller/time.h
#[repr(C)]
#[allow(non_camel_case_types)]
pub struct controller_time_spec_t {
    pub year:       u16,
    pub month:      u8,
    pub dayofmonth: u8,
    pub hour:       u8,
    pub minute:     u8,
    pub second:     u8,
    pub fracs:      u8,
}

/// Import C APIs
extern {
    //  TODO: Sync with modules/hal/include/hal.h
    fn hal_battery_get_percentage(voltage: u32) -> i32;
    //  TODO: Sync with modules/controller/include/controller/time.h
    fn controller_time_month_get_short_name(time: *const controller_time_spec_t) -> *const ::cty::c_char;
    /// Style for the Time Label. TODO: Sync with widgets/home_time/screen_time.c
    #[allow(dead_code)]
    static style_time: obj::lv_style_t;
}

/*
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
*/