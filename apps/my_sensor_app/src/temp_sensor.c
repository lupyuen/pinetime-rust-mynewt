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
#include "temp_sensor.h"
#ifdef TEMP_SENSOR  //  If either internal temperature sensor or BME280 is enabled...

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

int start_temperature_listener(void) {
    //  Poll the temperature sensor every 10 seconds.
    console_printf("poll temperature sensor " TEMP_SENSOR "\n");

    //  Set the sensor polling time to 10 seconds.  TEMP_SENSOR is either "bme280_0" or "temp_stm32_0"
    int rc = sensor_set_poll_rate_ms(TEMP_SENSOR, MY_SENSOR_POLL_TIME);
    assert(rc == 0);

    //  Open the sensor by name.
    my_sensor = sensor_mgr_find_next_bydevname(TEMP_SENSOR, NULL);
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
    float temp;
    struct sensor_temp_data *tempdata = (struct sensor_temp_data *) databuf;

    //  Check that the temperature data is valid.
    if (tempdata == NULL) { return SYS_EINVAL; }              //  Exit if data is missing
    if (!tempdata->std_temp_is_valid) { return SYS_EINVAL; }  //  Exit if data is not valid

    //  Temperature data is valid.  Fetch and display it.
    temp = tempdata->std_temp;  //  Temperature in floating point.
    console_printf("**** temp: ");  console_printfloat(temp);  console_printf("\n");  ////

    //  TODO: Send temperature to CoAP server.
    return 0;
}

#endif  //  TEMP_SENSOR
