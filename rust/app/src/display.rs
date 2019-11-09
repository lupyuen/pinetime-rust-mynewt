use embedded_graphics::{
    prelude::*,
    primitives::Circle,
    fonts::Font6x8,
    pixelcolor::Rgb565,
};
use embedded_hal::{
    self,
    digital::v2::OutputPin,
};
use st7735_lcd::{
    self,
    Orientation,
};
use mynewt::{
    result::*,
    hw::hal,
    kernel::os,
};

/*
Mynewt SPI port 0 connected to ST7789 display:
LCD_RS (P0.18)	Clock/data pin (CD)
LCD_CS (P0.25)	Chip select
LCD_RESET (P0.26)	Display reset
LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23)	Backlight (active low)

- Chip select must be held low while driving the display. It must be high when using other SPI devices on the same bus (such as external flash storage) so that the display controller won't respond to the wrong commands.
- SPI must be used in mode 3. Mode 0 (the default) won't work.
- LCD_DISPLAY_* is used to enable the backlight. Set at least one to low to see anything on the screen.
- Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
*/

/// SPI settings for ST7789 display controller
static mut SPI_SETTINGS: hal::hal_spi_settings = hal::hal_spi_settings {
    data_order: hal::HAL_SPI_MSB_FIRST as u8,
    data_mode:  hal::HAL_SPI_MODE3 as u8,  //  SPI must be used in mode 3. Mode 0 (the default) won't work.
    baudrate:   8000,  //  In kHZ. Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
    word_size:  hal::HAL_SPI_WORD_SIZE_8BIT as u8,
};

/// Render the ST7789 display connected to SPI port 0
pub fn show() -> MynewtResult<()> {
    //  Create display driver for SPI port 0
    let spi = MynewtSPI::new(0, 25);  //  LCD_CS (P0.25)	Chip select
    let dc =  MynewtGPIO::new(18);    //  LCD_RS (P0.18)	Clock/data pin (CD)
    let rst = MynewtGPIO::new(26);    //  LCD_RESET (P0.26)	Display reset
    //  TODO: let dc = pins.d0.into_push_pull_output(&mut pins.port);
    //  TODO: let rst = pins.d1.into_push_pull_output(&mut pins.port);
    let mut display = st7735_lcd::ST7735::new(
        spi, dc, rst, false, true
    );

    //  Switch on the backlight.
    let mut backlight = MynewtGPIO::new(23);  //  LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23)	Backlight (active low)
    backlight.set_low() ? ;

    //  Create circle
    let c = Circle::<Rgb565>::new(Coord::new(20, 20), 8)
        .fill(Some(Rgb565::from(1u8)));

    //  Create text
    let t = Font6x8::<Rgb565>::render_str("Hello Rust!")
        .fill(Some(Rgb565::from(20u8)))
        .translate(Coord::new(20, 16));

    //  Init display
    let mut delay = MynewtDelay{};
    display.init(&mut delay) ? ;
    display.set_orientation(&Orientation::Landscape) ? ;
    display.set_offset(1, 25);

    //  Render circle and text to display
    display.draw(c);
    display.draw(t);
    Ok(())
}

/// Rust Embedded HAL interface for Mynewt SPI
impl MynewtSPI {
    /// Create a new SPI port
    pub fn new(spi_num: i32, cs_pin: i32) -> Self {
        let rc = unsafe { hal::hal_spi_config(spi_num, &mut SPI_SETTINGS) };
        assert_eq!(rc, 0, "spi config fail");

        let rc = unsafe { hal::hal_spi_enable(spi_num) };
        assert_eq!(rc, 0, "spi enable fail");

        let rc = unsafe { hal_gpio_init_out(cs_pin, 1) };
        assert_eq!(rc, 0, "spi init fail");
        MynewtSPI {
            spi_num,
            cs_pin,
        }
    }
}

/// Rust Embedded HAL interface for Mynewt SPI
impl embedded_hal::blocking::spi::Write<u8> for MynewtSPI {
    /// Write to the SPI port
    fn write(&mut self, words: &[u8]) -> Result<(), Self::Error> {
        //  Select the device
        unsafe { hal_gpio_write(self.cs_pin, 0) };
        //  Send the data
        unsafe { hal::hal_spi_txrx(self.spi_num, 
            core::mem::transmute(words.as_ptr()),  //  TX Buffer
            core::ptr::null_mut(),                 //  RX Buffer (don't receive)
            words.len() as i32) };                 //  Length
        //  De-select the device
        unsafe { hal_gpio_write(self.cs_pin, 1) };
        Ok(())
    }

    /// Reuse Mynewt error codes
    type Error = mynewt::result::MynewtError;
}

/// Rust Embedded HAL interface for Mynewt GPIO
impl MynewtGPIO {
    /// Create a new output GPIO pin
    pub fn new(pin: i32) -> Self {
        let rc = unsafe { hal_gpio_init_out(pin, 0) };
        assert_eq!(rc, 0, "spi config fail");
        MynewtGPIO {
            pin
        }
    }
}

/// Rust Embedded HAL interface for Mynewt GPIO
impl embedded_hal::digital::v2::OutputPin for MynewtGPIO {
    /// Set the GPIO pin to low
    fn set_low(&mut self) -> Result<(), Self::Error> {
        unsafe { hal_gpio_write(self.pin, 0) };
        Ok(())
    }

    /// Set the GPIO pin to high
    fn set_high(&mut self) -> Result<(), Self::Error> {
        unsafe { hal_gpio_write(self.pin, 1) };
        Ok(())
    }

    /// Reuse Mynewt error codes
    type Error = mynewt::result::MynewtError;
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
struct MynewtSPI {
    /// Mynewt SPI port number
    spi_num: i32,
    /// Mynewt GPIO pin number for Chip Select
    cs_pin: i32,
}

/// Rust Embedded HAL interface for Mynewt GPIO
struct MynewtGPIO {
    /// Mynewt GPIO pin number
    pin: i32,
}

/// Rust Embedded HAL interface for Mynewt Delay
struct MynewtDelay {}

/// TODO: Fix gen-bindings.sh to generate GPIO bindings. https://mynewt.apache.org/latest/os/modules/hal/hal_gpio/hal_gpio.html
extern "C" {
    fn hal_gpio_init_out(pin: i32, val: i32) -> i32;
    fn hal_gpio_write(pin: i32, val: i32);
}
