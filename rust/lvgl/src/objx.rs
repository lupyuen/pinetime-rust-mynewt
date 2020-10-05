//! LVGL Objx API for Rust

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

use crate::{
    core::{
        obj::{
            _lv_obj_t,
            lv_obj_t,
            lv_style_t,
        },
    },
};

/// Contains Rust bindings for LVGL Objx API `lv_objx`
#[allow(non_camel_case_types)]    //  Allow type names to have non-camel case
#[allow(non_upper_case_globals)]  //  Allow globals to have lowercase letters
#[allow(unused_imports)]          //  Allow unused imports
pub mod label;                    //  Export `objx/label.rs` as Rust module `lvgl::objx::label`
