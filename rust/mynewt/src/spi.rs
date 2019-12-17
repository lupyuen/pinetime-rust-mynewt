//!  Experimental Non-Blocking SPI Transfer API
use crate::{
    result::*,
    hw::hal,
    kernel::os::{
        self,
        os_callout,
    },
};

//  TODO: Remove SPI settings for ST7789 display controller
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

/// Callout that is invoked when non-blocking SPI transfer is completed
static mut spi_callout: os_callout = fill_zero!(os_callout);

/// Init non-blocking SPI transfer
pub fn spi_noblock_init() -> MynewtResult<()> {
    unsafe { hal::hal_spi_disable(SPI_NUM) };

    let rc = unsafe { hal::hal_spi_config(SPI_NUM, &mut SPI_SETTINGS) };
    assert_eq!(rc, 0, "spi config fail");  //  TODO: Map to MynewtResult

    let arg = unsafe { core::mem::transmute(&mut spi_cb_obj) };
    let rc = unsafe { hal::hal_spi_set_txrx_cb(SPI_NUM, Some(spi_noblock_handler), arg) };
    assert_eq!(rc, 0, "spi cb fail");  //  TODO: Map to MynewtResult

    let rc = unsafe { hal::hal_spi_enable(SPI_NUM) };
    assert_eq!(rc, 0, "spi enable fail");  //  TODO: Map to MynewtResult

    let rc = unsafe { hal::hal_gpio_init_out(SPI_SS_PIN, 1) };
    assert_eq!(rc, 0, "gpio fail");  //  TODO: Map to MynewtResult

    //  Init the callout to handle completed SPI transfers.
    unsafe {
        os::os_callout_init(
            &mut spi_callout, 
            os::eventq_dflt_get() ? , 
            Some(spi_noblock_callback), 
            core::ptr::null_mut()
        )
    };
    Ok(())
}

/// Enqueue request for non-blocking SPI write. Returns without waiting for write to complete.
#[cfg(feature = "spi_noblock")]
pub fn spi_noblock_write(words: &[u8]) -> MynewtResult<()> {
    //  TODO: Add to request queue. Make a copy of the data to be sent.
    Ok(())
}

/// Perform non-blocking SPI write.  Returns without waiting for write to complete.
#[cfg(feature = "spi_noblock")]
fn internal_spi_noblock_write(txbuffer: *mut core::ffi::c_void, txlen: i32) -> MynewtResult<()> {
    unsafe { spi_cb_obj.txlen = txlen };
    //  Set the SS Pin to low to start the transfer.
    unsafe { hal::hal_gpio_write(SPI_SS_PIN, 0) };
    //  Write the SPI data.
    let rc = unsafe { hal::hal_spi_txrx_noblock(
        SPI_NUM, 
        txbuffer,               //  TX Buffer
        core::ptr::null_mut(),  //  RX Buffer (don't receive)        
        txlen) };
    assert_eq!(rc, 0, "spi fail");  //  TODO: Map to MynewtResult
    Ok(())
}

/// Called by interrupt handler after Non-blocking SPI transfer
extern "C" fn spi_noblock_handler(_arg: *mut core::ffi::c_void, _len: i32) {
    //  Set SS Pin to high to stop the transfer.
    unsafe { hal::hal_gpio_write(SPI_SS_PIN, 1) };
    //  Trigger the callout to transmit next SPI request.
    unsafe { os::os_callout_reset(&mut spi_callout, 0) };
}

/// Callout after Non-blocking SPI transfer
extern "C" fn spi_noblock_callback(_ev: *mut os::os_event) {
    //  TODO: Transmit the next queued SPI request.
    //  internal_spi_noblock_write(txbuffer: *mut core::ffi::c_void, txlen: i32);
}

/* mbuf
    static struct os_mbuf *semihost_mbuf = NULL;

    void console_buffer(const char *buffer, unsigned int length) {
        //  Append "length" number of bytes from "buffer" to the output buffer.
    #ifdef DISABLE_SEMIHOSTING  //  If Arm Semihosting is disabled...
        return;                 //  Don't write debug messages.
    #else                       //  If Arm Semihosting is enabled...
        int rc;
        if (!log_enabled) { return; }           //  Skip if log not enabled.
        if (!debugger_connected()) { return; }  //  If debugger is not connected, quit.
        if (!semihost_mbuf) {                   //  Allocate mbuf if not already allocated.
            semihost_mbuf = os_msys_get_pkthdr(length, 0);
            if (!semihost_mbuf) { return; }  //  If out of memory, quit.
        }
        //  Limit the buffer size.  Quit if too big.
        if (os_mbuf_len(semihost_mbuf) + length >= OUTPUT_BUFFER_SIZE) { return; }
        //  Append the data to the mbuf chain.  This may increase the numbere of mbufs in the chain.
        rc = os_mbuf_append(semihost_mbuf, buffer, length);
        if (rc) { return; }  //  If out of memory, quit.
    #endif  //  DISABLE_SEMIHOSTING
    }
*/

/* mqueue
    uint32_t pkts_rxd;
    struct os_mqueue rxpkt_q;
    struct os_eventq my_task_evq;

    // Removes each packet from the receive queue and processes it.
    void
    process_rx_data_queue(void)
    {
        struct os_mbuf *om;

        while ((om = os_mqueue_get(&rxpkt_q)) != NULL) {
            ++pkts_rxd;
            os_mbuf_free_chain(om);
        }
    }

    // Called when a packet is received.
    int
    my_task_rx_data_func(struct os_mbuf *om)
    {
        int rc;

        // Enqueue the received packet and wake up the listening task.
        rc = os_mqueue_put(&rxpkt_q, &my_task_evq, om);
        if (rc != 0) {
            return -1;
        }

        return 0;
    }

    void
    my_task_handler(void *arg)
    {
        struct os_event *ev;
        struct os_callout_func *cf;
        int rc;

        // Initialize eventq
        os_eventq_init(&my_task_evq);

        // Initialize mqueue
        os_mqueue_init(&rxpkt_q, NULL);

        // Process each event posted to our eventq.  When there are no events to process, sleep until one arrives.
        while (1) {
            os_eventq_run(&my_task_evq);
        }
    }
*/

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