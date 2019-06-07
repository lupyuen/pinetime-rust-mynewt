use cty::*;
use crate::sensor::*;

///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn console_print(msg: &[u8]) {
    let len = msg.len();
    unsafe {
        console_buffer(msg.as_ptr(), len as u32);
        console_flush(); //  TODO: Remove this.
    }
}

///  Import the custom interop helper library
#[link(name = "libs_mynewt_rust")]
extern {
    pub fn rust_sysinit();  

    pub fn get_temp_raw_data(sensor_data: SensorDataPtr, dest: *mut SensorTempRawData) -> i32;
    pub fn get_temp_data(sensor_data: SensorDataPtr, dest: *mut SensorTempData) -> i32;

    pub fn sensor_get_device(sensor: SensorPtr) -> DevicePtr;
    pub fn device_get_name(device: DevicePtr) -> *const c_char;

    pub fn null_sensor() -> SensorPtr;
    pub fn is_null_sensor(sensor: SensorPtr) -> bool;
    pub fn is_null_sensor_data(sensor_data: SensorDataPtr) -> bool;
}

///  Import the custom Mynewt library for displaying messages on the Arm Semihosting Console (via OpenOCD)
#[link(name = "libs_semihosting_console")]
extern {
    ///  Add the string to the output buffer.
    ///  C API: `void console_buffer(const char *buffer, unsigned int length)`
    pub fn console_buffer(buffer: *const u8, length: u32);  

    ///  Write a byte in hexadecimal to the output buffer.
    ///  C API: `void console_printhex(uint8_t v)`
    pub fn console_printhex(v: u8);  

    ///  Write a float to the output buffer, with 1 decimal place.
    ///  C API: `void console_printfloat(float f)`
    pub fn console_printfloat(f: f32);

    ///  Append "length" number of bytes from "buffer" to the output buffer in hex format.
    ///  C API: `void console_dump(const uint8_t *buffer, unsigned int len)`
    pub fn console_dump(buffer: *const u8, len: u32);  

    ///  Flush the output buffer to the console.
    ///  C API: `void console_flush(void)`
    pub fn console_flush();  //  Flush the output buffer to the console.
}

#[link(name = "kernel_os")]
extern {
    pub fn os_eventq_run(evq: *const CVoid);
    pub fn os_eventq_dflt_get() -> *const CVoid;
}

//  Must sync with apps/my_sensor_app/src/listen_sensor.h
pub fn SENSOR_DEVICE() -> *const u8 { TEMP_STM32_DEVICE() }  //  We will open internal temperature sensor "temp_stm32_0"
pub fn TEMP_STM32_DEVICE() -> *const u8 { b"temp_stm32_0\0".as_ptr() }

//  Must sync with libs/temp_stm32/include/temp_stm32/temp_stm32.h
//  #if MYNEWT_VAL(RAW_TEMP)                                       //  If we are returning raw temperature (integers)...
pub const TEMP_SENSOR_TYPE: SensorType = SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;  //  Set to raw sensor type
pub const TEMP_SENSOR_VALUE_TYPE: i32 = SENSOR_VALUE_TYPE_INT32;         //  Return integer sensor values
pub fn TEMP_SENSOR_KEY() -> *const u8 { b"t\0".as_ptr() }  //  Use key (field name) "t" to transmit raw temperature to CoAP Server or Collector Node

//  #else                                                          //  If we are returning computed temperature (floating-point)...
//  pub const TEMP_SENSOR_TYPE       SENSOR_TYPE_AMBIENT_TEMPERATURE //  Set to floating-point sensor type
//  pub const TEMP_SENSOR_VALUE_TYPE SENSOR_VALUE_TYPE_FLOAT         //  Return floating-point sensor values
//  pub const TEMP_SENSOR_KEY        "tmp"                           //  Use key (field name) "tmp" to transmit computed temperature to CoAP Server or Collector Node
//  #endif  //  MYNEWT_VAL(RAW_TEMP)

//  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: SensorType = SENSOR_TYPE_USER_DEFINED_1;

//  Must sync with libs/sensor_coap/include/sensor_coap/sensor_coap.h
//  sensor_value represents a decoded sensor data value. Since temperature may be integer (raw)
//  or float (computed), we use the struct to return both integer and float values.
//  val_type indicates whether it's an integer or float.
#[repr(C)]
pub struct SensorValue {
    pub key: *const u8,  //  "t" for raw temp, "tmp" for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
    pub val_type: i32,   //  The type of the sensor value. SENSOR_VALUE_TYPE_INT32 for int, SENSOR_VALUE_TYPE_FLOAT for float.
    pub int_val: u16,    //  For raw temp, contains the raw temp integer value
    pub float_val: f32,  //  For computed temp, contains the computed temp float value
}

//  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
#[repr(C, packed)]
pub struct SensorTempRawData {   //  Represents a single temperature sensor raw value
    pub strd_temp_raw: u32,          //  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
    pub strd_temp_raw_is_valid: u8,  //  1 if data is valid
}

//  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/temperature.h
#[repr(C, packed)]
pub struct SensorTempData {  //  Data representing a singular read from a temperature sensor. All values are in Deg C
    pub std_temp: f32,
    pub std_temp_is_valid: u8,
}

//  Declare the void C type.  From https://github.com/hashmismatch/freertos.rs/blob/master/src/base.rs
unsafe impl Send for CVoid {}
#[repr(u32)]
pub enum CVoid {
    _Variant1,
    _Variant2,
}

//  struct os_dev *
pub type DevicePtr = *const CVoid;

//  Must sync with repos/apache-mynewt-core/sys/defs/include/defs/error.h
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

//  Sensor definitions are in sensor.rs
