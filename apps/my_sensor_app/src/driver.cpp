//  nRF24L01 Driver for Apache Mynewt.  Functions for creating the device instance and performing device functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#include <os/os.h>
#include <bsp/bsp.h>
#include <console/console.h>
#include "nRF24L01P.h"
#include "nrf24l01.h"

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
    struct nrf24l01 *dev = (struct nrf24l01 *) dev0;
    struct nrf24l01_cfg *cfg = &dev->cfg;

    //  Assign the controller.
    dev->controller = &controller;

    //  Initialise the controller.
    drv(dev)->init(&cfg->spi_settings, cfg->spi_num, cfg->cs_pin, cfg->ce_pin, cfg->irq_pin);
    return 0;
}

static int nrf24l01_close(struct os_dev *dev0) {
    //  Shutdown the nrf24l01 transceiver.  Unlock the port.
    //  TODO: Undo driver.init().
    console_printf("}\n");  console_flush();  ////
    assert(dev0);
    return 0;
}

int nrf24l01_init(struct os_dev *dev0, void *arg) {
    //  Configure the nrf24l01 driver.  Called by os_dev_create().  Return 0 if successful.
    struct nrf24l01 *dev;
    int rc;
    if (!dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct nrf24l01 *) dev0;  assert(dev);

    //  Register the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, nrf24l01_open, nrf24l01_close);
    return (OS_OK);
err:
    return rc;
}

int nrf24l01_default_cfg(struct nrf24l01_cfg *cfg) {
    //  Copy the default nrf24l01 config into cfg.  Returns 0.
    assert(cfg);
    memset(cfg, 0, sizeof(struct nrf24l01_cfg));  //  Zero the entire object.

    //  Return default SPI settings.
    cfg->spi_settings.data_order = HAL_SPI_MSB_FIRST;  //  Data order
    cfg->spi_settings.data_mode  = HAL_SPI_MODE0;      //  Data mode of SPI driver: ClockPhase = 0, ClockPolarity = 0
    //  cfg->spi_settings.baudrate   = _NRF24L01P_SPI_MAX_DATA_RATE_HZ * _KHZ / 5;  //  Baudrate in kHz: 2000 kHz, 1/5th the maximum transfer rate for the SPI bus
    cfg->spi_settings.baudrate   = 200;  //  Baudrate in kHz: 200 kHz (slow)
    cfg->spi_settings.word_size  = HAL_SPI_WORD_SIZE_8BIT;  //  Word size of the SPI transaction
    cfg->spi_num = 0;     //  0 means SPI1, 1 means SPI2  TODO: MYNEWT_VAL(SPIFLASH_SPI_NUM);
    cfg->spi_cfg = NULL;  //  TODO
    cfg->cs_pin = MCU_GPIO_PORTB(2);  //  PB2  TODO: MYNEWT_VAL(SPIFLASH_SPI_CS_PIN);
    cfg->ce_pin = MCU_GPIO_PORTB(0);  //  PB0
    cfg->irq_pin = MCU_GPIO_PORTA(15);  //  PA15
    console_printf("spi baud: %u kHz\n", (unsigned) cfg->spi_settings.baudrate);  console_flush();  ////
    return 0;
}

int nrf24l01_config(struct nrf24l01 *drv, struct nrf24l01_cfg *cfg) {
    //  Apply the nrf24l01 driver configuration.  Return 0 if successful.
    assert(drv);  assert(cfg);
    //  Copy the config.
    memcpy(&drv->cfg, cfg, sizeof(struct nrf24l01_cfg));
    return 0;  //  Nothing to do.  We will apply the config in nrf24l01_open().
}
