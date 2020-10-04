//! LittlevGL (LVGL) Objx API for Rust

use crate::{
    result::*,
    core::{
        obj::{
            _lv_obj_t,
            lv_obj_t,
            lv_style_t,
        },
    },
    Out, Ptr, Strn,
};

/// Contains Rust bindings for LittlevGL (LVGL) Objx API `lv_objx`
#[allow(non_camel_case_types)]    //  Allow type names to have non-camel case
#[allow(non_upper_case_globals)]  //  Allow globals to have lowercase letters
#[allow(unused_imports)]          //  Allow unused imports
pub mod label;                    //  Export `objx/label.rs` as Rust module `lvgl::objx::label`
