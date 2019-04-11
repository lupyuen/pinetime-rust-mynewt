////  #if MYNEWT_VAL(ADC_1) && MYNEWT_VAL(TEMP_STM32_ONB)

//  Create STM32 Internal Temperature sensor.  Based on repos\apache-mynewt-core\hw\sensor\creator\src\sensor_creator.c
#include "os/mynewt.h"
#include "sensor/sensor.h"
#include "temp_stm32/temp_stm32.h"  //  Specific to sensor

//  Define the sensor specifics here so the code below can be generic.
#define DEVICE_NAME      TEMP_STM32_DEVICE  //  Name of device
#define DEVICE_DEV       temp_stm32         //  Device type
#define DEVICE_INSTANCE  temp_stm32_dev     //  Device instance
#define DEVICE_CFG       temp_stm32_cfg     //  Device config
#define DEVICE_CFG_FUNC  temp_stm32_config  //  Device config function
#define DEVICE_INIT      temp_stm32_init    //  Device init function
#define DEVICE_CREATE    temp_stm32_create  //  Device create function
#define DEVICE_ITF       adc_1_itf_temp_stm32   //  Device interface

static struct DEVICE_DEV DEVICE_INSTANCE;

static struct sensor_itf DEVICE_ITF = {
    .si_type = 0,  //  TODO: Should be ADC.
    .si_num  = 0,
};

//  Init the config for the sensor.
static void config_internal(struct DEVICE_CFG *cfg) {
    cfg->bc_s_mask = SENSOR_TYPE_AMBIENT_TEMPERATURE;
}

///////////////////////////////////////////////////////////////////////////////
//  Generic Sensor Creator Code

//  Sensor default configuration.
static int config_sensor(void) {
    int rc;
    struct os_dev *dev;
    struct DEVICE_CFG cfg;

    //  Fetch the sensor device.
    dev = (struct os_dev *) os_dev_open(DEVICE_NAME, OS_TIMEOUT_NEVER, NULL);
    assert(dev != NULL);

    //  Init the config for the sensor.
    memset(&cfg, 0, sizeof(cfg));
    config_internal(&cfg);

    //  Apply the sensor config.
    rc = DEVICE_CFG_FUNC((struct DEVICE_DEV *)dev, &cfg);
    os_dev_close(dev);
    return rc;
}

//  Create the sensor device instance and configure it.
void DEVICE_CREATE(void) {
    int rc = os_dev_create((struct os_dev *) &DEVICE_INSTANCE, DEVICE_NAME,
        OS_DEV_INIT_PRIMARY, 0, 
        DEVICE_INIT, (void *) &DEVICE_ITF);
    assert(rc == 0);

    rc = config_sensor();
    assert(rc == 0);
}

////  #endif  //  MYNEWT_VAL(ADC_1) && MYNEWT_VAL(TEMP_STM32_ONB)
