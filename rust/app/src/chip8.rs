//  Chip8 Emulator App
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
const CHIP8_TASK_STACK_SIZE: usize = 3072;  //  Must be 3072 and above because CHIP8 Emulator requires substantial stack space

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
        128,    //  Task priority: highest is 0, lowest is 255 (main task is 127)
        os::OS_WAIT_FOREVER as u32,     //  Don't do sanity / watchdog checking
        unsafe { &mut CHIP8_TASK_STACK }, //  Stack space for the task
        CHIP8_TASK_STACK_SIZE as u16      //  Size of the stack (in 4-byte units)
    ) ? ;                               //  `?` means check for error

    //  Return success to the caller
    Ok(())
}

///  Run the emulator
extern "C" fn task_func(_arg: Ptr) {    
    //  Create the emulator
    let chip8 = libchip8::Chip8::new(Hardware);

    //  This will block until emulator terminates
    console::print("CHIP8 started\n"); console::flush();
    chip8.run(include_bytes!("../roms/invaders.ch8"));

    //  Should not come here
    console::print("CHIP8 done\n"); console::flush();
    assert!(false, "CHIP8 should not end");
}

const SCREEN_WIDTH: usize = 64;
const SCREEN_HEIGHT: usize = 32;
const PIXEL_SIZE: i32 = 3;
static mut SCREEN_BUFFER: [u8; SCREEN_WIDTH * SCREEN_HEIGHT] = [0; SCREEN_WIDTH * SCREEN_HEIGHT];

struct Hardware;

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
        console::print("set "); console::printint(x as i32); console::print(", "); console::printint(y as i32); console::print("\n"); console::flush(); ////
        let i = x + y * SCREEN_WIDTH;
        unsafe { SCREEN_BUFFER[i] = if d { 1 } else { 0 } };
        let x_scaled: i32 = x as i32 * PIXEL_SIZE;
        let y_scaled: i32 = y as i32 * PIXEL_SIZE; 
        let color = if d { Rgb565::from(( 0x00, 0x00, 0xff )) } else { Rgb565::from(( 0x00, 0x00, 0x00 )) };
        let pixel = Rectangle::<Rgb565>
            ::new( Coord::new( x_scaled, y_scaled ), Coord::new( x_scaled + PIXEL_SIZE - 1, y_scaled + PIXEL_SIZE - 1 ) ) //  Square coordinates
            .fill( Some( color ) );
        druid::draw_to_display(pixel);

        //  trace!("Set pixel ({},{})", x, y);
        //  self.vram[(y * self.vramsz.0) + x] = d;
    }

    fn vram_get(&mut self, x: usize, y: usize) -> bool {
        //  Get the current state of a pixel in the screen.
        let i = x + y * SCREEN_WIDTH;
        unsafe { SCREEN_BUFFER[i] != 0 }
        //  self.vram[(y * self.vramsz.0) + x]
    }

    fn vram_setsize(&mut self, _size: (usize, usize)) {
        //  Set the size of the screen.
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
        os::os_time_get as u64 * 1000_u64 * 1000_u64
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
        //  Tickle the watchdog so that the Watchdog Timer doesn't expire. Mynewt assumes the process is hung if we don't tickle the watchdog.
        unsafe { hal_watchdog_tickle() };
        //  unsafe { os::os_time_delay(1) };
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