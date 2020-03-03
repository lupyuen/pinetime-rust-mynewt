# chip8.rs: CHIP-8 Game Emulator for PineTime Smart Watch with Rust

![Space Invaders running on CHIP-8 Emulator on PineTime Smart Watch](https://lupyuen.github.io/images/chip8-invaders.jpg)

_Space Invaders running on CHIP-8 Emulator on PineTime Smart Watch_

__UNDER CONSTRUCTION__

TODO

More info about CHIP-8…

http://www.multigesture.net/articles/how-to-write-an-emulator-chip-8-interpreter/

Whole lot of games available here…

https://github.com/dmatlack/chip8/tree/master/roms

To test in web browser...

http://mir3z.github.io/chip8-emu/

I used an existing CHIP-8 Emulator for Rust…

https://github.com/YushiOMOTE/libchip8

The code I actually wrote is surprisingly little… (What took so long to get it right? Tracking down which Rust function was taking too much stack space)

https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs

Thinking of using the accelerometer to control the game… tilt your watch up / down / left / right to control the player…. will this be playable? Hmmm…

I have some ideas how to optimise the rendering (e.g. batching of pixels into blocks). But this has been a really rewarding exercise on PineTime… All it takes is a few lines of Rust code to run games on PineTime! :-)

How about we take some retro games and turn them into PineTime Watch Faces?

# Start the CHIP-8 Emulator

We're using the [libchip8 CHIP-8 Emulator for Rust](https://github.com/YushiOMOTE/libchip8). To start the emulator, we load the ROM file for the CHIP-8 game into memory, and call the Emulator to start the game...

```rust
///  Run the emulator
extern "C" fn task_func(_arg: Ptr) {    
    //  Create the hardware API for rendering the emulator
    let hardware = Hardware::new();

    //  Create the emulator
    let chip8 = libchip8::Chip8::new(hardware);

    //  Load the emulator ROM
    let rom = include_bytes!("../roms/blinky.ch8");

    //  Run the emulator ROM. This will block until emulator terminates
    chip8.run(rom);

    //  Should not come here
    assert!(false, "CHIP8 should not end");
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L78-L98_

Note the neat syntax used in Rust to load binary files into memory...

```rust
    //  Load the emulator ROM
    let rom = include_bytes!("../roms/blinky.ch8");
```

`blinky.ch8` is a binary file that contains the program and data for the Blinky CHIP-8 game. By calling the `include_bytes!` macro, we load the entire binary file into memory as a Rust static memory object.

How is `Hardware` used? We'll find out next...

![Blinky running on CHIP-8 Emulator on PineTime Smart Watch](https://lupyuen.github.io/images/chip8-blinky.jpg)

_Blinky running on CHIP-8 Emulator on PineTime Smart Watch_

# Set a Pixel Colour

`libchip8` is a clever CHIP-8 Emulator that supports all kinds of platforms, including Windows. _How does it do that?_

`libchip8` abstracts all platform-specific operations (like Screen Updates) into the `Hardware` trait.  Here's how we implement the `Hardware` trait on PineTime to set a screen pixel on or off...

```rust
impl libchip8::Hardware for Hardware {
    /// Set the color of a pixel in the screen. true for white, and false for black.
    fn vram_set(&mut self, x: usize, y: usize, color: bool) {
        assert!(x < SCREEN_WIDTH,  "x overflow");  //  x must be 0 to 63
        assert!(y < SCREEN_HEIGHT, "y overflow");  //  y must be 0 to 31
        let i = x + y * SCREEN_WIDTH;              //  index into screen buffer
        unsafe { SCREEN_BUFFER[i] =  //  Screen the screen buffer to...
            if color { 255 }         //  White pixel
            else     {   0 }         //  Black pixel
        };
        //  Remember the boundary of the screen region to be updated
        if self.update_left == 0 && self.update_right == 0 &&
            self.update_top == 0 && self.update_bottom == 0 {
            self.update_left = x as u8; self.update_right  = x as u8;
            self.update_top  = y as u8; self.update_bottom = y as u8;
        }
        //  If this pixel is outside the the boundary of the screen region to be updated, extend the boundary
        if (x as u8) < self.update_left   { self.update_left = x as u8;   }
        if (x as u8) > self.update_right  { self.update_right = x as u8;  }
        if (y as u8) < self.update_top    { self.update_top = y as u8;    }
        if (y as u8) > self.update_bottom { self.update_bottom = y as u8; }
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L169-L198_

_(`u8` means unsigned byte; `usize` is similar to `size_t` in C )_

The CHIP-8 Emulator has a simple screen layout: 64 rows, 32 columns, 1-bit colour (black or white). `vram_set` updates the pixel colour in a greyscale memory buffer named `SCREEN_BUFFER` that's only 2 KB (64 rows of 32 bytes)...

```rust
/// CHIP8 Virtual Screen size, in Virtual Pixels
const SCREEN_WIDTH:  usize = 64;
const SCREEN_HEIGHT: usize = 32;
/// CHIP8 Virtual Screen Buffer, 8-bit greyscale (from black=0 to white=255) per Virtual Pixel.
/// The greyscale is mapped to 16-bit colour for display.
static mut SCREEN_BUFFER: [u8; SCREEN_WIDTH * SCREEN_HEIGHT] = [0; SCREEN_WIDTH * SCREEN_HEIGHT];  //  2 KB (64 rows of 32 bytes), u8 means unsigned byte
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L19-L37_

_Why did we allocate 8 bits per pixel in `SCREEN_BUFFER`?_ 

So that we can implement interesting colour effects. (We'll cover this later) We actually update `SCREEN_BUFFER` with a greyscale colour like this...

```rust
//  color is true when emulator draws a white pixel, black otherwise
unsafe { SCREEN_BUFFER[i] = 
    if color {
        if self.is_interactive { 255 }  //  Brighter colour when emulator is active
        else { 200 }                    //  Darker colour for initial screen
    } 
    else { 
        if self.is_interactive { 127 }  //  Fade to black
        else { 0 }                      //  Black for initial screen                 
    }  
};
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L169-L198_

_Something seems to be missing... `vram_set` updates a screen buffer in memory... But we haven't actually updated the PineTime display!_

`vram_set` is called every time the Emulator paints a pixel. Instead of refreshing the PineTime display pixel by pixel, we update the display by __Sprite__ instead. 

_What's a Sprite?_

No not the lemon-lime drink... It's the graphic that moves around in a game. In the Blinky / Pac-Man game, Pac-Man and the Ghosts are rendered as Sprites.

_How do we know when a Sprite has been drawn?_ 

We detect that in the `sched` function, where we update the PineTime display too.

# Render the Display

_How does CHIP-8 run game programs and render Sprites?_

Think of CHIP-8 as an old-style home computer from the 1980s. It executes simple 8-bit Instructions (Opcodes), reading and writing data to CPU registers and RAM.

CHIP-8 has a unique Instruction that's not found in computers from the 1980s... An Instruction that __renders Sprites.__ Since CHIP-8 renders Sprites as an CHIP-8 Instruction, we should update the PineTime screen only when the CHIP-8 Instruction has completed.

The CHIP-8 Emulator provides a convenient hook for that... It calls `sched` after executing every CHIP-8 Instruction...

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
        self.update_left   = 0;
        self.update_top    = 0;
        self.update_right  = 0;
        self.update_bottom = 0;

        //  Return false to indicate no shutdown
        false
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L231-L268_

Instead of updating the entire PineTime display, we update only the rectangular portion that has been changed, by calling `render_region`.

_(Recall that screen updates are tracked by `vram_set`)_

Updating the PineTime display really slows down the CHIP-8 Emulator, so we defer all display updates until absolutely necessary.

_When is it absolutely necessary to update the PineTime display?_

_That's when the game has rendered something and is checking whether the player has pressed any buttons_

Thus we have these conditions to defer the PineTime display updates in `sched`...

```rust
//  If emulator is preparing the initial screen, refresh the screen later
if !self.is_interactive { return false; }

//  If emulator is not ready to accept input, refresh the screen later
if !self.is_checking_input { return false; }
self.is_checking_input = false;
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L231-L268_

`is_interactive` and `is_checking_input` are flags set in the `key` function, which is called whenever the CHIP-8 Emulator is checking for button presses.

These simple conditions for defering the PineTime rendering are extremely effective. They make the PineTime CHIP-8 Emulator refresh some screens quicker than other versions of the CHIP-8 Emulator.

_(Compare the loading screen for Blinky on PineTime vs other platforms)_

# Render a Region

Previously in `sched` we have identified the rectangular region of the PineTime display to be updated. We could call `render_block` to render the entire region to the PineTime display in a __single SPI operation__ like this...

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
        ...
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L271-L304_

_...But it won't always work!_

Our Rust display driver for PineTime has a buffer size of __8 KB.__

Since one pixel on the PineTime display has 16-bit colour, that means we can (roughly) transmit at most __4,096 pixels in a single SPI operation.__

_If we need to update the __entire CHIP-8 Emulator screen__, how many pixels would we need to transmit?_

```rust
/// CHIP8 Physical Screen size, in Physical Pixels
const PHYSICAL_WIDTH:  usize = 240;
const PHYSICAL_HEIGHT: usize = 200;

/// CHIP8 Virtual Screen size, in Virtual Pixels
const SCREEN_WIDTH:  usize = 64;
const SCREEN_HEIGHT: usize = 32;

/// CHIP8 Virtual Pixel size, in Physical Pixels
const PIXEL_WIDTH:  usize = 3;  //  One Virtual Pixel = 3 x 5 Physical Pixels
const PIXEL_HEIGHT: usize = 5;
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L19-L37_

To update the entite CHIP-8 display, we would need to transmit __48,000 pixels__ over SPI (`PHYSICAL_WIDTH` * `PHYSICAL_HEIGHT`)... Waaaaay too many pixels!

_Why so many pixels? Isn't the CHIP-8 screen size only 64 x 32? (`SCREEN_WIDTH` by `SCREEN_HEIGHT`)_

Yeah but we need to __stretch every CHIP-8 Virtual Pixel into 15 PineTime Physical Pixels__ to fill the PineTime display!

_(That's 3 * 5... `PIXEL_WIDTH` * `PIXEL_HEIGHT`)_

Unfortunately the PineTime display controller (ST7789) doesn't handle stretching, so we need to do the stretching ourselves.

_(But fret not... There's something interesting we shall see later... We can do curved stretching! Just like making pizza or roti prata!)_

Thus to prevent the SPI buffer from overflowing, we update the screen in blocks of 32 by 5 Virtual Pixels on CHIP-8... (Or 96 by 25 Physical Pixels on the PineTime display)

```rust
/// CHIP8 Virtual Block size. We render the CHIP8 Virtual Screen in blocks of Virtual Pixels, without overflowing the SPI buffer.
/// PendingDataSize in SPI is 8192. (BLOCK_WIDTH * PIXEL_WIDTH * BLOCK_HEIGHT * PIXEL_HEIGHT) * 2 must be less than PendingDataSize
const BLOCK_WIDTH:  usize = 32;
const BLOCK_HEIGHT: usize = 5;  //  Letter height
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L27-L33_

Here's how we break the rendering region into smaller blocks to be rendered by `render_block`...

```rust
/// Render the Virtual Screen region
fn render_region(left: u8, top: u8, right: u8, bottom: u8) {
    ...
    //  If the update region is small, render with a single block
    if physical_width + physical_height <= (BLOCK_WIDTH * PIXEL_WIDTH) + (BLOCK_HEIGHT * PIXEL_HEIGHT) {
        ...
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
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L271-L304_

The function `get_bounding_box(left, top, right, bottom)` simply returns a Rust tuple `(left, top, right, bottom)` that may be accessed by using the `.0`, `.1`, `.2` and `.3` notation (shown above like `physical_box.0`).

`get_bounding_box` doesn't do much now... But it will become very interesting later when we stretch the CHIP-8 pixels in a curvy way.

_(Oh yes I love Rust tuples! As much as roti prata!)_

# Render a Block

Now we're ready to render a block of CHIP-8 Virtual Pixels (that has been checked by `render_region` and won't overflow the SPI buffer)...

```rust
/// Render the Virtual Block
fn render_block(left: u8, top: u8, right: u8, bottom: u8) {
    //  Create an iterator for the Physical Pixels to be rendered
    let mut block = PixelIterator::new(
        left, top, 
        right, bottom,
    );
    //  Get the Physical Pixel dimensions of the Virtual Pixels
    let (left_physical, top_physical, right_physical, bottom_physical) = block.get_window();
    //  Render the block via the iterator
    druid::set_display_pixels(left_physical as u16, top_physical as u16, right_physical as u16, bottom_physical as u16,
        &mut block
    ).expect("set pixels failed");    
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L306-L319_

_Rendering a block of CHIP-8 Virtual Pixels looks suspiciously simple... What's an Iterator?_

A Rust Iterator loops over individual values in a sequence of values. (It's often used in `for` loops)

Here we create a Rust Iterator that loops over individual Physical PineTime Pixels to be rendered (based on the Virtual CHIP-8 Block that's passed in).

The values returned by the Rust Iterator are 16-bit colour values. Our Rust display driver for PineTime calls the Rust Iterator to enumerate all the 16-bit colour values and blast all values in a single SPI operation. Super efficient!

# Iterate Pixels in a Block

Here's the implementation of our iterator that enumerates all Physical Pixel Colours within a Virtual Pixel Block that's defined by the Virtual `(x, y)` Coordinates from `(block_left, block_top)` to `(block_right, block_bottom)`...

```rust
/// Implement the Iterator for Virtual Pixels in a Virtual Block
impl Iterator for PixelIterator {
    /// This Iterator returns Physical Pixel colour words (16-bit)
    type Item = u16;

    /// Return the next Physical Pixel colour
    #[cfg(not(feature = "chip8_curve"))]  //  If we are not rendering CHIP8 Emulator as curved surface...
    fn next(&mut self) -> Option<Self::Item> {
        if self.y > self.block_bottom { return None; }  //  No more Physical Pixels

        //  Get the 16-bit Physical Colour for the Virtual Pixel at (x, y)
        let color = self.get_color();

        //  Update (x, y) to the next pixel left to right, then top to bottom...
        //  Loop over every stretched horizontal Physical Pixel (x_offset) from 0 to PIXEL_WIDTH - 1
        self.x_offset += 1;
        if self.x_offset >= PIXEL_WIDTH as u8 {
            self.x_offset = 0;

            //  Loop over every Virtual Pixel (x) from block_left to block_right
            self.x += 1;
            if self.x > self.block_right {
                self.x = self.block_left;

                //  Loop over every stretched vertical Vertical Pixel (y_offset) from 0 to PIXEL_HEIGHT - 1
                self.y_offset += 1;
                if self.y_offset >= PIXEL_HEIGHT as u8 {
                    self.y_offset = 0;

                    //  Loop over every Virtual Pixel (y) from block_top to block_bottom
                    self.y += 1;
                }
            }
        }
        //  Return the Physical Pixel color
        return Some(color);
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L408-L455_

The Iterator returns the next Physical Pixel Colour, as defined by `self.x` (Current Virtual Column) and `self.y` (Current Virtual Row). 

Let's look at function `get_color`, which maps greyscale CHIP-8 Virtual Colours to 16-bit PineTime Physical Colours...

# Convert Colours

CHIP-8 doesn't support colour... Everything is rendered in black and white... Only Two Shades of Grey!

_What if we spice up CHIP-8 games with a dash of colour? How shall we colourise a CHIP-8 game that doesn't know anything about colour?_

By hooking on to the `key` function, we know when the game is first seeking input... Everything that the game renders after startup and up till the first call to `key` is most likely the Initial Loading Screen. 

Thus in the `key` function we flag `is_interactive` as `true` at the first call to `key`.

```rust
impl libchip8::Hardware for Hardware {
    /// Check if the key is pressed.
    fn key(&mut self, key: u8) -> bool {
        //  key is 0-9 for keys "0" to "9", 0xa-0xf to keys "A" to "F"
        if !self.is_interactive {
            self.is_interactive = true;
        }
        self.is_checking_input = true;
        //  Compare the key with the last touch event
        if unsafe { KEY_PRESSED == Some(key) } {
            unsafe { KEY_PRESSED = None };  //  Clear the touch event
            return true;
        }
        false
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L133-L147_

_Since we can identify the Initial Loading Screen... Let's colour that screen!_

Remember this code from `vram_set`?

```rust
//  color is true when emulator draws a white pixel, black otherwise
unsafe { SCREEN_BUFFER[i] = 
    if color {                          //  If emulator draws a white pixel...
        if self.is_interactive { 255 }  //  Brighter colour when emulator is active
        else { 200 }                    //  Darker colour for initial screen
    } 
    else {                              //  If emulator draws a black pixel...
        ...
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L169-L198_

Instead of plain black and white, our CHIP-8 Virtual Screen Buffer now stores 8-bit greyscale... 256 Shades of Grey!

Through the `is_interactive` flag, we may now paint the Initial Loading Screen as greyscale `200`. Other pixels drawn after the Initial Loading Screen will be set to greyscale `255`.

Greyscale `200` is converted into a greenish hue, while greyscale `255` is converted to bright white...

```rust
/// Convert the Virtual Colour (8-bit greyscale) to 16-bit Physical Pixel Colour
fn convert_color(grey: u8) -> u16 {
    match grey {
        250..=255 => Rgb565::from(( grey,       grey, grey )).0,        //  White
        128..250  => Rgb565::from(( grey - 100, grey, grey - 100 )).0,  //  Greenish
        0..128    => Rgb565::from(( 0,          0,    grey )).0,        //  Dark Blue
    }
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L494-L510_

_Note that `128..250` means 128 to 249, excluding 250. Whereas `250..=255` means 250 to 255 (inclusive)_

The above function `convert_color` is called by `get_color` to map CHIP-8 Virtual Pixel Greyscale into 16-bit Physical Pixel Colour when rendering every pixel...

```rust
impl PixelIterator {
    /// Return the 16-bit colour of the Virtual Pixel
    fn get_color(&mut self) -> u16 {
        //  Get the greyscale colour at Virtual Coordinates (x,y) and convert to 16-bit Physical Colour
        let i = self.x as usize + self.y as usize * SCREEN_WIDTH;
        let color = unsafe { convert_color( SCREEN_BUFFER[i] ) };
        //  Update the greyscale colour at Virtual Coordinates (x,y)
        if self.x_offset == 0 && self.y_offset == 0 {  //  Update colours only once per Virtual Pixel
            unsafe { SCREEN_BUFFER[i] = update_color( SCREEN_BUFFER[i] ); }  //  e.g. fade to black
        }
        color  //  Return the 16-bit Physical Colour
    }    
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L376-L385_

Thus our Initial Loading Screen now looks green. Other Sprites in the game will appear as white (greyscale `255`) because they are rendered after the game has started seeking button input.

This colouring effect is most obvious in the Space Invaders title screen.

![Space Invaders title screen in green](https://lupyuen.github.io/images/chip8-invaders.jpg)

_Space Invaders title screen in green_

What about black pixels? Recall the code from `vram_set`...

```rust
//  color is true when emulator draws a white pixel, black otherwise
unsafe { SCREEN_BUFFER[i] = 
    if color {                          //  If emulator draws a white pixel...
        ...
    } 
    else {                              //  If emulator draws a black pixel...
        if self.is_interactive { 127 }  //  Fade to black
        else { 0 }                      //  Black for initial screen                 
    }  
};
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L169-L198_

Assuming that the game is actually running (after showing the Initial Loading Screen), `is_interactive` is flagged as true.

The above code sets the CHIP-8 Virtual Pixel to greyscale `127`. Which is mapped by `convert_color` to a dark blue colour...

```rust
/// Convert the Virtual Colour (8-bit greyscale) to 16-bit Physical Pixel Colour
fn convert_color(grey: u8) -> u16 {
    match grey {
        250..=255 => Rgb565::from(( grey,       grey, grey )).0,        //  White
        128..250  => Rgb565::from(( grey - 100, grey, grey - 100 )).0,  //  Greenish
        0..128    => Rgb565::from(( 0,          0,    grey )).0,        //  Dark Blue
    }
}

/// Fade the Virtual Colour (8-bit greyscale) to black
fn update_color(grey: u8) -> u8 {
    match grey {
        200..=255 => grey - 2,    //  Initial white flash fade to normal white
        128..200  => grey,        //  Normal white stays the same
        0..128    => grey >> 1,   //  Dark fade to black
    }
}
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L494-L510_

Note that the `update_color` function above is also called by `get_color` while rendering each pixel of the PineTime display.

`update_color` gradually diminishes greyscale `127` until it reaches `0`, at every rendering of the pixel. (`>>1` shifts the greyscale right by 1 bit, which is the same as dividing by 2)

The result: Black pixels appear as dark blue trails that fade to black.

This colouring effect is most obvious in the Pong game... Watch the trail of the bouncing ball.

![Pong ball trail in blue](https://lupyuen.github.io/images/chip8-pong.jpg)

_Pong ball trail in blue_

# Handle Touch Events

CHIP-8 uses a keypad with 15 keys, marked `0` to `9`, `A` to `F`.

For PineTime we'll emulate a simple keypad: Tapping the Left part of the touchscreen simulates the key `4`, Centre part simulates `5`, Right part simulates `6`.

This is sufficient for playing Space Invaders, which uses `4` and `6` to move your spaceship Left and Right, and `5` to fire.

Function `handle_touch` is called by the PineTime Rust touch controller driver with the `(x,y)` coordinates of the touched point, from `(0,0)` to `(239,239)`...

```rust
/// Handle touch events to emulate buttons
pub fn handle_touch(x: u16, _y: u16) { 
    //  We only handle 3 keys: 4, 5, 6, which correspond to Left, Centre, Right
    let key =                                                  //  PHYSICAL_WIDTH is 240
        if x < PHYSICAL_WIDTH as u16 / 3 { Some(4) }           //  Left = 4
        else if x < 2 * PHYSICAL_WIDTH as u16 / 3 { Some(5) }  //  Centre = 5
        else { Some(6) };                                      //  Right = 6
    unsafe { KEY_PRESSED = key };
}

/// Represents the key pressed: 0-9 for keys "0" to "9", 0xa-0xf to keys "A" to "F", None for nothing pressed
static mut KEY_PRESSED: Option<u8> = None;
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L133-L147_

`handle_touch` stores the simulated keypress into `KEY_PRESSED`

Note that `KEY_PRESSED` has type `Option<u8>`, which is an optional unsigned byte. So `KEY_PRESSED` may contain a specified byte (like `Some(4)`), or nothing (`None`).

The CHIP-8 Emulator checks for keys pressed by calling the `key` function...

```rust
impl libchip8::Hardware for Hardware {
    /// Check if the key is pressed.
    fn key(&mut self, key: u8) -> bool {
        //  key is 0-9 for keys "0" to "9", 0xa-0xf to keys "A" to "F"
        if !self.is_interactive {
            self.is_interactive = true;
        }
        self.is_checking_input = true;
        //  Compare the key with the last touch event
        if unsafe { KEY_PRESSED == Some(key) } {
            unsafe { KEY_PRESSED = None };  //  Clear the touch event
            return true;
        }
        false
    }
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L492-L504_

When the Emulator calls `key(self, 4)`, we should return `true` if the key `4` has been pressed, i.e. `KEY_PRESSED` has value `Some(4)`

This doesn't found efficient for checking many keys... But it's probably OK for retro games.

![Playing Space Invaders with 3 touch points: Left, Centre, Right](https://lupyuen.github.io/images/chip8-invaders2.jpg)

_Playing Space Invaders with 3 touch points: Left, Centre, Right_

# CHIP-8 Emulator Task

TODO

```rust
/// Erase the PineTime display and start the CHIP-8 Emulator task
pub fn on_start() -> MynewtResult<()> {
    //  Create black background
    let background = Rectangle::<Rgb565>
        ::new( Coord::new( 0, 0 ), Coord::new( 239, 239 ) )   //  Rectangle coordinates
        .fill( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) );  //  Black

    //  Render background to display
    druid::draw_to_display(background);

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

/// CHIP8 Background Task
static mut CHIP8_TASK: os::os_task = fill_zero!(os::os_task);

/// Stack space for CHIP8 Task, initialised to 0.
static mut CHIP8_TASK_STACK: [os::os_stack_t; CHIP8_TASK_STACK_SIZE] = 
    [0; CHIP8_TASK_STACK_SIZE];

/// Size of the stack (in 4-byte units). Previously `OS_STACK_ALIGN(256)`  
const CHIP8_TASK_STACK_SIZE: usize = 4096;  //  Must be 4096 and above because CHIP8 Emulator requires substantial stack space
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L39-L66_

# Build and Run the Emulator

```yaml
[features]
default =  [          # Select the conditional compiled features
    # "display_app",  # Disable graphics display app
    # "ui_app",       # Disable druid UI app
    # "visual_app",   # Disable Visual Rust app
    "chip8_app",      # Enable CHIP8 Emulator app
    # "chip8_curve",  # Uncomment to render CHIP8 Emulator as curved surface (requires chip8_app)
    # "use_float",    # Disable floating-point support e.g. GPS geolocation
]
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/Cargo.toml_

```yaml
syscfg.vals:
    # OS_MAIN_STACK_SIZE: 1024  #  Small stack size: 4 KB
    OS_MAIN_STACK_SIZE: 2048    #  Normal stack size: 8 KB
    # OS_MAIN_STACK_SIZE: 4096  #  Large stack size: 16 KB
```
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/apps/my_sensor_app/syscfg.yml_

# Distort the CHIP-8 Rendering

![Blinky distorted on a curved surface](https://lupyuen.github.io/images/chip8-blinky-curve.jpg)

_Blinky distorted on a curved surface_



![Blinky without distortion](https://lupyuen.github.io/images/chip8-blinky.jpg)

_Blinky without distortion_

![Distorting CHIP-8 on a curved surface](https://lupyuen.github.io/images/chip8-curve.jpg)

_From https://stackoverflow.com/questions/18264703/mapping-a-2d-grid-onto-a-sphere_

# Map Physical Pixels to Virtual Pixels

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
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L645-L673_

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
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L556-L590_

# Map Virtual Pixels to Physical Pixels

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
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L654-L782_

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
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L592-L643_

# Iterate Curved Pixels

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
_From https://github.com/lupyuen/pinetime-rust-mynewt/blob/master/rust/app/src/chip8.rs#L457-L491_

