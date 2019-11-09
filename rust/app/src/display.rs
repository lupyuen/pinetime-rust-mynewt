use embedded_graphics::prelude::*;
use embedded_graphics::primitives::Circle;
use embedded_graphics::fonts::Font6x8;
use embedded_graphics::pixelcolor::Rgb565;
use embedded_hal;
use st7735_lcd;
use st7735_lcd::Orientation;
use mynewt::hw::hal;

pub fn show() {
    //  Create display driver for SPI port 0
    let spi = MynewtSPI::new(0, 25);  //  LCD_CS (P0.25)	Chip select
    let dc =  MynewtGPIO::new(18);    //  LCD_RS (P0.18)	Clock/data pin (CD)
    let rst = MynewtGPIO::new(26);    //  LCD_RESET (P0.26)	Display reset
    //  TODO: let dc = pins.d0.into_push_pull_output(&mut pins.port);
    //  TODO: let rst = pins.d1.into_push_pull_output(&mut pins.port);
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
    pub fn new(spi_num: i32, cs_pin: i32) -> Self {
        /*
        SPI port 0 connected to ST7789 display:
        LCD_RS (P0.18)	Clock/data pin (CD)
        LCD_CS (P0.25)	Chip select
        LCD_RESET (P0.26)	Display reset
        LCD_BACKLIGHT_{LOW,MID,HIGH}	Backlight (active low)

        Chip select must be held low while driving the display. It must be high when using other SPI devices on the same bus (such as external flash storage) so that the display controller won't respond to the wrong commands.
        SPI must be used in mode 3. Mode 0 (the default) won't work.
        LCD_DISPLAY_* is used to enable the backlight. Set at least one to low to see anything on the screen.
        Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
        */
        hal::hal_spi_config(spi_num, &spi_settings)
            .expect("spi config fail");
        hal::hal_spi_enable(spi_num)
            .expect("spi enable fail");    
        hal::hal_gpio_init_out(cs_pin, 1)
            .expect("spi init fail");
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

static spi_settings: hal::hal_spi_settings = hal::hal_spi_settings {
    data_order: hal::HAL_SPI_MSB_FIRST,
    data_mode:  hal::HAL_SPI_MODE0,
    baudrate:   8000,  //  In kHZ. Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
    word_size:  hal::HAL_SPI_WORD_SIZE_8BIT,
};

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
