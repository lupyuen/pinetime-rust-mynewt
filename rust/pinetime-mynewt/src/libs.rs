//! Mynewt Custom API for Rust

use crate::{
    result::*,
    kernel::os::*,
    hw::sensor::*,
    encoding::json::*,
    libs::sensor_coap::*,
    Strn,
};

/// Contains Rust bindings for Mynewt Custom API `libs/sensor_coap`
#[allow(improper_ctypes)]  // TODO: Allow `pub struct stats_coap_stats {}`
pub mod sensor_coap;       // Export `sensor_coap.rs` as Rust module `mynewt::libs::sensor_coap`

/// Contains Rust bindings for Mynewt Custom API `libs/sensor_network`
pub mod sensor_network;    // Export `sensor_network.rs` as Rust module `mynewt::libs::sensor_network`

/// Contains Rust bindings for Mynewt Custom API `libs/mynewt_rust`
pub mod mynewt_rust;       // Export `mynewt_rust.rs` as Rust module `mynewt::libs::mynewt_rust`