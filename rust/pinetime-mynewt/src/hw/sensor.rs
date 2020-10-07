//! Contains the Mynewt Sensor API for Rust, including the safe version of the API.
//! Auto-generated Rust bindings are in the `bindings` module.

use ::cty::c_void;
use mynewt_macros::{
    init_strn,
};
use crate as mynewt;
use crate::{
    result::*,
    kernel::os::*,
    Ptr,
    Strn,
    fill_zero,
};

/// Contains the auto-generated Rust bindings for the Mynewt Sensor API
mod bindings;  //  Import `bindings.rs` containing the bindings

/// Export all bindings. TODO: Export only the API bindings.
pub use self::bindings::*;

///  Convert the sensor data received from Mynewt into a `SensorValue` for transmission, which includes the sensor data key. 
///  `sensor_type` indicates the type of data in `sensor_data`.
#[allow(non_snake_case, unused_variables)]
fn convert_sensor_data(sensor_data: sensor_data_ptr, sensor_key: &'static Strn, sensor_type: sensor_type_t) -> SensorValue {
    //  Construct and return a new `SensorValue` (without semicolon)
    SensorValue {
        key: sensor_key,
        geo: SensorValueType::None,
        value: match sensor_type {
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
                //  Interpret the sensor data as a `sensor_temp_raw_data` struct that contains raw temp.
                let mut rawtempdata = fill_zero!(sensor_temp_raw_data);
                let rc = unsafe { get_temp_raw_data(sensor_data, &mut rawtempdata) };
                assert_eq!(rc, 0, "rawtmp fail");
                //  Check that the raw temperature data is valid.
                assert_ne!(rawtempdata.strd_temp_raw_is_valid, 0, "bad rawtmp");                
                //  Raw temperature data is valid.  Return it.
                SensorValueType::Uint(rawtempdata.strd_temp_raw)  //  Raw Temperature in integer (0 to 4095)
            }
            #[cfg(feature = "use_float")]  //  If floating-point is enabled...
            SENSOR_TYPE_GEOLOCATION => {   //  If sensor data is GPS geolocation...
                //  Interpret the sensor data as a `sensor_geolocation_data` struct that contains GPS geolocation.
                let mut geolocation = fill_zero!(sensor_geolocation_data);
                let rc = unsafe { get_geolocation_data(sensor_data, &mut geolocation) };
                assert_eq!(rc, 0, "geodata fail");
                //  Check that the geolocation data is valid.
                if  geolocation.sgd_latitude_is_valid  != 0 &&
                    geolocation.sgd_longitude_is_valid != 0 &&
                    geolocation.sgd_altitude_is_valid  != 0 {
                    //  Geolocation data is valid.  Return it.
                    SensorValueType::Geolocation {
                        latitude:  geolocation.sgd_latitude,
                        longitude: geolocation.sgd_longitude,
                        altitude:  geolocation.sgd_altitude,
                    }
                } else { SensorValueType::None }  //  Geolocation data is invalid.  Maybe GPS is not ready.                 
            }
            //  TODO: Convert other sensor types
            _ => { assert!(false, "sensor type"); SensorValueType::None }  //  Unknown type of sensor value
        }
    }
}

///  Register a sensor listener. This allows a calling application to receive
///  callbacks for data from a given sensor object. This is the safe version of `sensor_register_listener()`
///  that copies the listener locally before passing to Mynewt.
///  For more information on the type of callbacks available, see the documentation
///  for the sensor listener structure.
///  `sensor`: The sensor to register a listener on.
///  `listener`: The listener to register onto the sensor.
///  Returns `Ok()` on success, `Err()` containing `MynewtError` error code on failure.
pub fn register_listener(sensor: *mut sensor, listener: sensor_listener) -> MynewtResult<()> {  //  Returns an error code upon error. 
    //  If this is a Wrapped Sensor Listener, register the associated Sensor Listener with Mynewt.
    let mut arg = MAX_SENSOR_LISTENERS + 1;
    //  Find a matching `sensor_listener_info`
    for i in 0 .. MAX_SENSOR_LISTENERS {
        let info = unsafe { SENSOR_LISTENERS[i] };        
        if  listener.sl_sensor_type == info.listener.sl_sensor_type &&
            listener.sl_func        == info.listener.sl_func &&
            listener.sl_arg         == info.listener.sl_arg {
            arg = i;  //  Found the match
            break;
        }
    }
    if arg < MAX_SENSOR_LISTENERS {
        //  Found the Wrapped Sensor Listener. Register the associated Sensor Listener with Mynewt.
        //  Pass the associated listener to the unsafe Mynewt API.
        unsafe { sensor_register_listener(sensor, &mut SENSOR_LISTENERS[arg].listener) };
    } else {
        //  TODO: Allocate a Wrapped Sensor Listener.
        //  If not found, copy the listener and register the copied Sensor Listener with Mynewt.
        unsafe { assert_eq!(LISTENER_INTERNAL.sl_sensor_type, 0, "reg lis") };  //  Make sure it's not used.
        //  Copy the caller's listener to the internal listener.
        unsafe { LISTENER_INTERNAL = listener };
        //  Pass the internal listener to the unsafe Mynewt API.
        unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) };
    }
    Ok(())
}

///  Wrapped version of `sensor_data_func` used by Visual Embedded Rust
pub type SensorValueFunc = fn(sensor_value: &SensorValue) -> MynewtResult<()>;

///  Return a new `sensor_listener` with the sensor type and sensor value function. Called by Visual Embedded Rust.
pub fn new_sensor_listener(
    sensor_key:     &'static Strn,
    sensor_type:    sensor_type_t, 
    listener_func:  SensorValueFunc
) -> MynewtResult<sensor_listener> {
    assert!(!sensor_key.is_empty(), "missing sensor key");
    //  Find an unused `sensor_listener_info`
    let mut arg = MAX_SENSOR_LISTENERS + 1;
    for i in 0 .. MAX_SENSOR_LISTENERS {
        let info = unsafe { SENSOR_LISTENERS[i] };
        if info.sensor_key.is_empty() {
            arg = i;
            break;
        }
    }
    assert!(arg < MAX_SENSOR_LISTENERS, "increase MAX_SENSOR_LISTENERS");  //  Too many listeners registered. Increase MAX_SENSOR_LISTENERS
    //  Create a Mynewt `sensor_listener` that wraps the allocated `sensor_listener_info`
    let listener = sensor_listener {
        sl_sensor_type: sensor_type,
        sl_func:        Some(wrap_sensor_listener),
        sl_arg:         arg as *mut c_void,
        ..fill_zero!(sensor_listener)
    };
    //  Allocate the `sensor_listener_info`
    unsafe { SENSOR_LISTENERS[arg] = sensor_listener_info {
        sensor_key,
        sensor_type,
        listener_func,
        listener,
    } };
    //  Return the Mynewt `sensor_listener`
    Ok(listener)
}

///  Wrapped Sensor Listener that converts Mynewt `sensor_data` into our `sensor_value` format and calls the application's Listener Function
extern "C" fn wrap_sensor_listener(
    sensor:        sensor_ptr,
    arg:           sensor_arg,
    sensor_data:   sensor_data_ptr,
    sensor_type:   sensor_type_t
) -> i32 {
    //  Use `arg` to fetch the `sensor_listener_info`
    let arg = arg as usize;
    assert!(arg < MAX_SENSOR_LISTENERS, "bad sensor arg");
    let info = unsafe { SENSOR_LISTENERS[arg] };
    assert!(!info.sensor_key.is_empty(), "missing sensor key");

    //  Check that the sensor data is valid
    if sensor_data.is_null() { return SYS_EINVAL }  //  Exit if data is missing
    assert!(!sensor.is_null(), "null sensor");

    //  Convert the sensor data to sensor value
    let sensor_value = convert_sensor_data(sensor_data, info.sensor_key, sensor_type);
    if let SensorValueType::None = sensor_value.value { 
        return SYS_EINVAL;   //  Exit if sensor is not ready
    }

    //  Call the unwrapped listener function to hande the sensor value
    let res = (info.listener_func)(&sensor_value);

    //  Check the result returned by the unwrapped listener function
    if let Err(_err) = res {
        SYS_EINVAL  //  Return error to Mynewt
    } else {
        0           //  Return 0 to Mynewt to indicate no error
    }
}

///  Define the info needed for converting sensor data into sensor value and calling a listener function
#[derive(Clone, Copy)]
struct sensor_listener_info {
    sensor_key:     &'static Strn,
    sensor_type:    sensor_type_t, 
    listener_func:  SensorValueFunc,
    listener:       sensor_listener,
}

///  List of wrapped sensor listeners
const MAX_SENSOR_LISTENERS: usize = 2;
static mut SENSOR_LISTENERS: [sensor_listener_info; MAX_SENSOR_LISTENERS] = [
    sensor_listener_info { 
        sensor_key:     &init_strn!(""), 
        sensor_type:    0, 
        listener_func:  null_sensor_value_func,
        listener:       sensor_listener {  
            sl_func: Some(null_sensor_data_func),
            ..fill_zero!(sensor_listener)
        },
    }; MAX_SENSOR_LISTENERS
];

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

///  Define a default sensor value function in case there is none.
fn null_sensor_value_func(
    _sensor_value: &SensorValue
    ) -> MynewtResult<()> 
    { Ok(()) }

///  Import the custom interop helper library at `libs/mynewt_rust`
#[link(name = "libs_mynewt_rust")]  //  Functions below are located in the Mynewt build output `libs_mynewt_rust.a`
extern {
    ///  Interpret `sensor_data` as a `sensor_temp_raw_data` struct that contains raw temp.
    ///  Copy the sensor data into `dest`.  Return 0 if successful.
    ///  C API: `int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest)`
    #[allow(clashing_extern_declarations)]  //  TODO
    pub fn get_temp_raw_data(sensor_data: sensor_data_ptr, dest: *mut sensor_temp_raw_data) -> i32;

    ///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
    ///  Copy the sensor data into `dest`.  Return 0 if successful.
    ///  C API: `int get_temp_data(void *sensor_data, struct sensor_temp_data *dest)`
    pub fn get_temp_data(sensor_data: sensor_data_ptr, dest: *mut sensor_temp_data) -> i32;

    ///  Interpret `sensor_data` as a `sensor_geolocation_data` struct that contains geolocation.
    ///  Copy the sensor data into `dest`.  Return 0 if successful.
    ///  C API: `int get_geolocation_data(void *sensor_data, struct sensor_geolocation_data *dest)`
    pub fn get_geolocation_data(sensor_data: sensor_data_ptr, dest: *mut sensor_geolocation_data) -> i32;

    ///  Return the Mynewt device for the Mynewt sensor.
    ///  C API: `struct os_dev *sensor_get_device(struct sensor *s)`
    pub fn sensor_get_device(sensor: sensor_ptr) -> *mut os_dev;

    ///  Return the NULL sensor.
    ///  C API: `struct sensor *null_sensor(void)`
    pub fn null_sensor() -> sensor_ptr;

    ///  Return non-zero if sensor is NULL.
    ///  C API: `int is_null_sensor(struct sensor *p)`
    #[allow(clashing_extern_declarations)]  //  TODO
    pub fn is_null_sensor(sensor: sensor_ptr) -> bool;

    ///  Return non-zero if sensor data is NULL.
    ///  C API: `int is_null_sensor_data(void *p)`
    #[allow(clashing_extern_declarations)]  //  TODO
    pub fn is_null_sensor_data(sensor_data: sensor_data_ptr) -> bool;
}

///  Sensor type for raw temperature sensor and geolocation.
///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: sensor_type_t = 
    crate::libs::mynewt_rust::sensor_type_t_SENSOR_TYPE_USER_DEFINED_1;
pub const SENSOR_TYPE_GEOLOCATION: sensor_type_t =
    crate::libs::mynewt_rust::sensor_type_t_SENSOR_TYPE_USER_DEFINED_2;

///  Represents a decoded sensor data value. Since temperature may be integer (raw)
///  or float (computed), we use the struct to return both integer and float values.
#[derive(Clone, Copy)]  //  Sensor values may be copied
pub struct SensorValue {
  ///  Null-terminated string for the key.  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
  pub key: &'static Strn,
  ///  The type of the sensor value and the value.
  pub value: SensorValueType,
  ///  Geolocation associated with the sensor value.
  pub geo: SensorValueType,
}

///  Default sensor value is `None`
impl Default for SensorValue {
  #[inline]
  fn default() -> SensorValue {
    SensorValue {
      key: &init_strn!(""),
      value: SensorValueType::None,
      geo: SensorValueType::None,
    }
  }
}

///  Represents the type and value of a sensor data value.
#[derive(Clone, Copy)]  //  Sensor values may be copied
pub enum SensorValueType {
    ///  No value.
    None,
    ///  32-bit unsigned integer. For raw temp, contains the raw temp integer value
    Uint(u32),
    ///  32-bit float. For computed temp, contains the computed temp float value
    #[cfg(feature = "use_float")]  //  If floating-point is enabled...
    Float(f32),
    ///  Geolocation
    #[cfg(feature = "use_float")]  //  If floating-point is enabled...
    Geolocation { latitude: f64, longitude: f64, altitude: f64 },
}

///  Represents a single temperature sensor raw value.
///  TODO: Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
#[repr(C, packed)]  //  Common to C and Rust. Declare as packed because the C struct is packed.
pub struct sensor_temp_raw_data {   
    ///  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
    pub strd_temp_raw: u32,          
    ///  1 if data is valid
    pub strd_temp_raw_is_valid: u8,  
}

///  Represents a GPS Geolocation.
///  TODO: Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
#[repr(C, packed)]  //  Common to C and Rust. Declare as packed because the C struct is packed.
pub struct sensor_geolocation_data {   
    ///  Latitude (degrees)
    pub sgd_latitude: f64,
    ///  Longitude (degrees)
    pub sgd_longitude: f64,
    ///  Altitude (metres)
    pub sgd_altitude: f64,

    ///  1 if latitude is valid
    pub sgd_latitude_is_valid: u8,
    ///  1 if longitude is valid
    pub sgd_longitude_is_valid: u8,
    ///  1 if altitude is valid
    pub sgd_altitude_is_valid: u8, 
}

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

///  Implement Copy for `sensor_listener`, because the `SENSOR_LISTENERS` initialiser will copy `sensor_listener` structs
impl Copy for sensor_listener { }
///  Implement Clone for `sensor_listener`, because the `SENSOR_LISTENERS` initialiser will copy `sensor_listener` structs
impl Clone for sensor_listener {
    fn clone(&self) -> sensor_listener { *self }
}
///  Implement Copy for `sensor_listener`, because the `SENSOR_LISTENERS` initialiser will copy `sensor_listener` structs
impl Copy for sensor_listener__bindgen_ty_1 { }
///  Implement Clone for `sensor_listener`, because the `SENSOR_LISTENERS` initialiser will copy `sensor_listener` structs
impl Clone for sensor_listener__bindgen_ty_1 {
    fn clone(&self) -> sensor_listener__bindgen_ty_1 { *self }
}