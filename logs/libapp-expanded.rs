#![feature(prelude_import)]
#![no_std]
//!  Sensor app that reads sensor data from a temperature sensor and sends the sensor data to a CoAP server or Collector Node.
//!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
//!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/main.c`

#![no_std]
//  Don't link with standard Rust library, which is not compatible with embedded systems
#![feature(trace_macros)]
//  Allow macro tracing: `trace_macros!(true)`
#![feature(concat_idents)]
//  Allow `concat_idents!()` macro used in `coap!()` macro
#![feature(const_transmute)]
//  Allow `transmute` for initialising Mynewt structs
#![feature(proc_macro_hygiene)]
//  Allow Procedural Macros like `run!()`
#![feature(custom_attribute)]
#[prelude_import]
use ::core::prelude::v1::*;
#[macro_use]
extern crate core as core;
#[macro_use]
extern crate compiler_builtins as compiler_builtins;
//  Allow Custom Attributes like `#[safe_wrap]`

extern crate cortex_m;
//  Declare the external library `cortex_m`
extern crate macros;
//  Declare the Mynewt Macros library
extern crate mynewt;
//  Declare the Mynewt library

//  Suppress warnings of unused constants and vars
#[allow(dead_code)]
mod base {
    //  Declare `base.rs` as Rust module `base`

    //  Declare `listen_sensor.rs` as Rust module `listen_sensor`
    //  Declare `send_coap.rs` as Rust module `send_coap`

    //  Import `PanicInfo` type which is used by `panic()` below
    //  Import cortex_m assembly function to inject breakpoint
    //  Import Mynewt OS API
    //  Import `base.rs` for common declarations

    //  Don't mangle the name "main"
    //  Declare extern "C" because it will be called by Mynewt
    //  Init Mynewt system.


    //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
    //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
    //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.

    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
    //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.

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
    use cty::c_char;
    use mynewt::kernel::os::os_dev;
    use mynewt::hw::sensor::{self, sensor_ptr, sensor_data_ptr,
                             sensor_temp_data, sensor_type_t};
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
        pub fn get_temp_raw_data(sensor_data: sensor_data_ptr,
                                 dest: *mut sensor_temp_raw_data) -> i32;
        ///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
        ///  Copy the sensor data into `dest`.  Return 0 if successful.
        ///  C API: `int get_temp_data(void *sensor_data, struct sensor_temp_data *dest)`
        pub fn get_temp_data(sensor_data: sensor_data_ptr,
                             dest: *mut sensor_temp_data) -> i32;
        ///  Return the Mynewt device for the Mynewt sensor.
        ///  C API: `struct os_dev *sensor_get_device(struct sensor *s)`
        pub fn sensor_get_device(sensor: sensor_ptr) -> *mut os_dev;
        ///  Return the name for the Mynewt device.  Assumes name is non-null.
        ///  C API: `const char *device_get_name(struct os_dev *device)`
        pub fn device_get_name(device: *mut os_dev) -> *const c_char;
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
    ///  We will open internal temperature sensor `temp_stm32_0`.
    ///  Must sync with apps/my_sensor_app/src/listen_sensor.h
    pub const SENSOR_DEVICE: *const c_char = TEMP_STM32_DEVICE;
    pub const TEMP_STM32_DEVICE: *const c_char =
        b"temp_stm32_0\0".as_ptr() as *const c_char;
    ///  Set to raw sensor type
    pub const TEMP_SENSOR_TYPE: sensor_type_t =
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;
    ///  Return integer sensor values
    pub const TEMP_SENSOR_VALUE_TYPE: i32 =
        sensor::SENSOR_VALUE_TYPE_INT32 as i32;
    ///  Use key (field name) `t` to transmit raw temperature to CoAP Server or Collector Node
    pub const TEMP_SENSOR_KEY: &str = "t";
    ///  Sensor type for raw temperature sensor.
    ///  Must sync with libs/custom_sensor/include/custom_sensor/custom_sensor.h
    pub const SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: sensor_type_t =
        sensor::sensor_type_t_SENSOR_TYPE_USER_DEFINED_1;
    ///  Represents a decoded sensor data value. Since temperature may be integer (raw)
    ///  or float (computed), we use the struct to return both integer and float values.
    pub struct SensorValue {
        ///  Null-terminated string for the key.  `t` for raw temp, `tmp` for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
        pub key: &'static str,
        ///  The type of the sensor value and the value.
        pub val: SensorValueType,
    }
    ///  Default sensor value is `None`
    impl Default for SensorValue {
        #[inline]
        fn default() -> SensorValue {
            SensorValue{key: "", val: SensorValueType::None,}
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
    #[repr(C, packed)]
    pub struct sensor_temp_raw_data {
        ///  Raw temp from STM32 Internal Temp Sensor is 0 to 4095.
        pub strd_temp_raw: u32,
        ///  1 if data is valid
        pub strd_temp_raw_is_valid: u8,
    }
}
mod listen_sensor {
    //!  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
    //!  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
    //!       This sensor is selected if BME280_OFB is defined in syscfg.yml.
    //!  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
    //!       This sensor is selected if TEMP_STM32 is defined in syscfg.yml.
    //!  If this is the Collector Node, send the sensor data to the CoAP Server after polling.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/listen_sensor.c`
    use cstr_core::CStr;
    use cty::c_char;
    use mynewt::{result::*, fill_zero,
                 hw::sensor::{self, sensor_ptr, sensor_arg, sensor_data_ptr,
                              sensor_listener, sensor_temp_data,
                              sensor_type_t}};
    use crate::base::*;
    use crate::send_coap::send_sensor_data;
    ///  Poll every 10,000 milliseconds (10 seconds)  
    const SENSOR_POLL_TIME: u32 = (10 * 1000);
    ///  Indicate that this is a listener callback
    const LISTENER_CB: sensor_arg = 1 as sensor_arg;
    ///  For Sensor Node and Standalone Node: Start polling the temperature sensor 
    ///  every 10 seconds in the background.  After polling the sensor, call the 
    ///  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
    ///  or CoAP Server (is this is a Standalone Node).
    ///  For Collector Node: Start the Listeners for Remote Sensor 
    ///  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
    ///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
    pub fn start_sensor_listener() -> MynewtResult<()> {
        console_print(b"TMP poll \n");
        sensor::set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME)?;
        let sensor =
            sensor::mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor())?;
        if !unsafe { !is_null_sensor(sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !is_null_sensor(sensor) }",
                                           "rust/app/src/listen_sensor.rs",
                                           50u32, 5u32))
            }
        };
        let listener =
            sensor_listener{sl_sensor_type: TEMP_SENSOR_TYPE,
                            sl_func: sensor::as_untyped(read_temperature),
                            sl_arg:
                                LISTENER_CB,
                                               ..unsafe {
                                                     ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_listener>()],
                                                                              sensor_listener>([0;
                                                                                                   ::core::mem::size_of::<sensor_listener>()])
                                                 }};
        sensor::register_listener(sensor, listener)?;
        Ok(())
    }
    ///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
    ///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
    ///  If this is a Sensor Node, we send the sensor data to the Collector Node.
    ///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    ///  Return 0 if we have processed the sensor data successfully.
    extern "C" fn read_temperature(sensor: sensor_ptr, _arg: sensor_arg,
                                   sensor_data: sensor_data_ptr,
                                   sensor_type: sensor_type_t)
     -> MynewtError {
        console_print(b"read_temperature\n");
        if unsafe { is_null_sensor_data(sensor_data) } {
            return MynewtError::SYS_EINVAL;
        }
        if !unsafe { !is_null_sensor(sensor) } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !is_null_sensor(sensor) }",
                                           "rust/app/src/listen_sensor.rs",
                                           86u32, 5u32))
            }
        };
        let device = unsafe { sensor_get_device(sensor) };
        let device_name_ptr: *const c_char =
            unsafe { device_get_name(device) };
        let device_name: &CStr = unsafe { CStr::from_ptr(device_name_ptr) };
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
        if let SensorValueType::None = temp_sensor_value.val {
            if !false {
                {
                    ::core::panicking::panic(&("assertion failed: false",
                                               "rust/app/src/listen_sensor.rs",
                                               98u32, 60u32))
                }
            };
        }
        let rc = send_sensor_data(&temp_sensor_value, device_name);
        if let Err(err) = rc {
            if err == MynewtError::SYS_EAGAIN {
                console_print(b"TMP network not ready\n");
                return MynewtError::SYS_EOK;
            }
        }
        MynewtError::SYS_EOK
    }
    ///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
    ///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
    ///  the raw or computed temperature, as well as the key and value type.
    #[allow(unreachable_patterns)]
    #[allow(unused_variables)]
    fn get_temperature(sensor_data: sensor_data_ptr,
                       sensor_type: sensor_type_t) -> SensorValue {
        let mut return_value = SensorValue::default();
        match sensor_type {
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {
                let mut rawtempdata =
                    unsafe {
                        ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_temp_raw_data>()],
                                                 sensor_temp_raw_data>([0;
                                                                           ::core::mem::size_of::<sensor_temp_raw_data>()])
                    };
                let rc =
                    unsafe {
                        get_temp_raw_data(sensor_data, &mut rawtempdata)
                    };
                if !(rc == 0) {
                    {
                        ::core::panicking::panic(&("assertion failed: rc == 0",
                                                   "rust/app/src/listen_sensor.rs",
                                                   130u32, 13u32))
                    }
                };
                if rawtempdata.strd_temp_raw_is_valid == 0 {
                    return return_value;
                }
                return_value.val =
                    SensorValueType::Uint(rawtempdata.strd_temp_raw);
                console_print(b"TMP listener got rawtmp \n");
            }
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {
                let mut tempdata =
                    unsafe {
                        ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_temp_data>()],
                                                 sensor_temp_data>([0;
                                                                       ::core::mem::size_of::<sensor_temp_data>()])
                    };
                let rc = unsafe { get_temp_data(sensor_data, &mut tempdata) };
                if !(rc == 0) {
                    {
                        ::core::panicking::panic(&("assertion failed: rc == 0",
                                                   "rust/app/src/listen_sensor.rs",
                                                   143u32, 13u32))
                    }
                };
                if tempdata.std_temp_is_valid() == 0 { return return_value; }
                return_value.val = SensorValueType::Float(tempdata.std_temp);
            }
            _ => {
                if !false {
                    {
                        ::core::panicking::panic(&("assertion failed: false",
                                                   "rust/app/src/listen_sensor.rs",
                                                   157u32, 13u32))
                    }
                };
                return return_value;
            }
        }
        return_value.key = TEMP_SENSOR_KEY;
        return_value
    }
}
mod send_coap {
    //!  Send sensor data to a CoAP Server or a Collector Node.  The CoAP payload will be encoded as JSON
    //!  for CoAP Server and CBOR for Collector Node.  The sensor data will be transmitted to 
    //!  CoAP Server over WiFi via the ESP8266 transceiver, and to Collector Node via nRF24L01 transceiver.
    //!  This enables transmission of Sensor Data to a local Sensor Network (via nRF24L01)
    //!  and to the internet (via ESP8266).  For sending to Collector Node we use raw temperature (integer) 
    //!  instead of computed temperature (floating-point) to make the encoding simpler and faster.
    //!  Note that we are using a patched version of apps/my_sensor_app/src/vsscanf.c that
    //!  fixes ESP8266 response parsing bugs.  The patched file must be present in that location.
    //!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/send_coap.c`
    use cstr_core::CStr;
    use cty::*;
    use macros::{out, strn, init_strn};
    use mynewt::{result::*,
                 kernel::os::{self, os_task, os_stack_t, os_task_func_t,
                              os_time_t},
                 encoding::{coap_context::{self, COAP_CONTEXT,
                                           ToBytesOptionalNull}, tinycbor},
                 libs::{mynewt_rust, sensor_network,
                        sensor_coap::{self, sensor_value}}, coap, d,
                 fill_zero, NULL, Out, Ptr, Strn};
    use crate::base::*;
    static _test_static: Strn = Strn{bytestr: b"hello\0",};
    fn test_safe_wrap() -> MynewtResult<()> {
        let _test_local = Strn{bytestr: b"hello\0",};
        "-------------------------------------------------------------";
        pub fn task_init(t: Out<os_task>, name: &Strn, func: os_task_func_t,
                         arg: Ptr, prio: u8, sanity_itvl: os_time_t,
                         stack_bottom: Out<[os_stack_t]>, stack_size: u16)
         -> MynewtResult<()> {
            "----------Insert Extern Decl: `extern C { pub fn ... }`----------";
            extern "C" {
                pub fn os_task_init(t: *mut os_task,
                                    name: *const ::cty::c_char,
                                    func: os_task_func_t,
                                    arg: *mut ::cty::c_void, prio: u8,
                                    sanity_itvl: os_time_t,
                                    stack_bottom: *mut os_stack_t,
                                    stack_size: u16) -> ::cty::c_int;
            }
            "----------Insert Validation: `Strn::validate_bytestr(name.bytestr)`----------";
            Strn::validate_bytestr(name.bytestr);
            unsafe {
                "----------Insert Call: `let result_code = os_task_init(`----------";
                let result_value =
                    os_task_init(t as *mut os_task,
                                 name.bytestr.as_ptr() as
                                     *const ::cty::c_char,
                                 func as os_task_func_t,
                                 arg as *mut ::cty::c_void, prio as u8,
                                 sanity_itvl as os_time_t,
                                 stack_bottom.as_ptr() as *mut os_stack_t,
                                 stack_size as u16);
                if result_value == 0 {
                    Ok(())
                } else { Err(MynewtError::from(result_value)) }
            }
        }
        "-------------------------------------------------------------";
        task_init(unsafe { &mut NETWORK_TASK }, &Strn::new(b"network\0"),
                  Some(network_task_func), NULL, 10,
                  os::OS_WAIT_FOREVER as u32,
                  unsafe { &mut NETWORK_TASK_STACK },
                  NETWORK_TASK_STACK_SIZE as u16)?;
        pub fn OLDtask_init(t: Out<os_task>, name: &Strn,
                            func: os_task_func_t, arg: Ptr, prio: u8,
                            sanity_itvl: os_time_t,
                            stack_bottom: Out<[os_stack_t]>,
                            stack_size: usize) -> MynewtResult<()> {
            extern "C" {
                pub fn os_task_init(t: *mut os_task,
                                    name: *const ::cty::c_char,
                                    func: os_task_func_t,
                                    arg: *mut ::cty::c_void, prio: u8,
                                    sanity_itvl: os_time_t,
                                    stack_bottom: *mut os_stack_t,
                                    stack_size: u16) -> ::cty::c_int;
            }
            Strn::validate_bytestr(name.bytestr);
            unsafe {
                let res =
                    os_task_init(t,
                                 name.bytestr.as_ptr() as
                                     *const ::cty::c_char, func, arg, prio,
                                 sanity_itvl,
                                 stack_bottom.as_ptr() as *mut os_stack_t,
                                 stack_size as u16);
                if res == 0 { Ok(()) } else { Err(MynewtError::from(res)) }
            }
        }
        #[doc = " Initialize a task."]
        #[doc = ""]
        #[doc =
              " This function initializes the task structure pointed to by t,"]
        #[doc =
              " clearing and setting it's stack pointer, provides sane defaults"]
        #[doc =
              " and sets the task as ready to run, and inserts it into the operating"]
        #[doc = " system scheduler."]
        #[doc = ""]
        #[doc = " - __`t`__: The task to initialize"]
        #[doc = " - __`name`__: The name of the task to initialize"]
        #[doc = " - __`func`__: The task function to call"]
        #[doc = " - __`arg`__: The argument to pass to this task function"]
        #[doc = " - __`prio`__: The priority at which to run this task"]
        #[doc =
              " - __`sanity_itvl`__: The time at which this task should check in with the"]
        #[doc =
              "                    sanity task.  OS_WAIT_FOREVER means never check in"]
        #[doc = "                    here."]
        #[doc =
              " - __`stack_bottom`__: A pointer to the bottom of a task's stack"]
        #[doc = " - __`stack_size`__: The overall size of the task's stack."]
        #[doc = ""]
        #[doc = " Return: 0 on success, non-zero on failure."]
        fn dummy() { }
        Ok(())
    }
    ///  Storage for Network Task: Mynewt task object will be saved here.
    static mut NETWORK_TASK: os_task =
        unsafe {
            ::core::mem::transmute::<[u8; ::core::mem::size_of::<os_task>()],
                                     os_task>([0;
                                                  ::core::mem::size_of::<os_task>()])
        };
    ///  Stack space for Network Task, initialised to 0.
    static mut NETWORK_TASK_STACK: [os_stack_t; NETWORK_TASK_STACK_SIZE] =
        [0; NETWORK_TASK_STACK_SIZE];
    ///  Size of the stack (in 4-byte units). Previously `OS_STACK_ALIGN(256)`  
    const NETWORK_TASK_STACK_SIZE: usize = 256;
    ///  Set to true when network tasks have been completed
    static mut NETWORK_IS_READY: bool = false;
    ///  Start the Network Task in the background.  The Network Task prepares the network drivers
    ///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
    ///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
    ///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
    pub fn start_network_task() -> MynewtResult<()> {
        console_print(b"NET start\n");
        let rc =
            unsafe {
                os::os_task_init(unsafe { &mut NETWORK_TASK },
                                 b"network\0".as_ptr() as *const c_char,
                                 Some(network_task_func), 0 as *mut c_void,
                                 10, os::OS_WAIT_FOREVER as u32,
                                 unsafe {
                                     NETWORK_TASK_STACK.as_ptr() as
                                         *mut os_stack_t
                                 }, NETWORK_TASK_STACK_SIZE as u16)
            };
        {
            match (&rc, &0) {
                (left_val, right_val) => {
                    if !(*left_val == *right_val) {
                        {
                            ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left == right)`\n  left: `",
                                                                                          "`,\n right: `",
                                                                                          "`"],
                                                                                        &match (&&*left_val,
                                                                                                &&*right_val)
                                                                                             {
                                                                                             (arg0,
                                                                                              arg1)
                                                                                             =>
                                                                                             [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                           ::core::fmt::Debug::fmt),
                                                                                              ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                           ::core::fmt::Debug::fmt)],
                                                                                         }),
                                                         &("rust/app/src/send_coap.rs",
                                                           202u32, 5u32))
                        }
                    }
                }
            }
        };
        Ok(())
    }
    ///  Network Task runs this function in the background to prepare the network drivers
    ///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  Also perform WiFi Geolocation if it is enabled.
    ///  For Collector Node and Standalone Node: We connect the ESP8266 to the WiFi access point. 
    ///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
    ///  Register the ESP8266 driver as the network transport for CoAP Server.  
    ///  For Collector Node and Sensor Nodes: We register the nRF24L01 driver as the network transport for 
    ///  CoAP Collector.
    extern "C" fn network_task_func(_arg: *mut ::cty::c_void) {
        console_print(b"NET start\n");
        if !unsafe { !NETWORK_IS_READY } {
            {
                ::core::panicking::panic(&("assertion failed: unsafe { !NETWORK_IS_READY }",
                                           "rust/app/src/send_coap.rs",
                                           214u32, 37u32))
            }
        };
        if unsafe {
               sensor_network::is_standalone_node() ||
                   sensor_network::is_collector_node()
           } {
            let rc = unsafe { sensor_network::register_server_transport() };
            {
                match (&rc, &0) {
                    (left_val, right_val) => {
                        if !(*left_val == *right_val) {
                            {
                                ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left == right)`\n  left: `",
                                                                                              "`,\n right: `",
                                                                                              "`"],
                                                                                            &match (&&*left_val,
                                                                                                    &&*right_val)
                                                                                                 {
                                                                                                 (arg0,
                                                                                                  arg1)
                                                                                                 =>
                                                                                                 [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                               ::core::fmt::Debug::fmt),
                                                                                                  ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                               ::core::fmt::Debug::fmt)],
                                                                                             }),
                                                             &("rust/app/src/send_coap.rs",
                                                               222u32, 75u32))
                            }
                        }
                    }
                }
            };
        }
        if unsafe {
               sensor_network::is_collector_node() ||
                   sensor_network::is_sensor_node()
           } {
            let rc =
                unsafe { sensor_network::register_collector_transport() };
            {
                match (&rc, &0) {
                    (left_val, right_val) => {
                        if !(*left_val == *right_val) {
                            {
                                ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left == right)`\n  left: `",
                                                                                              "`,\n right: `",
                                                                                              "`"],
                                                                                            &match (&&*left_val,
                                                                                                    &&*right_val)
                                                                                                 {
                                                                                                 (arg0,
                                                                                                  arg1)
                                                                                                 =>
                                                                                                 [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                               ::core::fmt::Debug::fmt),
                                                                                                  ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                               ::core::fmt::Debug::fmt)],
                                                                                             }),
                                                             &("rust/app/src/send_coap.rs",
                                                               230u32, 78u32))
                            }
                        }
                    }
                }
            };
        }
        unsafe { NETWORK_IS_READY = true; }
        loop  {
            console_print(b"NET free mbuf %d\n");
            unsafe { os::os_time_delay(10 * os::OS_TICKS_PER_SEC); }
        }
    }
    ///  Compose a CoAP message (CBOR or JSON) with the sensor value in `val` and transmit to the
    ///  Collector Node (if this is a Sensor Node) or to the CoAP Server (if this is a Collector Node
    ///  or Standalone Node).  
    ///  For Sensor Node or Standalone Node: sensor_node is the sensor name (`bme280_0` or `temp_stm32_0`)
    ///  For Collector Node: sensor_node is the Sensor Node Address of the Sensor Node that transmitted
    ///  the sensor data (like `b3b4b5b6f1`)
    ///  The message will be enqueued for transmission by the CoAP / OIC Background Task 
    ///  so this function will return without waiting for the message to be transmitted.  
    ///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
    pub fn send_sensor_data(sensor_val: &SensorValue, sensor_node: &CStr)
     -> MynewtResult<()> {
        console_print(b"send_sensor_data\n");
        let mut val =
            unsafe {
                ::core::mem::transmute::<[u8; ::core::mem::size_of::<sensor_value>()],
                                         sensor_value>([0;
                                                           ::core::mem::size_of::<sensor_value>()])
            };
        if unsafe {
               sensor_network::should_send_to_collector(&mut val,
                                                        sensor_node.as_ptr())
           } {
            return send_sensor_data_to_collector(sensor_val, sensor_node);
        }
        send_sensor_data_to_server(sensor_val, sensor_node)
    }
    ///  Compose a CoAP JSON message with the Sensor Key (field name) and Value in val 
    ///  and send to the CoAP server and URI.  The Sensor Value may be integer or float.
    ///  For temperature, the Sensor Key is either `t` for raw temperature (integer, from 0 to 4095) 
    ///  or `tmp` for computed temperature (float).
    ///  The message will be enqueued for transmission by the CoAP / OIC 
    ///  Background Task so this function will return without waiting for the message 
    ///  to be transmitted.  Return 0 if successful, `SYS_EAGAIN` if network is not ready yet.
    ///  For the CoAP server hosted at thethings.io, the CoAP payload should be encoded in JSON like this:
    ///  ```
    ///  {"values":[
    ///    {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"},
    ///    {"key":"tmp",    "value":28.7},
    ///    {"key":"...",    "value":... },
    ///    ... ]}
    ///  ```
    fn send_sensor_data_to_server(sensor_val: &SensorValue, node_id: &CStr)
     -> MynewtResult<()> {
        if let SensorValueType::None = sensor_val.val {
            if !false {
                {
                    ::core::panicking::panic(&("assertion failed: false",
                                               "rust/app/src/send_coap.rs",
                                               284u32, 53u32))
                }
            };
        }
        {
            match (&node_id.to_bytes()[0], &0) {
                (left_val, right_val) => {
                    if *left_val == *right_val {
                        {
                            ::core::panicking::panic_fmt(::core::fmt::Arguments::new_v1(&["assertion failed: `(left != right)`\n  left: `",
                                                                                          "`,\n right: `",
                                                                                          "`"],
                                                                                        &match (&&*left_val,
                                                                                                &&*right_val)
                                                                                             {
                                                                                             (arg0,
                                                                                              arg1)
                                                                                             =>
                                                                                             [::core::fmt::ArgumentV1::new(arg0,
                                                                                                                           ::core::fmt::Debug::fmt),
                                                                                              ::core::fmt::ArgumentV1::new(arg1,
                                                                                                                           ::core::fmt::Debug::fmt)],
                                                                                         }),
                                                         &("rust/app/src/send_coap.rs",
                                                           286u32, 5u32))
                        }
                    }
                }
            }
        };
        if unsafe { !NETWORK_IS_READY } {
            return Err(MynewtError::SYS_EAGAIN);
        }
        let device_id_ptr = unsafe { sensor_network::get_device_id() };
        let device_id: &CStr = unsafe { CStr::from_ptr(device_id_ptr) };
        let rc = sensor_network::init_server_post(&Strn::new(b"\0"))?;
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "rust/app/src/send_coap.rs",
                                           295u32, 5u32))
            }
        };
        let _payload =
            {
                "begin json root";
                {
                    "begin json coap_root";
                    unsafe { sensor_coap::json_rep_start_root_object() }
                    {
                        {
                            "begin json coap_array , object : COAP_CONTEXT , key : values";
                            {
                                "<< jarri , o: COAP_CONTEXT, k: values";
                                let key_with_null: &str = "values\u{0}";
                                unsafe {
                                    mynewt_rust::json_helper_set_array(COAP_CONTEXT.to_void_ptr(),
                                                                       COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()));
                                };
                            };
                            {
                                " >>  >> \"device\" >> : device_id , \"node\" : node_id , sensor_val ,";
                                "add1 key : \"device\" value : $crate::parse!(@ json device_id) to object :\nCOAP_CONTEXT";
                                {
                                    "begin json coap_item_str , parent : COAP_CONTEXT , key : \"device\" , val :\n$crate::parse!(@ json device_id)";
                                    {
                                        "begin json coap_item , array : COAP_CONTEXT";
                                        {
                                            "<< jitmi c: COAP_CONTEXT";
                                            let key_with_null: &str =
                                                "COAP_CONTEXT\u{0}";
                                            unsafe {
                                                mynewt_rust::json_helper_object_array_start_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                            };
                                        };
                                        {
                                            {
                                                "-- jtxti o: COAP_CONTEXT, k: key, v: \"device\"";
                                                let key_with_null: &str =
                                                    "key\u{0}";
                                                let value_with_opt_null:
                                                        &[u8] =
                                                    "device".to_bytes_optional_nul();
                                                unsafe {
                                                    mynewt_rust::json_helper_set_text_string(COAP_CONTEXT.to_void_ptr(),
                                                                                             COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()),
                                                                                             COAP_CONTEXT.value_to_cstr(value_with_opt_null))
                                                };
                                            };
                                            {
                                                "-- jtxti o: COAP_CONTEXT, k: value, v: $crate::parse!(@ json device_id)";
                                                let key_with_null: &str =
                                                    "value\u{0}";
                                                let value_with_opt_null:
                                                        &[u8] =
                                                    device_id.to_bytes_optional_nul();
                                                unsafe {
                                                    mynewt_rust::json_helper_set_text_string(COAP_CONTEXT.to_void_ptr(),
                                                                                             COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()),
                                                                                             COAP_CONTEXT.value_to_cstr(value_with_opt_null))
                                                };
                                            };
                                        };
                                        {
                                            ">>";
                                            let key_with_null: &str =
                                                "COAP_CONTEXT\u{0}";
                                            unsafe {
                                                mynewt_rust::json_helper_object_array_end_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                            };
                                        };
                                        "end json coap_item";
                                    };
                                    "end json coap_item_str";
                                };
                                "--------------------";
                                " >>  >> \"node\" >> : node_id , sensor_val ,";
                                "add1 key : \"node\" value : $crate::parse!(@ json node_id) to object :\nCOAP_CONTEXT";
                                {
                                    "begin json coap_item_str , parent : COAP_CONTEXT , key : \"node\" , val :\n$crate::parse!(@ json node_id)";
                                    {
                                        "begin json coap_item , array : COAP_CONTEXT";
                                        {
                                            "<< jitmi c: COAP_CONTEXT";
                                            let key_with_null: &str =
                                                "COAP_CONTEXT\u{0}";
                                            unsafe {
                                                mynewt_rust::json_helper_object_array_start_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                            };
                                        };
                                        {
                                            {
                                                "-- jtxti o: COAP_CONTEXT, k: key, v: \"node\"";
                                                let key_with_null: &str =
                                                    "key\u{0}";
                                                let value_with_opt_null:
                                                        &[u8] =
                                                    "node".to_bytes_optional_nul();
                                                unsafe {
                                                    mynewt_rust::json_helper_set_text_string(COAP_CONTEXT.to_void_ptr(),
                                                                                             COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()),
                                                                                             COAP_CONTEXT.value_to_cstr(value_with_opt_null))
                                                };
                                            };
                                            {
                                                "-- jtxti o: COAP_CONTEXT, k: value, v: $crate::parse!(@ json node_id)";
                                                let key_with_null: &str =
                                                    "value\u{0}";
                                                let value_with_opt_null:
                                                        &[u8] =
                                                    node_id.to_bytes_optional_nul();
                                                unsafe {
                                                    mynewt_rust::json_helper_set_text_string(COAP_CONTEXT.to_void_ptr(),
                                                                                             COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()),
                                                                                             COAP_CONTEXT.value_to_cstr(value_with_opt_null))
                                                };
                                            };
                                        };
                                        {
                                            ">>";
                                            let key_with_null: &str =
                                                "COAP_CONTEXT\u{0}";
                                            unsafe {
                                                mynewt_rust::json_helper_object_array_end_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                            };
                                        };
                                        "end json coap_item";
                                    };
                                    "end json coap_item_str";
                                };
                                "--------------------";
                                " >>  >> sensor_val >> ,";
                                "--------------------";
                                {
                                    "begin json coap_item_int_val , c : COAP_CONTEXT , val : sensor_val";
                                    if let SensorValueType::Uint(val) =
                                           sensor_val.val {
                                        {
                                            "begin json coap_item_int , key : sensor_val.key , value : val";
                                            {
                                                "begin json coap_item , array : COAP_CONTEXT";
                                                {
                                                    "<< jitmi c: COAP_CONTEXT";
                                                    let key_with_null: &str =
                                                        "COAP_CONTEXT\u{0}";
                                                    unsafe {
                                                        mynewt_rust::json_helper_object_array_start_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                                    };
                                                };
                                                {
                                                    {
                                                        "-- jtxte o: COAP_CONTEXT, k: \"key\", v: sensor_val.key";
                                                        let key_with_opt_null:
                                                                &[u8] =
                                                            "key".to_bytes_optional_nul();
                                                        let value_with_opt_null:
                                                                &[u8] =
                                                            sensor_val.key.to_bytes_optional_nul();
                                                        unsafe {
                                                            mynewt_rust::json_helper_set_text_string(COAP_CONTEXT.to_void_ptr(),
                                                                                                     COAP_CONTEXT.key_to_cstr(key_with_opt_null),
                                                                                                     COAP_CONTEXT.value_to_cstr(value_with_opt_null))
                                                        };
                                                    };
                                                    {
                                                        "-- jinte o: COAP_CONTEXT, k: \"value\", v: val";
                                                        let key_with_opt_null:
                                                                &[u8] =
                                                            "value".to_bytes_optional_nul();
                                                        let value =
                                                            val as u64;
                                                        unsafe {
                                                            mynewt_rust::json_helper_set_int(COAP_CONTEXT.to_void_ptr(),
                                                                                             COAP_CONTEXT.key_to_cstr(key_with_opt_null),
                                                                                             value)
                                                        };
                                                    };
                                                };
                                                {
                                                    ">>";
                                                    let key_with_null: &str =
                                                        "COAP_CONTEXT\u{0}";
                                                    unsafe {
                                                        mynewt_rust::json_helper_object_array_end_item(COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                                    };
                                                };
                                                "end json coap_item";
                                            };
                                            "end json coap_item_int";
                                        };
                                    } else {
                                        unsafe {
                                            COAP_CONTEXT.fail(coap_context::CoapError::VALUE_NOT_UINT)
                                        };
                                    }
                                    "end json coap_item_int_val";
                                };
                                "--------------------";
                            };
                            {
                                ">>";
                                let key_with_null: &str = "values\u{0}";
                                unsafe {
                                    mynewt_rust::json_helper_close_array(COAP_CONTEXT.to_void_ptr(),
                                                                         COAP_CONTEXT.key_to_cstr(key_with_null.as_bytes()))
                                };
                            };
                            "end json coap_array";
                        };
                    };
                    unsafe { sensor_coap::json_rep_end_root_object() }
                    "end json coap_root";
                };
                "end json root";
                ()
            };
        let rc = sensor_network::do_server_post()?;
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "rust/app/src/send_coap.rs",
                                           315u32, 5u32))
            }
        };
        console_print(b"NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=%s\n");
        Ok(())
    }
    ///  Compose a CoAP CBOR message with the Sensor Key (field name) and Value in val and 
    ///  transmit to the Collector Node.  The Sensor Value should be integer not float since
    ///  we transmit integers only to the Collector Node.
    ///  For temperature, the Sensor Key is `t` for raw temperature (integer, from 0 to 4095).
    ///  The message will be enqueued for transmission by the CoAP / OIC 
    ///  Background Task so this function will return without waiting for the message 
    ///  to be transmitted.  Return 0 if successful, `SYS_EAGAIN` if network is not ready yet.
    ///  The CoAP payload needs to be very compact (under 32 bytes) so it will be encoded in CBOR like this:
    ///  `{ t: 2870 }`
    fn send_sensor_data_to_collector(sensor_val: &SensorValue,
                                     _node_id: &CStr) -> MynewtResult<()> {
        if unsafe { !NETWORK_IS_READY } {
            return Err(MynewtError::SYS_EAGAIN);
        }
        let rc = unsafe { sensor_network::init_collector_post() };
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "rust/app/src/send_coap.rs",
                                           344u32, 65u32))
            }
        };
        let _payload =
            {
                "begin cbor root";
                {
                    "begin cbor coap_root";
                    {
                        "begin oc_rep_start_root_object";
                        unsafe {
                            let encoder =
                                COAP_CONTEXT.encoder("root", "_map");
                            tinycbor::cbor_encoder_create_map(COAP_CONTEXT.global_encoder(),
                                                              encoder,
                                                              tinycbor::CborIndefiniteLength)
                        };
                        "end oc_rep_start_root_object";
                    };
                    {
                        " >>  >> sensor_val >> ,";
                        "--------------------";
                        {
                            "begin cbor coap_set_int_val , c : COAP_CONTEXT , val : sensor_val";
                            if let SensorValueType::Uint(val) = sensor_val.val
                                   {
                                "-- cinte c: COAP_CONTEXT, k: sensor_val.key, v: val";
                                let key_with_opt_null: &[u8] =
                                    sensor_val.key.to_bytes_optional_nul();
                                let value = val as i64;
                                "-------------------------------------------------------------";
                                unsafe {
                                    let encoder =
                                        COAP_CONTEXT.encoder("COAP_CONTEXT",
                                                             "_map");
                                    let res =
                                        tinycbor::cbor_encode_text_string(encoder,
                                                                          COAP_CONTEXT.key_to_cstr(key_with_opt_null),
                                                                          COAP_CONTEXT.cstr_len(key_with_opt_null));
                                    COAP_CONTEXT.check_result(res);
                                    let res =
                                        tinycbor::cbor_encode_int(encoder,
                                                                  value);
                                    COAP_CONTEXT.check_result(res);
                                };
                                "-------------------------------------------------------------";
                            } else {
                                unsafe {
                                    COAP_CONTEXT.fail(coap_context::CoapError::VALUE_NOT_UINT)
                                };
                            }
                            "end cbor coap_set_int_val";
                        };
                        "--------------------";
                    };
                    {
                        "begin oc_rep_end_root_object";
                        unsafe {
                            let encoder =
                                COAP_CONTEXT.encoder("root", "_map");
                            tinycbor::cbor_encoder_close_container(COAP_CONTEXT.global_encoder(),
                                                                   encoder)
                        };
                        "end oc_rep_end_root_object";
                    };
                    "end cbor coap_root";
                };
                "end cbor root";
                ()
            };
        let rc = unsafe { sensor_network::do_collector_post() };
        if !rc {
            {
                ::core::panicking::panic(&("assertion failed: rc",
                                           "rust/app/src/send_coap.rs",
                                           355u32, 63u32))
            }
        };
        console_print(b"NRF send to collector: rawtmp %d\n");
        Ok(())
    }
}
use core::panic::PanicInfo;
use cortex_m::asm::bkpt;
use mynewt::kernel::os;
use crate::base::*;
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]
extern "C" fn rust_main() -> ! {
    unsafe { base::rust_sysinit() };
    unsafe { console_flush() };
    send_coap::start_network_task().expect("NET fail");
    listen_sensor::start_sensor_listener().expect("TMP fail");
    loop  { unsafe { os::os_eventq_run(os::os_eventq_dflt_get()) } }
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
