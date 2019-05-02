//  Route CoAP sensor data from nRF24L01 to ESP8266
#define CBOR_IMPLEMENTATION  //  Define the TinyCBOR functions here.
#include <tinycbor/cbor.h>
#include <assert.h>
#include <os/os.h>
#include <sensor/sensor.h>
#include <console/console.h>
#include <os/os_mbuf.h>
#include <oic/oc_rep.h>
#include <nrf24l01/nrf24l01.h>
#include "remote_sensor/remote_sensor.h"

static uint8_t rxData[NRF24L01_TRANSFER_SIZE];  //  Buffer for received data.

int remote_sensor_start(void) {
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

int decode_coap_payload(uint8_t *data, uint8_t size, oc_rep_t **out_rep) {
    //  Decode CoAP Payload in CBOR format from the "data" buffer with "size" bytes.  
    //  Decoded payload will be written to out_rep.  Payload contains {field1: val1, field2: val2, ...}
    //  Return 0 if successful.
    
    //  Convert data buffer to mbuf, since oc_parse_rep() only accepts mbuf.
    int rc;
    struct os_mbuf *om;

    //  Get a packet header mbuf.
    om = os_msys_get_pkthdr(NRF24L01_TRANSFER_SIZE, 4);
    assert(om);
    if (!om) { return -1; }

    //  Copy data buffer into mbuf.
    rc = os_mbuf_copyinto(om, 0, data, size);
    if (rc) { rc = -2; goto exit; }  //  Out of mbufs.

    //  Parse the mbuf.
    rc = oc_parse_rep(om, 0, size, out_rep);
    assert(rc == 0);

exit:
    //  Free the mbuf.
    os_mbuf_free_chain(om);
    return rc;
}

int process_coap_message(const char *name, uint8_t *data, uint8_t size0) {
    //  Process the incoming CoAP payload in "data".  Trigger a request request to the Sensor Framework
    //  that will send the sensor data into the Listener Function for the Remote Sensor.
    //  Payload contains {field1: val1, field2: val2, ...} in CBOR format.
    //  Last byte is sequence number.  Between the CoAP payload and the last byte, all bytes are 0 
    //  and should be discarded before decoding.  "name" is the Sensor Node Address like "b3b4b5b6f1".
    //  Return 0 if successful.
    assert(name);  assert(data);  assert(size0 > 0);
    uint8_t size = size0;
    data[size - 1] = 0;  //  Erase sequence number.
    while (size > 0 && data[size - 1] == 0) { size--; }  //  Discard trailing zeroes.

    //  Decode CoAP Payload (CBOR).
    oc_rep_t *rep = NULL;
    int rc = decode_coap_payload(data, size, &rep);
    assert(rc == 0);
    oc_rep_t *first_rep = rep;

    //  For each field in the payload...
    while(rep) {
        //  Convert the field name to sensor type, e.g. t -> SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW
        sensor_type_t type = remote_sensor_lookup_type(oc_string(rep->name));  
        assert(type);  //  Unknown field name

        //  Fetch the Remote Sensor by name.  "name" looks like "b3b4b5b6f1", the Sensor Node Address.
        struct sensor *snsr = sensor_mgr_find_next_bydevname(name, NULL);
        assert(snsr);  //  Sensor not found

        //  Send the read request to Remote Sensor.  This causes the sensor to be read and Listener Function to be called.
        rc = sensor_read(snsr, type, NULL, rep, 0);
        assert(rc == 0);

        //  Move to next field.
        rep = rep->next;
    }
    //  Free the decoded representation.
    oc_free_rep(first_rep);
    return 0;
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
        const char *name = NULL;
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
                //  Get the rx (sender) address for the pipe.
                name = nrf24l01_sensor_node_names[pipe - 1];
            }
            //  Close the nRF24L01 device when we are done.
            os_dev_close((struct os_dev *) dev);
        }   //  Unlock the nRF24L01 driver for exclusive use.

        //  If no data available, quit.
        if (pipe <= 0) { break; }

        //  TODO: Process the received data.
        if (rxDataCnt > 0) { 
            //  Display the receive buffer contents
            console_printf("rx "); console_dump((const uint8_t *) rxData, rxDataCnt); console_printf("\n"); 
            int rc = process_coap_message(name, rxData, rxDataCnt);
            assert(rc == 0);
        }
    }
}
