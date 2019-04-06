//  Initialise the BME280 sensor.  Poll the sensor every 10 seconds.
#ifdef POLL_SENSOR
#define MY_SENSOR_DEVICE "bme280_0"
#define MY_SENSOR_POLL_TIME (10 * 1000)  //  Poll every 10,000 milliseconds (10 seconds)  
#define LISTENER_CB 1
#define READ_CB 2

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type);

static struct sensor *my_sensor;

static struct sensor_listener listener = {
    .sl_sensor_type = SENSOR_TYPE_AMBIENT_TEMPERATURE,
    .sl_func = read_temperature,
    .sl_arg = (void *) LISTENER_CB,
};

void init_sensors(void) {
    int rc;
    rc = sensor_set_poll_rate_ms(MY_SENSOR_DEVICE, MY_SENSOR_POLL_TIME);
    assert(rc == 0);

    my_sensor = sensor_mgr_find_next_bydevname(MY_SENSOR_DEVICE, NULL);
    assert(my_sensor != NULL);

    rc = sensor_register_listener(my_sensor, &listener);
    assert(rc == 0);
}

static int read_temperature(struct sensor* sensor, void *arg, void *databuf, sensor_type_t type) {
    struct sensor_temp_data *temp;
    if (!databuf) { return SYS_EINVAL; }
    temp = (struct sensor_temp_data *)databuf;
    if (!temp->std_temp_is_valid) { return SYS_EINVAL; }
    console_printf(
        "temp = %d.%d\n",
        (int) (temp->std_temp),
        (int) (10.0 * temp->std_temp) % 10
    );
    return 0;
}
#endif  //  POLL_SENSOR
