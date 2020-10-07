//! Display messages on Arm Semihosting Console (via OpenOCD)
extern crate cortex_m_semihosting;
use cortex_m_semihosting::hio;
use core::fmt::Write;

///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn print(msg: &str) {
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{}", msg)
        .expect("print fail");
}

/*
///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn print_strn(msg: &crate::Strn) {
    //  unsafe { console_buffer(msg.as_ptr(), msg.len() as u32); }
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{}", msg)
        .expect("print fail");
}
*/

///  Add the string to the output buffer.
pub fn buffer(msg: &str) {
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{}", msg)
        .expect("buffer fail");
}

///  Write a byte in hexadecimal to the output buffer.
pub fn printhex(v: u8) {
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{:x}", v)
        .expect("printhex fail");
}

///  Write an int to the output buffer.
pub fn printint(v: i32) {
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{}", v)
        .expect("printint fail");
}

///  Write a float to the output buffer, with 2 decimal places.
pub fn printfloat(v: f32) {
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{:.2}", v)
        .expect("printfloat fail");
}

///  Write a double to the output buffer, with 6 decimal places.
pub fn printdouble(v: f64) {
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{:.6}", v)
        .expect("printint fail");
}

/*
///  Write "length" number of bytes from "buffer" to the output buffer in hex format.
pub fn dump(buffer: *const u8, len: u32) {
    let mut stderr = match hio::hstderr() {
        Ok(fd)  => fd,
        Err(()) => { assert!(false, "stderr fail"); return; }
    };
    write!(stderr, "{}", v)
        .expect("printint fail");
}
*/

///  Flush the output buffer to the console.
pub fn flush() {
}
