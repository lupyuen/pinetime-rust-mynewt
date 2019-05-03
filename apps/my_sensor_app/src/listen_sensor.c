//  Poll the temperature sensor every 10 seconds.  We support 2 types of temperature sensors:
//  (1)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1.
//       This sensor is selected if BME280_OFB is defined in syscfg.yml.
//  (2)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//       This sensor is selected if TEMP_STM32 is defined in syscfg.yml.
//  If sending to CoAP server is enabled, send the sensor data to the CoAP server after polling.

//  Mynewt consolidates all app settings into "bin/targets/bluepill_my_sensor/generated/include/syscfg/syscfg.h"
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>
#include <console/console.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include "send_coap.h"        //  For send_sensor_data()
#include "listen_sensor.h"
#ifdef SENSOR_DEVICE  //  If either internal temperature sensor or BME280 is enabled...

#define MY_SENSOR_POLL_TIME (10 * 1000)  //  Poll every 10,000 milliseconds (10 seconds)  
#define LISTENER_CB         1            //  Indicate that this is a listener callback
#define READ_CB             2            //  Indicate that this is a sensor read callback

//  Define Sensor Type and Sensor Value Type
#if MYNEWT_VAL(RAW_TEMP)                                      //  If we are returning raw temperature (integers)...
#include "custom_sensor/custom_sensor.h"                      //  For SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW
#define TEMP_SENSOR_TYPE SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW  //  Set to raw sensor type.
#define TEMP_SENSOR_VALUE_TYPE SENSOR_VALUE_TYPE_INT32        //  Return integer sensor values.

#else                                                         //  If we are returning computed temperature (floating-point)...
#define TEMP_SENSOR_TYPE SENSOR_TYPE_AMBIENT_TEMPERATURE      //  Set to floating-point sensor type.
#define TEMP_SENSOR_VALUE_TYPE SENSOR_VALUE_TYPE_FLOAT        //  Return floating-point sensor values.
#endif  //  MYNEWT_VAL(RAW_TEMP)

static int start_remote_sensor_listeners(void);
static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type);

static struct sensor *my_sensor;  //  Will store the opened handle of the temperature sensor.

//  Define the listener function to be called after polling the temperature sensor.
static struct sensor_listener listener = {
    .sl_sensor_type = TEMP_SENSOR_TYPE,      //  Type of sensor: ambient temperature. Either computed (floating-point) or raw (integer)
    .sl_func        = read_temperature,      //  Listener function to be called with the sensor data
    .sl_arg         = (void *) LISTENER_CB,  //  Indicate to the listener function that this is a listener callback
};

int start_sensor_listener(void) {
    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data 
    //  to the CoAP server (if ESP8266 is present) or Collector Node (if nRF24L01 is present).

#if MYNEWT_VAL(NRF24L01)                          //  If nRF24L01 Wireless Network is enabled...
    if (nrf24l01_collector_node()) {              //  And this is a Collector Node...
        return start_remote_sensor_listeners();   //  Start the Listener for every Remote Sensor.
    }
#endif  //  MYNEWT_VAL(NRF24L01)

    //  Otherwise this is a single Sensor Node with ESP8266, or a Sensor Node connected to Collector Node via nRF24L01.
    console_printf("TMP poll " SENSOR_DEVICE "\n");

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
    int rc = sensor_set_poll_rate_ms(SENSOR_DEVICE, MY_SENSOR_POLL_TIME);
    assert(rc == 0);

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    my_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE, NULL);
    assert(my_sensor != NULL);

    //  Set the listener function to be called every 10 seconds, with the polled sensor data.
    rc = sensor_register_listener(my_sensor, &listener);
    assert(rc == 0);
    return 0;
}

static int start_remote_sensor_listeners(void) {
    //  Listen for sensor data transmitted by Sensor Nodes.  Transmit the received data to the CoAP server.

    //  For every Sensor Node Address like "b3b4b5b6f1"...
    const char *name = "b3b4b5b6f1";  //  TODO

    //  Fetch the Remote Sensor by name, which is the Sensor Node Address e.g. "b3b4b5b6f1"
    struct sensor *remote_sensor = sensor_mgr_find_next_bydevname(name, NULL);
    assert(remote_sensor != NULL);

    //  Set the listener function to be called upon receiving any sensor data.
    int rc = sensor_register_listener(remote_sensor, &listener);
    assert(rc == 0);
    return 0;
}

/////////////////////////////////////////////////////////
//  Process Computed Temperature (Floating-Point)

#if !MYNEWT_VAL(RAW_TEMP)  //  If we are returning computed temperature (floating-point)...

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type) {
    //  This listener function is called every 10 seconds.  Mynewt has fetched the temperature data,
    //  passed through databuf.  We send the sensor data to the CoAP server.  Return 0 if we have
    //  processed the sensor data successfully.
    assert(type == SENSOR_TYPE_AMBIENT_TEMPERATURE);  //  We only handle computed temperature (floating-point) here, not raw temperature.
    int rc = 0;
    float tmp = 0;
    struct sensor_temp_data *tempdata = (struct sensor_temp_data *) databuf;

    //  Check that the temperature data is valid.
    if (tempdata == NULL) { return SYS_EINVAL; }              //  Exit if data is missing
    if (!tempdata->std_temp_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

    //  Temperature data is valid.  Fetch and display it.
    tmp = tempdata->std_temp;  //  Temperature in floating point.
    console_printf("TMP poll data: tmp ");  console_printfloat(tmp);  console_printf("\n");  ////

#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server...
    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    rc = send_sensor_data(tmp);

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
#endif  //  !MYNEWT_VAL(RAW_TEMP)

/////////////////////////////////////////////////////////
//  Process Raw Temperature (Integer)

#if MYNEWT_VAL(RAW_TEMP)  //  If we are returning raw temperature (integers)...

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type) {
    //  This listener function is called every 10 seconds.  Mynewt has fetched the raw temperature data,
    //  passed through databuf.  We send the sensor data to the CoAP server.  Return 0 if we have
    //  processed the sensor data successfully.
    assert(type == SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW);  //  We only handle raw temperature (integer) here, not computed temperature.
    int rc = 0;
    int rawtemp = 0;
    struct sensor_temp_raw_data *rawtempdata = (struct sensor_temp_raw_data *) databuf;

    //  Check that the temperature data is valid.
    if (rawtempdata == NULL) { return SYS_EINVAL; }              //  Exit if data is missing
    if (!rawtempdata->strd_temp_raw_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

    //  Temperature data is valid.  Fetch and display it.
    rawtemp = rawtempdata->strd_temp_raw;  //  Raw Temperature in integer (0 to 4095)
    console_printf("TMP poll data: rawtmp %d\n", rawtemp);  ////

#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server...
    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    rc = send_sensor_data(rawtemp);

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
#endif  //  MYNEWT_VAL(RAW_TEMP)

#endif  //  SENSOR_DEVICE
