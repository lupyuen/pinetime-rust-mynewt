//!  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
//!  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
//!       This sensor is selected if BME280_OFB is defined in syscfg.yml.
//!  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//!       This sensor is selected if TEMP_STM32 is defined in syscfg.yml.
//!  If this is the Collector Node, send the sensor data to the CoAP Server after polling.
//!  This is the Rust version of `https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/rust/apps/my_sensor_app/OLDsrc/listen_sensor.c`

use cty::*;                             //  Import string utilities from cty library: https://crates.io/crates/cty
use cstr_core::CStr;                    //  Import string utilities from cstr_core library: https://crates.io/crates/cstr_core
use crate::base::*;                     //  Import base.rs for common declarations
use crate::mynewt::sensor::*;                   //  Import sensor.rs for Mynewt Sensor API
use crate::send_coap::send_sensor_data; //  Import send_coap.rs for sending sensor data

///  Poll every 10,000 milliseconds (10 seconds)  
const SENSOR_POLL_TIME: u32  = (10 * 1000);  
///  Indicate that this is a listener callback
const LISTENER_CB: SensorArg = 1;           

/////////////////////////////////////////////////////////
//  Listen To Local Sensor

///  For Sensor Node and Standalone Node: Start polling the temperature sensor 
///  every 10 seconds in the background.  After polling the sensor, call the 
///  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
///  or CoAP Server (is this is a Standalone Node).
///  For Collector Node: Start the Listeners for Remote Sensor 
///  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
///  Return 0 if successful.
pub fn start_sensor_listener() -> i32 {
    console_print(b"TMP poll \n");  //  SENSOR_DEVICE "\n";

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
    let rc = unsafe { sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME) };
    assert!(rc == 0);

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    let listen_sensor = unsafe { sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor()) };
    assert!(!unsafe{ is_null_sensor(listen_sensor) });

    //  Define the listener function to be called after polling the temperature sensor.
    let listener = SensorListener {
        sl_sensor_type: TEMP_SENSOR_TYPE,      //  Type of sensor: ambient temperature. Either computed (floating-point) or raw (integer)
        sl_func       : read_temperature,      //  Listener function to be called with the sensor data
        sl_arg        : LISTENER_CB,           //  Indicate to the listener function that this is a listener callback
        sl_next       : 0,                     //  Must be 0
    };

    //  Register the Listener Function to be called every 10 seconds, with the polled sensor data.
    let rc = register_listener(listen_sensor, listener);
    assert!(rc == 0);

    //  Return 0 to indicate success.  This line should not end with a semicolon (;).
    0
}

/////////////////////////////////////////////////////////
//  Listen To Remote Sensors Connected Via nRF24L01

//  TODO

/////////////////////////////////////////////////////////
//  Process Temperature Sensor Value (Raw and Computed)

///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
///  If this is a Sensor Node, we send the sensor data to the Collector Node.
///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
///  Return 0 if we have processed the sensor data successfully.
extern fn read_temperature(sensor: SensorPtr, _arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 {
    unsafe {
        console_print(b"read_temperature\n");
        //  Check that the temperature data is valid.
        //  TODO
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
        assert!(!is_null_sensor(sensor));

        //  For Sensor Node or Standalone Node: Device name is "bme280_0" or "temp_stm32_0"
        //  For Collector Node: Device name is the Sensor Node Address of the Sensor Node that transmitted the sensor data, like "b3b4b5b6f1"
        let device = sensor_get_device(sensor);
        let device_name_ptr: *const c_char = device_get_name(device);
        let device_name: &CStr = CStr::from_ptr(device_name_ptr);
        //assert!(device_name.len() > 0);  //  console_printf("device_name %s\n", device_name);
        
        //  Get the temperature sensor value. It could be raw or computed.
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
        if let SensorValueType::None = temp_sensor_value.val { assert!(false); }  //  Invalid type

        //#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server or Collector Node...
        //  Compose a CoAP message with the temperature sensor data and send to the 
        //  CoAP server or Collector Node.  The message will be enqueued for transmission by the OIC 
        //  background task so this function will return without waiting for the message 
        //  to be transmitted.
        let rc = send_sensor_data(&temp_sensor_value, device_name);

        //  SYS_EAGAIN means that the Network Task is still starting up the ESP8266.
        //  We drop the sensor data and send at the next poll.
        if rc == SYS_EAGAIN {
            console_print(b"TMP network not ready\n");
            return 0; 
        }
        assert!(rc == 0);
        //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    0
}

///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
///  the raw or computed temperature, as well as the key and value type.
fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
    let mut return_value = SensorValue::default();
    match sensor_type {                                //  Is this raw or computed temperature?
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
            //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
            let mut rawtempdata = SensorTempRawData {
                strd_temp_raw: 0,
                strd_temp_raw_is_valid: 0,
            };
            let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
            assert!(rc == 0);

            //  Check that the raw temperature data is valid.
            if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid

            //  Raw temperature data is valid.  Copy and display it.
            return_value.val = SensorValueType::Uint(rawtempdata.strd_temp_raw);  //  Raw Temperature in integer (0 to 4095)
            console_print(b"TMP listener got rawtmp \n");  // return_value->int_val);
        },
        SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
            //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
            let mut tempdata = SensorTempData {
                std_temp: 0.0,
                std_temp_is_valid: 0,
            };
            let rc = get_temp_data(sensor_data, &mut tempdata);
            assert!(rc == 0);

            //  Check that the computed temperature data is valid.
            if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid

            //  Computed temperature data is valid.  Copy and display it.
            return_value.val = SensorValueType::Float(tempdata.std_temp);  //  Temperature in floating point.
            /*
            #if !MYNEWT_VAL(RAW_TEMP)  //  The following line contains floating-point code. We should compile only if we are not using raw temp.
                        console_printf("TMP poll data: tmp ");  console_printfloat(return_value->float_val);  console_printf("\n");  ////
            #endif  //  !MYNEWT_VAL(RAW_TEMP)
            */
        },
        _ => {
            assert!(false);  //  Unknown temperature sensor type
            return return_value;
        }
    }
    //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
    return_value.key = TEMP_SENSOR_KEY;
    return_value
}
