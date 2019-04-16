# `semihosting_console`

Mynewt Library that implements the `console` interface for displaying
messages on the Arm Semihosting console. It works with Blue Pill connected
via STLink V2 and OpenOCD.

All messages are cached in memory until `console_flush()` is called,
or when the console enters blocking mode.
