In archive target/thumbv7m-none-eabi/debug/libmylib.rlib:

mylib-87c29e27ea1a99f8.74ob4uc6zd55kc3.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 74ob4uc6zd55kc3
0000006d l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
00000062 l       .debug_str	00000000 
00000068 l       .debug_str	00000000 
0000007e l       .debug_str	00000000 
00000000 l    d  .text.main	00000000 .text.main
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text.main	00000004 main



Disassembly of section .text.main:

00000000 <main>:
// extern crate panic_semihosting; // logs messages to the host stderr; requires a debugger

// use cortex_m::asm;
use cortex_m_rt::entry;

extern crate libc;
   0:	e7ff      	b.n	2 <main+0x2>
use libc::{c_int, size_t};

#[link(name = "libs_semihosting_console")]
extern {
   2:	e7fe      	b.n	2 <main+0x2>
