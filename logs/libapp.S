In archive target/thumbv7em-none-eabihf/debug/libapp.rlib:

app-4d8274845a53ddea.1ltec54641atac0l.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1ltec54641atac0l
000002b4 l       .debug_str	00000000 
000003d1 l       .debug_str	00000000 
000003dc l       .debug_str	00000000 
000003f9 l       .debug_str	00000000 
00000412 l       .debug_str	00000000 
0000041c l       .debug_str	00000000 
0000044e l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a4 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b6 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c0 l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000cb l       .debug_str	00000000 
000000d2 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000e5 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000f2 l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
0000011b l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
00000129 l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
00000130 l       .debug_str	00000000 
00000139 l       .debug_str	00000000 
00000140 l       .debug_str	00000000 
00000145 l       .debug_str	00000000 
0000014a l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
00000156 l       .debug_str	00000000 
00000160 l       .debug_str	00000000 
00000163 l       .debug_str	00000000 
00000169 l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
00000181 l       .debug_str	00000000 
00000187 l       .debug_str	00000000 
00000192 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
000001be l       .debug_str	00000000 
000001dd l       .debug_str	00000000 
000001df l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
0000020b l       .debug_str	00000000 
00000210 l       .debug_str	00000000 
00000216 l       .debug_str	00000000 
0000021c l       .debug_str	00000000 
0000021f l       .debug_str	00000000 
0000022e l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
00000239 l       .debug_str	00000000 
00000242 l       .debug_str	00000000 
0000024a l       .debug_str	00000000 
00000252 l       .debug_str	00000000 
00000259 l       .debug_str	00000000 
0000026d l       .debug_str	00000000 
00000279 l       .debug_str	00000000 
00000285 l       .debug_str	00000000 
0000029e l       .debug_str	00000000 
000002a3 l       .debug_str	00000000 
000002be l       .debug_str	00000000 
000002cc l       .debug_str	00000000 
000002d0 l       .debug_str	00000000 
000002db l       .debug_str	00000000 
000002e2 l       .debug_str	00000000 
000002e8 l       .debug_str	00000000 
000002ec l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
000002f8 l       .debug_str	00000000 
0000030f l       .debug_str	00000000 
00000333 l       .debug_str	00000000 
0000034f l       .debug_str	00000000 
00000359 l       .debug_str	00000000 
00000373 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E	00000000 .text._ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E	00000038 .hidden _ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E



Disassembly of section .text._ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E:

00000000 <_ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E>:
_ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/fmt/mod.rs:316
   0:	b086      	sub	sp, #24
   2:	f8dd c018 	ldr.w	ip, [sp, #24]
   6:	9100      	str	r1, [sp, #0]
   8:	9201      	str	r2, [sp, #4]
   a:	9302      	str	r3, [sp, #8]
   c:	f8cd c00c 	str.w	ip, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/fmt/mod.rs:319
  10:	9900      	ldr	r1, [sp, #0]
  12:	9a01      	ldr	r2, [sp, #4]
  14:	2300      	movs	r3, #0
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/fmt/mod.rs:320
  16:	9305      	str	r3, [sp, #20]
  18:	9304      	str	r3, [sp, #16]
  1a:	9304      	str	r3, [sp, #16]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/fmt/mod.rs:321
  1c:	9b02      	ldr	r3, [sp, #8]
  1e:	f8dd c00c 	ldr.w	ip, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/fmt/mod.rs:318
  22:	6001      	str	r1, [r0, #0]
  24:	6042      	str	r2, [r0, #4]
  26:	9904      	ldr	r1, [sp, #16]
  28:	9a05      	ldr	r2, [sp, #20]
  2a:	6081      	str	r1, [r0, #8]
  2c:	60c2      	str	r2, [r0, #12]
  2e:	6103      	str	r3, [r0, #16]
  30:	f8c0 c014 	str.w	ip, [r0, #20]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/fmt/mod.rs:323
  34:	b006      	add	sp, #24
  36:	4770      	bx	lr

app-4d8274845a53ddea.1mgeg98q8vf0g5gy.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1mgeg98q8vf0g5gy
00000327 l       .debug_str	00000000 
0000036c l       .debug_str	00000000 
00000370 l       .debug_str	00000000 
00000374 l       .debug_str	00000000 
0000037c l       .debug_str	00000000 
00000393 l       .debug_str	00000000 
000003b7 l       .debug_str	00000000 
000003d3 l       .debug_str	00000000 
000003dd l       .debug_str	00000000 
000003f7 l       .debug_str	00000000 
00000455 l       .debug_str	00000000 
00000460 l       .debug_str	00000000 
0000047d l       .debug_str	00000000 
00000496 l       .debug_str	00000000 
000004a0 l       .debug_str	00000000 
000004b6 l       .debug_str	00000000 
000004d4 l       .debug_str	00000000 
000004dd l       .debug_str	00000000 
000004e2 l       .debug_str	00000000 
000004e7 l       .debug_str	00000000 
000004eb l       .debug_str	00000000 
000004f4 l       .debug_str	00000000 
0000050b l       .debug_str	00000000 
00000515 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a4 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b6 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c0 l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000cb l       .debug_str	00000000 
000000cf l       .debug_str	00000000 
000000d8 l       .debug_str	00000000 
000000dc l       .debug_str	00000000 
00000106 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000110 l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
0000012a l       .debug_str	00000000 
0000012d l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
0000014a l       .debug_str	00000000 
00000152 l       .debug_str	00000000 
00000159 l       .debug_str	00000000 
0000015f l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
00000193 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019c l       .debug_str	00000000 
000001a3 l       .debug_str	00000000 
000001ac l       .debug_str	00000000 
000001b6 l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
000001d6 l       .debug_str	00000000 
000001df l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
000001e7 l       .debug_str	00000000 
000001eb l       .debug_str	00000000 
000001f4 l       .debug_str	00000000 
000001fb l       .debug_str	00000000 
00000200 l       .debug_str	00000000 
00000205 l       .debug_str	00000000 
0000020b l       .debug_str	00000000 
00000211 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
0000021e l       .debug_str	00000000 
00000224 l       .debug_str	00000000 
0000022e l       .debug_str	00000000 
00000236 l       .debug_str	00000000 
0000023c l       .debug_str	00000000 
00000242 l       .debug_str	00000000 
0000024d l       .debug_str	00000000 
00000256 l       .debug_str	00000000 
00000279 l       .debug_str	00000000 
00000298 l       .debug_str	00000000 
0000029a l       .debug_str	00000000 
0000029f l       .debug_str	00000000 
000002c6 l       .debug_str	00000000 
000002cb l       .debug_str	00000000 
000002d1 l       .debug_str	00000000 
000002d7 l       .debug_str	00000000 
000002da l       .debug_str	00000000 
000002e9 l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
000002fd l       .debug_str	00000000 
00000309 l       .debug_str	00000000 
00000322 l       .debug_str	00000000 
00000338 l       .debug_str	00000000 
00000342 l       .debug_str	00000000 
00000350 l       .debug_str	00000000 
00000354 l       .debug_str	00000000 
0000035f l       .debug_str	00000000 
00000366 l       .debug_str	00000000 
00000000 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.0
00000008 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.1
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.10	00000007 .Lanon.3ed011473997af99b525cde47c9eaaac.10
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.11	00000003 .Lanon.3ed011473997af99b525cde47c9eaaac.11
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.12	00000006 .Lanon.3ed011473997af99b525cde47c9eaaac.12
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.13	00000001 .Lanon.3ed011473997af99b525cde47c9eaaac.13
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.3	00000010 .Lanon.3ed011473997af99b525cde47c9eaaac.3
00000010 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.4
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.5	0000000d .Lanon.3ed011473997af99b525cde47c9eaaac.5
00000018 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.6
00000020 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.7
00000028 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.8
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.9	00000006 .Lanon.3ed011473997af99b525cde47c9eaaac.9
00000000 l    d  .text.main	00000000 .text.main
00000000 l    d  .text.rust_begin_unwind	00000000 .text.rust_begin_unwind
00000000 l    d  .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.2	00000000 .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.2
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN22piet_embedded_graphics7display12test_display17h284e13681b571503E
00000000         *UND*	00000000 _ZN22piet_embedded_graphics7display13start_display17h32575c6ed50330eeE
00000000         *UND*	00000000 .hidden _ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E
00000000         *UND*	00000000 .hidden _ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE
00000000         *UND*	00000000 _ZN4core5panic8Location4file17hb5b09c8924a65fc3E
00000000         *UND*	00000000 _ZN4core5panic8Location4line17h367a930005b08c12E
00000000         *UND*	00000000 _ZN4core5panic9PanicInfo7payload17h0ba779b66a5d0935E
00000000         *UND*	00000000 _ZN4core5panic9PanicInfo8location17h080d51c1ed5f8f03E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE
00000000         *UND*	00000000 _ZN4core9panicking5panic17hfdd0eecc44a682f8E
00000000         *UND*	00000000 _ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE
00000000         *UND*	00000000 _ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE
00000000         *UND*	00000000 _ZN6mynewt3sys7console6buffer17hdceaf289cb20d56aE
00000000         *UND*	00000000 _ZN6mynewt3sys7console8printint17he4a4f45a616375d0E
00000000         *UND*	00000000 _ZN6mynewt6kernel2os10eventq_run17h3409829a5a6bbae3E
00000000         *UND*	00000000 _ZN6mynewt6kernel2os15eventq_dflt_get17h1dc1684b870eee8cE
00000000         *UND*	00000000 _ZN6mynewt7sysinit17h4cdac33b185b4409E
00000000 g     F .text.main	000000de main
00000000 g     F .text.rust_begin_unwind	000000f0 rust_begin_unwind
00000000         *UND*	00000000 start_ble



Disassembly of section .text.main:

00000000 <main>:
main():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:53
};

///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                 //  Don't mangle the name "main"
extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
   0:	b08c      	sub	sp, #48	; 0x30
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:58
    //  Initialise the Mynewt packages and internal temperature sensor driver. Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c
    mynewt::sysinit();
   2:	f7ff fffe 	bl	0 <_ZN6mynewt7sysinit17h4cdac33b185b4409E>
   6:	e7ff      	b.n	2 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:66
    //  sensor_network::start_server_transport()
    //    .expect("NET fail");

    //  Start polling the simulated temperature sensor every 10 seconds in the background.
    //  TODO: Replace by touch handler.
    app_sensor::start_sensor_listener()
   8:	f7ff fffe 	bl	0 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E>
   c:	9007      	str	r0, [sp, #28]
   e:	e7ff      	b.n	10 <main+0x10>
  10:	f240 0100 	movw	r1, #0
  14:	f2c0 0100 	movt	r1, #0
  18:	2208      	movs	r2, #8
  1a:	9807      	ldr	r0, [sp, #28]
  1c:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E>
  20:	e7ff      	b.n	2 <start_ble+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:71
        .expect("TMP fail");

    //  Start Bluetooth Beacon.  TODO: Create a safe wrapper for starting Bluetooth LE.
    extern { fn start_ble() -> i32; }
    let rc = unsafe { start_ble() };
  22:	f7ff fffe 	bl	0 <start_ble>
  26:	9008      	str	r0, [sp, #32]
  28:	e7ff      	b.n	2a <main+0x2a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:72
    assert!(rc == 0, "BLE fail");
  2a:	9808      	ldr	r0, [sp, #32]
  2c:	2800      	cmp	r0, #0
  2e:	d104      	bne.n	3a <main+0x3a>
  30:	e7ff      	b.n	32 <main+0x32>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:75

    //  Start the display
    druid::start_display()
  32:	f7ff fffe 	bl	0 <_ZN22piet_embedded_graphics7display13start_display17h32575c6ed50330eeE>
  36:	9006      	str	r0, [sp, #24]
  38:	e010      	b.n	5c <main+0x5c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:72
    assert!(rc == 0, "BLE fail");
  3a:	f240 0000 	movw	r0, #0
  3e:	f2c0 0000 	movt	r0, #0
  42:	900b      	str	r0, [sp, #44]	; 0x2c
  44:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
  46:	9205      	str	r2, [sp, #20]
  48:	e7ff      	b.n	4a <main+0x4a>
  4a:	f240 0000 	movw	r0, #0
  4e:	f2c0 0000 	movt	r0, #0
  52:	2108      	movs	r1, #8
  54:	9a05      	ldr	r2, [sp, #20]
  56:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
  5a:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:75
    druid::start_display()
  5c:	f240 0100 	movw	r1, #0
  60:	f2c0 0100 	movt	r1, #0
  64:	2208      	movs	r2, #8
  66:	9806      	ldr	r0, [sp, #24]
  68:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E>
  6c:	e7ff      	b.n	2 <_ZN22piet_embedded_graphics7display12test_display17h284e13681b571503E+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:79
        .expect("DSP fail");

    //  Test the display
    druid::test_display()
  6e:	f7ff fffe 	bl	0 <_ZN22piet_embedded_graphics7display12test_display17h284e13681b571503E>
  72:	9004      	str	r0, [sp, #16]
  74:	e7ff      	b.n	76 <main+0x76>
  76:	f240 0100 	movw	r1, #0
  7a:	f2c0 0100 	movt	r1, #0
  7e:	220d      	movs	r2, #13
  80:	9804      	ldr	r0, [sp, #16]
  82:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E>
  86:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:83
        .expect("DSP test fail");

    //  Start the touch sensor
    touch_sensor::start_touch_sensor()
  88:	f7ff fffe 	bl	0 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE>
  8c:	9003      	str	r0, [sp, #12]
  8e:	e7ff      	b.n	90 <main+0x90>
  90:	f240 0100 	movw	r1, #0
  94:	f2c0 0100 	movt	r1, #0
  98:	2208      	movs	r2, #8
  9a:	9803      	ldr	r0, [sp, #12]
  9c:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E>
  a0:	e7ff      	b.n	a2 <main+0xa2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:94

    //  Launch the Druid UI
    //  hello::launch();

    //  Main event loop
    loop {                            //  Loop forever...
  a2:	e7ff      	b.n	a4 <main+0xa4>
  a4:	a809      	add	r0, sp, #36	; 0x24
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:96
        os::eventq_run(               //  Processing events...
            os::eventq_dflt_get()     //  From default event queue.
  a6:	f7ff fffe 	bl	0 <_ZN6mynewt6kernel2os15eventq_dflt_get17h1dc1684b870eee8cE>
  aa:	e7ff      	b.n	22 <main+0x22>
  ac:	f240 0100 	movw	r1, #0
  b0:	f2c0 0100 	movt	r1, #0
  b4:	a809      	add	r0, sp, #36	; 0x24
  b6:	2208      	movs	r2, #8
  b8:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE>
  bc:	9002      	str	r0, [sp, #8]
  be:	e7ff      	b.n	c0 <main+0xc0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:95
        os::eventq_run(               //  Processing events...
  c0:	9802      	ldr	r0, [sp, #8]
  c2:	f7ff fffe 	bl	0 <_ZN6mynewt6kernel2os10eventq_run17h3409829a5a6bbae3E>
  c6:	9001      	str	r0, [sp, #4]
  c8:	e7ff      	b.n	ca <main+0xca>
  ca:	f240 0100 	movw	r1, #0
  ce:	f2c0 0100 	movt	r1, #0
  d2:	2208      	movs	r2, #8
  d4:	9801      	ldr	r0, [sp, #4]
  d6:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E>
  da:	e7ff      	b.n	dc <main+0xdc>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:94
    loop {                            //  Loop forever...
  dc:	e7e2      	b.n	a4 <main+0xa4>

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:105
    //  Never comes here
}

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
   0:	b08a      	sub	sp, #40	; 0x28
   2:	9004      	str	r0, [sp, #16]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:107
    //  Display the filename and line number to the Semihosting Console.
    console::print("panic ");
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	2106      	movs	r1, #6
   e:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  12:	e7ff      	b.n	14 <rust_begin_unwind+0x14>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:108
    if let Some(location) = info.location() {
  14:	9804      	ldr	r0, [sp, #16]
  16:	f7ff fffe 	bl	0 <_ZN4core5panic9PanicInfo8location17h080d51c1ed5f8f03E>
  1a:	9005      	str	r0, [sp, #20]
  1c:	e7ff      	b.n	1e <rust_begin_unwind+0x1e>
  1e:	9805      	ldr	r0, [sp, #20]
  20:	2800      	cmp	r0, #0
  22:	d108      	bne.n	36 <rust_begin_unwind+0x36>
  24:	e7ff      	b.n	26 <rust_begin_unwind+0x26>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:115
        let line = location.line();
        console::print("at ");       console::buffer(&file);
        console::print(" line ");    console::printint(line as i32);
        console::print("\n");        console::flush();
    } else {
        console::print("no loc\n");  console::flush();
  26:	f240 0000 	movw	r0, #0
  2a:	f2c0 0000 	movt	r0, #0
  2e:	2107      	movs	r1, #7
  30:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  34:	e031      	b.n	9a <rust_begin_unwind+0x9a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:108
    if let Some(location) = info.location() {
  36:	9805      	ldr	r0, [sp, #20]
  38:	9006      	str	r0, [sp, #24]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:109
        let file = location.file();
  3a:	9806      	ldr	r0, [sp, #24]
  3c:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4file17hb5b09c8924a65fc3E>
  40:	9108      	str	r1, [sp, #32]
  42:	9007      	str	r0, [sp, #28]
  44:	e7ff      	b.n	46 <rust_begin_unwind+0x46>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:110
        let line = location.line();
  46:	9806      	ldr	r0, [sp, #24]
  48:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4line17h367a930005b08c12E>
  4c:	9009      	str	r0, [sp, #36]	; 0x24
  4e:	e7ff      	b.n	50 <rust_begin_unwind+0x50>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:111
        console::print("at ");       console::buffer(&file);
  50:	f240 0000 	movw	r0, #0
  54:	f2c0 0000 	movt	r0, #0
  58:	2103      	movs	r1, #3
  5a:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  5e:	e7ff      	b.n	60 <rust_begin_unwind+0x60>
  60:	9807      	ldr	r0, [sp, #28]
  62:	9908      	ldr	r1, [sp, #32]
  64:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console6buffer17hdceaf289cb20d56aE>
  68:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:112
        console::print(" line ");    console::printint(line as i32);
  6a:	f240 0000 	movw	r0, #0
  6e:	f2c0 0000 	movt	r0, #0
  72:	2106      	movs	r1, #6
  74:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  78:	e7ff      	b.n	7a <rust_begin_unwind+0x7a>
  7a:	9809      	ldr	r0, [sp, #36]	; 0x24
  7c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console8printint17he4a4f45a616375d0E>
  80:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:113
        console::print("\n");        console::flush();
  82:	f240 0000 	movw	r0, #0
  86:	f2c0 0000 	movt	r0, #0
  8a:	2101      	movs	r1, #1
  8c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  90:	e7ff      	b.n	2 <_ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE+0x2>
  92:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE>
  96:	e7ff      	b.n	98 <rust_begin_unwind+0x98>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:108
    if let Some(location) = info.location() {
  98:	e003      	b.n	a2 <rust_begin_unwind+0xa2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:115
        console::print("no loc\n");  console::flush();
  9a:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE>
  9e:	e7ff      	b.n	a0 <rust_begin_unwind+0xa0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:108
    if let Some(location) = info.location() {
  a0:	e7ff      	b.n	a2 <rust_begin_unwind+0xa2>
_ZN8cortex_m3asm4bkpt17hefd517d21f3e6667E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.1/src/asm.rs:11
/// exception.
#[inline(always)]
pub fn bkpt() {
    match () {
        #[cfg(all(cortex_m, feature = "inline-asm"))]
        () => unsafe { asm!("bkpt" :::: "volatile") },
  a2:	be00      	bkpt	0x0000
rust_begin_unwind():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:118
    }
    //  Pause in the debugger.
    bkpt();
  a4:	e7ff      	b.n	a6 <rust_begin_unwind+0xa6>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:120
    //  Display the payload.
    console::print(info.payload().downcast_ref::<&str>().unwrap());
  a6:	9804      	ldr	r0, [sp, #16]
  a8:	f7ff fffe 	bl	0 <_ZN4core5panic9PanicInfo7payload17h0ba779b66a5d0935E>
  ac:	9003      	str	r0, [sp, #12]
  ae:	9102      	str	r1, [sp, #8]
  b0:	e7ff      	b.n	b2 <rust_begin_unwind+0xb2>
  b2:	9803      	ldr	r0, [sp, #12]
  b4:	9902      	ldr	r1, [sp, #8]
  b6:	f7ff fffe 	bl	0 <_ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE>
  ba:	9001      	str	r0, [sp, #4]
  bc:	e7ff      	b.n	be <rust_begin_unwind+0xbe>
  be:	9801      	ldr	r0, [sp, #4]
  c0:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E>
  c4:	9000      	str	r0, [sp, #0]
  c6:	e7ff      	b.n	c8 <rust_begin_unwind+0xc8>
  c8:	9800      	ldr	r0, [sp, #0]
  ca:	6800      	ldr	r0, [r0, #0]
  cc:	9900      	ldr	r1, [sp, #0]
  ce:	6849      	ldr	r1, [r1, #4]
  d0:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  d4:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:121
    console::print("\n");  console::flush();
  d6:	f240 0000 	movw	r0, #0
  da:	f2c0 0000 	movt	r0, #0
  de:	2101      	movs	r1, #1
  e0:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  e4:	e7ff      	b.n	2 <_ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE+0x2>
  e6:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE>
  ea:	e7ff      	b.n	ec <rust_begin_unwind+0xec>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:123
    //  Loop forever so that device won't restart.
    loop {}
  ec:	e7ff      	b.n	ee <rust_begin_unwind+0xee>
  ee:	e7fe      	b.n	ee <rust_begin_unwind+0xee>

app-4d8274845a53ddea.2a4pw9umk58xgwlr.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2a4pw9umk58xgwlr
00000310 l       .debug_str	00000000 
000002f7 l       .debug_str	00000000 
000002fb l       .debug_str	00000000 
00000303 l       .debug_str	00000000 
00000308 l       .debug_str	00000000 
00000315 l       .debug_str	00000000 
00000323 l       .debug_str	00000000 
00000329 l       .debug_str	00000000 
0000032e l       .debug_str	00000000 
00000333 l       .debug_str	00000000 
00000343 l       .debug_str	00000000 
00000347 l       .debug_str	00000000 
00000353 l       .debug_str	00000000 
00000374 l       .debug_str	00000000 
00000378 l       .debug_str	00000000 
0000037a l       .debug_str	00000000 
00000384 l       .debug_str	00000000 
00000388 l       .debug_str	00000000 
0000038b l       .debug_str	00000000 
00000390 l       .debug_str	00000000 
00000399 l       .debug_str	00000000 
000003a7 l       .debug_str	00000000 
000003b9 l       .debug_str	00000000 
000003cd l       .debug_str	00000000 
000003d1 l       .debug_str	00000000 
000003da l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
0000009a l       .debug_str	00000000 
000000a5 l       .debug_str	00000000 
000000b0 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
000000fb l       .debug_str	00000000 
00000106 l       .debug_str	00000000 
00000113 l       .debug_str	00000000 
0000011f l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
00000144 l       .debug_str	00000000 
00000151 l       .debug_str	00000000 
0000015d l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
0000016d l       .debug_str	00000000 
00000172 l       .debug_str	00000000 
00000176 l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001d2 l       .debug_str	00000000 
000001d5 l       .debug_str	00000000 
000001df l       .debug_str	00000000 
000001e6 l       .debug_str	00000000 
000001ec l       .debug_str	00000000 
000001f2 l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
000001fc l       .debug_str	00000000 
0000023c l       .debug_str	00000000 
00000252 l       .debug_str	00000000 
00000256 l       .debug_str	00000000 
00000259 l       .debug_str	00000000 
0000025d l       .debug_str	00000000 
00000260 l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
00000264 l       .debug_str	00000000 
00000268 l       .debug_str	00000000 
00000290 l       .debug_str	00000000 
000002cb l       .debug_str	00000000 
000002dc l       .debug_str	00000000 
000002e9 l       .debug_str	00000000 
000002ec l       .debug_str	00000000 
000002f3 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.0	00000017 .Lanon.887a3b8264e3693c2283252a41966be9.0
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.1	00000001 .Lanon.887a3b8264e3693c2283252a41966be9.1
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.10	00000005 .Lanon.887a3b8264e3693c2283252a41966be9.10
00000008 l     O .rodata.cst4	00000004 .Lanon.887a3b8264e3693c2283252a41966be9.11
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.12	00000007 .Lanon.887a3b8264e3693c2283252a41966be9.12
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.13	00000006 .Lanon.887a3b8264e3693c2283252a41966be9.13
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.14	00000048 .Lanon.887a3b8264e3693c2283252a41966be9.14
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.2	00000001 .Lanon.887a3b8264e3693c2283252a41966be9.2
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.3	00000001 .Lanon.887a3b8264e3693c2283252a41966be9.3
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.4	00000007 .Lanon.887a3b8264e3693c2283252a41966be9.4
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.5	0000000d .Lanon.887a3b8264e3693c2283252a41966be9.5
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.6	00000003 .Lanon.887a3b8264e3693c2283252a41966be9.6
00000000 l     O .rodata..Lanon.887a3b8264e3693c2283252a41966be9.7	00000005 .Lanon.887a3b8264e3693c2283252a41966be9.7
00000000 l     O .rodata.cst4	00000004 .Lanon.887a3b8264e3693c2283252a41966be9.8
00000004 l     O .rodata.cst4	00000004 .Lanon.887a3b8264e3693c2283252a41966be9.9
00000000 l     F .text._ZN3app11app_network16send_sensor_data17h41316a624f708782E	0000057c _ZN3app11app_network16send_sensor_data17h41316a624f708782E
00000000 l    d  .text._ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE	00000000 .text._ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE
00000000 l    d  .text._ZN3app11app_network16send_sensor_data17h41316a624f708782E	00000000 .text._ZN3app11app_network16send_sensor_data17h41316a624f708782E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE	00000016 .hidden _ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE
00000000         *UND*	00000000 _ZN6mynewt3sys7console10print_strn17h2c52eb0db6b95a22E
00000000         *UND*	00000000 _ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE
00000000         *UND*	00000000 _ZN6mynewt3sys7console8printint17he4a4f45a616375d0E
00000000         *UND*	00000000 _ZN6mynewt4Strn3new17hf600af35cc41cfcbE
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network12prepare_post17h7654ee7983fa3196E
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network13get_device_id17h2e182ec7de577fe8E
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network14do_server_post17hd1ac47b0b902419bE
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network16init_server_post17h98ad08ae8430b4abE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17hd860ae6d2f208509E
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext13value_to_cstr17h7bb35884d5ebf21dE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext20json_set_geolocation17h7007060c89a7f807E
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext20json_set_text_string17h354c2053b966cc25E
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext4fail17he174caca9f02f27fE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context12COAP_CONTEXT17ha404f664f36993b1E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E
00000000         *UND*	00000000 _ZN75_$LT$str$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h7c50cc145c8629caE
00000000         *UND*	00000000 _ZN84_$LT$mynewt..Strn$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h199906e3c870d19cE
00000000         *UND*	00000000 json_helper_close_array
00000000         *UND*	00000000 json_helper_object_array_end_item
00000000         *UND*	00000000 json_helper_object_array_start_item
00000000         *UND*	00000000 json_helper_set_array
00000000         *UND*	00000000 json_helper_set_int
00000000         *UND*	00000000 json_helper_set_text_string
00000000         *UND*	00000000 json_rep_end_root_object
00000000         *UND*	00000000 json_rep_start_root_object



Disassembly of section .text._ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE:

00000000 <_ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE>:
_ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:59
        send_sensor_data(&transmit_value)
    }
}

#[cfg(not(feature = "use_float"))]  //  If floating-point and geolocation are disabled, send sensor data without geolocation
pub fn aggregate_sensor_data(sensor_value: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:61
    //  Transmit sensor value without geolocation and return the result
    send_sensor_data(sensor_value)
   6:	9801      	ldr	r0, [sp, #4]
   8:	f7ff fffe 	bl	0 <_ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE>
   c:	9000      	str	r0, [sp, #0]
   e:	e7ff      	b.n	10 <_ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE+0x10>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:62
}
  10:	9800      	ldr	r0, [sp, #0]
  12:	b002      	add	sp, #8
  14:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app11app_network16send_sensor_data17h41316a624f708782E:

00000000 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E>:
_ZN3app11app_network16send_sensor_data17h41316a624f708782E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:75
/// {"values":[
///   {"key":"t",      "value":1715, "geo": { "lat": ..., "long": ... }},
///   {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"}
/// ]}
/// ```
fn send_sensor_data(val: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
   0:	b580      	push	{r7, lr}
   2:	f5ad 7d16 	sub.w	sp, sp, #600	; 0x258
   6:	9025      	str	r0, [sp, #148]	; 0x94
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:76
    console::print("Rust send_sensor_data: ");
   8:	f240 0000 	movw	r0, #0
   c:	f2c0 0000 	movt	r0, #0
  10:	2117      	movs	r1, #23
  12:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  16:	e7ff      	b.n	18 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x18>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:77
    if let SensorValueType::Uint(i) = val.value {
  18:	9825      	ldr	r0, [sp, #148]	; 0x94
  1a:	6840      	ldr	r0, [r0, #4]
  1c:	2801      	cmp	r0, #1
  1e:	d115      	bne.n	4c <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x4c>
  20:	e7ff      	b.n	22 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x22>
  22:	9825      	ldr	r0, [sp, #148]	; 0x94
  24:	6880      	ldr	r0, [r0, #8]
  26:	9027      	str	r0, [sp, #156]	; 0x9c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:78
        console::print_strn(val.key);
  28:	9825      	ldr	r0, [sp, #148]	; 0x94
  2a:	6800      	ldr	r0, [r0, #0]
  2c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console10print_strn17h2c52eb0db6b95a22E>
  30:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:79
        console::print("=");
  32:	f240 0000 	movw	r0, #0
  36:	f2c0 0000 	movt	r0, #0
  3a:	2101      	movs	r1, #1
  3c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  40:	e7ff      	b.n	42 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x42>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:80
        console::printint(i as i32);
  42:	9827      	ldr	r0, [sp, #156]	; 0x9c
  44:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console8printint17he4a4f45a616375d0E>
  48:	e7ff      	b.n	4a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x4a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:77
    if let SensorValueType::Uint(i) = val.value {
  4a:	e7ff      	b.n	4c <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x4c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:82
    }
    console::print("\n");
  4c:	f240 0000 	movw	r0, #0
  50:	f2c0 0000 	movt	r0, #0
  54:	2101      	movs	r1, #1
  56:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  5a:	e7ff      	b.n	2 <_ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:83
    console::flush(); ////
  5c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5flush17hf9aae4f0cd77d4acE>
  60:	e7ff      	b.n	62 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x62>
  62:	a82f      	add	r0, sp, #188	; 0xbc
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:86

    //  Get a randomly-generated device ID that changes each time we restart the device.
    let device_id = sensor_network::get_device_id() ? ;
  64:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network13get_device_id17h2e182ec7de577fe8E>
  68:	e7ff      	b.n	6a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x6a>
  6a:	a82b      	add	r0, sp, #172	; 0xac
  6c:	a92f      	add	r1, sp, #188	; 0xbc
  6e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E>
  72:	e7ff      	b.n	74 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x74>
  74:	982b      	ldr	r0, [sp, #172]	; 0xac
  76:	2800      	cmp	r0, #0
  78:	d014      	beq.n	a4 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xa4>
  7a:	e7ff      	b.n	7c <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x7c>
  7c:	e000      	b.n	80 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x80>
  7e:	defe      	udf	#254	; 0xfe
  80:	982c      	ldr	r0, [sp, #176]	; 0xb0
  82:	9033      	str	r0, [sp, #204]	; 0xcc
  84:	9833      	ldr	r0, [sp, #204]	; 0xcc
  86:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
  8a:	9024      	str	r0, [sp, #144]	; 0x90
  8c:	e003      	b.n	96 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x96>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:121
    console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=");
    console::print_strn(&device_id); console::print("\n");

    //  The CoAP Background Task will transmit the message in the background.
    Ok(())
}
  8e:	9826      	ldr	r0, [sp, #152]	; 0x98
  90:	f50d 7d16 	add.w	sp, sp, #600	; 0x258
  94:	bd80      	pop	{r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:86
    let device_id = sensor_network::get_device_id() ? ;
  96:	9824      	ldr	r0, [sp, #144]	; 0x90
  98:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
  9c:	9026      	str	r0, [sp, #152]	; 0x98
  9e:	e7ff      	b.n	a0 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xa0>
  a0:	e7ff      	b.n	a2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xa2>
  a2:	e7f4      	b.n	8e <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x8e>
  a4:	982c      	ldr	r0, [sp, #176]	; 0xb0
  a6:	992d      	ldr	r1, [sp, #180]	; 0xb4
  a8:	9a2e      	ldr	r2, [sp, #184]	; 0xb8
  aa:	9236      	str	r2, [sp, #216]	; 0xd8
  ac:	9135      	str	r1, [sp, #212]	; 0xd4
  ae:	9034      	str	r0, [sp, #208]	; 0xd0
  b0:	9834      	ldr	r0, [sp, #208]	; 0xd0
  b2:	9935      	ldr	r1, [sp, #212]	; 0xd4
  b4:	9a36      	ldr	r2, [sp, #216]	; 0xd8
  b6:	922a      	str	r2, [sp, #168]	; 0xa8
  b8:	9129      	str	r1, [sp, #164]	; 0xa4
  ba:	9028      	str	r0, [sp, #160]	; 0xa0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:91
    let rc = sensor_network::init_server_post( strn!(()) ) ? ;  //  `strn!(())` means use default CoAP URI in `syscfg.yml`
  bc:	f240 0100 	movw	r1, #0
  c0:	f2c0 0100 	movt	r1, #0
  c4:	a83c      	add	r0, sp, #240	; 0xf0
  c6:	2201      	movs	r2, #1
  c8:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf600af35cc41cfcbE>
  cc:	e7ff      	b.n	ce <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xce>
  ce:	a83a      	add	r0, sp, #232	; 0xe8
  d0:	a93c      	add	r1, sp, #240	; 0xf0
  d2:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network16init_server_post17h98ad08ae8430b4abE>
  d6:	e7ff      	b.n	d8 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xd8>
  d8:	a838      	add	r0, sp, #224	; 0xe0
  da:	a93a      	add	r1, sp, #232	; 0xe8
  dc:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E>
  e0:	e7ff      	b.n	e2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xe2>
  e2:	f89d 00e0 	ldrb.w	r0, [sp, #224]	; 0xe0
  e6:	07c1      	lsls	r1, r0, #31
  e8:	2900      	cmp	r1, #0
  ea:	d010      	beq.n	10e <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x10e>
  ec:	e7ff      	b.n	ee <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xee>
  ee:	e000      	b.n	f2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xf2>
  f0:	defe      	udf	#254	; 0xfe
  f2:	9839      	ldr	r0, [sp, #228]	; 0xe4
  f4:	903f      	str	r0, [sp, #252]	; 0xfc
  f6:	983f      	ldr	r0, [sp, #252]	; 0xfc
  f8:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
  fc:	9023      	str	r0, [sp, #140]	; 0x8c
  fe:	e7ff      	b.n	100 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x100>
 100:	9823      	ldr	r0, [sp, #140]	; 0x8c
 102:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
 106:	9026      	str	r0, [sp, #152]	; 0x98
 108:	e7ff      	b.n	10a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x10a>
 10a:	e7ff      	b.n	10c <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x10c>
 10c:	e7c9      	b.n	a2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xa2>
 10e:	f89d 00e1 	ldrb.w	r0, [sp, #225]	; 0xe1
 112:	f88d 0103 	strb.w	r0, [sp, #259]	; 0x103
 116:	f89d 0103 	ldrb.w	r0, [sp, #259]	; 0x103
 11a:	f88d 00df 	strb.w	r0, [sp, #223]	; 0xdf
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:94
    if !rc { return Err(MynewtError::SYS_EAGAIN); }
 11e:	f89d 00df 	ldrb.w	r0, [sp, #223]	; 0xdf
 122:	07c0      	lsls	r0, r0, #31
 124:	2800      	cmp	r0, #0
 126:	d005      	beq.n	134 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x134>
 128:	e7ff      	b.n	12a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x12a>
 12a:	a845      	add	r0, sp, #276	; 0x114
 12c:	2132      	movs	r1, #50	; 0x32
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
    let _payload = coap!( @json {        
 12e:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network12prepare_post17h7654ee7983fa3196E>
 132:	e005      	b.n	140 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x140>
 134:	f06f 0005 	mvn.w	r0, #5
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:94
    if !rc { return Err(MynewtError::SYS_EAGAIN); }
 138:	9041      	str	r0, [sp, #260]	; 0x104
 13a:	9841      	ldr	r0, [sp, #260]	; 0x104
 13c:	9026      	str	r0, [sp, #152]	; 0x98
 13e:	e7e5      	b.n	10c <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x10c>
 140:	a843      	add	r0, sp, #268	; 0x10c
 142:	a945      	add	r1, sp, #276	; 0x114
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
    let _payload = coap!( @json {        
 144:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E>
 148:	e7ff      	b.n	14a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x14a>
 14a:	f89d 010c 	ldrb.w	r0, [sp, #268]	; 0x10c
 14e:	07c1      	lsls	r1, r0, #31
 150:	2900      	cmp	r1, #0
 152:	d010      	beq.n	176 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x176>
 154:	e7ff      	b.n	156 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x156>
 156:	e000      	b.n	15a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x15a>
 158:	defe      	udf	#254	; 0xfe
 15a:	9844      	ldr	r0, [sp, #272]	; 0x110
 15c:	9047      	str	r0, [sp, #284]	; 0x11c
 15e:	9847      	ldr	r0, [sp, #284]	; 0x11c
 160:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
 164:	9022      	str	r0, [sp, #136]	; 0x88
 166:	e7ff      	b.n	168 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x168>
 168:	9822      	ldr	r0, [sp, #136]	; 0x88
 16a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
 16e:	9026      	str	r0, [sp, #152]	; 0x98
 170:	e7ff      	b.n	172 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x172>
 172:	e7ff      	b.n	174 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x174>
 174:	e7ca      	b.n	10c <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x10c>
 176:	f89d 010d 	ldrb.w	r0, [sp, #269]	; 0x10d
 17a:	f88d 0123 	strb.w	r0, [sp, #291]	; 0x123
 17e:	f7ff fffe 	bl	0 <json_rep_start_root_object>
 182:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 184:	f240 0000 	movw	r0, #0
 188:	f2c0 0000 	movt	r0, #0
 18c:	9049      	str	r0, [sp, #292]	; 0x124
 18e:	2007      	movs	r0, #7
 190:	904a      	str	r0, [sp, #296]	; 0x128
 192:	f240 0000 	movw	r0, #0
 196:	f2c0 0000 	movt	r0, #0
 19a:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17hd860ae6d2f208509E>
 19e:	9021      	str	r0, [sp, #132]	; 0x84
 1a0:	e7ff      	b.n	1a2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x1a2>
 1a2:	9849      	ldr	r0, [sp, #292]	; 0x124
 1a4:	994a      	ldr	r1, [sp, #296]	; 0x128
 1a6:	907e      	str	r0, [sp, #504]	; 0x1f8
 1a8:	917f      	str	r1, [sp, #508]	; 0x1fc
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17h724e50c34863b638E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/str/mod.rs:2179
 1aa:	987e      	ldr	r0, [sp, #504]	; 0x1f8
 1ac:	997f      	ldr	r1, [sp, #508]	; 0x1fc
 1ae:	9080      	str	r0, [sp, #512]	; 0x200
 1b0:	9181      	str	r1, [sp, #516]	; 0x204
 1b2:	9980      	ldr	r1, [sp, #512]	; 0x200
 1b4:	9a81      	ldr	r2, [sp, #516]	; 0x204
_ZN3app11app_network16send_sensor_data17h41316a624f708782E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 1b6:	9120      	str	r1, [sp, #128]	; 0x80
 1b8:	921f      	str	r2, [sp, #124]	; 0x7c
 1ba:	e7ff      	b.n	1bc <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x1bc>
 1bc:	f240 0000 	movw	r0, #0
 1c0:	f2c0 0000 	movt	r0, #0
 1c4:	9920      	ldr	r1, [sp, #128]	; 0x80
 1c6:	9a1f      	ldr	r2, [sp, #124]	; 0x7c
 1c8:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 1cc:	901e      	str	r0, [sp, #120]	; 0x78
 1ce:	e7ff      	b.n	1d0 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x1d0>
 1d0:	9821      	ldr	r0, [sp, #132]	; 0x84
 1d2:	991e      	ldr	r1, [sp, #120]	; 0x78
 1d4:	f7ff fffe 	bl	0 <json_helper_set_array>
 1d8:	e7ff      	b.n	1da <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x1da>
 1da:	9825      	ldr	r0, [sp, #148]	; 0x94
 1dc:	68c1      	ldr	r1, [r0, #12]
 1de:	6900      	ldr	r0, [r0, #16]
 1e0:	914b      	str	r1, [sp, #300]	; 0x12c
 1e2:	904c      	str	r0, [sp, #304]	; 0x130
 1e4:	9825      	ldr	r0, [sp, #148]	; 0x94
 1e6:	6840      	ldr	r0, [r0, #4]
 1e8:	2801      	cmp	r0, #1
 1ea:	d00c      	beq.n	206 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x206>
 1ec:	e7ff      	b.n	1ee <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x1ee>
 1ee:	2001      	movs	r0, #1
 1f0:	f88d 0193 	strb.w	r0, [sp, #403]	; 0x193
 1f4:	f89d 1193 	ldrb.w	r1, [sp, #403]	; 0x193
 1f8:	f240 0000 	movw	r0, #0
 1fc:	f2c0 0000 	movt	r0, #0
 200:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext4fail17he174caca9f02f27fE>
 204:	e0d7      	b.n	3b6 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x3b6>
 206:	9825      	ldr	r0, [sp, #148]	; 0x94
 208:	6880      	ldr	r0, [r0, #8]
 20a:	904d      	str	r0, [sp, #308]	; 0x134
 20c:	f240 0000 	movw	r0, #0
 210:	f2c0 0000 	movt	r0, #0
 214:	904e      	str	r0, [sp, #312]	; 0x138
 216:	200d      	movs	r0, #13
 218:	904f      	str	r0, [sp, #316]	; 0x13c
 21a:	984e      	ldr	r0, [sp, #312]	; 0x138
 21c:	994f      	ldr	r1, [sp, #316]	; 0x13c
 21e:	9092      	str	r0, [sp, #584]	; 0x248
 220:	9193      	str	r1, [sp, #588]	; 0x24c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17h724e50c34863b638E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/str/mod.rs:2179
 222:	9892      	ldr	r0, [sp, #584]	; 0x248
 224:	9993      	ldr	r1, [sp, #588]	; 0x24c
 226:	9094      	str	r0, [sp, #592]	; 0x250
 228:	9195      	str	r1, [sp, #596]	; 0x254
 22a:	9994      	ldr	r1, [sp, #592]	; 0x250
 22c:	9a95      	ldr	r2, [sp, #596]	; 0x254
_ZN3app11app_network16send_sensor_data17h41316a624f708782E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 22e:	911d      	str	r1, [sp, #116]	; 0x74
 230:	921c      	str	r2, [sp, #112]	; 0x70
 232:	e7ff      	b.n	234 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x234>
 234:	f240 0000 	movw	r0, #0
 238:	f2c0 0000 	movt	r0, #0
 23c:	991d      	ldr	r1, [sp, #116]	; 0x74
 23e:	9a1c      	ldr	r2, [sp, #112]	; 0x70
 240:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 244:	901b      	str	r0, [sp, #108]	; 0x6c
 246:	e7ff      	b.n	248 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x248>
 248:	981b      	ldr	r0, [sp, #108]	; 0x6c
 24a:	f7ff fffe 	bl	0 <json_helper_object_array_start_item>
 24e:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 250:	f240 0000 	movw	r0, #0
 254:	f2c0 0000 	movt	r0, #0
 258:	2103      	movs	r1, #3
 25a:	f7ff fffe 	bl	0 <_ZN75_$LT$str$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h7c50cc145c8629caE>
 25e:	901a      	str	r0, [sp, #104]	; 0x68
 260:	9119      	str	r1, [sp, #100]	; 0x64
 262:	e7ff      	b.n	264 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x264>
 264:	981a      	ldr	r0, [sp, #104]	; 0x68
 266:	9050      	str	r0, [sp, #320]	; 0x140
 268:	9919      	ldr	r1, [sp, #100]	; 0x64
 26a:	9151      	str	r1, [sp, #324]	; 0x144
 26c:	9a25      	ldr	r2, [sp, #148]	; 0x94
 26e:	6810      	ldr	r0, [r2, #0]
 270:	f7ff fffe 	bl	0 <_ZN84_$LT$mynewt..Strn$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h199906e3c870d19cE>
 274:	9018      	str	r0, [sp, #96]	; 0x60
 276:	9117      	str	r1, [sp, #92]	; 0x5c
 278:	e7ff      	b.n	27a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x27a>
 27a:	9818      	ldr	r0, [sp, #96]	; 0x60
 27c:	9052      	str	r0, [sp, #328]	; 0x148
 27e:	9917      	ldr	r1, [sp, #92]	; 0x5c
 280:	9153      	str	r1, [sp, #332]	; 0x14c
 282:	f240 0000 	movw	r0, #0
 286:	f2c0 0000 	movt	r0, #0
 28a:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17hd860ae6d2f208509E>
 28e:	9016      	str	r0, [sp, #88]	; 0x58
 290:	e7ff      	b.n	292 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x292>
 292:	9950      	ldr	r1, [sp, #320]	; 0x140
 294:	9a51      	ldr	r2, [sp, #324]	; 0x144
 296:	f240 0000 	movw	r0, #0
 29a:	f2c0 0000 	movt	r0, #0
 29e:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 2a2:	9015      	str	r0, [sp, #84]	; 0x54
 2a4:	e7ff      	b.n	2a6 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2a6>
 2a6:	9952      	ldr	r1, [sp, #328]	; 0x148
 2a8:	9a53      	ldr	r2, [sp, #332]	; 0x14c
 2aa:	f240 0000 	movw	r0, #0
 2ae:	f2c0 0000 	movt	r0, #0
 2b2:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext13value_to_cstr17h7bb35884d5ebf21dE>
 2b6:	9014      	str	r0, [sp, #80]	; 0x50
 2b8:	e7ff      	b.n	2ba <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2ba>
 2ba:	9816      	ldr	r0, [sp, #88]	; 0x58
 2bc:	9915      	ldr	r1, [sp, #84]	; 0x54
 2be:	9a14      	ldr	r2, [sp, #80]	; 0x50
 2c0:	f7ff fffe 	bl	0 <json_helper_set_text_string>
 2c4:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 2c6:	f240 0000 	movw	r0, #0
 2ca:	f2c0 0000 	movt	r0, #0
 2ce:	2105      	movs	r1, #5
 2d0:	f7ff fffe 	bl	0 <_ZN75_$LT$str$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h7c50cc145c8629caE>
 2d4:	9013      	str	r0, [sp, #76]	; 0x4c
 2d6:	9112      	str	r1, [sp, #72]	; 0x48
 2d8:	e7ff      	b.n	2da <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2da>
 2da:	9813      	ldr	r0, [sp, #76]	; 0x4c
 2dc:	9054      	str	r0, [sp, #336]	; 0x150
 2de:	9912      	ldr	r1, [sp, #72]	; 0x48
 2e0:	9155      	str	r1, [sp, #340]	; 0x154
 2e2:	9a4d      	ldr	r2, [sp, #308]	; 0x134
 2e4:	2300      	movs	r3, #0
 2e6:	9357      	str	r3, [sp, #348]	; 0x15c
 2e8:	9256      	str	r2, [sp, #344]	; 0x158
 2ea:	f240 0000 	movw	r0, #0
 2ee:	f2c0 0000 	movt	r0, #0
 2f2:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17hd860ae6d2f208509E>
 2f6:	9011      	str	r0, [sp, #68]	; 0x44
 2f8:	e7ff      	b.n	2fa <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2fa>
 2fa:	9954      	ldr	r1, [sp, #336]	; 0x150
 2fc:	9a55      	ldr	r2, [sp, #340]	; 0x154
 2fe:	f240 0000 	movw	r0, #0
 302:	f2c0 0000 	movt	r0, #0
 306:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 30a:	9010      	str	r0, [sp, #64]	; 0x40
 30c:	e7ff      	b.n	30e <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x30e>
 30e:	9a56      	ldr	r2, [sp, #344]	; 0x158
 310:	9b57      	ldr	r3, [sp, #348]	; 0x15c
 312:	9811      	ldr	r0, [sp, #68]	; 0x44
 314:	9910      	ldr	r1, [sp, #64]	; 0x40
 316:	f7ff fffe 	bl	0 <json_helper_set_int>
 31a:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 31c:	f240 0100 	movw	r1, #0
 320:	f2c0 0100 	movt	r1, #0
 324:	a859      	add	r0, sp, #356	; 0x164
 326:	2204      	movs	r2, #4
 328:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf600af35cc41cfcbE>
 32c:	e7ff      	b.n	6 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x6>
 32e:	f240 0100 	movw	r1, #0
 332:	f2c0 0100 	movt	r1, #0
 336:	a85c      	add	r0, sp, #368	; 0x170
 338:	2204      	movs	r2, #4
 33a:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf600af35cc41cfcbE>
 33e:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 340:	f240 0100 	movw	r1, #0
 344:	f2c0 0100 	movt	r1, #0
 348:	a85f      	add	r0, sp, #380	; 0x17c
 34a:	2205      	movs	r2, #5
 34c:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf600af35cc41cfcbE>
 350:	e7ff      	b.n	352 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x352>
 352:	984b      	ldr	r0, [sp, #300]	; 0x12c
 354:	994c      	ldr	r1, [sp, #304]	; 0x130
 356:	466a      	mov	r2, sp
 358:	6051      	str	r1, [r2, #4]
 35a:	6010      	str	r0, [r2, #0]
 35c:	f240 0000 	movw	r0, #0
 360:	f2c0 0000 	movt	r0, #0
 364:	a959      	add	r1, sp, #356	; 0x164
 366:	aa5c      	add	r2, sp, #368	; 0x170
 368:	ab5f      	add	r3, sp, #380	; 0x17c
 36a:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext20json_set_geolocation17h7007060c89a7f807E>
 36e:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 370:	f240 0000 	movw	r0, #0
 374:	f2c0 0000 	movt	r0, #0
 378:	9062      	str	r0, [sp, #392]	; 0x188
 37a:	200d      	movs	r0, #13
 37c:	9063      	str	r0, [sp, #396]	; 0x18c
 37e:	9862      	ldr	r0, [sp, #392]	; 0x188
 380:	9963      	ldr	r1, [sp, #396]	; 0x18c
 382:	908e      	str	r0, [sp, #568]	; 0x238
 384:	918f      	str	r1, [sp, #572]	; 0x23c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17h724e50c34863b638E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/str/mod.rs:2179
 386:	988e      	ldr	r0, [sp, #568]	; 0x238
 388:	998f      	ldr	r1, [sp, #572]	; 0x23c
 38a:	9090      	str	r0, [sp, #576]	; 0x240
 38c:	9191      	str	r1, [sp, #580]	; 0x244
 38e:	9990      	ldr	r1, [sp, #576]	; 0x240
 390:	9a91      	ldr	r2, [sp, #580]	; 0x244
_ZN3app11app_network16send_sensor_data17h41316a624f708782E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 392:	910f      	str	r1, [sp, #60]	; 0x3c
 394:	920e      	str	r2, [sp, #56]	; 0x38
 396:	e7ff      	b.n	398 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x398>
 398:	f240 0000 	movw	r0, #0
 39c:	f2c0 0000 	movt	r0, #0
 3a0:	990f      	ldr	r1, [sp, #60]	; 0x3c
 3a2:	9a0e      	ldr	r2, [sp, #56]	; 0x38
 3a4:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 3a8:	900d      	str	r0, [sp, #52]	; 0x34
 3aa:	e7ff      	b.n	3ac <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x3ac>
 3ac:	980d      	ldr	r0, [sp, #52]	; 0x34
 3ae:	f7ff fffe 	bl	0 <json_helper_object_array_end_item>
 3b2:	e7ff      	b.n	3b4 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x3b4>
 3b4:	e000      	b.n	3b8 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x3b8>
 3b6:	e7ff      	b.n	3b8 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x3b8>
 3b8:	f240 0000 	movw	r0, #0
 3bc:	f2c0 0000 	movt	r0, #0
 3c0:	9065      	str	r0, [sp, #404]	; 0x194
 3c2:	200d      	movs	r0, #13
 3c4:	9066      	str	r0, [sp, #408]	; 0x198
 3c6:	9865      	ldr	r0, [sp, #404]	; 0x194
 3c8:	9966      	ldr	r1, [sp, #408]	; 0x198
 3ca:	908a      	str	r0, [sp, #552]	; 0x228
 3cc:	918b      	str	r1, [sp, #556]	; 0x22c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17h724e50c34863b638E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/str/mod.rs:2179
 3ce:	988a      	ldr	r0, [sp, #552]	; 0x228
 3d0:	998b      	ldr	r1, [sp, #556]	; 0x22c
 3d2:	908c      	str	r0, [sp, #560]	; 0x230
 3d4:	918d      	str	r1, [sp, #564]	; 0x234
 3d6:	998c      	ldr	r1, [sp, #560]	; 0x230
 3d8:	9a8d      	ldr	r2, [sp, #564]	; 0x234
_ZN3app11app_network16send_sensor_data17h41316a624f708782E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 3da:	910c      	str	r1, [sp, #48]	; 0x30
 3dc:	920b      	str	r2, [sp, #44]	; 0x2c
 3de:	e7ff      	b.n	3e0 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x3e0>
 3e0:	f240 0000 	movw	r0, #0
 3e4:	f2c0 0000 	movt	r0, #0
 3e8:	990c      	ldr	r1, [sp, #48]	; 0x30
 3ea:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 3ec:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 3f0:	900a      	str	r0, [sp, #40]	; 0x28
 3f2:	e7ff      	b.n	3f4 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x3f4>
 3f4:	980a      	ldr	r0, [sp, #40]	; 0x28
 3f6:	f7ff fffe 	bl	0 <json_helper_object_array_start_item>
 3fa:	e7ff      	b.n	a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0xa>
 3fc:	f240 0100 	movw	r1, #0
 400:	f2c0 0100 	movt	r1, #0
 404:	a868      	add	r0, sp, #416	; 0x1a0
 406:	2204      	movs	r2, #4
 408:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf600af35cc41cfcbE>
 40c:	e7ff      	b.n	40e <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x40e>
 40e:	a868      	add	r0, sp, #416	; 0x1a0
 410:	9067      	str	r0, [sp, #412]	; 0x19c
 412:	f240 0100 	movw	r1, #0
 416:	f2c0 0100 	movt	r1, #0
 41a:	a86c      	add	r0, sp, #432	; 0x1b0
 41c:	2207      	movs	r2, #7
 41e:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf600af35cc41cfcbE>
 422:	e7ff      	b.n	424 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x424>
 424:	a86c      	add	r0, sp, #432	; 0x1b0
 426:	906b      	str	r0, [sp, #428]	; 0x1ac
 428:	9967      	ldr	r1, [sp, #412]	; 0x19c
 42a:	9a6b      	ldr	r2, [sp, #428]	; 0x1ac
 42c:	f240 0000 	movw	r0, #0
 430:	f2c0 0000 	movt	r0, #0
 434:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext20json_set_text_string17h354c2053b966cc25E>
 438:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 43a:	f240 0100 	movw	r1, #0
 43e:	f2c0 0100 	movt	r1, #0
 442:	a870      	add	r0, sp, #448	; 0x1c0
 444:	2206      	movs	r2, #6
 446:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf600af35cc41cfcbE>
 44a:	e7ff      	b.n	44c <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x44c>
 44c:	a870      	add	r0, sp, #448	; 0x1c0
 44e:	906f      	str	r0, [sp, #444]	; 0x1bc
 450:	a828      	add	r0, sp, #160	; 0xa0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:107
        "device": &device_id,
 452:	9073      	str	r0, [sp, #460]	; 0x1cc
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
    let _payload = coap!( @json {        
 454:	996f      	ldr	r1, [sp, #444]	; 0x1bc
 456:	9a73      	ldr	r2, [sp, #460]	; 0x1cc
 458:	f240 0000 	movw	r0, #0
 45c:	f2c0 0000 	movt	r0, #0
 460:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext20json_set_text_string17h354c2053b966cc25E>
 464:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 466:	f240 0000 	movw	r0, #0
 46a:	f2c0 0000 	movt	r0, #0
 46e:	9074      	str	r0, [sp, #464]	; 0x1d0
 470:	200d      	movs	r0, #13
 472:	9075      	str	r0, [sp, #468]	; 0x1d4
 474:	9874      	ldr	r0, [sp, #464]	; 0x1d0
 476:	9975      	ldr	r1, [sp, #468]	; 0x1d4
 478:	9086      	str	r0, [sp, #536]	; 0x218
 47a:	9187      	str	r1, [sp, #540]	; 0x21c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17h724e50c34863b638E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/str/mod.rs:2179
 47c:	9886      	ldr	r0, [sp, #536]	; 0x218
 47e:	9987      	ldr	r1, [sp, #540]	; 0x21c
 480:	9088      	str	r0, [sp, #544]	; 0x220
 482:	9189      	str	r1, [sp, #548]	; 0x224
 484:	9988      	ldr	r1, [sp, #544]	; 0x220
 486:	9a89      	ldr	r2, [sp, #548]	; 0x224
_ZN3app11app_network16send_sensor_data17h41316a624f708782E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 488:	9109      	str	r1, [sp, #36]	; 0x24
 48a:	9208      	str	r2, [sp, #32]
 48c:	e7ff      	b.n	48e <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x48e>
 48e:	f240 0000 	movw	r0, #0
 492:	f2c0 0000 	movt	r0, #0
 496:	9909      	ldr	r1, [sp, #36]	; 0x24
 498:	9a08      	ldr	r2, [sp, #32]
 49a:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 49e:	9007      	str	r0, [sp, #28]
 4a0:	e7ff      	b.n	4a2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x4a2>
 4a2:	9807      	ldr	r0, [sp, #28]
 4a4:	f7ff fffe 	bl	0 <json_helper_object_array_end_item>
 4a8:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 4aa:	f240 0000 	movw	r0, #0
 4ae:	f2c0 0000 	movt	r0, #0
 4b2:	9076      	str	r0, [sp, #472]	; 0x1d8
 4b4:	2007      	movs	r0, #7
 4b6:	9077      	str	r0, [sp, #476]	; 0x1dc
 4b8:	f240 0000 	movw	r0, #0
 4bc:	f2c0 0000 	movt	r0, #0
 4c0:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17hd860ae6d2f208509E>
 4c4:	9006      	str	r0, [sp, #24]
 4c6:	e7ff      	b.n	4c8 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x4c8>
 4c8:	9876      	ldr	r0, [sp, #472]	; 0x1d8
 4ca:	9977      	ldr	r1, [sp, #476]	; 0x1dc
 4cc:	9082      	str	r0, [sp, #520]	; 0x208
 4ce:	9183      	str	r1, [sp, #524]	; 0x20c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17h724e50c34863b638E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/str/mod.rs:2179
 4d0:	9882      	ldr	r0, [sp, #520]	; 0x208
 4d2:	9983      	ldr	r1, [sp, #524]	; 0x20c
 4d4:	9084      	str	r0, [sp, #528]	; 0x210
 4d6:	9185      	str	r1, [sp, #532]	; 0x214
 4d8:	9984      	ldr	r1, [sp, #528]	; 0x210
 4da:	9a85      	ldr	r2, [sp, #532]	; 0x214
_ZN3app11app_network16send_sensor_data17h41316a624f708782E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 4dc:	9105      	str	r1, [sp, #20]
 4de:	9204      	str	r2, [sp, #16]
 4e0:	e7ff      	b.n	4e2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x4e2>
 4e2:	f240 0000 	movw	r0, #0
 4e6:	f2c0 0000 	movt	r0, #0
 4ea:	9905      	ldr	r1, [sp, #20]
 4ec:	9a04      	ldr	r2, [sp, #16]
 4ee:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h4b65f25f6307d11fE>
 4f2:	9003      	str	r0, [sp, #12]
 4f4:	e7ff      	b.n	4f6 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x4f6>
 4f6:	9806      	ldr	r0, [sp, #24]
 4f8:	9903      	ldr	r1, [sp, #12]
 4fa:	f7ff fffe 	bl	0 <json_helper_close_array>
 4fe:	e7ff      	b.n	2 <json_rep_end_root_object+0x2>
 500:	f7ff fffe 	bl	0 <json_rep_end_root_object>
 504:	e7ff      	b.n	506 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x506>
 506:	a87a      	add	r0, sp, #488	; 0x1e8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:113
    sensor_network::do_server_post() ? ;
 508:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network14do_server_post17hd1ac47b0b902419bE>
 50c:	e7ff      	b.n	50e <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x50e>
 50e:	a878      	add	r0, sp, #480	; 0x1e0
 510:	a97a      	add	r1, sp, #488	; 0x1e8
 512:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E>
 516:	e7ff      	b.n	518 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x518>
 518:	f89d 01e0 	ldrb.w	r0, [sp, #480]	; 0x1e0
 51c:	07c1      	lsls	r1, r0, #31
 51e:	2900      	cmp	r1, #0
 520:	d00f      	beq.n	542 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x542>
 522:	e7ff      	b.n	524 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x524>
 524:	e000      	b.n	528 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x528>
 526:	defe      	udf	#254	; 0xfe
 528:	9879      	ldr	r0, [sp, #484]	; 0x1e4
 52a:	907c      	str	r0, [sp, #496]	; 0x1f0
 52c:	987c      	ldr	r0, [sp, #496]	; 0x1f0
 52e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
 532:	9002      	str	r0, [sp, #8]
 534:	e7ff      	b.n	536 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x536>
 536:	9802      	ldr	r0, [sp, #8]
 538:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
 53c:	9026      	str	r0, [sp, #152]	; 0x98
 53e:	e7ff      	b.n	540 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x540>
 540:	e618      	b.n	174 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x174>
 542:	f89d 01e1 	ldrb.w	r0, [sp, #481]	; 0x1e1
 546:	f88d 01f7 	strb.w	r0, [sp, #503]	; 0x1f7
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:116
    console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=");
 54a:	f240 0000 	movw	r0, #0
 54e:	f2c0 0000 	movt	r0, #0
 552:	2148      	movs	r1, #72	; 0x48
 554:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
 558:	e7ff      	b.n	55a <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x55a>
 55a:	a828      	add	r0, sp, #160	; 0xa0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:117
    console::print_strn(&device_id); console::print("\n");
 55c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console10print_strn17h2c52eb0db6b95a22E>
 560:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x2>
 562:	f240 0000 	movw	r0, #0
 566:	f2c0 0000 	movt	r0, #0
 56a:	2101      	movs	r1, #1
 56c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
 570:	e7ff      	b.n	572 <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x572>
 572:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:120
    Ok(())
 574:	9026      	str	r0, [sp, #152]	; 0x98
 576:	2001      	movs	r0, #1
 578:	9026      	str	r0, [sp, #152]	; 0x98
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:121
}
 57a:	e588      	b.n	8e <_ZN3app11app_network16send_sensor_data17h41316a624f708782E+0x8e>

app-4d8274845a53ddea.2qu1gk0h5ngjdzom.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2qu1gk0h5ngjdzom
000009a7 l       .debug_str	00000000 
0000091e l       .debug_str	00000000 
00000929 l       .debug_str	00000000 
00000930 l       .debug_str	00000000 
00000936 l       .debug_str	00000000 
0000093a l       .debug_str	00000000 
0000093e l       .debug_str	00000000 
00000946 l       .debug_str	00000000 
0000095d l       .debug_str	00000000 
00000981 l       .debug_str	00000000 
0000099d l       .debug_str	00000000 
000009c1 l       .debug_str	00000000 
00000a1f l       .debug_str	00000000 
00000a2a l       .debug_str	00000000 
00000a47 l       .debug_str	00000000 
00000a60 l       .debug_str	00000000 
00000a6a l       .debug_str	00000000 
00000a80 l       .debug_str	00000000 
00000a84 l       .debug_str	00000000 
00000a8a l       .debug_str	00000000 
00000a94 l       .debug_str	00000000 
00000a9f l       .debug_str	00000000 
00000aa8 l       .debug_str	00000000 
00000ab3 l       .debug_str	00000000 
00000abf l       .debug_str	00000000 
00000ac8 l       .debug_str	00000000 
00000acf l       .debug_str	00000000 
00000ad7 l       .debug_str	00000000 
00000adf l       .debug_str	00000000 
00000ae9 l       .debug_str	00000000 
00000aef l       .debug_str	00000000 
00000af6 l       .debug_str	00000000 
00000afd l       .debug_str	00000000 
00000b2a l       .debug_str	00000000 
00000b5f l       .debug_str	00000000 
00000b65 l       .debug_str	00000000 
00000b6b l       .debug_str	00000000 
00000b7a l       .debug_str	00000000 
00000b8a l       .debug_str	00000000 
00000b9a l       .debug_str	00000000 
00000ba2 l       .debug_str	00000000 
00000bcb l       .debug_str	00000000 
00000c29 l       .debug_str	00000000 
00000c8f l       .debug_str	00000000 
00000c96 l       .debug_str	00000000 
00000c9e l       .debug_str	00000000 
00000ca7 l       .debug_str	00000000 
00000cc5 l       .debug_str	00000000 
00000cd5 l       .debug_str	00000000 
00000ce3 l       .debug_str	00000000 
00000cee l       .debug_str	00000000 
00000cfb l       .debug_str	00000000 
00000d0a l       .debug_str	00000000 
00000d20 l       .debug_str	00000000 
00000d2a l       .debug_str	00000000 
00000d33 l       .debug_str	00000000 
00000d3c l       .debug_str	00000000 
00000d62 l       .debug_str	00000000 
00000d78 l       .debug_str	00000000 
00000d83 l       .debug_str	00000000 
00000d99 l       .debug_str	00000000 
00000da1 l       .debug_str	00000000 
00000dc2 l       .debug_str	00000000 
00000dcb l       .debug_str	00000000 
00000dd4 l       .debug_str	00000000 
00000ddf l       .debug_str	00000000 
00000de9 l       .debug_str	00000000 
00000e10 l       .debug_str	00000000 
00000e28 l       .debug_str	00000000 
00000e32 l       .debug_str	00000000 
00000e55 l       .debug_str	00000000 
00000e5c l       .debug_str	00000000 
00000e61 l       .debug_str	00000000 
00000e88 l       .debug_str	00000000 
00000e8d l       .debug_str	00000000 
00000e93 l       .debug_str	00000000 
00000e99 l       .debug_str	00000000 
00000e9d l       .debug_str	00000000 
00000eaa l       .debug_str	00000000 
00000eb1 l       .debug_str	00000000 
00000eb5 l       .debug_str	00000000 
00000eb7 l       .debug_str	00000000 
00000ebf l       .debug_str	00000000 
00000ec6 l       .debug_str	00000000 
00000ecc l       .debug_str	00000000 
00000ed3 l       .debug_str	00000000 
00000ed9 l       .debug_str	00000000 
00000ede l       .debug_str	00000000 
00000eed l       .debug_str	00000000 
00000efb l       .debug_str	00000000 
00000f05 l       .debug_str	00000000 
00000f0a l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000084 l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a4 l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b0 l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
00000135 l       .debug_str	00000000 
00000140 l       .debug_str	00000000 
00000148 l       .debug_str	00000000 
0000014a l       .debug_str	00000000 
0000014e l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
00000157 l       .debug_str	00000000 
0000015a l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
0000016a l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
00000179 l       .debug_str	00000000 
0000018d l       .debug_str	00000000 
00000193 l       .debug_str	00000000 
0000019d l       .debug_str	00000000 
000001ac l       .debug_str	00000000 
000001e2 l       .debug_str	00000000 
000001e6 l       .debug_str	00000000 
00000214 l       .debug_str	00000000 
00000220 l       .debug_str	00000000 
00000227 l       .debug_str	00000000 
0000022a l       .debug_str	00000000 
00000234 l       .debug_str	00000000 
0000023a l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
00000246 l       .debug_str	00000000 
0000024a l       .debug_str	00000000 
0000024f l       .debug_str	00000000 
00000271 l       .debug_str	00000000 
000002a9 l       .debug_str	00000000 
000002ab l       .debug_str	00000000 
000002b0 l       .debug_str	00000000 
000002b4 l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
000002fb l       .debug_str	00000000 
000002ff l       .debug_str	00000000 
0000030a l       .debug_str	00000000 
00000315 l       .debug_str	00000000 
0000031c l       .debug_str	00000000 
00000333 l       .debug_str	00000000 
0000033b l       .debug_str	00000000 
00000345 l       .debug_str	00000000 
0000035c l       .debug_str	00000000 
00000365 l       .debug_str	00000000 
0000039c l       .debug_str	00000000 
000003a5 l       .debug_str	00000000 
000003a8 l       .debug_str	00000000 
000003b0 l       .debug_str	00000000 
000003b4 l       .debug_str	00000000 
000003bb l       .debug_str	00000000 
000003c3 l       .debug_str	00000000 
000003d7 l       .debug_str	00000000 
0000040a l       .debug_str	00000000 
00000415 l       .debug_str	00000000 
0000044b l       .debug_str	00000000 
00000452 l       .debug_str	00000000 
0000045a l       .debug_str	00000000 
00000465 l       .debug_str	00000000 
00000470 l       .debug_str	00000000 
0000047d l       .debug_str	00000000 
00000488 l       .debug_str	00000000 
00000490 l       .debug_str	00000000 
0000049b l       .debug_str	00000000 
000004a6 l       .debug_str	00000000 
000004b0 l       .debug_str	00000000 
000004bb l       .debug_str	00000000 
000004c6 l       .debug_str	00000000 
000004d3 l       .debug_str	00000000 
000004df l       .debug_str	00000000 
000004ec l       .debug_str	00000000 
000004fa l       .debug_str	00000000 
00000504 l       .debug_str	00000000 
00000511 l       .debug_str	00000000 
0000051d l       .debug_str	00000000 
00000521 l       .debug_str	00000000 
00000524 l       .debug_str	00000000 
00000527 l       .debug_str	00000000 
0000052c l       .debug_str	00000000 
00000532 l       .debug_str	00000000 
00000539 l       .debug_str	00000000 
00000541 l       .debug_str	00000000 
0000054b l       .debug_str	00000000 
0000054e l       .debug_str	00000000 
00000552 l       .debug_str	00000000 
00000559 l       .debug_str	00000000 
00000597 l       .debug_str	00000000 
000005aa l       .debug_str	00000000 
000005ad l       .debug_str	00000000 
000005af l       .debug_str	00000000 
000005d7 l       .debug_str	00000000 
0000061a l       .debug_str	00000000 
00000632 l       .debug_str	00000000 
00000672 l       .debug_str	00000000 
00000687 l       .debug_str	00000000 
000006c1 l       .debug_str	00000000 
000006d0 l       .debug_str	00000000 
0000070f l       .debug_str	00000000 
00000723 l       .debug_str	00000000 
00000727 l       .debug_str	00000000 
0000072a l       .debug_str	00000000 
00000733 l       .debug_str	00000000 
00000738 l       .debug_str	00000000 
00000742 l       .debug_str	00000000 
00000747 l       .debug_str	00000000 
0000074d l       .debug_str	00000000 
00000752 l       .debug_str	00000000 
00000757 l       .debug_str	00000000 
0000075e l       .debug_str	00000000 
00000767 l       .debug_str	00000000 
00000771 l       .debug_str	00000000 
00000778 l       .debug_str	00000000 
0000077e l       .debug_str	00000000 
00000783 l       .debug_str	00000000 
0000078f l       .debug_str	00000000 
00000797 l       .debug_str	00000000 
000007a0 l       .debug_str	00000000 
000007a5 l       .debug_str	00000000 
000007a8 l       .debug_str	00000000 
000007b1 l       .debug_str	00000000 
000007b8 l       .debug_str	00000000 
000007bd l       .debug_str	00000000 
000007c2 l       .debug_str	00000000 
000007c8 l       .debug_str	00000000 
000007ce l       .debug_str	00000000 
000007d8 l       .debug_str	00000000 
000007db l       .debug_str	00000000 
000007e1 l       .debug_str	00000000 
000007eb l       .debug_str	00000000 
000007f3 l       .debug_str	00000000 
000007f9 l       .debug_str	00000000 
000007ff l       .debug_str	00000000 
0000080a l       .debug_str	00000000 
00000813 l       .debug_str	00000000 
00000836 l       .debug_str	00000000 
00000855 l       .debug_str	00000000 
0000087c l       .debug_str	00000000 
00000881 l       .debug_str	00000000 
00000887 l       .debug_str	00000000 
0000088d l       .debug_str	00000000 
0000089c l       .debug_str	00000000 
000008a3 l       .debug_str	00000000 
000008a7 l       .debug_str	00000000 
000008b0 l       .debug_str	00000000 
000008b8 l       .debug_str	00000000 
000008bf l       .debug_str	00000000 
000008cb l       .debug_str	00000000 
000008d7 l       .debug_str	00000000 
000008f0 l       .debug_str	00000000 
000008f5 l       .debug_str	00000000 
00000906 l       .debug_str	00000000 
00000910 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.0	00000012 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.0
00000000 l     O .rodata.cst4	00000004 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.1
00000000 l     O .rodata.cst8	00000008 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.10
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.11	0000000e .Lanon.d38f0977e80ca63c864d2aa29b421bfe.11
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.12	00000013 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.12
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.13	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.13
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.14	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.14
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.15	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.15
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.16	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.16
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.17	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.17
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.18	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.18
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.19	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.19
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.20	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.20
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.21	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.21
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.22	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.22
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.23	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.23
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.24	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.24
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.25	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.25
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.26	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.26
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.27	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.27
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.28	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.28
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.29	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.29
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.30	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.30
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.31	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.31
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.32	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.32
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.33	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.33
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.34	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.34
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.35	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.35
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.36	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.36
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.37	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.37
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.38	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.38
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.39	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.39
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.40	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.40
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.41	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.41
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.42	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.42
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.43	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.43
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.44	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.44
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.45	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.45
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.46	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.46
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.47	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.47
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.48	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.48
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.49	00000007 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.49
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.5	00000018 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.5
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.50	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.50
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.51	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.51
00000008 l     O .rodata.cst8	00000008 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.52
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.53	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.53
00000010 l     O .rodata.cst8	00000008 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.54
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.55	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.55
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.7	00000008 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.7
00000000 l     O .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.9	00000010 .Lanon.d38f0977e80ca63c864d2aa29b421bfe.9
00000000 l     O .bss._ZN3app12touch_sensor10I2C_BUFFER17h6e81e60aa5b55ed7E	00000001 _ZN3app12touch_sensor10I2C_BUFFER17h6e81e60aa5b55ed7E
00000000 l     O .bss._ZN3app12touch_sensor10TOUCH_DATA17h47d06b49cdcf0816E	00000052 _ZN3app12touch_sensor10TOUCH_DATA17h47d06b49cdcf0816E
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_DELAY17hbca791e00971c941E	00000000 _ZN3app12touch_sensor11TOUCH_DELAY17hbca791e00971c941E
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_EVENT17h479a1769235dc879E	00000010 _ZN3app12touch_sensor11TOUCH_EVENT17h479a1769235dc879E
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_RESET17ha37aa8ebf84ee4f2E	00000004 _ZN3app12touch_sensor11TOUCH_RESET17ha37aa8ebf84ee4f2E
00000000 l     F .text._ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E	00000786 _ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E
00000000 l     F .text._ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE	000001d4 _ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE
00000000 l     F .text._ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E	00000056 _ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E
00000000 l     F .text._ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E	00000046 _ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E
00000000 l     O .bss._ZN3app12touch_sensor3buf17hd12d7965a5579593E	0000003f _ZN3app12touch_sensor3buf17hd12d7965a5579593E
00000000 l     O .bss._ZN3app12touch_sensor8I2C_DATA17h66795cea0ebe2e37E	00000008 _ZN3app12touch_sensor8I2C_DATA17h66795cea0ebe2e37E
00000000 l     O .rodata.str.0	00000021 str.0
00000000 l     O .rodata.str.1	0000001c str.1
00000000 l    d  .text._ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE	00000000 .text._ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE
00000000 l    d  .text._ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E	00000000 .text._ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E
00000000 l    d  .text._ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E	00000000 .text._ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E
00000000 l    d  .text._ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E	00000000 .text._ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E
00000000 l    d  .text._ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE	00000000 .text._ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_RESET17ha37aa8ebf84ee4f2E	00000000 .bss._ZN3app12touch_sensor11TOUCH_RESET17ha37aa8ebf84ee4f2E
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_DELAY17hbca791e00971c941E	00000000 .bss._ZN3app12touch_sensor11TOUCH_DELAY17hbca791e00971c941E
00000000 l    d  .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.2	00000000 .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.2
00000000 l    d  .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.3	00000000 .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.3
00000000 l    d  .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.4	00000000 .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.4
00000000 l    d  .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.6	00000000 .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.6
00000000 l    d  .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.8	00000000 .rodata..Lanon.d38f0977e80ca63c864d2aa29b421bfe.8
00000000 l    d  .bss._ZN3app12touch_sensor10TOUCH_DATA17h47d06b49cdcf0816E	00000000 .bss._ZN3app12touch_sensor10TOUCH_DATA17h47d06b49cdcf0816E
00000000 l    d  .bss._ZN3app12touch_sensor3buf17hd12d7965a5579593E	00000000 .bss._ZN3app12touch_sensor3buf17hd12d7965a5579593E
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_EVENT17h479a1769235dc879E	00000000 .bss._ZN3app12touch_sensor11TOUCH_EVENT17h479a1769235dc879E
00000000 l    d  .bss._ZN3app12touch_sensor8I2C_DATA17h66795cea0ebe2e37E	00000000 .bss._ZN3app12touch_sensor8I2C_DATA17h66795cea0ebe2e37E
00000000 l    d  .bss._ZN3app12touch_sensor10I2C_BUFFER17h6e81e60aa5b55ed7E	00000000 .bss._ZN3app12touch_sensor10I2C_BUFFER17h6e81e60aa5b55ed7E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE	0000025c .hidden _ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE
00000000         *UND*	00000000 _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0950914a7634b66E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17h02a93ea43fae82eeE
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17hd2b4a4863fe4229cE
00000000         *UND*	00000000 .hidden _ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E
00000000         *UND*	00000000 _ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h8f3bd0cd949cd295E
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17ha8781b3442265f5fE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17hfff8c41223f8c7cbE
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE
00000000         *UND*	00000000 _ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE
00000000         *UND*	00000000 _ZN4core9panicking5panic17hfdd0eecc44a682f8E
00000000         *UND*	00000000 _ZN4core9panicking9panic_fmt17h43d9d9156d2a3f54E
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE
00000000         *UND*	00000000 _ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h99d4117dd4a31a31E
00000000         *UND*	00000000 _ZN5druid11win_handler12handle_touch17h130ecff193a7bcaaE
00000000         *UND*	00000000 _ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hf288b23b2608be52E
00000000         *UND*	00000000 _ZN6mynewt3hal4GPIO4init17hab49dccac933dc5bE
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE
00000000         *UND*	00000000 _ZN6mynewt6kernel2os15eventq_dflt_get17h1dc1684b870eee8cE
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h8c871956df004589E
00000000         *UND*	00000000 _ZN74_$LT$mynewt..hal..GPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17he82458501cbadd34E
00000000         *UND*	00000000 _ZN74_$LT$mynewt..hal..GPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h39f2ca3fc4f2090cE
00000000         *UND*	00000000 _ZN87_$LT$mynewt..hal..Delay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17hca2e136e682e542aE
00000000         *UND*	00000000 __aeabi_memclr
00000000         *UND*	00000000 __aeabi_memcpy
00000000         *UND*	00000000 hal_gpio_irq_enable
00000000         *UND*	00000000 hal_gpio_irq_init
00000000         *UND*	00000000 hal_i2c_master_read
00000000         *UND*	00000000 hal_i2c_master_write
00000000         *UND*	00000000 os_eventq_put



Disassembly of section .text._ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE:

00000000 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE>:
_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:39
/// ```rust
/// let peripherals = nrf52::Peripherals::take().unwrap();
/// let nfcpins = peripherals.UICR.nfcpins.read().bits();
/// console::print("nfcpins = "); console::printhex(nfcpins as u8); console::print("\n");
/// ```
pub fn start_touch_sensor() -> MynewtResult<()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0bc      	sub	sp, #240	; 0xf0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:40
    console::print("Rust touch sensor\n");
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	2112      	movs	r1, #18
   e:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  12:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:43

    //  Init GPIO for the Reset Pin
    unsafe { TOUCH_RESET.init(TOUCH_RESET_PIN) ? };
  14:	f240 0000 	movw	r0, #0
  18:	f2c0 0000 	movt	r0, #0
  1c:	210a      	movs	r1, #10
  1e:	f7ff fffe 	bl	0 <_ZN6mynewt3hal4GPIO4init17hab49dccac933dc5bE>
  22:	900e      	str	r0, [sp, #56]	; 0x38
  24:	e7ff      	b.n	26 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x26>
  26:	980e      	ldr	r0, [sp, #56]	; 0x38
  28:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h8c871956df004589E>
  2c:	9010      	str	r0, [sp, #64]	; 0x40
  2e:	e7ff      	b.n	30 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x30>
  30:	9810      	ldr	r0, [sp, #64]	; 0x40
  32:	1e41      	subs	r1, r0, #1
  34:	bf18      	it	ne
  36:	2101      	movne	r1, #1
  38:	2801      	cmp	r0, #1
  3a:	d012      	beq.n	62 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x62>
  3c:	e7ff      	b.n	3e <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x3e>
  3e:	e000      	b.n	42 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x42>
  40:	defe      	udf	#254	; 0xfe
  42:	9810      	ldr	r0, [sp, #64]	; 0x40
  44:	9011      	str	r0, [sp, #68]	; 0x44
  46:	9811      	ldr	r0, [sp, #68]	; 0x44
  48:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
  4c:	900d      	str	r0, [sp, #52]	; 0x34
  4e:	e002      	b.n	56 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x56>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:69
    assert_eq!(rc, 0, "IRQ init fail");

    //  Start monitoring for touch controller interrupts
    unsafe { hal::hal_gpio_irq_enable(TOUCH_INTERRUPT_PIN) };
    Ok(())
}
  50:	980f      	ldr	r0, [sp, #60]	; 0x3c
  52:	b03c      	add	sp, #240	; 0xf0
  54:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:43
    unsafe { TOUCH_RESET.init(TOUCH_RESET_PIN) ? };
  56:	980d      	ldr	r0, [sp, #52]	; 0x34
  58:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
  5c:	900f      	str	r0, [sp, #60]	; 0x3c
  5e:	e7ff      	b.n	60 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x60>
  60:	e7f6      	b.n	50 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x50>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:47
        TOUCH_RESET.set_low() ? ;
  62:	f240 0000 	movw	r0, #0
  66:	f2c0 0000 	movt	r0, #0
  6a:	f7ff fffe 	bl	0 <_ZN74_$LT$mynewt..hal..GPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17he82458501cbadd34E>
  6e:	900c      	str	r0, [sp, #48]	; 0x30
  70:	e7ff      	b.n	72 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x72>
  72:	980c      	ldr	r0, [sp, #48]	; 0x30
  74:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h8c871956df004589E>
  78:	9013      	str	r0, [sp, #76]	; 0x4c
  7a:	e7ff      	b.n	7c <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x7c>
  7c:	9813      	ldr	r0, [sp, #76]	; 0x4c
  7e:	1e41      	subs	r1, r0, #1
  80:	bf18      	it	ne
  82:	2101      	movne	r1, #1
  84:	2801      	cmp	r0, #1
  86:	d010      	beq.n	aa <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xaa>
  88:	e7ff      	b.n	8a <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x8a>
  8a:	e000      	b.n	8e <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x8e>
  8c:	defe      	udf	#254	; 0xfe
  8e:	9813      	ldr	r0, [sp, #76]	; 0x4c
  90:	9014      	str	r0, [sp, #80]	; 0x50
  92:	9814      	ldr	r0, [sp, #80]	; 0x50
  94:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
  98:	900b      	str	r0, [sp, #44]	; 0x2c
  9a:	e7ff      	b.n	9c <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x9c>
  9c:	980b      	ldr	r0, [sp, #44]	; 0x2c
  9e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
  a2:	900f      	str	r0, [sp, #60]	; 0x3c
  a4:	e7ff      	b.n	a6 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xa6>
  a6:	e7ff      	b.n	a8 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xa8>
  a8:	e7d2      	b.n	50 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x50>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:48
        TOUCH_DELAY.delay_ms(20);
  aa:	f240 0000 	movw	r0, #0
  ae:	f2c0 0000 	movt	r0, #0
  b2:	2114      	movs	r1, #20
  b4:	f7ff fffe 	bl	0 <_ZN87_$LT$mynewt..hal..Delay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17hca2e136e682e542aE>
  b8:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:49
        TOUCH_RESET.set_high() ? ;
  ba:	f240 0000 	movw	r0, #0
  be:	f2c0 0000 	movt	r0, #0
  c2:	f7ff fffe 	bl	0 <_ZN74_$LT$mynewt..hal..GPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h39f2ca3fc4f2090cE>
  c6:	900a      	str	r0, [sp, #40]	; 0x28
  c8:	e7ff      	b.n	ca <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xca>
  ca:	980a      	ldr	r0, [sp, #40]	; 0x28
  cc:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h8c871956df004589E>
  d0:	9016      	str	r0, [sp, #88]	; 0x58
  d2:	e7ff      	b.n	d4 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xd4>
  d4:	9816      	ldr	r0, [sp, #88]	; 0x58
  d6:	1e41      	subs	r1, r0, #1
  d8:	bf18      	it	ne
  da:	2101      	movne	r1, #1
  dc:	2801      	cmp	r0, #1
  de:	d00f      	beq.n	100 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x100>
  e0:	e7ff      	b.n	e2 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xe2>
  e2:	e000      	b.n	e6 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xe6>
  e4:	defe      	udf	#254	; 0xfe
  e6:	9816      	ldr	r0, [sp, #88]	; 0x58
  e8:	9017      	str	r0, [sp, #92]	; 0x5c
  ea:	9817      	ldr	r0, [sp, #92]	; 0x5c
  ec:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
  f0:	9009      	str	r0, [sp, #36]	; 0x24
  f2:	e7ff      	b.n	f4 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xf4>
  f4:	9809      	ldr	r0, [sp, #36]	; 0x24
  f6:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
  fa:	900f      	str	r0, [sp, #60]	; 0x3c
  fc:	e7ff      	b.n	fe <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xfe>
  fe:	e7d3      	b.n	a8 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0xa8>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:50
        TOUCH_DELAY.delay_ms(200); TOUCH_DELAY.delay_ms(200);    
 100:	f240 0000 	movw	r0, #0
 104:	f2c0 0000 	movt	r0, #0
 108:	21c8      	movs	r1, #200	; 0xc8
 10a:	f7ff fffe 	bl	0 <_ZN87_$LT$mynewt..hal..Delay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17hca2e136e682e542aE>
 10e:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x2>
 110:	f240 0000 	movw	r0, #0
 114:	f2c0 0000 	movt	r0, #0
 118:	21c8      	movs	r1, #200	; 0xc8
 11a:	f7ff fffe 	bl	0 <_ZN87_$LT$mynewt..hal..Delay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17hca2e136e682e542aE>
 11e:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:54
    unsafe { TOUCH_EVENT.ev_cb = Some( touch_event_callback ) };
 120:	f240 0000 	movw	r0, #0
 124:	f2c0 0000 	movt	r0, #0
 128:	9019      	str	r0, [sp, #100]	; 0x64
 12a:	f240 0000 	movw	r0, #0
 12e:	f2c0 0000 	movt	r0, #0
 132:	901a      	str	r0, [sp, #104]	; 0x68
 134:	981a      	ldr	r0, [sp, #104]	; 0x68
 136:	9919      	ldr	r1, [sp, #100]	; 0x64
 138:	6041      	str	r1, [r0, #4]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:59
        Some( touch_interrupt_handler ),  //  Call `touch_interrupt_handler()` upon detecting interrupt
 13a:	f240 0000 	movw	r0, #0
 13e:	f2c0 0000 	movt	r0, #0
 142:	901c      	str	r0, [sp, #112]	; 0x70
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:60
        core::ptr::null_mut(),            //  No arguments for `touch_interrupt_handler()`
 144:	e7ff      	b.n	146 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x146>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:57
    let rc = unsafe { hal::hal_gpio_irq_init(
 146:	991c      	ldr	r1, [sp, #112]	; 0x70
 148:	4668      	mov	r0, sp
 14a:	2201      	movs	r2, #1
 14c:	6002      	str	r2, [r0, #0]
 14e:	201c      	movs	r0, #28
 150:	2200      	movs	r2, #0
 152:	2302      	movs	r3, #2
 154:	f7ff fffe 	bl	0 <hal_gpio_irq_init>
 158:	901b      	str	r0, [sp, #108]	; 0x6c
 15a:	e7ff      	b.n	15c <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x15c>
 15c:	a81b      	add	r0, sp, #108	; 0x6c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:64
    assert_eq!(rc, 0, "IRQ init fail");
 15e:	901d      	str	r0, [sp, #116]	; 0x74
 160:	f240 0000 	movw	r0, #0
 164:	f2c0 0000 	movt	r0, #0
 168:	901e      	str	r0, [sp, #120]	; 0x78
 16a:	981d      	ldr	r0, [sp, #116]	; 0x74
 16c:	901f      	str	r0, [sp, #124]	; 0x7c
 16e:	981e      	ldr	r0, [sp, #120]	; 0x78
 170:	9020      	str	r0, [sp, #128]	; 0x80
 172:	981f      	ldr	r0, [sp, #124]	; 0x7c
 174:	6800      	ldr	r0, [r0, #0]
 176:	9920      	ldr	r1, [sp, #128]	; 0x80
 178:	6809      	ldr	r1, [r1, #0]
 17a:	4288      	cmp	r0, r1
 17c:	d104      	bne.n	188 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x188>
 17e:	e7ff      	b.n	180 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x180>
 180:	201c      	movs	r0, #28
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:67
    unsafe { hal::hal_gpio_irq_enable(TOUCH_INTERRUPT_PIN) };
 182:	f7ff fffe 	bl	0 <hal_gpio_irq_enable>
 186:	e064      	b.n	252 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x252>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:64
    assert_eq!(rc, 0, "IRQ init fail");
 188:	981f      	ldr	r0, [sp, #124]	; 0x7c
 18a:	9030      	str	r0, [sp, #192]	; 0xc0
 18c:	9820      	ldr	r0, [sp, #128]	; 0x80
 18e:	9031      	str	r0, [sp, #196]	; 0xc4
 190:	4668      	mov	r0, sp
 192:	2100      	movs	r1, #0
 194:	6001      	str	r1, [r0, #0]
 196:	f240 0100 	movw	r1, #0
 19a:	f2c0 0100 	movt	r1, #0
 19e:	a832      	add	r0, sp, #200	; 0xc8
 1a0:	2201      	movs	r2, #1
 1a2:	2304      	movs	r3, #4
 1a4:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E>
 1a8:	e7ff      	b.n	1aa <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x1aa>
 1aa:	a830      	add	r0, sp, #192	; 0xc0
 1ac:	902d      	str	r0, [sp, #180]	; 0xb4
 1ae:	a831      	add	r0, sp, #196	; 0xc4
 1b0:	902e      	str	r0, [sp, #184]	; 0xb8
 1b2:	a832      	add	r0, sp, #200	; 0xc8
 1b4:	902f      	str	r0, [sp, #188]	; 0xbc
 1b6:	982d      	ldr	r0, [sp, #180]	; 0xb4
 1b8:	9038      	str	r0, [sp, #224]	; 0xe0
 1ba:	982e      	ldr	r0, [sp, #184]	; 0xb8
 1bc:	9039      	str	r0, [sp, #228]	; 0xe4
 1be:	982f      	ldr	r0, [sp, #188]	; 0xbc
 1c0:	903a      	str	r0, [sp, #232]	; 0xe8
 1c2:	9838      	ldr	r0, [sp, #224]	; 0xe0
 1c4:	f240 0100 	movw	r1, #0
 1c8:	f2c0 0100 	movt	r1, #0
 1cc:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h02a93ea43fae82eeE>
 1d0:	9008      	str	r0, [sp, #32]
 1d2:	9107      	str	r1, [sp, #28]
 1d4:	e7ff      	b.n	1d6 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x1d6>
 1d6:	9839      	ldr	r0, [sp, #228]	; 0xe4
 1d8:	f240 0100 	movw	r1, #0
 1dc:	f2c0 0100 	movt	r1, #0
 1e0:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h02a93ea43fae82eeE>
 1e4:	9006      	str	r0, [sp, #24]
 1e6:	9105      	str	r1, [sp, #20]
 1e8:	e7ff      	b.n	1ea <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x1ea>
 1ea:	983a      	ldr	r0, [sp, #232]	; 0xe8
 1ec:	f240 0100 	movw	r1, #0
 1f0:	f2c0 0100 	movt	r1, #0
 1f4:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17hd2b4a4863fe4229cE>
 1f8:	9004      	str	r0, [sp, #16]
 1fa:	9103      	str	r1, [sp, #12]
 1fc:	e7ff      	b.n	1fe <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x1fe>
 1fe:	9808      	ldr	r0, [sp, #32]
 200:	9027      	str	r0, [sp, #156]	; 0x9c
 202:	9907      	ldr	r1, [sp, #28]
 204:	9128      	str	r1, [sp, #160]	; 0xa0
 206:	9a06      	ldr	r2, [sp, #24]
 208:	9229      	str	r2, [sp, #164]	; 0xa4
 20a:	9b05      	ldr	r3, [sp, #20]
 20c:	932a      	str	r3, [sp, #168]	; 0xa8
 20e:	f8dd c010 	ldr.w	ip, [sp, #16]
 212:	f8cd c0ac 	str.w	ip, [sp, #172]	; 0xac
 216:	f8dd e00c 	ldr.w	lr, [sp, #12]
 21a:	f8cd e0b0 	str.w	lr, [sp, #176]	; 0xb0
 21e:	466c      	mov	r4, sp
 220:	2503      	movs	r5, #3
 222:	6025      	str	r5, [r4, #0]
 224:	f240 0100 	movw	r1, #0
 228:	f2c0 0100 	movt	r1, #0
 22c:	a821      	add	r0, sp, #132	; 0x84
 22e:	ab27      	add	r3, sp, #156	; 0x9c
 230:	462a      	mov	r2, r5
 232:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h191b6698b6ecf572E>
 236:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x2>
 238:	f240 0000 	movw	r0, #0
 23c:	f2c0 0000 	movt	r0, #0
 240:	903b      	str	r0, [sp, #236]	; 0xec
 242:	993b      	ldr	r1, [sp, #236]	; 0xec
 244:	9102      	str	r1, [sp, #8]
 246:	e7ff      	b.n	248 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x248>
 248:	a821      	add	r0, sp, #132	; 0x84
 24a:	9902      	ldr	r1, [sp, #8]
 24c:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h43d9d9156d2a3f54E>
 250:	defe      	udf	#254	; 0xfe
 252:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:68
    Ok(())
 254:	900f      	str	r0, [sp, #60]	; 0x3c
 256:	2001      	movs	r0, #1
 258:	900f      	str	r0, [sp, #60]	; 0x3c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:69
}
 25a:	e6f9      	b.n	50 <_ZN3app12touch_sensor18start_touch_sensor17h29bebe55f6e6bbceE+0x50>

Disassembly of section .text._ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E:

00000000 <_ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E>:
_ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:72

/// Interrupt handler for the touch controller, triggered when a touch is detected
extern "C" fn touch_interrupt_handler(arg: *mut core::ffi::c_void) {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	9001      	str	r0, [sp, #4]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:74
    //  We forward a touch event to the Default Event Queue for deferred processing.  Don't do any processing here.
    unsafe { TOUCH_EVENT.ev_arg = arg };
   6:	9801      	ldr	r0, [sp, #4]
   8:	f240 0100 	movw	r1, #0
   c:	f2c0 0100 	movt	r1, #0
  10:	9102      	str	r1, [sp, #8]
  12:	9902      	ldr	r1, [sp, #8]
  14:	6088      	str	r0, [r1, #8]
  16:	a804      	add	r0, sp, #16
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:76
    //  Fetch the Default Event Queue. TODO: Use dedicated Event Queue for higher priority processing.
    let queue = os::eventq_dflt_get()
  18:	f7ff fffe 	bl	0 <_ZN6mynewt6kernel2os15eventq_dflt_get17h1dc1684b870eee8cE>
  1c:	e7ff      	b.n	2 <_ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E+0x2>
  1e:	f240 0100 	movw	r1, #0
  22:	f2c0 0100 	movt	r1, #0
  26:	a804      	add	r0, sp, #16
  28:	2208      	movs	r2, #8
  2a:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE>
  2e:	9003      	str	r0, [sp, #12]
  30:	e7ff      	b.n	32 <_ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E+0x32>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:78
        .expect("GET fail");
	unsafe { os::os_eventq_put(queue, &mut TOUCH_EVENT) };  //  Trigger the callback function `touch_event_callback()`
  32:	9803      	ldr	r0, [sp, #12]
  34:	f240 0100 	movw	r1, #0
  38:	f2c0 0100 	movt	r1, #0
  3c:	f7ff fffe 	bl	0 <os_eventq_put>
  40:	e7ff      	b.n	42 <_ZN3app12touch_sensor23touch_interrupt_handler17ha64fbb1a717705f4E+0x42>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:79
}
  42:	b006      	add	sp, #24
  44:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E:

00000000 <_ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E>:
_ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:82

/// Callback for the touch event that is triggered when a touch is detected
extern "C" fn touch_event_callback(_event: *mut os_event) {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	9001      	str	r0, [sp, #4]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:86
    //  console::printhex(unsafe { os::os_time_get() } as u8); console::print(" touch\n");
    unsafe { 
        //  Fetch the touch data from the touch controller
        read_touchdata(&mut TOUCH_DATA)
   6:	f240 0000 	movw	r0, #0
   a:	f2c0 0000 	movt	r0, #0
   e:	f7ff fffe 	bl	0 <_ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E>
  12:	9000      	str	r0, [sp, #0]
  14:	e7ff      	b.n	16 <_ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E+0x16>
  16:	f240 0100 	movw	r1, #0
  1a:	f2c0 0100 	movt	r1, #0
  1e:	220e      	movs	r2, #14
  20:	9800      	ldr	r0, [sp, #0]
  22:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E>
  26:	e7ff      	b.n	2 <_ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:88
            .expect("touchdata fail");
        let x = TOUCH_DATA.touches[0].x;
  28:	f240 0000 	movw	r0, #0
  2c:	f2c0 0000 	movt	r0, #0
  30:	9003      	str	r0, [sp, #12]
  32:	9903      	ldr	r1, [sp, #12]
  34:	8809      	ldrh	r1, [r1, #0]
  36:	f8ad 100a 	strh.w	r1, [sp, #10]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:89
        let y = TOUCH_DATA.touches[0].y;
  3a:	9005      	str	r0, [sp, #20]
  3c:	9805      	ldr	r0, [sp, #20]
  3e:	8840      	ldrh	r0, [r0, #2]
  40:	f8ad 0012 	strh.w	r0, [sp, #18]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:92

        //  Handle the touch data in the UI        
        druid::handle_touch(x, y);
  44:	f8bd 1012 	ldrh.w	r1, [sp, #18]
  48:	f8bd 000a 	ldrh.w	r0, [sp, #10]
  4c:	f7ff fffe 	bl	0 <_ZN5druid11win_handler12handle_touch17h130ecff193a7bcaaE>
  50:	e7ff      	b.n	52 <_ZN3app12touch_sensor20touch_event_callback17h82f2fc97a8acae65E+0x52>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:101
    }
    //  Disable the console output because it slows down the rendering
    //  console::printint(unsafe { TOUCH_DATA.touches[0].x } as i32); console::print(", ");
    //  console::printint(unsafe { TOUCH_DATA.touches[0].y } as i32); console::print("\n");
    //  console::flush();   
}
  52:	b006      	add	sp, #24
  54:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E:

00000000 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E>:
_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:108
/// Touch data will be populated here
static mut TOUCH_DATA: TouchEventInfo = fill_zero!(TouchEventInfo);

/// Read touch controller data. This only works when the screen has been tapped and the touch controller wakes up.
/// Ported from https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.c#L407-L466
fn read_touchdata(data: &mut TouchEventInfo) -> MynewtResult<()> {
   0:	b580      	push	{r7, lr}
   2:	b0f0      	sub	sp, #448	; 0x1c0
   4:	902d      	str	r0, [sp, #180]	; 0xb4
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:109
    read_register_range(           //  Read the range of I2C registers...
   6:	4668      	mov	r0, sp
   8:	213f      	movs	r1, #63	; 0x3f
   a:	6001      	str	r1, [r0, #0]
   c:	f240 0300 	movw	r3, #0
  10:	f2c0 0300 	movt	r3, #0
  14:	2015      	movs	r0, #21
  16:	2200      	movs	r2, #0
  18:	912c      	str	r1, [sp, #176]	; 0xb0
  1a:	4611      	mov	r1, r2
  1c:	9a2c      	ldr	r2, [sp, #176]	; 0xb0
  1e:	f7ff fffe 	bl	0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E>
  22:	902b      	str	r0, [sp, #172]	; 0xac
  24:	e7ff      	b.n	26 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x26>
  26:	f240 0100 	movw	r1, #0
  2a:	f2c0 0100 	movt	r1, #0
  2e:	2213      	movs	r2, #19
  30:	982b      	ldr	r0, [sp, #172]	; 0xac
  32:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h47753e0abfe075d6E>
  36:	e7ff      	b.n	38 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x38>
  38:	f50d 7085 	add.w	r0, sp, #266	; 0x10a
  3c:	2152      	movs	r1, #82	; 0x52
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:115
        TOUCH_CONTROLLER_ADDRESS,  //  From the touch controller
        0,                         //  Starting from register 0
        POINT_READ_BUF as u8,      //  Number of registers to read
        unsafe { &mut buf }        //  Save the read data into `buf`
    ).expect("read touchdata fail");
    *data = fill_zero!(TouchEventInfo);
  3e:	902a      	str	r0, [sp, #168]	; 0xa8
  40:	9129      	str	r1, [sp, #164]	; 0xa4
  42:	f7ff fffe 	bl	0 <__aeabi_memclr>
  46:	a82e      	add	r0, sp, #184	; 0xb8
  48:	992a      	ldr	r1, [sp, #168]	; 0xa8
  4a:	9a29      	ldr	r2, [sp, #164]	; 0xa4
  4c:	f7ff fffe 	bl	0 <__aeabi_memcpy>
  50:	e7ff      	b.n	52 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x52>
  52:	982d      	ldr	r0, [sp, #180]	; 0xb4
  54:	a92e      	add	r1, sp, #184	; 0xb8
  56:	2252      	movs	r2, #82	; 0x52
  58:	f7ff fffe 	bl	0 <__aeabi_memcpy>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:116
    data.point_num = unsafe { buf[FT_TOUCH_POINT_NUM] & 0x0F };
  5c:	f240 0100 	movw	r1, #0
  60:	f2c0 0100 	movt	r1, #0
  64:	9157      	str	r1, [sp, #348]	; 0x15c
  66:	9957      	ldr	r1, [sp, #348]	; 0x15c
  68:	7889      	ldrb	r1, [r1, #2]
  6a:	f001 010f 	and.w	r1, r1, #15
  6e:	9a2d      	ldr	r2, [sp, #180]	; 0xb4
  70:	f882 1051 	strb.w	r1, [r2, #81]	; 0x51
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:117
    data.count     = 0;
  74:	992d      	ldr	r1, [sp, #180]	; 0xb4
  76:	2200      	movs	r2, #0
  78:	f881 2050 	strb.w	r2, [r1, #80]	; 0x50
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:120

    //  Populate the first 5 touch points
    for i in 0..CFG_MAX_TOUCH_POINTS {
  7c:	9258      	str	r2, [sp, #352]	; 0x160
  7e:	2105      	movs	r1, #5
  80:	9159      	str	r1, [sp, #356]	; 0x164
  82:	9958      	ldr	r1, [sp, #352]	; 0x160
  84:	9a59      	ldr	r2, [sp, #356]	; 0x164
  86:	9028      	str	r0, [sp, #160]	; 0xa0
  88:	4608      	mov	r0, r1
  8a:	4611      	mov	r1, r2
  8c:	f7ff fffe 	bl	0 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hf288b23b2608be52E>
  90:	9027      	str	r0, [sp, #156]	; 0x9c
  92:	9126      	str	r1, [sp, #152]	; 0x98
  94:	e7ff      	b.n	96 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x96>
  96:	9827      	ldr	r0, [sp, #156]	; 0x9c
  98:	905a      	str	r0, [sp, #360]	; 0x168
  9a:	9926      	ldr	r1, [sp, #152]	; 0x98
  9c:	915b      	str	r1, [sp, #364]	; 0x16c
  9e:	e7ff      	b.n	a0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xa0>
  a0:	a85a      	add	r0, sp, #360	; 0x168
  a2:	f7ff fffe 	bl	0 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h8f3bd0cd949cd295E>
  a6:	915e      	str	r1, [sp, #376]	; 0x178
  a8:	905d      	str	r0, [sp, #372]	; 0x174
  aa:	e7ff      	b.n	ac <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xac>
  ac:	985d      	ldr	r0, [sp, #372]	; 0x174
  ae:	2800      	cmp	r0, #0
  b0:	d001      	beq.n	b6 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xb6>
  b2:	e7ff      	b.n	b4 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xb4>
  b4:	e001      	b.n	ba <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xba>
  b6:	e014      	b.n	e2 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xe2>
  b8:	defe      	udf	#254	; 0xfe
  ba:	985e      	ldr	r0, [sp, #376]	; 0x178
  bc:	905f      	str	r0, [sp, #380]	; 0x17c
  be:	985f      	ldr	r0, [sp, #380]	; 0x17c
  c0:	905c      	str	r0, [sp, #368]	; 0x170
  c2:	985c      	ldr	r0, [sp, #368]	; 0x170
  c4:	9060      	str	r0, [sp, #384]	; 0x180
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:121
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
  c6:	f240 0000 	movw	r0, #0
  ca:	f2c0 0000 	movt	r0, #0
  ce:	9062      	str	r0, [sp, #392]	; 0x188
  d0:	9860      	ldr	r0, [sp, #384]	; 0x180
  d2:	2106      	movs	r1, #6
  d4:	fba1 0100 	umull	r0, r1, r1, r0
  d8:	2900      	cmp	r1, #0
  da:	9025      	str	r0, [sp, #148]	; 0x94
  dc:	f040 81d6 	bne.w	48c <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x48c>
  e0:	e002      	b.n	e8 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xe8>
  e2:	2001      	movs	r0, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:153
            && (data.point_num == 0) {
            break;
        }
    }
    Ok(())
}
  e4:	b070      	add	sp, #448	; 0x1c0
  e6:	bd80      	pop	{r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:121
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
  e8:	9825      	ldr	r0, [sp, #148]	; 0x94
  ea:	1d41      	adds	r1, r0, #5
  ec:	460a      	mov	r2, r1
  ee:	4281      	cmp	r1, r0
  f0:	9224      	str	r2, [sp, #144]	; 0x90
  f2:	f0c0 81d7 	bcc.w	4a4 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x4a4>
  f6:	e7ff      	b.n	f8 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xf8>
  f8:	9824      	ldr	r0, [sp, #144]	; 0x90
  fa:	283e      	cmp	r0, #62	; 0x3e
  fc:	f200 81de 	bhi.w	4bc <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x4bc>
 100:	e7ff      	b.n	102 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x102>
 102:	9862      	ldr	r0, [sp, #392]	; 0x188
 104:	9924      	ldr	r1, [sp, #144]	; 0x90
 106:	5c40      	ldrb	r0, [r0, r1]
 108:	0900      	lsrs	r0, r0, #4
 10a:	9023      	str	r0, [sp, #140]	; 0x8c
 10c:	e7ff      	b.n	10e <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x10e>
 10e:	9823      	ldr	r0, [sp, #140]	; 0x8c
 110:	f88d 0187 	strb.w	r0, [sp, #391]	; 0x187
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:122
        if pointid >= HYN_MAX_ID { break; }
 114:	f89d 1187 	ldrb.w	r1, [sp, #391]	; 0x187
 118:	290e      	cmp	r1, #14
 11a:	d80b      	bhi.n	134 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x134>
 11c:	e7ff      	b.n	11e <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x11e>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:125
        data.count += 1;
 11e:	982d      	ldr	r0, [sp, #180]	; 0xb4
 120:	f890 0050 	ldrb.w	r0, [r0, #80]	; 0x50
 124:	3001      	adds	r0, #1
 126:	b2c1      	uxtb	r1, r0
 128:	4602      	mov	r2, r0
 12a:	4281      	cmp	r1, r0
 12c:	9222      	str	r2, [sp, #136]	; 0x88
 12e:	f040 81ce 	bne.w	4ce <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x4ce>
 132:	e001      	b.n	138 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x138>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:122
        if pointid >= HYN_MAX_ID { break; }
 134:	e7ff      	b.n	136 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x136>
 136:	e7d4      	b.n	e2 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xe2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:125
        data.count += 1;
 138:	982d      	ldr	r0, [sp, #180]	; 0xb4
 13a:	9922      	ldr	r1, [sp, #136]	; 0x88
 13c:	f880 1050 	strb.w	r1, [r0, #80]	; 0x50
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:126
        let x_high = unsafe { buf[HYN_TOUCH_X_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 140:	f240 0000 	movw	r0, #0
 144:	f2c0 0000 	movt	r0, #0
 148:	9064      	str	r0, [sp, #400]	; 0x190
 14a:	9860      	ldr	r0, [sp, #384]	; 0x180
 14c:	2206      	movs	r2, #6
 14e:	fba2 0200 	umull	r0, r2, r2, r0
 152:	2a00      	cmp	r2, #0
 154:	9021      	str	r0, [sp, #132]	; 0x84
 156:	f040 81c6 	bne.w	4e6 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x4e6>
 15a:	e7ff      	b.n	15c <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x15c>
 15c:	9821      	ldr	r0, [sp, #132]	; 0x84
 15e:	1cc1      	adds	r1, r0, #3
 160:	460a      	mov	r2, r1
 162:	4281      	cmp	r1, r0
 164:	9220      	str	r2, [sp, #128]	; 0x80
 166:	f0c0 81ca 	bcc.w	4fe <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x4fe>
 16a:	e7ff      	b.n	16c <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x16c>
 16c:	9820      	ldr	r0, [sp, #128]	; 0x80
 16e:	283e      	cmp	r0, #62	; 0x3e
 170:	f200 81d1 	bhi.w	516 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x516>
 174:	e7ff      	b.n	176 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x176>
 176:	9864      	ldr	r0, [sp, #400]	; 0x190
 178:	9920      	ldr	r1, [sp, #128]	; 0x80
 17a:	5c40      	ldrb	r0, [r0, r1]
 17c:	f000 000f 	and.w	r0, r0, #15
 180:	f8ad 018e 	strh.w	r0, [sp, #398]	; 0x18e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:127
        let x_low  = unsafe { buf[HYN_TOUCH_X_L_POS + HYN_TOUCH_STEP * i] } as u16;
 184:	f240 0000 	movw	r0, #0
 188:	f2c0 0000 	movt	r0, #0
 18c:	9066      	str	r0, [sp, #408]	; 0x198
 18e:	9860      	ldr	r0, [sp, #384]	; 0x180
 190:	2206      	movs	r2, #6
 192:	fba2 0200 	umull	r0, r2, r2, r0
 196:	2a00      	cmp	r2, #0
 198:	901f      	str	r0, [sp, #124]	; 0x7c
 19a:	f040 81c5 	bne.w	528 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x528>
 19e:	e7ff      	b.n	1a0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x1a0>
 1a0:	981f      	ldr	r0, [sp, #124]	; 0x7c
 1a2:	1d01      	adds	r1, r0, #4
 1a4:	460a      	mov	r2, r1
 1a6:	4281      	cmp	r1, r0
 1a8:	921e      	str	r2, [sp, #120]	; 0x78
 1aa:	f0c0 81c9 	bcc.w	540 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x540>
 1ae:	e7ff      	b.n	1b0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x1b0>
 1b0:	981e      	ldr	r0, [sp, #120]	; 0x78
 1b2:	283e      	cmp	r0, #62	; 0x3e
 1b4:	f200 81d0 	bhi.w	558 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x558>
 1b8:	e7ff      	b.n	1ba <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x1ba>
 1ba:	9866      	ldr	r0, [sp, #408]	; 0x198
 1bc:	991e      	ldr	r1, [sp, #120]	; 0x78
 1be:	5c40      	ldrb	r0, [r0, r1]
 1c0:	f8ad 0196 	strh.w	r0, [sp, #406]	; 0x196
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:128
        data.touches[i].x  = (x_high << 8) | x_low;
 1c4:	f8bd 018e 	ldrh.w	r0, [sp, #398]	; 0x18e
 1c8:	0200      	lsls	r0, r0, #8
 1ca:	901d      	str	r0, [sp, #116]	; 0x74
 1cc:	e7ff      	b.n	1ce <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x1ce>
 1ce:	f8bd 0196 	ldrh.w	r0, [sp, #406]	; 0x196
 1d2:	9960      	ldr	r1, [sp, #384]	; 0x180
 1d4:	2909      	cmp	r1, #9
 1d6:	901c      	str	r0, [sp, #112]	; 0x70
 1d8:	911b      	str	r1, [sp, #108]	; 0x6c
 1da:	f200 81c6 	bhi.w	56a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x56a>
 1de:	e7ff      	b.n	1e0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x1e0>
 1e0:	982d      	ldr	r0, [sp, #180]	; 0xb4
 1e2:	991d      	ldr	r1, [sp, #116]	; 0x74
 1e4:	9a1c      	ldr	r2, [sp, #112]	; 0x70
 1e6:	ea41 0302 	orr.w	r3, r1, r2
 1ea:	f8dd c06c 	ldr.w	ip, [sp, #108]	; 0x6c
 1ee:	f820 303c 	strh.w	r3, [r0, ip, lsl #3]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:130
        let y_high = unsafe { buf[HYN_TOUCH_Y_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 1f2:	f240 0000 	movw	r0, #0
 1f6:	f2c0 0000 	movt	r0, #0
 1fa:	9068      	str	r0, [sp, #416]	; 0x1a0
 1fc:	9860      	ldr	r0, [sp, #384]	; 0x180
 1fe:	2306      	movs	r3, #6
 200:	fba3 0300 	umull	r0, r3, r3, r0
 204:	2b00      	cmp	r3, #0
 206:	901a      	str	r0, [sp, #104]	; 0x68
 208:	f040 81b8 	bne.w	57c <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x57c>
 20c:	e7ff      	b.n	20e <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x20e>
 20e:	981a      	ldr	r0, [sp, #104]	; 0x68
 210:	1d41      	adds	r1, r0, #5
 212:	460a      	mov	r2, r1
 214:	4281      	cmp	r1, r0
 216:	9219      	str	r2, [sp, #100]	; 0x64
 218:	f0c0 81bc 	bcc.w	594 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x594>
 21c:	e7ff      	b.n	21e <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x21e>
 21e:	9819      	ldr	r0, [sp, #100]	; 0x64
 220:	283e      	cmp	r0, #62	; 0x3e
 222:	f200 81c3 	bhi.w	5ac <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x5ac>
 226:	e7ff      	b.n	228 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x228>
 228:	9868      	ldr	r0, [sp, #416]	; 0x1a0
 22a:	9919      	ldr	r1, [sp, #100]	; 0x64
 22c:	5c40      	ldrb	r0, [r0, r1]
 22e:	f000 000f 	and.w	r0, r0, #15
 232:	f8ad 019e 	strh.w	r0, [sp, #414]	; 0x19e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:131
        let y_low  = unsafe { buf[HYN_TOUCH_Y_L_POS + HYN_TOUCH_STEP * i] } as u16;
 236:	f240 0000 	movw	r0, #0
 23a:	f2c0 0000 	movt	r0, #0
 23e:	906a      	str	r0, [sp, #424]	; 0x1a8
 240:	9860      	ldr	r0, [sp, #384]	; 0x180
 242:	2206      	movs	r2, #6
 244:	fba2 0200 	umull	r0, r2, r2, r0
 248:	2a00      	cmp	r2, #0
 24a:	9018      	str	r0, [sp, #96]	; 0x60
 24c:	f040 81b7 	bne.w	5be <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x5be>
 250:	e7ff      	b.n	252 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x252>
 252:	9818      	ldr	r0, [sp, #96]	; 0x60
 254:	1d81      	adds	r1, r0, #6
 256:	460a      	mov	r2, r1
 258:	4281      	cmp	r1, r0
 25a:	9217      	str	r2, [sp, #92]	; 0x5c
 25c:	f0c0 81bb 	bcc.w	5d6 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x5d6>
 260:	e7ff      	b.n	262 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x262>
 262:	9817      	ldr	r0, [sp, #92]	; 0x5c
 264:	283e      	cmp	r0, #62	; 0x3e
 266:	f200 81c2 	bhi.w	5ee <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x5ee>
 26a:	e7ff      	b.n	26c <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x26c>
 26c:	986a      	ldr	r0, [sp, #424]	; 0x1a8
 26e:	9917      	ldr	r1, [sp, #92]	; 0x5c
 270:	5c40      	ldrb	r0, [r0, r1]
 272:	f8ad 01a6 	strh.w	r0, [sp, #422]	; 0x1a6
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:132
        data.touches[i].y  = (y_high << 8) | y_low;
 276:	f8bd 019e 	ldrh.w	r0, [sp, #414]	; 0x19e
 27a:	0200      	lsls	r0, r0, #8
 27c:	9016      	str	r0, [sp, #88]	; 0x58
 27e:	e7ff      	b.n	280 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x280>
 280:	f8bd 01a6 	ldrh.w	r0, [sp, #422]	; 0x1a6
 284:	9960      	ldr	r1, [sp, #384]	; 0x180
 286:	2909      	cmp	r1, #9
 288:	9015      	str	r0, [sp, #84]	; 0x54
 28a:	9114      	str	r1, [sp, #80]	; 0x50
 28c:	f200 81b8 	bhi.w	600 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x600>
 290:	e7ff      	b.n	292 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x292>
 292:	982d      	ldr	r0, [sp, #180]	; 0xb4
 294:	9914      	ldr	r1, [sp, #80]	; 0x50
 296:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 29a:	9a16      	ldr	r2, [sp, #88]	; 0x58
 29c:	9b15      	ldr	r3, [sp, #84]	; 0x54
 29e:	ea42 0c03 	orr.w	ip, r2, r3
 2a2:	f8a0 c002 	strh.w	ip, [r0, #2]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:136
            unsafe { buf[HYN_TOUCH_EVENT_POS + HYN_TOUCH_STEP * i] } >> 6;
 2a6:	f240 0000 	movw	r0, #0
 2aa:	f2c0 0000 	movt	r0, #0
 2ae:	906b      	str	r0, [sp, #428]	; 0x1ac
 2b0:	9860      	ldr	r0, [sp, #384]	; 0x180
 2b2:	f04f 0c06 	mov.w	ip, #6
 2b6:	fbac 0c00 	umull	r0, ip, ip, r0
 2ba:	f1bc 0f00 	cmp.w	ip, #0
 2be:	9013      	str	r0, [sp, #76]	; 0x4c
 2c0:	f040 81a7 	bne.w	612 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x612>
 2c4:	e7ff      	b.n	2c6 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x2c6>
 2c6:	9813      	ldr	r0, [sp, #76]	; 0x4c
 2c8:	1cc1      	adds	r1, r0, #3
 2ca:	460a      	mov	r2, r1
 2cc:	4281      	cmp	r1, r0
 2ce:	9212      	str	r2, [sp, #72]	; 0x48
 2d0:	f0c0 81ab 	bcc.w	62a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x62a>
 2d4:	e7ff      	b.n	2d6 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x2d6>
 2d6:	9812      	ldr	r0, [sp, #72]	; 0x48
 2d8:	283e      	cmp	r0, #62	; 0x3e
 2da:	f200 81b2 	bhi.w	642 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x642>
 2de:	e7ff      	b.n	2e0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x2e0>
 2e0:	986b      	ldr	r0, [sp, #428]	; 0x1ac
 2e2:	9912      	ldr	r1, [sp, #72]	; 0x48
 2e4:	5c40      	ldrb	r0, [r0, r1]
 2e6:	0980      	lsrs	r0, r0, #6
 2e8:	9011      	str	r0, [sp, #68]	; 0x44
 2ea:	e7ff      	b.n	2ec <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x2ec>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:135
        data.touches[i].action =
 2ec:	9860      	ldr	r0, [sp, #384]	; 0x180
 2ee:	2809      	cmp	r0, #9
 2f0:	9010      	str	r0, [sp, #64]	; 0x40
 2f2:	f200 81af 	bhi.w	654 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x654>
 2f6:	e7ff      	b.n	2f8 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x2f8>
 2f8:	982d      	ldr	r0, [sp, #180]	; 0xb4
 2fa:	9910      	ldr	r1, [sp, #64]	; 0x40
 2fc:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 300:	9a11      	ldr	r2, [sp, #68]	; 0x44
 302:	7102      	strb	r2, [r0, #4]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:138
            unsafe { buf[HYN_TOUCH_ID_POS    + HYN_TOUCH_STEP * i] } >> 4;
 304:	f240 0000 	movw	r0, #0
 308:	f2c0 0000 	movt	r0, #0
 30c:	906c      	str	r0, [sp, #432]	; 0x1b0
 30e:	9860      	ldr	r0, [sp, #384]	; 0x180
 310:	2306      	movs	r3, #6
 312:	fba3 0300 	umull	r0, r3, r3, r0
 316:	2b00      	cmp	r3, #0
 318:	900f      	str	r0, [sp, #60]	; 0x3c
 31a:	f040 81a4 	bne.w	666 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x666>
 31e:	e7ff      	b.n	320 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x320>
 320:	980f      	ldr	r0, [sp, #60]	; 0x3c
 322:	1d41      	adds	r1, r0, #5
 324:	460a      	mov	r2, r1
 326:	4281      	cmp	r1, r0
 328:	920e      	str	r2, [sp, #56]	; 0x38
 32a:	f0c0 81a8 	bcc.w	67e <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x67e>
 32e:	e7ff      	b.n	330 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x330>
 330:	980e      	ldr	r0, [sp, #56]	; 0x38
 332:	283e      	cmp	r0, #62	; 0x3e
 334:	f200 81af 	bhi.w	696 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x696>
 338:	e7ff      	b.n	33a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x33a>
 33a:	986c      	ldr	r0, [sp, #432]	; 0x1b0
 33c:	990e      	ldr	r1, [sp, #56]	; 0x38
 33e:	5c40      	ldrb	r0, [r0, r1]
 340:	0900      	lsrs	r0, r0, #4
 342:	900d      	str	r0, [sp, #52]	; 0x34
 344:	e7ff      	b.n	346 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x346>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:137
        data.touches[i].finger =
 346:	9860      	ldr	r0, [sp, #384]	; 0x180
 348:	2809      	cmp	r0, #9
 34a:	900c      	str	r0, [sp, #48]	; 0x30
 34c:	f200 81ac 	bhi.w	6a8 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x6a8>
 350:	e7ff      	b.n	352 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x352>
 352:	982d      	ldr	r0, [sp, #180]	; 0xb4
 354:	990c      	ldr	r1, [sp, #48]	; 0x30
 356:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 35a:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 35c:	7142      	strb	r2, [r0, #5]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:142
            unsafe { buf[HYN_TOUCH_XY_POS + HYN_TOUCH_STEP * i] };  //  Can't be constant value
 35e:	f240 0000 	movw	r0, #0
 362:	f2c0 0000 	movt	r0, #0
 366:	906d      	str	r0, [sp, #436]	; 0x1b4
 368:	9860      	ldr	r0, [sp, #384]	; 0x180
 36a:	2306      	movs	r3, #6
 36c:	fba3 0300 	umull	r0, r3, r3, r0
 370:	2b00      	cmp	r3, #0
 372:	900b      	str	r0, [sp, #44]	; 0x2c
 374:	f040 81a1 	bne.w	6ba <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x6ba>
 378:	e7ff      	b.n	37a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x37a>
 37a:	980b      	ldr	r0, [sp, #44]	; 0x2c
 37c:	1dc1      	adds	r1, r0, #7
 37e:	460a      	mov	r2, r1
 380:	4281      	cmp	r1, r0
 382:	920a      	str	r2, [sp, #40]	; 0x28
 384:	f0c0 81a5 	bcc.w	6d2 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x6d2>
 388:	e7ff      	b.n	38a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x38a>
 38a:	980a      	ldr	r0, [sp, #40]	; 0x28
 38c:	283e      	cmp	r0, #62	; 0x3e
 38e:	f200 81ac 	bhi.w	6ea <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x6ea>
 392:	e7ff      	b.n	394 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x394>
 394:	986d      	ldr	r0, [sp, #436]	; 0x1b4
 396:	990a      	ldr	r1, [sp, #40]	; 0x28
 398:	5c40      	ldrb	r0, [r0, r1]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:141
        data.touches[i].pressure =
 39a:	9a60      	ldr	r2, [sp, #384]	; 0x180
 39c:	2a09      	cmp	r2, #9
 39e:	9009      	str	r0, [sp, #36]	; 0x24
 3a0:	9208      	str	r2, [sp, #32]
 3a2:	f200 81ab 	bhi.w	6fc <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x6fc>
 3a6:	e7ff      	b.n	3a8 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x3a8>
 3a8:	982d      	ldr	r0, [sp, #180]	; 0xb4
 3aa:	9908      	ldr	r1, [sp, #32]
 3ac:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 3b0:	9a09      	ldr	r2, [sp, #36]	; 0x24
 3b2:	7182      	strb	r2, [r0, #6]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:144
            unsafe { buf[HYN_TOUCH_MISC   + HYN_TOUCH_STEP * i] } >> 4;
 3b4:	f240 0000 	movw	r0, #0
 3b8:	f2c0 0000 	movt	r0, #0
 3bc:	906e      	str	r0, [sp, #440]	; 0x1b8
 3be:	9860      	ldr	r0, [sp, #384]	; 0x180
 3c0:	2306      	movs	r3, #6
 3c2:	fba3 0300 	umull	r0, r3, r3, r0
 3c6:	2b00      	cmp	r3, #0
 3c8:	9007      	str	r0, [sp, #28]
 3ca:	f040 81a0 	bne.w	70e <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x70e>
 3ce:	e7ff      	b.n	3d0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x3d0>
 3d0:	9807      	ldr	r0, [sp, #28]
 3d2:	f100 0108 	add.w	r1, r0, #8
 3d6:	460a      	mov	r2, r1
 3d8:	4281      	cmp	r1, r0
 3da:	9206      	str	r2, [sp, #24]
 3dc:	f0c0 81a3 	bcc.w	726 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x726>
 3e0:	e7ff      	b.n	3e2 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x3e2>
 3e2:	9806      	ldr	r0, [sp, #24]
 3e4:	283e      	cmp	r0, #62	; 0x3e
 3e6:	f200 81aa 	bhi.w	73e <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x73e>
 3ea:	e7ff      	b.n	3ec <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x3ec>
 3ec:	986e      	ldr	r0, [sp, #440]	; 0x1b8
 3ee:	9906      	ldr	r1, [sp, #24]
 3f0:	5c40      	ldrb	r0, [r0, r1]
 3f2:	0900      	lsrs	r0, r0, #4
 3f4:	9005      	str	r0, [sp, #20]
 3f6:	e7ff      	b.n	3f8 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x3f8>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:143
        data.touches[i].area =
 3f8:	9860      	ldr	r0, [sp, #384]	; 0x180
 3fa:	2809      	cmp	r0, #9
 3fc:	9004      	str	r0, [sp, #16]
 3fe:	f200 81a7 	bhi.w	750 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x750>
 402:	e7ff      	b.n	404 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x404>
 404:	982d      	ldr	r0, [sp, #180]	; 0xb4
 406:	9904      	ldr	r1, [sp, #16]
 408:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 40c:	9a05      	ldr	r2, [sp, #20]
 40e:	71c2      	strb	r2, [r0, #7]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:147
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 410:	9860      	ldr	r0, [sp, #384]	; 0x180
 412:	280a      	cmp	r0, #10
 414:	9003      	str	r0, [sp, #12]
 416:	d327      	bcc.n	468 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x468>
 418:	e1a3      	b.n	762 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x762>
 41a:	2001      	movs	r0, #1
 41c:	f88d 01be 	strb.w	r0, [sp, #446]	; 0x1be
 420:	e009      	b.n	436 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x436>
 422:	2000      	movs	r0, #0
 424:	f88d 01be 	strb.w	r0, [sp, #446]	; 0x1be
 428:	e005      	b.n	436 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x436>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:148
            && (data.point_num == 0) {
 42a:	982d      	ldr	r0, [sp, #180]	; 0xb4
 42c:	f890 0051 	ldrb.w	r0, [r0, #81]	; 0x51
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:147
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 430:	2800      	cmp	r0, #0
 432:	d0f2      	beq.n	41a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x41a>
 434:	e7f5      	b.n	422 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x422>
 436:	f89d 01be 	ldrb.w	r0, [sp, #446]	; 0x1be
 43a:	07c0      	lsls	r0, r0, #31
 43c:	2800      	cmp	r0, #0
 43e:	d124      	bne.n	48a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x48a>
 440:	e022      	b.n	488 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x488>
 442:	2001      	movs	r0, #1
 444:	f88d 01bf 	strb.w	r0, [sp, #447]	; 0x1bf
 448:	e008      	b.n	45c <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x45c>
 44a:	2000      	movs	r0, #0
 44c:	f88d 01bf 	strb.w	r0, [sp, #447]	; 0x1bf
 450:	e004      	b.n	45c <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x45c>
 452:	9860      	ldr	r0, [sp, #384]	; 0x180
 454:	280a      	cmp	r0, #10
 456:	9002      	str	r0, [sp, #8]
 458:	d30e      	bcc.n	478 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x478>
 45a:	e18b      	b.n	774 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x774>
 45c:	f89d 01bf 	ldrb.w	r0, [sp, #447]	; 0x1bf
 460:	07c0      	lsls	r0, r0, #31
 462:	2800      	cmp	r0, #0
 464:	d1e1      	bne.n	42a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x42a>
 466:	e7dc      	b.n	422 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x422>
 468:	982d      	ldr	r0, [sp, #180]	; 0xb4
 46a:	9903      	ldr	r1, [sp, #12]
 46c:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 470:	7900      	ldrb	r0, [r0, #4]
 472:	2800      	cmp	r0, #0
 474:	d0e5      	beq.n	442 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x442>
 476:	e7ec      	b.n	452 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x452>
 478:	982d      	ldr	r0, [sp, #180]	; 0xb4
 47a:	9902      	ldr	r1, [sp, #8]
 47c:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 480:	7900      	ldrb	r0, [r0, #4]
 482:	2802      	cmp	r0, #2
 484:	d0dd      	beq.n	442 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x442>
 486:	e7e0      	b.n	44a <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x44a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:120
    for i in 0..CFG_MAX_TOUCH_POINTS {
 488:	e60a      	b.n	a0 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0xa0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:149
            break;
 48a:	e654      	b.n	136 <_ZN3app12touch_sensor14read_touchdata17hbca58ba7b3354e54E+0x136>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:121
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
 48c:	f240 0000 	movw	r0, #0
 490:	f2c0 0000 	movt	r0, #0
 494:	f240 0200 	movw	r2, #0
 498:	f2c0 0200 	movt	r2, #0
 49c:	2121      	movs	r1, #33	; 0x21
 49e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 4a2:	defe      	udf	#254	; 0xfe
 4a4:	f240 0000 	movw	r0, #0
 4a8:	f2c0 0000 	movt	r0, #0
 4ac:	f240 0200 	movw	r2, #0
 4b0:	f2c0 0200 	movt	r2, #0
 4b4:	211c      	movs	r1, #28
 4b6:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 4ba:	defe      	udf	#254	; 0xfe
 4bc:	f240 0000 	movw	r0, #0
 4c0:	f2c0 0000 	movt	r0, #0
 4c4:	223f      	movs	r2, #63	; 0x3f
 4c6:	9924      	ldr	r1, [sp, #144]	; 0x90
 4c8:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 4cc:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:125
        data.count += 1;
 4ce:	f240 0000 	movw	r0, #0
 4d2:	f2c0 0000 	movt	r0, #0
 4d6:	f240 0200 	movw	r2, #0
 4da:	f2c0 0200 	movt	r2, #0
 4de:	211c      	movs	r1, #28
 4e0:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 4e4:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:126
        let x_high = unsafe { buf[HYN_TOUCH_X_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 4e6:	f240 0000 	movw	r0, #0
 4ea:	f2c0 0000 	movt	r0, #0
 4ee:	f240 0200 	movw	r2, #0
 4f2:	f2c0 0200 	movt	r2, #0
 4f6:	2121      	movs	r1, #33	; 0x21
 4f8:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 4fc:	defe      	udf	#254	; 0xfe
 4fe:	f240 0000 	movw	r0, #0
 502:	f2c0 0000 	movt	r0, #0
 506:	f240 0200 	movw	r2, #0
 50a:	f2c0 0200 	movt	r2, #0
 50e:	211c      	movs	r1, #28
 510:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 514:	defe      	udf	#254	; 0xfe
 516:	f240 0000 	movw	r0, #0
 51a:	f2c0 0000 	movt	r0, #0
 51e:	223f      	movs	r2, #63	; 0x3f
 520:	9920      	ldr	r1, [sp, #128]	; 0x80
 522:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 526:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:127
        let x_low  = unsafe { buf[HYN_TOUCH_X_L_POS + HYN_TOUCH_STEP * i] } as u16;
 528:	f240 0000 	movw	r0, #0
 52c:	f2c0 0000 	movt	r0, #0
 530:	f240 0200 	movw	r2, #0
 534:	f2c0 0200 	movt	r2, #0
 538:	2121      	movs	r1, #33	; 0x21
 53a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 53e:	defe      	udf	#254	; 0xfe
 540:	f240 0000 	movw	r0, #0
 544:	f2c0 0000 	movt	r0, #0
 548:	f240 0200 	movw	r2, #0
 54c:	f2c0 0200 	movt	r2, #0
 550:	211c      	movs	r1, #28
 552:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 556:	defe      	udf	#254	; 0xfe
 558:	f240 0000 	movw	r0, #0
 55c:	f2c0 0000 	movt	r0, #0
 560:	223f      	movs	r2, #63	; 0x3f
 562:	991e      	ldr	r1, [sp, #120]	; 0x78
 564:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 568:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:128
        data.touches[i].x  = (x_high << 8) | x_low;
 56a:	f240 0000 	movw	r0, #0
 56e:	f2c0 0000 	movt	r0, #0
 572:	220a      	movs	r2, #10
 574:	991b      	ldr	r1, [sp, #108]	; 0x6c
 576:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 57a:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:130
        let y_high = unsafe { buf[HYN_TOUCH_Y_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 57c:	f240 0000 	movw	r0, #0
 580:	f2c0 0000 	movt	r0, #0
 584:	f240 0200 	movw	r2, #0
 588:	f2c0 0200 	movt	r2, #0
 58c:	2121      	movs	r1, #33	; 0x21
 58e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 592:	defe      	udf	#254	; 0xfe
 594:	f240 0000 	movw	r0, #0
 598:	f2c0 0000 	movt	r0, #0
 59c:	f240 0200 	movw	r2, #0
 5a0:	f2c0 0200 	movt	r2, #0
 5a4:	211c      	movs	r1, #28
 5a6:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 5aa:	defe      	udf	#254	; 0xfe
 5ac:	f240 0000 	movw	r0, #0
 5b0:	f2c0 0000 	movt	r0, #0
 5b4:	223f      	movs	r2, #63	; 0x3f
 5b6:	9919      	ldr	r1, [sp, #100]	; 0x64
 5b8:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 5bc:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:131
        let y_low  = unsafe { buf[HYN_TOUCH_Y_L_POS + HYN_TOUCH_STEP * i] } as u16;
 5be:	f240 0000 	movw	r0, #0
 5c2:	f2c0 0000 	movt	r0, #0
 5c6:	f240 0200 	movw	r2, #0
 5ca:	f2c0 0200 	movt	r2, #0
 5ce:	2121      	movs	r1, #33	; 0x21
 5d0:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 5d4:	defe      	udf	#254	; 0xfe
 5d6:	f240 0000 	movw	r0, #0
 5da:	f2c0 0000 	movt	r0, #0
 5de:	f240 0200 	movw	r2, #0
 5e2:	f2c0 0200 	movt	r2, #0
 5e6:	211c      	movs	r1, #28
 5e8:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 5ec:	defe      	udf	#254	; 0xfe
 5ee:	f240 0000 	movw	r0, #0
 5f2:	f2c0 0000 	movt	r0, #0
 5f6:	223f      	movs	r2, #63	; 0x3f
 5f8:	9917      	ldr	r1, [sp, #92]	; 0x5c
 5fa:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 5fe:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:132
        data.touches[i].y  = (y_high << 8) | y_low;
 600:	f240 0000 	movw	r0, #0
 604:	f2c0 0000 	movt	r0, #0
 608:	220a      	movs	r2, #10
 60a:	9914      	ldr	r1, [sp, #80]	; 0x50
 60c:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 610:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:136
            unsafe { buf[HYN_TOUCH_EVENT_POS + HYN_TOUCH_STEP * i] } >> 6;
 612:	f240 0000 	movw	r0, #0
 616:	f2c0 0000 	movt	r0, #0
 61a:	f240 0200 	movw	r2, #0
 61e:	f2c0 0200 	movt	r2, #0
 622:	2121      	movs	r1, #33	; 0x21
 624:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 628:	defe      	udf	#254	; 0xfe
 62a:	f240 0000 	movw	r0, #0
 62e:	f2c0 0000 	movt	r0, #0
 632:	f240 0200 	movw	r2, #0
 636:	f2c0 0200 	movt	r2, #0
 63a:	211c      	movs	r1, #28
 63c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 640:	defe      	udf	#254	; 0xfe
 642:	f240 0000 	movw	r0, #0
 646:	f2c0 0000 	movt	r0, #0
 64a:	223f      	movs	r2, #63	; 0x3f
 64c:	9912      	ldr	r1, [sp, #72]	; 0x48
 64e:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 652:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:135
        data.touches[i].action =
 654:	f240 0000 	movw	r0, #0
 658:	f2c0 0000 	movt	r0, #0
 65c:	220a      	movs	r2, #10
 65e:	9910      	ldr	r1, [sp, #64]	; 0x40
 660:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 664:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:138
            unsafe { buf[HYN_TOUCH_ID_POS    + HYN_TOUCH_STEP * i] } >> 4;
 666:	f240 0000 	movw	r0, #0
 66a:	f2c0 0000 	movt	r0, #0
 66e:	f240 0200 	movw	r2, #0
 672:	f2c0 0200 	movt	r2, #0
 676:	2121      	movs	r1, #33	; 0x21
 678:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 67c:	defe      	udf	#254	; 0xfe
 67e:	f240 0000 	movw	r0, #0
 682:	f2c0 0000 	movt	r0, #0
 686:	f240 0200 	movw	r2, #0
 68a:	f2c0 0200 	movt	r2, #0
 68e:	211c      	movs	r1, #28
 690:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 694:	defe      	udf	#254	; 0xfe
 696:	f240 0000 	movw	r0, #0
 69a:	f2c0 0000 	movt	r0, #0
 69e:	223f      	movs	r2, #63	; 0x3f
 6a0:	990e      	ldr	r1, [sp, #56]	; 0x38
 6a2:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 6a6:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:137
        data.touches[i].finger =
 6a8:	f240 0000 	movw	r0, #0
 6ac:	f2c0 0000 	movt	r0, #0
 6b0:	220a      	movs	r2, #10
 6b2:	990c      	ldr	r1, [sp, #48]	; 0x30
 6b4:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 6b8:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:142
            unsafe { buf[HYN_TOUCH_XY_POS + HYN_TOUCH_STEP * i] };  //  Can't be constant value
 6ba:	f240 0000 	movw	r0, #0
 6be:	f2c0 0000 	movt	r0, #0
 6c2:	f240 0200 	movw	r2, #0
 6c6:	f2c0 0200 	movt	r2, #0
 6ca:	2121      	movs	r1, #33	; 0x21
 6cc:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 6d0:	defe      	udf	#254	; 0xfe
 6d2:	f240 0000 	movw	r0, #0
 6d6:	f2c0 0000 	movt	r0, #0
 6da:	f240 0200 	movw	r2, #0
 6de:	f2c0 0200 	movt	r2, #0
 6e2:	211c      	movs	r1, #28
 6e4:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 6e8:	defe      	udf	#254	; 0xfe
 6ea:	f240 0000 	movw	r0, #0
 6ee:	f2c0 0000 	movt	r0, #0
 6f2:	223f      	movs	r2, #63	; 0x3f
 6f4:	990a      	ldr	r1, [sp, #40]	; 0x28
 6f6:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 6fa:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:141
        data.touches[i].pressure =
 6fc:	f240 0000 	movw	r0, #0
 700:	f2c0 0000 	movt	r0, #0
 704:	220a      	movs	r2, #10
 706:	9908      	ldr	r1, [sp, #32]
 708:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 70c:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:144
            unsafe { buf[HYN_TOUCH_MISC   + HYN_TOUCH_STEP * i] } >> 4;
 70e:	f240 0000 	movw	r0, #0
 712:	f2c0 0000 	movt	r0, #0
 716:	f240 0200 	movw	r2, #0
 71a:	f2c0 0200 	movt	r2, #0
 71e:	2121      	movs	r1, #33	; 0x21
 720:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 724:	defe      	udf	#254	; 0xfe
 726:	f240 0000 	movw	r0, #0
 72a:	f2c0 0000 	movt	r0, #0
 72e:	f240 0200 	movw	r2, #0
 732:	f2c0 0200 	movt	r2, #0
 736:	211c      	movs	r1, #28
 738:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 73c:	defe      	udf	#254	; 0xfe
 73e:	f240 0000 	movw	r0, #0
 742:	f2c0 0000 	movt	r0, #0
 746:	223f      	movs	r2, #63	; 0x3f
 748:	9906      	ldr	r1, [sp, #24]
 74a:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 74e:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:143
        data.touches[i].area =
 750:	f240 0000 	movw	r0, #0
 754:	f2c0 0000 	movt	r0, #0
 758:	220a      	movs	r2, #10
 75a:	9904      	ldr	r1, [sp, #16]
 75c:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 760:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:147
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 762:	f240 0000 	movw	r0, #0
 766:	f2c0 0000 	movt	r0, #0
 76a:	220a      	movs	r2, #10
 76c:	9903      	ldr	r1, [sp, #12]
 76e:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 772:	defe      	udf	#254	; 0xfe
 774:	f240 0000 	movw	r0, #0
 778:	f2c0 0000 	movt	r0, #0
 77c:	220a      	movs	r2, #10
 77e:	9902      	ldr	r1, [sp, #8]
 780:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17hefada55beeee1c8fE>
 784:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE:

00000000 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE>:
_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:212

/// Event that will be forwarded to the Event Queue when a touch interrupt is triggered
static mut TOUCH_EVENT: os_event = fill_zero!(os_event);  //  Init all fields to 0 or NULL

/// Read a range of I2C registers from the I2C address `addr` (7-bit address), starting at `start_register` for count `num_registers`. Save into `buffer`.
fn read_register_range(addr: u8, start_register: u8, num_registers: u8, buffer: &mut[u8]) -> MynewtResult<()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0a0      	sub	sp, #128	; 0x80
   4:	f8dd c090 	ldr.w	ip, [sp, #144]	; 0x90
   8:	4696      	mov	lr, r2
   a:	460c      	mov	r4, r1
   c:	4605      	mov	r5, r0
   e:	f88d 003d 	strb.w	r0, [sp, #61]	; 0x3d
  12:	f88d 103e 	strb.w	r1, [sp, #62]	; 0x3e
  16:	f88d 203f 	strb.w	r2, [sp, #63]	; 0x3f
  1a:	9310      	str	r3, [sp, #64]	; 0x40
  1c:	f8cd c044 	str.w	ip, [sp, #68]	; 0x44
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:213
    assert!(buffer.len() >= num_registers as usize, "i2c buf");  //  Buffer too small
  20:	9810      	ldr	r0, [sp, #64]	; 0x40
  22:	9911      	ldr	r1, [sp, #68]	; 0x44
  24:	f8cd e038 	str.w	lr, [sp, #56]	; 0x38
  28:	940d      	str	r4, [sp, #52]	; 0x34
  2a:	950c      	str	r5, [sp, #48]	; 0x30
  2c:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17hfff8c41223f8c7cbE>
  30:	900b      	str	r0, [sp, #44]	; 0x2c
  32:	e7ff      	b.n	34 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x34>
  34:	f89d 003f 	ldrb.w	r0, [sp, #63]	; 0x3f
  38:	990b      	ldr	r1, [sp, #44]	; 0x2c
  3a:	4281      	cmp	r1, r0
  3c:	d30c      	bcc.n	58 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x58>
  3e:	e7ff      	b.n	40 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x40>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
  40:	f89d 003e 	ldrb.w	r0, [sp, #62]	; 0x3e
  44:	f89d 103f 	ldrb.w	r1, [sp, #63]	; 0x3f
  48:	4408      	add	r0, r1
  4a:	b2c1      	uxtb	r1, r0
  4c:	4602      	mov	r2, r0
  4e:	4281      	cmp	r1, r0
  50:	920a      	str	r2, [sp, #40]	; 0x28
  52:	f040 80b3 	bne.w	1bc <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x1bc>
  56:	e010      	b.n	24 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x24>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:213
    assert!(buffer.len() >= num_registers as usize, "i2c buf");  //  Buffer too small
  58:	f240 0000 	movw	r0, #0
  5c:	f2c0 0000 	movt	r0, #0
  60:	901d      	str	r0, [sp, #116]	; 0x74
  62:	9a1d      	ldr	r2, [sp, #116]	; 0x74
  64:	9209      	str	r2, [sp, #36]	; 0x24
  66:	e7ff      	b.n	68 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x68>
  68:	f240 0000 	movw	r0, #0
  6c:	f2c0 0000 	movt	r0, #0
  70:	2107      	movs	r1, #7
  72:	9a09      	ldr	r2, [sp, #36]	; 0x24
  74:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
  78:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
  7a:	980a      	ldr	r0, [sp, #40]	; 0x28
  7c:	b241      	sxtb	r1, r0
  7e:	2900      	cmp	r1, #0
  80:	d41a      	bmi.n	b8 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0xb8>
  82:	e7ff      	b.n	84 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x84>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:223
    //    Send the Start Condition (High to Low SDA Transition)...
    //    Followed by I2C Address (7 bits)...
    //    Followed by Write Mode (1 bit, value 0)...
    //    Followed by starting Register Number (8 bits)
    unsafe { 
        I2C_BUFFER[0] = start_register;  //  I2C Packet buffer contains starting Register Number (1 byte)
  84:	f89d 003e 	ldrb.w	r0, [sp, #62]	; 0x3e
  88:	f240 0100 	movw	r1, #0
  8c:	f2c0 0100 	movt	r1, #0
  90:	9113      	str	r1, [sp, #76]	; 0x4c
  92:	9a13      	ldr	r2, [sp, #76]	; 0x4c
  94:	7010      	strb	r0, [r2, #0]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:224
        I2C_DATA.address = addr;         //  I2C Packet address (7 bits)
  96:	f89d 003d 	ldrb.w	r0, [sp, #61]	; 0x3d
  9a:	f240 0200 	movw	r2, #0
  9e:	f2c0 0200 	movt	r2, #0
  a2:	9214      	str	r2, [sp, #80]	; 0x50
  a4:	9a14      	ldr	r2, [sp, #80]	; 0x50
  a6:	7010      	strb	r0, [r2, #0]
  a8:	2001      	movs	r0, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:225
        I2C_DATA.len = I2C_BUFFER.len() as u16;     //  I2C Packet data size is 1 byte
  aa:	9008      	str	r0, [sp, #32]
  ac:	4608      	mov	r0, r1
  ae:	9908      	ldr	r1, [sp, #32]
  b0:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17hfff8c41223f8c7cbE>
  b4:	9007      	str	r0, [sp, #28]
  b6:	e010      	b.n	da <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0xda>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
  b8:	f240 0000 	movw	r0, #0
  bc:	f2c0 0000 	movt	r0, #0
  c0:	901e      	str	r0, [sp, #120]	; 0x78
  c2:	9a1e      	ldr	r2, [sp, #120]	; 0x78
  c4:	9206      	str	r2, [sp, #24]
  c6:	e7ff      	b.n	c8 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0xc8>
  c8:	f240 0000 	movw	r0, #0
  cc:	f2c0 0000 	movt	r0, #0
  d0:	2108      	movs	r1, #8
  d2:	9a06      	ldr	r2, [sp, #24]
  d4:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
  d8:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:225
        I2C_DATA.len = I2C_BUFFER.len() as u16;     //  I2C Packet data size is 1 byte
  da:	f240 0000 	movw	r0, #0
  de:	f2c0 0000 	movt	r0, #0
  e2:	9015      	str	r0, [sp, #84]	; 0x54
  e4:	9815      	ldr	r0, [sp, #84]	; 0x54
  e6:	9907      	ldr	r1, [sp, #28]
  e8:	8041      	strh	r1, [r0, #2]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:226
        I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();  //  I2C Packet data points to packet buffer
  ea:	f240 0000 	movw	r0, #0
  ee:	f2c0 0000 	movt	r0, #0
  f2:	2101      	movs	r1, #1
  f4:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17ha8781b3442265f5fE>
  f8:	9005      	str	r0, [sp, #20]
  fa:	e7ff      	b.n	fc <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0xfc>
  fc:	f240 0000 	movw	r0, #0
 100:	f2c0 0000 	movt	r0, #0
 104:	9016      	str	r0, [sp, #88]	; 0x58
 106:	9916      	ldr	r1, [sp, #88]	; 0x58
 108:	9a05      	ldr	r2, [sp, #20]
 10a:	604a      	str	r2, [r1, #4]
 10c:	2101      	movs	r1, #1
 10e:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 112:	2300      	movs	r3, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:228
    };
    let _rc1 = unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };  //  No stop yet, must continue even if we hit an error
 114:	9004      	str	r0, [sp, #16]
 116:	4608      	mov	r0, r1
 118:	9904      	ldr	r1, [sp, #16]
 11a:	f7ff fffe 	bl	0 <hal_i2c_master_write>
 11e:	9017      	str	r0, [sp, #92]	; 0x5c
 120:	e7ff      	b.n	122 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x122>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:234
    //  Step 3: Prepare to receive the stream of I2C Device Register values...
    //    Send the Start Condition (High to Low SDA Transition)...
    //    Followed by I2C Address (7 bits)...
    //    Followed by Read Mode (1 bit, value 1)
    unsafe { 
        I2C_BUFFER[0] = 0x00;     //  I2C Packet buffer should be empty (provided by caller)
 122:	f240 0000 	movw	r0, #0
 126:	f2c0 0000 	movt	r0, #0
 12a:	9018      	str	r0, [sp, #96]	; 0x60
 12c:	9818      	ldr	r0, [sp, #96]	; 0x60
 12e:	2100      	movs	r1, #0
 130:	7001      	strb	r1, [r0, #0]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:235
        I2C_DATA.address = addr;  //  I2C Packet address (7 bits)
 132:	f89d 003d 	ldrb.w	r0, [sp, #61]	; 0x3d
 136:	f240 0100 	movw	r1, #0
 13a:	f2c0 0100 	movt	r1, #0
 13e:	9119      	str	r1, [sp, #100]	; 0x64
 140:	9a19      	ldr	r2, [sp, #100]	; 0x64
 142:	7010      	strb	r0, [r2, #0]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:236
        I2C_DATA.len = num_registers as u16;    //  I2C Packet data size is number of Registers to read
 144:	f89d 003f 	ldrb.w	r0, [sp, #63]	; 0x3f
 148:	911a      	str	r1, [sp, #104]	; 0x68
 14a:	991a      	ldr	r1, [sp, #104]	; 0x68
 14c:	8048      	strh	r0, [r1, #2]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:237
        I2C_DATA.buffer = buffer.as_mut_ptr();  //  I2C Packet data points to packet buffer
 14e:	9810      	ldr	r0, [sp, #64]	; 0x40
 150:	9911      	ldr	r1, [sp, #68]	; 0x44
 152:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17ha8781b3442265f5fE>
 156:	9003      	str	r0, [sp, #12]
 158:	e7ff      	b.n	15a <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x15a>
 15a:	f240 0000 	movw	r0, #0
 15e:	f2c0 0000 	movt	r0, #0
 162:	901b      	str	r0, [sp, #108]	; 0x6c
 164:	991b      	ldr	r1, [sp, #108]	; 0x6c
 166:	9a03      	ldr	r2, [sp, #12]
 168:	604a      	str	r2, [r1, #4]
 16a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 16e:	2101      	movs	r1, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:241
    };
    //  Step 4: Receive the requested number of Register values from I2C Device (1 byte per register)
    //  Step 5: Send the Stop Condition (Low to High SDA Transition)
    let rc2 = unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };
 170:	9002      	str	r0, [sp, #8]
 172:	4608      	mov	r0, r1
 174:	9b02      	ldr	r3, [sp, #8]
 176:	9101      	str	r1, [sp, #4]
 178:	4619      	mov	r1, r3
 17a:	9b01      	ldr	r3, [sp, #4]
 17c:	f7ff fffe 	bl	0 <hal_i2c_master_read>
 180:	901c      	str	r0, [sp, #112]	; 0x70
 182:	e7ff      	b.n	184 <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x184>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:242
    if rc2 == hal::HAL_I2C_ERR_ADDR_NACK as i32 {
 184:	981c      	ldr	r0, [sp, #112]	; 0x70
 186:	2804      	cmp	r0, #4
 188:	d007      	beq.n	19a <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x19a>
 18a:	e7ff      	b.n	18c <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x18c>
 18c:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:246
        assert!(false, "i2c fail");  //  I2C read failed
        return Ok(());               //  TODO: Return an error
    }
    Ok(())
 18e:	9012      	str	r0, [sp, #72]	; 0x48
 190:	2001      	movs	r0, #1
 192:	9012      	str	r0, [sp, #72]	; 0x48
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:247
}
 194:	9812      	ldr	r0, [sp, #72]	; 0x48
 196:	b020      	add	sp, #128	; 0x80
 198:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:243
        assert!(false, "i2c fail");  //  I2C read failed
 19a:	f240 0000 	movw	r0, #0
 19e:	f2c0 0000 	movt	r0, #0
 1a2:	901f      	str	r0, [sp, #124]	; 0x7c
 1a4:	9a1f      	ldr	r2, [sp, #124]	; 0x7c
 1a6:	9200      	str	r2, [sp, #0]
 1a8:	e7ff      	b.n	1aa <_ZN3app12touch_sensor19read_register_range17h99f7a01a65e5678dE+0x1aa>
 1aa:	f240 0000 	movw	r0, #0
 1ae:	f2c0 0000 	movt	r0, #0
 1b2:	2108      	movs	r1, #8
 1b4:	9a00      	ldr	r2, [sp, #0]
 1b6:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 1ba:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
 1bc:	f240 0000 	movw	r0, #0
 1c0:	f2c0 0000 	movt	r0, #0
 1c4:	f240 0200 	movw	r2, #0
 1c8:	f2c0 0200 	movt	r2, #0
 1cc:	211c      	movs	r1, #28
 1ce:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
 1d2:	defe      	udf	#254	; 0xfe

app-4d8274845a53ddea.3hmkm5yr9fuwuecf.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3hmkm5yr9fuwuecf
00001b5a l       .debug_str	00000000 
000023f9 l       .debug_str	00000000 
00002400 l       .debug_str	00000000 
00002408 l       .debug_str	00000000 
00002426 l       .debug_str	00000000 
00002436 l       .debug_str	00000000 
00002469 l       .debug_str	00000000 
0000247e l       .debug_str	00000000 
00002491 l       .debug_str	00000000 
000024a6 l       .debug_str	00000000 
000024ad l       .debug_str	00000000 
000024c2 l       .debug_str	00000000 
000024ec l       .debug_str	00000000 
000024f0 l       .debug_str	00000000 
000024f9 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000084 l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a4 l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000ab l       .debug_str	00000000 
000000b3 l       .debug_str	00000000 
000000b7 l       .debug_str	00000000 
000000c0 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000d1 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000dd l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000ea l       .debug_str	00000000 
000000ef l       .debug_str	00000000 
00000126 l       .debug_str	00000000 
0000012d l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000139 l       .debug_str	00000000 
00000144 l       .debug_str	00000000 
0000014f l       .debug_str	00000000 
0000015c l       .debug_str	00000000 
00000167 l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
0000017a l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
0000018f l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
000001a5 l       .debug_str	00000000 
000001b2 l       .debug_str	00000000 
000001be l       .debug_str	00000000 
000001cb l       .debug_str	00000000 
000001d9 l       .debug_str	00000000 
000001e3 l       .debug_str	00000000 
000001f0 l       .debug_str	00000000 
000001fc l       .debug_str	00000000 
00000201 l       .debug_str	00000000 
00000205 l       .debug_str	00000000 
00000210 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
00000222 l       .debug_str	00000000 
00000261 l       .debug_str	00000000 
00000277 l       .debug_str	00000000 
0000027b l       .debug_str	00000000 
0000027e l       .debug_str	00000000 
00000281 l       .debug_str	00000000 
00000283 l       .debug_str	00000000 
00000285 l       .debug_str	00000000 
00000289 l       .debug_str	00000000 
000002b1 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002bb l       .debug_str	00000000 
000002c4 l       .debug_str	00000000 
000002ca l       .debug_str	00000000 
000002d1 l       .debug_str	00000000 
000002d4 l       .debug_str	00000000 
000002e0 l       .debug_str	00000000 
000002e8 l       .debug_str	00000000 
000002ef l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
0000030b l       .debug_str	00000000 
00000365 l       .debug_str	00000000 
0000036a l       .debug_str	00000000 
000003cc l       .debug_str	00000000 
000003d7 l       .debug_str	00000000 
0000041e l       .debug_str	00000000 
0000046d l       .debug_str	00000000 
00000477 l       .debug_str	00000000 
000004b4 l       .debug_str	00000000 
000004f9 l       .debug_str	00000000 
00000502 l       .debug_str	00000000 
00000512 l       .debug_str	00000000 
0000051a l       .debug_str	00000000 
0000056f l       .debug_str	00000000 
000005cc l       .debug_str	00000000 
000005d8 l       .debug_str	00000000 
000005e1 l       .debug_str	00000000 
000005ed l       .debug_str	00000000 
000005f9 l       .debug_str	00000000 
00000602 l       .debug_str	00000000 
0000060a l       .debug_str	00000000 
00000612 l       .debug_str	00000000 
0000061c l       .debug_str	00000000 
00000631 l       .debug_str	00000000 
00000638 l       .debug_str	00000000 
00000658 l       .debug_str	00000000 
0000065f l       .debug_str	00000000 
00000667 l       .debug_str	00000000 
00000671 l       .debug_str	00000000 
0000067c l       .debug_str	00000000 
00000685 l       .debug_str	00000000 
00000690 l       .debug_str	00000000 
0000069c l       .debug_str	00000000 
000006a0 l       .debug_str	00000000 
000006a9 l       .debug_str	00000000 
000006b0 l       .debug_str	00000000 
000006b8 l       .debug_str	00000000 
000006c0 l       .debug_str	00000000 
000006ca l       .debug_str	00000000 
000006d0 l       .debug_str	00000000 
000006d7 l       .debug_str	00000000 
000006de l       .debug_str	00000000 
0000070b l       .debug_str	00000000 
00000740 l       .debug_str	00000000 
00000746 l       .debug_str	00000000 
0000074c l       .debug_str	00000000 
0000075b l       .debug_str	00000000 
0000076b l       .debug_str	00000000 
0000077b l       .debug_str	00000000 
00000783 l       .debug_str	00000000 
000007ac l       .debug_str	00000000 
0000080a l       .debug_str	00000000 
00000870 l       .debug_str	00000000 
00000877 l       .debug_str	00000000 
0000087f l       .debug_str	00000000 
00000888 l       .debug_str	00000000 
000008a6 l       .debug_str	00000000 
000008b6 l       .debug_str	00000000 
000008c4 l       .debug_str	00000000 
000008cf l       .debug_str	00000000 
000008dc l       .debug_str	00000000 
000008eb l       .debug_str	00000000 
00000901 l       .debug_str	00000000 
0000090b l       .debug_str	00000000 
00000914 l       .debug_str	00000000 
0000091d l       .debug_str	00000000 
00000943 l       .debug_str	00000000 
00000959 l       .debug_str	00000000 
00000964 l       .debug_str	00000000 
0000097a l       .debug_str	00000000 
00000982 l       .debug_str	00000000 
000009a3 l       .debug_str	00000000 
000009ba l       .debug_str	00000000 
000009bf l       .debug_str	00000000 
000009c7 l       .debug_str	00000000 
000009d0 l       .debug_str	00000000 
000009d9 l       .debug_str	00000000 
000009e2 l       .debug_str	00000000 
000009ea l       .debug_str	00000000 
000009ee l       .debug_str	00000000 
000009f5 l       .debug_str	00000000 
00000a01 l       .debug_str	00000000 
00000a0c l       .debug_str	00000000 
00000a14 l       .debug_str	00000000 
00000a1c l       .debug_str	00000000 
00000a98 l       .debug_str	00000000 
00000b1c l       .debug_str	00000000 
00000c18 l       .debug_str	00000000 
00000d1c l       .debug_str	00000000 
00000d2a l       .debug_str	00000000 
00000d35 l       .debug_str	00000000 
00000d3f l       .debug_str	00000000 
00000d53 l       .debug_str	00000000 
00000d5e l       .debug_str	00000000 
00000d8c l       .debug_str	00000000 
00000e07 l       .debug_str	00000000 
00000e8a l       .debug_str	00000000 
00000e98 l       .debug_str	00000000 
00000ef7 l       .debug_str	00000000 
00000f5e l       .debug_str	00000000 
00000f74 l       .debug_str	00000000 
00000f84 l       .debug_str	00000000 
00000f93 l       .debug_str	00000000 
00000f97 l       .debug_str	00000000 
00000f9e l       .debug_str	00000000 
00000fa4 l       .debug_str	00000000 
00000fa8 l       .debug_str	00000000 
00000fae l       .debug_str	00000000 
00000fb4 l       .debug_str	00000000 
00000fc0 l       .debug_str	00000000 
00000fc8 l       .debug_str	00000000 
00000fce l       .debug_str	00000000 
00000fd6 l       .debug_str	00000000 
00000fdc l       .debug_str	00000000 
00000fff l       .debug_str	00000000 
0000100f l       .debug_str	00000000 
00001042 l       .debug_str	00000000 
00001082 l       .debug_str	00000000 
000010ca l       .debug_str	00000000 
000010ce l       .debug_str	00000000 
000010d4 l       .debug_str	00000000 
000010da l       .debug_str	00000000 
000010e0 l       .debug_str	00000000 
000010f2 l       .debug_str	00000000 
00001127 l       .debug_str	00000000 
00001169 l       .debug_str	00000000 
000011b3 l       .debug_str	00000000 
000011b7 l       .debug_str	00000000 
000011bd l       .debug_str	00000000 
000011c3 l       .debug_str	00000000 
000011c9 l       .debug_str	00000000 
000011db l       .debug_str	00000000 
00001210 l       .debug_str	00000000 
00001252 l       .debug_str	00000000 
0000129c l       .debug_str	00000000 
000012a0 l       .debug_str	00000000 
000012a6 l       .debug_str	00000000 
000012ac l       .debug_str	00000000 
000012b2 l       .debug_str	00000000 
000012b8 l       .debug_str	00000000 
000012c9 l       .debug_str	00000000 
000012fd l       .debug_str	00000000 
0000133e l       .debug_str	00000000 
00001387 l       .debug_str	00000000 
0000138c l       .debug_str	00000000 
00001391 l       .debug_str	00000000 
00001395 l       .debug_str	00000000 
0000139b l       .debug_str	00000000 
000013a1 l       .debug_str	00000000 
000013a7 l       .debug_str	00000000 
000013b8 l       .debug_str	00000000 
000013ec l       .debug_str	00000000 
0000142d l       .debug_str	00000000 
00001476 l       .debug_str	00000000 
0000147a l       .debug_str	00000000 
00001483 l       .debug_str	00000000 
00001494 l       .debug_str	00000000 
000014c8 l       .debug_str	00000000 
00001509 l       .debug_str	00000000 
00001552 l       .debug_str	00000000 
00001557 l       .debug_str	00000000 
0000155b l       .debug_str	00000000 
00001564 l       .debug_str	00000000 
0000156b l       .debug_str	00000000 
00001573 l       .debug_str	00000000 
00001585 l       .debug_str	00000000 
000015ba l       .debug_str	00000000 
000015fc l       .debug_str	00000000 
00001646 l       .debug_str	00000000 
0000164a l       .debug_str	00000000 
00001650 l       .debug_str	00000000 
00001656 l       .debug_str	00000000 
0000165c l       .debug_str	00000000 
00001662 l       .debug_str	00000000 
0000166a l       .debug_str	00000000 
00001678 l       .debug_str	00000000 
00001687 l       .debug_str	00000000 
00001698 l       .debug_str	00000000 
000016a3 l       .debug_str	00000000 
000016ae l       .debug_str	00000000 
000016b9 l       .debug_str	00000000 
000016c0 l       .debug_str	00000000 
000016e3 l       .debug_str	00000000 
000016f5 l       .debug_str	00000000 
0000172a l       .debug_str	00000000 
0000176c l       .debug_str	00000000 
000017b6 l       .debug_str	00000000 
000017ba l       .debug_str	00000000 
000017c4 l       .debug_str	00000000 
000017d6 l       .debug_str	00000000 
0000180b l       .debug_str	00000000 
0000184d l       .debug_str	00000000 
00001897 l       .debug_str	00000000 
0000189c l       .debug_str	00000000 
000018a6 l       .debug_str	00000000 
000018b8 l       .debug_str	00000000 
000018ed l       .debug_str	00000000 
0000192f l       .debug_str	00000000 
00001979 l       .debug_str	00000000 
0000198d l       .debug_str	00000000 
00001991 l       .debug_str	00000000 
0000199f l       .debug_str	00000000 
000019af l       .debug_str	00000000 
000019b8 l       .debug_str	00000000 
000019c3 l       .debug_str	00000000 
000019d2 l       .debug_str	00000000 
000019e7 l       .debug_str	00000000 
00001a18 l       .debug_str	00000000 
00001ab5 l       .debug_str	00000000 
00001b65 l       .debug_str	00000000 
00001b6e l       .debug_str	00000000 
00001b8f l       .debug_str	00000000 
00001ba2 l       .debug_str	00000000 
00001bd8 l       .debug_str	00000000 
00001c5b l       .debug_str	00000000 
00001ce6 l       .debug_str	00000000 
00001d02 l       .debug_str	00000000 
00001d4e l       .debug_str	00000000 
00001da2 l       .debug_str	00000000 
00001dbf l       .debug_str	00000000 
00001dd3 l       .debug_str	00000000 
00001e1f l       .debug_str	00000000 
00001e73 l       .debug_str	00000000 
00001e89 l       .debug_str	00000000 
00001e9d l       .debug_str	00000000 
00001ee4 l       .debug_str	00000000 
00001f33 l       .debug_str	00000000 
00001f3c l       .debug_str	00000000 
00001f4a l       .debug_str	00000000 
00001f7b l       .debug_str	00000000 
00001f81 l       .debug_str	00000000 
00001f89 l       .debug_str	00000000 
00001f90 l       .debug_str	00000000 
00001f98 l       .debug_str	00000000 
00001fa3 l       .debug_str	00000000 
00001fab l       .debug_str	00000000 
00001fba l       .debug_str	00000000 
00001fbe l       .debug_str	00000000 
00001fc9 l       .debug_str	00000000 
00001fd5 l       .debug_str	00000000 
00001fe0 l       .debug_str	00000000 
00001ff1 l       .debug_str	00000000 
00001ff7 l       .debug_str	00000000 
00001fff l       .debug_str	00000000 
00002006 l       .debug_str	00000000 
00002010 l       .debug_str	00000000 
00002018 l       .debug_str	00000000 
00002020 l       .debug_str	00000000 
00002042 l       .debug_str	00000000 
0000204d l       .debug_str	00000000 
00002059 l       .debug_str	00000000 
00002061 l       .debug_str	00000000 
0000206a l       .debug_str	00000000 
00002075 l       .debug_str	00000000 
0000207c l       .debug_str	00000000 
00002087 l       .debug_str	00000000 
00002092 l       .debug_str	00000000 
000020a2 l       .debug_str	00000000 
000020ac l       .debug_str	00000000 
000020b2 l       .debug_str	00000000 
000020d4 l       .debug_str	00000000 
0000210c l       .debug_str	00000000 
0000214c l       .debug_str	00000000 
00002153 l       .debug_str	00000000 
0000215b l       .debug_str	00000000 
00002172 l       .debug_str	00000000 
0000217b l       .debug_str	00000000 
0000218b l       .debug_str	00000000 
0000219a l       .debug_str	00000000 
000021a2 l       .debug_str	00000000 
000021a9 l       .debug_str	00000000 
000021b1 l       .debug_str	00000000 
000021cf l       .debug_str	00000000 
000021df l       .debug_str	00000000 
00002212 l       .debug_str	00000000 
00002227 l       .debug_str	00000000 
00002230 l       .debug_str	00000000 
0000228d l       .debug_str	00000000 
000022f2 l       .debug_str	00000000 
000022fc l       .debug_str	00000000 
0000230c l       .debug_str	00000000 
00002321 l       .debug_str	00000000 
00002329 l       .debug_str	00000000 
0000238d l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.671c228b54e48000413941a013664e26.1	0000000e .Lanon.671c228b54e48000413941a013664e26.1
00000000 l     O .rodata..Lanon.671c228b54e48000413941a013664e26.2	00000006 .Lanon.671c228b54e48000413941a013664e26.2
00000000 l     O .rodata..Lanon.671c228b54e48000413941a013664e26.4	0000000c .Lanon.671c228b54e48000413941a013664e26.4
00000000 l     O .rodata._ZN3app10app_sensor13SENSOR_DEVICE17ha0af561dbf1375ffE	0000000c _ZN3app10app_sensor13SENSOR_DEVICE17ha0af561dbf1375ffE
00000000 l    d  .text._ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E	00000000 .text._ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E
00000000 l    d  .rodata..Lanon.671c228b54e48000413941a013664e26.0	00000000 .rodata..Lanon.671c228b54e48000413941a013664e26.0
00000000 l    d  .rodata._ZN3app10app_sensor13SENSOR_DEVICE17ha0af561dbf1375ffE	00000000 .rodata._ZN3app10app_sensor13SENSOR_DEVICE17ha0af561dbf1375ffE
00000000 l    d  .rodata..Lanon.671c228b54e48000413941a013664e26.3	00000000 .rodata..Lanon.671c228b54e48000413941a013664e26.3
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E	00000162 .hidden _ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E
00000000         *UND*	00000000 .hidden _ZN3app11app_network21aggregate_sensor_data17hf40e7f12fc65329fE
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE
00000000         *UND*	00000000 _ZN6mynewt2hw10sensor_mgr14find_bydevname17haa740c072dd563deE
00000000         *UND*	00000000 _ZN6mynewt2hw6sensor17register_listener17h790fe3b095cc4881E
00000000         *UND*	00000000 _ZN6mynewt2hw6sensor19new_sensor_listener17ha8f035329ec8f4e4E
00000000         *UND*	00000000 _ZN6mynewt2hw6sensor8bindings16set_poll_rate_ms17h6f78c4355186e18dE
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h8c871956df004589E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E
00000000         *UND*	00000000 _ZN99_$LT$mynewt..hw..sensor_mgr..SensorsByDevname$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hdb4aa531ec89330aE



Disassembly of section .text._ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E:

00000000 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E>:
_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:46
///  Type of sensor: Raw temperature sensor (integer sensor values 0 to 4095)
const TEMP_SENSOR_TYPE: sensor_type_t = sensor::SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;

///  Ask Mynewt to poll or read the temperature sensor and call `aggregate_sensor_data()`
///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
pub fn start_sensor_listener() -> MynewtResult<()>  {  //  Returns an error code upon error.
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b0bb      	sub	sp, #236	; 0xec
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:47
    console::print("Rust TMP poll\n");
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	210e      	movs	r1, #14
   e:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17h67a3059d9eb8a82eE>
  12:	e7ff      	b.n	2 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:50

    //  Fetch the sensor by name.
    let sensor = sensor_mgr::find_bydevname(&SENSOR_DEVICE)
  14:	f240 0100 	movw	r1, #0
  18:	f2c0 0100 	movt	r1, #0
  1c:	a80b      	add	r0, sp, #44	; 0x2c
  1e:	f7ff fffe 	bl	0 <_ZN6mynewt2hw10sensor_mgr14find_bydevname17haa740c072dd563deE>
  22:	e7ff      	b.n	24 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x24>
  24:	a80b      	add	r0, sp, #44	; 0x2c
  26:	f7ff fffe 	bl	0 <_ZN99_$LT$mynewt..hw..sensor_mgr..SensorsByDevname$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hdb4aa531ec89330aE>
  2a:	9008      	str	r0, [sp, #32]
  2c:	9107      	str	r1, [sp, #28]
  2e:	e7ff      	b.n	30 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x30>
  30:	f240 0200 	movw	r2, #0
  34:	f2c0 0200 	movt	r2, #0
  38:	2306      	movs	r3, #6
  3a:	9808      	ldr	r0, [sp, #32]
  3c:	9907      	ldr	r1, [sp, #28]
  3e:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE>
  42:	900a      	str	r0, [sp, #40]	; 0x28
  44:	e7ff      	b.n	46 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x46>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:55
        .next()             //  Fetch the first sensor that matches
        .expect("no TMP");  //  Stop if no sensor found

    //  At power on, we ask Mynewt to poll our temperature sensor every 10 seconds.
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;
  46:	f240 0000 	movw	r0, #0
  4a:	f2c0 0000 	movt	r0, #0
  4e:	f247 5130 	movw	r1, #30000	; 0x7530
  52:	f7ff fffe 	bl	0 <_ZN6mynewt2hw6sensor8bindings16set_poll_rate_ms17h6f78c4355186e18dE>
  56:	9006      	str	r0, [sp, #24]
  58:	e7ff      	b.n	5a <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x5a>
  5a:	9806      	ldr	r0, [sp, #24]
  5c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h8c871956df004589E>
  60:	900f      	str	r0, [sp, #60]	; 0x3c
  62:	e7ff      	b.n	64 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x64>
  64:	980f      	ldr	r0, [sp, #60]	; 0x3c
  66:	1e41      	subs	r1, r0, #1
  68:	bf18      	it	ne
  6a:	2101      	movne	r1, #1
  6c:	2801      	cmp	r0, #1
  6e:	d013      	beq.n	98 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x98>
  70:	e7ff      	b.n	72 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x72>
  72:	e000      	b.n	76 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x76>
  74:	defe      	udf	#254	; 0xfe
  76:	980f      	ldr	r0, [sp, #60]	; 0x3c
  78:	9010      	str	r0, [sp, #64]	; 0x40
  7a:	9810      	ldr	r0, [sp, #64]	; 0x40
  7c:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
  80:	9005      	str	r0, [sp, #20]
  82:	e002      	b.n	8a <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x8a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:69
    //  Register the Listener Function to be called with the polled sensor data.
    sensor::register_listener(sensor, listener) ? ;  //  `?` means in case of error, return error now.

    //  Return `Ok()` to indicate success.  This line should not end with a semicolon (;).
    Ok(())
  84:	9809      	ldr	r0, [sp, #36]	; 0x24
  86:	b03b      	add	sp, #236	; 0xec
  88:	bdf0      	pop	{r4, r5, r6, r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:55
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;
  8a:	9805      	ldr	r0, [sp, #20]
  8c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
  90:	9009      	str	r0, [sp, #36]	; 0x24
  92:	e7ff      	b.n	94 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x94>
  94:	e7ff      	b.n	96 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x96>
  96:	e7f5      	b.n	84 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x84>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:58
    let listener = sensor::new_sensor_listener(
  98:	f240 0000 	movw	r0, #0
  9c:	f2c0 0000 	movt	r0, #0
  a0:	4669      	mov	r1, sp
  a2:	6008      	str	r0, [r1, #0]
  a4:	f240 0100 	movw	r1, #0
  a8:	f2c0 0100 	movt	r1, #0
  ac:	a820      	add	r0, sp, #128	; 0x80
  ae:	f04f 6280 	mov.w	r2, #67108864	; 0x4000000
  b2:	2300      	movs	r3, #0
  b4:	f7ff fffe 	bl	0 <_ZN6mynewt2hw6sensor19new_sensor_listener17ha8f035329ec8f4e4E>
  b8:	e7ff      	b.n	ba <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xba>
  ba:	a818      	add	r0, sp, #96	; 0x60
  bc:	a920      	add	r1, sp, #128	; 0x80
  be:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E>
  c2:	e7ff      	b.n	c4 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xc4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:62
    ) ? ;
  c4:	9818      	ldr	r0, [sp, #96]	; 0x60
  c6:	2800      	cmp	r0, #0
  c8:	d010      	beq.n	ec <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xec>
  ca:	e7ff      	b.n	cc <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xcc>
  cc:	e000      	b.n	d0 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xd0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:58
    let listener = sensor::new_sensor_listener(
  ce:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:62
    ) ? ;
  d0:	9819      	ldr	r0, [sp, #100]	; 0x64
  d2:	9029      	str	r0, [sp, #164]	; 0xa4
  d4:	9829      	ldr	r0, [sp, #164]	; 0xa4
  d6:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
  da:	9004      	str	r0, [sp, #16]
  dc:	e7ff      	b.n	de <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xde>
  de:	9804      	ldr	r0, [sp, #16]
  e0:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
  e4:	9009      	str	r0, [sp, #36]	; 0x24
  e6:	e7ff      	b.n	e8 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xe8>
  e8:	e7ff      	b.n	ea <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xea>
  ea:	e7d4      	b.n	96 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x96>
  ec:	a818      	add	r0, sp, #96	; 0x60
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:58
    let listener = sensor::new_sensor_listener(
  ee:	3008      	adds	r0, #8
  f0:	a92a      	add	r1, sp, #168	; 0xa8
  f2:	460a      	mov	r2, r1
  f4:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
  f8:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
  fc:	a812      	add	r0, sp, #72	; 0x48
  fe:	4602      	mov	r2, r0
 100:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
 104:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:65
    sensor::register_listener(sensor, listener) ? ;  //  `?` means in case of error, return error now.
 108:	990a      	ldr	r1, [sp, #40]	; 0x28
 10a:	aa32      	add	r2, sp, #200	; 0xc8
 10c:	4613      	mov	r3, r2
 10e:	e890 50f0 	ldmia.w	r0, {r4, r5, r6, r7, ip, lr}
 112:	e883 50f0 	stmia.w	r3, {r4, r5, r6, r7, ip, lr}
 116:	4608      	mov	r0, r1
 118:	4611      	mov	r1, r2
 11a:	f7ff fffe 	bl	0 <_ZN6mynewt2hw6sensor17register_listener17h790fe3b095cc4881E>
 11e:	9003      	str	r0, [sp, #12]
 120:	e7ff      	b.n	122 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x122>
 122:	9803      	ldr	r0, [sp, #12]
 124:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h8c871956df004589E>
 128:	9031      	str	r0, [sp, #196]	; 0xc4
 12a:	e7ff      	b.n	12c <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x12c>
 12c:	9831      	ldr	r0, [sp, #196]	; 0xc4
 12e:	1e41      	subs	r1, r0, #1
 130:	bf18      	it	ne
 132:	2101      	movne	r1, #1
 134:	2801      	cmp	r0, #1
 136:	d00f      	beq.n	158 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x158>
 138:	e7ff      	b.n	13a <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x13a>
 13a:	e000      	b.n	13e <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x13e>
 13c:	defe      	udf	#254	; 0xfe
 13e:	9831      	ldr	r0, [sp, #196]	; 0xc4
 140:	9039      	str	r0, [sp, #228]	; 0xe4
 142:	9839      	ldr	r0, [sp, #228]	; 0xe4
 144:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h2ece7be01fdee8faE>
 148:	9002      	str	r0, [sp, #8]
 14a:	e7ff      	b.n	14c <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x14c>
 14c:	9802      	ldr	r0, [sp, #8]
 14e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h8ca7b6780f95f931E>
 152:	9009      	str	r0, [sp, #36]	; 0x24
 154:	e7ff      	b.n	156 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x156>
 156:	e7c8      	b.n	ea <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0xea>
 158:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:68
    Ok(())
 15a:	9009      	str	r0, [sp, #36]	; 0x24
 15c:	2001      	movs	r0, #1
 15e:	9009      	str	r0, [sp, #36]	; 0x24
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:69
 160:	e790      	b.n	84 <_ZN3app10app_sensor21start_sensor_listener17hc47ad2069a722466E+0x84>

app-4d8274845a53ddea.42bmku6b5p71ecm7.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 42bmku6b5p71ecm7
0000022c l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
000001c5 l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
00000231 l       .debug_str	00000000 
00000239 l       .debug_str	00000000 
00000241 l       .debug_str	00000000 
00000248 l       .debug_str	00000000 
0000025c l       .debug_str	00000000 
00000268 l       .debug_str	00000000 
0000026d l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
00000098 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000ab l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c2 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000c9 l       .debug_str	00000000 
00000110 l       .debug_str	00000000 
00000123 l       .debug_str	00000000 
0000012a l       .debug_str	00000000 
0000012e l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
00000139 l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
00000000 l    d  .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE	00000000 .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE
00000000 l    d  .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E	00000000 .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E
00000000 l    d  .text._ZN4core3any6TypeId2of17h0e0d79439c7c3448E	00000000 .text._ZN4core3any6TypeId2of17h0e0d79439c7c3448E
00000000 l    d  .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE	00000000 .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE	00000030 _ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE
00000000 g     F .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E	00000036 _ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E
00000000 g     F .text._ZN4core3any6TypeId2of17h0e0d79439c7c3448E	00000030 _ZN4core3any6TypeId2of17h0e0d79439c7c3448E
00000000 g     F .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE	0000001a _ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE
00000000         *UND*	00000000 .hidden _ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E



Disassembly of section .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE:

00000000 <_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE>:
_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:183
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	9001      	str	r0, [sp, #4]
   6:	9102      	str	r1, [sp, #8]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:184
   8:	9801      	ldr	r0, [sp, #4]
   a:	9902      	ldr	r1, [sp, #8]
   c:	f7ff fffe 	bl	0 <_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE>
  10:	9000      	str	r0, [sp, #0]
  12:	e7ff      	b.n	14 <_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE+0x14>
  14:	9800      	ldr	r0, [sp, #0]
  16:	07c1      	lsls	r1, r0, #31
  18:	2900      	cmp	r1, #0
  1a:	d103      	bne.n	24 <_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE+0x24>
  1c:	e7ff      	b.n	1e <_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE+0x1e>
  1e:	2000      	movs	r0, #0
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:190
  20:	9003      	str	r0, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:184
  22:	e002      	b.n	2a <_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE+0x2a>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:187
  24:	9801      	ldr	r0, [sp, #4]
  26:	9003      	str	r0, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:184
  28:	e7ff      	b.n	2a <_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17ha0e60612626d4b2fE+0x2a>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:192
  2a:	9803      	ldr	r0, [sp, #12]
  2c:	b004      	add	sp, #16
  2e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E:

00000000 <_ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E>:
_ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:151
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	9002      	str	r0, [sp, #8]
   6:	9103      	str	r1, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:153
   8:	f7ff fffe 	bl	0 <_ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E>
   c:	9105      	str	r1, [sp, #20]
   e:	9004      	str	r0, [sp, #16]
  10:	e7ff      	b.n	12 <_ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E+0x12>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:156
  12:	9802      	ldr	r0, [sp, #8]
  14:	9903      	ldr	r1, [sp, #12]
  16:	68c9      	ldr	r1, [r1, #12]
  18:	4788      	blx	r1
  1a:	9107      	str	r1, [sp, #28]
  1c:	9006      	str	r0, [sp, #24]
  1e:	e7ff      	b.n	20 <_ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E+0x20>
  20:	a804      	add	r0, sp, #16
  22:	a906      	add	r1, sp, #24
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:159
  24:	f7ff fffe 	bl	0 <_ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E>
  28:	9001      	str	r0, [sp, #4]
  2a:	e7ff      	b.n	2c <_ZN31_$LT$dyn$u20$core..any..Any$GT$2is17ha3aa22650fcb26d6E+0x2c>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:160
  2c:	9801      	ldr	r0, [sp, #4]
  2e:	f000 0001 	and.w	r0, r0, #1
  32:	b008      	add	sp, #32
  34:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3any6TypeId2of17h0e0d79439c7c3448E:

00000000 <_ZN4core3any6TypeId2of17h0e0d79439c7c3448E>:
_ZN4core3any6TypeId2of17h0e0d79439c7c3448E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:427
   0:	b086      	sub	sp, #24
   2:	f249 40d9 	movw	r0, #38105	; 0x94d9
   6:	f2c1 1010 	movt	r0, #4368	; 0x1110
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:433
   a:	9005      	str	r0, [sp, #20]
   c:	f249 7064 	movw	r0, #38756	; 0x9764
  10:	f2c7 00b0 	movt	r0, #28848	; 0x70b0
  14:	9004      	str	r0, [sp, #16]
  16:	9804      	ldr	r0, [sp, #16]
  18:	9905      	ldr	r1, [sp, #20]
  1a:	9001      	str	r0, [sp, #4]
  1c:	9100      	str	r1, [sp, #0]
  1e:	e7ff      	b.n	20 <_ZN4core3any6TypeId2of17h0e0d79439c7c3448E+0x20>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:428
  20:	9801      	ldr	r0, [sp, #4]
  22:	9002      	str	r0, [sp, #8]
  24:	9900      	ldr	r1, [sp, #0]
  26:	9103      	str	r1, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:435
  28:	9802      	ldr	r0, [sp, #8]
  2a:	9903      	ldr	r1, [sp, #12]
  2c:	b006      	add	sp, #24
  2e:	4770      	bx	lr

Disassembly of section .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE:

00000000 <_ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE>:
_ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:276
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	9002      	str	r0, [sp, #8]
   6:	9103      	str	r1, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:277
   8:	9802      	ldr	r0, [sp, #8]
   a:	9903      	ldr	r1, [sp, #12]
   c:	f7ff fffe 	bl	0 <_ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE>
  10:	9001      	str	r0, [sp, #4]
  12:	e7ff      	b.n	14 <_ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17hd5c1ed6ed647dfdfE+0x14>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:278
  14:	9801      	ldr	r0, [sp, #4]
  16:	b004      	add	sp, #16
  18:	bd80      	pop	{r7, pc}

app-4d8274845a53ddea.4ankyzghrjz4o9mn.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4ankyzghrjz4o9mn
0000019d l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
0000009a l       .debug_str	00000000 
000000a5 l       .debug_str	00000000 
000000b0 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000001cd l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
000000fb l       .debug_str	00000000 
00000106 l       .debug_str	00000000 
00000113 l       .debug_str	00000000 
0000011f l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
00000144 l       .debug_str	00000000 
00000151 l       .debug_str	00000000 
0000015d l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
00000166 l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E	00000000 .text._ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E	00000008 .hidden _ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E



Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E:

00000000 <_ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E>:
_ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b081      	sub	sp, #4
   2:	9000      	str	r0, [sp, #0]
   4:	b001      	add	sp, #4
   6:	4770      	bx	lr

app-4d8274845a53ddea.7hka7o6bvf5lxt1.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 7hka7o6bvf5lxt1
0000012c l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
000000e9 l       .debug_str	00000000 
00000127 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
000000fc l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
0000011c l       .debug_str	00000000 
00000000 l    d  .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E	00000000 .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E	0000002a .hidden _ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E



Disassembly of section .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E:

00000000 <_ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E>:
_ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hc637f93166aeda19E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:403
   0:	b084      	sub	sp, #16
   2:	9000      	str	r0, [sp, #0]
   4:	9101      	str	r1, [sp, #4]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:406
   6:	9801      	ldr	r0, [sp, #4]
   8:	9002      	str	r0, [sp, #8]
   a:	9800      	ldr	r0, [sp, #0]
   c:	9003      	str	r0, [sp, #12]
   e:	9803      	ldr	r0, [sp, #12]
  10:	6801      	ldr	r1, [r0, #0]
  12:	6840      	ldr	r0, [r0, #4]
  14:	9a02      	ldr	r2, [sp, #8]
  16:	6813      	ldr	r3, [r2, #0]
  18:	6852      	ldr	r2, [r2, #4]
  1a:	4050      	eors	r0, r2
  1c:	4059      	eors	r1, r3
  1e:	4308      	orrs	r0, r1
  20:	fab0 f080 	clz	r0, r0
  24:	0940      	lsrs	r0, r0, #5
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:403
  26:	b004      	add	sp, #16
  28:	4770      	bx	lr

app-4d8274845a53ddea.97mm3ft5xz0mjs5.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 97mm3ft5xz0mjs5
00001bec l       .debug_str	00000000 
000025bd l       .debug_str	00000000 
000025d2 l       .debug_str	00000000 
000025fc l       .debug_str	00000000 
00002678 l       .debug_str	00000000 
000026fc l       .debug_str	00000000 
00002703 l       .debug_str	00000000 
0000270b l       .debug_str	00000000 
00002729 l       .debug_str	00000000 
00002739 l       .debug_str	00000000 
000027a9 l       .debug_str	00000000 
00002800 l       .debug_str	00000000 
00002853 l       .debug_str	00000000 
00002857 l       .debug_str	00000000 
0000285c l       .debug_str	00000000 
0000285e l       .debug_str	00000000 
00002860 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000087 l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000095 l       .debug_str	00000000 
00000099 l       .debug_str	00000000 
000000a1 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b7 l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000cf l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
00000102 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
0000011a l       .debug_str	00000000 
00000126 l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
00000141 l       .debug_str	00000000 
0000014b l       .debug_str	00000000 
00000158 l       .debug_str	00000000 
00000164 l       .debug_str	00000000 
00000169 l       .debug_str	00000000 
0000016d l       .debug_str	00000000 
00000170 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
0000018d l       .debug_str	00000000 
00000191 l       .debug_str	00000000 
00000194 l       .debug_str	00000000 
00000198 l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001a2 l       .debug_str	00000000 
000001ac l       .debug_str	00000000 
000001b7 l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001cb l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
000001eb l       .debug_str	00000000 
000001f3 l       .debug_str	00000000 
000001fb l       .debug_str	00000000 
00000205 l       .debug_str	00000000 
0000020b l       .debug_str	00000000 
00000212 l       .debug_str	00000000 
0000021c l       .debug_str	00000000 
00000223 l       .debug_str	00000000 
0000022a l       .debug_str	00000000 
0000022f l       .debug_str	00000000 
00000246 l       .debug_str	00000000 
00000273 l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
0000027a l       .debug_str	00000000 
000002af l       .debug_str	00000000 
000002b5 l       .debug_str	00000000 
000002bb l       .debug_str	00000000 
000002ca l       .debug_str	00000000 
000002da l       .debug_str	00000000 
000002ea l       .debug_str	00000000 
000002f2 l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
00000379 l       .debug_str	00000000 
000003df l       .debug_str	00000000 
000003e6 l       .debug_str	00000000 
000003ee l       .debug_str	00000000 
000003f7 l       .debug_str	00000000 
00000415 l       .debug_str	00000000 
00000425 l       .debug_str	00000000 
00000433 l       .debug_str	00000000 
0000043e l       .debug_str	00000000 
0000044b l       .debug_str	00000000 
0000045a l       .debug_str	00000000 
00000464 l       .debug_str	00000000 
0000047a l       .debug_str	00000000 
00000484 l       .debug_str	00000000 
0000048d l       .debug_str	00000000 
00000496 l       .debug_str	00000000 
000004bc l       .debug_str	00000000 
000004d2 l       .debug_str	00000000 
000004dd l       .debug_str	00000000 
000004f3 l       .debug_str	00000000 
000004fb l       .debug_str	00000000 
0000051c l       .debug_str	00000000 
00000525 l       .debug_str	00000000 
0000052e l       .debug_str	00000000 
00000539 l       .debug_str	00000000 
00000543 l       .debug_str	00000000 
00000549 l       .debug_str	00000000 
00000581 l       .debug_str	00000000 
000005c1 l       .debug_str	00000000 
000005c8 l       .debug_str	00000000 
000005d0 l       .debug_str	00000000 
000005e7 l       .debug_str	00000000 
000005f0 l       .debug_str	00000000 
00000612 l       .debug_str	00000000 
0000061c l       .debug_str	00000000 
00000643 l       .debug_str	00000000 
0000065b l       .debug_str	00000000 
00000665 l       .debug_str	00000000 
00000688 l       .debug_str	00000000 
0000068a l       .debug_str	00000000 
0000068e l       .debug_str	00000000 
000006d6 l       .debug_str	00000000 
000006df l       .debug_str	00000000 
0000071f l       .debug_str	00000000 
00000766 l       .debug_str	00000000 
0000076b l       .debug_str	00000000 
000007db l       .debug_str	00000000 
00000809 l       .debug_str	00000000 
00000833 l       .debug_str	00000000 
00000837 l       .debug_str	00000000 
0000083f l       .debug_str	00000000 
00000848 l       .debug_str	00000000 
0000084f l       .debug_str	00000000 
00000855 l       .debug_str	00000000 
0000085b l       .debug_str	00000000 
00000860 l       .debug_str	00000000 
00000868 l       .debug_str	00000000 
0000086d l       .debug_str	00000000 
000008dd l       .debug_str	00000000 
00000913 l       .debug_str	00000000 
00000945 l       .debug_str	00000000 
00000948 l       .debug_str	00000000 
0000094f l       .debug_str	00000000 
00000958 l       .debug_str	00000000 
00000967 l       .debug_str	00000000 
0000096b l       .debug_str	00000000 
00000973 l       .debug_str	00000000 
00000979 l       .debug_str	00000000 
00000985 l       .debug_str	00000000 
0000098d l       .debug_str	00000000 
000009e7 l       .debug_str	00000000 
00000a49 l       .debug_str	00000000 
00000a54 l       .debug_str	00000000 
00000a9b l       .debug_str	00000000 
00000aea l       .debug_str	00000000 
00000af4 l       .debug_str	00000000 
00000b31 l       .debug_str	00000000 
00000b76 l       .debug_str	00000000 
00000b7f l       .debug_str	00000000 
00000b8f l       .debug_str	00000000 
00000b97 l       .debug_str	00000000 
00000bec l       .debug_str	00000000 
00000c49 l       .debug_str	00000000 
00000c55 l       .debug_str	00000000 
00000c5e l       .debug_str	00000000 
00000c6a l       .debug_str	00000000 
00000c76 l       .debug_str	00000000 
00000c7f l       .debug_str	00000000 
00000c87 l       .debug_str	00000000 
00000c8f l       .debug_str	00000000 
00000ca4 l       .debug_str	00000000 
00000cab l       .debug_str	00000000 
00000ccb l       .debug_str	00000000 
00000cd2 l       .debug_str	00000000 
00000cda l       .debug_str	00000000 
00000ce4 l       .debug_str	00000000 
00000cfb l       .debug_str	00000000 
00000d00 l       .debug_str	00000000 
00000d08 l       .debug_str	00000000 
00000d11 l       .debug_str	00000000 
00000d1a l       .debug_str	00000000 
00000d23 l       .debug_str	00000000 
00000d2b l       .debug_str	00000000 
00000d32 l       .debug_str	00000000 
00000d3e l       .debug_str	00000000 
00000d49 l       .debug_str	00000000 
00000d51 l       .debug_str	00000000 
00000d59 l       .debug_str	00000000 
00000e55 l       .debug_str	00000000 
00000f59 l       .debug_str	00000000 
00000f67 l       .debug_str	00000000 
00000f72 l       .debug_str	00000000 
00000f7c l       .debug_str	00000000 
00000f90 l       .debug_str	00000000 
00000f9b l       .debug_str	00000000 
00000fc9 l       .debug_str	00000000 
00001044 l       .debug_str	00000000 
000010c7 l       .debug_str	00000000 
000010d5 l       .debug_str	00000000 
00001134 l       .debug_str	00000000 
0000119b l       .debug_str	00000000 
000011b1 l       .debug_str	00000000 
000011c1 l       .debug_str	00000000 
000011d0 l       .debug_str	00000000 
000011d4 l       .debug_str	00000000 
000011db l       .debug_str	00000000 
000011e1 l       .debug_str	00000000 
000011e5 l       .debug_str	00000000 
000011eb l       .debug_str	00000000 
000011f1 l       .debug_str	00000000 
000011fd l       .debug_str	00000000 
00001205 l       .debug_str	00000000 
0000120b l       .debug_str	00000000 
00001213 l       .debug_str	00000000 
00001219 l       .debug_str	00000000 
0000123c l       .debug_str	00000000 
0000124c l       .debug_str	00000000 
0000127f l       .debug_str	00000000 
000012bf l       .debug_str	00000000 
00001307 l       .debug_str	00000000 
0000130b l       .debug_str	00000000 
00001311 l       .debug_str	00000000 
00001317 l       .debug_str	00000000 
0000131d l       .debug_str	00000000 
0000132f l       .debug_str	00000000 
00001364 l       .debug_str	00000000 
000013a6 l       .debug_str	00000000 
000013f0 l       .debug_str	00000000 
000013f4 l       .debug_str	00000000 
000013fa l       .debug_str	00000000 
00001400 l       .debug_str	00000000 
00001406 l       .debug_str	00000000 
00001418 l       .debug_str	00000000 
0000144d l       .debug_str	00000000 
0000148f l       .debug_str	00000000 
000014d9 l       .debug_str	00000000 
000014dd l       .debug_str	00000000 
000014e3 l       .debug_str	00000000 
000014e9 l       .debug_str	00000000 
000014ef l       .debug_str	00000000 
000014f5 l       .debug_str	00000000 
00001506 l       .debug_str	00000000 
0000153a l       .debug_str	00000000 
0000157b l       .debug_str	00000000 
000015c4 l       .debug_str	00000000 
000015c9 l       .debug_str	00000000 
000015ce l       .debug_str	00000000 
000015d2 l       .debug_str	00000000 
000015d8 l       .debug_str	00000000 
000015de l       .debug_str	00000000 
000015e4 l       .debug_str	00000000 
000015f5 l       .debug_str	00000000 
00001629 l       .debug_str	00000000 
0000166a l       .debug_str	00000000 
000016b3 l       .debug_str	00000000 
000016b7 l       .debug_str	00000000 
000016c0 l       .debug_str	00000000 
000016d1 l       .debug_str	00000000 
00001705 l       .debug_str	00000000 
00001746 l       .debug_str	00000000 
0000178f l       .debug_str	00000000 
00001794 l       .debug_str	00000000 
00001798 l       .debug_str	00000000 
000017a1 l       .debug_str	00000000 
000017a8 l       .debug_str	00000000 
000017b0 l       .debug_str	00000000 
000017c2 l       .debug_str	00000000 
000017f7 l       .debug_str	00000000 
00001839 l       .debug_str	00000000 
00001883 l       .debug_str	00000000 
00001887 l       .debug_str	00000000 
0000188d l       .debug_str	00000000 
00001893 l       .debug_str	00000000 
00001899 l       .debug_str	00000000 
0000189f l       .debug_str	00000000 
000018a7 l       .debug_str	00000000 
000018b5 l       .debug_str	00000000 
000018c4 l       .debug_str	00000000 
000018d5 l       .debug_str	00000000 
000018e0 l       .debug_str	00000000 
000018eb l       .debug_str	00000000 
000018f6 l       .debug_str	00000000 
000018fd l       .debug_str	00000000 
00001920 l       .debug_str	00000000 
00001932 l       .debug_str	00000000 
00001967 l       .debug_str	00000000 
000019a9 l       .debug_str	00000000 
000019f3 l       .debug_str	00000000 
000019f7 l       .debug_str	00000000 
00001a01 l       .debug_str	00000000 
00001a13 l       .debug_str	00000000 
00001a48 l       .debug_str	00000000 
00001a8a l       .debug_str	00000000 
00001ad4 l       .debug_str	00000000 
00001ad9 l       .debug_str	00000000 
00001ae3 l       .debug_str	00000000 
00001af5 l       .debug_str	00000000 
00001b2a l       .debug_str	00000000 
00001b6c l       .debug_str	00000000 
00001bb6 l       .debug_str	00000000 
00001bca l       .debug_str	00000000 
00001bce l       .debug_str	00000000 
00001bdc l       .debug_str	00000000 
00001bf5 l       .debug_str	00000000 
00001c00 l       .debug_str	00000000 
00001c0f l       .debug_str	00000000 
00001c24 l       .debug_str	00000000 
00001c55 l       .debug_str	00000000 
00001cf2 l       .debug_str	00000000 
00001d97 l       .debug_str	00000000 
00001da2 l       .debug_str	00000000 
00001dab l       .debug_str	00000000 
00001dcc l       .debug_str	00000000 
00001ddf l       .debug_str	00000000 
00001e15 l       .debug_str	00000000 
00001e98 l       .debug_str	00000000 
00001f23 l       .debug_str	00000000 
00001f3f l       .debug_str	00000000 
00001f8b l       .debug_str	00000000 
00001fdf l       .debug_str	00000000 
00001ffc l       .debug_str	00000000 
00002010 l       .debug_str	00000000 
0000205c l       .debug_str	00000000 
000020b0 l       .debug_str	00000000 
000020c6 l       .debug_str	00000000 
000020da l       .debug_str	00000000 
00002121 l       .debug_str	00000000 
00002170 l       .debug_str	00000000 
00002179 l       .debug_str	00000000 
00002187 l       .debug_str	00000000 
000021b8 l       .debug_str	00000000 
000021be l       .debug_str	00000000 
000021c6 l       .debug_str	00000000 
000021cd l       .debug_str	00000000 
000021d5 l       .debug_str	00000000 
000021e0 l       .debug_str	00000000 
000021e8 l       .debug_str	00000000 
000021f7 l       .debug_str	00000000 
000021fb l       .debug_str	00000000 
00002206 l       .debug_str	00000000 
00002212 l       .debug_str	00000000 
0000221d l       .debug_str	00000000 
0000222e l       .debug_str	00000000 
00002234 l       .debug_str	00000000 
0000223c l       .debug_str	00000000 
00002243 l       .debug_str	00000000 
0000224d l       .debug_str	00000000 
00002255 l       .debug_str	00000000 
0000225d l       .debug_str	00000000 
0000227f l       .debug_str	00000000 
0000228a l       .debug_str	00000000 
00002296 l       .debug_str	00000000 
0000229e l       .debug_str	00000000 
000022a7 l       .debug_str	00000000 
000022b2 l       .debug_str	00000000 
000022b9 l       .debug_str	00000000 
000022c4 l       .debug_str	00000000 
000022cf l       .debug_str	00000000 
000022df l       .debug_str	00000000 
000022ef l       .debug_str	00000000 
00002322 l       .debug_str	00000000 
00002337 l       .debug_str	00000000 
00002340 l       .debug_str	00000000 
0000239d l       .debug_str	00000000 
00002402 l       .debug_str	00000000 
0000240c l       .debug_str	00000000 
0000241c l       .debug_str	00000000 
00002431 l       .debug_str	00000000 
00002439 l       .debug_str	00000000 
0000249d l       .debug_str	00000000 
00002509 l       .debug_str	00000000 
00002510 l       .debug_str	00000000 
00002518 l       .debug_str	00000000 
00002536 l       .debug_str	00000000 
00002546 l       .debug_str	00000000 
00002579 l       .debug_str	00000000 
0000258e l       .debug_str	00000000 
000025a1 l       .debug_str	00000000 
000025b6 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.a8d7c59176e5a5245bb537672d224456.0	00000010 .Lanon.a8d7c59176e5a5245bb537672d224456.0
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E
00000000 l    d  .rodata..Lanon.a8d7c59176e5a5245bb537672d224456.0	00000000 .rodata..Lanon.a8d7c59176e5a5245bb537672d224456.0
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core3ptr18real_drop_in_place17h5a2f0e1a4412f762E
00000000         *UND*	00000000 _ZN4core6result13unwrap_failed17h7251308ec569cdc6E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE	0000004a _ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE
00000000         *UND*	00000000 _ZN64_$LT$mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17h47f67cce6ea143caE
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E	0000000a _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E	00000016 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E	00000014 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E



Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE>:
_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:981
   0:	b086      	sub	sp, #24
   2:	9102      	str	r1, [sp, #8]
   4:	9203      	str	r2, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:983
   6:	6801      	ldr	r1, [r0, #0]
   8:	2900      	cmp	r1, #0
   a:	9001      	str	r0, [sp, #4]
   c:	d002      	beq.n	14 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE+0x14>
   e:	e7ff      	b.n	10 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE+0x10>
  10:	e00a      	b.n	28 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE+0x28>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:982
  12:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:983
  14:	9801      	ldr	r0, [sp, #4]
  16:	6841      	ldr	r1, [r0, #4]
  18:	9104      	str	r1, [sp, #16]
  1a:	9804      	ldr	r0, [sp, #16]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:986
  1c:	9901      	ldr	r1, [sp, #4]
  1e:	680a      	ldr	r2, [r1, #0]
  20:	2a00      	cmp	r2, #0
  22:	9000      	str	r0, [sp, #0]
  24:	d00d      	beq.n	42 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE+0x42>
  26:	e00f      	b.n	48 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE+0x48>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:984
  28:	9801      	ldr	r0, [sp, #4]
  2a:	6841      	ldr	r1, [r0, #4]
  2c:	9105      	str	r1, [sp, #20]
  2e:	9802      	ldr	r0, [sp, #8]
  30:	9903      	ldr	r1, [sp, #12]
  32:	f240 0300 	movw	r3, #0
  36:	f2c0 0300 	movt	r3, #0
  3a:	aa05      	add	r2, sp, #20
  3c:	f7ff fffe 	bl	0 <_ZN4core6result13unwrap_failed17h7251308ec569cdc6E>
  40:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:986
  42:	9800      	ldr	r0, [sp, #0]
  44:	b006      	add	sp, #24
  46:	4770      	bx	lr
  48:	e7fb      	b.n	42 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h6786869e8992dbdaE+0x42>

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h7b4cb96d7d55ad47E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1462
   0:	680a      	ldr	r2, [r1, #0]
   2:	6849      	ldr	r1, [r1, #4]
   4:	6041      	str	r1, [r0, #4]
   6:	6002      	str	r2, [r0, #0]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1463
   8:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hc4996e42b9051c93E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1462
   0:	680a      	ldr	r2, [r1, #0]
   2:	684b      	ldr	r3, [r1, #4]
   4:	f8d1 c008 	ldr.w	ip, [r1, #8]
   8:	68c9      	ldr	r1, [r1, #12]
   a:	60c1      	str	r1, [r0, #12]
   c:	f8c0 c008 	str.w	ip, [r0, #8]
  10:	6043      	str	r3, [r0, #4]
  12:	6002      	str	r2, [r0, #0]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1463
  14:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he697018420beead5E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1461
   0:	b580      	push	{r7, lr}
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1462
   2:	e8b1 500c 	ldmia.w	r1!, {r2, r3, ip, lr}
   6:	e8a0 500c 	stmia.w	r0!, {r2, r3, ip, lr}
   a:	e891 500c 	ldmia.w	r1, {r2, r3, ip, lr}
   e:	e880 500c 	stmia.w	r0, {r2, r3, ip, lr}
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1463
  12:	bd80      	pop	{r7, pc}

app-4d8274845a53ddea.a49mos1gfb3cgxn.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 a49mos1gfb3cgxn
00001d53 l       .debug_str	00000000 
0000233e l       .debug_str	00000000 
00002345 l       .debug_str	00000000 
0000234b l       .debug_str	00000000 
00002350 l       .debug_str	00000000 
00002356 l       .debug_str	00000000 
00002364 l       .debug_str	00000000 
000023a0 l       .debug_str	00000000 
000023d2 l       .debug_str	00000000 
0000240e l       .debug_str	00000000 
0000241c l       .debug_str	00000000 
00002421 l       .debug_str	00000000 
00002425 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000b0 l       .debug_str	00000000 
000000b4 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000c0 l       .debug_str	00000000 
000000c3 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000d3 l       .debug_str	00000000 
000000d9 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000e3 l       .debug_str	00000000 
000000ef l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
000000fb l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
0000016c l       .debug_str	00000000 
0000016e l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
000001d9 l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
0000022b l       .debug_str	00000000 
0000027a l       .debug_str	00000000 
00000284 l       .debug_str	00000000 
000002c1 l       .debug_str	00000000 
00000306 l       .debug_str	00000000 
0000030f l       .debug_str	00000000 
0000031f l       .debug_str	00000000 
00000327 l       .debug_str	00000000 
0000037c l       .debug_str	00000000 
000003d9 l       .debug_str	00000000 
000003e5 l       .debug_str	00000000 
000003ee l       .debug_str	00000000 
000003fa l       .debug_str	00000000 
00000406 l       .debug_str	00000000 
0000040f l       .debug_str	00000000 
00000417 l       .debug_str	00000000 
00000421 l       .debug_str	00000000 
00000429 l       .debug_str	00000000 
00000433 l       .debug_str	00000000 
00000448 l       .debug_str	00000000 
0000044f l       .debug_str	00000000 
0000046f l       .debug_str	00000000 
00000476 l       .debug_str	00000000 
0000047e l       .debug_str	00000000 
00000488 l       .debug_str	00000000 
00000493 l       .debug_str	00000000 
0000049c l       .debug_str	00000000 
000004a7 l       .debug_str	00000000 
000004b3 l       .debug_str	00000000 
000004b7 l       .debug_str	00000000 
000004c0 l       .debug_str	00000000 
000004c7 l       .debug_str	00000000 
000004cf l       .debug_str	00000000 
000004d7 l       .debug_str	00000000 
000004e1 l       .debug_str	00000000 
000004e7 l       .debug_str	00000000 
000004ee l       .debug_str	00000000 
000004f5 l       .debug_str	00000000 
00000522 l       .debug_str	00000000 
00000557 l       .debug_str	00000000 
0000055d l       .debug_str	00000000 
00000563 l       .debug_str	00000000 
00000572 l       .debug_str	00000000 
00000582 l       .debug_str	00000000 
00000592 l       .debug_str	00000000 
0000059a l       .debug_str	00000000 
000005c3 l       .debug_str	00000000 
00000621 l       .debug_str	00000000 
00000687 l       .debug_str	00000000 
0000068e l       .debug_str	00000000 
00000696 l       .debug_str	00000000 
0000069f l       .debug_str	00000000 
000006bd l       .debug_str	00000000 
000006cd l       .debug_str	00000000 
000006db l       .debug_str	00000000 
000006e6 l       .debug_str	00000000 
000006f3 l       .debug_str	00000000 
00000702 l       .debug_str	00000000 
00000718 l       .debug_str	00000000 
00000722 l       .debug_str	00000000 
0000072b l       .debug_str	00000000 
00000734 l       .debug_str	00000000 
0000075a l       .debug_str	00000000 
00000770 l       .debug_str	00000000 
0000077b l       .debug_str	00000000 
00000791 l       .debug_str	00000000 
00000799 l       .debug_str	00000000 
000007ba l       .debug_str	00000000 
000007d1 l       .debug_str	00000000 
000007d6 l       .debug_str	00000000 
000007de l       .debug_str	00000000 
000007e7 l       .debug_str	00000000 
000007f0 l       .debug_str	00000000 
000007f9 l       .debug_str	00000000 
00000801 l       .debug_str	00000000 
00000805 l       .debug_str	00000000 
0000080c l       .debug_str	00000000 
00000818 l       .debug_str	00000000 
00000823 l       .debug_str	00000000 
0000082b l       .debug_str	00000000 
00000833 l       .debug_str	00000000 
000008af l       .debug_str	00000000 
00000933 l       .debug_str	00000000 
00000a2f l       .debug_str	00000000 
00000b33 l       .debug_str	00000000 
00000b41 l       .debug_str	00000000 
00000b4c l       .debug_str	00000000 
00000b56 l       .debug_str	00000000 
00000b6a l       .debug_str	00000000 
00000b75 l       .debug_str	00000000 
00000ba3 l       .debug_str	00000000 
00000c1e l       .debug_str	00000000 
00000ca1 l       .debug_str	00000000 
00000caf l       .debug_str	00000000 
00000d0e l       .debug_str	00000000 
00000d75 l       .debug_str	00000000 
00000d8b l       .debug_str	00000000 
00000d9b l       .debug_str	00000000 
00000daa l       .debug_str	00000000 
00000dae l       .debug_str	00000000 
00000db5 l       .debug_str	00000000 
00000dbb l       .debug_str	00000000 
00000dbf l       .debug_str	00000000 
00000dc5 l       .debug_str	00000000 
00000dcb l       .debug_str	00000000 
00000dd7 l       .debug_str	00000000 
00000ddf l       .debug_str	00000000 
00000de5 l       .debug_str	00000000 
00000ded l       .debug_str	00000000 
00000df3 l       .debug_str	00000000 
00000e16 l       .debug_str	00000000 
00000e26 l       .debug_str	00000000 
00000e59 l       .debug_str	00000000 
00000e99 l       .debug_str	00000000 
00000ee1 l       .debug_str	00000000 
00000ee5 l       .debug_str	00000000 
00000eeb l       .debug_str	00000000 
00000ef1 l       .debug_str	00000000 
00000ef7 l       .debug_str	00000000 
00000f09 l       .debug_str	00000000 
00000f3e l       .debug_str	00000000 
00000f80 l       .debug_str	00000000 
00000fca l       .debug_str	00000000 
00000fce l       .debug_str	00000000 
00000fd4 l       .debug_str	00000000 
00000fda l       .debug_str	00000000 
00000fe0 l       .debug_str	00000000 
00000ff2 l       .debug_str	00000000 
00001027 l       .debug_str	00000000 
00001069 l       .debug_str	00000000 
000010b3 l       .debug_str	00000000 
000010b7 l       .debug_str	00000000 
000010bd l       .debug_str	00000000 
000010c3 l       .debug_str	00000000 
000010c9 l       .debug_str	00000000 
000010cf l       .debug_str	00000000 
000010e0 l       .debug_str	00000000 
00001114 l       .debug_str	00000000 
00001155 l       .debug_str	00000000 
0000119e l       .debug_str	00000000 
000011a3 l       .debug_str	00000000 
000011a8 l       .debug_str	00000000 
000011ac l       .debug_str	00000000 
000011b2 l       .debug_str	00000000 
000011b8 l       .debug_str	00000000 
000011be l       .debug_str	00000000 
000011cf l       .debug_str	00000000 
00001203 l       .debug_str	00000000 
00001244 l       .debug_str	00000000 
0000128d l       .debug_str	00000000 
00001291 l       .debug_str	00000000 
0000129a l       .debug_str	00000000 
000012ab l       .debug_str	00000000 
000012df l       .debug_str	00000000 
00001320 l       .debug_str	00000000 
00001369 l       .debug_str	00000000 
0000136e l       .debug_str	00000000 
00001372 l       .debug_str	00000000 
0000137b l       .debug_str	00000000 
00001382 l       .debug_str	00000000 
0000138a l       .debug_str	00000000 
0000139c l       .debug_str	00000000 
000013d1 l       .debug_str	00000000 
00001413 l       .debug_str	00000000 
0000145d l       .debug_str	00000000 
00001461 l       .debug_str	00000000 
00001467 l       .debug_str	00000000 
0000146d l       .debug_str	00000000 
00001473 l       .debug_str	00000000 
00001479 l       .debug_str	00000000 
00001481 l       .debug_str	00000000 
0000148f l       .debug_str	00000000 
0000149e l       .debug_str	00000000 
000014af l       .debug_str	00000000 
000014ba l       .debug_str	00000000 
000014c5 l       .debug_str	00000000 
000014d0 l       .debug_str	00000000 
000014d7 l       .debug_str	00000000 
000014fa l       .debug_str	00000000 
0000150c l       .debug_str	00000000 
00001541 l       .debug_str	00000000 
00001583 l       .debug_str	00000000 
000015cd l       .debug_str	00000000 
000015d1 l       .debug_str	00000000 
000015db l       .debug_str	00000000 
000015ed l       .debug_str	00000000 
00001622 l       .debug_str	00000000 
00001664 l       .debug_str	00000000 
000016ae l       .debug_str	00000000 
000016b3 l       .debug_str	00000000 
000016bd l       .debug_str	00000000 
000016cf l       .debug_str	00000000 
00001704 l       .debug_str	00000000 
00001746 l       .debug_str	00000000 
00001790 l       .debug_str	00000000 
000017a4 l       .debug_str	00000000 
000017a8 l       .debug_str	00000000 
000017b6 l       .debug_str	00000000 
000017c6 l       .debug_str	00000000 
000017cf l       .debug_str	00000000 
000017da l       .debug_str	00000000 
000017e9 l       .debug_str	00000000 
000017fe l       .debug_str	00000000 
0000182f l       .debug_str	00000000 
000018cc l       .debug_str	00000000 
00001971 l       .debug_str	00000000 
0000197c l       .debug_str	00000000 
00001985 l       .debug_str	00000000 
000019a6 l       .debug_str	00000000 
000019b9 l       .debug_str	00000000 
000019ef l       .debug_str	00000000 
00001a72 l       .debug_str	00000000 
00001afd l       .debug_str	00000000 
00001b19 l       .debug_str	00000000 
00001b65 l       .debug_str	00000000 
00001bb9 l       .debug_str	00000000 
00001bd6 l       .debug_str	00000000 
00001bea l       .debug_str	00000000 
00001c36 l       .debug_str	00000000 
00001c8a l       .debug_str	00000000 
00001ca0 l       .debug_str	00000000 
00001cb4 l       .debug_str	00000000 
00001cfb l       .debug_str	00000000 
00001d4a l       .debug_str	00000000 
00001d61 l       .debug_str	00000000 
00001d92 l       .debug_str	00000000 
00001d98 l       .debug_str	00000000 
00001da0 l       .debug_str	00000000 
00001da7 l       .debug_str	00000000 
00001daf l       .debug_str	00000000 
00001dba l       .debug_str	00000000 
00001dc2 l       .debug_str	00000000 
00001dd1 l       .debug_str	00000000 
00001dd5 l       .debug_str	00000000 
00001de0 l       .debug_str	00000000 
00001dec l       .debug_str	00000000 
00001df7 l       .debug_str	00000000 
00001e08 l       .debug_str	00000000 
00001e0e l       .debug_str	00000000 
00001e16 l       .debug_str	00000000 
00001e1d l       .debug_str	00000000 
00001e27 l       .debug_str	00000000 
00001e2f l       .debug_str	00000000 
00001e37 l       .debug_str	00000000 
00001e59 l       .debug_str	00000000 
00001e64 l       .debug_str	00000000 
00001e70 l       .debug_str	00000000 
00001e78 l       .debug_str	00000000 
00001e81 l       .debug_str	00000000 
00001e8c l       .debug_str	00000000 
00001e93 l       .debug_str	00000000 
00001e9e l       .debug_str	00000000 
00001ea9 l       .debug_str	00000000 
00001eb9 l       .debug_str	00000000 
00001ec3 l       .debug_str	00000000 
00001ec9 l       .debug_str	00000000 
00001eeb l       .debug_str	00000000 
00001f23 l       .debug_str	00000000 
00001f63 l       .debug_str	00000000 
00001f6a l       .debug_str	00000000 
00001f72 l       .debug_str	00000000 
00001f89 l       .debug_str	00000000 
00001f92 l       .debug_str	00000000 
00001fa2 l       .debug_str	00000000 
00001fb1 l       .debug_str	00000000 
00001fb9 l       .debug_str	00000000 
00001fc0 l       .debug_str	00000000 
00001fc8 l       .debug_str	00000000 
00001fe6 l       .debug_str	00000000 
00001ff6 l       .debug_str	00000000 
00002029 l       .debug_str	00000000 
0000203e l       .debug_str	00000000 
00002047 l       .debug_str	00000000 
000020a4 l       .debug_str	00000000 
00002109 l       .debug_str	00000000 
00002113 l       .debug_str	00000000 
00002123 l       .debug_str	00000000 
00002138 l       .debug_str	00000000 
00002140 l       .debug_str	00000000 
000021a4 l       .debug_str	00000000 
00002210 l       .debug_str	00000000 
00002217 l       .debug_str	00000000 
0000221f l       .debug_str	00000000 
0000223d l       .debug_str	00000000 
0000224d l       .debug_str	00000000 
00002280 l       .debug_str	00000000 
00002295 l       .debug_str	00000000 
000022a8 l       .debug_str	00000000 
000022bd l       .debug_str	00000000 
000022c4 l       .debug_str	00000000 
000022d9 l       .debug_str	00000000 
00002303 l       .debug_str	00000000 
00002335 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.ba7f43b563a4e7db006521c68af7d458.0	0000002b .Lanon.ba7f43b563a4e7db006521c68af7d458.0
00000000 l     O .rodata..Lanon.ba7f43b563a4e7db006521c68af7d458.2	00000010 .Lanon.ba7f43b563a4e7db006521c68af7d458.2
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE	00000000 .text._ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E	00000000 .text._ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E
00000000 l    d  .rodata..Lanon.ba7f43b563a4e7db006521c68af7d458.1	00000000 .rodata..Lanon.ba7f43b563a4e7db006521c68af7d458.1
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core6option13expect_failed17hf5665627dddd4106E
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE	00000038 _ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E	00000052 _ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E
00000000         *UND*	00000000 _ZN4core9panicking5panic17hfdd0eecc44a682f8E



Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE:

00000000 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE>:
_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:344
   0:	b086      	sub	sp, #24
   2:	9001      	str	r0, [sp, #4]
   4:	9102      	str	r1, [sp, #8]
   6:	9203      	str	r2, [sp, #12]
   8:	9304      	str	r3, [sp, #16]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:346
   a:	9801      	ldr	r0, [sp, #4]
   c:	2800      	cmp	r0, #0
   e:	d001      	beq.n	14 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE+0x14>
  10:	e7ff      	b.n	12 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE+0x12>
  12:	e005      	b.n	20 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE+0x20>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:347
  14:	9803      	ldr	r0, [sp, #12]
  16:	9904      	ldr	r1, [sp, #16]
  18:	f7ff fffe 	bl	0 <_ZN4core6option13expect_failed17hf5665627dddd4106E>
  1c:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:345
  1e:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:346
  20:	9802      	ldr	r0, [sp, #8]
  22:	9005      	str	r0, [sp, #20]
  24:	9805      	ldr	r0, [sp, #20]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:349
  26:	9901      	ldr	r1, [sp, #4]
  28:	2901      	cmp	r1, #1
  2a:	9000      	str	r0, [sp, #0]
  2c:	d103      	bne.n	36 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE+0x36>
  2e:	e7ff      	b.n	30 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE+0x30>
  30:	9800      	ldr	r0, [sp, #0]
  32:	b006      	add	sp, #24
  34:	4770      	bx	lr
  36:	e7fb      	b.n	30 <_ZN4core6option15Option$LT$T$GT$6expect17h242975e5abec498cE+0x30>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E:

00000000 <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E>:
_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:377
   0:	b086      	sub	sp, #24
   2:	9003      	str	r0, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:379
   4:	9803      	ldr	r0, [sp, #12]
   6:	2800      	cmp	r0, #0
   8:	4601      	mov	r1, r0
   a:	bf18      	it	ne
   c:	2101      	movne	r1, #1
   e:	2800      	cmp	r0, #0
  10:	d001      	beq.n	16 <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E+0x16>
  12:	e7ff      	b.n	14 <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E+0x14>
  14:	e008      	b.n	28 <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E+0x28>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/macros/mod.rs:15
  16:	f240 0000 	movw	r0, #0
  1a:	f2c0 0000 	movt	r0, #0
  1e:	9005      	str	r0, [sp, #20]
  20:	9a05      	ldr	r2, [sp, #20]
  22:	9202      	str	r2, [sp, #8]
  24:	e008      	b.n	38 <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E+0x38>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:378
  26:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:379
  28:	9803      	ldr	r0, [sp, #12]
  2a:	9004      	str	r0, [sp, #16]
  2c:	9804      	ldr	r0, [sp, #16]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:382
  2e:	9903      	ldr	r1, [sp, #12]
  30:	2900      	cmp	r1, #0
  32:	9001      	str	r0, [sp, #4]
  34:	d109      	bne.n	4a <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E+0x4a>
  36:	e00b      	b.n	50 <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E+0x50>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/macros/mod.rs:15
  38:	f240 0000 	movw	r0, #0
  3c:	f2c0 0000 	movt	r0, #0
  40:	212b      	movs	r1, #43	; 0x2b
  42:	9a02      	ldr	r2, [sp, #8]
  44:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17hfdd0eecc44a682f8E>
  48:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:382
  4a:	9801      	ldr	r0, [sp, #4]
  4c:	b006      	add	sp, #24
  4e:	4770      	bx	lr
  50:	e7fb      	b.n	4a <_ZN4core6option15Option$LT$T$GT$6unwrap17hcb7fec6a3783b4c2E+0x4a>
arm-none-eabi-objdump: lib.rmeta: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.1ltec54641atac0l.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.1mgeg98q8vf0g5gy.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.2a4pw9umk58xgwlr.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.2qu1gk0h5ngjdzom.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.3hmkm5yr9fuwuecf.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.42bmku6b5p71ecm7.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.4ankyzghrjz4o9mn.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.7hka7o6bvf5lxt1.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.97mm3ft5xz0mjs5.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-4d8274845a53ddea.a49mos1gfb3cgxn.rcgu.bc.z: File format not recognized
