//! Display messages on Arm Semihosting Console (via OpenOCD)

///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn print(msg: &str) {
    unsafe {
        //  Call the Semihosting Console API, which is unsafe.
        console_buffer(msg.as_ptr(), msg.len() as u32);
        console_flush();  //  TODO: Remove this.
    }
}

///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn print_strn(msg: &crate::Strn) {
    unsafe {
        //  Call the Semihosting Console API, which is unsafe.
        console_buffer(msg.as_ptr(), msg.len() as u32);
        console_flush();  //  TODO: Remove this.
    }
}

///  Add the string to the output buffer.
pub fn buffer(msg: &str) {
    unsafe {
        console_buffer(msg.as_ptr(), msg.len() as u32);
    }
}

///  Write a byte in hexadecimal to the output buffer.
///  C API: `void console_printhex(uint8_t v)`
pub fn printhex(v: u8) {
    unsafe { console_printhex(v); }
}

///  Flush the output buffer to the console.
pub fn flush() {
    unsafe { console_flush(); }
}

///  Import the custom Mynewt library for displaying messages on the Arm Semihosting Console (via OpenOCD).
///  The library is located at `libs/semihosting_console`
#[link(name = "libs_semihosting_console")]  //  Functions below are located in the Mynewt build output `libs_semihosting_console.a`
extern {
    ///  Add the string to the output buffer.
    ///  C API: `void console_buffer(const char *buffer, unsigned int length)`
    fn console_buffer(buffer: *const u8, length: u32);  

    ///  Write a byte in hexadecimal to the output buffer.
    ///  C API: `void console_printhex(uint8_t v)`
    fn console_printhex(v: u8);  

    ///  Write a float to the output buffer, with 1 decimal place.
    ///  C API: `void console_printfloat(float f)`
    fn console_printfloat(f: f32);

    ///  Append "length" number of bytes from "buffer" to the output buffer in hex format.
    ///  C API: `void console_dump(const uint8_t *buffer, unsigned int len)`
    fn console_dump(buffer: *const u8, len: u32);  

    ///  Flush the output buffer to the console.
    ///  C API: `void console_flush(void)`
    fn console_flush();  //  Flush the output buffer to the console.
}
