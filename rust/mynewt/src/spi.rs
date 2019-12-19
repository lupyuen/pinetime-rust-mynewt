//!  Experimental Non-Blocking SPI Transfer API
use crate::{
    self as mynewt,
    result::*,
    hw::hal,
    kernel::os,
    NULL, Ptr, Strn,
};
use mynewt_macros::{
    init_strn,
};

//  TODO: Remove SPI settings for ST7789 display controller
const DISPLAY_SPI: i32  =  0;  //  Mynewt SPI port 0
const DISPLAY_CS: i32   = 25;  //  LCD_CS (P0.25): Chip select
const DISPLAY_DC: i32   = 18;  //  LCD_RS (P0.18): Clock/data pin (CD)
//  const DISPLAY_RST: i32  = 26;  //  LCD_RESET (P0.26): Display reset
//  const DISPLAY_HIGH: i32 = 23;  //  LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23): Backlight (active low)

const SPI_NUM: i32    = DISPLAY_SPI;
const SPI_SS_PIN: i32 = DISPLAY_CS;
const SPI_DC_PIN: i32 = DISPLAY_DC;

/// TODO: Remove SPI settings for ST7789 display controller
static mut SPI_SETTINGS: hal::hal_spi_settings = hal::hal_spi_settings {
    data_order: hal::HAL_SPI_MSB_FIRST as u8,
    data_mode:  hal::HAL_SPI_MODE3 as u8,  //  SPI must be used in mode 3. Mode 0 (the default) won't work.
    baudrate:   8000,  //  In kHZ. Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
    word_size:  hal::HAL_SPI_WORD_SIZE_8BIT as u8,
};

//  TODO: Get this constant from Mynewt
const OS_TICKS_PER_SEC: u32 = 1000;

/// Non-blocking SPI transfer callback parameter
struct SpiCallback {
    txlen: i32,
    //  transfers: i32,
    //  tx_rx_bytes: u32,
}

/// Non-blocking SPI transfer callback values
static mut SPI_CALLBACK: SpiCallback = SpiCallback {
    txlen: 0,
    //  transfers: 0,
    //  tx_rx_bytes: 0,
};

/// Semaphore that is signalled for every completed SPI request
static mut SPI_SEM: os::os_sem = fill_zero!(os::os_sem);

/// Mbuf Queue that contains the SPI data packets to be sent. Why did we use Mbuf Queue? Because it allows packets of various sizes to be copied efficiently.
static mut SPI_DATA_QUEUE: os::os_mqueue = fill_zero!(os::os_mqueue);

/// Event Queue that contains the pending non-blocking SPI requests
static mut SPI_EVENT_QUEUE: os::os_eventq = fill_zero!(os::os_eventq);

/// SPI Task that will send each SPI request sequentially
static mut SPI_TASK: os::os_task = fill_zero!(os::os_task);

/// Stack space for SPI Task, initialised to 0.
static mut SPI_TASK_STACK: [os::os_stack_t; SPI_TASK_STACK_SIZE] = 
    [0; SPI_TASK_STACK_SIZE];

/// Size of the stack (in 4-byte units). Previously `OS_STACK_ALIGN(256)`  
const SPI_TASK_STACK_SIZE: usize = 256;

/// Init non-blocking SPI transfer
pub fn spi_noblock_init() -> MynewtResult<()> {
    //  Disable SPI port
    unsafe { hal::hal_spi_disable(SPI_NUM) };

    //  Configure SPI port for non-blocking SPI
    let rc = unsafe { hal::hal_spi_config(SPI_NUM, &mut SPI_SETTINGS) }; assert_eq!(rc, 0, "spi config fail");  //  TODO: Map to MynewtResult
    let arg = unsafe { core::mem::transmute(&mut SPI_CALLBACK) };
    let rc = unsafe { hal::hal_spi_set_txrx_cb(
        SPI_NUM, 
        Some(spi_noblock_handler), 
        arg
    ) };
    assert_eq!(rc, 0, "spi cb fail");  //  TODO: Map to MynewtResult

    //  Enable SPI port and set SS to high to disable SPI device
    let rc = unsafe { hal::hal_spi_enable(SPI_NUM) }; assert_eq!(rc, 0, "spi enable fail");  //  TODO: Map to MynewtResult
    let rc = unsafe { hal::hal_gpio_init_out(SPI_SS_PIN, 1) }; assert_eq!(rc, 0, "gpio fail");  //  TODO: Map to MynewtResult
    let rc = unsafe { hal::hal_gpio_init_out(SPI_DC_PIN, 1) }; assert_eq!(rc, 0, "gpio fail");  //  TODO: Map to MynewtResult

    //  Create Event Queue and Mbuf (Data) Queue that will store the pending SPI requests
    unsafe { os::os_eventq_init(&mut SPI_EVENT_QUEUE) };
    let rc = unsafe { os::os_mqueue_init(
        &mut SPI_DATA_QUEUE, 
        Some(spi_event_callback), 
        NULL
    ) };
    assert_eq!(rc, 0, "mqueue fail");  //  TODO: Map to MynewtResult

    //  Create the Semaphore that will signal whether the SPI request has completed
    let rc = unsafe { os::os_sem_init(&mut SPI_SEM, 0) };  //  Init to 0 tokens, so caller will block until SPI request is completed.
    assert_eq!(rc, 0, "sem fail");  //  TODO: Map to MynewtResult

    //  Create a task to send SPI requests sequentially from the SPI Event Queue and Mbuf Queue
    os::task_init(                //  Create a new task and start it...
        unsafe { &mut SPI_TASK }, //  Task object will be saved here
        &init_strn!( "spi" ),     //  Name of task
        Some( spi_task_func ),    //  Function to execute when task starts
        NULL,  //  Argument to be passed to above function
        10,    //  Task priority: highest is 0, lowest is 255 (main task is 127)
        os::OS_WAIT_FOREVER as u32,     //  Don't do sanity / watchdog checking
        unsafe { &mut SPI_TASK_STACK }, //  Stack space for the task
        SPI_TASK_STACK_SIZE as u16      //  Size of the stack (in 4-byte units)
    ) ? ;                               //  `?` means check for error
    Ok(())
}

/// SPI Task Function.  Execute sequentially each SPI request posted to our Event Queue.  When there are no requests to process, block until one arrives.
extern "C" fn spi_task_func(_arg: Ptr) {
    loop {
        //  Forever read SPI requests and execute them
        os::eventq_run(
            unsafe { &mut SPI_EVENT_QUEUE }
        ).expect("eventq fail");
    }
}

/// Pending SPI Command Byte to be written
static mut PENDING_CMD: heapless::Vec<u8, PendingCmdSize> = heapless::Vec(heapless::i::Vec::new());
/// Pending SPI Data Bytes to be written
static mut PENDING_DATA: heapless::Vec<u8, PendingDataSize> = heapless::Vec(heapless::i::Vec::new());
/// Max size of pending Command Bytes
type PendingCmdSize = heapless::consts::U1;
/// Max size of pending Data Bytes
type PendingDataSize = heapless::consts::U2048;

/// Enqueue request for non-blocking SPI write for Command Byte. Returns without waiting for write to complete.
pub fn spi_noblock_write_command(cmd: u8) -> MynewtResult<()> {
    //  If there is a pending Command Byte, enqueue it.
    if unsafe { PENDING_CMD.len() } > 0 {
        spi_noblock_write_flush() ? ;
    }
    //  Set the pending Command Byte.
    if unsafe { PENDING_CMD.push(cmd).is_err() } {
        return Err(MynewtError::SYS_EINVAL);
    }
    Ok(())
}

/// Enqueue request for non-blocking SPI write for Data Bytes. Returns without waiting for write to complete.
pub fn spi_noblock_write_data(data: &[u8]) -> MynewtResult<()> {
    assert!(unsafe { PENDING_CMD.len() } > 0);  //  Must have Command Byte before Data Bytes
    unsafe { PENDING_DATA.extend_from_slice(data) } ? ;
    Ok(())
}

/// Enqueue request for non-blocking SPI write for Command Byte and Data Bytes. Returns without waiting for write to complete.
pub fn spi_noblock_write_flush() -> MynewtResult<()> {
    if let Err(e) = spi_noblock_write(
        unsafe { PENDING_CMD[0] },  //  Command Byte
        unsafe { &PENDING_DATA }    //  Data Bytes
    ) {
        unsafe { PENDING_CMD.clear() };
        unsafe { PENDING_DATA.clear() };    
        return Err(e);
    }
    unsafe { PENDING_CMD.clear() };
    unsafe { PENDING_DATA.clear() };
    Ok(())
}

/// Enqueue request for non-blocking SPI write. Returns without waiting for write to complete.
/// First byte must be a Command Byte, followed by Data Bytes.
fn spi_noblock_write(cmd: u8, data: &[u8]) -> MynewtResult<()> {
    //  Allocate a new mbuf to copy the data to be sent.
    let len = data.len() as u16 + 1;
    let mbuf = unsafe { os::os_msys_get_pkthdr(len, 0) };
    assert!(!mbuf.is_null(), "mbuf fail");
    if mbuf.is_null() { return Err(MynewtError::SYS_ENOMEM); }  //  If out of memory, quit.

    //  Append the request command to the mbuf chain.  This may increase the number of mbufs in the chain.
    let rc = unsafe { os::os_mbuf_append(
        mbuf, 
        core::mem::transmute(&cmd), 
        1
    ) };
    assert_eq!(rc, 0, "append fail");  //  TODO: Remove this
    if rc != 0 { return Err(MynewtError::SYS_ENOMEM); }  //  If out of memory, quit.

    //  Append the request data to the mbuf chain.  This may increase the number of mbufs in the chain.
    let rc = unsafe { os::os_mbuf_append(
        mbuf, 
        core::mem::transmute(data.as_ptr()), 
        data.len() as u16
    ) };
    assert_eq!(rc, 0, "append fail");  //  TODO: Remove this
    if rc != 0 { return Err(MynewtError::SYS_ENOMEM); }  //  If out of memory, quit.

    //  Add the mbuf to the SPI Mbuf Queue and trigger an event in the SPI Event Queue.
    let rc = unsafe { os::os_mqueue_put(
        &mut SPI_DATA_QUEUE, 
        &mut SPI_EVENT_QUEUE, 
        mbuf
    ) };
    assert_eq!(rc, 0, "put fail");  //  TODO: Remove this
    if rc != 0 { return Err(MynewtError::SYS_EUNKNOWN); }  //  If out of memory, quit.
    Ok(())
}

/// Callback for the event that is triggered when an SPI request is added to the queue.
extern "C" fn spi_event_callback(_event: *mut os::os_event) {
    loop {  //  For each mbuf chain found...
        //  Get the next SPI request, stored as an mbuf chain.
        let om = unsafe { os::os_mqueue_get(&mut SPI_DATA_QUEUE) };
        if om.is_null() { break; }

        //  Send the mbuf chain.
        let mut m = om;
        let mut first_byte = true;
        while !m.is_null() {  //  For each mbuf in the chain...
            let data = unsafe { (*m).om_data };  //  Fetch the data
            let len = unsafe { (*m).om_len };    //  Fetch the length
            if first_byte {  //  First byte of the mbuf chain is always command byte
                first_byte = false;
                //  Write the command byte
                internal_spi_noblock_write(
                    unsafe { core::mem::transmute(data) }, 
                    1 as i32,
                    true
                ).expect("int spi fail");

                //  These commands require a delay. TODO: Move to caller
                if unsafe { *data } == 0x01 /* Instruction::SWRESET */ ||
                    unsafe { *data } == 0x11 /* Instruction::SLPOUT */ ||
                    unsafe { *data } == 0x29 /* Instruction::DISPON */ {
                    delay_ms(200);
                }

                //  Write the rest of the data, after the command byte
                internal_spi_noblock_write(
                    unsafe { core::mem::transmute(data.add(1)) }, 
                    (len - 1) as i32,
                    false
                ).expect("int spi fail");

            } else {  //  Second and subsequently mbufs in the chain are all data bytes
                //  Write the data
                internal_spi_noblock_write(
                    unsafe { core::mem::transmute(data) }, 
                    len as i32,
                    false
                ).expect("int spi fail");
            }
            m = unsafe { (*m).om_next.sle_next };  //  Fetch next mbuf in the chain.
        }
        //  Free the entire mbuf chain.
        unsafe { os::os_mbuf_free_chain(om) };
    }
}

/// Perform non-blocking SPI write.  Blocks until SPI write completes.
fn internal_spi_noblock_write(txbuffer: Ptr, txlen: i32, is_command: bool) -> MynewtResult<()> {
    if txlen == 0 { return Ok(()); }
    unsafe { SPI_CALLBACK.txlen = txlen };
    assert!(txlen > 0, "bad spi len");

    //  If this is a command byte, set DC to low, else set DC to high.
    unsafe { hal::hal_gpio_write(
        SPI_DC_PIN,
        if is_command { 0 }
        else { 1 }
    ) };
    //  Set the SS Pin to low to start the transfer.
    unsafe { hal::hal_gpio_write(SPI_SS_PIN, 0) };

    //  Write the SPI data.
    let rc = unsafe { hal::hal_spi_txrx_noblock(
        SPI_NUM, 
        txbuffer, //  TX Buffer
        NULL,     //  RX Buffer (don't receive)        
        txlen) };
    assert_eq!(rc, 0, "spi fail");  //  TODO: Map to MynewtResult

    //  Wait for spi_noblock_handler() to signal that SPI request has been completed. Timeout in 1 second.
    let timeout = 1000;
    unsafe { os::os_sem_pend(&mut SPI_SEM, timeout * OS_TICKS_PER_SEC / 1000) };
    Ok(())
}

/// Called by interrupt handler after Non-blocking SPI transfer has completed
extern "C" fn spi_noblock_handler(_arg: *mut core::ffi::c_void, _len: i32) {
    //  Set SS Pin to high to stop the transfer.
    unsafe { hal::hal_gpio_write(SPI_SS_PIN, 1) };

    //  Signal to internal_spi_noblock_write() that SPI request has been completed.
    let rc = unsafe { os::os_sem_release(&mut SPI_SEM) };
    assert_eq!(rc, 0, "sem fail");
}

/// Sleep for the specified number of milliseconds
fn delay_ms(ms: u8) {
    let delay_ticks = (ms as u32) * OS_TICKS_PER_SEC / 1000;
    unsafe { os::os_time_delay(delay_ticks) };
}

/* mbuf code in C
    static struct os_mbuf *mbuf = NULL;

    void console_flush(void) {
        //  Flush output buffer to the console log.  This will be slow.
        if (!log_enabled) { return; }       //  Skip if log not enabled.
        if (!mbuf) { return; }     //  Buffer is empty, nothing to write.
        if (os_arch_in_isr()) { return; }   //  Don't flush if we are called during an interrupt.

        //  Swap mbufs first to prevent concurrency problems.
        struct os_mbuf *old = mbuf;
        mbuf = NULL;

        struct os_mbuf *m = old;
        while (m) {  //  For each mbuf in the chain...
            const unsigned char *data = OS_MBUF_DATA(m, const unsigned char *);  //  Fetch the data.
            int size = m->om_len;                         //  Fetch the size.
            semihost_write(SEMIHOST_HANDLE, data, size);  //  Write the data to Semihosting output.
            m = m->om_next.sle_next;                      //  Fetch next mbuf in the chain.
        }
        if (old) { os_mbuf_free_chain(old); }  //  Deallocate the old chain.
    }

    void console_buffer(const char *buffer, unsigned int length) {
        //  Append "length" number of bytes from "buffer" to the output buffer.
    #ifdef DISABLE_SEMIHOSTING  //  If Arm Semihosting is disabled...
        return;                 //  Don't write debug messages.
    #else                       //  If Arm Semihosting is enabled...
        int rc;
        if (!log_enabled) { return; }           //  Skip if log not enabled.
        if (!debugger_connected()) { return; }  //  If debugger is not connected, quit.
        if (!mbuf) {                   //  Allocate mbuf if not already allocated.
            mbuf = os_msys_get_pkthdr(length, 0);
            if (!mbuf) { return; }  //  If out of memory, quit.
        }
        //  Limit the buffer size.  Quit if too big.
        if (os_mbuf_len(mbuf) + length >= OUTPUT_BUFFER_SIZE) { return; }
        //  Append the data to the mbuf chain.  This may increase the numbere of mbufs in the chain.
        rc = os_mbuf_append(mbuf, buffer, length);
        if (rc) { return; }  //  If out of memory, quit.
    #endif  //  DISABLE_SEMIHOSTING
    }
*/

/* mqueue code in C
    uint32_t pkts_rxd;
    struct os_mqueue SPI_DATA_QUEUE;
    struct os_eventq SPI_EVENT_QUEUE;

    // Removes each packet from the receive queue and processes it.
    void
    process_rx_data_queue(void)
    {
        struct os_mbuf *om;

        while ((om = os_mqueue_get(&SPI_DATA_QUEUE)) != NULL) {
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
        rc = os_mqueue_put(&SPI_DATA_QUEUE, &SPI_EVENT_QUEUE, om);
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
        os_eventq_init(&SPI_EVENT_QUEUE);

        // Initialize mqueue
        os_mqueue_init(&SPI_DATA_QUEUE, NULL);

        // Process each event posted to our eventq.  When there are no events to process, sleep until one arrives.
        while (1) {
            os_eventq_run(&SPI_EVENT_QUEUE);
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