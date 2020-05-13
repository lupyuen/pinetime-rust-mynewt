use crate::{hw::hal, kernel::os, result::*};
use embedded_hal;

/// Rust Embedded HAL interface for Mynewt I2C
impl I2C {
    /// Create a new I2C port
    pub fn new() -> Self {
        I2C { i2c_num: 0, timeout: 1000 }
    }

    /// Initiaise the I2C port
    pub fn init(
        &mut self,
        i2c_num: u8,
        i2c_settings: *const hal::hal_i2c_settings,
        operation_timeout_in_ticks: u32,
    ) -> MynewtResult<()> {
        let rc = unsafe { hal::hal_i2c_config(i2c_num, i2c_settings) };
        check_i2c_return_code(rc)?;
        let rc = unsafe { hal::hal_i2c_enable(i2c_num) };
        check_i2c_return_code(rc)?;
        self.i2c_num = i2c_num;
        self.timeout = operation_timeout_in_ticks;
        Ok(())
    }
}

impl embedded_hal::blocking::i2c::Write for I2C {
    fn write(&mut self, addr: u8, data: &[u8]) -> Result<(), Self::Error> {
        let mut master_data = hal::hal_i2c_master_data {
            address: addr,
            len: data.len() as u16,
            buffer: data.as_ptr() as *mut u8,
        };
        let rc = unsafe { hal::hal_i2c_master_write(self.i2c_num, &mut master_data, self.timeout, 1) };
        check_i2c_return_code(rc)
    }

    type Error = crate::result::MynewtError;
}

impl embedded_hal::blocking::i2c::Read for I2C {
    fn read(&mut self, addr: u8, data: &mut [u8]) -> Result<(), Self::Error> {
        let mut master_data = hal::hal_i2c_master_data {
            address: addr,
            len: data.len() as u16,
            buffer: data.as_mut_ptr(),
        };
        let rc = unsafe { hal::hal_i2c_master_read(self.i2c_num, &mut master_data, self.timeout, 1) };
        check_i2c_return_code(rc)
    }

    type Error = crate::result::MynewtError;
}

impl embedded_hal::blocking::i2c::WriteRead for I2C {
    fn write_read(
        &mut self,
        addr: u8,
        data_write: &[u8],
        data_read: &mut [u8],
    ) -> Result<(), Self::Error> {
        let mut master_data = hal::hal_i2c_master_data {
            address: addr,
            len: data_write.len() as u16,
            buffer: data_write.as_ptr() as *mut u8,
        };
        let rc_write = unsafe { hal::hal_i2c_master_write(self.i2c_num, &mut master_data, self.timeout, 0) };
        master_data.len = data_read.len() as u16;
        master_data.buffer = data_read.as_mut_ptr();
        let rc_read = unsafe { hal::hal_i2c_master_read(self.i2c_num, &mut master_data, self.timeout, 1) };
        check_i2c_return_code(rc_write)?;
        check_i2c_return_code(rc_read)
    }

    type Error = crate::result::MynewtError;
}

fn check_i2c_return_code(rc: i32) -> crate::result::MynewtResult<()> {
    type E=crate::result::MynewtError;
    match rc as u32 {
        0=> Ok(()),
        hal::HAL_I2C_ERR_UNKNOWN => Err(E::HAL_I2C_ERR_UNKNOWN),
        hal::HAL_I2C_ERR_INVAL => Err(E::HAL_I2C_ERR_INVAL),
        hal::HAL_I2C_ERR_TIMEOUT => Err(E::HAL_I2C_ERR_TIMEOUT),
        hal::HAL_I2C_ERR_ADDR_NACK => Err(E::HAL_I2C_ERR_ADDR_NACK),
        hal::HAL_I2C_ERR_DATA_NACK => Err(E::HAL_I2C_ERR_DATA_NACK),
        _ => Err(E::HAL_I2C_ERR_UNKNOWN),
    }
}

/// Rust Embedded HAL interface for Mynewt SPI
impl SPI {
    /// Create a new SPI port
    pub fn new() -> Self {
        SPI {
            spi_num: 0,
            cs_pin:  0,
        }
    }

    /// Initiaise the SPI port
    pub fn init(&mut self, spi_num: i32, cs_pin: i32, spi_settings: *mut hal::hal_spi_settings) 
        -> MynewtResult<()> {
        //  Disable the SPI port in case External SPI Flash driver has already enabled it.
        let rc = unsafe { hal::hal_spi_disable(spi_num) };
        assert_eq!(rc, 0, "spi disable fail");

        //  Configure the SPI port.
        let rc = unsafe { hal::hal_spi_config(spi_num, spi_settings) };
        assert_eq!(rc, 0, "spi config fail");

        //  Enable the SPI port.
        let rc = unsafe { hal::hal_spi_enable(spi_num) };
        assert_eq!(rc, 0, "spi enable fail");

        //  TODO: Set the CS Pin to high only when transmitting.
        let rc = unsafe { hal::hal_gpio_init_out(cs_pin, 1) };
        assert_eq!(rc, 0, "spi init fail");
        self.spi_num = spi_num;
        self.cs_pin  = cs_pin;
        Ok(())
    }
}

/// Rust Embedded HAL interface for Mynewt SPI
impl embedded_hal::blocking::spi::Write<u8> for SPI {
    /// Write to the SPI port
    fn write(&mut self, words: &[u8]) -> Result<(), Self::Error> {
        //  Select the device
        unsafe { hal::hal_gpio_write(self.cs_pin, 0) };
        //  Send the data
        unsafe { hal::hal_spi_txrx(self.spi_num, 
            core::mem::transmute(words.as_ptr()),  //  TX Buffer
            core::ptr::null_mut(),                 //  RX Buffer (don't receive)
            words.len() as i32) };                 //  Length
        //  De-select the device
        unsafe { hal::hal_gpio_write(self.cs_pin, 1) };
        Ok(())
    }

    /// Reuse Mynewt error codes
    type Error = crate::result::MynewtError;
}

/// Rust Embedded HAL interface for Mynewt GPIO
impl GPIO {
    /// Create a new output GPIO pin
    pub fn new() -> Self {
        GPIO {
            pin: 0,
        }
    }

    /// Initialise the output GPIO pin
    pub fn init(&mut self, pin: i32) -> MynewtResult<()> {
        //  TODO: let dc = pins.d0.into_push_pull_output(&mut pins.port);
        //  TODO: let rst = pins.d1.into_push_pull_output(&mut pins.port);
        let rc = unsafe { hal::hal_gpio_init_out(pin, 0) };
        assert_eq!(rc, 0, "gpio fail");
        self.pin = pin;
        Ok(())
    }
}

/// Rust Embedded HAL interface for Mynewt GPIO
impl embedded_hal::digital::v2::OutputPin for GPIO {
    /// Set the GPIO pin to low
    fn set_low(&mut self) -> Result<(), Self::Error> {
        unsafe { hal::hal_gpio_write(self.pin, 0) };
        Ok(())
    }

    /// Set the GPIO pin to high
    fn set_high(&mut self) -> Result<(), Self::Error> {
        unsafe { hal::hal_gpio_write(self.pin, 1) };
        Ok(())
    }

    /// Reuse Mynewt error codes
    type Error = crate::result::MynewtError;
}

/// Rust Embedded HAL interface for Mynewt Delay
impl Delay {
    /// Create a new delay
    pub fn new() -> Self {
        Delay {
        }
    }
}

/// Rust Embedded HAL interface for Mynewt Delay
impl embedded_hal::blocking::delay::DelayMs<u8> for Delay {
    /// Sleep for the specified number of milliseconds
    fn delay_ms(&mut self, ms: u8) {
        //  TODO: Get this constant from Mynewt
        const OS_TICKS_PER_SEC: u32 = 1000;
        let delay_ticks = (ms as u32) * OS_TICKS_PER_SEC / 1000;
        unsafe { os::os_time_delay(delay_ticks) };
    }
}

/// Rust Embedded HAL interface for Mynewt SPI
pub struct SPI {
    /// Mynewt SPI port number
    spi_num: i32,
    /// Mynewt GPIO pin number for Chip Select
    cs_pin: i32,
}

/// Rust Embedded HAL interface for Mynewt I2C
pub struct I2C {
    /// Mynewt I2C port number
    i2c_num: u8,
    /// Operation timeout in ticks
    timeout: u32,
}

/// Rust Embedded HAL interface for Mynewt GPIO
pub struct GPIO {
    /// Mynewt GPIO pin number
    pin: i32,
}

/// Rust Embedded HAL interface for Mynewt Delay
pub struct Delay {}
