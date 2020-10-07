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
//  Watch Face Definition

/// Barebones Watch Face with no frills
pub struct BarebonesWatchFace {
    /// Label for Time: "12:34"
    pub time_label:      lvgl::Ptr,
    /// Label for Date: "MON 22 MAY 2020"
    pub date_label:      lvgl::Ptr,
    /// Label for Bluetooth State (Bluetooth Icon)
    pub bluetooth_label: lvgl::Ptr,
    /// Label for Power Indicator (Charging & Battery)
    pub power_label:     lvgl::Ptr,
}

impl WatchFace for BarebonesWatchFace {

    ///////////////////////////////////////////////////////////////////////////////
    //  Create Watch Face

    /// Create the widgets for the Watch Face
    fn new(screen: lvgl::Ptr) -> MynewtResult<Self> {
        let watch_face = Self {
            //  Create a Label for Time: "00:00"
            time_label: {
                let lbl = label::create(screen, ptr::null()) ? ;  //  `?` will terminate the function in case of error
                label::set_long_mode(lbl, label::LV_LABEL_LONG_BREAK) ? ;
                label::set_text(     lbl, strn!("00:00")) ? ;  //  strn creates a null-terminated string
                obj::set_width(      lbl, 240) ? ;
                obj::set_height(     lbl, 200) ? ;
                label::set_align(    lbl, label::LV_LABEL_ALIGN_CENTER) ? ;
                obj::align(          lbl, screen, obj::LV_ALIGN_CENTER, 0, -30) ? ;    
                lbl
            },

            //  Create a Label for Date: "MON 22 MAY 2020"
            date_label: {
                let lbl = label::create(screen, ptr::null()) ? ;
                label::set_long_mode(lbl, label::LV_LABEL_LONG_BREAK) ? ;
                obj::set_width(      lbl, 200) ? ;
                obj::set_height(     lbl, 200) ? ;
                label::set_text(     lbl, strn!("")) ? ;  //  strn creates a null-terminated string
                label::set_align(    lbl, label::LV_LABEL_ALIGN_CENTER) ? ;
                obj::align(          lbl, screen, obj::LV_ALIGN_CENTER, 0, 40) ? ;
                lbl
            },

            //  Create a Label for Bluetooth State
            bluetooth_label: {
                let lbl = label::create(screen, ptr::null()) ? ;
                obj::set_width(     lbl, 50) ? ;
                obj::set_height(    lbl, 80) ? ;
                label::set_text(    lbl, strn!("")) ? ;  //  strn creates a null-terminated string
                label::set_recolor( lbl, true) ? ;
                label::set_align(   lbl, label::LV_LABEL_ALIGN_LEFT) ? ;
                obj::align(         lbl, screen, obj::LV_ALIGN_IN_TOP_LEFT, 0, 0) ? ;
                lbl    
            },

            //  Create a Label for Power Indicator
            power_label: {
                let lbl = label::create(screen, ptr::null()) ? ;
                obj::set_width(    lbl, 80) ? ;
                obj::set_height(   lbl, 20) ? ;
                label::set_text(   lbl, strn!("")) ? ;  //  strn creates a null-terminated string
                label::set_recolor(lbl, true) ? ;
                label::set_align(  lbl, label::LV_LABEL_ALIGN_RIGHT) ? ;
                obj::align(        lbl, screen, obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0) ? ;
                lbl
            },
        };
        //  Return the watch face
        Ok(watch_face)
    }

    ///////////////////////////////////////////////////////////////////////////////
    //  Update Watch Face

    /// Update the widgets in the Watch Face with the current state
    fn update(&self, screen: lvgl::Ptr, state: &WatchFaceState) -> MynewtResult<()> {
        //  Populate the Time and Date Labels
        self.update_date_time(screen, state) ? ;

        //  Populate the Bluetooth Label
        self.update_bluetooth(screen, state) ? ;

        //  Populate the Power Label
        self.update_power(screen, state) ? ;
        Ok(())
    }
}

impl BarebonesWatchFace {

    ///////////////////////////////////////////////////////////////////////////////
    //  Update Watch Face

    /// Populate the Time and Date Labels with the time and date
    pub fn update_date_time(&self, _screen: lvgl::Ptr, state: &WatchFaceState) -> MynewtResult<()> {
        //  Create a string buffer to format the time
        static mut TIME_BUF: String = new_string();

        //  Format the time as "12:34" and set the label
        unsafe {                  //  Unsafe because TIME_BUF is a mutable static
            TIME_BUF.clear();     //  Erase the buffer

            write!(
                &mut TIME_BUF,    //  Write the formatted text
                "{:02}:{:02}\0",  //  Must terminate Rust strings with null
                state.time.hour,
                state.time.minute
            ).expect("time fail");

            label::set_text(      //  Set the label
                self.time_label, 
                &to_strn(&TIME_BUF)
            ) ? ;
        }

        //  Get the short day name and short month name
        let day   = get_day_name(&state.time);
        let month = get_month_name(&state.time);

        //  Create a string buffer to format the date
        static mut DATE_BUF: String = new_string();
        
        //  Format the date as "MON 22 MAY 2020" and set the label
        unsafe {                    //  Unsafe because DATE_BUF is a mutable static
            DATE_BUF.clear();       //  Erase the buffer

            write!(
                &mut DATE_BUF,      //  Write the formatted text
                "{} {} {} {}\n\0",  //  Must terminate Rust strings with null
                day,
                state.time.day,
                month,
                state.time.year
            ).expect("date fail");

            label::set_text(        //  Set the label
                self.date_label, 
                &to_strn(&DATE_BUF)
            ) ? ;
        }
        Ok(())
    }    
    
    /// Populate the Bluetooth Label with the Bluetooth State
    pub fn update_bluetooth(&self, _screen: lvgl::Ptr, state: &WatchFaceState) -> MynewtResult<()> {
        if state.bluetooth == BluetoothState::BLUETOOTH_STATE_DISCONNECTED {
            //  If Bluetooth is disconnected, leave the label empty
            label::set_text(
                self.bluetooth_label, 
                strn!("")
            ) ? ;
        } else {
            //  Compute the color of the Bluetooth icon
            let color = 
                match &state.bluetooth {
                    BluetoothState::BLUETOOTH_STATE_INACTIVE     => "#000000",  //  Black
                    BluetoothState::BLUETOOTH_STATE_ADVERTISING  => "#5794f2",  //  Blue
                    BluetoothState::BLUETOOTH_STATE_DISCONNECTED => "#f2495c",  //  Red
                    BluetoothState::BLUETOOTH_STATE_CONNECTED    => "#37872d",  //  Dark Green
                };

                //  Create a string buffer to format the Bluetooth status
            static mut BLUETOOTH_STATUS: String = new_string();

            //  Format the Bluetooth status and set the label
            unsafe {                       //  Unsafe because BLUETOOTH_STATUS is a mutable static
                BLUETOOTH_STATUS.clear();  //  Erase the buffer

                write!(
                    &mut BLUETOOTH_STATUS, //  Write the formatted text
                    "{} \u{F293}#\0",      //  LV_SYMBOL_BLUETOOTH. Must terminate Rust strings with null.
                    color
                ).expect("bt fail");

                label::set_text(           //  Set the label
                    self.bluetooth_label, 
                    &to_strn(&BLUETOOTH_STATUS)
                ) ? ;
            }
        }
        Ok(())
    }

    /// Populate the Power Label with the Power Indicator
    pub fn update_power(&self, screen: lvgl::Ptr, state: &WatchFaceState) -> MynewtResult<()> {
        //  Compute the percentage power
        let percentage = convert_battery_voltage(state.millivolts);

        //  Compute the colour for the charging symbol
        let color =                                                     //  Charging color
            if percentage <= 20                        { "#f2495c" }    //  Low Battery
            else if state.powered && !(state.charging) { "#73bf69" }    //  Full Battery
            else                                       { "#fade2a" };   //  Mid Battery

        let symbol =                         //  Charging symbol
            if state.powered { "\u{F0E7}" }  //  LV_SYMBOL_CHARGE
            else             { " " };

        //  Create a string buffer to format the Power Indicator
        static mut BATTERY_STATUS: String = new_string();

        //  Format thePower Indicator and set the label
        unsafe {                             //  Unsafe because BATTERY_STATUS is a mutable static
            BATTERY_STATUS.clear();          //  Erase the buffer

            write!(
                &mut BATTERY_STATUS, 
                "{} {}%{}#\nRUST ({}mV)\0",  //  Must terminate Rust strings with null
                color,
                percentage,
                symbol,
                state.millivolts
            ).expect("batt fail");

            label::set_text(
                self.power_label, 
                &to_strn(&BATTERY_STATUS)
            ) ? ; 
        }
        obj::align(
            self.power_label, screen, 
            obj::LV_ALIGN_IN_TOP_RIGHT, 0, 0
        ) ? ;
        Ok(())
    }

}

///////////////////////////////////////////////////////////////////////////////
//  Date Time Functions

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

/// Get day short name
pub fn get_day_name(time: & WatchFaceTime) -> String {
    match time.day_of_week {
        0  => String::from("SUN"),
        1  => String::from("MON"),
        2  => String::from("TUE"),
        3  => String::from("WED"),
        4  => String::from("THU"),
        5  => String::from("FRI"),
        6  => String::from("SAT"),
        _  => String::from("???"),
    }
}

///////////////////////////////////////////////////////////////////////////////
//  Battery Functions

/// Convert battery voltage to percentage
pub fn convert_battery_voltage(_voltage: u32) -> i32 {
    50  //  TODO
}

///////////////////////////////////////////////////////////////////////////////
//  Watch Face Trait

pub trait WatchFace {
    /// Create the widgets for the Watch Face
    fn new(screen: lvgl::Ptr) -> MynewtResult<Self>
        where Self: core::marker::Sized;  //  Result type must have known size

    /// Update the widgets in the Watch Face with the current state
    fn update(&self, screen: lvgl::Ptr, state: &WatchFaceState) -> MynewtResult<()>;
}

///////////////////////////////////////////////////////////////////////////////
//  Mynewt Timer Functions

/// Start rendering the watch face every minute
pub fn start_watch_face() -> MynewtResult<()> {
    console::print("Init Rust watch face...\n"); console::flush();

    //  Get active screen from LVGL
    let screen = get_active_screen();

    //  Create the watch face
    unsafe {  //  Unsafe because WATCH_FACE is a mutable static
        WATCH_FACE = BarebonesWatchFace::new(screen) ? ;
    }

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

    //  Get active screen from LVGL
    let screen = get_active_screen();

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
        WATCH_FACE.update(screen, &state)
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
fn get_active_screen() -> lvgl::Ptr {
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

/// Widgets for the watch face
static mut WATCH_FACE: BarebonesWatchFace = fill_zero!(BarebonesWatchFace);

/// Timer that is triggered every minute to update the watch face
static mut WATCH_FACE_CALLOUT: os::os_callout = fill_zero!(os::os_callout);

///////////////////////////////////////////////////////////////////////////////
//  Date Time Functions

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