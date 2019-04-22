//  nRF24L01 Driver for Apache Mynewt.  Functions for creating the device instance and performing device functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#include <os/os.h>
#include <sensor/sensor.h>
#include <console/console.h>
#include "Controller.h"
#include "nrf24l01.h"

static nRF24L01P controller;    //  The single controller instance.  TODO: Support multiple instances.
static bool first_open = true;  //  True if this is the first time opening the driver.

/////////////////////////////////////////////////////////
//  Device Creation Functions

static nRF24L01P *drv(struct nrf24l01 *dev) { return (nRF24L01P *)(dev->controller); }  //  Return the controller instance
static nrf24l01_cfg *cfg(struct nrf24l01 *dev) { return &dev->cfg; }                 //  Return the device config

static int nrf24l01_open(struct os_dev *dev0, uint32_t timeout, void *arg) {
    //  If first time we are opening the driver: Prepare the nrf24l01 transceiver for use.  Lock the port.
    if (!first_open) { console_printf("{\n"); return 0; }  ////
    first_open = false;
    console_printf("}\n");  ////
    assert(dev0);
    struct nrf24l01 *dev = (struct nrf24l01 *) dev0;
    struct nrf24l01_cfg *cfg = &dev->cfg;

    //  Assign the controller.
    dev->controller = &controller;

    //  Erase the socket info.
    memset(cfg->_ids, 0, sizeof(cfg->_ids));
    memset(cfg->_cbs, 0, sizeof(cfg->_cbs));

    //  Set the buffers for the C++ instance. We pass in static buffers to avoid dynamic memory allocation (new, delete).
    drv(dev)->init(
        nrf24l01_tx_buffer, nrf24l01_TX_BUFFER_SIZE,
        nrf24l01_rx_buffer, nrf24l01_RX_BUFFER_SIZE,
        nrf24l01_parser_buffer, nrf24l01_PARSER_BUFFER_SIZE
    );
    drv(dev)->configure(cfg->uart);         //  Configure the UART port.  0 means UART2.
    return 0;
}

static int nrf24l01_close(struct os_dev *dev0) {
    //  Shutdown the nrf24l01 transceiver.  Unlock the port.
    //  TODO: Undo driver.init(), driver.configure() and driver.attach()
    console_printf("]\n");  console_flush();  ////
    assert(dev0);
    return 0;
}

int nrf24l01_init(struct os_dev *dev0, void *arg) {
    //  Configure the nrf24l01 driver.  Called by os_dev_create().  Return 0 if successful.
    struct nrf24l01 *dev;
    int rc;
    if (!arg || !dev0) { rc = SYS_ENODEV; goto err; }
    dev = (struct nrf24l01 *) dev0;  assert(dev);

    //  Register the handlers for opening and closing the device.
    OS_DEV_SETHANDLERS(dev0, nrf24l01_open, nrf24l01_close);
    return (OS_OK);
err:
    return rc;
}

int nrf24l01_default_cfg(struct nrf24l01_cfg *cfg) {
    //  Copy the default nrf24l01 config into cfg.  Returns 0.
    memset(cfg, 0, sizeof(struct nrf24l01_cfg));  //  Zero the entire object.
    cfg->uart = 0;  //  Default to UART number 0, which is UART2.
    return 0;
}

int nrf24l01_config(struct nrf24l01 *drv, struct nrf24l01_cfg *cfg) {
    //  Apply the nrf24l01 driver configuration.  Return 0 if successful.
    //  TODO: Copy the config
    return 0;  //  Nothing to do.  We will apply the config in nrf24l01_open().
}
