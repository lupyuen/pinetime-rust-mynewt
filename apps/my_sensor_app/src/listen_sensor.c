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
#define LISTENER_CB         1  //  Indicate that this is a listener callback
#define READ_CB             2  //  Indicate that this is a sensor read callback

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type);

static struct sensor *my_sensor;  //  Will store the opened handle of the temperature sensor.

//  Define the listener function to be called after polling the temperature sensor.
static struct sensor_listener listener = {
    .sl_sensor_type = SENSOR_TYPE_AMBIENT_TEMPERATURE,  //  Type of sensor: ambient temperature
    .sl_func        = read_temperature,                 //  Listener function to be called with the sensor data
    .sl_arg         = (void *) LISTENER_CB,             //  Indicate to the listener function that this is a listener callback
};

int start_sensor_listener(void) {
    //  Starting polling the temperature sensor every 10 seconds in the background.  
    //  After polling the sensor, call the listener function to send the sensor data to the CoAP server.
    console_printf("poll sensor " SENSOR_DEVICE "\n");

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
    int rc = sensor_set_poll_rate_ms(SENSOR_DEVICE, MY_SENSOR_POLL_TIME);
    assert(rc == 0);

    //  Open the sensor by name.
    my_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE, NULL);
    assert(my_sensor != NULL);

    //  Set the listener function to be called every 10 seconds, with the polled sensor data.
    rc = sensor_register_listener(my_sensor, &listener);
    assert(rc == 0);
    return 0;
}

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type) {
    //  This listener function is called every 10 seconds.  Mynewt has fetched the temperature data,
    //  passed through databuf.  We send the sensor data to the CoAP server.  Return 0 if we have
    //  processed the sensor data successfully.
    float tmp;
    struct sensor_temp_data *tempdata = (struct sensor_temp_data *) databuf;

    //  Check that the temperature data is valid.
    if (tempdata == NULL) { return SYS_EINVAL; }              //  Exit if data is missing
    if (!tempdata->std_temp_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

    //  Temperature data is valid.  Fetch and display it.
    tmp = tempdata->std_temp;  //  Temperature in floating point.
    console_printf(">>> tmp: ");  console_printfloat(tmp);  console_printf("\n");  ////

#if MYNEWT_VAL(SENSOR_COAP)   //  If we are sending sensor data to CoAP server...
    //  Compose a CoAP message with the temperature sensor data and send to the 
    //  CoAP server.  The message will be enqueued for transmission by the OIC 
    //  background task so this function will return without waiting for the message 
    //  to be transmitted.
    int rc = send_sensor_data(tmp);

    //  SYS_EAGAIN means that the Network Task is still starting up the ESP8266.
    //  We drop the sensor data and send at the next poll.
    if (rc == SYS_EAGAIN) {
        console_printf("network not ready\n");
        return 0; 
    }
    assert(rc == 0);
#endif  //  MYNEWT_VAL(SENSOR_COAP)

    return rc;
}

#endif  //  SENSOR_DEVICE
