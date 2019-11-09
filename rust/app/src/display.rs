use embedded_graphics::prelude::*;
use embedded_graphics::primitives::Circle;
use embedded_graphics::fonts::Font6x8;
use embedded_graphics::pixelcolor::Rgb565;
use embedded_hal;
use st7735_lcd;
use st7735_lcd::Orientation;

pub fn show() {
    //  Create display driver
    let mut display = st7735_lcd::ST7735::new(
        DisplaySPI{}, DisplayDC{}, DisplayRST{}, false, true
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

impl embedded_hal::blocking::spi::write::Default<u8> for DisplaySPI {

}

impl embedded_hal::spi::FullDuplex<u8> for DisplaySPI {

}

impl embedded_hal::digital::v1::OutputPin for DisplayDC {

}

impl embedded_hal::digital::v1::OutputPin for DisplayRST {
    
}

impl embedded_hal::blocking::delay::DelayMs<u8> for MynewtDelay {

}

struct DisplaySPI {}
struct DisplayDC {}
struct DisplayRST {}
struct MynewtDelay {}
