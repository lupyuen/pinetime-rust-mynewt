## Bluepill STMF103C8 with 64 KB flash ROM

Updated to fit into 64 KB flash ROM. Should be used with Bootloader Stub `boot_stub`.

Serial "uart0" of mynewt is actually using USART2 peripheral, which has default pin mapping of TX2: A2, RX2: A3

Haven't yet tested SPI, I2C, Timers, etc.

Lots more great info at stm32duino wiki:
https://wiki.stm32duino.com/index.php?title=Blue_Pill

### board pinouts
![enter image description here](https://wiki.stm32duino.com/images/a/ae/Bluepillpinout.gif)

> Written with [StackEdit](https://stackedit.io/).

