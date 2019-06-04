In archive target/thumbv7m-none-eabi/debug/libmylib.rlib:

mylib-851790737b91ae76.1mdjv158ao7aurpq.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1mdjv158ao7aurpq
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
00000000 l    d  .text._ZN9cstr_core4CStr6as_ptr17h57729d854a451051E	00000000 .text._ZN9cstr_core4CStr6as_ptr17h57729d854a451051E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::slice::<impl [T]>::as_ptr
00000000 g     F .text._ZN9cstr_core4CStr6as_ptr17h57729d854a451051E	00000022 .hidden cstr_core::CStr::as_ptr



Disassembly of section .text._ZN9cstr_core4CStr6as_ptr17h57729d854a451051E:

00000000 <cstr_core::CStr::as_ptr>:
_ZN9cstr_core4CStr6as_ptr17h57729d854a451051E():
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

mylib-851790737b91ae76.1vinbabmq2vmyijr.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1vinbabmq2vmyijr
000000d4 l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
0000011c l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.7c128ee3be99b7a4bb4aebd01fb6b42c.0	0000000d .Lanon.7c128ee3be99b7a4bb4aebd01fb6b42c.0
00000000 l     O .rodata..Lanon.7c128ee3be99b7a4bb4aebd01fb6b42c.1	00000002 .Lanon.7c128ee3be99b7a4bb4aebd01fb6b42c.1
00000000 l     F .text._ZN5mylib4base17TEMP_STM32_DEVICE17heb5c39e563dbb9fdE	00000034 mylib::base::TEMP_STM32_DEVICE
00000000 l    d  .text._ZN5mylib4base13SENSOR_DEVICE17h0eddbe2fc4a5cb71E	00000000 .text._ZN5mylib4base13SENSOR_DEVICE17h0eddbe2fc4a5cb71E
00000000 l    d  .text._ZN5mylib4base17TEMP_STM32_DEVICE17heb5c39e563dbb9fdE	00000000 .text._ZN5mylib4base17TEMP_STM32_DEVICE17heb5c39e563dbb9fdE
00000000 l    d  .text._ZN5mylib4base15TEMP_SENSOR_KEY17hf47a73e91d2b7171E	00000000 .text._ZN5mylib4base15TEMP_SENSOR_KEY17hf47a73e91d2b7171E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::result::Result<T,E>::unwrap
00000000 g     F .text._ZN5mylib4base13SENSOR_DEVICE17h0eddbe2fc4a5cb71E	00000012 .hidden mylib::base::SENSOR_DEVICE
00000000 g     F .text._ZN5mylib4base15TEMP_SENSOR_KEY17hf47a73e91d2b7171E	00000034 .hidden mylib::base::TEMP_SENSOR_KEY
00000000         *UND*	00000000 cstr_core::CStr::from_bytes_with_nul
00000000         *UND*	00000000 .hidden cstr_core::CStr::as_ptr



Disassembly of section .text._ZN5mylib4base13SENSOR_DEVICE17h0eddbe2fc4a5cb71E:

00000000 <mylib::base::SENSOR_DEVICE>:
_ZN5mylib4base13SENSOR_DEVICE17h0eddbe2fc4a5cb71E():
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

Disassembly of section .text._ZN5mylib4base17TEMP_STM32_DEVICE17heb5c39e563dbb9fdE:

00000000 <mylib::base::TEMP_STM32_DEVICE>:
_ZN5mylib4base17TEMP_STM32_DEVICE17heb5c39e563dbb9fdE():
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

Disassembly of section .text._ZN5mylib4base15TEMP_SENSOR_KEY17hf47a73e91d2b7171E:

00000000 <mylib::base::TEMP_SENSOR_KEY>:
_ZN5mylib4base15TEMP_SENSOR_KEY17hf47a73e91d2b7171E():
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

mylib-851790737b91ae76.2bwse6y4f1zvewmt.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2bwse6y4f1zvewmt
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
00000000 l    d  .text._ZN4core3fmt9Arguments6new_v117haefd1aed7974f769E	00000000 .text._ZN4core3fmt9Arguments6new_v117haefd1aed7974f769E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3fmt9Arguments6new_v117haefd1aed7974f769E	0000004c .hidden core::fmt::Arguments::new_v1



Disassembly of section .text._ZN4core3fmt9Arguments6new_v117haefd1aed7974f769E:

00000000 <core::fmt::Arguments::new_v1>:
_ZN4core3fmt9Arguments6new_v117haefd1aed7974f769E():
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

mylib-851790737b91ae76.2kebu91x0cobfy3k.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2kebu91x0cobfy3k
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
00000000 l    d  .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17he2b2deb5c41638d1E	00000000 .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17he2b2deb5c41638d1E
00000000 l    d  .text._ZN4core3fmt10ArgumentV13new17h2501b2d08979649eE	00000000 .text._ZN4core3fmt10ArgumentV13new17h2501b2d08979649eE
00000000 l    d  .text._ZN4core3fmt10ArgumentV13new17haa7472a7c596aa7cE	00000000 .text._ZN4core3fmt10ArgumentV13new17haa7472a7c596aa7cE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 <str as core::fmt::Display>::fmt
00000000 g     F .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17he2b2deb5c41638d1E	00000034 <&T as core::fmt::Display>::fmt
00000000 g     F .text._ZN4core3fmt10ArgumentV13new17h2501b2d08979649eE	00000032 core::fmt::ArgumentV1::new
00000000 g     F .text._ZN4core3fmt10ArgumentV13new17haa7472a7c596aa7cE	00000032 core::fmt::ArgumentV1::new



Disassembly of section .text._ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17he2b2deb5c41638d1E:

00000000 <<&T as core::fmt::Display>::fmt>:
_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17he2b2deb5c41638d1E():
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

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h2501b2d08979649eE:

00000000 <core::fmt::ArgumentV1::new>:
_ZN4core3fmt10ArgumentV13new17h2501b2d08979649eE():
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

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17haa7472a7c596aa7cE:

00000000 <core::fmt::ArgumentV1::new>:
_ZN4core3fmt10ArgumentV13new17haa7472a7c596aa7cE():
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

mylib-851790737b91ae76.38218p6a7av8uoke.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 38218p6a7av8uoke
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
00000000 l    d  .text._ZN5mylib9send_coap18start_network_task17h00d36fbfb7dda38aE	00000000 .text._ZN5mylib9send_coap18start_network_task17h00d36fbfb7dda38aE
00000000 l    d  .text._ZN5mylib9send_coap16send_sensor_data17hc710d7130fed751fE	00000000 .text._ZN5mylib9send_coap16send_sensor_data17hc710d7130fed751fE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN5mylib9send_coap16send_sensor_data17hc710d7130fed751fE	00000020 .hidden mylib::send_coap::send_sensor_data
00000000 g     F .text._ZN5mylib9send_coap18start_network_task17h00d36fbfb7dda38aE	00000004 .hidden mylib::send_coap::start_network_task



Disassembly of section .text._ZN5mylib9send_coap18start_network_task17h00d36fbfb7dda38aE:

00000000 <mylib::send_coap::start_network_task>:
_ZN5mylib9send_coap18start_network_task17h00d36fbfb7dda38aE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:4
use crate::base::*;
use cstr_core::CStr;

pub fn start_network_task() -> i32 {
   0:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:6
    0
}
   2:	4770      	bx	lr

Disassembly of section .text._ZN5mylib9send_coap16send_sensor_data17hc710d7130fed751fE:

00000000 <mylib::send_coap::send_sensor_data>:
_ZN5mylib9send_coap16send_sensor_data17hc710d7130fed751fE():
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

mylib-851790737b91ae76.3hsprfwev1cr3o46.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3hsprfwev1cr3o46
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

mylib-851790737b91ae76.4gnqdit2wf9emfxe.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4gnqdit2wf9emfxe
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
00000000 l     O .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.2	00000010 .Lanon.56b7ac1e51c26ba217438c42fb09abad.2
00000000 l     O .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.4	00000010 .Lanon.56b7ac1e51c26ba217438c42fb09abad.4
00000000 l     O .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.5	0000002b .Lanon.56b7ac1e51c26ba217438c42fb09abad.5
00000000 l    d  .text._ZN4core6result13unwrap_failed17h57c19d4b48648647E	00000000 .text._ZN4core6result13unwrap_failed17h57c19d4b48648647E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hb0ec9a31d65a67d0E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hb0ec9a31d65a67d0E
00000000 l    d  .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.0	00000000 .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.0
00000000 l    d  .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.1	00000000 .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.1
00000000 l    d  .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.3	00000000 .rodata..Lanon.56b7ac1e51c26ba217438c42fb09abad.3
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
00000000 g     F .text._ZN4core6result13unwrap_failed17h57c19d4b48648647E	00000094 core::result::unwrap_failed
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hb0ec9a31d65a67d0E	0000005e core::result::Result<T,E>::unwrap
00000000         *UND*	00000000 core::panicking::panic_fmt
00000000         *UND*	00000000 <cstr_core::FromBytesWithNulError as core::fmt::Debug>::fmt



Disassembly of section .text._ZN4core6result13unwrap_failed17h57c19d4b48648647E:

00000000 <core::result::unwrap_failed>:
_ZN4core6result13unwrap_failed17h57c19d4b48648647E():
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

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hb0ec9a31d65a67d0E:

00000000 <core::result::Result<T,E>::unwrap>:
_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17hb0ec9a31d65a67d0E():
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

mylib-851790737b91ae76.6hx3122c26wtq74.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 6hx3122c26wtq74
00000344 l       .debug_str	00000000 
00000286 l       .debug_str	00000000 
00000295 l       .debug_str	00000000 
0000029d l       .debug_str	00000000 
000002b7 l       .debug_str	00000000 
0000030c l       .debug_str	00000000 
00000313 l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
0000032a l       .debug_str	00000000 
0000032d l       .debug_str	00000000 
00000334 l       .debug_str	00000000 
00000338 l       .debug_str	00000000 
00000350 l       .debug_str	00000000 
00000357 l       .debug_str	00000000 
0000035d l       .debug_str	00000000 
00000369 l       .debug_str	00000000 
00000373 l       .debug_str	00000000 
00000379 l       .debug_str	00000000 
0000038d l       .debug_str	00000000 
00000392 l       .debug_str	00000000 
000003a3 l       .debug_str	00000000 
000003b5 l       .debug_str	00000000 
000003c2 l       .debug_str	00000000 
000003ce l       .debug_str	00000000 
000003dc l       .debug_str	00000000 
000003f3 l       .debug_str	00000000 
00000405 l       .debug_str	00000000 
00000425 l       .debug_str	00000000 
0000042e l       .debug_str	00000000 
00000437 l       .debug_str	00000000 
00000449 l       .debug_str	00000000 
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
000000aa l       .debug_str	00000000 
000000ae l       .debug_str	00000000 
000000b7 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
0000011e l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
0000012a l       .debug_str	00000000 
0000012f l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
0000019c l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
000001df l       .debug_str	00000000 
000001f0 l       .debug_str	00000000 
0000022e l       .debug_str	00000000 
0000023e l       .debug_str	00000000 
00000242 l       .debug_str	00000000 
0000024b l       .debug_str	00000000 
00000253 l       .debug_str	00000000 
00000257 l       .debug_str	00000000 
00000261 l       .debug_str	00000000 
00000265 l       .debug_str	00000000 
00000271 l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
00000279 l       .debug_str	00000000 
0000027d l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.0	0000000a .Lanon.43d7759964b0d0c87ae3f320151a627f.0
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.10	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.10
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.11	00000016 .Lanon.43d7759964b0d0c87ae3f320151a627f.11
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.12	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.12
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.13	00000001 .Lanon.43d7759964b0d0c87ae3f320151a627f.13
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.14	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.14
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.15	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.15
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.16	00000019 .Lanon.43d7759964b0d0c87ae3f320151a627f.16
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.3	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.3
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.5	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.5
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.6	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.6
00000000 l     O .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.8	00000018 .Lanon.43d7759964b0d0c87ae3f320151a627f.8
00000000 l     F .text._ZN5mylib13listen_sensor15get_temperature17h58ab5b0365db9e99E	00000192 mylib::listen_sensor::get_temperature
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17hafe4867f718ff814E	00000144 mylib::listen_sensor::read_temperature
00000000 l    d  .text._ZN5mylib13listen_sensor21start_sensor_listener17hb00827a8f417ceecE	00000000 .text._ZN5mylib13listen_sensor21start_sensor_listener17hb00827a8f417ceecE
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17hafe4867f718ff814E	00000000 .text._ZN5mylib13listen_sensor16read_temperature17hafe4867f718ff814E
00000000 l    d  .text._ZN5mylib13listen_sensor15get_temperature17h58ab5b0365db9e99E	00000000 .text._ZN5mylib13listen_sensor15get_temperature17h58ab5b0365db9e99E
00000000 l    d  .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.1	00000000 .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.1
00000000 l    d  .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.2	00000000 .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.2
00000000 l    d  .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.4	00000000 .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.4
00000000 l    d  .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.7	00000000 .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.7
00000000 l    d  .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.9	00000000 .rodata..Lanon.43d7759964b0d0c87ae3f320151a627f.9
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::slice::<impl [T]>::len
00000000         *UND*	00000000 core::slice::<impl [T]>::as_ptr
00000000         *UND*	00000000 core::result::Result<T,E>::unwrap
00000000         *UND*	00000000 core::panicking::panic
00000000 g     F .text._ZN5mylib13listen_sensor21start_sensor_listener17hb00827a8f417ceecE	000000f8 .hidden mylib::listen_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden mylib::base::SENSOR_DEVICE
00000000         *UND*	00000000 .hidden mylib::base::TEMP_SENSOR_KEY
00000000         *UND*	00000000 .hidden mylib::send_coap::send_sensor_data
00000000         *UND*	00000000 cstr_core::CStr::from_bytes_with_nul
00000000         *UND*	00000000 .hidden cstr_core::CStr::as_ptr
00000000         *UND*	00000000 cstr_core::CStr::from_ptr
00000000         *UND*	00000000 console_buffer
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



Disassembly of section .text._ZN5mylib13listen_sensor21start_sensor_listener17hb00827a8f417ceecE:

00000000 <mylib::listen_sensor::start_sensor_listener>:
_ZN5mylib13listen_sensor21start_sensor_listener17hb00827a8f417ceecE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:13
const READ_CB: SensorArg     = 2;            //  Indicate that this is a sensor read callback

/////////////////////////////////////////////////////////
//  Listen To Local Sensor

pub fn start_sensor_listener() -> i32 {
   0:	b580      	push	{r7, lr}
   2:	b096      	sub	sp, #88	; 0x58
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:26
            return start_remote_sensor_listeners();   //  Start the Listener for every Remote Sensor.
        } */

        //  Otherwise this is a Standalone Node with ESP8266, or a Sensor Node with nRF24L01.
        //  console_printf("TMP poll " SENSOR_DEVICE "\n");
        let msg = "TMP poll \n";  //  SENSOR_DEVICE "\n";
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	9006      	str	r0, [sp, #24]
   e:	200a      	movs	r0, #10
  10:	9007      	str	r0, [sp, #28]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:27
        let buf = msg.as_bytes();
  12:	9806      	ldr	r0, [sp, #24]
  14:	9907      	ldr	r1, [sp, #28]
  16:	9012      	str	r0, [sp, #72]	; 0x48
  18:	9113      	str	r1, [sp, #76]	; 0x4c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
  1a:	9812      	ldr	r0, [sp, #72]	; 0x48
  1c:	9913      	ldr	r1, [sp, #76]	; 0x4c
  1e:	9014      	str	r0, [sp, #80]	; 0x50
  20:	9115      	str	r1, [sp, #84]	; 0x54
  22:	9814      	ldr	r0, [sp, #80]	; 0x50
  24:	9915      	ldr	r1, [sp, #84]	; 0x54
_ZN5mylib13listen_sensor21start_sensor_listener17hb00827a8f417ceecE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:27
  26:	9109      	str	r1, [sp, #36]	; 0x24
  28:	9008      	str	r0, [sp, #32]
  2a:	e7ff      	b.n	2c <mylib::listen_sensor::start_sensor_listener+0x2c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:28
        let len = buf.len();
  2c:	9808      	ldr	r0, [sp, #32]
  2e:	9909      	ldr	r1, [sp, #36]	; 0x24
  30:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
  34:	900a      	str	r0, [sp, #40]	; 0x28
  36:	e7ff      	b.n	38 <mylib::listen_sensor::start_sensor_listener+0x38>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:29
        console_buffer(buf.as_ptr(), len as u32);
  38:	9808      	ldr	r0, [sp, #32]
  3a:	9909      	ldr	r1, [sp, #36]	; 0x24
  3c:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  40:	9005      	str	r0, [sp, #20]
  42:	e7ff      	b.n	44 <mylib::listen_sensor::start_sensor_listener+0x44>
  44:	990a      	ldr	r1, [sp, #40]	; 0x28
  46:	9805      	ldr	r0, [sp, #20]
  48:	f7ff fffe 	bl	0 <console_buffer>
  4c:	e7ff      	b.n	4e <mylib::listen_sensor::start_sensor_listener+0x4e>
  4e:	f04f 6080 	mov.w	r0, #67108864	; 0x4000000
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:32

        //  Define the listener function to be called after polling the temperature sensor.
        let listener = SensorListener {
  52:	900b      	str	r0, [sp, #44]	; 0x2c
  54:	f240 0000 	movw	r0, #0
  58:	f2c0 0000 	movt	r0, #0
  5c:	900c      	str	r0, [sp, #48]	; 0x30
  5e:	2001      	movs	r0, #1
  60:	900d      	str	r0, [sp, #52]	; 0x34
  62:	2000      	movs	r0, #0
  64:	900e      	str	r0, [sp, #56]	; 0x38
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:40
            sl_arg        : LISTENER_CB,           //  Indicate to the listener function that this is a listener callback
            sl_next       : 0,
        };

        //  Set the sensor polling time to 10 seconds.  SENSOR_DEVICE is either "bme280_0" or "temp_stm32_0"
        let rc = sensor_set_poll_rate_ms(SENSOR_DEVICE(), SENSOR_POLL_TIME);
  66:	f7ff fffe 	bl	0 <mylib::base::SENSOR_DEVICE>
  6a:	9004      	str	r0, [sp, #16]
  6c:	e7ff      	b.n	6e <mylib::listen_sensor::start_sensor_listener+0x6e>
  6e:	f242 7110 	movw	r1, #10000	; 0x2710
  72:	9804      	ldr	r0, [sp, #16]
  74:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
  78:	900f      	str	r0, [sp, #60]	; 0x3c
  7a:	e7ff      	b.n	7c <mylib::listen_sensor::start_sensor_listener+0x7c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:41
        assert!(rc == 0);
  7c:	980f      	ldr	r0, [sp, #60]	; 0x3c
  7e:	2800      	cmp	r0, #0
  80:	d007      	beq.n	92 <mylib::listen_sensor::start_sensor_listener+0x92>
  82:	e7ff      	b.n	84 <mylib::listen_sensor::start_sensor_listener+0x84>
  84:	f240 0000 	movw	r0, #0
  88:	f2c0 0000 	movt	r0, #0
  8c:	f7ff fffe 	bl	0 <core::panicking::panic>
  90:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:44

        //  Fetch the sensor by name, without locking the driver for exclusive access.
        let listen_sensor = sensor_mgr_find_next_bydevname(SENSOR_DEVICE(), null_sensor());
  92:	f7ff fffe 	bl	0 <mylib::base::SENSOR_DEVICE>
  96:	9003      	str	r0, [sp, #12]
  98:	e7ff      	b.n	9a <mylib::listen_sensor::start_sensor_listener+0x9a>
  9a:	f7ff fffe 	bl	0 <null_sensor>
  9e:	9002      	str	r0, [sp, #8]
  a0:	e7ff      	b.n	a2 <mylib::listen_sensor::start_sensor_listener+0xa2>
  a2:	9803      	ldr	r0, [sp, #12]
  a4:	9902      	ldr	r1, [sp, #8]
  a6:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  aa:	9010      	str	r0, [sp, #64]	; 0x40
  ac:	e7ff      	b.n	ae <mylib::listen_sensor::start_sensor_listener+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:45
        assert!(is_null_sensor(listen_sensor));
  ae:	9810      	ldr	r0, [sp, #64]	; 0x40
  b0:	f7ff fffe 	bl	0 <is_null_sensor>
  b4:	9001      	str	r0, [sp, #4]
  b6:	e7ff      	b.n	b8 <mylib::listen_sensor::start_sensor_listener+0xb8>
  b8:	9801      	ldr	r0, [sp, #4]
  ba:	07c1      	lsls	r1, r0, #31
  bc:	2900      	cmp	r1, #0
  be:	d107      	bne.n	d0 <mylib::listen_sensor::start_sensor_listener+0xd0>
  c0:	e7ff      	b.n	c2 <mylib::listen_sensor::start_sensor_listener+0xc2>
  c2:	f240 0000 	movw	r0, #0
  c6:	f2c0 0000 	movt	r0, #0
  ca:	f7ff fffe 	bl	0 <core::panicking::panic>
  ce:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:48

        //  Set the Listener Function to be called every 10 seconds, with the polled sensor data.
        let rc = sensor_register_listener(listen_sensor, &listener);
  d0:	9810      	ldr	r0, [sp, #64]	; 0x40
  d2:	a90b      	add	r1, sp, #44	; 0x2c
  d4:	f7ff fffe 	bl	0 <sensor_register_listener>
  d8:	9011      	str	r0, [sp, #68]	; 0x44
  da:	e7ff      	b.n	dc <mylib::listen_sensor::start_sensor_listener+0xdc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:49
        assert!(rc == 0);
  dc:	9811      	ldr	r0, [sp, #68]	; 0x44
  de:	2800      	cmp	r0, #0
  e0:	d007      	beq.n	f2 <mylib::listen_sensor::start_sensor_listener+0xf2>
  e2:	e7ff      	b.n	e4 <mylib::listen_sensor::start_sensor_listener+0xe4>
  e4:	f240 0000 	movw	r0, #0
  e8:	f2c0 0000 	movt	r0, #0
  ec:	f7ff fffe 	bl	0 <core::panicking::panic>
  f0:	defe      	udf	#254	; 0xfe
  f2:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:52
    }
    0
}
  f4:	b016      	add	sp, #88	; 0x58
  f6:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib13listen_sensor16read_temperature17hafe4867f718ff814E:

00000000 <mylib::listen_sensor::read_temperature>:
_ZN5mylib13listen_sensor16read_temperature17hafe4867f718ff814E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:62
//  TODO

/////////////////////////////////////////////////////////
//  Process Temperature Sensor Value (Raw and Computed)

extern fn read_temperature(sensor: SensorPtr, arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0a0      	sub	sp, #128	; 0x80
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9009      	str	r0, [sp, #36]	; 0x24
   e:	910a      	str	r1, [sp, #40]	; 0x28
  10:	920b      	str	r2, [sp, #44]	; 0x2c
  12:	930c      	str	r3, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:71
    //  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
    //  Return 0 if we have processed the sensor data successfully.
    unsafe {
        //  Check that the temperature data is valid.
        //  TODO
        if is_null_sensor_data(sensor_data) { return SYS_EINVAL; }  //  Exit if data is missing
  14:	980b      	ldr	r0, [sp, #44]	; 0x2c
  16:	f8cd c020 	str.w	ip, [sp, #32]
  1a:	f8cd e01c 	str.w	lr, [sp, #28]
  1e:	9406      	str	r4, [sp, #24]
  20:	9505      	str	r5, [sp, #20]
  22:	f7ff fffe 	bl	0 <is_null_sensor_data>
  26:	9004      	str	r0, [sp, #16]
  28:	e7ff      	b.n	2a <mylib::listen_sensor::read_temperature+0x2a>
  2a:	9804      	ldr	r0, [sp, #16]
  2c:	07c1      	lsls	r1, r0, #31
  2e:	2900      	cmp	r1, #0
  30:	d007      	beq.n	42 <mylib::listen_sensor::read_temperature+0x42>
  32:	e7ff      	b.n	34 <mylib::listen_sensor::read_temperature+0x34>
  34:	f06f 0001 	mvn.w	r0, #1
  38:	900d      	str	r0, [sp, #52]	; 0x34
  3a:	e7ff      	b.n	3c <mylib::listen_sensor::read_temperature+0x3c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:108
        }
        assert!(rc == 0);
    //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    }
    0
}
  3c:	980d      	ldr	r0, [sp, #52]	; 0x34
  3e:	b020      	add	sp, #128	; 0x80
  40:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:72
        assert!(is_null_sensor(sensor));
  42:	9809      	ldr	r0, [sp, #36]	; 0x24
  44:	f7ff fffe 	bl	0 <is_null_sensor>
  48:	9003      	str	r0, [sp, #12]
  4a:	e7ff      	b.n	4c <mylib::listen_sensor::read_temperature+0x4c>
  4c:	9803      	ldr	r0, [sp, #12]
  4e:	07c1      	lsls	r1, r0, #31
  50:	2900      	cmp	r1, #0
  52:	d107      	bne.n	64 <mylib::listen_sensor::read_temperature+0x64>
  54:	e7ff      	b.n	56 <mylib::listen_sensor::read_temperature+0x56>
  56:	f240 0000 	movw	r0, #0
  5a:	f2c0 0000 	movt	r0, #0
  5e:	f7ff fffe 	bl	0 <core::panicking::panic>
  62:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:76
        let device = sensor_get_device(sensor);
  64:	9809      	ldr	r0, [sp, #36]	; 0x24
  66:	f7ff fffe 	bl	0 <sensor_get_device>
  6a:	900e      	str	r0, [sp, #56]	; 0x38
  6c:	e7ff      	b.n	6e <mylib::listen_sensor::read_temperature+0x6e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:77
        let c_buf: *const c_char = unsafe { device_get_name(device) };
  6e:	980e      	ldr	r0, [sp, #56]	; 0x38
  70:	f7ff fffe 	bl	0 <device_get_name>
  74:	900f      	str	r0, [sp, #60]	; 0x3c
  76:	e7ff      	b.n	78 <mylib::listen_sensor::read_temperature+0x78>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:78
        let device_name: &CStr = unsafe { CStr::from_ptr(c_buf) };
  78:	980f      	ldr	r0, [sp, #60]	; 0x3c
  7a:	f7ff fffe 	bl	0 <cstr_core::CStr::from_ptr>
  7e:	9002      	str	r0, [sp, #8]
  80:	9101      	str	r1, [sp, #4]
  82:	e7ff      	b.n	84 <mylib::listen_sensor::read_temperature+0x84>
  84:	9802      	ldr	r0, [sp, #8]
  86:	9010      	str	r0, [sp, #64]	; 0x40
  88:	9901      	ldr	r1, [sp, #4]
  8a:	9111      	str	r1, [sp, #68]	; 0x44
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:83
        let temp_sensor_value = get_temperature(sensor_data, sensor_type);
  8c:	990b      	ldr	r1, [sp, #44]	; 0x2c
  8e:	9a0c      	ldr	r2, [sp, #48]	; 0x30
  90:	a812      	add	r0, sp, #72	; 0x48
  92:	f7ff fffe 	bl	0 <mylib::listen_sensor::read_temperature>
  96:	e7ff      	b.n	98 <mylib::listen_sensor::read_temperature+0x98>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:84
        assert!(temp_sensor_value.val_type != 0);
  98:	9813      	ldr	r0, [sp, #76]	; 0x4c
  9a:	2800      	cmp	r0, #0
  9c:	d107      	bne.n	ae <mylib::listen_sensor::read_temperature+0xae>
  9e:	e7ff      	b.n	a0 <mylib::listen_sensor::read_temperature+0xa0>
  a0:	f240 0000 	movw	r0, #0
  a4:	f2c0 0000 	movt	r0, #0
  a8:	f7ff fffe 	bl	0 <core::panicking::panic>
  ac:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:85
        if temp_sensor_value.val_type == 0 { return -1; }  //  Invalid type.
  ae:	9813      	ldr	r0, [sp, #76]	; 0x4c
  b0:	2800      	cmp	r0, #0
  b2:	d105      	bne.n	c0 <mylib::listen_sensor::read_temperature+0xc0>
  b4:	e7ff      	b.n	b6 <mylib::listen_sensor::read_temperature+0xb6>
  b6:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
  ba:	900d      	str	r0, [sp, #52]	; 0x34
  bc:	e7ff      	b.n	be <mylib::listen_sensor::read_temperature+0xbe>
  be:	e7bd      	b.n	3c <mylib::listen_sensor::read_temperature+0x3c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:92
        let rc = send_sensor_data(&temp_sensor_value, device_name);
  c0:	9910      	ldr	r1, [sp, #64]	; 0x40
  c2:	9a11      	ldr	r2, [sp, #68]	; 0x44
  c4:	a812      	add	r0, sp, #72	; 0x48
  c6:	f7ff fffe 	bl	0 <mylib::send_coap::send_sensor_data>
  ca:	9016      	str	r0, [sp, #88]	; 0x58
  cc:	e7ff      	b.n	ce <mylib::listen_sensor::read_temperature+0xce>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:96
        if rc == SYS_EAGAIN {
  ce:	9816      	ldr	r0, [sp, #88]	; 0x58
  d0:	3006      	adds	r0, #6
  d2:	2800      	cmp	r0, #0
  d4:	d128      	bne.n	128 <mylib::listen_sensor::read_temperature+0x128>
  d6:	e7ff      	b.n	d8 <mylib::listen_sensor::read_temperature+0xd8>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:98
            let msg = "TMP network not ready\n";
  d8:	f240 0000 	movw	r0, #0
  dc:	f2c0 0000 	movt	r0, #0
  e0:	9017      	str	r0, [sp, #92]	; 0x5c
  e2:	2016      	movs	r0, #22
  e4:	9018      	str	r0, [sp, #96]	; 0x60
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:99
            let buf = msg.as_bytes();
  e6:	9817      	ldr	r0, [sp, #92]	; 0x5c
  e8:	9918      	ldr	r1, [sp, #96]	; 0x60
  ea:	901c      	str	r0, [sp, #112]	; 0x70
  ec:	911d      	str	r1, [sp, #116]	; 0x74
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
  ee:	981c      	ldr	r0, [sp, #112]	; 0x70
  f0:	991d      	ldr	r1, [sp, #116]	; 0x74
  f2:	901e      	str	r0, [sp, #120]	; 0x78
  f4:	911f      	str	r1, [sp, #124]	; 0x7c
  f6:	981e      	ldr	r0, [sp, #120]	; 0x78
  f8:	991f      	ldr	r1, [sp, #124]	; 0x7c
_ZN5mylib13listen_sensor16read_temperature17hafe4867f718ff814E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:99
  fa:	911a      	str	r1, [sp, #104]	; 0x68
  fc:	9019      	str	r0, [sp, #100]	; 0x64
  fe:	e7ff      	b.n	100 <mylib::listen_sensor::read_temperature+0x100>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:100
            let len = buf.len();
 100:	9819      	ldr	r0, [sp, #100]	; 0x64
 102:	991a      	ldr	r1, [sp, #104]	; 0x68
 104:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
 108:	901b      	str	r0, [sp, #108]	; 0x6c
 10a:	e7ff      	b.n	10c <mylib::listen_sensor::read_temperature+0x10c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:101
            console_buffer(buf.as_ptr(), len as u32);
 10c:	9819      	ldr	r0, [sp, #100]	; 0x64
 10e:	991a      	ldr	r1, [sp, #104]	; 0x68
 110:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
 114:	9000      	str	r0, [sp, #0]
 116:	e7ff      	b.n	118 <mylib::listen_sensor::read_temperature+0x118>
 118:	991b      	ldr	r1, [sp, #108]	; 0x6c
 11a:	9800      	ldr	r0, [sp, #0]
 11c:	f7ff fffe 	bl	0 <console_buffer>
 120:	e7ff      	b.n	122 <mylib::listen_sensor::read_temperature+0x122>
 122:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:102
            return 0; 
 124:	900d      	str	r0, [sp, #52]	; 0x34
 126:	e7ca      	b.n	be <mylib::listen_sensor::read_temperature+0xbe>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:104
        assert!(rc == 0);
 128:	9816      	ldr	r0, [sp, #88]	; 0x58
 12a:	2800      	cmp	r0, #0
 12c:	d007      	beq.n	13e <mylib::listen_sensor::read_temperature+0x13e>
 12e:	e7ff      	b.n	130 <mylib::listen_sensor::read_temperature+0x130>
 130:	f240 0000 	movw	r0, #0
 134:	f2c0 0000 	movt	r0, #0
 138:	f7ff fffe 	bl	0 <core::panicking::panic>
 13c:	defe      	udf	#254	; 0xfe
 13e:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:107
    0
 140:	900d      	str	r0, [sp, #52]	; 0x34
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:108
}
 142:	e77b      	b.n	3c <mylib::listen_sensor::read_temperature+0x3c>

Disassembly of section .text._ZN5mylib13listen_sensor15get_temperature17h58ab5b0365db9e99E:

00000000 <mylib::listen_sensor::get_temperature>:
_ZN5mylib13listen_sensor15get_temperature17h58ab5b0365db9e99E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:110

fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
   0:	b580      	push	{r7, lr}
   2:	b0a2      	sub	sp, #136	; 0x88
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	9109      	str	r1, [sp, #36]	; 0x24
   a:	920a      	str	r2, [sp, #40]	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:115
    //  Get the temperature value, raw or computed.  sensor_data contains the raw or computed temperature. 
    //  type indicates whether sensor_data contains raw or computed temperature.  We return 
    //  the raw or computed temperature, as well as the key and value type.
    let mut return_value = SensorValue {
        key: CStr::from_bytes_with_nul(b"\0").unwrap().as_ptr(),
   c:	f240 0100 	movw	r1, #0
  10:	f2c0 0100 	movt	r1, #0
  14:	aa0f      	add	r2, sp, #60	; 0x3c
  16:	f04f 0e01 	mov.w	lr, #1
  1a:	9008      	str	r0, [sp, #32]
  1c:	4610      	mov	r0, r2
  1e:	4672      	mov	r2, lr
  20:	9307      	str	r3, [sp, #28]
  22:	f8cd c018 	str.w	ip, [sp, #24]
  26:	f7ff fffe 	bl	0 <cstr_core::CStr::from_bytes_with_nul>
  2a:	e7ff      	b.n	2c <mylib::listen_sensor::get_temperature+0x2c>
  2c:	a80f      	add	r0, sp, #60	; 0x3c
  2e:	f7ff fffe 	bl	0 <core::result::Result<T,E>::unwrap>
  32:	9005      	str	r0, [sp, #20]
  34:	9104      	str	r1, [sp, #16]
  36:	e7ff      	b.n	38 <mylib::listen_sensor::get_temperature+0x38>
  38:	9805      	ldr	r0, [sp, #20]
  3a:	9904      	ldr	r1, [sp, #16]
  3c:	f7ff fffe 	bl	0 <cstr_core::CStr::as_ptr>
  40:	9003      	str	r0, [sp, #12]
  42:	e7ff      	b.n	44 <mylib::listen_sensor::get_temperature+0x44>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
    let mut return_value = SensorValue {
  44:	9803      	ldr	r0, [sp, #12]
  46:	900b      	str	r0, [sp, #44]	; 0x2c
  48:	2100      	movs	r1, #0
  4a:	910c      	str	r1, [sp, #48]	; 0x30
  4c:	f8ad 1034 	strh.w	r1, [sp, #52]	; 0x34
  50:	910e      	str	r1, [sp, #56]	; 0x38
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:123
        float_val: 0.0,
    };
    unsafe {
        //assert!(sensor_data);
        match sensor_type {                                //  Is this raw or computed temperature?
            SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  52:	990a      	ldr	r1, [sp, #40]	; 0x28
  54:	f1b1 6f80 	cmp.w	r1, #67108864	; 0x4000000
  58:	d155      	bne.n	106 <mylib::listen_sensor::get_temperature+0x106>
  5a:	e7ff      	b.n	5c <mylib::listen_sensor::get_temperature+0x5c>
  5c:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:125
                //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
                let mut rawtempdata = SensorTempRawData {
  5e:	9012      	str	r0, [sp, #72]	; 0x48
  60:	f88d 004c 	strb.w	r0, [sp, #76]	; 0x4c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
                    strd_temp_raw: 0,
                    strd_temp_raw_is_valid: 0,
                };
                let rc = get_temp_raw_data(sensor_data, &mut rawtempdata);
  64:	9809      	ldr	r0, [sp, #36]	; 0x24
  66:	a912      	add	r1, sp, #72	; 0x48
  68:	f7ff fffe 	bl	0 <get_temp_raw_data>
  6c:	9014      	str	r0, [sp, #80]	; 0x50
  6e:	e7ff      	b.n	70 <mylib::listen_sensor::get_temperature+0x70>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:130
                assert!(rc == 0);
  70:	9814      	ldr	r0, [sp, #80]	; 0x50
  72:	2800      	cmp	r0, #0
  74:	d007      	beq.n	86 <mylib::listen_sensor::get_temperature+0x86>
  76:	e7ff      	b.n	78 <mylib::listen_sensor::get_temperature+0x78>
  78:	f240 0000 	movw	r0, #0
  7c:	f2c0 0000 	movt	r0, #0
  80:	f7ff fffe 	bl	0 <core::panicking::panic>
  84:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:133

                //  Check that the raw temperature data is valid.
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  86:	f89d 004c 	ldrb.w	r0, [sp, #76]	; 0x4c
  8a:	2800      	cmp	r0, #0
  8c:	d112      	bne.n	b4 <mylib::listen_sensor::get_temperature+0xb4>
  8e:	e7ff      	b.n	90 <mylib::listen_sensor::get_temperature+0x90>
  90:	980b      	ldr	r0, [sp, #44]	; 0x2c
  92:	990c      	ldr	r1, [sp, #48]	; 0x30
  94:	9a0d      	ldr	r2, [sp, #52]	; 0x34
  96:	9b0e      	ldr	r3, [sp, #56]	; 0x38
  98:	f8dd c020 	ldr.w	ip, [sp, #32]
  9c:	f8cc 300c 	str.w	r3, [ip, #12]
  a0:	f8cc 2008 	str.w	r2, [ip, #8]
  a4:	f8cc 1004 	str.w	r1, [ip, #4]
  a8:	f8cc 0000 	str.w	r0, [ip]
  ac:	e001      	b.n	b2 <mylib::listen_sensor::get_temperature+0xb2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:173
        //  Return the key and value type for raw or computed temperature, as defined in temp_stm32.h.
        return_value.key = TEMP_SENSOR_KEY();
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
    };
    return_value
}
  ae:	b022      	add	sp, #136	; 0x88
  b0:	bd80      	pop	{r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:133
                if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  b2:	e7fc      	b.n	ae <mylib::listen_sensor::get_temperature+0xae>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:136
                return_value.int_val = rawtempdata.strd_temp_raw as u16;  //  Raw Temperature in integer (0 to 4095)
  b4:	9812      	ldr	r0, [sp, #72]	; 0x48
  b6:	f8ad 0034 	strh.w	r0, [sp, #52]	; 0x34
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:138
                let msg = "TMP listener got rawtmp \n";
  ba:	f240 0000 	movw	r0, #0
  be:	f2c0 0000 	movt	r0, #0
  c2:	9015      	str	r0, [sp, #84]	; 0x54
  c4:	2019      	movs	r0, #25
  c6:	9016      	str	r0, [sp, #88]	; 0x58
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:139
                let buf = msg.as_bytes();
  c8:	9815      	ldr	r0, [sp, #84]	; 0x54
  ca:	9916      	ldr	r1, [sp, #88]	; 0x58
  cc:	901e      	str	r0, [sp, #120]	; 0x78
  ce:	911f      	str	r1, [sp, #124]	; 0x7c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
  d0:	981e      	ldr	r0, [sp, #120]	; 0x78
  d2:	991f      	ldr	r1, [sp, #124]	; 0x7c
  d4:	9020      	str	r0, [sp, #128]	; 0x80
  d6:	9121      	str	r1, [sp, #132]	; 0x84
  d8:	9820      	ldr	r0, [sp, #128]	; 0x80
  da:	9921      	ldr	r1, [sp, #132]	; 0x84
_ZN5mylib13listen_sensor15get_temperature17h58ab5b0365db9e99E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:139
  dc:	9118      	str	r1, [sp, #96]	; 0x60
  de:	9017      	str	r0, [sp, #92]	; 0x5c
  e0:	e7ff      	b.n	e2 <mylib::listen_sensor::get_temperature+0xe2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:140
                let len = buf.len();
  e2:	9817      	ldr	r0, [sp, #92]	; 0x5c
  e4:	9918      	ldr	r1, [sp, #96]	; 0x60
  e6:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
  ea:	9019      	str	r0, [sp, #100]	; 0x64
  ec:	e7ff      	b.n	ee <mylib::listen_sensor::get_temperature+0xee>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:141
                console_buffer(buf.as_ptr(), len as u32);
  ee:	9817      	ldr	r0, [sp, #92]	; 0x5c
  f0:	9918      	ldr	r1, [sp, #96]	; 0x60
  f2:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_ptr>
  f6:	9002      	str	r0, [sp, #8]
  f8:	e7ff      	b.n	fa <mylib::listen_sensor::get_temperature+0xfa>
  fa:	9919      	ldr	r1, [sp, #100]	; 0x64
  fc:	9802      	ldr	r0, [sp, #8]
  fe:	f7ff fffe 	bl	0 <console_buffer>
 102:	e7ff      	b.n	104 <mylib::listen_sensor::get_temperature+0x104>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:122
        match sensor_type {                                //  Is this raw or computed temperature?
 104:	e02d      	b.n	162 <mylib::listen_sensor::get_temperature+0x162>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:143
            SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
 106:	980a      	ldr	r0, [sp, #40]	; 0x28
 108:	901a      	str	r0, [sp, #104]	; 0x68
 10a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:145
                let mut tempdata = SensorTempData {
 10c:	901b      	str	r0, [sp, #108]	; 0x6c
 10e:	f88d 0070 	strb.w	r0, [sp, #112]	; 0x70
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:149
                let rc = get_temp_data(sensor_data, &mut tempdata);
 112:	9809      	ldr	r0, [sp, #36]	; 0x24
 114:	a91b      	add	r1, sp, #108	; 0x6c
 116:	f7ff fffe 	bl	0 <get_temp_data>
 11a:	901d      	str	r0, [sp, #116]	; 0x74
 11c:	e7ff      	b.n	11e <mylib::listen_sensor::get_temperature+0x11e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:150
                assert!(rc == 0);
 11e:	981d      	ldr	r0, [sp, #116]	; 0x74
 120:	2800      	cmp	r0, #0
 122:	d007      	beq.n	134 <mylib::listen_sensor::get_temperature+0x134>
 124:	e7ff      	b.n	126 <mylib::listen_sensor::get_temperature+0x126>
 126:	f240 0000 	movw	r0, #0
 12a:	f2c0 0000 	movt	r0, #0
 12e:	f7ff fffe 	bl	0 <core::panicking::panic>
 132:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:153
                if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
 134:	f89d 0070 	ldrb.w	r0, [sp, #112]	; 0x70
 138:	2800      	cmp	r0, #0
 13a:	d10f      	bne.n	15c <mylib::listen_sensor::get_temperature+0x15c>
 13c:	e7ff      	b.n	13e <mylib::listen_sensor::get_temperature+0x13e>
 13e:	980b      	ldr	r0, [sp, #44]	; 0x2c
 140:	990c      	ldr	r1, [sp, #48]	; 0x30
 142:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 144:	9b0e      	ldr	r3, [sp, #56]	; 0x38
 146:	f8dd c020 	ldr.w	ip, [sp, #32]
 14a:	f8cc 300c 	str.w	r3, [ip, #12]
 14e:	f8cc 2008 	str.w	r2, [ip, #8]
 152:	f8cc 1004 	str.w	r1, [ip, #4]
 156:	f8cc 0000 	str.w	r0, [ip]
 15a:	e7aa      	b.n	b2 <mylib::listen_sensor::get_temperature+0xb2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:156
                return_value.float_val = tempdata.std_temp;  //  Temperature in floating point.
 15c:	981b      	ldr	r0, [sp, #108]	; 0x6c
 15e:	900e      	str	r0, [sp, #56]	; 0x38
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:122
        match sensor_type {                                //  Is this raw or computed temperature?
 160:	e7ff      	b.n	162 <mylib::listen_sensor::get_temperature+0x162>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:169
        return_value.key = TEMP_SENSOR_KEY();
 162:	f7ff fffe 	bl	0 <mylib::base::TEMP_SENSOR_KEY>
 166:	9001      	str	r0, [sp, #4]
 168:	e7ff      	b.n	16a <mylib::listen_sensor::get_temperature+0x16a>
 16a:	9801      	ldr	r0, [sp, #4]
 16c:	900b      	str	r0, [sp, #44]	; 0x2c
 16e:	2101      	movs	r1, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:170
        return_value.val_type = TEMP_SENSOR_VALUE_TYPE;
 170:	910c      	str	r1, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:172
    return_value
 172:	990b      	ldr	r1, [sp, #44]	; 0x2c
 174:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 176:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 178:	f8dd c038 	ldr.w	ip, [sp, #56]	; 0x38
 17c:	f8dd e020 	ldr.w	lr, [sp, #32]
 180:	f8ce c00c 	str.w	ip, [lr, #12]
 184:	f8ce 3008 	str.w	r3, [lr, #8]
 188:	f8ce 2004 	str.w	r2, [lr, #4]
 18c:	f8ce 1000 	str.w	r1, [lr]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:173
}
 190:	e78d      	b.n	ae <mylib::listen_sensor::get_temperature+0xae>
