//! Mynewt Encoding API for Rust

/// TODO: Defined in repos/apache-mynewt-core/net/oic/src/api/oc_rep.c
#[link(name = "net_oic")]
extern {
    /// Global CBOR encoder
    pub static mut g_encoder: tinycbor::CborEncoder;
    /// Global CBOR root map
    pub static mut root_map:  tinycbor::CborEncoder;
}

#[macro_use]     // Allow macros from Rust module `encoding/macros.rs`
pub mod macros;  // Export macros from `encoding/macros.rs`

/// Contains Rust bindings for Mynewt JSON Encoding API `encoding/json`
pub mod json;    // Export `json.rs` as Rust module `mynewt::encoding::json`

/// Contains Rust bindings for Mynewt TinyCBOR Encoding API `encoding/tinycbor`
pub mod tinycbor;  // Export `tinycbor.rs` as Rust module `mynewt::encoding::tinycbor`

pub mod coap_context;  // Export `coap_context.rs` as Rust module `mynewt::encoding::coap_context`
