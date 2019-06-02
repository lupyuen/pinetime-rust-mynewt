#include <os/os.h>
#include <console/console.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include <custom_sensor/custom_sensor.h>

int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest) {
    //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
    //  Copy the sensor data into dest.  Return 0 if successful.
    assert(sensor_data); assert(dest);
    struct sensor_temp_raw_data *src = (struct sensor_temp_raw_data *) sensor_data;
    memcpy(dest, src, sizeof(struct sensor_temp_raw_data));
    return 0;
}

int get_temp_data(void *sensor_data, struct sensor_temp_data *dest) {
    //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
    //  Copy the sensor data into dest.  Return 0 if successful.
    assert(sensor_data); assert(dest);
    struct sensor_temp_data *src = (struct sensor_temp_data *) sensor_data;
    memcpy(dest, src, sizeof(struct sensor_temp_data));
    return 0;
}
