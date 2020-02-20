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

/// CHIP8 Background Task
static mut CHIP8_TASK: os::os_task = fill_zero!(os::os_task);

/// Stack space for CHIP8 Task, initialised to 0.
static mut CHIP8_TASK_STACK: [os::os_stack_t; CHIP8_TASK_STACK_SIZE] = 
    [0; CHIP8_TASK_STACK_SIZE];

/// Size of the stack (in 4-byte units). Previously `OS_STACK_ALIGN(256)`  
const CHIP8_TASK_STACK_SIZE: usize = 4096;  //  Must be 4096 and above because CHIP8 Emulator requires substantial stack space

/// Render some graphics and text to the PineTime display. `start_display()` must have been called earlier.
pub fn on_start() -> MynewtResult<()> {
    console::print("Rust CHIP8\n"); console::flush();
    
    //  Create black background
    let background = Rectangle::<Rgb565>
        ::new( Coord::new( 0, 0 ), Coord::new( 239, 239 ) )   //  Rectangle coordinates
        .fill( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) );  //  Black

    //  Render background to display
    //  druid::draw_to_display(background);

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

///  Run the emulator
extern "C" fn task_func(_arg: Ptr) {    
    //  Create the hardware API for rendering the emulator
    let hardware = Hardware::new();

    //  Create the emulator
    let chip8 = libchip8::Chip8::new(hardware);
    console::print("CHIP8 started\n"); console::flush();

    //  Load the emulator ROM
    let rom = include_bytes!("../roms/invaders.ch8");
    //  let rom = include_bytes!("../roms/pong.ch8");

    //  Run the emulator ROM. This will block until emulator terminates
    chip8.run(rom);

    //  Should not come here
    console::print("CHIP8 done\n"); console::flush();
    assert!(false, "CHIP8 should not end");
}

/// CHIP8 Virtual Screen size, in Virtual Pixels
const SCREEN_WIDTH: usize = 64;
const SCREEN_HEIGHT: usize = 32;

/// CHIP8 Virtual Block size. We render the CHIP8 Virtual Screen in blocks of Virtual Pixels
const BLOCK_WIDTH: usize = 8;
const BLOCK_HEIGHT: usize = 8;

/// CHIP8 Virtual Pixel size, in Physical Pixels
const PIXEL_WIDTH: usize = 3;
const PIXEL_HEIGHT: usize = 5;

/// CHIP8 Virtual Screen Buffer, 1 byte per Virtual Pixel
static mut SCREEN_BUFFER: [u8; SCREEN_WIDTH * SCREEN_HEIGHT] = [0; SCREEN_WIDTH * SCREEN_HEIGHT];

/// CHIP8 Virtual Pixel mapped to Physical Pixels with 16-bit colour
//  static PIXEL_ON: [u16; PIXEL_WIDTH * PIXEL_HEIGHT] = [0xffff; PIXEL_WIDTH * PIXEL_HEIGHT];
//  static PIXEL_OFF: [u16; PIXEL_WIDTH * PIXEL_HEIGHT] = [0x0; PIXEL_WIDTH * PIXEL_HEIGHT];

/// Max number of Physical Pixels per Virtual Pixel
//  type PixelSize = heapless::consts::U15;  //  PIXEL_WIDTH * PIXEL_HEIGHT

/// Consecutive color words for a Virtual Pixel
//  type PixelColors = heapless::Vec::<u16, PixelSize>;

/// Iterator for each Virtual Pixels in a Virtual Block
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
    /// Start column number for block
    block_left:      u8,
    /// End column number for block
    block_right:     u8,
    /// Start row number for block
    block_top:       u8,
    /// End row number for block
    block_bottom:    u8,
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
        PixelIterator {
            x: block_left, 
            y: block_top,
            x_offset: 0, 
            y_offset: 0,
            block_left, block_right,
            block_top, block_bottom,
        }
    }
    /*
    /// Return true if the block is empty
    pub fn is_empty(&self) -> bool {
        self.x == self.block_left && self.y == self.block_top &&
            self.x_offset == 0 && self.y_offset == 0
    }
    */
    /// Return true if the Virtual Pixel is in the block
    pub fn contains(&self, x: u8, y: u8) -> bool {
        x >= self.block_left && x <= self.block_right &&
            y >= self.block_top && y <= self.block_bottom
    }
    /// Return window of Physical Pixels: (left, top, right, bottom)
    pub fn get_window(&self) -> (u8, u8, u8, u8) {
        let left: u8 = self.block_left as u8 * PIXEL_WIDTH as u8;
        let top: u8 = self.block_top as u8 * PIXEL_HEIGHT as u8; 
        let right: u8 = left + (self.block_right - self.block_left + 1) * PIXEL_WIDTH as u8 - 1;
        let bottom: u8 = top + (self.block_bottom - self.block_top + 1) * PIXEL_HEIGHT as u8 - 1;
        assert!(left < 240 && top < 240 && right < 240 && bottom < 240, "overflow");
        ( left, top, right, bottom )
    }
}

/// Implement the Iterator for Virtual Pixels in a Virtual Block
impl Iterator for PixelIterator {
    /// This Iterator returns Physical Pixel colour words (16-bit)
    type Item = u16;

    /// Return the next Physical Pixel colour
    fn next(&mut self) -> Option<Self::Item> {
        if self.y > self.block_bottom { return None; }  //  No more Physical Pixels

        if self.x >= SCREEN_WIDTH as u8 ||
            self.y >= SCREEN_HEIGHT as u8 { cortex_m::asm::bkpt(); }
        assert!(self.x < SCREEN_WIDTH as u8, "x overflow");
        assert!(self.y < SCREEN_HEIGHT as u8, "y overflow");
        let i = self.x as usize + self.y as usize * SCREEN_WIDTH;
        let color = unsafe { 
            if SCREEN_BUFFER[i] != 0 { 0xffff } else { 0x0 }
        };
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
}

/// Hardware API for rendering CHIP8 Emulator
struct Hardware {
    block: PixelIterator,
}

impl Hardware {
    /// Return a new Hardware API for rendering CHIP8 Emulator
    pub fn new() -> Hardware {
        let left = 0 as u8;
        let top = 0 as u8;
        let right = left + BLOCK_WIDTH as u8  - 1;
        let bottom = top  + BLOCK_HEIGHT as u8 - 1;
        Hardware {
            block: PixelIterator::new(
                left, top, 
                right, bottom
            ),
        }
    }
}

impl libchip8::Hardware for Hardware {
    fn rand(&mut self) -> u8 {
        //  Return a random value.
        123  //  TODO
        //  self.rng.gen()
    }

    fn key(&mut self, _key: u8) -> bool {
        //  Check if the key is pressed.
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

    fn vram_set(&mut self, x: usize, y: usize, d: bool) {
        //  Set the state of a pixel in the screen.
        //  true for white, and false for black.
        //  console::print("set "); console::printint(x as i32); console::print(", "); console::printint(y as i32); console::print("\n"); console::flush(); ////
        assert!(x < SCREEN_WIDTH, "x overflow");
        assert!(y < SCREEN_HEIGHT, "y overflow");
        let i = x + y * SCREEN_WIDTH;
        unsafe { SCREEN_BUFFER[i] = if d { 1 } else { 0 } };

        //  If (x,y) are inside the current block, do nothing.
        if self.block.contains(x as u8, y as u8) { return; }

        //  If (x,y) are outside the current block, render the previous block (if any).
        //  if !self.block.is_empty() {
            let (left, top, right, bottom) = self.block.get_window();
            druid::set_display_pixels(left as u16, top as u16, right as u16, bottom as u16,
                &mut self.block
            ).expect("set pixels failed");    
        //  }

        //  Create a new block.
        let left = x as u8;
        let top = y as u8;
        let right = left + BLOCK_WIDTH as u8  - 1;
        let bottom = top  + BLOCK_HEIGHT as u8 - 1;
        self.block = PixelIterator::new(
            left, top, 
            if right < SCREEN_WIDTH as u8 { right } else { SCREEN_WIDTH as u8 - 1 }, 
            if bottom < SCREEN_HEIGHT as u8 { bottom } else { SCREEN_HEIGHT as u8 - 1 }
        );

        /*
        let x_scaled: u16 = x as u16 * PIXEL_WIDTH as u16;
        let y_scaled: u16 = y as u16 * PIXEL_HEIGHT as u16; 
        assert!(x_scaled < 240 - PIXEL_WIDTH as u16, "x overflow");
        assert!(y_scaled < 240 - PIXEL_HEIGHT as u16, "y overflow");        
        let pixel_colors = if d { &PIXEL_ON } else { &PIXEL_OFF };
        let mut colors = PixelColors::new();
        colors.extend_from_slice(pixel_colors).expect("extend failed");
        druid::set_display_pixels(x_scaled, y_scaled, 
            x_scaled + PIXEL_WIDTH as u16 - 1,
            y_scaled + PIXEL_HEIGHT as u16 - 1,
            colors
        ).expect("set pixels failed");
        */

        /*
        let color = if d { Rgb565::from(( 0x80, 0x80, 0xff )) } else { Rgb565::from(( 0x00, 0x00, 0x00 )) };
        let pixel = Rectangle::<Rgb565>
            ::new( Coord::new( x_scaled, y_scaled ), Coord::new( x_scaled + PIXEL_WIDTH - 1, y_scaled + PIXEL_HEIGHT - 1 ) ) //  Square coordinates
            .fill( Some( color ) );
        druid::draw_to_display(pixel);
        */
        //  trace!("Set pixel ({},{})", x, y);
        //  self.vram[(y * self.vramsz.0) + x] = d;
    }

    fn vram_get(&mut self, x: usize, y: usize) -> bool {
        //  Get the current state of a pixel in the screen.
        //  console::print("get "); console::printint(x as i32); console::print(", "); console::printint(y as i32); console::print("\n"); console::flush(); ////
        assert!(x < SCREEN_WIDTH, "x overflow");
        assert!(y < SCREEN_HEIGHT, "y overflow");
        let i = x + y * SCREEN_WIDTH;
        unsafe { SCREEN_BUFFER[i] != 0 }
        //  self.vram[(y * self.vramsz.0) + x]
    }

    fn vram_setsize(&mut self, size: (usize, usize)) {
        //  Set the size of the screen.
        console::print("setsize "); console::printint(size.0 as i32); console::print(", "); console::printint(size.1 as i32); console::print("\n"); console::flush(); ////
        /*
        self.vramsz = size;
        self.vram = vec![false; size.0 * size.1];

        let win = match Window::new(
            "Chip8",
            64,
            32,
            WindowOptions {
                resize: true,
                scale: Scale::X4,
                ..WindowOptions::default()
            },
        ) {
            Ok(win) => win,
            Err(err) => {
                panic!("Unable to create window {}", err);
            }
        };
        self.win = Some(win);
        */
    }

    fn vram_size(&mut self) -> (usize, usize) {
        //  Get the size of the screen.
        (SCREEN_WIDTH, SCREEN_HEIGHT)
        //  self.vramsz
    }

    fn clock(&mut self) -> u64 {
        //  Return the current clock value in nanoseconds.
        unsafe { os::os_time_get() as u64 * 1000_u64 * 2000_u64 }
        /*
        let d = self.inst.elapsed();
        d.as_secs()
            .wrapping_mul(1000_000_000)
            .wrapping_add(d.subsec_nanos().into())
        */
    }

    fn beep(&mut self) {
        //  Play beep sound.
    }

    fn sched(&mut self) -> bool {
        //  Called in every step; return true for shutdown.
        //  console::print("sched\n"); console::flush(); ////
        //  Tickle the watchdog so that the Watchdog Timer doesn't expire. Mynewt assumes the process is hung if we don't tickle the watchdog.
        unsafe { hal_watchdog_tickle() };
        unsafe { os::os_time_delay(1) };
        false
        /*
        std::thread::sleep(std::time::Duration::from_micros(1000_000 / self.opt.hz));

        if let Some(win) = &mut self.win {
            if !win.is_open() || win.is_key_down(Key::Escape) {
                return true;
            }

            let vram: Vec<u32> = self
                .vram
                .clone()
                .into_iter()
                .map(|b| if b { 0xffffff } else { 0 })
                .collect();
            win.update_with_buffer(&vram).unwrap();
        }
        */
    }
}

pub fn handle_touch(_x: u16, _y: u16) { 
    console::print("CHIP8 touch not handled\n"); console::flush(); 
}

//  TODO: Move this to Mynewt library
extern "C" { 
    /// Tickles the watchdog so that the Watchdog Timer doesn't expire. This needs to be done periodically, before the value configured in hal_watchdog_init() expires.
    fn hal_watchdog_tickle(); 
}