In archive target/thumbv7m-none-eabi/debug/libmylib.rlib:

mylib-50794855a3f9698d.19vpnfslw8lxmhl.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 19vpnfslw8lxmhl
000001af l       .debug_str	00000000 
00000193 l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001a9 l       .debug_str	00000000 
000001c3 l       .debug_str	00000000 
000001c8 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000df l       .debug_str	00000000 
00000119 l       .debug_str	00000000 
0000012a l       .debug_str	00000000 
0000012e l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
00000144 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000155 l       .debug_str	00000000 
00000159 l       .debug_str	00000000 
00000163 l       .debug_str	00000000 
00000167 l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.42a9704cae530334177a2eeb15ae1871.0	00000013 .Lanon.42a9704cae530334177a2eeb15ae1871.0
00000000 l     O .rodata..Lanon.42a9704cae530334177a2eeb15ae1871.1	00000011 .Lanon.42a9704cae530334177a2eeb15ae1871.1
00000000 l    d  .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E	00000000 .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E
00000000 l    d  .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E	00000000 .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 .hidden mylib::base::console_print
00000000 g     F .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E	00000030 .hidden mylib::send_coap::send_sensor_data
00000000 g     F .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E	00000016 .hidden mylib::send_coap::start_network_task



Disassembly of section .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E:

00000000 <mylib::send_coap::start_network_task>:
_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:4
use crate::base::*;
use cstr_core::CStr;

pub fn start_network_task() -> i32 {
   0:	b580      	push	{r7, lr}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:5
    console_print(b"start_network_task\n");
   2:	f240 0000 	movw	r0, #0
   6:	f2c0 0000 	movt	r0, #0
   a:	2113      	movs	r1, #19
   c:	f7ff fffe 	bl	0 <mylib::base::console_print>
  10:	e7ff      	b.n	12 <mylib::send_coap::start_network_task+0x12>
  12:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:7
    0
}
  14:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E:

00000000 <mylib::send_coap::send_sensor_data>:
_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:9

pub fn send_sensor_data(val: *const SensorValue, sensor_node: &'static CStr) -> i32 {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9003      	str	r0, [sp, #12]
   c:	9104      	str	r1, [sp, #16]
   e:	9205      	str	r2, [sp, #20]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:10
    console_print(b"send_sensor_data\n");
  10:	f240 0000 	movw	r0, #0
  14:	f2c0 0000 	movt	r0, #0
  18:	2111      	movs	r1, #17
  1a:	9302      	str	r3, [sp, #8]
  1c:	f8cd c004 	str.w	ip, [sp, #4]
  20:	f8cd e000 	str.w	lr, [sp]
  24:	f7ff fffe 	bl	0 <mylib::base::console_print>
  28:	e7ff      	b.n	2a <mylib::send_coap::send_sensor_data+0x2a>
  2a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:12
    0
}
  2c:	b006      	add	sp, #24
  2e:	bd80      	pop	{r7, pc}

mylib-50794855a3f9698d.2bwhitp1kuocnn5l.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2bwhitp1kuocnn5l
000001a4 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
0000011c l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
00000160 l       .debug_str	00000000 
00000192 l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
000001ad l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001ba l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.3c7544aca6e1f15c8854b110a4791f88.0	0000000d .Lanon.3c7544aca6e1f15c8854b110a4791f88.0
00000000 l     O .rodata..Lanon.3c7544aca6e1f15c8854b110a4791f88.1	00000002 .Lanon.3c7544aca6e1f15c8854b110a4791f88.1
00000000 l     F .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE	0000001c mylib::base::TEMP_STM32_DEVICE
00000000 l    d  .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E	00000000 .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E
00000000 l    d  .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE	00000000 .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE
00000000 l    d  .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E	00000000 .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E
00000000 l    d  .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	00000000 .text._ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::slice::<impl [T]>::len
00000000         *UND*	00000000 core::slice::<impl [T]>::as_ptr
00000000 g     F .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E	00000012 .hidden mylib::base::SENSOR_DEVICE
00000000 g     F .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	0000003c .hidden mylib::base::console_print
00000000 g     F .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E	0000001c .hidden mylib::base::TEMP_SENSOR_KEY
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush



Disassembly of section .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E:

00000000 <mylib::base::SENSOR_DEVICE>:
_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:81
    pub fn os_eventq_run(evq: *const CVoid);
    pub fn os_eventq_dflt_get() -> *const CVoid;
}

//  Must sync with apps/my_sensor_app/src/listen_sensor.h
pub fn SENSOR_DEVICE() -> *const u8 { TEMP_STM32_DEVICE() }  //  We will open internal temperature sensor "temp_stm32_0"
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	f7ff fffe 	bl	0 <mylib::base::SENSOR_DEVICE>
   8:	9001      	str	r0, [sp, #4]
   a:	e7ff      	b.n	c <mylib::base::SENSOR_DEVICE+0xc>
   c:	9801      	ldr	r0, [sp, #4]
   e:	b002      	add	sp, #8
  10:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE:

00000000 <mylib::base::TEMP_STM32_DEVICE>:
_ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:82
pub fn TEMP_STM32_DEVICE() -> *const u8 { b"temp_stm32_0\0".as_ptr() }
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	210d      	movs	r1, #13
   e:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  12:	9001      	str	r0, [sp, #4]
  14:	e7ff      	b.n	16 <mylib::base::TEMP_STM32_DEVICE+0x16>
  16:	9801      	ldr	r0, [sp, #4]
  18:	b002      	add	sp, #8
  1a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E:

00000000 <mylib::base::TEMP_SENSOR_KEY>:
_ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:88

//  Must sync with libs/temp_stm32/include/temp_stm32/temp_stm32.h
//  #if MYNEWT_VAL(RAW_TEMP)                                       //  If we are returning raw temperature (integers)...
pub const TEMP_SENSOR_TYPE: i32       = SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;  //  Set to raw sensor type
pub const TEMP_SENSOR_VALUE_TYPE: i32 = SENSOR_VALUE_TYPE_INT32;         //  Return integer sensor values
pub fn TEMP_SENSOR_KEY() -> *const u8 { b"t\0".as_ptr() }  //  Use key (field name) "t" to transmit raw temperature to CoAP Server or Collector Node
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	2102      	movs	r1, #2
   e:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  12:	9001      	str	r0, [sp, #4]
  14:	e7ff      	b.n	16 <mylib::base::TEMP_SENSOR_KEY+0x16>
  16:	9801      	ldr	r0, [sp, #4]
  18:	b002      	add	sp, #8
  1a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base13console_print17h7239bde54deb9f31E:

00000000 <mylib::base::console_print>:
_ZN5mylib4base13console_print17h7239bde54deb9f31E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:192
pub const SYS_EUNKNOWN    : i32 = -13;
pub const SYS_EREMOTEIO   : i32 = -14;
pub const SYS_EDONE       : i32 = -15;
pub const SYS_EPERUSER : i32 = -65535;

pub fn console_print(msg: &[u8]) {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9003      	str	r0, [sp, #12]
   a:	9104      	str	r1, [sp, #16]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:193
    let len = msg.len();
   c:	9803      	ldr	r0, [sp, #12]
   e:	9904      	ldr	r1, [sp, #16]
  10:	9202      	str	r2, [sp, #8]
  12:	9301      	str	r3, [sp, #4]
  14:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
  18:	9005      	str	r0, [sp, #20]
  1a:	e7ff      	b.n	1c <mylib::base::console_print+0x1c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:195
    unsafe {
        console_buffer(msg.as_ptr(), len as u32);
  1c:	9803      	ldr	r0, [sp, #12]
  1e:	9904      	ldr	r1, [sp, #16]
  20:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  24:	9000      	str	r0, [sp, #0]
  26:	e7ff      	b.n	28 <mylib::base::console_print+0x28>
  28:	9905      	ldr	r1, [sp, #20]
  2a:	9800      	ldr	r0, [sp, #0]
  2c:	f7ff fffe 	bl	0 <console_buffer>
  30:	e7ff      	b.n	2 <console_flush+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:196
        console_flush(); ////
  32:	f7ff fffe 	bl	0 <console_flush>
  36:	e7ff      	b.n	38 <mylib::base::console_print+0x38>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:1
#![no_std]          //  Don't link with standard Rust library
  38:	b006      	add	sp, #24
  3a:	bd80      	pop	{r7, pc}

mylib-50794855a3f9698d.3k67uemb1cshb4cs.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3k67uemb1cshb4cs
000002ff l       .debug_str	00000000 
00000282 l       .debug_str	00000000 
00000292 l       .debug_str	00000000 
00000296 l       .debug_str	00000000 
00000299 l       .debug_str	00000000 
000002a3 l       .debug_str	00000000 
000002ac l       .debug_str	00000000 
000002b4 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002c2 l       .debug_str	00000000 
000002c6 l       .debug_str	00000000 
000002d2 l       .debug_str	00000000 
000002d5 l       .debug_str	00000000 
000002dc l       .debug_str	00000000 
000002e0 l       .debug_str	00000000 
000002ec l       .debug_str	00000000 
000002f8 l       .debug_str	00000000 
00000305 l       .debug_str	00000000 
00000311 l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
00000321 l       .debug_str	00000000 
00000335 l       .debug_str	00000000 
0000033a l       .debug_str	00000000 
0000034b l       .debug_str	00000000 
0000035d l       .debug_str	00000000 
0000036a l       .debug_str	00000000 
00000376 l       .debug_str	00000000 
00000384 l       .debug_str	00000000 
0000039b l       .debug_str	00000000 
000003ad l       .debug_str	00000000 
000003cd l       .debug_str	00000000 
000003d6 l       .debug_str	00000000 
000003df l       .debug_str	00000000 
000003f1 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000090 l       .debug_str	00000000 
00000099 l       .debug_str	00000000 
0000009e l       .debug_str	00000000 
000000ad l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000d1 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
00000146 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000155 l       .debug_str	00000000 
00000164 l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
000001de l       .debug_str	00000000 
000001f4 l       .debug_str	00000000 
00000233 l       .debug_str	00000000 
00000244 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.0	0000000a .Lanon.0b256f51abc682f8d65b4afaed11e7f9.0
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.11	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.11
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.12	00000016 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.12
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.13	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.13
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.14	00000001 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.14
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.15	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.15
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.16	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.16
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.17	00000019 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.17
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.3	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.3
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.5	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.5
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.6	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.6
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.7	00000011 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.7
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.9	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.9
00000000 l     F .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE	0000013e mylib::listen_sensor::get_temperature
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E	0000011a mylib::listen_sensor::read_temperature
00000000 l     O .data._ZN5mylib13listen_sensor8LISTENER17hb80742a786b12deeE	00000010 mylib::listen_sensor::LISTENER
00000000 l    d  .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	00000000 .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E	00000000 .text._ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E
00000000 l    d  .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE	00000000 .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE
00000000 l    d  .data._ZN5mylib13listen_sensor8LISTENER17hb80742a786b12deeE	00000000 .data._ZN5mylib13listen_sensor8LISTENER17hb80742a786b12deeE
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.1	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.1
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.2	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.2
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.4	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.4
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.8	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.8
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.10	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.10
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::slice::<impl [T]>::as_ptr
00000000         *UND*	00000000 core::panicking::panic
00000000 g     F .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	000000ac .hidden mylib::listen_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden mylib::base::SENSOR_DEVICE
00000000         *UND*	00000000 .hidden mylib::base::console_print
00000000         *UND*	00000000 .hidden mylib::base::TEMP_SENSOR_KEY
00000000         *UND*	00000000 .hidden mylib::send_coap::send_sensor_data
00000000         *UND*	00000000 cstr_core::CStr::from_ptr
00000000         *UND*	00000000 device_get_name
00000000         *UND*	00000000 get_temp_data
00000000         *UND*	00000000 get_temp_raw_data
00000000         *UND*	00000000 is_null_sensor
00000000         *UND*	00000000 is_null_sensor_data
00000000         *UND*	00000000 null_sensor
00000000         *UND*	00000000 sensor_get_device
00000000         *UND*	00000000 sensor_mgr_find_next_bydevname
00000000         *UND*	00000000 sensor_register_listener
00000000         *UND*	00000000 sensor_set_poll_rate_ms



Disassembly of section .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE:

00000000 <mylib::listen_sensor::start_sensor_listener>:
_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:21
};

/////////////////////////////////////////////////////////
//  Listen To Local Sensor

pub fn start_sensor_listener() -> i32 {
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:33
        /* if (is_collector_node()) {                    //  If this is a Collector Node...
            return start_remote_sensor_listeners();   //  Start the Listener for every Remote Sensor.
        } */

        //  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
        console_print(b"TMP poll \n");  //  SENSOR_DEVICE "\n";
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	210a      	movs	r1, #10
   e:	f7ff fffe 	bl	0 <mylib::base::console_print>
  12:	e7ff      	b.n	2 <mylib::base::SENSOR_DEVICE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:36

        //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
        let rc = sensor_set_poll_rate_ms(SENSOR_DEVICE(), SENSOR_POLL_TIME);
  14:	f7ff fffe 	bl	0 <mylib::base::SENSOR_DEVICE>
  18:	9004      	str	r0, [sp, #16]
  1a:	e7ff      	b.n	1c <mylib::listen_sensor::start_sensor_listener+0x1c>
  1c:	f242 7110 	movw	r1, #10000	; 0x2710
  20:	9804      	ldr	r0, [sp, #16]
  22:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
  26:	9005      	str	r0, [sp, #20]
  28:	e7ff      	b.n	2a <mylib::listen_sensor::start_sensor_listener+0x2a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:37
        assert!(rc == 0);
  2a:	9805      	ldr	r0, [sp, #20]
  2c:	2800      	cmp	r0, #0
  2e:	d007      	beq.n	40 <mylib::listen_sensor::start_sensor_listener+0x40>
  30:	e7ff      	b.n	32 <mylib::listen_sensor::start_sensor_listener+0x32>
  32:	f240 0000 	movw	r0, #0
  36:	f2c0 0000 	movt	r0, #0
  3a:	f7ff fffe 	bl	0 <core::panicking::panic>
  3e:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:40

        //  Fetch the sensor by name, without locking the driver for exclusive access.
        let listen_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE(), null_sensor());
  40:	f7ff fffe 	bl	0 <mylib::base::SENSOR_DEVICE>
  44:	9003      	str	r0, [sp, #12]
  46:	e7ff      	b.n	48 <mylib::listen_sensor::start_sensor_listener+0x48>
  48:	f7ff fffe 	bl	0 <null_sensor>
  4c:	9002      	str	r0, [sp, #8]
  4e:	e7ff      	b.n	50 <mylib::listen_sensor::start_sensor_listener+0x50>
  50:	9803      	ldr	r0, [sp, #12]
  52:	9902      	ldr	r1, [sp, #8]
  54:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  58:	9006      	str	r0, [sp, #24]
  5a:	e7ff      	b.n	5c <mylib::listen_sensor::start_sensor_listener+0x5c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:41
        assert!(!is_null_sensor(listen_sensor));
  5c:	9806      	ldr	r0, [sp, #24]
  5e:	f7ff fffe 	bl	0 <is_null_sensor>
  62:	9001      	str	r0, [sp, #4]
  64:	e7ff      	b.n	66 <mylib::listen_sensor::start_sensor_listener+0x66>
  66:	9801      	ldr	r0, [sp, #4]
  68:	07c1      	lsls	r1, r0, #31
  6a:	2900      	cmp	r1, #0
  6c:	d007      	beq.n	7e <mylib::listen_sensor::start_sensor_listener+0x7e>
  6e:	e7ff      	b.n	70 <mylib::listen_sensor::start_sensor_listener+0x70>
  70:	f240 0000 	movw	r0, #0
  74:	f2c0 0000 	movt	r0, #0
  78:	f7ff fffe 	bl	0 <core::panicking::panic>
  7c:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:44

        //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
        let rc = sensor_register_listener(listen_sensor, &LISTENER);
  7e:	9806      	ldr	r0, [sp, #24]
  80:	f240 0100 	movw	r1, #0
  84:	f2c0 0100 	movt	r1, #0
  88:	f7ff fffe 	bl	0 <sensor_register_listener>
  8c:	9007      	str	r0, [sp, #28]
  8e:	e7ff      	b.n	90 <mylib::listen_sensor::start_sensor_listener+0x90>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:45
        assert!(rc == 0);
  90:	9807      	ldr	r0, [sp, #28]
  92:	2800      	cmp	r0, #0
  94:	d007      	beq.n	a6 <mylib::listen_sensor::start_sensor_listener+0xa6>
  96:	e7ff      	b.n	98 <mylib::listen_sensor::start_sensor_listener+0x98>
  98:	f240 0000 	movw	r0, #0
  9c:	f2c0 0000 	movt	r0, #0
  a0:	f7ff fffe 	bl	0 <core::panicking::panic>
  a4:	defe      	udf	#254	; 0xfe
  a6:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:48
    }
    0
}
  a8:	b008      	add	sp, #32
  aa:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E:

00000000 <mylib::listen_sensor::read_temperature>:
_ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:58
//  TODO

/////////////////////////////////////////////////////////
//  Process Temperature Sensor Value (Raw and Computed)

extern fn read_temperature(sensor: SensorPtr, arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b096      	sub	sp, #88	; 0x58
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9008      	str	r0, [sp, #32]
   e:	9109      	str	r1, [sp, #36]	; 0x24
  10:	920a      	str	r2, [sp, #40]	; 0x28
  12:	930b      	str	r3, [sp, #44]	; 0x2c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:65
    //  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through sensor_data.
    //  If this is a Sensor Node, we send the sensor data to the Collector Node.
    //  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    //  Return 0 if we have processed the sensor data successfully.
    unsafe {
        console_print(b"read_temperature\n");
  14:	f240 0000 	movw	r0, #0
  18:	f2c0 0000 	movt	r0, #0
  1c:	2111      	movs	r1, #17
  1e:	f8cd c01c 	str.w	ip, [sp, #28]
  22:	f8cd e018 	str.w	lr, [sp, #24]
  26:	9405      	str	r4, [sp, #20]
  28:	9504      	str	r5, [sp, #16]
  2a:	f7ff fffe 	bl	0 <mylib::base::console_print>
  2e:	e7ff      	b.n	30 <mylib::listen_sensor::read_temperature+0x30>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:68
        //  Check that the temperature data is valid.
        //  TODO
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
  30:	980a      	ldr	r0, [sp, #40]	; 0x28
  32:	f7ff fffe 	bl	0 <is_null_sensor_data>
  36:	9003      	str	r0, [sp, #12]
  38:	e7ff      	b.n	3a <mylib::listen_sensor::read_temperature+0x3a>
  3a:	9803      	ldr	r0, [sp, #12]
  3c:	07c1      	lsls	r1, r0, #31
  3e:	2900      	cmp	r1, #0
  40:	d007      	beq.n	52 <mylib::listen_sensor::read_temperature+0x52>
  42:	e7ff      	b.n	44 <mylib::listen_sensor::read_temperature+0x44>
  44:	f06f 0001 	mvn.w	r0, #1
  48:	900c      	str	r0, [sp, #48]	; 0x30
  4a:	e7ff      	b.n	4c <mylib::listen_sensor::read_temperature+0x4c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:100
        }
        assert!(rc == 0);
        //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    0
}
  4c:	980c      	ldr	r0, [sp, #48]	; 0x30
  4e:	b016      	add	sp, #88	; 0x58
  50:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:69
        assert!(is_null_sensor(sensor));
  52:	9808      	ldr	r0, [sp, #32]
  54:	f7ff fffe 	bl	0 <is_null_sensor>
  58:	9002      	str	r0, [sp, #8]
  5a:	e7ff      	b.n	5c <mylib::listen_sensor::read_temperature+0x5c>
  5c:	9802      	ldr	r0, [sp, #8]
  5e:	07c1      	lsls	r1, r0, #31
  60:	2900      	cmp	r1, #0
  62:	d107      	bne.n	74 <mylib::listen_sensor::read_temperature+0x74>
  64:	e7ff      	b.n	66 <mylib::listen_sensor::read_temperature+0x66>
  66:	f240 0000 	movw	r0, #0
  6a:	f2c0 0000 	movt	r0, #0
  6e:	f7ff fffe 	bl	0 <core::panicking::panic>
  72:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:73
        let device = sensor_get_device(sensor);
  74:	9808      	ldr	r0, [sp, #32]
  76:	f7ff fffe 	bl	0 <sensor_get_device>
  7a:	900d      	str	r0, [sp, #52]	; 0x34
  7c:	e7ff      	b.n	7e <mylib::listen_sensor::read_temperature+0x7e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:74
        let c_buf: *const c_char = device_get_name(device);
  7e:	980d      	ldr	r0, [sp, #52]	; 0x34
  80:	f7ff fffe 	bl	0 <device_get_name>
  84:	900e      	str	r0, [sp, #56]	; 0x38
  86:	e7ff      	b.n	88 <mylib::listen_sensor::read_temperature+0x88>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:75
        let device_name: &CStr = CStr::from_ptr(c_buf);
  88:	980e      	ldr	r0, [sp, #56]	; 0x38
  8a:	f7ff fffe 	bl	0 <cstr_core::CStr::from_ptr>
  8e:	9001      	str	r0, [sp, #4]
  90:	9100      	str	r1, [sp, #0]
  92:	e7ff      	b.n	94 <mylib::listen_sensor::read_temperature+0x94>
  94:	9801      	ldr	r0, [sp, #4]
  96:	900f      	str	r0, [sp, #60]	; 0x3c
  98:	9900      	ldr	r1, [sp, #0]
  9a:	9110      	str	r1, [sp, #64]	; 0x40
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:79
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
  9c:	990a      	ldr	r1, [sp, #40]	; 0x28
  9e:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
  a0:	a811      	add	r0, sp, #68	; 0x44
  a2:	f7ff fffe 	bl	0 <mylib::listen_sensor::read_temperature>
  a6:	e7ff      	b.n	a8 <mylib::listen_sensor::read_temperature+0xa8>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:80
        assert!(temp_sensor_value.val_type != 0);
  a8:	9812      	ldr	r0, [sp, #72]	; 0x48
  aa:	2800      	cmp	r0, #0
  ac:	d107      	bne.n	be <mylib::listen_sensor::read_temperature+0xbe>
  ae:	e7ff      	b.n	b0 <mylib::listen_sensor::read_temperature+0xb0>
  b0:	f240 0000 	movw	r0, #0
  b4:	f2c0 0000 	movt	r0, #0
  b8:	f7ff fffe 	bl	0 <core::panicking::panic>
  bc:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:81
        if temp_sensor_value.val_type == 0 { return -1; }  //  Invalid type.
  be:	9812      	ldr	r0, [sp, #72]	; 0x48
  c0:	2800      	cmp	r0, #0
  c2:	d105      	bne.n	d0 <mylib::listen_sensor::read_temperature+0xd0>
  c4:	e7ff      	b.n	c6 <mylib::listen_sensor::read_temperature+0xc6>
  c6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
  ca:	900c      	str	r0, [sp, #48]	; 0x30
  cc:	e7ff      	b.n	ce <mylib::listen_sensor::read_temperature+0xce>
  ce:	e7bd      	b.n	4c <mylib::listen_sensor::read_temperature+0x4c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:88
        let rc = send_sensor_data(&temp_sensor_value, device_name);
  d0:	990f      	ldr	r1, [sp, #60]	; 0x3c
  d2:	9a10      	ldr	r2, [sp, #64]	; 0x40
  d4:	a811      	add	r0, sp, #68	; 0x44
  d6:	f7ff fffe 	bl	0 <mylib::send_coap::send_sensor_data>
  da:	9015      	str	r0, [sp, #84]	; 0x54
  dc:	e7ff      	b.n	de <mylib::listen_sensor::read_temperature+0xde>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:92
        if rc == SYS_EAGAIN {
  de:	9815      	ldr	r0, [sp, #84]	; 0x54
  e0:	3006      	adds	r0, #6
  e2:	2800      	cmp	r0, #0
  e4:	d10b      	bne.n	fe <mylib::listen_sensor::read_temperature+0xfe>
  e6:	e7ff      	b.n	e8 <mylib::listen_sensor::read_temperature+0xe8>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:93
            console_print(b"TMP network not ready\n");
  e8:	f240 0000 	movw	r0, #0
  ec:	f2c0 0000 	movt	r0, #0
  f0:	2116      	movs	r1, #22
  f2:	f7ff fffe 	bl	0 <mylib::base::console_print>
  f6:	e7ff      	b.n	f8 <mylib::listen_sensor::read_temperature+0xf8>
  f8:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:94
            return 0; 
  fa:	900c      	str	r0, [sp, #48]	; 0x30
  fc:	e7e7      	b.n	ce <mylib::listen_sensor::read_temperature+0xce>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:96
        assert!(rc == 0);
  fe:	9815      	ldr	r0, [sp, #84]	; 0x54
 100:	2800      	cmp	r0, #0
 102:	d007      	beq.n	114 <mylib::listen_sensor::read_temperature+0x114>
 104:	e7ff      	b.n	106 <mylib::listen_sensor::read_temperature+0x106>
 106:	f240 0000 	movw	r0, #0
 10a:	f2c0 0000 	movt	r0, #0
 10e:	f7ff fffe 	bl	0 <core::panicking::panic>
 112:	defe      	udf	#254	; 0xfe
 114:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:99
    0
 116:	900c      	str	r0, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:100
}
 118:	e798      	b.n	4c <mylib::listen_sensor::read_temperature+0x4c>

Disassembly of section .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE:

00000000 <mylib::listen_sensor::get_temperature>:
_ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:102

fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
   0:	b580      	push	{r7, lr}
   2:	b092      	sub	sp, #72	; 0x48
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	9105      	str	r1, [sp, #20]
   a:	9206      	str	r2, [sp, #24]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:107
    //  Get the temperature value, raw or computed.  sensor_data contains the raw or computed temperature. 
    //  type indicates whether sensor_data contains raw or computed temperature.  We return 
    //  the raw or computed temperature, as well as the key and value type.
    let mut return_value = SensorValue {
        key: b"\0".as_ptr(),
   c:	f240 0100 	movw	r1, #0
  10:	f2c0 0100 	movt	r1, #0
  14:	2201      	movs	r2, #1
  16:	9004      	str	r0, [sp, #16]
  18:	4608      	mov	r0, r1
  1a:	4611      	mov	r1, r2
  1c:	9303      	str	r3, [sp, #12]
  1e:	f8cd c008 	str.w	ip, [sp, #8]
  22:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  26:	9001      	str	r0, [sp, #4]
  28:	e7ff      	b.n	2a <mylib::listen_sensor::get_temperature+0x2a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:106
    let mut return_value = SensorValue {
  2a:	9801      	ldr	r0, [sp, #4]
  2c:	9007      	str	r0, [sp, #28]
  2e:	2100      	movs	r1, #0
  30:	9108      	str	r1, [sp, #32]
  32:	f8ad 1024 	strh.w	r1, [sp, #36]	; 0x24
  36:	910a      	str	r1, [sp, #40]	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:115
        float_val: 0.0,
    };
    unsafe {
        //assert!(sensor_data);
        match sensor_type {                                //  Is this raw or computed temperature?
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  38:	9906      	ldr	r1, [sp, #24]
  3a:	f1b1 6f80 	cmp.w	r1, #67108864	; 0x4000000
  3e:	d138      	bne.n	b2 <mylib::listen_sensor::get_temperature+0xb2>
  40:	e7ff      	b.n	42 <mylib::listen_sensor::get_temperature+0x42>
  42:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:117
                //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
                let mut rawtempdata = SensorTempRawData {
  44:	900b      	str	r0, [sp, #44]	; 0x2c
  46:	f88d 0030 	strb.w	r0, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
                    strd_temp_raw: 0,
                    strd_temp_raw_is_valid: 0,
                };
                let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
  4a:	9805      	ldr	r0, [sp, #20]
  4c:	a90b      	add	r1, sp, #44	; 0x2c
  4e:	f7ff fffe 	bl	0 <get_temp_raw_data>
  52:	900d      	str	r0, [sp, #52]	; 0x34
  54:	e7ff      	b.n	56 <mylib::listen_sensor::get_temperature+0x56>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:122
                assert!(rc == 0);
  56:	980d      	ldr	r0, [sp, #52]	; 0x34
  58:	2800      	cmp	r0, #0
  5a:	d007      	beq.n	6c <mylib::listen_sensor::get_temperature+0x6c>
  5c:	e7ff      	b.n	5e <mylib::listen_sensor::get_temperature+0x5e>
  5e:	f240 0000 	movw	r0, #0
  62:	f2c0 0000 	movt	r0, #0
  66:	f7ff fffe 	bl	0 <core::panicking::panic>
  6a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:125

                //  Check that the raw temperature data is valid.
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  6c:	f89d 0030 	ldrb.w	r0, [sp, #48]	; 0x30
  70:	2800      	cmp	r0, #0
  72:	d112      	bne.n	9a <mylib::listen_sensor::get_temperature+0x9a>
  74:	e7ff      	b.n	76 <mylib::listen_sensor::get_temperature+0x76>
  76:	9807      	ldr	r0, [sp, #28]
  78:	9908      	ldr	r1, [sp, #32]
  7a:	9a09      	ldr	r2, [sp, #36]	; 0x24
  7c:	9b0a      	ldr	r3, [sp, #40]	; 0x28
  7e:	f8dd c010 	ldr.w	ip, [sp, #16]
  82:	f8cc 300c 	str.w	r3, [ip, #12]
  86:	f8cc 2008 	str.w	r2, [ip, #8]
  8a:	f8cc 1004 	str.w	r1, [ip, #4]
  8e:	f8cc 0000 	str.w	r0, [ip]
  92:	e001      	b.n	98 <mylib::listen_sensor::get_temperature+0x98>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:161
        //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
        return_value.key = TEMP_SENSOR_KEY();
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
    };
    return_value
}
  94:	b012      	add	sp, #72	; 0x48
  96:	bd80      	pop	{r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:125
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  98:	e7fc      	b.n	94 <mylib::listen_sensor::get_temperature+0x94>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:128
                return_value.int_val = rawtempdata.strd_temp_raw as u16;  //  Raw Temperature in integer (0 to 4095)
  9a:	980b      	ldr	r0, [sp, #44]	; 0x2c
  9c:	f8ad 0024 	strh.w	r0, [sp, #36]	; 0x24
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
                console_print(b"TMP listener got rawtmp \n");  // return_value->int_val);
  a0:	f240 0000 	movw	r0, #0
  a4:	f2c0 0000 	movt	r0, #0
  a8:	2119      	movs	r1, #25
  aa:	f7ff fffe 	bl	0 <mylib::base::console_print>
  ae:	e7ff      	b.n	b0 <mylib::listen_sensor::get_temperature+0xb0>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
        match sensor_type {                                //  Is this raw or computed temperature?
  b0:	e02d      	b.n	10e <mylib::listen_sensor::get_temperature+0x10e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:131
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
  b2:	9806      	ldr	r0, [sp, #24]
  b4:	900e      	str	r0, [sp, #56]	; 0x38
  b6:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:133
                let mut tempdata = SensorTempData {
  b8:	900f      	str	r0, [sp, #60]	; 0x3c
  ba:	f88d 0040 	strb.w	r0, [sp, #64]	; 0x40
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:137
                let rc = get_temp_data(sensor_data, &mut tempdata);
  be:	9805      	ldr	r0, [sp, #20]
  c0:	a90f      	add	r1, sp, #60	; 0x3c
  c2:	f7ff fffe 	bl	0 <get_temp_data>
  c6:	9011      	str	r0, [sp, #68]	; 0x44
  c8:	e7ff      	b.n	ca <mylib::listen_sensor::get_temperature+0xca>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:138
                assert!(rc == 0);
  ca:	9811      	ldr	r0, [sp, #68]	; 0x44
  cc:	2800      	cmp	r0, #0
  ce:	d007      	beq.n	e0 <mylib::listen_sensor::get_temperature+0xe0>
  d0:	e7ff      	b.n	d2 <mylib::listen_sensor::get_temperature+0xd2>
  d2:	f240 0000 	movw	r0, #0
  d6:	f2c0 0000 	movt	r0, #0
  da:	f7ff fffe 	bl	0 <core::panicking::panic>
  de:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:141
                if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  e0:	f89d 0040 	ldrb.w	r0, [sp, #64]	; 0x40
  e4:	2800      	cmp	r0, #0
  e6:	d10f      	bne.n	108 <mylib::listen_sensor::get_temperature+0x108>
  e8:	e7ff      	b.n	ea <mylib::listen_sensor::get_temperature+0xea>
  ea:	9807      	ldr	r0, [sp, #28]
  ec:	9908      	ldr	r1, [sp, #32]
  ee:	9a09      	ldr	r2, [sp, #36]	; 0x24
  f0:	9b0a      	ldr	r3, [sp, #40]	; 0x28
  f2:	f8dd c010 	ldr.w	ip, [sp, #16]
  f6:	f8cc 300c 	str.w	r3, [ip, #12]
  fa:	f8cc 2008 	str.w	r2, [ip, #8]
  fe:	f8cc 1004 	str.w	r1, [ip, #4]
 102:	f8cc 0000 	str.w	r0, [ip]
 106:	e7c7      	b.n	98 <mylib::listen_sensor::get_temperature+0x98>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:144
                return_value.float_val = tempdata.std_temp;  //  Temperature in floating point.
 108:	980f      	ldr	r0, [sp, #60]	; 0x3c
 10a:	900a      	str	r0, [sp, #40]	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
        match sensor_type {                                //  Is this raw or computed temperature?
 10c:	e7ff      	b.n	10e <mylib::listen_sensor::get_temperature+0x10e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:157
        return_value.key = TEMP_SENSOR_KEY();
 10e:	f7ff fffe 	bl	0 <mylib::base::TEMP_SENSOR_KEY>
 112:	9000      	str	r0, [sp, #0]
 114:	e7ff      	b.n	116 <mylib::listen_sensor::get_temperature+0x116>
 116:	9800      	ldr	r0, [sp, #0]
 118:	9007      	str	r0, [sp, #28]
 11a:	2101      	movs	r1, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:158
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
 11c:	9108      	str	r1, [sp, #32]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:160
    return_value
 11e:	9907      	ldr	r1, [sp, #28]
 120:	9a08      	ldr	r2, [sp, #32]
 122:	9b09      	ldr	r3, [sp, #36]	; 0x24
 124:	f8dd c028 	ldr.w	ip, [sp, #40]	; 0x28
 128:	f8dd e010 	ldr.w	lr, [sp, #16]
 12c:	f8ce c00c 	str.w	ip, [lr, #12]
 130:	f8ce 3008 	str.w	r3, [lr, #8]
 134:	f8ce 2004 	str.w	r2, [lr, #4]
 138:	f8ce 1000 	str.w	r1, [lr]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:161
}
 13c:	e7aa      	b.n	94 <mylib::listen_sensor::get_temperature+0x94>

mylib-50794855a3f9698d.509tcgk6983yrx6c.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 509tcgk6983yrx6c
00000318 l       .debug_str	00000000 
000003bf l       .debug_str	00000000 
0000041d l       .debug_str	00000000 
00000428 l       .debug_str	00000000 
00000445 l       .debug_str	00000000 
0000045e l       .debug_str	00000000 
00000468 l       .debug_str	00000000 
0000047e l       .debug_str	00000000 
0000049c l       .debug_str	00000000 
000004a5 l       .debug_str	00000000 
000004aa l       .debug_str	00000000 
000004af l       .debug_str	00000000 
000004b3 l       .debug_str	00000000 
000004bc l       .debug_str	00000000 
000004c6 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000088 l       .debug_str	00000000 
0000008b l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000093 l       .debug_str	00000000 
00000099 l       .debug_str	00000000 
000000a0 l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c0 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000cd l       .debug_str	00000000 
000000d2 l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
00000106 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
0000011a l       .debug_str	00000000 
00000121 l       .debug_str	00000000 
00000127 l       .debug_str	00000000 
0000013b l       .debug_str	00000000 
00000147 l       .debug_str	00000000 
0000014c l       .debug_str	00000000 
00000154 l       .debug_str	00000000 
0000015b l       .debug_str	00000000 
0000015f l       .debug_str	00000000 
00000164 l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
00000174 l       .debug_str	00000000 
0000017e l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
0000018a l       .debug_str	00000000 
00000196 l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001a7 l       .debug_str	00000000 
000001ac l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001b3 l       .debug_str	00000000 
000001bc l       .debug_str	00000000 
000001c3 l       .debug_str	00000000 
000001c8 l       .debug_str	00000000 
000001cd l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001d9 l       .debug_str	00000000 
000001e3 l       .debug_str	00000000 
000001e6 l       .debug_str	00000000 
000001ec l       .debug_str	00000000 
000001f6 l       .debug_str	00000000 
000001fe l       .debug_str	00000000 
00000204 l       .debug_str	00000000 
0000020a l       .debug_str	00000000 
00000215 l       .debug_str	00000000 
0000021e l       .debug_str	00000000 
00000241 l       .debug_str	00000000 
00000260 l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
00000267 l       .debug_str	00000000 
0000028e l       .debug_str	00000000 
00000293 l       .debug_str	00000000 
00000299 l       .debug_str	00000000 
0000029f l       .debug_str	00000000 
000002a2 l       .debug_str	00000000 
000002b1 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002bc l       .debug_str	00000000 
000002c5 l       .debug_str	00000000 
000002d1 l       .debug_str	00000000 
000002ea l       .debug_str	00000000 
000002ef l       .debug_str	00000000 
00000300 l       .debug_str	00000000 
0000030a l       .debug_str	00000000 
0000031c l       .debug_str	00000000 
00000327 l       .debug_str	00000000 
0000032e l       .debug_str	00000000 
00000334 l       .debug_str	00000000 
00000338 l       .debug_str	00000000 
0000033c l       .debug_str	00000000 
00000344 l       .debug_str	00000000 
0000035b l       .debug_str	00000000 
0000037f l       .debug_str	00000000 
0000039b l       .debug_str	00000000 
000003a5 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.2	00000018 .Lanon.3ed011473997af99b525cde47c9eaaac.2
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.4	00000018 .Lanon.3ed011473997af99b525cde47c9eaaac.4
00000000 l    d  .text.main	00000000 .text.main
00000000 l    d  .text.rust_begin_unwind	00000000 .text.rust_begin_unwind
00000000 l    d  .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.0	00000000 .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.0
00000000 l    d  .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.1	00000000 .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.1
00000000 l    d  .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.3	00000000 .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.3
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::panicking::panic
00000000         *UND*	00000000 .hidden mylib::listen_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden mylib::send_coap::start_network_task
00000000         *UND*	00000000 console_flush
00000000 g     F .text.main	0000005e main
00000000         *UND*	00000000 os_eventq_dflt_get
00000000         *UND*	00000000 os_eventq_run
00000000 g     F .text.rust_begin_unwind	0000000c rust_begin_unwind
00000000         *UND*	00000000 rust_sysinit



Disassembly of section .text.main:

00000000 <main>:
main():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:13
use crate::base::*;             //  Import base.rs
use crate::listen_sensor::*;    //  Import listen_sensor.rs
use crate::send_coap::*;        //  Import send_coap.rs

#[no_mangle]
pub extern "C" fn main() -> ! {  //  main() will be called at Mynewt startup
   0:	b084      	sub	sp, #16
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:16
    unsafe {
        //  Init Mynewt system.
        rust_sysinit();
   2:	f7ff fffe 	bl	0 <rust_sysinit>
   6:	e7ff      	b.n	2 <console_flush+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:17
        console_flush();
   8:	f7ff fffe 	bl	0 <console_flush>
   c:	e7ff      	b.n	2 <mylib::send_coap::start_network_task+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:23

        //#if defined(SERVER_NETWORK_INTERFACE) || defined(SENSOR_NETWORK_INTERFACE)  //  If the ESP8266 or nRF24L01 is enabled...
        //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
        //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
        //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
        let rc1 = start_network_task();  assert!(rc1 == 0);
   e:	f7ff fffe 	bl	0 <mylib::send_coap::start_network_task>
  12:	9002      	str	r0, [sp, #8]
  14:	e7ff      	b.n	16 <main+0x16>
  16:	9802      	ldr	r0, [sp, #8]
  18:	2800      	cmp	r0, #0
  1a:	d007      	beq.n	2c <main+0x2c>
  1c:	e7ff      	b.n	1e <main+0x1e>
  1e:	f240 0000 	movw	r0, #0
  22:	f2c0 0000 	movt	r0, #0
  26:	f7ff fffe 	bl	0 <core::panicking::panic>
  2a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:30

        //#ifdef SENSOR_DEVICE   //  If BME280 or internal temperature sensor is enabled...
        //  Starting polling the temperature sensor every 10 seconds in the background.  
        //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
        //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.
        let rc2 = start_sensor_listener();  assert!(rc2 == 0);
  2c:	f7ff fffe 	bl	0 <mylib::listen_sensor::start_sensor_listener>
  30:	9003      	str	r0, [sp, #12]
  32:	e7ff      	b.n	34 <main+0x34>
  34:	9803      	ldr	r0, [sp, #12]
  36:	2800      	cmp	r0, #0
  38:	d007      	beq.n	4a <main+0x4a>
  3a:	e7ff      	b.n	3c <main+0x3c>
  3c:	f240 0000 	movw	r0, #0
  40:	f2c0 0000 	movt	r0, #0
  44:	f7ff fffe 	bl	0 <core::panicking::panic>
  48:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:34
        //#endif  //  SENSOR_DEVICE

        //  Main event loop
        loop {                //  Loop forever...
  4a:	e7ff      	b.n	4c <main+0x4c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:36
            os_eventq_run(            //  Process events...
                os_eventq_dflt_get()  //  From default event queue.
  4c:	f7ff fffe 	bl	0 <os_eventq_dflt_get>
  50:	9001      	str	r0, [sp, #4]
  52:	e7ff      	b.n	54 <main+0x54>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:35
            os_eventq_run(            //  Process events...
  54:	9801      	ldr	r0, [sp, #4]
  56:	f7ff fffe 	bl	0 <os_eventq_run>
  5a:	e7ff      	b.n	5c <main+0x5c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:34
        loop {                //  Loop forever...
  5c:	e7f6      	b.n	4c <main+0x4c>

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:44
    }
    //  Never comes here.
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
   0:	b082      	sub	sp, #8
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <rust_begin_unwind+0xa>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:46
    //  This function is called on panic. From https://os.phil-opp.com/freestanding-rust-binary/
    loop {}
   a:	e7fe      	b.n	a <rust_begin_unwind+0xa>
arm-none-eabi-objdump: rust.metadata.bin: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.19vpnfslw8lxmhl.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.2bwhitp1kuocnn5l.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.3k67uemb1cshb4cs.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.509tcgk6983yrx6c.rcgu.bc.z: File format not recognized
