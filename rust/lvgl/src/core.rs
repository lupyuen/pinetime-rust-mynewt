//! LVGL Core API for Rust

#[cfg(feature = "mynewt_os")]     //  If building for Mynewt OS...
use mynewt::{                     //  Use Mynewt types
    result::*,
    Out, Ptr, Strn,
};

#[cfg(feature = "riot_os")]       //  If building for RIOT OS...
use crate::{                      //  Use RIOT types
    result::*,
    Out, Ptr, Strn,
};

/// Contains Rust bindings for LVGL Core API `lv_core`
#[allow(non_camel_case_types)]    //  Allow type names to have non-camel case
#[allow(non_upper_case_globals)]  //  Allow globals to have lowercase letters
#[allow(unused_imports)]          //  Allow unused imports
pub mod obj;                      //  Export `core/obj.rs` as Rust module `lvgl::core::obj`
