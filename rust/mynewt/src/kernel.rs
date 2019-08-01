//! Mynewt Kernel API for Rust

use crate::{
    result::*,
    Out, Ptr, Strn,
};

/// Contains Rust bindings for Mynewt OS API `kernel/os`
pub mod os;  // Export `kernel/os.rs` as Rust module `mynewt::kernel::os`
