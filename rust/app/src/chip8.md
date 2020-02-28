# chip8.rs: CHIP-8 Game Emulator for PineTime Smart Watch with Rust

Retro Gaming On Your Watch!

__UNDER CONSTRUCTION__

TODO

More info about CHIP-8…

http://www.multigesture.net/articles/how...terpreter/

Whole lot of games available here…

https://github.com/dmatlack/chip8/tree/master/roms

To test in emulator...

http://mir3z.github.io/chip8-emu/

I used an existing CHIP-8 Emulator for Rust…

https://github.com/YushiOMOTE/libchip8

The code I actually wrote is surprisingly little… (What took so long to get it right? Tracking down which Rust function was taking too much stack space)

https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs

Thinking of using the accelerometer to control the game… tilt your watch up / down / left / right to control the player…. will this be playable? Hmmm…

I have some ideas how to optimise the rendering (e.g. batching of pixels into blocks). But this has been a really rewarding exercise on PineTime… All it takes is a few lines of Rust code to run games on PineTime! :-)

How about we take some retro games and turn them into PineTime Watch Faces?

## Map the Emulator Display to PineTime Display

TODO

```rust
/// CHIP8 Physical Screen size, in Physical Pixels
const PHYSICAL_WIDTH: usize = 240;
const PHYSICAL_HEIGHT: usize = 200;

/// CHIP8 Virtual Screen size, in Virtual Pixels
const SCREEN_WIDTH: usize = 64;
const SCREEN_HEIGHT: usize = 32;

/// CHIP8 Virtual Block size. We render the CHIP8 Virtual Screen in blocks of Virtual Pixels, without overflowing the SPI buffer.
/// PendingDataSize in SPI is 8192. (BLOCK_WIDTH * PIXEL_WIDTH * BLOCK_HEIGHT * PIXEL_HEIGHT) * 2 must be less than PendingDataSize
const BLOCK_HEIGHT: usize = 5;  //  Letter height
const BLOCK_WIDTH: usize = 32;

/// CHIP8 Virtual Pixel size, in Physical Pixels
const PIXEL_WIDTH: usize = 3;
const PIXEL_HEIGHT: usize = 5;
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L19-L37_

## Clear the PineTime Display

TODO

```rust
/// Render some graphics and text to the PineTime display. `start_display()` must have been called earlier.
pub fn on_start() -> MynewtResult<()> {
    console::print("Rust CHIP8\n"); console::flush();
    
    //  Create black background
    let background = Rectangle::<Rgb565>
        ::new( Coord::new( 0, 0 ), Coord::new( 239, 239 ) )   //  Rectangle coordinates
        .fill( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) );  //  Black

    //  Render background to display
    druid::draw_to_display(background);
    render_region(0, 0, SCREEN_WIDTH as u8 - 1, SCREEN_HEIGHT as u8 - 1);

    //  Start the emulator in a background task
    os::task_init(                  //  Create a new task and start it...
        unsafe { &mut CHIP8_TASK }, //  Task object will be saved here
        &init_strn!( "chip8" ),     //  Name of task
        Some( task_func ),    //  Function to execute when task starts
        NULL,  //  Argument to be passed to above function
        20,    //  Task priority: highest is 0, lowest is 255 (main task is 127), SPI is 10
        os::OS_WAIT_FOREVER as u32,       //  Don't do sanity / watchdog checking
        unsafe { &mut CHIP8_TASK_STACK }, //  Stack space for the task
        CHIP8_TASK_STACK_SIZE as u16      //  Size of the stack (in 4-byte units)
    ) ? ;                                 //  `?` means check for error

    //  Return success to the caller
    Ok(())
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L39-L66_

## Start the CHIP-8 Emulator

TODO

```rust
///  Run the emulator
extern "C" fn task_func(_arg: Ptr) {    
    //  Create the hardware API for rendering the emulator
    let hardware = Hardware::new();

    //  Create the emulator
    let chip8 = libchip8::Chip8::new(hardware);
    console::print("CHIP8 started\n"); console::flush();

    //  Load the emulator ROM
    //  let rom = include_bytes!("../roms/invaders.ch8");
    let rom = include_bytes!("../roms/blinky.ch8");
    //  let rom = include_bytes!("../roms/pong.ch8");

    //  Run the emulator ROM. This will block until emulator terminates
    chip8.run(rom);

    //  Should not come here
    console::print("CHIP8 done\n"); console::flush();
    assert!(false, "CHIP8 should not end");
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L78-L98_

## Set a Pixel Colour

TODO

```rust
impl libchip8::Hardware for Hardware {
    /// Set the state of a pixel in the screen. true for white, and false for black.
    fn vram_set(&mut self, x: usize, y: usize, d: bool) {
        //  console::print("set "); console::printint(x as i32); console::print(", "); console::printint(y as i32); console::print("\n"); console::flush(); ////
        assert!(x < SCREEN_WIDTH, "x overflow");
        assert!(y < SCREEN_HEIGHT, "y overflow");
        let i = x + y * SCREEN_WIDTH;
        unsafe { SCREEN_BUFFER[i] = 
            if d {
                if self.is_interactive { 255 }  //  Brighter colour when emulator is active
                else { 200 }                    //  Darker colour for initial screen
            } 
            else { 
                if self.is_interactive { 127 }  //  Fade to black
                else { 0 }                      //  Black for initial screen                 
            }  
        };

        //  Remember the boundaries of the screen region to be updated
        if self.update_left == 0 && self.update_right == 0 &&
            self.update_top == 0 && self.update_bottom == 0 {
            self.update_left = x as u8;
            self.update_right = x as u8;
            self.update_top = y as u8;
            self.update_bottom = y as u8;
        }
        if (x as u8) < self.update_left { self.update_left = x as u8; }
        if (x as u8) > self.update_right { self.update_right = x as u8; }
        if (y as u8) < self.update_top { self.update_top = y as u8; }
        if (y as u8) > self.update_bottom { self.update_bottom = y as u8; }
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L169-L198_

## Render the Display

TODO

```rust
impl libchip8::Hardware for Hardware {
    /// Called in every step; return true for shutdown.
    fn sched(&mut self) -> bool {
        //  If no screen update, return
        if self.update_left == 0 && self.update_right == 0 &&
            self.update_top == 0 && self.update_bottom == 0 { return false; }

        //  If emulator is preparing the initial screen, refresh the screen later
        if !self.is_interactive { return false; }

        //  If emulator is not ready to accept input, refresh the screen later
        if !self.is_checking_input { return false; }
        self.is_checking_input = false;

        //  Tickle the watchdog so that the Watchdog Timer doesn't expire. Mynewt assumes the process is hung if we don't tickle the watchdog.
        unsafe { hal_watchdog_tickle() };

        //  Sleep a while to allow other tasks to run, e.g. SPI background task
        unsafe { os::os_time_delay(1) };

        //  Render the updated region
        render_region(
            self.update_left,
            self.update_top,
            self.update_right,
            self.update_bottom
        );

        //  Reset the screen region to be updated
        self.update_left = 0;
        self.update_top = 0;
        self.update_right = 0;
        self.update_bottom = 0;

        //  Return false to indicate no shutdown
        false
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L231-L268_

## Render a Region

TODO

```rust
/// Render the Virtual Screen region
fn render_region(left: u8, top: u8, right: u8, bottom: u8) {
    //  Get the physical bounding box width and height
    let physical_box    = get_bounding_box(left, top, right, bottom);  //  Returns (left,top,right,bottom)
    let physical_width  = (physical_box.2 - physical_box.0 + 1) as usize;
    let physical_height = (physical_box.3 - physical_box.1 + 1) as usize;
    //  If the update region is small, render with a single block
    if physical_width + physical_height <= (BLOCK_WIDTH * PIXEL_WIDTH) + (BLOCK_HEIGHT * PIXEL_HEIGHT) {  //  Will not overflow SPI buffer
        render_block(left, top, right, bottom);
    } else {
        //  If the update region is too big for a single block, break the region into blocks and render
        let mut x = left;
        let mut y = top;
        loop {
            let block_right  = (x + BLOCK_WIDTH as u8 - 1).min(right);
            let block_bottom = (y + BLOCK_HEIGHT as u8 - 1).min(bottom);

            let physical_box    = get_bounding_box(left, top, right, bottom);  //  Returns (left,top,right,bottom)
            let physical_width  = (physical_box.2 - physical_box.0 + 1) as usize;
            let physical_height = (physical_box.3 - physical_box.1 + 1) as usize;
            //  assert!(physical_width + physical_height <= (BLOCK_WIDTH * PIXEL_WIDTH) + (BLOCK_HEIGHT * PIXEL_HEIGHT), "region overflow");
            render_block(x, y,
                block_right,
                block_bottom
            );  //  Will not overflow SPI buffer
            x += BLOCK_WIDTH as u8;
            if x > right {
                x = left;
                y += BLOCK_HEIGHT as u8;
                if y > bottom { break; }
            }
        }
    }
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L271-L304_

## Render a Block

TODO

```rust
/// Render the Virtual Block
fn render_block(left: u8, top: u8, right: u8, bottom: u8) {
    //  Create a new block for the region to be updated
    let mut block = PixelIterator::new(
        left, top, 
        right, bottom,
    );
    //  Render the block
    let (left_physical, top_physical, right_physical, bottom_physical) = block.get_window();
    druid::set_display_pixels(left_physical as u16, top_physical as u16, right_physical as u16, bottom_physical as u16,
        &mut block
    ).expect("set pixels failed");    
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L306-L319_

## Iterate Pixels in a Block

TODO

```rust
/// Implement the Iterator for Virtual Pixels in a Virtual Block
impl Iterator for PixelIterator {
    /// This Iterator returns Physical Pixel colour words (16-bit)
    type Item = u16;

    /// Return the next Physical Pixel colour
    #[cfg(not(feature = "chip8_curve"))]  //  If we are not rendering CHIP8 Emulator as curved surface...
    fn next(&mut self) -> Option<Self::Item> {
        if self.y > self.block_bottom { return None; }  //  No more Physical Pixels

        if self.x >= SCREEN_WIDTH as u8 ||
            self.y >= SCREEN_HEIGHT as u8 { cortex_m::asm::bkpt(); }
        assert!(self.x < SCREEN_WIDTH as u8, "x overflow");
        assert!(self.y < SCREEN_HEIGHT as u8, "y overflow");

        //  Get the colour for the Virtual Pixel
        let color = self.get_color();

        //  Loop over x_offset from 0 to PIXEL_WIDTH - 1
        self.x_offset += 1;
        if self.x_offset >= PIXEL_WIDTH as u8 {
            self.x_offset = 0;

            //  Loop over x from block_left to block_right
            self.x += 1;
            if self.x > self.block_right {
                self.x = self.block_left;

                //  Loop over y_offset from 0 to PIXEL_HEIGHT - 1
                self.y_offset += 1;
                if self.y_offset >= PIXEL_HEIGHT as u8 {
                    self.y_offset = 0;

                    //  Loop over y from block_top to block_bottom
                    self.y += 1;
                }
            }
        }
        //  Return the Physical Pixel color
        return Some(color);
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L408-L455_

## Convert Colours

TODO

```rust
/// Convert the Virtual Colour (8-bit greyscale) to 16-bit Colour
fn convert_color(grey: u8) -> u16 {
    match grey {
        250..=255 => Rgb565::from(( grey, grey, grey )).0,  //  White
        128..250 => Rgb565::from(( grey - 100, grey, grey - 100 )).0,  //  Greenish
        0..128   => Rgb565::from(( 0, 0, grey )).0,  //  Dark Blue
    }
}

/// Fade the Virtual Colour (8-bit greyscale) to black
fn update_color(grey: u8) -> u8 {
    match grey {
        200..=255 => grey - 2,   //  Initial white flash fade to normal white
        128..200 => grey,        //  Normal white stays the same
        0..128   => grey >> 1,   //  Dark fade to black
    }
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L494-L510_

## Map Physical Pixels to Virtual Pixels

TODO

```rust
/// For Physical (x,y) Coordinates, return the corresponding Virtual (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Virtual Pixel to fetch the colour value when rendering a Physical Pixel.
/// (x,y) must belong to the X >= 0, Y >= 0 quadrant
fn map_physical_to_virtual_normalised(x: u8, y: u8) -> (u8, u8) {
    let x_index = x.min(PHYSICAL_TO_VIRTUAL_MAP_WIDTH as u8 - 1);
    let y_index = y.min(PHYSICAL_TO_VIRTUAL_MAP_HEIGHT as u8 - 1);
    let virtual_pixel = PHYSICAL_TO_VIRTUAL_MAP[y_index as usize][x_index as usize];  //  Returns (x,y)
    virtual_pixel
}

/// For each Physical (x,y) Coordinate, return the corresponding Virtual (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Virtual Pixel to fetch the colour value when rendering a Physical Pixel.
/// Since X and Y are symmetric, this grid only covers one quadrant (X >= 0, Y >= 0)
static PHYSICAL_TO_VIRTUAL_MAP: &[[(u8,u8); PHYSICAL_TO_VIRTUAL_MAP_WIDTH]; PHYSICAL_TO_VIRTUAL_MAP_HEIGHT = &  //  Row=Y, Col=X
[               //  Copied from output of https://github.com/lupyuen/interpolate-surface
    [           //  Physical Row 0
        (0,0),  //  Physical Row 0, Col 0   => Virtual Col 0,  Row 0
        (0,0),  //  Physical Row 0, Col 1   => Virtual Col 0,  Row 0
        ...
        (32,0), //  Physical Row 0, Col 239 => Virtual Col 32, Row 0
    ],
    [           //  Physical Row 1
        (0,0),  //  Physical Row 1, Col 0   => Virtual Col 0,  Row 0
        (0,0),  //  Physical Row 1, Col 1   => Virtual Col 0,  Row 0
        ...
        (32,0), //  Physical Row 1, Col 239 => Virtual Col 32, Row 0
    ],
...
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L645-L673_

```rust
/// For Physical (x,y) Coordinates, return the corresponding Virtual (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Virtual Pixel to fetch the colour value when rendering a Physical Pixel.
fn map_physical_to_virtual(x: u8, y: u8) -> (u8, u8) {
    //  Check which quadrant (x,y) belongs to and flip accordingly
    let flip =  //  (flip for X, flip for Y)
        if x < PHYSICAL_WIDTH as u8 / 2 && y < PHYSICAL_HEIGHT as u8 / 2 {
            (true, true)  //  Top left quadrant: Flip horizontally and vertically
        } else if x >= PHYSICAL_WIDTH as u8 / 2 && y < PHYSICAL_HEIGHT as u8 / 2 {
            (false, true)   //  Top right quadrant: Flip vertically
        } else if x < PHYSICAL_WIDTH as u8 / 2 && y >= PHYSICAL_HEIGHT as u8 / 2 {
            (true, false)   //  Bottom left quadrant: Flip horizontally
        } else {
            (false, false)    //  Bottom right quadrant: Don't flip
        };
    let x_normalised = 
        if flip.0 { PHYSICAL_WIDTH as u8 / 2 - x } 
        else      { x - PHYSICAL_WIDTH as u8 / 2 };
    let y_normalised = 
        if flip.1 { PHYSICAL_HEIGHT as u8 / 2 - y }
        else      { y - PHYSICAL_HEIGHT as u8 / 2 };
    let p = map_physical_to_virtual_normalised(x_normalised, y_normalised);  //  Returns (x,y)
    let p2 = (
        if flip.0 { SCREEN_WIDTH as u8 / 2 - p.0 } 
        else      { p.0 + SCREEN_WIDTH as u8 / 2 }
        ,
        if flip.1 { SCREEN_HEIGHT as u8 / 2 - p.1 } 
        else      { p.1 + SCREEN_HEIGHT as u8 / 2 }
    );
    //  Crop to screen size
    (
        p2.0.min(SCREEN_WIDTH as u8 - 1),
        p2.1.min(SCREEN_HEIGHT as u8 - 1),
    )
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L556-L590_

## Map Virtual Pixels to Physical Pixels

TODO

```rust
/// For each Virtual (x,y) Coordinate, return the Bounding Box (left, top, right, bottom) that encloses the corresponding Physical (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Physical Pixels to redraw when a Virtual Pixel is updated.
/// (x,y) must belong to the X >= 0, Y >= 0 quadrant
fn map_virtual_to_physical_normalised(x: u8, y: u8) -> (u8, u8, u8, u8) {
    let x_index = x.min(VIRTUAL_TO_PHYSICAL_MAP_WIDTH as u8 - 1);
    let y_index = y.min(VIRTUAL_TO_PHYSICAL_MAP_HEIGHT as u8 - 1);
    let physical_box = VIRTUAL_TO_PHYSICAL_MAP[y_index as usize][x_index as usize];  //  Returns (left,top,right,bottom)
    physical_box
}

/// For each Virtual (x,y) Coordinate, return the Bounding Box (left, top, right, bottom) that encloses the corresponding Physical (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Physical Pixels to redraw when a Virtual Pixel is updated.
/// Since X and Y are symmetric, this grid only covers one quadrant (X >= 0, Y >= 0)
static VIRTUAL_TO_PHYSICAL_MAP: &[[(u8,u8,u8,u8); VIRTUAL_TO_PHYSICAL_MAP_WIDTH]; VIRTUAL_TO_PHYSICAL_MAP_HEIGHT] = &  //  Row=Y, Col=X
[                      //  Copied from output of https://github.com/lupyuen/interpolate-surface
    [                  //  Virtual Row 0
        (0,0,4,6),     //  Virtual Row 0, Col 0    => Physical Left Col 0,   Top Row 0, Right Col 4,  Bottom Row 6
        (5,0,8,6),     //  Virtual Row 0, Col 1    => Physical Left Col 5,   Top Row 0, Right Col 8,  Bottom Row 6
        ...
        (116,0,119,4), //  Virtual Row 0, Col 31   => Physical Left Col 116, Top Row 0, Right Col 119, Bottom Row 4
    ],    
    [                  //  Virtual Row 1
        (0,7,4,12),    //  Virtual Row 1, Col 0    => Physical Left Col 0,   Top Row 7, Right Col 4,  Bottom Row 12
        (5,7,8,12),    //  Virtual Row 1, Col 1    => Physical Left Col 5,   Top Row 7, Right Col 8,  Bottom Row 12
        ...
        (116,5,119,9), //  Virtual Row 1, Col 31   => Physical Left Col 116, Top Row 5, Right Col 119, Bottom Row 9
    ],
...
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L654-L782_

```rust
/// For each Virtual (x,y) Coordinate, return the Bounding Box (left, top, right, bottom) that encloses the corresponding Physical (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Physical Pixels to redraw when a Virtual Pixel is updated.
#[cfg(feature = "chip8_curve")]  //  If we are rendering CHIP8 Emulator as curved surface...
fn map_virtual_to_physical(x: u8, y: u8) -> (u8, u8, u8, u8) {
    //  Check which quadrant (x,y) belongs to and flip accordingly
    let flip =  //  (flip for X, flip for Y)
        if x < SCREEN_WIDTH as u8 / 2 && y < SCREEN_HEIGHT as u8 / 2 {
            (true, true)  //  Top left quadrant: Flip horizontally and vertically
        } else if x >= SCREEN_WIDTH as u8 / 2 && y < SCREEN_HEIGHT as u8 / 2 {
            (false, true)   //  Top right quadrant: Flip vertically
        } else if x < SCREEN_WIDTH as u8 / 2 && y >= SCREEN_HEIGHT as u8 / 2 {
            (true, false)   //  Bottom left quadrant: Flip horizontally
        } else {
            (false, false)    //  Bottom right quadrant: Don't flip
        };
    let x_normalised = 
        if flip.0 { SCREEN_WIDTH as u8 / 2 - x } 
        else      { x - SCREEN_WIDTH as u8 / 2 };
    let y_normalised = 
        if flip.1 { SCREEN_HEIGHT as u8 / 2 - y }
        else      { y - SCREEN_HEIGHT as u8 / 2 };
    let b = map_virtual_to_physical_normalised(x_normalised, y_normalised);  //  Returns (left,top,right,bottom)
    let b2 = (
        if flip.0 { PHYSICAL_WIDTH as u8 / 2 - b.0 } 
        else      { b.0 + PHYSICAL_WIDTH as u8 / 2 }
        ,
        if flip.1 { PHYSICAL_HEIGHT as u8 / 2 - b.1 } 
        else      { b.1 + PHYSICAL_HEIGHT as u8 / 2 }
        ,
        if flip.0 { PHYSICAL_WIDTH as u8 / 2 - b.2 } 
        else      { b.2 + PHYSICAL_WIDTH as u8 / 2 }
        ,
        if flip.1 { PHYSICAL_HEIGHT as u8 / 2 - b.3 } 
        else      { b.3 + PHYSICAL_HEIGHT as u8 / 2 }
    );
    //  Crop to screen size
    let crop = (
        b2.0.min(PHYSICAL_WIDTH as u8 - 1),   //  Left
        b2.1.min(PHYSICAL_HEIGHT as u8 - 1),  //  Top
        b2.2.min(PHYSICAL_WIDTH as u8 - 1),   //  Right
        b2.3.min(PHYSICAL_HEIGHT as u8 - 1),  //  Bottom
    );
    //  Flip left and right, top and bottom if necessary
    let result = (
        crop.0.min(crop.2),  //  Left
        crop.1.min(crop.3),  //  Top
        crop.0.max(crop.2),  //  Right
        crop.1.max(crop.3),  //  Bottom
    );
    assert!(result.0 <= result.2 && result.1 <= result.3, "flip error");  //  Left <= Right and Top <= Bottom
    result
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L592-L643_

## Iterate Curved Pixels

TODO

```rust
/// Implement the Iterator for Virtual Pixels in a Virtual Block
impl Iterator for PixelIterator {
    /// This Iterator returns Physical Pixel colour words (16-bit)
    type Item = u16;
    ...    
    /// Return the next Physical Pixel colour
    #[cfg(feature = "chip8_curve")]  //  If we are rendering CHIP8 Emulator as curved surface...
    fn next(&mut self) -> Option<Self::Item> {
        if self.y_physical > self.physical_bottom { return None; }  //  No more Physical Pixels
        assert!(self.x_physical < PHYSICAL_WIDTH as u8, "x overflow");
        assert!(self.y_physical < PHYSICAL_HEIGHT as u8, "y overflow");

        //  Map the Physical Pixel to the Virtual Pixel
        let virtual_pixel = map_physical_to_virtual(self.x_physical, self.y_physical);

        if self.x == virtual_pixel.0 && self.y == virtual_pixel.1 {
            //  If rendering the same Virtual Pixel, increment the offset
            self.x_offset += 1;
        } else {
            //  If rendering a different Virtual Pixel, reset the offset
            self.x = virtual_pixel.0;
            self.y = virtual_pixel.1;
            self.x_offset = 0;
            self.y_offset = 0;
        }

        //  Get the colour from the Virtual Screen Buffer
        let color = self.get_color();

        //  Loop over x_physical from physical_left to physical_right
        self.x_physical += 1;
        if self.x_physical > self.physical_right {
            self.x_physical = self.physical_left;
            //  Loop over y_physical from physical_top to physical_bottom
            self.y_physical += 1;
        }
        
        //  Return the Physical Pixel color
        return Some(color);
    }    
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/chip8/rust/app/src/chip8.rs#L457-L491_
