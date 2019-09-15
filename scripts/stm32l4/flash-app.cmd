::  Flash Mynewt application on Windows

openocd\bin\openocd.exe -f scripts/stm32l4/flash-init.ocd -f interface/stlink.cfg -c "transport select hla_swd" -f target/stm32l4x.cfg -f scripts/stm32l4/flash-app.ocd
