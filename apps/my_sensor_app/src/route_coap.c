//  Route CoAP sensor data from nRF24L01 to ESP8266
#include <assert.h>
#include <os/os.h>
#include <sensor/sensor.h>
#include <console/console.h>

////#if MYNEWT_VAL(NRF24L01) && MYNEWT_VAL(ESP8266)  //  If both nRF24L01 and ESP8266 are enabled...
#if MYNEWT_VAL(NRF24L01)

#include <nrf24l01/nrf24l01.h>

static uint8_t rxData[NRF24L01_TRANSFER_SIZE];  //  Buffer for received data.

int start_coap_router(void) {
    //  Start the CoAP Router that receives CoAP messages from nRF24L01 Sensor Nodes
    //  and forwards them to CoAP server via ESP8266 WiFi. Return 0 if successful.
    if (!nrf24l01_collector_node()) { return 0; }  //  Only start for Collector Nodes, not Sensor Nodes.
    
    //  Open the nRF24L01 driver to start listening.
    {   //  Lock the nRF24L01 driver for exclusive use.
        //  Find the nRF24L01 device by name "nrf24l01_0".
        struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(NRF24L01_DEVICE, OS_TIMEOUT_NEVER, NULL);
        assert(dev != NULL);

        //  At this point the nRF24L01 driver will start listening.

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);        
    }   //  Unlock the nRF24L01 driver for exclusive use.
    return 0;
}

void process_coap_message(uint8_t *data, uint8_t size0) {
    //  Process the incoming CoAP message.  Last byte is sequence number.  Between the CoAP payload
    //  and the last byte, all bytes are 0 and should be discarded before decoding.
    //  TODO: Get sender.
    assert(data);  assert(size0 > 0);
    uint8_t size = size0;
    data[size - 1] = 0;  //  Erase sequence number.
    while (size > 0 && data[size - 1] == 0) { size--; }  //  Discard trailing zeroes.

    //  TODO: Decode CBOR.

    //  Trigger read event to Remote Sensor.  This causes the sensor to be read.
    const char *devname = "temp_stm32_0";  //  TODO
    sensor_type_t type = SENSOR_TYPE_TEMPERATURE;  //  TODO    

    struct sensor_type_traits *stt = NULL;
    struct sensor *snsr = sensor_get_type_traits_byname(devname, &stt, type);
    assert(stt);  assert(snsr);
    sensor_mgr_put_read_evt(stt);
}

#ifdef NOTUSED
    /**
     * Puts read event on the sensor manager evq
     *
     * @param arg Event argument
     */
    void
    sensor_mgr_put_read_evt(void *arg)
    {
        sensor_read_event.ev_arg = arg;
        os_eventq_put(sensor_mgr_evq_get(), &sensor_read_event);
    }

    static void
    sensor_read_ev_cb(struct os_event *ev)
    {
        int rc;
        struct sensor_type_traits *stt;

        stt = ev->ev_arg;
        rc = sensor_read(stt->stt_sensor, stt->stt_sensor_type, NULL, NULL,
                        OS_TIMEOUT_NEVER);
        assert(rc == 0);
    }

    /**
     * Get the type traits for a sensor
     *
     * @param name of the sensor
     * @param Ptr to sensor types trait struct
     * @param type of sensor
     *
     * @return NULL on failure, sensor struct on success
     */
    struct sensor *
    sensor_get_type_traits_byname(const char *devname,
                                struct sensor_type_traits **stt,
                                sensor_type_t type)
    {
        struct sensor *sensor;

        sensor = sensor_mgr_find_next_bydevname(devname, NULL);
        if (!sensor) {
            goto err;
        }

        *stt = sensor_get_type_traits_bytype(type, sensor);

    err:
        return sensor;
    }

#endif  //  NOTUSED

void nrf24l01_callback(struct os_event *ev) {
    //  Callback that is triggered when we receive an interrupt that is forwarded to the Event Queue.
    //  TODO: Move to config.
    console_printf("nrf event\n");
    //  On Collector Node: Check Pipes 1-5 for received data.
    for (;;) {
        //  Keep checking until there is no more data to process.
        int pipe = -1;
        int rxDataCnt = 0;
        {   //  Lock the nRF24L01 driver for exclusive use.
            //  Find the nRF24L01 device by name "nrf24l01_0".
            struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(NRF24L01_DEVICE, OS_TIMEOUT_NEVER, NULL);
            assert(dev != NULL);

            //  Get a pipe that has data to receive.
            pipe = nrf24l01_readable_pipe(dev);
            if (pipe > 0) {
                //  Read the data into the receive buffer
                rxDataCnt = nrf24l01_receive(dev, pipe, rxData, NRF24L01_TRANSFER_SIZE);
                assert(rxDataCnt > 0 && rxDataCnt <= NRF24L01_TRANSFER_SIZE);
            }
            //  Close the nRF24L01 device when we are done.
            os_dev_close((struct os_dev *) dev);
        }   //  Unlock the nRF24L01 driver for exclusive use.

        //  If no data available, quit.
        if (pipe <= 0) { break; }

        //  TODO: Process the received data.
        if (rxDataCnt > 0) { 
            // Display the receive buffer contents
            console_printf("rx "); console_dump((const uint8_t *) rxData, rxDataCnt); console_printf("\n"); 
            process_coap_message(rxData, rxDataCnt);
        }
    }
}

#endif  //  MYNEWT_VAL(NRF24L01) && MYNEWT_VAL(ESP8266)
