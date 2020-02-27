# chip8.rs: CHIP-8 Game Emulator for PineTime Smart Watch with Rust

Retro Gaming On Your Watch!

__UNDER CONSTRUCTION__

TODO

More info about CHIP-8…

http://www.multigesture.net/articles/how...terpreter/

Whole lot of games available here…

https://github.com/dmatlack/chip8/tree/master/roms

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
/// Same as map_physical_to_virtual, except that (x,y) belongs to the X >= 0, Y >= 0 quadrant
fn map_physical_to_virtual_normalised(x: u8, y: u8) -> (u8, u8) {
    let x_index = x.min(PHYSICAL_TO_VIRTUAL_MAP_WIDTH as u8 - 1);
    let y_index = y.min(PHYSICAL_TO_VIRTUAL_MAP_HEIGHT as u8 - 1);
    let virtual_pixel = PHYSICAL_TO_VIRTUAL_MAP[y_index as usize][x_index as usize];  //  Returns (x,y)
    virtual_pixel
}

/// For each Physical (x,y) Coordinate, return the corresponding Virtual (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Virtual Pixel to fetch the colour value when rendering a Physical Pixel.
/// Since X and Y are symmetric, this grid only covers one quadrant (X >= 0, Y >= 0)
static PHYSICAL_TO_VIRTUAL_MAP: &[[(u8,u8); PHYSICAL_TO_VIRTUAL_MAP_WIDTH]; PHYSICAL_TO_VIRTUAL_MAP_HEIGHT] = &  //  Row=Y, Col=X
//  Copied from output of https://github.com/lupyuen/interpolate-surface
[[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
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
/// Same as map_virtual_to_physical, except that (x,y) belongs to the X >= 0, Y >= 0 quadrant
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
//  Copied from output of https://github.com/lupyuen/interpolate-surface
[[(0,0,4,6),(5,0,8,6),(9,0,12,6),(13,0,16,6),(17,0,21,6),(22,0,25,6),(26,0,29,6),(29,0,33,6),(33,0,36,6),(37,0,40,6),(42,0,45,6),(46,0,49,6),(49,0,52,6),(53,0,56,6),(56,0,60,6),(60,0,64,6),(64,0,68,6),(67,0,71,6),(71,0,75,6),(74,0,79,6),(77,0,82,6),(81,0,86,6),(85,0,90,6),(88,0,93,5),(92,0,96,5),(95,0,99,5),(99,0,102,5),(102,0,106,5),(106,0,109,5),(110,0,112,4),(113,0,116,4),(116,0,119,4),],
[(0,7,4,12),(5,7,8,12),(9,7,12,12),(13,7,16,12),(17,7,21,12),(22,7,25,12),(25,7,28,12),(29,7,32,12),(33,7,36,12),(37,7,40,12),(42,7,45,12),(45,7,48,12),(49,7,52,12),(53,7,56,12),(56,7,59,11),(60,7,64,11),(64,7,67,11),(68,7,71,11),(72,7,75,11),(75,7,78,11),(79,7,82,11),(82,7,86,11),(87,6,89,11),(90,6,92,11),(93,6,96,10),(96,6,99,10),(99,6,102,10),(103,6,106,10),(107,5,109,9),(110,5,112,9),(113,5,115,9),(116,5,119,9),],
[(0,13,4,19),(5,13,8,18),(9,13,12,18),(13,13,16,18),(17,13,21,18),(21,13,24,18),(25,13,28,18),(29,13,32,18),(33,13,36,18),(37,13,40,18),(40,13,44,18),(45,13,48,18),(49,13,52,18),(52,12,55,18),(56,12,59,17),(60,12,63,17),(64,12,67,17),(68,12,71,17),(71,12,74,17),(75,12,78,17),(78,12,81,17),(82,12,86,16),(86,12,89,16),(90,11,92,16),(93,11,95,15),(96,11,98,15),(99,11,102,15),(102,10,106,15),(107,10,109,14),(110,10,112,14),(113,10,115,14),(116,10,118,13),],
[(0,21,4,26),(5,19,8,26),(9,19,12,26),(13,19,16,26),(16,19,19,26),(21,19,24,26),(25,19,28,26),(29,19,32,25),(32,19,35,25),(36,19,39,25),(40,19,44,25),(45,19,48,25),(48,19,51,25),(52,18,55,25),(56,18,58,24),(59,18,63,24),(64,18,67,24),(67,18,70,24),(71,18,74,23),(75,18,77,23),(78,17,81,23),(82,17,85,23),(86,17,89,23),(89,17,92,22),(92,16,95,22),(96,16,98,21),(99,16,101,21),(102,15,106,21),(106,15,109,19),(109,15,112,19),(113,15,115,18),(116,14,118,18),],
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
