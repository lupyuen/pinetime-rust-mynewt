//! JSON encoder state used by CoAP JSON encoding macros

use cstr_core::CStr;      //  Import string utilities from `cstr_core` library: https://crates.io/crates/cstr_core
use cty::*;               //  Import C types from cty library: https://crates.io/crates/cty

/// Global instance that contains the current state of the JSON encoder. Only 1 encoding task is supported at a time.
pub static mut JSON_CONTEXT: JsonContext = fill_zero!(JsonContext);

/// JSON encoder state. Buffers the next key and value to be encoded.
#[derive(Default)]
pub struct JsonContext {
    /// Static buffer for the key to be encoded. Will be passed to Mynewt JSON encoder API.  Always null-terminated.
    key_buffer: [u8; JSON_KEY_SIZE],
    /// Static buffer for the string value to be encoded. Will be passed to Mynewt JSON encoder API.  Always null-terminated.
    value_buffer: [u8; JSON_VALUE_SIZE],
}

/// Size of the static key buffer
const JSON_KEY_SIZE: usize = 32;
/// Size of the static value buffer
const JSON_VALUE_SIZE: usize = 32;

impl JsonContext {

    /// Given a key `s`, return a `*char` pointer that is null-terminated. Used for encoding JSON keys.
    /// If `s` is null-terminated, return it as a pointer. Else copy `s` to the static buffer,
    /// append null and return the buffer as a pointer.
    pub fn key_to_cstr(&mut self, s: &[u8]) -> *const c_char {
        //  If null-terminated, return as pointer.
        if s.last() == Some(&0) { return s.as_ptr() as *const c_char; }
        //  Else copy into static key buffer and return pointer to buffer.
        assert!(s.len() < JSON_KEY_SIZE);  //  Key too long
        self.key_buffer[..s.len()].copy_from_slice(s);
        self.key_buffer[s.len()] = 0;
        self.key_buffer.as_ptr() as *const c_char
    }

    /// Given a value `s`, return a `*char` pointer that is null-terminated. Used for encoding JSON values.
    /// If `s` is null-terminated, return it as a pointer. Else copy `s` to the static buffer,
    /// append null and return the buffer as a pointer.
    pub fn value_to_cstr(&mut self, s: &[u8]) -> *const c_char {
        //  If null-terminated, return as pointer.
        if s.last() == Some(&0) { return s.as_ptr() as *const c_char; }
        //  Else copy into static value buffer and return pointer to buffer.
        assert!(s.len() < JSON_VALUE_SIZE);  //  Value too long
        self.value_buffer[..s.len()].copy_from_slice(s);
        self.value_buffer[s.len()] = 0;
        self.value_buffer.as_ptr() as *const c_char
    }

    /// Compute the byte length of the string in `s`.
    /// If `s` is null-terminated, return length of `s` - 1. Else return length of `s`.
    pub fn cstr_len(&self, s: &[u8]) -> usize {
        //  If null-terminated, return length - 1.
        if s.last() == Some(&0) { return s.len() - 1; }
        s.len()
    }

    /// Return the global CBOR encoder
    pub fn global_encoder(&self) -> *mut super::tinycbor::CborEncoder {
        unsafe { &mut super::super::g_encoder }
    }

    /// TODO: Return the CBOR encoder for the current map or array
    pub fn encoder(&self, _parent: &str, _child: &str) -> *mut super::tinycbor::CborEncoder {
        //  TODO: Allow different map encoder by level
        unsafe { &mut super::super::root_map }
    }

    /// Fail the encoding with an error if `res` is non-zero.
    pub fn check_result(&self, res: u32) {
        assert_eq!(res, 0);
    }

    /// Fail the encoding with an error
    pub fn fail(&mut self, err: JsonError) {
        assert_eq!(err, JsonError::OK);
    }

    /// Cast itself as a `*mut c_void`
    pub fn to_void_ptr(&mut self) -> *mut c_void {
        let ptr: *mut JsonContext = self;
        ptr as *mut c_void
    }
}

/// Error codes for JSON encoding failure
#[derive(Debug, PartialEq)]
pub enum JsonError {
    /// No error
    OK = 0,
    /// Encoded value is not unsigned integer
    VALUE_NOT_UINT = 1,
}

/// Convert the type to array of bytes that may or may not end with null
pub trait ToBytesOptionalNull {
    /// Convert the type to array of bytes that may or may not end with null
    fn to_bytes_optional_nul(&self) -> &[u8];
}

/// Convert the type to array of bytes that may or may not end with null
impl ToBytesOptionalNull for [u8] {
    /// Convert the type to array of bytes that may or may not end with null
    fn to_bytes_optional_nul(&self) -> &[u8] {
        self
    }
}

/// Convert the type to array of bytes that may or may not end with null
impl ToBytesOptionalNull for str {
    /// Convert the type to array of bytes that may or may not end with null
    fn to_bytes_optional_nul(&self) -> &[u8] {
        self.as_bytes()
    }
}

/// Convert the type to array of bytes that may or may not end with null
impl ToBytesOptionalNull for &str {
    /// Convert the type to array of bytes that may or may not end with null
    fn to_bytes_optional_nul(&self) -> &[u8] {
        self.as_bytes()
    }
}

/// Convert the type to array of bytes that may or may not end with null. CStr always includes nulls.
impl ToBytesOptionalNull for CStr {
    /// Convert the type to array of bytes that may or may not end with null. CStr always includes nulls.
    fn to_bytes_optional_nul(&self) -> &[u8] {
        self.to_bytes_with_nul()
    }
}
