////  #if MYNEWT_VAL(ADC_1)

//  Adapted from repos/apache-mynewt-core/hw/bsp/olimex_stm32-e407_devboard/src/hal_bsp.c
#include "stm32f1xx_hal_dma.h"
#include "stm32f1xx_hal_adc.h"
#include "adc_stm32f1/adc_stm32f1.h"

//  BSP Definitions for ADC1.  Only ADC1 is supported.

struct adc_dev my_dev_adc1;

#define STM32F1_ADC_DEFAULT_INIT_TD {\
    /* TODO: .ClockPrescaler = ADC_CLOCKPRESCALER_PCLK_DIV2, */ \
    /* TODO: .Resolution = ADC_RESOLUTION12b, */ \
    .DataAlign = ADC_DATAALIGN_RIGHT,\
    .ScanConvMode = DISABLE,\
    /* TODO: .EOCSelection = DISABLE, */ \
    .ContinuousConvMode = ENABLE,\
    .NbrOfConversion = 1,\
    .DiscontinuousConvMode = DISABLE,\
    .NbrOfDiscConversion = 0,\
    .ExternalTrigConv = ADC_SOFTWARE_START,\
    /* TODO: .ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE, */ \
    /* TODO: .DMAContinuousRequests = ENABLE */ \
}

/*****************ADC1 Config ***************/
#define STM32F1_DEFAULT_ADC1_HANDLE {\
    .Init = STM32F1_ADC_DEFAULT_INIT_TD,\
    .Instance = ADC1,\
    /* TODO: .NbrOfCurrentConversionRank = 0, */ \
    .DMA_Handle = NULL, /* TODO: &adc1_dma00_handle, */ \
    .Lock = HAL_UNLOCKED,\
    .State = 0,\
    .ErrorCode = 0\
}

static ADC_HandleTypeDef adc1_handle = STM32F1_DEFAULT_ADC1_HANDLE;

#define STM32F1_ADC1_DEFAULT_SAC {\
    .c_refmv = 3300,\
    .c_res   = 12,\
    .c_configured = 1,\
    .c_cnum = ADC_CHANNEL_10\
}

////  static struct adc_chan_config adc1_chan10_config = STM32F1_ADC1_DEFAULT_SAC;

//  We support total 18 channels on ADC1, including ADC_CHANNEL_TEMPSENSOR and ADC_CHANNEL_VREFINT.
#define STM32F1_ADC1_DEFAULT_CONFIG {\
    .sac_chan_count = 18,\
    .sac_chans = (struct adc_chan_config [18]){{0},{0},{0},{0},{0},{0},{0},{0},{0},{0},/* TODO: STM32F1_ADC1_DEFAULT_SAC */ {0},{0},{0},{0},{0},{0},{0},{0} } ,\
    .sac_adc_handle = &adc1_handle,\
}

static struct stm32f1_adc_dev_cfg adc1_config = STM32F1_ADC1_DEFAULT_CONFIG;
/*********************************************/

int init_temperature_sensor(void) {
    int rc = os_dev_create((struct os_dev *) &my_dev_adc1, "adc1",
        OS_DEV_INIT_PRIMARY, 0,  //  For BSP: OS_DEV_INIT_KERNEL, OS_DEV_INIT_PRIO_DEFAULT,
        stm32f1_adc_dev_init, &adc1_config);
    assert(rc == 0);

    //  Setup ADC channel configuration for temperature sensor.
    rc = adc_chan_config(&my_dev_adc1, ADC_CHANNEL_TEMPSENSOR, &adc1_config);
    assert(rc == 0);

    //  Blocking read of ADC channel.
    int val = -1;
    rc = adc_read_channel(&my_dev_adc1, ADC_CHANNEL_TEMPSENSOR, &val);
    assert(rc == 0);
    assert(val > 0);  //  If val = 0, it means we haven't sampled any values.

    return 0;
}

////  #endif  //  MYNEWT_VAL(ADC_1)

#ifdef NOTUSED
    /*---------------------------------------------------------------------------*/
    /** @brief ADC Enable The Temperature Sensor
     
    This enables both the sensor and the reference voltage measurements on channels
    16 and 17.
    
    */
    
    void adc_enable_temperature_sensor()
    {
            ADC_CR2(ADC1) |= ADC_CR2_TSVREFE;
    }
    
    /*---------------------------------------------------------------------------*/
    /** @brief ADC Disable The Temperature Sensor
     
    Disabling this will reduce power consumption from the sensor and the reference
    voltage measurements.
    */
    
    void adc_disable_temperature_sensor()
    {
            ADC_CR2(ADC1) &= ~ADC_CR2_TSVREFE;
    }

    /*---------------------------------------------------------------------------*/
    /** @brief ADC Start a Conversion Without Trigger
     
    This initiates a conversion by software without a trigger. The ADC needs to be
    powered on before this is called, otherwise this function has no effect.
    
    Note that this is not available in other STM32F families. To ensure code
    compatibility, enable triggering and use a software trigger source @see
    adc_start_conversion_regular.
    
    @param[in] adc Unsigned int32. ADC block register address base @ref adc_reg_base
    */
    
    void adc_start_conversion_direct(uint32_t adc)
    {
            if (ADC_CR2(adc) & ADC_CR2_ADON) {
                    ADC_CR2(adc) |= ADC_CR2_ADON;
            }
    }
 #endif  //  NOTUSED

#ifdef BME280_OFB
    //  Initialise the BME280 sensor.  Poll the sensor every 10 seconds.
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
#endif  //  BME280_OFB
