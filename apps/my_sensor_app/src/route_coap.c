//  Route CoAP sensor data from nRF24L01 to ESP8266
#include <assert.h>
#include <os/os.h>
#include <console/console.h>

////#if MYNEWT_VAL(NRF24L01) && MYNEWT_VAL(ESP8266)  //  If both nRF24L01 and ESP8266 are enabled...
#if MYNEWT_VAL(NRF24L01)

#include <nrf24l01/nrf24l01.h>

static uint8_t rxData[NRF24L01_TRANSFER_SIZE];  //  Buffer for received data.

int start_coap_router(void) {
    //  Start the CoAP Router that receives CoAP messages from nRF24L01 Sensor Nodes
    //  and forwards them to CoAP server via ESP8266 WiFi. Return 0 if successful.
    
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
        }
    }
}

#endif  //  MYNEWT_VAL(NRF24L01) && MYNEWT_VAL(ESP8266)
