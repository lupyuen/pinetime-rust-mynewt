# boot_stub: Bootloader Stub for Apache Mynewt on STM32

This is a stub bootloader for STM32.  We jump straight into the application without performing other bootloader functions.

This simple bootloader occupies under 4 KB of ROM and allows the application to take up more ROM space (up to 60 KB on Blue Pill).