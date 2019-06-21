#include <os/os.h>
#include <console/console.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include <custom_sensor/custom_sensor.h>
#include <mynewt_rust/sensor_helper.h>

///  Interpret `sensor_data` as a `sensor_temp_raw_data` struct that contains raw temp.
///  Copy the sensor data into `dest`.  Return 0 if successful.
int get_temp_raw_data(void *sensor_data, struct sensor_temp_raw_data *dest) {
    assert(sensor_data); assert(dest);
    struct sensor_temp_raw_data *src = (struct sensor_temp_raw_data *) sensor_data;
    memcpy(dest, src, sizeof(struct sensor_temp_raw_data));
    return 0;
}

///  Interpret `sensor_data` as a `sensor_temp_data` struct that contains computed temp.
///  Copy the sensor data into `dest`.  Return 0 if successful.
int get_temp_data(void *sensor_data, struct sensor_temp_data *dest) {
    assert(sensor_data); assert(dest);
    struct sensor_temp_data *src = (struct sensor_temp_data *) sensor_data;
    memcpy(dest, src, sizeof(struct sensor_temp_data));
    return 0;
}

///  Return the Mynewt device for the Mynewt sensor.
struct os_dev *sensor_get_device(struct sensor *s) {
    assert(s);
    struct os_dev *device = SENSOR_GET_DEVICE(s);
    return device;
}

///  Return the name for the Mynewt device.  Assumes name is non-null.
const char *device_get_name(struct os_dev *device) {
    assert(device);
    const char *name = device->od_name;
    assert(name);
    return name;
}

///  Return the NULL sensor.
struct sensor *null_sensor(void) { return NULL; }

///  Return non-zero if sensor is NULL.
int is_null_sensor(struct sensor *p) { return p ? 0 : 1; }

///  Return non-zero if sensor data is NULL.
int is_null_sensor_data(void *p) { return p ? 0 : 1; }
