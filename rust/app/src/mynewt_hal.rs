/* Code has been moved to `mynewt` library: rust/mynewt/src/hal.rs
use embedded_hal;
use mynewt::{
    result::*,
    hw::hal,
    kernel::os,
};

/// Rust Embedded HAL interface for Mynewt SPI
impl MynewtSPI {
    /// Create a new SPI port
    pub fn new() -> Self {
        MynewtSPI {
            spi_num: 0,
            cs_pin:  0,
        }
    }

    /// Initiaise the SPI port
    pub fn init(&mut self, spi_num: i32, cs_pin: i32, spi_settings: *mut hal::hal_spi_settings) 
        -> MynewtResult<()> {
        let rc = unsafe { hal::hal_spi_config(spi_num, spi_settings) };
        assert_eq!(rc, 0, "spi config fail");

        let rc = unsafe { hal::hal_spi_enable(spi_num) };
        assert_eq!(rc, 0, "spi enable fail");

        let rc = unsafe { hal::hal_gpio_init_out(cs_pin, 1) };
        assert_eq!(rc, 0, "spi init fail");
        self.spi_num = spi_num;
        self.cs_pin  = cs_pin;
        Ok(())
    }
}

/// Rust Embedded HAL interface for Mynewt SPI
impl embedded_hal::blocking::spi::Write<u8> for MynewtSPI {
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
    type Error = mynewt::result::MynewtError;
}

/// Rust Embedded HAL interface for Mynewt GPIO
impl MynewtGPIO {
    /// Create a new output GPIO pin
    pub fn new() -> Self {
        MynewtGPIO {
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
impl embedded_hal::digital::v2::OutputPin for MynewtGPIO {
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
    type Error = mynewt::result::MynewtError;
}

/// Rust Embedded HAL interface for Mynewt Delay
impl MynewtDelay {
    /// Create a new delay
    pub fn new() -> Self {
        MynewtDelay {
        }
    }
}

/// Rust Embedded HAL interface for Mynewt Delay
impl embedded_hal::blocking::delay::DelayMs<u8> for MynewtDelay {
    /// Sleep for the specified number of milliseconds
    fn delay_ms(&mut self, ms: u8) {
        //  TODO: Get this constant from Mynewt
        const OS_TICKS_PER_SEC: u32 = 1000;
        let delay_ticks = (ms as u32) * OS_TICKS_PER_SEC / 1000;
        unsafe { os::os_time_delay(delay_ticks) };
    }
}

/// Rust Embedded HAL interface for Mynewt SPI
pub struct MynewtSPI {
    /// Mynewt SPI port number
    spi_num: i32,
    /// Mynewt GPIO pin number for Chip Select
    cs_pin: i32,
}

/// Rust Embedded HAL interface for Mynewt GPIO
pub struct MynewtGPIO {
    /// Mynewt GPIO pin number
    pin: i32,
}

/// Rust Embedded HAL interface for Mynewt Delay
pub struct MynewtDelay {}
*/