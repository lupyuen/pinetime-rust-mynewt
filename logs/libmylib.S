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
00000000         *UND*	00000000 .hidden _ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000 g     F .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E	00000030 .hidden _ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E
00000000 g     F .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E	00000016 .hidden _ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E



Disassembly of section .text._ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E:

00000000 <_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E>:
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
   c:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  10:	e7ff      	b.n	12 <_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E+0x12>
  12:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:7
    0
}
  14:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E:

00000000 <_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E>:
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
  24:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  28:	e7ff      	b.n	2a <_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E+0x2a>
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
00000000 l     F .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE	0000001c _ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE
00000000 l    d  .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E	00000000 .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E
00000000 l    d  .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE	00000000 .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE
00000000 l    d  .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E	00000000 .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E
00000000 l    d  .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	00000000 .text._ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h63f985867d9f263fE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE
00000000 g     F .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E	00000012 .hidden _ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E
00000000 g     F .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	0000003c .hidden _ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000 g     F .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E	0000001c .hidden _ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush



Disassembly of section .text._ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E:

00000000 <_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E>:
_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:81
    pub fn os_eventq_run(evq: *const CVoid);
    pub fn os_eventq_dflt_get() -> *const CVoid;
}

//  Must sync with apps/my_sensor_app/src/listen_sensor.h
pub fn SENSOR_DEVICE() -> *const u8 { TEMP_STM32_DEVICE() }  //  We will open internal temperature sensor "temp_stm32_0"
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	f7ff fffe 	bl	0 <_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E>
   8:	9001      	str	r0, [sp, #4]
   a:	e7ff      	b.n	c <_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E+0xc>
   c:	9801      	ldr	r0, [sp, #4]
   e:	b002      	add	sp, #8
  10:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE:

00000000 <_ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE>:
_ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:82
pub fn TEMP_STM32_DEVICE() -> *const u8 { b"temp_stm32_0\0".as_ptr() }
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	210d      	movs	r1, #13
   e:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE>
  12:	9001      	str	r0, [sp, #4]
  14:	e7ff      	b.n	16 <_ZN5mylib4base17TEMP_STM32_DEVICE17h8b7032cac622da1eE+0x16>
  16:	9801      	ldr	r0, [sp, #4]
  18:	b002      	add	sp, #8
  1a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E:

00000000 <_ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E>:
_ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:88

//  Must sync with libs/temp_stm32/include/temp_stm32/temp_stm32.h
//  #if MYNEWT_VAL(RAW_TEMP)                                       //  If we are returning raw temperature (integers)...
pub const TEMP_SENSOR_TYPE: SensorType = SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;  //  Set to raw sensor type
pub const TEMP_SENSOR_VALUE_TYPE: i32 = SENSOR_VALUE_TYPE_INT32;         //  Return integer sensor values
pub fn TEMP_SENSOR_KEY() -> *const u8 { b"t\0".as_ptr() }  //  Use key (field name) "t" to transmit raw temperature to CoAP Server or Collector Node
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	2102      	movs	r1, #2
   e:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE>
  12:	9001      	str	r0, [sp, #4]
  14:	e7ff      	b.n	16 <_ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E+0x16>
  16:	9801      	ldr	r0, [sp, #4]
  18:	b002      	add	sp, #8
  1a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib4base13console_print17h7239bde54deb9f31E:

00000000 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>:
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
  14:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h63f985867d9f263fE>
  18:	9005      	str	r0, [sp, #20]
  1a:	e7ff      	b.n	1c <_ZN5mylib4base13console_print17h7239bde54deb9f31E+0x1c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:195
    unsafe {
        console_buffer(msg.as_ptr(), len as u32);
  1c:	9803      	ldr	r0, [sp, #12]
  1e:	9904      	ldr	r1, [sp, #16]
  20:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE>
  24:	9000      	str	r0, [sp, #0]
  26:	e7ff      	b.n	28 <_ZN5mylib4base13console_print17h7239bde54deb9f31E+0x28>
  28:	9905      	ldr	r1, [sp, #20]
  2a:	9800      	ldr	r0, [sp, #0]
  2c:	f7ff fffe 	bl	0 <console_buffer>
  30:	e7ff      	b.n	2 <console_flush+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:196
        console_flush(); ////
  32:	f7ff fffe 	bl	0 <console_flush>
  36:	e7ff      	b.n	38 <_ZN5mylib4base13console_print17h7239bde54deb9f31E+0x38>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:198
    }
  38:	b006      	add	sp, #24
  3a:	bd80      	pop	{r7, pc}

mylib-50794855a3f9698d.3k67uemb1cshb4cs.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3k67uemb1cshb4cs
00000303 l       .debug_str	00000000 
00000286 l       .debug_str	00000000 
00000296 l       .debug_str	00000000 
0000029a l       .debug_str	00000000 
0000029d l       .debug_str	00000000 
000002a7 l       .debug_str	00000000 
000002b0 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002bc l       .debug_str	00000000 
000002c6 l       .debug_str	00000000 
000002ca l       .debug_str	00000000 
000002d6 l       .debug_str	00000000 
000002d9 l       .debug_str	00000000 
000002e0 l       .debug_str	00000000 
000002e4 l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
000002fc l       .debug_str	00000000 
00000309 l       .debug_str	00000000 
00000315 l       .debug_str	00000000 
0000031f l       .debug_str	00000000 
00000325 l       .debug_str	00000000 
00000339 l       .debug_str	00000000 
0000033e l       .debug_str	00000000 
0000034f l       .debug_str	00000000 
00000361 l       .debug_str	00000000 
0000036e l       .debug_str	00000000 
0000037a l       .debug_str	00000000 
00000388 l       .debug_str	00000000 
0000039f l       .debug_str	00000000 
000003b1 l       .debug_str	00000000 
000003d1 l       .debug_str	00000000 
000003da l       .debug_str	00000000 
000003e3 l       .debug_str	00000000 
000003f5 l       .debug_str	00000000 
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
000000c1 l       .debug_str	00000000 
000000cb l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
0000014a l       .debug_str	00000000 
00000151 l       .debug_str	00000000 
00000159 l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001e2 l       .debug_str	00000000 
000001f8 l       .debug_str	00000000 
00000237 l       .debug_str	00000000 
00000248 l       .debug_str	00000000 
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
00000000 l     F .text._ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E	00000150 _ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E	00000120 _ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E
00000000 l     O .data._ZN5mylib13listen_sensor8LISTENER17hb80742a786b12deeE	00000018 _ZN5mylib13listen_sensor8LISTENER17hb80742a786b12deeE
00000000 l    d  .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	00000000 .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E	00000000 .text._ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E
00000000 l    d  .text._ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E	00000000 .text._ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E
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
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000 g     F .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	000000ac .hidden _ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000         *UND*	00000000 .hidden _ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E
00000000         *UND*	00000000 .hidden _ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000         *UND*	00000000 .hidden _ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E
00000000         *UND*	00000000 .hidden _ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E
00000000         *UND*	00000000 _ZN9cstr_core4CStr8from_ptr17ha5d4992c233d069bE
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

00000000 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE>:
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
   e:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  12:	e7ff      	b.n	2 <_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:36

        //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
        let rc = sensor_set_poll_rate_ms(SENSOR_DEVICE(), SENSOR_POLL_TIME);
  14:	f7ff fffe 	bl	0 <_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E>
  18:	9004      	str	r0, [sp, #16]
  1a:	e7ff      	b.n	1c <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x1c>
  1c:	f242 7110 	movw	r1, #10000	; 0x2710
  20:	9804      	ldr	r0, [sp, #16]
  22:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
  26:	9005      	str	r0, [sp, #20]
  28:	e7ff      	b.n	2a <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x2a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:37
        assert!(rc == 0);
  2a:	9805      	ldr	r0, [sp, #20]
  2c:	2800      	cmp	r0, #0
  2e:	d007      	beq.n	40 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x40>
  30:	e7ff      	b.n	32 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x32>
  32:	f240 0000 	movw	r0, #0
  36:	f2c0 0000 	movt	r0, #0
  3a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  3e:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:40

        //  Fetch the sensor by name, without locking the driver for exclusive access.
        let listen_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE(), null_sensor());
  40:	f7ff fffe 	bl	0 <_ZN5mylib4base13SENSOR_DEVICE17hbdc0eeffd5237ae2E>
  44:	9003      	str	r0, [sp, #12]
  46:	e7ff      	b.n	48 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x48>
  48:	f7ff fffe 	bl	0 <null_sensor>
  4c:	9002      	str	r0, [sp, #8]
  4e:	e7ff      	b.n	50 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x50>
  50:	9803      	ldr	r0, [sp, #12]
  52:	9902      	ldr	r1, [sp, #8]
  54:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  58:	9006      	str	r0, [sp, #24]
  5a:	e7ff      	b.n	5c <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x5c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:41
        assert!(!is_null_sensor(listen_sensor));
  5c:	9806      	ldr	r0, [sp, #24]
  5e:	f7ff fffe 	bl	0 <is_null_sensor>
  62:	9001      	str	r0, [sp, #4]
  64:	e7ff      	b.n	66 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x66>
  66:	9801      	ldr	r0, [sp, #4]
  68:	07c1      	lsls	r1, r0, #31
  6a:	2900      	cmp	r1, #0
  6c:	d007      	beq.n	7e <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x7e>
  6e:	e7ff      	b.n	70 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x70>
  70:	f240 0000 	movw	r0, #0
  74:	f2c0 0000 	movt	r0, #0
  78:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  7c:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:44

        //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
        let rc = sensor_register_listener(listen_sensor, &LISTENER);
  7e:	9806      	ldr	r0, [sp, #24]
  80:	f240 0100 	movw	r1, #0
  84:	f2c0 0100 	movt	r1, #0
  88:	f7ff fffe 	bl	0 <sensor_register_listener>
  8c:	9007      	str	r0, [sp, #28]
  8e:	e7ff      	b.n	90 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x90>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:45
        assert!(rc == 0);
  90:	9807      	ldr	r0, [sp, #28]
  92:	2800      	cmp	r0, #0
  94:	d007      	beq.n	a6 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0xa6>
  96:	e7ff      	b.n	98 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x98>
  98:	f240 0000 	movw	r0, #0
  9c:	f2c0 0000 	movt	r0, #0
  a0:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  a4:	defe      	udf	#254	; 0xfe
  a6:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:48
    }
    0
}
  a8:	b008      	add	sp, #32
  aa:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E:

00000000 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E>:
_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:58
//  TODO

/////////////////////////////////////////////////////////
//  Process Temperature Sensor Value (Raw and Computed)

extern fn read_temperature(sensor: SensorPtr, arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b096      	sub	sp, #88	; 0x58
   4:	9b1b      	ldr	r3, [sp, #108]	; 0x6c
   6:	f8dd c068 	ldr.w	ip, [sp, #104]	; 0x68
   a:	4696      	mov	lr, r2
   c:	460c      	mov	r4, r1
   e:	4605      	mov	r5, r0
  10:	9007      	str	r0, [sp, #28]
  12:	9108      	str	r1, [sp, #32]
  14:	9209      	str	r2, [sp, #36]	; 0x24
  16:	930b      	str	r3, [sp, #44]	; 0x2c
  18:	f8cd c028 	str.w	ip, [sp, #40]	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:65
    //  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through sensor_data.
    //  If this is a Sensor Node, we send the sensor data to the Collector Node.
    //  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    //  Return 0 if we have processed the sensor data successfully.
    unsafe {
        console_print(b"read_temperature\n");
  1c:	f240 0000 	movw	r0, #0
  20:	f2c0 0000 	movt	r0, #0
  24:	2111      	movs	r1, #17
  26:	f8cd e018 	str.w	lr, [sp, #24]
  2a:	9405      	str	r4, [sp, #20]
  2c:	9504      	str	r5, [sp, #16]
  2e:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  32:	e7ff      	b.n	34 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x34>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:68
        //  Check that the temperature data is valid.
        //  TODO
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
  34:	9809      	ldr	r0, [sp, #36]	; 0x24
  36:	f7ff fffe 	bl	0 <is_null_sensor_data>
  3a:	9003      	str	r0, [sp, #12]
  3c:	e7ff      	b.n	3e <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x3e>
  3e:	9803      	ldr	r0, [sp, #12]
  40:	07c1      	lsls	r1, r0, #31
  42:	2900      	cmp	r1, #0
  44:	d007      	beq.n	56 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x56>
  46:	e7ff      	b.n	48 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x48>
  48:	f06f 0001 	mvn.w	r0, #1
  4c:	900c      	str	r0, [sp, #48]	; 0x30
  4e:	e7ff      	b.n	50 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x50>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:100
        }
        assert!(rc == 0);
        //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    0
}
  50:	980c      	ldr	r0, [sp, #48]	; 0x30
  52:	b016      	add	sp, #88	; 0x58
  54:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:69
        assert!(!is_null_sensor(sensor));
  56:	9807      	ldr	r0, [sp, #28]
  58:	f7ff fffe 	bl	0 <is_null_sensor>
  5c:	9002      	str	r0, [sp, #8]
  5e:	e7ff      	b.n	60 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x60>
  60:	9802      	ldr	r0, [sp, #8]
  62:	07c1      	lsls	r1, r0, #31
  64:	2900      	cmp	r1, #0
  66:	d007      	beq.n	78 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x78>
  68:	e7ff      	b.n	6a <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x6a>
  6a:	f240 0000 	movw	r0, #0
  6e:	f2c0 0000 	movt	r0, #0
  72:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  76:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:73
        let device = sensor_get_device(sensor);
  78:	9807      	ldr	r0, [sp, #28]
  7a:	f7ff fffe 	bl	0 <sensor_get_device>
  7e:	900d      	str	r0, [sp, #52]	; 0x34
  80:	e7ff      	b.n	82 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x82>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:74
        let c_buf: *const c_char = device_get_name(device);
  82:	980d      	ldr	r0, [sp, #52]	; 0x34
  84:	f7ff fffe 	bl	0 <device_get_name>
  88:	900e      	str	r0, [sp, #56]	; 0x38
  8a:	e7ff      	b.n	8c <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x8c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:75
        let device_name: &CStr = CStr::from_ptr(c_buf);
  8c:	980e      	ldr	r0, [sp, #56]	; 0x38
  8e:	f7ff fffe 	bl	0 <_ZN9cstr_core4CStr8from_ptr17ha5d4992c233d069bE>
  92:	9001      	str	r0, [sp, #4]
  94:	9100      	str	r1, [sp, #0]
  96:	e7ff      	b.n	98 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x98>
  98:	9801      	ldr	r0, [sp, #4]
  9a:	900f      	str	r0, [sp, #60]	; 0x3c
  9c:	9900      	ldr	r1, [sp, #0]
  9e:	9110      	str	r1, [sp, #64]	; 0x40
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:79
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
  a0:	9909      	ldr	r1, [sp, #36]	; 0x24
  a2:	9a0a      	ldr	r2, [sp, #40]	; 0x28
  a4:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
  a6:	a811      	add	r0, sp, #68	; 0x44
  a8:	f7ff fffe 	bl	0 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E>
  ac:	e7ff      	b.n	ae <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:80
        assert!(temp_sensor_value.val_type != 0);
  ae:	9812      	ldr	r0, [sp, #72]	; 0x48
  b0:	2800      	cmp	r0, #0
  b2:	d107      	bne.n	c4 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xc4>
  b4:	e7ff      	b.n	b6 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xb6>
  b6:	f240 0000 	movw	r0, #0
  ba:	f2c0 0000 	movt	r0, #0
  be:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  c2:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:81
        if temp_sensor_value.val_type == 0 { return -1; }  //  Invalid type.
  c4:	9812      	ldr	r0, [sp, #72]	; 0x48
  c6:	2800      	cmp	r0, #0
  c8:	d105      	bne.n	d6 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xd6>
  ca:	e7ff      	b.n	cc <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xcc>
  cc:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
  d0:	900c      	str	r0, [sp, #48]	; 0x30
  d2:	e7ff      	b.n	d4 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xd4>
  d4:	e7bc      	b.n	50 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x50>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:88
        let rc = send_sensor_data(&temp_sensor_value, device_name);
  d6:	990f      	ldr	r1, [sp, #60]	; 0x3c
  d8:	9a10      	ldr	r2, [sp, #64]	; 0x40
  da:	a811      	add	r0, sp, #68	; 0x44
  dc:	f7ff fffe 	bl	0 <_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E>
  e0:	9015      	str	r0, [sp, #84]	; 0x54
  e2:	e7ff      	b.n	e4 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xe4>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:92
        if rc == SYS_EAGAIN {
  e4:	9815      	ldr	r0, [sp, #84]	; 0x54
  e6:	3006      	adds	r0, #6
  e8:	2800      	cmp	r0, #0
  ea:	d10b      	bne.n	104 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x104>
  ec:	e7ff      	b.n	ee <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xee>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:93
            console_print(b"TMP network not ready\n");
  ee:	f240 0000 	movw	r0, #0
  f2:	f2c0 0000 	movt	r0, #0
  f6:	2116      	movs	r1, #22
  f8:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  fc:	e7ff      	b.n	fe <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xfe>
  fe:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:94
            return 0; 
 100:	900c      	str	r0, [sp, #48]	; 0x30
 102:	e7e7      	b.n	d4 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0xd4>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:96
        assert!(rc == 0);
 104:	9815      	ldr	r0, [sp, #84]	; 0x54
 106:	2800      	cmp	r0, #0
 108:	d007      	beq.n	11a <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x11a>
 10a:	e7ff      	b.n	10c <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x10c>
 10c:	f240 0000 	movw	r0, #0
 110:	f2c0 0000 	movt	r0, #0
 114:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 118:	defe      	udf	#254	; 0xfe
 11a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:99
    0
 11c:	900c      	str	r0, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:100
}
 11e:	e797      	b.n	50 <_ZN5mylib13listen_sensor16read_temperature17h3a67ac1111c16949E+0x50>

Disassembly of section .text._ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E:

00000000 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E>:
_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:102

fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
   0:	b510      	push	{r4, lr}
   2:	b098      	sub	sp, #96	; 0x60
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	9107      	str	r1, [sp, #28]
   c:	9309      	str	r3, [sp, #36]	; 0x24
   e:	9208      	str	r2, [sp, #32]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:107
    //  Get the temperature value, raw or computed.  sensor_data contains the raw or computed temperature. 
    //  type indicates whether sensor_data contains raw or computed temperature.  We return 
    //  the raw or computed temperature, as well as the key and value type.
    let mut return_value = SensorValue {
        key: b"\0".as_ptr(),
  10:	f240 0100 	movw	r1, #0
  14:	f2c0 0100 	movt	r1, #0
  18:	2201      	movs	r2, #1
  1a:	9006      	str	r0, [sp, #24]
  1c:	4608      	mov	r0, r1
  1e:	4611      	mov	r1, r2
  20:	f8cd c014 	str.w	ip, [sp, #20]
  24:	f8cd e010 	str.w	lr, [sp, #16]
  28:	9403      	str	r4, [sp, #12]
  2a:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE>
  2e:	9002      	str	r0, [sp, #8]
  30:	e7ff      	b.n	32 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x32>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:106
    let mut return_value = SensorValue {
  32:	9802      	ldr	r0, [sp, #8]
  34:	900b      	str	r0, [sp, #44]	; 0x2c
  36:	2100      	movs	r1, #0
  38:	910c      	str	r1, [sp, #48]	; 0x30
  3a:	f8ad 1034 	strh.w	r1, [sp, #52]	; 0x34
  3e:	910e      	str	r1, [sp, #56]	; 0x38
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:115
        float_val: 0.0,
    };
    unsafe {
        //assert!(sensor_data);
        match sensor_type {                                //  Is this raw or computed temperature?
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  40:	9908      	ldr	r1, [sp, #32]
  42:	9a09      	ldr	r2, [sp, #36]	; 0x24
  44:	f081 6180 	eor.w	r1, r1, #67108864	; 0x4000000
  48:	4311      	orrs	r1, r2
  4a:	2900      	cmp	r1, #0
  4c:	d138      	bne.n	c0 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xc0>
  4e:	e7ff      	b.n	50 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x50>
  50:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:117
                //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
                let mut rawtempdata = SensorTempRawData {
  52:	900f      	str	r0, [sp, #60]	; 0x3c
  54:	f88d 0040 	strb.w	r0, [sp, #64]	; 0x40
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
                    strd_temp_raw: 0,
                    strd_temp_raw_is_valid: 0,
                };
                let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
  58:	9807      	ldr	r0, [sp, #28]
  5a:	a90f      	add	r1, sp, #60	; 0x3c
  5c:	f7ff fffe 	bl	0 <get_temp_raw_data>
  60:	9011      	str	r0, [sp, #68]	; 0x44
  62:	e7ff      	b.n	64 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x64>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:122
                assert!(rc == 0);
  64:	9811      	ldr	r0, [sp, #68]	; 0x44
  66:	2800      	cmp	r0, #0
  68:	d007      	beq.n	7a <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x7a>
  6a:	e7ff      	b.n	6c <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x6c>
  6c:	f240 0000 	movw	r0, #0
  70:	f2c0 0000 	movt	r0, #0
  74:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  78:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:125

                //  Check that the raw temperature data is valid.
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  7a:	f89d 0040 	ldrb.w	r0, [sp, #64]	; 0x40
  7e:	2800      	cmp	r0, #0
  80:	d112      	bne.n	a8 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xa8>
  82:	e7ff      	b.n	84 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x84>
  84:	980b      	ldr	r0, [sp, #44]	; 0x2c
  86:	990c      	ldr	r1, [sp, #48]	; 0x30
  88:	9a0d      	ldr	r2, [sp, #52]	; 0x34
  8a:	9b0e      	ldr	r3, [sp, #56]	; 0x38
  8c:	f8dd c018 	ldr.w	ip, [sp, #24]
  90:	f8cc 300c 	str.w	r3, [ip, #12]
  94:	f8cc 2008 	str.w	r2, [ip, #8]
  98:	f8cc 1004 	str.w	r1, [ip, #4]
  9c:	f8cc 0000 	str.w	r0, [ip]
  a0:	e001      	b.n	a6 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xa6>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:161
        //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
        return_value.key = TEMP_SENSOR_KEY();
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
    };
    return_value
}
  a2:	b018      	add	sp, #96	; 0x60
  a4:	bd10      	pop	{r4, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:125
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  a6:	e7fc      	b.n	a2 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xa2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:128
                return_value.int_val = rawtempdata.strd_temp_raw as u16;  //  Raw Temperature in integer (0 to 4095)
  a8:	980f      	ldr	r0, [sp, #60]	; 0x3c
  aa:	f8ad 0034 	strh.w	r0, [sp, #52]	; 0x34
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
                console_print(b"TMP listener got rawtmp \n");  // return_value->int_val);
  ae:	f240 0000 	movw	r0, #0
  b2:	f2c0 0000 	movt	r0, #0
  b6:	2119      	movs	r1, #25
  b8:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  bc:	e7ff      	b.n	be <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xbe>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
        match sensor_type {                                //  Is this raw or computed temperature?
  be:	e02f      	b.n	120 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x120>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:131
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
  c0:	9808      	ldr	r0, [sp, #32]
  c2:	9909      	ldr	r1, [sp, #36]	; 0x24
  c4:	9113      	str	r1, [sp, #76]	; 0x4c
  c6:	9012      	str	r0, [sp, #72]	; 0x48
  c8:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:133
                let mut tempdata = SensorTempData {
  ca:	9015      	str	r0, [sp, #84]	; 0x54
  cc:	f88d 0058 	strb.w	r0, [sp, #88]	; 0x58
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:137
                let rc = get_temp_data(sensor_data, &mut tempdata);
  d0:	9807      	ldr	r0, [sp, #28]
  d2:	a915      	add	r1, sp, #84	; 0x54
  d4:	f7ff fffe 	bl	0 <get_temp_data>
  d8:	9017      	str	r0, [sp, #92]	; 0x5c
  da:	e7ff      	b.n	dc <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xdc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:138
                assert!(rc == 0);
  dc:	9817      	ldr	r0, [sp, #92]	; 0x5c
  de:	2800      	cmp	r0, #0
  e0:	d007      	beq.n	f2 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xf2>
  e2:	e7ff      	b.n	e4 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xe4>
  e4:	f240 0000 	movw	r0, #0
  e8:	f2c0 0000 	movt	r0, #0
  ec:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  f0:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:141
                if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  f2:	f89d 0058 	ldrb.w	r0, [sp, #88]	; 0x58
  f6:	2800      	cmp	r0, #0
  f8:	d10f      	bne.n	11a <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x11a>
  fa:	e7ff      	b.n	fc <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xfc>
  fc:	980b      	ldr	r0, [sp, #44]	; 0x2c
  fe:	990c      	ldr	r1, [sp, #48]	; 0x30
 100:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 102:	9b0e      	ldr	r3, [sp, #56]	; 0x38
 104:	f8dd c018 	ldr.w	ip, [sp, #24]
 108:	f8cc 300c 	str.w	r3, [ip, #12]
 10c:	f8cc 2008 	str.w	r2, [ip, #8]
 110:	f8cc 1004 	str.w	r1, [ip, #4]
 114:	f8cc 0000 	str.w	r0, [ip]
 118:	e7c5      	b.n	a6 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xa6>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:144
                return_value.float_val = tempdata.std_temp;  //  Temperature in floating point.
 11a:	9815      	ldr	r0, [sp, #84]	; 0x54
 11c:	900e      	str	r0, [sp, #56]	; 0x38
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
        match sensor_type {                                //  Is this raw or computed temperature?
 11e:	e7ff      	b.n	120 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x120>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:157
        return_value.key = TEMP_SENSOR_KEY();
 120:	f7ff fffe 	bl	0 <_ZN5mylib4base15TEMP_SENSOR_KEY17h0450714b2dc58f00E>
 124:	9001      	str	r0, [sp, #4]
 126:	e7ff      	b.n	128 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0x128>
 128:	9801      	ldr	r0, [sp, #4]
 12a:	900b      	str	r0, [sp, #44]	; 0x2c
 12c:	2101      	movs	r1, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:158
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
 12e:	910c      	str	r1, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:160
    return_value
 130:	990b      	ldr	r1, [sp, #44]	; 0x2c
 132:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 134:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 136:	f8dd c038 	ldr.w	ip, [sp, #56]	; 0x38
 13a:	f8dd e018 	ldr.w	lr, [sp, #24]
 13e:	f8ce c00c 	str.w	ip, [lr, #12]
 142:	f8ce 3008 	str.w	r3, [lr, #8]
 146:	f8ce 2004 	str.w	r2, [lr, #4]
 14a:	f8ce 1000 	str.w	r1, [lr]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:161
}
 14e:	e7a8      	b.n	a2 <_ZN5mylib13listen_sensor15get_temperature17h9fceb4af8d11c3c9E+0xa2>

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
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 .hidden _ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000         *UND*	00000000 .hidden _ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E
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
   c:	e7ff      	b.n	2 <_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:23

        //#if defined(SERVER_NETWORK_INTERFACE) || defined(SENSOR_NETWORK_INTERFACE)  //  If the ESP8266 or nRF24L01 is enabled...
        //  Start the Network Task in the background.  The Network Task prepares the ESP8266 or nRF24L01 transceiver for
        //  sending CoAP messages.  We connect the ESP8266 to the WiFi access point and register
        //  the ESP8266/nRF24L01 driver as the network transport for CoAP.  Also perform WiFi Geolocation if it is enabled.
        let rc1 = start_network_task();  assert!(rc1 == 0);
   e:	f7ff fffe 	bl	0 <_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E>
  12:	9002      	str	r0, [sp, #8]
  14:	e7ff      	b.n	16 <main+0x16>
  16:	9802      	ldr	r0, [sp, #8]
  18:	2800      	cmp	r0, #0
  1a:	d007      	beq.n	2c <main+0x2c>
  1c:	e7ff      	b.n	1e <main+0x1e>
  1e:	f240 0000 	movw	r0, #0
  22:	f2c0 0000 	movt	r0, #0
  26:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  2a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:30

        //#ifdef SENSOR_DEVICE   //  If BME280 or internal temperature sensor is enabled...
        //  Starting polling the temperature sensor every 10 seconds in the background.  
        //  After polling the sensor, call the listener function to send the sensor data to the CoAP server or Collector Node.
        //  If this is the Collector Node, we shall wait for sensor data from the Sensor Nodes and transmit to the CoAP server.
        let rc2 = start_sensor_listener();  assert!(rc2 == 0);
  2c:	f7ff fffe 	bl	0 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE>
  30:	9003      	str	r0, [sp, #12]
  32:	e7ff      	b.n	34 <main+0x34>
  34:	9803      	ldr	r0, [sp, #12]
  36:	2800      	cmp	r0, #0
  38:	d007      	beq.n	4a <main+0x4a>
  3a:	e7ff      	b.n	3c <main+0x3c>
  3c:	f240 0000 	movw	r0, #0
  40:	f2c0 0000 	movt	r0, #0
  44:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
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
