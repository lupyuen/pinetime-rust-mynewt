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
use embedded_hal::{
    self,
    digital::v2::OutputPin,
    blocking::delay::DelayMs,
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
        .stroke( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) )  //  Black text
        .fill(   Some( Rgb565::from(( 0xff, 0xff, 0x00 )) ) )  //  Yellow background
        .translate( Coord::new( 20, 16 ));                     //  Shift the text

    //  Render background, circle, square and text to display
    druid::draw_to_display(background);
    druid::draw_to_display(circle);
    druid::draw_to_display(square);
    druid::draw_to_display(text);    

    //  Test the backlight
    test_backlight() ? ;

    //  Return success to the caller
    Ok(())
}

/// Test backlight
fn test_backlight() -> MynewtResult<()> {
    let mut delay = mynewt::Delay::new();

    //  Create 3 GPIOs for controlling backlight: Low, Mid and High brightness
    let mut backlights = [ mynewt::GPIO::new(), mynewt::GPIO::new(), mynewt::GPIO::new() ];

    //  GPIO settings for the backlight: LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23)
    backlights[0].init(14) ? ;  //  Low Backlight
    backlights[1].init(22) ? ;  //  Mid Backlight
    backlights[2].init(23) ? ;  //  High Backlight

    //  Define pulse patterns from slow to fast: From Low (0) to Mid (1) to High (2) and back
    let slower_pulse = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1];  //  Slower pulse
    let slow_pulse = [0, 0, 0, 1, 1, 1, 2, 2, 2, 1, 1, 1];  //  Slow pulse
    let fast_pulse = [0, 0, 1, 1, 2, 2, 1, 1]; //  Fast pulse
    let faster_pulse = [0, 1, 2, 1];  //  Faster pulse
    let fastest_pulse = [0, 2];  //  Fastest pulse

    for _ in 0..1 {
        //  Pulse the backlight from Low to Mid to High and back, faster and faster
        for _ in 0..4 {
            flash_backlight(&mut backlights, &mut delay, 
                &slower_pulse) ? ;
        }
        for _ in 0..4 {
            flash_backlight(&mut backlights, &mut delay, 
                &slow_pulse) ? ;
        }
        for _ in 0..6 {
            flash_backlight(&mut backlights, &mut delay, 
                &fast_pulse) ? ;
        }
        for _ in 0..8 {
            flash_backlight(&mut backlights, &mut delay, 
                &faster_pulse) ? ;
        }
        for _ in 0..20 {
            flash_backlight(&mut backlights, &mut delay, 
                &fastest_pulse) ? ;
        }
    }
    //  Switch on the High backlight. Backlight is active when low.
    backlights[2].set_low() ? ;
    Ok(())
}

/// Flash backlight according to the pattern: 0=Low, 1=Mid, 2=High
fn flash_backlight(
    backlights: &mut [mynewt::GPIO; 3], 
    delay: &mut mynewt::Delay,
    pattern: &[i32]) -> MynewtResult<()> {
    for brightness in pattern {            
        //  Switch on the Low, Mid or High backlight. Backlight is active when low.
        backlights[*brightness as usize].set_low() ? ;

        //  Pause a short while.
        delay.delay_ms(10);

        //  Switch off the Low, Mid or High backlight.
        backlights[*brightness as usize].set_high() ? ;
    }
    Ok(())
}