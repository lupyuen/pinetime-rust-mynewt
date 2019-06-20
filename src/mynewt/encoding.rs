//! Mynewt Encoding API for Rust

/// Contains Rust bindings for Mynewt JSON Encoding API `encoding/json`
pub mod json;  // Export `json.rs` as Rust module `mynewt::encoding::json`

/// Contains Rust bindings for Mynewt TinyCBOR Encoding API `encoding/tinycbor`
pub mod tinycbor;  // Export `tinycbor.rs` as Rust module `mynewt::encoding::tinycbor`
