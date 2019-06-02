//  Must sync with repos/apache-mynewt-core/hw/sensor/include/sensor/sensor.h
#[repr(C)]
pub struct SensorListener {
    /* The type of sensor data to listen for, this is interpreted as a
     * mask, and this listener is called for all sensor types on this
     * sensor that match the mask.
     */
    sl_sensor_type: SensorType;

    /* Sensor data handler function, called when has data */
    sl_func: TODO_SensorDataFunc;

    /* Argument for the sensor listener */
    sl_arg: *const CVoid;

    /* Next item in the sensor listener list.  The head of this list is
     * contained within the sensor object.
     */
    sl_next: *const CVoid;
};

//  Must sync with libs/sensor_coap/include/sensor_coap/sensor_coap.h
//  sensor_value represents a decoded sensor data value. Since temperature may be integer (raw)
//  or float (computed), we use the struct to return both integer and float values.
//  val_type indicates whether it's an integer or float.
#[repr(C)]
pub struct SensorValue {
    key: *const u8;  //  "t" for raw temp, "tmp" for computed. When transmitted to CoAP Server or Collector Node, the key (field name) to be used.
    val_type: i32;   //  The type of the sensor value. SENSOR_VALUE_TYPE_INT32 for int, SENSOR_VALUE_TYPE_FLOAT for float.
    int_val: u16;    //  For raw temp, contains the raw temp integer value
    float_val: f32;  //  For computed temp, contains the computed temp float value
};

#[link(name = "libs_mynewt_rust")]
extern {
    fn get_temp_raw_data(sensor_data: *const CVoid, dest: *mut SensorTempRawData) -> i32;
    fn get_temp_data(sensor_data: *const CVoid, dest: *mut SensorTempData) -> i32;
}

const SENSOR_POLL_TIME: u32 = (10 * 1000);  //  Poll every 10,000 milliseconds (10 seconds)  
const LISTENER_CB: u32      = 1;            //  Indicate that this is a listener callback
const READ_CB: u32          = 2;            //  Indicate that this is a sensor read callback

//  Define the listener function to be called after polling the temperature sensor.
let listener = SensorListener {
    sl_sensor_type: TEMP_SENSOR_TYPE,      //  Type of sensor: ambient temperature. Either computed (floating-point) or raw (integer)
    sl_func       : read_temperature,      //  Listener function to be called with the sensor data
    sl_arg        : LISTENER_CB,           //  Indicate to the listener function that this is a listener callback
};

pub type SensorPtr = *const CVoid;
pub type SensorMutPtr = *mut CVoid;

/////////////////////////////////////////////////////////
//  Listen To Local Sensor

pub fn start_sensor_listener() -> i32 {
    //  For Sensor Node and Standalone Node: Start polling the temperature sensor 
    //  every 10 seconds in the background.  After polling the sensor, call the 
    //  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
    //  or CoAP Server (is this is a Standalone Node).
    //  For Collector Node: Start the Listeners for Remote Sensor 
    unsafe {
        /* if (is_collector_node()) {                    //  If this is a Collector Node...
            return start_remote_sensor_listeners();   //  Start the Listener for every Remote Sensor.
        } */

        //  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
        //  console_printf("TMP poll " SENSOR_DEVICE "\n");
        let msg = "TMP poll " SENSOR_DEVICE "\n";
        let buf = msg.as_bytes();
        let len = buf.len();
        console_buffer(buf.as_ptr(), len as u32);

        //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
        let rc = sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME);
        assert!(rc == 0);

        //  Fetch the sensor by name, without locking the driver for exclusive access.
        let listen_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE, NULL);
        assert!(listen_sensor);

        //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
        rc = sensor_register_listener(listen_sensor, &listener);
        assert!(rc == 0);
    }
    0;
}

/////////////////////////////////////////////////////////
//  Listen To Remote Sensors Connected Via nRF24L01

//  TODO

/////////////////////////////////////////////////////////
//  Process Temperature Sensor Value (Raw and Computed)

extern fn read_temperature(sensor: SensorPtr, arg: *const CVoid, sensor_data: *const CVoid, type: SensorType) -> i32 {
    //  This listener function is called every 10 seconds (for local sensors) or when sensor data is received
    //  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through sensor_data.
    //  If this is a Sensor Node, we send the sensor data to the Collector Node.
    //  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    //  Return 0 if we have processed the sensor data successfully.
    unsafe {
        //  Check that the temperature data is valid.
        //  TODO
        if (sensor_data == NULL) { return SYS_EINVAL; }  //  Exit if data is missing
        assert!(sensor);

        //  For Sensor Node or Standalone Node: Device name is "bme280_0" or "temp_stm32_0"
        //  For Collector Node: Device name is the Sensor Node Address of the Sensor Node that transmitted the sensor data, like "b3b4b5b6f1"
        //  TODO
        let device = SENSOR_GET_DEVICE(sensor);
        let device_name = device.od_name;
        assert!(device_name);  //  console_printf("device_name %s\n", device_name);

        //  Get the temperature sensor value. It could be raw or computed.
        let temp_sensor_value = get_temperature(sensor_data, type);
        assert!(temp_sensor_value.val_type != 0);
        if (temp_sensor_value.val_type == 0) { return -1; }  //  Invalid type.

    //#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server or Collector Node...
        //  Compose a CoAP message with the temperature sensor data and send to the 
        //  CoAP server or Collector Node.  The message will be enqueued for transmission by the OIC 
        //  background task so this function will return without waiting for the message 
        //  to be transmitted.
        rc = send_sensor_data(&temp_sensor_value, device_name);

        //  SYS_EAGAIN means that the Network Task is still starting up the ESP8266.
        //  We drop the sensor data and send at the next poll.
        if (rc == SYS_EAGAIN) {
            //  console_printf("TMP network not ready\n");
            let msg = "TMP network not ready\n";
            let buf = msg.as_bytes();
            let len = buf.len();
            console_buffer(buf.as_ptr(), len as u32);
            return 0; 
        }
        assert!(rc == 0);
    //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    rc;
}

fn get_temperature(sensor_data: *const CVoid, type: SensorType) -> SensorValue {
    //  Get the temperature value, raw or computed.  sensor_data contains the raw or computed temperature. 
    //  type indicates whether sensor_data contains raw or computed temperature.  We return 
    //  the raw or computed temperature, as well as the key and value type.
    unsafe {
        assert!(sensor_data);
        let mut return_value = SensorValue {
            key: 0,
            val_type: 0,
        };
        match type {                                //  Is this raw or computed temperature?
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
                //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
                let mut rawtempdata = SensorTempRawData
                let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
                assert!(rc == 0);

                //  Check that the raw temperature data is valid.
                if (!rawtempdata.strd_temp_raw_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

                //  Raw temperature data is valid.  Copy and display it.
                return_value.int_val = rawtempdata.strd_temp_raw;  //  Raw Temperature in integer (0 to 4095)
                //  TODO: console_printf("TMP listener got rawtmp %d\n", return_value->int_val);  ////
                let msg = "TMP listener got rawtmp \n";
                let buf = msg.as_bytes();
                let len = buf.len();
                console_buffer(buf.as_ptr(), len as u32);
            },
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
                //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
                let mut tempdata = SensorTempData
                let rc = get_temp_data(sensor_data, &mut tempdata);
                assert!(rc == 0);

                //  Check that the computed temperature data is valid.
                if (!tempdata.std_temp_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

                //  Computed temperature data is valid.  Copy and display it.
                return_value.float_val = tempdata.std_temp;  //  Temperature in floating point.
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
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
        return_value;
    };
}
