//! Mynewt Custom API for Rust

extern crate macros;
use macros::{safe_wrap}; //  Import Mynewt macros from `macros` library

use crate::{
    result::*,
    kernel::os::*,
    hw::sensor::*,
    encoding::json::*,
    libs::sensor_coap::*,
};

/// Contains Rust bindings for Mynewt Custom API `libs/sensor_coap`
pub mod sensor_coap; // Export `sensor_coap.rs` as Rust module `mynewt::libs::sensor_coap`

/// Contains Rust bindings for Mynewt Custom API `libs/sensor_network`
pub mod sensor_network; // Export `sensor_network.rs` as Rust module `mynewt::libs::sensor_network`

/// Contains Rust bindings for Mynewt Custom API `libs/mynewt_rust`
pub mod mynewt_rust; // Export `mynewt_rust.rs` as Rust module `mynewt::libs::mynewt_rust`
