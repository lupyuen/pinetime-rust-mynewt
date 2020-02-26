//  CHIP8 Emulator App. Need to edit apps/my_sensor_app/syscfg.yml and reduce the main stack size (OS_MAIN_STACK_SIZE) to 2048.
use embedded_graphics::{
    prelude::*,
    pixelcolor::Rgb565,
    primitives::{
        Rectangle,
    },
};
use mynewt::{
    result::*,
    sys::console,
    kernel::os,
    NULL, Ptr, Strn, fill_zero,
};
use mynewt_macros::{
    init_strn,
};

/// CHIP8 Physical Screen size, in Physical Pixels
const PHYSICAL_WIDTH: usize = 240;
const PHYSICAL_HEIGHT: usize = 200;

/// CHIP8 Virtual Screen size, in Virtual Pixels
const SCREEN_WIDTH: usize = 64;
const SCREEN_HEIGHT: usize = 32;

/// CHIP8 Virtual Block size. We render the CHIP8 Virtual Screen in blocks of Virtual Pixels, without overflowing the SPI buffer.
/// PendingDataSize in SPI is 8192. (BLOCK_WIDTH * PIXEL_WIDTH * BLOCK_HEIGHT * PIXEL_HEIGHT) * 2 must be less than PendingDataSize
const BLOCK_HEIGHT: usize = 5;  //  Letter height
#[cfg(not(feature = "chip8_curve"))]  //  If we are not rendering CHIP8 Emulator as curved surface...
const BLOCK_WIDTH: usize = 32;        //  Use normal width
#[cfg(feature = "chip8_curve")]       //  If we are rendering CHIP8 Emulator as curved surface...
const BLOCK_WIDTH: usize = 5;        //  Use shorter width because curved regions have more pixels

/// CHIP8 Virtual Pixel size, in Physical Pixels
const PIXEL_WIDTH: usize = 3;
const PIXEL_HEIGHT: usize = 5;

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

/// CHIP8 Background Task
static mut CHIP8_TASK: os::os_task = fill_zero!(os::os_task);

/// Stack space for CHIP8 Task, initialised to 0.
static mut CHIP8_TASK_STACK: [os::os_stack_t; CHIP8_TASK_STACK_SIZE] = 
    [0; CHIP8_TASK_STACK_SIZE];

/// Size of the stack (in 4-byte units). Previously `OS_STACK_ALIGN(256)`  
const CHIP8_TASK_STACK_SIZE: usize = 4096;  //  Must be 4096 and above because CHIP8 Emulator requires substantial stack space

///  Run the emulator
extern "C" fn task_func(_arg: Ptr) {    
    //  Create the hardware API for rendering the emulator
    let hardware = Hardware::new();

    //  Create the emulator
    let chip8 = libchip8::Chip8::new(hardware);
    console::print("CHIP8 started\n"); console::flush();

    //  Load the emulator ROM
    let rom = include_bytes!("../roms/invaders.ch8");
    //  let rom = include_bytes!("../roms/blinky.ch8");
    //  let rom = include_bytes!("../roms/pong.ch8");

    //  Run the emulator ROM. This will block until emulator terminates
    chip8.run(rom);

    //  Should not come here
    console::print("CHIP8 done\n"); console::flush();
    assert!(false, "CHIP8 should not end");
}

/// Hardware API for rendering CHIP8 Emulator
struct Hardware {
    /// Boundaries of the Virtual Screen region to be refreshed
    update_left: u8,
    update_top: u8,
    update_right: u8,
    update_bottom: u8,
    /// True if emulator has started accepting input, i.e. emulator has drawn loading screen
    is_interactive: bool,
    /// True if emulator is checking input, i.e. emulator has updated a sprite
    is_checking_input: bool,
}

impl Hardware {
    /// Return a new Hardware API for rendering CHIP8 Emulator
    pub fn new() -> Hardware {
        Hardware {
            update_left: 0,
            update_top: 0,
            update_right: 0,
            update_bottom: 0,
            is_interactive: false,
            is_checking_input: false,
        }
    }
}

impl libchip8::Hardware for Hardware {
    /// Return a random value.
    fn rand(&mut self) -> u8 {
        123  //  TODO
    }

    /// Check if the key is pressed.
    fn key(&mut self, _key: u8) -> bool {
        if !self.is_interactive {
            self.is_interactive = true;
            console::print("key\n"); console::flush(); ////
        }
        self.is_checking_input = true;
        false
        /*
        let k = match key {
            0 => Key::X,
            1 => Key::Key1,
            2 => Key::Key2,
            3 => Key::Key3,
            4 => Key::Q,
            5 => Key::W,
            6 => Key::E,
            7 => Key::A,
            8 => Key::S,
            9 => Key::D,
            0xa => Key::Z,
            0xb => Key::C,
            0xc => Key::Key4,
            0xd => Key::E,
            0xe => Key::D,
            0xf => Key::C,
            _ => return false,
        };

        match &self.win {
            Some(win) => win.is_key_down(k),
            None => false,
        }
        */
    }

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

    /// Get the current state of a pixel in the screen.
    fn vram_get(&mut self, x: usize, y: usize) -> bool {
        //  console::print("get "); console::printint(x as i32); console::print(", "); console::printint(y as i32); console::print("\n"); console::flush(); ////
        assert!(x < SCREEN_WIDTH, "x overflow");
        assert!(y < SCREEN_HEIGHT, "y overflow");
        let i = x + y * SCREEN_WIDTH;
        unsafe { SCREEN_BUFFER[i] >= 128 }
    }

    /// Set the size of the screen.
    fn vram_setsize(&mut self, size: (usize, usize)) {
        //  Do nothing. We assume SCREEN_WIDTH and SCREEN_HEIGHT.
        assert!(size.0 == SCREEN_WIDTH && size.1 == SCREEN_HEIGHT, "bad size");
        console::print("setsize "); console::printint(size.0 as i32); console::print(", "); console::printint(size.1 as i32); console::print("\n"); console::flush(); ////
    }

    /// Get the size of the screen.
    fn vram_size(&mut self) -> (usize, usize) {
        (SCREEN_WIDTH, SCREEN_HEIGHT)
    }

    /// Return the current clock value in nanoseconds.
    fn clock(&mut self) -> u64 {
        unsafe { os::os_time_get() as u64 * 1000_u64 * 2000_u64 }
    }

    /// Play beep sound.
    fn beep(&mut self) {
        //  TODO: Vibrate? Flash?
    }

    /// Called in every step; return true for shutdown.
    fn sched(&mut self) -> bool {
        //  console::print("sched\n"); console::flush(); ////

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
}

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

/// Render the Virtual Block
fn render_block(left: u8, top: u8, right: u8, bottom: u8) {
    //  console::print("render "); console::printint(left as i32); console::print(", "); console::printint(top as i32); console::print(", "); console::printint(right as i32 - left as i32); console::print(", "); console::printint(bottom as i32 - top as i32); console::print("\n"); console::flush(); ////
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

/// CHIP8 Virtual Screen Buffer, 8-bit greyscale (from black=0 to white=255) per Virtual Pixel.
/// The greyscale is mapped to 16-bit colour for display.
static mut SCREEN_BUFFER: [u8; SCREEN_WIDTH * SCREEN_HEIGHT] = [0; SCREEN_WIDTH * SCREEN_HEIGHT];

/// Iterator for each Virtual Pixels in a Virtual Block. This allows the display driver to iterate and
/// render each Physical Pixel that corresponds to a Virtual Block.
#[derive(Debug, Clone)]
pub struct PixelIterator {
    /// Current column number
    x:           u8,
    /// Current row number
    y:           u8,
    /// Current column offset of Physical Pixel within the Virtual Pixel: 0 to PIXEL_WIDTH - 1
    x_offset:    u8,
    /// Current row offset of Physical Pixel within the Virtual Pixel: 0 to PIXEL_HEIGHT - 1
    y_offset:    u8,
    /// Current Physical column number
    x_physical:      u8,
    /// Current Physical row number
    y_physical:      u8,
    /// Start Virtual column number for block
    block_left:      u8,
    /// End Virtual column number for block
    block_right:     u8,
    /// Start Virtual row number for block
    block_top:       u8,
    /// End Virtual row number for block
    block_bottom:    u8,
    /// Start Physical column number for block
    physical_left:      u8,
    /// End Physical column number for block
    physical_right:     u8,
    /// Start Physical row number for block
    physical_top:       u8,
    /// End Physical row number for block
    physical_bottom:    u8,
}

impl PixelIterator {
    /// Return a new PixelInterator for the block dimensions
    pub fn new(
        //  Start column number for block
        block_left:      u8,
        //  Start row number for block
        block_top:       u8,
        //  End column number for block
        block_right:     u8,
        //  End row number for block
        block_bottom:    u8,        
    ) -> PixelIterator {
        let (physical_left, physical_top, physical_right, physical_bottom) = 
            get_bounding_box(block_left, block_top, block_right, block_bottom);
        PixelIterator {
            x: block_left, 
            y: block_top,
            x_offset: 0, 
            y_offset: 0,
            x_physical: physical_left,
            y_physical: physical_top,
            block_left, block_right, block_top, block_bottom,
            physical_left, physical_top, physical_right, physical_bottom
        }
    }

    /// Return true if the Virtual Pixel is in the block
    pub fn contains(&self, x: u8, y: u8) -> bool {
        x >= self.block_left && x <= self.block_right &&
            y >= self.block_top && y <= self.block_bottom
    }

    /// Return window of Physical Pixels (left, top, right, bottom) for this Virtual Block
    pub fn get_window(&self) -> (u8, u8, u8, u8) {
        ( self.physical_left, self.physical_top, self.physical_right, self.physical_bottom )
    }

    /// Return the 16-bit colour of the Virtual Pixel
    fn get_color(&mut self) -> u16 {
        assert!(self.x < SCREEN_WIDTH as u8 && self.y < SCREEN_HEIGHT as u8, "color overflow");
        let i = self.x as usize + self.y as usize * SCREEN_WIDTH;
        let color = unsafe { convert_color(SCREEN_BUFFER[i]) };
        if self.x_offset == 0 && self.y_offset == 0 {  //  Update colours only once per Virtual Pixel
            unsafe { SCREEN_BUFFER[i] = update_color(SCREEN_BUFFER[i]); }  //  Fade to black
        }
        color
    }    
}

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
}

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

/// TODO: Handle touch events to emulate buttons
pub fn handle_touch(_x: u16, _y: u16) { 
    console::print("CHIP8 touch not handled\n"); console::flush(); 
}

//  TODO: Move this to Mynewt library
extern "C" { 
    /// Tickles the watchdog so that the Watchdog Timer doesn't expire. This needs to be done periodically, before the value configured in hal_watchdog_init() expires.
    fn hal_watchdog_tickle(); 
}

/// Return Bounding Box of Physical Pixels (left, top, right, bottom) that correspond to the Virtual Pixels
#[cfg(not(feature = "chip8_curve"))]  //  If we are not rendering CHIP8 Emulator as curved surface...
fn get_bounding_box(virtual_left: u8, virtual_top: u8, virtual_right: u8, virtual_bottom: u8) -> (u8, u8, u8, u8) {
    let left: u8 = virtual_left as u8 * PIXEL_WIDTH as u8;
    let top: u8 = virtual_top as u8 * PIXEL_HEIGHT as u8; 
    let right: u8 = left + (virtual_right - virtual_left + 1) * PIXEL_WIDTH as u8 - 1;
    let bottom: u8 = top + (virtual_bottom - virtual_top + 1) * PIXEL_HEIGHT as u8 - 1;
    assert!(left < PHYSICAL_WIDTH as u8 && top < PHYSICAL_HEIGHT as u8 && right < PHYSICAL_WIDTH as u8 && bottom < PHYSICAL_HEIGHT as u8, "overflow");
    ( left, top, right, bottom )
}

/// Return Bounding Box of Physical Pixels (left, top, right, bottom) that correspond to the Virtual Pixels
#[cfg(feature = "chip8_curve")]  //  If we are rendering CHIP8 Emulator as curved surface...
fn get_bounding_box(virtual_left: u8, virtual_top: u8, virtual_right: u8, virtual_bottom: u8) -> (u8, u8, u8, u8) {
    //  One Virtual Pixel may map to multiple Physical Pixels, so we lookup the Physical Bounding Box.
    //  TODO: Handle wide and tall Bounding Boxes
    let physical_left_top = map_virtual_to_physical(virtual_left, virtual_top);  //  Returns (left,top,right,bottom)
    let physical_right_bottom = map_virtual_to_physical(virtual_right, virtual_bottom);

    let left: u8 = physical_left_top.0;
    let top: u8 = physical_left_top.1;
    let right: u8 = physical_right_bottom.2.min(PHYSICAL_WIDTH as u8 - 1);
    let bottom: u8 = physical_right_bottom.3.min(PHYSICAL_HEIGHT as u8 - 1);
    assert!(left < PHYSICAL_WIDTH as u8 && top < PHYSICAL_HEIGHT as u8 && right < PHYSICAL_WIDTH as u8 && bottom < PHYSICAL_HEIGHT as u8, "overflow");
    ( left, top, right, bottom )
}

/// Dimensions of the Physical To Virtual Map and Virtual To Physical Map
const PHYSICAL_TO_VIRTUAL_MAP_WIDTH: usize = PHYSICAL_WIDTH / 2;
const PHYSICAL_TO_VIRTUAL_MAP_HEIGHT: usize = PHYSICAL_HEIGHT / 2;
const VIRTUAL_TO_PHYSICAL_MAP_WIDTH: usize = SCREEN_WIDTH / 2;
const VIRTUAL_TO_PHYSICAL_MAP_HEIGHT: usize = SCREEN_HEIGHT / 2;

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

/// For each Virtual (x,y) Coordinate, return the Bounding Box (left, top, right, bottom) that encloses the corresponding Physical (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Physical Pixels to redraw when a Virtual Pixel is updated.
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
    (
        b2.0.min(PHYSICAL_WIDTH as u8 - 1),
        b2.1.min(PHYSICAL_HEIGHT as u8 - 1),
        b2.2.min(PHYSICAL_WIDTH as u8 - 1),
        b2.3.min(PHYSICAL_HEIGHT as u8 - 1),
    )    
}

/// Same as map_physical_to_virtual, except that (x,y) belongs to the X >= 0, Y >= 0 quadrant
fn map_physical_to_virtual_normalised(x: u8, y: u8) -> (u8, u8) {
    let x_index = x.min(PHYSICAL_TO_VIRTUAL_MAP_WIDTH as u8 - 1);
    let y_index = y.min(PHYSICAL_TO_VIRTUAL_MAP_HEIGHT as u8 - 1);
    let virtual_pixel = PHYSICAL_TO_VIRTUAL_MAP[y_index as usize][x_index as usize];  //  Returns (x,y)
    virtual_pixel
}

/// Same as map_virtual_to_physical, except that (x,y) belongs to the X >= 0, Y >= 0 quadrant
fn map_virtual_to_physical_normalised(x: u8, y: u8) -> (u8, u8, u8, u8) {
    let x_index = x.min(VIRTUAL_TO_PHYSICAL_MAP_WIDTH as u8 - 1);
    let y_index = y.min(VIRTUAL_TO_PHYSICAL_MAP_HEIGHT as u8 - 1);
    let physical_box = VIRTUAL_TO_PHYSICAL_MAP[y_index as usize][x_index as usize];  //  Returns (left,top,right,bottom)
    physical_box
}

/// For each Physical (x,y) Coordinate, return the corresponding Virtual (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Virtual Pixel to fetch the colour value when rendering a Physical Pixel.
/// Since X and Y are symmetric, this grid only covers one quadrant (X >= 0, Y >= 0)
#[cfg(feature = "chip8_curve")]  //  If we are rendering CHIP8 Emulator as curved surface...
static PHYSICAL_TO_VIRTUAL_MAP: &[[(u8,u8); PHYSICAL_TO_VIRTUAL_MAP_WIDTH]; PHYSICAL_TO_VIRTUAL_MAP_HEIGHT] = &  //  Row=Y, Col=X
//  Copied from output of https://github.com/lupyuen/interpolate-surface
[[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,0),(28,0),(29,0),(29,0),(29,0),(30,0),(30,0),(30,0),(31,0),(31,0),(31,0),(31,0),(32,0),(32,0),(32,0),(32,0),(32,0),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,0),(22,0),(23,0),(23,0),(23,0),(23,0),(24,0),(24,0),(24,0),(25,0),(25,0),(25,0),(26,0),(26,0),(26,0),(27,0),(27,0),(27,0),(28,0),(28,1),(28,1),(29,1),(29,1),(29,1),(30,1),(30,1),(30,1),(31,1),(31,1),(31,1),(31,1),(32,1),(32,1),(32,1),(32,1),(32,1),],
[(0,0),(0,0),(0,0),(0,0),(0,0),(1,0),(1,0),(1,0),(1,0),(2,0),(2,0),(2,0),(2,0),(3,0),(3,0),(3,0),(3,0),(4,0),(4,0),(4,0),(4,0),(5,0),(5,0),(5,0),(5,0),(6,0),(6,0),(6,0),(7,0),(7,0),(7,0),(7,0),(8,0),(8,0),(8,0),(8,0),(9,0),(9,0),(9,0),(9,0),(10,0),(10,0),(10,0),(10,0),(11,0),(11,0),(11,0),(12,0),(12,0),(12,0),(12,0),(13,0),(13,0),(13,0),(13,0),(14,0),(14,0),(14,0),(15,0),(15,0),(15,0),(15,0),(16,0),(16,0),(16,0),(17,0),(17,0),(17,0),(17,0),(18,0),(18,0),(18,0),(18,0),(19,0),(19,0),(19,0),(20,0),(20,0),(20,0),(20,0),(21,0),(21,0),(21,0),(22,0),(22,1),(22,1),(23,1),(23,1),(23,1),(24,1),(24,1),(24,1),(24,1),(25,1),(25,1),(25,1),(26,1),(26,1),(26,1),(27,1),(27,1),(27,1),(28,1),(28,1),(28,1),(29,1),(29,1),(29,1),(30,1),(30,1),(30,1),(31,1),(31,1),(31,1),(31,1),(32,1),(32,1),(32,1),(32,1),(32,1),],
[(0,1),(0,1),(0,1),(0,1),(0,1),(1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),(2,1),(3,1),(3,1),(3,1),(3,1),(4,1),(4,1),(4,1),(4,1),(5,1),(5,1),(5,1),(5,1),(6,1),(6,1),(6,1),(7,1),(7,1),(7,1),(7,1),(8,1),(8,1),(8,1),(8,1),(9,1),(9,1),(9,1),(9,1),(10,1),(10,1),(10,1),(10,1),(11,1),(11,1),(11,1),(12,1),(12,1),(12,1),(12,1),(13,1),(13,1),(13,1),(13,1),(14,1),(14,1),(14,1),(15,1),(15,1),(15,1),(15,1),(16,1),(16,1),(16,1),(17,1),(17,1),(17,1),(17,1),(18,1),(18,1),(18,1),(18,1),(19,1),(19,1),(19,1),(20,1),(20,1),(20,1),(20,1),(21,1),(21,1),(21,1),(22,1),(22,1),(22,1),(23,1),(23,1),(23,1),(24,1),(24,1),(24,1),(24,1),(25,1),(25,1),(25,1),(26,1),(26,1),(26,1),(27,1),(27,1),(27,1),(28,1),(28,1),(28,1),(29,1),(29,1),(29,1),(30,1),(30,1),(30,1),(31,1),(31,1),(31,1),(32,1),(32,1),(32,1),(32,1),(32,1),(32,1),],
[(0,1),(0,1),(0,1),(0,1),(0,1),(1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),(2,1),(3,1),(3,1),(3,1),(3,1),(4,1),(4,1),(4,1),(4,1),(5,1),(5,1),(5,1),(5,1),(6,1),(6,1),(6,1),(7,1),(7,1),(7,1),(7,1),(8,1),(8,1),(8,1),(8,1),(9,1),(9,1),(9,1),(9,1),(10,1),(10,1),(10,1),(10,1),(11,1),(11,1),(11,1),(12,1),(12,1),(12,1),(12,1),(13,1),(13,1),(13,1),(14,1),(14,1),(14,1),(14,1),(15,1),(15,1),(15,1),(15,1),(16,1),(16,1),(16,1),(17,1),(17,1),(17,1),(17,1),(18,1),(18,1),(18,1),(19,1),(19,1),(19,1),(19,1),(20,1),(20,1),(20,1),(20,1),(21,1),(21,1),(21,1),(22,1),(22,1),(22,1),(23,1),(23,1),(23,1),(24,1),(24,1),(24,1),(25,1),(25,1),(25,1),(25,1),(26,1),(26,1),(26,1),(27,1),(27,1),(27,1),(28,1),(28,1),(28,1),(29,1),(29,1),(29,1),(30,1),(30,1),(30,1),(31,1),(31,1),(31,1),(32,1),(32,1),(32,1),(32,1),(32,1),(32,1),],
[(0,1),(0,1),(0,1),(0,1),(0,1),(1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),(2,1),(3,1),(3,1),(3,1),(3,1),(4,1),(4,1),(4,1),(4,1),(5,1),(5,1),(5,1),(6,1),(6,1),(6,1),(6,1),(7,1),(7,1),(7,1),(7,1),(8,1),(8,1),(8,1),(8,1),(9,1),(9,1),(9,1),(9,1),(10,1),(10,1),(10,1),(10,1),(11,1),(11,1),(11,1),(12,1),(12,1),(12,1),(12,1),(13,1),(13,1),(13,1),(14,1),(14,1),(14,1),(14,1),(15,1),(15,1),(15,1),(15,1),(16,1),(16,1),(16,1),(17,1),(17,1),(17,1),(17,1),(18,1),(18,1),(18,1),(19,1),(19,1),(19,1),(19,1),(20,1),(20,1),(20,1),(20,1),(21,1),(21,1),(21,1),(22,1),(22,1),(22,1),(23,1),(23,1),(23,1),(24,1),(24,1),(24,1),(25,1),(25,1),(25,1),(25,1),(26,1),(26,1),(26,1),(27,1),(27,1),(27,1),(28,1),(28,1),(28,1),(29,1),(29,1),(29,1),(30,1),(30,1),(30,1),(31,1),(31,1),(31,1),(32,1),(32,1),(32,1),(32,1),(32,1),(32,1),],
[(0,1),(0,1),(0,1),(0,1),(0,1),(1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),(2,1),(3,1),(3,1),(3,1),(3,1),(4,1),(4,1),(4,1),(4,1),(5,1),(5,1),(5,1),(6,1),(6,1),(6,1),(6,1),(7,1),(7,1),(7,1),(7,1),(8,1),(8,1),(8,1),(8,1),(9,1),(9,1),(9,1),(9,1),(10,1),(10,1),(10,1),(10,1),(11,1),(11,1),(11,1),(12,1),(12,1),(12,1),(12,1),(13,1),(13,1),(13,1),(14,1),(14,1),(14,1),(14,1),(15,1),(15,1),(15,1),(15,1),(16,1),(16,1),(16,1),(17,1),(17,1),(17,1),(17,1),(18,1),(18,1),(18,1),(19,1),(19,1),(19,1),(19,1),(20,1),(20,1),(20,1),(21,1),(21,1),(21,1),(21,1),(22,1),(22,1),(22,1),(23,1),(23,1),(23,1),(24,1),(24,1),(24,1),(25,1),(25,1),(25,1),(26,1),(26,1),(26,1),(26,1),(27,1),(27,2),(27,2),(28,2),(28,2),(28,2),(29,2),(29,2),(29,2),(30,2),(30,2),(30,2),(31,2),(31,2),(31,2),(32,2),(32,2),(32,2),(32,2),(32,2),(32,2),],
[(0,1),(0,1),(0,1),(0,1),(0,1),(1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),(2,1),(3,1),(3,1),(3,1),(3,1),(4,1),(4,1),(4,1),(4,1),(5,1),(5,1),(5,1),(6,1),(6,1),(6,1),(6,1),(7,1),(7,1),(7,1),(7,1),(8,1),(8,1),(8,1),(8,1),(9,1),(9,1),(9,1),(9,1),(10,1),(10,1),(10,1),(11,1),(11,1),(11,1),(11,1),(12,1),(12,1),(12,1),(12,1),(13,1),(13,1),(13,1),(14,1),(14,1),(14,1),(14,1),(15,1),(15,1),(15,1),(16,1),(16,1),(16,1),(16,1),(17,1),(17,1),(17,1),(17,1),(18,1),(18,1),(18,1),(19,1),(19,1),(19,1),(19,1),(20,1),(20,1),(20,1),(21,1),(21,1),(21,1),(21,1),(22,1),(22,1),(22,1),(23,1),(23,2),(23,2),(24,2),(24,2),(24,2),(25,2),(25,2),(25,2),(26,2),(26,2),(26,2),(26,2),(27,2),(27,2),(27,2),(28,2),(28,2),(28,2),(29,2),(29,2),(29,2),(30,2),(30,2),(30,2),(31,2),(31,2),(31,2),(32,2),(32,2),(32,2),(32,2),(32,2),(32,2),],
[(0,1),(0,1),(0,1),(0,1),(0,1),(1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),(2,1),(3,1),(3,1),(3,1),(3,1),(4,1),(4,1),(4,1),(4,1),(5,1),(5,1),(5,1),(6,1),(6,1),(6,1),(6,1),(7,1),(7,1),(7,1),(7,1),(8,1),(8,1),(8,1),(8,1),(9,1),(9,1),(9,1),(9,1),(10,1),(10,1),(10,1),(11,1),(11,1),(11,1),(11,1),(12,1),(12,1),(12,1),(12,1),(13,1),(13,1),(13,2),(14,2),(14,2),(14,2),(14,2),(15,2),(15,2),(15,2),(16,2),(16,2),(16,2),(16,2),(17,2),(17,2),(17,2),(17,2),(18,2),(18,2),(18,2),(19,2),(19,2),(19,2),(19,2),(20,2),(20,2),(20,2),(21,2),(21,2),(21,2),(21,2),(22,2),(22,2),(22,2),(23,2),(23,2),(23,2),(24,2),(24,2),(24,2),(25,2),(25,2),(25,2),(26,2),(26,2),(26,2),(26,2),(27,2),(27,2),(27,2),(28,2),(28,2),(28,2),(29,2),(29,2),(29,2),(30,2),(30,2),(30,2),(31,2),(31,2),(31,2),(32,2),(32,2),(32,2),(32,2),(32,2),(32,2),],
[(0,2),(0,2),(0,2),(0,2),(0,2),(1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2),(2,2),(3,2),(3,2),(3,2),(3,2),(4,2),(4,2),(4,2),(4,2),(5,2),(5,2),(5,2),(6,2),(6,2),(6,2),(6,2),(7,2),(7,2),(7,2),(7,2),(8,2),(8,2),(8,2),(8,2),(9,2),(9,2),(9,2),(9,2),(10,2),(10,2),(10,2),(11,2),(11,2),(11,2),(11,2),(12,2),(12,2),(12,2),(12,2),(13,2),(13,2),(13,2),(14,2),(14,2),(14,2),(14,2),(15,2),(15,2),(15,2),(16,2),(16,2),(16,2),(16,2),(17,2),(17,2),(17,2),(17,2),(18,2),(18,2),(18,2),(19,2),(19,2),(19,2),(19,2),(20,2),(20,2),(20,2),(21,2),(21,2),(21,2),(21,2),(22,2),(22,2),(22,2),(23,2),(23,2),(23,2),(24,2),(24,2),(24,2),(25,2),(25,2),(25,2),(26,2),(26,2),(26,2),(27,2),(27,2),(27,2),(27,2),(28,2),(28,2),(28,2),(29,2),(29,2),(29,2),(30,2),(30,2),(30,2),(31,2),(31,2),(31,2),(32,2),(32,2),(32,2),(32,2),(32,2),(32,2),],
[(0,2),(0,2),(0,2),(0,2),(0,2),(1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2),(2,2),(3,2),(3,2),(3,2),(3,2),(4,2),(4,2),(4,2),(4,2),(5,2),(5,2),(5,2),(6,2),(6,2),(6,2),(6,2),(7,2),(7,2),(7,2),(7,2),(8,2),(8,2),(8,2),(8,2),(9,2),(9,2),(9,2),(9,2),(10,2),(10,2),(10,2),(11,2),(11,2),(11,2),(11,2),(12,2),(12,2),(12,2),(12,2),(13,2),(13,2),(13,2),(14,2),(14,2),(14,2),(14,2),(15,2),(15,2),(15,2),(16,2),(16,2),(16,2),(16,2),(17,2),(17,2),(17,2),(18,2),(18,2),(18,2),(18,2),(19,2),(19,2),(19,2),(19,2),(20,2),(20,2),(20,2),(21,2),(21,2),(21,2),(21,2),(22,2),(22,2),(22,2),(23,2),(23,2),(23,2),(24,2),(24,2),(24,2),(25,2),(25,2),(25,2),(26,2),(26,2),(26,2),(27,2),(27,2),(27,2),(27,2),(28,2),(28,2),(28,2),(29,2),(29,2),(29,2),(30,2),(30,2),(30,2),(31,3),(31,3),(31,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,2),],
[(0,2),(0,2),(0,2),(0,2),(0,2),(1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2),(2,2),(3,2),(3,2),(3,2),(3,2),(4,2),(4,2),(4,2),(5,2),(5,2),(5,2),(5,2),(6,2),(6,2),(6,2),(6,2),(7,2),(7,2),(7,2),(7,2),(8,2),(8,2),(8,2),(8,2),(9,2),(9,2),(9,2),(10,2),(10,2),(10,2),(10,2),(11,2),(11,2),(11,2),(11,2),(12,2),(12,2),(12,2),(13,2),(13,2),(13,2),(13,2),(14,2),(14,2),(14,2),(14,2),(15,2),(15,2),(15,2),(16,2),(16,2),(16,2),(16,2),(17,2),(17,2),(17,2),(18,2),(18,2),(18,2),(18,2),(19,2),(19,2),(19,2),(19,2),(20,2),(20,2),(20,2),(21,2),(21,2),(21,2),(22,2),(22,2),(22,2),(22,2),(23,2),(23,2),(23,2),(24,2),(24,2),(24,2),(25,2),(25,2),(25,2),(26,2),(26,2),(26,2),(27,2),(27,3),(27,3),(27,3),(28,3),(28,3),(28,3),(29,3),(29,3),(29,3),(30,3),(30,3),(30,3),(31,3),(31,3),(31,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),],
[(0,2),(0,2),(0,2),(0,2),(0,2),(1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2),(2,2),(3,2),(3,2),(3,2),(3,2),(4,2),(4,2),(4,2),(5,2),(5,2),(5,2),(5,2),(6,2),(6,2),(6,2),(6,2),(7,2),(7,2),(7,2),(7,2),(8,2),(8,2),(8,2),(8,2),(9,2),(9,2),(9,2),(10,2),(10,2),(10,2),(10,2),(11,2),(11,2),(11,2),(11,2),(12,2),(12,2),(12,2),(13,2),(13,2),(13,2),(13,2),(14,2),(14,2),(14,2),(14,2),(15,2),(15,2),(15,2),(16,2),(16,2),(16,2),(16,2),(17,2),(17,2),(17,2),(18,2),(18,2),(18,2),(18,2),(19,2),(19,2),(19,2),(19,2),(20,2),(20,2),(20,2),(21,2),(21,2),(21,2),(22,2),(22,2),(22,2),(22,2),(23,2),(23,2),(23,2),(24,3),(24,3),(24,3),(25,3),(25,3),(25,3),(26,3),(26,3),(26,3),(27,3),(27,3),(27,3),(28,3),(28,3),(28,3),(28,3),(29,3),(29,3),(29,3),(30,3),(30,3),(30,3),(31,3),(31,3),(31,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),],
[(0,2),(0,2),(0,2),(0,2),(0,2),(1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2),(2,2),(3,2),(3,2),(3,2),(3,2),(4,2),(4,2),(4,2),(5,2),(5,2),(5,2),(5,2),(6,2),(6,2),(6,2),(6,2),(7,2),(7,2),(7,2),(7,2),(8,2),(8,2),(8,2),(8,2),(9,2),(9,2),(9,2),(10,2),(10,2),(10,2),(10,2),(11,2),(11,2),(11,2),(11,2),(12,2),(12,2),(12,2),(13,2),(13,2),(13,2),(13,2),(14,2),(14,2),(14,2),(14,2),(15,2),(15,2),(15,2),(16,2),(16,2),(16,2),(16,2),(17,2),(17,2),(17,2),(18,2),(18,2),(18,2),(18,2),(19,2),(19,2),(19,2),(20,2),(20,2),(20,2),(20,3),(21,3),(21,3),(21,3),(22,3),(22,3),(22,3),(22,3),(23,3),(23,3),(23,3),(24,3),(24,3),(24,3),(25,3),(25,3),(25,3),(26,3),(26,3),(26,3),(27,3),(27,3),(27,3),(28,3),(28,3),(28,3),(28,3),(29,3),(29,3),(29,3),(30,3),(30,3),(30,3),(31,3),(31,3),(31,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),],
[(0,2),(0,2),(0,2),(0,2),(0,2),(1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2),(2,2),(3,2),(3,2),(3,2),(3,2),(4,2),(4,2),(4,2),(5,2),(5,2),(5,2),(5,2),(6,2),(6,2),(6,2),(6,2),(7,2),(7,2),(7,2),(7,2),(8,2),(8,2),(8,2),(8,2),(9,2),(9,2),(9,2),(10,2),(10,2),(10,2),(10,2),(11,2),(11,2),(11,2),(11,2),(12,2),(12,2),(12,2),(13,2),(13,2),(13,3),(13,3),(14,3),(14,3),(14,3),(15,3),(15,3),(15,3),(15,3),(16,3),(16,3),(16,3),(16,3),(17,3),(17,3),(17,3),(18,3),(18,3),(18,3),(18,3),(19,3),(19,3),(19,3),(20,3),(20,3),(20,3),(20,3),(21,3),(21,3),(21,3),(22,3),(22,3),(22,3),(22,3),(23,3),(23,3),(23,3),(24,3),(24,3),(24,3),(25,3),(25,3),(25,3),(26,3),(26,3),(26,3),(27,3),(27,3),(27,3),(28,3),(28,3),(28,3),(28,3),(29,3),(29,3),(29,3),(30,3),(30,3),(30,3),(31,3),(31,3),(31,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),],
[(0,2),(0,2),(0,2),(0,2),(0,2),(1,3),(1,3),(1,3),(1,3),(2,3),(2,3),(2,3),(2,3),(3,3),(3,3),(3,3),(3,3),(4,3),(4,3),(4,3),(5,3),(5,3),(5,3),(5,3),(6,3),(6,3),(6,3),(6,3),(7,3),(7,3),(7,3),(7,3),(8,3),(8,3),(8,3),(9,3),(9,3),(9,3),(9,3),(10,3),(10,3),(10,3),(10,3),(11,3),(11,3),(11,3),(11,3),(12,3),(12,3),(12,3),(13,3),(13,3),(13,3),(13,3),(14,3),(14,3),(14,3),(15,3),(15,3),(15,3),(15,3),(16,3),(16,3),(16,3),(16,3),(17,3),(17,3),(17,3),(18,3),(18,3),(18,3),(18,3),(19,3),(19,3),(19,3),(20,3),(20,3),(20,3),(20,3),(21,3),(21,3),(21,3),(22,3),(22,3),(22,3),(23,3),(23,3),(23,3),(23,3),(24,3),(24,3),(24,3),(25,3),(25,3),(25,3),(26,3),(26,3),(26,3),(27,3),(27,3),(27,3),(28,3),(28,3),(28,3),(29,3),(29,3),(29,3),(29,3),(30,4),(30,4),(30,4),(31,4),(31,4),(31,4),(32,4),(32,4),(32,4),(32,4),(32,4),(32,4),],
[(0,3),(0,3),(0,3),(0,3),(0,3),(1,3),(1,3),(1,3),(1,3),(2,3),(2,3),(2,3),(2,3),(3,3),(3,3),(3,3),(3,3),(4,3),(4,3),(4,3),(5,3),(5,3),(5,3),(5,3),(6,3),(6,3),(6,3),(6,3),(7,3),(7,3),(7,3),(7,3),(8,3),(8,3),(8,3),(9,3),(9,3),(9,3),(9,3),(10,3),(10,3),(10,3),(10,3),(11,3),(11,3),(11,3),(11,3),(12,3),(12,3),(12,3),(13,3),(13,3),(13,3),(13,3),(14,3),(14,3),(14,3),(15,3),(15,3),(15,3),(15,3),(16,3),(16,3),(16,3),(17,3),(17,3),(17,3),(17,3),(18,3),(18,3),(18,3),(18,3),(19,3),(19,3),(19,3),(20,3),(20,3),(20,3),(20,3),(21,3),(21,3),(21,3),(22,3),(22,3),(22,3),(23,3),(23,3),(23,3),(23,3),(24,3),(24,3),(24,3),(25,3),(25,3),(25,3),(26,3),(26,3),(26,3),(27,3),(27,4),(27,4),(28,4),(28,4),(28,4),(29,4),(29,4),(29,4),(29,4),(30,4),(30,4),(30,4),(31,4),(31,4),(31,4),(32,4),(32,4),(32,4),(32,4),(32,4),(32,4),],
[(0,3),(0,3),(0,3),(0,3),(0,3),(1,3),(1,3),(1,3),(1,3),(2,3),(2,3),(2,3),(2,3),(3,3),(3,3),(3,3),(3,3),(4,3),(4,3),(4,3),(5,3),(5,3),(5,3),(5,3),(6,3),(6,3),(6,3),(6,3),(7,3),(7,3),(7,3),(7,3),(8,3),(8,3),(8,3),(9,3),(9,3),(9,3),(9,3),(10,3),(10,3),(10,3),(10,3),(11,3),(11,3),(11,3),(12,3),(12,3),(12,3),(12,3),(13,3),(13,3),(13,3),(13,3),(14,3),(14,3),(14,3),(15,3),(15,3),(15,3),(15,3),(16,3),(16,3),(16,3),(17,3),(17,3),(17,3),(17,3),(18,3),(18,3),(18,3),(18,3),(19,3),(19,3),(19,3),(20,3),(20,3),(20,3),(20,3),(21,3),(21,3),(21,3),(22,3),(22,3),(22,3),(23,3),(23,3),(23,3),(24,3),(24,3),(24,4),(24,4),(25,4),(25,4),(25,4),(26,4),(26,4),(26,4),(27,4),(27,4),(27,4),(28,4),(28,4),(28,4),(29,4),(29,4),(29,4),(30,4),(30,4),(30,4),(30,4),(31,4),(31,4),(31,4),(32,4),(32,4),(32,4),(32,4),(32,4),(32,4),],
[(0,3),(0,3),(0,3),(0,3),(0,3),(1,3),(1,3),(1,3),(1,3),(2,3),(2,3),(2,3),(2,3),(3,3),(3,3),(3,3),(3,3),(4,3),(4,3),(4,3),(5,3),(5,3),(5,3),(5,3),(6,3),(6,3),(6,3),(6,3),(7,3),(7,3),(7,3),(7,3),(8,3),(8,3),(8,3),(9,3),(9,3),(9,3),(9,3),(10,3),(10,3),(10,3),(10,3),(11,3),(11,3),(11,3),(12,3),(12,3),(12,3),(12,3),(13,3),(13,3),(13,3),(13,3),(14,3),(14,3),(14,3),(15,3),(15,3),(15,3),(15,3),(16,3),(16,3),(16,3),(17,3),(17,3),(17,3),(17,3),(18,3),(18,3),(18,3),(18,3),(19,3),(19,3),(19,3),(20,3),(20,3),(20,3),(20,3),(21,3),(21,3),(21,3),(22,3),(22,4),(22,4),(23,4),(23,4),(23,4),(24,4),(24,4),(24,4),(25,4),(25,4),(25,4),(25,4),(26,4),(26,4),(26,4),(27,4),(27,4),(27,4),(28,4),(28,4),(28,4),(29,4),(29,4),(29,4),(30,4),(30,4),(30,4),(30,4),(31,4),(31,4),(31,4),(32,4),(32,4),(32,4),(32,4),(32,4),(32,4),],
[(0,3),(0,3),(0,3),(0,3),(0,3),(1,3),(1,3),(1,3),(1,3),(2,3),(2,3),(2,3),(2,3),(3,3),(3,3),(3,3),(3,3),(4,3),(4,3),(4,3),(5,3),(5,3),(5,3),(5,3),(6,3),(6,3),(6,3),(6,3),(7,3),(7,3),(7,3),(7,3),(8,3),(8,3),(8,3),(9,3),(9,3),(9,3),(9,3),(10,3),(10,3),(10,3),(10,3),(11,3),(11,3),(11,3),(12,3),(12,3),(12,3),(12,3),(13,3),(13,3),(13,3),(13,3),(14,3),(14,3),(14,3),(15,3),(15,3),(15,3),(15,3),(16,3),(16,3),(16,3),(17,3),(17,3),(17,3),(17,3),(18,4),(18,4),(18,4),(19,4),(19,4),(19,4),(19,4),(20,4),(20,4),(20,4),(20,4),(21,4),(21,4),(21,4),(22,4),(22,4),(22,4),(23,4),(23,4),(23,4),(24,4),(24,4),(24,4),(25,4),(25,4),(25,4),(26,4),(26,4),(26,4),(26,4),(27,4),(27,4),(27,4),(28,4),(28,4),(28,4),(29,4),(29,4),(29,4),(30,4),(30,4),(30,4),(30,4),(31,4),(31,4),(31,4),(32,4),(32,4),(32,4),(32,4),(32,4),(32,4),],
[(0,3),(0,3),(0,3),(0,3),(0,3),(1,3),(1,3),(1,3),(1,3),(2,3),(2,3),(2,3),(2,3),(3,3),(3,3),(3,3),(4,3),(4,3),(4,3),(4,3),(5,3),(5,3),(5,3),(5,3),(6,3),(6,3),(6,3),(6,3),(7,3),(7,3),(7,3),(8,3),(8,3),(8,3),(8,3),(9,3),(9,3),(9,3),(9,3),(10,3),(10,3),(10,3),(10,3),(11,3),(11,3),(11,3),(12,3),(12,3),(12,3),(12,3),(13,3),(13,3),(13,4),(14,4),(14,4),(14,4),(14,4),(15,4),(15,4),(15,4),(15,4),(16,4),(16,4),(16,4),(17,4),(17,4),(17,4),(17,4),(18,4),(18,4),(18,4),(19,4),(19,4),(19,4),(19,4),(20,4),(20,4),(20,4),(20,4),(21,4),(21,4),(21,4),(22,4),(22,4),(22,4),(23,4),(23,4),(23,4),(24,4),(24,4),(24,4),(25,4),(25,4),(25,4),(26,4),(26,4),(26,4),(27,4),(27,4),(27,4),(27,4),(28,4),(28,4),(28,4),(29,4),(29,4),(29,5),(30,5),(30,5),(30,5),(31,5),(31,5),(31,5),(31,5),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),],
[(0,3),(0,3),(0,3),(0,3),(0,3),(1,3),(1,3),(1,3),(1,3),(2,3),(2,3),(2,3),(2,3),(3,3),(3,3),(3,3),(4,3),(4,3),(4,3),(4,3),(5,3),(5,3),(5,3),(5,3),(6,3),(6,4),(6,4),(6,4),(7,4),(7,4),(7,4),(8,4),(8,4),(8,4),(8,4),(9,4),(9,4),(9,4),(9,4),(10,4),(10,4),(10,4),(10,4),(11,4),(11,4),(11,4),(12,4),(12,4),(12,4),(12,4),(13,4),(13,4),(13,4),(14,4),(14,4),(14,4),(14,4),(15,4),(15,4),(15,4),(15,4),(16,4),(16,4),(16,4),(17,4),(17,4),(17,4),(17,4),(18,4),(18,4),(18,4),(19,4),(19,4),(19,4),(19,4),(20,4),(20,4),(20,4),(21,4),(21,4),(21,4),(21,4),(22,4),(22,4),(22,4),(23,4),(23,4),(23,4),(24,4),(24,4),(24,4),(25,4),(25,4),(25,4),(26,4),(26,4),(26,4),(27,4),(27,5),(27,5),(28,5),(28,5),(28,5),(28,5),(29,5),(29,5),(29,5),(30,5),(30,5),(30,5),(31,5),(31,5),(31,5),(31,5),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),],
[(0,4),(0,4),(0,4),(0,4),(0,4),(1,4),(1,4),(1,4),(1,4),(2,4),(2,4),(2,4),(2,4),(3,4),(3,4),(3,4),(4,4),(4,4),(4,4),(4,4),(5,4),(5,4),(5,4),(5,4),(6,4),(6,4),(6,4),(6,4),(7,4),(7,4),(7,4),(8,4),(8,4),(8,4),(8,4),(9,4),(9,4),(9,4),(9,4),(10,4),(10,4),(10,4),(10,4),(11,4),(11,4),(11,4),(12,4),(12,4),(12,4),(12,4),(13,4),(13,4),(13,4),(14,4),(14,4),(14,4),(14,4),(15,4),(15,4),(15,4),(16,4),(16,4),(16,4),(16,4),(17,4),(17,4),(17,4),(17,4),(18,4),(18,4),(18,4),(19,4),(19,4),(19,4),(19,4),(20,4),(20,4),(20,4),(21,4),(21,4),(21,4),(21,4),(22,4),(22,4),(22,4),(23,4),(23,4),(23,4),(24,4),(24,4),(24,4),(25,5),(25,5),(25,5),(26,5),(26,5),(26,5),(27,5),(27,5),(27,5),(28,5),(28,5),(28,5),(28,5),(29,5),(29,5),(29,5),(30,5),(30,5),(30,5),(31,5),(31,5),(31,5),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),],
[(0,4),(0,4),(0,4),(0,4),(0,4),(1,4),(1,4),(1,4),(1,4),(2,4),(2,4),(2,4),(2,4),(3,4),(3,4),(3,4),(4,4),(4,4),(4,4),(4,4),(5,4),(5,4),(5,4),(5,4),(6,4),(6,4),(6,4),(6,4),(7,4),(7,4),(7,4),(8,4),(8,4),(8,4),(8,4),(9,4),(9,4),(9,4),(9,4),(10,4),(10,4),(10,4),(11,4),(11,4),(11,4),(11,4),(12,4),(12,4),(12,4),(12,4),(13,4),(13,4),(13,4),(14,4),(14,4),(14,4),(14,4),(15,4),(15,4),(15,4),(16,4),(16,4),(16,4),(16,4),(17,4),(17,4),(17,4),(17,4),(18,4),(18,4),(18,4),(19,4),(19,4),(19,4),(19,4),(20,4),(20,4),(20,4),(21,4),(21,4),(21,4),(21,4),(22,4),(22,4),(22,5),(23,5),(23,5),(23,5),(24,5),(24,5),(24,5),(25,5),(25,5),(25,5),(26,5),(26,5),(26,5),(27,5),(27,5),(27,5),(28,5),(28,5),(28,5),(29,5),(29,5),(29,5),(29,5),(30,5),(30,5),(30,5),(31,5),(31,5),(31,5),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),],
[(0,4),(0,4),(0,4),(0,4),(0,4),(1,4),(1,4),(1,4),(1,4),(2,4),(2,4),(2,4),(2,4),(3,4),(3,4),(3,4),(4,4),(4,4),(4,4),(4,4),(5,4),(5,4),(5,4),(5,4),(6,4),(6,4),(6,4),(6,4),(7,4),(7,4),(7,4),(8,4),(8,4),(8,4),(8,4),(9,4),(9,4),(9,4),(9,4),(10,4),(10,4),(10,4),(11,4),(11,4),(11,4),(11,4),(12,4),(12,4),(12,4),(12,4),(13,4),(13,4),(13,4),(14,4),(14,4),(14,4),(14,4),(15,4),(15,4),(15,4),(16,4),(16,4),(16,4),(16,4),(17,4),(17,4),(17,4),(18,4),(18,4),(18,4),(18,4),(19,4),(19,4),(19,4),(19,4),(20,4),(20,4),(20,5),(21,5),(21,5),(21,5),(21,5),(22,5),(22,5),(22,5),(23,5),(23,5),(23,5),(24,5),(24,5),(24,5),(25,5),(25,5),(25,5),(26,5),(26,5),(26,5),(27,5),(27,5),(27,5),(28,5),(28,5),(28,5),(29,5),(29,5),(29,5),(30,5),(30,5),(30,5),(30,5),(31,5),(31,5),(31,6),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),(32,5),],
[(0,4),(0,4),(0,4),(0,4),(0,4),(1,4),(1,4),(1,4),(1,4),(2,4),(2,4),(2,4),(2,4),(3,4),(3,4),(3,4),(4,4),(4,4),(4,4),(4,4),(5,4),(5,4),(5,4),(5,4),(6,4),(6,4),(6,4),(7,4),(7,4),(7,4),(7,4),(8,4),(8,4),(8,4),(8,4),(9,4),(9,4),(9,4),(9,4),(10,4),(10,4),(10,4),(11,4),(11,4),(11,4),(11,4),(12,4),(12,4),(12,4),(13,4),(13,4),(13,4),(13,4),(14,4),(14,4),(14,4),(14,4),(15,4),(15,4),(15,4),(16,4),(16,4),(16,4),(16,4),(17,4),(17,4),(17,5),(18,5),(18,5),(18,5),(18,5),(19,5),(19,5),(19,5),(19,5),(20,5),(20,5),(20,5),(21,5),(21,5),(21,5),(22,5),(22,5),(22,5),(23,5),(23,5),(23,5),(24,5),(24,5),(24,5),(25,5),(25,5),(25,5),(26,5),(26,5),(26,5),(26,5),(27,5),(27,5),(27,5),(28,5),(28,5),(28,5),(29,5),(29,6),(29,6),(30,6),(30,6),(30,6),(31,6),(31,6),(31,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,5),(32,5),(32,5),],
[(0,4),(0,4),(0,4),(0,4),(0,4),(1,4),(1,4),(1,4),(1,4),(2,4),(2,4),(2,4),(2,4),(3,4),(3,4),(3,4),(4,4),(4,4),(4,4),(4,4),(5,4),(5,4),(5,4),(5,4),(6,4),(6,4),(6,4),(7,4),(7,4),(7,4),(7,4),(8,4),(8,4),(8,4),(8,4),(9,4),(9,4),(9,4),(9,4),(10,4),(10,4),(10,4),(11,4),(11,4),(11,4),(11,4),(12,4),(12,4),(12,4),(13,4),(13,4),(13,4),(13,4),(14,5),(14,5),(14,5),(15,5),(15,5),(15,5),(15,5),(16,5),(16,5),(16,5),(16,5),(17,5),(17,5),(17,5),(18,5),(18,5),(18,5),(18,5),(19,5),(19,5),(19,5),(20,5),(20,5),(20,5),(20,5),(21,5),(21,5),(21,5),(22,5),(22,5),(22,5),(23,5),(23,5),(23,5),(24,5),(24,5),(24,5),(25,5),(25,5),(25,5),(26,5),(26,5),(26,5),(27,5),(27,6),(27,6),(27,6),(28,6),(28,6),(28,6),(29,6),(29,6),(29,6),(30,6),(30,6),(30,6),(31,6),(31,6),(31,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),],
[(0,4),(0,4),(0,4),(0,4),(0,4),(1,4),(1,4),(1,4),(1,4),(2,4),(2,4),(2,4),(2,4),(3,4),(3,4),(3,4),(4,4),(4,4),(4,4),(4,4),(5,4),(5,4),(5,4),(5,4),(6,4),(6,4),(6,4),(7,4),(7,4),(7,4),(7,4),(8,4),(8,4),(8,4),(8,4),(9,4),(9,4),(9,4),(9,5),(10,5),(10,5),(10,5),(11,5),(11,5),(11,5),(11,5),(12,5),(12,5),(12,5),(13,5),(13,5),(13,5),(13,5),(14,5),(14,5),(14,5),(15,5),(15,5),(15,5),(15,5),(16,5),(16,5),(16,5),(17,5),(17,5),(17,5),(17,5),(18,5),(18,5),(18,5),(18,5),(19,5),(19,5),(19,5),(20,5),(20,5),(20,5),(20,5),(21,5),(21,5),(21,5),(22,5),(22,5),(22,5),(23,5),(23,5),(23,5),(24,5),(24,5),(24,5),(25,5),(25,6),(25,6),(26,6),(26,6),(26,6),(27,6),(27,6),(27,6),(28,6),(28,6),(28,6),(29,6),(29,6),(29,6),(29,6),(30,6),(30,6),(30,6),(31,6),(31,6),(31,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),],
[(0,5),(0,5),(0,5),(0,5),(0,5),(1,5),(1,5),(1,5),(1,5),(2,5),(2,5),(2,5),(2,5),(3,5),(3,5),(3,5),(4,5),(4,5),(4,5),(4,5),(5,5),(5,5),(5,5),(5,5),(6,5),(6,5),(6,5),(7,5),(7,5),(7,5),(7,5),(8,5),(8,5),(8,5),(8,5),(9,5),(9,5),(9,5),(9,5),(10,5),(10,5),(10,5),(11,5),(11,5),(11,5),(11,5),(12,5),(12,5),(12,5),(13,5),(13,5),(13,5),(13,5),(14,5),(14,5),(14,5),(15,5),(15,5),(15,5),(15,5),(16,5),(16,5),(16,5),(17,5),(17,5),(17,5),(17,5),(18,5),(18,5),(18,5),(18,5),(19,5),(19,5),(19,5),(20,5),(20,5),(20,5),(20,5),(21,5),(21,5),(21,5),(22,5),(22,5),(22,5),(23,5),(23,6),(23,6),(24,6),(24,6),(24,6),(25,6),(25,6),(25,6),(26,6),(26,6),(26,6),(27,6),(27,6),(27,6),(28,6),(28,6),(28,6),(29,6),(29,6),(29,6),(30,6),(30,6),(30,6),(31,6),(31,6),(31,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),],
[(0,5),(0,5),(0,5),(0,5),(0,5),(1,5),(1,5),(1,5),(1,5),(2,5),(2,5),(2,5),(3,5),(3,5),(3,5),(3,5),(4,5),(4,5),(4,5),(4,5),(5,5),(5,5),(5,5),(5,5),(6,5),(6,5),(6,5),(7,5),(7,5),(7,5),(7,5),(8,5),(8,5),(8,5),(8,5),(9,5),(9,5),(9,5),(10,5),(10,5),(10,5),(10,5),(11,5),(11,5),(11,5),(11,5),(12,5),(12,5),(12,5),(13,5),(13,5),(13,5),(13,5),(14,5),(14,5),(14,5),(15,5),(15,5),(15,5),(15,5),(16,5),(16,5),(16,5),(17,5),(17,5),(17,5),(17,5),(18,5),(18,5),(18,5),(19,5),(19,5),(19,5),(19,5),(20,5),(20,5),(20,5),(20,5),(21,5),(21,5),(21,5),(22,6),(22,6),(22,6),(23,6),(23,6),(23,6),(24,6),(24,6),(24,6),(25,6),(25,6),(25,6),(26,6),(26,6),(26,6),(27,6),(27,6),(27,6),(28,6),(28,6),(28,6),(29,6),(29,6),(29,6),(30,6),(30,6),(30,6),(31,6),(31,6),(31,7),(32,7),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),(32,6),],
[(0,5),(0,5),(0,5),(0,5),(0,5),(1,5),(1,5),(1,5),(1,5),(2,5),(2,5),(2,5),(3,5),(3,5),(3,5),(3,5),(4,5),(4,5),(4,5),(4,5),(5,5),(5,5),(5,5),(6,5),(6,5),(6,5),(6,5),(7,5),(7,5),(7,5),(7,5),(8,5),(8,5),(8,5),(8,5),(9,5),(9,5),(9,5),(10,5),(10,5),(10,5),(10,5),(11,5),(11,5),(11,5),(12,5),(12,5),(12,5),(12,5),(13,5),(13,5),(13,5),(14,5),(14,5),(14,5),(14,5),(15,5),(15,5),(15,5),(15,5),(16,5),(16,5),(16,5),(17,5),(17,5),(17,5),(17,5),(18,5),(18,5),(18,5),(19,5),(19,5),(19,5),(19,5),(20,5),(20,5),(20,5),(21,6),(21,6),(21,6),(22,6),(22,6),(22,6),(23,6),(23,6),(23,6),(24,6),(24,6),(24,6),(25,6),(25,6),(25,6),(26,6),(26,6),(26,6),(27,6),(27,6),(27,6),(27,6),(28,6),(28,6),(28,6),(29,6),(29,7),(29,7),(30,7),(30,7),(30,7),(31,7),(31,7),(31,7),(32,7),(32,7),(32,7),(32,7),(32,6),(32,6),(32,6),(32,6),(32,6),],
[(0,5),(0,5),(0,5),(0,5),(0,5),(1,5),(1,5),(1,5),(1,5),(2,5),(2,5),(2,5),(3,5),(3,5),(3,5),(3,5),(4,5),(4,5),(4,5),(4,5),(5,5),(5,5),(5,5),(6,5),(6,5),(6,5),(6,5),(7,5),(7,5),(7,5),(7,5),(8,5),(8,5),(8,5),(9,5),(9,5),(9,5),(9,5),(10,5),(10,5),(10,5),(10,5),(11,5),(11,5),(11,5),(12,5),(12,5),(12,5),(12,5),(13,5),(13,5),(13,5),(14,5),(14,5),(14,5),(14,5),(15,5),(15,5),(15,5),(16,5),(16,5),(16,5),(16,5),(17,5),(17,5),(17,5),(17,5),(18,6),(18,6),(18,6),(19,6),(19,6),(19,6),(19,6),(20,6),(20,6),(20,6),(21,6),(21,6),(21,6),(22,6),(22,6),(22,6),(23,6),(23,6),(23,6),(24,6),(24,6),(24,6),(25,6),(25,6),(25,6),(26,6),(26,6),(26,6),(27,6),(27,7),(27,7),(28,7),(28,7),(28,7),(29,7),(29,7),(29,7),(30,7),(30,7),(30,7),(31,7),(31,7),(31,7),(31,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,6),],
[(0,5),(0,5),(0,5),(0,5),(0,5),(1,5),(1,5),(1,5),(1,5),(2,5),(2,5),(2,5),(3,5),(3,5),(3,5),(3,5),(4,5),(4,5),(4,5),(4,5),(5,5),(5,5),(5,5),(6,5),(6,5),(6,5),(6,5),(7,5),(7,5),(7,5),(7,5),(8,5),(8,5),(8,5),(9,5),(9,5),(9,5),(9,5),(10,5),(10,5),(10,5),(10,5),(11,5),(11,5),(11,5),(12,5),(12,5),(12,5),(12,5),(13,5),(13,5),(13,5),(14,5),(14,5),(14,6),(14,6),(15,6),(15,6),(15,6),(16,6),(16,6),(16,6),(16,6),(17,6),(17,6),(17,6),(18,6),(18,6),(18,6),(18,6),(19,6),(19,6),(19,6),(20,6),(20,6),(20,6),(20,6),(21,6),(21,6),(21,6),(22,6),(22,6),(22,6),(23,6),(23,6),(23,6),(24,6),(24,6),(24,6),(25,6),(25,6),(25,7),(26,7),(26,7),(26,7),(27,7),(27,7),(27,7),(28,7),(28,7),(28,7),(29,7),(29,7),(29,7),(30,7),(30,7),(30,7),(31,7),(31,7),(31,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),],
[(0,5),(0,5),(0,5),(0,5),(0,5),(1,5),(1,5),(1,5),(1,5),(2,5),(2,5),(2,5),(3,5),(3,5),(3,5),(3,5),(4,5),(4,5),(4,5),(4,5),(5,5),(5,5),(5,5),(6,5),(6,5),(6,5),(6,5),(7,5),(7,5),(7,5),(7,5),(8,5),(8,5),(8,5),(9,5),(9,5),(9,5),(9,6),(10,6),(10,6),(10,6),(10,6),(11,6),(11,6),(11,6),(12,6),(12,6),(12,6),(12,6),(13,6),(13,6),(13,6),(14,6),(14,6),(14,6),(14,6),(15,6),(15,6),(15,6),(16,6),(16,6),(16,6),(16,6),(17,6),(17,6),(17,6),(18,6),(18,6),(18,6),(18,6),(19,6),(19,6),(19,6),(20,6),(20,6),(20,6),(20,6),(21,6),(21,6),(21,6),(22,6),(22,6),(22,6),(23,6),(23,6),(23,6),(24,6),(24,7),(24,7),(25,7),(25,7),(25,7),(26,7),(26,7),(26,7),(27,7),(27,7),(27,7),(28,7),(28,7),(28,7),(29,7),(29,7),(29,7),(30,7),(30,7),(30,7),(31,7),(31,7),(31,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),],
[(0,6),(0,6),(0,6),(0,6),(0,6),(1,6),(1,6),(1,6),(1,6),(2,6),(2,6),(2,6),(3,6),(3,6),(3,6),(3,6),(4,6),(4,6),(4,6),(4,6),(5,6),(5,6),(5,6),(6,6),(6,6),(6,6),(6,6),(7,6),(7,6),(7,6),(7,6),(8,6),(8,6),(8,6),(9,6),(9,6),(9,6),(9,6),(10,6),(10,6),(10,6),(11,6),(11,6),(11,6),(11,6),(12,6),(12,6),(12,6),(13,6),(13,6),(13,6),(13,6),(14,6),(14,6),(14,6),(14,6),(15,6),(15,6),(15,6),(16,6),(16,6),(16,6),(16,6),(17,6),(17,6),(17,6),(18,6),(18,6),(18,6),(18,6),(19,6),(19,6),(19,6),(20,6),(20,6),(20,6),(21,6),(21,6),(21,6),(21,6),(22,6),(22,6),(22,6),(23,6),(23,7),(23,7),(24,7),(24,7),(25,7),(25,7),(25,7),(26,7),(26,7),(26,7),(27,7),(27,7),(27,7),(28,7),(28,7),(28,7),(29,7),(29,7),(29,7),(30,7),(30,7),(30,7),(30,7),(31,7),(31,8),(31,8),(32,8),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),],
[(0,6),(0,6),(0,6),(0,6),(0,6),(1,6),(1,6),(1,6),(1,6),(2,6),(2,6),(2,6),(3,6),(3,6),(3,6),(3,6),(4,6),(4,6),(4,6),(4,6),(5,6),(5,6),(5,6),(6,6),(6,6),(6,6),(6,6),(7,6),(7,6),(7,6),(8,6),(8,6),(8,6),(8,6),(9,6),(9,6),(9,6),(9,6),(10,6),(10,6),(10,6),(11,6),(11,6),(11,6),(11,6),(12,6),(12,6),(12,6),(13,6),(13,6),(13,6),(13,6),(14,6),(14,6),(14,6),(15,6),(15,6),(15,6),(15,6),(16,6),(16,6),(16,6),(17,6),(17,6),(17,6),(17,6),(18,6),(18,6),(18,6),(19,6),(19,6),(19,6),(19,6),(20,6),(20,6),(20,6),(21,6),(21,6),(21,6),(22,6),(22,6),(22,7),(23,7),(23,7),(23,7),(24,7),(24,7),(24,7),(25,7),(25,7),(25,7),(26,7),(26,7),(26,7),(27,7),(27,7),(27,7),(28,7),(28,7),(28,7),(29,7),(29,8),(29,8),(30,8),(30,8),(30,8),(31,8),(31,8),(31,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,7),(32,7),(32,7),(32,7),(32,7),(32,7),],
[(0,6),(0,6),(0,6),(0,6),(0,6),(1,6),(1,6),(1,6),(1,6),(2,6),(2,6),(2,6),(3,6),(3,6),(3,6),(3,6),(4,6),(4,6),(4,6),(5,6),(5,6),(5,6),(5,6),(6,6),(6,6),(6,6),(6,6),(7,6),(7,6),(7,6),(8,6),(8,6),(8,6),(8,6),(9,6),(9,6),(9,6),(9,6),(10,6),(10,6),(10,6),(11,6),(11,6),(11,6),(11,6),(12,6),(12,6),(12,6),(13,6),(13,6),(13,6),(13,6),(14,6),(14,6),(14,6),(15,6),(15,6),(15,6),(15,6),(16,6),(16,6),(16,6),(17,6),(17,6),(17,6),(17,6),(18,6),(18,6),(18,6),(19,6),(19,6),(19,6),(19,6),(20,6),(20,6),(20,6),(21,6),(21,7),(21,7),(22,7),(22,7),(22,7),(23,7),(23,7),(23,7),(24,7),(24,7),(24,7),(25,7),(25,7),(25,7),(26,7),(26,7),(26,7),(27,7),(27,7),(27,8),(28,8),(28,8),(28,8),(29,8),(29,8),(29,8),(30,8),(30,8),(30,8),(31,8),(31,8),(31,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,7),(32,7),(32,7),],
[(0,6),(0,6),(0,6),(0,6),(0,6),(1,6),(1,6),(1,6),(1,6),(2,6),(2,6),(2,6),(3,6),(3,6),(3,6),(3,6),(4,6),(4,6),(4,6),(5,6),(5,6),(5,6),(5,6),(6,6),(6,6),(6,6),(6,6),(7,6),(7,6),(7,6),(8,6),(8,6),(8,6),(8,6),(9,6),(9,6),(9,6),(10,6),(10,6),(10,6),(10,6),(11,6),(11,6),(11,6),(11,6),(12,6),(12,6),(12,6),(13,6),(13,6),(13,6),(13,6),(14,6),(14,6),(14,6),(15,6),(15,6),(15,6),(15,6),(16,6),(16,6),(16,6),(17,6),(17,6),(17,6),(17,6),(18,6),(18,6),(18,6),(19,6),(19,7),(19,7),(19,7),(20,7),(20,7),(20,7),(21,7),(21,7),(21,7),(22,7),(22,7),(22,7),(23,7),(23,7),(23,7),(24,7),(24,7),(24,7),(25,7),(25,7),(25,7),(26,7),(26,7),(26,8),(27,8),(27,8),(27,8),(28,8),(28,8),(28,8),(29,8),(29,8),(29,8),(30,8),(30,8),(30,8),(31,8),(31,8),(31,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),],
[(0,6),(0,6),(0,6),(0,6),(0,6),(1,6),(1,6),(1,6),(1,6),(2,6),(2,6),(2,6),(3,6),(3,6),(3,6),(3,6),(4,6),(4,6),(4,6),(5,6),(5,6),(5,6),(5,6),(6,6),(6,6),(6,6),(6,6),(7,6),(7,6),(7,6),(8,6),(8,6),(8,6),(8,6),(9,6),(9,6),(9,6),(10,6),(10,6),(10,6),(10,6),(11,6),(11,6),(11,6),(12,6),(12,6),(12,6),(12,6),(13,6),(13,6),(13,6),(14,6),(14,6),(14,6),(14,6),(15,6),(15,6),(15,7),(16,7),(16,7),(16,7),(16,7),(17,7),(17,7),(17,7),(18,7),(18,7),(18,7),(18,7),(19,7),(19,7),(19,7),(20,7),(20,7),(20,7),(20,7),(21,7),(21,7),(21,7),(22,7),(22,7),(22,7),(23,7),(23,7),(23,7),(24,7),(24,7),(24,7),(25,7),(25,8),(25,8),(26,8),(26,8),(27,8),(27,8),(27,8),(28,8),(28,8),(28,8),(29,8),(29,8),(29,8),(30,8),(30,8),(30,8),(31,8),(31,8),(31,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),],
[(0,6),(0,6),(0,6),(0,6),(0,6),(1,6),(1,6),(1,6),(1,6),(2,6),(2,6),(2,6),(3,6),(3,6),(3,6),(3,6),(4,6),(4,6),(4,6),(5,6),(5,6),(5,6),(5,6),(6,6),(6,6),(6,6),(7,6),(7,6),(7,6),(7,6),(8,6),(8,6),(8,6),(8,7),(9,7),(9,7),(9,7),(10,7),(10,7),(10,7),(10,7),(11,7),(11,7),(11,7),(12,7),(12,7),(12,7),(12,7),(13,7),(13,7),(13,7),(14,7),(14,7),(14,7),(14,7),(15,7),(15,7),(15,7),(16,7),(16,7),(16,7),(16,7),(17,7),(17,7),(17,7),(18,7),(18,7),(18,7),(18,7),(19,7),(19,7),(19,7),(20,7),(20,7),(20,7),(21,7),(21,7),(21,7),(21,7),(22,7),(22,7),(22,7),(23,7),(23,7),(23,7),(24,7),(24,8),(25,8),(25,8),(25,8),(26,8),(26,8),(26,8),(27,8),(27,8),(27,8),(28,8),(28,8),(28,8),(29,8),(29,8),(29,8),(30,8),(30,8),(30,8),(31,9),(31,9),(31,9),(32,9),(32,9),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),],
[(0,6),(0,6),(0,6),(0,6),(0,6),(1,7),(1,7),(1,7),(1,7),(2,7),(2,7),(2,7),(3,7),(3,7),(3,7),(3,7),(4,7),(4,7),(4,7),(5,7),(5,7),(5,7),(5,7),(6,7),(6,7),(6,7),(7,7),(7,7),(7,7),(7,7),(8,7),(8,7),(8,7),(9,7),(9,7),(9,7),(9,7),(10,7),(10,7),(10,7),(10,7),(11,7),(11,7),(11,7),(12,7),(12,7),(12,7),(12,7),(13,7),(13,7),(13,7),(14,7),(14,7),(14,7),(14,7),(15,7),(15,7),(15,7),(16,7),(16,7),(16,7),(16,7),(17,7),(17,7),(17,7),(18,7),(18,7),(18,7),(18,7),(19,7),(19,7),(19,7),(20,7),(20,7),(20,7),(21,7),(21,7),(21,7),(22,7),(22,7),(22,7),(23,7),(23,7),(23,8),(24,8),(24,8),(24,8),(25,8),(25,8),(25,8),(26,8),(26,8),(26,8),(27,8),(27,8),(27,8),(28,8),(28,8),(28,8),(29,8),(29,8),(29,9),(30,9),(30,9),(30,9),(31,9),(31,9),(31,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),(32,8),],
[(0,7),(0,7),(0,7),(0,7),(0,7),(1,7),(1,7),(1,7),(2,7),(2,7),(2,7),(2,7),(3,7),(3,7),(3,7),(3,7),(4,7),(4,7),(4,7),(5,7),(5,7),(5,7),(5,7),(6,7),(6,7),(6,7),(7,7),(7,7),(7,7),(7,7),(8,7),(8,7),(8,7),(9,7),(9,7),(9,7),(9,7),(10,7),(10,7),(10,7),(11,7),(11,7),(11,7),(11,7),(12,7),(12,7),(12,7),(13,7),(13,7),(13,7),(13,7),(14,7),(14,7),(14,7),(15,7),(15,7),(15,7),(15,7),(16,7),(16,7),(16,7),(17,7),(17,7),(17,7),(17,7),(18,7),(18,7),(18,7),(19,7),(19,7),(19,7),(19,7),(20,7),(20,7),(20,7),(21,7),(21,7),(21,7),(22,7),(22,7),(22,7),(23,8),(23,8),(23,8),(24,8),(24,8),(24,8),(25,8),(25,8),(25,8),(26,8),(26,8),(26,8),(27,8),(27,8),(27,8),(28,8),(28,9),(28,9),(29,9),(29,9),(30,9),(30,9),(30,9),(31,9),(31,9),(31,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,8),(32,8),(32,8),(32,8),],
[(0,7),(0,7),(0,7),(0,7),(0,7),(1,7),(1,7),(1,7),(2,7),(2,7),(2,7),(2,7),(3,7),(3,7),(3,7),(3,7),(4,7),(4,7),(4,7),(5,7),(5,7),(5,7),(5,7),(6,7),(6,7),(6,7),(7,7),(7,7),(7,7),(7,7),(8,7),(8,7),(8,7),(9,7),(9,7),(9,7),(9,7),(10,7),(10,7),(10,7),(11,7),(11,7),(11,7),(11,7),(12,7),(12,7),(12,7),(13,7),(13,7),(13,7),(13,7),(14,7),(14,7),(14,7),(15,7),(15,7),(15,7),(15,7),(16,7),(16,7),(16,7),(17,7),(17,7),(17,7),(17,7),(18,7),(18,7),(18,7),(19,7),(19,7),(19,7),(19,7),(20,7),(20,7),(20,7),(21,7),(21,7),(21,8),(22,8),(22,8),(22,8),(23,8),(23,8),(23,8),(24,8),(24,8),(24,8),(25,8),(25,8),(25,8),(26,8),(26,8),(27,8),(27,8),(27,9),(28,9),(28,9),(28,9),(29,9),(29,9),(29,9),(30,9),(30,9),(30,9),(31,9),(31,9),(31,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,8),],
[(0,7),(0,7),(0,7),(0,7),(0,7),(1,7),(1,7),(1,7),(2,7),(2,7),(2,7),(2,7),(3,7),(3,7),(3,7),(4,7),(4,7),(4,7),(4,7),(5,7),(5,7),(5,7),(5,7),(6,7),(6,7),(6,7),(7,7),(7,7),(7,7),(7,7),(8,7),(8,7),(8,7),(9,7),(9,7),(9,7),(9,7),(10,7),(10,7),(10,7),(11,7),(11,7),(11,7),(11,7),(12,7),(12,7),(12,7),(13,7),(13,7),(13,7),(13,7),(14,7),(14,7),(14,7),(15,7),(15,7),(15,7),(15,7),(16,7),(16,7),(16,7),(17,7),(17,7),(17,7),(17,7),(18,7),(18,7),(18,7),(19,7),(19,7),(19,7),(20,7),(20,8),(20,8),(20,8),(21,8),(21,8),(21,8),(22,8),(22,8),(22,8),(23,8),(23,8),(23,8),(24,8),(24,8),(24,8),(25,8),(25,8),(26,8),(26,8),(26,9),(27,9),(27,9),(27,9),(28,9),(28,9),(28,9),(29,9),(29,9),(29,9),(30,9),(30,9),(30,9),(31,9),(31,9),(31,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),],
[(0,7),(0,7),(0,7),(0,7),(0,7),(1,7),(1,7),(1,7),(2,7),(2,7),(2,7),(2,7),(3,7),(3,7),(3,7),(4,7),(4,7),(4,7),(4,7),(5,7),(5,7),(5,7),(6,7),(6,7),(6,7),(6,7),(7,7),(7,7),(7,7),(7,7),(8,7),(8,7),(8,7),(9,7),(9,7),(9,7),(9,7),(10,7),(10,7),(10,7),(11,7),(11,7),(11,7),(11,7),(12,7),(12,7),(12,7),(13,7),(13,7),(13,7),(13,7),(14,7),(14,7),(14,7),(15,7),(15,7),(15,7),(16,7),(16,7),(16,7),(16,8),(17,8),(17,8),(17,8),(18,8),(18,8),(18,8),(18,8),(19,8),(19,8),(19,8),(20,8),(20,8),(20,8),(20,8),(21,8),(21,8),(21,8),(22,8),(22,8),(22,8),(23,8),(23,8),(23,8),(24,8),(24,8),(25,8),(25,8),(25,9),(26,9),(26,9),(26,9),(27,9),(27,9),(27,9),(28,9),(28,9),(28,9),(29,9),(29,9),(29,9),(30,9),(30,9),(30,9),(31,10),(31,10),(31,10),(32,10),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),],
[(0,7),(0,7),(0,7),(0,7),(0,7),(1,7),(1,7),(1,7),(2,7),(2,7),(2,7),(2,7),(3,7),(3,7),(3,7),(4,7),(4,7),(4,7),(4,7),(5,7),(5,7),(5,7),(6,7),(6,7),(6,7),(6,7),(7,7),(7,7),(7,7),(8,7),(8,8),(8,8),(8,8),(9,8),(9,8),(9,8),(10,8),(10,8),(10,8),(10,8),(11,8),(11,8),(11,8),(12,8),(12,8),(12,8),(12,8),(13,8),(13,8),(13,8),(14,8),(14,8),(14,8),(14,8),(15,8),(15,8),(15,8),(16,8),(16,8),(16,8),(16,8),(17,8),(17,8),(17,8),(18,8),(18,8),(18,8),(18,8),(19,8),(19,8),(19,8),(20,8),(20,8),(20,8),(21,8),(21,8),(21,8),(21,8),(22,8),(22,8),(22,8),(23,8),(23,8),(24,8),(24,8),(24,9),(25,9),(25,9),(25,9),(26,9),(26,9),(26,9),(27,9),(27,9),(27,9),(28,9),(28,9),(29,9),(29,9),(29,9),(30,10),(30,10),(30,10),(31,10),(31,10),(31,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),(32,9),],
[(0,7),(0,7),(0,7),(0,7),(0,7),(1,7),(1,7),(1,7),(2,8),(2,8),(2,8),(2,8),(3,8),(3,8),(3,8),(4,8),(4,8),(4,8),(4,8),(5,8),(5,8),(5,8),(6,8),(6,8),(6,8),(6,8),(7,8),(7,8),(7,8),(8,8),(8,8),(8,8),(8,8),(9,8),(9,8),(9,8),(10,8),(10,8),(10,8),(10,8),(11,8),(11,8),(11,8),(12,8),(12,8),(12,8),(12,8),(13,8),(13,8),(13,8),(14,8),(14,8),(14,8),(14,8),(15,8),(15,8),(15,8),(16,8),(16,8),(16,8),(16,8),(17,8),(17,8),(17,8),(18,8),(18,8),(18,8),(18,8),(19,8),(19,8),(19,8),(20,8),(20,8),(20,8),(21,8),(21,8),(21,8),(22,8),(22,8),(22,8),(23,8),(23,8),(23,8),(24,9),(24,9),(24,9),(25,9),(25,9),(25,9),(26,9),(26,9),(27,9),(27,9),(27,9),(28,9),(28,9),(28,9),(29,10),(29,10),(29,10),(30,10),(30,10),(30,10),(31,10),(31,10),(31,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,9),(32,9),(32,9),(32,9),(32,9),],
[(0,8),(0,8),(0,8),(0,8),(0,8),(1,8),(1,8),(1,8),(2,8),(2,8),(2,8),(2,8),(3,8),(3,8),(3,8),(4,8),(4,8),(4,8),(4,8),(5,8),(5,8),(5,8),(6,8),(6,8),(6,8),(6,8),(7,8),(7,8),(7,8),(8,8),(8,8),(8,8),(8,8),(9,8),(9,8),(9,8),(10,8),(10,8),(10,8),(10,8),(11,8),(11,8),(11,8),(12,8),(12,8),(12,8),(12,8),(13,8),(13,8),(13,8),(14,8),(14,8),(14,8),(14,8),(15,8),(15,8),(15,8),(16,8),(16,8),(16,8),(16,8),(17,8),(17,8),(17,8),(18,8),(18,8),(18,8),(19,8),(19,8),(19,8),(19,8),(20,8),(20,8),(20,8),(21,8),(21,8),(21,8),(22,8),(22,8),(22,8),(23,9),(23,9),(23,9),(24,9),(24,9),(24,9),(25,9),(25,9),(26,9),(26,9),(26,9),(27,9),(27,9),(27,9),(28,10),(28,10),(28,10),(29,10),(29,10),(29,10),(30,10),(30,10),(30,10),(31,10),(31,10),(31,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,9),(32,9),],
[(0,8),(0,8),(0,8),(0,8),(0,8),(1,8),(1,8),(1,8),(2,8),(2,8),(2,8),(2,8),(3,8),(3,8),(3,8),(4,8),(4,8),(4,8),(4,8),(5,8),(5,8),(5,8),(6,8),(6,8),(6,8),(6,8),(7,8),(7,8),(7,8),(8,8),(8,8),(8,8),(8,8),(9,8),(9,8),(9,8),(10,8),(10,8),(10,8),(10,8),(11,8),(11,8),(11,8),(12,8),(12,8),(12,8),(12,8),(13,8),(13,8),(13,8),(14,8),(14,8),(14,8),(15,8),(15,8),(15,8),(15,8),(16,8),(16,8),(16,8),(17,8),(17,8),(17,8),(17,8),(18,8),(18,8),(18,8),(19,8),(19,8),(19,8),(19,8),(20,8),(20,8),(20,8),(21,8),(21,8),(21,8),(22,8),(22,9),(22,9),(23,9),(23,9),(23,9),(24,9),(24,9),(25,9),(25,9),(25,9),(26,9),(26,9),(26,9),(27,10),(27,10),(27,10),(28,10),(28,10),(28,10),(29,10),(29,10),(30,10),(30,10),(30,10),(31,10),(31,10),(31,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),],
[(0,8),(0,8),(0,8),(0,8),(0,8),(1,8),(1,8),(1,8),(2,8),(2,8),(2,8),(2,8),(3,8),(3,8),(3,8),(4,8),(4,8),(4,8),(4,8),(5,8),(5,8),(5,8),(6,8),(6,8),(6,8),(6,8),(7,8),(7,8),(7,8),(8,8),(8,8),(8,8),(8,8),(9,8),(9,8),(9,8),(10,8),(10,8),(10,8),(11,8),(11,8),(11,8),(11,8),(12,8),(12,8),(12,8),(13,8),(13,8),(13,8),(13,8),(14,8),(14,8),(14,8),(15,8),(15,8),(15,8),(15,8),(16,8),(16,8),(16,8),(17,8),(17,8),(17,8),(17,8),(18,8),(18,8),(18,8),(19,8),(19,8),(19,8),(19,8),(20,8),(20,8),(20,8),(21,9),(21,9),(21,9),(22,9),(22,9),(22,9),(23,9),(23,9),(23,9),(24,9),(24,9),(25,9),(25,9),(25,9),(26,9),(26,10),(26,10),(27,10),(27,10),(28,10),(28,10),(28,10),(29,10),(29,10),(29,10),(30,10),(30,10),(30,10),(31,10),(31,11),(31,11),(32,11),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),],
[(0,8),(0,8),(0,8),(0,8),(0,8),(1,8),(1,8),(1,8),(2,8),(2,8),(2,8),(2,8),(3,8),(3,8),(3,8),(4,8),(4,8),(4,8),(4,8),(5,8),(5,8),(5,8),(6,8),(6,8),(6,8),(7,8),(7,8),(7,8),(7,8),(8,8),(8,8),(8,8),(9,8),(9,8),(9,8),(9,8),(10,8),(10,8),(10,8),(11,8),(11,8),(11,8),(11,8),(12,8),(12,8),(12,8),(13,8),(13,8),(13,8),(13,8),(14,8),(14,8),(14,8),(15,8),(15,8),(15,8),(15,8),(16,8),(16,8),(16,8),(17,8),(17,8),(17,8),(17,8),(18,8),(18,9),(18,9),(19,9),(19,9),(19,9),(20,9),(20,9),(20,9),(20,9),(21,9),(21,9),(21,9),(22,9),(22,9),(22,9),(23,9),(23,9),(24,9),(24,9),(24,9),(25,9),(25,10),(25,10),(26,10),(26,10),(27,10),(27,10),(27,10),(28,10),(28,10),(28,10),(29,10),(29,10),(29,10),(30,10),(30,11),(30,11),(31,11),(31,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),],
[(0,8),(0,8),(0,8),(0,8),(0,8),(1,8),(1,8),(1,8),(2,8),(2,8),(2,8),(2,8),(3,8),(3,8),(3,8),(4,8),(4,8),(4,8),(4,8),(5,8),(5,8),(5,8),(6,8),(6,8),(6,8),(7,8),(7,8),(7,8),(7,8),(8,9),(8,9),(8,9),(9,9),(9,9),(9,9),(9,9),(10,9),(10,9),(10,9),(11,9),(11,9),(11,9),(11,9),(12,9),(12,9),(12,9),(13,9),(13,9),(13,9),(14,9),(14,9),(14,9),(14,9),(15,9),(15,9),(15,9),(16,9),(16,9),(16,9),(16,9),(17,9),(17,9),(17,9),(18,9),(18,9),(18,9),(18,9),(19,9),(19,9),(19,9),(20,9),(20,9),(20,9),(21,9),(21,9),(21,9),(21,9),(22,9),(22,9),(23,9),(23,9),(23,9),(24,9),(24,9),(24,10),(25,10),(25,10),(26,10),(26,10),(26,10),(27,10),(27,10),(27,10),(28,10),(28,10),(28,10),(29,10),(29,11),(30,11),(30,11),(30,11),(31,11),(31,11),(31,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),],
[(0,8),(0,8),(0,8),(0,8),(0,8),(1,8),(1,8),(1,8),(2,8),(2,8),(2,9),(2,9),(3,9),(3,9),(3,9),(4,9),(4,9),(4,9),(5,9),(5,9),(5,9),(5,9),(6,9),(6,9),(6,9),(7,9),(7,9),(7,9),(7,9),(8,9),(8,9),(8,9),(9,9),(9,9),(9,9),(9,9),(10,9),(10,9),(10,9),(11,9),(11,9),(11,9),(11,9),(12,9),(12,9),(12,9),(13,9),(13,9),(13,9),(14,9),(14,9),(14,9),(14,9),(15,9),(15,9),(15,9),(16,9),(16,9),(16,9),(16,9),(17,9),(17,9),(17,9),(18,9),(18,9),(18,9),(18,9),(19,9),(19,9),(19,9),(20,9),(20,9),(20,9),(21,9),(21,9),(21,9),(22,9),(22,9),(22,9),(23,9),(23,9),(23,9),(24,10),(24,10),(25,10),(25,10),(25,10),(26,10),(26,10),(26,10),(27,10),(27,10),(27,10),(28,10),(28,11),(29,11),(29,11),(29,11),(30,11),(30,11),(30,11),(31,11),(31,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),(32,10),],
[(0,9),(0,9),(0,9),(0,9),(0,9),(1,9),(1,9),(1,9),(2,9),(2,9),(2,9),(2,9),(3,9),(3,9),(3,9),(4,9),(4,9),(4,9),(5,9),(5,9),(5,9),(5,9),(6,9),(6,9),(6,9),(7,9),(7,9),(7,9),(7,9),(8,9),(8,9),(8,9),(9,9),(9,9),(9,9),(9,9),(10,9),(10,9),(10,9),(11,9),(11,9),(11,9),(12,9),(12,9),(12,9),(12,9),(13,9),(13,9),(13,9),(14,9),(14,9),(14,9),(14,9),(15,9),(15,9),(15,9),(16,9),(16,9),(16,9),(17,9),(17,9),(17,9),(17,9),(18,9),(18,9),(18,9),(19,9),(19,9),(19,9),(19,9),(20,9),(20,9),(20,9),(21,9),(21,9),(21,9),(22,9),(22,9),(22,9),(23,9),(23,10),(23,10),(24,10),(24,10),(25,10),(25,10),(25,10),(26,10),(26,10),(26,10),(27,10),(27,11),(28,11),(28,11),(28,11),(29,11),(29,11),(29,11),(30,11),(30,11),(31,11),(31,11),(31,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,10),(32,10),(32,10),(32,10),],
[(0,9),(0,9),(0,9),(0,9),(0,9),(1,9),(1,9),(1,9),(2,9),(2,9),(2,9),(2,9),(3,9),(3,9),(3,9),(4,9),(4,9),(4,9),(5,9),(5,9),(5,9),(5,9),(6,9),(6,9),(6,9),(7,9),(7,9),(7,9),(7,9),(8,9),(8,9),(8,9),(9,9),(9,9),(9,9),(10,9),(10,9),(10,9),(10,9),(11,9),(11,9),(11,9),(12,9),(12,9),(12,9),(12,9),(13,9),(13,9),(13,9),(14,9),(14,9),(14,9),(15,9),(15,9),(15,9),(15,9),(16,9),(16,9),(16,9),(17,9),(17,9),(17,9),(17,9),(18,9),(18,9),(18,9),(19,9),(19,9),(19,9),(19,9),(20,9),(20,9),(20,9),(21,9),(21,9),(21,9),(22,9),(22,9),(22,10),(23,10),(23,10),(24,10),(24,10),(24,10),(25,10),(25,10),(25,10),(26,10),(26,10),(27,11),(27,11),(27,11),(28,11),(28,11),(28,11),(29,11),(29,11),(30,11),(30,11),(30,11),(31,11),(31,12),(31,12),(32,12),(32,12),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,10),(32,10),],
[(0,9),(0,9),(0,9),(0,9),(0,9),(1,9),(1,9),(1,9),(2,9),(2,9),(2,9),(2,9),(3,9),(3,9),(3,9),(4,9),(4,9),(4,9),(5,9),(5,9),(5,9),(5,9),(6,9),(6,9),(6,9),(7,9),(7,9),(7,9),(8,9),(8,9),(8,9),(8,9),(9,9),(9,9),(9,9),(10,9),(10,9),(10,9),(10,9),(11,9),(11,9),(11,9),(12,9),(12,9),(12,9),(13,9),(13,9),(13,9),(13,9),(14,9),(14,9),(14,9),(15,9),(15,9),(15,9),(15,9),(16,9),(16,9),(16,9),(17,9),(17,9),(17,9),(17,9),(18,9),(18,9),(18,9),(19,9),(19,9),(19,9),(19,9),(20,9),(20,9),(20,9),(21,9),(21,9),(21,9),(22,10),(22,10),(22,10),(23,10),(23,10),(24,10),(24,10),(24,10),(25,10),(25,10),(26,11),(26,11),(26,11),(27,11),(27,11),(27,11),(28,11),(28,11),(29,11),(29,11),(29,11),(30,11),(30,12),(30,12),(31,12),(31,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),],
[(0,9),(0,9),(0,9),(0,9),(0,9),(1,9),(1,9),(1,9),(2,9),(2,9),(2,9),(2,9),(3,9),(3,9),(3,9),(4,9),(4,9),(4,9),(5,9),(5,9),(5,9),(5,9),(6,9),(6,9),(6,9),(7,9),(7,9),(7,9),(8,9),(8,9),(8,9),(8,9),(9,9),(9,9),(9,9),(10,9),(10,9),(10,9),(10,9),(11,9),(11,9),(11,9),(12,9),(12,9),(12,9),(13,9),(13,9),(13,9),(13,9),(14,9),(14,9),(14,9),(15,9),(15,9),(15,10),(16,10),(16,10),(16,10),(16,10),(17,10),(17,10),(17,10),(18,10),(18,10),(18,9),(18,9),(19,9),(19,9),(19,9),(20,9),(20,9),(20,9),(20,10),(21,10),(21,10),(21,10),(22,10),(22,10),(23,10),(23,10),(23,10),(24,10),(24,10),(25,10),(25,11),(25,11),(26,11),(26,11),(26,11),(27,11),(27,11),(28,11),(28,11),(28,11),(29,11),(29,12),(30,12),(30,12),(30,12),(31,12),(31,12),(31,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),],
[(0,9),(0,9),(0,9),(0,9),(0,9),(1,9),(1,9),(1,9),(2,9),(2,9),(2,9),(3,9),(3,9),(3,9),(3,9),(4,9),(4,9),(4,9),(5,9),(5,9),(5,9),(6,9),(6,9),(6,9),(6,9),(7,9),(7,9),(7,10),(8,10),(8,10),(8,10),(8,10),(9,10),(9,10),(9,10),(10,10),(10,10),(10,10),(11,10),(11,10),(11,10),(11,10),(12,10),(12,10),(12,10),(13,10),(13,10),(13,10),(14,10),(14,10),(14,10),(14,10),(15,10),(15,10),(15,10),(16,10),(16,10),(16,10),(16,10),(17,10),(17,10),(17,10),(18,10),(18,10),(18,10),(18,10),(19,10),(19,10),(19,10),(20,10),(20,10),(20,10),(20,10),(21,10),(21,10),(21,10),(22,10),(22,10),(23,10),(23,10),(23,10),(24,10),(24,11),(25,11),(25,11),(25,11),(26,11),(26,11),(27,11),(27,11),(27,11),(28,11),(28,11),(29,12),(29,12),(29,12),(30,12),(30,12),(30,12),(31,12),(31,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),],
[(0,9),(0,9),(0,9),(0,9),(0,9),(1,9),(1,9),(1,9),(2,9),(2,9),(2,9),(3,10),(3,10),(3,10),(3,10),(4,10),(4,10),(4,10),(5,10),(5,10),(5,10),(6,10),(6,10),(6,10),(6,10),(7,10),(7,10),(7,10),(8,10),(8,10),(8,10),(8,10),(9,10),(9,10),(9,10),(10,10),(10,10),(10,10),(11,10),(11,10),(11,10),(11,10),(12,10),(12,10),(12,10),(13,10),(13,10),(13,10),(14,10),(14,10),(14,10),(15,10),(15,10),(15,10),(15,10),(16,10),(16,10),(16,10),(17,10),(17,10),(17,10),(17,10),(18,10),(18,10),(18,10),(19,10),(19,10),(19,10),(19,10),(20,10),(20,10),(20,10),(20,10),(21,10),(21,10),(22,10),(22,10),(22,10),(23,10),(23,10),(24,11),(24,11),(24,11),(25,11),(25,11),(26,11),(26,11),(26,11),(27,11),(27,11),(27,12),(28,12),(28,12),(29,12),(29,12),(29,12),(30,12),(30,12),(31,12),(31,12),(31,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,11),(32,11),(32,11),(32,11),(32,11),(32,11),],
[(0,10),(0,10),(0,10),(0,10),(0,10),(1,10),(1,10),(1,10),(2,10),(2,10),(2,10),(3,10),(3,10),(3,10),(3,10),(4,10),(4,10),(4,10),(5,10),(5,10),(5,10),(6,10),(6,10),(6,10),(6,10),(7,10),(7,10),(7,10),(8,10),(8,10),(8,10),(9,10),(9,10),(9,10),(9,10),(10,10),(10,10),(10,10),(11,10),(11,10),(11,10),(12,10),(12,10),(12,10),(12,10),(13,10),(13,10),(13,10),(14,10),(14,10),(14,10),(15,10),(15,10),(15,10),(15,10),(16,10),(16,10),(16,10),(17,10),(17,10),(17,10),(17,10),(18,10),(18,10),(18,10),(19,10),(19,10),(19,10),(19,10),(20,10),(20,10),(20,10),(21,10),(21,10),(21,10),(22,10),(22,10),(22,10),(23,11),(23,11),(24,11),(24,11),(24,11),(25,11),(25,11),(26,11),(26,11),(26,11),(27,12),(27,12),(28,12),(28,12),(28,12),(29,12),(29,12),(30,12),(30,12),(30,12),(31,13),(31,13),(32,13),(32,13),(32,13),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,11),(32,11),(32,11),(32,11),],
[(0,10),(0,10),(0,10),(0,10),(0,10),(1,10),(1,10),(1,10),(2,10),(2,10),(2,10),(3,10),(3,10),(3,10),(3,10),(4,10),(4,10),(4,10),(5,10),(5,10),(5,10),(6,10),(6,10),(6,10),(6,10),(7,10),(7,10),(7,10),(8,10),(8,10),(8,10),(9,10),(9,10),(9,10),(9,10),(10,10),(10,10),(10,10),(11,10),(11,10),(11,10),(12,10),(12,10),(12,10),(13,10),(13,10),(13,10),(13,10),(14,10),(14,10),(14,10),(15,10),(15,10),(15,10),(16,10),(16,10),(16,10),(16,10),(17,10),(17,10),(17,10),(18,10),(18,10),(18,10),(18,10),(19,10),(19,10),(19,10),(20,10),(20,10),(20,10),(20,10),(21,10),(21,10),(21,10),(22,10),(22,10),(23,11),(23,11),(23,11),(24,11),(24,11),(25,11),(25,11),(25,11),(26,11),(26,12),(27,12),(27,12),(27,12),(28,12),(28,12),(29,12),(29,12),(29,12),(30,12),(30,13),(31,13),(31,13),(31,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,11),],
[(0,10),(0,10),(0,10),(0,10),(0,10),(1,10),(1,10),(1,10),(2,10),(2,10),(2,10),(3,10),(3,10),(3,10),(3,10),(4,10),(4,10),(4,10),(5,10),(5,10),(5,10),(6,10),(6,10),(6,10),(7,10),(7,10),(7,10),(7,10),(8,10),(8,10),(8,10),(9,10),(9,10),(9,10),(9,10),(10,10),(10,10),(10,10),(11,10),(11,10),(11,10),(12,10),(12,10),(12,10),(13,10),(13,10),(13,10),(14,10),(14,10),(14,10),(14,10),(15,10),(15,10),(15,10),(16,10),(16,10),(16,10),(17,10),(17,10),(17,10),(17,10),(18,10),(18,10),(18,10),(18,10),(19,10),(19,10),(19,10),(20,10),(20,10),(20,10),(20,10),(21,10),(21,10),(21,10),(22,11),(22,11),(23,11),(23,11),(23,11),(24,11),(24,11),(25,11),(25,11),(26,12),(26,12),(26,12),(27,12),(27,12),(28,12),(28,12),(28,12),(29,12),(29,13),(30,13),(30,13),(30,13),(31,13),(31,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),],
[(0,10),(0,10),(0,10),(0,10),(0,10),(1,10),(1,10),(1,10),(2,10),(2,10),(2,10),(3,10),(3,10),(3,10),(4,10),(4,10),(4,10),(4,10),(5,10),(5,10),(5,10),(6,10),(6,10),(6,10),(7,10),(7,10),(7,10),(7,10),(8,10),(8,10),(8,10),(9,10),(9,10),(9,10),(10,10),(10,10),(10,10),(10,10),(11,11),(11,11),(11,11),(12,11),(12,11),(12,11),(13,11),(13,11),(13,11),(14,11),(14,11),(14,11),(15,11),(15,11),(15,11),(15,11),(16,11),(16,11),(16,11),(17,11),(17,11),(17,11),(17,11),(18,11),(18,11),(18,11),(19,11),(19,11),(19,11),(19,11),(20,11),(20,11),(20,11),(21,11),(21,11),(21,11),(22,11),(22,11),(22,11),(23,11),(23,11),(24,11),(24,11),(24,12),(25,12),(25,12),(26,12),(26,12),(26,12),(27,12),(27,12),(28,12),(28,12),(28,13),(29,13),(29,13),(30,13),(30,13),(30,13),(31,13),(31,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),],
[(0,10),(0,10),(0,10),(0,10),(0,10),(1,10),(1,10),(1,10),(2,10),(2,10),(2,10),(3,10),(3,10),(3,10),(4,10),(4,10),(4,10),(4,10),(5,10),(5,10),(5,10),(6,10),(6,11),(6,11),(7,11),(7,11),(7,11),(8,11),(8,11),(8,11),(8,11),(9,11),(9,11),(9,11),(10,11),(10,11),(10,11),(11,11),(11,11),(11,11),(12,11),(12,11),(12,11),(12,11),(13,11),(13,11),(13,11),(14,11),(14,11),(14,11),(15,11),(15,11),(15,11),(16,11),(16,11),(16,11),(16,11),(17,11),(17,11),(17,11),(18,11),(18,11),(18,11),(18,11),(19,11),(19,11),(19,11),(20,11),(20,11),(20,11),(20,11),(21,11),(21,11),(21,11),(22,11),(22,11),(23,11),(23,11),(23,11),(24,12),(24,12),(25,12),(25,12),(25,12),(26,12),(26,12),(27,12),(27,12),(27,12),(28,13),(28,13),(29,13),(29,13),(29,13),(30,13),(30,13),(31,13),(31,13),(31,14),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),(32,12),],
[(0,10),(0,10),(0,10),(0,10),(0,10),(1,10),(1,10),(1,10),(2,10),(2,11),(2,11),(3,11),(3,11),(3,11),(4,11),(4,11),(4,11),(4,11),(5,11),(5,11),(5,11),(6,11),(6,11),(6,11),(7,11),(7,11),(7,11),(8,11),(8,11),(8,11),(8,11),(9,11),(9,11),(9,11),(10,11),(10,11),(10,11),(11,11),(11,11),(11,11),(12,11),(12,11),(12,11),(13,11),(13,11),(13,11),(13,11),(14,11),(14,11),(14,11),(15,11),(15,11),(15,11),(16,11),(16,11),(16,11),(17,11),(17,11),(17,11),(17,11),(18,11),(18,11),(18,11),(19,11),(19,11),(19,11),(19,11),(20,11),(20,11),(20,11),(21,11),(21,11),(21,11),(22,11),(22,11),(22,11),(23,11),(23,12),(24,12),(24,12),(24,12),(25,12),(25,12),(26,12),(26,12),(26,12),(27,13),(27,13),(28,13),(28,13),(28,13),(29,13),(29,13),(30,13),(30,13),(30,13),(31,14),(31,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,12),(32,12),(32,12),(32,12),(32,12),],
[(0,11),(0,11),(0,11),(0,11),(0,11),(1,11),(1,11),(1,11),(2,11),(2,11),(2,11),(3,11),(3,11),(3,11),(4,11),(4,11),(4,11),(5,11),(5,11),(5,11),(5,11),(6,11),(6,11),(6,11),(7,11),(7,11),(7,11),(8,11),(8,11),(8,11),(9,11),(9,11),(9,11),(9,11),(10,11),(10,11),(10,11),(11,11),(11,11),(11,11),(12,11),(12,11),(12,11),(13,11),(13,11),(13,11),(14,11),(14,11),(14,11),(14,11),(15,11),(15,11),(15,11),(16,11),(16,11),(16,11),(17,11),(17,11),(17,11),(17,11),(18,11),(18,11),(18,11),(19,11),(19,11),(19,11),(19,11),(20,11),(20,11),(20,11),(21,11),(21,11),(21,11),(22,11),(22,12),(23,12),(23,12),(23,12),(24,12),(24,12),(25,12),(25,12),(25,12),(26,12),(26,13),(27,13),(27,13),(27,13),(28,13),(28,13),(29,13),(29,13),(29,13),(30,14),(30,14),(31,14),(31,14),(31,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,12),(32,12),(32,12),],
[(0,11),(0,11),(0,11),(0,11),(0,11),(1,11),(1,11),(1,11),(2,11),(2,11),(2,11),(3,11),(3,11),(3,11),(4,11),(4,11),(4,11),(5,11),(5,11),(5,11),(5,11),(6,11),(6,11),(6,11),(7,11),(7,11),(7,11),(8,11),(8,11),(8,11),(9,11),(9,11),(9,11),(10,11),(10,11),(10,11),(10,11),(11,11),(11,11),(11,11),(12,11),(12,11),(12,11),(13,11),(13,11),(13,11),(14,11),(14,11),(14,11),(15,11),(15,11),(15,11),(16,11),(16,11),(16,11),(16,11),(17,11),(17,11),(17,11),(18,11),(18,11),(18,11),(18,11),(19,11),(19,11),(19,11),(20,11),(20,11),(20,11),(21,12),(21,12),(21,12),(22,12),(22,12),(22,12),(23,12),(23,12),(24,12),(24,12),(24,12),(25,12),(25,13),(26,13),(26,13),(26,13),(27,13),(27,13),(28,13),(28,13),(28,13),(29,13),(29,14),(30,14),(30,14),(30,14),(31,14),(31,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,12),],
[(0,11),(0,11),(0,11),(0,11),(0,11),(1,11),(1,11),(1,11),(2,11),(2,11),(2,11),(3,11),(3,11),(3,11),(4,11),(4,11),(4,11),(5,11),(5,11),(5,11),(6,11),(6,11),(6,11),(6,11),(7,11),(7,11),(7,11),(8,11),(8,11),(8,11),(9,11),(9,11),(9,11),(10,11),(10,11),(10,11),(11,11),(11,11),(11,11),(12,12),(12,12),(12,12),(12,12),(13,12),(13,12),(13,12),(14,12),(14,12),(14,12),(15,12),(15,12),(15,12),(16,12),(16,12),(16,12),(17,12),(17,12),(17,12),(17,12),(18,12),(18,12),(18,12),(19,12),(19,12),(19,12),(19,12),(20,12),(20,12),(20,12),(21,12),(21,12),(21,12),(22,12),(22,12),(23,12),(23,12),(23,12),(24,12),(24,12),(25,13),(25,13),(25,13),(26,13),(26,13),(27,13),(27,13),(27,13),(28,13),(28,14),(29,14),(29,14),(29,14),(30,14),(30,14),(31,14),(31,14),(31,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),],
[(0,11),(0,11),(0,11),(0,11),(0,11),(1,11),(1,11),(1,11),(2,11),(2,11),(2,11),(3,11),(3,11),(3,11),(4,11),(4,11),(4,11),(5,11),(5,11),(5,11),(6,11),(6,11),(6,11),(7,11),(7,11),(7,11),(7,11),(8,11),(8,11),(8,12),(9,12),(9,12),(9,12),(10,12),(10,12),(10,12),(11,12),(11,12),(11,12),(12,12),(12,12),(12,12),(13,12),(13,12),(13,12),(14,12),(14,12),(14,12),(14,12),(15,12),(15,12),(15,12),(16,12),(16,12),(16,12),(17,12),(17,12),(17,12),(18,12),(18,12),(18,12),(18,12),(19,12),(19,12),(19,12),(20,12),(20,12),(20,12),(21,12),(21,12),(21,12),(22,12),(22,12),(22,12),(23,12),(23,12),(24,13),(24,13),(24,13),(25,13),(25,13),(26,13),(26,13),(26,13),(27,13),(27,13),(28,14),(28,14),(28,14),(29,14),(29,14),(30,14),(30,14),(30,14),(31,14),(31,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),],
[(0,11),(0,11),(0,11),(0,11),(1,11),(1,11),(1,11),(1,11),(2,11),(2,11),(2,11),(3,11),(3,11),(3,11),(4,12),(4,12),(4,12),(5,12),(5,12),(5,12),(6,12),(6,12),(6,12),(7,12),(7,12),(7,12),(8,12),(8,12),(8,12),(8,12),(9,12),(9,12),(9,12),(10,12),(10,12),(10,12),(11,12),(11,12),(11,12),(12,12),(12,12),(12,12),(13,12),(13,12),(13,12),(14,12),(14,12),(14,12),(15,12),(15,12),(15,12),(16,12),(16,12),(16,12),(16,12),(17,12),(17,12),(17,12),(18,12),(18,12),(18,12),(19,12),(19,12),(19,12),(19,12),(20,12),(20,12),(20,12),(21,12),(21,12),(21,12),(22,12),(22,12),(23,13),(23,13),(23,13),(24,13),(24,13),(25,13),(25,13),(25,13),(26,13),(26,13),(27,14),(27,14),(27,14),(28,14),(28,14),(29,14),(29,14),(29,14),(30,14),(30,14),(31,15),(31,15),(31,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),(32,13),],
[(0,12),(0,12),(0,12),(0,12),(1,12),(1,12),(1,12),(1,12),(2,12),(2,12),(2,12),(3,12),(3,12),(3,12),(4,12),(4,12),(4,12),(5,12),(5,12),(5,12),(6,12),(6,12),(6,12),(7,12),(7,12),(7,12),(8,12),(8,12),(8,12),(9,12),(9,12),(9,12),(9,12),(10,12),(10,12),(10,12),(11,12),(11,12),(11,12),(12,12),(12,12),(12,12),(13,12),(13,12),(13,12),(14,12),(14,12),(14,12),(15,12),(15,12),(15,12),(16,12),(16,12),(16,12),(17,12),(17,12),(17,12),(17,12),(18,12),(18,12),(18,12),(19,12),(19,12),(19,12),(20,12),(20,12),(20,12),(21,12),(21,12),(21,13),(22,13),(22,13),(22,13),(23,13),(23,13),(24,13),(24,13),(24,13),(25,13),(25,13),(25,14),(26,14),(26,14),(27,14),(27,14),(27,14),(28,14),(28,14),(29,14),(29,14),(29,15),(30,15),(30,15),(31,15),(31,15),(31,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),(32,13),(32,13),(32,13),],
[(0,12),(0,12),(0,12),(0,12),(1,12),(1,12),(1,12),(2,12),(2,12),(2,12),(2,12),(3,12),(3,12),(3,12),(4,12),(4,12),(4,12),(5,12),(5,12),(5,12),(6,12),(6,12),(6,12),(7,12),(7,12),(7,12),(8,12),(8,12),(8,12),(9,12),(9,12),(9,12),(10,12),(10,12),(10,12),(11,12),(11,12),(11,12),(12,12),(12,12),(12,12),(13,12),(13,12),(13,12),(14,12),(14,12),(14,12),(14,12),(15,12),(15,12),(15,12),(16,12),(16,12),(16,13),(17,13),(17,13),(17,13),(18,13),(18,13),(18,13),(19,13),(19,13),(19,13),(19,13),(20,13),(20,13),(20,13),(21,13),(21,13),(21,13),(22,13),(22,13),(23,13),(23,13),(23,13),(24,13),(24,13),(24,13),(25,14),(25,14),(26,14),(26,14),(26,14),(27,14),(27,14),(28,14),(28,14),(28,14),(29,15),(29,15),(30,15),(30,15),(30,15),(31,15),(31,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,13),(32,13),],
[(0,12),(0,12),(0,12),(0,12),(1,12),(1,12),(1,12),(2,12),(2,12),(2,12),(2,12),(3,12),(3,12),(3,12),(4,12),(4,12),(4,12),(5,12),(5,12),(5,12),(6,12),(6,12),(6,12),(7,12),(7,12),(7,12),(8,12),(8,12),(8,12),(9,12),(9,12),(9,12),(10,12),(10,12),(10,12),(11,12),(11,12),(11,12),(12,12),(12,12),(12,13),(13,13),(13,13),(13,13),(14,13),(14,13),(14,13),(15,13),(15,13),(15,13),(16,13),(16,13),(16,13),(16,13),(17,13),(17,13),(17,13),(18,13),(18,13),(18,13),(19,13),(19,13),(19,13),(20,13),(20,13),(20,13),(21,13),(21,13),(21,13),(22,13),(22,13),(22,13),(23,13),(23,13),(23,13),(24,14),(24,14),(25,14),(25,14),(25,14),(26,14),(26,14),(27,14),(27,14),(27,14),(28,15),(28,15),(29,15),(29,15),(29,15),(30,15),(30,15),(31,15),(31,15),(31,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),],
[(0,12),(0,12),(0,12),(0,12),(1,12),(1,12),(1,12),(2,12),(2,12),(2,12),(3,12),(3,12),(3,12),(4,12),(4,12),(4,12),(4,12),(5,12),(5,12),(5,12),(6,12),(6,12),(6,12),(7,12),(7,12),(7,12),(8,12),(8,12),(8,12),(9,12),(9,12),(9,12),(10,13),(10,13),(10,13),(11,13),(11,13),(11,13),(12,13),(12,13),(12,13),(13,13),(13,13),(13,13),(14,13),(14,13),(14,13),(15,13),(15,13),(15,13),(16,13),(16,13),(16,13),(17,13),(17,13),(17,13),(18,13),(18,13),(18,13),(18,13),(19,13),(19,13),(19,13),(20,13),(20,13),(20,13),(21,13),(21,13),(21,13),(22,13),(22,13),(22,13),(23,14),(23,14),(24,14),(24,14),(24,14),(25,14),(25,14),(26,14),(26,14),(26,14),(27,15),(27,15),(28,15),(28,15),(28,15),(29,15),(29,15),(30,15),(30,15),(30,15),(31,16),(31,16),(31,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),],
[(0,12),(0,12),(0,12),(0,12),(1,12),(1,12),(1,12),(2,12),(2,12),(2,12),(3,12),(3,12),(3,12),(4,12),(4,12),(4,12),(5,12),(5,12),(5,12),(6,13),(6,13),(6,13),(6,13),(7,13),(7,13),(7,13),(8,13),(8,13),(8,13),(9,13),(9,13),(9,13),(10,13),(10,13),(10,13),(11,13),(11,13),(11,13),(12,13),(12,13),(12,13),(13,13),(13,13),(13,13),(14,13),(14,13),(14,13),(15,13),(15,13),(15,13),(16,13),(16,13),(16,13),(17,13),(17,13),(17,13),(18,13),(18,13),(18,13),(19,13),(19,13),(19,13),(20,13),(20,13),(20,13),(21,13),(21,13),(21,13),(22,13),(22,14),(22,14),(23,14),(23,14),(23,14),(24,14),(24,14),(25,14),(25,14),(25,14),(26,14),(26,15),(27,15),(27,15),(27,15),(28,15),(28,15),(29,15),(29,15),(29,15),(30,15),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),],
[(0,12),(0,12),(0,12),(0,13),(1,13),(1,13),(1,13),(2,13),(2,13),(2,13),(3,13),(3,13),(3,13),(4,13),(4,13),(4,13),(5,13),(5,13),(5,13),(6,13),(6,13),(6,13),(7,13),(7,13),(7,13),(8,13),(8,13),(8,13),(8,13),(9,13),(9,13),(9,13),(10,13),(10,13),(10,13),(11,13),(11,13),(11,13),(12,13),(12,13),(13,13),(13,13),(13,13),(14,13),(14,13),(14,13),(15,13),(15,13),(15,13),(16,13),(16,13),(16,13),(17,13),(17,13),(17,13),(17,13),(18,13),(18,13),(18,13),(19,13),(19,13),(19,13),(20,13),(20,13),(20,14),(21,14),(21,14),(21,14),(22,14),(22,14),(22,14),(23,14),(23,14),(24,14),(24,14),(24,14),(25,14),(25,15),(26,15),(26,15),(26,15),(27,15),(27,15),(28,15),(28,15),(28,15),(29,15),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),(32,14),(32,14),],
[(0,13),(0,13),(0,13),(0,13),(1,13),(1,13),(1,13),(2,13),(2,13),(2,13),(3,13),(3,13),(3,13),(4,13),(4,13),(4,13),(5,13),(5,13),(5,13),(6,13),(6,13),(6,13),(7,13),(7,13),(7,13),(8,13),(8,13),(8,13),(9,13),(9,13),(9,13),(10,13),(10,13),(10,13),(11,13),(11,13),(11,13),(12,13),(12,13),(12,13),(13,13),(13,13),(13,13),(14,13),(14,13),(14,13),(15,13),(15,13),(15,13),(16,13),(16,14),(16,14),(17,14),(17,14),(17,14),(18,14),(18,14),(18,14),(19,14),(19,14),(19,14),(20,14),(20,14),(20,14),(20,14),(21,14),(21,14),(22,14),(22,14),(22,14),(23,14),(23,14),(23,14),(24,14),(24,15),(25,15),(25,15),(25,15),(26,15),(26,15),(27,15),(27,15),(27,15),(28,15),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),(32,14),(32,14),],
[(0,13),(0,13),(0,13),(0,13),(1,13),(1,13),(1,13),(2,13),(2,13),(2,13),(3,13),(3,13),(3,13),(4,13),(4,13),(4,13),(5,13),(5,13),(5,13),(6,13),(6,13),(6,13),(7,13),(7,13),(7,13),(8,13),(8,13),(8,13),(9,13),(9,13),(9,13),(10,13),(10,13),(10,13),(11,13),(11,13),(11,13),(12,13),(12,13),(12,13),(13,13),(13,14),(13,14),(14,14),(14,14),(14,14),(15,14),(15,14),(15,14),(16,14),(16,14),(16,14),(17,14),(17,14),(17,14),(18,14),(18,14),(18,14),(19,14),(19,14),(19,14),(20,14),(20,14),(20,14),(21,14),(21,14),(21,14),(22,14),(22,14),(22,14),(23,14),(23,15),(24,15),(24,15),(24,15),(25,15),(25,15),(26,15),(26,15),(26,15),(27,15),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,14),(32,14),],
[(0,13),(0,13),(0,13),(0,13),(1,13),(1,13),(1,13),(2,13),(2,13),(2,13),(3,13),(3,13),(3,13),(4,13),(4,13),(4,13),(5,13),(5,13),(5,13),(6,13),(6,13),(6,13),(7,13),(7,13),(7,13),(8,13),(8,13),(8,13),(9,13),(9,13),(9,13),(10,13),(10,13),(10,13),(11,13),(11,14),(11,14),(12,14),(12,14),(12,14),(13,14),(13,14),(13,14),(14,14),(14,14),(14,14),(15,14),(15,14),(15,14),(16,14),(16,14),(17,14),(17,14),(17,14),(18,14),(18,14),(18,14),(18,14),(19,14),(19,14),(19,14),(20,14),(20,14),(20,14),(21,14),(21,14),(21,14),(22,14),(22,14),(23,15),(23,15),(23,15),(24,15),(24,15),(25,15),(25,15),(25,15),(26,15),(26,15),(27,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),],
[(0,13),(0,13),(0,13),(0,13),(1,13),(1,13),(1,13),(2,13),(2,13),(2,13),(3,13),(3,13),(3,13),(4,13),(4,13),(4,13),(5,13),(5,13),(5,13),(6,13),(6,13),(6,13),(7,13),(7,14),(7,14),(8,14),(8,14),(8,14),(9,14),(9,14),(9,14),(10,14),(10,14),(10,14),(11,14),(11,14),(11,14),(12,14),(12,14),(12,14),(13,14),(13,14),(14,14),(14,14),(14,14),(15,14),(15,14),(15,14),(16,14),(16,14),(16,14),(17,14),(17,14),(17,14),(18,14),(18,14),(18,14),(19,14),(19,14),(19,14),(20,14),(20,14),(20,14),(21,14),(21,14),(21,15),(22,15),(22,15),(22,15),(23,15),(23,15),(24,15),(24,15),(24,15),(25,15),(25,15),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),],
[(0,13),(0,13),(0,13),(0,13),(1,13),(1,13),(1,13),(2,14),(2,14),(2,14),(3,14),(3,14),(3,14),(4,14),(4,14),(4,14),(5,14),(5,14),(5,14),(6,14),(6,14),(6,14),(7,14),(7,14),(7,14),(8,14),(8,14),(8,14),(9,14),(9,14),(9,14),(10,14),(10,14),(10,14),(11,14),(11,14),(11,14),(12,14),(12,14),(13,14),(13,14),(13,14),(14,14),(14,14),(14,14),(15,14),(15,14),(15,14),(16,14),(16,14),(16,14),(17,14),(17,14),(17,14),(18,14),(18,14),(18,14),(19,15),(19,15),(19,15),(20,15),(20,15),(20,15),(21,15),(21,15),(21,15),(22,15),(22,15),(23,15),(23,15),(23,15),(24,15),(24,15),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),(32,15),],
[(0,14),(0,14),(0,14),(0,14),(1,14),(1,14),(1,14),(2,14),(2,14),(2,14),(3,14),(3,14),(3,14),(4,14),(4,14),(4,14),(5,14),(5,14),(5,14),(6,14),(6,14),(6,14),(7,14),(7,14),(7,14),(8,14),(8,14),(9,14),(9,14),(9,14),(10,14),(10,14),(10,14),(11,14),(11,14),(11,14),(12,14),(12,14),(12,14),(13,14),(13,14),(13,14),(14,14),(14,14),(14,14),(15,14),(15,14),(15,14),(16,14),(16,15),(16,15),(17,15),(17,15),(17,15),(18,15),(18,15),(19,15),(19,15),(19,15),(20,15),(20,15),(20,15),(21,15),(21,15),(21,15),(22,15),(22,15),(22,15),(23,15),(23,15),(24,15),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),(32,15),(32,15),],
[(0,14),(0,14),(0,14),(0,14),(1,14),(1,14),(1,14),(2,14),(2,14),(2,14),(3,14),(3,14),(3,14),(4,14),(4,14),(4,14),(5,14),(5,14),(5,14),(6,14),(6,14),(7,14),(7,14),(7,14),(8,14),(8,14),(8,14),(9,14),(9,14),(9,14),(10,14),(10,14),(10,14),(11,14),(11,14),(11,14),(12,14),(12,14),(12,14),(13,14),(13,14),(13,14),(14,14),(14,15),(14,15),(15,15),(15,15),(16,15),(16,15),(16,15),(17,15),(17,15),(17,15),(18,15),(18,15),(18,15),(19,15),(19,15),(19,15),(20,15),(20,15),(20,15),(21,15),(21,15),(21,15),(22,15),(22,15),(23,15),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),(32,15),(32,15),],
[(0,14),(0,14),(0,14),(0,14),(1,14),(1,14),(1,14),(2,14),(2,14),(2,14),(3,14),(3,14),(3,14),(4,14),(4,14),(4,14),(5,14),(5,14),(6,14),(6,14),(6,14),(7,14),(7,14),(7,14),(8,14),(8,14),(8,14),(9,14),(9,14),(9,14),(10,14),(10,14),(10,14),(11,14),(11,14),(11,14),(12,15),(12,15),(12,15),(13,15),(13,15),(13,15),(14,15),(14,15),(15,15),(15,15),(15,15),(16,15),(16,15),(16,15),(17,15),(17,15),(17,15),(18,15),(18,15),(18,15),(19,15),(19,15),(19,15),(20,15),(20,15),(20,15),(21,15),(21,15),(22,15),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,15),],
[(0,14),(0,14),(0,14),(0,14),(1,14),(1,14),(1,14),(2,14),(2,14),(2,14),(3,14),(3,14),(3,14),(4,14),(4,14),(4,14),(5,14),(5,14),(6,14),(6,14),(6,14),(7,14),(7,14),(7,14),(8,14),(8,14),(8,14),(9,14),(9,15),(9,15),(10,15),(10,15),(10,15),(11,15),(11,15),(11,15),(12,15),(12,15),(12,15),(13,15),(13,15),(14,15),(14,15),(14,15),(15,15),(15,15),(15,15),(16,15),(16,15),(16,15),(17,15),(17,15),(17,15),(18,15),(18,15),(18,15),(19,15),(19,15),(20,15),(20,15),(20,15),(21,15),(21,16),(21,16),(22,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,14),(0,14),(0,14),(0,14),(1,14),(1,14),(1,14),(2,14),(2,14),(2,14),(3,14),(3,15),(3,15),(4,15),(4,15),(5,15),(5,15),(5,15),(6,15),(6,15),(6,15),(7,15),(7,15),(7,15),(8,15),(8,15),(8,15),(9,15),(9,15),(9,15),(10,15),(10,15),(10,15),(11,15),(11,15),(12,15),(12,15),(12,15),(13,15),(13,15),(13,15),(14,15),(14,15),(14,15),(15,15),(15,15),(15,15),(16,15),(16,15),(16,15),(17,15),(17,15),(17,15),(18,15),(18,15),(19,15),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,15),(0,15),(0,15),(0,15),(1,15),(1,15),(1,15),(2,15),(2,15),(2,15),(3,15),(3,15),(3,15),(4,15),(4,15),(5,15),(5,15),(5,15),(6,15),(6,15),(6,15),(7,15),(7,15),(7,15),(8,15),(8,15),(8,15),(9,15),(9,15),(9,15),(10,15),(10,15),(11,15),(11,15),(11,15),(12,15),(12,15),(12,15),(13,15),(13,15),(13,15),(14,15),(14,15),(14,15),(15,15),(15,15),(15,15),(16,15),(16,15),(17,15),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,15),(0,15),(0,15),(0,15),(1,15),(1,15),(1,15),(2,15),(2,15),(2,15),(3,15),(3,15),(3,15),(4,15),(4,15),(5,15),(5,15),(5,15),(6,15),(6,15),(6,15),(7,15),(7,15),(7,15),(8,15),(8,15),(8,15),(9,15),(9,15),(10,15),(10,15),(10,15),(11,15),(11,15),(11,15),(12,15),(12,15),(12,15),(13,15),(13,15),(13,15),(14,15),(14,15),(14,15),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,15),(0,15),(0,15),(0,15),(1,15),(1,15),(1,15),(2,15),(2,15),(2,15),(3,15),(3,15),(3,15),(4,15),(4,15),(5,15),(5,15),(5,15),(6,15),(6,15),(6,15),(7,15),(7,15),(7,15),(8,15),(8,15),(9,15),(9,15),(9,15),(10,15),(10,15),(10,15),(11,15),(11,15),(11,15),(12,15),(12,15),(12,15),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,15),(0,15),(0,15),(0,15),(1,15),(1,15),(1,15),(2,15),(2,15),(2,15),(3,15),(3,15),(3,15),(4,15),(4,15),(5,15),(5,15),(5,15),(6,15),(6,15),(6,15),(7,15),(7,15),(7,15),(8,15),(8,15),(9,15),(9,15),(9,15),(10,15),(10,15),(10,15),(11,16),(11,16),(11,16),(12,16),(12,16),(12,16),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,15),(0,15),(0,15),(0,15),(1,15),(1,15),(1,15),(2,15),(2,15),(2,15),(3,15),(3,15),(3,15),(4,15),(4,15),(5,15),(5,16),(5,16),(6,16),(6,16),(6,16),(7,16),(7,16),(7,16),(8,16),(8,16),(9,16),(9,16),(9,16),(10,16),(10,16),(10,16),(11,16),(11,16),(11,16),(12,16),(12,16),(12,16),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,16),(0,16),(0,16),(0,16),(1,16),(1,16),(1,16),(2,16),(2,16),(2,16),(3,16),(3,16),(3,16),(4,16),(4,16),(5,16),(5,16),(5,16),(6,16),(6,16),(6,16),(7,16),(7,16),(7,16),(8,16),(8,16),(9,16),(9,16),(9,16),(10,16),(10,16),(10,16),(11,16),(11,16),(11,16),(12,16),(12,16),(12,16),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,16),(0,16),(0,16),(0,16),(1,16),(1,16),(1,16),(2,16),(2,16),(2,16),(3,16),(3,16),(3,16),(4,16),(4,16),(5,16),(5,16),(5,16),(6,16),(6,16),(6,16),(7,16),(7,16),(7,16),(8,16),(8,16),(9,16),(9,16),(9,16),(10,16),(10,16),(10,16),(11,16),(11,16),(11,16),(12,16),(12,16),(12,16),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,16),(0,16),(0,16),(0,16),(1,16),(1,16),(1,16),(2,16),(2,16),(2,16),(3,16),(3,16),(3,16),(4,16),(4,16),(5,16),(5,16),(5,16),(6,16),(6,16),(6,16),(7,16),(7,16),(7,16),(8,16),(8,16),(9,16),(9,16),(9,16),(10,16),(10,16),(10,16),(11,16),(11,16),(11,16),(12,16),(12,16),(12,16),(12,16),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,16),(0,16),(0,16),(0,16),(1,16),(1,16),(1,16),(2,16),(2,16),(2,16),(3,16),(3,16),(3,16),(4,16),(4,16),(5,16),(5,16),(5,16),(6,16),(6,16),(6,16),(7,16),(7,16),(7,16),(8,16),(8,16),(8,16),(9,16),(9,16),(10,16),(10,16),(10,16),(10,16),(11,16),(11,16),(11,16),(12,16),(12,16),(12,16),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
[(0,16),(0,16),(0,16),(0,16),(0,16),(1,16),(1,16),(2,16),(2,16),(2,16),(3,16),(3,16),(3,16),(4,16),(4,16),(4,16),(5,16),(5,16),(6,16),(6,16),(6,16),(7,16),(7,16),(7,16),(8,16),(8,16),(8,16),(9,16),(9,16),(10,16),(10,16),(10,16),(10,16),(11,16),(11,16),(11,16),(12,16),(12,16),(12,16),(13,16),(13,16),(13,16),(14,16),(14,16),(14,16),(15,16),(15,16),(15,16),(16,16),(16,16),(16,16),(17,16),(17,16),(17,16),(18,16),(18,16),(18,16),(19,16),(19,16),(19,16),(20,16),(20,16),(20,16),(21,16),(21,16),(21,16),(21,16),(21,16),(21,16),(22,16),(22,16),(22,16),(23,16),(23,16),(23,16),(24,16),(24,16),(24,16),(24,16),(25,16),(25,16),(25,16),(26,16),(26,16),(26,16),(26,16),(27,16),(27,16),(27,16),(28,16),(28,16),(28,16),(28,16),(29,16),(29,16),(29,16),(30,16),(30,16),(30,16),(31,16),(31,16),(31,16),(31,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),(32,16),],
]
;

/// For each Virtual (x,y) Coordinate, return the Bounding Box (left, top, right, bottom) that encloses the corresponding Physical (x,y) Coordinates.
/// Used by the CHIP-8 Emulator to decide which Physical Pixels to redraw when a Virtual Pixel is updated.
/// Since X and Y are symmetric, this grid only covers one quadrant (X >= 0, Y >= 0)
#[cfg(feature = "chip8_curve")]  //  If we are rendering CHIP8 Emulator as curved surface...
static VIRTUAL_TO_PHYSICAL_MAP: &[[(u8,u8,u8,u8); VIRTUAL_TO_PHYSICAL_MAP_WIDTH]; VIRTUAL_TO_PHYSICAL_MAP_HEIGHT] = &  //  Row=Y, Col=X
//  Copied from output of https://github.com/lupyuen/interpolate-surface
[[(0,0,4,6),(5,0,8,6),(9,0,12,6),(13,0,16,6),(17,0,21,6),(22,0,25,6),(26,0,29,6),(29,0,33,6),(33,0,36,6),(37,0,40,6),(42,0,45,6),(46,0,49,6),(49,0,52,6),(53,0,56,6),(56,0,60,6),(60,0,64,6),(64,0,68,6),(67,0,71,6),(71,0,75,6),(74,0,79,6),(77,0,82,6),(81,0,86,6),(85,0,90,6),(88,0,93,5),(92,0,96,5),(95,0,99,5),(99,0,102,5),(102,0,106,5),(106,0,109,5),(110,0,112,4),(113,0,116,4),(116,0,119,4),],
[(0,7,4,12),(5,7,8,12),(9,7,12,12),(13,7,16,12),(17,7,21,12),(22,7,25,12),(25,7,28,12),(29,7,32,12),(33,7,36,12),(37,7,40,12),(42,7,45,12),(45,7,48,12),(49,7,52,12),(53,7,56,12),(56,7,59,11),(60,7,64,11),(64,7,67,11),(68,7,71,11),(72,7,75,11),(75,7,78,11),(79,7,82,11),(82,7,86,11),(87,6,89,11),(90,6,92,11),(93,6,96,10),(96,6,99,10),(99,6,102,10),(103,6,106,10),(107,5,109,9),(110,5,112,9),(113,5,115,9),(116,5,119,9),],
[(0,13,4,19),(5,13,8,18),(9,13,12,18),(13,13,16,18),(17,13,21,18),(21,13,24,18),(25,13,28,18),(29,13,32,18),(33,13,36,18),(37,13,40,18),(40,13,44,18),(45,13,48,18),(49,13,52,18),(52,12,55,18),(56,12,59,17),(60,12,63,17),(64,12,67,17),(68,12,71,17),(71,12,74,17),(75,12,78,17),(78,12,81,17),(82,12,86,16),(86,12,89,16),(90,11,92,16),(93,11,95,15),(96,11,98,15),(99,11,102,15),(102,10,106,15),(107,10,109,14),(110,10,112,14),(113,10,115,14),(116,10,118,13),],
[(0,21,4,26),(5,19,8,26),(9,19,12,26),(13,19,16,26),(16,19,19,26),(21,19,24,26),(25,19,28,26),(29,19,32,25),(32,19,35,25),(36,19,39,25),(40,19,44,25),(45,19,48,25),(48,19,51,25),(52,18,55,25),(56,18,58,24),(59,18,63,24),(64,18,67,24),(67,18,70,24),(71,18,74,23),(75,18,77,23),(78,17,81,23),(82,17,85,23),(86,17,89,23),(89,17,92,22),(92,16,95,22),(96,16,98,21),(99,16,101,21),(102,15,106,21),(106,15,109,19),(109,15,112,19),(113,15,115,18),(116,14,118,18),],
[(0,27,4,32),(5,27,8,32),(9,27,12,32),(13,27,15,32),(16,27,19,32),(21,27,24,32),(25,26,28,32),(28,26,31,32),(32,26,35,32),(36,26,39,32),(40,26,44,31),(44,26,47,31),(48,26,51,31),(51,25,54,31),(55,25,58,30),(59,25,63,30),(63,25,66,30),(67,25,70,30),(70,24,73,29),(74,24,77,29),(78,24,81,29),(81,24,85,28),(86,23,88,28),(89,23,91,27),(92,22,95,27),(95,22,98,26),(98,22,101,26),(101,21,105,26),(106,21,108,25),(109,21,112,25),(112,19,115,24),(116,19,118,24),],
[(0,33,4,38),(5,33,8,38),(9,33,12,38),(12,33,15,38),(16,33,19,38),(21,33,24,38),(24,33,27,38),(28,33,31,38),(32,33,35,38),(35,32,39,38),(39,32,43,37),(44,32,47,37),(47,32,50,37),(51,32,54,37),(54,31,57,37),(58,31,61,36),(61,31,66,36),(66,30,69,36),(70,30,73,35),(73,30,77,35),(77,29,80,35),(81,29,85,34),(85,28,88,33),(88,28,91,33),(91,28,94,32),(94,27,97,32),(97,27,100,31),(100,26,103,31),(105,26,108,30),(108,25,111,30),(111,25,114,29),(115,25,118,29),],
[(0,39,4,46),(5,39,8,45),(9,39,11,45),(12,39,15,45),(16,39,19,45),(19,39,23,45),(24,39,27,45),(27,39,31,45),(31,39,34,45),(35,38,38,44),(38,38,43,44),(43,38,46,44),(46,38,50,44),(50,38,53,44),(53,37,57,44),(57,37,60,44),(61,37,65,43),(65,37,68,43),(69,36,72,43),(72,36,76,43),(76,36,79,42),(79,35,82,42),(82,34,87,40),(87,33,90,39),(90,33,93,38),(93,32,96,37),(96,32,99,36),(99,31,103,36),(103,31,107,35),(107,30,110,35),(110,30,113,34),(113,29,117,34),],
[(0,47,4,52),(5,46,8,52),(8,46,11,51),(12,46,15,51),(15,46,18,51),(19,46,23,51),(23,46,26,51),(27,46,30,51),(30,45,34,51),(34,45,37,50),(38,45,42,50),(42,45,45,50),(46,45,49,50),(49,45,52,50),(53,45,56,50),(56,44,59,50),(59,44,64,50),(64,44,67,49),(68,44,71,49),(71,43,75,49),(74,43,78,49),(78,42,81,48),(81,40,85,47),(85,39,89,46),(89,38,92,45),(92,37,95,44),(95,37,98,43),(98,36,101,42),(101,36,105,40),(105,35,109,40),(108,35,112,39),(112,34,115,39),],
[(0,53,4,58),(5,53,7,58),(8,52,11,58),(12,52,14,57),(15,52,18,57),(19,52,22,57),(23,52,26,57),(26,52,29,57),(30,51,33,56),(33,51,36,56),(37,51,40,56),(40,51,44,56),(45,51,48,56),(48,51,51,56),(52,51,55,56),(55,51,58,56),(59,50,63,56),(63,50,66,56),(67,50,70,56),(70,50,73,55),(74,49,77,55),(77,48,80,54),(80,48,84,54),(84,46,87,52),(87,45,90,51),(90,44,94,50),(93,43,97,49),(96,42,100,48),(100,42,103,47),(103,40,107,46),(107,40,110,45),(110,39,114,44),],
[(0,59,4,65),(5,59,7,65),(8,58,11,65),(11,58,14,64),(15,58,17,64),(18,58,22,64),(22,58,25,64),(26,58,29,64),(29,57,32,63),(33,57,36,63),(36,57,39,63),(40,57,44,63),(44,57,47,63),(47,57,50,63),(51,57,54,63),(54,57,57,63),(58,57,61,61),(61,57,65,61),(66,56,69,63),(69,56,72,63),(72,56,76,63),(76,55,79,61),(79,54,82,60),(82,53,86,59),(86,51,89,57),(89,50,92,56),(92,49,95,55),(95,48,98,53),(98,47,102,52),(101,46,106,51),(106,46,109,50),(109,45,112,49),],
[(0,66,4,71),(5,66,7,71),(8,66,10,71),(11,65,14,70),(14,65,17,70),(18,65,21,70),(22,65,25,70),(25,64,28,69),(29,64,32,69),(32,64,35,69),(35,64,38,69),(39,64,43,68),(43,64,46,68),(46,64,49,68),(49,64,53,68),(53,63,56,68),(56,63,60,68),(59,63,64,68),(64,63,68,68),(68,64,71,68),(71,63,75,68),(75,63,78,68),(78,60,81,67),(81,59,85,65),(85,57,88,64),(87,56,91,63),(91,55,94,60),(94,54,97,59),(97,53,100,58),(100,52,103,57),(103,51,107,56),(107,50,111,55),],
[(0,72,4,76),(4,72,7,76),(8,71,10,76),(11,71,13,76),(14,71,17,75),(17,71,21,75),(21,70,24,75),(24,70,27,75),(28,70,31,75),(31,70,34,74),(34,70,37,74),(37,69,42,74),(42,69,45,73),(45,69,48,73),(48,69,51,73),(51,69,55,73),(54,69,58,73),(58,69,63,73),(61,69,66,73),(66,69,70,73),(69,69,73,73),(73,69,76,72),(76,68,79,72),(79,66,82,71),(82,64,86,69),(86,63,89,68),(89,61,92,67),(92,59,95,65),(95,58,98,64),(98,57,101,63),(101,56,106,61),(105,55,109,60),],
[(0,77,3,82),(4,77,7,81),(7,77,10,81),(10,77,13,81),(13,76,16,81),(16,76,19,81),(21,76,23,80),(24,76,26,80),(27,75,30,80),(30,75,33,80),(33,75,36,79),(36,75,39,79),(39,74,44,79),(43,74,47,78),(46,74,50,78),(50,74,53,78),(53,74,56,78),(56,74,60,77),(60,74,64,77),(64,74,68,77),(67,74,71,77),(70,73,74,77),(74,72,77,76),(77,71,80,75),(80,69,85,74),(84,69,87,73),(87,67,90,72),(90,65,94,70),(93,65,96,69),(96,63,99,68),(99,61,103,67),(102,60,107,65),],
[(0,82,3,88),(4,82,6,88),(7,82,9,87),(10,82,12,87),(13,82,15,87),(16,82,18,87),(19,81,23,87),(23,81,26,87),(26,81,29,86),(29,81,32,86),(32,80,35,86),(35,80,38,86),(38,79,42,85),(42,79,45,85),(45,79,48,84),(48,79,51,84),(51,78,55,84),(54,78,58,82),(58,78,61,82),(61,78,66,82),(65,78,69,82),(68,77,72,81),(71,77,75,81),(75,76,78,79),(78,75,81,78),(81,73,85,77),(85,72,88,76),(88,71,91,75),(91,69,95,74),(94,68,97,73),(97,67,100,71),(100,66,103,70),],
[(0,89,3,93),(4,89,6,93),(7,88,9,93),(10,88,12,93),(13,88,15,92),(16,88,18,92),(18,88,22,92),(22,87,25,92),(25,87,28,92),(28,87,31,92),(31,87,34,91),(34,86,37,91),(37,86,40,90),(40,85,44,90),(44,85,47,90),(47,85,50,89),(50,84,53,89),(53,84,56,88),(56,84,59,88),(59,84,63,87),(63,82,67,87),(66,82,70,87),(70,81,73,86),(73,80,76,85),(76,79,79,84),(79,77,84,82),(82,77,86,81),(86,76,89,79),(89,74,92,78),(92,73,95,77),(95,72,98,76),(98,70,102,75),],
[(0,94,3,98),(4,94,6,98),(7,94,9,98),(10,93,12,98),(13,93,14,98),(15,93,17,98),(18,93,21,97),(22,93,24,97),(25,93,27,97),(27,92,30,97),(30,92,33,97),(33,92,36,96),(36,91,39,96),(39,91,43,95),(43,90,46,95),(46,90,48,94),(49,89,52,94),(51,89,55,94),(55,89,57,93),(57,88,61,93),(60,88,65,92),(64,87,68,92),(67,87,71,91),(70,85,74,90),(73,84,77,89),(77,82,80,87),(80,81,84,86),(84,80,87,85),(87,79,90,84),(90,77,94,82),(93,77,96,81),(96,75,99,79),],
]
;