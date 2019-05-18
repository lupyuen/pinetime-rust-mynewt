//  nRF24L01 Driver for Apache Mynewt.  Functions for creating the device instance and performing device functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#include <errno.h>
#include <os/os.h>
#include <bsp/bsp.h>
#include <hal/hal_bsp.h>
#include <hal/hal_gpio.h>
#include <console/console.h>
#include <sensor_network/sensor_network.h>
#include "nRF24L01P.h"
#include "nrf24l01/nrf24l01.h"
#include "nrf24l01/transport.h"
#include "util.h"

#define _NRF24L01P_SPI_MAX_DATA_RATE_HZ     10 * 1000 * 1000  //  10 MHz, maximum transfer rate for the SPI bus
#define _KHZ                                1 / 1000          //  Convert Hz to kHz: 1000 Hz = 1 kHz

static void nrf24l01_irq_handler(void *arg);
static int register_transport(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);

static nRF24L01P controller;    //  The single controller instance.  TODO: Support multiple instances.
static bool first_open = true;  //  True if this is the first time opening the driver.
static unsigned long long sensor_node_address = 0;  //  Address of this node, if this is a Sensor Node.
static struct os_event nrf24l01_event;  //  Event that will be forwarded to the Event Queue when a receive interrupt is triggered.

//  Definition of nRF24L01 Sensor Network Interface
static const struct sensor_network_interface network_iface = {
    COLLECTOR_INTERFACE_TYPE,        //  uint8_t iface_type; Interface Type: Server or Collector
    NRF24L01_DEVICE,                 //  const char *network_device; Network device name.  Must be a static string.
    sizeof(struct nrf24l01_server),  //  uint8_t server_endpoint_size; Server Endpoint size
    register_transport,              //  int (*register_transport_func)(const char *network_device0, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size);  //  Register transport function
};

/////////////////////////////////////////////////////////
//  Device Creation Functions

static nRF24L01P *drv(struct nrf24l01 *dev) { return (nRF24L01P *)(dev->controller); }  //  Return the controller instance

static int nrf24l01_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  If first time we are opening the driver: Prepare the nrf24l01 transceiver for use.  Lock the port.
    assert(dev0);
    struct nrf24l01 *dev = (struct nrf24l01 *) dev0;
    console_printf("{\n");  ////
   
    //  If not configured, this must be the first call to configure. Return.
    if (!dev->is_configured) { return 0; }

    //  If device is already prepared, return.
    if (!first_open) { return 0; }
    first_open = false;

    //  Display the setup of the nRF24L01 module.
    console_printf( "%sfreq: %d MHz\r\n",         _nrf, drv(dev)->getRfFrequency() );
    console_printf( "%spwr: %d dBm\r\n",          _nrf, drv(dev)->getRfOutputPower() );
    console_printf( "%sdata rate: %d kbps\r\n",   _nrf, drv(dev)->getAirDataRate() );
    for (int i = 0; i < 6; i++) {
        console_printf( "%sP%d tx size: %d bytes\r\n", _nrf, i, drv(dev)->getTransferSize(NRF24L01P_PIPE_P0 + i) );
    }
    for (int i = 0; i < 6; i++) {
        console_printf( "%sP%d addr: 0x%010llX\r\n", _nrf, i, 
            (i == 0) 
                ? drv(dev)->getTxAddress()
                : drv(dev)->getRxAddress(NRF24L01P_PIPE_P0 + i)
        );
    }
    //  Power up after setting config.
    drv(dev)->powerUp();

    if (is_collector_node()) {
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
    return 0;
}

static int nrf24l01_close(struct os_dev *dev0) {
    //  Shutdown the nrf24l01 transceiver.  Unlock the port.
    //  TODO: Undo driver.init().
    console_printf("}\n");
    assert(dev0);
    return 0;
}

int nrf24l01_init(struct os_dev *dev0, void *arg) {
    //  Configure the nrf24l01 driver.  Called by os_dev_create().  Return 0 if successful.
    console_printf("%sinit\n", _nrf);
    struct nrf24l01 *dev;
    struct nrf24l01_cfg *cfg;
    int rc;
    if (!dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct nrf24l01 *) dev0;  assert(dev);
    dev->is_configured = 0;
    cfg = &dev->cfg;  assert(cfg);

    //  Assign the controller.
    dev->controller = &controller;

    //  Configure the SPI port.
    rc = hal_spi_config(cfg->spi_num, &cfg->spi_settings);
    assert(rc == 0);
    if (rc == EINVAL) { goto err; }

    rc = hal_spi_enable(cfg->spi_num);
    assert(rc == 0);
    if (rc) { goto err; }

    //  Configure the GPIOs for CS and CE.
    rc = hal_gpio_init_out(cfg->cs_pin, 1);
    assert(rc == 0);
    if (rc) { goto err; }

    rc = hal_gpio_init_out(cfg->ce_pin, 1);
    assert(rc == 0);
    if (rc) { goto err; }

    //  Register the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, nrf24l01_open, nrf24l01_close);

    //  Configure the rx interrupt, which is active when low.
    if (cfg->irq_pin != MCU_GPIO_PIN_NONE) {
        console_printf("%senable irq\n", _nrf);
        //  Initialize the event with the callback function.
        nrf24l01_event.ev_cb = nrf24l01_callback;
        hal_gpio_irq_init(cfg->irq_pin, nrf24l01_irq_handler, NULL,
		    HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_UP);
	    hal_gpio_irq_enable(cfg->irq_pin);
    }

    //  Register the Sensor Network Interface.
    rc = sensor_network_register_interface(&network_iface);
    assert(rc == 0);

    return (OS_OK);
err:
    return rc;
}

int nrf24l01_default_cfg(struct nrf24l01_cfg *cfg) {
    //  Copy the default nrf24l01 config into cfg.  Returns 0.
    assert(cfg);  console_printf("%sdefcfg\n", _nrf);
    memset(cfg, 0, sizeof(struct nrf24l01_cfg));  //  Zero the entire object.

    //  SPI Port Settings
    cfg->spi_settings.data_order = HAL_SPI_MSB_FIRST;       //  Data order
    cfg->spi_settings.data_mode  = HAL_SPI_MODE0;           //  Data mode of SPI driver: ClockPhase = 0, ClockPolarity = 0
    cfg->spi_settings.word_size  = HAL_SPI_WORD_SIZE_8BIT;  //  Word size of the SPI transaction
    cfg->spi_settings.baudrate   = MYNEWT_VAL(NRF24L01_SPI_BAUDRATE);  //  Baudrate in kHz e.g. 200 kHz (slow, for testing)
    //  cfg->spi_settings.baudrate = _NRF24L01P_SPI_MAX_DATA_RATE_HZ * _KHZ / 5;  //  Optimal Baudrate: 2000 kHz, 1/5th the maximum transfer rate for the SPI bus

    //  SPI Pins: Derived from the "Super Blue Pill" design https://docs.google.com/presentation/d/1WU_erkN-fPBfNYVX5BOHhjfHLPkTgSwOKEL8rYcAIrI/edit#slide=id.p
    cfg->spi_num    = MYNEWT_VAL(NRF24L01_SPI_NUM);  //  0 means SPI1, 1 means SPI2  TODO: MYNEWT_VAL(SPIFLASH_SPI_NUM);
    cfg->spi_cfg    = NULL;                          //  Not used
    cfg->cs_pin     = MYNEWT_VAL(NRF24L01_CS_PIN);   //  e.g. PB2
    cfg->ce_pin     = MYNEWT_VAL(NRF24L01_CE_PIN);   //  e.g. PB0

    //  Tx Frequency, Tx Power, Tx Data Rate
    cfg->freq           = MYNEWT_VAL(NRF24L01_FREQ);        //  e.g. 2,476 kHz (channel 76)
    cfg->power          = MYNEWT_VAL(NRF24L01_POWER);       //  e.g. 0 dB, Highest power in production
    cfg->data_rate      = MYNEWT_VAL(NRF24L01_DATA_RATE);   //  e.g. 250 kbps, Slowest, longest range, but only supported by nRF24L01+

    //  Tx Settings
    cfg->crc_width       = MYNEWT_VAL(NRF24L01_CRC_WIDTH);   //  e.g. 8 bits for CRC
    cfg->tx_size         = MYNEWT_VAL(NRF24L01_TX_SIZE);     //  e.g. 12 bytes. Each packet has this size
    cfg->auto_ack        = MYNEWT_VAL(NRF24L01_AUTO_ACK);    //  e.g. 0 for No acknowledgements
    cfg->auto_retransmit = MYNEWT_VAL(NRF24L01_AUTO_RETRANSMIT);  //  e.g. 0 for No retransmission

    //  Tx and Rx Addresses: Depends whether this is Collector Node or Sensor Node
    if (is_collector_node()) {                                  //  If this is the Collector Node...
        cfg->irq_pin            = MYNEWT_VAL(NRF24L01_IRQ_PIN); //  e.g. MCU_GPIO_PORTA(15) means Collector Node gets rx interrupts on PA15
        cfg->tx_address         = get_collector_node_address(); //  Collector Node address
        cfg->rx_addresses       = get_sensor_node_addresses();  //  Listen to all Sensor Nodes
        cfg->rx_addresses_len   = SENSOR_NETWORK_SIZE;    //  Number of Sensor Nodes to listen
    } else {                                              //  If this is a Sensor Node...
        sensor_node_address = get_sensor_node_address();
        cfg->irq_pin            = MCU_GPIO_PIN_NONE;      //  Disable rx interrupts for Sensor Nodes
        cfg->tx_address         = sensor_node_address;    //  Sensor Node address
        cfg->rx_addresses       = &sensor_node_address;   //  Listen to itself only. For handling acknowledgements in future
        cfg->rx_addresses_len   = 1;
    }
    //  console_printf("nrf spi baud: %u kHz\n", (unsigned) cfg->spi_settings.baudrate);  console_flush();  ////
    return 0;
}

int nrf24l01_config(struct nrf24l01 *dev, struct nrf24l01_cfg *cfg) {
    //  Apply the nrf24l01 driver configuration.  Return 0 if successful.
    console_printf("%sconfig\n", _nrf);
    assert(dev);  assert(cfg);

    //  Initialise the controller.
    int rc = drv(dev)->init(cfg->spi_num,       cfg->cs_pin,        cfg->ce_pin,    cfg->irq_pin,
        cfg->freq,          cfg->power,         cfg->data_rate,     cfg->crc_width, 
        cfg->tx_size,       cfg->auto_ack,      cfg->auto_retransmit, 
        cfg->tx_address,    cfg->rx_addresses,  cfg->rx_addresses_len);
    assert(rc == 0);
    dev->is_configured = 1;
    return rc;
}

static int register_transport(const char *network_device, void *server_endpoint, const char *host, uint16_t port, uint8_t server_endpoint_size) {
    //  Called by Sensor Network Interface to register the transport.
    assert(server_endpoint_size >= sizeof(struct nrf24l01_server));  //  Server Endpoint too small
    int rc = nrf24l01_register_transport(network_device, (struct nrf24l01_server *) server_endpoint, host, port);
    return rc;
}

/////////////////////////////////////////////////////////
//  Transmit / Receive Functions

int nrf24l01_send(struct nrf24l01 *dev, uint8_t *buf, uint8_t size) {
    //  Transmit the data.
    assert(dev);  assert(buf);  assert(size > 0);
    console_printf("%s>> ", _nrf); console_dump(buf, size); console_printf("\n");
    int rc = drv(dev)->write(NRF24L01P_PIPE_P0 /* Ignored */, (char *) buf, size);
    assert(rc == size);
    return rc;
}

int nrf24l01_receive(struct nrf24l01 *dev, int pipe, uint8_t *buf, uint8_t size) {
    //  Receive data from the pipe.
    assert(dev);  assert(pipe > 0);  assert(pipe <= 5);  assert(buf);  assert(size > 0);
    int rc = drv(dev)->read(pipe, (char *) buf, size);
    assert(rc > 0);
    return rc;
}

int nrf24l01_readable_pipe(struct nrf24l01 *dev) {
    //  Return the pipe number that has received data.  -1 if no data received.
    assert(dev);
    int rc = drv(dev)->readablePipe();
    return rc;
}

unsigned long long nrf24l01_get_rx_address(struct nrf24l01 *dev, int pipe) {
    //  Return the rx address of the pipe (1 to 5).
    assert(dev);  assert(pipe > 0);  assert(pipe <= 5);
    unsigned long long ret = drv(dev)->getRxAddress(pipe);
    return ret;
}

static void nrf24l01_irq_handler(void *arg) {
    //  Interrupt service routine for the driver, triggered when a message is received.  
    //  We forward to the Default Event Queue for deferred processing.  Don't do any processing here.
	nrf24l01_event.ev_arg = arg;
	os_eventq_put(os_eventq_dflt_get(), &nrf24l01_event);  //  This triggers nrf24l01_callback().
}

/////////////////////////////////////////////////////////
//  Other Functions

int nrf24l01_flush_tx(struct nrf24l01 *dev) {
    //  Flush the transmit buffer.  Return 0 if successful.
    assert(dev);
    drv(dev)->flushTx();
    return 0;
}

int nrf24l01_flush_rx(struct nrf24l01 *dev) {
    //  Flush the receive buffer.  Return 0 if successful.
    assert(dev);
    drv(dev)->flushRx();
    return 0;
}

int nrf24l01_flush_txrx(struct nrf24l01 *dev) {
    //  Flush the transmit and receive buffers.  Return 0 if successful.
    assert(dev);
    drv(dev)->flushTx();
    drv(dev)->flushRx();
    return 0;
}
