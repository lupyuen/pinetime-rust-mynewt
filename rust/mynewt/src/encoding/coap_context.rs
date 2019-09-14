//! COAP encoder state used by CoAP encoding macros

use cstr_core::CStr;      //  Import string utilities from `cstr_core` library: https://crates.io/crates/cstr_core
use cty::*;               //  Import C types from cty library: https://crates.io/crates/cty
use crate::{
    sys::console,
    encoding::tinycbor::CborEncoder,
    fill_zero, Strn, StrnRep,
};

/// Global instance that contains the current state of the CoAP encoder. Only 1 encoding task is supported at a time.
pub static mut COAP_CONTEXT: CoapContext = fill_zero!(CoapContext);

/// CoAP encoder state. Buffers the next key and value to be encoded.
#[derive(Default)]
pub struct CoapContext {
    /// Static buffer for the key to be encoded. Will be passed to Mynewt COAP encoder API.  Always null-terminated.
    key_buffer: [u8; COAP_KEY_SIZE],
    /// Static buffer for the string value to be encoded. Will be passed to Mynewt COAP encoder API.  Always null-terminated.
    value_buffer: [u8; COAP_VALUE_SIZE],
}

/// Size of the static key buffer
const COAP_KEY_SIZE: usize = 32;
/// Size of the static value buffer
const COAP_VALUE_SIZE: usize = 32;

/// Global CBOR root map for encoding CBOR documents
static mut cbor_encoder0: CborEncoder = fill_zero!(CborEncoder);
static mut cbor_encoder1: CborEncoder = fill_zero!(CborEncoder);

impl CoapContext {

    ///  Encode a text value into the current JSON document with the specified key
    pub fn json_set_text_string(&mut self, key: &Strn, value: &Strn) {
        //  Convert the key to C string.
        let key_cstr: *const u8 =
            match key.rep {
                StrnRep::ByteStr(bs) => { self.key_to_cstr(bs) }
                StrnRep::CStr(cstr)  => { cstr }
            };
        //  Convert the value to a C string.
        let value_cstr: *const u8 =
            match value.rep {
                StrnRep::ByteStr(bs) => { self.value_to_cstr(bs) }
                StrnRep::CStr(cstr)  => { cstr }
            };
        //  Encode the value.
        unsafe {
            crate::libs::mynewt_rust::json_helper_set_text_string(
                self.to_void_ptr(),
                key_cstr as *const c_char,
                value_cstr as *const c_char
            )
        };
    }

    /// Given a key `s`, return a `*char` pointer that is null-terminated. Used for encoding COAP keys.
    /// If `s` is null-terminated, return it as a pointer. Else copy `s` to the static buffer,
    /// append null and return the buffer as a pointer.
    pub fn key_to_cstr(&mut self, s: &[u8]) -> *const u8 {                
        //  If null-terminated, return as pointer.
        if s.last() == Some(&0) { return s.as_ptr() as *const u8; }
        //  Else copy into static key buffer and return pointer to buffer.
        assert!(s.len() < COAP_KEY_SIZE, "big key");  //  Key too long
        self.key_buffer[..s.len()].copy_from_slice(s);
        self.key_buffer[s.len()] = 0;
        self.key_buffer.as_ptr() as *const u8
    }

    /// Given a value `s`, return a `*char` pointer that is null-terminated. Used for encoding COAP values.
    /// If `s` is null-terminated, return it as a pointer. Else copy `s` to the static buffer,
    /// append null and return the buffer as a pointer.
    pub fn value_to_cstr(&mut self, s: &[u8]) -> *const u8 {
        //  If null-terminated, return as pointer.
        if s.last() == Some(&0) { return s.as_ptr() as *const u8; }
        //  Else copy into static value buffer and return pointer to buffer.
        assert!(s.len() < COAP_VALUE_SIZE, "big value");  //  Value too long
        self.value_buffer[..s.len()].copy_from_slice(s);
        self.value_buffer[s.len()] = 0;
        self.value_buffer.as_ptr() as *const u8
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
        unsafe { &mut super::g_encoder }
    }

    /// Create a new CBOR encoder for the current map or array, e.g. `key=root, suffix=_map` 
    pub fn new_encoder(&self, key: &str, suffix: &str) -> *mut super::tinycbor::CborEncoder {
        console::print("new_encoder: "); console::print(key); console::print(suffix); console::print("\n");
        //  TODO: Allow multiple keys
        if (key, suffix)      == ("values", _ARRAY) { unsafe { &mut cbor_encoder0 } }
        else if (key, suffix) == ("values", _MAP)   { unsafe { &mut cbor_encoder1 } }
        else {
            assert!(false, "new_encoder fail");  //  TODO: No such encoder.
            unsafe { &mut super::root_map }
        }        
    }

    /// Return the CBOR encoder for the current map or array, e.g. `key=root, suffix=_map` 
    pub fn encoder(&self, key: &str, suffix: &str) -> *mut super::tinycbor::CborEncoder {
        console::print("encoder: "); console::print(key); console::print(suffix); console::print("\n");
        //  TODO: Allow multiple keys
        if (key, suffix)      == ("root", "_map")   { unsafe { &mut super::root_map } }
        else if (key, suffix) == ("values", _ARRAY) { unsafe { &mut cbor_encoder0 } }
        else if (key, suffix) == ("values", _MAP)   { unsafe { &mut cbor_encoder1 } }
        else {
            assert!(false, "encoder fail");  //  TODO: No such encoder.
            unsafe { &mut super::root_map }
        }        
    }

    /// Fail the encoding with an error if `res` is non-zero.
    pub fn check_result(&self, res: u32) {
        assert_eq!(res, 0, "enc fail");
    }

    /// Fail the encoding with an error
    pub fn fail(&mut self, err: CoapError) {
        assert_eq!(err, CoapError::OK, "enc fail");
    }

    /// Cast itself as a `*mut c_void`
    pub fn to_void_ptr(&mut self) -> *mut c_void {
        let ptr: *mut CoapContext = self;
        ptr as *mut c_void
    }
}

/// Error codes for COAP encoding failure
#[derive(Debug, PartialEq)]
pub enum CoapError {
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

/// Convert the type to array of bytes that may or may not end with null. CStr always ends with null.
impl ToBytesOptionalNull for CStr {
    /// Convert the type to array of bytes that may or may not end with null. CStr always ends with null.
    fn to_bytes_optional_nul(&self) -> &[u8] {
        self.to_bytes_with_nul()
    }
}

/// Convert the type to array of bytes that may or may not end with null. Strn always ends with null.
impl ToBytesOptionalNull for crate::Strn {
    /// Convert the type to array of bytes that may or may not end with null. Strn always ends with null.
    fn to_bytes_optional_nul(&self) -> &[u8] {
        match self.rep {
            StrnRep::ByteStr(bs) => { bs }
            StrnRep::CStr(_cstr)  => { assert!(false, "strn bytes"); &[] }
            //  TODO: unsafe { ::core::mem::transmute::<*const u8, &[u8]>(cstr) }
        }
    }
}

/// Root of CoAP document
pub const _ROOT: &str = "root";

/// Map element of CoAP document
pub const _MAP: &str = "_map";

/// Array element of CoAP document
pub const _ARRAY: &str = "_array";
