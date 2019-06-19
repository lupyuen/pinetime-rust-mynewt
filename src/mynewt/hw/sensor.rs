//!  Import the Mynewt Sensor API and export the safe version of the API. Based on
//!  `repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h`

use ::cty::c_void;

/// Import all Mynewt Sensor API bindings.
mod bindings;

/// Export all bindings. TODO: Export only the API bindings.
pub use self::bindings::*;

/// Needed because sensor also refers to a namespace.
pub type sensor_ptr = *mut sensor;

///  Register a sensor listener. This allows a calling application to receive
///  callbacks for data from a given sensor object. This is the safe version of `sensor_register_listener()`
///  that copies the listener locally before passing to Mynewt.
///  For more information on the type of callbacks available, see the documentation
///  for the sensor listener structure.
///  `sensor`: The sensor to register a listener on.
///  `listener`: The listener to register onto the sensor.
///  Return 0 on success, non-zero error code on failure.
pub fn register_listener(sensor: *mut sensor, listener: sensor_listener) -> Result<(), i32>  {  //  Returns an error code upon error. 
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

///  Define a dummy sensor data function in case there is none.
extern fn null_sensor_data_func(_sensor: *mut sensor, _arg: *mut c_void, _sensor_data: *mut c_void, _sensor_type: sensor_type_t) -> i32 { 0 }

/*
///  Import the Mynewt Sensor API for C.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
#[link(name = "hw_sensor")]  //  Functions below are located in the Mynewt build output `hw_sensor.a`
extern {
    ///  Set the sensor poll rate.
    ///  `devname`: Name of the sensor.
    ///  `poll_rate`: The poll rate in milli seconds.
    ////pub fn sensor_set_poll_rate_ms(devname: *const u8, poll_rate: u32) -> i32;

    ///  Search the sensor list and find the next sensor that corresponds
    ///  to a given device name.
    ///  `devname`: The device name to search for.
    ///  `sensor`: The previous sensor found with this device name.
    ///  Return 0 on success, non-zero error code on failure
    ////pub fn sensor_mgr_find_next_bydevname(devname: *const u8, prev_cursor: SensorPtr) -> SensorPtr;

    ///  Register a sensor listener. This allows a calling application to receive
    ///  callbacks for data from a given sensor object.
    ///
    ///  For more information on the type of callbacks available, see the documentation
    ///  for the sensor listener structure.
    ///
    ///  `sensor`: The sensor to register a listener on.
    ///  `listener`: The listener to register onto the sensor.
    ///  Return 0 on success, non-zero error code on failure.
    pub fn sensor_register_listener(sensor: SensorPtr, listener: *mut SensorListener) -> i32;
}

///  Import the Mynewt SensorListener struct for C, which defines the listener function to be called after polling a sensor.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
#[repr(C)]  //  This struct is common to C and Rust, tell Rust not to reorder the fields.
pub struct SensorListener {
    ///  The type of sensor data to listen for, this is interpreted as a
    ///  mask, and this listener is called for all sensor types on this
    ///  sensor that match the mask.
    pub sl_sensor_type: SensorType,

    ///  Sensor data handler function, called when has data
    pub sl_func: SensorDataFunc,

    ///  Argument for the sensor listener
    pub sl_arg: SensorArg,

    ///  Next item in the sensor listener list.  The head of this list is
    ///  contained within the sensor object.
    pub sl_next: u32,
}

///  Data representing a singular read from a temperature sensor. All values are in Deg C.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/temperature.h
#[repr(C, packed)]  //  Common to C and Rust. Declare as packed because the C struct is packed.
pub struct SensorTempData {  
    pub std_temp: f32,
    pub std_temp_is_valid: u8,
}

///  Mynewt User-Defined Sensor Type 1.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
pub const SENSOR_TYPE_USER_DEFINED_1: SensorType = (1 << 26);

///  Mynewt Sensor Value Types.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
pub const SENSOR_VALUE_TYPE_OPAQUE: i32 = 0;
pub const SENSOR_VALUE_TYPE_INT32: i32 = 1;
pub const SENSOR_VALUE_TYPE_FLOAT: i32 = 2;

///  Mynewt Sensor Types.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
pub type SensorDataFunc = extern fn(SensorPtr, SensorArg, SensorDataPtr, SensorType) -> i32;
pub type SensorType = i64;
pub type SensorArg = i32;
pub type SensorPtr = *const CVoid;
pub type SensorMutPtr = *mut CVoid;
pub type SensorDataPtr = *const CVoid;

///  Declare a pointer to the Mynewt `os_dev` struct.  The contents are hidden.
pub type DevicePtr = *const CVoid;

///  Declare the void C type.  From https://github.com/hashmismatch/freertos.rs/blob/master/src/base.rs
#[repr(u32)]
pub enum CVoid {
    _Variant1,
    _Variant2,
}
unsafe impl Send for CVoid {}

///  Mynewt error codes.
///  Must sync with repos/apache-mynewt-core/sys/defs/include/defs/error.h
pub const SYS_EOK         : i32 = 0;
pub const SYS_ENOMEM      : i32 = -1;
pub const SYS_EINVAL      : i32 = -2;
pub const SYS_ETIMEOUT    : i32 = -3;
pub const SYS_ENOENT      : i32 = -4;
pub const SYS_EIO         : i32 = -5;
pub const SYS_EAGAIN      : i32 = -6;
pub const SYS_EACCES      : i32 = -7;
pub const SYS_EBUSY       : i32 = -8;
pub const SYS_ENODEV      : i32 = -9;
pub const SYS_ERANGE      : i32 = -10;
pub const SYS_EALREADY    : i32 = -11;
pub const SYS_ENOTSUP     : i32 = -12;
pub const SYS_EUNKNOWN    : i32 = -13;
pub const SYS_EREMOTEIO   : i32 = -14;
pub const SYS_EDONE       : i32 = -15;
pub const SYS_EPERUSER : i32 = -65535;
*/
