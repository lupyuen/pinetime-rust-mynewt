#![feature(prelude_import)]
#![no_std]
//!  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server or Collector Node.
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/main.c`

#![no_std]
//  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]
//  To support macro tracing: trace_macros!(true)
#![feature(concat_idents)]
#[prelude_import]
use ::core::prelude::v1::*;
#[macro_use]
extern crate core as core;
#[macro_use]
extern crate compiler_builtins as compiler_builtins;
//  To support concat_idents!() macro used in coap!() macro
extern crate cortex_m;
//  Declare the external library cortex_m

mod base {
    //  Declare base.rs as Rust module `base`
    //  Declare sensor.rs as Rust module `sensor`
    //  Declare listen_sensor.rs as Rust module `listen_sensor`
    //  Declare send_coap.rs as Rust module `send_coap`

    //  Import the PanicInfo type which is used by panic() below
    //  Import the cortex_m assembly function to inject breakpoint
    //  Import base.rs for common declarations
    //  Import listen_sensor.rs for polling the temperature sensor
    //  Import send_coap.rs for sending sensor data

    //  Don't mangle the name "main"
    //  Declare extern "C" because it will be called by Mynewt
    //  Init Mynewt system.


    //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
    //  assert!(rc == 0);

    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
    //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.

    /* `assert!(rc == 0)` expands to:
    if !(rc == 0) {
        {
            ::core::panicking::panic(&("assertion failed: rc == 0",
                                       "src/lib.rs", 39u32, 40u32))
        }
    }; */
    // ::core::panicking::panic(expr_file_line_col: &(&'static str, &'static str, u32, u32))

    //  Main event loop
    //  Loop forever...
    //  Process events...
    //  From default event queue.
    //  Never comes here.

    //  Display the filename and line number to the Semihosting Console.
    //  TODO: Print in decimal not hex. Allow more than 255 lines.
    //  Pause in the debugger.
    //  Loop forever so that device won't restart.
    //!  Common declarations for the application.  Includes custom sensor declarations.
    use cty::*;
    use crate::sensor::*;
    ///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
    pub fn console_print(msg: &[u8]) {
        let len = msg.len();
        unsafe { console_buffer(msg.as_ptr(), len as u32); console_flush(); }
    }
    ///  Import the custom interop helper library at `libs/mynewt_rust`
    #[link(name = "libs_mynewt_rust")]
    extern "C" {
        ///  Initialise the Mynewt system.  Start the Mynewt drivers and libraries.  Equivalent to `sysinit()` macro in C.
        ///  C API: `void rust_sysinit()`
        pub fn rust_sysinit();
        ///  Interpret `sensor_data` as a `sensor_temp_raw_data` struct that contains raw temp.
        ///  Copy the sensor data into `dest`.  Return 0 if successful.
        ///  C API: `int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest)`
        pub fn get_temp_raw_data(sensor_data: SensorDataPtr,
                                 dest: *mut SensorTempRawData) -> i32;
        ///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
        ///  Copy the sensor data into `dest`.  Return 0 if successful.
        ///  C API: `int get_temp_data(void *sensor_data, struct sensor_temp_data *dest)`
        pub fn get_temp_data(sensor_data: SensorDataPtr,
                             dest: *mut SensorTempData) -> i32;
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
    #[link(name = "libs_semihosting_console")]
    extern "C" {
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
        pub fn console_flush();
    }
    ///  Import the Mynewt Kernel API.  TODO: Move to `kernel.rs`.
    ///  Must sync with repos/apache-mynewt-core/kernel/os/include/os/os_eventq.h
    #[link(name = "kernel_os")]
    extern "C" {
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
    ///  Set to raw sensor type
    pub const TEMP_SENSOR_TYPE: SensorType =
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;
    ///  Return integer sensor values
    pub const TEMP_SENSOR_VALUE_TYPE: i32 = SENSOR_VALUE_TYPE_INT32;
    ///  Use key (field name) `t` to transmit raw temperature to CoAP Server or Collector Node
    pub const TEMP_SENSOR_KEY: *const u8 = b"t\0".as_ptr();
    ///  Sensor type for raw temperature sensor.
    ///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
    pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: SensorType =
        SENSOR_TYPE_USER_DEFINED_1;
    ///  `sensor_value` represents a decoded sensor data value. Since temperature may be integer (raw)
    ///  or float (computed), we use the struct to return both integer and float values.
    ///  `val_type` indicates whether it's an integer or float.
    ///  Must sync with libs/sensor_coap/include/sensor_coap/sensor_coap.h
    #[repr(C)]
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
    ///  Represents a single temperature sensor raw value.
    ///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
    #[repr(C, packed)]
    pub struct SensorTempRawData {
        ///  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
        pub strd_temp_raw: u32,
        ///  1 if data is valid
        pub strd_temp_raw_is_valid: u8,
    }
}
mod sensor {
    //!  Import the Mynewt Sensor API and export the safe version of the API. Based on
    //!  `repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h`
    ///  Register a sensor listener. This allows a calling application to receive
    ///  callbacks for data from a given sensor object. This is the safe version of `sensor_register_listener()`
    ///  that copies the listener locally before passing to Mynewt.
    ///
    ///  For more information on the type of callbacks available, see the documentation
    ///  for the sensor listener structure.
    ///
    ///  `sensor`: The sensor to register a listener on.
    ///  `listener`: The listener to register onto the sensor.
    ///  Return 0 on success, non-zero error code on failure.
    pub fn register_listener(sensor: SensorPtr, listener: SensorListener)
     -> i32 {
        unsafe {
            if !(LISTENER_INTERNAL.sl_sensor_type == 0) {
                {
                    ::core::panicking::panic(&("assertion failed: LISTENER_INTERNAL.sl_sensor_type == 0",
                                               "src/sensor.rs", 15u32, 14u32))
                }
            }
        };
        unsafe { LISTENER_INTERNAL = listener };
        unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) }
    }
    ///  Define the listener function to be called after polling the sensor.
    ///  This is a static mutable copy of the listener passed in through `register_listener`.
    ///  Must be static so it won't go out of scope.  Must be mutable so that Rust won't move it while Mynewt is using it.
    static mut LISTENER_INTERNAL: SensorListener =
        SensorListener{sl_sensor_type: 0,
                       sl_func: null_sensor_data_func,
                       sl_arg: 0,
                       sl_next: 0,};
    ///  Define a dummy sensor data function in case there is none.
    extern "C" fn null_sensor_data_func(_sensor: SensorPtr, _arg: SensorArg,
                                        _sensor_data: SensorDataPtr,
                                        _sensor_type: SensorType) -> i32 {
        0
    }
    ///  Import the Mynewt Sensor API for C.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
    #[link(name = "hw_sensor")]
    extern "C" {
        ///  Set the sensor poll rate.
        ///  `devname`: Name of the sensor.
        ///  `poll_rate`: The poll rate in milli seconds.
        pub fn sensor_set_poll_rate_ms(devname: *const u8, poll_rate: u32)
         -> i32;
        ///  Search the sensor list and find the next sensor that corresponds
        ///  to a given device name.
        ///  `devname`: The device name to search for.
        ///  `sensor`: The previous sensor found with this device name.
        ///  Return 0 on success, non-zero error code on failure
        pub fn sensor_mgr_find_next_bydevname(devname: *const u8,
                                              prev_cursor: SensorPtr)
         -> SensorPtr;
        ///  Register a sensor listener. This allows a calling application to receive
        ///  callbacks for data from a given sensor object.
        ///
        ///  For more information on the type of callbacks available, see the documentation
        ///  for the sensor listener structure.
        ///
        ///  `sensor`: The sensor to register a listener on.
        ///  `listener`: The listener to register onto the sensor.
        ///  Return 0 on success, non-zero error code on failure.
        pub fn sensor_register_listener(sensor: SensorPtr,
                                        listener: *mut SensorListener) -> i32;
    }
    ///  Import the Mynewt SensorListener struct for C, which defines the listener function to be called after polling a sensor.
    ///  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
    #[repr(C)]
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
    #[repr(C, packed)]
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
    pub type SensorDataFunc
        =
        extern "C" fn(SensorPtr, SensorArg, SensorDataPtr, SensorType) -> i32;
    pub type SensorType = i64;
    pub type SensorArg = i32;
    pub type SensorPtr = *const CVoid;
    pub type SensorMutPtr = *mut CVoid;
    pub type SensorDataPtr = *const CVoid;
    ///  Declare a pointer to the Mynewt `os_dev` struct.  The contents are hidden.
    pub type DevicePtr = *const CVoid;
    ///  Declare the void C type.  From https://github.com/hashmismatch/freertos.rs/blob/master/src/base.rs
    #[repr(u32)]
    pub enum CVoid { _Variant1, _Variant2, }
    unsafe impl Send for CVoid { }
    ///  Mynewt error codes.
    ///  Must sync with repos/apache-mynewt-core/sys/defs/include/defs/error.h
    pub const SYS_EOK: i32 = 0;
    pub const SYS_ENOMEM: i32 = -1;
    pub const SYS_EINVAL: i32 = -2;
    pub const SYS_ETIMEOUT: i32 = -3;
    pub const SYS_ENOENT: i32 = -4;
    pub const SYS_EIO: i32 = -5;
    pub const SYS_EAGAIN: i32 = -6;
    pub const SYS_EACCES: i32 = -7;
    pub const SYS_EBUSY: i32 = -8;
    pub const SYS_ENODEV: i32 = -9;
    pub const SYS_ERANGE: i32 = -10;
    pub const SYS_EALREADY: i32 = -11;
    pub const SYS_ENOTSUP: i32 = -12;
    pub const SYS_EUNKNOWN: i32 = -13;
    pub const SYS_EREMOTEIO: i32 = -14;
    pub const SYS_EDONE: i32 = -15;
    pub const SYS_EPERUSER: i32 = -65535;
}
mod listen_sensor {
    //!  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
    //!  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
    //!       This sensor is selected if BME280_OFB is defined in syscfg.yml.
    //!  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
    //!       This sensor is selected if TEMP_STM32 is defined in syscfg.yml.
    //!  If this is the Collector Node, send the sensor data to the CoAP Server after polling.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/listen_sensor.c`
    use cty::*;
    use cstr_core::CStr;
    use crate::base::*;
    use crate::sensor::*;
    use crate::send_coap::send_sensor_data;
    ///  Poll every 10,000 milliseconds (10 seconds)  
    const SENSOR_POLL_TIME: u32 = (10 * 1000);
    ///  Indicate that this is a listener callback
    const LISTENER_CB: SensorArg = 1;
    ///  For Sensor Node and Standalone Node: Start polling the temperature sensor 
    ///  every 10 seconds in the background.  After polling the sensor, call the 
    ///  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
    ///  or CoAP Server (is this is a Standalone Node).
    ///  For Collector Node: Start the Listeners for Remote Sensor 
    ///  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
    ///  Return 0 if successful.
    pub fn start_sensor_listener() -> i32 {
        console_print(b"TMP poll \n");
        let rc =
            unsafe {
                sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME)
            };
        if !(rc == 0) {
            {
                ::core::panicking::panic(&("assertion failed: rc == 0",
                                           "src/listen_sensor.rs", 35u32,
                                           5u32))
            }
        };
        let listen_sensor =
            unsafe {
                sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor())
            };
        if !!unsafe { is_null_sensor(listen_sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: !unsafe { is_null_sensor(listen_sensor) }",
                                           "src/listen_sensor.rs", 39u32,
                                           5u32))
            }
        };
        let listener =
            SensorListener{sl_sensor_type: TEMP_SENSOR_TYPE,
                           sl_func: read_temperature,
                           sl_arg: LISTENER_CB,
                           sl_next: 0,};
        let rc = register_listener(listen_sensor, listener);
        if !(rc == 0) {
            {
                ::core::panicking::panic(&("assertion failed: rc == 0",
                                           "src/listen_sensor.rs", 51u32,
                                           5u32))
            }
        };
        0
    }
    ///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
    ///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
    ///  If this is a Sensor Node, we send the sensor data to the Collector Node.
    ///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    ///  Return 0 if we have processed the sensor data successfully.
    extern "C" fn read_temperature(sensor: SensorPtr, _arg: SensorArg,
                                   sensor_data: SensorDataPtr,
                                   sensor_type: SensorType) -> i32 {
        unsafe {
            console_print(b"read_temperature\n");
            if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }
            if !!is_null_sensor(sensor) {
                {
                    ::core::panicking::panic(&("assertion failed: !is_null_sensor(sensor)",
                                               "src/listen_sensor.rs", 76u32,
                                               9u32))
                }
            };
            let device = sensor_get_device(sensor);
            let c_buf: *const c_char = device_get_name(device);
            let device_name: &CStr = CStr::from_ptr(c_buf);
            let temp_sensor_value = get_temperature(sensor_data, sensor_type);
            if !(temp_sensor_value.val_type != 0) {
                {
                    ::core::panicking::panic(&("assertion failed: temp_sensor_value.val_type != 0",
                                               "src/listen_sensor.rs", 87u32,
                                               9u32))
                }
            };
            if temp_sensor_value.val_type == 0 { return -1; }
            let rc = send_sensor_data(&temp_sensor_value, device_name);
            if rc == SYS_EAGAIN {
                console_print(b"TMP network not ready\n");
                return 0;
            }
            if !(rc == 0) {
                {
                    ::core::panicking::panic(&("assertion failed: rc == 0",
                                               "src/listen_sensor.rs", 103u32,
                                               9u32))
                }
            };
        }
        0
    }
    ///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
    ///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
    ///  the raw or computed temperature, as well as the key and value type.
    fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType)
     -> SensorValue {
        let mut return_value =
            SensorValue{key: b"\0".as_ptr(),
                        val_type: 0,
                        int_val: 0,
                        float_val: 0.0,};
        unsafe {
            match sensor_type {
                SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {
                    let mut rawtempdata =
                        SensorTempRawData{strd_temp_raw: 0,
                                          strd_temp_raw_is_valid: 0,};
                    let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
                    if !(rc == 0) {
                        {
                            ::core::panicking::panic(&("assertion failed: rc == 0",
                                                       "src/listen_sensor.rs",
                                                       129u32, 17u32))
                        }
                    };
                    if rawtempdata.strd_temp_raw_is_valid == 0 {
                        return return_value;
                    }
                    return_value.int_val = rawtempdata.strd_temp_raw as u16;
                    console_print(b"TMP listener got rawtmp \n");
                }
                SENSOR_TYPE_AMBIENT_TEMPERATURE => {
                    let mut tempdata =
                        SensorTempData{std_temp: 0.0, std_temp_is_valid: 0,};
                    let rc = get_temp_data(sensor_data, &mut tempdata);
                    if !(rc == 0) {
                        {
                            ::core::panicking::panic(&("assertion failed: rc == 0",
                                                       "src/listen_sensor.rs",
                                                       145u32, 17u32))
                        }
                    };
                    if tempdata.std_temp_is_valid == 0 {
                        return return_value;
                    }
                    return_value.float_val = tempdata.std_temp;
                }
                _ => {
                    if !false {
                        {
                            ::core::panicking::panic(&("assertion failed: false",
                                                       "src/listen_sensor.rs",
                                                       159u32, 17u32))
                        }
                    };
                    return return_value;
                }
            }
            return_value.key = TEMP_SENSOR_KEY;
            return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
        };
        return_value
    }
}
mod send_coap {
    //!  Send sensor data to a CoAP Server or a Collector Node.  The CoAP payload will be encoded as JSON
    //!  for CoAP Server and CBOR for Collector Node.  The sensor data will be transmitted to 
    //!  CoAP Server over WiFi via the ESP8266 transceiver, and to Collector Node via nRF24L01 transceiver.
    //!
    //!  This enables transmission of Sensor Data to a local Sensor Network (via nRF24L01)
    //!  and to the internet (via ESP8266).  For sending to Collector Node we use raw temperature (integer) 
    //!  instead of computed temperature (floating-point) to make the encoding simpler and faster.
    //!
    //!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
    //!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/send_coap.c`
    use cstr_core::CStr;
    use crate::base::*;
    use crate::sensor::*;
    #[macro_export(local_inner_macros)]
    macro_rules! coap(( @ json $ ( $ json : tt ) + ) => {
                      coap_internal ! ( @ json $ ( $ json ) + ) } ; (
                      @ cbor $ ( $ json : tt ) + ) => {
                      coap_internal ! ( @ cbor $ ( $ json ) + ) } ;);
    #[macro_export(local_inner_macros)]
    #[doc(hidden)]
    macro_rules! coap_internal((
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] ) => {
                               coap_internal_vec ! [ $ ( $ elems , ) * ] } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr ) , * ] ) => {
                               coap_internal_vec ! [ $ ( $ elems ) , * ] } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] null $ ( $ rest : tt
                               ) * ) => {
                               coap_internal ! (
                               @ $ enc @ array [
                               $ ( $ elems , ) * coap_internal ! (
                               @ $ enc null ) ] $ ( $ rest ) * ) } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] true $ ( $ rest : tt
                               ) * ) => {
                               coap_internal ! (
                               @ $ enc @ array [
                               $ ( $ elems , ) * coap_internal ! (
                               @ $ enc true ) ] $ ( $ rest ) * ) } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] false $ (
                               $ rest : tt ) * ) => {
                               coap_internal ! (
                               @ $ enc @ array [
                               $ ( $ elems , ) * coap_internal ! (
                               @ $ enc false ) ] $ ( $ rest ) * ) } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] [
                               $ ( $ array : tt ) * ] $ ( $ rest : tt ) * ) =>
                               {
                               coap_internal ! (
                               @ $ enc @ array [
                               $ ( $ elems , ) * coap_internal ! (
                               @ $ enc [ $ ( $ array ) * ] ) ] $ ( $ rest ) *
                               ) } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] { $ ( $ map : tt ) *
                               } $ ( $ rest : tt ) * ) => {
                               coap_internal ! (
                               @ $ enc @ array [
                               $ ( $ elems , ) * coap_internal ! (
                               @ $ enc { $ ( $ map ) * } ) ] $ ( $ rest ) * )
                               } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] $ next : expr , $ (
                               $ rest : tt ) * ) => {
                               coap_internal ! (
                               @ $ enc @ array [
                               $ ( $ elems , ) * coap_internal ! (
                               @ $ enc $ next ) , ] $ ( $ rest ) * ) } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr , ) * ] $ last : expr ) => {
                               coap_internal ! (
                               @ $ enc @ array [
                               $ ( $ elems , ) * coap_internal ! (
                               @ $ enc $ last ) ] ) } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr ) , * ] , $ ( $ rest : tt )
                               * ) => {
                               coap_internal ! (
                               @ $ enc @ array [ $ ( $ elems , ) * ] $ (
                               $ rest ) * ) } ; (
                               @ $ enc : ident @ array [
                               $ ( $ elems : expr ) , * ] $ unexpected : tt $
                               ( $ rest : tt ) * ) => {
                               coap_unexpected ! ( $ unexpected ) } ; (
                               @ $ enc : ident @ object $ object : ident (  )
                               (  ) (  ) ) => {  } ; (
                               @ $ enc : ident @ object $ object : ident [
                               $ ( $ key : tt ) + ] ( $ value : expr ) , $ (
                               $ rest : tt ) * ) => {
                               let _ =
                               "TODO: add (_key, _value) to _object_key" ; let
                               _key = $ ( $ key ) + ; let _value = $ value ;
                               let _object_key = $ object ; coap_item_str ! (
                               $ object , $ ( $ key ) + , $ value ) ; let _ =
                               "--------------------" ; coap_internal ! (
                               @ $ enc @ object $ object (  ) ( $ ( $ rest ) *
                               ) ( $ ( $ rest ) * ) ) ; } ; (
                               @ $ enc : ident @ object $ object : ident [
                               $ ( $ key : tt ) + ] ( $ value : expr ) $
                               unexpected : tt $ ( $ rest : tt ) * ) => {
                               coap_unexpected ! ( $ unexpected ) ; } ; (
                               @ $ enc : ident @ object $ object : ident [
                               $ ( $ key : tt ) + ] ( $ value : expr ) ) => {
                               let _ = (
                               "TODO: add key:" , ( $ ( $ key ) + ) , "value:"
                               , $ value , "to object:" , $ object ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) (
                               : null $ ( $ rest : tt ) * ) $ copy : tt ) => {
                               coap_internal ! (
                               @ $ enc @ object $ object [ $ ( $ key ) + ] (
                               coap_internal ! ( @ $ enc null ) ) $ ( $ rest )
                               * ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) (
                               : true $ ( $ rest : tt ) * ) $ copy : tt ) => {
                               coap_internal ! (
                               @ $ enc @ object $ object [ $ ( $ key ) + ] (
                               coap_internal ! ( @ $ enc true ) ) $ ( $ rest )
                               * ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) (
                               : false $ ( $ rest : tt ) * ) $ copy : tt ) =>
                               {
                               coap_internal ! (
                               @ $ enc @ object $ object [ $ ( $ key ) + ] (
                               coap_internal ! ( @ $ enc false ) ) $ ( $ rest
                               ) * ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) (
                               : [ $ ( $ array : tt ) * ] $ ( $ rest : tt ) *
                               ) $ copy : tt ) => {
                               coap_internal ! (
                               @ $ enc @ object $ object [ $ ( $ key ) + ] (
                               coap_internal ! ( @ $ enc [ $ ( $ array ) * ] )
                               ) $ ( $ rest ) * ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) (
                               : { $ ( $ map : tt ) * } $ ( $ rest : tt ) * )
                               $ copy : tt ) => {
                               coap_internal ! (
                               @ $ enc @ object $ object [ $ ( $ key ) + ] (
                               coap_internal ! ( @ $ enc { $ ( $ map ) * } ) )
                               $ ( $ rest ) * ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) (
                               : $ value : expr , $ ( $ rest : tt ) * ) $ copy
                               : tt ) => {
                               coap_internal ! (
                               @ $ enc @ object $ object [ $ ( $ key ) + ] (
                               coap_internal ! ( @ $ enc $ value ) ) , $ (
                               $ rest ) * ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) ( : $ value : expr ) $
                               copy : tt ) => {
                               coap_internal ! (
                               @ $ enc @ object $ object [ $ ( $ key ) + ] (
                               coap_internal ! ( @ $ enc $ value ) ) ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) ( : ) $ copy : tt ) => {
                               coap_internal ! (  ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) + ) (  ) $ copy : tt ) => {
                               coap_internal ! (  ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (  )
                               ( : $ ( $ rest : tt ) * ) (
                               $ colon : tt $ ( $ copy : tt ) * ) ) => {
                               coap_unexpected ! ( $ colon ) ; } ; (
                               @ json @ object $ object : ident (
                               $ ( $ key : tt ) * ) ( , $ ( $ rest : tt ) * )
                               ( $ comma : tt $ ( $ copy : tt ) * ) ) => {
                               let _ =
                               "TODO: Expand _sensor_value (key, value) and add to _object"
                               ; let _sensor_value = $ ( $ key ) * ; let
                               _object = $ object ; let _ =
                               "--------------------" ; coap_item_int_val ! (
                               @ json $ object , $ ( $ key ) * ) ;
                               coap_internal ! (
                               @ json @ object $ object (  ) ( $ ( $ rest ) *
                               ) ( $ ( $ rest ) * ) ) ; } ; (
                               @ cbor @ object $ object : ident (
                               $ ( $ key : tt ) * ) ( , $ ( $ rest : tt ) * )
                               ( $ comma : tt $ ( $ copy : tt ) * ) ) => {
                               let _ =
                               "TODO: Expand _sensor_value (key, value) and add to _object"
                               ; let _sensor_value = $ ( $ key ) * ; let
                               _object = $ object ; let _ =
                               "--------------------" ; coap_set_int_val ! (
                               @ cbor $ object , $ ( $ key ) * ) ;
                               coap_internal ! (
                               @ cbor @ object $ object (  ) ( $ ( $ rest ) *
                               ) ( $ ( $ rest ) * ) ) ; } ; (
                               @ $ enc : ident @ object $ object : ident (  )
                               ( ( $ key : expr ) : $ ( $ rest : tt ) * ) $
                               copy : tt ) => {
                               coap_internal ! (
                               @ $ enc @ object $ object ( $ key ) (
                               : $ ( $ rest ) * ) ( : $ ( $ rest ) * ) ) ; } ;
                               (
                               @ $ enc : ident @ object $ object : ident (
                               $ ( $ key : tt ) * ) (
                               $ tt : tt $ ( $ rest : tt ) * ) $ copy : tt )
                               => {
                               let _ = "token ident" ; coap_internal ! (
                               @ $ enc @ object $ object ( $ ( $ key ) * $ tt
                               ) ( $ ( $ rest ) * ) ( $ ( $ rest ) * ) ) ; } ;
                               ( @ $ enc : ident null ) => {
                               { _ = "null" ; "null" } } ; (
                               @ $ enc : ident true ) => {
                               { _ = "true" ; "true" } } ; (
                               @ $ enc : ident false ) => {
                               { _ = "false" ; "false" } } ; (
                               @ $ enc : ident [  ] ) => { { _ = "[]" ; "[]" }
                               } ; ( @ $ enc : ident [ $ ( $ tt : tt ) + ] )
                               => {
                               {
                               _ = "begin array" ; _array = coap_internal ! (
                               @ $ enc @ array [  ] $ ( $ tt ) + ) ; _ =
                               "end array" ; "TODO: array" } } ; (
                               @ $ enc : ident {  } ) => { { _ = "{}" ; "{}" }
                               } ; ( @ json { $ ( $ tt : tt ) + } ) => {
                               {
                               let _ = "begin json root" ; let root = "root" ;
                               coap_root ! (
                               @ json {
                               let values = "values" ; coap_array ! (
                               @ json root , values , { let _object = values ;
                               } ) ; } ) ; let _ = "end json root" ; let _ =
                               "return json root to caller" ; root } } ; (
                               @ cbor { $ ( $ tt : tt ) + } ) => {
                               {
                               let _ = "begin cbor root" ; let root = "root" ;
                               coap_root ! (
                               @ cbor {
                               coap_internal ! (
                               @ cbor @ object root (  ) ( $ ( $ tt ) + ) (
                               $ ( $ tt ) + ) ) ; } ) ; let _ =
                               "end cbor root" ; let _ =
                               "return cbor root to caller" ; root } } ; (
                               @ $ enc : ident $ other : expr ) => {
                               { let _expr = $ other ; $ other } } ;);
    #[macro_export]
    #[doc(hidden)]
    macro_rules! coap_internal_vec(( $ ( $ content : tt ) * ) => {
                                   vec ! [ $ ( $ content ) * ] } ;);
    #[macro_export]
    #[doc(hidden)]
    macro_rules! coap_unexpected((  ) => {  } ;);
    ///  Compose the payload root.
    #[macro_export(local_inner_macros)]
    macro_rules! coap_root(( @ $ enc : ident $ children0 : block ) => {
                           {
                           let _ = "begin coap_root" ;
                           oc_rep_start_root_object ! (  ) ; $ children0 ;
                           oc_rep_end_root_object ! (  ) ; let _ =
                           "end coap_root" ; } } ;);
    ///  Compose an array under "object", named as "key".  Add "children" as array elements.
    #[macro_export(local_inner_macros)]
    macro_rules! coap_array((
                            @ $ enc : ident $ object0 : ident , $ key0 : ident
                            , $ children0 : block ) => {
                            {
                            let _ = "begin coap_array with _object0, _key0" ;
                            let _object0 = $ object0 ; let _key0 = $ key0 ;
                            oc_rep_set_array ! ( $ object0 , $ key0 ) ; $
                            children0 ; oc_rep_close_array ! (
                            $ object0 , $ key0 ) ; let _ = "end coap_array" ;
                            } } ;);
    ///  Append a (`key` + `val` string value) item to the array named `parent`:
    ///    `{ <parent>: [ ..., {"key": <key>, "value": <val>} ] }`
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item_str((
                               @ $ enc : ident $ parent : ident , $ key : expr
                               , $ val : expr ) => {
                               {
                               let _ =
                               "begin coap_item_str with _parent, _key, _val"
                               ; let _parent = $ parent ; let _key = $ key ;
                               let _val = $ val ; coap_item ! (
                               @ $ enc $ parent , {
                               oc_rep_set_text_string ! (
                               $ parent , "key" , $ key ) ;
                               oc_rep_set_text_string ! (
                               $ parent , "value" , $ val ) ; } ) ; let _ =
                               "end coap_item_str" ; } } ;);
    ///  Append an array item under the array named `array0`.  Add `children0` as the items (key and value).
    ///    `{ <array0>: [ ..., { <children0> } ] }`
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item((
                           @ $ enc : ident $ array0 : ident , $ children0 :
                           block ) => {
                           {
                           let _ = "begin coap_item" ;
                           oc_rep_object_array_start_item ! ( $ array0 ) ; $
                           children0 ; oc_rep_object_array_end_item ! (
                           $ array0 ) ; let _ = "end coap_item" ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item_int((
                               @ $ enc : ident $ array0 : ident , $ key0 :
                               expr , $ value0 : expr ) => {
                               {
                               let _ = "begin coap_item_int" ; coap_item ! (
                               @ $ enc $ array0 , {
                               oc_rep_set_text_string ! (
                               $ array0 , "key" , $ key0 ) ; oc_rep_set_int !
                               ( $ array0 , "value" , $ value0 ) ; } ) ; let _
                               = "end coap_item_int" ; } } ;);
    ///  Given an object parent and an integer Sensor Value val, set the val's key/value in the object.
    #[macro_export(local_inner_macros)]
    macro_rules! coap_set_int_val((
                                  @ $ enc : ident $ parent0 : ident , $ val0 :
                                  expr ) => {
                                  {
                                  let _ =
                                  "begin coap_set_int_val with _parent0, _val0"
                                  ; let _parent0 = $ parent0 ; let _ =
                                  "TODO: let _val0 = $val0;" ; let _ =
                                  "TODO: let _key = _sensor_value.key;" ; let
                                  _ =
                                  "TODO: let _value = _sensor_value.value;" ;
                                  let _ =
                                  "TODO: assert(val0->val_type == SENSOR_VALUE_TYPE_INT32);"
                                  ; let _ =
                                  "TODO: rep_set_int_k(parent0, val0->key, val0->int_val);"
                                  ; oc_rep_set_int_k ! (
                                  $ parent0 , "TODO: val0->key" ,
                                  "TODO: val0->int_val" ) ; let _ =
                                  "end coap_set_int_val" ; } } ;);
    ///  Create a new Item object in the parent array and set the Sensor Value's key/value (integer).
    #[macro_export(local_inner_macros)]
    macro_rules! coap_item_int_val((
                                   @ $ enc : ident $ parent0 : ident , $ val0
                                   : expr ) => {
                                   {
                                   let _ =
                                   "begin coap_item_int_val with _parent0, _val0"
                                   ; let _parent0 = $ parent0 ; let _ =
                                   "TODO: let _val0 = $val0;" ; let _ =
                                   "TODO: let _key = _sensor_value.key;" ; let
                                   _ =
                                   "TODO: let _value = _sensor_value.value;" ;
                                   let _ =
                                   "TODO: assert(val0->val_type == SENSOR_VALUE_TYPE_INT32);"
                                   ; let _ =
                                   "TODO: CP_ITEM_INT(parent0, val0->key, val0->int_val);"
                                   ; coap_item_int ! (
                                   @ $ enc $ parent0 , "TODO: val0->key" ,
                                   "TODO: val0->int_val" ) ; let _ =
                                   "end coap_item_int_val" ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! rep_start_root_object((  ) => {
                                       {
                                       let _ = "begin rep_start_root_object" ;
                                       oc_rep_start_root_object ! (  ) ; let _
                                       = "end rep_start_root_object" ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! rep_end_root_object((  ) => {
                                     {
                                     let _ = "begin rep_end_root_object" ;
                                     oc_rep_end_root_object ! (  ) ; let _ =
                                     "end rep_end_root_object" ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! rep_set_array(( $ object : ident , $ key : ident ) => {
                               {
                               let _ = "begin rep_set_array" ;
                               oc_rep_set_array ! ( $ object , $ key ) ; let _
                               = "end rep_set_array" ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! rep_close_array(( $ object : ident , $ key : ident ) => {
                                 {
                                 let _ = "begin rep_close_array" ;
                                 oc_rep_close_array ! ( $ object , $ key ) ;
                                 let _ = "end rep_close_array" ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! rep_set_text_string((
                                     $ object : ident , $ key : expr , $ value
                                     : expr ) => {
                                     {
                                     let _ = "begin rep_set_text_string" ;
                                     oc_rep_set_text_string ! (
                                     $ object , $ key , $ value ) ; let _ =
                                     "end rep_set_text_string" ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! rep_object_array_start_item(( $ key : ident ) => {
                                             {
                                             let _ =
                                             "begin rep_object_array_start_item"
                                             ; oc_rep_object_array_start_item
                                             ! ( $ key ) ; let _ =
                                             "end rep_object_array_start_item"
                                             ; } } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! rep_object_array_end_item(( $ key : ident ) => {
                                           {
                                           let _ =
                                           "begin rep_object_array_end_item" ;
                                           oc_rep_object_array_end_item ! (
                                           $ key ) ; let _ =
                                           "end rep_object_array_end_item" ; }
                                           } ;);
    #[macro_export(local_inner_macros)]
    macro_rules! oc_rep_start_root_object((  ) => {
                                          {
                                          let _ =
                                          "begin oc_rep_start_root_object" ;
                                          let _ =
                                          "TODO: g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength);"
                                          ; let _ =
                                          "end oc_rep_start_root_object" ; } }
                                          ;);
    #[macro_export(local_inner_macros)]
    macro_rules! oc_rep_end_root_object((  ) => {
                                        {
                                        let _ = "begin oc_rep_end_root_object"
                                        ; let _ =
                                        "TODO: g_err |= cbor_encoder_close_container(&g_encoder, &root_map);"
                                        ; let _ = "end oc_rep_end_root_object"
                                        ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_start_object((
                                     $ parent : ident , $ key : ident , $
                                     parent_suffix : literal ) => {
                                     {
                                     let _ = "begin oc_rep_start_object" ; let
                                     _parent0 = concat ! (
                                     stringify ! ( $ parent ) , $
                                     parent_suffix ) ; let _key0 = $ key ; let
                                     _child = concat ! (
                                     stringify ! ( $ key ) , "_map" ) ; let _
                                     = concat ! (
                                     "TODO: CborEncoder " , stringify ! (
                                     $ key ) , "_map" ) ; let _ = concat ! (
                                     "TODO: g_err |= cbor_encoder_create_map(&"
                                     , stringify ! ( $ parent ) , $
                                     parent_suffix , ", &" , stringify ! (
                                     $ key ) , "_map" ,
                                     ", CborIndefiniteLength);" ) ; let _ =
                                     "end oc_rep_start_object" ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_end_object((
                                   $ parent : ident , $ key : ident , $
                                   parent_suffix : literal ) => {
                                   {
                                   let _ = "begin oc_rep_end_object" ; let
                                   _parent0 = concat ! (
                                   stringify ! ( $ parent ) , $ parent_suffix
                                   ) ; let _key0 = $ key ; let _child = concat
                                   ! ( stringify ! ( $ key ) , "_map" ) ; let
                                   _ = concat ! (
                                   "TODO: g_err |= cbor_encoder_close_container(&"
                                   , stringify ! ( $ parent ) , $
                                   parent_suffix , ", &" , stringify ! ( $ key
                                   ) , "_map" , ");" ) ; let _ =
                                   "end oc_rep_end_object" ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_start_array((
                                    $ parent : ident , $ key : ident , $
                                    parent_suffix : literal ) => {
                                    {
                                    let _ = "begin oc_rep_start_array" ; let
                                    _parent = concat ! (
                                    stringify ! ( $ parent ) , $ parent_suffix
                                    ) ; let _key = $ key ; let _child = concat
                                    ! ( stringify ! ( $ key ) , "_array" ) ;
                                    let _ = concat ! (
                                    "TODO: CborEncoder " , stringify ! ( $ key
                                    ) , "_array" , ";" ) ; let _ = concat ! (
                                    "TODO: g_err |= cbor_encoder_create_array(&"
                                    , stringify ! ( $ parent ) , $
                                    parent_suffix , ", &" , stringify ! (
                                    $ key ) , "_array" ,
                                    ", CborIndefiniteLength);" ) ; let _ =
                                    "end oc_rep_start_array" ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_end_array((
                                  $ parent : ident , $ key : ident , $
                                  parent_suffix : literal ) => {
                                  {
                                  let _ = "begin oc_rep_end_array" ; let
                                  _parent = concat ! (
                                  stringify ! ( $ parent ) , $ parent_suffix )
                                  ; let _key = $ key ; let _child = concat ! (
                                  stringify ! ( $ key ) , "_array" ) ; let _ =
                                  concat ! (
                                  "TODO: g_err |= cbor_encoder_close_container(&"
                                  , stringify ! ( $ parent ) , $ parent_suffix
                                  , ", &" , stringify ! ( $ key ) , "_array" ,
                                  ");" ) ; let _ = "end oc_rep_end_array" ; }
                                  } ;);
    #[macro_export]
    macro_rules! oc_rep_set_array(( $ object : ident , $ key : ident ) => {
                                  {
                                  let _ = "begin oc_rep_set_array" ; let
                                  _object = $ object ; let _key = $ key ; let
                                  _child = concat ! (
                                  stringify ! ( $ object ) , "_map" ) ; let _
                                  = concat ! (
                                  "TODO: g_err |= cbor_encode_text_string(&" ,
                                  stringify ! ( $ object ) , "_map" , ", " ,
                                  stringify ! ( $ key ) , ", strlen(" ,
                                  stringify ! ( $ key ) , "));" ) ; let _ =
                                  concat ! (
                                  "TODO: oc_rep_start_array!(" , stringify ! (
                                  $ object ) , "_map" , ", " , stringify ! (
                                  $ key ) , ");" ) ; oc_rep_start_array ! (
                                  $ object , $ key , "_map" ) ; let _ =
                                  "end oc_rep_set_array" ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_close_array(( $ object : ident , $ key : ident ) => {
                                    {
                                    let _ = "begin oc_rep_close_array" ; let
                                    _object = $ object ; let _key = $ key ;
                                    let _child = concat ! (
                                    stringify ! ( $ object ) , "_map" ) ; let
                                    _ = concat ! (
                                    "TODO: oc_rep_end_array(" , stringify ! (
                                    $ object ) , "_map" , ", " , stringify ! (
                                    $ key ) , ");" ) ; oc_rep_end_array ! (
                                    $ object , $ key , "_map" ) ; let _ =
                                    "end oc_rep_close_array" ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_object_array_start_item(( $ key : ident ) => {
                                                {
                                                let _ =
                                                "begin oc_rep_object_array_start_item"
                                                ; let _ = concat ! (
                                                "TODO: oc_rep_start_object(" ,
                                                stringify ! ( $ key ) ,
                                                "_array" , ", " , stringify !
                                                ( $ key ) , ");" ) ;
                                                oc_rep_start_object ! (
                                                $ key , $ key , "_array" ) ;
                                                let _ =
                                                "end oc_rep_object_array_start_item"
                                                ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_object_array_end_item(( $ key : ident ) => {
                                              {
                                              let _ =
                                              "begin oc_rep_object_array_end_item"
                                              ; let _ = concat ! (
                                              "TODO: oc_rep_end_object(" ,
                                              stringify ! ( $ key ) , "_array"
                                              , ", " , stringify ! ( $ key ) ,
                                              ");" ) ; oc_rep_end_object ! (
                                              $ key , $ key , "_array" ) ; let
                                              _ =
                                              "end oc_rep_object_array_end_item"
                                              ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_set_int((
                                $ object : ident , $ key : expr , $ value :
                                expr ) => {
                                {
                                let _ =
                                "begin oc_rep_set_int with _object, _key, _value"
                                ; let _object = $ object ; let _key = $ key ;
                                let _value = $ value ; let _child = concat ! (
                                stringify ! ( $ object ) , "_map" ) ; let _ =
                                concat ! (
                                "TODO: g_err |= cbor_encode_text_string(&" ,
                                stringify ! ( $ object ) , "_map" , ", " ,
                                stringify ! ( $ key ) , ", strlen(" ,
                                stringify ! ( $ key ) , "));" ) ; let _ =
                                concat ! (
                                "TODO: g_err |= cbor_encode_int(&" , stringify
                                ! ( $ object ) , "_map" , ", " , stringify ! (
                                $ value ) , ");" ) ; let _ =
                                "end oc_rep_set_int" ; } } ;);
    ///  Same as oc_rep_set_int but changed "#key" to "key" so that the key won't be stringified.
    #[macro_export]
    macro_rules! oc_rep_set_int_k((
                                  $ object : ident , $ key : expr , $ value :
                                  expr ) => {
                                  {
                                  let _ =
                                  "begin oc_rep_set_int_k with _object, _key, _value"
                                  ; let _object = $ object ; let _key = $ key
                                  ; let _value = $ value ; let _child = concat
                                  ! ( stringify ! ( $ object ) , "_map" ) ;
                                  let _ = concat ! (
                                  "TODO: g_err |= cbor_encode_text_string(&" ,
                                  stringify ! ( $ object ) , "_map" , ", " ,
                                  stringify ! ( $ key ) , ", strlen(" ,
                                  stringify ! ( $ key ) , "));" ) ; let _ =
                                  concat ! (
                                  "TODO: g_err |= cbor_encode_int(&" ,
                                  stringify ! ( $ object ) , "_map" , ", " ,
                                  stringify ! ( $ value ) , ");" ) ; let _ =
                                  "end oc_rep_set_int_k" ; } } ;);
    #[macro_export]
    macro_rules! oc_rep_set_text_string((
                                        $ object : ident , $ key : expr , $
                                        value : expr ) => {
                                        {
                                        let _ =
                                        "begin oc_rep_set_text_string with _object, _key, _value"
                                        ; let _object = $ object ; let _key =
                                        $ key ; let _value = $ value ; let
                                        _child = concat ! (
                                        stringify ! ( $ object ) , "_map" ) ;
                                        let _ = concat ! (
                                        "TODO: g_err |= cbor_encode_text_string(&"
                                        , stringify ! ( $ object ) , "_map" ,
                                        ", " , stringify ! ( $ key ) ,
                                        ", strlen(" , stringify ! ( $ key ) ,
                                        "));" ) ; let _ = concat ! (
                                        "TODO: g_err |= cbor_encode_text_string(&"
                                        , stringify ! ( $ object ) , "_map" ,
                                        ", " , stringify ! ( $ value ) ,
                                        ", strlen(" , stringify ! ( $ value )
                                        , "));" ) ; let _ =
                                        "end oc_rep_set_text_string" ; } } ;);
    #[macro_export]
    macro_rules! test_literal(( $ key : literal ) => {
                              { let _ = concat ! ( $ key , "_zzz" ) ; } } ;);
    #[macro_export]
    macro_rules! test_ident(( $ key : ident ) => {
                            { let $ key = stringify ! ( $ key ) ; } } ;);
    #[macro_export]
    macro_rules! test_internal_rules2(( @ json $ key : ident ) => {
                                      let _ = concat ! (
                                      "json2: " , stringify ! ( $ key ) ) ; }
                                      ; ( @ cbor $ key : ident ) => {
                                      let _ = concat ! (
                                      "cbor2: " , stringify ! ( $ key ) ) ; }
                                      ; ( @ $ encoding : ident $ key : ident )
                                      => {
                                      let _ = concat ! (
                                      "other2: " , stringify ! ( $ encoding )
                                      , " / " , stringify ! ( $ key ) ) ; }
                                      ;);
    #[macro_export]
    macro_rules! test_internal_rules(( @ json $ key : ident ) => {
                                     let _ = concat ! (
                                     "json: " , stringify ! ( $ key ) ) ;
                                     test_internal_rules2 ! ( @ json $ key ) ;
                                     } ; ( @ cbor $ key : ident ) => {
                                     let _ = concat ! (
                                     "cbor: " , stringify ! ( $ key ) ) ;
                                     test_internal_rules2 ! ( @ cbor $ key ) ;
                                     } ; ( @ $ encoding : ident $ key : ident
                                     ) => {
                                     let _ = concat ! (
                                     "other: " , stringify ! ( $ encoding ) ,
                                     " / " , stringify ! ( $ key ) ) ;
                                     test_internal_rules2 ! (
                                     @ $ encoding $ key ) ; } ;);
    const SEND_JSON_FORMAT: bool = false;
    ///  Compose a CoAP message (CBOR or JSON) with the sensor value in `val` and transmit to the
    ///  Collector Node (if this is a Sensor Node) or to the CoAP Server (if this is a Collector Node
    ///  or Standalone Node).
    fn send_sensor_data_json() {
        ();
        let _ = "json: a";
        let _ = "json2: a";
        let _ = "cbor: b";
        let _ = "cbor2: b";
        let _ = "other: zzz / c";
        let _ = "other2: zzz / c";
        ();
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        let float_sensor_value =
            SensorValueNew{key: "tmp", val: SensorValueType::Float(28.70),};
        ();
        let payload =
            {
                let _ = "begin json root";
                let root = "root";
                {
                    let _ = "begin coap_root";
                    {
                        let _ = "begin oc_rep_start_root_object";
                        let _ =
                            "TODO: g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength);";
                        let _ = "end oc_rep_start_root_object";
                    };
                    {
                        let values = "values";
                        {
                            let _ = "begin coap_array with _object0, _key0";
                            let _object0 = root;
                            let _key0 = values;
                            {
                                let _ = "begin oc_rep_set_array";
                                let _object = root;
                                let _key = values;
                                let _child = "root_map";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&root_map, values, strlen(values));";
                                let _ =
                                    "TODO: oc_rep_start_array!(root_map, values);";
                                {
                                    let _ = "begin oc_rep_start_array";
                                    let _parent = "root_map";
                                    let _key = values;
                                    let _child = "values_array";
                                    let _ = "TODO: CborEncoder values_array;";
                                    let _ =
                                        "TODO: g_err |= cbor_encoder_create_array(&root_map, &values_array, CborIndefiniteLength);";
                                    let _ = "end oc_rep_start_array";
                                };
                                let _ = "end oc_rep_set_array";
                            };
                            { let _object = values; };
                            {
                                let _ = "begin oc_rep_close_array";
                                let _object = root;
                                let _key = values;
                                let _child = "root_map";
                                let _ =
                                    "TODO: oc_rep_end_array(root_map, values);";
                                {
                                    let _ = "begin oc_rep_end_array";
                                    let _parent = "root_map";
                                    let _key = values;
                                    let _child = "values_array";
                                    let _ =
                                        "TODO: g_err |= cbor_encoder_close_container(&root_map, &values_array);";
                                    let _ = "end oc_rep_end_array";
                                };
                                let _ = "end oc_rep_close_array";
                            };
                            let _ = "end coap_array";
                        };
                    };
                    {
                        let _ = "begin oc_rep_end_root_object";
                        let _ =
                            "TODO: g_err |= cbor_encoder_close_container(&g_encoder, &root_map);";
                        let _ = "end oc_rep_end_root_object";
                    };
                    let _ = "end coap_root";
                };
                let _ = "end json root";
                let _ = "return json root to caller";
                root
            };
        ();
    }
    fn send_sensor_data_cbor() {
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        ();
        let payload =
            {
                let _ = "begin cbor root";
                let root = "root";
                {
                    let _ = "begin coap_root";
                    {
                        let _ = "begin oc_rep_start_root_object";
                        let _ =
                            "TODO: g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength);";
                        let _ = "end oc_rep_start_root_object";
                    };
                    {
                        let _ = "token ident";
                        let _ =
                            "TODO: Expand _sensor_value (key, value) and add to _object";
                        let _sensor_value = int_sensor_value;
                        let _object = root;
                        let _ = "--------------------";
                        {
                            let _ =
                                "begin coap_set_int_val with _parent0, _val0";
                            let _parent0 = root;
                            let _ = "TODO: let _val0 = $val0;";
                            let _ = "TODO: let _key = _sensor_value.key;";
                            let _ = "TODO: let _value = _sensor_value.value;";
                            let _ =
                                "TODO: assert(val0->val_type == SENSOR_VALUE_TYPE_INT32);";
                            let _ =
                                "TODO: rep_set_int_k(parent0, val0->key, val0->int_val);";
                            {
                                let _ =
                                    "begin oc_rep_set_int_k with _object, _key, _value";
                                let _object = root;
                                let _key = "TODO: val0->key";
                                let _value = "TODO: val0->int_val";
                                let _child = "root_map";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&root_map, \"TODO: val0->key\", strlen(\"TODO: val0->key\"));";
                                let _ =
                                    "TODO: g_err |= cbor_encode_int(&root_map, \"TODO: val0->int_val\");";
                                let _ = "end oc_rep_set_int_k";
                            };
                            let _ = "end coap_set_int_val";
                        };
                    };
                    {
                        let _ = "begin oc_rep_end_root_object";
                        let _ =
                            "TODO: g_err |= cbor_encoder_close_container(&g_encoder, &root_map);";
                        let _ = "end oc_rep_end_root_object";
                    };
                    let _ = "end coap_root";
                };
                let _ = "end cbor root";
                let _ = "return cbor root to caller";
                root
            };
        ();
    }
    pub struct SensorValueNew {
        ///  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
        pub key: &'static str,
        ///  The type of the sensor value and the value.
        pub val: SensorValueType,
    }
    pub enum SensorValueType {

        ///  32-bit unsigned integer. For raw temp, contains the raw temp integer value
        Uint(u32),

        ///  32-bit float. For computed temp, contains the computed temp float value
        Float(f32),
    }
    fn test_macro2() {
        let root = "root_var";
        let values = "values_var";
        let device_id = b"0102030405060708090a0b0c0d0e0f10";
        let node_id = b"b3b4b5b6f1";
        let int_sensor_value =
            SensorValueNew{key: "t", val: SensorValueType::Uint(2870),};
        {
            let _ = "begin coap_item_str with _parent, _key, _val";
            let _parent = values;
            let _key = "device";
            let _val = device_id;
            {
                let _ = "begin coap_item";
                {
                    let _ = "begin oc_rep_object_array_start_item";
                    let _ =
                        "TODO: oc_rep_start_object(values_array, values);";
                    {
                        let _ = "begin oc_rep_start_object";
                        let _parent0 = "values_array";
                        let _key0 = values;
                        let _child = "values_map";
                        let _ = "TODO: CborEncoder values_map";
                        let _ =
                            "TODO: g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength);";
                        let _ = "end oc_rep_start_object";
                    };
                    let _ = "end oc_rep_object_array_start_item";
                };
                {
                    {
                        let _ =
                            "begin oc_rep_set_text_string with _object, _key, _value";
                        let _object = values;
                        let _key = "key";
                        let _value = "device";
                        let _child = "values_map";
                        let _ =
                            "TODO: g_err |= cbor_encode_text_string(&values_map, \"key\", strlen(\"key\"));";
                        let _ =
                            "TODO: g_err |= cbor_encode_text_string(&values_map, \"device\", strlen(\"device\"));";
                        let _ = "end oc_rep_set_text_string";
                    };
                    {
                        let _ =
                            "begin oc_rep_set_text_string with _object, _key, _value";
                        let _object = values;
                        let _key = "value";
                        let _value = device_id;
                        let _child = "values_map";
                        let _ =
                            "TODO: g_err |= cbor_encode_text_string(&values_map, \"value\", strlen(\"value\"));";
                        let _ =
                            "TODO: g_err |= cbor_encode_text_string(&values_map, device_id, strlen(device_id));";
                        let _ = "end oc_rep_set_text_string";
                    };
                };
                {
                    let _ = "begin oc_rep_object_array_end_item";
                    let _ = "TODO: oc_rep_end_object(values_array, values);";
                    {
                        let _ = "begin oc_rep_end_object";
                        let _parent0 = "values_array";
                        let _key0 = values;
                        let _child = "values_map";
                        let _ =
                            "TODO: g_err |= cbor_encoder_close_container(&values_array, &values_map);";
                        let _ = "end oc_rep_end_object";
                    };
                    let _ = "end oc_rep_object_array_end_item";
                };
                let _ = "end coap_item";
            };
            let _ = "end coap_item_str";
        };
        {
            let _ = "begin coap_array with _object0, _key0";
            let _object0 = root;
            let _key0 = values;
            {
                let _ = "begin oc_rep_set_array";
                let _object = root;
                let _key = values;
                let _child = "root_map";
                let _ =
                    "TODO: g_err |= cbor_encode_text_string(&root_map, values, strlen(values));";
                let _ = "TODO: oc_rep_start_array!(root_map, values);";
                {
                    let _ = "begin oc_rep_start_array";
                    let _parent = "root_map";
                    let _key = values;
                    let _child = "values_array";
                    let _ = "TODO: CborEncoder values_array;";
                    let _ =
                        "TODO: g_err |= cbor_encoder_create_array(&root_map, &values_array, CborIndefiniteLength);";
                    let _ = "end oc_rep_start_array";
                };
                let _ = "end oc_rep_set_array";
            };
            {
                {
                    let _ = "begin coap_item_str with _parent, _key, _val";
                    let _parent = values;
                    let _key = "device";
                    let _val = device_id;
                    {
                        let _ = "begin coap_item";
                        {
                            let _ = "begin oc_rep_object_array_start_item";
                            let _ =
                                "TODO: oc_rep_start_object(values_array, values);";
                            {
                                let _ = "begin oc_rep_start_object";
                                let _parent0 = "values_array";
                                let _key0 = values;
                                let _child = "values_map";
                                let _ = "TODO: CborEncoder values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength);";
                                let _ = "end oc_rep_start_object";
                            };
                            let _ = "end oc_rep_object_array_start_item";
                        };
                        {
                            {
                                let _ =
                                    "begin oc_rep_set_text_string with _object, _key, _value";
                                let _object = values;
                                let _key = "key";
                                let _value = "device";
                                let _child = "values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, \"key\", strlen(\"key\"));";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, \"device\", strlen(\"device\"));";
                                let _ = "end oc_rep_set_text_string";
                            };
                            {
                                let _ =
                                    "begin oc_rep_set_text_string with _object, _key, _value";
                                let _object = values;
                                let _key = "value";
                                let _value = device_id;
                                let _child = "values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, \"value\", strlen(\"value\"));";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, device_id, strlen(device_id));";
                                let _ = "end oc_rep_set_text_string";
                            };
                        };
                        {
                            let _ = "begin oc_rep_object_array_end_item";
                            let _ =
                                "TODO: oc_rep_end_object(values_array, values);";
                            {
                                let _ = "begin oc_rep_end_object";
                                let _parent0 = "values_array";
                                let _key0 = values;
                                let _child = "values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encoder_close_container(&values_array, &values_map);";
                                let _ = "end oc_rep_end_object";
                            };
                            let _ = "end oc_rep_object_array_end_item";
                        };
                        let _ = "end coap_item";
                    };
                    let _ = "end coap_item_str";
                };
                {
                    let _ = "begin coap_item_str with _parent, _key, _val";
                    let _parent = values;
                    let _key = "node";
                    let _val = node_id;
                    {
                        let _ = "begin coap_item";
                        {
                            let _ = "begin oc_rep_object_array_start_item";
                            let _ =
                                "TODO: oc_rep_start_object(values_array, values);";
                            {
                                let _ = "begin oc_rep_start_object";
                                let _parent0 = "values_array";
                                let _key0 = values;
                                let _child = "values_map";
                                let _ = "TODO: CborEncoder values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength);";
                                let _ = "end oc_rep_start_object";
                            };
                            let _ = "end oc_rep_object_array_start_item";
                        };
                        {
                            {
                                let _ =
                                    "begin oc_rep_set_text_string with _object, _key, _value";
                                let _object = values;
                                let _key = "key";
                                let _value = "node";
                                let _child = "values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, \"key\", strlen(\"key\"));";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, \"node\", strlen(\"node\"));";
                                let _ = "end oc_rep_set_text_string";
                            };
                            {
                                let _ =
                                    "begin oc_rep_set_text_string with _object, _key, _value";
                                let _object = values;
                                let _key = "value";
                                let _value = node_id;
                                let _child = "values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, \"value\", strlen(\"value\"));";
                                let _ =
                                    "TODO: g_err |= cbor_encode_text_string(&values_map, node_id, strlen(node_id));";
                                let _ = "end oc_rep_set_text_string";
                            };
                        };
                        {
                            let _ = "begin oc_rep_object_array_end_item";
                            let _ =
                                "TODO: oc_rep_end_object(values_array, values);";
                            {
                                let _ = "begin oc_rep_end_object";
                                let _parent0 = "values_array";
                                let _key0 = values;
                                let _child = "values_map";
                                let _ =
                                    "TODO: g_err |= cbor_encoder_close_container(&values_array, &values_map);";
                                let _ = "end oc_rep_end_object";
                            };
                            let _ = "end oc_rep_object_array_end_item";
                        };
                        let _ = "end coap_item";
                    };
                    let _ = "end coap_item_str";
                };
            };
            {
                let _ = "begin oc_rep_close_array";
                let _object = root;
                let _key = values;
                let _child = "root_map";
                let _ = "TODO: oc_rep_end_array(root_map, values);";
                {
                    let _ = "begin oc_rep_end_array";
                    let _parent = "root_map";
                    let _key = values;
                    let _child = "values_array";
                    let _ =
                        "TODO: g_err |= cbor_encoder_close_container(&root_map, &values_array);";
                    let _ = "end oc_rep_end_array";
                };
                let _ = "end oc_rep_close_array";
            };
            let _ = "end coap_array";
        };
        let payload =
            {
                let _ = "begin coap_root";
                {
                    let _ = "begin oc_rep_start_root_object";
                    let _ =
                        "TODO: g_err |= cbor_encoder_create_map(&g_encoder, &root_map, CborIndefiniteLength);";
                    let _ = "end oc_rep_start_root_object";
                };
                {
                    {
                        let _ = "begin coap_array with _object0, _key0";
                        let _object0 = root;
                        let _key0 = values;
                        {
                            let _ = "begin oc_rep_set_array";
                            let _object = root;
                            let _key = values;
                            let _child = "root_map";
                            let _ =
                                "TODO: g_err |= cbor_encode_text_string(&root_map, values, strlen(values));";
                            let _ =
                                "TODO: oc_rep_start_array!(root_map, values);";
                            {
                                let _ = "begin oc_rep_start_array";
                                let _parent = "root_map";
                                let _key = values;
                                let _child = "values_array";
                                let _ = "TODO: CborEncoder values_array;";
                                let _ =
                                    "TODO: g_err |= cbor_encoder_create_array(&root_map, &values_array, CborIndefiniteLength);";
                                let _ = "end oc_rep_start_array";
                            };
                            let _ = "end oc_rep_set_array";
                        };
                        {
                            {
                                let _ =
                                    "begin coap_item_str with _parent, _key, _val";
                                let _parent = values;
                                let _key = "device";
                                let _val = device_id;
                                {
                                    let _ = "begin coap_item";
                                    {
                                        let _ =
                                            "begin oc_rep_object_array_start_item";
                                        let _ =
                                            "TODO: oc_rep_start_object(values_array, values);";
                                        {
                                            let _ =
                                                "begin oc_rep_start_object";
                                            let _parent0 = "values_array";
                                            let _key0 = values;
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: CborEncoder values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength);";
                                            let _ = "end oc_rep_start_object";
                                        };
                                        let _ =
                                            "end oc_rep_object_array_start_item";
                                    };
                                    {
                                        {
                                            let _ =
                                                "begin oc_rep_set_text_string with _object, _key, _value";
                                            let _object = values;
                                            let _key = "key";
                                            let _value = "device";
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, \"key\", strlen(\"key\"));";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, \"device\", strlen(\"device\"));";
                                            let _ =
                                                "end oc_rep_set_text_string";
                                        };
                                        {
                                            let _ =
                                                "begin oc_rep_set_text_string with _object, _key, _value";
                                            let _object = values;
                                            let _key = "value";
                                            let _value = device_id;
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, \"value\", strlen(\"value\"));";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, device_id, strlen(device_id));";
                                            let _ =
                                                "end oc_rep_set_text_string";
                                        };
                                    };
                                    {
                                        let _ =
                                            "begin oc_rep_object_array_end_item";
                                        let _ =
                                            "TODO: oc_rep_end_object(values_array, values);";
                                        {
                                            let _ = "begin oc_rep_end_object";
                                            let _parent0 = "values_array";
                                            let _key0 = values;
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encoder_close_container(&values_array, &values_map);";
                                            let _ = "end oc_rep_end_object";
                                        };
                                        let _ =
                                            "end oc_rep_object_array_end_item";
                                    };
                                    let _ = "end coap_item";
                                };
                                let _ = "end coap_item_str";
                            };
                            {
                                let _ =
                                    "begin coap_item_str with _parent, _key, _val";
                                let _parent = values;
                                let _key = "node";
                                let _val = node_id;
                                {
                                    let _ = "begin coap_item";
                                    {
                                        let _ =
                                            "begin oc_rep_object_array_start_item";
                                        let _ =
                                            "TODO: oc_rep_start_object(values_array, values);";
                                        {
                                            let _ =
                                                "begin oc_rep_start_object";
                                            let _parent0 = "values_array";
                                            let _key0 = values;
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: CborEncoder values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encoder_create_map(&values_array, &values_map, CborIndefiniteLength);";
                                            let _ = "end oc_rep_start_object";
                                        };
                                        let _ =
                                            "end oc_rep_object_array_start_item";
                                    };
                                    {
                                        {
                                            let _ =
                                                "begin oc_rep_set_text_string with _object, _key, _value";
                                            let _object = values;
                                            let _key = "key";
                                            let _value = "node";
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, \"key\", strlen(\"key\"));";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, \"node\", strlen(\"node\"));";
                                            let _ =
                                                "end oc_rep_set_text_string";
                                        };
                                        {
                                            let _ =
                                                "begin oc_rep_set_text_string with _object, _key, _value";
                                            let _object = values;
                                            let _key = "value";
                                            let _value = node_id;
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, \"value\", strlen(\"value\"));";
                                            let _ =
                                                "TODO: g_err |= cbor_encode_text_string(&values_map, node_id, strlen(node_id));";
                                            let _ =
                                                "end oc_rep_set_text_string";
                                        };
                                    };
                                    {
                                        let _ =
                                            "begin oc_rep_object_array_end_item";
                                        let _ =
                                            "TODO: oc_rep_end_object(values_array, values);";
                                        {
                                            let _ = "begin oc_rep_end_object";
                                            let _parent0 = "values_array";
                                            let _key0 = values;
                                            let _child = "values_map";
                                            let _ =
                                                "TODO: g_err |= cbor_encoder_close_container(&values_array, &values_map);";
                                            let _ = "end oc_rep_end_object";
                                        };
                                        let _ =
                                            "end oc_rep_object_array_end_item";
                                    };
                                    let _ = "end coap_item";
                                };
                                let _ = "end coap_item_str";
                            };
                            {
                                let _ =
                                    "begin coap_set_int_val with _parent0, _val0";
                                let _parent0 = root;
                                let _ = "TODO: let _val0 = $val0;";
                                let _ = "TODO: let _key = _sensor_value.key;";
                                let _ =
                                    "TODO: let _value = _sensor_value.value;";
                                let _ =
                                    "TODO: assert(val0->val_type == SENSOR_VALUE_TYPE_INT32);";
                                let _ =
                                    "TODO: rep_set_int_k(parent0, val0->key, val0->int_val);";
                                {
                                    let _ =
                                        "begin oc_rep_set_int_k with _object, _key, _value";
                                    let _object = root;
                                    let _key = "TODO: val0->key";
                                    let _value = "TODO: val0->int_val";
                                    let _child = "root_map";
                                    let _ =
                                        "TODO: g_err |= cbor_encode_text_string(&root_map, \"TODO: val0->key\", strlen(\"TODO: val0->key\"));";
                                    let _ =
                                        "TODO: g_err |= cbor_encode_int(&root_map, \"TODO: val0->int_val\");";
                                    let _ = "end oc_rep_set_int_k";
                                };
                                let _ = "end coap_set_int_val";
                            };
                        };
                        {
                            let _ = "begin oc_rep_close_array";
                            let _object = root;
                            let _key = values;
                            let _child = "root_map";
                            let _ =
                                "TODO: oc_rep_end_array(root_map, values);";
                            {
                                let _ = "begin oc_rep_end_array";
                                let _parent = "root_map";
                                let _key = values;
                                let _child = "values_array";
                                let _ =
                                    "TODO: g_err |= cbor_encoder_close_container(&root_map, &values_array);";
                                let _ = "end oc_rep_end_array";
                            };
                            let _ = "end oc_rep_close_array";
                        };
                        let _ = "end coap_array";
                    }
                };
                {
                    let _ = "begin oc_rep_end_root_object";
                    let _ =
                        "TODO: g_err |= cbor_encoder_close_container(&g_encoder, &root_map);";
                    let _ = "end oc_rep_end_root_object";
                };
                let _ = "end coap_root";
            };
    }
    macro_rules! calculate(( eval $ e : expr ) => {
                           { { let val : usize = $ e ; } } } ;);
    fn test_macro() {
        { { let val: usize = 1 + 2; } }
        { { let val: usize = (1 + 2) * (3 / 4); } }
    }
    ///  TODO: Start the Network Task in the background.  The Network Task prepares the network drivers
    ///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
    ///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
    ///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
    pub fn start_network_task() -> Result<(), i32> {
        console_print(b"start_network_task\n");
        test_macro();
        test_macro2();
        if SEND_JSON_FORMAT {
            send_sensor_data_json();
        } else { send_sensor_data_cbor(); }
        Ok(())
    }
    ///  TODO: Compose a CoAP message (CBOR or JSON) with the sensor value in `val` and transmit to the
    ///  Collector Node (if this is a Sensor Node) or to the CoAP Server (if this is a Collector Node
    ///  or Standalone Node).  
    ///  For Sensor Node or Standalone Node: sensor_node is the sensor name (`bme280_0` or `temp_stm32_0`)
    ///  For Collector Node: sensor_node is the Sensor Node Address of the Sensor Node that transmitted
    ///  the sensor data (like `b3b4b5b6f1`)
    ///  The message will be enqueued for transmission by the CoAP / OIC Background Task 
    ///  so this function will return without waiting for the message to be transmitted.  
    ///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
    pub fn send_sensor_data(_val: *const SensorValue,
                            _sensor_node: &'static CStr) -> i32 {
        console_print(b"send_sensor_data\n");
        0
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use crate::base::*;
use crate::listen_sensor::*;
use crate::send_coap::*;
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
pub extern "C" fn main() -> ! {
    unsafe { rust_sysinit() };
    unsafe { console_flush() };
    let rc = start_network_task();
    rc.expect("");
    let rc = start_sensor_listener();
    if !(rc == 0) {
        {
            ::core::panicking::panic(&("assertion failed: rc == 0",
                                       "src/lib.rs", 39u32, 40u32))
        }
    };
    loop  { unsafe { os_eventq_run(os_eventq_dflt_get()) } }
}
///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    if let Some(location) = info.location() {
        let file = location.file();
        let line = location.line();
        console_print(b"panic at ");
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
        console_print(b" line 0x");
        unsafe { console_printhex(line as u8) }
        console_print(b"\n");
        unsafe { console_flush() }
    } else {
        console_print(b"panic unknown loc\n");
        unsafe { console_flush() }
    }
    bkpt();
    loop  { }
}
