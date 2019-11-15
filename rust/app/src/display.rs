use embedded_graphics::{
    prelude::*,
    fonts,
    pixelcolor::Rgb565,
    primitives::Circle,
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
};
use crate::mynewt_hal::{
    MynewtDelay,
    MynewtGPIO,
    MynewtSPI,
};

/* From PineTime Smart Watch wiki: https://wiki.pine64.org/index.php/PineTime
Mynewt SPI port 0 connected to ST7789 display:
LCD_RS (P0.18)	Clock/data pin (CD)
LCD_CS (P0.25)	Chip select
LCD_RESET (P0.26)	Display reset
LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23)	Backlight (active low)

- Chip select must be held low while driving the display. It must be high when using other SPI devices on the same bus (such as external flash storage) so that the display controller won't respond to the wrong commands.
- SPI must be used in mode 3. Mode 0 (the default) won't work.
- LCD_DISPLAY_* is used to enable the backlight. Set at least one to low to see anything on the screen.
- Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow. */

/// SPI settings for ST7789 display controller
static mut SPI_SETTINGS: hal::hal_spi_settings = hal::hal_spi_settings {
    data_order: hal::HAL_SPI_MSB_FIRST as u8,
    data_mode:  hal::HAL_SPI_MODE3 as u8,  //  SPI must be used in mode 3. Mode 0 (the default) won't work.
    baudrate:   8000,  //  In kHZ. Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
    word_size:  hal::HAL_SPI_WORD_SIZE_8BIT as u8,
};

/// Render the ST7789 display connected to SPI port 0
pub fn show() -> MynewtResult<()> {
    //  Create SPI port and GPIO pins
    let spi = MynewtSPI::new(
        0,   //  Mynewt SPI port 0
        25,  //  LCD_CS (P0.25): Chip select
        unsafe { &mut SPI_SETTINGS }
    );
    let dc =  MynewtGPIO::new(18);  //  LCD_RS (P0.18): Clock/data pin (CD)
    let rst = MynewtGPIO::new(26);  //  LCD_RESET (P0.26): Display reset

    //  Create display driver for SPI port 0
    let mut display = st7735_lcd::ST7735::new(
        spi, dc, rst, false, true
    );

    //  Switch on the backlight
    let mut backlight = MynewtGPIO::new(23);  //  LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23):	Backlight (active low)
    backlight.set_low() ? ;

    //  Create circle
    let c = Circle::<Rgb565>::new(Coord::new(40, 40), 40)
        .fill(Some(Rgb565::from(1u8)));

    //  Create text
    let t = fonts::Font12x16::<Rgb565>::render_str("I AM RUSTY BEACON")
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