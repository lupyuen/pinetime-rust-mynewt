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
//! Watch Face in Rust for PineTime with Apache Mynewt OS, based on apps/my_sensor_app/src/watch_face.c
//! See https://lupyuen.github.io/pinetime-rust-riot/articles/watch_face
use core::{
    fmt::Write,
    ptr,
};
use mynewt::{
    fill_zero,
    kernel::os,
    result::*,
    sys::console,
    Strn,
};
use mynewt_macros::strn;
use lvgl::{
    core::obj,
    objx::label,
};

///////////////////////////////////////////////////////////////////////////////
//  Create Watch Face

/// Create the widgets for the Watch Face. Called by create_watch_face() below.
pub fn create_widgets(widgets: &mut WatchFaceWidgets) -> MynewtResult<()> {
    let scr = widgets.screen;
    assert!(!scr.is_null(), "null screen");

    //  Create a label for time (00:00)
    let label1 = label::create(scr, ptr::null()) ? ;  //  `?` will terminate the function in case of error
    label::set_long_mode(label1, label::LV_LABEL_LONG_BREAK) ? ;
    label::set_text(     label1, strn!("00:00")) ? ;  //  strn creates a null-terminated string
    obj::set_width(      label1, 240) ? ;
    obj::set_height(     label1, 200) ? ;
    label::set_align(    label1, label::LV_LABEL_ALIGN_CENTER) ? ;
    obj::align(          label1, scr, obj::LV_ALIGN_CENTER, 0, -30) ? ;
    //  #[cfg(not(target_arch = "wasm32"))]  //  TODO: obj::set_style doesn't work for WebAssembly Simulator
    //  TODO: obj::set_style(label1, unsafe { &style_time }) ? ;  //  Previously: label::set_style
    widgets.time_label = label1;

    //  Create a label for Bluetooth state
    let l_state = label::create(scr, ptr::null()) ? ;
    obj::set_width(     l_state, 50) ? ;
    obj::set_height(    l_state, 80) ? ;
    label::set_text(    l_state, strn!("")) ? ;  //  strn creates a null-terminated string
    label::set_recolor( l_state, true) ? ;
    label::set_align(   l_state, label::LV_LABEL_ALIGN_LEFT) ? ;
    obj::align(         l_state, scr, obj::LV_ALIGN_IN_TOP_LEFT, 0, 0) ? ;
    widgets.ble_label = l_state;

    //  Create a label for Power indicator
    let l_power = label::create(scr, ptr::null()) ? ;
    obj::set_width(    l_power, 80) ? ;
    obj::set_height(   l_power, 20) ? ;
    label::set_text(   l_power, strn!("")) ? ;  //  strn creates a null-terminated string
    label::set_recolor(l_power, true) ? ;
    label::set_align(  l_power, label::LV_LABEL_ALIGN_RIGHT) ? ;
    obj::align(        l_power, scr, obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0) ? ;
    widgets.power_label = l_power;

    //  Create a label for Date
    let label_date = label::create(scr, ptr::null()) ? ;
    label::set_long_mode(label_date, label::LV_LABEL_LONG_BREAK) ? ;
    obj::set_width(      label_date, 200) ? ;
    obj::set_height(     label_date, 200) ? ;
    label::set_text(     label_date, strn!("")) ? ;  //  strn creates a null-terminated string
    label::set_align(    label_date, label::LV_LABEL_ALIGN_CENTER) ? ;
    obj::align(          label_date, scr, obj::LV_ALIGN_CENTER, 0, 40) ? ;
    widgets.date_label = label_date;

    //  Allow touch events
    obj::set_click(scr, true) ? ;
    Ok(())
}

///////////////////////////////////////////////////////////////////////////////
//  Update Watch Face

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
    let percentage = convert_battery_voltage(state.millivolts);
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
    let month_str = get_month_name(&state.time);

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

///////////////////////////////////////////////////////////////////////////////
//  Mynewt Timer Functions

/// Start rendering the watch face every minute
pub fn start_watch_face() -> MynewtResult<()> {
    console::print("Init Rust watch face...\n"); console::flush();

    //  Create the watch face
    ////unsafe { WATCH_FACE_WIDGETS.screen = lv_scr_act() };
    create_widgets(unsafe { &mut WATCH_FACE_WIDGETS }) ? ;

    //  Render the watch face
    let rc = unsafe { pinetime_lvgl_mynewt_render() };
    assert!(rc == 0, "LVGL render fail");    

    //  Set a timer to update the watch face every minute
    unsafe {
        os::os_callout_init(
            &mut WATCH_FACE_CALLOUT,         //  Timer for the watch face
            os::eventq_dflt_get().unwrap(),  //  Use default event queue
            Some(watch_face_callback),       //  Callback function for the timer
            ptr::null_mut()                  //  No argument
        );    
    }

    //  Trigger the timer in 60 seconds
    unsafe {
        os::os_callout_reset(
            &mut WATCH_FACE_CALLOUT,   //  Timer for the watch face
            os::OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
        );    
    }
    Ok(())
}

/// Timer callback that is called every minute
extern fn watch_face_callback(_ev: *mut os::os_event) {
    //  Get the system time    
    let time = get_system_time()
        .expect("Can't get system time");

    //  Compose the watch face state
    let state = WatchFaceState {
        time,
        millivolts: 0,     //  TODO: Get current voltage
        charging:   true,  //  TODO: Get charging status
        powered:    true,  //  TODO: Get powered status
        ble_state:  BleState::BLEMAN_BLE_STATE_CONNECTED,  //  TODO: Get BLE state
    };

    //  Update the watch face
    update_widgets(unsafe { &WATCH_FACE_WIDGETS }, &state)
        .expect("Update Watch Face fail");

    //  Render the watch face
    let rc = unsafe { pinetime_lvgl_mynewt_render() };
    assert!(rc == 0, "LVGL render fail");    

    //  Set the watch face timer
    unsafe {
        os::os_callout_reset(
            &mut WATCH_FACE_CALLOUT,   //  Timer for the watch face
            os::OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
        );    
    }
}

/// Get the system time
pub fn get_system_time() -> MynewtResult<WatchFaceTime> {
    //  Get the system time
    static mut TV: os::os_timeval  = fill_zero!(os::os_timeval);
    static mut TZ: os::os_timezone = fill_zero!(os::os_timezone);
    let rc = unsafe { os::os_gettimeofday(&mut TV, &mut TZ) };
    assert!(rc == 0, "Can't get time");    

    //  Convert the time
    static mut CT: clocktime = fill_zero!(clocktime);
    let rc = unsafe { timeval_to_clocktime(&TV, &TZ, &mut CT) };
    assert!(rc == 0, "Can't convert time");

    //  Return the time
    let result = unsafe {
        WatchFaceTime {
            year:       CT.year as u16,  //  Year (4 digit year)
            month:      CT.mon  as u8,   //  Month (1 - 12)
            dayofmonth: CT.day  as u8,   //  Day (1 - 31)
            hour:       CT.hour as u8,   //  Hour (0 - 23)
            minute:     CT.min  as u8,   //  Minute (0 - 59)
            second:     CT.sec  as u8,   //  Second (0 - 59)
            fracs:      0,               //  Unused
            dayofweek:  CT.dow  as u8,   //  Day of week (0 - 6; 0 = Sunday)
        }
    };
    Ok(result)
}

/// Get month short name
pub fn get_month_name(time: &WatchFaceTime) -> String {
    match time.month {
        1  => String::from("JAN"),
        2  => String::from("FEB"),
        3  => String::from("MAR"),
        4  => String::from("APR"),
        5  => String::from("MAY"),
        6  => String::from("JUN"),
        7  => String::from("JUL"),
        8  => String::from("AUG"),
        9  => String::from("SEP"),
        10 => String::from("OCT"),
        11 => String::from("NOV"),
        12 => String::from("DEC"),
        _  => String::from("???"),
    }
}

/// Convert battery voltage to percentage
pub fn convert_battery_voltage(_voltage: u32) -> i32 {
    50  //  TODO
}

/// Timer that is triggered every minute to update the watch face
static mut WATCH_FACE_CALLOUT: os::os_callout = fill_zero!(os::os_callout);

/// LVGL Widgets for the watch face
static mut WATCH_FACE_WIDGETS: WatchFaceWidgets = fill_zero!(WatchFaceWidgets);

///////////////////////////////////////////////////////////////////////////////
//  String Definitions

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

///////////////////////////////////////////////////////////////////////////////
//  Watch Face Definitions

/// State for the Watch Face, shared between GUI and control. TODO: Sync with widgets/home_time/include/home_time.h
#[repr(C)]
pub struct WatchFaceState {
    pub ble_state:  BleState,  //  bleman_ble_state_t
    pub time:       WatchFaceTime,
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
    BLEMAN_BLE_STATE_INACTIVE     = 0,
    BLEMAN_BLE_STATE_ADVERTISING  = 1,
    BLEMAN_BLE_STATE_DISCONNECTED = 2,
    BLEMAN_BLE_STATE_CONNECTED    = 3,
}

//  TODO: Sync with modules/controller/include/controller/time.h
#[repr(C)]
pub struct WatchFaceTime {
    pub year:       u16,  //  Year (4 digit year)
    pub month:      u8,   //  Month (1 - 12)
    pub dayofmonth: u8,   //  Day (1 - 31)
    pub hour:       u8,   //  Hour (0 - 23)
    pub minute:     u8,   //  Minute (0 - 59)
    pub second:     u8,   //  Second (0 - 59)
    pub fracs:      u8,   //  Unused
    pub dayofweek:  u8,   //  Day of week (0 - 6; 0 = Sunday)
}

///////////////////////////////////////////////////////////////////////////////
//  Export C API for Watch Face

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

///////////////////////////////////////////////////////////////////////////////
//  Import C APIs

extern {
    /// Render the LVGL display. Defined in libs/pinetime_lvgl_mynewt/src/pinetime/lvgl.c
    fn pinetime_lvgl_mynewt_render() -> i32;
    /// Convert timeval to clocktime. From https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h
    fn timeval_to_clocktime(tv: *const os::os_timeval, tz: *const os::os_timezone, ct: *mut clocktime) -> i32;
    /// Style for the Time Label
    #[allow(dead_code)]
    static style_time: obj::lv_style_t;
}

/// Mynewt Clock Time. From https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h
#[repr(C)]
#[allow(non_camel_case_types)]
pub struct clocktime {
    pub year: i32,  //  Year (4 digit year)
    pub mon:  i32,  //  Month (1 - 12)
    pub day:  i32,  //  Day (1 - 31)
    pub hour: i32,  //  Hour (0 - 23)
    pub min:  i32,  //  Minute (0 - 59)
    pub sec:  i32,  //  Second (0 - 59)
    pub dow:  i32,  //  Day of week (0 - 6; 0 = Sunday)
    pub usec: i32,  //  Micro seconds
}