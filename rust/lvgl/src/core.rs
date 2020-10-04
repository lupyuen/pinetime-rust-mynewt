//! LittlevGL (LVGL) Core API for Rust

use crate::{
    result::*,
    Out, Ptr, Strn,
};

/// Contains Rust bindings for LittlevGL (LVGL) Core API `lv_core`
#[allow(non_camel_case_types)]    //  Allow type names to have non-camel case
#[allow(non_upper_case_globals)]  //  Allow globals to have lowercase letters
#[allow(unused_imports)]          //  Allow unused imports
pub mod obj;                      //  Export `core/obj.rs` as Rust module `lvgl::core::obj`
