#![no_std]
// #![no_main]

// pick a panicking behavior
extern crate panic_halt; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// extern crate panic_abort; // requires nightly
// extern crate panic_itm; // logs messages over ITM; requires ITM support
// extern crate panic_semihosting; // logs messages to the host stderr; requires a debugger

// use cortex_m::asm;
use cortex_m_rt::entry;

#[link(name = "libs_semihosting_console")]
extern {
    // void console_buffer(const char *buffer, unsigned int length);  //  Add the string to the output buffer.
    fn console_buffer(buffer: *const u8, length: u32);  //  Add the string to the output buffer.

    // void console_printhex(uint8_t v);  //  Write a char in hexadecimal to the output buffer.
    fn console_printhex(v: u8);  //  Write a char in hexadecimal to the output buffer.

    // void console_printfloat(float f);  //  Write a float to the output buffer, with 1 decimal place.
    //  fn console_printfloat(float f);  //  Write a float to the output buffer, with 1 decimal place.

    // void console_dump(const uint8_t *buffer, unsigned int len);  //  Append "length" number of bytes from "buffer" to the output buffer in hex format.
    fn console_dump(buffer: *const u8, len: u32);  //  Append "length" number of bytes from "buffer" to the output buffer in hex format.

    // void console_flush(void);  //  Flush the output buffer to the console.
    fn console_flush();  //  Flush the output buffer to the console.

    /*
    fn snappy_compress(input: *const u8,
                       input_length: size_t,
                       compressed: *mut u8,
                       compressed_length: *mut size_t) -> c_int;
    fn snappy_uncompress(compressed: *const u8,
                         compressed_length: size_t,
                         uncompressed: *mut u8,
                         uncompressed_length: *mut size_t) -> c_int;
    fn snappy_max_compressed_length(source_length: size_t) -> size_t;
    fn snappy_uncompressed_length(compressed: *const u8,
                                  compressed_length: size_t,
                                  result: *mut size_t) -> c_int;
    fn snappy_validate_compressed_buffer(compressed: *const u8,
                                         compressed_length: size_t) -> c_int;
    */
}

#[entry]
fn main() -> ! {
    // asm::nop(); // To not have main optimize to abort in release mode, remove when you add code

    loop {
        // your code goes here
    }
}
