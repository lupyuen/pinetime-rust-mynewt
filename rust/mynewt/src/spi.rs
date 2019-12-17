//!  Experimental Non-Blocking SPI Transfer API
use crate::{
    result::*,
    hw::hal,
    kernel::os,
};

//  TODO: Remove this
const DISPLAY_SPI: i32  =  0;  //  Mynewt SPI port 0
const DISPLAY_CS: i32   = 25;  //  LCD_CS (P0.25): Chip select
const DISPLAY_DC: i32   = 18;  //  LCD_RS (P0.18): Clock/data pin (CD)
const DISPLAY_RST: i32  = 26;  //  LCD_RESET (P0.26): Display reset
const DISPLAY_HIGH: i32 = 23;  //  LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23): Backlight (active low)

const SPI_NUM: i32 = DISPLAY_SPI;
const SPI_SS_PIN: i32 = DISPLAY_CS;

/// SPI settings for ST7789 display controller
static mut SPI_SETTINGS: hal::hal_spi_settings = hal::hal_spi_settings {
    data_order: hal::HAL_SPI_MSB_FIRST as u8,
    data_mode:  hal::HAL_SPI_MODE3 as u8,  //  SPI must be used in mode 3. Mode 0 (the default) won't work.
    baudrate:   8000,  //  In kHZ. Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
    word_size:  hal::HAL_SPI_WORD_SIZE_8BIT as u8,
};

/// Non-blocking SPI transfer callback parameter
struct spi_cb_arg {
    transfers: i32,
    txlen: i32,
    tx_rx_bytes: u32,
}

/// Non-blocking SPI transfer callback values
static mut spi_cb_obj: spi_cb_arg = spi_cb_arg {
    transfers: 0,
    txlen: 0,
    tx_rx_bytes: 0,
};

/// Called by interrupt handler after Non-blocking SPI transfer
extern "C" fn spi_noblock_handler(_arg: *mut core::ffi::c_void, _len: i32) {
    //  Set SS Pin to high to stop the transfer.
    unsafe { hal::hal_gpio_write(SPI_SS_PIN, 1) };
}

/// Init non-blocking SPI transfer
pub fn spi_noblock_init() {
    unsafe { hal::hal_spi_disable(SPI_NUM) };

    let rc = unsafe { hal::hal_spi_config(SPI_NUM, &mut SPI_SETTINGS) };
    assert_eq!(rc, 0, "spi config fail");

    let arg = unsafe { core::mem::transmute(&mut spi_cb_obj) };
    unsafe { hal::hal_spi_set_txrx_cb(SPI_NUM, Some(spi_noblock_handler), arg) };

    let rc = unsafe { hal::hal_spi_enable(SPI_NUM) };
    assert_eq!(rc, 0, "spi enable fail");

    let rc = unsafe { hal::hal_gpio_init_out(SPI_SS_PIN, 1) };
    assert_eq!(rc, 0, "gpio fail");    
}

/// Do non-blocking SPI transfer
#[cfg(feature = "spi_noblock")]
pub fn spi_noblock_transfer(txlen: i32) {
    //  Set the SS Pin to low to start the transfer.
    spi_cb_obj.txlen = txlen;
    hal::hal_gpio_write(SPI_SS_PIN, 0);
    let rc = hal::hal_spi_txrx_noblock(
        SPI_NUM, 
        core::mem::transmute(txbuffer.as_ptr()),  //  TX Buffer
        core::ptr::null_mut(),                    //  RX Buffer (don't receive)        
        txlen);
    assert_eq!(rc, 0, "spi fail");    
}

/* Non-Blocking SPI Transfer in Mynewt OS

    //  The spi txrx callback
    struct spi_cb_arg {
        int transfers;
        int txlen;
        uint32_t tx_rx_bytes;
    };
    struct spi_cb_arg spi_cb_obj;
    void *spi_cb_arg;
    ...
    void spi_noblock_handler(void *arg, int len) {
        int i;
        struct spi_cb_arg *cb;
        hal_gpio_write(SPI_SS_PIN, 1);
        if (spi_cb_arg) {
            cb = (struct spi_cb_arg *)arg;
            assert(len == cb->txlen);
            ++cb->transfers;
        }
        ++g_spi_xfr_num;
    }
    ...
    //  Non-blocking SPI transfer
    hal_spi_disable(SPI_NUM);
    spi_cb_arg = &spi_cb_obj;
    spi_cb_obj.txlen = 32;
    hal_spi_set_txrx_cb(SPI_NUM, spi_noblock_handler, spi_cb_arg);
    hal_spi_enable(SPI_NUM);
    ...
    hal_gpio_write(SPI_SS_PIN, 0);
    rc = hal_spi_txrx_noblock(SPI_NUM, g_spi_tx_buf, g_spi_rx_buf,
                                spi_cb_obj.txlen);
    assert(!rc);
*/