//! Contains the Mynewt Sensor API for Rust, including the safe version of the API.
//! Auto-generated Rust bindings are in the `bindings` module.

use ::cty::c_void;
use crate::{
    result::*,
    kernel::os::*,
    Strn,
};

/// Contains the auto-generated Rust bindings for the Mynewt Sensor API
mod bindings;  //  Import `bindings.rs` containing the bindings

/// Export all bindings. TODO: Export only the API bindings.
pub use self::bindings::*;

/// Points to a `sensor`.  Needed because `sensor` also refers to a namespace.
pub type sensor_ptr = *mut sensor;
/// Points to sensor arg passed by Mynewt to sensor listener
pub type sensor_arg = *mut c_void;
/// Points to sensor data passed by Mynewt to sensor listener
pub type sensor_data_ptr = *mut c_void;
/// Sensor data function that returns `MynewtError` instead of `i32`
pub type sensor_data_func =
    unsafe extern "C" fn(
        sensor: sensor_ptr,
        arg:    sensor_arg,
        data:   sensor_data_ptr,
        stype:  sensor_type_t,
    ) -> MynewtError;
/// Sensor data function that returns `i32` instead of `MynewtError`
pub type sensor_data_func_untyped =
    unsafe extern "C" fn(
        sensor: sensor_ptr,
        arg:    sensor_arg,
        data:   sensor_data_ptr,
        stype:  sensor_type_t,
    ) -> i32;

/// Cast sensor data function from typed to untyped
pub fn as_untyped(typed: sensor_data_func) -> Option<sensor_data_func_untyped> {
    let untyped = unsafe { 
        ::core::mem::transmute::
            <sensor_data_func, sensor_data_func_untyped>
            (typed)
    };
    Some(untyped)
}

/* Doesn't work because `fn` is a special type
impl From<sensor_data_func> for sensor_data_func_untyped {
    fn from(typed: sensor_data_func) -> Self {
        unsafe { 
            ::core::mem::transmute::
                <sensor_data_func, sensor_data_func_untyped>
                (typed)
        }  
    }
} */

///  Register a sensor listener. This allows a calling application to receive
///  callbacks for data from a given sensor object. This is the safe version of `sensor_register_listener()`
///  that copies the listener locally before passing to Mynewt.
///  For more information on the type of callbacks available, see the documentation
///  for the sensor listener structure.
///  `sensor`: The sensor to register a listener on.
///  `listener`: The listener to register onto the sensor.
///  Returns `Ok()` on success, `Err()` containing `MynewtError` error code on failure.
pub fn register_listener(sensor: *mut sensor, listener: sensor_listener) -> MynewtResult<()> {  //  Returns an error code upon error. 
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
    //  Copy the caller's listener to the internal listener.
    unsafe { LISTENER_INTERNAL = listener };
    //  Pass the internal listener to the unsafe Mynewt API.
    unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) };
    Ok(())
}

///  Define the listener function to be called after polling the sensor.
///  This is a static mutable copy of the listener passed in through `register_listener`.
///  Must be static so it won't go out of scope.  Must be mutable so that Rust won't move it while Mynewt is using it.
static mut LISTENER_INTERNAL: sensor_listener = sensor_listener {  
    sl_func: Some(null_sensor_data_func),
    ..fill_zero!(sensor_listener)
};

///  Define a default sensor data function in case there is none.
extern fn null_sensor_data_func(
    _sensor: sensor_ptr, 
    _arg: sensor_arg, 
    _sensor_data: sensor_data_ptr, 
    _sensor_type: sensor_type_t) -> i32
    { 0 }
