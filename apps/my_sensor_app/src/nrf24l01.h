//  nRF24L01 Driver for Apache Mynewt.  Functions for creating the device instance and performing device functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __NRF24L01_DRIVER_H__
#define __NRF24L01_DRIVER_H__
#include <os/os_dev.h>    //  For os_dev
#include <os/os_mutex.h>  //  For os_mutex

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define NRF24L01_DEVICE "nrf24l01_0"  //  Name of the device

//  Device Configuration
struct nrf24l01_cfg {
    struct hal_spi_settings spi_settings;
    int spi_num;    //  0 means SPI1, 1 means SPI2
    void *spi_cfg;  //  Low-level MCU SPI config
    int cs_pin;     //  Default is PB2
    int ce_pin;     //  Default is PB0
    int irq_pin;    //  Default is PA15
};

//  Device Instance
struct nrf24l01 {
    struct os_dev dev;
    struct nrf24l01_cfg cfg;
    void *controller;  //  Pointer to controller instance (nRF24L01P *)
    struct os_mutex lock;
};

//  Create the device instance and configure it.  Called by sysinit() during startup, defined in pkg.yml.
//  Implemented in creator.c as function DEVICE_CREATE().
void nrf24l01_create(void);

//  Copy the default device config into cfg.  Returns 0.
int nrf24l01_default_cfg(struct nrf24l01_cfg *cfg);

//  Configure the device.  Called by os_dev_create().  Return 0 if successful.
int nrf24l01_init(struct os_dev *dev0, void *arg);

//  Apply the device configuration.  Return 0 if successful.
int nrf24l01_config(struct nrf24l01 *dev, struct nrf24l01_cfg *cfg);

#ifdef __cplusplus
}
#endif

#endif /* __NRF24L01_DRIVER_H__ */
