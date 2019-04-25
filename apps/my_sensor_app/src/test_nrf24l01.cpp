//  Ported to Mynewt from https://os.mbed.com/users/Owen/code/nRF24L01P_Hello_World/file/5be2682710c6/main.cpp/
#include <assert.h>
#include <os/os.h>
#include <console/console.h>
#include <hal/hal_bsp.h>
#include "nrf24l01.h"
#include "nRF24L01P.h"

extern "C" void test_nrf24l01(void);
static void start_txrx(struct nrf24l01 *dev);
static void tx_timer_callback(struct os_event *ev);
static void rx_timer_callback(struct os_event *ev);
static nRF24L01P *drv(struct nrf24l01 *dev) { return (nRF24L01P *)(dev->controller); }  //  Return the controller instance

//  The nRF24L01+ supports transfers from 1 to 32 bytes, but Sparkfun's
//  "Nordic Serial Interface Board" (http://www.sparkfun.com/products/9019)
//  only handles 4 byte transfers in the ATMega code.
#define TRANSFER_SIZE   4

//  static char txData[TRANSFER_SIZE];
static char rxData[TRANSFER_SIZE];

static uint8_t hw_id[12];  //  Hardware ID is 12 bytes for STM32
static int hw_id_len;      //  Actual length of hardware ID
static struct os_callout tx_callout;
static struct os_callout rx_callout;

void test_nrf24l01(void) {
    //  int rc;

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

        start_txrx(dev);

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);        
    }   //  Unlock the nRF24L01 driver for exclusive use.

    os_callout_init(&tx_callout, os_eventq_dflt_get(), tx_timer_callback, NULL);
    os_callout_init(&rx_callout, os_eventq_dflt_get(), rx_timer_callback, NULL);

    os_event ev;
    if (nrf24l01_collector_node()) { rx_timer_callback(&ev); }  //  Collector Node starts the rx timer.
    else { tx_timer_callback(&ev); }            //  Sensor Node starts the tx timer.

    console_flush();  ////
}

static void start_txrx(struct nrf24l01 *dev) {
    //  Settings based on https://github.com/nRF24/RF24/blob/master/examples/GettingStarted/GettingStarted.ino
    //  See the docs at https://maniacbug.github.io/RF24/classRF24.html

    //  Display the setup of the nRF24L01+ chip
    console_printf( "nRF24L01+ Frequency    : %d MHz\r\n",    drv(dev)->getRfFrequency() );
    console_printf( "nRF24L01+ Output power : %d dBm\r\n",    drv(dev)->getRfOutputPower() );
    console_printf( "nRF24L01+ Data Rate    : %d kbps\r\n",   drv(dev)->getAirDataRate() );
    for (int i = 0; i < 6; i++) {
        console_printf( "nRF24L01+ P%d Tx Size   : %d bytes\r\n",  i, drv(dev)->getTransferSize(NRF24L01P_PIPE_P0 + i) );
    }
    for (int i = 0; i < 6; i++) {
        console_printf( "nRF24L01+ P%d Address   : 0x%010llX\r\n", i, 
            (i == 0) 
                ? drv(dev)->getTxAddress()
                : drv(dev)->getRxAddress(NRF24L01P_PIPE_P0 + i)
        );
    }

    //  Power up after setting config.
    drv(dev)->powerUp();

    if (nrf24l01_collector_node()) {
        //  For Collector Node: Start listening.
        drv(dev)->setReceiveMode(); 
    } else {
        //  For Sensor Node: Start transmitting.
        drv(dev)->setTransmitMode(); 
    }

    //  Enable or disable the interrupt.
    if (dev->cfg.irq_pin == MCU_GPIO_PIN_NONE) { drv(dev)->disableRxInterrupt(); }
    else { drv(dev)->enableRxInterrupt(); }

    //  Set CE Pin to high.    
    drv(dev)->enable();

    console_flush();  ////
}

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

        //  Stop listening so we can transmit.
        ////drv(dev)->setTransmitMode(); 

        //  On Sensor Node: Transmit the data to Collector Node.
        rc = drv(dev)->write( NRF24L01P_PIPE_P0 /* Ignored */, txData, TRANSFER_SIZE );

        //  Start listening again.
        ////drv(dev)->setReceiveMode(); 

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);        
    }   //  Unlock the nRF24L01 driver for exclusive use.

    assert(rc == TRANSFER_SIZE);
    console_printf("tx "); console_dump((const uint8_t *) txData, TRANSFER_SIZE); console_printf("\n"); 
    console_flush(); ////

    hw_id[tx_count++ % TRANSFER_SIZE]++;  //  Change the tx message
    os_callout_reset(&tx_callout, 10 * OS_TICKS_PER_SEC);  //  tx every 10 secs
}

static void rx_timer_callback(struct os_event *ev) {
    //  Quit if nothing to read.
    assert(ev != NULL);
    int rxDataCnt = 0;

    {   //  Lock the nRF24L01 driver for exclusive use.
        //  Find the nRF24L01 device by name "nrf24l01_0".
        struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(NRF24L01_DEVICE, OS_TIMEOUT_NEVER, NULL);
        assert(dev != NULL);

        //  On Collector Node: Check Pipes 1-5 for received data.
        int pipe = drv(dev)->readablePipe();
        if (pipe > 0) {
            // ...read the data into the receive buffer
            rxDataCnt = drv(dev)->read( pipe, rxData, TRANSFER_SIZE );
            assert(rxDataCnt > 0 && rxDataCnt <= TRANSFER_SIZE);
        }

        //  TODO:  read FIFO_STATUS to check if there are more payloads available in RX FIFO

        //  Close the nRF24L01 device when we are done.
        os_dev_close((struct os_dev *) dev);        
    }   //  Unlock the nRF24L01 driver for exclusive use.

    if (rxDataCnt > 0) { 
        // Display the receive buffer contents
        console_printf("rx "); console_dump((const uint8_t *) rxData, rxDataCnt); console_printf("\n"); 
    }
    console_flush(); ////

    os_callout_reset(&rx_callout, 1 * OS_TICKS_PER_SEC);   //  rx every 1 sec
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
