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

pub fn test() -> MynewtResult<()> {
    for addr in &[
        0x18u8, 
        0x44u8, 
        0x98u8, 
        0xc4u8
    ] {
        unsafe { 
            I2C_BUFFER[0] = 0xaf;  //  Register to be read
            I2C_DATA.address = *addr;
            I2C_DATA.len = I2C_BUFFER.len() as u16;
            I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
        };
        let rc = unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };

        console::print("write 0x"); console::printhex(*addr); console::print(": ");
        console::printhex(rc as u8); console::print("\n"); console::flush();

        unsafe { 
            I2C_BUFFER[0] = 0x00;
            I2C_DATA.address = *addr;
            I2C_DATA.len = I2C_BUFFER.len() as u16;
            I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();
        };
        let rc = unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };

        console::print("read 0x"); console::printhex(*addr); console::print(": ");
        console::printhex(rc as u8); console::print("\n"); console::flush();

        console::print("value 0x"); console::printhex(unsafe { I2C_BUFFER[0] }); 
        console::print("\n"); console::flush();
    }
    console::print("Done\n"); console::flush();
    Ok(())
}

static mut I2C_BUFFER: [u8; 1] =  [ 0 ];

static mut I2C_DATA: hal::hal_i2c_master_data = hal::hal_i2c_master_data {
    address: 0,
    len:     0,
    buffer:  core::ptr::null_mut(),
};

/*
write 0x18: 00
read 0x18: 00
value 0x00
write 0x44: 00
read 0x44: 00
value 0xa3
write 0x98: 00
read 0x98: 00
value 0x00
write 0xc4: 00
read 0xc4: 00
value 0xa3
*/

/*
From http://www.hynitron.com/upload/1408075960.pdf:
//初始化设置
I2Cm_Write_Data(0xAF, 0x3A); //打开写保护
I2Cm_Write_Data(0x1F,0x00); //关闭扫描
I2Cm_Write_Data(0x12, 0x18); //设置允许多个button被同时触发，调试时关闭噪声保护

//IRQ处理
// 读取所有Button的状态
Button=I2Cm_Read_Data(0x22); //读取感应通道0-7的状态寄存器用于判断其触摸状态
I2Cm_Write_Data(0x1F, 0x01); //清除IRQ（不打开写保护时仅能清除IRQ位，其它控制位不变）
// 客户可以根据Button的信息读取相关感应通道的Signal值并对数据进行进一步处理
*/