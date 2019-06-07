In archive target/thumbv7m-none-eabi/debug/libmylib.rlib:

mylib-50794855a3f9698d.19vpnfslw8lxmhl.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 19vpnfslw8lxmhl
000001b1 l       .debug_str	00000000 
00000194 l       .debug_str	00000000 
000001a1 l       .debug_str	00000000 
000001ab l       .debug_str	00000000 
000001c5 l       .debug_str	00000000 
000001ca l       .debug_str	00000000 
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
0000012f l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
00000138 l       .debug_str	00000000 
0000013b l       .debug_str	00000000 
00000145 l       .debug_str	00000000 
0000014e l       .debug_str	00000000 
00000156 l       .debug_str	00000000 
0000015a l       .debug_str	00000000 
00000164 l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
00000174 l       .debug_str	00000000 
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:20

///  TODO: Start the Network Task in the background.  The Network Task prepares the network drivers
///  (ESP8266 and nRF24L01) for transmitting sensor data messages.  
///  Connecting the ESP8266 to the WiFi access point may be slow so we do this in the background.
///  Also perform WiFi Geolocation if it is enabled.  Return 0 if successful.
pub fn start_network_task() -> i32 {
   0:	b580      	push	{r7, lr}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:21
    console_print(b"start_network_task\n");
   2:	f240 0000 	movw	r0, #0
   6:	f2c0 0000 	movt	r0, #0
   a:	2113      	movs	r1, #19
   c:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  10:	e7ff      	b.n	12 <_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E+0x12>
  12:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:23
    0
}
  14:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E:

00000000 <_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E>:
_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:34
///  For Collector Node: sensor_node is the Sensor Node Address of the Sensor Node that transmitted
///  the sensor data (like `b3b4b5b6f1`)
///  The message will be enqueued for transmission by the CoAP / OIC Background Task 
///  so this function will return without waiting for the message to be transmitted.  
///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
pub fn send_sensor_data(_val: *const SensorValue, _sensor_node: &'static CStr) -> i32 {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9003      	str	r0, [sp, #12]
   c:	9104      	str	r1, [sp, #16]
   e:	9205      	str	r2, [sp, #20]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:35
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:37
    0
}
  2c:	b006      	add	sp, #24
  2e:	bd80      	pop	{r7, pc}

mylib-50794855a3f9698d.2bwhitp1kuocnn5l.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2bwhitp1kuocnn5l
000000f4 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000cb l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000e1 l       .debug_str	00000000 
000000e8 l       .debug_str	00000000 
00000000 l    d  .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	00000000 .text._ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h63f985867d9f263fE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE
00000000 g     F .text._ZN5mylib4base13console_print17h7239bde54deb9f31E	0000003c .hidden _ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush



Disassembly of section .text._ZN5mylib4base13console_print17h7239bde54deb9f31E:

00000000 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>:
_ZN5mylib4base13console_print17h7239bde54deb9f31E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:7

use cty::*;            //  Import string utilities from cty library: https://crates.io/crates/cty
use crate::sensor::*;  //  Import sensor.rs for Mynewt Sensor API

///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn console_print(msg: &[u8]) {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9003      	str	r0, [sp, #12]
   a:	9104      	str	r1, [sp, #16]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:8
    let len = msg.len();
   c:	9803      	ldr	r0, [sp, #12]
   e:	9904      	ldr	r1, [sp, #16]
  10:	9202      	str	r2, [sp, #8]
  12:	9301      	str	r3, [sp, #4]
  14:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h63f985867d9f263fE>
  18:	9005      	str	r0, [sp, #20]
  1a:	e7ff      	b.n	1c <_ZN5mylib4base13console_print17h7239bde54deb9f31E+0x1c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
    unsafe {
        //  Call the Semihosting Console API, which is unsafe.
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  32:	f7ff fffe 	bl	0 <console_flush>
  36:	e7ff      	b.n	38 <_ZN5mylib4base13console_print17h7239bde54deb9f31E+0x38>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:14
    }
}
  38:	b006      	add	sp, #24
  3a:	bd80      	pop	{r7, pc}

mylib-50794855a3f9698d.2ui9vppr5zt78ili.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2ui9vppr5zt78ili
00000147 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
0000014b l       .debug_str	00000000 
0000018a l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000081 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
000000cf l       .debug_str	00000000 
000000d8 l       .debug_str	00000000 
000000e1 l       .debug_str	00000000 
000000e4 l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
000000fb l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000106 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E	00000000 .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E
00000000 l    d  .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E	00000000 .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E	0000003c .hidden _ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E
00000000 g     F .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E	00000014 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h63f985867d9f263fE



Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E:

00000000 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E>:
_ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2070
   0:	b580      	push	{r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9006      	str	r0, [sp, #24]
   a:	9107      	str	r1, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2071
   c:	9806      	ldr	r0, [sp, #24]
   e:	9907      	ldr	r1, [sp, #28]
  10:	9008      	str	r0, [sp, #32]
  12:	9109      	str	r1, [sp, #36]	; 0x24
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
  14:	9808      	ldr	r0, [sp, #32]
  16:	9909      	ldr	r1, [sp, #36]	; 0x24
  18:	900a      	str	r0, [sp, #40]	; 0x28
  1a:	910b      	str	r1, [sp, #44]	; 0x2c
  1c:	980a      	ldr	r0, [sp, #40]	; 0x28
  1e:	990b      	ldr	r1, [sp, #44]	; 0x2c
_ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2071
  20:	9205      	str	r2, [sp, #20]
  22:	9304      	str	r3, [sp, #16]
  24:	9003      	str	r0, [sp, #12]
  26:	9102      	str	r1, [sp, #8]
  28:	e7ff      	b.n	2a <_ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E+0x2a>
  2a:	9803      	ldr	r0, [sp, #12]
  2c:	9902      	ldr	r1, [sp, #8]
  2e:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h63f985867d9f263fE>
  32:	9001      	str	r0, [sp, #4]
  34:	e7ff      	b.n	36 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E+0x36>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2072
  36:	9801      	ldr	r0, [sp, #4]
  38:	b00c      	add	sp, #48	; 0x30
  3a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E:

00000000 <_ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E>:
_ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2217
   0:	b084      	sub	sp, #16
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9002      	str	r0, [sp, #8]
   8:	9103      	str	r1, [sp, #12]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2218
   a:	9802      	ldr	r0, [sp, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2219
   c:	9201      	str	r2, [sp, #4]
   e:	9300      	str	r3, [sp, #0]
  10:	b004      	add	sp, #16
  12:	4770      	bx	lr

mylib-50794855a3f9698d.3k67uemb1cshb4cs.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3k67uemb1cshb4cs
000002d4 l       .debug_str	00000000 
000001e6 l       .debug_str	00000000 
000001ea l       .debug_str	00000000 
000001f6 l       .debug_str	00000000 
000001f9 l       .debug_str	00000000 
00000215 l       .debug_str	00000000 
0000021e l       .debug_str	00000000 
0000022d l       .debug_str	00000000 
00000231 l       .debug_str	00000000 
00000239 l       .debug_str	00000000 
00000292 l       .debug_str	00000000 
00000299 l       .debug_str	00000000 
000002a1 l       .debug_str	00000000 
000002b0 l       .debug_str	00000000 
000002b5 l       .debug_str	00000000 
000002c1 l       .debug_str	00000000 
000002cd l       .debug_str	00000000 
000002da l       .debug_str	00000000 
000002e6 l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
000002f6 l       .debug_str	00000000 
0000030a l       .debug_str	00000000 
0000030f l       .debug_str	00000000 
00000320 l       .debug_str	00000000 
00000332 l       .debug_str	00000000 
0000033f l       .debug_str	00000000 
0000034b l       .debug_str	00000000 
00000359 l       .debug_str	00000000 
00000370 l       .debug_str	00000000 
00000382 l       .debug_str	00000000 
000003a2 l       .debug_str	00000000 
000003ab l       .debug_str	00000000 
000003b4 l       .debug_str	00000000 
000003c6 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
0000008d l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
000000a1 l       .debug_str	00000000 
000000a7 l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000f9 l       .debug_str	00000000 
0000010f l       .debug_str	00000000 
00000113 l       .debug_str	00000000 
00000152 l       .debug_str	00000000 
00000163 l       .debug_str	00000000 
000001a1 l       .debug_str	00000000 
000001b1 l       .debug_str	00000000 
000001b6 l       .debug_str	00000000 
000001ba l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
000001c7 l       .debug_str	00000000 
000001d0 l       .debug_str	00000000 
000001d8 l       .debug_str	00000000 
000001dc l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.0	0000000a .Lanon.0b256f51abc682f8d65b4afaed11e7f9.0
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.1	0000000d .Lanon.0b256f51abc682f8d65b4afaed11e7f9.1
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.10	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.10
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.12	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.12
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.13	00000016 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.13
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.14	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.14
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.15	00000001 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.15
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.16	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.16
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.17	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.17
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.18	00000019 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.18
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.19	00000002 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.19
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.4	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.4
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.6	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.6
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.7	00000018 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.7
00000000 l     O .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.8	00000011 .Lanon.0b256f51abc682f8d65b4afaed11e7f9.8
00000000 l     F .text._ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E	0000014c _ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E	00000120 _ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E
00000000 l    d  .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	00000000 .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E	00000000 .text._ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E
00000000 l    d  .text._ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E	00000000 .text._ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.2	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.2
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.3	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.3
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.5	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.5
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.9	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.9
00000000 l    d  .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.11	00000000 .rodata..Lanon.0b256f51abc682f8d65b4afaed11e7f9.11
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000 g     F .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE	000000ca .hidden _ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000         *UND*	00000000 .hidden _ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000         *UND*	00000000 .hidden _ZN5mylib6sensor17register_listener17h4d59b765a06cf618E
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
00000000         *UND*	00000000 sensor_set_poll_rate_ms



Disassembly of section .text._ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE:

00000000 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE>:
_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:38
///  Listener Function to send the sensor data to the Collector Node (if this is a Sensor Node)
///  or CoAP Server (is this is a Standalone Node).
///  For Collector Node: Start the Listeners for Remote Sensor 
///  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
///  Return 0 if successful.
pub fn start_sensor_listener() -> i32 {
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b093      	sub	sp, #76	; 0x4c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:39
    console_print(b"TMP poll \n");  //  SENSOR_DEVICE "\n";
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	210a      	movs	r1, #10
   e:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  12:	e7ff      	b.n	2 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:42

    //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
    let rc = unsafe { sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME) };
  14:	f240 0000 	movw	r0, #0
  18:	f2c0 0000 	movt	r0, #0
  1c:	f242 7110 	movw	r1, #10000	; 0x2710
  20:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
  24:	9002      	str	r0, [sp, #8]
  26:	e7ff      	b.n	28 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x28>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:43
    assert!(rc == 0);
  28:	9802      	ldr	r0, [sp, #8]
  2a:	2800      	cmp	r0, #0
  2c:	d007      	beq.n	3e <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x3e>
  2e:	e7ff      	b.n	30 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x30>
  30:	f240 0000 	movw	r0, #0
  34:	f2c0 0000 	movt	r0, #0
  38:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  3c:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:46

    //  Fetch the sensor by name, without locking the driver for exclusive access.
    let listen_sensor = unsafe { sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor()) };
  3e:	f7ff fffe 	bl	0 <null_sensor>
  42:	9001      	str	r0, [sp, #4]
  44:	e7ff      	b.n	46 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x46>
  46:	f240 0000 	movw	r0, #0
  4a:	f2c0 0000 	movt	r0, #0
  4e:	9901      	ldr	r1, [sp, #4]
  50:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  54:	9003      	str	r0, [sp, #12]
  56:	e7ff      	b.n	58 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x58>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:47
    assert!(!unsafe{ is_null_sensor(listen_sensor) });
  58:	9803      	ldr	r0, [sp, #12]
  5a:	f7ff fffe 	bl	0 <is_null_sensor>
  5e:	9000      	str	r0, [sp, #0]
  60:	e7ff      	b.n	62 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x62>
  62:	9800      	ldr	r0, [sp, #0]
  64:	07c1      	lsls	r1, r0, #31
  66:	2900      	cmp	r1, #0
  68:	d007      	beq.n	7a <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x7a>
  6a:	e7ff      	b.n	6c <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0x6c>
  6c:	f240 0000 	movw	r0, #0
  70:	f2c0 0000 	movt	r0, #0
  74:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  78:	defe      	udf	#254	; 0xfe
  7a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:52

    //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
    ////let rc = unsafe { sensor_register_listener(listen_sensor, &mut LISTENER) };
     
    let listener = SensorListener {
  7c:	9005      	str	r0, [sp, #20]
  7e:	f04f 6180 	mov.w	r1, #67108864	; 0x4000000
  82:	9104      	str	r1, [sp, #16]
  84:	f240 0100 	movw	r1, #0
  88:	f2c0 0100 	movt	r1, #0
  8c:	9106      	str	r1, [sp, #24]
  8e:	2101      	movs	r1, #1
  90:	9107      	str	r1, [sp, #28]
  92:	9008      	str	r0, [sp, #32]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:58
        sl_sensor_type: TEMP_SENSOR_TYPE,      //  Type of sensor: ambient temperature. Either computed (floating-point) or raw (integer)
        sl_func       : read_temperature,      //  Listener function to be called with the sensor data
        sl_arg        : LISTENER_CB,           //  Indicate to the listener function that this is a listener callback
        sl_next       : 0,                     //  Must be 0
    };
    let rc = register_listener(listen_sensor, listener);
  94:	9803      	ldr	r0, [sp, #12]
  96:	a904      	add	r1, sp, #16
  98:	aa0c      	add	r2, sp, #48	; 0x30
  9a:	4613      	mov	r3, r2
  9c:	e891 50f0 	ldmia.w	r1, {r4, r5, r6, r7, ip, lr}
  a0:	e883 50f0 	stmia.w	r3, {r4, r5, r6, r7, ip, lr}
  a4:	4611      	mov	r1, r2
  a6:	f7ff fffe 	bl	0 <_ZN5mylib6sensor17register_listener17h4d59b765a06cf618E>
  aa:	900b      	str	r0, [sp, #44]	; 0x2c
  ac:	e7ff      	b.n	ae <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:59
    assert!(rc == 0);
  ae:	980b      	ldr	r0, [sp, #44]	; 0x2c
  b0:	2800      	cmp	r0, #0
  b2:	d007      	beq.n	c4 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0xc4>
  b4:	e7ff      	b.n	b6 <_ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE+0xb6>
  b6:	f240 0000 	movw	r0, #0
  ba:	f2c0 0000 	movt	r0, #0
  be:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  c2:	defe      	udf	#254	; 0xfe
  c4:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:63

    //  Return 0 to indicate success.  This line should not end with a semicolon (;).
    0
}
  c6:	b013      	add	sp, #76	; 0x4c
  c8:	bdf0      	pop	{r4, r5, r6, r7, pc}

Disassembly of section .text._ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E:

00000000 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E>:
_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:78
///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
///  If this is a Sensor Node, we send the sensor data to the Collector Node.
///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
///  Return 0 if we have processed the sensor data successfully.
extern fn read_temperature(sensor: SensorPtr, _arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 {
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:80
    unsafe {
        console_print(b"read_temperature\n");
  1c:	f240 0000 	movw	r0, #0
  20:	f2c0 0000 	movt	r0, #0
  24:	2111      	movs	r1, #17
  26:	f8cd e018 	str.w	lr, [sp, #24]
  2a:	9405      	str	r4, [sp, #20]
  2c:	9504      	str	r5, [sp, #16]
  2e:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  32:	e7ff      	b.n	34 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x34>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:83
        //  Check that the temperature data is valid.
        //  TODO
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
  34:	9809      	ldr	r0, [sp, #36]	; 0x24
  36:	f7ff fffe 	bl	0 <is_null_sensor_data>
  3a:	9003      	str	r0, [sp, #12]
  3c:	e7ff      	b.n	3e <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x3e>
  3e:	9803      	ldr	r0, [sp, #12]
  40:	07c1      	lsls	r1, r0, #31
  42:	2900      	cmp	r1, #0
  44:	d007      	beq.n	56 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x56>
  46:	e7ff      	b.n	48 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x48>
  48:	f06f 0001 	mvn.w	r0, #1
  4c:	900c      	str	r0, [sp, #48]	; 0x30
  4e:	e7ff      	b.n	50 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x50>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:115
        }
        assert!(rc == 0);
        //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    0
}
  50:	980c      	ldr	r0, [sp, #48]	; 0x30
  52:	b016      	add	sp, #88	; 0x58
  54:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:84
        assert!(!is_null_sensor(sensor));
  56:	9807      	ldr	r0, [sp, #28]
  58:	f7ff fffe 	bl	0 <is_null_sensor>
  5c:	9002      	str	r0, [sp, #8]
  5e:	e7ff      	b.n	60 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x60>
  60:	9802      	ldr	r0, [sp, #8]
  62:	07c1      	lsls	r1, r0, #31
  64:	2900      	cmp	r1, #0
  66:	d007      	beq.n	78 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x78>
  68:	e7ff      	b.n	6a <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x6a>
  6a:	f240 0000 	movw	r0, #0
  6e:	f2c0 0000 	movt	r0, #0
  72:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  76:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:88
        let device = sensor_get_device(sensor);
  78:	9807      	ldr	r0, [sp, #28]
  7a:	f7ff fffe 	bl	0 <sensor_get_device>
  7e:	900d      	str	r0, [sp, #52]	; 0x34
  80:	e7ff      	b.n	82 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x82>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:89
        let c_buf: *const c_char = device_get_name(device);
  82:	980d      	ldr	r0, [sp, #52]	; 0x34
  84:	f7ff fffe 	bl	0 <device_get_name>
  88:	900e      	str	r0, [sp, #56]	; 0x38
  8a:	e7ff      	b.n	8c <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x8c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:90
        let device_name: &CStr = CStr::from_ptr(c_buf);
  8c:	980e      	ldr	r0, [sp, #56]	; 0x38
  8e:	f7ff fffe 	bl	0 <_ZN9cstr_core4CStr8from_ptr17ha5d4992c233d069bE>
  92:	9001      	str	r0, [sp, #4]
  94:	9100      	str	r1, [sp, #0]
  96:	e7ff      	b.n	98 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x98>
  98:	9801      	ldr	r0, [sp, #4]
  9a:	900f      	str	r0, [sp, #60]	; 0x3c
  9c:	9900      	ldr	r1, [sp, #0]
  9e:	9110      	str	r1, [sp, #64]	; 0x40
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:94
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
  a0:	9909      	ldr	r1, [sp, #36]	; 0x24
  a2:	9a0a      	ldr	r2, [sp, #40]	; 0x28
  a4:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
  a6:	a811      	add	r0, sp, #68	; 0x44
  a8:	f7ff fffe 	bl	0 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E>
  ac:	e7ff      	b.n	ae <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:95
        assert!(temp_sensor_value.val_type != 0);
  ae:	9812      	ldr	r0, [sp, #72]	; 0x48
  b0:	2800      	cmp	r0, #0
  b2:	d107      	bne.n	c4 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xc4>
  b4:	e7ff      	b.n	b6 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xb6>
  b6:	f240 0000 	movw	r0, #0
  ba:	f2c0 0000 	movt	r0, #0
  be:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  c2:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:96
        if temp_sensor_value.val_type == 0 { return -1; }  //  Invalid type.
  c4:	9812      	ldr	r0, [sp, #72]	; 0x48
  c6:	2800      	cmp	r0, #0
  c8:	d105      	bne.n	d6 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xd6>
  ca:	e7ff      	b.n	cc <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xcc>
  cc:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
  d0:	900c      	str	r0, [sp, #48]	; 0x30
  d2:	e7ff      	b.n	d4 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xd4>
  d4:	e7bc      	b.n	50 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x50>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:103
        let rc = send_sensor_data(&temp_sensor_value, device_name);
  d6:	990f      	ldr	r1, [sp, #60]	; 0x3c
  d8:	9a10      	ldr	r2, [sp, #64]	; 0x40
  da:	a811      	add	r0, sp, #68	; 0x44
  dc:	f7ff fffe 	bl	0 <_ZN5mylib9send_coap16send_sensor_data17h981b71f6817e0654E>
  e0:	9015      	str	r0, [sp, #84]	; 0x54
  e2:	e7ff      	b.n	e4 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xe4>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:107
        if rc == SYS_EAGAIN {
  e4:	9815      	ldr	r0, [sp, #84]	; 0x54
  e6:	3006      	adds	r0, #6
  e8:	2800      	cmp	r0, #0
  ea:	d10b      	bne.n	104 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x104>
  ec:	e7ff      	b.n	ee <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xee>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:108
            console_print(b"TMP network not ready\n");
  ee:	f240 0000 	movw	r0, #0
  f2:	f2c0 0000 	movt	r0, #0
  f6:	2116      	movs	r1, #22
  f8:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  fc:	e7ff      	b.n	fe <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xfe>
  fe:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:109
            return 0; 
 100:	900c      	str	r0, [sp, #48]	; 0x30
 102:	e7e7      	b.n	d4 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0xd4>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:111
        assert!(rc == 0);
 104:	9815      	ldr	r0, [sp, #84]	; 0x54
 106:	2800      	cmp	r0, #0
 108:	d007      	beq.n	11a <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x11a>
 10a:	e7ff      	b.n	10c <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x10c>
 10c:	f240 0000 	movw	r0, #0
 110:	f2c0 0000 	movt	r0, #0
 114:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 118:	defe      	udf	#254	; 0xfe
 11a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
    0
 11c:	900c      	str	r0, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:115
}
 11e:	e797      	b.n	50 <_ZN5mylib13listen_sensor16read_temperature17h53480a57fcc5ca50E+0x50>

Disassembly of section .text._ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E:

00000000 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E>:
_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:120

///  Get the temperature value, raw or computed.  `sensor_data` contains the raw or computed temperature. 
///  `sensor_type` indicates whether `sensor_data` contains raw or computed temperature.  We return 
///  the raw or computed temperature, as well as the key and value type.
fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
   0:	b510      	push	{r4, lr}
   2:	b096      	sub	sp, #88	; 0x58
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	9105      	str	r1, [sp, #20]
   c:	9307      	str	r3, [sp, #28]
   e:	9206      	str	r2, [sp, #24]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:122
    let mut return_value = SensorValue {
        key: b"\0".as_ptr(),
  10:	f240 0100 	movw	r1, #0
  14:	f2c0 0100 	movt	r1, #0
  18:	2201      	movs	r2, #1
  1a:	9004      	str	r0, [sp, #16]
  1c:	4608      	mov	r0, r1
  1e:	4611      	mov	r1, r2
  20:	f8cd c00c 	str.w	ip, [sp, #12]
  24:	f8cd e008 	str.w	lr, [sp, #8]
  28:	9401      	str	r4, [sp, #4]
  2a:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17hd0263209417be61aE>
  2e:	9000      	str	r0, [sp, #0]
  30:	e7ff      	b.n	32 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x32>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
    let mut return_value = SensorValue {
  32:	9800      	ldr	r0, [sp, #0]
  34:	9009      	str	r0, [sp, #36]	; 0x24
  36:	2100      	movs	r1, #0
  38:	910a      	str	r1, [sp, #40]	; 0x28
  3a:	f8ad 102c 	strh.w	r1, [sp, #44]	; 0x2c
  3e:	910c      	str	r1, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:130
        float_val: 0.0,
    };
    unsafe {
        //assert!(sensor_data);
        match sensor_type {                                //  Is this raw or computed temperature?
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  40:	9906      	ldr	r1, [sp, #24]
  42:	9a07      	ldr	r2, [sp, #28]
  44:	f081 6180 	eor.w	r1, r1, #67108864	; 0x4000000
  48:	4311      	orrs	r1, r2
  4a:	2900      	cmp	r1, #0
  4c:	d138      	bne.n	c0 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xc0>
  4e:	e7ff      	b.n	50 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x50>
  50:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:132
                //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
                let mut rawtempdata = SensorTempRawData {
  52:	900d      	str	r0, [sp, #52]	; 0x34
  54:	f88d 0038 	strb.w	r0, [sp, #56]	; 0x38
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:136
                    strd_temp_raw: 0,
                    strd_temp_raw_is_valid: 0,
                };
                let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
  58:	9805      	ldr	r0, [sp, #20]
  5a:	a90d      	add	r1, sp, #52	; 0x34
  5c:	f7ff fffe 	bl	0 <get_temp_raw_data>
  60:	900f      	str	r0, [sp, #60]	; 0x3c
  62:	e7ff      	b.n	64 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x64>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:137
                assert!(rc == 0);
  64:	980f      	ldr	r0, [sp, #60]	; 0x3c
  66:	2800      	cmp	r0, #0
  68:	d007      	beq.n	7a <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x7a>
  6a:	e7ff      	b.n	6c <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x6c>
  6c:	f240 0000 	movw	r0, #0
  70:	f2c0 0000 	movt	r0, #0
  74:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  78:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:140

                //  Check that the raw temperature data is valid.
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  7a:	f89d 0038 	ldrb.w	r0, [sp, #56]	; 0x38
  7e:	2800      	cmp	r0, #0
  80:	d112      	bne.n	a8 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xa8>
  82:	e7ff      	b.n	84 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x84>
  84:	9809      	ldr	r0, [sp, #36]	; 0x24
  86:	990a      	ldr	r1, [sp, #40]	; 0x28
  88:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
  8a:	9b0c      	ldr	r3, [sp, #48]	; 0x30
  8c:	f8dd c010 	ldr.w	ip, [sp, #16]
  90:	f8cc 300c 	str.w	r3, [ip, #12]
  94:	f8cc 2008 	str.w	r2, [ip, #8]
  98:	f8cc 1004 	str.w	r1, [ip, #4]
  9c:	f8cc 0000 	str.w	r0, [ip]
  a0:	e001      	b.n	a6 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xa6>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:176
        //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
        return_value.key = TEMP_SENSOR_KEY;
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
    };
    return_value
}
  a2:	b016      	add	sp, #88	; 0x58
  a4:	bd10      	pop	{r4, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:140
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  a6:	e7fc      	b.n	a2 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xa2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:143
                return_value.int_val = rawtempdata.strd_temp_raw as u16;  //  Raw Temperature in integer (0 to 4095)
  a8:	980d      	ldr	r0, [sp, #52]	; 0x34
  aa:	f8ad 002c 	strh.w	r0, [sp, #44]	; 0x2c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:144
                console_print(b"TMP listener got rawtmp \n");  // return_value->int_val);
  ae:	f240 0000 	movw	r0, #0
  b2:	f2c0 0000 	movt	r0, #0
  b6:	2119      	movs	r1, #25
  b8:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  bc:	e7ff      	b.n	be <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xbe>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
        match sensor_type {                                //  Is this raw or computed temperature?
  be:	e02f      	b.n	120 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x120>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:146
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
  c0:	9806      	ldr	r0, [sp, #24]
  c2:	9907      	ldr	r1, [sp, #28]
  c4:	9111      	str	r1, [sp, #68]	; 0x44
  c6:	9010      	str	r0, [sp, #64]	; 0x40
  c8:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:148
                let mut tempdata = SensorTempData {
  ca:	9013      	str	r0, [sp, #76]	; 0x4c
  cc:	f88d 0050 	strb.w	r0, [sp, #80]	; 0x50
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:152
                let rc = get_temp_data(sensor_data, &mut tempdata);
  d0:	9805      	ldr	r0, [sp, #20]
  d2:	a913      	add	r1, sp, #76	; 0x4c
  d4:	f7ff fffe 	bl	0 <get_temp_data>
  d8:	9015      	str	r0, [sp, #84]	; 0x54
  da:	e7ff      	b.n	dc <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xdc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:153
                assert!(rc == 0);
  dc:	9815      	ldr	r0, [sp, #84]	; 0x54
  de:	2800      	cmp	r0, #0
  e0:	d007      	beq.n	f2 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xf2>
  e2:	e7ff      	b.n	e4 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xe4>
  e4:	f240 0000 	movw	r0, #0
  e8:	f2c0 0000 	movt	r0, #0
  ec:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  f0:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:156
                if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  f2:	f89d 0050 	ldrb.w	r0, [sp, #80]	; 0x50
  f6:	2800      	cmp	r0, #0
  f8:	d10f      	bne.n	11a <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x11a>
  fa:	e7ff      	b.n	fc <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xfc>
  fc:	9809      	ldr	r0, [sp, #36]	; 0x24
  fe:	990a      	ldr	r1, [sp, #40]	; 0x28
 100:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 102:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 104:	f8dd c010 	ldr.w	ip, [sp, #16]
 108:	f8cc 300c 	str.w	r3, [ip, #12]
 10c:	f8cc 2008 	str.w	r2, [ip, #8]
 110:	f8cc 1004 	str.w	r1, [ip, #4]
 114:	f8cc 0000 	str.w	r0, [ip]
 118:	e7c5      	b.n	a6 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xa6>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:159
                return_value.float_val = tempdata.std_temp;  //  Temperature in floating point.
 11a:	9813      	ldr	r0, [sp, #76]	; 0x4c
 11c:	900c      	str	r0, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
        match sensor_type {                                //  Is this raw or computed temperature?
 11e:	e7ff      	b.n	120 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0x120>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:172
        return_value.key = TEMP_SENSOR_KEY;
 120:	f240 0000 	movw	r0, #0
 124:	f2c0 0000 	movt	r0, #0
 128:	9009      	str	r0, [sp, #36]	; 0x24
 12a:	2001      	movs	r0, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:173
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
 12c:	900a      	str	r0, [sp, #40]	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:175
    return_value
 12e:	9809      	ldr	r0, [sp, #36]	; 0x24
 130:	990a      	ldr	r1, [sp, #40]	; 0x28
 132:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 134:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 136:	f8dd c010 	ldr.w	ip, [sp, #16]
 13a:	f8cc 300c 	str.w	r3, [ip, #12]
 13e:	f8cc 2008 	str.w	r2, [ip, #8]
 142:	f8cc 1004 	str.w	r1, [ip, #4]
 146:	f8cc 0000 	str.w	r0, [ip]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:176
}
 14a:	e7aa      	b.n	a2 <_ZN5mylib13listen_sensor15get_temperature17h42fabeac78d97520E+0xa2>

mylib-50794855a3f9698d.509tcgk6983yrx6c.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 509tcgk6983yrx6c
00000309 l       .debug_str	00000000 
0000037e l       .debug_str	00000000 
0000039a l       .debug_str	00000000 
000003a4 l       .debug_str	00000000 
000003be l       .debug_str	00000000 
0000041c l       .debug_str	00000000 
00000427 l       .debug_str	00000000 
00000444 l       .debug_str	00000000 
0000045d l       .debug_str	00000000 
00000467 l       .debug_str	00000000 
0000047d l       .debug_str	00000000 
0000049b l       .debug_str	00000000 
000004a4 l       .debug_str	00000000 
000004a9 l       .debug_str	00000000 
000004ae l       .debug_str	00000000 
000004b2 l       .debug_str	00000000 
000004bb l       .debug_str	00000000 
000004c5 l       .debug_str	00000000 
000004dd l       .debug_str	00000000 
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
000000fd l       .debug_str	00000000 
00000105 l       .debug_str	00000000 
00000109 l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
00000119 l       .debug_str	00000000 
00000120 l       .debug_str	00000000 
00000126 l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
00000146 l       .debug_str	00000000 
0000014b l       .debug_str	00000000 
00000153 l       .debug_str	00000000 
0000015a l       .debug_str	00000000 
0000015e l       .debug_str	00000000 
00000163 l       .debug_str	00000000 
0000016a l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
0000017d l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
0000019d l       .debug_str	00000000 
000001a6 l       .debug_str	00000000 
000001ab l       .debug_str	00000000 
000001ae l       .debug_str	00000000 
000001b2 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001c7 l       .debug_str	00000000 
000001cc l       .debug_str	00000000 
000001d2 l       .debug_str	00000000 
000001d8 l       .debug_str	00000000 
000001e2 l       .debug_str	00000000 
000001e5 l       .debug_str	00000000 
000001eb l       .debug_str	00000000 
000001f5 l       .debug_str	00000000 
000001fd l       .debug_str	00000000 
00000203 l       .debug_str	00000000 
00000209 l       .debug_str	00000000 
00000214 l       .debug_str	00000000 
0000021d l       .debug_str	00000000 
00000240 l       .debug_str	00000000 
0000025f l       .debug_str	00000000 
00000261 l       .debug_str	00000000 
00000266 l       .debug_str	00000000 
0000028d l       .debug_str	00000000 
00000292 l       .debug_str	00000000 
00000298 l       .debug_str	00000000 
0000029e l       .debug_str	00000000 
000002a1 l       .debug_str	00000000 
000002b0 l       .debug_str	00000000 
000002b7 l       .debug_str	00000000 
000002bb l       .debug_str	00000000 
000002c4 l       .debug_str	00000000 
000002d0 l       .debug_str	00000000 
000002e9 l       .debug_str	00000000 
000002ee l       .debug_str	00000000 
000002ff l       .debug_str	00000000 
00000317 l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
00000326 l       .debug_str	00000000 
0000032d l       .debug_str	00000000 
00000333 l       .debug_str	00000000 
00000337 l       .debug_str	00000000 
0000033b l       .debug_str	00000000 
00000343 l       .debug_str	00000000 
0000035a l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.2	00000018 .Lanon.3ed011473997af99b525cde47c9eaaac.2
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.4	00000018 .Lanon.3ed011473997af99b525cde47c9eaaac.4
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.5	00000012 .Lanon.3ed011473997af99b525cde47c9eaaac.5
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.6	00000009 .Lanon.3ed011473997af99b525cde47c9eaaac.6
00000000 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.7
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.8	00000001 .Lanon.3ed011473997af99b525cde47c9eaaac.8
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
00000000         *UND*	00000000 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E
00000000         *UND*	00000000 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E
00000000         *UND*	00000000 _ZN4core5panic8Location4file17h94cc6af18de736c4E
00000000         *UND*	00000000 _ZN4core5panic8Location4line17h3ffc63f14d0a6636E
00000000         *UND*	00000000 _ZN4core5panic9PanicInfo8location17h5226165d8771f8a2E
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 .hidden _ZN5mylib13listen_sensor21start_sensor_listener17h2b855ed9b04189dfE
00000000         *UND*	00000000 .hidden _ZN5mylib4base13console_print17h7239bde54deb9f31E
00000000         *UND*	00000000 .hidden _ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush
00000000         *UND*	00000000 console_printhex
00000000 g     F .text.main	0000005e main
00000000         *UND*	00000000 os_eventq_dflt_get
00000000         *UND*	00000000 os_eventq_run
00000000 g     F .text.rust_begin_unwind	000000b2 rust_begin_unwind
00000000         *UND*	00000000 rust_sysinit



Disassembly of section .text.main:

00000000 <main>:
main():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:20
use crate::listen_sensor::*;    //  Import listen_sensor.rs for polling the temperature sensor
use crate::send_coap::*;        //  Import send_coap.rs for sending sensor data

///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                     //  Don't mangle the name "main"
pub extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
   0:	b084      	sub	sp, #16
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:23
    unsafe {
        //  Init Mynewt system.
        rust_sysinit();
   2:	f7ff fffe 	bl	0 <rust_sysinit>
   6:	e7ff      	b.n	2 <console_flush+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:24
        console_flush();
   8:	f7ff fffe 	bl	0 <console_flush>
   c:	e7ff      	b.n	2 <_ZN5mylib9send_coap18start_network_task17ha418a4938a3513c8E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:29

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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:34

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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:37

        //  Main event loop
        loop {                        //  Loop forever...
  4a:	e7ff      	b.n	4c <main+0x4c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:39
            os_eventq_run(            //  Process events...
                os_eventq_dflt_get()  //  From default event queue.
  4c:	f7ff fffe 	bl	0 <os_eventq_dflt_get>
  50:	9001      	str	r0, [sp, #4]
  52:	e7ff      	b.n	54 <main+0x54>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:38
            os_eventq_run(            //  Process events...
  54:	9801      	ldr	r0, [sp, #4]
  56:	f7ff fffe 	bl	0 <os_eventq_run>
  5a:	e7ff      	b.n	5c <main+0x5c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:37
        loop {                        //  Loop forever...
  5c:	e7f6      	b.n	4c <main+0x4c>

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:48
    //  Never comes here.
}

///  This function is called on panic, like an assertion failure. Set a breakpoint here to see the panic details. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
   0:	b08a      	sub	sp, #40	; 0x28
   2:	4601      	mov	r1, r0
   4:	9003      	str	r0, [sp, #12]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:50
    //  Display the filename and line number to the Semihosting Console.
    if let Some(location) = info.location() {
   6:	9803      	ldr	r0, [sp, #12]
   8:	9102      	str	r1, [sp, #8]
   a:	f7ff fffe 	bl	0 <_ZN4core5panic9PanicInfo8location17h5226165d8771f8a2E>
   e:	9005      	str	r0, [sp, #20]
  10:	e7ff      	b.n	12 <rust_begin_unwind+0x12>
  12:	9805      	ldr	r0, [sp, #20]
  14:	2800      	cmp	r0, #0
  16:	d03f      	beq.n	98 <rust_begin_unwind+0x98>
  18:	e7ff      	b.n	1a <rust_begin_unwind+0x1a>
  1a:	9805      	ldr	r0, [sp, #20]
  1c:	9006      	str	r0, [sp, #24]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:51
        let file = location.file();
  1e:	9806      	ldr	r0, [sp, #24]
  20:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4file17h94cc6af18de736c4E>
  24:	9108      	str	r1, [sp, #32]
  26:	9007      	str	r0, [sp, #28]
  28:	e7ff      	b.n	2a <rust_begin_unwind+0x2a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:52
        let line = location.line();
  2a:	9806      	ldr	r0, [sp, #24]
  2c:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4line17h3ffc63f14d0a6636E>
  30:	9009      	str	r0, [sp, #36]	; 0x24
  32:	e7ff      	b.n	34 <rust_begin_unwind+0x34>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:53
        console_print(b"panic at ");
  34:	f240 0000 	movw	r0, #0
  38:	f2c0 0000 	movt	r0, #0
  3c:	2109      	movs	r1, #9
  3e:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  42:	e7ff      	b.n	44 <rust_begin_unwind+0x44>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:54
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
  44:	9807      	ldr	r0, [sp, #28]
  46:	9908      	ldr	r1, [sp, #32]
  48:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17habe097c6f7775d95E>
  4c:	9001      	str	r0, [sp, #4]
  4e:	e7ff      	b.n	50 <rust_begin_unwind+0x50>
  50:	9807      	ldr	r0, [sp, #28]
  52:	9908      	ldr	r1, [sp, #32]
  54:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17h479876f0ed8d2071E>
  58:	9000      	str	r0, [sp, #0]
  5a:	e7ff      	b.n	5c <rust_begin_unwind+0x5c>
  5c:	9801      	ldr	r0, [sp, #4]
  5e:	9900      	ldr	r1, [sp, #0]
  60:	f7ff fffe 	bl	0 <console_buffer>
  64:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:55
        console_print(b" line 0x");
  66:	f240 0000 	movw	r0, #0
  6a:	f2c0 0000 	movt	r0, #0
  6e:	2108      	movs	r1, #8
  70:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  74:	e7ff      	b.n	76 <rust_begin_unwind+0x76>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:56
        unsafe { console_printhex(line as u8) }  //  TODO: Print in decimal not hex. Allow more than 255 lines.
  76:	f89d 0024 	ldrb.w	r0, [sp, #36]	; 0x24
  7a:	f7ff fffe 	bl	0 <console_printhex>
  7e:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:57
        console_print(b"\n");
  80:	f240 0000 	movw	r0, #0
  84:	f2c0 0000 	movt	r0, #0
  88:	2101      	movs	r1, #1
  8a:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  8e:	e7ff      	b.n	2 <console_flush+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:58
        unsafe { console_flush() }
  90:	f7ff fffe 	bl	0 <console_flush>
  94:	e7ff      	b.n	96 <rust_begin_unwind+0x96>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:50
    if let Some(location) = info.location() {
  96:	e00a      	b.n	ae <rust_begin_unwind+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:60
    } else {
        console_print(b"panic unknown loc\n");
  98:	f240 0000 	movw	r0, #0
  9c:	f2c0 0000 	movt	r0, #0
  a0:	2112      	movs	r1, #18
  a2:	f7ff fffe 	bl	0 <_ZN5mylib4base13console_print17h7239bde54deb9f31E>
  a6:	e7ff      	b.n	2 <console_flush+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:61
        unsafe { console_flush() }
  a8:	f7ff fffe 	bl	0 <console_flush>
  ac:	e7ff      	b.n	ae <rust_begin_unwind+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:63
    }
    loop {}
  ae:	e7ff      	b.n	b0 <rust_begin_unwind+0xb0>
  b0:	e7fe      	b.n	b0 <rust_begin_unwind+0xb0>

mylib-50794855a3f9698d.5a1h7zdwutkmx5k9.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 5a1h7zdwutkmx5k9
000001a3 l       .debug_str	00000000 
0000025c l       .debug_str	00000000 
0000015c l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
000001df l       .debug_str	00000000 
00000250 l       .debug_str	00000000 
00000244 l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
0000022d l       .debug_str	00000000 
000001f5 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
0000009b l       .debug_str	00000000 
000000aa l       .debug_str	00000000 
000000ae l       .debug_str	00000000 
000000b6 l       .debug_str	00000000 
000000ba l       .debug_str	00000000 
000000be l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000d2 l       .debug_str	00000000 
000000d8 l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000154 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.263f19d5ea96f7cf1b022ce280a83ceb.2	00000018 .Lanon.263f19d5ea96f7cf1b022ce280a83ceb.2
00000000 l     O .data._ZN5mylib6sensor17LISTENER_INTERNAL17h134e9abd08047957E	00000018 _ZN5mylib6sensor17LISTENER_INTERNAL17h134e9abd08047957E
00000000 l     F .text._ZN5mylib6sensor21null_sensor_data_func17h8e594dd52cb73506E	0000002a _ZN5mylib6sensor21null_sensor_data_func17h8e594dd52cb73506E
00000000 l    d  .text._ZN5mylib6sensor21null_sensor_data_func17h8e594dd52cb73506E	00000000 .text._ZN5mylib6sensor21null_sensor_data_func17h8e594dd52cb73506E
00000000 l    d  .text._ZN5mylib6sensor17register_listener17h4d59b765a06cf618E	00000000 .text._ZN5mylib6sensor17register_listener17h4d59b765a06cf618E
00000000 l    d  .data._ZN5mylib6sensor17LISTENER_INTERNAL17h134e9abd08047957E	00000000 .data._ZN5mylib6sensor17LISTENER_INTERNAL17h134e9abd08047957E
00000000 l    d  .rodata..Lanon.263f19d5ea96f7cf1b022ce280a83ceb.0	00000000 .rodata..Lanon.263f19d5ea96f7cf1b022ce280a83ceb.0
00000000 l    d  .rodata..Lanon.263f19d5ea96f7cf1b022ce280a83ceb.1	00000000 .rodata..Lanon.263f19d5ea96f7cf1b022ce280a83ceb.1
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000 g     F .text._ZN5mylib6sensor17register_listener17h4d59b765a06cf618E	0000005e .hidden _ZN5mylib6sensor17register_listener17h4d59b765a06cf618E
00000000         *UND*	00000000 sensor_register_listener



Disassembly of section .text._ZN5mylib6sensor21null_sensor_data_func17h8e594dd52cb73506E:

00000000 <_ZN5mylib6sensor21null_sensor_data_func17h8e594dd52cb73506E>:
_ZN5mylib6sensor21null_sensor_data_func17h8e594dd52cb73506E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/sensor.rs:12
    sl_func       : null_sensor_data_func,      //  Listener function to be called with the sensor data
    sl_arg        : 0,           //  Indicate to the listener function that this is a listener callback
    sl_next       : 0,                     //  Must be 0
};

extern fn null_sensor_data_func(sensor: SensorPtr, _arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 { 0 }
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b088      	sub	sp, #32
   4:	9b0d      	ldr	r3, [sp, #52]	; 0x34
   6:	f8dd c030 	ldr.w	ip, [sp, #48]	; 0x30
   a:	4696      	mov	lr, r2
   c:	460c      	mov	r4, r1
   e:	4605      	mov	r5, r0
  10:	9003      	str	r0, [sp, #12]
  12:	9104      	str	r1, [sp, #16]
  14:	9205      	str	r2, [sp, #20]
  16:	9307      	str	r3, [sp, #28]
  18:	f8cd c018 	str.w	ip, [sp, #24]
  1c:	2000      	movs	r0, #0
  1e:	f8cd e008 	str.w	lr, [sp, #8]
  22:	9401      	str	r4, [sp, #4]
  24:	9500      	str	r5, [sp, #0]
  26:	b008      	add	sp, #32
  28:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN5mylib6sensor17register_listener17h4d59b765a06cf618E:

00000000 <_ZN5mylib6sensor17register_listener17h4d59b765a06cf618E>:
_ZN5mylib6sensor17register_listener17h4d59b765a06cf618E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/sensor.rs:23
///  for the sensor listener structure.
///
///  `sensor`: The sensor to register a listener on.
///  `listener`: The listener to register onto the sensor.
///  Return 0 on success, non-zero error code on failure.
pub fn register_listener(sensor: SensorPtr, listener: SensorListener) -> i32 {    
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4602      	mov	r2, r0
   6:	9003      	str	r0, [sp, #12]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/sensor.rs:24
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
   8:	f240 0000 	movw	r0, #0
   c:	f2c0 0000 	movt	r0, #0
  10:	6803      	ldr	r3, [r0, #0]
  12:	6840      	ldr	r0, [r0, #4]
  14:	4318      	orrs	r0, r3
  16:	2800      	cmp	r0, #0
  18:	9102      	str	r1, [sp, #8]
  1a:	9201      	str	r2, [sp, #4]
  1c:	d007      	beq.n	2e <_ZN5mylib6sensor17register_listener17h4d59b765a06cf618E+0x2e>
  1e:	e7ff      	b.n	20 <_ZN5mylib6sensor17register_listener17h4d59b765a06cf618E+0x20>
  20:	f240 0000 	movw	r0, #0
  24:	f2c0 0000 	movt	r0, #0
  28:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  2c:	defe      	udf	#254	; 0xfe
  2e:	a804      	add	r0, sp, #16
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/sensor.rs:27
    //  Copy the caller's listener to the internal listener.
    //  LISTENER_INTERNAL = SensorListener { .. listener };
    unsafe { LISTENER_INTERNAL = listener };
  30:	9902      	ldr	r1, [sp, #8]
  32:	4602      	mov	r2, r0
  34:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
  38:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
  3c:	f240 0100 	movw	r1, #0
  40:	f2c0 0100 	movt	r1, #0
  44:	460a      	mov	r2, r1
  46:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
  4a:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/sensor.rs:29
    //  Pass the internal listener to the unsafe Mynewt API.
    unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) }
  4e:	9803      	ldr	r0, [sp, #12]
  50:	f7ff fffe 	bl	0 <sensor_register_listener>
  54:	9000      	str	r0, [sp, #0]
  56:	e7ff      	b.n	58 <_ZN5mylib6sensor17register_listener17h4d59b765a06cf618E+0x58>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/sensor.rs:30
}
  58:	9800      	ldr	r0, [sp, #0]
  5a:	b00a      	add	sp, #40	; 0x28
  5c:	bd70      	pop	{r4, r5, r6, pc}
arm-none-eabi-objdump: rust.metadata.bin: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.19vpnfslw8lxmhl.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.2bwhitp1kuocnn5l.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.2ui9vppr5zt78ili.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.3k67uemb1cshb4cs.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.509tcgk6983yrx6c.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: mylib-50794855a3f9698d.5a1h7zdwutkmx5k9.rcgu.bc.z: File format not recognized
