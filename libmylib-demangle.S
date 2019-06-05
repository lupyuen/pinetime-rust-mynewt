In archive target/thumbv7m-none-eabi/debug/libmylib.rlib:

mylib-50794855a3f9698d.19vpnfslw8lxmhl.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 19vpnfslw8lxmhl
000001af l       .debug_str	00000000 
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
00000193 l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
00000000 l    d  .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E	00000000 .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E
00000000 l    d  .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E	00000000 .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E	00000020 .hidden mylib::send_coap::send_sensor_data
00000000 g     F .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E	00000004 .hidden mylib::send_coap::start_network_task



Disassembly of section .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E:

00000000 <mylib::send_coap::start_network_task>:
_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:4
use crate::base::*;
use cstr_core::CStr;

pub fn start_network_task() -> i32 {
   0:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:6
    0
}
   2:	4770      	bx	lr

Disassembly of section .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E:

00000000 <mylib::send_coap::send_sensor_data>:
_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:8

pub fn send_sensor_data(val: *const SensorValue, sensor_node: &'static CStr) -> i32 {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9003      	str	r0, [sp, #12]
   c:	9104      	str	r1, [sp, #16]
   e:	9205      	str	r2, [sp, #20]
  10:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:10
    0
}
  12:	9302      	str	r3, [sp, #8]
  14:	f8cd c004 	str.w	ip, [sp, #4]
  18:	f8cd e000 	str.w	lr, [sp]
  1c:	b006      	add	sp, #24
  1e:	bd80      	pop	{r7, pc}

mylib-50794855a3f9698d.2bwhitp1kuocnn5l.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2bwhitp1kuocnn5l
000001a0 l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
0000011c l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
00000160 l       .debug_str	00000000 
00000192 l       .debug_str	00000000 
000001a4 l       .debug_str	00000000 
000001ba l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
000001ad l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.3c7544aca6e1f15c8854b110a4791f88.0	0000000d .Lanon.3c7544aca6e1f15c8854b110a4791f88.0
00000000 l     O .rodata..Lanon.3c7544aca6e1f15c8854b110a4791f88.1	00000002 .Lanon.3c7544aca6e1f15c8854b110a4791f88.1
00000000 l     F .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE	00000034 mylib::base::TEMP_STM32_DEVICE
00000000 l    d  .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E	00000000 .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E
00000000 l    d  .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE	00000000 .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE
00000000 l    d  .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E	00000000 .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E
00000000 l    d  .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	00000000 .text._ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::result::Result<T,E>::unwrap
00000000 g     F .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E	00000012 .hidden mylib::base::SENSOR_DEVICE
00000000 g     F .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	00000012 .hidden mylib::base::console_print
00000000 g     F .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E	00000034 .hidden mylib::base::TEMP_SENSOR_KEY
00000000         *UND*	00000000 cstr_core::CStr::from_bytes_with_nul
00000000         *UND*	00000000 .hidden cstr_core::CStr::as_ptr



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
pub fn TEMP_STM32_DEVICE() -> *const u8 { CStr::from_bytes_with_nul(
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	f240 0100 	movw	r1, #0
   8:	f2c0 0100 	movt	r1, #0
   c:	a803      	add	r0, sp, #12
   e:	220d      	movs	r2, #13
  10:	f7ff fffe 	bl	0 <cstr_core::CStr::from_bytes_with_nul>
  14:	e7ff      	b.n	16 <mylib::base::TEMP_STM32_DEVICE+0x16>
  16:	a803      	add	r0, sp, #12
  18:	f7ff fffe 	bl	0 <core::result::Result<T,E>::unwrap>
  1c:	9002      	str	r0, [sp, #8]
  1e:	9101      	str	r1, [sp, #4]
  20:	e7ff      	b.n	22 <mylib::base::TEMP_STM32_DEVICE+0x22>
  22:	9802      	ldr	r0, [sp, #8]
  24:	9901      	ldr	r1, [sp, #4]
  26:	f7ff fffe 	bl	0 <cstr_core::CStr::as_ptr>
  2a:	9000      	str	r0, [sp, #0]
  2c:	e7ff      	b.n	2e <mylib::base::TEMP_STM32_DEVICE+0x2e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:84
    b"temp_stm32_0\0"
    ).unwrap().as_ptr() }
  2e:	9800      	ldr	r0, [sp, #0]
  30:	b006      	add	sp, #24
  32:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E:

00000000 <mylib::base::TEMP_SENSOR_KEY>:
_ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:90

//  Must sync with libs/temp_stm32/include/temp_stm32/temp_stm32.h
//  #if MYNEWT_VAL(RAW_TEMP)                                       //  If we are returning raw temperature (integers)...
pub const TEMP_SENSOR_TYPE: i32       = SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;  //  Set to raw sensor type
pub const TEMP_SENSOR_VALUE_TYPE: i32 = SENSOR_VALUE_TYPE_INT32;         //  Return integer sensor values
pub fn TEMP_SENSOR_KEY() -> *const u8 { CStr::from_bytes_with_nul(
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	f240 0100 	movw	r1, #0
   8:	f2c0 0100 	movt	r1, #0
   c:	a803      	add	r0, sp, #12
   e:	2202      	movs	r2, #2
  10:	f7ff fffe 	bl	0 <cstr_core::CStr::from_bytes_with_nul>
  14:	e7ff      	b.n	16 <mylib::base::TEMP_SENSOR_KEY+0x16>
  16:	a803      	add	r0, sp, #12
  18:	f7ff fffe 	bl	0 <core::result::Result<T,E>::unwrap>
  1c:	9002      	str	r0, [sp, #8]
  1e:	9101      	str	r1, [sp, #4]
  20:	e7ff      	b.n	22 <mylib::base::TEMP_SENSOR_KEY+0x22>
  22:	9802      	ldr	r0, [sp, #8]
  24:	9901      	ldr	r1, [sp, #4]
  26:	f7ff fffe 	bl	0 <cstr_core::CStr::as_ptr>
  2a:	9000      	str	r0, [sp, #0]
  2c:	e7ff      	b.n	2e <mylib::base::TEMP_SENSOR_KEY+0x2e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:92
    b"t\0"  //  Use key (field name) "t" to transmit raw temperature to CoAP Server or Collector Node
    ).unwrap().as_ptr() }
  2e:	9800      	ldr	r0, [sp, #0]
  30:	b006      	add	sp, #24
  32:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base13console_print17h7239bde54deb9f31E:

00000000 <mylib::base::console_print>:
_ZN5mylib4base13console_print17h7239bde54deb9f31E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:196
pub const SYS_EUNKNOWN    : i32 = -13;
pub const SYS_EREMOTEIO   : i32 = -14;
pub const SYS_EDONE       : i32 = -15;
pub const SYS_EPERUSER : i32 = -65535;

pub fn console_print(msg: &[u8]) {
   0:	b084      	sub	sp, #16
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9002      	str	r0, [sp, #8]
   8:	9103      	str	r1, [sp, #12]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:203
    /*
    let buf = CStr::from_bytes_with_nul(msg);
    let len = buf.len();
    console_buffer(buf.as_ptr(), len as u32);
    */
   a:	9201      	str	r2, [sp, #4]
   c:	9300      	str	r3, [sp, #0]
   e:	b004      	add	sp, #16
  10:	4770      	bx	lr

mylib-50794855a3f9698d.3c1f576kwx5k1d0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3c1f576kwx5k1d0
000002b0 l       .debug_str	00000000 
000003cd l       .debug_str	00000000 
000003d8 l       .debug_str	00000000 
000003f5 l       .debug_str	00000000 
0000040e l       .debug_str	00000000 
00000418 l       .debug_str	00000000 
0000044a l       .debug_str	00000000 
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
000000ce l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000e1 l       .debug_str	00000000 
000000e8 l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
000000ff l       .debug_str	00000000 
00000107 l       .debug_str	00000000 
0000010e l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
00000120 l       .debug_str	00000000 
00000125 l       .debug_str	00000000 
00000128 l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
00000135 l       .debug_str	00000000 
0000013c l       .debug_str	00000000 
00000141 l       .debug_str	00000000 
00000146 l       .debug_str	00000000 
0000014c l       .debug_str	00000000 
00000152 l       .debug_str	00000000 
0000015c l       .debug_str	00000000 
0000015f l       .debug_str	00000000 
00000165 l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
0000017d l       .debug_str	00000000 
00000183 l       .debug_str	00000000 
0000018e l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
000001ba l       .debug_str	00000000 
000001d9 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e0 l       .debug_str	00000000 
00000207 l       .debug_str	00000000 
0000020c l       .debug_str	00000000 
00000212 l       .debug_str	00000000 
00000218 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
0000022a l       .debug_str	00000000 
00000231 l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
0000023e l       .debug_str	00000000 
00000246 l       .debug_str	00000000 
0000024e l       .debug_str	00000000 
00000255 l       .debug_str	00000000 
00000269 l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
00000281 l       .debug_str	00000000 
0000029a l       .debug_str	00000000 
0000029f l       .debug_str	00000000 
000002ba l       .debug_str	00000000 
000002c8 l       .debug_str	00000000 
000002cc l       .debug_str	00000000 
000002d7 l       .debug_str	00000000 
000002de l       .debug_str	00000000 
000002e4 l       .debug_str	00000000 
000002e8 l       .debug_str	00000000 
000002ec l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
0000030b l       .debug_str	00000000 
0000032f l       .debug_str	00000000 
0000034b l       .debug_str	00000000 
00000355 l       .debug_str	00000000 
0000036f l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3fmt9Arguments6new_v117h2cd5f5618ed3a724E	00000000 .text._ZN4core3fmt9Arguments6new_v117h2cd5f5618ed3a724E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3fmt9Arguments6new_v117h2cd5f5618ed3a724E	0000004c .hidden core::fmt::Arguments::new_v1



Disassembly of section .text._ZN4core3fmt9Arguments6new_v117h2cd5f5618ed3a724E:

00000000 <core::fmt::Arguments::new_v1>:
_ZN4core3fmt9Arguments6new_v117h2cd5f5618ed3a724E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:314
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	f8dd c038 	ldr.w	ip, [sp, #56]	; 0x38
   8:	469e      	mov	lr, r3
   a:	4614      	mov	r4, r2
   c:	460d      	mov	r5, r1
   e:	4606      	mov	r6, r0
  10:	9104      	str	r1, [sp, #16]
  12:	9205      	str	r2, [sp, #20]
  14:	9306      	str	r3, [sp, #24]
  16:	f8cd c01c 	str.w	ip, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:317
  1a:	9904      	ldr	r1, [sp, #16]
  1c:	9a05      	ldr	r2, [sp, #20]
  1e:	2300      	movs	r3, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:318
  20:	9309      	str	r3, [sp, #36]	; 0x24
  22:	9308      	str	r3, [sp, #32]
  24:	9308      	str	r3, [sp, #32]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:319
  26:	9b06      	ldr	r3, [sp, #24]
  28:	f8dd c01c 	ldr.w	ip, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  2c:	6001      	str	r1, [r0, #0]
  2e:	6042      	str	r2, [r0, #4]
  30:	9908      	ldr	r1, [sp, #32]
  32:	9a09      	ldr	r2, [sp, #36]	; 0x24
  34:	6081      	str	r1, [r0, #8]
  36:	60c2      	str	r2, [r0, #12]
  38:	6103      	str	r3, [r0, #16]
  3a:	f8c0 c014 	str.w	ip, [r0, #20]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:321
  3e:	f8cd e00c 	str.w	lr, [sp, #12]
  42:	9402      	str	r4, [sp, #8]
  44:	9501      	str	r5, [sp, #4]
  46:	9600      	str	r6, [sp, #0]
  48:	b00a      	add	sp, #40	; 0x28
  4a:	bd70      	pop	{r4, r5, r6, pc}

mylib-50794855a3f9698d.3k67uemb1cshb4cs.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3k67uemb1cshb4cs
000002c9 l       .debug_str	00000000 
000001f8 l       .debug_str	00000000 
00000207 l       .debug_str	00000000 
0000020f l       .debug_str	00000000 
00000229 l       .debug_str	00000000 
0000027e l       .debug_str	00000000 
00000285 l       .debug_str	00000000 
0000028d l       .debug_str	00000000 
0000029c l       .debug_str	00000000 
0000029f l       .debug_str	00000000 
000002a6 l       .debug_str	00000000 
000002aa l       .debug_str	00000000 
000002b6 l       .debug_str	00000000 
000002c2 l       .debug_str	00000000 
000002cf l       .debug_str	00000000 
000002db l       .debug_str	00000000 
000002e5 l       .debug_str	00000000 
000002eb l       .debug_str	00000000 
000002ff l       .debug_str	00000000 
00000304 l       .debug_str	00000000 
00000315 l       .debug_str	00000000 
00000327 l       .debug_str	00000000 
00000334 l       .debug_str	00000000 
00000340 l       .debug_str	00000000 
0000034e l       .debug_str	00000000 
00000365 l       .debug_str	00000000 
00000377 l       .debug_str	00000000 
00000397 l       .debug_str	00000000 
000003a0 l       .debug_str	00000000 
000003a9 l       .debug_str	00000000 
000003bb l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
0000008b l       .debug_str	00000000 
00000095 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000a5 l       .debug_str	00000000 
000000b3 l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001b3 l       .debug_str	00000000 
000001b6 l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001d1 l       .debug_str	00000000 
000001d5 l       .debug_str	00000000 
000001df l       .debug_str	00000000 
000001e3 l       .debug_str	00000000 
000001ef l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.0	0000000b .Lanon.0b256f51abc682f8d65b4afaed11e7f9.0
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.10	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.10
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.11	00000017 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.11
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.12	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.12
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.13	00000001 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.13
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.14	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.14
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.15	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.15
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.16	0000001a .Lanon.0b256f51abc682f8d65b4afaed11e7f9.16
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.3	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.3
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.5	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.5
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.6	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.6
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.8	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.8
00000000 l     F .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE	00000158 mylib::listen_sensor::get_temperature
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E	0000010a mylib::listen_sensor::read_temperature
00000000 l    d  .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	00000000 .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E	00000000 .text._ZN5mylib13listen_sensor16read_temperature17hfd042900baa70649E
00000000 l    d  .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE	00000000 .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.1	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.1
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.2	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.2
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.4	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.4
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.7	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.7
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.9	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.9
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::result::Result<T,E>::unwrap
00000000         *UND*	00000000 core::panicking::panic
00000000 g     F .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	000000be .hidden mylib::listen_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden mylib::base::SENSOR_DEVICE
00000000         *UND*	00000000 .hidden mylib::base::console_print
00000000         *UND*	00000000 .hidden mylib::base::TEMP_SENSOR_KEY
00000000         *UND*	00000000 .hidden mylib::send_coap::send_sensor_data
00000000         *UND*	00000000 cstr_core::CStr::from_bytes_with_nul
00000000         *UND*	00000000 .hidden cstr_core::CStr::as_ptr
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:13
const READ_CB: SensorArg     = 2;            //  Indicate that this is a sensor read callback

/////////////////////////////////////////////////////////
//  Listen To Local Sensor

pub fn start_sensor_listener() -> i32 {
   0:	b580      	push	{r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:25
        /* if (is_collector_node()) {                    //  If this is a Collector Node...
            return start_remote_sensor_listeners();   //  Start the Listener for every Remote Sensor.
        } */

        //  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
        console_print(b"TMP poll \n\0");  //  SENSOR_DEVICE "\n";
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	210b      	movs	r1, #11
   e:	f7ff fffe 	bl	0 <mylib::base::console_print>
  12:	e7ff      	b.n	14 <mylib::listen_sensor::start_sensor_listener+0x14>
  14:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:28

        //  Define the listener function to be called after polling the temperature sensor.
        let listener = SensorListener {
  18:	9005      	str	r0, [sp, #20]
  1a:	f240 0000 	movw	r0, #0
  1e:	f2c0 0000 	movt	r0, #0
  22:	9006      	str	r0, [sp, #24]
  24:	2001      	movs	r0, #1
  26:	9007      	str	r0, [sp, #28]
  28:	2000      	movs	r0, #0
  2a:	9008      	str	r0, [sp, #32]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:36
            sl_arg        : LISTENER_CB,           //  Indicate to the listener function that this is a listener callback
            sl_next       : 0,
        };

        //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
        let rc = sensor_set_poll_rate_ms(SENSOR_DEVICE(), SENSOR_POLL_TIME);
  2c:	f7ff fffe 	bl	0 <mylib::base::SENSOR_DEVICE>
  30:	9004      	str	r0, [sp, #16]
  32:	e7ff      	b.n	34 <mylib::listen_sensor::start_sensor_listener+0x34>
  34:	f242 7110 	movw	r1, #10000	; 0x2710
  38:	9804      	ldr	r0, [sp, #16]
  3a:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
  3e:	9009      	str	r0, [sp, #36]	; 0x24
  40:	e7ff      	b.n	42 <mylib::listen_sensor::start_sensor_listener+0x42>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:37
        assert!(rc == 0);
  42:	9809      	ldr	r0, [sp, #36]	; 0x24
  44:	2800      	cmp	r0, #0
  46:	d007      	beq.n	58 <mylib::listen_sensor::start_sensor_listener+0x58>
  48:	e7ff      	b.n	4a <mylib::listen_sensor::start_sensor_listener+0x4a>
  4a:	f240 0000 	movw	r0, #0
  4e:	f2c0 0000 	movt	r0, #0
  52:	f7ff fffe 	bl	0 <core::panicking::panic>
  56:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:40

        //  Fetch the sensor by name, without locking the driver for exclusive access.
        let listen_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE(), null_sensor());
  58:	f7ff fffe 	bl	0 <mylib::base::SENSOR_DEVICE>
  5c:	9003      	str	r0, [sp, #12]
  5e:	e7ff      	b.n	60 <mylib::listen_sensor::start_sensor_listener+0x60>
  60:	f7ff fffe 	bl	0 <null_sensor>
  64:	9002      	str	r0, [sp, #8]
  66:	e7ff      	b.n	68 <mylib::listen_sensor::start_sensor_listener+0x68>
  68:	9803      	ldr	r0, [sp, #12]
  6a:	9902      	ldr	r1, [sp, #8]
  6c:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  70:	900a      	str	r0, [sp, #40]	; 0x28
  72:	e7ff      	b.n	74 <mylib::listen_sensor::start_sensor_listener+0x74>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:41
        assert!(is_null_sensor(listen_sensor));
  74:	980a      	ldr	r0, [sp, #40]	; 0x28
  76:	f7ff fffe 	bl	0 <is_null_sensor>
  7a:	9001      	str	r0, [sp, #4]
  7c:	e7ff      	b.n	7e <mylib::listen_sensor::start_sensor_listener+0x7e>
  7e:	9801      	ldr	r0, [sp, #4]
  80:	07c1      	lsls	r1, r0, #31
  82:	2900      	cmp	r1, #0
  84:	d107      	bne.n	96 <mylib::listen_sensor::start_sensor_listener+0x96>
  86:	e7ff      	b.n	88 <mylib::listen_sensor::start_sensor_listener+0x88>
  88:	f240 0000 	movw	r0, #0
  8c:	f2c0 0000 	movt	r0, #0
  90:	f7ff fffe 	bl	0 <core::panicking::panic>
  94:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:44

        //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
        let rc = sensor_register_listener(listen_sensor, &listener);
  96:	980a      	ldr	r0, [sp, #40]	; 0x28
  98:	a905      	add	r1, sp, #20
  9a:	f7ff fffe 	bl	0 <sensor_register_listener>
  9e:	900b      	str	r0, [sp, #44]	; 0x2c
  a0:	e7ff      	b.n	a2 <mylib::listen_sensor::start_sensor_listener+0xa2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:45
        assert!(rc == 0);
  a2:	980b      	ldr	r0, [sp, #44]	; 0x2c
  a4:	2800      	cmp	r0, #0
  a6:	d007      	beq.n	b8 <mylib::listen_sensor::start_sensor_listener+0xb8>
  a8:	e7ff      	b.n	aa <mylib::listen_sensor::start_sensor_listener+0xaa>
  aa:	f240 0000 	movw	r0, #0
  ae:	f2c0 0000 	movt	r0, #0
  b2:	f7ff fffe 	bl	0 <core::panicking::panic>
  b6:	defe      	udf	#254	; 0xfe
  b8:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:48
    }
    0
}
  ba:	b00c      	add	sp, #48	; 0x30
  bc:	bd80      	pop	{r7, pc}

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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:67
    //  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    //  Return 0 if we have processed the sensor data successfully.
    unsafe {
        //  Check that the temperature data is valid.
        //  TODO
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
  14:	980a      	ldr	r0, [sp, #40]	; 0x28
  16:	f8cd c01c 	str.w	ip, [sp, #28]
  1a:	f8cd e018 	str.w	lr, [sp, #24]
  1e:	9405      	str	r4, [sp, #20]
  20:	9504      	str	r5, [sp, #16]
  22:	f7ff fffe 	bl	0 <is_null_sensor_data>
  26:	9003      	str	r0, [sp, #12]
  28:	e7ff      	b.n	2a <mylib::listen_sensor::read_temperature+0x2a>
  2a:	9803      	ldr	r0, [sp, #12]
  2c:	07c1      	lsls	r1, r0, #31
  2e:	2900      	cmp	r1, #0
  30:	d007      	beq.n	42 <mylib::listen_sensor::read_temperature+0x42>
  32:	e7ff      	b.n	34 <mylib::listen_sensor::read_temperature+0x34>
  34:	f06f 0001 	mvn.w	r0, #1
  38:	900c      	str	r0, [sp, #48]	; 0x30
  3a:	e7ff      	b.n	3c <mylib::listen_sensor::read_temperature+0x3c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:99
        }
        assert!(rc == 0);
        //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    0
}
  3c:	980c      	ldr	r0, [sp, #48]	; 0x30
  3e:	b016      	add	sp, #88	; 0x58
  40:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:68
        assert!(is_null_sensor(sensor));
  42:	9808      	ldr	r0, [sp, #32]
  44:	f7ff fffe 	bl	0 <is_null_sensor>
  48:	9002      	str	r0, [sp, #8]
  4a:	e7ff      	b.n	4c <mylib::listen_sensor::read_temperature+0x4c>
  4c:	9802      	ldr	r0, [sp, #8]
  4e:	07c1      	lsls	r1, r0, #31
  50:	2900      	cmp	r1, #0
  52:	d107      	bne.n	64 <mylib::listen_sensor::read_temperature+0x64>
  54:	e7ff      	b.n	56 <mylib::listen_sensor::read_temperature+0x56>
  56:	f240 0000 	movw	r0, #0
  5a:	f2c0 0000 	movt	r0, #0
  5e:	f7ff fffe 	bl	0 <core::panicking::panic>
  62:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:72
        let device = sensor_get_device(sensor);
  64:	9808      	ldr	r0, [sp, #32]
  66:	f7ff fffe 	bl	0 <sensor_get_device>
  6a:	900d      	str	r0, [sp, #52]	; 0x34
  6c:	e7ff      	b.n	6e <mylib::listen_sensor::read_temperature+0x6e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:73
        let c_buf: *const c_char = device_get_name(device);
  6e:	980d      	ldr	r0, [sp, #52]	; 0x34
  70:	f7ff fffe 	bl	0 <device_get_name>
  74:	900e      	str	r0, [sp, #56]	; 0x38
  76:	e7ff      	b.n	78 <mylib::listen_sensor::read_temperature+0x78>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:74
        let device_name: &CStr = CStr::from_ptr(c_buf);
  78:	980e      	ldr	r0, [sp, #56]	; 0x38
  7a:	f7ff fffe 	bl	0 <cstr_core::CStr::from_ptr>
  7e:	9001      	str	r0, [sp, #4]
  80:	9100      	str	r1, [sp, #0]
  82:	e7ff      	b.n	84 <mylib::listen_sensor::read_temperature+0x84>
  84:	9801      	ldr	r0, [sp, #4]
  86:	900f      	str	r0, [sp, #60]	; 0x3c
  88:	9900      	ldr	r1, [sp, #0]
  8a:	9110      	str	r1, [sp, #64]	; 0x40
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:78
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
  8c:	990a      	ldr	r1, [sp, #40]	; 0x28
  8e:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
  90:	a811      	add	r0, sp, #68	; 0x44
  92:	f7ff fffe 	bl	0 <mylib::listen_sensor::read_temperature>
  96:	e7ff      	b.n	98 <mylib::listen_sensor::read_temperature+0x98>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:79
        assert!(temp_sensor_value.val_type != 0);
  98:	9812      	ldr	r0, [sp, #72]	; 0x48
  9a:	2800      	cmp	r0, #0
  9c:	d107      	bne.n	ae <mylib::listen_sensor::read_temperature+0xae>
  9e:	e7ff      	b.n	a0 <mylib::listen_sensor::read_temperature+0xa0>
  a0:	f240 0000 	movw	r0, #0
  a4:	f2c0 0000 	movt	r0, #0
  a8:	f7ff fffe 	bl	0 <core::panicking::panic>
  ac:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:80
        if temp_sensor_value.val_type == 0 { return -1; }  //  Invalid type.
  ae:	9812      	ldr	r0, [sp, #72]	; 0x48
  b0:	2800      	cmp	r0, #0
  b2:	d105      	bne.n	c0 <mylib::listen_sensor::read_temperature+0xc0>
  b4:	e7ff      	b.n	b6 <mylib::listen_sensor::read_temperature+0xb6>
  b6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
  ba:	900c      	str	r0, [sp, #48]	; 0x30
  bc:	e7ff      	b.n	be <mylib::listen_sensor::read_temperature+0xbe>
  be:	e7bd      	b.n	3c <mylib::listen_sensor::read_temperature+0x3c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:87
        let rc = send_sensor_data(&temp_sensor_value, device_name);
  c0:	990f      	ldr	r1, [sp, #60]	; 0x3c
  c2:	9a10      	ldr	r2, [sp, #64]	; 0x40
  c4:	a811      	add	r0, sp, #68	; 0x44
  c6:	f7ff fffe 	bl	0 <mylib::send_coap::send_sensor_data>
  ca:	9015      	str	r0, [sp, #84]	; 0x54
  cc:	e7ff      	b.n	ce <mylib::listen_sensor::read_temperature+0xce>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:91
        if rc == SYS_EAGAIN {
  ce:	9815      	ldr	r0, [sp, #84]	; 0x54
  d0:	3006      	adds	r0, #6
  d2:	2800      	cmp	r0, #0
  d4:	d10b      	bne.n	ee <mylib::listen_sensor::read_temperature+0xee>
  d6:	e7ff      	b.n	d8 <mylib::listen_sensor::read_temperature+0xd8>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:92
            console_print(b"TMP network not ready\n\0");
  d8:	f240 0000 	movw	r0, #0
  dc:	f2c0 0000 	movt	r0, #0
  e0:	2117      	movs	r1, #23
  e2:	f7ff fffe 	bl	0 <mylib::base::console_print>
  e6:	e7ff      	b.n	e8 <mylib::listen_sensor::read_temperature+0xe8>
  e8:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:93
            return 0; 
  ea:	900c      	str	r0, [sp, #48]	; 0x30
  ec:	e7e7      	b.n	be <mylib::listen_sensor::read_temperature+0xbe>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:95
        assert!(rc == 0);
  ee:	9815      	ldr	r0, [sp, #84]	; 0x54
  f0:	2800      	cmp	r0, #0
  f2:	d007      	beq.n	104 <mylib::listen_sensor::read_temperature+0x104>
  f4:	e7ff      	b.n	f6 <mylib::listen_sensor::read_temperature+0xf6>
  f6:	f240 0000 	movw	r0, #0
  fa:	f2c0 0000 	movt	r0, #0
  fe:	f7ff fffe 	bl	0 <core::panicking::panic>
 102:	defe      	udf	#254	; 0xfe
 104:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:98
    0
 106:	900c      	str	r0, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:99
}
 108:	e798      	b.n	3c <mylib::listen_sensor::read_temperature+0x3c>

Disassembly of section .text._ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE:

00000000 <mylib::listen_sensor::get_temperature>:
_ZN5mylib13listen_sensor15get_temperature17h2775eda8de5dec0bE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:101

fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
   0:	b580      	push	{r7, lr}
   2:	b098      	sub	sp, #96	; 0x60
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	9108      	str	r1, [sp, #32]
   a:	9209      	str	r2, [sp, #36]	; 0x24
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:106
    //  Get the temperature value, raw or computed.  sensor_data contains the raw or computed temperature. 
    //  type indicates whether sensor_data contains raw or computed temperature.  We return 
    //  the raw or computed temperature, as well as the key and value type.
    let mut return_value = SensorValue {
        key: CStr::from_bytes_with_nul(b"\0").unwrap().as_ptr(),
   c:	f240 0100 	movw	r1, #0
  10:	f2c0 0100 	movt	r1, #0
  14:	aa0e      	add	r2, sp, #56	; 0x38
  16:	f04f 0e01 	mov.w	lr, #1
  1a:	9007      	str	r0, [sp, #28]
  1c:	4610      	mov	r0, r2
  1e:	4672      	mov	r2, lr
  20:	9306      	str	r3, [sp, #24]
  22:	f8cd c014 	str.w	ip, [sp, #20]
  26:	f7ff fffe 	bl	0 <cstr_core::CStr::from_bytes_with_nul>
  2a:	e7ff      	b.n	2c <mylib::listen_sensor::get_temperature+0x2c>
  2c:	a80e      	add	r0, sp, #56	; 0x38
  2e:	f7ff fffe 	bl	0 <core::result::Result<T,E>::unwrap>
  32:	9004      	str	r0, [sp, #16]
  34:	9103      	str	r1, [sp, #12]
  36:	e7ff      	b.n	38 <mylib::listen_sensor::get_temperature+0x38>
  38:	9804      	ldr	r0, [sp, #16]
  3a:	9903      	ldr	r1, [sp, #12]
  3c:	f7ff fffe 	bl	0 <cstr_core::CStr::as_ptr>
  40:	9002      	str	r0, [sp, #8]
  42:	e7ff      	b.n	44 <mylib::listen_sensor::get_temperature+0x44>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:105
    let mut return_value = SensorValue {
  44:	9802      	ldr	r0, [sp, #8]
  46:	900a      	str	r0, [sp, #40]	; 0x28
  48:	2100      	movs	r1, #0
  4a:	910b      	str	r1, [sp, #44]	; 0x2c
  4c:	f8ad 1030 	strh.w	r1, [sp, #48]	; 0x30
  50:	910d      	str	r1, [sp, #52]	; 0x34
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
        float_val: 0.0,
    };
    unsafe {
        //assert!(sensor_data);
        match sensor_type {                                //  Is this raw or computed temperature?
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  52:	9909      	ldr	r1, [sp, #36]	; 0x24
  54:	f1b1 6f80 	cmp.w	r1, #67108864	; 0x4000000
  58:	d138      	bne.n	cc <mylib::listen_sensor::get_temperature+0xcc>
  5a:	e7ff      	b.n	5c <mylib::listen_sensor::get_temperature+0x5c>
  5c:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:116
                //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
                let mut rawtempdata = SensorTempRawData {
  5e:	9011      	str	r0, [sp, #68]	; 0x44
  60:	f88d 0048 	strb.w	r0, [sp, #72]	; 0x48
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:120
                    strd_temp_raw: 0,
                    strd_temp_raw_is_valid: 0,
                };
                let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
  64:	9808      	ldr	r0, [sp, #32]
  66:	a911      	add	r1, sp, #68	; 0x44
  68:	f7ff fffe 	bl	0 <get_temp_raw_data>
  6c:	9013      	str	r0, [sp, #76]	; 0x4c
  6e:	e7ff      	b.n	70 <mylib::listen_sensor::get_temperature+0x70>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
                assert!(rc == 0);
  70:	9813      	ldr	r0, [sp, #76]	; 0x4c
  72:	2800      	cmp	r0, #0
  74:	d007      	beq.n	86 <mylib::listen_sensor::get_temperature+0x86>
  76:	e7ff      	b.n	78 <mylib::listen_sensor::get_temperature+0x78>
  78:	f240 0000 	movw	r0, #0
  7c:	f2c0 0000 	movt	r0, #0
  80:	f7ff fffe 	bl	0 <core::panicking::panic>
  84:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:124

                //  Check that the raw temperature data is valid.
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  86:	f89d 0048 	ldrb.w	r0, [sp, #72]	; 0x48
  8a:	2800      	cmp	r0, #0
  8c:	d112      	bne.n	b4 <mylib::listen_sensor::get_temperature+0xb4>
  8e:	e7ff      	b.n	90 <mylib::listen_sensor::get_temperature+0x90>
  90:	980a      	ldr	r0, [sp, #40]	; 0x28
  92:	990b      	ldr	r1, [sp, #44]	; 0x2c
  94:	9a0c      	ldr	r2, [sp, #48]	; 0x30
  96:	9b0d      	ldr	r3, [sp, #52]	; 0x34
  98:	f8dd c01c 	ldr.w	ip, [sp, #28]
  9c:	f8cc 300c 	str.w	r3, [ip, #12]
  a0:	f8cc 2008 	str.w	r2, [ip, #8]
  a4:	f8cc 1004 	str.w	r1, [ip, #4]
  a8:	f8cc 0000 	str.w	r0, [ip]
  ac:	e001      	b.n	b2 <mylib::listen_sensor::get_temperature+0xb2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:160
        //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
        return_value.key = TEMP_SENSOR_KEY();
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
    };
    return_value
}
  ae:	b018      	add	sp, #96	; 0x60
  b0:	bd80      	pop	{r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:124
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  b2:	e7fc      	b.n	ae <mylib::listen_sensor::get_temperature+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:127
                return_value.int_val = rawtempdata.strd_temp_raw as u16;  //  Raw Temperature in integer (0 to 4095)
  b4:	9811      	ldr	r0, [sp, #68]	; 0x44
  b6:	f8ad 0030 	strh.w	r0, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:128
                console_print(b"TMP listener got rawtmp \n\0");  // return_value->int_val);
  ba:	f240 0000 	movw	r0, #0
  be:	f2c0 0000 	movt	r0, #0
  c2:	211a      	movs	r1, #26
  c4:	f7ff fffe 	bl	0 <mylib::base::console_print>
  c8:	e7ff      	b.n	ca <mylib::listen_sensor::get_temperature+0xca>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:113
        match sensor_type {                                //  Is this raw or computed temperature?
  ca:	e02d      	b.n	128 <mylib::listen_sensor::get_temperature+0x128>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:130
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
  cc:	9809      	ldr	r0, [sp, #36]	; 0x24
  ce:	9014      	str	r0, [sp, #80]	; 0x50
  d0:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:132
                let mut tempdata = SensorTempData {
  d2:	9015      	str	r0, [sp, #84]	; 0x54
  d4:	f88d 0058 	strb.w	r0, [sp, #88]	; 0x58
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:136
                let rc = get_temp_data(sensor_data, &mut tempdata);
  d8:	9808      	ldr	r0, [sp, #32]
  da:	a915      	add	r1, sp, #84	; 0x54
  dc:	f7ff fffe 	bl	0 <get_temp_data>
  e0:	9017      	str	r0, [sp, #92]	; 0x5c
  e2:	e7ff      	b.n	e4 <mylib::listen_sensor::get_temperature+0xe4>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:137
                assert!(rc == 0);
  e4:	9817      	ldr	r0, [sp, #92]	; 0x5c
  e6:	2800      	cmp	r0, #0
  e8:	d007      	beq.n	fa <mylib::listen_sensor::get_temperature+0xfa>
  ea:	e7ff      	b.n	ec <mylib::listen_sensor::get_temperature+0xec>
  ec:	f240 0000 	movw	r0, #0
  f0:	f2c0 0000 	movt	r0, #0
  f4:	f7ff fffe 	bl	0 <core::panicking::panic>
  f8:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:140
                if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  fa:	f89d 0058 	ldrb.w	r0, [sp, #88]	; 0x58
  fe:	2800      	cmp	r0, #0
 100:	d10f      	bne.n	122 <mylib::listen_sensor::get_temperature+0x122>
 102:	e7ff      	b.n	104 <mylib::listen_sensor::get_temperature+0x104>
 104:	980a      	ldr	r0, [sp, #40]	; 0x28
 106:	990b      	ldr	r1, [sp, #44]	; 0x2c
 108:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 10a:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 10c:	f8dd c01c 	ldr.w	ip, [sp, #28]
 110:	f8cc 300c 	str.w	r3, [ip, #12]
 114:	f8cc 2008 	str.w	r2, [ip, #8]
 118:	f8cc 1004 	str.w	r1, [ip, #4]
 11c:	f8cc 0000 	str.w	r0, [ip]
 120:	e7c7      	b.n	b2 <mylib::listen_sensor::get_temperature+0xb2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:143
                return_value.float_val = tempdata.std_temp;  //  Temperature in floating point.
 122:	9815      	ldr	r0, [sp, #84]	; 0x54
 124:	900d      	str	r0, [sp, #52]	; 0x34
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:113
        match sensor_type {                                //  Is this raw or computed temperature?
 126:	e7ff      	b.n	128 <mylib::listen_sensor::get_temperature+0x128>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:156
        return_value.key = TEMP_SENSOR_KEY();
 128:	f7ff fffe 	bl	0 <mylib::base::TEMP_SENSOR_KEY>
 12c:	9001      	str	r0, [sp, #4]
 12e:	e7ff      	b.n	130 <mylib::listen_sensor::get_temperature+0x130>
 130:	9801      	ldr	r0, [sp, #4]
 132:	900a      	str	r0, [sp, #40]	; 0x28
 134:	2101      	movs	r1, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:157
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
 136:	910b      	str	r1, [sp, #44]	; 0x2c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:159
    return_value
 138:	990a      	ldr	r1, [sp, #40]	; 0x28
 13a:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 13c:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 13e:	f8dd c034 	ldr.w	ip, [sp, #52]	; 0x34
 142:	f8dd e01c 	ldr.w	lr, [sp, #28]
 146:	f8ce c00c 	str.w	ip, [lr, #12]
 14a:	f8ce 3008 	str.w	r3, [lr, #8]
 14e:	f8ce 2004 	str.w	r2, [lr, #4]
 152:	f8ce 1000 	str.w	r1, [lr]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:160
}
 156:	e7aa      	b.n	ae <mylib::listen_sensor::get_temperature+0xae>

mylib-50794855a3f9698d.3ksiz0oe1f34lits.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3ksiz0oe1f34lits
00000268 l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
000001d0 l       .debug_str	00000000 
00000210 l       .debug_str	00000000 
0000024a l       .debug_str	00000000 
0000024e l       .debug_str	00000000 
00000257 l       .debug_str	00000000 
00000261 l       .debug_str	00000000 
0000026d l       .debug_str	00000000 
00000273 l       .debug_str	00000000 
00000278 l       .debug_str	00000000 
0000027e l       .debug_str	00000000 
00000283 l       .debug_str	00000000 
000002a5 l       .debug_str	00000000 
000002a7 l       .debug_str	00000000 
000002a9 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
00000088 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
00000093 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a3 l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000ba l       .debug_str	00000000 
000000bf l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000d2 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000e3 l       .debug_str	00000000 
000000e9 l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
00000114 l       .debug_str	00000000 
0000012a l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
00000130 l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.2	00000010 .Lanon.cdeb35a13307d7ebaa6095ab68090442.2
00000000 l     O .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.4	00000010 .Lanon.cdeb35a13307d7ebaa6095ab68090442.4
00000000 l     O .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.5	0000002b .Lanon.cdeb35a13307d7ebaa6095ab68090442.5
00000000 l    d  .text._ZN4core6result13unwrap_failed17h3d14a933509b39f2E	00000000 .text._ZN4core6result13unwrap_failed17h3d14a933509b39f2E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hdc77bba9f1804906E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hdc77bba9f1804906E
00000000 l    d  .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.0	00000000 .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.0
00000000 l    d  .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.1	00000000 .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.1
00000000 l    d  .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.3	00000000 .rodata..Lanon.cdeb35a13307d7ebaa6095ab68090442.3
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 <&T as core::fmt::Display>::fmt
00000000         *UND*	00000000 core::fmt::ArgumentV1::new
00000000         *UND*	00000000 core::fmt::ArgumentV1::new
00000000         *UND*	00000000 .hidden core::fmt::Arguments::new_v1
00000000 g     F .text._ZN4core6result13unwrap_failed17h3d14a933509b39f2E	00000094 core::result::unwrap_failed
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hdc77bba9f1804906E	0000005e core::result::Result<T,E>::unwrap
00000000         *UND*	00000000 core::panicking::panic_fmt
00000000         *UND*	00000000 <cstr_core::FromBytesWithNulError as core::fmt::Debug>::fmt



Disassembly of section .text._ZN4core6result13unwrap_failed17h3d14a933509b39f2E:

00000000 <core::result::unwrap_failed>:
_ZN4core6result13unwrap_failed17h3d14a933509b39f2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:998
   0:	b09c      	sub	sp, #112	; 0x70
   2:	469c      	mov	ip, r3
   4:	4696      	mov	lr, r2
   6:	460c      	mov	r4, r1
   8:	4605      	mov	r5, r0
   a:	900a      	str	r0, [sp, #40]	; 0x28
   c:	910b      	str	r1, [sp, #44]	; 0x2c
   e:	920c      	str	r2, [sp, #48]	; 0x30
  10:	930d      	str	r3, [sp, #52]	; 0x34
  12:	a80a      	add	r0, sp, #40	; 0x28
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  14:	9018      	str	r0, [sp, #96]	; 0x60
  16:	a80c      	add	r0, sp, #48	; 0x30
  18:	9019      	str	r0, [sp, #100]	; 0x64
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:1
#![no_std]          //  Don't link with standard Rust library
  1a:	9818      	ldr	r0, [sp, #96]	; 0x60
  1c:	901a      	str	r0, [sp, #104]	; 0x68
  1e:	9819      	ldr	r0, [sp, #100]	; 0x64
  20:	901b      	str	r0, [sp, #108]	; 0x6c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  22:	981a      	ldr	r0, [sp, #104]	; 0x68
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:18
  24:	f240 0100 	movw	r1, #0
  28:	f2c0 0100 	movt	r1, #0
  2c:	f8cd c024 	str.w	ip, [sp, #36]	; 0x24
  30:	f8cd e020 	str.w	lr, [sp, #32]
  34:	9407      	str	r4, [sp, #28]
  36:	9506      	str	r5, [sp, #24]
  38:	f7ff fffe 	bl	0 <core::fmt::ArgumentV1::new>
  3c:	9005      	str	r0, [sp, #20]
  3e:	9104      	str	r1, [sp, #16]
  40:	e7ff      	b.n	42 <core::result::unwrap_failed+0x42>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  42:	981b      	ldr	r0, [sp, #108]	; 0x6c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:18
  44:	f240 0100 	movw	r1, #0
  48:	f2c0 0100 	movt	r1, #0
  4c:	f7ff fffe 	bl	0 <core::fmt::ArgumentV1::new>
  50:	9003      	str	r0, [sp, #12]
  52:	9102      	str	r1, [sp, #8]
  54:	e7ff      	b.n	56 <core::result::unwrap_failed+0x56>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  56:	9805      	ldr	r0, [sp, #20]
  58:	9014      	str	r0, [sp, #80]	; 0x50
  5a:	9904      	ldr	r1, [sp, #16]
  5c:	9115      	str	r1, [sp, #84]	; 0x54
  5e:	9a03      	ldr	r2, [sp, #12]
  60:	9216      	str	r2, [sp, #88]	; 0x58
  62:	9b02      	ldr	r3, [sp, #8]
  64:	9317      	str	r3, [sp, #92]	; 0x5c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:18
  66:	46ec      	mov	ip, sp
  68:	f04f 0e02 	mov.w	lr, #2
  6c:	f8cc e000 	str.w	lr, [ip]
  70:	f240 0100 	movw	r1, #0
  74:	f2c0 0100 	movt	r1, #0
  78:	a80e      	add	r0, sp, #56	; 0x38
  7a:	ab14      	add	r3, sp, #80	; 0x50
  7c:	4672      	mov	r2, lr
  7e:	f7ff fffe 	bl	0 <core::fmt::Arguments::new_v1>
  82:	e7ff      	b.n	2 <core::result::unwrap_failed+0x2>
  84:	f240 0100 	movw	r1, #0
  88:	f2c0 0100 	movt	r1, #0
  8c:	a80e      	add	r0, sp, #56	; 0x38
  8e:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
  92:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hdc77bba9f1804906E:

00000000 <core::result::Result<T,E>::unwrap>:
_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hdc77bba9f1804906E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:797
   0:	b088      	sub	sp, #32
   2:	4601      	mov	r1, r0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:799
   4:	6800      	ldr	r0, [r0, #0]
   6:	2800      	cmp	r0, #0
   8:	9103      	str	r1, [sp, #12]
   a:	9002      	str	r0, [sp, #8]
   c:	d005      	beq.n	1a <core::result::Result<T,E>::unwrap+0x1a>
   e:	e7ff      	b.n	10 <core::result::Result<T,E>::unwrap+0x10>
  10:	9802      	ldr	r0, [sp, #8]
  12:	2801      	cmp	r0, #1
  14:	d00f      	beq.n	36 <core::result::Result<T,E>::unwrap+0x36>
  16:	e7ff      	b.n	18 <core::result::Result<T,E>::unwrap+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:802
  18:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:799
  1a:	9803      	ldr	r0, [sp, #12]
  1c:	6841      	ldr	r1, [r0, #4]
  1e:	6882      	ldr	r2, [r0, #8]
  20:	9104      	str	r1, [sp, #16]
  22:	9205      	str	r2, [sp, #20]
  24:	9804      	ldr	r0, [sp, #16]
  26:	9905      	ldr	r1, [sp, #20]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:802
  28:	9a03      	ldr	r2, [sp, #12]
  2a:	6813      	ldr	r3, [r2, #0]
  2c:	2b00      	cmp	r3, #0
  2e:	9001      	str	r0, [sp, #4]
  30:	9100      	str	r1, [sp, #0]
  32:	d00f      	beq.n	54 <core::result::Result<T,E>::unwrap+0x54>
  34:	e012      	b.n	5c <core::result::Result<T,E>::unwrap+0x5c>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:800
  36:	9803      	ldr	r0, [sp, #12]
  38:	6841      	ldr	r1, [r0, #4]
  3a:	6882      	ldr	r2, [r0, #8]
  3c:	9106      	str	r1, [sp, #24]
  3e:	9207      	str	r2, [sp, #28]
  40:	9a06      	ldr	r2, [sp, #24]
  42:	9b07      	ldr	r3, [sp, #28]
  44:	f240 0000 	movw	r0, #0
  48:	f2c0 0000 	movt	r0, #0
  4c:	212b      	movs	r1, #43	; 0x2b
  4e:	f7ff fffe 	bl	0 <core::result::Result<T,E>::unwrap>
  52:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:802
  54:	9801      	ldr	r0, [sp, #4]
  56:	9900      	ldr	r1, [sp, #0]
  58:	b008      	add	sp, #32
  5a:	4770      	bx	lr
  5c:	e7fa      	b.n	54 <core::result::Result<T,E>::unwrap+0x54>

mylib-50794855a3f9698d.4rbgthf0iiiywcr9.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4rbgthf0iiiywcr9
000000ec l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000086 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
000000e7 l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
000000a3 l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000dd l       .debug_str	00000000 
00000000 l    d  .text._ZN9cstr_core4CStr6as_ptr17h45a320e0c342fa37E	00000000 .text._ZN9cstr_core4CStr6as_ptr17h45a320e0c342fa37E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::slice::<impl [T]>::as_ptr
00000000 g     F .text._ZN9cstr_core4CStr6as_ptr17h45a320e0c342fa37E	00000022 .hidden cstr_core::CStr::as_ptr



Disassembly of section .text._ZN9cstr_core4CStr6as_ptr17h45a320e0c342fa37E:

00000000 <cstr_core::CStr::as_ptr>:
_ZN9cstr_core4CStr6as_ptr17h45a320e0c342fa37E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1005
    ///     // `ptr` is valid because `hello` is in scope
    ///     *ptr;
    /// }
    /// ```
    #[inline]
    pub fn as_ptr(&self) -> *const c_char {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9004      	str	r0, [sp, #16]
   a:	9105      	str	r1, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1006
        self.inner.as_ptr()
   c:	9804      	ldr	r0, [sp, #16]
   e:	9905      	ldr	r1, [sp, #20]
  10:	9203      	str	r2, [sp, #12]
  12:	9302      	str	r3, [sp, #8]
  14:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  18:	9001      	str	r0, [sp, #4]
  1a:	e7ff      	b.n	1c <cstr_core::CStr::as_ptr+0x1c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1007
    }
  1c:	9801      	ldr	r0, [sp, #4]
  1e:	b006      	add	sp, #24
  20:	bd80      	pop	{r7, pc}

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

mylib-50794855a3f9698d.cedsy2cozi6z7y9.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cedsy2cozi6z7y9
0000037b l       .debug_str	00000000 
00000437 l       .debug_str	00000000 
00000441 l       .debug_str	00000000 
00000446 l       .debug_str	00000000 
00000477 l       .debug_str	00000000 
00000481 l       .debug_str	00000000 
00000486 l       .debug_str	00000000 
0000048c l       .debug_str	00000000 
0000048e l       .debug_str	00000000 
00000490 l       .debug_str	00000000 
000004b2 l       .debug_str	00000000 
00000521 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
00000088 l       .debug_str	00000000 
0000008b l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000099 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a0 l       .debug_str	00000000 
000000a3 l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000ae l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000dc l       .debug_str	00000000 
000000df l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
000000f9 l       .debug_str	00000000 
00000102 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
00000119 l       .debug_str	00000000 
0000011f l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
0000013f l       .debug_str	00000000 
0000014b l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000166 l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
0000017c l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
000001a6 l       .debug_str	00000000 
000001ad l       .debug_str	00000000 
000001b2 l       .debug_str	00000000 
000001b7 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001e2 l       .debug_str	00000000 
000001e9 l       .debug_str	00000000 
000001ef l       .debug_str	00000000 
000001f3 l       .debug_str	00000000 
00000210 l       .debug_str	00000000 
00000214 l       .debug_str	00000000 
0000021c l       .debug_str	00000000 
00000233 l       .debug_str	00000000 
00000257 l       .debug_str	00000000 
00000273 l       .debug_str	00000000 
00000278 l       .debug_str	00000000 
00000281 l       .debug_str	00000000 
00000288 l       .debug_str	00000000 
000002a1 l       .debug_str	00000000 
000002ab l       .debug_str	00000000 
000002c5 l       .debug_str	00000000 
00000323 l       .debug_str	00000000 
0000032e l       .debug_str	00000000 
00000331 l       .debug_str	00000000 
00000384 l       .debug_str	00000000 
0000038e l       .debug_str	00000000 
00000393 l       .debug_str	00000000 
0000039f l       .debug_str	00000000 
000003b0 l       .debug_str	00000000 
000003ca l       .debug_str	00000000 
000003e0 l       .debug_str	00000000 
00000411 l       .debug_str	00000000 
00000000 l    d  .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5ae69f23802c6b24E	00000000 .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5ae69f23802c6b24E
00000000 l    d  .text._ZN4core3fmt10ArgumentV13new17h821424890ffbea49E	00000000 .text._ZN4core3fmt10ArgumentV13new17h821424890ffbea49E
00000000 l    d  .text._ZN4core3fmt10ArgumentV13new17hd1cbdb343c272a01E	00000000 .text._ZN4core3fmt10ArgumentV13new17hd1cbdb343c272a01E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 <str as core::fmt::Display>::fmt
00000000 g     F .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5ae69f23802c6b24E	00000034 <&T as core::fmt::Display>::fmt
00000000 g     F .text._ZN4core3fmt10ArgumentV13new17h821424890ffbea49E	00000032 core::fmt::ArgumentV1::new
00000000 g     F .text._ZN4core3fmt10ArgumentV13new17hd1cbdb343c272a01E	00000032 core::fmt::ArgumentV1::new



Disassembly of section .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5ae69f23802c6b24E:

00000000 <<&T as core::fmt::Display>::fmt>:
_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h5ae69f23802c6b24E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9004      	str	r0, [sp, #16]
   a:	9105      	str	r1, [sp, #20]
   c:	9804      	ldr	r0, [sp, #16]
   e:	6801      	ldr	r1, [r0, #0]
  10:	6840      	ldr	r0, [r0, #4]
  12:	f8dd c014 	ldr.w	ip, [sp, #20]
  16:	9003      	str	r0, [sp, #12]
  18:	4608      	mov	r0, r1
  1a:	9903      	ldr	r1, [sp, #12]
  1c:	9202      	str	r2, [sp, #8]
  1e:	4662      	mov	r2, ip
  20:	9301      	str	r3, [sp, #4]
  22:	f7ff fffe 	bl	0 <<str as core::fmt::Display>::fmt>
  26:	9000      	str	r0, [sp, #0]
  28:	e7ff      	b.n	2a <<&T as core::fmt::Display>::fmt+0x2a>
  2a:	9800      	ldr	r0, [sp, #0]
  2c:	f000 0001 	and.w	r0, r0, #1
  30:	b006      	add	sp, #24
  32:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h821424890ffbea49E:

00000000 <core::fmt::ArgumentV1::new>:
_ZN4core3fmt10ArgumentV13new17h821424890ffbea49E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:278
   0:	b08a      	sub	sp, #40	; 0x28
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9004      	str	r0, [sp, #16]
   8:	9105      	str	r1, [sp, #20]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:282
   a:	9805      	ldr	r0, [sp, #20]
   c:	9008      	str	r0, [sp, #32]
   e:	9808      	ldr	r0, [sp, #32]
  10:	9203      	str	r2, [sp, #12]
  12:	9302      	str	r3, [sp, #8]
  14:	9001      	str	r0, [sp, #4]
  16:	e7ff      	b.n	18 <core::fmt::ArgumentV1::new+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:283
  18:	9804      	ldr	r0, [sp, #16]
  1a:	9009      	str	r0, [sp, #36]	; 0x24
  1c:	9809      	ldr	r0, [sp, #36]	; 0x24
  1e:	9000      	str	r0, [sp, #0]
  20:	e7ff      	b.n	22 <core::fmt::ArgumentV1::new+0x22>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:281
  22:	9800      	ldr	r0, [sp, #0]
  24:	9006      	str	r0, [sp, #24]
  26:	9901      	ldr	r1, [sp, #4]
  28:	9107      	str	r1, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:286
  2a:	9806      	ldr	r0, [sp, #24]
  2c:	9907      	ldr	r1, [sp, #28]
  2e:	b00a      	add	sp, #40	; 0x28
  30:	4770      	bx	lr

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17hd1cbdb343c272a01E:

00000000 <core::fmt::ArgumentV1::new>:
_ZN4core3fmt10ArgumentV13new17hd1cbdb343c272a01E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:278
   0:	b08a      	sub	sp, #40	; 0x28
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9004      	str	r0, [sp, #16]
   8:	9105      	str	r1, [sp, #20]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:282
   a:	9805      	ldr	r0, [sp, #20]
   c:	9008      	str	r0, [sp, #32]
   e:	9808      	ldr	r0, [sp, #32]
  10:	9203      	str	r2, [sp, #12]
  12:	9302      	str	r3, [sp, #8]
  14:	9001      	str	r0, [sp, #4]
  16:	e7ff      	b.n	18 <core::fmt::ArgumentV1::new+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:283
  18:	9804      	ldr	r0, [sp, #16]
  1a:	9009      	str	r0, [sp, #36]	; 0x24
  1c:	9809      	ldr	r0, [sp, #36]	; 0x24
  1e:	9000      	str	r0, [sp, #0]
  20:	e7ff      	b.n	22 <core::fmt::ArgumentV1::new+0x22>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:281
  22:	9800      	ldr	r0, [sp, #0]
  24:	9006      	str	r0, [sp, #24]
  26:	9901      	ldr	r1, [sp, #4]
  28:	9107      	str	r1, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:286
  2a:	9806      	ldr	r0, [sp, #24]
  2c:	9907      	ldr	r1, [sp, #28]
  2e:	b00a      	add	sp, #40	; 0x28
  30:	4770      	bx	lr
arm-none-eabi-objdump: rust.metadata.bin: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.19vpnfslw8lxmhl.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.2bwhitp1kuocnn5l.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.3c1f576kwx5k1d0.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.3k67uemb1cshb4cs.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.3ksiz0oe1f34lits.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.4rbgthf0iiiywcr9.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.509tcgk6983yrx6c.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.cedsy2cozi6z7y9.rcgu.bc.z: File format not recognized
