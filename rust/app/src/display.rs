use embedded_graphics::prelude::*;
use embedded_graphics::primitives::Circle;
use embedded_graphics::fonts::Font6x8;
use embedded_graphics::pixelcolor::Rgb565;
use embedded_hal;
use st7735_lcd;
use st7735_lcd::Orientation;

pub fn show() {
    //  Create display driver
    let spi = MynewtSPI::new(0);  //  TODO
    let dc =  MynewtGPIO::new(0);  //  TODO
    let rst = MynewtGPIO::new(0);  //  TODO
    let mut display = st7735_lcd::ST7735::new(
        spi, dc, rst, false, true
    );

    //  Init display
    let mut delay = MynewtDelay{};
    display.init(&mut delay).unwrap();
    display.set_orientation(&Orientation::Landscape).unwrap();
    display.set_offset(1, 25);

    //  Create circle
    let c = Circle::<Rgb565>::new(Coord::new(20, 20), 8)
        .fill(Some(Rgb565::from(1u8)));

    //  Create text
    let t = Font6x8::<Rgb565>::render_str("Hello Rust!")
        .fill(Some(Rgb565::from(20u8)))
        .translate(Coord::new(20, 16));

    //  Render circle and text
    display.draw(c);
    display.draw(t);
}

impl MynewtSPI {
    pub fn new(spi_num: i32) -> Self {
        MynewtSPI {
            spi_num
        }
    }
}

impl embedded_hal::blocking::spi::Write<u8> for MynewtSPI {
    fn write(&mut self, words: &[u8]) -> Result<(), Self::Error> {
        //  TODO
        Ok(())
    }
    type Error = mynewt::result::MynewtError;
}

impl MynewtGPIO {
    pub fn new(pin: i32) -> Self {
        MynewtGPIO {
            pin
        }
    }
}

impl embedded_hal::digital::v2::OutputPin for MynewtGPIO {
    fn set_low(&mut self) -> Result<(), Self::Error> {
        //  TODO
        Ok(())
    }

    fn set_high(&mut self) -> Result<(), Self::Error> {
        //  TODO
        Ok(())
    }

    type Error = mynewt::result::MynewtError;
}

impl embedded_hal::blocking::delay::DelayMs<u8> for MynewtDelay {
    fn delay_ms(&mut self, ms: u8) {
        //  TODO
    }
}

/// Wrapper for Mynewt SPI API
struct MynewtSPI {
    spi_num: i32,
}

/// Wrapper for Mynewt GPIO API
struct MynewtGPIO {
    pin: i32,
}

/// Wrapper for Mynewt Delay API
struct MynewtDelay {}
