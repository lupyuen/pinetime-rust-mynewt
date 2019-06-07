use crate::base::*;

///  Register a sensor listener. This allows a calling application to receive
///  callbacks for data from a given sensor object. This is the safe version of sensor_register_listener().
///
///  For more information on the type of callbacks available, see the documentation
///  for the sensor listener structure.
///
///  `sensor`: The sensor to register a listener on.
///  `listener`: The listener to register onto the sensor.
///  Return 0 on success, non-zero error code on failure.
pub fn register_listener(sensor: SensorPtr, listener: &SensorListener) -> i32 {    
    //  Make an unsafe call to the Mynewt API.
    unsafe { sensor_register_listener(sensor, listener) }
}

///  Import the Mynewt Sensor API for C.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
#[link(name = "hw_sensor")]
extern {
    ///  Set the sensor poll rate.
    ///  `devname`: Name of the sensor.
    ///  `poll_rate`: The poll rate in milli seconds.
    pub fn sensor_set_poll_rate_ms(devname: *const u8, poll_rate: u32) -> i32;

    ///  Search the sensor list and find the next sensor that corresponds
    ///  to a given device name.
    ///  `devname`: The device name to search for.
    ///  `sensor`: The previous sensor found with this device name.
    ///  Return 0 on success, non-zero error code on failure
    pub fn sensor_mgr_find_next_bydevname(devname: *const u8, prev_cursor: SensorPtr) -> SensorPtr;

    ///  Register a sensor listener. This allows a calling application to receive
    ///  callbacks for data from a given sensor object.
    ///
    ///  For more information on the type of callbacks available, see the documentation
    ///  for the sensor listener structure.
    ///
    ///  `sensor`: The sensor to register a listener on.
    ///  `listener`: The listener to register onto the sensor.
    ///  Return 0 on success, non-zero error code on failure.
    pub fn sensor_register_listener(sensor: SensorPtr, listener: *const SensorListener) -> i32;
}

///  Import the Mynewt SensorListener struct for C, which defines the listener function to be called after polling a sensor.
///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
#[repr(C)]  //  This struct is shared by C and Rust, tell Rust not to reorder the fields.
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
