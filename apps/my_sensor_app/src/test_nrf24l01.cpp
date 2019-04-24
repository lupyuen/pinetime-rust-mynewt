//  Ported to Mynewt from https://os.mbed.com/users/Owen/code/nRF24L01P_Hello_World/file/5be2682710c6/main.cpp/
#include <assert.h>
#include <os/os.h>
#include <console/console.h>
#include <hal/hal_bsp.h>
#include "nrf24l01.h"
#include "nRF24L01P.h"

extern "C" void test_nrf24l01(void);
static void test_tx_rx(struct nrf24l01 *dev);
static nRF24L01P *drv(struct nrf24l01 *dev) { return (nRF24L01P *)(dev->controller); }  //  Return the controller instance

void test_nrf24l01(void) {
    //  int rc;
    nrf24l01_create();
    {   //  Lock the nRF24L01 driver for exclusive use.
        //  Find the nRF24L01 device by name "nrf24l01_0".
        struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(NRF24L01_DEVICE, OS_TIMEOUT_NEVER, NULL);
        assert(dev != NULL);

        test_tx_rx(dev);

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);
        //  Unlock the nRF24L01 driver for exclusive use.
    }

    console_flush();  ////
    for (;;) {} ////
}

//  The nRF24L01+ supports transfers from 1 to 32 bytes, but Sparkfun's
//  "Nordic Serial Interface Board" (http://www.sparkfun.com/products/9019)
//  only handles 4 byte transfers in the ATMega code.
#define TRANSFER_SIZE   4

//  static char txData[TRANSFER_SIZE];
static char rxData[TRANSFER_SIZE];

static uint8_t hw_id[12];  //  Hardware ID is 12 bytes for STM32
static int hw_id_len;      //  Actual length of hardware ID

static void test_tx_rx(struct nrf24l01 *dev) {
    //  Fetch the hardware ID.  This is unique across all microcontrollers.  
    hw_id_len = hal_bsp_hw_id_len();     //  Fetch the length, i.e. 12
    assert((unsigned) hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.
    hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));  assert(hw_id_len > 0);  //  Get the hardware ID.

    //  int txDataCnt = 0;
    int rxDataCnt = 0;

    drv(dev)->setRfOutputPower(-18);  ////
    drv(dev)->powerUp();

    // Display the (default) setup of the nRF24L01+ chip
    console_printf( "nRF24L01+ Frequency    : %d MHz\r\n",  drv(dev)->getRfFrequency() );
    console_printf( "nRF24L01+ Output power : %d dBm\r\n",  drv(dev)->getRfOutputPower() );
    console_printf( "nRF24L01+ Data Rate    : %d kbps\r\n", drv(dev)->getAirDataRate() );
    console_printf( "nRF24L01+ TX Address   : 0x%010llX\r\n", drv(dev)->getTxAddress() );
    console_printf( "nRF24L01+ RX Address   : 0x%010llX\r\n", drv(dev)->getRxAddress() );

    drv(dev)->setTransferSize( TRANSFER_SIZE );

    drv(dev)->setReceiveMode();
    drv(dev)->enable();

    for (int i = 0; ; i++) {
        if (i % 11 == 0) {
            // Send the transmitbuffer via the nRF24L01+
            console_printf("tx "); console_dump(hw_id, TRANSFER_SIZE); console_printf("\n"); console_flush(); ////
            drv(dev)->write( NRF24L01P_PIPE_P0, (char *) hw_id, TRANSFER_SIZE );
            hw_id[i % TRANSFER_SIZE]++;
        }

        // If we've received anything in the nRF24L01+...
        if ( drv(dev)->readable() ) {

            // ...read the data into the receive buffer
            rxDataCnt = drv(dev)->read( NRF24L01P_PIPE_P0, rxData, sizeof( rxData ) );
            assert(rxDataCnt > 0);
        
            // Display the receive buffer contents
            console_printf("rx "); console_dump((const uint8_t *) rxData, rxDataCnt); console_printf("\n"); console_flush(); ////
        }

        os_time_delay(1 * OS_TICKS_PER_SEC);  //  Sleep 1 second
    }
}

#ifdef NOTUSED
    //  Based on https://medium.com/@benjamindavidfraser/arduino-nrf24l01-communications-947e1acb33fb
    //  and https://github.com/TMRh20/RF24/archive/master.zip

    // setup radio pipe address for remote sensor node
    const byte nodeAddress[] = {'N','O','D','E','1'};
    // integer array for slave node data:[node_id, returned_count]
    int remoteNodeData[] = {1, 1};

    void test_master(struct nrf24l01 *dev) {    
        // begin radio object
        // radio.begin();

        // set power level of the radio
        // radio.setPALevel(RF24_PA_LOW);

        // set RF datarate - lowest rate for longest range capability
        // radio.setDataRate(RF24_250KBPS);

        // set radio channel to use - ensure all slaves match this
        // radio.setChannel(0x66);

        // set time between retries and max no. of retries
        // radio.setRetries(4, 10);

        // enable ackpayload - enables each slave to reply with data 
        // radio.enableAckPayload();

        // setup write pipe to remote node - must match node listen address
        // radio.openWritingPipe(nodeAddress);
    }

    void test_slave(struct nrf24l01 *dev) {
        // open a reading pipe on the chosen address - matches the master tx
        // radio.openReadingPipe(1, nodeAddress);

        // enable ack payload - slave replies with data using this feature
        // radio.enableAckPayload();

        // preload payload with initial data
        // radio.writeAckPayload(1, &remoteNodeData, sizeof(remoteNodeData));
    }

#endif  //  NOTUSED
