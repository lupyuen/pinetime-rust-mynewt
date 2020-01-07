//  Display Driver code has been moved to https://github.com/lupyuen/piet-embedded/blob/master/piet-embedded-graphics/src/display.rs
use embedded_graphics::{
    prelude::*,
    fonts,
    pixelcolor::Rgb565,
    primitives::{
        Circle,
        Rectangle,
    },
};
use mynewt::{
    result::*,
    sys::console,
};

/// Render some graphics and text to the PineTime display. `start_display()` must have been called earlier.
pub fn test_display() -> MynewtResult<()> {
    console::print("Rust test display\n"); console::flush();
    
    //  Create black background
    let background = Rectangle::<Rgb565>
        ::new( Coord::new( 0, 0 ), Coord::new( 239, 239 ) )   //  Rectangle coordinates
        .fill( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) );  //  Black

    //  Create circle
    let circle = Circle::<Rgb565>
        ::new( Coord::new( 40, 40 ), 40 )                     //  Circle centre and radius
        .fill( Some( Rgb565::from(( 0xff, 0x00, 0xff )) ) );  //  Magenta

    //  Create square
    let square = Rectangle::<Rgb565>
        ::new( Coord::new( 60, 60 ), Coord::new( 150, 150 ) ) //  Square coordinates
        .fill( Some( Rgb565::from(( 0x00, 0x00, 0xff )) ) );  //  Blue

    //  Create text
    let text = fonts::Font12x16::<Rgb565>
        ::render_str("I AM PINETIME")                          //  Text to be rendered
        .stroke( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) )  //  Black
        .fill( Some( Rgb565::from((   0xff, 0xff, 0x00 )) ) )  //  Yellow
        .translate( Coord::new( 20, 16 ));                     //  Move the text

    //  Render background, circle, square and text to display
    druid::draw_to_display(background);
    druid::draw_to_display(circle);
    druid::draw_to_display(square);
    druid::draw_to_display(text);    

    //  Return success to the caller
    Ok(())
}