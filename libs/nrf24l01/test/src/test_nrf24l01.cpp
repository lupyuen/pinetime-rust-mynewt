//  Ported to Mynewt from https://os.mbed.com/users/Owen/code/nRF24L01P_Hello_World/file/5be2682710c6/main.cpp/
#include <assert.h>
#include <os/os.h>
#include <console/console.h>
#include <hal/hal_bsp.h>
#include <hal/hal_gpio.h>
#include "nRF24L01P.h"
#include "nrf24l01/nrf24l01.h"

extern "C" void test_nrf24l01(void);
static void start_txrx(struct nrf24l01 *dev);
static nRF24L01P *drv(struct nrf24l01 *dev) { return (nRF24L01P *)(dev->controller); }  //  Return the controller instance

static uint8_t hw_id[12];  //  Hardware ID is 12 bytes for STM32
static int hw_id_len;      //  Actual length of hardware ID
static char rxData[NRF24L01_TRANSFER_SIZE];

void test_nrf24l01(void) {
    //  Fetch the hardware ID.  This is unique across all microcontrollers.  
    hw_id_len = hal_bsp_hw_id_len();     //  Fetch the length, i.e. 12
    assert((unsigned) hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.
    hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));  assert(hw_id_len > 0);  //  Get the hardware ID.

    //  Create the device.
    nrf24l01_create();

    {   //  Lock the nRF24L01 driver for exclusive use.
        //  Find the nRF24L01 device by name "nrf24l01_0".
        struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(NRF24L01_DEVICE, OS_TIMEOUT_NEVER, NULL);
        assert(dev != NULL);

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);        
    }   //  Unlock the nRF24L01 driver for exclusive use.

#ifdef NOTUSED
    os_event ev;
    os_callout_init(&tx_callout, os_eventq_dflt_get(), tx_timer_callback, NULL);
    if (!nrf24l01_collector_node()) { tx_timer_callback(&ev); }  //  Sensor Node starts the tx timer.
#endif  //  NOTUSED

    //  Not needed because rx processing is triggered by interrupt, not polling.
    //  os_callout_init(&rx_callout, os_eventq_dflt_get(), rx_timer_callback, NULL);
    //  if (nrf24l01_collector_node()) { rx_timer_callback(&ev); }  //  Collector Node starts the rx timer.

    console_flush();  ////
}

void nrf24l01_callback(struct os_event *ev) {
    //  Callback that is triggered when we receive an interrupt that is forwarded to the Event Queue.
    //  TODO: Move to config.
    console_printf("%sevent\n", _nrf);  console_flush();  ////
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
            pipe = drv(dev)->readablePipe();
            if (pipe > 0) {
                //  Read the data into the receive buffer
                rxDataCnt = drv(dev)->read( pipe, rxData, NRF24L01_TRANSFER_SIZE );
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
    console_flush(); ////
}

#ifdef NOTUSED

    static int tx_count = 0;

    static void tx_timer_callback(struct os_event *ev) {
        // Send the transmitbuffer via the nRF24L01+
        assert(ev != NULL);
        int rc = 0;

        //  Transmit the hardware ID.
        char *txData = (char *) hw_id;
        assert(txData);

        {   //  Lock the nRF24L01 driver for exclusive use.
            //  Find the nRF24L01 device by name "nrf24l01_0".
            struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(NRF24L01_DEVICE, OS_TIMEOUT_NEVER, NULL);
            assert(dev != NULL);

            //  On Sensor Node: Transmit the data to Collector Node.
            rc = nrf24l01_send(dev, txData, NRF24L01_TRANSFER_SIZE);

            //  Close the nRF24L01 device when we are done.
            os_dev_close((struct os_dev *) dev);        
        }   //  Unlock the nRF24L01 driver for exclusive use.

        assert(rc == NRF24L01_TRANSFER_SIZE);
        console_printf("tx "); console_dump((const uint8_t *) txData, NRF24L01_TRANSFER_SIZE); console_printf("\n"); 
        console_flush(); ////

        hw_id[tx_count++ % NRF24L01_TRANSFER_SIZE]++;  //  Change the tx message
        os_callout_reset(&tx_callout, 10 * OS_TICKS_PER_SEC);  //  tx every 10 secs
    }

    static void rx_timer_callback(struct os_event *ev) {
        //  Quit if nothing to read.
        assert(ev != NULL);
        nrf24l01_callback(ev);
        os_callout_reset(&rx_callout, 1 * OS_TICKS_PER_SEC);   //  rx every 1 sec
    }
#endif  //  NOTUSED
