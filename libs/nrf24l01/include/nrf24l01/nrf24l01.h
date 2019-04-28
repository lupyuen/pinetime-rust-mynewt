//  nRF24L01 Driver for Apache Mynewt.  Functions for creating the device instance and performing device functions.
//  More about Mynewt Drivers: https://mynewt.apache.org/latest/os/modules/drivers/driver.html
#ifndef __NRF24L01_DRIVER_H__
#define __NRF24L01_DRIVER_H__
#include <os/os_dev.h>    //  For os_dev
#include <os/os_mutex.h>  //  For os_mutex
#include <hal/hal_spi.h>  //  For hal_spi_settings

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

#define NRF24L01_DEVICE "nrf24l01_0"  //  Name of the device
#define NRF24L01_TRANSFER_SIZE   12   //  Each packet will have 12 bytes. This value ranges from 1 to 32.

//  Device Configuration
struct nrf24l01_cfg {
    struct hal_spi_settings spi_settings;  //  SPI settings
    int spi_num;    //  0 means SPI1, 1 means SPI2
    void *spi_cfg;  //  Low-level MCU SPI config
    int cs_pin;     //  Default is PB2
    int ce_pin;     //  Default is PB0
    int irq_pin;    //  Default is PA15.  Set to MCU_GPIO_PIN_NONE to disable interrupt.
    int freq;       //  Frequency in kHz. Default is 2,476 kHz (channel 76)
    int power;
    int data_rate;
    int crc_width;  //  Default is NRF24L01P_CRC_8_BIT
    //  These settings apply for all pipes.
    int tx_size;
    uint8_t auto_ack;
    uint8_t auto_retransmit;
    //  List of pipes.
    unsigned long long tx_address;     //  Pipe 0
    const unsigned long long *rx_addresses;  //  Pipes 1 to 5
    uint8_t rx_addresses_len;
};

//  Device Instance
struct nrf24l01 {
    struct os_dev dev;
    struct nrf24l01_cfg cfg;
    uint8_t is_configured;  //  0 means not configured
    void *controller;       //  Pointer to controller instance (nRF24L01P *)
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

//  Return true if this is the collector node.
bool nrf24l01_collector_node(void);

//  TODO: Should be part of config.
void nrf24l01_callback(struct os_event *ev);

//  Transmit the data.
int nrf24l01_send(struct nrf24l01 *dev, uint8_t *buf, uint8_t size);

//  Receive data from the pipe.
int nrf24l01_receive(struct nrf24l01 *dev, int pipe, uint8_t *buf, uint8_t size);

//  Return the pipe number that has received data.  -1 if no data received.
int nrf24l01_readable_pipe(struct nrf24l01 *dev);

//  Return the rx address of the pipe (1 to 5).
unsigned long long nrf24l01_get_rx_address(struct nrf24l01 *dev, int pipe);

#ifdef __cplusplus
}
#endif

#endif /* __NRF24L01_DRIVER_H__ */
