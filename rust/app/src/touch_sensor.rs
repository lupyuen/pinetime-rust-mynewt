use mynewt::{
    result::*,
    hw::hal,
    sys::console,
};

/// Probe the I2C bus
pub fn probe() -> MynewtResult<()> {
    for addr in 1..255 {
        let rc = unsafe { hal::hal_i2c_master_probe(1, addr, 1000) };
        if rc != hal::HAL_I2C_ERR_ADDR_NACK as i32 {
            //  I2C device found
            console::print("0x"); console::printhex(addr); console::print(": ");
            console::printhex(rc as u8); console::print("\n"); console::flush();
        }
    }
    console::print("Done\n"); console::flush();
    Ok(())
}

/* I2C devices found:
0x18: 00
0x44: 00
0x98: 00
0xc4: 00
*/