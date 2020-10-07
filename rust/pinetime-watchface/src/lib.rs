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
//! Watch Face Framework for Rust + Mynewt on PineTime Smart Watch
#![no_std]                              //  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]               //  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]              //  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(proc_macro_hygiene)]         //  Allow Procedural Macros like `run!()`
#![feature(exclusive_range_pattern)]    //  Allow ranges like `0..128` in `match` statements

//  Declare the libraries that contain macros
extern crate mynewt;                    //  Declare the Mynewt library
extern crate macros as mynewt_macros;   //  Declare the Mynewt Procedural Macros library

use core::{
    ptr,
};
use mynewt::{
    fill_zero,
    kernel::os,
    result::*,
    sys::console,
    Strn,
};
use lvgl::{
    core::obj,
};

///////////////////////////////////////////////////////////////////////////////
//  Watch Face Trait

pub trait WatchFace {
    /// Create the widgets for the Watch Face
    fn new() -> MynewtResult<Self>
        where Self: core::marker::Sized;  //  Result type must have known size

    /// Update the widgets in the Watch Face with the current state
    fn update(&self, state: &WatchFaceState) -> MynewtResult<()>;
}

///////////////////////////////////////////////////////////////////////////////
//  Mynewt Timer Functions

/// Start rendering the watch face every minute
pub fn start_watch_face(update_watch_face: UpdateWatchFace) -> MynewtResult<()> {
    console::print("Init Rust watch face...\n"); console::flush();

    //  Save the callback for updating the watch face
    unsafe { UPDATE_WATCH_FACE = Some(update_watch_face); }

    //  Get active screen from LVGL
    let screen = get_active_screen();

    //  Allow touch events
    obj::set_click(screen, true) ? ;

    //  Render the watch face
    let rc = unsafe { pinetime_lvgl_mynewt_render() };
    assert!(rc == 0, "LVGL render fail");    

    //  Set a timer to update the watch face every minute
    unsafe {  //  Unsafe because os_callout_init is a Mynewt C function
        os::os_callout_init(
            &mut WATCH_FACE_CALLOUT,         //  Timer for the watch face
            os::eventq_dflt_get().unwrap(),  //  Use default event queue
            Some(watch_face_callback),       //  Callback function for the timer
            ptr::null_mut()                  //  No argument
        );    
    }

    //  Trigger the watch face timer in 60 seconds
    let rc = unsafe {  //  Unsafe because os_callout_reset is a Mynewt C function
        os::os_callout_reset(
            &mut WATCH_FACE_CALLOUT,   //  Timer for the watch face
            os::OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
        )
    };
    assert!(rc == 0, "Timer fail");
    Ok(())
}

/// Timer callback that is called every minute
extern fn watch_face_callback(_ev: *mut os::os_event) {
    console::print("Update Rust watch face...\n"); console::flush();
    
    //  If there is no callback, fail.
    assert!(unsafe { UPDATE_WATCH_FACE.is_some() }, "Update watch face missing");

    //  Get the system time    
    let time = get_system_time()
        .expect("Can't get system time");

    //  Compose the watch face state
    let state = WatchFaceState {
        time,
        millivolts: 0,     //  TODO: Get current voltage
        charging:   true,  //  TODO: Get charging status
        powered:    true,  //  TODO: Get powered status
        bluetooth:  BluetoothState::BLUETOOTH_STATE_CONNECTED,  //  TODO: Get BLE state
    };

    //  Update the watch face
    unsafe {  //  Unsafe because WATCH_FACE is a mutable static
        UPDATE_WATCH_FACE.unwrap()(&state)
            .expect("Update Watch Face fail");
    }

    //  Render the watch face
    let rc = unsafe { pinetime_lvgl_mynewt_render() };
    assert!(rc == 0, "LVGL render fail");    

    //  Trigger the watch face timer in 60 seconds
    let rc = unsafe {  //  Unsafe because os_callout_reset is a Mynewt C function
        os::os_callout_reset(
            &mut WATCH_FACE_CALLOUT,   //  Timer for the watch face
            os::OS_TICKS_PER_SEC * 60  //  Trigger timer in 60 seconds
        )
    };
    assert!(rc == 0, "Timer fail");
}

/// Get active screen from LVGL
pub fn get_active_screen() -> lvgl::Ptr {
    //  Get active screen from LVGL. We can't call lv_scr_act() because it's an inline function.
    let screen = unsafe {  //  Unsafe because lv_disp_get_scr_act() is an LVGL C function
        lv_disp_get_scr_act( 
            obj::disp_get_default()
                .expect("Failed to get display")
        )
    };
    assert!(!screen.is_null(), "null screen");
    screen
}

/// Timer that is triggered every minute to update the watch face
static mut WATCH_FACE_CALLOUT: os::os_callout = fill_zero!(os::os_callout);

/// Called every minute to update the Watch Face
static mut UPDATE_WATCH_FACE: Option<UpdateWatchFace> = None;

/// Type of callback to update the Watch Face
type UpdateWatchFace = fn (state: &WatchFaceState) -> MynewtResult<()>;

///////////////////////////////////////////////////////////////////////////////
//  Date Time Functions

/// Get the system time
fn get_system_time() -> MynewtResult<WatchFaceTime> {
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
    let result = unsafe {  //  Unsafe because CT is a mutable static
        WatchFaceTime {
            year:        CT.year as u16,  //  Year (4 digit year)
            month:       CT.mon  as  u8,  //  Month (1 - 12)
            day:         CT.day  as  u8,  //  Day (1 - 31)
            hour:        CT.hour as  u8,  //  Hour (0 - 23)
            minute:      CT.min  as  u8,  //  Minute (0 - 59)
            second:      CT.sec  as  u8,  //  Second (0 - 59)
            day_of_week: CT.dow  as  u8,  //  Day of week (0 - 6; 0 = Sunday)
        }
    };
    Ok(result)
}

///////////////////////////////////////////////////////////////////////////////
//  String Definitions

/// Create a new String
pub const fn new_string() -> String {
    heapless::String(heapless::i::String::new())
}

/// Convert a static String to null-terminated Strn
pub fn to_strn(str: &'static String) -> Strn {
    Strn::new(str.as_bytes())
}

/// Limit Strings to 64 chars (which may include multiple color codes like "#ffffff")
pub type String = heapless::String::<heapless::consts::U64>;

///////////////////////////////////////////////////////////////////////////////
//  Watch Face Definitions

/// State for the Watch Face
#[repr(C)]  //  Allow this struct to be passed to C (for WebAssembly integration)
pub struct WatchFaceState {
    /// Current date and time
    pub time:       WatchFaceTime,
    /// Bluetooth state
    pub bluetooth:  BluetoothState,
    /// Current power
    pub millivolts: u32,
    /// True if watch is charging
    pub charging:   bool,
    /// True if watch is powered
    pub powered:    bool,
}

/// Watch Face Time
#[repr(C)]  //  Allow this struct to be passed to C (for WebAssembly integration)
pub struct WatchFaceTime {
    ///  Year (4 digit year)
    pub year:       u16,  
    ///  Month (1 - 12)
    pub month:       u8,  
    ///  Day (1 - 31)
    pub day:         u8,  
    ///  Hour (0 - 23)
    pub hour:        u8,  
    ///  Minute (0 - 59)
    pub minute:      u8,  
    ///  Second (0 - 59)
    pub second:      u8,  
    /// Day of week (0 - 6; 0 = Sunday)
    pub day_of_week: u8,  
}

/// Bluetooth State
#[repr(u8)]           //  Store the enum as 1 byte, so that we can pass this enum to C (for WebAssembly integration)
#[derive(PartialEq)]  //  Allow comparison of enum
#[allow(dead_code)]   //  TODO: Use all enum values
#[allow(non_camel_case_types)]
pub enum BluetoothState {
    /// Bluetooth is inactive
    BLUETOOTH_STATE_INACTIVE     = 0,
    /// Bluetooth is advertising
    BLUETOOTH_STATE_ADVERTISING  = 1,
    /// Bluetooth is disconnected
    BLUETOOTH_STATE_DISCONNECTED = 2,
    /// Bluetooth is connected
    BLUETOOTH_STATE_CONNECTED    = 3,
}

///////////////////////////////////////////////////////////////////////////////
//  Import C APIs

extern {
    /// Render the LVGL display. Defined in libs/pinetime_lvgl_mynewt/src/pinetime/lvgl.c
    fn pinetime_lvgl_mynewt_render() -> i32;

    /// Convert timeval to clocktime. From https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h
    fn timeval_to_clocktime(tv: *const os::os_timeval, tz: *const os::os_timezone, ct: *mut clocktime) -> i32;

    /// Get active screen for LVGL display. From LVGL.
    fn lv_disp_get_scr_act(disp: *mut obj::lv_disp_t) -> lvgl::Ptr;
}

/// Mynewt Clock Time. From https://github.com/apache/mynewt-core/blob/master/time/datetime/include/datetime/datetime.h
#[repr(C)]  //  Allow this struct to be passed to Mynewt in C
struct clocktime {
    year: i32,  //  Year (4 digit year)
    mon:  i32,  //  Month (1 - 12)
    day:  i32,  //  Day (1 - 31)
    hour: i32,  //  Hour (0 - 23)
    min:  i32,  //  Minute (0 - 59)
    sec:  i32,  //  Second (0 - 59)
    dow:  i32,  //  Day of week (0 - 6; 0 = Sunday)
    usec: i32,  //  Micro seconds
}