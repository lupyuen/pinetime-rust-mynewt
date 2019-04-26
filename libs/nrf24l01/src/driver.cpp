//  nRF24L01 Driver for Apache Mynewt.  Functions for creating the device instance and performing device functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#include <errno.h>
#include <os/os.h>
#include <bsp/bsp.h>
#include <hal/hal_bsp.h>
#include <hal/hal_gpio.h>
#include <console/console.h>
#include "nRF24L01P.h"
#include "nrf24l01/nrf24l01.h"

#define _NRF24L01P_SPI_MAX_DATA_RATE_HZ     10 * 1000 * 1000  //  10 MHz, maximum transfer rate for the SPI bus
#define _KHZ                                1 / 1000          //  Convert Hz to kHz: 1000 Hz = 1 kHz

static nRF24L01P controller;    //  The single controller instance.  TODO: Support multiple instances.
static bool first_open = true;  //  True if this is the first time opening the driver.

/////////////////////////////////////////////////////////
//  Device Creation Functions

static nRF24L01P *drv(struct nrf24l01 *dev) { return (nRF24L01P *)(dev->controller); }  //  Return the controller instance
// static nrf24l01_cfg *cfg(struct nrf24l01 *dev) { return &dev->cfg; }                    //  Return the device config

static int nrf24l01_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  If first time we are opening the driver: Prepare the nrf24l01 transceiver for use.  Lock the port.
    if (!first_open) { console_printf("{\n"); return 0; }  ////
    first_open = false;
    console_printf("{\n");  ////
    assert(dev0);
    return 0;
}

static int nrf24l01_close(struct os_dev *dev0) {
    //  Shutdown the nrf24l01 transceiver.  Unlock the port.
    //  TODO: Undo driver.init().
    console_printf("}\n");  console_flush();  ////
    assert(dev0);
    return 0;
}

//  Event that will be forwarded to the Event Queue when an interrupt is triggered.
static struct os_event nrf24l01_event;

static void nrf24l01_irq_handler(void *arg) {
    //  Interrupt service routine for the driver.  We forward to an Event Queue for deferred processing.  Don't do any processing here.
	nrf24l01_event.ev_arg = arg;
	os_eventq_put(os_eventq_dflt_get(), &nrf24l01_event);  //  This triggers nrf24l01_callback().
}

int nrf24l01_init(struct os_dev *dev0, void *arg) {
    //  Configure the nrf24l01 driver.  Called by os_dev_create().  Return 0 if successful.
    console_printf("nrf init\n");  console_flush();  ////
    struct nrf24l01 *dev;
    struct nrf24l01_cfg *cfg;
    int rc;
    if (!dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct nrf24l01 *) dev0;  assert(dev);
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
        console_printf("nrf enable irq\n");  console_flush();  ////
        //  Initialize the event with the callback function.
        nrf24l01_event.ev_cb = nrf24l01_callback;
        hal_gpio_irq_init(cfg->irq_pin, nrf24l01_irq_handler, NULL,
		    HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_UP);
	    hal_gpio_irq_enable(cfg->irq_pin);
    }

    return (OS_OK);
err:
    return rc;
}

//  #define COLLECTOR_NODE_HWID 0x57  //  My Mac is Collector Node
#define COLLECTOR_NODE_HWID 0x38  //  My Windows is Collector Node

static uint8_t hw_id[12];  //  Hardware ID is 12 bytes for STM32
static int hw_id_len = 0;  //  Actual length of hardware ID
static unsigned long long sensor_node_address = 0;

bool nrf24l01_collector_node(void) {
    //  Return true if this is the collector node.
    //  Fetch the hardware ID.  This is unique across all microcontrollers.
    if (hw_id_len == 0) {
        hw_id_len = hal_bsp_hw_id_len();     //  Fetch the length, i.e. 12
        assert((unsigned) hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.
        hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));  assert(hw_id_len > 0);  //  Get the hardware ID.
    }  
    if (hw_id[0] == COLLECTOR_NODE_HWID) {
        console_printf("*** collector node\n");
        return true; 
    }
    console_printf("sensor node\n");
    return false; 
}

//  Collector Node + Sensor Nodes Configuration: Follows page 13 of https://www.sparkfun.com/datasheets/Components/nRF24L01_prelim_prod_spec_1_2.pdf

#define COLLECTOR_NODE_ADDRESS 0x7878787878ull  //  Collector Node Address (Pipe 0)
#define SENSOR_NETWORK_ADDRESS 0xB3B4B5B6ull    //  Sensor Nodes have addresses 0xB3B4B5B6??  (Pipes 1 to 5)
#define SENSOR_NETWORK_SIZE    5                //  5 Sensor Nodes in the Sensor Network  (Pipes 1 to 5)

//  Map a Sensor Network Address + Node ID to Sensor Node Address e.g. ADDR(0xB3B4B5B6, 0xf1) = 0xB3B4B5B6f1
#define ADDR(network_addr, node_id) (node_id + (network_addr << 8))

//  Addresses of the 5 Sensor Nodes
static const unsigned long long sensor_node_addresses[SENSOR_NETWORK_SIZE] = {
    ADDR(SENSOR_NETWORK_ADDRESS, 0xf1),  //  Pipe 1 e.g. 0xB3B4B5B6f1
    ADDR(SENSOR_NETWORK_ADDRESS, 0xcd),  //  Pipe 2
    ADDR(SENSOR_NETWORK_ADDRESS, 0xa3),  //  Pipe 3
    ADDR(SENSOR_NETWORK_ADDRESS, 0x0f),  //  Pipe 4
    ADDR(SENSOR_NETWORK_ADDRESS, 0x05),  //  Pipe 5
};

int nrf24l01_default_cfg(struct nrf24l01_cfg *cfg) {
    //  Copy the default nrf24l01 config into cfg.  Returns 0.
    assert(cfg);  console_printf("nrf defcfg\n");  console_flush();  ////    
    memset(cfg, 0, sizeof(struct nrf24l01_cfg));  //  Zero the entire object.

    //  SPI Port Settings
    cfg->spi_settings.data_order = HAL_SPI_MSB_FIRST;       //  Data order
    cfg->spi_settings.data_mode  = HAL_SPI_MODE0;           //  Data mode of SPI driver: ClockPhase = 0, ClockPolarity = 0
    cfg->spi_settings.word_size  = HAL_SPI_WORD_SIZE_8BIT;  //  Word size of the SPI transaction
    cfg->spi_settings.baudrate   = 200;                     //  Baudrate in kHz: 200 kHz (slow, for testing)
    //  cfg->spi_settings.baudrate = _NRF24L01P_SPI_MAX_DATA_RATE_HZ * _KHZ / 5;  //  Baudrate in kHz: 2000 kHz, 1/5th the maximum transfer rate for the SPI bus

    //  SPI Pins: Derived from the "Super Blue Pill" design https://docs.google.com/presentation/d/1WU_erkN-fPBfNYVX5BOHhjfHLPkTgSwOKEL8rYcAIrI/edit#slide=id.p
    cfg->spi_num    = 0;                  //  0 means SPI1, 1 means SPI2  TODO: MYNEWT_VAL(SPIFLASH_SPI_NUM);
    cfg->spi_cfg    = NULL;               //  Not used
    cfg->cs_pin     = MCU_GPIO_PORTB(2);  //  PB2  TODO: MYNEWT_VAL(SPIFLASH_SPI_CS_PIN);
    cfg->ce_pin     = MCU_GPIO_PORTB(0);  //  PB0

    //  Tx Frequency
    cfg->freq           = 2476;                           //  2,476 kHz (channel 76)

    //  Tx Power
    cfg->power          = NRF24L01P_TX_PWR_ZERO_DB;       //  Highest power in production
    //  cfg->power      = NRF24L01P_TX_PWR_MINUS_12_DB;   //  Test with lowest power in case of power issues

    //  Tx Data Rate
    cfg->data_rate      = NRF24L01P_DATARATE_250_KBPS;    //  Slowest, longest range, but only supported by nRF24L01+
    //  cfg->data_rate  = NRF24L01P_DATARATE_1_MBPS;      //  Slowest rate supported by both nRF24L01 and nRF24L01+

    //  Tx Settings
    cfg->crc_width       = NRF24L01P_CRC_8_BIT;
    cfg->tx_size         = NRF24L01_TRANSFER_SIZE;        //  Each packet has this size
    cfg->auto_ack        = 0;                             //  No acknowledgements
    cfg->auto_retransmit = 0;

    //  Tx and Rx Addresses: Depends whether this is Collector Node or Sensor Node

    if (nrf24l01_collector_node()) {                      //  If this is the Collector Node...
        cfg->irq_pin            = MCU_GPIO_PORTA(15);     //  Collector Node gets rx interrupts on PA15
        cfg->tx_address         = COLLECTOR_NODE_ADDRESS; //  Collector Node address
        cfg->rx_addresses       = sensor_node_addresses;  //  Listen to all Sensor Nodes
        cfg->rx_addresses_len   = SENSOR_NETWORK_SIZE;    //  Number of Sensor Nodes to listen

    } else {                                              //  If this is a Sensor Node...
        int node = 0;                                     //  TODO: Allocate node ID according to hardware ID
        sensor_node_address = sensor_node_addresses[node];

        cfg->irq_pin            = MCU_GPIO_PIN_NONE;      //  Disable rx interrupts for Sensor Nodes
        cfg->tx_address         = sensor_node_address;    //  Sensor Node address
        cfg->rx_addresses       = &sensor_node_address;   //  Listen to itself only. For handling acknowledgements in future
        cfg->rx_addresses_len   = 1;
    }

    console_printf("nrf spi baud: %u kHz\n", (unsigned) cfg->spi_settings.baudrate);  console_flush();  ////
    return 0;
}

int nrf24l01_config(struct nrf24l01 *dev, struct nrf24l01_cfg *cfg) {
    //  Apply the nrf24l01 driver configuration.  Return 0 if successful.
    console_printf("nrf config\n");  console_flush();  ////
    assert(dev);  assert(cfg);

    //  Initialise the controller.
    int rc = drv(dev)->init(cfg->spi_num,       cfg->cs_pin,        cfg->ce_pin,    cfg->irq_pin,
        cfg->freq,          cfg->power,         cfg->data_rate,     cfg->crc_width, 
        cfg->tx_size,       cfg->auto_ack,      cfg->auto_retransmit, 
        cfg->tx_address,    cfg->rx_addresses,  cfg->rx_addresses_len);
    assert(rc == 0);
    return rc;
}

int nrf24l01_send(struct nrf24l01 *dev, uint8_t *buf, uint8_t size) {
    //  Transmit the data.
    assert(dev);  assert(buf);  assert(size > 0);
    console_printf("nrf >> "); console_dump(buf, size); console_printf("\n");
    int rc = drv(dev)->write(NRF24L01P_PIPE_P0 /* Ignored */, (char *) buf, size);
    return rc;
}
