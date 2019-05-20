//  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
//  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
//       This sensor is selected if BME280_OFB=1 in syscfg.yml.
//  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//       This sensor is selected if TEMP_STM32=1 in syscfg.yml.
//  If sending to CoAP server is enabled, transmit the sensor data to the CoAP server after polling.

//  Temperature sensor values may be Computed or Raw:
//  Computed Temperature Sensor Value (default): Sensor values are in degrees Celsius with 2 decimal places.
//    Slower and harder to process. Requires more ROM. Used for the ESP8266 tutorial.
//  Raw Temperature Sensor Value (if RAW_TEMP=1 in syscfg.yml): Sensor values are integers from 0 to 4095.
//    Faster and easier to process. Requires less ROM. Used for the nRF24L01 tutorial. Generally the preferred way.

//  We also support Remote Sensors.  The temperature sensor may be connected to a Sensor Node with nRF24L01.
//  The Sensor Node will transmit the sensor data to the Collector Node via nRF24L01.  The Collector Node
//  will use a Listener Function to process the sensor data as though it were a local sensor.  In this demo
//  the Collector Node forwards the sensor data to a CoAP Server via ESP8266.  See start_remote_sensor_listeners().

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>
#include <console/console.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include <sensor_network/sensor_network.h>  //  For Sensor Network Library
#include <sensor_coap/sensor_coap.h>  //  For sensor_value
#include "send_coap.h"                //  For send_sensor_data()
#include "listen_sensor.h"
#ifdef SENSOR_DEVICE  //  If either internal temperature sensor or BME280 is enabled...

#define SENSOR_POLL_TIME (10 * 1000)  //  Poll every 10,000 milliseconds (10 seconds)  
#define LISTENER_CB      1            //  Indicate that this is a listener callback
#define READ_CB          2            //  Indicate that this is a sensor read callback

static int get_temperature(void *sensor_data, sensor_type_t type, struct sensor_value *return_value);
static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type);
static int start_remote_sensor_listeners(void);

//  Define the listener function to be called after polling the temperature sensor.
static struct sensor_listener listener = {
    .sl_sensor_type = TEMP_SENSOR_TYPE,      //  Type of sensor: ambient temperature. Either computed (floating-point) or raw (integer)
    .sl_func        = read_temperature,      //  Listener function to be called with the sensor data
    .sl_arg         = (void *) LISTENER_CB,  //  Indicate to the listener function that this is a listener callback
};

/////////////////////////////////////////////////////////
//  Listen To Local Sensor

int start_sensor_listener(void) {
    //  For Sensor Node and Standalone Node: Start polling the temperature sensor 
    //  every 10 seconds in the background.  After polling the sensor, call the 
    //  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
    //  or CoAP Server (is this is a Standalone Node).
    //  For Collector Node: Start the Listeners for Remote Sensor 

    if (is_collector_node()) {                    //  If this is a Collector Node...
        return start_remote_sensor_listeners();   //  Start the Listener for every Remote Sensor.
    }

    //  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
    console_printf("TMP poll " SENSOR_DEVICE "\n");

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
    int rc = sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME);
    assert(rc == 0);

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    struct sensor *listen_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE, NULL);
    assert(listen_sensor != NULL);

    //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
    rc = sensor_register_listener(listen_sensor, &listener);
    assert(rc == 0);
    return 0;
}

/////////////////////////////////////////////////////////
//  Listen To Remote Sensors Connected Via nRF24L01

#if MYNEWT_VAL(NRF24L01)  //  If nRF24L01 Wireless Network is enabled (Collector Node)...

static int start_remote_sensor_listeners(void) {
    //  For Collector Node Only: Start the Listeners for Remote Sensor.  Listen for CBOR sensor 
    //  data messages transmitted by Sensor Nodes.  Transmit the received data to the CoAP Server.
    const char **sensor_node_names = get_sensor_node_names();
    assert(sensor_node_names);
    
    //  For every Sensor Node Address like "b3b4b5b6f1"...
    for (int i = 0; i < SENSOR_NETWORK_SIZE; i++) {
        //  Fetch the Sensor Node Address e.g. "b3b4b5b6f1"
        const char *name = sensor_node_names[i];
        assert(name);

        //  Fetch the Remote Sensor by name, which is the Sensor Node Address e.g. "b3b4b5b6f1"
        struct sensor *remote_sensor = sensor_mgr_find_next_bydevname(name, NULL);
        assert(remote_sensor != NULL);

        //  Set the Listener Function to be called upon receiving any sensor data.
        int rc = sensor_register_listener(remote_sensor, &listener);  //  Remote Sensors may be used the same way as local sensors.
        assert(rc == 0);
    }
    return 0;
}

#else   //  If nRF24L01 Wireless Network is disabled (Standalone Node)...
static int start_remote_sensor_listeners(void) {}  //  Don't start Remote Sensor for Standalone Node
#endif  //  MYNEWT_VAL(NRF24L01)

/////////////////////////////////////////////////////////
//  Process Temperature Sensor Value (Raw and Computed)

static int read_temperature(struct sensor* sensor, void *arg, void *sensor_data, sensor_type_t type) {
    //  This listener function is called every 10 seconds (for local sensors) or when sensor data is received
    //  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through sensor_data.
    //  If this is a Sensor Node, we send the sensor data to the Collector Node.
    //  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    //  Return 0 if we have processed the sensor data successfully.

    //  Check that the temperature data is valid.
    if (sensor_data == NULL) { return SYS_EINVAL; }  //  Exit if data is missing
    assert(sensor);

    //  For Sensor Node or Standalone Node: Device name is "bme280_0" or "temp_stm32_0"
    //  For Collector Node: Device name is the Sensor Node Address of the Sensor Node that transmitted the sensor data, like "b3b4b5b6f1"
    struct os_dev *device = SENSOR_GET_DEVICE(sensor);
    const char *device_name = device->od_name;
    assert(device_name);  //  console_printf("device_name %s\n", device_name);

    //  Get the temperature sensor value. It could be raw or computed.
    struct sensor_value temp_sensor_value;
    int rc = get_temperature(sensor_data, type, &temp_sensor_value);
    assert(rc == 0);
    if (rc) { return rc; }

#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server or Collector Node...
    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server or Collector Node.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    rc = send_sensor_data(&temp_sensor_value, device_name);

    //  SYS_EAGAIN means that the Network Task is still starting up the ESP8266.
    //  We drop the sensor data and send at the next poll.
    if (rc == SYS_EAGAIN) {
        console_printf("TMP network not ready\n");
        return 0; 
    }
    assert(rc == 0);
#endif  //  MYNEWT_VAL(SENSOR_COAP)

    return rc;
}

static int get_temperature(void *sensor_data, sensor_type_t type, struct sensor_value *return_value) {
    //  Get the temperature value, raw or computed.  sensor_data contains the raw or computed temperature. 
    //  type indicates whether sensor_data contains raw or computed temperature.  Upon return, we populate return_value
    //  with the raw or computed temperature, as well as the key and value type.
    //  Return 0 if we have fetched the temperature value successfully.
    assert(sensor_data); assert(return_value);
    memset(return_value, 0, sizeof(struct sensor_value));  //  Zero the return value for safety.

    switch(type) {                                   //  Is this raw or computed temperature?
        case SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW: {  //  If this is raw temperature...
            //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
            struct sensor_temp_raw_data *rawtempdata = (struct sensor_temp_raw_data *) sensor_data;

            //  Check that the raw temperature data is valid.
            if (!rawtempdata->strd_temp_raw_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

            //  Raw temperature data is valid.  Copy and display it.
            return_value->int_val = rawtempdata->strd_temp_raw;  //  Raw Temperature in integer (0 to 4095)
            console_printf("TMP listener got rawtmp %d\n", return_value->int_val);  ////
            break;
        }
        case SENSOR_TYPE_AMBIENT_TEMPERATURE: {      //  If this is computed temperature...
            //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
            struct sensor_temp_data *tempdata = (struct sensor_temp_data *) sensor_data;

            //  Check that the computed temperature data is valid.
            if (!tempdata->std_temp_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

            //  Computed temperature data is valid.  Copy and display it.
            return_value->float_val = tempdata->std_temp;  //  Temperature in floating point.
#if !MYNEWT_VAL(RAW_TEMP)  //  The following line contains floating-point code. We should compile only if we are not using raw temp.
            console_printf("TMP poll data: tmp ");  console_printfloat(return_value->float_val);  console_printf("\n");  ////
#endif  //  !MYNEWT_VAL(RAW_TEMP)
            break;
        }
        default: {
            assert(0);  //  Unknown temperature sensor type
            return -1;
        }
    }
    //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
    return_value->key = TEMP_SENSOR_KEY;
    return_value->val_type = TEMP_SENSOR_VALUE_TYPE;
    return 0;
}

#endif  //  SENSOR_DEVICE
