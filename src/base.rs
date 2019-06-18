//!  Common declarations for the application.  Includes custom sensor declarations.

use cty::*;            //  Import string utilities from cty library: https://crates.io/crates/cty
use crate::mynewt::sensor::*;  //  Import sensor.rs for Mynewt Sensor API

///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn console_print(msg: &[u8]) {
    let len = msg.len();
    unsafe {
        //  Call the Semihosting Console API, which is unsafe.
        console_buffer(msg.as_ptr(), len as u32);
        console_flush();  //  TODO: Remove this.
    }
}

///  Import the custom interop helper library at `libs/mynewt_rust`
#[link(name = "libs_mynewt_rust")]  //  Functions below are located in the Mynewt build output `libs_mynewt_rust.a`
extern {
    ///  Initialise the Mynewt system.  Start the Mynewt drivers and libraries.  Equivalent to `sysinit()` macro in C.
    ///  C API: `void rust_sysinit()`
    pub fn rust_sysinit();  

    ///  Interpret `sensor_data` as a `sensor_temp_raw_data` struct that contains raw temp.
    ///  Copy the sensor data into `dest`.  Return 0 if successful.
    ///  C API: `int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest)`
    pub fn get_temp_raw_data(sensor_data: SensorDataPtr, dest: *mut SensorTempRawData) -> i32;

    ///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
    ///  Copy the sensor data into `dest`.  Return 0 if successful.
    ///  C API: `int get_temp_data(void *sensor_data, struct sensor_temp_data *dest)`
    pub fn get_temp_data(sensor_data: SensorDataPtr, dest: *mut SensorTempData) -> i32;

    ///  Return the Mynewt device for the Mynewt sensor.
    ///  C API: `struct os_dev *sensor_get_device(struct sensor *s)`
    pub fn sensor_get_device(sensor: SensorPtr) -> DevicePtr;

    ///  Return the name for the Mynewt device.  Assumes name is non-null.
    ///  C API: `const char *device_get_name(struct os_dev *device)`
    pub fn device_get_name(device: DevicePtr) -> *const c_char;

    ///  Return the NULL sensor.
    ///  C API: `struct sensor *null_sensor(void)`
    pub fn null_sensor() -> SensorPtr;

    ///  Return non-zero if sensor is NULL.
    ///  C API: `int is_null_sensor(struct sensor *p)`
    pub fn is_null_sensor(sensor: SensorPtr) -> bool;

    ///  Return non-zero if sensor data is NULL.
    ///  C API: `int is_null_sensor_data(void *p)`
    pub fn is_null_sensor_data(sensor_data: SensorDataPtr) -> bool;
}

///  Import the custom Mynewt library for displaying messages on the Arm Semihosting Console (via OpenOCD).
///  The library is located at `libs/semihosting_console`
#[link(name = "libs_semihosting_console")]  //  Functions below are located in the Mynewt build output `libs_semihosting_console.a`
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

///  Import the Mynewt Kernel API.  TODO: Move to `kernel.rs`.
///  Must sync with repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h
#[link(name = "kernel_os")]  //  Functions below are located in the Mynewt build output `kernel_os.a`
extern {
    ///  Pull a single item off the event queue and call it's event
    ///  callback.
    ///  `evq`: The event queue to pull the item off.
    pub fn os_eventq_run(evq: *const CVoid);

    ///  Retrieves the default event queue processed by OS main task.
    ///  Return the default event queue.
    pub fn os_eventq_dflt_get() -> *const CVoid;
}

///  We will open internal temperature sensor `temp_stm32_0`.
///  Must sync with apps/my_sensor_app/src/listen_sensor.h
pub const SENSOR_DEVICE: *const u8 = TEMP_STM32_DEVICE;
pub const TEMP_STM32_DEVICE: *const u8 = b"temp_stm32_0\0".as_ptr();

//  Must sync with libs/temp_stm32/include/temp_stm32/temp_stm32.h
//  #if MYNEWT_VAL(RAW_TEMP)                                       //  If we are returning raw temperature (integers)...
///  Set to raw sensor type
pub const TEMP_SENSOR_TYPE: SensorType = SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;  
///  Return integer sensor values
pub const TEMP_SENSOR_VALUE_TYPE: i32 = SENSOR_VALUE_TYPE_INT32;         
///  Use key (field name) `t` to transmit raw temperature to CoAP Server or Collector Node
pub const TEMP_SENSOR_KEY: *const u8 = b"t\0".as_ptr();  

//  #else                                                          //  If we are returning computed temperature (floating-point)...
//  pub const TEMP_SENSOR_TYPE       SENSOR_TYPE_AMBIENT_TEMPERATURE //  Set to floating-point sensor type
//  pub const TEMP_SENSOR_VALUE_TYPE SENSOR_VALUE_TYPE_FLOAT         //  Return floating-point sensor values
//  pub const TEMP_SENSOR_KEY        "tmp"                           //  Use key (field name) `tmp` to transmit computed temperature to CoAP Server or Collector Node
//  #endif  //  MYNEWT_VAL(RAW_TEMP)

///  Sensor type for raw temperature sensor.
///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: SensorType = SENSOR_TYPE_USER_DEFINED_1;

///  `sensor_value` represents a decoded sensor data value. Since temperature may be integer (raw)
///  or float (computed), we use the struct to return both integer and float values.
///  `val_type` indicates whether it's an integer or float.
///  Must sync with libs/sensor_coap/include/sensor_coap/sensor_coap.h
#[repr(C)]  //  This struct is common to C and Rust, tell Rust not to reorder the fields.
pub struct SensorValue {
    ///  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
    pub key: *const u8,  
    ///  The type of the sensor value. `SENSOR_VALUE_TYPE_INT32` for int, `SENSOR_VALUE_TYPE_FLOAT` for float.
    pub val_type: i32,   
    ///  For raw temp, contains the raw temp integer value
    pub int_val: u16,    
    ///  For computed temp, contains the computed temp float value
    pub float_val: f32,  
}

///  Represents a decoded sensor data value. Since temperature may be integer (raw)
///  or float (computed), we use the struct to return both integer and float values.
pub struct SensorValueNew {
  ///  Null-terminated string for the key.  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
  //  pub key: &'static [u8],
  pub key: &'static str,
  ///  The type of the sensor value and the value.
  pub val: SensorValueType,
}

///  Represents the type and value of a sensor data value.
pub enum SensorValueType {
  ///  32-bit unsigned integer. For raw temp, contains the raw temp integer value
  Uint(u32),
  ///  32-bit float. For computed temp, contains the computed temp float value
  Float(f32),
}

///  Represents a single temperature sensor raw value.
///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
#[repr(C, packed)]  //  Common to C and Rust. Declare as packed because the C struct is packed.
pub struct SensorTempRawData {   
    ///  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
    pub strd_temp_raw: u32,          
    ///  1 if data is valid
    pub strd_temp_raw_is_valid: u8,  
}

//  Sensor definitions are in sensor.rs
