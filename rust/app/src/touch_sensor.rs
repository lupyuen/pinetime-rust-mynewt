use embedded_hal::{
    self,
    blocking::delay::DelayMs,
    digital::v2::OutputPin,
};
use mynewt::{
    result::*,
    hw::hal,
    kernel::os::{
        self,
        os_event,
    },
    sys::console,
    fill_zero,
};
use crate::mynewt_hal::{
    MynewtDelay,
    MynewtGPIO,
};

/// Reset Pin for touch controller. Note: NFC antenna pins must be reassigned as GPIO pins for this to work.
const TOUCH_RESET_PIN: i32 = 10;  //  P0.10/NFC2: TP_RESET

/// Interrupt Pin for touch controller. We listen for the touch controller interrupt and trigger an event.
const TOUCH_INTERRUPT_PIN: i32 = 28;  //  P0.28/AIN4: TP_INT

/// Initialise the touch controller. NFC antenna pins must already be reassigned as GPIO pins:
/// Set `NFC_PINS_AS_GPIO: 1` in hw/bsp/nrf52/syscfg.yml.  To check whether whether NFC antenna 
/// pins have been correctly reassigned as GPIO pins, use the `nrf52` crate and check that the output is `fe`:
/// ```rust
/// let peripherals = nrf52::Peripherals::take().unwrap();
/// let nfcpins = peripherals.UICR.nfcpins.read().bits();
/// console::print("nfcpins = "); console::printhex(nfcpins as u8); console::print("\n");
/// ```
pub fn start_touch_sensor() -> MynewtResult<()> {
    console::print("Rust touch sensor\n");

    //  Create GPIO for the Reset Pin
    let mut reset = MynewtGPIO::new(TOUCH_RESET_PIN);
    let mut delay = MynewtDelay{};

    //  Reset the touch controller by switching the Reset Pin low then high with pauses. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.c#L1017-L1167
    reset.set_low() ? ;
    delay.delay_ms(20);
    reset.set_high() ? ;
    delay.delay_ms(200); delay.delay_ms(200);

    //  Initialise the touch event with the callback function
    unsafe { TOUCH_EVENT.ev_cb = Some( touch_event_callback ) };

    //  Configure the touch controller interrupt (active when low) to trigger a touch event
    let rc = unsafe { hal::hal_gpio_irq_init(
        TOUCH_INTERRUPT_PIN,              //  GPIO pin to be configured
        Some( touch_interrupt_handler ),  //  Call `touch_interrupt_handler()` upon detecting interrupt
        core::ptr::null_mut(),            //  No arguments for `touch_interrupt_handler()`
        hal::hal_gpio_irq_trigger_HAL_GPIO_TRIG_FALLING,  //  Trigger when interrupt goes from high to low
        hal::hal_gpio_pull_HAL_GPIO_PULL_UP               //  Pull up the GPIO pin
    ) };
    assert_eq!(rc, 0, "IRQ init fail");

    //  Start monitoring for touch controller interrupts
    unsafe { hal::hal_gpio_irq_enable(TOUCH_INTERRUPT_PIN) };
    Ok(())
}

/// Interrupt handler for the touch controller, triggered when a touch is detected
extern "C" fn touch_interrupt_handler(arg: *mut core::ffi::c_void) {
    //  We forward a touch event to the Default Event Queue for deferred processing.  Don't do any processing here.
    unsafe { TOUCH_EVENT.ev_arg = arg };
    //  Fetch the Default Event Queue. TODO: Use dedicated Event Queue for higher priority processing.
    let queue = os::eventq_dflt_get()
        .expect("GET fail");
	unsafe { os::os_eventq_put(queue, &mut TOUCH_EVENT) };  //  Trigger the callback function `touch_event_callback()`
}

/// Callback for the touch event that is triggered when a touch is detected
extern "C" fn touch_event_callback(_event: *mut os_event) {
    console::printhex(unsafe { os::os_time_get() } as u8);
    console::print(" touch\n"); console::flush();   
}

/// Read touch controller data. This only works when the screen has been tapped and the touch controller wakes up.
/// Ported from https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.c#L407-L466
fn read_touchdata(data: &mut TouchEventInfo) -> MynewtResult<()> {
    read_register_range(           //  Read the range of I2C registers...
        TOUCH_CONTROLLER_ADDRESS,  //  From the touch controller
        0,                         //  Starting from register 0
        POINT_READ_BUF as u8,      //  Number of registers to read
        unsafe { &mut buf }        //  Save the read data into `buf`
    ).expect("touchdata fail");
    *data = fill_zero!(TouchEventInfo);
    data.touch_point_num = unsafe { buf[FT_TOUCH_POINT_NUM] & 0x0F };
    data.touch_point     = 0;

    for i in 0..CFG_MAX_TOUCH_POINTS {
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
        if pointid >= HYN_MAX_ID { break; }

        //  Compute X and Y coordinates
        data.touch_point += 1;
        let x_high = unsafe { buf[HYN_TOUCH_X_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
        let x_low  = unsafe { buf[HYN_TOUCH_X_L_POS + HYN_TOUCH_STEP * i] } as u16;
        data.x[i]  = (x_high << 8) | x_low;

        let y_high = unsafe { buf[HYN_TOUCH_Y_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
        let y_low  = unsafe { buf[HYN_TOUCH_Y_L_POS + HYN_TOUCH_STEP * i] } as u16;
        data.y[i]  = (y_high << 8) | y_low;

        //  Compute type of touch (0 = down, 1 = up, 2 = contact) and finger ID
        data.touch_event[i] =
            unsafe { buf[HYN_TOUCH_EVENT_POS + HYN_TOUCH_STEP * i] } >> 6;
        data.finger_id[i] =
            unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;

        //  Compute touch pressure and area
        data.pressure[i] =
            unsafe { buf[HYN_TOUCH_XY_POS + HYN_TOUCH_STEP * i] };  //  Can't be constant value
        data.area[i] =
            unsafe { buf[HYN_TOUCH_MISC + HYN_TOUCH_STEP * i] } >> 4;

        //  If no more touch points, stop
        if (data.touch_event[i] == 0 || data.touch_event[i] == 2)  //  If touch is down or contact
            && (data.touch_point_num == 0) {
            break;
        }
    }
    Ok(())
}

/// TODO: Rename buf
static mut buf: [u8; POINT_READ_BUF] = [0; POINT_READ_BUF];

/// Touch Controller I2C Address: https://github.com/lupyuen/hynitron_i2c_cst0xxse
const TOUCH_CONTROLLER_ADDRESS: u8 = 0x15;

/// Touch Event Info. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.h#L104-L115
struct TouchEventInfo {
    /// X coordinate
    x:               [u16; HYN_MAX_POINTS],
    /// Y coordinate
    y:               [u16; HYN_MAX_POINTS],
    /// Touch event: 0 = down, 1 = up, 2 = contact
    touch_event:     [u8;  HYN_MAX_POINTS],
    /// Touch ID
    finger_id:       [u8;  HYN_MAX_POINTS],         
    pressure:        [u8; HYN_MAX_POINTS],  //  Previously u16
    area:            [u8; HYN_MAX_POINTS],  //  Previously u16
    touch_point:     u8,
    touches:         i32,
    touch_point_num: u8,
}

/// Touch Info. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.h#L93-L100
struct TouchInfo {
    y:  [i32; HYN_MAX_POINTS],
    x:  [i32; HYN_MAX_POINTS],
    p:  [i32; HYN_MAX_POINTS],
    id: [i32; HYN_MAX_POINTS],
    count: i32,
}

//  Touch Controller Constants. Based on https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.h

/// Max touch points for the touch controller
const CFG_MAX_TOUCH_POINTS: usize = 5;

/// Max touch channels for the touch controller
const HYN_MAX_POINTS: usize = 10;

const HYN_MAX_ID: u8             = 0x0F;
const HYN_TOUCH_STEP: usize      = 6;
const HYN_FACE_DETECT_POS: usize = 1;
const HYN_TOUCH_X_H_POS: usize   = 3;
const HYN_TOUCH_X_L_POS: usize   = 4;
const HYN_TOUCH_Y_H_POS: usize   = 5;
const HYN_TOUCH_Y_L_POS: usize   = 6;
const HYN_TOUCH_EVENT_POS: usize = 3;
const HYN_TOUCH_ID_POS: usize    = 5;
const FT_TOUCH_POINT_NUM: usize  = 2;
const HYN_TOUCH_XY_POS: usize    = 7;
const HYN_TOUCH_MISC: usize      = 8;
const POINT_READ_BUF: usize      = 3 + ( HYN_TOUCH_STEP * HYN_MAX_POINTS );

/// Event that will be forwarded to the Event Queue when a touch interrupt is triggered
static mut TOUCH_EVENT: os_event = fill_zero!(os_event);  //  Init all fields to 0 or NULL

/// Probe the I2C bus to discover I2C devices
pub fn probe() -> MynewtResult<()> {
    for addr in 0..128 {
        let rc = unsafe { hal::hal_i2c_master_probe(1, addr, 1000) };
        if rc != hal::HAL_I2C_ERR_ADDR_NACK as i32 {
            //  I2C device found
            console::print("0x"); console::printhex(addr); console::print(": ");
            console::printhex(rc as u8); console::print("\n"); console::flush();
        }
    }
    console::print("Done\n"); console::flush();
    Ok(())
}

/* I2C devices found:
    0x18: 00 = Accelerometer: https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMA423-DS000.pdf
    0x44: 00 = Heart Rate Sensor: http://files.pine64.org/doc/datasheet/pinetime/HRS3300%20Heart%20Rate%20Sensor.pdf
    Touch controller not detected unless you keep tapping the screen */

/// Test the touch sensor. `start_touch_sensor()` must have been called before this.
pub fn test() -> MynewtResult<()> {
    //  Repeat test a few times
    for _ in 0..20 {
        //  I2C addresses to test
        for addr in &[
            0x15,  //  Touch Controller: https://github.com/lupyuen/hynitron_i2c_cst0xxse
            //  0x18,  //  Accelerometer: https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMA423-DS000.pdf
            //  0x44,  //  Heart Rate Sensor: http://files.pine64.org/doc/datasheet/pinetime/HRS3300%20Heart%20Rate%20Sensor.pdf
        ] {
            //  Registers to be read. Keep tapping the screen to get responses.
            for register in &[
                0x00,  //  Register 0 should have value 0 at startup
                0x01,  //  Not sure what Register 1 does but it shows non-zero values
                0xA3,  //  HYN_REG_CHIP_ID
                0x9F,  //  HYN_REG_CHIP_ID2                    
                0x8F,  //  HYN_REG_INT_CNT
                0xA6,  //  HYN_REG_FW_VER                      
                0xA8,  //  HYN_REG_VENDOR_ID                       
            ] {
                read_register(*addr, *register) ? ;
            }
        }
        console::print("Done\n"); console::flush();
    }
    Ok(())
}

/*
    Touch Controller: https://github.com/lupyuen/stm32bluepill-mynewt-sensor/blob/pinetime/hynitron_i2c_cst0xxse_5.1.zip
    Done
    addr: 0x15, reg: 0x00 = 0x00
    addr: 0x15, reg: 0x01 = 0x05
    addr: 0x15, reg: 0xa3 = 0x00
    Done
    Done
    Done
    Done
    addr: 0x15, reg: 0x00 = 0x00
    addr: 0x15, reg: 0x01 = 0x00
    addr: 0x15, reg: 0xa3 = 0x00
    addr: 0x15, reg: 0x9f = 0x00
    addr: 0x15, reg: 0x8f = 0x00
    addr: 0x15, reg: 0xa6 = 0x00
    addr: 0x15, reg: 0xa8 = 0x00
    Done
    addr: 0x15, reg: 0x00 = 0x00
    addr: 0x15, reg: 0x01 = 0x05
    addr: 0x15, reg: 0xa3 = 0x00
    addr: 0x15, reg: 0x9f = 0x00
    addr: 0x15, reg: 0x8f = 0x00
    addr: 0x15, reg: 0xa6 = 0x00
    addr: 0x15, reg: 0xa8 = 0x00
    Done
    addr: 0x15, reg: 0x00 = 0x00
    addr: 0x15, reg: 0x01 = 0x05
    addr: 0x15, reg: 0xa3 = 0x00
    addr: 0x15, reg: 0x9f = 0x00
    addr: 0x15, reg: 0x8f = 0x00
    addr: 0x15, reg: 0xa6 = 0x00
    addr: 0x15, reg: 0xa8 = 0x00
    Done
    addr: 0x15, reg: 0x00 = 0x00
    addr: 0x15, reg: 0x01 = 0x00
    addr: 0x15, reg: 0xa3 = 0x00
    addr: 0x15, reg: 0x9f = 0x00
    addr: 0x15, reg: 0x8f = 0x00
    addr: 0x15, reg: 0xa6 = 0x00
    addr: 0x15, reg: 0xa8 = 0x00
    Done
    addr: 0x15, reg: 0x00 = 0x00
    addr: 0x15, reg: 0x01 = 0x00
    addr: 0x15, reg: 0xa3 = 0x00
    addr: 0x15, reg: 0x9f = 0x00
    addr: 0x15, reg: 0x8f = 0x00
    addr: 0x15, reg: 0xa6 = 0x00
    addr: 0x15, reg: 0xa8 = 0x00
    Done
    addr: 0x15, reg: 0x00 = 0x00
    Done
    Done
    Done
    addr: 0x15, reg: 0x00 = 0x00
    addr: 0x15, reg: 0x01 = 0x04
    Done
    Done
    Done
    Done
    addr: 0x15, reg: 0x00 = 0x00
    Done
    Done
    Done

    Accelerometer: https://ae-bst.resource.bosch.com/media/_tech/media/datasheets/BST-BMA423-DS000.pdf
    addr: 0x18, reg: 0x00 = 0x11
    addr: 0x18, reg: 0xa3 = 0x00
    addr: 0x18, reg: 0x9f = 0x00
    addr: 0x18, reg: 0x8f = 0x00
    addr: 0x18, reg: 0xa6 = 0x80
    addr: 0x18, reg: 0xa8 = 0x00

    Heart Rate Sensor: http://files.pine64.org/doc/datasheet/pinetime/HRS3300%20Heart%20Rate%20Sensor.pdf
    addr: 0x44, reg: 0x00 = 0x21
    addr: 0x44, reg: 0xa3 = 0xa3
    addr: 0x44, reg: 0x9f = 0xa3
    addr: 0x44, reg: 0x8f = 0xa3
    addr: 0x44, reg: 0xa6 = 0xa3
    addr: 0x44, reg: 0xa8 = 0xa3
*/

/// Read a range of I2C registers from the I2C address `addr` (7-bit address), starting at `start_register` for count `num_registers`. Save into `buffer`.
fn read_register_range(addr: u8, start_register: u8, num_registers: u8, buffer: &mut[u8]) -> MynewtResult<()> {
    assert!(buffer.len() >= num_registers as usize, "i2c buf");  //  Buffer too small
    assert!(start_register >= 0 && start_register + num_registers < 128, "i2c addr");  //  Not 7-bit address
    //  First the start register number must be sent in write mode (I2C address xxxxxxx0). 
    unsafe { 
        I2C_BUFFER[0] = start_register;
        I2C_DATA.address = addr;
        I2C_DATA.len = I2C_BUFFER.len() as u16;
        I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
    };
    //  Then either a stop or a repeated start condition must be generated. 
    let rc1 = unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };  //  No stop yet, must continue even if we hit an error
    //  After this the slave is addressed in read mode (RW = ‘1’) at I2C address xxxxxxx1
    unsafe { 
        I2C_BUFFER[0] = 0x00;
        I2C_DATA.address = addr;
        I2C_DATA.len = num_registers as u16;
        I2C_DATA.buffer = buffer.as_mut_ptr();
    };
    //  After which the slave sends out data from auto-incremented register addresses until a NOACKM and stop condition occurs.
    let rc2 = unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };
    if rc2 == hal::HAL_I2C_ERR_ADDR_NACK as i32 {
        return Ok(());
    }
    console::print("addr: 0x"); console::printhex(addr); 
    console::print(", reg: 0x"); console::printhex(start_register); 
    console::print(" = 0x"); console::printhex(unsafe { I2C_BUFFER[0] }); 
    console::print("\n"); console::flush();
    Ok(())
}

/// Read the I2C register for the specified I2C address (7-bit address)
fn read_register(addr: u8, register: u8) -> MynewtResult<()> {
    assert!(register >= 0 && register < 128, "i2c addr");  //  Not 7-bit address
    //  First the register number must be sent in write mode (I2C address xxxxxxx0). 
    unsafe { 
        I2C_BUFFER[0] = register;
        I2C_DATA.address = addr;
        I2C_DATA.len = I2C_BUFFER.len() as u16;
        I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
    };
    //  Then either a stop or a repeated start condition must be generated. 
    let rc1 = unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };  //  No stop yet, must continue even if we hit an error
    //  After this the slave is addressed in read mode (RW = ‘1’) at I2C address xxxxxxx1, 
    unsafe { 
        I2C_BUFFER[0] = 0x00;
        I2C_DATA.address = addr;
        I2C_DATA.len = I2C_BUFFER.len() as u16;
        I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
    };
    //  After which the slave sends out data from auto-incremented register addresses until a NOACKM and stop condition occurs.
    let rc2 = unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };
    if rc2 == hal::HAL_I2C_ERR_ADDR_NACK as i32 {
        return Ok(());
    }
    console::print("addr: 0x"); console::printhex(addr); 
    console::print(", reg: 0x"); console::printhex(register); 
    console::print(" = 0x"); console::printhex(unsafe { I2C_BUFFER[0] }); 
    console::print("\n"); console::flush();
    Ok(())
}

/// I2C packet to be sent
static mut I2C_DATA: hal::hal_i2c_master_data = hal::hal_i2c_master_data {
    address: 0,
    len:     0,
    buffer:  core::ptr::null_mut(),
};

/// Buffer containing I2C read/write data
static mut I2C_BUFFER: [u8; 1] =  [ 0 ];
