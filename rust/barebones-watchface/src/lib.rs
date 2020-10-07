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
//! Barebones Watch Face for Rust + Mynewt on PineTime Smart Watch
#![no_std]                              //  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]               //  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]              //  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(proc_macro_hygiene)]         //  Allow Procedural Macros like `run!()`
#![feature(exclusive_range_pattern)]    //  Allow ranges like `0..128` in `match` statements

//  Declare the libraries that contain macros
extern crate mynewt;                    //  Declare the Mynewt library
extern crate macros as mynewt_macros;   //  Declare the Mynewt Procedural Macros library

use core::{
    fmt::Write,
    ptr,
};
use mynewt::{
    result::*,
    Strn,
};
use mynewt_macros::strn;
use watchface::{
    BluetoothState,
    String,
    WatchFace,
    WatchFaceState,
    WatchFaceTime,
    new_string,
    to_strn,
};
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
    fn new() -> MynewtResult<Self> {
        //  Get the active screen
        let screen = watchface::get_active_screen();

        //  Create the widgets
        let watch_face = Self {
            //  Create a Label for Time: "00:00"
            time_label: {
                let lbl = label::create(screen, ptr::null()) ? ;  //  `?` will terminate the function in case of error
                label::set_long_mode(lbl, label::LV_LABEL_LONG_BREAK) ? ;
                label::set_text(     lbl, strn!("00:00")) ? ;     //  strn creates a null-terminated string
                obj::set_width(      lbl, 240) ? ;
                obj::set_height(     lbl, 200) ? ;
                label::set_align(    lbl, label::LV_LABEL_ALIGN_CENTER) ? ;
                obj::align(          lbl, screen, obj::LV_ALIGN_CENTER, 0, -30) ? ;    
                lbl  //  Return the label as time_label
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
                lbl  //  Return the label as date_label
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
                lbl  //  Return the label as bluetooth_label
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
                lbl  //  Return the label as power_label
            },
        };
        //  Return the watch face
        Ok(watch_face)
    }

    ///////////////////////////////////////////////////////////////////////////////
    //  Update Watch Face

    /// Update the widgets in the Watch Face with the current state
    fn update(&self, state: &WatchFaceState) -> MynewtResult<()> {
        //  Populate the Time and Date Labels
        self.update_date_time(state) ? ;

        //  Populate the Bluetooth Label
        self.update_bluetooth(state) ? ;

        //  Populate the Power Label
        self.update_power(state) ? ;
        Ok(())
    }
}

impl BarebonesWatchFace {

    ///////////////////////////////////////////////////////////////////////////////
    //  Update Watch Face

    /// Populate the Time and Date Labels with the time and date
    fn update_date_time(&self, state: &WatchFaceState) -> MynewtResult<()> {
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
    
    /// Populate the Bluetooth Label with the Bluetooth State (Bluetooth Icon)
    fn update_bluetooth(&self, state: &WatchFaceState) -> MynewtResult<()> {
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

    /// Populate the Power Label with the Power Indicator (Charging & Battery)
    fn update_power(&self, state: &WatchFaceState) -> MynewtResult<()> {
        //  Get the active screen
        let screen = watchface::get_active_screen();

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
fn get_month_name(time: &WatchFaceTime) -> String {
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
fn get_day_name(time: & WatchFaceTime) -> String {
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
fn convert_battery_voltage(_voltage: u32) -> i32 {
    50  //  TODO
}