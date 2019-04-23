//  From https://os.mbed.com/users/Owen/code/nRF24L01P_Hello_World/file/5be2682710c6/main.cpp/
#include "mbed.h"
#include "nRF24L01P.h"

Serial pc(USBTX, USBRX); // tx, rx

nRF24L01P my_nrf24l01p(p5, p6, p7, p8, p9, p10);    // mosi, miso, sck, csn, ce, irq

DigitalOut myled1(LED1);
DigitalOut myled2(LED2);

int main() {

// The nRF24L01+ supports transfers from 1 to 32 bytes, but Sparkfun's
//  "Nordic Serial Interface Board" (http://www.sparkfun.com/products/9019)
//  only handles 4 byte transfers in the ATMega code.
#define TRANSFER_SIZE   4

    char txData[TRANSFER_SIZE], rxData[TRANSFER_SIZE];
    int txDataCnt = 0;
    int rxDataCnt = 0;

    my_nrf24l01p.powerUp();

    // Display the (default) setup of the nRF24L01+ chip
    pc.printf( "nRF24L01+ Frequency    : %d MHz\r\n",  my_nrf24l01p.getRfFrequency() );
    pc.printf( "nRF24L01+ Output power : %d dBm\r\n",  my_nrf24l01p.getRfOutputPower() );
    pc.printf( "nRF24L01+ Data Rate    : %d kbps\r\n", my_nrf24l01p.getAirDataRate() );
    pc.printf( "nRF24L01+ TX Address   : 0x%010llX\r\n", my_nrf24l01p.getTxAddress() );
    pc.printf( "nRF24L01+ RX Address   : 0x%010llX\r\n", my_nrf24l01p.getRxAddress() );

    pc.printf( "Type keys to test transfers:\r\n  (transfers are grouped into %d characters)\r\n", TRANSFER_SIZE );

    my_nrf24l01p.setTransferSize( TRANSFER_SIZE );

    my_nrf24l01p.setReceiveMode();
    my_nrf24l01p.enable();

    while (1) {

        // If we've received anything over the host serial link...
        if ( pc.readable() ) {

            // ...add it to the transmit buffer
            txData[txDataCnt++] = pc.getc();

            // If the transmit buffer is full
            if ( txDataCnt >= sizeof( txData ) ) {

                // Send the transmitbuffer via the nRF24L01+
                my_nrf24l01p.write( NRF24L01P_PIPE_P0, txData, txDataCnt );

                txDataCnt = 0;
            }

            // Toggle LED1 (to help debug Host -> nRF24L01+ communication)
            myled1 = !myled1;
        }

        // If we've received anything in the nRF24L01+...
        if ( my_nrf24l01p.readable() ) {

            // ...read the data into the receive buffer
            rxDataCnt = my_nrf24l01p.read( NRF24L01P_PIPE_P0, rxData, sizeof( rxData ) );

            // Display the receive buffer contents via the host serial link
            for ( int i = 0; rxDataCnt > 0; rxDataCnt--, i++ ) {

                pc.putc( rxData[i] );
            }

            // Toggle LED2 (to help debug nRF24L01+ -> Host communication)
            myled2 = !myled2;
        }
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

    void test_nrf24l01(void) {
        //  int rc;
        nrf24l01_create();
        {   //  Lock the nRF24L01 driver for exclusive use.
            //  Find the nRF24L01 device by name "nrf24l01_0".
            struct nrf24l01 *dev = (struct nrf24l01 *) os_dev_open(NRF24L01_DEVICE, OS_TIMEOUT_NEVER, NULL);
            assert(dev != NULL);


            //  Close the nRF24L01 device when we are done.
            os_dev_close((struct os_dev *) dev);
            //  Unlock the nRF24L01 driver for exclusive use.
        }

        console_flush();  ////
        for (;;) {} ////
    }

#endif  //  NOTUSED
