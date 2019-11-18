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
    ST7735,
};
use mynewt::{
    result::*,
    hw::hal,
    fill_zero,
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

/// Initialise the display and populate the Display Context
pub fn start_display(context: &mut DisplayContext) -> MynewtResult<()> {
    //  Create SPI port and GPIO pins
    let mut spi = MynewtSPI::new();
    let mut dc =  MynewtGPIO::new();
    let mut rst = MynewtGPIO::new();

    //  Init SPI port and GPIO pins
    spi.init(
        0,   //  Mynewt SPI port 0
        25,  //  LCD_CS (P0.25): Chip select
        unsafe { &mut SPI_SETTINGS }
    ) ? ;
    dc.init(18) ? ;   //  LCD_RS (P0.18): Clock/data pin (CD)
    rst.init(26) ? ;  //  LCD_RESET (P0.26): Display reset

    //  Switch on the backlight
    context.backlight_high.init(23) ? ;  //  LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23): Backlight (active low)
    context.backlight_high.set_low() ? ;
    
    //  Create display driver
    context.display = st7735_lcd::ST7735::new(
        spi,    //  SPI Port
        dc,     //  GPIO Pin for DC
        rst,    //  GPIO Pin for RST
        false,  //  Whether the display is RGB (true) or BGR (false)
        true    //  Whether the colours are inverted (true) or not (false)
    );

    //  Init display driver
    context.display.init(&mut context.delay) ? ;
    context.display.set_orientation(&Orientation::Landscape) ? ;
    context.display.set_offset(1, 25);
    Ok(())
}

/// Render the ST7789 display connected to SPI port 0. `start_display()` must have been called earlier.
pub fn test(context: &mut DisplayContext) -> MynewtResult<()> {
    //  Create circle
    let c = Circle::<Rgb565>::new(Coord::new(40, 40), 40)
        .fill(Some(Rgb565::from(1u8)));

    //  Create text
    let t = fonts::Font12x16::<Rgb565>::render_str("I AM RUSTY BEACON")
        .fill(Some(Rgb565::from(20u8)))
        .translate(Coord::new(20, 16));

    //  Render circle and text to display
    context.display.draw(c);
    context.display.draw(t);
    Ok(())
}

/// Display Driver
type Display = ST7735<MynewtSPI, MynewtGPIO, MynewtGPIO>;

/// Display Context
pub struct DisplayContext {
    /// Display driver
    display: Display,
    /// GPIO Pin for high backlight
    backlight_high: MynewtGPIO,
    /// Delay
    delay: MynewtDelay,    
}

/// Display Context
impl DisplayContext {
    /// Create a new uninitialised Display Context
    pub fn new() -> Self {
        DisplayContext {
            display: fill_zero!(Display),  //  Will be created in `start_display()`
            backlight_high: MynewtGPIO::new(),
            delay: MynewtDelay::new(),            
        }
    }
}
