//! Contains the Mynewt Sensor API for Rust, including the safe version of the API.
//! Auto-generated Rust bindings are in the `bindings` module.

use ::cty::c_void;
use crate::{
    result::*,
    kernel::os::*,
    Strn,
    fill_zero,
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
    unsafe { assert_eq!(LISTENER_INTERNAL.sl_sensor_type, 0, "reg lis") };  //  Make sure it's not used.
    //  Copy the caller's listener to the internal listener.
    unsafe { LISTENER_INTERNAL = listener };
    //  Pass the internal listener to the unsafe Mynewt API.
    unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) };
    Ok(())
}

///  Return a new `sensor_listener` with the sensor type and listener function.
pub fn new_sensor_listener(sensor_type: sensor_type_t, func: sensor_data_func) -> MynewtResult<sensor_listener> {
    Ok(sensor_listener {
        sl_sensor_type: sensor_type,
        sl_func:        as_untyped(func),
        ..fill_zero!(sensor_listener)
    })
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

///  Import the custom interop helper library at `libs/mynewt_rust`
#[link(name = "libs_mynewt_rust")]  //  Functions below are located in the Mynewt build output `libs_mynewt_rust.a`
extern {
    ///  Interpret `sensor_data` as a `sensor_temp_raw_data` struct that contains raw temp.
    ///  Copy the sensor data into `dest`.  Return 0 if successful.
    ///  C API: `int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest)`
    pub fn get_temp_raw_data(sensor_data: sensor_data_ptr, dest: *mut sensor_temp_raw_data) -> i32;

    ///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
    ///  Copy the sensor data into `dest`.  Return 0 if successful.
    ///  C API: `int get_temp_data(void *sensor_data, struct sensor_temp_data *dest)`
    pub fn get_temp_data(sensor_data: sensor_data_ptr, dest: *mut sensor_temp_data) -> i32;

    ///  Return the Mynewt device for the Mynewt sensor.
    ///  C API: `struct os_dev *sensor_get_device(struct sensor *s)`
    pub fn sensor_get_device(sensor: sensor_ptr) -> *mut os_dev;

    ///  Return the NULL sensor.
    ///  C API: `struct sensor *null_sensor(void)`
    pub fn null_sensor() -> sensor_ptr;

    ///  Return non-zero if sensor is NULL.
    ///  C API: `int is_null_sensor(struct sensor *p)`
    pub fn is_null_sensor(sensor: sensor_ptr) -> bool;

    ///  Return non-zero if sensor data is NULL.
    ///  C API: `int is_null_sensor_data(void *p)`
    pub fn is_null_sensor_data(sensor_data: sensor_data_ptr) -> bool;
}

///  We will open internal temperature sensor `temp_stm32_0`.
///  Must sync with apps/my_sensor_app/src/listen_sensor.h
//pub const SENSOR_DEVICE: *const c_char = TEMP_STM32_DEVICE;
//pub const TEMP_STM32_DEVICE: *const c_char = b"temp_stm32_0\0".as_ptr() as *const c_char;  //  TODO

//  Must sync with libs/temp_stm32/include/temp_stm32/temp_stm32.h
//  #if MYNEWT_VAL(RAW_TEMP)                                       //  If we are returning raw temperature (integers)...
///  Return integer sensor values
//pub const TEMP_SENSOR_VALUE_TYPE: i32 = sensor::SENSOR_VALUE_TYPE_INT32 as i32;         

//  #else                                                          //  If we are returning computed temperature (floating-point)...
//  pub const TEMP_SENSOR_TYPE       SENSOR_TYPE_AMBIENT_TEMPERATURE //  Set to floating-point sensor type
//  pub const TEMP_SENSOR_VALUE_TYPE SENSOR_VALUE_TYPE_FLOAT         //  Return floating-point sensor values
//  pub const TEMP_SENSOR_KEY        "tmp"                           //  Use key (field name) `tmp` to transmit computed temperature to CoAP Server or Collector Node
//  #endif  //  MYNEWT_VAL(RAW_TEMP)

///  Sensor type for raw temperature sensor.
///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: sensor_type_t = 
    crate::libs::mynewt_rust::sensor_type_t_SENSOR_TYPE_USER_DEFINED_1;

///  Represents a decoded sensor data value. Since temperature may be integer (raw)
///  or float (computed), we use the struct to return both integer and float values.
pub struct SensorValue {
  ///  Null-terminated string for the key.  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
  pub key: &'static str,  //  Previously: pub key: &'static [u8],
  ///  The type of the sensor value and the value.
  pub val: SensorValueType,
}

///  Default sensor value is `None`
impl Default for SensorValue {
  #[inline]
  fn default() -> SensorValue {
    SensorValue {
      key: "",
      val: SensorValueType::None,
    }
  }
}

///  Represents the type and value of a sensor data value.
pub enum SensorValueType {
  ///  No value.
  None,
  ///  32-bit unsigned integer. For raw temp, contains the raw temp integer value
  Uint(u32),
  ///  32-bit float. For computed temp, contains the computed temp float value
  Float(f32),
}

///  Represents a single temperature sensor raw value.
///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
#[repr(C, packed)]  //  Common to C and Rust. Declare as packed because the C struct is packed.
pub struct sensor_temp_raw_data {   
    ///  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
    pub strd_temp_raw: u32,          
    ///  1 if data is valid
    pub strd_temp_raw_is_valid: u8,  
}
