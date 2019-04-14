//  Initialise the temperature sensor and poll it every 10 seconds.  We support 2 types of temperature sensors:
//  (1)  Blue Pill internal temperature sensor, connected to port ADC1 on channel 16
//  (2)  BME280 Temperature Sensor, connected to Blue Pill on port SPI1

#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"
#include <os/os.h>
#include <console/console.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include "temp_sensor.h"
#ifdef MY_SENSOR_DEVICE  //  If either internal temperature sensor or BME280 is enabled...

#define MY_SENSOR_POLL_TIME (10 * 1000)  //  Poll every 10,000 milliseconds (10 seconds)  
#define LISTENER_CB         1  //  This is a listener callback.
#define READ_CB             2  //  This is a sensor read callback.

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type);

static struct sensor *my_sensor;  //  Handle of the temperature sensor.

//  Define the listener function to be called after polling the temperature sensor.
static struct sensor_listener listener = {
    .sl_sensor_type = SENSOR_TYPE_AMBIENT_TEMPERATURE,  //  Type of sensor: ambient temperature
    .sl_func        = read_temperature,                 //  Listener function to be called with the sensor data
    .sl_arg         = (void *) LISTENER_CB,             //  Indicate to the listener function that this is a listener callback
};

int init_temperature_sensor(void) {
    //  Poll the temperature sensor every 10 seconds.
    console_printf("poll temperature sensor " MY_SENSOR_DEVICE "\n");

    //  Poll the sensor every 10 seconds.
    int rc = sensor_set_poll_rate_ms(MY_SENSOR_DEVICE, MY_SENSOR_POLL_TIME);
    assert(rc == 0);

    //  Fetch the sensor.
    my_sensor = sensor_mgr_find_next_bydevname(MY_SENSOR_DEVICE, NULL);
    assert(my_sensor != NULL);

    //  Set the listener function to be called every 10 seconds.
    rc = sensor_register_listener(my_sensor, &listener);
    assert(rc == 0);
    return 0;
}

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type) {
    //  This listener function is called every 10 seconds.  Mynewt has fetched the temperature data,
    //  passed through databuf.
    struct sensor_temp_data *tempdata;
    float temp;

    //  Check that the temperature data is valid.
    if (!databuf) { return SYS_EINVAL; }
    tempdata = (struct sensor_temp_data *)databuf;
    if (!tempdata->std_temp_is_valid) { return SYS_EINVAL; }  //  Exit if not valid.

    //  Temperature data is valid.  Display it.
    temp = tempdata->std_temp;  //  Temperature in floating point.
    console_printf("**** temp: ");  console_printfloat(temp);  console_printf("\n");  ////

    //  TODO: Send temperature to CoAP server.
    return 0;
}

#endif  //  MY_SENSOR_DEVICE
