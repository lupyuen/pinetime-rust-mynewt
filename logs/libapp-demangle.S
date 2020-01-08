In archive target/thumbv7em-none-eabihf/debug/libapp.rlib:

app-1da0d8acf4e589c0.15yydn68vvmvuok2.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 15yydn68vvmvuok2
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
00000000 l    d  .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17hb3db7d67075797a4E	00000000 .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17hb3db7d67075797a4E
00000000 l    d  .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17hb67258135e8f556bE	00000000 .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17hb67258135e8f556bE
00000000 l    d  .text._ZN4core3any6TypeId2of17h08ed8b5d09166281E	00000000 .text._ZN4core3any6TypeId2of17h08ed8b5d09166281E
00000000 l    d  .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17h5a2112e4b351a01bE	00000000 .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17h5a2112e4b351a01bE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17hb3db7d67075797a4E	00000030 <dyn core::any::Any>::downcast_ref
00000000 g     F .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17hb67258135e8f556bE	00000036 <dyn core::any::Any>::is
00000000 g     F .text._ZN4core3any6TypeId2of17h08ed8b5d09166281E	00000030 core::any::TypeId::of
00000000 g     F .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17h5a2112e4b351a01bE	0000001a <dyn core::any::Any+core::marker::Send>::downcast_ref
00000000         *UND*	00000000 .hidden <core::any::TypeId as core::cmp::PartialEq>::eq



Disassembly of section .text._ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17hb3db7d67075797a4E:

00000000 <<dyn core::any::Any>::downcast_ref>:
_ZN31_$LT$dyn$u20$core..any..Any$GT$12downcast_ref17hb3db7d67075797a4E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:183
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	9001      	str	r0, [sp, #4]
   6:	9102      	str	r1, [sp, #8]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:184
   8:	9801      	ldr	r0, [sp, #4]
   a:	9902      	ldr	r1, [sp, #8]
   c:	f7ff fffe 	bl	0 <<dyn core::any::Any>::downcast_ref>
  10:	9000      	str	r0, [sp, #0]
  12:	e7ff      	b.n	14 <<dyn core::any::Any>::downcast_ref+0x14>
  14:	9800      	ldr	r0, [sp, #0]
  16:	07c1      	lsls	r1, r0, #31
  18:	2900      	cmp	r1, #0
  1a:	d103      	bne.n	24 <<dyn core::any::Any>::downcast_ref+0x24>
  1c:	e7ff      	b.n	1e <<dyn core::any::Any>::downcast_ref+0x1e>
  1e:	2000      	movs	r0, #0
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:190
  20:	9003      	str	r0, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:184
  22:	e002      	b.n	2a <<dyn core::any::Any>::downcast_ref+0x2a>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:187
  24:	9801      	ldr	r0, [sp, #4]
  26:	9003      	str	r0, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:184
  28:	e7ff      	b.n	2a <<dyn core::any::Any>::downcast_ref+0x2a>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:192
  2a:	9803      	ldr	r0, [sp, #12]
  2c:	b004      	add	sp, #16
  2e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN31_$LT$dyn$u20$core..any..Any$GT$2is17hb67258135e8f556bE:

00000000 <<dyn core::any::Any>::is>:
_ZN31_$LT$dyn$u20$core..any..Any$GT$2is17hb67258135e8f556bE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:151
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	9002      	str	r0, [sp, #8]
   6:	9103      	str	r1, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:153
   8:	f7ff fffe 	bl	0 <<dyn core::any::Any>::is>
   c:	9105      	str	r1, [sp, #20]
   e:	9004      	str	r0, [sp, #16]
  10:	e7ff      	b.n	12 <<dyn core::any::Any>::is+0x12>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:156
  12:	9802      	ldr	r0, [sp, #8]
  14:	9903      	ldr	r1, [sp, #12]
  16:	68c9      	ldr	r1, [r1, #12]
  18:	4788      	blx	r1
  1a:	9107      	str	r1, [sp, #28]
  1c:	9006      	str	r0, [sp, #24]
  1e:	e7ff      	b.n	20 <<dyn core::any::Any>::is+0x20>
  20:	a804      	add	r0, sp, #16
  22:	a906      	add	r1, sp, #24
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:159
  24:	f7ff fffe 	bl	0 <<core::any::TypeId as core::cmp::PartialEq>::eq>
  28:	9001      	str	r0, [sp, #4]
  2a:	e7ff      	b.n	2c <<dyn core::any::Any>::is+0x2c>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:160
  2c:	9801      	ldr	r0, [sp, #4]
  2e:	f000 0001 	and.w	r0, r0, #1
  32:	b008      	add	sp, #32
  34:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3any6TypeId2of17h08ed8b5d09166281E:

00000000 <core::any::TypeId::of>:
_ZN4core3any6TypeId2of17h08ed8b5d09166281E():
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
  1e:	e7ff      	b.n	20 <core::any::TypeId::of+0x20>
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

Disassembly of section .text._ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17h5a2112e4b351a01bE:

00000000 <<dyn core::any::Any+core::marker::Send>::downcast_ref>:
_ZN54_$LT$dyn$u20$core..any..Any$u2b$core..marker..Send$GT$12downcast_ref17h5a2112e4b351a01bE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:276
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	9002      	str	r0, [sp, #8]
   6:	9103      	str	r1, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:277
   8:	9802      	ldr	r0, [sp, #8]
   a:	9903      	ldr	r1, [sp, #12]
   c:	f7ff fffe 	bl	0 <<dyn core::any::Any+core::marker::Send>::downcast_ref>
  10:	9001      	str	r0, [sp, #4]
  12:	e7ff      	b.n	14 <<dyn core::any::Any+core::marker::Send>::downcast_ref+0x14>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/any.rs:278
  14:	9801      	ldr	r0, [sp, #4]
  16:	b004      	add	sp, #16
  18:	bd80      	pop	{r7, pc}

app-1da0d8acf4e589c0.185rybjag3u6nz1y.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 185rybjag3u6nz1y
0000074d l       .debug_str	00000000 
000001f3 l       .debug_str	00000000 
0000028c l       .debug_str	00000000 
000002c5 l       .debug_str	00000000 
000002c7 l       .debug_str	00000000 
000002c9 l       .debug_str	00000000 
00000307 l       .debug_str	00000000 
0000039e l       .debug_str	00000000 
000003d2 l       .debug_str	00000000 
0000046f l       .debug_str	00000000 
00000508 l       .debug_str	00000000 
0000053c l       .debug_str	00000000 
00000545 l       .debug_str	00000000 
00000553 l       .debug_str	00000000 
0000056b l       .debug_str	00000000 
00000579 l       .debug_str	00000000 
000005ae l       .debug_str	00000000 
00000608 l       .debug_str	00000000 
000006bf l       .debug_str	00000000 
000006fa l       .debug_str	00000000 
00000780 l       .debug_str	00000000 
00000785 l       .debug_str	00000000 
0000078b l       .debug_str	00000000 
000007e9 l       .debug_str	00000000 
00000853 l       .debug_str	00000000 
00000856 l       .debug_str	00000000 
00000859 l       .debug_str	00000000 
00000866 l       .debug_str	00000000 
00000870 l       .debug_str	00000000 
00000880 l       .debug_str	00000000 
00000885 l       .debug_str	00000000 
00000889 l       .debug_str	00000000 
000008c3 l       .debug_str	00000000 
00000905 l       .debug_str	00000000 
00000908 l       .debug_str	00000000 
0000090b l       .debug_str	00000000 
0000090f l       .debug_str	00000000 
00000919 l       .debug_str	00000000 
0000091e l       .debug_str	00000000 
00000926 l       .debug_str	00000000 
00000928 l       .debug_str	00000000 
00000932 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a4 l       .debug_str	00000000 
000000ad l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000bf l       .debug_str	00000000 
000000ce l       .debug_str	00000000 
000000d2 l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000da l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000e7 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
000000fc l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000108 l       .debug_str	00000000 
0000010c l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
0000011c l       .debug_str	00000000 
00000123 l       .debug_str	00000000 
0000012a l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000167 l       .debug_str	00000000 
00000174 l       .debug_str	00000000 
00000181 l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.1	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.1
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.10	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.10
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.11	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.11
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.12	00000018 .Lanon.face4df1cbc3c0962321bb53366cd18c.12
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.13	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.13
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.14	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.14
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.15	00000016 .Lanon.face4df1cbc3c0962321bb53366cd18c.15
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.16	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.16
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.17	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.17
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.18	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.18
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.2	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.2
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.3	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.3
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.4	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.4
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.5	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.5
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.6	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.6
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.7	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.7
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.8	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.8
00000000 l     O .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.9	00000010 .Lanon.face4df1cbc3c0962321bb53366cd18c.9
00000000 l     O .rodata.str.0	0000001f str.0
00000000 l     O .rodata.str.1	00000021 str.1
00000000 l     O .rodata.str.2	0000001c str.2
00000000 l     O .rodata.str.3	00000021 str.3
00000000 l    d  .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hbacd3fd4f206f424E	00000000 .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hbacd3fd4f206f424E
00000000 l    d  .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hd67f15604081411bE	00000000 .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hd67f15604081411bE
00000000 l    d  .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h88b29a4abcbe9d29E	00000000 .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h88b29a4abcbe9d29E
00000000 l    d  .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha364ae81aac3c531E	00000000 .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha364ae81aac3c531E
00000000 l    d  .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h8b4a68e21d586b7fE	00000000 .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h8b4a68e21d586b7fE
00000000 l    d  .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17h160e5b58c34c5d86E	00000000 .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17h160e5b58c34c5d86E
00000000 l    d  .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.0	00000000 .rodata..Lanon.face4df1cbc3c0962321bb53366cd18c.0
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 <embedded_graphics::coord::internal_coord::Coord as core::ops::index::Index<usize>>::index
00000000         *UND*	00000000 <embedded_graphics::coord::internal_coord::Coord as embedded_graphics::coord::ToUnsigned>::to_unsigned
00000000 g     F .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hbacd3fd4f206f424E	0000000a <embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter
00000000 g     F .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hd67f15604081411bE	00000028 <embedded_graphics::primitives::circle::Circle<C> as embedded_graphics::style::WithStyle<C>>::fill
00000000 g     F .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h88b29a4abcbe9d29E	000000b2 <&embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter
00000000 g     F .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha364ae81aac3c531E	00000540 <embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next
00000000 g     F .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h8b4a68e21d586b7fE	00000048 <embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next::{{closure}}
00000000 g     F .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17h160e5b58c34c5d86E	0000004e embedded_graphics::primitives::circle::Circle<C>::new
00000000         *UND*	00000000 embedded_graphics::coord::internal_coord::Coord::new
00000000         *UND*	00000000 core::option::Option<T>::map
00000000         *UND*	00000000 core::option::Option<T>::expect
00000000         *UND*	00000000 core::option::Option<T>::is_none
00000000         *UND*	00000000 core::option::Option<T>::is_some
00000000         *UND*	00000000 core::panicking::panic
00000000         *UND*	00000000 <embedded_graphics::style::Style<P> as core::default::Default>::default



Disassembly of section .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hbacd3fd4f206f424E:

00000000 <<embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter>:
_ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hbacd3fd4f206f424E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:128
    C: PixelColor,
{
    type Item = Pixel<C>;
    type IntoIter = CircleIterator<C>;

    fn into_iter(self) -> Self::IntoIter {
   0:	b580      	push	{r7, lr}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:129
        (&self).into_iter()
   2:	f7ff fffe 	bl	0 <<embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter>
   6:	e7ff      	b.n	8 <<embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter+0x8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:130
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hd67f15604081411bE:

00000000 <<embedded_graphics::primitives::circle::Circle<C> as embedded_graphics::style::WithStyle<C>>::fill>:
_ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hd67f15604081411bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:114
    fn fill(mut self, color: Option<C>) -> Self {
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b081      	sub	sp, #4
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	f8ad 2000 	strh.w	r2, [sp]
   c:	f8ad 3002 	strh.w	r3, [sp, #2]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:115
        self.style.fill_color = color;
  10:	f8bd 2000 	ldrh.w	r2, [sp]
  14:	f8bd 3002 	ldrh.w	r3, [sp, #2]
  18:	818a      	strh	r2, [r1, #12]
  1a:	81cb      	strh	r3, [r1, #14]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:117
        self
  1c:	e891 00fc 	ldmia.w	r1, {r2, r3, r4, r5, r6, r7}
  20:	e880 00fc 	stmia.w	r0, {r2, r3, r4, r5, r6, r7}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:118
    }
  24:	b001      	add	sp, #4
  26:	bdf0      	pop	{r4, r5, r6, r7, pc}

Disassembly of section .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h88b29a4abcbe9d29E:

00000000 <<&embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter>:
_ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h88b29a4abcbe9d29E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:140
    C: PixelColor,
{
    type Item = Pixel<C>;
    type IntoIter = CircleIterator<C>;

    fn into_iter(self) -> Self::IntoIter {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	9108      	str	r1, [sp, #32]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:142
        CircleIterator {
            center: self.center,
   6:	9908      	ldr	r1, [sp, #32]
   8:	680a      	ldr	r2, [r1, #0]
   a:	684b      	ldr	r3, [r1, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:143
            radius: self.radius,
   c:	f8d1 c008 	ldr.w	ip, [r1, #8]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:144
            style: self.style,
  10:	f8b1 e014 	ldrh.w	lr, [r1, #20]
  14:	f8ad e02c 	strh.w	lr, [sp, #44]	; 0x2c
  18:	f8d1 e00c 	ldr.w	lr, [r1, #12]
  1c:	6909      	ldr	r1, [r1, #16]
  1e:	910a      	str	r1, [sp, #40]	; 0x28
  20:	f8cd e024 	str.w	lr, [sp, #36]	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:145
            x: -(self.radius as i32),
  24:	9908      	ldr	r1, [sp, #32]
  26:	6889      	ldr	r1, [r1, #8]
  28:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
  2c:	9007      	str	r0, [sp, #28]
  2e:	9206      	str	r2, [sp, #24]
  30:	9305      	str	r3, [sp, #20]
  32:	f8cd c010 	str.w	ip, [sp, #16]
  36:	9103      	str	r1, [sp, #12]
  38:	d023      	beq.n	82 <<&embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter+0x82>
  3a:	e7ff      	b.n	3c <<&embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter+0x3c>
  3c:	9803      	ldr	r0, [sp, #12]
  3e:	4241      	negs	r1, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:146
            y: -(self.radius as i32),
  40:	9a08      	ldr	r2, [sp, #32]
  42:	6892      	ldr	r2, [r2, #8]
  44:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
  48:	9102      	str	r1, [sp, #8]
  4a:	9201      	str	r2, [sp, #4]
  4c:	d025      	beq.n	9a <<&embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter+0x9a>
  4e:	e7ff      	b.n	50 <<&embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter+0x50>
  50:	9801      	ldr	r0, [sp, #4]
  52:	4241      	negs	r1, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:141
        CircleIterator {
  54:	9a06      	ldr	r2, [sp, #24]
  56:	9b07      	ldr	r3, [sp, #28]
  58:	601a      	str	r2, [r3, #0]
  5a:	f8dd c014 	ldr.w	ip, [sp, #20]
  5e:	f8c3 c004 	str.w	ip, [r3, #4]
  62:	f8dd e010 	ldr.w	lr, [sp, #16]
  66:	f8c3 e008 	str.w	lr, [r3, #8]
  6a:	f8bd 402c 	ldrh.w	r4, [sp, #44]	; 0x2c
  6e:	839c      	strh	r4, [r3, #28]
  70:	9c09      	ldr	r4, [sp, #36]	; 0x24
  72:	9d0a      	ldr	r5, [sp, #40]	; 0x28
  74:	619d      	str	r5, [r3, #24]
  76:	615c      	str	r4, [r3, #20]
  78:	9c02      	ldr	r4, [sp, #8]
  7a:	60dc      	str	r4, [r3, #12]
  7c:	6119      	str	r1, [r3, #16]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:148
        }
    }
  7e:	b00c      	add	sp, #48	; 0x30
  80:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:145
            x: -(self.radius as i32),
  82:	f240 0000 	movw	r0, #0
  86:	f2c0 0000 	movt	r0, #0
  8a:	f240 0200 	movw	r2, #0
  8e:	f2c0 0200 	movt	r2, #0
  92:	211f      	movs	r1, #31
  94:	f7ff fffe 	bl	0 <core::panicking::panic>
  98:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:146
            y: -(self.radius as i32),
  9a:	f240 0000 	movw	r0, #0
  9e:	f2c0 0000 	movt	r0, #0
  a2:	f240 0200 	movw	r2, #0
  a6:	f2c0 0200 	movt	r2, #0
  aa:	211f      	movs	r1, #31
  ac:	f7ff fffe 	bl	0 <core::panicking::panic>
  b0:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha364ae81aac3c531E:

00000000 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next>:
_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha364ae81aac3c531E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:168
    C: PixelColor,
{
    type Item = Pixel<C>;

    // https://stackoverflow.com/questions/1201200/fast-algorithm-for-drawing-filled-circles
    fn next(&mut self) -> Option<Self::Item> {
   0:	b580      	push	{r7, lr}
   2:	b0c0      	sub	sp, #256	; 0x100
   4:	911c      	str	r1, [sp, #112]	; 0x70
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:170
        // If border or stroke colour is `None`, treat entire object as transparent and exit early
        if self.style.stroke_color.is_none() && self.style.fill_color.is_none() {
   6:	991c      	ldr	r1, [sp, #112]	; 0x70
   8:	3118      	adds	r1, #24
   a:	901b      	str	r0, [sp, #108]	; 0x6c
   c:	4608      	mov	r0, r1
   e:	f7ff fffe 	bl	0 <core::option::Option<T>::is_none>
  12:	901a      	str	r0, [sp, #104]	; 0x68
  14:	e013      	b.n	3e <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3e>
  16:	2001      	movs	r0, #1
  18:	f88d 0077 	strb.w	r0, [sp, #119]	; 0x77
  1c:	e009      	b.n	32 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x32>
  1e:	2000      	movs	r0, #0
  20:	f88d 0077 	strb.w	r0, [sp, #119]	; 0x77
  24:	e005      	b.n	32 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x32>
  26:	981c      	ldr	r0, [sp, #112]	; 0x70
  28:	3014      	adds	r0, #20
  2a:	f7ff fffe 	bl	0 <core::option::Option<T>::is_none>
  2e:	9019      	str	r0, [sp, #100]	; 0x64
  30:	e00a      	b.n	48 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x48>
  32:	f89d 0077 	ldrb.w	r0, [sp, #119]	; 0x77
  36:	07c0      	lsls	r0, r0, #31
  38:	2800      	cmp	r0, #0
  3a:	d110      	bne.n	5e <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x5e>
  3c:	e009      	b.n	52 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x52>
  3e:	981a      	ldr	r0, [sp, #104]	; 0x68
  40:	07c1      	lsls	r1, r0, #31
  42:	2900      	cmp	r1, #0
  44:	d1ef      	bne.n	26 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x26>
  46:	e7ea      	b.n	1e <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1e>
  48:	9819      	ldr	r0, [sp, #100]	; 0x64
  4a:	07c1      	lsls	r1, r0, #31
  4c:	2900      	cmp	r1, #0
  4e:	d1e2      	bne.n	16 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x16>
  50:	e7e5      	b.n	1e <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:174
            return None;
        }

        let cx = self.center[0];
  52:	981c      	ldr	r0, [sp, #112]	; 0x70
  54:	2100      	movs	r1, #0
  56:	f7ff fffe 	bl	0 <<embedded_graphics::coord::internal_coord::Coord as core::ops::index::Index<usize>>::index>
  5a:	9018      	str	r0, [sp, #96]	; 0x60
  5c:	e005      	b.n	6a <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x6a>
  5e:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:171
            return None;
  60:	991b      	ldr	r1, [sp, #108]	; 0x6c
  62:	6008      	str	r0, [r1, #0]
  64:	e7ff      	b.n	66 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x66>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:228
                }
            }
        };

        item.map(|(x, y, c)| Pixel(Coord::new(x, y).to_unsigned(), c))
    }
  66:	b040      	add	sp, #256	; 0x100
  68:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:174
        let cx = self.center[0];
  6a:	9818      	ldr	r0, [sp, #96]	; 0x60
  6c:	6801      	ldr	r1, [r0, #0]
  6e:	911e      	str	r1, [sp, #120]	; 0x78
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:175
        let cy = self.center[1];
  70:	981c      	ldr	r0, [sp, #112]	; 0x70
  72:	2101      	movs	r1, #1
  74:	f7ff fffe 	bl	0 <<embedded_graphics::coord::internal_coord::Coord as core::ops::index::Index<usize>>::index>
  78:	9017      	str	r0, [sp, #92]	; 0x5c
  7a:	e7ff      	b.n	7c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x7c>
  7c:	9817      	ldr	r0, [sp, #92]	; 0x5c
  7e:	6801      	ldr	r1, [r0, #0]
  80:	911f      	str	r1, [sp, #124]	; 0x7c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:177
        let radius = self.radius as i32 - self.style.stroke_width as i32 + 1;
  82:	991c      	ldr	r1, [sp, #112]	; 0x70
  84:	688a      	ldr	r2, [r1, #8]
  86:	7f09      	ldrb	r1, [r1, #28]
  88:	1a53      	subs	r3, r2, r1
  8a:	428a      	cmp	r2, r1
  8c:	9316      	str	r3, [sp, #88]	; 0x58
  8e:	f180 8197 	bvs.w	3c0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3c0>
  92:	e7ff      	b.n	94 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x94>
  94:	9816      	ldr	r0, [sp, #88]	; 0x58
  96:	1c41      	adds	r1, r0, #1
  98:	460a      	mov	r2, r1
  9a:	4281      	cmp	r1, r0
  9c:	9215      	str	r2, [sp, #84]	; 0x54
  9e:	f180 819b 	bvs.w	3d8 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3d8>
  a2:	e7ff      	b.n	a4 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0xa4>
  a4:	9815      	ldr	r0, [sp, #84]	; 0x54
  a6:	9020      	str	r0, [sp, #128]	; 0x80
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:178
        let outer_radius = self.radius as i32;
  a8:	991c      	ldr	r1, [sp, #112]	; 0x70
  aa:	6889      	ldr	r1, [r1, #8]
  ac:	9121      	str	r1, [sp, #132]	; 0x84
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:180
        let radius_sq = radius * radius;
  ae:	9920      	ldr	r1, [sp, #128]	; 0x80
  b0:	fb01 f201 	mul.w	r2, r1, r1
  b4:	fb81 1301 	smull	r1, r3, r1, r1
  b8:	ebb3 7fe1 	cmp.w	r3, r1, asr #31
  bc:	9214      	str	r2, [sp, #80]	; 0x50
  be:	f040 8197 	bne.w	3f0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3f0>
  c2:	e7ff      	b.n	c4 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0xc4>
  c4:	9814      	ldr	r0, [sp, #80]	; 0x50
  c6:	9022      	str	r0, [sp, #136]	; 0x88
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:181
        let outer_radius_sq = outer_radius * outer_radius;
  c8:	9921      	ldr	r1, [sp, #132]	; 0x84
  ca:	fb01 f201 	mul.w	r2, r1, r1
  ce:	fb81 1301 	smull	r1, r3, r1, r1
  d2:	ebb3 7fe1 	cmp.w	r3, r1, asr #31
  d6:	9213      	str	r2, [sp, #76]	; 0x4c
  d8:	f040 8196 	bne.w	408 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x408>
  dc:	e7ff      	b.n	de <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0xde>
  de:	9813      	ldr	r0, [sp, #76]	; 0x4c
  e0:	9023      	str	r0, [sp, #140]	; 0x8c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:183
        let item = loop {
  e2:	e7ff      	b.n	e4 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0xe4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:184
            let tx = self.x;
  e4:	981c      	ldr	r0, [sp, #112]	; 0x70
  e6:	68c0      	ldr	r0, [r0, #12]
  e8:	9028      	str	r0, [sp, #160]	; 0xa0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:185
            let ty = self.y;
  ea:	981c      	ldr	r0, [sp, #112]	; 0x70
  ec:	6900      	ldr	r0, [r0, #16]
  ee:	9029      	str	r0, [sp, #164]	; 0xa4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:186
            let len = tx * tx + ty * ty;
  f0:	9828      	ldr	r0, [sp, #160]	; 0xa0
  f2:	fb00 f100 	mul.w	r1, r0, r0
  f6:	fb80 0200 	smull	r0, r2, r0, r0
  fa:	ebb2 7fe0 	cmp.w	r2, r0, asr #31
  fe:	9112      	str	r1, [sp, #72]	; 0x48
 100:	f040 818e 	bne.w	420 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x420>
 104:	e7ff      	b.n	106 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x106>
 106:	9829      	ldr	r0, [sp, #164]	; 0xa4
 108:	fb00 f100 	mul.w	r1, r0, r0
 10c:	fb80 0200 	smull	r0, r2, r0, r0
 110:	ebb2 7fe0 	cmp.w	r2, r0, asr #31
 114:	9111      	str	r1, [sp, #68]	; 0x44
 116:	f040 818f 	bne.w	438 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x438>
 11a:	e7ff      	b.n	11c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x11c>
 11c:	9812      	ldr	r0, [sp, #72]	; 0x48
 11e:	9911      	ldr	r1, [sp, #68]	; 0x44
 120:	1842      	adds	r2, r0, r1
 122:	4613      	mov	r3, r2
 124:	4282      	cmp	r2, r0
 126:	9310      	str	r3, [sp, #64]	; 0x40
 128:	f180 8192 	bvs.w	450 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x450>
 12c:	e7ff      	b.n	12e <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x12e>
 12e:	9810      	ldr	r0, [sp, #64]	; 0x40
 130:	902a      	str	r0, [sp, #168]	; 0xa8
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:188
            let is_border = len > radius_sq - radius && len < outer_radius_sq + radius;
 132:	992a      	ldr	r1, [sp, #168]	; 0xa8
 134:	9a22      	ldr	r2, [sp, #136]	; 0x88
 136:	9b20      	ldr	r3, [sp, #128]	; 0x80
 138:	eba2 0c03 	sub.w	ip, r2, r3
 13c:	429a      	cmp	r2, r3
 13e:	910f      	str	r1, [sp, #60]	; 0x3c
 140:	f8cd c038 	str.w	ip, [sp, #56]	; 0x38
 144:	f180 8190 	bvs.w	468 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x468>
 148:	e021      	b.n	18e <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x18e>
 14a:	2001      	movs	r0, #1
 14c:	f88d 00ae 	strb.w	r0, [sp, #174]	; 0xae
 150:	e00e      	b.n	170 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x170>
 152:	2000      	movs	r0, #0
 154:	f88d 00ae 	strb.w	r0, [sp, #174]	; 0xae
 158:	e00a      	b.n	170 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x170>
 15a:	982a      	ldr	r0, [sp, #168]	; 0xa8
 15c:	9923      	ldr	r1, [sp, #140]	; 0x8c
 15e:	9a20      	ldr	r2, [sp, #128]	; 0x80
 160:	440a      	add	r2, r1
 162:	4613      	mov	r3, r2
 164:	428a      	cmp	r2, r1
 166:	900d      	str	r0, [sp, #52]	; 0x34
 168:	930c      	str	r3, [sp, #48]	; 0x30
 16a:	f180 8189 	bvs.w	480 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x480>
 16e:	e013      	b.n	198 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x198>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:191
            let is_fill = len <= outer_radius_sq;
 170:	982a      	ldr	r0, [sp, #168]	; 0xa8
 172:	9923      	ldr	r1, [sp, #140]	; 0x8c
 174:	2200      	movs	r2, #0
 176:	4288      	cmp	r0, r1
 178:	bfd8      	it	le
 17a:	2201      	movle	r2, #1
 17c:	f88d 20af 	strb.w	r2, [sp, #175]	; 0xaf
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 180:	f89d 00ae 	ldrb.w	r0, [sp, #174]	; 0xae
 184:	ea4f 70c0 	mov.w	r0, r0, lsl #31
 188:	2800      	cmp	r0, #0
 18a:	d112      	bne.n	1b2 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1b2>
 18c:	e00d      	b.n	1aa <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1aa>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:188
            let is_border = len > radius_sq - radius && len < outer_radius_sq + radius;
 18e:	980f      	ldr	r0, [sp, #60]	; 0x3c
 190:	990e      	ldr	r1, [sp, #56]	; 0x38
 192:	4288      	cmp	r0, r1
 194:	dce1      	bgt.n	15a <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x15a>
 196:	e7dc      	b.n	152 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x152>
 198:	980d      	ldr	r0, [sp, #52]	; 0x34
 19a:	990c      	ldr	r1, [sp, #48]	; 0x30
 19c:	4288      	cmp	r0, r1
 19e:	dbd4      	blt.n	14a <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x14a>
 1a0:	e7d7      	b.n	152 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x152>
 1a2:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 1a4:	f88d 00c3 	strb.w	r0, [sp, #195]	; 0xc3
 1a8:	e009      	b.n	1be <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1be>
 1aa:	2000      	movs	r0, #0
 1ac:	f88d 00c3 	strb.w	r0, [sp, #195]	; 0xc3
 1b0:	e005      	b.n	1be <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1be>
 1b2:	981c      	ldr	r0, [sp, #112]	; 0x70
 1b4:	3018      	adds	r0, #24
 1b6:	f7ff fffe 	bl	0 <core::option::Option<T>::is_some>
 1ba:	900b      	str	r0, [sp, #44]	; 0x2c
 1bc:	e005      	b.n	1ca <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1ca>
 1be:	f89d 00c3 	ldrb.w	r0, [sp, #195]	; 0xc3
 1c2:	07c0      	lsls	r0, r0, #31
 1c4:	2800      	cmp	r0, #0
 1c6:	d10b      	bne.n	1e0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1e0>
 1c8:	e004      	b.n	1d4 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1d4>
 1ca:	980b      	ldr	r0, [sp, #44]	; 0x2c
 1cc:	07c1      	lsls	r1, r0, #31
 1ce:	2900      	cmp	r1, #0
 1d0:	d1e7      	bne.n	1a2 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1a2>
 1d2:	e7ea      	b.n	1aa <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1aa>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:199
            } else if is_fill && self.style.fill_color.is_some() {
 1d4:	f89d 00af 	ldrb.w	r0, [sp, #175]	; 0xaf
 1d8:	07c0      	lsls	r0, r0, #31
 1da:	2800      	cmp	r0, #0
 1dc:	d13a      	bne.n	254 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x254>
 1de:	e035      	b.n	24c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x24c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:195
                    cx + tx,
 1e0:	981e      	ldr	r0, [sp, #120]	; 0x78
 1e2:	9928      	ldr	r1, [sp, #160]	; 0xa0
 1e4:	4401      	add	r1, r0
 1e6:	460a      	mov	r2, r1
 1e8:	4281      	cmp	r1, r0
 1ea:	920a      	str	r2, [sp, #40]	; 0x28
 1ec:	f180 8154 	bvs.w	498 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x498>
 1f0:	e7ff      	b.n	1f2 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x1f2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:196
                    cy + ty,
 1f2:	981f      	ldr	r0, [sp, #124]	; 0x7c
 1f4:	9929      	ldr	r1, [sp, #164]	; 0xa4
 1f6:	4401      	add	r1, r0
 1f8:	460a      	mov	r2, r1
 1fa:	4281      	cmp	r1, r0
 1fc:	9209      	str	r2, [sp, #36]	; 0x24
 1fe:	f180 8157 	bvs.w	4b0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x4b0>
 202:	e7ff      	b.n	204 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x204>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:197
                    self.style.stroke_color.expect("Border color not defined"),
 204:	981c      	ldr	r0, [sp, #112]	; 0x70
 206:	8b41      	ldrh	r1, [r0, #26]
 208:	8b00      	ldrh	r0, [r0, #24]
 20a:	f240 0200 	movw	r2, #0
 20e:	f2c0 0200 	movt	r2, #0
 212:	2318      	movs	r3, #24
 214:	f7ff fffe 	bl	0 <core::option::Option<T>::expect>
 218:	9008      	str	r0, [sp, #32]
 21a:	e7ff      	b.n	21c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x21c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:194
                Some((
 21c:	980a      	ldr	r0, [sp, #40]	; 0x28
 21e:	9031      	str	r0, [sp, #196]	; 0xc4
 220:	9909      	ldr	r1, [sp, #36]	; 0x24
 222:	9132      	str	r1, [sp, #200]	; 0xc8
 224:	9a08      	ldr	r2, [sp, #32]
 226:	f8ad 20cc 	strh.w	r2, [sp, #204]	; 0xcc
 22a:	9b31      	ldr	r3, [sp, #196]	; 0xc4
 22c:	f8dd c0c8 	ldr.w	ip, [sp, #200]	; 0xc8
 230:	f8dd e0cc 	ldr.w	lr, [sp, #204]	; 0xcc
 234:	f8cd e0bc 	str.w	lr, [sp, #188]	; 0xbc
 238:	f8cd c0b8 	str.w	ip, [sp, #184]	; 0xb8
 23c:	932d      	str	r3, [sp, #180]	; 0xb4
 23e:	2301      	movs	r3, #1
 240:	932c      	str	r3, [sp, #176]	; 0xb0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 242:	e04e      	b.n	2e2 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x2e2>
 244:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:199
            } else if is_fill && self.style.fill_color.is_some() {
 246:	f88d 00d3 	strb.w	r0, [sp, #211]	; 0xd3
 24a:	e009      	b.n	260 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x260>
 24c:	2000      	movs	r0, #0
 24e:	f88d 00d3 	strb.w	r0, [sp, #211]	; 0xd3
 252:	e005      	b.n	260 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x260>
 254:	981c      	ldr	r0, [sp, #112]	; 0x70
 256:	3014      	adds	r0, #20
 258:	f7ff fffe 	bl	0 <core::option::Option<T>::is_some>
 25c:	9007      	str	r0, [sp, #28]
 25e:	e005      	b.n	26c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x26c>
 260:	f89d 00d3 	ldrb.w	r0, [sp, #211]	; 0xd3
 264:	07c0      	lsls	r0, r0, #31
 266:	2800      	cmp	r0, #0
 268:	d108      	bne.n	27c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x27c>
 26a:	e004      	b.n	276 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x276>
 26c:	9807      	ldr	r0, [sp, #28]
 26e:	07c1      	lsls	r1, r0, #31
 270:	2900      	cmp	r1, #0
 272:	d1e7      	bne.n	244 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x244>
 274:	e7ea      	b.n	24c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x24c>
 276:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:206
                None
 278:	902c      	str	r0, [sp, #176]	; 0xb0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:199
            } else if is_fill && self.style.fill_color.is_some() {
 27a:	e031      	b.n	2e0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x2e0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:201
                    cx + tx,
 27c:	981e      	ldr	r0, [sp, #120]	; 0x78
 27e:	9928      	ldr	r1, [sp, #160]	; 0xa0
 280:	4401      	add	r1, r0
 282:	460a      	mov	r2, r1
 284:	4281      	cmp	r1, r0
 286:	9206      	str	r2, [sp, #24]
 288:	f180 811e 	bvs.w	4c8 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x4c8>
 28c:	e7ff      	b.n	28e <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x28e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:202
                    cy + ty,
 28e:	981f      	ldr	r0, [sp, #124]	; 0x7c
 290:	9929      	ldr	r1, [sp, #164]	; 0xa4
 292:	4401      	add	r1, r0
 294:	460a      	mov	r2, r1
 296:	4281      	cmp	r1, r0
 298:	9205      	str	r2, [sp, #20]
 29a:	f180 8121 	bvs.w	4e0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x4e0>
 29e:	e7ff      	b.n	2a0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x2a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:203
                    self.style.fill_color.expect("Fill color not defined"),
 2a0:	981c      	ldr	r0, [sp, #112]	; 0x70
 2a2:	8ac1      	ldrh	r1, [r0, #22]
 2a4:	8a80      	ldrh	r0, [r0, #20]
 2a6:	f240 0200 	movw	r2, #0
 2aa:	f2c0 0200 	movt	r2, #0
 2ae:	2316      	movs	r3, #22
 2b0:	f7ff fffe 	bl	0 <core::option::Option<T>::expect>
 2b4:	9004      	str	r0, [sp, #16]
 2b6:	e7ff      	b.n	2b8 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x2b8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:200
                Some((
 2b8:	9806      	ldr	r0, [sp, #24]
 2ba:	9035      	str	r0, [sp, #212]	; 0xd4
 2bc:	9905      	ldr	r1, [sp, #20]
 2be:	9136      	str	r1, [sp, #216]	; 0xd8
 2c0:	9a04      	ldr	r2, [sp, #16]
 2c2:	f8ad 20dc 	strh.w	r2, [sp, #220]	; 0xdc
 2c6:	9b35      	ldr	r3, [sp, #212]	; 0xd4
 2c8:	f8dd c0d8 	ldr.w	ip, [sp, #216]	; 0xd8
 2cc:	f8dd e0dc 	ldr.w	lr, [sp, #220]	; 0xdc
 2d0:	f8cd e0bc 	str.w	lr, [sp, #188]	; 0xbc
 2d4:	f8cd c0b8 	str.w	ip, [sp, #184]	; 0xb8
 2d8:	932d      	str	r3, [sp, #180]	; 0xb4
 2da:	2301      	movs	r3, #1
 2dc:	932c      	str	r3, [sp, #176]	; 0xb0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:199
            } else if is_fill && self.style.fill_color.is_some() {
 2de:	e7ff      	b.n	2e0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x2e0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 2e0:	e7ff      	b.n	2e2 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x2e2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:209
            self.x += 1;
 2e2:	981c      	ldr	r0, [sp, #112]	; 0x70
 2e4:	68c0      	ldr	r0, [r0, #12]
 2e6:	1c41      	adds	r1, r0, #1
 2e8:	460a      	mov	r2, r1
 2ea:	4281      	cmp	r1, r0
 2ec:	9203      	str	r2, [sp, #12]
 2ee:	f180 8103 	bvs.w	4f8 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x4f8>
 2f2:	e7ff      	b.n	2f4 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x2f4>
 2f4:	981c      	ldr	r0, [sp, #112]	; 0x70
 2f6:	9903      	ldr	r1, [sp, #12]
 2f8:	60c1      	str	r1, [r0, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:211
            if self.x > self.radius as i32 {
 2fa:	981c      	ldr	r0, [sp, #112]	; 0x70
 2fc:	6882      	ldr	r2, [r0, #8]
 2fe:	68c0      	ldr	r0, [r0, #12]
 300:	4290      	cmp	r0, r2
 302:	dd19      	ble.n	338 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x338>
 304:	e7ff      	b.n	306 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x306>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:212
                self.x = -(self.radius as i32);
 306:	981c      	ldr	r0, [sp, #112]	; 0x70
 308:	6880      	ldr	r0, [r0, #8]
 30a:	f1b0 4f00 	cmp.w	r0, #2147483648	; 0x80000000
 30e:	9002      	str	r0, [sp, #8]
 310:	f000 80fe 	beq.w	510 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x510>
 314:	e7ff      	b.n	316 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x316>
 316:	981c      	ldr	r0, [sp, #112]	; 0x70
 318:	9902      	ldr	r1, [sp, #8]
 31a:	424a      	negs	r2, r1
 31c:	60c2      	str	r2, [r0, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:213
                self.y += 1;
 31e:	981c      	ldr	r0, [sp, #112]	; 0x70
 320:	6900      	ldr	r0, [r0, #16]
 322:	1c42      	adds	r2, r0, #1
 324:	4613      	mov	r3, r2
 326:	4282      	cmp	r2, r0
 328:	9301      	str	r3, [sp, #4]
 32a:	f180 80fd 	bvs.w	528 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x528>
 32e:	e7ff      	b.n	330 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x330>
 330:	981c      	ldr	r0, [sp, #112]	; 0x70
 332:	9901      	ldr	r1, [sp, #4]
 334:	6101      	str	r1, [r0, #16]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:211
            if self.x > self.radius as i32 {
 336:	e7ff      	b.n	338 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x338>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:216
            if self.y > self.radius as i32 {
 338:	981c      	ldr	r0, [sp, #112]	; 0x70
 33a:	6881      	ldr	r1, [r0, #8]
 33c:	6900      	ldr	r0, [r0, #16]
 33e:	4288      	cmp	r0, r1
 340:	dc04      	bgt.n	34c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x34c>
 342:	e7ff      	b.n	344 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x344>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:220
            if let Some(i) = item {
 344:	982c      	ldr	r0, [sp, #176]	; 0xb0
 346:	2801      	cmp	r0, #1
 348:	d010      	beq.n	36c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x36c>
 34a:	e037      	b.n	3bc <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3bc>
 34c:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:217
                break None;
 34e:	9024      	str	r0, [sp, #144]	; 0x90
 350:	e7ff      	b.n	352 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x352>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:227
        item.map(|(x, y, c)| Pixel(Coord::new(x, y).to_unsigned(), c))
 352:	9824      	ldr	r0, [sp, #144]	; 0x90
 354:	9925      	ldr	r1, [sp, #148]	; 0x94
 356:	9a26      	ldr	r2, [sp, #152]	; 0x98
 358:	9b27      	ldr	r3, [sp, #156]	; 0x9c
 35a:	933f      	str	r3, [sp, #252]	; 0xfc
 35c:	923e      	str	r2, [sp, #248]	; 0xf8
 35e:	913d      	str	r1, [sp, #244]	; 0xf4
 360:	903c      	str	r0, [sp, #240]	; 0xf0
 362:	a93c      	add	r1, sp, #240	; 0xf0
 364:	981b      	ldr	r0, [sp, #108]	; 0x6c
 366:	f7ff fffe 	bl	0 <core::option::Option<T>::map>
 36a:	e028      	b.n	3be <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3be>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:220
            if let Some(i) = item {
 36c:	982d      	ldr	r0, [sp, #180]	; 0xb4
 36e:	992e      	ldr	r1, [sp, #184]	; 0xb8
 370:	9a2f      	ldr	r2, [sp, #188]	; 0xbc
 372:	923a      	str	r2, [sp, #232]	; 0xe8
 374:	9139      	str	r1, [sp, #228]	; 0xe4
 376:	9038      	str	r0, [sp, #224]	; 0xe0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:221
                if i.0 >= 0 && i.1 >= 0 {
 378:	9838      	ldr	r0, [sp, #224]	; 0xe0
 37a:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
 37e:	dc08      	bgt.n	392 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x392>
 380:	e003      	b.n	38a <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x38a>
 382:	2001      	movs	r0, #1
 384:	f88d 00ef 	strb.w	r0, [sp, #239]	; 0xef
 388:	e008      	b.n	39c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x39c>
 38a:	2000      	movs	r0, #0
 38c:	f88d 00ef 	strb.w	r0, [sp, #239]	; 0xef
 390:	e004      	b.n	39c <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x39c>
 392:	9839      	ldr	r0, [sp, #228]	; 0xe4
 394:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
 398:	dcf3      	bgt.n	382 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x382>
 39a:	e7f6      	b.n	38a <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x38a>
 39c:	f89d 00ef 	ldrb.w	r0, [sp, #239]	; 0xef
 3a0:	07c0      	lsls	r0, r0, #31
 3a2:	2800      	cmp	r0, #0
 3a4:	d101      	bne.n	3aa <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3aa>
 3a6:	e7ff      	b.n	3a8 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3a8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:220
            if let Some(i) = item {
 3a8:	e008      	b.n	3bc <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x3bc>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:222
                    break item;
 3aa:	982c      	ldr	r0, [sp, #176]	; 0xb0
 3ac:	992d      	ldr	r1, [sp, #180]	; 0xb4
 3ae:	9a2e      	ldr	r2, [sp, #184]	; 0xb8
 3b0:	9b2f      	ldr	r3, [sp, #188]	; 0xbc
 3b2:	9327      	str	r3, [sp, #156]	; 0x9c
 3b4:	9226      	str	r2, [sp, #152]	; 0x98
 3b6:	9125      	str	r1, [sp, #148]	; 0x94
 3b8:	9024      	str	r0, [sp, #144]	; 0x90
 3ba:	e7ca      	b.n	352 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x352>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:183
        let item = loop {
 3bc:	e692      	b.n	e4 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0xe4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:228
    }
 3be:	e652      	b.n	66 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next+0x66>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:177
        let radius = self.radius as i32 - self.style.stroke_width as i32 + 1;
 3c0:	f240 0000 	movw	r0, #0
 3c4:	f2c0 0000 	movt	r0, #0
 3c8:	f240 0200 	movw	r2, #0
 3cc:	f2c0 0200 	movt	r2, #0
 3d0:	2121      	movs	r1, #33	; 0x21
 3d2:	f7ff fffe 	bl	0 <core::panicking::panic>
 3d6:	defe      	udf	#254	; 0xfe
 3d8:	f240 0000 	movw	r0, #0
 3dc:	f2c0 0000 	movt	r0, #0
 3e0:	f240 0200 	movw	r2, #0
 3e4:	f2c0 0200 	movt	r2, #0
 3e8:	211c      	movs	r1, #28
 3ea:	f7ff fffe 	bl	0 <core::panicking::panic>
 3ee:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:180
        let radius_sq = radius * radius;
 3f0:	f240 0000 	movw	r0, #0
 3f4:	f2c0 0000 	movt	r0, #0
 3f8:	f240 0200 	movw	r2, #0
 3fc:	f2c0 0200 	movt	r2, #0
 400:	2121      	movs	r1, #33	; 0x21
 402:	f7ff fffe 	bl	0 <core::panicking::panic>
 406:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:181
        let outer_radius_sq = outer_radius * outer_radius;
 408:	f240 0000 	movw	r0, #0
 40c:	f2c0 0000 	movt	r0, #0
 410:	f240 0200 	movw	r2, #0
 414:	f2c0 0200 	movt	r2, #0
 418:	2121      	movs	r1, #33	; 0x21
 41a:	f7ff fffe 	bl	0 <core::panicking::panic>
 41e:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:186
            let len = tx * tx + ty * ty;
 420:	f240 0000 	movw	r0, #0
 424:	f2c0 0000 	movt	r0, #0
 428:	f240 0200 	movw	r2, #0
 42c:	f2c0 0200 	movt	r2, #0
 430:	2121      	movs	r1, #33	; 0x21
 432:	f7ff fffe 	bl	0 <core::panicking::panic>
 436:	defe      	udf	#254	; 0xfe
 438:	f240 0000 	movw	r0, #0
 43c:	f2c0 0000 	movt	r0, #0
 440:	f240 0200 	movw	r2, #0
 444:	f2c0 0200 	movt	r2, #0
 448:	2121      	movs	r1, #33	; 0x21
 44a:	f7ff fffe 	bl	0 <core::panicking::panic>
 44e:	defe      	udf	#254	; 0xfe
 450:	f240 0000 	movw	r0, #0
 454:	f2c0 0000 	movt	r0, #0
 458:	f240 0200 	movw	r2, #0
 45c:	f2c0 0200 	movt	r2, #0
 460:	211c      	movs	r1, #28
 462:	f7ff fffe 	bl	0 <core::panicking::panic>
 466:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:188
            let is_border = len > radius_sq - radius && len < outer_radius_sq + radius;
 468:	f240 0000 	movw	r0, #0
 46c:	f2c0 0000 	movt	r0, #0
 470:	f240 0200 	movw	r2, #0
 474:	f2c0 0200 	movt	r2, #0
 478:	2121      	movs	r1, #33	; 0x21
 47a:	f7ff fffe 	bl	0 <core::panicking::panic>
 47e:	defe      	udf	#254	; 0xfe
 480:	f240 0000 	movw	r0, #0
 484:	f2c0 0000 	movt	r0, #0
 488:	f240 0200 	movw	r2, #0
 48c:	f2c0 0200 	movt	r2, #0
 490:	211c      	movs	r1, #28
 492:	f7ff fffe 	bl	0 <core::panicking::panic>
 496:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:195
                    cx + tx,
 498:	f240 0000 	movw	r0, #0
 49c:	f2c0 0000 	movt	r0, #0
 4a0:	f240 0200 	movw	r2, #0
 4a4:	f2c0 0200 	movt	r2, #0
 4a8:	211c      	movs	r1, #28
 4aa:	f7ff fffe 	bl	0 <core::panicking::panic>
 4ae:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:196
                    cy + ty,
 4b0:	f240 0000 	movw	r0, #0
 4b4:	f2c0 0000 	movt	r0, #0
 4b8:	f240 0200 	movw	r2, #0
 4bc:	f2c0 0200 	movt	r2, #0
 4c0:	211c      	movs	r1, #28
 4c2:	f7ff fffe 	bl	0 <core::panicking::panic>
 4c6:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:201
                    cx + tx,
 4c8:	f240 0000 	movw	r0, #0
 4cc:	f2c0 0000 	movt	r0, #0
 4d0:	f240 0200 	movw	r2, #0
 4d4:	f2c0 0200 	movt	r2, #0
 4d8:	211c      	movs	r1, #28
 4da:	f7ff fffe 	bl	0 <core::panicking::panic>
 4de:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:202
                    cy + ty,
 4e0:	f240 0000 	movw	r0, #0
 4e4:	f2c0 0000 	movt	r0, #0
 4e8:	f240 0200 	movw	r2, #0
 4ec:	f2c0 0200 	movt	r2, #0
 4f0:	211c      	movs	r1, #28
 4f2:	f7ff fffe 	bl	0 <core::panicking::panic>
 4f6:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:209
            self.x += 1;
 4f8:	f240 0000 	movw	r0, #0
 4fc:	f2c0 0000 	movt	r0, #0
 500:	f240 0200 	movw	r2, #0
 504:	f2c0 0200 	movt	r2, #0
 508:	211c      	movs	r1, #28
 50a:	f7ff fffe 	bl	0 <core::panicking::panic>
 50e:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:212
                self.x = -(self.radius as i32);
 510:	f240 0000 	movw	r0, #0
 514:	f2c0 0000 	movt	r0, #0
 518:	f240 0200 	movw	r2, #0
 51c:	f2c0 0200 	movt	r2, #0
 520:	211f      	movs	r1, #31
 522:	f7ff fffe 	bl	0 <core::panicking::panic>
 526:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:213
                self.y += 1;
 528:	f240 0000 	movw	r0, #0
 52c:	f2c0 0000 	movt	r0, #0
 530:	f240 0200 	movw	r2, #0
 534:	f2c0 0200 	movt	r2, #0
 538:	211c      	movs	r1, #28
 53a:	f7ff fffe 	bl	0 <core::panicking::panic>
 53e:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h8b4a68e21d586b7fE:

00000000 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next::{{closure}}>:
_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h8b4a68e21d586b7fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:227
        item.map(|(x, y, c)| Pixel(Coord::new(x, y).to_unsigned(), c))
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	680a      	ldr	r2, [r1, #0]
   6:	9207      	str	r2, [sp, #28]
   8:	684a      	ldr	r2, [r1, #4]
   a:	9208      	str	r2, [sp, #32]
   c:	8909      	ldrh	r1, [r1, #8]
   e:	f8ad 1026 	strh.w	r1, [sp, #38]	; 0x26
  12:	9907      	ldr	r1, [sp, #28]
  14:	9a08      	ldr	r2, [sp, #32]
  16:	9005      	str	r0, [sp, #20]
  18:	4608      	mov	r0, r1
  1a:	4611      	mov	r1, r2
  1c:	f7ff fffe 	bl	0 <embedded_graphics::coord::internal_coord::Coord::new>
  20:	9004      	str	r0, [sp, #16]
  22:	9103      	str	r1, [sp, #12]
  24:	e7ff      	b.n	26 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next::{{closure}}+0x26>
  26:	9804      	ldr	r0, [sp, #16]
  28:	9903      	ldr	r1, [sp, #12]
  2a:	f7ff fffe 	bl	0 <<embedded_graphics::coord::internal_coord::Coord as embedded_graphics::coord::ToUnsigned>::to_unsigned>
  2e:	9002      	str	r0, [sp, #8]
  30:	9101      	str	r1, [sp, #4]
  32:	e7ff      	b.n	34 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next::{{closure}}+0x34>
  34:	f8bd 0026 	ldrh.w	r0, [sp, #38]	; 0x26
  38:	9902      	ldr	r1, [sp, #8]
  3a:	9a05      	ldr	r2, [sp, #20]
  3c:	6011      	str	r1, [r2, #0]
  3e:	9b01      	ldr	r3, [sp, #4]
  40:	6053      	str	r3, [r2, #4]
  42:	8110      	strh	r0, [r2, #8]
  44:	b00a      	add	sp, #40	; 0x28
  46:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17h160e5b58c34c5d86E:

00000000 <embedded_graphics::primitives::circle::Circle<C>::new>:
_ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17h160e5b58c34c5d86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:62
    pub fn new(center: Coord, radius: u32) -> Self {
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	9104      	str	r1, [sp, #16]
   6:	9205      	str	r2, [sp, #20]
   8:	9306      	str	r3, [sp, #24]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:64
            center,
   a:	9904      	ldr	r1, [sp, #16]
   c:	9a05      	ldr	r2, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:65
            radius,
   e:	9b06      	ldr	r3, [sp, #24]
  10:	f10d 0c1c 	add.w	ip, sp, #28
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:66
            style: Style::default(),
  14:	9003      	str	r0, [sp, #12]
  16:	4660      	mov	r0, ip
  18:	9102      	str	r1, [sp, #8]
  1a:	9201      	str	r2, [sp, #4]
  1c:	9300      	str	r3, [sp, #0]
  1e:	f7ff fffe 	bl	0 <<embedded_graphics::style::Style<P> as core::default::Default>::default>
  22:	e7ff      	b.n	24 <embedded_graphics::primitives::circle::Circle<C>::new+0x24>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:63
        Circle {
  24:	9802      	ldr	r0, [sp, #8]
  26:	9903      	ldr	r1, [sp, #12]
  28:	6008      	str	r0, [r1, #0]
  2a:	9a01      	ldr	r2, [sp, #4]
  2c:	604a      	str	r2, [r1, #4]
  2e:	9b00      	ldr	r3, [sp, #0]
  30:	608b      	str	r3, [r1, #8]
  32:	f8bd c024 	ldrh.w	ip, [sp, #36]	; 0x24
  36:	f8a1 c014 	strh.w	ip, [r1, #20]
  3a:	f8dd c01c 	ldr.w	ip, [sp, #28]
  3e:	f8dd e020 	ldr.w	lr, [sp, #32]
  42:	f8c1 e010 	str.w	lr, [r1, #16]
  46:	f8c1 c00c 	str.w	ip, [r1, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:68
    }
  4a:	b00a      	add	sp, #40	; 0x28
  4c:	bd80      	pop	{r7, pc}

app-1da0d8acf4e589c0.2dz8qltt39wo39j0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2dz8qltt39wo39j0
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
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.0	00000017 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.0
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.1	00000001 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.1
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.10	00000005 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.10
00000008 l     O .rodata.cst4	00000004 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.11
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.12	00000007 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.12
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.13	00000006 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.13
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.14	00000048 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.14
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.2	00000001 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.2
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.3	00000001 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.3
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.4	00000007 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.4
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.5	0000000d .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.5
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.6	00000003 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.6
00000000 l     O .rodata..Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.7	00000005 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.7
00000000 l     O .rodata.cst4	00000004 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.8
00000004 l     O .rodata.cst4	00000004 .Lanon.fb13f17aac732c8681d0fff5fd6fc4aa.9
00000000 l     F .text._ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E	0000057c app::app_network::send_sensor_data
00000000 l    d  .text._ZN3app11app_network21aggregate_sensor_data17hb2d9ea9756617dabE	00000000 .text._ZN3app11app_network21aggregate_sensor_data17hb2d9ea9756617dabE
00000000 l    d  .text._ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E	00000000 .text._ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app11app_network21aggregate_sensor_data17hb2d9ea9756617dabE	00000016 .hidden app::app_network::aggregate_sensor_data
00000000         *UND*	00000000 <T as core::convert::From<T>>::from
00000000         *UND*	00000000 mynewt::sys::console::print_strn
00000000         *UND*	00000000 mynewt::sys::console::flush
00000000         *UND*	00000000 mynewt::sys::console::print
00000000         *UND*	00000000 mynewt::sys::console::printint
00000000         *UND*	00000000 mynewt::Strn::new
00000000         *UND*	00000000 mynewt::libs::sensor_network::prepare_post
00000000         *UND*	00000000 mynewt::libs::sensor_network::get_device_id
00000000         *UND*	00000000 mynewt::libs::sensor_network::do_server_post
00000000         *UND*	00000000 mynewt::libs::sensor_network::init_server_post
00000000         *UND*	00000000 mynewt::encoding::coap_context::CoapContext::key_to_cstr
00000000         *UND*	00000000 mynewt::encoding::coap_context::CoapContext::to_void_ptr
00000000         *UND*	00000000 mynewt::encoding::coap_context::CoapContext::value_to_cstr
00000000         *UND*	00000000 mynewt::encoding::coap_context::CoapContext::json_set_geolocation
00000000         *UND*	00000000 mynewt::encoding::coap_context::CoapContext::json_set_text_string
00000000         *UND*	00000000 mynewt::encoding::coap_context::CoapContext::fail
00000000         *UND*	00000000 mynewt::encoding::coap_context::COAP_CONTEXT
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::from_error
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000         *UND*	00000000 <str as mynewt::encoding::coap_context::ToBytesOptionalNull>::to_bytes_optional_nul
00000000         *UND*	00000000 <mynewt::Strn as mynewt::encoding::coap_context::ToBytesOptionalNull>::to_bytes_optional_nul
00000000         *UND*	00000000 json_helper_close_array
00000000         *UND*	00000000 json_helper_object_array_end_item
00000000         *UND*	00000000 json_helper_object_array_start_item
00000000         *UND*	00000000 json_helper_set_array
00000000         *UND*	00000000 json_helper_set_int
00000000         *UND*	00000000 json_helper_set_text_string
00000000         *UND*	00000000 json_rep_end_root_object
00000000         *UND*	00000000 json_rep_start_root_object



Disassembly of section .text._ZN3app11app_network21aggregate_sensor_data17hb2d9ea9756617dabE:

00000000 <app::app_network::aggregate_sensor_data>:
_ZN3app11app_network21aggregate_sensor_data17hb2d9ea9756617dabE():
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
   8:	f7ff fffe 	bl	0 <app::app_network::aggregate_sensor_data>
   c:	9000      	str	r0, [sp, #0]
   e:	e7ff      	b.n	10 <app::app_network::aggregate_sensor_data+0x10>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:62
}
  10:	9800      	ldr	r0, [sp, #0]
  12:	b002      	add	sp, #8
  14:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E:

00000000 <app::app_network::send_sensor_data>:
_ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E():
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
  12:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  16:	e7ff      	b.n	18 <app::app_network::send_sensor_data+0x18>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:77
    if let SensorValueType::Uint(i) = val.value {
  18:	9825      	ldr	r0, [sp, #148]	; 0x94
  1a:	6840      	ldr	r0, [r0, #4]
  1c:	2801      	cmp	r0, #1
  1e:	d115      	bne.n	4c <app::app_network::send_sensor_data+0x4c>
  20:	e7ff      	b.n	22 <app::app_network::send_sensor_data+0x22>
  22:	9825      	ldr	r0, [sp, #148]	; 0x94
  24:	6880      	ldr	r0, [r0, #8]
  26:	9027      	str	r0, [sp, #156]	; 0x9c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:78
        console::print_strn(val.key);
  28:	9825      	ldr	r0, [sp, #148]	; 0x94
  2a:	6800      	ldr	r0, [r0, #0]
  2c:	f7ff fffe 	bl	0 <mynewt::sys::console::print_strn>
  30:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:79
        console::print("=");
  32:	f240 0000 	movw	r0, #0
  36:	f2c0 0000 	movt	r0, #0
  3a:	2101      	movs	r1, #1
  3c:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  40:	e7ff      	b.n	42 <app::app_network::send_sensor_data+0x42>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:80
        console::printint(i as i32);
  42:	9827      	ldr	r0, [sp, #156]	; 0x9c
  44:	f7ff fffe 	bl	0 <mynewt::sys::console::printint>
  48:	e7ff      	b.n	4a <app::app_network::send_sensor_data+0x4a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:77
    if let SensorValueType::Uint(i) = val.value {
  4a:	e7ff      	b.n	4c <app::app_network::send_sensor_data+0x4c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:82
    }
    console::print("\n");
  4c:	f240 0000 	movw	r0, #0
  50:	f2c0 0000 	movt	r0, #0
  54:	2101      	movs	r1, #1
  56:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  5a:	e7ff      	b.n	2 <mynewt::sys::console::flush+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:83
    console::flush(); ////
  5c:	f7ff fffe 	bl	0 <mynewt::sys::console::flush>
  60:	e7ff      	b.n	62 <app::app_network::send_sensor_data+0x62>
  62:	a82f      	add	r0, sp, #188	; 0xbc
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:86

    //  Get a randomly-generated device ID that changes each time we restart the device.
    let device_id = sensor_network::get_device_id() ? ;
  64:	f7ff fffe 	bl	0 <mynewt::libs::sensor_network::get_device_id>
  68:	e7ff      	b.n	6a <app::app_network::send_sensor_data+0x6a>
  6a:	a82b      	add	r0, sp, #172	; 0xac
  6c:	a92f      	add	r1, sp, #188	; 0xbc
  6e:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  72:	e7ff      	b.n	74 <app::app_network::send_sensor_data+0x74>
  74:	982b      	ldr	r0, [sp, #172]	; 0xac
  76:	2800      	cmp	r0, #0
  78:	d014      	beq.n	a4 <app::app_network::send_sensor_data+0xa4>
  7a:	e7ff      	b.n	7c <app::app_network::send_sensor_data+0x7c>
  7c:	e000      	b.n	80 <app::app_network::send_sensor_data+0x80>
  7e:	defe      	udf	#254	; 0xfe
  80:	982c      	ldr	r0, [sp, #176]	; 0xb0
  82:	9033      	str	r0, [sp, #204]	; 0xcc
  84:	9833      	ldr	r0, [sp, #204]	; 0xcc
  86:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
  8a:	9024      	str	r0, [sp, #144]	; 0x90
  8c:	e003      	b.n	96 <app::app_network::send_sensor_data+0x96>
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
  98:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
  9c:	9026      	str	r0, [sp, #152]	; 0x98
  9e:	e7ff      	b.n	a0 <app::app_network::send_sensor_data+0xa0>
  a0:	e7ff      	b.n	a2 <app::app_network::send_sensor_data+0xa2>
  a2:	e7f4      	b.n	8e <app::app_network::send_sensor_data+0x8e>
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
  c8:	f7ff fffe 	bl	0 <mynewt::Strn::new>
  cc:	e7ff      	b.n	ce <app::app_network::send_sensor_data+0xce>
  ce:	a83a      	add	r0, sp, #232	; 0xe8
  d0:	a93c      	add	r1, sp, #240	; 0xf0
  d2:	f7ff fffe 	bl	0 <mynewt::libs::sensor_network::init_server_post>
  d6:	e7ff      	b.n	d8 <app::app_network::send_sensor_data+0xd8>
  d8:	a838      	add	r0, sp, #224	; 0xe0
  da:	a93a      	add	r1, sp, #232	; 0xe8
  dc:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  e0:	e7ff      	b.n	e2 <app::app_network::send_sensor_data+0xe2>
  e2:	f89d 00e0 	ldrb.w	r0, [sp, #224]	; 0xe0
  e6:	07c1      	lsls	r1, r0, #31
  e8:	2900      	cmp	r1, #0
  ea:	d010      	beq.n	10e <app::app_network::send_sensor_data+0x10e>
  ec:	e7ff      	b.n	ee <app::app_network::send_sensor_data+0xee>
  ee:	e000      	b.n	f2 <app::app_network::send_sensor_data+0xf2>
  f0:	defe      	udf	#254	; 0xfe
  f2:	9839      	ldr	r0, [sp, #228]	; 0xe4
  f4:	903f      	str	r0, [sp, #252]	; 0xfc
  f6:	983f      	ldr	r0, [sp, #252]	; 0xfc
  f8:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
  fc:	9023      	str	r0, [sp, #140]	; 0x8c
  fe:	e7ff      	b.n	100 <app::app_network::send_sensor_data+0x100>
 100:	9823      	ldr	r0, [sp, #140]	; 0x8c
 102:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
 106:	9026      	str	r0, [sp, #152]	; 0x98
 108:	e7ff      	b.n	10a <app::app_network::send_sensor_data+0x10a>
 10a:	e7ff      	b.n	10c <app::app_network::send_sensor_data+0x10c>
 10c:	e7c9      	b.n	a2 <app::app_network::send_sensor_data+0xa2>
 10e:	f89d 00e1 	ldrb.w	r0, [sp, #225]	; 0xe1
 112:	f88d 0103 	strb.w	r0, [sp, #259]	; 0x103
 116:	f89d 0103 	ldrb.w	r0, [sp, #259]	; 0x103
 11a:	f88d 00df 	strb.w	r0, [sp, #223]	; 0xdf
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:94
    if !rc { return Err(MynewtError::SYS_EAGAIN); }
 11e:	f89d 00df 	ldrb.w	r0, [sp, #223]	; 0xdf
 122:	07c0      	lsls	r0, r0, #31
 124:	2800      	cmp	r0, #0
 126:	d005      	beq.n	134 <app::app_network::send_sensor_data+0x134>
 128:	e7ff      	b.n	12a <app::app_network::send_sensor_data+0x12a>
 12a:	a845      	add	r0, sp, #276	; 0x114
 12c:	2132      	movs	r1, #50	; 0x32
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
    let _payload = coap!( @json {        
 12e:	f7ff fffe 	bl	0 <mynewt::libs::sensor_network::prepare_post>
 132:	e005      	b.n	140 <app::app_network::send_sensor_data+0x140>
 134:	f06f 0005 	mvn.w	r0, #5
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:94
    if !rc { return Err(MynewtError::SYS_EAGAIN); }
 138:	9041      	str	r0, [sp, #260]	; 0x104
 13a:	9841      	ldr	r0, [sp, #260]	; 0x104
 13c:	9026      	str	r0, [sp, #152]	; 0x98
 13e:	e7e5      	b.n	10c <app::app_network::send_sensor_data+0x10c>
 140:	a843      	add	r0, sp, #268	; 0x10c
 142:	a945      	add	r1, sp, #276	; 0x114
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
    let _payload = coap!( @json {        
 144:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
 148:	e7ff      	b.n	14a <app::app_network::send_sensor_data+0x14a>
 14a:	f89d 010c 	ldrb.w	r0, [sp, #268]	; 0x10c
 14e:	07c1      	lsls	r1, r0, #31
 150:	2900      	cmp	r1, #0
 152:	d010      	beq.n	176 <app::app_network::send_sensor_data+0x176>
 154:	e7ff      	b.n	156 <app::app_network::send_sensor_data+0x156>
 156:	e000      	b.n	15a <app::app_network::send_sensor_data+0x15a>
 158:	defe      	udf	#254	; 0xfe
 15a:	9844      	ldr	r0, [sp, #272]	; 0x110
 15c:	9047      	str	r0, [sp, #284]	; 0x11c
 15e:	9847      	ldr	r0, [sp, #284]	; 0x11c
 160:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
 164:	9022      	str	r0, [sp, #136]	; 0x88
 166:	e7ff      	b.n	168 <app::app_network::send_sensor_data+0x168>
 168:	9822      	ldr	r0, [sp, #136]	; 0x88
 16a:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
 16e:	9026      	str	r0, [sp, #152]	; 0x98
 170:	e7ff      	b.n	172 <app::app_network::send_sensor_data+0x172>
 172:	e7ff      	b.n	174 <app::app_network::send_sensor_data+0x174>
 174:	e7ca      	b.n	10c <app::app_network::send_sensor_data+0x10c>
 176:	f89d 010d 	ldrb.w	r0, [sp, #269]	; 0x10d
 17a:	f88d 0123 	strb.w	r0, [sp, #291]	; 0x123
 17e:	f7ff fffe 	bl	0 <json_rep_start_root_object>
 182:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 184:	f240 0000 	movw	r0, #0
 188:	f2c0 0000 	movt	r0, #0
 18c:	9049      	str	r0, [sp, #292]	; 0x124
 18e:	2007      	movs	r0, #7
 190:	904a      	str	r0, [sp, #296]	; 0x128
 192:	f240 0000 	movw	r0, #0
 196:	f2c0 0000 	movt	r0, #0
 19a:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::to_void_ptr>
 19e:	9021      	str	r0, [sp, #132]	; 0x84
 1a0:	e7ff      	b.n	1a2 <app::app_network::send_sensor_data+0x1a2>
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
_ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 1b6:	9120      	str	r1, [sp, #128]	; 0x80
 1b8:	921f      	str	r2, [sp, #124]	; 0x7c
 1ba:	e7ff      	b.n	1bc <app::app_network::send_sensor_data+0x1bc>
 1bc:	f240 0000 	movw	r0, #0
 1c0:	f2c0 0000 	movt	r0, #0
 1c4:	9920      	ldr	r1, [sp, #128]	; 0x80
 1c6:	9a1f      	ldr	r2, [sp, #124]	; 0x7c
 1c8:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 1cc:	901e      	str	r0, [sp, #120]	; 0x78
 1ce:	e7ff      	b.n	1d0 <app::app_network::send_sensor_data+0x1d0>
 1d0:	9821      	ldr	r0, [sp, #132]	; 0x84
 1d2:	991e      	ldr	r1, [sp, #120]	; 0x78
 1d4:	f7ff fffe 	bl	0 <json_helper_set_array>
 1d8:	e7ff      	b.n	1da <app::app_network::send_sensor_data+0x1da>
 1da:	9825      	ldr	r0, [sp, #148]	; 0x94
 1dc:	68c1      	ldr	r1, [r0, #12]
 1de:	6900      	ldr	r0, [r0, #16]
 1e0:	914b      	str	r1, [sp, #300]	; 0x12c
 1e2:	904c      	str	r0, [sp, #304]	; 0x130
 1e4:	9825      	ldr	r0, [sp, #148]	; 0x94
 1e6:	6840      	ldr	r0, [r0, #4]
 1e8:	2801      	cmp	r0, #1
 1ea:	d00c      	beq.n	206 <app::app_network::send_sensor_data+0x206>
 1ec:	e7ff      	b.n	1ee <app::app_network::send_sensor_data+0x1ee>
 1ee:	2001      	movs	r0, #1
 1f0:	f88d 0193 	strb.w	r0, [sp, #403]	; 0x193
 1f4:	f89d 1193 	ldrb.w	r1, [sp, #403]	; 0x193
 1f8:	f240 0000 	movw	r0, #0
 1fc:	f2c0 0000 	movt	r0, #0
 200:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::fail>
 204:	e0d7      	b.n	3b6 <app::app_network::send_sensor_data+0x3b6>
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
_ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 22e:	911d      	str	r1, [sp, #116]	; 0x74
 230:	921c      	str	r2, [sp, #112]	; 0x70
 232:	e7ff      	b.n	234 <app::app_network::send_sensor_data+0x234>
 234:	f240 0000 	movw	r0, #0
 238:	f2c0 0000 	movt	r0, #0
 23c:	991d      	ldr	r1, [sp, #116]	; 0x74
 23e:	9a1c      	ldr	r2, [sp, #112]	; 0x70
 240:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 244:	901b      	str	r0, [sp, #108]	; 0x6c
 246:	e7ff      	b.n	248 <app::app_network::send_sensor_data+0x248>
 248:	981b      	ldr	r0, [sp, #108]	; 0x6c
 24a:	f7ff fffe 	bl	0 <json_helper_object_array_start_item>
 24e:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 250:	f240 0000 	movw	r0, #0
 254:	f2c0 0000 	movt	r0, #0
 258:	2103      	movs	r1, #3
 25a:	f7ff fffe 	bl	0 <<str as mynewt::encoding::coap_context::ToBytesOptionalNull>::to_bytes_optional_nul>
 25e:	901a      	str	r0, [sp, #104]	; 0x68
 260:	9119      	str	r1, [sp, #100]	; 0x64
 262:	e7ff      	b.n	264 <app::app_network::send_sensor_data+0x264>
 264:	981a      	ldr	r0, [sp, #104]	; 0x68
 266:	9050      	str	r0, [sp, #320]	; 0x140
 268:	9919      	ldr	r1, [sp, #100]	; 0x64
 26a:	9151      	str	r1, [sp, #324]	; 0x144
 26c:	9a25      	ldr	r2, [sp, #148]	; 0x94
 26e:	6810      	ldr	r0, [r2, #0]
 270:	f7ff fffe 	bl	0 <<mynewt::Strn as mynewt::encoding::coap_context::ToBytesOptionalNull>::to_bytes_optional_nul>
 274:	9018      	str	r0, [sp, #96]	; 0x60
 276:	9117      	str	r1, [sp, #92]	; 0x5c
 278:	e7ff      	b.n	27a <app::app_network::send_sensor_data+0x27a>
 27a:	9818      	ldr	r0, [sp, #96]	; 0x60
 27c:	9052      	str	r0, [sp, #328]	; 0x148
 27e:	9917      	ldr	r1, [sp, #92]	; 0x5c
 280:	9153      	str	r1, [sp, #332]	; 0x14c
 282:	f240 0000 	movw	r0, #0
 286:	f2c0 0000 	movt	r0, #0
 28a:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::to_void_ptr>
 28e:	9016      	str	r0, [sp, #88]	; 0x58
 290:	e7ff      	b.n	292 <app::app_network::send_sensor_data+0x292>
 292:	9950      	ldr	r1, [sp, #320]	; 0x140
 294:	9a51      	ldr	r2, [sp, #324]	; 0x144
 296:	f240 0000 	movw	r0, #0
 29a:	f2c0 0000 	movt	r0, #0
 29e:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 2a2:	9015      	str	r0, [sp, #84]	; 0x54
 2a4:	e7ff      	b.n	2a6 <app::app_network::send_sensor_data+0x2a6>
 2a6:	9952      	ldr	r1, [sp, #328]	; 0x148
 2a8:	9a53      	ldr	r2, [sp, #332]	; 0x14c
 2aa:	f240 0000 	movw	r0, #0
 2ae:	f2c0 0000 	movt	r0, #0
 2b2:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::value_to_cstr>
 2b6:	9014      	str	r0, [sp, #80]	; 0x50
 2b8:	e7ff      	b.n	2ba <app::app_network::send_sensor_data+0x2ba>
 2ba:	9816      	ldr	r0, [sp, #88]	; 0x58
 2bc:	9915      	ldr	r1, [sp, #84]	; 0x54
 2be:	9a14      	ldr	r2, [sp, #80]	; 0x50
 2c0:	f7ff fffe 	bl	0 <json_helper_set_text_string>
 2c4:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 2c6:	f240 0000 	movw	r0, #0
 2ca:	f2c0 0000 	movt	r0, #0
 2ce:	2105      	movs	r1, #5
 2d0:	f7ff fffe 	bl	0 <<str as mynewt::encoding::coap_context::ToBytesOptionalNull>::to_bytes_optional_nul>
 2d4:	9013      	str	r0, [sp, #76]	; 0x4c
 2d6:	9112      	str	r1, [sp, #72]	; 0x48
 2d8:	e7ff      	b.n	2da <app::app_network::send_sensor_data+0x2da>
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
 2f2:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::to_void_ptr>
 2f6:	9011      	str	r0, [sp, #68]	; 0x44
 2f8:	e7ff      	b.n	2fa <app::app_network::send_sensor_data+0x2fa>
 2fa:	9954      	ldr	r1, [sp, #336]	; 0x150
 2fc:	9a55      	ldr	r2, [sp, #340]	; 0x154
 2fe:	f240 0000 	movw	r0, #0
 302:	f2c0 0000 	movt	r0, #0
 306:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 30a:	9010      	str	r0, [sp, #64]	; 0x40
 30c:	e7ff      	b.n	30e <app::app_network::send_sensor_data+0x30e>
 30e:	9a56      	ldr	r2, [sp, #344]	; 0x158
 310:	9b57      	ldr	r3, [sp, #348]	; 0x15c
 312:	9811      	ldr	r0, [sp, #68]	; 0x44
 314:	9910      	ldr	r1, [sp, #64]	; 0x40
 316:	f7ff fffe 	bl	0 <json_helper_set_int>
 31a:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 31c:	f240 0100 	movw	r1, #0
 320:	f2c0 0100 	movt	r1, #0
 324:	a859      	add	r0, sp, #356	; 0x164
 326:	2204      	movs	r2, #4
 328:	f7ff fffe 	bl	0 <mynewt::Strn::new>
 32c:	e7ff      	b.n	6 <app::app_network::send_sensor_data+0x6>
 32e:	f240 0100 	movw	r1, #0
 332:	f2c0 0100 	movt	r1, #0
 336:	a85c      	add	r0, sp, #368	; 0x170
 338:	2204      	movs	r2, #4
 33a:	f7ff fffe 	bl	0 <mynewt::Strn::new>
 33e:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 340:	f240 0100 	movw	r1, #0
 344:	f2c0 0100 	movt	r1, #0
 348:	a85f      	add	r0, sp, #380	; 0x17c
 34a:	2205      	movs	r2, #5
 34c:	f7ff fffe 	bl	0 <mynewt::Strn::new>
 350:	e7ff      	b.n	352 <app::app_network::send_sensor_data+0x352>
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
 36a:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::json_set_geolocation>
 36e:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
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
_ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 392:	910f      	str	r1, [sp, #60]	; 0x3c
 394:	920e      	str	r2, [sp, #56]	; 0x38
 396:	e7ff      	b.n	398 <app::app_network::send_sensor_data+0x398>
 398:	f240 0000 	movw	r0, #0
 39c:	f2c0 0000 	movt	r0, #0
 3a0:	990f      	ldr	r1, [sp, #60]	; 0x3c
 3a2:	9a0e      	ldr	r2, [sp, #56]	; 0x38
 3a4:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 3a8:	900d      	str	r0, [sp, #52]	; 0x34
 3aa:	e7ff      	b.n	3ac <app::app_network::send_sensor_data+0x3ac>
 3ac:	980d      	ldr	r0, [sp, #52]	; 0x34
 3ae:	f7ff fffe 	bl	0 <json_helper_object_array_end_item>
 3b2:	e7ff      	b.n	3b4 <app::app_network::send_sensor_data+0x3b4>
 3b4:	e000      	b.n	3b8 <app::app_network::send_sensor_data+0x3b8>
 3b6:	e7ff      	b.n	3b8 <app::app_network::send_sensor_data+0x3b8>
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
_ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 3da:	910c      	str	r1, [sp, #48]	; 0x30
 3dc:	920b      	str	r2, [sp, #44]	; 0x2c
 3de:	e7ff      	b.n	3e0 <app::app_network::send_sensor_data+0x3e0>
 3e0:	f240 0000 	movw	r0, #0
 3e4:	f2c0 0000 	movt	r0, #0
 3e8:	990c      	ldr	r1, [sp, #48]	; 0x30
 3ea:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 3ec:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 3f0:	900a      	str	r0, [sp, #40]	; 0x28
 3f2:	e7ff      	b.n	3f4 <app::app_network::send_sensor_data+0x3f4>
 3f4:	980a      	ldr	r0, [sp, #40]	; 0x28
 3f6:	f7ff fffe 	bl	0 <json_helper_object_array_start_item>
 3fa:	e7ff      	b.n	a <app::app_network::send_sensor_data+0xa>
 3fc:	f240 0100 	movw	r1, #0
 400:	f2c0 0100 	movt	r1, #0
 404:	a868      	add	r0, sp, #416	; 0x1a0
 406:	2204      	movs	r2, #4
 408:	f7ff fffe 	bl	0 <mynewt::Strn::new>
 40c:	e7ff      	b.n	40e <app::app_network::send_sensor_data+0x40e>
 40e:	a868      	add	r0, sp, #416	; 0x1a0
 410:	9067      	str	r0, [sp, #412]	; 0x19c
 412:	f240 0100 	movw	r1, #0
 416:	f2c0 0100 	movt	r1, #0
 41a:	a86c      	add	r0, sp, #432	; 0x1b0
 41c:	2207      	movs	r2, #7
 41e:	f7ff fffe 	bl	0 <mynewt::Strn::new>
 422:	e7ff      	b.n	424 <app::app_network::send_sensor_data+0x424>
 424:	a86c      	add	r0, sp, #432	; 0x1b0
 426:	906b      	str	r0, [sp, #428]	; 0x1ac
 428:	9967      	ldr	r1, [sp, #412]	; 0x19c
 42a:	9a6b      	ldr	r2, [sp, #428]	; 0x1ac
 42c:	f240 0000 	movw	r0, #0
 430:	f2c0 0000 	movt	r0, #0
 434:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::json_set_text_string>
 438:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 43a:	f240 0100 	movw	r1, #0
 43e:	f2c0 0100 	movt	r1, #0
 442:	a870      	add	r0, sp, #448	; 0x1c0
 444:	2206      	movs	r2, #6
 446:	f7ff fffe 	bl	0 <mynewt::Strn::new>
 44a:	e7ff      	b.n	44c <app::app_network::send_sensor_data+0x44c>
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
 460:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::json_set_text_string>
 464:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
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
_ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 488:	9109      	str	r1, [sp, #36]	; 0x24
 48a:	9208      	str	r2, [sp, #32]
 48c:	e7ff      	b.n	48e <app::app_network::send_sensor_data+0x48e>
 48e:	f240 0000 	movw	r0, #0
 492:	f2c0 0000 	movt	r0, #0
 496:	9909      	ldr	r1, [sp, #36]	; 0x24
 498:	9a08      	ldr	r2, [sp, #32]
 49a:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 49e:	9007      	str	r0, [sp, #28]
 4a0:	e7ff      	b.n	4a2 <app::app_network::send_sensor_data+0x4a2>
 4a2:	9807      	ldr	r0, [sp, #28]
 4a4:	f7ff fffe 	bl	0 <json_helper_object_array_end_item>
 4a8:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 4aa:	f240 0000 	movw	r0, #0
 4ae:	f2c0 0000 	movt	r0, #0
 4b2:	9076      	str	r0, [sp, #472]	; 0x1d8
 4b4:	2007      	movs	r0, #7
 4b6:	9077      	str	r0, [sp, #476]	; 0x1dc
 4b8:	f240 0000 	movw	r0, #0
 4bc:	f2c0 0000 	movt	r0, #0
 4c0:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::to_void_ptr>
 4c4:	9006      	str	r0, [sp, #24]
 4c6:	e7ff      	b.n	4c8 <app::app_network::send_sensor_data+0x4c8>
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
_ZN3app11app_network16send_sensor_data17ha4a5bc6fb8f41ae8E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:98
 4dc:	9105      	str	r1, [sp, #20]
 4de:	9204      	str	r2, [sp, #16]
 4e0:	e7ff      	b.n	4e2 <app::app_network::send_sensor_data+0x4e2>
 4e2:	f240 0000 	movw	r0, #0
 4e6:	f2c0 0000 	movt	r0, #0
 4ea:	9905      	ldr	r1, [sp, #20]
 4ec:	9a04      	ldr	r2, [sp, #16]
 4ee:	f7ff fffe 	bl	0 <mynewt::encoding::coap_context::CoapContext::key_to_cstr>
 4f2:	9003      	str	r0, [sp, #12]
 4f4:	e7ff      	b.n	4f6 <app::app_network::send_sensor_data+0x4f6>
 4f6:	9806      	ldr	r0, [sp, #24]
 4f8:	9903      	ldr	r1, [sp, #12]
 4fa:	f7ff fffe 	bl	0 <json_helper_close_array>
 4fe:	e7ff      	b.n	2 <json_rep_end_root_object+0x2>
 500:	f7ff fffe 	bl	0 <json_rep_end_root_object>
 504:	e7ff      	b.n	506 <app::app_network::send_sensor_data+0x506>
 506:	a87a      	add	r0, sp, #488	; 0x1e8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:113
    sensor_network::do_server_post() ? ;
 508:	f7ff fffe 	bl	0 <mynewt::libs::sensor_network::do_server_post>
 50c:	e7ff      	b.n	50e <app::app_network::send_sensor_data+0x50e>
 50e:	a878      	add	r0, sp, #480	; 0x1e0
 510:	a97a      	add	r1, sp, #488	; 0x1e8
 512:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
 516:	e7ff      	b.n	518 <app::app_network::send_sensor_data+0x518>
 518:	f89d 01e0 	ldrb.w	r0, [sp, #480]	; 0x1e0
 51c:	07c1      	lsls	r1, r0, #31
 51e:	2900      	cmp	r1, #0
 520:	d00f      	beq.n	542 <app::app_network::send_sensor_data+0x542>
 522:	e7ff      	b.n	524 <app::app_network::send_sensor_data+0x524>
 524:	e000      	b.n	528 <app::app_network::send_sensor_data+0x528>
 526:	defe      	udf	#254	; 0xfe
 528:	9879      	ldr	r0, [sp, #484]	; 0x1e4
 52a:	907c      	str	r0, [sp, #496]	; 0x1f0
 52c:	987c      	ldr	r0, [sp, #496]	; 0x1f0
 52e:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
 532:	9002      	str	r0, [sp, #8]
 534:	e7ff      	b.n	536 <app::app_network::send_sensor_data+0x536>
 536:	9802      	ldr	r0, [sp, #8]
 538:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
 53c:	9026      	str	r0, [sp, #152]	; 0x98
 53e:	e7ff      	b.n	540 <app::app_network::send_sensor_data+0x540>
 540:	e618      	b.n	174 <app::app_network::send_sensor_data+0x174>
 542:	f89d 01e1 	ldrb.w	r0, [sp, #481]	; 0x1e1
 546:	f88d 01f7 	strb.w	r0, [sp, #503]	; 0x1f7
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:116
    console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=");
 54a:	f240 0000 	movw	r0, #0
 54e:	f2c0 0000 	movt	r0, #0
 552:	2148      	movs	r1, #72	; 0x48
 554:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
 558:	e7ff      	b.n	55a <app::app_network::send_sensor_data+0x55a>
 55a:	a828      	add	r0, sp, #160	; 0xa0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:117
    console::print_strn(&device_id); console::print("\n");
 55c:	f7ff fffe 	bl	0 <mynewt::sys::console::print_strn>
 560:	e7ff      	b.n	2 <app::app_network::send_sensor_data+0x2>
 562:	f240 0000 	movw	r0, #0
 566:	f2c0 0000 	movt	r0, #0
 56a:	2101      	movs	r1, #1
 56c:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
 570:	e7ff      	b.n	572 <app::app_network::send_sensor_data+0x572>
 572:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:120
    Ok(())
 574:	9026      	str	r0, [sp, #152]	; 0x98
 576:	2001      	movs	r0, #1
 578:	9026      	str	r0, [sp, #152]	; 0x98
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_network.rs:121
}
 57a:	e588      	b.n	8e <app::app_network::send_sensor_data+0x8e>

app-1da0d8acf4e589c0.2fiebdqzjcjlhh5i.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2fiebdqzjcjlhh5i
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
00000000 l    d  .text._ZN4core3fmt9Arguments6new_v117h928d03abfda7eb12E	00000000 .text._ZN4core3fmt9Arguments6new_v117h928d03abfda7eb12E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3fmt9Arguments6new_v117h928d03abfda7eb12E	00000038 .hidden core::fmt::Arguments::new_v1



Disassembly of section .text._ZN4core3fmt9Arguments6new_v117h928d03abfda7eb12E:

00000000 <core::fmt::Arguments::new_v1>:
_ZN4core3fmt9Arguments6new_v117h928d03abfda7eb12E():
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

app-1da0d8acf4e589c0.2su6vllo4n4sfmxx.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2su6vllo4n4sfmxx
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
00000000 l    d  .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hab9386bee4249b71E	00000000 .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hab9386bee4249b71E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hab9386bee4249b71E	0000002a .hidden <core::any::TypeId as core::cmp::PartialEq>::eq



Disassembly of section .text._ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hab9386bee4249b71E:

00000000 <<core::any::TypeId as core::cmp::PartialEq>::eq>:
_ZN58_$LT$core..any..TypeId$u20$as$u20$core..cmp..PartialEq$GT$2eq17hab9386bee4249b71E():
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

app-1da0d8acf4e589c0.2upwd3355h29lo27.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2upwd3355h29lo27
000009a7 l       .debug_str	00000000 
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
0000091e l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.0	00000012 .Lanon.ecda12205f5982de341fa355bbd3a414.0
00000000 l     O .rodata.cst4	00000004 .Lanon.ecda12205f5982de341fa355bbd3a414.1
00000000 l     O .rodata.cst8	00000008 .Lanon.ecda12205f5982de341fa355bbd3a414.10
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.11	0000000e .Lanon.ecda12205f5982de341fa355bbd3a414.11
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.12	00000013 .Lanon.ecda12205f5982de341fa355bbd3a414.12
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.13	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.13
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.14	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.14
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.15	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.15
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.16	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.16
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.17	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.17
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.18	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.18
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.19	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.19
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.20	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.20
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.21	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.21
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.22	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.22
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.23	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.23
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.24	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.24
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.25	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.25
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.26	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.26
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.27	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.27
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.28	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.28
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.29	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.29
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.30	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.30
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.31	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.31
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.32	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.32
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.33	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.33
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.34	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.34
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.35	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.35
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.36	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.36
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.37	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.37
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.38	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.38
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.39	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.39
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.40	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.40
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.41	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.41
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.42	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.42
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.43	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.43
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.44	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.44
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.45	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.45
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.46	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.46
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.47	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.47
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.48	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.48
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.49	00000007 .Lanon.ecda12205f5982de341fa355bbd3a414.49
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.5	00000018 .Lanon.ecda12205f5982de341fa355bbd3a414.5
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.50	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.50
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.51	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.51
00000008 l     O .rodata.cst8	00000008 .Lanon.ecda12205f5982de341fa355bbd3a414.52
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.53	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.53
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.54	00000009 .Lanon.ecda12205f5982de341fa355bbd3a414.54
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.7	00000008 .Lanon.ecda12205f5982de341fa355bbd3a414.7
00000000 l     O .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.9	00000010 .Lanon.ecda12205f5982de341fa355bbd3a414.9
00000000 l     O .bss._ZN3app12touch_sensor10I2C_BUFFER17hcdefdb5536f1751eE	00000001 app::touch_sensor::I2C_BUFFER
00000000 l     O .bss._ZN3app12touch_sensor10TOUCH_DATA17h58e2039b54efe362E	00000052 app::touch_sensor::TOUCH_DATA
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_DELAY17h93cb7ef4a970163aE	00000000 app::touch_sensor::TOUCH_DELAY
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_EVENT17h05b01319e9a6c670E	00000010 app::touch_sensor::TOUCH_EVENT
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_RESET17ha90768b80f1ba73cE	00000004 app::touch_sensor::TOUCH_RESET
00000000 l     F .text._ZN3app12touch_sensor14read_touchdata17hd3816951a34363f2E	00000786 app::touch_sensor::read_touchdata
00000000 l     F .text._ZN3app12touch_sensor19read_register_range17hdff2f1fbe7e551c9E	000001ce app::touch_sensor::read_register_range
00000000 l     F .text._ZN3app12touch_sensor20touch_event_callback17hf4b3accddac624c9E	00000056 app::touch_sensor::touch_event_callback
00000000 l     F .text._ZN3app12touch_sensor23touch_interrupt_handler17h178221a6fbb3135bE	00000046 app::touch_sensor::touch_interrupt_handler
00000000 l     O .bss._ZN3app12touch_sensor3buf17hee501e91817386bcE	0000003f app::touch_sensor::buf
00000000 l     O .bss._ZN3app12touch_sensor8I2C_DATA17h517acf089ef6a650E	00000008 app::touch_sensor::I2C_DATA
00000000 l     O .rodata.str.0	00000021 str.0
00000000 l     O .rodata.str.1	0000001c str.1
00000000 l    d  .text._ZN3app12touch_sensor18start_touch_sensor17h5d5739471ae530b0E	00000000 .text._ZN3app12touch_sensor18start_touch_sensor17h5d5739471ae530b0E
00000000 l    d  .text._ZN3app12touch_sensor23touch_interrupt_handler17h178221a6fbb3135bE	00000000 .text._ZN3app12touch_sensor23touch_interrupt_handler17h178221a6fbb3135bE
00000000 l    d  .text._ZN3app12touch_sensor20touch_event_callback17hf4b3accddac624c9E	00000000 .text._ZN3app12touch_sensor20touch_event_callback17hf4b3accddac624c9E
00000000 l    d  .text._ZN3app12touch_sensor14read_touchdata17hd3816951a34363f2E	00000000 .text._ZN3app12touch_sensor14read_touchdata17hd3816951a34363f2E
00000000 l    d  .text._ZN3app12touch_sensor19read_register_range17hdff2f1fbe7e551c9E	00000000 .text._ZN3app12touch_sensor19read_register_range17hdff2f1fbe7e551c9E
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_RESET17ha90768b80f1ba73cE	00000000 .bss._ZN3app12touch_sensor11TOUCH_RESET17ha90768b80f1ba73cE
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_DELAY17h93cb7ef4a970163aE	00000000 .bss._ZN3app12touch_sensor11TOUCH_DELAY17h93cb7ef4a970163aE
00000000 l    d  .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.2	00000000 .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.2
00000000 l    d  .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.3	00000000 .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.3
00000000 l    d  .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.4	00000000 .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.4
00000000 l    d  .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.6	00000000 .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.6
00000000 l    d  .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.8	00000000 .rodata..Lanon.ecda12205f5982de341fa355bbd3a414.8
00000000 l    d  .bss._ZN3app12touch_sensor10TOUCH_DATA17h58e2039b54efe362E	00000000 .bss._ZN3app12touch_sensor10TOUCH_DATA17h58e2039b54efe362E
00000000 l    d  .bss._ZN3app12touch_sensor3buf17hee501e91817386bcE	00000000 .bss._ZN3app12touch_sensor3buf17hee501e91817386bcE
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_EVENT17h05b01319e9a6c670E	00000000 .bss._ZN3app12touch_sensor11TOUCH_EVENT17h05b01319e9a6c670E
00000000 l    d  .bss._ZN3app12touch_sensor8I2C_DATA17h517acf089ef6a650E	00000000 .bss._ZN3app12touch_sensor8I2C_DATA17h517acf089ef6a650E
00000000 l    d  .bss._ZN3app12touch_sensor10I2C_BUFFER17hcdefdb5536f1751eE	00000000 .bss._ZN3app12touch_sensor10I2C_BUFFER17hcdefdb5536f1751eE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app12touch_sensor18start_touch_sensor17h5d5739471ae530b0E	0000025c .hidden app::touch_sensor::start_touch_sensor
00000000         *UND*	00000000 <&T as core::fmt::Debug>::fmt
00000000         *UND*	00000000 core::fmt::ArgumentV1::new
00000000         *UND*	00000000 core::fmt::ArgumentV1::new
00000000         *UND*	00000000 .hidden core::fmt::Arguments::new_v1
00000000         *UND*	00000000 core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
00000000         *UND*	00000000 core::slice::<impl [T]>::as_mut_ptr
00000000         *UND*	00000000 core::slice::<impl [T]>::len
00000000         *UND*	00000000 core::result::Result<T,E>::expect
00000000         *UND*	00000000 core::result::Result<T,E>::expect
00000000         *UND*	00000000 core::panicking::panic_bounds_check
00000000         *UND*	00000000 core::panicking::panic
00000000         *UND*	00000000 core::panicking::panic_fmt
00000000         *UND*	00000000 <T as core::convert::From<T>>::from
00000000         *UND*	00000000 <core::fmt::Arguments as core::fmt::Display>::fmt
00000000         *UND*	00000000 druid::win_handler::handle_touch
00000000         *UND*	00000000 <I as core::iter::traits::collect::IntoIterator>::into_iter
00000000         *UND*	00000000 mynewt::hal::GPIO::init
00000000         *UND*	00000000 mynewt::sys::console::print
00000000         *UND*	00000000 mynewt::kernel::os::eventq_dflt_get
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::from_error
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000         *UND*	00000000 <mynewt::hal::GPIO as embedded_hal::digital::v2::OutputPin>::set_low
00000000         *UND*	00000000 <mynewt::hal::GPIO as embedded_hal::digital::v2::OutputPin>::set_high
00000000         *UND*	00000000 <mynewt::hal::Delay as embedded_hal::blocking::delay::DelayMs<u8>>::delay_ms
00000000         *UND*	00000000 __aeabi_memclr
00000000         *UND*	00000000 __aeabi_memcpy
00000000         *UND*	00000000 hal_gpio_irq_enable
00000000         *UND*	00000000 hal_gpio_irq_init
00000000         *UND*	00000000 hal_i2c_master_read
00000000         *UND*	00000000 hal_i2c_master_write
00000000         *UND*	00000000 os_eventq_put



Disassembly of section .text._ZN3app12touch_sensor18start_touch_sensor17h5d5739471ae530b0E:

00000000 <app::touch_sensor::start_touch_sensor>:
_ZN3app12touch_sensor18start_touch_sensor17h5d5739471ae530b0E():
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
   e:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  12:	e7ff      	b.n	2 <app::touch_sensor::start_touch_sensor+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:43

    //  Init GPIO for the Reset Pin
    unsafe { TOUCH_RESET.init(TOUCH_RESET_PIN) ? };
  14:	f240 0000 	movw	r0, #0
  18:	f2c0 0000 	movt	r0, #0
  1c:	210a      	movs	r1, #10
  1e:	f7ff fffe 	bl	0 <mynewt::hal::GPIO::init>
  22:	900e      	str	r0, [sp, #56]	; 0x38
  24:	e7ff      	b.n	26 <app::touch_sensor::start_touch_sensor+0x26>
  26:	980e      	ldr	r0, [sp, #56]	; 0x38
  28:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  2c:	9010      	str	r0, [sp, #64]	; 0x40
  2e:	e7ff      	b.n	30 <app::touch_sensor::start_touch_sensor+0x30>
  30:	9810      	ldr	r0, [sp, #64]	; 0x40
  32:	1e41      	subs	r1, r0, #1
  34:	bf18      	it	ne
  36:	2101      	movne	r1, #1
  38:	2801      	cmp	r0, #1
  3a:	d012      	beq.n	62 <app::touch_sensor::start_touch_sensor+0x62>
  3c:	e7ff      	b.n	3e <app::touch_sensor::start_touch_sensor+0x3e>
  3e:	e000      	b.n	42 <app::touch_sensor::start_touch_sensor+0x42>
  40:	defe      	udf	#254	; 0xfe
  42:	9810      	ldr	r0, [sp, #64]	; 0x40
  44:	9011      	str	r0, [sp, #68]	; 0x44
  46:	9811      	ldr	r0, [sp, #68]	; 0x44
  48:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
  4c:	900d      	str	r0, [sp, #52]	; 0x34
  4e:	e002      	b.n	56 <app::touch_sensor::start_touch_sensor+0x56>
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
  58:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
  5c:	900f      	str	r0, [sp, #60]	; 0x3c
  5e:	e7ff      	b.n	60 <app::touch_sensor::start_touch_sensor+0x60>
  60:	e7f6      	b.n	50 <app::touch_sensor::start_touch_sensor+0x50>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:47
        TOUCH_RESET.set_low() ? ;
  62:	f240 0000 	movw	r0, #0
  66:	f2c0 0000 	movt	r0, #0
  6a:	f7ff fffe 	bl	0 <<mynewt::hal::GPIO as embedded_hal::digital::v2::OutputPin>::set_low>
  6e:	900c      	str	r0, [sp, #48]	; 0x30
  70:	e7ff      	b.n	72 <app::touch_sensor::start_touch_sensor+0x72>
  72:	980c      	ldr	r0, [sp, #48]	; 0x30
  74:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  78:	9013      	str	r0, [sp, #76]	; 0x4c
  7a:	e7ff      	b.n	7c <app::touch_sensor::start_touch_sensor+0x7c>
  7c:	9813      	ldr	r0, [sp, #76]	; 0x4c
  7e:	1e41      	subs	r1, r0, #1
  80:	bf18      	it	ne
  82:	2101      	movne	r1, #1
  84:	2801      	cmp	r0, #1
  86:	d010      	beq.n	aa <app::touch_sensor::start_touch_sensor+0xaa>
  88:	e7ff      	b.n	8a <app::touch_sensor::start_touch_sensor+0x8a>
  8a:	e000      	b.n	8e <app::touch_sensor::start_touch_sensor+0x8e>
  8c:	defe      	udf	#254	; 0xfe
  8e:	9813      	ldr	r0, [sp, #76]	; 0x4c
  90:	9014      	str	r0, [sp, #80]	; 0x50
  92:	9814      	ldr	r0, [sp, #80]	; 0x50
  94:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
  98:	900b      	str	r0, [sp, #44]	; 0x2c
  9a:	e7ff      	b.n	9c <app::touch_sensor::start_touch_sensor+0x9c>
  9c:	980b      	ldr	r0, [sp, #44]	; 0x2c
  9e:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
  a2:	900f      	str	r0, [sp, #60]	; 0x3c
  a4:	e7ff      	b.n	a6 <app::touch_sensor::start_touch_sensor+0xa6>
  a6:	e7ff      	b.n	a8 <app::touch_sensor::start_touch_sensor+0xa8>
  a8:	e7d2      	b.n	50 <app::touch_sensor::start_touch_sensor+0x50>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:48
        TOUCH_DELAY.delay_ms(20);
  aa:	f240 0000 	movw	r0, #0
  ae:	f2c0 0000 	movt	r0, #0
  b2:	2114      	movs	r1, #20
  b4:	f7ff fffe 	bl	0 <<mynewt::hal::Delay as embedded_hal::blocking::delay::DelayMs<u8>>::delay_ms>
  b8:	e7ff      	b.n	2 <app::touch_sensor::start_touch_sensor+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:49
        TOUCH_RESET.set_high() ? ;
  ba:	f240 0000 	movw	r0, #0
  be:	f2c0 0000 	movt	r0, #0
  c2:	f7ff fffe 	bl	0 <<mynewt::hal::GPIO as embedded_hal::digital::v2::OutputPin>::set_high>
  c6:	900a      	str	r0, [sp, #40]	; 0x28
  c8:	e7ff      	b.n	ca <app::touch_sensor::start_touch_sensor+0xca>
  ca:	980a      	ldr	r0, [sp, #40]	; 0x28
  cc:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  d0:	9016      	str	r0, [sp, #88]	; 0x58
  d2:	e7ff      	b.n	d4 <app::touch_sensor::start_touch_sensor+0xd4>
  d4:	9816      	ldr	r0, [sp, #88]	; 0x58
  d6:	1e41      	subs	r1, r0, #1
  d8:	bf18      	it	ne
  da:	2101      	movne	r1, #1
  dc:	2801      	cmp	r0, #1
  de:	d00f      	beq.n	100 <app::touch_sensor::start_touch_sensor+0x100>
  e0:	e7ff      	b.n	e2 <app::touch_sensor::start_touch_sensor+0xe2>
  e2:	e000      	b.n	e6 <app::touch_sensor::start_touch_sensor+0xe6>
  e4:	defe      	udf	#254	; 0xfe
  e6:	9816      	ldr	r0, [sp, #88]	; 0x58
  e8:	9017      	str	r0, [sp, #92]	; 0x5c
  ea:	9817      	ldr	r0, [sp, #92]	; 0x5c
  ec:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
  f0:	9009      	str	r0, [sp, #36]	; 0x24
  f2:	e7ff      	b.n	f4 <app::touch_sensor::start_touch_sensor+0xf4>
  f4:	9809      	ldr	r0, [sp, #36]	; 0x24
  f6:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
  fa:	900f      	str	r0, [sp, #60]	; 0x3c
  fc:	e7ff      	b.n	fe <app::touch_sensor::start_touch_sensor+0xfe>
  fe:	e7d3      	b.n	a8 <app::touch_sensor::start_touch_sensor+0xa8>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:50
        TOUCH_DELAY.delay_ms(200); TOUCH_DELAY.delay_ms(200);    
 100:	f240 0000 	movw	r0, #0
 104:	f2c0 0000 	movt	r0, #0
 108:	21c8      	movs	r1, #200	; 0xc8
 10a:	f7ff fffe 	bl	0 <<mynewt::hal::Delay as embedded_hal::blocking::delay::DelayMs<u8>>::delay_ms>
 10e:	e7ff      	b.n	2 <app::touch_sensor::start_touch_sensor+0x2>
 110:	f240 0000 	movw	r0, #0
 114:	f2c0 0000 	movt	r0, #0
 118:	21c8      	movs	r1, #200	; 0xc8
 11a:	f7ff fffe 	bl	0 <<mynewt::hal::Delay as embedded_hal::blocking::delay::DelayMs<u8>>::delay_ms>
 11e:	e7ff      	b.n	2 <app::touch_sensor::start_touch_sensor+0x2>
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
 144:	e7ff      	b.n	146 <app::touch_sensor::start_touch_sensor+0x146>
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
 15a:	e7ff      	b.n	15c <app::touch_sensor::start_touch_sensor+0x15c>
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
 17c:	d104      	bne.n	188 <app::touch_sensor::start_touch_sensor+0x188>
 17e:	e7ff      	b.n	180 <app::touch_sensor::start_touch_sensor+0x180>
 180:	201c      	movs	r0, #28
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:67
    unsafe { hal::hal_gpio_irq_enable(TOUCH_INTERRUPT_PIN) };
 182:	f7ff fffe 	bl	0 <hal_gpio_irq_enable>
 186:	e064      	b.n	252 <app::touch_sensor::start_touch_sensor+0x252>
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
 1a4:	f7ff fffe 	bl	0 <core::fmt::Arguments::new_v1>
 1a8:	e7ff      	b.n	1aa <app::touch_sensor::start_touch_sensor+0x1aa>
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
 1cc:	f7ff fffe 	bl	0 <core::fmt::ArgumentV1::new>
 1d0:	9008      	str	r0, [sp, #32]
 1d2:	9107      	str	r1, [sp, #28]
 1d4:	e7ff      	b.n	1d6 <app::touch_sensor::start_touch_sensor+0x1d6>
 1d6:	9839      	ldr	r0, [sp, #228]	; 0xe4
 1d8:	f240 0100 	movw	r1, #0
 1dc:	f2c0 0100 	movt	r1, #0
 1e0:	f7ff fffe 	bl	0 <core::fmt::ArgumentV1::new>
 1e4:	9006      	str	r0, [sp, #24]
 1e6:	9105      	str	r1, [sp, #20]
 1e8:	e7ff      	b.n	1ea <app::touch_sensor::start_touch_sensor+0x1ea>
 1ea:	983a      	ldr	r0, [sp, #232]	; 0xe8
 1ec:	f240 0100 	movw	r1, #0
 1f0:	f2c0 0100 	movt	r1, #0
 1f4:	f7ff fffe 	bl	0 <core::fmt::ArgumentV1::new>
 1f8:	9004      	str	r0, [sp, #16]
 1fa:	9103      	str	r1, [sp, #12]
 1fc:	e7ff      	b.n	1fe <app::touch_sensor::start_touch_sensor+0x1fe>
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
 232:	f7ff fffe 	bl	0 <core::fmt::Arguments::new_v1>
 236:	e7ff      	b.n	2 <app::touch_sensor::start_touch_sensor+0x2>
 238:	f240 0000 	movw	r0, #0
 23c:	f2c0 0000 	movt	r0, #0
 240:	903b      	str	r0, [sp, #236]	; 0xec
 242:	993b      	ldr	r1, [sp, #236]	; 0xec
 244:	9102      	str	r1, [sp, #8]
 246:	e7ff      	b.n	248 <app::touch_sensor::start_touch_sensor+0x248>
 248:	a821      	add	r0, sp, #132	; 0x84
 24a:	9902      	ldr	r1, [sp, #8]
 24c:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
 250:	defe      	udf	#254	; 0xfe
 252:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:68
    Ok(())
 254:	900f      	str	r0, [sp, #60]	; 0x3c
 256:	2001      	movs	r0, #1
 258:	900f      	str	r0, [sp, #60]	; 0x3c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:69
}
 25a:	e6f9      	b.n	50 <app::touch_sensor::start_touch_sensor+0x50>

Disassembly of section .text._ZN3app12touch_sensor23touch_interrupt_handler17h178221a6fbb3135bE:

00000000 <app::touch_sensor::touch_interrupt_handler>:
_ZN3app12touch_sensor23touch_interrupt_handler17h178221a6fbb3135bE():
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
  18:	f7ff fffe 	bl	0 <mynewt::kernel::os::eventq_dflt_get>
  1c:	e7ff      	b.n	2 <app::touch_sensor::touch_interrupt_handler+0x2>
  1e:	f240 0100 	movw	r1, #0
  22:	f2c0 0100 	movt	r1, #0
  26:	a804      	add	r0, sp, #16
  28:	2208      	movs	r2, #8
  2a:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  2e:	9003      	str	r0, [sp, #12]
  30:	e7ff      	b.n	32 <app::touch_sensor::touch_interrupt_handler+0x32>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:78
        .expect("GET fail");
	unsafe { os::os_eventq_put(queue, &mut TOUCH_EVENT) };  //  Trigger the callback function `touch_event_callback()`
  32:	9803      	ldr	r0, [sp, #12]
  34:	f240 0100 	movw	r1, #0
  38:	f2c0 0100 	movt	r1, #0
  3c:	f7ff fffe 	bl	0 <os_eventq_put>
  40:	e7ff      	b.n	42 <app::touch_sensor::touch_interrupt_handler+0x42>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:79
}
  42:	b006      	add	sp, #24
  44:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app12touch_sensor20touch_event_callback17hf4b3accddac624c9E:

00000000 <app::touch_sensor::touch_event_callback>:
_ZN3app12touch_sensor20touch_event_callback17hf4b3accddac624c9E():
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
   e:	f7ff fffe 	bl	0 <app::touch_sensor::touch_event_callback>
  12:	9000      	str	r0, [sp, #0]
  14:	e7ff      	b.n	16 <app::touch_sensor::touch_event_callback+0x16>
  16:	f240 0100 	movw	r1, #0
  1a:	f2c0 0100 	movt	r1, #0
  1e:	220e      	movs	r2, #14
  20:	9800      	ldr	r0, [sp, #0]
  22:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  26:	e7ff      	b.n	2 <app::touch_sensor::touch_event_callback+0x2>
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
  4c:	f7ff fffe 	bl	0 <druid::win_handler::handle_touch>
  50:	e7ff      	b.n	52 <app::touch_sensor::touch_event_callback+0x52>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:101
    }
    //  Disable the console output because it slows down the rendering
    //  console::printint(unsafe { TOUCH_DATA.touches[0].x } as i32); console::print(", ");
    //  console::printint(unsafe { TOUCH_DATA.touches[0].y } as i32); console::print("\n");
    //  console::flush();   
}
  52:	b006      	add	sp, #24
  54:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app12touch_sensor14read_touchdata17hd3816951a34363f2E:

00000000 <app::touch_sensor::read_touchdata>:
_ZN3app12touch_sensor14read_touchdata17hd3816951a34363f2E():
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
  1e:	f7ff fffe 	bl	0 <app::touch_sensor::read_touchdata>
  22:	902b      	str	r0, [sp, #172]	; 0xac
  24:	e7ff      	b.n	26 <app::touch_sensor::read_touchdata+0x26>
  26:	f240 0100 	movw	r1, #0
  2a:	f2c0 0100 	movt	r1, #0
  2e:	2213      	movs	r2, #19
  30:	982b      	ldr	r0, [sp, #172]	; 0xac
  32:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  36:	e7ff      	b.n	38 <app::touch_sensor::read_touchdata+0x38>
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
  50:	e7ff      	b.n	52 <app::touch_sensor::read_touchdata+0x52>
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
  8c:	f7ff fffe 	bl	0 <<I as core::iter::traits::collect::IntoIterator>::into_iter>
  90:	9027      	str	r0, [sp, #156]	; 0x9c
  92:	9126      	str	r1, [sp, #152]	; 0x98
  94:	e7ff      	b.n	96 <app::touch_sensor::read_touchdata+0x96>
  96:	9827      	ldr	r0, [sp, #156]	; 0x9c
  98:	905a      	str	r0, [sp, #360]	; 0x168
  9a:	9926      	ldr	r1, [sp, #152]	; 0x98
  9c:	915b      	str	r1, [sp, #364]	; 0x16c
  9e:	e7ff      	b.n	a0 <app::touch_sensor::read_touchdata+0xa0>
  a0:	a85a      	add	r0, sp, #360	; 0x168
  a2:	f7ff fffe 	bl	0 <core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next>
  a6:	915e      	str	r1, [sp, #376]	; 0x178
  a8:	905d      	str	r0, [sp, #372]	; 0x174
  aa:	e7ff      	b.n	ac <app::touch_sensor::read_touchdata+0xac>
  ac:	985d      	ldr	r0, [sp, #372]	; 0x174
  ae:	2800      	cmp	r0, #0
  b0:	d001      	beq.n	b6 <app::touch_sensor::read_touchdata+0xb6>
  b2:	e7ff      	b.n	b4 <app::touch_sensor::read_touchdata+0xb4>
  b4:	e001      	b.n	ba <app::touch_sensor::read_touchdata+0xba>
  b6:	e014      	b.n	e2 <app::touch_sensor::read_touchdata+0xe2>
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
  dc:	f040 81d6 	bne.w	48c <app::touch_sensor::read_touchdata+0x48c>
  e0:	e002      	b.n	e8 <app::touch_sensor::read_touchdata+0xe8>
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
  f2:	f0c0 81d7 	bcc.w	4a4 <app::touch_sensor::read_touchdata+0x4a4>
  f6:	e7ff      	b.n	f8 <app::touch_sensor::read_touchdata+0xf8>
  f8:	9824      	ldr	r0, [sp, #144]	; 0x90
  fa:	283e      	cmp	r0, #62	; 0x3e
  fc:	f200 81de 	bhi.w	4bc <app::touch_sensor::read_touchdata+0x4bc>
 100:	e7ff      	b.n	102 <app::touch_sensor::read_touchdata+0x102>
 102:	9862      	ldr	r0, [sp, #392]	; 0x188
 104:	9924      	ldr	r1, [sp, #144]	; 0x90
 106:	5c40      	ldrb	r0, [r0, r1]
 108:	0900      	lsrs	r0, r0, #4
 10a:	9023      	str	r0, [sp, #140]	; 0x8c
 10c:	e7ff      	b.n	10e <app::touch_sensor::read_touchdata+0x10e>
 10e:	9823      	ldr	r0, [sp, #140]	; 0x8c
 110:	f88d 0187 	strb.w	r0, [sp, #391]	; 0x187
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:122
        if pointid >= HYN_MAX_ID { break; }
 114:	f89d 1187 	ldrb.w	r1, [sp, #391]	; 0x187
 118:	290e      	cmp	r1, #14
 11a:	d80b      	bhi.n	134 <app::touch_sensor::read_touchdata+0x134>
 11c:	e7ff      	b.n	11e <app::touch_sensor::read_touchdata+0x11e>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:125
        data.count += 1;
 11e:	982d      	ldr	r0, [sp, #180]	; 0xb4
 120:	f890 0050 	ldrb.w	r0, [r0, #80]	; 0x50
 124:	3001      	adds	r0, #1
 126:	b2c1      	uxtb	r1, r0
 128:	4602      	mov	r2, r0
 12a:	4281      	cmp	r1, r0
 12c:	9222      	str	r2, [sp, #136]	; 0x88
 12e:	f040 81ce 	bne.w	4ce <app::touch_sensor::read_touchdata+0x4ce>
 132:	e001      	b.n	138 <app::touch_sensor::read_touchdata+0x138>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:122
        if pointid >= HYN_MAX_ID { break; }
 134:	e7ff      	b.n	136 <app::touch_sensor::read_touchdata+0x136>
 136:	e7d4      	b.n	e2 <app::touch_sensor::read_touchdata+0xe2>
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
 156:	f040 81c6 	bne.w	4e6 <app::touch_sensor::read_touchdata+0x4e6>
 15a:	e7ff      	b.n	15c <app::touch_sensor::read_touchdata+0x15c>
 15c:	9821      	ldr	r0, [sp, #132]	; 0x84
 15e:	1cc1      	adds	r1, r0, #3
 160:	460a      	mov	r2, r1
 162:	4281      	cmp	r1, r0
 164:	9220      	str	r2, [sp, #128]	; 0x80
 166:	f0c0 81ca 	bcc.w	4fe <app::touch_sensor::read_touchdata+0x4fe>
 16a:	e7ff      	b.n	16c <app::touch_sensor::read_touchdata+0x16c>
 16c:	9820      	ldr	r0, [sp, #128]	; 0x80
 16e:	283e      	cmp	r0, #62	; 0x3e
 170:	f200 81d1 	bhi.w	516 <app::touch_sensor::read_touchdata+0x516>
 174:	e7ff      	b.n	176 <app::touch_sensor::read_touchdata+0x176>
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
 19a:	f040 81c5 	bne.w	528 <app::touch_sensor::read_touchdata+0x528>
 19e:	e7ff      	b.n	1a0 <app::touch_sensor::read_touchdata+0x1a0>
 1a0:	981f      	ldr	r0, [sp, #124]	; 0x7c
 1a2:	1d01      	adds	r1, r0, #4
 1a4:	460a      	mov	r2, r1
 1a6:	4281      	cmp	r1, r0
 1a8:	921e      	str	r2, [sp, #120]	; 0x78
 1aa:	f0c0 81c9 	bcc.w	540 <app::touch_sensor::read_touchdata+0x540>
 1ae:	e7ff      	b.n	1b0 <app::touch_sensor::read_touchdata+0x1b0>
 1b0:	981e      	ldr	r0, [sp, #120]	; 0x78
 1b2:	283e      	cmp	r0, #62	; 0x3e
 1b4:	f200 81d0 	bhi.w	558 <app::touch_sensor::read_touchdata+0x558>
 1b8:	e7ff      	b.n	1ba <app::touch_sensor::read_touchdata+0x1ba>
 1ba:	9866      	ldr	r0, [sp, #408]	; 0x198
 1bc:	991e      	ldr	r1, [sp, #120]	; 0x78
 1be:	5c40      	ldrb	r0, [r0, r1]
 1c0:	f8ad 0196 	strh.w	r0, [sp, #406]	; 0x196
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:128
        data.touches[i].x  = (x_high << 8) | x_low;
 1c4:	f8bd 018e 	ldrh.w	r0, [sp, #398]	; 0x18e
 1c8:	0200      	lsls	r0, r0, #8
 1ca:	901d      	str	r0, [sp, #116]	; 0x74
 1cc:	e7ff      	b.n	1ce <app::touch_sensor::read_touchdata+0x1ce>
 1ce:	f8bd 0196 	ldrh.w	r0, [sp, #406]	; 0x196
 1d2:	9960      	ldr	r1, [sp, #384]	; 0x180
 1d4:	2909      	cmp	r1, #9
 1d6:	901c      	str	r0, [sp, #112]	; 0x70
 1d8:	911b      	str	r1, [sp, #108]	; 0x6c
 1da:	f200 81c6 	bhi.w	56a <app::touch_sensor::read_touchdata+0x56a>
 1de:	e7ff      	b.n	1e0 <app::touch_sensor::read_touchdata+0x1e0>
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
 208:	f040 81b8 	bne.w	57c <app::touch_sensor::read_touchdata+0x57c>
 20c:	e7ff      	b.n	20e <app::touch_sensor::read_touchdata+0x20e>
 20e:	981a      	ldr	r0, [sp, #104]	; 0x68
 210:	1d41      	adds	r1, r0, #5
 212:	460a      	mov	r2, r1
 214:	4281      	cmp	r1, r0
 216:	9219      	str	r2, [sp, #100]	; 0x64
 218:	f0c0 81bc 	bcc.w	594 <app::touch_sensor::read_touchdata+0x594>
 21c:	e7ff      	b.n	21e <app::touch_sensor::read_touchdata+0x21e>
 21e:	9819      	ldr	r0, [sp, #100]	; 0x64
 220:	283e      	cmp	r0, #62	; 0x3e
 222:	f200 81c3 	bhi.w	5ac <app::touch_sensor::read_touchdata+0x5ac>
 226:	e7ff      	b.n	228 <app::touch_sensor::read_touchdata+0x228>
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
 24c:	f040 81b7 	bne.w	5be <app::touch_sensor::read_touchdata+0x5be>
 250:	e7ff      	b.n	252 <app::touch_sensor::read_touchdata+0x252>
 252:	9818      	ldr	r0, [sp, #96]	; 0x60
 254:	1d81      	adds	r1, r0, #6
 256:	460a      	mov	r2, r1
 258:	4281      	cmp	r1, r0
 25a:	9217      	str	r2, [sp, #92]	; 0x5c
 25c:	f0c0 81bb 	bcc.w	5d6 <app::touch_sensor::read_touchdata+0x5d6>
 260:	e7ff      	b.n	262 <app::touch_sensor::read_touchdata+0x262>
 262:	9817      	ldr	r0, [sp, #92]	; 0x5c
 264:	283e      	cmp	r0, #62	; 0x3e
 266:	f200 81c2 	bhi.w	5ee <app::touch_sensor::read_touchdata+0x5ee>
 26a:	e7ff      	b.n	26c <app::touch_sensor::read_touchdata+0x26c>
 26c:	986a      	ldr	r0, [sp, #424]	; 0x1a8
 26e:	9917      	ldr	r1, [sp, #92]	; 0x5c
 270:	5c40      	ldrb	r0, [r0, r1]
 272:	f8ad 01a6 	strh.w	r0, [sp, #422]	; 0x1a6
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:132
        data.touches[i].y  = (y_high << 8) | y_low;
 276:	f8bd 019e 	ldrh.w	r0, [sp, #414]	; 0x19e
 27a:	0200      	lsls	r0, r0, #8
 27c:	9016      	str	r0, [sp, #88]	; 0x58
 27e:	e7ff      	b.n	280 <app::touch_sensor::read_touchdata+0x280>
 280:	f8bd 01a6 	ldrh.w	r0, [sp, #422]	; 0x1a6
 284:	9960      	ldr	r1, [sp, #384]	; 0x180
 286:	2909      	cmp	r1, #9
 288:	9015      	str	r0, [sp, #84]	; 0x54
 28a:	9114      	str	r1, [sp, #80]	; 0x50
 28c:	f200 81b8 	bhi.w	600 <app::touch_sensor::read_touchdata+0x600>
 290:	e7ff      	b.n	292 <app::touch_sensor::read_touchdata+0x292>
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
 2c0:	f040 81a7 	bne.w	612 <app::touch_sensor::read_touchdata+0x612>
 2c4:	e7ff      	b.n	2c6 <app::touch_sensor::read_touchdata+0x2c6>
 2c6:	9813      	ldr	r0, [sp, #76]	; 0x4c
 2c8:	1cc1      	adds	r1, r0, #3
 2ca:	460a      	mov	r2, r1
 2cc:	4281      	cmp	r1, r0
 2ce:	9212      	str	r2, [sp, #72]	; 0x48
 2d0:	f0c0 81ab 	bcc.w	62a <app::touch_sensor::read_touchdata+0x62a>
 2d4:	e7ff      	b.n	2d6 <app::touch_sensor::read_touchdata+0x2d6>
 2d6:	9812      	ldr	r0, [sp, #72]	; 0x48
 2d8:	283e      	cmp	r0, #62	; 0x3e
 2da:	f200 81b2 	bhi.w	642 <app::touch_sensor::read_touchdata+0x642>
 2de:	e7ff      	b.n	2e0 <app::touch_sensor::read_touchdata+0x2e0>
 2e0:	986b      	ldr	r0, [sp, #428]	; 0x1ac
 2e2:	9912      	ldr	r1, [sp, #72]	; 0x48
 2e4:	5c40      	ldrb	r0, [r0, r1]
 2e6:	0980      	lsrs	r0, r0, #6
 2e8:	9011      	str	r0, [sp, #68]	; 0x44
 2ea:	e7ff      	b.n	2ec <app::touch_sensor::read_touchdata+0x2ec>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:135
        data.touches[i].action =
 2ec:	9860      	ldr	r0, [sp, #384]	; 0x180
 2ee:	2809      	cmp	r0, #9
 2f0:	9010      	str	r0, [sp, #64]	; 0x40
 2f2:	f200 81af 	bhi.w	654 <app::touch_sensor::read_touchdata+0x654>
 2f6:	e7ff      	b.n	2f8 <app::touch_sensor::read_touchdata+0x2f8>
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
 31a:	f040 81a4 	bne.w	666 <app::touch_sensor::read_touchdata+0x666>
 31e:	e7ff      	b.n	320 <app::touch_sensor::read_touchdata+0x320>
 320:	980f      	ldr	r0, [sp, #60]	; 0x3c
 322:	1d41      	adds	r1, r0, #5
 324:	460a      	mov	r2, r1
 326:	4281      	cmp	r1, r0
 328:	920e      	str	r2, [sp, #56]	; 0x38
 32a:	f0c0 81a8 	bcc.w	67e <app::touch_sensor::read_touchdata+0x67e>
 32e:	e7ff      	b.n	330 <app::touch_sensor::read_touchdata+0x330>
 330:	980e      	ldr	r0, [sp, #56]	; 0x38
 332:	283e      	cmp	r0, #62	; 0x3e
 334:	f200 81af 	bhi.w	696 <app::touch_sensor::read_touchdata+0x696>
 338:	e7ff      	b.n	33a <app::touch_sensor::read_touchdata+0x33a>
 33a:	986c      	ldr	r0, [sp, #432]	; 0x1b0
 33c:	990e      	ldr	r1, [sp, #56]	; 0x38
 33e:	5c40      	ldrb	r0, [r0, r1]
 340:	0900      	lsrs	r0, r0, #4
 342:	900d      	str	r0, [sp, #52]	; 0x34
 344:	e7ff      	b.n	346 <app::touch_sensor::read_touchdata+0x346>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:137
        data.touches[i].finger =
 346:	9860      	ldr	r0, [sp, #384]	; 0x180
 348:	2809      	cmp	r0, #9
 34a:	900c      	str	r0, [sp, #48]	; 0x30
 34c:	f200 81ac 	bhi.w	6a8 <app::touch_sensor::read_touchdata+0x6a8>
 350:	e7ff      	b.n	352 <app::touch_sensor::read_touchdata+0x352>
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
 374:	f040 81a1 	bne.w	6ba <app::touch_sensor::read_touchdata+0x6ba>
 378:	e7ff      	b.n	37a <app::touch_sensor::read_touchdata+0x37a>
 37a:	980b      	ldr	r0, [sp, #44]	; 0x2c
 37c:	1dc1      	adds	r1, r0, #7
 37e:	460a      	mov	r2, r1
 380:	4281      	cmp	r1, r0
 382:	920a      	str	r2, [sp, #40]	; 0x28
 384:	f0c0 81a5 	bcc.w	6d2 <app::touch_sensor::read_touchdata+0x6d2>
 388:	e7ff      	b.n	38a <app::touch_sensor::read_touchdata+0x38a>
 38a:	980a      	ldr	r0, [sp, #40]	; 0x28
 38c:	283e      	cmp	r0, #62	; 0x3e
 38e:	f200 81ac 	bhi.w	6ea <app::touch_sensor::read_touchdata+0x6ea>
 392:	e7ff      	b.n	394 <app::touch_sensor::read_touchdata+0x394>
 394:	986d      	ldr	r0, [sp, #436]	; 0x1b4
 396:	990a      	ldr	r1, [sp, #40]	; 0x28
 398:	5c40      	ldrb	r0, [r0, r1]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:141
        data.touches[i].pressure =
 39a:	9a60      	ldr	r2, [sp, #384]	; 0x180
 39c:	2a09      	cmp	r2, #9
 39e:	9009      	str	r0, [sp, #36]	; 0x24
 3a0:	9208      	str	r2, [sp, #32]
 3a2:	f200 81ab 	bhi.w	6fc <app::touch_sensor::read_touchdata+0x6fc>
 3a6:	e7ff      	b.n	3a8 <app::touch_sensor::read_touchdata+0x3a8>
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
 3ca:	f040 81a0 	bne.w	70e <app::touch_sensor::read_touchdata+0x70e>
 3ce:	e7ff      	b.n	3d0 <app::touch_sensor::read_touchdata+0x3d0>
 3d0:	9807      	ldr	r0, [sp, #28]
 3d2:	f100 0108 	add.w	r1, r0, #8
 3d6:	460a      	mov	r2, r1
 3d8:	4281      	cmp	r1, r0
 3da:	9206      	str	r2, [sp, #24]
 3dc:	f0c0 81a3 	bcc.w	726 <app::touch_sensor::read_touchdata+0x726>
 3e0:	e7ff      	b.n	3e2 <app::touch_sensor::read_touchdata+0x3e2>
 3e2:	9806      	ldr	r0, [sp, #24]
 3e4:	283e      	cmp	r0, #62	; 0x3e
 3e6:	f200 81aa 	bhi.w	73e <app::touch_sensor::read_touchdata+0x73e>
 3ea:	e7ff      	b.n	3ec <app::touch_sensor::read_touchdata+0x3ec>
 3ec:	986e      	ldr	r0, [sp, #440]	; 0x1b8
 3ee:	9906      	ldr	r1, [sp, #24]
 3f0:	5c40      	ldrb	r0, [r0, r1]
 3f2:	0900      	lsrs	r0, r0, #4
 3f4:	9005      	str	r0, [sp, #20]
 3f6:	e7ff      	b.n	3f8 <app::touch_sensor::read_touchdata+0x3f8>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:143
        data.touches[i].area =
 3f8:	9860      	ldr	r0, [sp, #384]	; 0x180
 3fa:	2809      	cmp	r0, #9
 3fc:	9004      	str	r0, [sp, #16]
 3fe:	f200 81a7 	bhi.w	750 <app::touch_sensor::read_touchdata+0x750>
 402:	e7ff      	b.n	404 <app::touch_sensor::read_touchdata+0x404>
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
 416:	d327      	bcc.n	468 <app::touch_sensor::read_touchdata+0x468>
 418:	e1a3      	b.n	762 <app::touch_sensor::read_touchdata+0x762>
 41a:	2001      	movs	r0, #1
 41c:	f88d 01be 	strb.w	r0, [sp, #446]	; 0x1be
 420:	e009      	b.n	436 <app::touch_sensor::read_touchdata+0x436>
 422:	2000      	movs	r0, #0
 424:	f88d 01be 	strb.w	r0, [sp, #446]	; 0x1be
 428:	e005      	b.n	436 <app::touch_sensor::read_touchdata+0x436>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:148
            && (data.point_num == 0) {
 42a:	982d      	ldr	r0, [sp, #180]	; 0xb4
 42c:	f890 0051 	ldrb.w	r0, [r0, #81]	; 0x51
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:147
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 430:	2800      	cmp	r0, #0
 432:	d0f2      	beq.n	41a <app::touch_sensor::read_touchdata+0x41a>
 434:	e7f5      	b.n	422 <app::touch_sensor::read_touchdata+0x422>
 436:	f89d 01be 	ldrb.w	r0, [sp, #446]	; 0x1be
 43a:	07c0      	lsls	r0, r0, #31
 43c:	2800      	cmp	r0, #0
 43e:	d124      	bne.n	48a <app::touch_sensor::read_touchdata+0x48a>
 440:	e022      	b.n	488 <app::touch_sensor::read_touchdata+0x488>
 442:	2001      	movs	r0, #1
 444:	f88d 01bf 	strb.w	r0, [sp, #447]	; 0x1bf
 448:	e008      	b.n	45c <app::touch_sensor::read_touchdata+0x45c>
 44a:	2000      	movs	r0, #0
 44c:	f88d 01bf 	strb.w	r0, [sp, #447]	; 0x1bf
 450:	e004      	b.n	45c <app::touch_sensor::read_touchdata+0x45c>
 452:	9860      	ldr	r0, [sp, #384]	; 0x180
 454:	280a      	cmp	r0, #10
 456:	9002      	str	r0, [sp, #8]
 458:	d30e      	bcc.n	478 <app::touch_sensor::read_touchdata+0x478>
 45a:	e18b      	b.n	774 <app::touch_sensor::read_touchdata+0x774>
 45c:	f89d 01bf 	ldrb.w	r0, [sp, #447]	; 0x1bf
 460:	07c0      	lsls	r0, r0, #31
 462:	2800      	cmp	r0, #0
 464:	d1e1      	bne.n	42a <app::touch_sensor::read_touchdata+0x42a>
 466:	e7dc      	b.n	422 <app::touch_sensor::read_touchdata+0x422>
 468:	982d      	ldr	r0, [sp, #180]	; 0xb4
 46a:	9903      	ldr	r1, [sp, #12]
 46c:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 470:	7900      	ldrb	r0, [r0, #4]
 472:	2800      	cmp	r0, #0
 474:	d0e5      	beq.n	442 <app::touch_sensor::read_touchdata+0x442>
 476:	e7ec      	b.n	452 <app::touch_sensor::read_touchdata+0x452>
 478:	982d      	ldr	r0, [sp, #180]	; 0xb4
 47a:	9902      	ldr	r1, [sp, #8]
 47c:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 480:	7900      	ldrb	r0, [r0, #4]
 482:	2802      	cmp	r0, #2
 484:	d0dd      	beq.n	442 <app::touch_sensor::read_touchdata+0x442>
 486:	e7e0      	b.n	44a <app::touch_sensor::read_touchdata+0x44a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:120
    for i in 0..CFG_MAX_TOUCH_POINTS {
 488:	e60a      	b.n	a0 <app::touch_sensor::read_touchdata+0xa0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:149
            break;
 48a:	e654      	b.n	136 <app::touch_sensor::read_touchdata+0x136>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:121
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
 48c:	f240 0000 	movw	r0, #0
 490:	f2c0 0000 	movt	r0, #0
 494:	f240 0200 	movw	r2, #0
 498:	f2c0 0200 	movt	r2, #0
 49c:	2121      	movs	r1, #33	; 0x21
 49e:	f7ff fffe 	bl	0 <core::panicking::panic>
 4a2:	defe      	udf	#254	; 0xfe
 4a4:	f240 0000 	movw	r0, #0
 4a8:	f2c0 0000 	movt	r0, #0
 4ac:	f240 0200 	movw	r2, #0
 4b0:	f2c0 0200 	movt	r2, #0
 4b4:	211c      	movs	r1, #28
 4b6:	f7ff fffe 	bl	0 <core::panicking::panic>
 4ba:	defe      	udf	#254	; 0xfe
 4bc:	f240 0000 	movw	r0, #0
 4c0:	f2c0 0000 	movt	r0, #0
 4c4:	223f      	movs	r2, #63	; 0x3f
 4c6:	9924      	ldr	r1, [sp, #144]	; 0x90
 4c8:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 4cc:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:125
        data.count += 1;
 4ce:	f240 0000 	movw	r0, #0
 4d2:	f2c0 0000 	movt	r0, #0
 4d6:	f240 0200 	movw	r2, #0
 4da:	f2c0 0200 	movt	r2, #0
 4de:	211c      	movs	r1, #28
 4e0:	f7ff fffe 	bl	0 <core::panicking::panic>
 4e4:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:126
        let x_high = unsafe { buf[HYN_TOUCH_X_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 4e6:	f240 0000 	movw	r0, #0
 4ea:	f2c0 0000 	movt	r0, #0
 4ee:	f240 0200 	movw	r2, #0
 4f2:	f2c0 0200 	movt	r2, #0
 4f6:	2121      	movs	r1, #33	; 0x21
 4f8:	f7ff fffe 	bl	0 <core::panicking::panic>
 4fc:	defe      	udf	#254	; 0xfe
 4fe:	f240 0000 	movw	r0, #0
 502:	f2c0 0000 	movt	r0, #0
 506:	f240 0200 	movw	r2, #0
 50a:	f2c0 0200 	movt	r2, #0
 50e:	211c      	movs	r1, #28
 510:	f7ff fffe 	bl	0 <core::panicking::panic>
 514:	defe      	udf	#254	; 0xfe
 516:	f240 0000 	movw	r0, #0
 51a:	f2c0 0000 	movt	r0, #0
 51e:	223f      	movs	r2, #63	; 0x3f
 520:	9920      	ldr	r1, [sp, #128]	; 0x80
 522:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 526:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:127
        let x_low  = unsafe { buf[HYN_TOUCH_X_L_POS + HYN_TOUCH_STEP * i] } as u16;
 528:	f240 0000 	movw	r0, #0
 52c:	f2c0 0000 	movt	r0, #0
 530:	f240 0200 	movw	r2, #0
 534:	f2c0 0200 	movt	r2, #0
 538:	2121      	movs	r1, #33	; 0x21
 53a:	f7ff fffe 	bl	0 <core::panicking::panic>
 53e:	defe      	udf	#254	; 0xfe
 540:	f240 0000 	movw	r0, #0
 544:	f2c0 0000 	movt	r0, #0
 548:	f240 0200 	movw	r2, #0
 54c:	f2c0 0200 	movt	r2, #0
 550:	211c      	movs	r1, #28
 552:	f7ff fffe 	bl	0 <core::panicking::panic>
 556:	defe      	udf	#254	; 0xfe
 558:	f240 0000 	movw	r0, #0
 55c:	f2c0 0000 	movt	r0, #0
 560:	223f      	movs	r2, #63	; 0x3f
 562:	991e      	ldr	r1, [sp, #120]	; 0x78
 564:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 568:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:128
        data.touches[i].x  = (x_high << 8) | x_low;
 56a:	f240 0000 	movw	r0, #0
 56e:	f2c0 0000 	movt	r0, #0
 572:	220a      	movs	r2, #10
 574:	991b      	ldr	r1, [sp, #108]	; 0x6c
 576:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 57a:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:130
        let y_high = unsafe { buf[HYN_TOUCH_Y_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 57c:	f240 0000 	movw	r0, #0
 580:	f2c0 0000 	movt	r0, #0
 584:	f240 0200 	movw	r2, #0
 588:	f2c0 0200 	movt	r2, #0
 58c:	2121      	movs	r1, #33	; 0x21
 58e:	f7ff fffe 	bl	0 <core::panicking::panic>
 592:	defe      	udf	#254	; 0xfe
 594:	f240 0000 	movw	r0, #0
 598:	f2c0 0000 	movt	r0, #0
 59c:	f240 0200 	movw	r2, #0
 5a0:	f2c0 0200 	movt	r2, #0
 5a4:	211c      	movs	r1, #28
 5a6:	f7ff fffe 	bl	0 <core::panicking::panic>
 5aa:	defe      	udf	#254	; 0xfe
 5ac:	f240 0000 	movw	r0, #0
 5b0:	f2c0 0000 	movt	r0, #0
 5b4:	223f      	movs	r2, #63	; 0x3f
 5b6:	9919      	ldr	r1, [sp, #100]	; 0x64
 5b8:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 5bc:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:131
        let y_low  = unsafe { buf[HYN_TOUCH_Y_L_POS + HYN_TOUCH_STEP * i] } as u16;
 5be:	f240 0000 	movw	r0, #0
 5c2:	f2c0 0000 	movt	r0, #0
 5c6:	f240 0200 	movw	r2, #0
 5ca:	f2c0 0200 	movt	r2, #0
 5ce:	2121      	movs	r1, #33	; 0x21
 5d0:	f7ff fffe 	bl	0 <core::panicking::panic>
 5d4:	defe      	udf	#254	; 0xfe
 5d6:	f240 0000 	movw	r0, #0
 5da:	f2c0 0000 	movt	r0, #0
 5de:	f240 0200 	movw	r2, #0
 5e2:	f2c0 0200 	movt	r2, #0
 5e6:	211c      	movs	r1, #28
 5e8:	f7ff fffe 	bl	0 <core::panicking::panic>
 5ec:	defe      	udf	#254	; 0xfe
 5ee:	f240 0000 	movw	r0, #0
 5f2:	f2c0 0000 	movt	r0, #0
 5f6:	223f      	movs	r2, #63	; 0x3f
 5f8:	9917      	ldr	r1, [sp, #92]	; 0x5c
 5fa:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 5fe:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:132
        data.touches[i].y  = (y_high << 8) | y_low;
 600:	f240 0000 	movw	r0, #0
 604:	f2c0 0000 	movt	r0, #0
 608:	220a      	movs	r2, #10
 60a:	9914      	ldr	r1, [sp, #80]	; 0x50
 60c:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 610:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:136
            unsafe { buf[HYN_TOUCH_EVENT_POS + HYN_TOUCH_STEP * i] } >> 6;
 612:	f240 0000 	movw	r0, #0
 616:	f2c0 0000 	movt	r0, #0
 61a:	f240 0200 	movw	r2, #0
 61e:	f2c0 0200 	movt	r2, #0
 622:	2121      	movs	r1, #33	; 0x21
 624:	f7ff fffe 	bl	0 <core::panicking::panic>
 628:	defe      	udf	#254	; 0xfe
 62a:	f240 0000 	movw	r0, #0
 62e:	f2c0 0000 	movt	r0, #0
 632:	f240 0200 	movw	r2, #0
 636:	f2c0 0200 	movt	r2, #0
 63a:	211c      	movs	r1, #28
 63c:	f7ff fffe 	bl	0 <core::panicking::panic>
 640:	defe      	udf	#254	; 0xfe
 642:	f240 0000 	movw	r0, #0
 646:	f2c0 0000 	movt	r0, #0
 64a:	223f      	movs	r2, #63	; 0x3f
 64c:	9912      	ldr	r1, [sp, #72]	; 0x48
 64e:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 652:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:135
        data.touches[i].action =
 654:	f240 0000 	movw	r0, #0
 658:	f2c0 0000 	movt	r0, #0
 65c:	220a      	movs	r2, #10
 65e:	9910      	ldr	r1, [sp, #64]	; 0x40
 660:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 664:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:138
            unsafe { buf[HYN_TOUCH_ID_POS    + HYN_TOUCH_STEP * i] } >> 4;
 666:	f240 0000 	movw	r0, #0
 66a:	f2c0 0000 	movt	r0, #0
 66e:	f240 0200 	movw	r2, #0
 672:	f2c0 0200 	movt	r2, #0
 676:	2121      	movs	r1, #33	; 0x21
 678:	f7ff fffe 	bl	0 <core::panicking::panic>
 67c:	defe      	udf	#254	; 0xfe
 67e:	f240 0000 	movw	r0, #0
 682:	f2c0 0000 	movt	r0, #0
 686:	f240 0200 	movw	r2, #0
 68a:	f2c0 0200 	movt	r2, #0
 68e:	211c      	movs	r1, #28
 690:	f7ff fffe 	bl	0 <core::panicking::panic>
 694:	defe      	udf	#254	; 0xfe
 696:	f240 0000 	movw	r0, #0
 69a:	f2c0 0000 	movt	r0, #0
 69e:	223f      	movs	r2, #63	; 0x3f
 6a0:	990e      	ldr	r1, [sp, #56]	; 0x38
 6a2:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 6a6:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:137
        data.touches[i].finger =
 6a8:	f240 0000 	movw	r0, #0
 6ac:	f2c0 0000 	movt	r0, #0
 6b0:	220a      	movs	r2, #10
 6b2:	990c      	ldr	r1, [sp, #48]	; 0x30
 6b4:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 6b8:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:142
            unsafe { buf[HYN_TOUCH_XY_POS + HYN_TOUCH_STEP * i] };  //  Can't be constant value
 6ba:	f240 0000 	movw	r0, #0
 6be:	f2c0 0000 	movt	r0, #0
 6c2:	f240 0200 	movw	r2, #0
 6c6:	f2c0 0200 	movt	r2, #0
 6ca:	2121      	movs	r1, #33	; 0x21
 6cc:	f7ff fffe 	bl	0 <core::panicking::panic>
 6d0:	defe      	udf	#254	; 0xfe
 6d2:	f240 0000 	movw	r0, #0
 6d6:	f2c0 0000 	movt	r0, #0
 6da:	f240 0200 	movw	r2, #0
 6de:	f2c0 0200 	movt	r2, #0
 6e2:	211c      	movs	r1, #28
 6e4:	f7ff fffe 	bl	0 <core::panicking::panic>
 6e8:	defe      	udf	#254	; 0xfe
 6ea:	f240 0000 	movw	r0, #0
 6ee:	f2c0 0000 	movt	r0, #0
 6f2:	223f      	movs	r2, #63	; 0x3f
 6f4:	990a      	ldr	r1, [sp, #40]	; 0x28
 6f6:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 6fa:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:141
        data.touches[i].pressure =
 6fc:	f240 0000 	movw	r0, #0
 700:	f2c0 0000 	movt	r0, #0
 704:	220a      	movs	r2, #10
 706:	9908      	ldr	r1, [sp, #32]
 708:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 70c:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:144
            unsafe { buf[HYN_TOUCH_MISC   + HYN_TOUCH_STEP * i] } >> 4;
 70e:	f240 0000 	movw	r0, #0
 712:	f2c0 0000 	movt	r0, #0
 716:	f240 0200 	movw	r2, #0
 71a:	f2c0 0200 	movt	r2, #0
 71e:	2121      	movs	r1, #33	; 0x21
 720:	f7ff fffe 	bl	0 <core::panicking::panic>
 724:	defe      	udf	#254	; 0xfe
 726:	f240 0000 	movw	r0, #0
 72a:	f2c0 0000 	movt	r0, #0
 72e:	f240 0200 	movw	r2, #0
 732:	f2c0 0200 	movt	r2, #0
 736:	211c      	movs	r1, #28
 738:	f7ff fffe 	bl	0 <core::panicking::panic>
 73c:	defe      	udf	#254	; 0xfe
 73e:	f240 0000 	movw	r0, #0
 742:	f2c0 0000 	movt	r0, #0
 746:	223f      	movs	r2, #63	; 0x3f
 748:	9906      	ldr	r1, [sp, #24]
 74a:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 74e:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:143
        data.touches[i].area =
 750:	f240 0000 	movw	r0, #0
 754:	f2c0 0000 	movt	r0, #0
 758:	220a      	movs	r2, #10
 75a:	9904      	ldr	r1, [sp, #16]
 75c:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 760:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:147
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 762:	f240 0000 	movw	r0, #0
 766:	f2c0 0000 	movt	r0, #0
 76a:	220a      	movs	r2, #10
 76c:	9903      	ldr	r1, [sp, #12]
 76e:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 772:	defe      	udf	#254	; 0xfe
 774:	f240 0000 	movw	r0, #0
 778:	f2c0 0000 	movt	r0, #0
 77c:	220a      	movs	r2, #10
 77e:	9902      	ldr	r1, [sp, #8]
 780:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 784:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN3app12touch_sensor19read_register_range17hdff2f1fbe7e551c9E:

00000000 <app::touch_sensor::read_register_range>:
_ZN3app12touch_sensor19read_register_range17hdff2f1fbe7e551c9E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:212

/// Event that will be forwarded to the Event Queue when a touch interrupt is triggered
static mut TOUCH_EVENT: os_event = fill_zero!(os_event);  //  Init all fields to 0 or NULL

/// Read a range of I2C registers from the I2C address `addr` (7-bit address), starting at `start_register` for count `num_registers`. Save into `buffer`.
fn read_register_range(addr: u8, start_register: u8, num_registers: u8, buffer: &mut[u8]) -> MynewtResult<()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b09e      	sub	sp, #120	; 0x78
   4:	f8dd c088 	ldr.w	ip, [sp, #136]	; 0x88
   8:	4696      	mov	lr, r2
   a:	460c      	mov	r4, r1
   c:	4605      	mov	r5, r0
   e:	f88d 0039 	strb.w	r0, [sp, #57]	; 0x39
  12:	f88d 103a 	strb.w	r1, [sp, #58]	; 0x3a
  16:	f88d 203b 	strb.w	r2, [sp, #59]	; 0x3b
  1a:	930f      	str	r3, [sp, #60]	; 0x3c
  1c:	f8cd c040 	str.w	ip, [sp, #64]	; 0x40
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:213
    assert!(buffer.len() >= num_registers as usize, "i2c buf");  //  Buffer too small
  20:	980f      	ldr	r0, [sp, #60]	; 0x3c
  22:	9910      	ldr	r1, [sp, #64]	; 0x40
  24:	f8cd e034 	str.w	lr, [sp, #52]	; 0x34
  28:	940c      	str	r4, [sp, #48]	; 0x30
  2a:	950b      	str	r5, [sp, #44]	; 0x2c
  2c:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
  30:	900a      	str	r0, [sp, #40]	; 0x28
  32:	e7ff      	b.n	34 <app::touch_sensor::read_register_range+0x34>
  34:	f89d 003b 	ldrb.w	r0, [sp, #59]	; 0x3b
  38:	990a      	ldr	r1, [sp, #40]	; 0x28
  3a:	4281      	cmp	r1, r0
  3c:	d30c      	bcc.n	58 <app::touch_sensor::read_register_range+0x58>
  3e:	e7ff      	b.n	40 <app::touch_sensor::read_register_range+0x40>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
  40:	f89d 003a 	ldrb.w	r0, [sp, #58]	; 0x3a
  44:	f89d 103b 	ldrb.w	r1, [sp, #59]	; 0x3b
  48:	4408      	add	r0, r1
  4a:	b2c1      	uxtb	r1, r0
  4c:	4602      	mov	r2, r0
  4e:	4281      	cmp	r1, r0
  50:	9209      	str	r2, [sp, #36]	; 0x24
  52:	f040 80b0 	bne.w	1b6 <app::touch_sensor::read_register_range+0x1b6>
  56:	e010      	b.n	24 <app::touch_sensor::read_register_range+0x24>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:213
    assert!(buffer.len() >= num_registers as usize, "i2c buf");  //  Buffer too small
  58:	f240 0000 	movw	r0, #0
  5c:	f2c0 0000 	movt	r0, #0
  60:	901c      	str	r0, [sp, #112]	; 0x70
  62:	9a1c      	ldr	r2, [sp, #112]	; 0x70
  64:	9208      	str	r2, [sp, #32]
  66:	e7ff      	b.n	68 <app::touch_sensor::read_register_range+0x68>
  68:	f240 0000 	movw	r0, #0
  6c:	f2c0 0000 	movt	r0, #0
  70:	2107      	movs	r1, #7
  72:	9a08      	ldr	r2, [sp, #32]
  74:	f7ff fffe 	bl	0 <core::panicking::panic>
  78:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
  7a:	9809      	ldr	r0, [sp, #36]	; 0x24
  7c:	b241      	sxtb	r1, r0
  7e:	2900      	cmp	r1, #0
  80:	d41a      	bmi.n	b8 <app::touch_sensor::read_register_range+0xb8>
  82:	e7ff      	b.n	84 <app::touch_sensor::read_register_range+0x84>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:223
    //    Send the Start Condition (High to Low SDA Transition)...
    //    Followed by I2C Address (7 bits)...
    //    Followed by Write Mode (1 bit, value 0)...
    //    Followed by starting Register Number (8 bits)
    unsafe { 
        I2C_BUFFER[0] = start_register;  //  I2C Packet buffer contains starting Register Number (1 byte)
  84:	f89d 003a 	ldrb.w	r0, [sp, #58]	; 0x3a
  88:	f240 0100 	movw	r1, #0
  8c:	f2c0 0100 	movt	r1, #0
  90:	9112      	str	r1, [sp, #72]	; 0x48
  92:	9a12      	ldr	r2, [sp, #72]	; 0x48
  94:	7010      	strb	r0, [r2, #0]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:224
        I2C_DATA.address = addr;         //  I2C Packet address (7 bits)
  96:	f89d 0039 	ldrb.w	r0, [sp, #57]	; 0x39
  9a:	f240 0200 	movw	r2, #0
  9e:	f2c0 0200 	movt	r2, #0
  a2:	9213      	str	r2, [sp, #76]	; 0x4c
  a4:	9a13      	ldr	r2, [sp, #76]	; 0x4c
  a6:	7010      	strb	r0, [r2, #0]
  a8:	2001      	movs	r0, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:225
        I2C_DATA.len = I2C_BUFFER.len() as u16;     //  I2C Packet data size is 1 byte
  aa:	9007      	str	r0, [sp, #28]
  ac:	4608      	mov	r0, r1
  ae:	9907      	ldr	r1, [sp, #28]
  b0:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::len>
  b4:	9006      	str	r0, [sp, #24]
  b6:	e010      	b.n	da <app::touch_sensor::read_register_range+0xda>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
  b8:	f240 0000 	movw	r0, #0
  bc:	f2c0 0000 	movt	r0, #0
  c0:	901d      	str	r0, [sp, #116]	; 0x74
  c2:	9a1d      	ldr	r2, [sp, #116]	; 0x74
  c4:	9205      	str	r2, [sp, #20]
  c6:	e7ff      	b.n	c8 <app::touch_sensor::read_register_range+0xc8>
  c8:	f240 0000 	movw	r0, #0
  cc:	f2c0 0000 	movt	r0, #0
  d0:	2108      	movs	r1, #8
  d2:	9a05      	ldr	r2, [sp, #20]
  d4:	f7ff fffe 	bl	0 <core::panicking::panic>
  d8:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:225
        I2C_DATA.len = I2C_BUFFER.len() as u16;     //  I2C Packet data size is 1 byte
  da:	f240 0000 	movw	r0, #0
  de:	f2c0 0000 	movt	r0, #0
  e2:	9014      	str	r0, [sp, #80]	; 0x50
  e4:	9814      	ldr	r0, [sp, #80]	; 0x50
  e6:	9906      	ldr	r1, [sp, #24]
  e8:	8041      	strh	r1, [r0, #2]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:226
        I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();  //  I2C Packet data points to packet buffer
  ea:	f240 0000 	movw	r0, #0
  ee:	f2c0 0000 	movt	r0, #0
  f2:	2101      	movs	r1, #1
  f4:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_mut_ptr>
  f8:	9004      	str	r0, [sp, #16]
  fa:	e7ff      	b.n	fc <app::touch_sensor::read_register_range+0xfc>
  fc:	f240 0000 	movw	r0, #0
 100:	f2c0 0000 	movt	r0, #0
 104:	9015      	str	r0, [sp, #84]	; 0x54
 106:	9915      	ldr	r1, [sp, #84]	; 0x54
 108:	9a04      	ldr	r2, [sp, #16]
 10a:	604a      	str	r2, [r1, #4]
 10c:	2101      	movs	r1, #1
 10e:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 112:	2300      	movs	r3, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:228
    };
    let _rc1 = unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };  //  No stop yet, must continue even if we hit an error
 114:	9003      	str	r0, [sp, #12]
 116:	4608      	mov	r0, r1
 118:	9903      	ldr	r1, [sp, #12]
 11a:	f7ff fffe 	bl	0 <hal_i2c_master_write>
 11e:	9016      	str	r0, [sp, #88]	; 0x58
 120:	e7ff      	b.n	122 <app::touch_sensor::read_register_range+0x122>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:234
    //  Step 3: Prepare to receive the stream of I2C Device Register values...
    //    Send the Start Condition (High to Low SDA Transition)...
    //    Followed by I2C Address (7 bits)...
    //    Followed by Read Mode (1 bit, value 1)
    unsafe { 
        I2C_BUFFER[0] = 0x00;     //  I2C Packet buffer should be empty (provided by caller)
 122:	f240 0000 	movw	r0, #0
 126:	f2c0 0000 	movt	r0, #0
 12a:	9017      	str	r0, [sp, #92]	; 0x5c
 12c:	9817      	ldr	r0, [sp, #92]	; 0x5c
 12e:	2100      	movs	r1, #0
 130:	7001      	strb	r1, [r0, #0]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:235
        I2C_DATA.address = addr;  //  I2C Packet address (7 bits)
 132:	f89d 0039 	ldrb.w	r0, [sp, #57]	; 0x39
 136:	f240 0100 	movw	r1, #0
 13a:	f2c0 0100 	movt	r1, #0
 13e:	9118      	str	r1, [sp, #96]	; 0x60
 140:	9a18      	ldr	r2, [sp, #96]	; 0x60
 142:	7010      	strb	r0, [r2, #0]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:236
        I2C_DATA.len = num_registers as u16;    //  I2C Packet data size is number of Registers to read
 144:	f89d 003b 	ldrb.w	r0, [sp, #59]	; 0x3b
 148:	9119      	str	r1, [sp, #100]	; 0x64
 14a:	9919      	ldr	r1, [sp, #100]	; 0x64
 14c:	8048      	strh	r0, [r1, #2]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:237
        I2C_DATA.buffer = buffer.as_mut_ptr();  //  I2C Packet data points to packet buffer
 14e:	980f      	ldr	r0, [sp, #60]	; 0x3c
 150:	9910      	ldr	r1, [sp, #64]	; 0x40
 152:	f7ff fffe 	bl	0 <core::slice::<impl [T]>::as_mut_ptr>
 156:	9002      	str	r0, [sp, #8]
 158:	e7ff      	b.n	15a <app::touch_sensor::read_register_range+0x15a>
 15a:	f240 0000 	movw	r0, #0
 15e:	f2c0 0000 	movt	r0, #0
 162:	901a      	str	r0, [sp, #104]	; 0x68
 164:	991a      	ldr	r1, [sp, #104]	; 0x68
 166:	9a02      	ldr	r2, [sp, #8]
 168:	604a      	str	r2, [r1, #4]
 16a:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 16e:	2101      	movs	r1, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:241
    };
    //  Step 4: Receive the requested number of Register values from I2C Device (1 byte per register)
    //  Step 5: Send the Stop Condition (Low to High SDA Transition)
    let rc2 = unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };
 170:	9001      	str	r0, [sp, #4]
 172:	4608      	mov	r0, r1
 174:	9b01      	ldr	r3, [sp, #4]
 176:	9100      	str	r1, [sp, #0]
 178:	4619      	mov	r1, r3
 17a:	9b00      	ldr	r3, [sp, #0]
 17c:	f7ff fffe 	bl	0 <hal_i2c_master_read>
 180:	901b      	str	r0, [sp, #108]	; 0x6c
 182:	e7ff      	b.n	184 <app::touch_sensor::read_register_range+0x184>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:242
    if rc2 == hal::HAL_I2C_ERR_ADDR_NACK as i32 {
 184:	981b      	ldr	r0, [sp, #108]	; 0x6c
 186:	2804      	cmp	r0, #4
 188:	d005      	beq.n	196 <app::touch_sensor::read_register_range+0x196>
 18a:	e7ff      	b.n	18c <app::touch_sensor::read_register_range+0x18c>
 18c:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:247
        ////assert!(false, "i2c fail");  //  I2C read failed
        console::print("i2c fail\n"); ////
        return Ok(());               //  TODO: Return an error
    }
    Ok(())
 18e:	9011      	str	r0, [sp, #68]	; 0x44
 190:	2001      	movs	r0, #1
 192:	9011      	str	r0, [sp, #68]	; 0x44
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:248
}
 194:	e00c      	b.n	1b0 <app::touch_sensor::read_register_range+0x1b0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:244
        console::print("i2c fail\n"); ////
 196:	f240 0000 	movw	r0, #0
 19a:	f2c0 0000 	movt	r0, #0
 19e:	2109      	movs	r1, #9
 1a0:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
 1a4:	e7ff      	b.n	1a6 <app::touch_sensor::read_register_range+0x1a6>
 1a6:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:245
        return Ok(());               //  TODO: Return an error
 1a8:	9011      	str	r0, [sp, #68]	; 0x44
 1aa:	2001      	movs	r0, #1
 1ac:	9011      	str	r0, [sp, #68]	; 0x44
 1ae:	e7ff      	b.n	1b0 <app::touch_sensor::read_register_range+0x1b0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:248
}
 1b0:	9811      	ldr	r0, [sp, #68]	; 0x44
 1b2:	b01e      	add	sp, #120	; 0x78
 1b4:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/touch_sensor.rs:214
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
 1b6:	f240 0000 	movw	r0, #0
 1ba:	f2c0 0000 	movt	r0, #0
 1be:	f240 0200 	movw	r2, #0
 1c2:	f2c0 0200 	movt	r2, #0
 1c6:	211c      	movs	r1, #28
 1c8:	f7ff fffe 	bl	0 <core::panicking::panic>
 1cc:	defe      	udf	#254	; 0xfe

app-1da0d8acf4e589c0.3qnxh3fxvoqh46ed.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3qnxh3fxvoqh46ed
00001e8f l       .debug_str	00000000 
000024a4 l       .debug_str	00000000 
000024a9 l       .debug_str	00000000 
000024b3 l       .debug_str	00000000 
000024b5 l       .debug_str	00000000 
000024ee l       .debug_str	00000000 
00002589 l       .debug_str	00000000 
000025e3 l       .debug_str	00000000 
0000261f l       .debug_str	00000000 
00002651 l       .debug_str	00000000 
0000268d l       .debug_str	00000000 
0000269b l       .debug_str	00000000 
0000269d l       .debug_str	00000000 
0000269f l       .debug_str	00000000 
000026a4 l       .debug_str	00000000 
000026a8 l       .debug_str	00000000 
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
000000bd l       .debug_str	00000000 
000000c1 l       .debug_str	00000000 
000000c5 l       .debug_str	00000000 
000000c9 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
00000132 l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
00000139 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
00000182 l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
000001a2 l       .debug_str	00000000 
000001a5 l       .debug_str	00000000 
000001b1 l       .debug_str	00000000 
000001b9 l       .debug_str	00000000 
000001d0 l       .debug_str	00000000 
0000022a l       .debug_str	00000000 
0000028c l       .debug_str	00000000 
00000297 l       .debug_str	00000000 
000002de l       .debug_str	00000000 
0000032d l       .debug_str	00000000 
00000337 l       .debug_str	00000000 
00000374 l       .debug_str	00000000 
000003b9 l       .debug_str	00000000 
000003c2 l       .debug_str	00000000 
000003d2 l       .debug_str	00000000 
000003da l       .debug_str	00000000 
0000042f l       .debug_str	00000000 
0000048c l       .debug_str	00000000 
00000498 l       .debug_str	00000000 
000004a1 l       .debug_str	00000000 
000004ad l       .debug_str	00000000 
000004b9 l       .debug_str	00000000 
000004c2 l       .debug_str	00000000 
000004ca l       .debug_str	00000000 
000004d4 l       .debug_str	00000000 
000004dc l       .debug_str	00000000 
000004e6 l       .debug_str	00000000 
000004fb l       .debug_str	00000000 
00000502 l       .debug_str	00000000 
00000522 l       .debug_str	00000000 
00000529 l       .debug_str	00000000 
00000531 l       .debug_str	00000000 
0000053b l       .debug_str	00000000 
00000546 l       .debug_str	00000000 
0000054f l       .debug_str	00000000 
0000055a l       .debug_str	00000000 
00000566 l       .debug_str	00000000 
0000056f l       .debug_str	00000000 
00000576 l       .debug_str	00000000 
0000057e l       .debug_str	00000000 
00000586 l       .debug_str	00000000 
00000590 l       .debug_str	00000000 
00000596 l       .debug_str	00000000 
0000059d l       .debug_str	00000000 
000005a4 l       .debug_str	00000000 
000005d1 l       .debug_str	00000000 
00000606 l       .debug_str	00000000 
0000060c l       .debug_str	00000000 
00000612 l       .debug_str	00000000 
00000621 l       .debug_str	00000000 
00000631 l       .debug_str	00000000 
00000641 l       .debug_str	00000000 
00000649 l       .debug_str	00000000 
00000672 l       .debug_str	00000000 
000006d0 l       .debug_str	00000000 
00000736 l       .debug_str	00000000 
0000073d l       .debug_str	00000000 
00000745 l       .debug_str	00000000 
0000074e l       .debug_str	00000000 
0000076c l       .debug_str	00000000 
0000077c l       .debug_str	00000000 
0000078a l       .debug_str	00000000 
00000795 l       .debug_str	00000000 
000007a2 l       .debug_str	00000000 
000007b1 l       .debug_str	00000000 
000007c7 l       .debug_str	00000000 
000007d1 l       .debug_str	00000000 
000007da l       .debug_str	00000000 
000007e3 l       .debug_str	00000000 
00000809 l       .debug_str	00000000 
0000081f l       .debug_str	00000000 
0000082a l       .debug_str	00000000 
00000840 l       .debug_str	00000000 
00000848 l       .debug_str	00000000 
00000869 l       .debug_str	00000000 
00000880 l       .debug_str	00000000 
00000885 l       .debug_str	00000000 
0000088d l       .debug_str	00000000 
00000896 l       .debug_str	00000000 
0000089f l       .debug_str	00000000 
000008a8 l       .debug_str	00000000 
000008b0 l       .debug_str	00000000 
000008b4 l       .debug_str	00000000 
000008bb l       .debug_str	00000000 
000008c7 l       .debug_str	00000000 
000008d2 l       .debug_str	00000000 
000008da l       .debug_str	00000000 
000008e2 l       .debug_str	00000000 
0000095e l       .debug_str	00000000 
000009e2 l       .debug_str	00000000 
00000ade l       .debug_str	00000000 
00000be2 l       .debug_str	00000000 
00000bf0 l       .debug_str	00000000 
00000bfb l       .debug_str	00000000 
00000c05 l       .debug_str	00000000 
00000c19 l       .debug_str	00000000 
00000c24 l       .debug_str	00000000 
00000c52 l       .debug_str	00000000 
00000ccd l       .debug_str	00000000 
00000d50 l       .debug_str	00000000 
00000d5e l       .debug_str	00000000 
00000dbd l       .debug_str	00000000 
00000e24 l       .debug_str	00000000 
00000e3a l       .debug_str	00000000 
00000e4a l       .debug_str	00000000 
00000e59 l       .debug_str	00000000 
00000e5d l       .debug_str	00000000 
00000e64 l       .debug_str	00000000 
00000e6a l       .debug_str	00000000 
00000e6e l       .debug_str	00000000 
00000e74 l       .debug_str	00000000 
00000e7a l       .debug_str	00000000 
00000e86 l       .debug_str	00000000 
00000e8e l       .debug_str	00000000 
00000e94 l       .debug_str	00000000 
00000e9c l       .debug_str	00000000 
00000ea2 l       .debug_str	00000000 
00000ec5 l       .debug_str	00000000 
00000ed5 l       .debug_str	00000000 
00000f08 l       .debug_str	00000000 
00000f48 l       .debug_str	00000000 
00000f90 l       .debug_str	00000000 
00000f94 l       .debug_str	00000000 
00000f9a l       .debug_str	00000000 
00000fa0 l       .debug_str	00000000 
00000fa6 l       .debug_str	00000000 
00000fb8 l       .debug_str	00000000 
00000fed l       .debug_str	00000000 
0000102f l       .debug_str	00000000 
00001079 l       .debug_str	00000000 
0000107d l       .debug_str	00000000 
00001083 l       .debug_str	00000000 
00001089 l       .debug_str	00000000 
0000108f l       .debug_str	00000000 
000010a1 l       .debug_str	00000000 
000010d6 l       .debug_str	00000000 
00001118 l       .debug_str	00000000 
00001162 l       .debug_str	00000000 
00001166 l       .debug_str	00000000 
0000116c l       .debug_str	00000000 
00001172 l       .debug_str	00000000 
00001178 l       .debug_str	00000000 
0000117e l       .debug_str	00000000 
0000118f l       .debug_str	00000000 
000011c3 l       .debug_str	00000000 
00001204 l       .debug_str	00000000 
0000124d l       .debug_str	00000000 
00001252 l       .debug_str	00000000 
00001257 l       .debug_str	00000000 
0000125b l       .debug_str	00000000 
00001261 l       .debug_str	00000000 
00001267 l       .debug_str	00000000 
0000126d l       .debug_str	00000000 
0000127e l       .debug_str	00000000 
000012b2 l       .debug_str	00000000 
000012f3 l       .debug_str	00000000 
0000133c l       .debug_str	00000000 
00001340 l       .debug_str	00000000 
00001349 l       .debug_str	00000000 
0000135a l       .debug_str	00000000 
0000138e l       .debug_str	00000000 
000013cf l       .debug_str	00000000 
00001418 l       .debug_str	00000000 
0000141d l       .debug_str	00000000 
00001421 l       .debug_str	00000000 
0000142a l       .debug_str	00000000 
00001431 l       .debug_str	00000000 
00001439 l       .debug_str	00000000 
0000144b l       .debug_str	00000000 
00001480 l       .debug_str	00000000 
000014c2 l       .debug_str	00000000 
0000150c l       .debug_str	00000000 
00001510 l       .debug_str	00000000 
00001516 l       .debug_str	00000000 
0000151c l       .debug_str	00000000 
00001522 l       .debug_str	00000000 
00001528 l       .debug_str	00000000 
00001530 l       .debug_str	00000000 
0000153e l       .debug_str	00000000 
0000154d l       .debug_str	00000000 
0000155e l       .debug_str	00000000 
00001569 l       .debug_str	00000000 
00001574 l       .debug_str	00000000 
0000157f l       .debug_str	00000000 
00001586 l       .debug_str	00000000 
000015a9 l       .debug_str	00000000 
000015bb l       .debug_str	00000000 
000015f0 l       .debug_str	00000000 
00001632 l       .debug_str	00000000 
0000167c l       .debug_str	00000000 
00001680 l       .debug_str	00000000 
0000168a l       .debug_str	00000000 
0000169c l       .debug_str	00000000 
000016d1 l       .debug_str	00000000 
00001713 l       .debug_str	00000000 
0000175d l       .debug_str	00000000 
00001762 l       .debug_str	00000000 
0000176c l       .debug_str	00000000 
0000177e l       .debug_str	00000000 
000017b3 l       .debug_str	00000000 
000017f5 l       .debug_str	00000000 
0000183f l       .debug_str	00000000 
00001853 l       .debug_str	00000000 
00001857 l       .debug_str	00000000 
00001865 l       .debug_str	00000000 
00001875 l       .debug_str	00000000 
0000187e l       .debug_str	00000000 
00001889 l       .debug_str	00000000 
00001898 l       .debug_str	00000000 
000018ad l       .debug_str	00000000 
000018de l       .debug_str	00000000 
0000197b l       .debug_str	00000000 
00001a20 l       .debug_str	00000000 
00001a2b l       .debug_str	00000000 
00001a34 l       .debug_str	00000000 
00001a55 l       .debug_str	00000000 
00001a68 l       .debug_str	00000000 
00001a9e l       .debug_str	00000000 
00001b21 l       .debug_str	00000000 
00001bac l       .debug_str	00000000 
00001bc8 l       .debug_str	00000000 
00001c14 l       .debug_str	00000000 
00001c68 l       .debug_str	00000000 
00001c85 l       .debug_str	00000000 
00001c99 l       .debug_str	00000000 
00001ce5 l       .debug_str	00000000 
00001d39 l       .debug_str	00000000 
00001d4f l       .debug_str	00000000 
00001d63 l       .debug_str	00000000 
00001daa l       .debug_str	00000000 
00001df9 l       .debug_str	00000000 
00001e02 l       .debug_str	00000000 
00001e10 l       .debug_str	00000000 
00001e41 l       .debug_str	00000000 
00001e47 l       .debug_str	00000000 
00001e4f l       .debug_str	00000000 
00001e56 l       .debug_str	00000000 
00001e5e l       .debug_str	00000000 
00001e69 l       .debug_str	00000000 
00001e71 l       .debug_str	00000000 
00001e80 l       .debug_str	00000000 
00001e84 l       .debug_str	00000000 
00001e9b l       .debug_str	00000000 
00001ea6 l       .debug_str	00000000 
00001eb7 l       .debug_str	00000000 
00001ebd l       .debug_str	00000000 
00001ec5 l       .debug_str	00000000 
00001ecc l       .debug_str	00000000 
00001ed6 l       .debug_str	00000000 
00001ede l       .debug_str	00000000 
00001ee6 l       .debug_str	00000000 
00001f08 l       .debug_str	00000000 
00001f13 l       .debug_str	00000000 
00001f1f l       .debug_str	00000000 
00001f27 l       .debug_str	00000000 
00001f30 l       .debug_str	00000000 
00001f3b l       .debug_str	00000000 
00001f42 l       .debug_str	00000000 
00001f4d l       .debug_str	00000000 
00001f58 l       .debug_str	00000000 
00001f68 l       .debug_str	00000000 
00001f72 l       .debug_str	00000000 
00001f78 l       .debug_str	00000000 
00001f9a l       .debug_str	00000000 
00001fd2 l       .debug_str	00000000 
00002012 l       .debug_str	00000000 
00002019 l       .debug_str	00000000 
00002021 l       .debug_str	00000000 
00002038 l       .debug_str	00000000 
00002041 l       .debug_str	00000000 
00002051 l       .debug_str	00000000 
00002060 l       .debug_str	00000000 
00002068 l       .debug_str	00000000 
0000206f l       .debug_str	00000000 
00002077 l       .debug_str	00000000 
00002095 l       .debug_str	00000000 
000020a5 l       .debug_str	00000000 
000020d8 l       .debug_str	00000000 
000020ed l       .debug_str	00000000 
000020f6 l       .debug_str	00000000 
00002153 l       .debug_str	00000000 
000021b8 l       .debug_str	00000000 
000021c2 l       .debug_str	00000000 
000021d2 l       .debug_str	00000000 
000021e7 l       .debug_str	00000000 
000021ef l       .debug_str	00000000 
00002253 l       .debug_str	00000000 
000022bf l       .debug_str	00000000 
000022c6 l       .debug_str	00000000 
000022ce l       .debug_str	00000000 
000022ec l       .debug_str	00000000 
000022fc l       .debug_str	00000000 
0000232f l       .debug_str	00000000 
00002344 l       .debug_str	00000000 
00002357 l       .debug_str	00000000 
0000236c l       .debug_str	00000000 
00002373 l       .debug_str	00000000 
00002388 l       .debug_str	00000000 
000023b2 l       .debug_str	00000000 
000023e4 l       .debug_str	00000000 
000023ed l       .debug_str	00000000 
000023f4 l       .debug_str	00000000 
000023fa l       .debug_str	00000000 
000023ff l       .debug_str	00000000 
00002405 l       .debug_str	00000000 
00002413 l       .debug_str	00000000 
0000241c l       .debug_str	00000000 
0000242a l       .debug_str	00000000 
00002442 l       .debug_str	00000000 
00002450 l       .debug_str	00000000 
00002452 l       .debug_str	00000000 
00002487 l       .debug_str	00000000 
00002489 l       .debug_str	00000000 
00002494 l       .debug_str	00000000 
0000249b l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.1e5820940bd7dd6c30de382908485618.0	0000002b .Lanon.1e5820940bd7dd6c30de382908485618.0
00000000 l     O .rodata..Lanon.1e5820940bd7dd6c30de382908485618.2	00000010 .Lanon.1e5820940bd7dd6c30de382908485618.2
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$3map17hc8d1f1cad2258140E	00000000 .text._ZN4core6option15Option$LT$T$GT$3map17hc8d1f1cad2258140E
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6expect17h07a21172758e661bE	00000000 .text._ZN4core6option15Option$LT$T$GT$6expect17h07a21172758e661bE
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6unwrap17h7642532a86b46f59E	00000000 .text._ZN4core6option15Option$LT$T$GT$6unwrap17h7642532a86b46f59E
00000000 l    d  .rodata..Lanon.1e5820940bd7dd6c30de382908485618.1	00000000 .rodata..Lanon.1e5820940bd7dd6c30de382908485618.1
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 <embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next::{{closure}}
00000000         *UND*	00000000 core::option::expect_failed
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$3map17hc8d1f1cad2258140E	000000ba core::option::Option<T>::map
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6expect17h07a21172758e661bE	00000038 core::option::Option<T>::expect
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6unwrap17h7642532a86b46f59E	00000052 core::option::Option<T>::unwrap
00000000         *UND*	00000000 core::panicking::panic



Disassembly of section .text._ZN4core6option15Option$LT$T$GT$3map17hc8d1f1cad2258140E:

00000000 <core::option::Option<T>::map>:
_ZN4core6option15Option$LT$T$GT$3map17hc8d1f1cad2258140E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:447
   0:	b580      	push	{r7, lr}
   2:	b090      	sub	sp, #64	; 0x40
   4:	2200      	movs	r2, #0
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:449
   6:	f88d 203e 	strb.w	r2, [sp, #62]	; 0x3e
   a:	f88d 203f 	strb.w	r2, [sp, #63]	; 0x3f
   e:	2201      	movs	r2, #1
  10:	f88d 203f 	strb.w	r2, [sp, #63]	; 0x3f
  14:	f88d 203e 	strb.w	r2, [sp, #62]	; 0x3e
  18:	680a      	ldr	r2, [r1, #0]
  1a:	2a00      	cmp	r2, #0
  1c:	9101      	str	r1, [sp, #4]
  1e:	9000      	str	r0, [sp, #0]
  20:	d001      	beq.n	26 <core::option::Option<T>::map+0x26>
  22:	e7ff      	b.n	24 <core::option::Option<T>::map+0x24>
  24:	e004      	b.n	30 <core::option::Option<T>::map+0x30>
  26:	2000      	movs	r0, #0
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:450
  28:	9900      	ldr	r1, [sp, #0]
  2a:	6008      	str	r0, [r1, #0]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:448
  2c:	e032      	b.n	94 <core::option::Option<T>::map+0x94>
  2e:	defe      	udf	#254	; 0xfe
  30:	2000      	movs	r0, #0
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:449
  32:	f88d 003f 	strb.w	r0, [sp, #63]	; 0x3f
  36:	9901      	ldr	r1, [sp, #4]
  38:	684a      	ldr	r2, [r1, #4]
  3a:	688b      	ldr	r3, [r1, #8]
  3c:	f8d1 c00c 	ldr.w	ip, [r1, #12]
  40:	f8cd c014 	str.w	ip, [sp, #20]
  44:	9304      	str	r3, [sp, #16]
  46:	9203      	str	r2, [sp, #12]
  48:	f88d 003e 	strb.w	r0, [sp, #62]	; 0x3e
  4c:	9803      	ldr	r0, [sp, #12]
  4e:	9a04      	ldr	r2, [sp, #16]
  50:	9b05      	ldr	r3, [sp, #20]
  52:	930e      	str	r3, [sp, #56]	; 0x38
  54:	920d      	str	r2, [sp, #52]	; 0x34
  56:	900c      	str	r0, [sp, #48]	; 0x30
  58:	980c      	ldr	r0, [sp, #48]	; 0x30
  5a:	9a0d      	ldr	r2, [sp, #52]	; 0x34
  5c:	9b0e      	ldr	r3, [sp, #56]	; 0x38
  5e:	930b      	str	r3, [sp, #44]	; 0x2c
  60:	920a      	str	r2, [sp, #40]	; 0x28
  62:	9009      	str	r0, [sp, #36]	; 0x24
  64:	a806      	add	r0, sp, #24
  66:	a909      	add	r1, sp, #36	; 0x24
  68:	f7ff fffe 	bl	0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next::{{closure}}>
  6c:	e7ff      	b.n	6e <core::option::Option<T>::map+0x6e>
  6e:	9806      	ldr	r0, [sp, #24]
  70:	9907      	ldr	r1, [sp, #28]
  72:	9a08      	ldr	r2, [sp, #32]
  74:	9b00      	ldr	r3, [sp, #0]
  76:	60da      	str	r2, [r3, #12]
  78:	6099      	str	r1, [r3, #8]
  7a:	6058      	str	r0, [r3, #4]
  7c:	2001      	movs	r0, #1
  7e:	6018      	str	r0, [r3, #0]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:452
  80:	e008      	b.n	94 <core::option::Option<T>::map+0x94>
  82:	9801      	ldr	r0, [sp, #4]
  84:	6801      	ldr	r1, [r0, #0]
  86:	2901      	cmp	r1, #1
  88:	d00c      	beq.n	a4 <core::option::Option<T>::map+0xa4>
  8a:	e015      	b.n	b8 <core::option::Option<T>::map+0xb8>
  8c:	2000      	movs	r0, #0
  8e:	f88d 003e 	strb.w	r0, [sp, #62]	; 0x3e
  92:	e7f6      	b.n	82 <core::option::Option<T>::map+0x82>
  94:	f89d 003e 	ldrb.w	r0, [sp, #62]	; 0x3e
  98:	07c0      	lsls	r0, r0, #31
  9a:	2800      	cmp	r0, #0
  9c:	d1f6      	bne.n	8c <core::option::Option<T>::map+0x8c>
  9e:	e7f0      	b.n	82 <core::option::Option<T>::map+0x82>
  a0:	b010      	add	sp, #64	; 0x40
  a2:	bd80      	pop	{r7, pc}
  a4:	f89d 003f 	ldrb.w	r0, [sp, #63]	; 0x3f
  a8:	07c0      	lsls	r0, r0, #31
  aa:	2800      	cmp	r0, #0
  ac:	d0f8      	beq.n	a0 <core::option::Option<T>::map+0xa0>
  ae:	e7ff      	b.n	b0 <core::option::Option<T>::map+0xb0>
  b0:	2000      	movs	r0, #0
  b2:	f88d 003f 	strb.w	r0, [sp, #63]	; 0x3f
  b6:	e7f3      	b.n	a0 <core::option::Option<T>::map+0xa0>
  b8:	e7f2      	b.n	a0 <core::option::Option<T>::map+0xa0>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6expect17h07a21172758e661bE:

00000000 <core::option::Option<T>::expect>:
_ZN4core6option15Option$LT$T$GT$6expect17h07a21172758e661bE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:344
   0:	b086      	sub	sp, #24
   2:	9001      	str	r0, [sp, #4]
   4:	9102      	str	r1, [sp, #8]
   6:	9203      	str	r2, [sp, #12]
   8:	9304      	str	r3, [sp, #16]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:346
   a:	9801      	ldr	r0, [sp, #4]
   c:	2800      	cmp	r0, #0
   e:	d001      	beq.n	14 <core::option::Option<T>::expect+0x14>
  10:	e7ff      	b.n	12 <core::option::Option<T>::expect+0x12>
  12:	e005      	b.n	20 <core::option::Option<T>::expect+0x20>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:347
  14:	9803      	ldr	r0, [sp, #12]
  16:	9904      	ldr	r1, [sp, #16]
  18:	f7ff fffe 	bl	0 <core::option::expect_failed>
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
  2c:	d103      	bne.n	36 <core::option::Option<T>::expect+0x36>
  2e:	e7ff      	b.n	30 <core::option::Option<T>::expect+0x30>
  30:	9800      	ldr	r0, [sp, #0]
  32:	b006      	add	sp, #24
  34:	4770      	bx	lr
  36:	e7fb      	b.n	30 <core::option::Option<T>::expect+0x30>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17h7642532a86b46f59E:

00000000 <core::option::Option<T>::unwrap>:
_ZN4core6option15Option$LT$T$GT$6unwrap17h7642532a86b46f59E():
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
  10:	d001      	beq.n	16 <core::option::Option<T>::unwrap+0x16>
  12:	e7ff      	b.n	14 <core::option::Option<T>::unwrap+0x14>
  14:	e008      	b.n	28 <core::option::Option<T>::unwrap+0x28>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/macros/mod.rs:15
  16:	f240 0000 	movw	r0, #0
  1a:	f2c0 0000 	movt	r0, #0
  1e:	9005      	str	r0, [sp, #20]
  20:	9a05      	ldr	r2, [sp, #20]
  22:	9202      	str	r2, [sp, #8]
  24:	e008      	b.n	38 <core::option::Option<T>::unwrap+0x38>
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
  34:	d109      	bne.n	4a <core::option::Option<T>::unwrap+0x4a>
  36:	e00b      	b.n	50 <core::option::Option<T>::unwrap+0x50>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/macros/mod.rs:15
  38:	f240 0000 	movw	r0, #0
  3c:	f2c0 0000 	movt	r0, #0
  40:	212b      	movs	r1, #43	; 0x2b
  42:	9a02      	ldr	r2, [sp, #8]
  44:	f7ff fffe 	bl	0 <core::panicking::panic>
  48:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/option.rs:382
  4a:	9801      	ldr	r0, [sp, #4]
  4c:	b006      	add	sp, #24
  4e:	4770      	bx	lr
  50:	e7fb      	b.n	4a <core::option::Option<T>::unwrap+0x4a>

app-1da0d8acf4e589c0.3u72kxo7ofzcwykn.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3u72kxo7ofzcwykn
00001dac l       .debug_str	00000000 
00002745 l       .debug_str	00000000 
0000274d l       .debug_str	00000000 
00002756 l       .debug_str	00000000 
0000275d l       .debug_str	00000000 
00002763 l       .debug_str	00000000 
00002769 l       .debug_str	00000000 
0000276e l       .debug_str	00000000 
00002776 l       .debug_str	00000000 
0000277b l       .debug_str	00000000 
000027eb l       .debug_str	00000000 
00002821 l       .debug_str	00000000 
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
00000769 l       .debug_str	00000000 
00000770 l       .debug_str	00000000 
00000779 l       .debug_str	00000000 
00000788 l       .debug_str	00000000 
0000078c l       .debug_str	00000000 
00000794 l       .debug_str	00000000 
0000079a l       .debug_str	00000000 
000007a6 l       .debug_str	00000000 
000007ae l       .debug_str	00000000 
00000808 l       .debug_str	00000000 
0000086a l       .debug_str	00000000 
00000875 l       .debug_str	00000000 
000008bc l       .debug_str	00000000 
0000090b l       .debug_str	00000000 
00000915 l       .debug_str	00000000 
00000952 l       .debug_str	00000000 
00000997 l       .debug_str	00000000 
000009a0 l       .debug_str	00000000 
000009b0 l       .debug_str	00000000 
000009b8 l       .debug_str	00000000 
00000a0d l       .debug_str	00000000 
00000a6a l       .debug_str	00000000 
00000a76 l       .debug_str	00000000 
00000a7f l       .debug_str	00000000 
00000a8b l       .debug_str	00000000 
00000a97 l       .debug_str	00000000 
00000aa0 l       .debug_str	00000000 
00000aa8 l       .debug_str	00000000 
00000ab0 l       .debug_str	00000000 
00000ac5 l       .debug_str	00000000 
00000acc l       .debug_str	00000000 
00000aec l       .debug_str	00000000 
00000af3 l       .debug_str	00000000 
00000afb l       .debug_str	00000000 
00000b05 l       .debug_str	00000000 
00000b1c l       .debug_str	00000000 
00000b21 l       .debug_str	00000000 
00000b29 l       .debug_str	00000000 
00000b32 l       .debug_str	00000000 
00000b3b l       .debug_str	00000000 
00000b44 l       .debug_str	00000000 
00000b4c l       .debug_str	00000000 
00000b53 l       .debug_str	00000000 
00000b5f l       .debug_str	00000000 
00000b6a l       .debug_str	00000000 
00000b72 l       .debug_str	00000000 
00000b7a l       .debug_str	00000000 
00000c76 l       .debug_str	00000000 
00000d7a l       .debug_str	00000000 
00000d88 l       .debug_str	00000000 
00000d93 l       .debug_str	00000000 
00000d9d l       .debug_str	00000000 
00000db1 l       .debug_str	00000000 
00000dbc l       .debug_str	00000000 
00000dea l       .debug_str	00000000 
00000e65 l       .debug_str	00000000 
00000ee8 l       .debug_str	00000000 
00000ef6 l       .debug_str	00000000 
00000f55 l       .debug_str	00000000 
00000fbc l       .debug_str	00000000 
00000fd2 l       .debug_str	00000000 
00000fe2 l       .debug_str	00000000 
00000ff1 l       .debug_str	00000000 
00000ff5 l       .debug_str	00000000 
00000ffc l       .debug_str	00000000 
00001002 l       .debug_str	00000000 
00001006 l       .debug_str	00000000 
0000100c l       .debug_str	00000000 
00001012 l       .debug_str	00000000 
0000101e l       .debug_str	00000000 
00001026 l       .debug_str	00000000 
0000102c l       .debug_str	00000000 
00001034 l       .debug_str	00000000 
0000103a l       .debug_str	00000000 
0000105d l       .debug_str	00000000 
0000106d l       .debug_str	00000000 
000010a0 l       .debug_str	00000000 
000010e0 l       .debug_str	00000000 
00001128 l       .debug_str	00000000 
0000112c l       .debug_str	00000000 
00001132 l       .debug_str	00000000 
00001138 l       .debug_str	00000000 
0000113e l       .debug_str	00000000 
00001150 l       .debug_str	00000000 
00001185 l       .debug_str	00000000 
000011c7 l       .debug_str	00000000 
00001211 l       .debug_str	00000000 
00001215 l       .debug_str	00000000 
0000121b l       .debug_str	00000000 
00001221 l       .debug_str	00000000 
00001227 l       .debug_str	00000000 
00001239 l       .debug_str	00000000 
0000126e l       .debug_str	00000000 
000012b0 l       .debug_str	00000000 
000012fa l       .debug_str	00000000 
000012fe l       .debug_str	00000000 
00001304 l       .debug_str	00000000 
0000130a l       .debug_str	00000000 
00001310 l       .debug_str	00000000 
00001316 l       .debug_str	00000000 
00001327 l       .debug_str	00000000 
0000135b l       .debug_str	00000000 
0000139c l       .debug_str	00000000 
000013e5 l       .debug_str	00000000 
000013ea l       .debug_str	00000000 
000013ef l       .debug_str	00000000 
000013f3 l       .debug_str	00000000 
000013f9 l       .debug_str	00000000 
000013ff l       .debug_str	00000000 
00001405 l       .debug_str	00000000 
00001416 l       .debug_str	00000000 
0000144a l       .debug_str	00000000 
0000148b l       .debug_str	00000000 
000014d4 l       .debug_str	00000000 
000014d8 l       .debug_str	00000000 
000014e1 l       .debug_str	00000000 
000014f2 l       .debug_str	00000000 
00001526 l       .debug_str	00000000 
00001567 l       .debug_str	00000000 
000015b0 l       .debug_str	00000000 
000015b5 l       .debug_str	00000000 
000015b9 l       .debug_str	00000000 
000015c2 l       .debug_str	00000000 
000015c9 l       .debug_str	00000000 
000015d1 l       .debug_str	00000000 
000015e3 l       .debug_str	00000000 
00001618 l       .debug_str	00000000 
0000165a l       .debug_str	00000000 
000016a4 l       .debug_str	00000000 
000016a8 l       .debug_str	00000000 
000016ae l       .debug_str	00000000 
000016b4 l       .debug_str	00000000 
000016ba l       .debug_str	00000000 
000016c0 l       .debug_str	00000000 
000016c8 l       .debug_str	00000000 
000016d6 l       .debug_str	00000000 
000016e5 l       .debug_str	00000000 
000016f6 l       .debug_str	00000000 
00001701 l       .debug_str	00000000 
0000170c l       .debug_str	00000000 
00001717 l       .debug_str	00000000 
0000171e l       .debug_str	00000000 
00001741 l       .debug_str	00000000 
00001753 l       .debug_str	00000000 
00001788 l       .debug_str	00000000 
000017ca l       .debug_str	00000000 
00001814 l       .debug_str	00000000 
00001818 l       .debug_str	00000000 
00001822 l       .debug_str	00000000 
00001834 l       .debug_str	00000000 
00001869 l       .debug_str	00000000 
000018ab l       .debug_str	00000000 
000018f5 l       .debug_str	00000000 
000018fa l       .debug_str	00000000 
00001904 l       .debug_str	00000000 
00001916 l       .debug_str	00000000 
0000194b l       .debug_str	00000000 
0000198d l       .debug_str	00000000 
000019d7 l       .debug_str	00000000 
000019eb l       .debug_str	00000000 
000019ef l       .debug_str	00000000 
000019fd l       .debug_str	00000000 
00001a0d l       .debug_str	00000000 
00001a16 l       .debug_str	00000000 
00001a21 l       .debug_str	00000000 
00001a30 l       .debug_str	00000000 
00001a45 l       .debug_str	00000000 
00001a76 l       .debug_str	00000000 
00001b13 l       .debug_str	00000000 
00001bb8 l       .debug_str	00000000 
00001bc3 l       .debug_str	00000000 
00001bcc l       .debug_str	00000000 
00001bed l       .debug_str	00000000 
00001c00 l       .debug_str	00000000 
00001c36 l       .debug_str	00000000 
00001cb9 l       .debug_str	00000000 
00001d44 l       .debug_str	00000000 
00001d60 l       .debug_str	00000000 
00001e00 l       .debug_str	00000000 
00001e1d l       .debug_str	00000000 
00001e31 l       .debug_str	00000000 
00001e7d l       .debug_str	00000000 
00001ed1 l       .debug_str	00000000 
00001ee7 l       .debug_str	00000000 
00001efb l       .debug_str	00000000 
00001f42 l       .debug_str	00000000 
00001f91 l       .debug_str	00000000 
00001f9a l       .debug_str	00000000 
00001fa8 l       .debug_str	00000000 
00001fd9 l       .debug_str	00000000 
00001fdf l       .debug_str	00000000 
00001fe7 l       .debug_str	00000000 
00001fee l       .debug_str	00000000 
00001ff6 l       .debug_str	00000000 
00002001 l       .debug_str	00000000 
00002009 l       .debug_str	00000000 
00002018 l       .debug_str	00000000 
0000201c l       .debug_str	00000000 
00002027 l       .debug_str	00000000 
00002033 l       .debug_str	00000000 
0000203e l       .debug_str	00000000 
0000204f l       .debug_str	00000000 
00002055 l       .debug_str	00000000 
0000205d l       .debug_str	00000000 
00002064 l       .debug_str	00000000 
0000206e l       .debug_str	00000000 
00002076 l       .debug_str	00000000 
0000207e l       .debug_str	00000000 
000020a0 l       .debug_str	00000000 
000020ab l       .debug_str	00000000 
000020b7 l       .debug_str	00000000 
000020bf l       .debug_str	00000000 
000020c8 l       .debug_str	00000000 
000020d3 l       .debug_str	00000000 
000020da l       .debug_str	00000000 
000020e5 l       .debug_str	00000000 
000020f0 l       .debug_str	00000000 
00002100 l       .debug_str	00000000 
00002110 l       .debug_str	00000000 
00002143 l       .debug_str	00000000 
00002158 l       .debug_str	00000000 
00002161 l       .debug_str	00000000 
000021be l       .debug_str	00000000 
00002223 l       .debug_str	00000000 
0000222d l       .debug_str	00000000 
0000223d l       .debug_str	00000000 
00002252 l       .debug_str	00000000 
0000225a l       .debug_str	00000000 
000022be l       .debug_str	00000000 
0000232a l       .debug_str	00000000 
00002331 l       .debug_str	00000000 
00002339 l       .debug_str	00000000 
00002357 l       .debug_str	00000000 
00002367 l       .debug_str	00000000 
0000239a l       .debug_str	00000000 
000023af l       .debug_str	00000000 
000023c2 l       .debug_str	00000000 
000023d7 l       .debug_str	00000000 
000023de l       .debug_str	00000000 
000023f3 l       .debug_str	00000000 
0000241d l       .debug_str	00000000 
00002499 l       .debug_str	00000000 
0000251d l       .debug_str	00000000 
00002524 l       .debug_str	00000000 
0000252c l       .debug_str	00000000 
0000254a l       .debug_str	00000000 
0000255a l       .debug_str	00000000 
000025ca l       .debug_str	00000000 
00002621 l       .debug_str	00000000 
00002674 l       .debug_str	00000000 
00002679 l       .debug_str	00000000 
000026e9 l       .debug_str	00000000 
00002717 l       .debug_str	00000000 
00002741 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.045e74596c43dd67f46afa88f77b4141.0	00000010 .Lanon.045e74596c43dd67f46afa88f77b4141.0
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h599b041cc2f5cb2bE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h599b041cc2f5cb2bE
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h6638971f12e79258E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h6638971f12e79258E
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17ha7588bc4f5d88e7bE	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17ha7588bc4f5d88e7bE
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hda2010c8c5b65325E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hda2010c8c5b65325E
00000000 l    d  .rodata..Lanon.045e74596c43dd67f46afa88f77b4141.0	00000000 .rodata..Lanon.045e74596c43dd67f46afa88f77b4141.0
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::ptr::real_drop_in_place
00000000         *UND*	00000000 core::result::unwrap_failed
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h599b041cc2f5cb2bE	0000004a core::result::Result<T,E>::expect
00000000         *UND*	00000000 <mynewt::result::MynewtError as core::fmt::Debug>::fmt
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h6638971f12e79258E	00000014 <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17ha7588bc4f5d88e7bE	0000000a <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hda2010c8c5b65325E	00000016 <core::result::Result<T,E> as core::ops::try::Try>::into_result



Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h599b041cc2f5cb2bE:

00000000 <core::result::Result<T,E>::expect>:
_ZN4core6result19Result$LT$T$C$E$GT$6expect17h599b041cc2f5cb2bE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:981
   0:	b086      	sub	sp, #24
   2:	9102      	str	r1, [sp, #8]
   4:	9203      	str	r2, [sp, #12]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:983
   6:	6801      	ldr	r1, [r0, #0]
   8:	2900      	cmp	r1, #0
   a:	9001      	str	r0, [sp, #4]
   c:	d002      	beq.n	14 <core::result::Result<T,E>::expect+0x14>
   e:	e7ff      	b.n	10 <core::result::Result<T,E>::expect+0x10>
  10:	e00a      	b.n	28 <core::result::Result<T,E>::expect+0x28>
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
  24:	d00d      	beq.n	42 <core::result::Result<T,E>::expect+0x42>
  26:	e00f      	b.n	48 <core::result::Result<T,E>::expect+0x48>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:984
  28:	9801      	ldr	r0, [sp, #4]
  2a:	6841      	ldr	r1, [r0, #4]
  2c:	9105      	str	r1, [sp, #20]
  2e:	9802      	ldr	r0, [sp, #8]
  30:	9903      	ldr	r1, [sp, #12]
  32:	f240 0300 	movw	r3, #0
  36:	f2c0 0300 	movt	r3, #0
  3a:	aa05      	add	r2, sp, #20
  3c:	f7ff fffe 	bl	0 <core::result::unwrap_failed>
  40:	defe      	udf	#254	; 0xfe
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:986
  42:	9800      	ldr	r0, [sp, #0]
  44:	b006      	add	sp, #24
  46:	4770      	bx	lr
  48:	e7fb      	b.n	42 <core::result::Result<T,E>::expect+0x42>

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h6638971f12e79258E:

00000000 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h6638971f12e79258E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1461
   0:	b580      	push	{r7, lr}
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1462
   2:	e8b1 500c 	ldmia.w	r1!, {r2, r3, ip, lr}
   6:	e8a0 500c 	stmia.w	r0!, {r2, r3, ip, lr}
   a:	e891 500c 	ldmia.w	r1, {r2, r3, ip, lr}
   e:	e880 500c 	stmia.w	r0, {r2, r3, ip, lr}
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1463
  12:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17ha7588bc4f5d88e7bE:

00000000 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17ha7588bc4f5d88e7bE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1462
   0:	680a      	ldr	r2, [r1, #0]
   2:	6849      	ldr	r1, [r1, #4]
   4:	6041      	str	r1, [r0, #4]
   6:	6002      	str	r2, [r0, #0]
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/result.rs:1463
   8:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hda2010c8c5b65325E:

00000000 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17hda2010c8c5b65325E():
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

app-1da0d8acf4e589c0.3ztvo67zda8mhvq2.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3ztvo67zda8mhvq2
00000364 l       .debug_str	00000000 
000003e4 l       .debug_str	00000000 
000003e9 l       .debug_str	00000000 
000003ef l       .debug_str	00000000 
000003f6 l       .debug_str	00000000 
00000400 l       .debug_str	00000000 
0000040e l       .debug_str	00000000 
0000044e l       .debug_str	00000000 
00000453 l       .debug_str	00000000 
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
00000169 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
000001a8 l       .debug_str	00000000 
000001ad l       .debug_str	00000000 
000001b1 l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
000001bf l       .debug_str	00000000 
000001c3 l       .debug_str	00000000 
000001eb l       .debug_str	00000000 
000001f6 l       .debug_str	00000000 
00000208 l       .debug_str	00000000 
00000213 l       .debug_str	00000000 
0000021d l       .debug_str	00000000 
00000226 l       .debug_str	00000000 
0000022c l       .debug_str	00000000 
0000023b l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
00000245 l       .debug_str	00000000 
00000252 l       .debug_str	00000000 
00000258 l       .debug_str	00000000 
00000263 l       .debug_str	00000000 
0000026a l       .debug_str	00000000 
0000026e l       .debug_str	00000000 
00000273 l       .debug_str	00000000 
0000027e l       .debug_str	00000000 
00000285 l       .debug_str	00000000 
0000028c l       .debug_str	00000000 
00000291 l       .debug_str	00000000 
000002c7 l       .debug_str	00000000 
000002d4 l       .debug_str	00000000 
000002e1 l       .debug_str	00000000 
000002e4 l       .debug_str	00000000 
000002e6 l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
0000031d l       .debug_str	00000000 
00000356 l       .debug_str	00000000 
0000035d l       .debug_str	00000000 
0000036b l       .debug_str	00000000 
000003a1 l       .debug_str	00000000 
000003a8 l       .debug_str	00000000 
000003ad l       .debug_str	00000000 
000003b3 l       .debug_str	00000000 
000003c0 l       .debug_str	00000000 
000003c4 l       .debug_str	00000000 
000003cd l       .debug_str	00000000 
000003d7 l       .debug_str	00000000 
000003de l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.dd594932ea9d9ab0f56c9b44e0803a49.0	00000012 .Lanon.dd594932ea9d9ab0f56c9b44e0803a49.0
00000000 l     O .rodata..Lanon.dd594932ea9d9ab0f56c9b44e0803a49.1	0000000d .Lanon.dd594932ea9d9ab0f56c9b44e0803a49.1
00000000 l    d  .text._ZN3app7display12test_display17h162adb19dcb4647aE	00000000 .text._ZN3app7display12test_display17h162adb19dcb4647aE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 <embedded_graphics::primitives::circle::Circle<C> as embedded_graphics::style::WithStyle<C>>::fill
00000000         *UND*	00000000 <embedded_graphics::pixelcolor::rgb565::Rgb565 as core::convert::From<(u8, u8, u8)>>::from
00000000         *UND*	00000000 <embedded_graphics::primitives::rectangle::Rectangle<C> as embedded_graphics::style::WithStyle<C>>::fill
00000000         *UND*	00000000 <embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::fonts::Font<C>>::render_str
00000000         *UND*	00000000 <embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::transform::Transform>::translate
00000000         *UND*	00000000 <embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::style::WithStyle<C>>::fill
00000000         *UND*	00000000 <embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::style::WithStyle<C>>::stroke
00000000         *UND*	00000000 embedded_graphics::primitives::circle::Circle<C>::new
00000000         *UND*	00000000 embedded_graphics::primitives::rectangle::Rectangle<C>::new
00000000         *UND*	00000000 embedded_graphics::coord::internal_coord::Coord::new
00000000         *UND*	00000000 piet_embedded_graphics::display::draw_to_display
00000000         *UND*	00000000 piet_embedded_graphics::display::draw_to_display
00000000         *UND*	00000000 piet_embedded_graphics::display::draw_to_display
00000000 g     F .text._ZN3app7display12test_display17h162adb19dcb4647aE	0000028e .hidden app::display::test_display
00000000         *UND*	00000000 mynewt::sys::console::flush
00000000         *UND*	00000000 mynewt::sys::console::print



Disassembly of section .text._ZN3app7display12test_display17h162adb19dcb4647aE:

00000000 <app::display::test_display>:
_ZN3app7display12test_display17h162adb19dcb4647aE():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:17
    result::*,
    sys::console,
};

/// Render some graphics and text to the PineTime display. `start_display()` must have been called earlier.
pub fn test_display() -> MynewtResult<()> {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	f5ad 7d00 	sub.w	sp, sp, #512	; 0x200
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:18
    console::print("Rust test display\n"); console::flush();
   6:	f240 0000 	movw	r0, #0
   a:	f2c0 0000 	movt	r0, #0
   e:	2112      	movs	r1, #18
  10:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  14:	e7ff      	b.n	2 <mynewt::sys::console::flush+0x2>
  16:	f7ff fffe 	bl	0 <mynewt::sys::console::flush>
  1a:	e7ff      	b.n	1c <app::display::test_display+0x1c>
  1c:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:22
    
    //  Create black background
    let background = Rectangle::<Rgb565>
        ::new( Coord::new( 0, 0 ), Coord::new( 239, 239 ) )   //  Rectangle coordinates
  1e:	9016      	str	r0, [sp, #88]	; 0x58
  20:	9916      	ldr	r1, [sp, #88]	; 0x58
  22:	f7ff fffe 	bl	0 <embedded_graphics::coord::internal_coord::Coord::new>
  26:	9015      	str	r0, [sp, #84]	; 0x54
  28:	9114      	str	r1, [sp, #80]	; 0x50
  2a:	e7ff      	b.n	2c <app::display::test_display+0x2c>
  2c:	20ef      	movs	r0, #239	; 0xef
  2e:	9013      	str	r0, [sp, #76]	; 0x4c
  30:	9913      	ldr	r1, [sp, #76]	; 0x4c
  32:	f7ff fffe 	bl	0 <embedded_graphics::coord::internal_coord::Coord::new>
  36:	9012      	str	r0, [sp, #72]	; 0x48
  38:	9111      	str	r1, [sp, #68]	; 0x44
  3a:	e7ff      	b.n	3c <app::display::test_display+0x3c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:21
    let background = Rectangle::<Rgb565>
  3c:	4668      	mov	r0, sp
  3e:	9911      	ldr	r1, [sp, #68]	; 0x44
  40:	6001      	str	r1, [r0, #0]
  42:	a81e      	add	r0, sp, #120	; 0x78
  44:	9915      	ldr	r1, [sp, #84]	; 0x54
  46:	9a14      	ldr	r2, [sp, #80]	; 0x50
  48:	9b12      	ldr	r3, [sp, #72]	; 0x48
  4a:	f7ff fffe 	bl	0 <embedded_graphics::primitives::rectangle::Rectangle<C>::new>
  4e:	e7ff      	b.n	50 <app::display::test_display+0x50>
  50:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:23
        .fill( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) );  //  Black
  52:	f88d 0098 	strb.w	r0, [sp, #152]	; 0x98
  56:	f88d 0099 	strb.w	r0, [sp, #153]	; 0x99
  5a:	f88d 009a 	strb.w	r0, [sp, #154]	; 0x9a
  5e:	f89d 009a 	ldrb.w	r0, [sp, #154]	; 0x9a
  62:	f8bd 1098 	ldrh.w	r1, [sp, #152]	; 0x98
  66:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
  6a:	f7ff fffe 	bl	0 <<embedded_graphics::pixelcolor::rgb565::Rgb565 as core::convert::From<(u8, u8, u8)>>::from>
  6e:	9010      	str	r0, [sp, #64]	; 0x40
  70:	e7ff      	b.n	72 <app::display::test_display+0x72>
  72:	9810      	ldr	r0, [sp, #64]	; 0x40
  74:	f8ad 0096 	strh.w	r0, [sp, #150]	; 0x96
  78:	2101      	movs	r1, #1
  7a:	f8ad 1094 	strh.w	r1, [sp, #148]	; 0x94
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:21
    let background = Rectangle::<Rgb565>
  7e:	f8bd 3096 	ldrh.w	r3, [sp, #150]	; 0x96
  82:	f8bd 2094 	ldrh.w	r2, [sp, #148]	; 0x94
  86:	a817      	add	r0, sp, #92	; 0x5c
  88:	a91e      	add	r1, sp, #120	; 0x78
  8a:	f7ff fffe 	bl	0 <<embedded_graphics::primitives::rectangle::Rectangle<C> as embedded_graphics::style::WithStyle<C>>::fill>
  8e:	e7ff      	b.n	90 <app::display::test_display+0x90>
  90:	2028      	movs	r0, #40	; 0x28
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:27

    //  Create circle
    let circle = Circle::<Rgb565>
        ::new( Coord::new( 40, 40 ), 40 )                     //  Circle centre and radius
  92:	900f      	str	r0, [sp, #60]	; 0x3c
  94:	990f      	ldr	r1, [sp, #60]	; 0x3c
  96:	f7ff fffe 	bl	0 <embedded_graphics::coord::internal_coord::Coord::new>
  9a:	900e      	str	r0, [sp, #56]	; 0x38
  9c:	910d      	str	r1, [sp, #52]	; 0x34
  9e:	e7ff      	b.n	a0 <app::display::test_display+0xa0>
  a0:	a82d      	add	r0, sp, #180	; 0xb4
  a2:	2328      	movs	r3, #40	; 0x28
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:26
    let circle = Circle::<Rgb565>
  a4:	990e      	ldr	r1, [sp, #56]	; 0x38
  a6:	9a0d      	ldr	r2, [sp, #52]	; 0x34
  a8:	f7ff fffe 	bl	0 <embedded_graphics::primitives::circle::Circle<C>::new>
  ac:	e7ff      	b.n	ae <app::display::test_display+0xae>
  ae:	20ff      	movs	r0, #255	; 0xff
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:28
        .fill( Some( Rgb565::from(( 0xff, 0x00, 0xff )) ) );  //  Magenta
  b0:	f88d 00d0 	strb.w	r0, [sp, #208]	; 0xd0
  b4:	2100      	movs	r1, #0
  b6:	f88d 10d1 	strb.w	r1, [sp, #209]	; 0xd1
  ba:	f88d 00d2 	strb.w	r0, [sp, #210]	; 0xd2
  be:	f89d 00d2 	ldrb.w	r0, [sp, #210]	; 0xd2
  c2:	f8bd 10d0 	ldrh.w	r1, [sp, #208]	; 0xd0
  c6:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
  ca:	f7ff fffe 	bl	0 <<embedded_graphics::pixelcolor::rgb565::Rgb565 as core::convert::From<(u8, u8, u8)>>::from>
  ce:	900c      	str	r0, [sp, #48]	; 0x30
  d0:	e7ff      	b.n	d2 <app::display::test_display+0xd2>
  d2:	980c      	ldr	r0, [sp, #48]	; 0x30
  d4:	f8ad 00ce 	strh.w	r0, [sp, #206]	; 0xce
  d8:	2101      	movs	r1, #1
  da:	f8ad 10cc 	strh.w	r1, [sp, #204]	; 0xcc
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:26
    let circle = Circle::<Rgb565>
  de:	f8bd 30ce 	ldrh.w	r3, [sp, #206]	; 0xce
  e2:	f8bd 20cc 	ldrh.w	r2, [sp, #204]	; 0xcc
  e6:	a827      	add	r0, sp, #156	; 0x9c
  e8:	a92d      	add	r1, sp, #180	; 0xb4
  ea:	f7ff fffe 	bl	0 <<embedded_graphics::primitives::circle::Circle<C> as embedded_graphics::style::WithStyle<C>>::fill>
  ee:	e7ff      	b.n	f0 <app::display::test_display+0xf0>
  f0:	203c      	movs	r0, #60	; 0x3c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:32

    //  Create square
    let square = Rectangle::<Rgb565>
        ::new( Coord::new( 60, 60 ), Coord::new( 150, 150 ) ) //  Square coordinates
  f2:	900b      	str	r0, [sp, #44]	; 0x2c
  f4:	990b      	ldr	r1, [sp, #44]	; 0x2c
  f6:	f7ff fffe 	bl	0 <embedded_graphics::coord::internal_coord::Coord::new>
  fa:	900a      	str	r0, [sp, #40]	; 0x28
  fc:	9109      	str	r1, [sp, #36]	; 0x24
  fe:	e7ff      	b.n	100 <app::display::test_display+0x100>
 100:	2096      	movs	r0, #150	; 0x96
 102:	9008      	str	r0, [sp, #32]
 104:	9908      	ldr	r1, [sp, #32]
 106:	f7ff fffe 	bl	0 <embedded_graphics::coord::internal_coord::Coord::new>
 10a:	9007      	str	r0, [sp, #28]
 10c:	9106      	str	r1, [sp, #24]
 10e:	e7ff      	b.n	110 <app::display::test_display+0x110>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:31
    let square = Rectangle::<Rgb565>
 110:	4668      	mov	r0, sp
 112:	9906      	ldr	r1, [sp, #24]
 114:	6001      	str	r1, [r0, #0]
 116:	a83c      	add	r0, sp, #240	; 0xf0
 118:	990a      	ldr	r1, [sp, #40]	; 0x28
 11a:	9a09      	ldr	r2, [sp, #36]	; 0x24
 11c:	9b07      	ldr	r3, [sp, #28]
 11e:	f7ff fffe 	bl	0 <embedded_graphics::primitives::rectangle::Rectangle<C>::new>
 122:	e7ff      	b.n	124 <app::display::test_display+0x124>
 124:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:33
        .fill( Some( Rgb565::from(( 0x00, 0x00, 0xff )) ) );  //  Blue
 126:	f88d 0110 	strb.w	r0, [sp, #272]	; 0x110
 12a:	f88d 0111 	strb.w	r0, [sp, #273]	; 0x111
 12e:	20ff      	movs	r0, #255	; 0xff
 130:	f88d 0112 	strb.w	r0, [sp, #274]	; 0x112
 134:	f89d 0112 	ldrb.w	r0, [sp, #274]	; 0x112
 138:	f8bd 1110 	ldrh.w	r1, [sp, #272]	; 0x110
 13c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 140:	f7ff fffe 	bl	0 <<embedded_graphics::pixelcolor::rgb565::Rgb565 as core::convert::From<(u8, u8, u8)>>::from>
 144:	9005      	str	r0, [sp, #20]
 146:	e7ff      	b.n	148 <app::display::test_display+0x148>
 148:	9805      	ldr	r0, [sp, #20]
 14a:	f8ad 010e 	strh.w	r0, [sp, #270]	; 0x10e
 14e:	2101      	movs	r1, #1
 150:	f8ad 110c 	strh.w	r1, [sp, #268]	; 0x10c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:31
    let square = Rectangle::<Rgb565>
 154:	f8bd 310e 	ldrh.w	r3, [sp, #270]	; 0x10e
 158:	f8bd 210c 	ldrh.w	r2, [sp, #268]	; 0x10c
 15c:	a835      	add	r0, sp, #212	; 0xd4
 15e:	a93c      	add	r1, sp, #240	; 0xf0
 160:	f7ff fffe 	bl	0 <<embedded_graphics::primitives::rectangle::Rectangle<C> as embedded_graphics::style::WithStyle<C>>::fill>
 164:	e7ff      	b.n	2 <app::display::test_display+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:36

    //  Create text
    let text = fonts::Font12x16::<Rgb565>
 166:	f240 0100 	movw	r1, #0
 16a:	f2c0 0100 	movt	r1, #0
 16e:	a85a      	add	r0, sp, #360	; 0x168
 170:	220d      	movs	r2, #13
 172:	f7ff fffe 	bl	0 <<embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::fonts::Font<C>>::render_str>
 176:	e7ff      	b.n	178 <app::display::test_display+0x178>
 178:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:38
        ::render_str("I AM PINETIME")                          //  Text to be rendered
        .stroke( Some( Rgb565::from(( 0x00, 0x00, 0x00 )) ) )  //  Black text
 17a:	f88d 0188 	strb.w	r0, [sp, #392]	; 0x188
 17e:	f88d 0189 	strb.w	r0, [sp, #393]	; 0x189
 182:	f88d 018a 	strb.w	r0, [sp, #394]	; 0x18a
 186:	f89d 018a 	ldrb.w	r0, [sp, #394]	; 0x18a
 18a:	f8bd 1188 	ldrh.w	r1, [sp, #392]	; 0x188
 18e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 192:	f7ff fffe 	bl	0 <<embedded_graphics::pixelcolor::rgb565::Rgb565 as core::convert::From<(u8, u8, u8)>>::from>
 196:	9004      	str	r0, [sp, #16]
 198:	e7ff      	b.n	19a <app::display::test_display+0x19a>
 19a:	9804      	ldr	r0, [sp, #16]
 19c:	f8ad 0186 	strh.w	r0, [sp, #390]	; 0x186
 1a0:	2101      	movs	r1, #1
 1a2:	f8ad 1184 	strh.w	r1, [sp, #388]	; 0x184
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:36
    let text = fonts::Font12x16::<Rgb565>
 1a6:	f8bd 3186 	ldrh.w	r3, [sp, #390]	; 0x186
 1aa:	f8bd 2184 	ldrh.w	r2, [sp, #388]	; 0x184
 1ae:	a853      	add	r0, sp, #332	; 0x14c
 1b0:	a95a      	add	r1, sp, #360	; 0x168
 1b2:	f7ff fffe 	bl	0 <<embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::style::WithStyle<C>>::stroke>
 1b6:	e7ff      	b.n	1b8 <app::display::test_display+0x1b8>
 1b8:	20ff      	movs	r0, #255	; 0xff
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:39
        .fill(   Some( Rgb565::from(( 0xff, 0xff, 0x00 )) ) )  //  Yellow background
 1ba:	f88d 0190 	strb.w	r0, [sp, #400]	; 0x190
 1be:	f88d 0191 	strb.w	r0, [sp, #401]	; 0x191
 1c2:	2000      	movs	r0, #0
 1c4:	f88d 0192 	strb.w	r0, [sp, #402]	; 0x192
 1c8:	f89d 0192 	ldrb.w	r0, [sp, #402]	; 0x192
 1cc:	f8bd 1190 	ldrh.w	r1, [sp, #400]	; 0x190
 1d0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 1d4:	f7ff fffe 	bl	0 <<embedded_graphics::pixelcolor::rgb565::Rgb565 as core::convert::From<(u8, u8, u8)>>::from>
 1d8:	9003      	str	r0, [sp, #12]
 1da:	e7ff      	b.n	1dc <app::display::test_display+0x1dc>
 1dc:	9803      	ldr	r0, [sp, #12]
 1de:	f8ad 018e 	strh.w	r0, [sp, #398]	; 0x18e
 1e2:	2101      	movs	r1, #1
 1e4:	f8ad 118c 	strh.w	r1, [sp, #396]	; 0x18c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:36
    let text = fonts::Font12x16::<Rgb565>
 1e8:	f8bd 318e 	ldrh.w	r3, [sp, #398]	; 0x18e
 1ec:	f8bd 218c 	ldrh.w	r2, [sp, #396]	; 0x18c
 1f0:	a84c      	add	r0, sp, #304	; 0x130
 1f2:	a953      	add	r1, sp, #332	; 0x14c
 1f4:	f7ff fffe 	bl	0 <<embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::style::WithStyle<C>>::fill>
 1f8:	e7ff      	b.n	1fa <app::display::test_display+0x1fa>
 1fa:	2014      	movs	r0, #20
 1fc:	2110      	movs	r1, #16
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:40
        .translate( Coord::new( 20, 16 ));                     //  Shift the text
 1fe:	f7ff fffe 	bl	0 <embedded_graphics::coord::internal_coord::Coord::new>
 202:	9002      	str	r0, [sp, #8]
 204:	9101      	str	r1, [sp, #4]
 206:	e7ff      	b.n	208 <app::display::test_display+0x208>
 208:	a845      	add	r0, sp, #276	; 0x114
 20a:	a94c      	add	r1, sp, #304	; 0x130
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:36
    let text = fonts::Font12x16::<Rgb565>
 20c:	9a02      	ldr	r2, [sp, #8]
 20e:	9b01      	ldr	r3, [sp, #4]
 210:	f7ff fffe 	bl	0 <<embedded_graphics::fonts::font_builder::FontBuilder<C,Conf> as embedded_graphics::transform::Transform>::translate>
 214:	e7ff      	b.n	216 <app::display::test_display+0x216>
 216:	a817      	add	r0, sp, #92	; 0x5c
 218:	a965      	add	r1, sp, #404	; 0x194
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:43

    //  Render background, circle, square and text to display
    druid::draw_to_display(background);
 21a:	460a      	mov	r2, r1
 21c:	e8b0 5008 	ldmia.w	r0!, {r3, ip, lr}
 220:	e8a2 5008 	stmia.w	r2!, {r3, ip, lr}
 224:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
 228:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
 22c:	4608      	mov	r0, r1
 22e:	f7ff fffe 	bl	0 <piet_embedded_graphics::display::draw_to_display>
 232:	e7ff      	b.n	234 <app::display::test_display+0x234>
 234:	a827      	add	r0, sp, #156	; 0x9c
 236:	a96c      	add	r1, sp, #432	; 0x1b0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:44
    druid::draw_to_display(circle);
 238:	460a      	mov	r2, r1
 23a:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
 23e:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
 242:	4608      	mov	r0, r1
 244:	f7ff fffe 	bl	0 <piet_embedded_graphics::display::draw_to_display>
 248:	e7ff      	b.n	24a <app::display::test_display+0x24a>
 24a:	a835      	add	r0, sp, #212	; 0xd4
 24c:	a972      	add	r1, sp, #456	; 0x1c8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:45
    druid::draw_to_display(square);
 24e:	460a      	mov	r2, r1
 250:	e8b0 5008 	ldmia.w	r0!, {r3, ip, lr}
 254:	e8a2 5008 	stmia.w	r2!, {r3, ip, lr}
 258:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
 25c:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
 260:	4608      	mov	r0, r1
 262:	f7ff fffe 	bl	0 <piet_embedded_graphics::display::draw_to_display>
 266:	e7ff      	b.n	268 <app::display::test_display+0x268>
 268:	a845      	add	r0, sp, #276	; 0x114
 26a:	a979      	add	r1, sp, #484	; 0x1e4
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:46
    druid::draw_to_display(text);    
 26c:	460a      	mov	r2, r1
 26e:	e8b0 5008 	ldmia.w	r0!, {r3, ip, lr}
 272:	e8a2 5008 	stmia.w	r2!, {r3, ip, lr}
 276:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
 27a:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
 27e:	4608      	mov	r0, r1
 280:	f7ff fffe 	bl	0 <piet_embedded_graphics::display::draw_to_display>
 284:	e7ff      	b.n	286 <app::display::test_display+0x286>
 286:	2001      	movs	r0, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/display.rs:50

    //  Return success to the caller
    Ok(())
 288:	f50d 7d00 	add.w	sp, sp, #512	; 0x200
 28c:	bd70      	pop	{r4, r5, r6, pc}

app-1da0d8acf4e589c0.443ouz32g0ggdgyl.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 443ouz32g0ggdgyl
00000197 l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
00000192 l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
000001cc l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
00000204 l       .debug_str	00000000 
0000024d l       .debug_str	00000000 
000002bb l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c3 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000df l       .debug_str	00000000 
000000e3 l       .debug_str	00000000 
000000e7 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
000000fc l       .debug_str	00000000 
00000102 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
00000119 l       .debug_str	00000000 
0000011d l       .debug_str	00000000 
00000122 l       .debug_str	00000000 
0000012d l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
0000013b l       .debug_str	00000000 
0000013d l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
00000178 l       .debug_str	00000000 
00000000 l     O .rodata.cst16	00000010 .Lanon.19377092ae15ddd87f1414096f77d704.0
00000000 l    d  .text._ZN22piet_embedded_graphics7display15draw_to_display17h27fbf8e7371c4d9cE	00000000 .text._ZN22piet_embedded_graphics7display15draw_to_display17h27fbf8e7371c4d9cE
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 piet_embedded_graphics::batch::draw_blocks
00000000 g     F .text._ZN22piet_embedded_graphics7display15draw_to_display17h27fbf8e7371c4d9cE	0000003a piet_embedded_graphics::display::draw_to_display
00000000         *UND*	00000000 piet_embedded_graphics::display::DISPLAY
00000000         *UND*	00000000 core::result::Result<T,E>::expect



Disassembly of section .text._ZN22piet_embedded_graphics7display15draw_to_display17h27fbf8e7371c4d9cE:

00000000 <piet_embedded_graphics::display::draw_to_display>:
_ZN22piet_embedded_graphics7display15draw_to_display17h27fbf8e7371c4d9cE():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/display.rs:126
    }
    Ok(())
}

/// Draw the item to the display
pub fn draw_to_display<T>(item: T)
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b088      	sub	sp, #32
   4:	a902      	add	r1, sp, #8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/display.rs:134
    unsafe { DISPLAY.draw(item) };        //  Draw text or graphics the usual slow way

    #[cfg(feature = "noblock_spi")]       //  If batching is enabled...
    super::batch::draw_blocks(            //  Draw text or graphics the new faster way, as pixel blocks
        unsafe { &mut DISPLAY },
        item
   6:	460a      	mov	r2, r1
   8:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
   c:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/display.rs:132
    super::batch::draw_blocks(            //  Draw text or graphics the new faster way, as pixel blocks
  10:	f240 0000 	movw	r0, #0
  14:	f2c0 0000 	movt	r0, #0
  18:	f7ff fffe 	bl	0 <piet_embedded_graphics::batch::draw_blocks>
  1c:	9001      	str	r0, [sp, #4]
  1e:	e7ff      	b.n	20 <piet_embedded_graphics::display::draw_to_display+0x20>
  20:	9801      	ldr	r0, [sp, #4]
  22:	f000 0001 	and.w	r0, r0, #1
  26:	f240 0100 	movw	r1, #0
  2a:	f2c0 0100 	movt	r1, #0
  2e:	2210      	movs	r2, #16
  30:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  34:	e7ff      	b.n	36 <piet_embedded_graphics::display::draw_to_display+0x36>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/display.rs:136
    ).expect("draw blocks fail");
}
  36:	b008      	add	sp, #32
  38:	bd70      	pop	{r4, r5, r6, pc}

app-1da0d8acf4e589c0.4gon3pescdpipuhv.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4gon3pescdpipuhv
00002401 l       .debug_str	00000000 
000024bb l       .debug_str	00000000 
000024f0 l       .debug_str	00000000 
000024f2 l       .debug_str	00000000 
000024f4 l       .debug_str	00000000 
00002532 l       .debug_str	00000000 
0000253e l       .debug_str	00000000 
00002543 l       .debug_str	00000000 
000025b5 l       .debug_str	00000000 
000025bf l       .debug_str	00000000 
000025c1 l       .debug_str	00000000 
00002661 l       .debug_str	00000000 
00002696 l       .debug_str	00000000 
00002769 l       .debug_str	00000000 
0000279e l       .debug_str	00000000 
000028f1 l       .debug_str	00000000 
00002926 l       .debug_str	00000000 
00002962 l       .debug_str	00000000 
00002997 l       .debug_str	00000000 
00002a3c l       .debug_str	00000000 
00002b59 l       .debug_str	00000000 
00002b9e l       .debug_str	00000000 
00002be1 l       .debug_str	00000000 
00002c02 l       .debug_str	00000000 
00002c31 l       .debug_str	00000000 
00002cf5 l       .debug_str	00000000 
00002e39 l       .debug_str	00000000 
00002e66 l       .debug_str	00000000 
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
00000162 l       .debug_str	00000000 
00000166 l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
00000179 l       .debug_str	00000000 
00000180 l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
00000191 l       .debug_str	00000000 
00000198 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
000001a1 l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001ca l       .debug_str	00000000 
000001d2 l       .debug_str	00000000 
000001d6 l       .debug_str	00000000 
000001d8 l       .debug_str	00000000 
000001da l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
0000023d l       .debug_str	00000000 
00000245 l       .debug_str	00000000 
0000024c l       .debug_str	00000000 
0000025d l       .debug_str	00000000 
000002cd l       .debug_str	00000000 
00000367 l       .debug_str	00000000 
0000042a l       .debug_str	00000000 
00000517 l       .debug_str	00000000 
0000051f l       .debug_str	00000000 
00000524 l       .debug_str	00000000 
0000052a l       .debug_str	00000000 
0000052e l       .debug_str	00000000 
00000532 l       .debug_str	00000000 
00000535 l       .debug_str	00000000 
0000055e l       .debug_str	00000000 
00000594 l       .debug_str	00000000 
00000596 l       .debug_str	00000000 
000005c3 l       .debug_str	00000000 
00000613 l       .debug_str	00000000 
00000670 l       .debug_str	00000000 
000006c4 l       .debug_str	00000000 
000006c7 l       .debug_str	00000000 
0000073e l       .debug_str	00000000 
000007c2 l       .debug_str	00000000 
0000083d l       .debug_str	00000000 
000008db l       .debug_str	00000000 
00000986 l       .debug_str	00000000 
00000a28 l       .debug_str	00000000 
00000aed l       .debug_str	00000000 
00000bbf l       .debug_str	00000000 
00000c88 l       .debug_str	00000000 
00000d74 l       .debug_str	00000000 
00000e6d l       .debug_str	00000000 
00000f5d l       .debug_str	00000000 
0000106f l       .debug_str	00000000 
0000119e l       .debug_str	00000000 
000012cc l       .debug_str	00000000 
000012d0 l       .debug_str	00000000 
000012d6 l       .debug_str	00000000 
000012d8 l       .debug_str	00000000 
000013fe l       .debug_str	00000000 
00001400 l       .debug_str	00000000 
00001509 l       .debug_str	00000000 
0000153e l       .debug_str	00000000 
0000166a l       .debug_str	00000000 
00001671 l       .debug_str	00000000 
00001675 l       .debug_str	00000000 
0000167a l       .debug_str	00000000 
00001691 l       .debug_str	00000000 
00001697 l       .debug_str	00000000 
0000169e l       .debug_str	00000000 
000016a6 l       .debug_str	00000000 
000016ac l       .debug_str	00000000 
000016b5 l       .debug_str	00000000 
000016bc l       .debug_str	00000000 
000017d3 l       .debug_str	00000000 
000018e6 l       .debug_str	00000000 
00001a06 l       .debug_str	00000000 
00001b1d l       .debug_str	00000000 
00001c56 l       .debug_str	00000000 
00001dac l       .debug_str	00000000 
00001f01 l       .debug_str	00000000 
0000204e l       .debug_str	00000000 
0000217e l       .debug_str	00000000 
00002189 l       .debug_str	00000000 
0000218e l       .debug_str	00000000 
000021c0 l       .debug_str	00000000 
000021f5 l       .debug_str	00000000 
00002249 l       .debug_str	00000000 
0000224b l       .debug_str	00000000 
00002254 l       .debug_str	00000000 
00002284 l       .debug_str	00000000 
000022b9 l       .debug_str	00000000 
0000230b l       .debug_str	00000000 
00002340 l       .debug_str	00000000 
00002370 l       .debug_str	00000000 
000023a5 l       .debug_str	00000000 
000023e3 l       .debug_str	00000000 
000023e8 l       .debug_str	00000000 
000023ef l       .debug_str	00000000 
0000240c l       .debug_str	00000000 
00002413 l       .debug_str	00000000 
0000241a l       .debug_str	00000000 
00002420 l       .debug_str	00000000 
0000242f l       .debug_str	00000000 
00002435 l       .debug_str	00000000 
0000243c l       .debug_str	00000000 
00002442 l       .debug_str	00000000 
0000244d l       .debug_str	00000000 
00002458 l       .debug_str	00000000 
0000245f l       .debug_str	00000000 
00002466 l       .debug_str	00000000 
0000249c l       .debug_str	00000000 
000024a9 l       .debug_str	00000000 
000024b6 l       .debug_str	00000000 
000024b9 l       .debug_str	00000000 
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17h6abce146bb21f211E	00000012 core::ptr::real_drop_in_place
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17h79167714116e8b56E	00000012 core::ptr::real_drop_in_place
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17h8e725ddaf2f0b7ebE	00000012 core::ptr::real_drop_in_place
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17hcf7ca83fd72fad20E	00000014 core::ptr::real_drop_in_place
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h1caec9d2e30d0e18E	00000000 .text._ZN4core3ptr18real_drop_in_place17h1caec9d2e30d0e18E
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h4a0d3e376afcedbeE	00000000 .text._ZN4core3ptr18real_drop_in_place17h4a0d3e376afcedbeE
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h5d8691b519a666baE	00000000 .text._ZN4core3ptr18real_drop_in_place17h5d8691b519a666baE
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h61a99ea504a7924dE	00000000 .text._ZN4core3ptr18real_drop_in_place17h61a99ea504a7924dE
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h6abce146bb21f211E	00000000 .text._ZN4core3ptr18real_drop_in_place17h6abce146bb21f211E
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h71f5efe7328dd458E	00000000 .text._ZN4core3ptr18real_drop_in_place17h71f5efe7328dd458E
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h79167714116e8b56E	00000000 .text._ZN4core3ptr18real_drop_in_place17h79167714116e8b56E
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h8e725ddaf2f0b7ebE	00000000 .text._ZN4core3ptr18real_drop_in_place17h8e725ddaf2f0b7ebE
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17hcf7ca83fd72fad20E	00000000 .text._ZN4core3ptr18real_drop_in_place17hcf7ca83fd72fad20E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3ptr18real_drop_in_place17h1caec9d2e30d0e18E	00000012 .hidden core::ptr::real_drop_in_place
00000000 g     F .text._ZN4core3ptr18real_drop_in_place17h4a0d3e376afcedbeE	0000001e .hidden core::ptr::real_drop_in_place
00000000 g     F .text._ZN4core3ptr18real_drop_in_place17h5d8691b519a666baE	0000001e .hidden core::ptr::real_drop_in_place
00000000 g     F .text._ZN4core3ptr18real_drop_in_place17h61a99ea504a7924dE	00000008 .hidden core::ptr::real_drop_in_place
00000000 g     F .text._ZN4core3ptr18real_drop_in_place17h71f5efe7328dd458E	0000001c .hidden core::ptr::real_drop_in_place
00000000         *UND*	00000000 <heapless::vec::Vec<T,N> as core::ops::drop::Drop>::drop
00000000         *UND*	00000000 <heapless::vec::Vec<T,N> as core::ops::drop::Drop>::drop



Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h1caec9d2e30d0e18E:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h1caec9d2e30d0e18E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::ops::drop::Drop>::drop>
   c:	e7ff      	b.n	e <core::ptr::real_drop_in_place+0xe>
   e:	b002      	add	sp, #8
  10:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h4a0d3e376afcedbeE:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h4a0d3e376afcedbeE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	6800      	ldr	r0, [r0, #0]
   a:	2800      	cmp	r0, #0
   c:	d102      	bne.n	14 <core::ptr::real_drop_in_place+0x14>
   e:	e7ff      	b.n	10 <core::ptr::real_drop_in_place+0x10>
  10:	b002      	add	sp, #8
  12:	bd80      	pop	{r7, pc}
  14:	9801      	ldr	r0, [sp, #4]
  16:	3004      	adds	r0, #4
  18:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
  1c:	e7f8      	b.n	10 <core::ptr::real_drop_in_place+0x10>

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h5d8691b519a666baE:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h5d8691b519a666baE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	6800      	ldr	r0, [r0, #0]
   a:	2800      	cmp	r0, #0
   c:	d102      	bne.n	14 <core::ptr::real_drop_in_place+0x14>
   e:	e7ff      	b.n	10 <core::ptr::real_drop_in_place+0x10>
  10:	b002      	add	sp, #8
  12:	bd80      	pop	{r7, pc}
  14:	9801      	ldr	r0, [sp, #4]
  16:	3004      	adds	r0, #4
  18:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
  1c:	e7f8      	b.n	10 <core::ptr::real_drop_in_place+0x10>

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h61a99ea504a7924dE:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h61a99ea504a7924dE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b081      	sub	sp, #4
   2:	9000      	str	r0, [sp, #0]
   4:	b001      	add	sp, #4
   6:	4770      	bx	lr

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h6abce146bb21f211E:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h6abce146bb21f211E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
   c:	e7ff      	b.n	e <core::ptr::real_drop_in_place+0xe>
   e:	b002      	add	sp, #8
  10:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h71f5efe7328dd458E:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h71f5efe7328dd458E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
   c:	e001      	b.n	12 <core::ptr::real_drop_in_place+0x12>
   e:	b002      	add	sp, #8
  10:	bd80      	pop	{r7, pc}
  12:	9801      	ldr	r0, [sp, #4]
  14:	3090      	adds	r0, #144	; 0x90
  16:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
  1a:	e7f8      	b.n	e <core::ptr::real_drop_in_place+0xe>

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h79167714116e8b56E:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h79167714116e8b56E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::ops::drop::Drop>::drop>
   c:	e7ff      	b.n	e <core::ptr::real_drop_in_place+0xe>
   e:	b002      	add	sp, #8
  10:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h8e725ddaf2f0b7ebE:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h8e725ddaf2f0b7ebE():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
   c:	e7ff      	b.n	e <core::ptr::real_drop_in_place+0xe>
   e:	b002      	add	sp, #8
  10:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17hcf7ca83fd72fad20E:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17hcf7ca83fd72fad20E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/ptr/mod.rs:181
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	3020      	adds	r0, #32
   a:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
   e:	e7ff      	b.n	10 <core::ptr::real_drop_in_place+0x10>
  10:	b002      	add	sp, #8
  12:	bd80      	pop	{r7, pc}

app-1da0d8acf4e589c0.56fall6s8dipdxg4.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 56fall6s8dipdxg4
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
00000000 l     O .rodata..Lanon.bd54dd447929105621c3c57f1df11764.1	0000000e .Lanon.bd54dd447929105621c3c57f1df11764.1
00000000 l     O .rodata..Lanon.bd54dd447929105621c3c57f1df11764.2	00000006 .Lanon.bd54dd447929105621c3c57f1df11764.2
00000000 l     O .rodata..Lanon.bd54dd447929105621c3c57f1df11764.4	0000000c .Lanon.bd54dd447929105621c3c57f1df11764.4
00000000 l     O .rodata._ZN3app10app_sensor13SENSOR_DEVICE17h8a9cb0aacb542a3cE	0000000c app::app_sensor::SENSOR_DEVICE
00000000 l    d  .text._ZN3app10app_sensor21start_sensor_listener17h1b313776b97a232bE	00000000 .text._ZN3app10app_sensor21start_sensor_listener17h1b313776b97a232bE
00000000 l    d  .rodata..Lanon.bd54dd447929105621c3c57f1df11764.0	00000000 .rodata..Lanon.bd54dd447929105621c3c57f1df11764.0
00000000 l    d  .rodata._ZN3app10app_sensor13SENSOR_DEVICE17h8a9cb0aacb542a3cE	00000000 .rodata._ZN3app10app_sensor13SENSOR_DEVICE17h8a9cb0aacb542a3cE
00000000 l    d  .rodata..Lanon.bd54dd447929105621c3c57f1df11764.3	00000000 .rodata..Lanon.bd54dd447929105621c3c57f1df11764.3
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app10app_sensor21start_sensor_listener17h1b313776b97a232bE	00000162 .hidden app::app_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden app::app_network::aggregate_sensor_data
00000000         *UND*	00000000 core::option::Option<T>::expect
00000000         *UND*	00000000 <T as core::convert::From<T>>::from
00000000         *UND*	00000000 mynewt::hw::sensor_mgr::find_bydevname
00000000         *UND*	00000000 mynewt::hw::sensor::register_listener
00000000         *UND*	00000000 mynewt::hw::sensor::new_sensor_listener
00000000         *UND*	00000000 mynewt::hw::sensor::bindings::set_poll_rate_ms
00000000         *UND*	00000000 mynewt::sys::console::print
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::from_error
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000         *UND*	00000000 <mynewt::hw::sensor_mgr::SensorsByDevname as core::iter::traits::iterator::Iterator>::next



Disassembly of section .text._ZN3app10app_sensor21start_sensor_listener17h1b313776b97a232bE:

00000000 <app::app_sensor::start_sensor_listener>:
_ZN3app10app_sensor21start_sensor_listener17h1b313776b97a232bE():
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
   e:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  12:	e7ff      	b.n	2 <app::app_sensor::start_sensor_listener+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:50

    //  Fetch the sensor by name.
    let sensor = sensor_mgr::find_bydevname(&SENSOR_DEVICE)
  14:	f240 0100 	movw	r1, #0
  18:	f2c0 0100 	movt	r1, #0
  1c:	a80b      	add	r0, sp, #44	; 0x2c
  1e:	f7ff fffe 	bl	0 <mynewt::hw::sensor_mgr::find_bydevname>
  22:	e7ff      	b.n	24 <app::app_sensor::start_sensor_listener+0x24>
  24:	a80b      	add	r0, sp, #44	; 0x2c
  26:	f7ff fffe 	bl	0 <<mynewt::hw::sensor_mgr::SensorsByDevname as core::iter::traits::iterator::Iterator>::next>
  2a:	9008      	str	r0, [sp, #32]
  2c:	9107      	str	r1, [sp, #28]
  2e:	e7ff      	b.n	30 <app::app_sensor::start_sensor_listener+0x30>
  30:	f240 0200 	movw	r2, #0
  34:	f2c0 0200 	movt	r2, #0
  38:	2306      	movs	r3, #6
  3a:	9808      	ldr	r0, [sp, #32]
  3c:	9907      	ldr	r1, [sp, #28]
  3e:	f7ff fffe 	bl	0 <core::option::Option<T>::expect>
  42:	900a      	str	r0, [sp, #40]	; 0x28
  44:	e7ff      	b.n	46 <app::app_sensor::start_sensor_listener+0x46>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:55
        .next()             //  Fetch the first sensor that matches
        .expect("no TMP");  //  Stop if no sensor found

    //  At power on, we ask Mynewt to poll our temperature sensor every 10 seconds.
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;
  46:	f240 0000 	movw	r0, #0
  4a:	f2c0 0000 	movt	r0, #0
  4e:	f247 5130 	movw	r1, #30000	; 0x7530
  52:	f7ff fffe 	bl	0 <mynewt::hw::sensor::bindings::set_poll_rate_ms>
  56:	9006      	str	r0, [sp, #24]
  58:	e7ff      	b.n	5a <app::app_sensor::start_sensor_listener+0x5a>
  5a:	9806      	ldr	r0, [sp, #24]
  5c:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  60:	900f      	str	r0, [sp, #60]	; 0x3c
  62:	e7ff      	b.n	64 <app::app_sensor::start_sensor_listener+0x64>
  64:	980f      	ldr	r0, [sp, #60]	; 0x3c
  66:	1e41      	subs	r1, r0, #1
  68:	bf18      	it	ne
  6a:	2101      	movne	r1, #1
  6c:	2801      	cmp	r0, #1
  6e:	d013      	beq.n	98 <app::app_sensor::start_sensor_listener+0x98>
  70:	e7ff      	b.n	72 <app::app_sensor::start_sensor_listener+0x72>
  72:	e000      	b.n	76 <app::app_sensor::start_sensor_listener+0x76>
  74:	defe      	udf	#254	; 0xfe
  76:	980f      	ldr	r0, [sp, #60]	; 0x3c
  78:	9010      	str	r0, [sp, #64]	; 0x40
  7a:	9810      	ldr	r0, [sp, #64]	; 0x40
  7c:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
  80:	9005      	str	r0, [sp, #20]
  82:	e002      	b.n	8a <app::app_sensor::start_sensor_listener+0x8a>
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
  8c:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
  90:	9009      	str	r0, [sp, #36]	; 0x24
  92:	e7ff      	b.n	94 <app::app_sensor::start_sensor_listener+0x94>
  94:	e7ff      	b.n	96 <app::app_sensor::start_sensor_listener+0x96>
  96:	e7f5      	b.n	84 <app::app_sensor::start_sensor_listener+0x84>
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
  b4:	f7ff fffe 	bl	0 <mynewt::hw::sensor::new_sensor_listener>
  b8:	e7ff      	b.n	ba <app::app_sensor::start_sensor_listener+0xba>
  ba:	a818      	add	r0, sp, #96	; 0x60
  bc:	a920      	add	r1, sp, #128	; 0x80
  be:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  c2:	e7ff      	b.n	c4 <app::app_sensor::start_sensor_listener+0xc4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:62
    ) ? ;
  c4:	9818      	ldr	r0, [sp, #96]	; 0x60
  c6:	2800      	cmp	r0, #0
  c8:	d010      	beq.n	ec <app::app_sensor::start_sensor_listener+0xec>
  ca:	e7ff      	b.n	cc <app::app_sensor::start_sensor_listener+0xcc>
  cc:	e000      	b.n	d0 <app::app_sensor::start_sensor_listener+0xd0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:58
    let listener = sensor::new_sensor_listener(
  ce:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:62
    ) ? ;
  d0:	9819      	ldr	r0, [sp, #100]	; 0x64
  d2:	9029      	str	r0, [sp, #164]	; 0xa4
  d4:	9829      	ldr	r0, [sp, #164]	; 0xa4
  d6:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
  da:	9004      	str	r0, [sp, #16]
  dc:	e7ff      	b.n	de <app::app_sensor::start_sensor_listener+0xde>
  de:	9804      	ldr	r0, [sp, #16]
  e0:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
  e4:	9009      	str	r0, [sp, #36]	; 0x24
  e6:	e7ff      	b.n	e8 <app::app_sensor::start_sensor_listener+0xe8>
  e8:	e7ff      	b.n	ea <app::app_sensor::start_sensor_listener+0xea>
  ea:	e7d4      	b.n	96 <app::app_sensor::start_sensor_listener+0x96>
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
 11a:	f7ff fffe 	bl	0 <mynewt::hw::sensor::register_listener>
 11e:	9003      	str	r0, [sp, #12]
 120:	e7ff      	b.n	122 <app::app_sensor::start_sensor_listener+0x122>
 122:	9803      	ldr	r0, [sp, #12]
 124:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
 128:	9031      	str	r0, [sp, #196]	; 0xc4
 12a:	e7ff      	b.n	12c <app::app_sensor::start_sensor_listener+0x12c>
 12c:	9831      	ldr	r0, [sp, #196]	; 0xc4
 12e:	1e41      	subs	r1, r0, #1
 130:	bf18      	it	ne
 132:	2101      	movne	r1, #1
 134:	2801      	cmp	r0, #1
 136:	d00f      	beq.n	158 <app::app_sensor::start_sensor_listener+0x158>
 138:	e7ff      	b.n	13a <app::app_sensor::start_sensor_listener+0x13a>
 13a:	e000      	b.n	13e <app::app_sensor::start_sensor_listener+0x13e>
 13c:	defe      	udf	#254	; 0xfe
 13e:	9831      	ldr	r0, [sp, #196]	; 0xc4
 140:	9039      	str	r0, [sp, #228]	; 0xe4
 142:	9839      	ldr	r0, [sp, #228]	; 0xe4
 144:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
 148:	9002      	str	r0, [sp, #8]
 14a:	e7ff      	b.n	14c <app::app_sensor::start_sensor_listener+0x14c>
 14c:	9802      	ldr	r0, [sp, #8]
 14e:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
 152:	9009      	str	r0, [sp, #36]	; 0x24
 154:	e7ff      	b.n	156 <app::app_sensor::start_sensor_listener+0x156>
 156:	e7c8      	b.n	ea <app::app_sensor::start_sensor_listener+0xea>
 158:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:68
    Ok(())
 15a:	9009      	str	r0, [sp, #36]	; 0x24
 15c:	2001      	movs	r0, #1
 15e:	9009      	str	r0, [sp, #36]	; 0x24
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/app_sensor.rs:69
 160:	e790      	b.n	84 <app::app_sensor::start_sensor_listener+0x84>

app-1da0d8acf4e589c0.n6e1990egtctct7.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 n6e1990egtctct7
00002400 l       .debug_str	00000000 
0000295f l       .debug_str	00000000 
0000296d l       .debug_str	00000000 
000029a2 l       .debug_str	00000000 
000029fc l       .debug_str	00000000 
00002a00 l       .debug_str	00000000 
00002a06 l       .debug_str	00000000 
00002aca l       .debug_str	00000000 
00002ad3 l       .debug_str	00000000 
00002adb l       .debug_str	00000000 
00002ae6 l       .debug_str	00000000 
00002aea l       .debug_str	00000000 
00002aed l       .debug_str	00000000 
00002af1 l       .debug_str	00000000 
00002af5 l       .debug_str	00000000 
00002afe l       .debug_str	00000000 
00002b01 l       .debug_str	00000000 
00002b04 l       .debug_str	00000000 
00002b43 l       .debug_str	00000000 
00002b93 l       .debug_str	00000000 
00002b9a l       .debug_str	00000000 
00002ba1 l       .debug_str	00000000 
00002ba5 l       .debug_str	00000000 
00002ba9 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000080 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000096 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000b4 l       .debug_str	00000000 
000000ba l       .debug_str	00000000 
000000c3 l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000cf l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000e9 l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
000000fb l       .debug_str	00000000 
00000102 l       .debug_str	00000000 
00000108 l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
0000011b l       .debug_str	00000000 
0000011f l       .debug_str	00000000 
00000123 l       .debug_str	00000000 
00000129 l       .debug_str	00000000 
00000130 l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
00000145 l       .debug_str	00000000 
0000014c l       .debug_str	00000000 
00000150 l       .debug_str	00000000 
00000155 l       .debug_str	00000000 
00000160 l       .debug_str	00000000 
00000167 l       .debug_str	00000000 
0000016e l       .debug_str	00000000 
00000170 l       .debug_str	00000000 
00000175 l       .debug_str	00000000 
000001ab l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001c5 l       .debug_str	00000000 
000001c7 l       .debug_str	00000000 
000001fc l       .debug_str	00000000 
000001fe l       .debug_str	00000000 
00000200 l       .debug_str	00000000 
00000202 l       .debug_str	00000000 
00000240 l       .debug_str	00000000 
000002ce l       .debug_str	00000000 
00000339 l       .debug_str	00000000 
00000340 l       .debug_str	00000000 
00000348 l       .debug_str	00000000 
0000034f l       .debug_str	00000000 
00000358 l       .debug_str	00000000 
0000035c l       .debug_str	00000000 
0000035e l       .debug_str	00000000 
00000365 l       .debug_str	00000000 
00000369 l       .debug_str	00000000 
00000376 l       .debug_str	00000000 
0000037d l       .debug_str	00000000 
00000380 l       .debug_str	00000000 
00000386 l       .debug_str	00000000 
00000394 l       .debug_str	00000000 
000003a2 l       .debug_str	00000000 
000003a7 l       .debug_str	00000000 
000003af l       .debug_str	00000000 
000003b7 l       .debug_str	00000000 
000003b9 l       .debug_str	00000000 
000003d6 l       .debug_str	00000000 
0000041c l       .debug_str	00000000 
00000424 l       .debug_str	00000000 
0000042b l       .debug_str	00000000 
0000043c l       .debug_str	00000000 
000004ac l       .debug_str	00000000 
00000546 l       .debug_str	00000000 
00000609 l       .debug_str	00000000 
000006f6 l       .debug_str	00000000 
000006fe l       .debug_str	00000000 
00000703 l       .debug_str	00000000 
00000709 l       .debug_str	00000000 
0000070d l       .debug_str	00000000 
00000710 l       .debug_str	00000000 
00000739 l       .debug_str	00000000 
0000076f l       .debug_str	00000000 
00000771 l       .debug_str	00000000 
0000079e l       .debug_str	00000000 
000007ee l       .debug_str	00000000 
0000084b l       .debug_str	00000000 
0000089f l       .debug_str	00000000 
000008a2 l       .debug_str	00000000 
00000919 l       .debug_str	00000000 
0000099d l       .debug_str	00000000 
00000a18 l       .debug_str	00000000 
00000ab6 l       .debug_str	00000000 
00000b61 l       .debug_str	00000000 
00000c03 l       .debug_str	00000000 
00000cc8 l       .debug_str	00000000 
00000d9a l       .debug_str	00000000 
00000e63 l       .debug_str	00000000 
00000f4f l       .debug_str	00000000 
00001048 l       .debug_str	00000000 
00001138 l       .debug_str	00000000 
0000124a l       .debug_str	00000000 
00001379 l       .debug_str	00000000 
000014a7 l       .debug_str	00000000 
000014ab l       .debug_str	00000000 
000014b1 l       .debug_str	00000000 
000014b3 l       .debug_str	00000000 
000015d9 l       .debug_str	00000000 
000015db l       .debug_str	00000000 
000016e4 l       .debug_str	00000000 
000016ed l       .debug_str	00000000 
0000171d l       .debug_str	00000000 
00001724 l       .debug_str	00000000 
00001730 l       .debug_str	00000000 
00001735 l       .debug_str	00000000 
000017a7 l       .debug_str	00000000 
000017a9 l       .debug_str	00000000 
00001839 l       .debug_str	00000000 
000018d0 l       .debug_str	00000000 
000018d6 l       .debug_str	00000000 
000018df l       .debug_str	00000000 
000019f6 l       .debug_str	00000000 
00001b09 l       .debug_str	00000000 
00001c29 l       .debug_str	00000000 
00001d40 l       .debug_str	00000000 
00001e79 l       .debug_str	00000000 
00001fcf l       .debug_str	00000000 
00002124 l       .debug_str	00000000 
00002271 l       .debug_str	00000000 
000023a1 l       .debug_str	00000000 
000023ac l       .debug_str	00000000 
000023de l       .debug_str	00000000 
000023e5 l       .debug_str	00000000 
000023e9 l       .debug_str	00000000 
000023f1 l       .debug_str	00000000 
000023f8 l       .debug_str	00000000 
000023fc l       .debug_str	00000000 
00002405 l       .debug_str	00000000 
00002408 l       .debug_str	00000000 
0000240c l       .debug_str	00000000 
00002442 l       .debug_str	00000000 
00002485 l       .debug_str	00000000 
00002524 l       .debug_str	00000000 
00002562 l       .debug_str	00000000 
000025d0 l       .debug_str	00000000 
00002610 l       .debug_str	00000000 
000026ac l       .debug_str	00000000 
000026b1 l       .debug_str	00000000 
000026bb l       .debug_str	00000000 
0000275b l       .debug_str	00000000 
0000275d l       .debug_str	00000000 
000027c0 l       .debug_str	00000000 
0000288a l       .debug_str	00000000 
0000288f l       .debug_str	00000000 
00002925 l       .debug_str	00000000 
00002930 l       .debug_str	00000000 
00002939 l       .debug_str	00000000 
00002947 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.a6c74160edb9bc3e053c9528a4f1144a.0	00000005 .Lanon.a6c74160edb9bc3e053c9528a4f1144a.0
00000000 l     O .rodata..Lanon.a6c74160edb9bc3e053c9528a4f1144a.2	00000010 .Lanon.a6c74160edb9bc3e053c9528a4f1144a.2
00000000 l     O .rodata..Lanon.a6c74160edb9bc3e053c9528a4f1144a.3	00000010 .Lanon.a6c74160edb9bc3e053c9528a4f1144a.3
00000000 l     O .rodata.str.0	0000001c str.0
00000000 l    d  .text._ZN110_$LT$piet_embedded_graphics..batch..RowIterator$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he162a55efc657285E	00000000 .text._ZN110_$LT$piet_embedded_graphics..batch..RowIterator$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he162a55efc657285E
00000000 l    d  .text._ZN112_$LT$piet_embedded_graphics..batch..BlockIterator$LT$R$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h7487cc80c63ddfe1E	00000000 .text._ZN112_$LT$piet_embedded_graphics..batch..BlockIterator$LT$R$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h7487cc80c63ddfe1E
00000000 l    d  .text._ZN22piet_embedded_graphics5batch11draw_blocks17he86ca52a08b02bc8E	00000000 .text._ZN22piet_embedded_graphics5batch11draw_blocks17he86ca52a08b02bc8E
00000000 l    d  .text._ZN22piet_embedded_graphics5batch7to_rows17h120b92b06a517fdcE	00000000 .text._ZN22piet_embedded_graphics5batch7to_rows17h120b92b06a517fdcE
00000000 l    d  .text._ZN22piet_embedded_graphics5batch9to_blocks17hb57522f469edfebcE	00000000 .text._ZN22piet_embedded_graphics5batch9to_blocks17hb57522f469edfebcE
00000000 l    d  .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hf75d1d84330943f2E	00000000 .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hf75d1d84330943f2E
00000000 l    d  .rodata..Lanon.a6c74160edb9bc3e053c9528a4f1144a.1	00000000 .rodata..Lanon.a6c74160edb9bc3e053c9528a4f1144a.1
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 st7735_lcd::ST7735<SPI,DC,RST>::set_pixels
00000000 g     F .text._ZN110_$LT$piet_embedded_graphics..batch..RowIterator$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he162a55efc657285E	000002a6 <piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next
00000000 g     F .text._ZN112_$LT$piet_embedded_graphics..batch..BlockIterator$LT$R$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h7487cc80c63ddfe1E	000003a6 <piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next
00000000         *UND*	00000000 <embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter
00000000         *UND*	00000000 <embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next
00000000 g     F .text._ZN22piet_embedded_graphics5batch11draw_blocks17he86ca52a08b02bc8E	000001c2 piet_embedded_graphics::batch::draw_blocks
00000000 g     F .text._ZN22piet_embedded_graphics5batch7to_rows17h120b92b06a517fdcE	0000005e piet_embedded_graphics::batch::to_rows
00000000 g     F .text._ZN22piet_embedded_graphics5batch9to_blocks17hb57522f469edfebcE	00000050 piet_embedded_graphics::batch::to_blocks
00000000         *UND*	00000000 core::ptr::real_drop_in_place
00000000         *UND*	00000000 core::ptr::real_drop_in_place
00000000         *UND*	00000000 core::ptr::real_drop_in_place
00000000         *UND*	00000000 core::ptr::real_drop_in_place
00000000         *UND*	00000000 core::result::Result<T,E>::is_ok
00000000         *UND*	00000000 core::result::Result<T,E>::is_ok
00000000         *UND*	00000000 core::result::Result<T,E>::expect
00000000         *UND*	00000000 core::result::Result<T,E>::expect
00000000         *UND*	00000000 core::panicking::panic
00000000         *UND*	00000000 <T as core::convert::From<T>>::from
00000000 g     F .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hf75d1d84330943f2E	0000000c <I as core::iter::traits::collect::IntoIterator>::into_iter
00000000         *UND*	00000000 <heapless::vec::Vec<T,N> as core::clone::Clone>::clone
00000000         *UND*	00000000 <heapless::vec::Vec<T,N> as core::clone::Clone>::clone
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::from_error
00000000         *UND*	00000000 <core::result::Result<T,E> as core::ops::try::Try>::into_result
00000000         *UND*	00000000 <heapless::vec::Vec<T,N> as core::ops::deref::Deref>::deref
00000000         *UND*	00000000 heapless::vec::Vec<T,N>::extend_from_slice
00000000         *UND*	00000000 heapless::vec::Vec<T,N>::new
00000000         *UND*	00000000 heapless::vec::Vec<T,N>::new
00000000         *UND*	00000000 heapless::vec::Vec<T,N>::push
00000000         *UND*	00000000 heapless::vec::Vec<T,N>::clear
00000000         *UND*	00000000 heapless::vec::Vec<T,N>::clear
00000000         *UND*	00000000 __aeabi_memcpy4



Disassembly of section .text._ZN110_$LT$piet_embedded_graphics..batch..RowIterator$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he162a55efc657285E:

00000000 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next>:
_ZN110_$LT$piet_embedded_graphics..batch..RowIterator$LT$P$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he162a55efc657285E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:168
impl<P: Iterator<Item = Pixel<Rgb565>>> Iterator for RowIterator<P> {
    /// This Iterator returns Pixel Rows
    type Item = PixelRow;

    /// Return the next Pixel Row of contiguous pixels on the same row
    fn next(&mut self) -> Option<Self::Item> {
   0:	b580      	push	{r7, lr}
   2:	f5ad 7d44 	sub.w	sp, sp, #784	; 0x310
   6:	9115      	str	r1, [sp, #84]	; 0x54
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:170
        //  Loop over all pixels until we have composed a Pixel Row, or we have run out of pixels.
        loop {
   8:	9014      	str	r0, [sp, #80]	; 0x50
   a:	e7ff      	b.n	c <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0xc>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:172
            //  Get the next pixel.
            let next_pixel = self.pixels.next();
   c:	9915      	ldr	r1, [sp, #84]	; 0x54
   e:	a816      	add	r0, sp, #88	; 0x58
  10:	f7ff fffe 	bl	0 <<embedded_graphics::primitives::circle::CircleIterator<C> as core::iter::traits::iterator::Iterator>::next>
  14:	e7ff      	b.n	16 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x16>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:174
            match next_pixel {
                None => {  //  If no more pixels...
  16:	9816      	ldr	r0, [sp, #88]	; 0x58
  18:	2800      	cmp	r0, #0
  1a:	d002      	beq.n	22 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x22>
  1c:	e7ff      	b.n	1e <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1e>
  1e:	e04e      	b.n	be <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0xbe>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:173
            match next_pixel {
  20:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:175
                    if self.first_pixel {
  22:	9815      	ldr	r0, [sp, #84]	; 0x54
  24:	f890 008e 	ldrb.w	r0, [r0, #142]	; 0x8e
  28:	07c0      	lsls	r0, r0, #31
  2a:	2800      	cmp	r0, #0
  2c:	d115      	bne.n	5a <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x5a>
  2e:	e7ff      	b.n	30 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x30>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:180
                        return None;  //  No pixels to group
                    }                    
                    //  Else return previous pixels as row.
                    let row = PixelRow {
                        x_left: self.x_left,
  30:	9815      	ldr	r0, [sp, #84]	; 0x54
  32:	f8b0 1088 	ldrh.w	r1, [r0, #136]	; 0x88
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:181
                        x_right: self.x_right,
  36:	f8b0 208a 	ldrh.w	r2, [r0, #138]	; 0x8a
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:182
                        y: self.y,
  3a:	f8b0 308c 	ldrh.w	r3, [r0, #140]	; 0x8c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:183
                        colors: self.colors.clone(),
  3e:	3020      	adds	r0, #32
  40:	f10d 0cd8 	add.w	ip, sp, #216	; 0xd8
  44:	9013      	str	r0, [sp, #76]	; 0x4c
  46:	4660      	mov	r0, ip
  48:	f8dd c04c 	ldr.w	ip, [sp, #76]	; 0x4c
  4c:	9112      	str	r1, [sp, #72]	; 0x48
  4e:	4661      	mov	r1, ip
  50:	9211      	str	r2, [sp, #68]	; 0x44
  52:	9310      	str	r3, [sp, #64]	; 0x40
  54:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::clone::Clone>::clone>
  58:	e006      	b.n	68 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x68>
  5a:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:176
                        return None;  //  No pixels to group
  5c:	9914      	ldr	r1, [sp, #80]	; 0x50
  5e:	6008      	str	r0, [r1, #0]
  60:	e7ff      	b.n	62 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x62>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:229
                        .expect("never");
                    return Some(row);
                }
            }
        }
    }
  62:	f50d 7d44 	add.w	sp, sp, #784	; 0x310
  66:	bd80      	pop	{r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:179
                    let row = PixelRow {
  68:	9812      	ldr	r0, [sp, #72]	; 0x48
  6a:	f8ad 00d0 	strh.w	r0, [sp, #208]	; 0xd0
  6e:	9911      	ldr	r1, [sp, #68]	; 0x44
  70:	f8ad 10d2 	strh.w	r1, [sp, #210]	; 0xd2
  74:	9a10      	ldr	r2, [sp, #64]	; 0x40
  76:	f8ad 20d4 	strh.w	r2, [sp, #212]	; 0xd4
  7a:	a81a      	add	r0, sp, #104	; 0x68
  7c:	a936      	add	r1, sp, #216	; 0xd8
  7e:	2268      	movs	r2, #104	; 0x68
  80:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:185
                    self.colors.clear();
  84:	9815      	ldr	r0, [sp, #84]	; 0x54
  86:	3020      	adds	r0, #32
  88:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::clear>
  8c:	e7ff      	b.n	8e <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x8e>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:186
                    self.first_pixel = true;
  8e:	9815      	ldr	r0, [sp, #84]	; 0x54
  90:	2101      	movs	r1, #1
  92:	f880 108e 	strb.w	r1, [r0, #142]	; 0x8e
  96:	a850      	add	r0, sp, #320	; 0x140
  98:	aa1a      	add	r2, sp, #104	; 0x68
  9a:	2370      	movs	r3, #112	; 0x70
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:187
                    return Some(row);
  9c:	900f      	str	r0, [sp, #60]	; 0x3c
  9e:	910e      	str	r1, [sp, #56]	; 0x38
  a0:	4611      	mov	r1, r2
  a2:	461a      	mov	r2, r3
  a4:	930d      	str	r3, [sp, #52]	; 0x34
  a6:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  aa:	9814      	ldr	r0, [sp, #80]	; 0x50
  ac:	3004      	adds	r0, #4
  ae:	990f      	ldr	r1, [sp, #60]	; 0x3c
  b0:	9a0d      	ldr	r2, [sp, #52]	; 0x34
  b2:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  b6:	980e      	ldr	r0, [sp, #56]	; 0x38
  b8:	9914      	ldr	r1, [sp, #80]	; 0x50
  ba:	6008      	str	r0, [r1, #0]
  bc:	e7d1      	b.n	62 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x62>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:189
                Some(Pixel(coord, color)) => {  //  If there is a pixel...
  be:	9817      	ldr	r0, [sp, #92]	; 0x5c
  c0:	9918      	ldr	r1, [sp, #96]	; 0x60
  c2:	906c      	str	r0, [sp, #432]	; 0x1b0
  c4:	916d      	str	r1, [sp, #436]	; 0x1b4
  c6:	f8bd 0064 	ldrh.w	r0, [sp, #100]	; 0x64
  ca:	f8ad 01ba 	strh.w	r0, [sp, #442]	; 0x1ba
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:190
                    let x = coord.0 as u16;
  ce:	986c      	ldr	r0, [sp, #432]	; 0x1b0
  d0:	f8ad 01bc 	strh.w	r0, [sp, #444]	; 0x1bc
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:191
                    let y = coord.1 as u16;
  d4:	986d      	ldr	r0, [sp, #436]	; 0x1b4
  d6:	f8ad 01be 	strh.w	r0, [sp, #446]	; 0x1be
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:192
                    let color = color.0;
  da:	f8bd 01ba 	ldrh.w	r0, [sp, #442]	; 0x1ba
  de:	f8ad 01c0 	strh.w	r0, [sp, #448]	; 0x1c0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:194
                    if self.first_pixel {
  e2:	9815      	ldr	r0, [sp, #84]	; 0x54
  e4:	f890 008e 	ldrb.w	r0, [r0, #142]	; 0x8e
  e8:	07c0      	lsls	r0, r0, #31
  ea:	2800      	cmp	r0, #0
  ec:	d10e      	bne.n	10c <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x10c>
  ee:	e7ff      	b.n	f0 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0xf0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:205
                    if x == self.x_right + 1 && y == self.y {
  f0:	f8bd 01bc 	ldrh.w	r0, [sp, #444]	; 0x1bc
  f4:	9915      	ldr	r1, [sp, #84]	; 0x54
  f6:	f8b1 108a 	ldrh.w	r1, [r1, #138]	; 0x8a
  fa:	3101      	adds	r1, #1
  fc:	b28a      	uxth	r2, r1
  fe:	460b      	mov	r3, r1
 100:	428a      	cmp	r2, r1
 102:	900c      	str	r0, [sp, #48]	; 0x30
 104:	930b      	str	r3, [sp, #44]	; 0x2c
 106:	f040 80c2 	bne.w	28e <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x28e>
 10a:	e042      	b.n	192 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x192>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:195
                        self.first_pixel = false;
 10c:	9815      	ldr	r0, [sp, #84]	; 0x54
 10e:	2100      	movs	r1, #0
 110:	f880 108e 	strb.w	r1, [r0, #142]	; 0x8e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:196
                        self.x_left = x;
 114:	f8bd 01bc 	ldrh.w	r0, [sp, #444]	; 0x1bc
 118:	9915      	ldr	r1, [sp, #84]	; 0x54
 11a:	f8a1 0088 	strh.w	r0, [r1, #136]	; 0x88
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:197
                        self.x_right = x;
 11e:	f8bd 01bc 	ldrh.w	r0, [sp, #444]	; 0x1bc
 122:	9915      	ldr	r1, [sp, #84]	; 0x54
 124:	f8a1 008a 	strh.w	r0, [r1, #138]	; 0x8a
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:198
                        self.y = y;
 128:	f8bd 01be 	ldrh.w	r0, [sp, #446]	; 0x1be
 12c:	9915      	ldr	r1, [sp, #84]	; 0x54
 12e:	f8a1 008c 	strh.w	r0, [r1, #140]	; 0x8c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:199
                        self.colors.clear();
 132:	9815      	ldr	r0, [sp, #84]	; 0x54
 134:	3020      	adds	r0, #32
 136:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::clear>
 13a:	e7ff      	b.n	13c <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x13c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:200
                        self.colors.push(color)
 13c:	9815      	ldr	r0, [sp, #84]	; 0x54
 13e:	3020      	adds	r0, #32
 140:	f8bd 11c0 	ldrh.w	r1, [sp, #448]	; 0x1c0
 144:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::push>
 148:	900a      	str	r0, [sp, #40]	; 0x28
 14a:	9109      	str	r1, [sp, #36]	; 0x24
 14c:	e7ff      	b.n	14e <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x14e>
 14e:	f240 0200 	movw	r2, #0
 152:	f2c0 0200 	movt	r2, #0
 156:	2305      	movs	r3, #5
 158:	980a      	ldr	r0, [sp, #40]	; 0x28
 15a:	9909      	ldr	r1, [sp, #36]	; 0x24
 15c:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
 160:	e7ff      	b.n	162 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x162>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:202
                        continue;
 162:	e7ff      	b.n	164 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x164>
 164:	e752      	b.n	c <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0xc>
 166:	2001      	movs	r0, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:205
                    if x == self.x_right + 1 && y == self.y {
 168:	f88d 01c3 	strb.w	r0, [sp, #451]	; 0x1c3
 16c:	e00b      	b.n	186 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x186>
 16e:	2000      	movs	r0, #0
 170:	f88d 01c3 	strb.w	r0, [sp, #451]	; 0x1c3
 174:	e007      	b.n	186 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x186>
 176:	f8bd 01be 	ldrh.w	r0, [sp, #446]	; 0x1be
 17a:	9915      	ldr	r1, [sp, #84]	; 0x54
 17c:	f8b1 108c 	ldrh.w	r1, [r1, #140]	; 0x8c
 180:	4288      	cmp	r0, r1
 182:	d0f0      	beq.n	166 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x166>
 184:	e7f3      	b.n	16e <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x16e>
 186:	f89d 01c3 	ldrb.w	r0, [sp, #451]	; 0x1c3
 18a:	07c0      	lsls	r0, r0, #31
 18c:	2800      	cmp	r0, #0
 18e:	d107      	bne.n	1a0 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1a0>
 190:	e022      	b.n	1d8 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1d8>
 192:	980b      	ldr	r0, [sp, #44]	; 0x2c
 194:	b281      	uxth	r1, r0
 196:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 198:	b293      	uxth	r3, r2
 19a:	428b      	cmp	r3, r1
 19c:	d0eb      	beq.n	176 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x176>
 19e:	e7e6      	b.n	16e <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x16e>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:206
                        if self.colors.push(color).is_ok() {
 1a0:	9815      	ldr	r0, [sp, #84]	; 0x54
 1a2:	3020      	adds	r0, #32
 1a4:	f8bd 11c0 	ldrh.w	r1, [sp, #448]	; 0x1c0
 1a8:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::push>
 1ac:	f8ad 11c6 	strh.w	r1, [sp, #454]	; 0x1c6
 1b0:	f8ad 01c4 	strh.w	r0, [sp, #452]	; 0x1c4
 1b4:	e7ff      	b.n	1b6 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1b6>
 1b6:	a871      	add	r0, sp, #452	; 0x1c4
 1b8:	f7ff fffe 	bl	0 <core::result::Result<T,E>::is_ok>
 1bc:	9008      	str	r0, [sp, #32]
 1be:	e7ff      	b.n	1c0 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1c0>
 1c0:	9808      	ldr	r0, [sp, #32]
 1c2:	07c1      	lsls	r1, r0, #31
 1c4:	2900      	cmp	r1, #0
 1c6:	d101      	bne.n	1cc <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1cc>
 1c8:	e7ff      	b.n	1ca <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1ca>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:205
                    if x == self.x_right + 1 && y == self.y {
 1ca:	e005      	b.n	1d8 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x1d8>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:208
                            self.x_right = x;
 1cc:	f8bd 01bc 	ldrh.w	r0, [sp, #444]	; 0x1bc
 1d0:	9915      	ldr	r1, [sp, #84]	; 0x54
 1d2:	f8a1 008a 	strh.w	r0, [r1, #138]	; 0x8a
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:209
                            continue;
 1d6:	e7c5      	b.n	164 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x164>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:214
                        x_left: self.x_left,
 1d8:	9815      	ldr	r0, [sp, #84]	; 0x54
 1da:	f8b0 1088 	ldrh.w	r1, [r0, #136]	; 0x88
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:215
                        x_right: self.x_right,
 1de:	f8b0 208a 	ldrh.w	r2, [r0, #138]	; 0x8a
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:216
                        y: self.y,
 1e2:	f8b0 308c 	ldrh.w	r3, [r0, #140]	; 0x8c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:217
                        colors: self.colors.clone(),
 1e6:	3020      	adds	r0, #32
 1e8:	f50d 7c0e 	add.w	ip, sp, #568	; 0x238
 1ec:	9007      	str	r0, [sp, #28]
 1ee:	4660      	mov	r0, ip
 1f0:	f8dd c01c 	ldr.w	ip, [sp, #28]
 1f4:	9106      	str	r1, [sp, #24]
 1f6:	4661      	mov	r1, ip
 1f8:	9205      	str	r2, [sp, #20]
 1fa:	9304      	str	r3, [sp, #16]
 1fc:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::clone::Clone>::clone>
 200:	e7ff      	b.n	202 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x202>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:213
                    let row = PixelRow {
 202:	9806      	ldr	r0, [sp, #24]
 204:	f8ad 0230 	strh.w	r0, [sp, #560]	; 0x230
 208:	9905      	ldr	r1, [sp, #20]
 20a:	f8ad 1232 	strh.w	r1, [sp, #562]	; 0x232
 20e:	9a04      	ldr	r2, [sp, #16]
 210:	f8ad 2234 	strh.w	r2, [sp, #564]	; 0x234
 214:	a872      	add	r0, sp, #456	; 0x1c8
 216:	a98e      	add	r1, sp, #568	; 0x238
 218:	2268      	movs	r2, #104	; 0x68
 21a:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:219
                    self.x_left = x;
 21e:	f8bd 01bc 	ldrh.w	r0, [sp, #444]	; 0x1bc
 222:	9915      	ldr	r1, [sp, #84]	; 0x54
 224:	f8a1 0088 	strh.w	r0, [r1, #136]	; 0x88
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:220
                    self.x_right = x;
 228:	f8bd 01bc 	ldrh.w	r0, [sp, #444]	; 0x1bc
 22c:	9915      	ldr	r1, [sp, #84]	; 0x54
 22e:	f8a1 008a 	strh.w	r0, [r1, #138]	; 0x8a
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:221
                    self.y = y;
 232:	f8bd 01be 	ldrh.w	r0, [sp, #446]	; 0x1be
 236:	9915      	ldr	r1, [sp, #84]	; 0x54
 238:	f8a1 008c 	strh.w	r0, [r1, #140]	; 0x8c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:222
                    self.colors.clear();
 23c:	9815      	ldr	r0, [sp, #84]	; 0x54
 23e:	3020      	adds	r0, #32
 240:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::clear>
 244:	e7ff      	b.n	246 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x246>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:223
                    self.colors.push(color)
 246:	9815      	ldr	r0, [sp, #84]	; 0x54
 248:	3020      	adds	r0, #32
 24a:	f8bd 11c0 	ldrh.w	r1, [sp, #448]	; 0x1c0
 24e:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::push>
 252:	9003      	str	r0, [sp, #12]
 254:	9102      	str	r1, [sp, #8]
 256:	e7ff      	b.n	258 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x258>
 258:	f240 0200 	movw	r2, #0
 25c:	f2c0 0200 	movt	r2, #0
 260:	2305      	movs	r3, #5
 262:	9803      	ldr	r0, [sp, #12]
 264:	9902      	ldr	r1, [sp, #8]
 266:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
 26a:	e7ff      	b.n	26c <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x26c>
 26c:	a8a8      	add	r0, sp, #672	; 0x2a0
 26e:	a972      	add	r1, sp, #456	; 0x1c8
 270:	2270      	movs	r2, #112	; 0x70
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:225
                    return Some(row);
 272:	9001      	str	r0, [sp, #4]
 274:	9200      	str	r2, [sp, #0]
 276:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
 27a:	9814      	ldr	r0, [sp, #80]	; 0x50
 27c:	3004      	adds	r0, #4
 27e:	9901      	ldr	r1, [sp, #4]
 280:	9a00      	ldr	r2, [sp, #0]
 282:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
 286:	2001      	movs	r0, #1
 288:	9914      	ldr	r1, [sp, #80]	; 0x50
 28a:	6008      	str	r0, [r1, #0]
 28c:	e6e9      	b.n	62 <<piet_embedded_graphics::batch::RowIterator<P> as core::iter::traits::iterator::Iterator>::next+0x62>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:205
                    if x == self.x_right + 1 && y == self.y {
 28e:	f240 0000 	movw	r0, #0
 292:	f2c0 0000 	movt	r0, #0
 296:	f240 0200 	movw	r2, #0
 29a:	f2c0 0200 	movt	r2, #0
 29e:	211c      	movs	r1, #28
 2a0:	f7ff fffe 	bl	0 <core::panicking::panic>
 2a4:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN112_$LT$piet_embedded_graphics..batch..BlockIterator$LT$R$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h7487cc80c63ddfe1E:

00000000 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next>:
_ZN112_$LT$piet_embedded_graphics..batch..BlockIterator$LT$R$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h7487cc80c63ddfe1E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:239
impl<R: Iterator<Item = PixelRow>> Iterator for BlockIterator<R> {
    /// This Iterator returns Pixel Blocks
    type Item = PixelBlock;

    /// Return the next Pixel Block of contiguous Pixel Rows with the same start and end column number
    fn next(&mut self) -> Option<Self::Item> {
   0:	b580      	push	{r7, lr}
   2:	f5ad 6dca 	sub.w	sp, sp, #1616	; 0x650
   6:	911e      	str	r1, [sp, #120]	; 0x78
   8:	2100      	movs	r1, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:241
        //  Loop over all Pixel Rows until we have composed a Pixel Block, or we have run out of Pixel Rows.
        loop {
   a:	f88d 164f 	strb.w	r1, [sp, #1615]	; 0x64f
   e:	901d      	str	r0, [sp, #116]	; 0x74
  10:	e7ff      	b.n	12 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x12>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:243
            //  Get the next Pixel Row.
            let next_row = self.rows.next();
  12:	991e      	ldr	r1, [sp, #120]	; 0x78
  14:	2001      	movs	r0, #1
  16:	f88d 064f 	strb.w	r0, [sp, #1615]	; 0x64f
  1a:	a81f      	add	r0, sp, #124	; 0x7c
  1c:	f7ff fffe 	bl	0 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next>
  20:	e7ff      	b.n	22 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x22>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:245
            match next_row {
                None => {  //  If no more Pixel Rows...
  22:	981f      	ldr	r0, [sp, #124]	; 0x7c
  24:	2800      	cmp	r0, #0
  26:	d002      	beq.n	2e <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x2e>
  28:	e7ff      	b.n	2a <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x2a>
  2a:	e052      	b.n	d2 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0xd2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:244
            match next_row {
  2c:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:246
                    if self.first_row {
  2e:	981e      	ldr	r0, [sp, #120]	; 0x78
  30:	f890 0164 	ldrb.w	r0, [r0, #356]	; 0x164
  34:	07c0      	lsls	r0, r0, #31
  36:	2800      	cmp	r0, #0
  38:	d119      	bne.n	6e <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x6e>
  3a:	e7ff      	b.n	3c <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x3c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:251
                        return None;  //  No rows to group
                    }                    
                    //  Else return previous rows as block.
                    let row = PixelBlock {
                        x_left: self.x_left,
  3c:	981e      	ldr	r0, [sp, #120]	; 0x78
  3e:	f8b0 115c 	ldrh.w	r1, [r0, #348]	; 0x15c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:252
                        x_right: self.x_right,
  42:	f8b0 215e 	ldrh.w	r2, [r0, #350]	; 0x15e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:253
                        y_top: self.y_top,
  46:	f8b0 3160 	ldrh.w	r3, [r0, #352]	; 0x160
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:254
                        y_bottom: self.y_bottom,
  4a:	f8b0 c162 	ldrh.w	ip, [r0, #354]	; 0x162
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:255
                        colors: self.colors.clone(),
  4e:	3090      	adds	r0, #144	; 0x90
  50:	f50d 7ee2 	add.w	lr, sp, #452	; 0x1c4
  54:	901c      	str	r0, [sp, #112]	; 0x70
  56:	4670      	mov	r0, lr
  58:	f8dd e070 	ldr.w	lr, [sp, #112]	; 0x70
  5c:	911b      	str	r1, [sp, #108]	; 0x6c
  5e:	4671      	mov	r1, lr
  60:	921a      	str	r2, [sp, #104]	; 0x68
  62:	9319      	str	r3, [sp, #100]	; 0x64
  64:	f8cd c060 	str.w	ip, [sp, #96]	; 0x60
  68:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::clone::Clone>::clone>
  6c:	e003      	b.n	76 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x76>
  6e:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:247
                        return None;  //  No rows to group
  70:	991d      	ldr	r1, [sp, #116]	; 0x74
  72:	6008      	str	r0, [r1, #0]
  74:	e17f      	b.n	376 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x376>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:250
                    let row = PixelBlock {
  76:	981b      	ldr	r0, [sp, #108]	; 0x6c
  78:	f8ad 01bc 	strh.w	r0, [sp, #444]	; 0x1bc
  7c:	991a      	ldr	r1, [sp, #104]	; 0x68
  7e:	f8ad 11be 	strh.w	r1, [sp, #446]	; 0x1be
  82:	9a19      	ldr	r2, [sp, #100]	; 0x64
  84:	f8ad 21c0 	strh.w	r2, [sp, #448]	; 0x1c0
  88:	9b18      	ldr	r3, [sp, #96]	; 0x60
  8a:	f8ad 31c2 	strh.w	r3, [sp, #450]	; 0x1c2
  8e:	a83c      	add	r0, sp, #240	; 0xf0
  90:	a971      	add	r1, sp, #452	; 0x1c4
  92:	22cc      	movs	r2, #204	; 0xcc
  94:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:257
                    };
                    self.colors.clear();
  98:	981e      	ldr	r0, [sp, #120]	; 0x78
  9a:	3090      	adds	r0, #144	; 0x90
  9c:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::clear>
  a0:	e7ff      	b.n	a2 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0xa2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:258
                    self.first_row = true;
  a2:	981e      	ldr	r0, [sp, #120]	; 0x78
  a4:	2101      	movs	r1, #1
  a6:	f880 1164 	strb.w	r1, [r0, #356]	; 0x164
  aa:	a8a4      	add	r0, sp, #656	; 0x290
  ac:	aa3c      	add	r2, sp, #240	; 0xf0
  ae:	23d4      	movs	r3, #212	; 0xd4
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:259
                    return Some(row);
  b0:	9017      	str	r0, [sp, #92]	; 0x5c
  b2:	9116      	str	r1, [sp, #88]	; 0x58
  b4:	4611      	mov	r1, r2
  b6:	461a      	mov	r2, r3
  b8:	9315      	str	r3, [sp, #84]	; 0x54
  ba:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  be:	981d      	ldr	r0, [sp, #116]	; 0x74
  c0:	3004      	adds	r0, #4
  c2:	9917      	ldr	r1, [sp, #92]	; 0x5c
  c4:	9a15      	ldr	r2, [sp, #84]	; 0x54
  c6:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  ca:	9816      	ldr	r0, [sp, #88]	; 0x58
  cc:	991d      	ldr	r1, [sp, #116]	; 0x74
  ce:	6008      	str	r0, [r1, #0]
  d0:	e151      	b.n	376 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x376>
  d2:	a81f      	add	r0, sp, #124	; 0x7c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:261
                }
                Some(PixelRow { x_left, x_right, y, colors, .. }) => {  //  If there is a Pixel Row...
  d4:	1d01      	adds	r1, r0, #4
  d6:	f8bd 00e8 	ldrh.w	r0, [sp, #232]	; 0xe8
  da:	f8ad 0366 	strh.w	r0, [sp, #870]	; 0x366
  de:	f8bd 00ea 	ldrh.w	r0, [sp, #234]	; 0xea
  e2:	f8ad 0368 	strh.w	r0, [sp, #872]	; 0x368
  e6:	f8bd 00ec 	ldrh.w	r0, [sp, #236]	; 0xec
  ea:	f8ad 036a 	strh.w	r0, [sp, #874]	; 0x36a
  ee:	2000      	movs	r0, #0
  f0:	f88d 064f 	strb.w	r0, [sp, #1615]	; 0x64f
  f4:	a8db      	add	r0, sp, #876	; 0x36c
  f6:	2268      	movs	r2, #104	; 0x68
  f8:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:263
                    //  Save the first row as the block start and handle next block.
                    if self.first_row {
  fc:	981e      	ldr	r0, [sp, #120]	; 0x78
  fe:	f890 0164 	ldrb.w	r0, [r0, #356]	; 0x164
 102:	07c0      	lsls	r0, r0, #31
 104:	2800      	cmp	r0, #0
 106:	d10e      	bne.n	126 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x126>
 108:	e7ff      	b.n	10a <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x10a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:275
                        self.colors.extend_from_slice(&colors)
                            .expect("never");
                        continue;
                    }
                    //  If this row is adjacent to the previous row and same size, add to the block.
                    if y == self.y_bottom + 1 && x_left == self.x_left && x_right == self.x_right {                        
 10a:	f8bd 036a 	ldrh.w	r0, [sp, #874]	; 0x36a
 10e:	991e      	ldr	r1, [sp, #120]	; 0x78
 110:	f8b1 1162 	ldrh.w	r1, [r1, #354]	; 0x162
 114:	3101      	adds	r1, #1
 116:	b28a      	uxth	r2, r1
 118:	460b      	mov	r3, r1
 11a:	428a      	cmp	r2, r1
 11c:	9014      	str	r0, [sp, #80]	; 0x50
 11e:	9313      	str	r3, [sp, #76]	; 0x4c
 120:	f040 8135 	bne.w	38e <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x38e>
 124:	e06e      	b.n	204 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x204>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:264
                        self.first_row = false;
 126:	981e      	ldr	r0, [sp, #120]	; 0x78
 128:	2100      	movs	r1, #0
 12a:	f880 1164 	strb.w	r1, [r0, #356]	; 0x164
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:265
                        self.x_left = x_left;
 12e:	f8bd 0366 	ldrh.w	r0, [sp, #870]	; 0x366
 132:	991e      	ldr	r1, [sp, #120]	; 0x78
 134:	f8a1 015c 	strh.w	r0, [r1, #348]	; 0x15c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:266
                        self.x_right = x_right;
 138:	f8bd 0368 	ldrh.w	r0, [sp, #872]	; 0x368
 13c:	991e      	ldr	r1, [sp, #120]	; 0x78
 13e:	f8a1 015e 	strh.w	r0, [r1, #350]	; 0x15e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:267
                        self.y_top = y;
 142:	f8bd 036a 	ldrh.w	r0, [sp, #874]	; 0x36a
 146:	991e      	ldr	r1, [sp, #120]	; 0x78
 148:	f8a1 0160 	strh.w	r0, [r1, #352]	; 0x160
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:268
                        self.y_bottom = y;
 14c:	f8bd 036a 	ldrh.w	r0, [sp, #874]	; 0x36a
 150:	991e      	ldr	r1, [sp, #120]	; 0x78
 152:	f8a1 0162 	strh.w	r0, [r1, #354]	; 0x162
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:269
                        self.colors.clear();
 156:	981e      	ldr	r0, [sp, #120]	; 0x78
 158:	3090      	adds	r0, #144	; 0x90
 15a:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::clear>
 15e:	e7ff      	b.n	160 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x160>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:270
                        self.colors.extend_from_slice(&colors)
 160:	981e      	ldr	r0, [sp, #120]	; 0x78
 162:	3090      	adds	r0, #144	; 0x90
 164:	a9db      	add	r1, sp, #876	; 0x36c
 166:	9012      	str	r0, [sp, #72]	; 0x48
 168:	4608      	mov	r0, r1
 16a:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::ops::deref::Deref>::deref>
 16e:	9011      	str	r0, [sp, #68]	; 0x44
 170:	9110      	str	r1, [sp, #64]	; 0x40
 172:	e7ff      	b.n	174 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x174>
 174:	9812      	ldr	r0, [sp, #72]	; 0x48
 176:	9911      	ldr	r1, [sp, #68]	; 0x44
 178:	9a10      	ldr	r2, [sp, #64]	; 0x40
 17a:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::extend_from_slice>
 17e:	900f      	str	r0, [sp, #60]	; 0x3c
 180:	e7ff      	b.n	182 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x182>
 182:	980f      	ldr	r0, [sp, #60]	; 0x3c
 184:	f000 0001 	and.w	r0, r0, #1
 188:	f240 0100 	movw	r1, #0
 18c:	f2c0 0100 	movt	r1, #0
 190:	2205      	movs	r2, #5
 192:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
 196:	e7ff      	b.n	198 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x198>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:272
                        continue;
 198:	e7ff      	b.n	19a <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x19a>
 19a:	a8db      	add	r0, sp, #876	; 0x36c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:299
                    self.colors.clear();
                    self.colors.extend_from_slice(&colors)
                        .expect("never");
                    return Some(row);
                }
            }
 19c:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
 1a0:	e7ff      	b.n	1a2 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1a2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:300
        }
 1a2:	981f      	ldr	r0, [sp, #124]	; 0x7c
 1a4:	2801      	cmp	r0, #1
 1a6:	f000 80ea 	beq.w	37e <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x37e>
 1aa:	e0ec      	b.n	386 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x386>
 1ac:	2001      	movs	r0, #1
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:275
                    if y == self.y_bottom + 1 && x_left == self.x_left && x_right == self.x_right {                        
 1ae:	f88d 03d5 	strb.w	r0, [sp, #981]	; 0x3d5
 1b2:	e00b      	b.n	1cc <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1cc>
 1b4:	2000      	movs	r0, #0
 1b6:	f88d 03d5 	strb.w	r0, [sp, #981]	; 0x3d5
 1ba:	e007      	b.n	1cc <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1cc>
 1bc:	f8bd 0368 	ldrh.w	r0, [sp, #872]	; 0x368
 1c0:	991e      	ldr	r1, [sp, #120]	; 0x78
 1c2:	f8b1 115e 	ldrh.w	r1, [r1, #350]	; 0x15e
 1c6:	4288      	cmp	r0, r1
 1c8:	d0f0      	beq.n	1ac <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1ac>
 1ca:	e7f3      	b.n	1b4 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1b4>
 1cc:	f89d 03d5 	ldrb.w	r0, [sp, #981]	; 0x3d5
 1d0:	07c0      	lsls	r0, r0, #31
 1d2:	2800      	cmp	r0, #0
 1d4:	d11d      	bne.n	212 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x212>
 1d6:	e040      	b.n	25a <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x25a>
 1d8:	2001      	movs	r0, #1
 1da:	f88d 03d6 	strb.w	r0, [sp, #982]	; 0x3d6
 1de:	e00b      	b.n	1f8 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1f8>
 1e0:	2000      	movs	r0, #0
 1e2:	f88d 03d6 	strb.w	r0, [sp, #982]	; 0x3d6
 1e6:	e007      	b.n	1f8 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1f8>
 1e8:	f8bd 0366 	ldrh.w	r0, [sp, #870]	; 0x366
 1ec:	991e      	ldr	r1, [sp, #120]	; 0x78
 1ee:	f8b1 115c 	ldrh.w	r1, [r1, #348]	; 0x15c
 1f2:	4288      	cmp	r0, r1
 1f4:	d0f0      	beq.n	1d8 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1d8>
 1f6:	e7f3      	b.n	1e0 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1e0>
 1f8:	f89d 03d6 	ldrb.w	r0, [sp, #982]	; 0x3d6
 1fc:	07c0      	lsls	r0, r0, #31
 1fe:	2800      	cmp	r0, #0
 200:	d1dc      	bne.n	1bc <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1bc>
 202:	e7d7      	b.n	1b4 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1b4>
 204:	9813      	ldr	r0, [sp, #76]	; 0x4c
 206:	b281      	uxth	r1, r0
 208:	9a14      	ldr	r2, [sp, #80]	; 0x50
 20a:	b293      	uxth	r3, r2
 20c:	428b      	cmp	r3, r1
 20e:	d0eb      	beq.n	1e8 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1e8>
 210:	e7e6      	b.n	1e0 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x1e0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:277
                        if self.colors.extend_from_slice(&colors).is_ok() {
 212:	981e      	ldr	r0, [sp, #120]	; 0x78
 214:	3090      	adds	r0, #144	; 0x90
 216:	a9db      	add	r1, sp, #876	; 0x36c
 218:	900e      	str	r0, [sp, #56]	; 0x38
 21a:	4608      	mov	r0, r1
 21c:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::ops::deref::Deref>::deref>
 220:	900d      	str	r0, [sp, #52]	; 0x34
 222:	910c      	str	r1, [sp, #48]	; 0x30
 224:	e7ff      	b.n	226 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x226>
 226:	980e      	ldr	r0, [sp, #56]	; 0x38
 228:	990d      	ldr	r1, [sp, #52]	; 0x34
 22a:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 22c:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::extend_from_slice>
 230:	f88d 03d7 	strb.w	r0, [sp, #983]	; 0x3d7
 234:	e7ff      	b.n	236 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x236>
 236:	f20d 30d7 	addw	r0, sp, #983	; 0x3d7
 23a:	f7ff fffe 	bl	0 <core::result::Result<T,E>::is_ok>
 23e:	900b      	str	r0, [sp, #44]	; 0x2c
 240:	e7ff      	b.n	242 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x242>
 242:	980b      	ldr	r0, [sp, #44]	; 0x2c
 244:	07c1      	lsls	r1, r0, #31
 246:	2900      	cmp	r1, #0
 248:	d101      	bne.n	24e <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x24e>
 24a:	e7ff      	b.n	24c <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x24c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:275
                    if y == self.y_bottom + 1 && x_left == self.x_left && x_right == self.x_right {                        
 24c:	e005      	b.n	25a <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x25a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:278
                            self.y_bottom = y;
 24e:	f8bd 036a 	ldrh.w	r0, [sp, #874]	; 0x36a
 252:	991e      	ldr	r1, [sp, #120]	; 0x78
 254:	f8a1 0162 	strh.w	r0, [r1, #354]	; 0x162
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:279
                            continue;    
 258:	e79f      	b.n	19a <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x19a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:284
                        x_left: self.x_left,
 25a:	981e      	ldr	r0, [sp, #120]	; 0x78
 25c:	f8b0 115c 	ldrh.w	r1, [r0, #348]	; 0x15c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:285
                        x_right: self.x_right,
 260:	f8b0 215e 	ldrh.w	r2, [r0, #350]	; 0x15e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:286
                        y_top: self.y_top,
 264:	f8b0 3160 	ldrh.w	r3, [r0, #352]	; 0x160
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:287
                        y_bottom: self.y_bottom,
 268:	f8b0 c162 	ldrh.w	ip, [r0, #354]	; 0x162
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:288
                        colors: self.colors.clone(),
 26c:	3090      	adds	r0, #144	; 0x90
 26e:	f20d 4eac 	addw	lr, sp, #1196	; 0x4ac
 272:	900a      	str	r0, [sp, #40]	; 0x28
 274:	4670      	mov	r0, lr
 276:	f8dd e028 	ldr.w	lr, [sp, #40]	; 0x28
 27a:	9109      	str	r1, [sp, #36]	; 0x24
 27c:	4671      	mov	r1, lr
 27e:	9208      	str	r2, [sp, #32]
 280:	9307      	str	r3, [sp, #28]
 282:	f8cd c018 	str.w	ip, [sp, #24]
 286:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::clone::Clone>::clone>
 28a:	e7ff      	b.n	28c <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x28c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:283
                    let row = PixelBlock {
 28c:	9809      	ldr	r0, [sp, #36]	; 0x24
 28e:	f8ad 04a4 	strh.w	r0, [sp, #1188]	; 0x4a4
 292:	9908      	ldr	r1, [sp, #32]
 294:	f8ad 14a6 	strh.w	r1, [sp, #1190]	; 0x4a6
 298:	9a07      	ldr	r2, [sp, #28]
 29a:	f8ad 24a8 	strh.w	r2, [sp, #1192]	; 0x4a8
 29e:	9b06      	ldr	r3, [sp, #24]
 2a0:	f8ad 34aa 	strh.w	r3, [sp, #1194]	; 0x4aa
 2a4:	a8f6      	add	r0, sp, #984	; 0x3d8
 2a6:	f20d 41ac 	addw	r1, sp, #1196	; 0x4ac
 2aa:	22cc      	movs	r2, #204	; 0xcc
 2ac:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:290
                    self.x_left = x_left;
 2b0:	f8bd 0366 	ldrh.w	r0, [sp, #870]	; 0x366
 2b4:	991e      	ldr	r1, [sp, #120]	; 0x78
 2b6:	f8a1 015c 	strh.w	r0, [r1, #348]	; 0x15c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:291
                    self.x_right = x_right;
 2ba:	f8bd 0368 	ldrh.w	r0, [sp, #872]	; 0x368
 2be:	991e      	ldr	r1, [sp, #120]	; 0x78
 2c0:	f8a1 015e 	strh.w	r0, [r1, #350]	; 0x15e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:292
                    self.y_top = y;
 2c4:	f8bd 036a 	ldrh.w	r0, [sp, #874]	; 0x36a
 2c8:	991e      	ldr	r1, [sp, #120]	; 0x78
 2ca:	f8a1 0160 	strh.w	r0, [r1, #352]	; 0x160
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:293
                    self.y_bottom = y;
 2ce:	f8bd 036a 	ldrh.w	r0, [sp, #874]	; 0x36a
 2d2:	991e      	ldr	r1, [sp, #120]	; 0x78
 2d4:	f8a1 0162 	strh.w	r0, [r1, #354]	; 0x162
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:294
                    self.colors.clear();
 2d8:	981e      	ldr	r0, [sp, #120]	; 0x78
 2da:	3090      	adds	r0, #144	; 0x90
 2dc:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::clear>
 2e0:	e7ff      	b.n	2e2 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x2e2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:295
                    self.colors.extend_from_slice(&colors)
 2e2:	981e      	ldr	r0, [sp, #120]	; 0x78
 2e4:	3090      	adds	r0, #144	; 0x90
 2e6:	a9db      	add	r1, sp, #876	; 0x36c
 2e8:	9005      	str	r0, [sp, #20]
 2ea:	4608      	mov	r0, r1
 2ec:	f7ff fffe 	bl	0 <<heapless::vec::Vec<T,N> as core::ops::deref::Deref>::deref>
 2f0:	9004      	str	r0, [sp, #16]
 2f2:	9103      	str	r1, [sp, #12]
 2f4:	e7ff      	b.n	2f6 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x2f6>
 2f6:	9805      	ldr	r0, [sp, #20]
 2f8:	9904      	ldr	r1, [sp, #16]
 2fa:	9a03      	ldr	r2, [sp, #12]
 2fc:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::extend_from_slice>
 300:	9002      	str	r0, [sp, #8]
 302:	e7ff      	b.n	304 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x304>
 304:	9802      	ldr	r0, [sp, #8]
 306:	f000 0001 	and.w	r0, r0, #1
 30a:	f240 0100 	movw	r1, #0
 30e:	f2c0 0100 	movt	r1, #0
 312:	2205      	movs	r2, #5
 314:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
 318:	e7ff      	b.n	31a <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x31a>
 31a:	f50d 60af 	add.w	r0, sp, #1400	; 0x578
 31e:	a9f6      	add	r1, sp, #984	; 0x3d8
 320:	22d4      	movs	r2, #212	; 0xd4
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:297
                    return Some(row);
 322:	9001      	str	r0, [sp, #4]
 324:	9200      	str	r2, [sp, #0]
 326:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
 32a:	981d      	ldr	r0, [sp, #116]	; 0x74
 32c:	3004      	adds	r0, #4
 32e:	9901      	ldr	r1, [sp, #4]
 330:	9a00      	ldr	r2, [sp, #0]
 332:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
 336:	2001      	movs	r0, #1
 338:	991d      	ldr	r1, [sp, #116]	; 0x74
 33a:	6008      	str	r0, [r1, #0]
 33c:	a8db      	add	r0, sp, #876	; 0x36c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:299
            }
 33e:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
 342:	e7ff      	b.n	344 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x344>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:297
                    return Some(row);
 344:	e017      	b.n	376 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x376>
 346:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:300
        }
 348:	f88d 064f 	strb.w	r0, [sp, #1615]	; 0x64f
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:301
    }
 34c:	f50d 6dca 	add.w	sp, sp, #1616	; 0x650
 350:	bd80      	pop	{r7, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:300
        }
 352:	f89d 064f 	ldrb.w	r0, [sp, #1615]	; 0x64f
 356:	07c0      	lsls	r0, r0, #31
 358:	2800      	cmp	r0, #0
 35a:	d0f4      	beq.n	346 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x346>
 35c:	e7ff      	b.n	35e <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x35e>
 35e:	2000      	movs	r0, #0
 360:	f88d 064f 	strb.w	r0, [sp, #1615]	; 0x64f
 364:	a81f      	add	r0, sp, #124	; 0x7c
 366:	3004      	adds	r0, #4
 368:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
 36c:	e7eb      	b.n	346 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x346>
 36e:	a81f      	add	r0, sp, #124	; 0x7c
 370:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
 374:	e7e7      	b.n	346 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x346>
 376:	981f      	ldr	r0, [sp, #124]	; 0x7c
 378:	2801      	cmp	r0, #1
 37a:	d0ea      	beq.n	352 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x352>
 37c:	e7f7      	b.n	36e <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x36e>
 37e:	2000      	movs	r0, #0
 380:	f88d 064f 	strb.w	r0, [sp, #1615]	; 0x64f
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:272
                        continue;
 384:	e645      	b.n	12 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0x12>
 386:	a81f      	add	r0, sp, #124	; 0x7c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:300
        }
 388:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
 38c:	e7f7      	b.n	fffffff2 <<piet_embedded_graphics::batch::BlockIterator<R> as core::iter::traits::iterator::Iterator>::next+0xfffffff2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:275
                    if y == self.y_bottom + 1 && x_left == self.x_left && x_right == self.x_right {                        
 38e:	f240 0000 	movw	r0, #0
 392:	f2c0 0000 	movt	r0, #0
 396:	f240 0200 	movw	r2, #0
 39a:	f2c0 0200 	movt	r2, #0
 39e:	211c      	movs	r1, #28
 3a0:	f7ff fffe 	bl	0 <core::panicking::panic>
 3a4:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN22piet_embedded_graphics5batch11draw_blocks17he86ca52a08b02bc8E:

00000000 <piet_embedded_graphics::batch::draw_blocks>:
_ZN22piet_embedded_graphics5batch11draw_blocks17he86ca52a08b02bc8E():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:99
pub fn draw_blocks<SPI, DC, RST, T>(display: &mut ST7735<SPI, DC, RST>, item_pixels: T) -> Result<(),()>
   0:	b570      	push	{r4, r5, r6, lr}
   2:	f5ad 6d46 	sub.w	sp, sp, #3168	; 0xc60
   6:	9010      	str	r0, [sp, #64]	; 0x40
   8:	a81a      	add	r0, sp, #104	; 0x68
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:106
    let pixels = item_pixels.into_iter();
   a:	4602      	mov	r2, r0
   c:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
  10:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
  14:	a912      	add	r1, sp, #72	; 0x48
  16:	900f      	str	r0, [sp, #60]	; 0x3c
  18:	4608      	mov	r0, r1
  1a:	990f      	ldr	r1, [sp, #60]	; 0x3c
  1c:	f7ff fffe 	bl	0 <<embedded_graphics::primitives::circle::Circle<C> as core::iter::traits::collect::IntoIterator>::into_iter>
  20:	e7ff      	b.n	22 <piet_embedded_graphics::batch::draw_blocks+0x22>
  22:	a812      	add	r0, sp, #72	; 0x48
  24:	a944      	add	r1, sp, #272	; 0x110
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:108
    let rows = to_rows(pixels);
  26:	460a      	mov	r2, r1
  28:	e8b0 5018 	ldmia.w	r0!, {r3, r4, ip, lr}
  2c:	e8a2 5018 	stmia.w	r2!, {r3, r4, ip, lr}
  30:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
  34:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
  38:	a820      	add	r0, sp, #128	; 0x80
  3a:	f7ff fffe 	bl	0 <piet_embedded_graphics::batch::draw_blocks>
  3e:	e7ff      	b.n	40 <piet_embedded_graphics::batch::draw_blocks+0x40>
  40:	a8a6      	add	r0, sp, #664	; 0x298
  42:	a920      	add	r1, sp, #128	; 0x80
  44:	2290      	movs	r2, #144	; 0x90
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:110
    let blocks = to_blocks(rows);
  46:	900e      	str	r0, [sp, #56]	; 0x38
  48:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  4c:	a84c      	add	r0, sp, #304	; 0x130
  4e:	990e      	ldr	r1, [sp, #56]	; 0x38
  50:	f7ff fffe 	bl	0 <piet_embedded_graphics::batch::draw_blocks>
  54:	e7ff      	b.n	56 <piet_embedded_graphics::batch::draw_blocks+0x56>
  56:	f50d 6092 	add.w	r0, sp, #1168	; 0x490
  5a:	a94c      	add	r1, sp, #304	; 0x130
  5c:	f44f 72b4 	mov.w	r2, #360	; 0x168
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:112
    for PixelBlock { x_left, x_right, y_top, y_bottom, colors, .. } in blocks {
  60:	900d      	str	r0, [sp, #52]	; 0x34
  62:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  66:	a8ca      	add	r0, sp, #808	; 0x328
  68:	990d      	ldr	r1, [sp, #52]	; 0x34
  6a:	f7ff fffe 	bl	0 <piet_embedded_graphics::batch::draw_blocks>
  6e:	e7ff      	b.n	70 <piet_embedded_graphics::batch::draw_blocks+0x70>
  70:	f50d 60bf 	add.w	r0, sp, #1528	; 0x5f8
  74:	a9ca      	add	r1, sp, #808	; 0x328
  76:	f44f 72b4 	mov.w	r2, #360	; 0x168
  7a:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  7e:	e7ff      	b.n	80 <piet_embedded_graphics::batch::draw_blocks+0x80>
  80:	f60d 0034 	addw	r0, sp, #2100	; 0x834
  84:	f50d 61bf 	add.w	r1, sp, #1528	; 0x5f8
  88:	f7ff fffe 	bl	0 <piet_embedded_graphics::batch::draw_blocks>
  8c:	e7ff      	b.n	8e <piet_embedded_graphics::batch::draw_blocks+0x8e>
  8e:	f8dd 0834 	ldr.w	r0, [sp, #2100]	; 0x834
  92:	2800      	cmp	r0, #0
  94:	d001      	beq.n	9a <piet_embedded_graphics::batch::draw_blocks+0x9a>
  96:	e7ff      	b.n	98 <piet_embedded_graphics::batch::draw_blocks+0x98>
  98:	e005      	b.n	a6 <piet_embedded_graphics::batch::draw_blocks+0xa6>
  9a:	f60d 0034 	addw	r0, sp, #2100	; 0x834
  9e:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
  a2:	e01c      	b.n	de <piet_embedded_graphics::batch::draw_blocks+0xde>
  a4:	defe      	udf	#254	; 0xfe
  a6:	f60d 0034 	addw	r0, sp, #2100	; 0x834
  aa:	1d01      	adds	r1, r0, #4
  ac:	f60d 100c 	addw	r0, sp, #2316	; 0x90c
  b0:	22d4      	movs	r2, #212	; 0xd4
  b2:	900c      	str	r0, [sp, #48]	; 0x30
  b4:	920b      	str	r2, [sp, #44]	; 0x2c
  b6:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  ba:	f50d 601e 	add.w	r0, sp, #2528	; 0x9e0
  be:	900a      	str	r0, [sp, #40]	; 0x28
  c0:	990c      	ldr	r1, [sp, #48]	; 0x30
  c2:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
  c4:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  c8:	f50d 60ec 	add.w	r0, sp, #1888	; 0x760
  cc:	990a      	ldr	r1, [sp, #40]	; 0x28
  ce:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
  d0:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  d4:	f8dd 0834 	ldr.w	r0, [sp, #2100]	; 0x834
  d8:	2801      	cmp	r0, #1
  da:	d02c      	beq.n	136 <piet_embedded_graphics::batch::draw_blocks+0x136>
  dc:	e06c      	b.n	1b8 <piet_embedded_graphics::batch::draw_blocks+0x1b8>
  de:	f50d 60bf 	add.w	r0, sp, #1528	; 0x5f8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:126
    }
  e2:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
  e6:	e022      	b.n	12e <piet_embedded_graphics::batch::draw_blocks+0x12e>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:114
        display.set_pixels(
  e8:	f89d 0b8b 	ldrb.w	r0, [sp, #2955]	; 0xb8b
  ec:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::into_result>
  f0:	f88d 0b8a 	strb.w	r0, [sp, #2954]	; 0xb8a
  f4:	e7ff      	b.n	f6 <piet_embedded_graphics::batch::draw_blocks+0xf6>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:119
            colors) ? ;
  f6:	f89d 0b8a 	ldrb.w	r0, [sp, #2954]	; 0xb8a
  fa:	07c1      	lsls	r1, r0, #31
  fc:	2900      	cmp	r1, #0
  fe:	d015      	beq.n	12c <piet_embedded_graphics::batch::draw_blocks+0x12c>
 100:	e7ff      	b.n	102 <piet_embedded_graphics::batch::draw_blocks+0x102>
 102:	e000      	b.n	106 <piet_embedded_graphics::batch::draw_blocks+0x106>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:114
        display.set_pixels(
 104:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:119
            colors) ? ;
 106:	f7ff fffe 	bl	0 <<T as core::convert::From<T>>::from>
 10a:	e004      	b.n	116 <piet_embedded_graphics::batch::draw_blocks+0x116>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:128
}
 10c:	f89d 0047 	ldrb.w	r0, [sp, #71]	; 0x47
 110:	f50d 6d46 	add.w	sp, sp, #3168	; 0xc60
 114:	bd70      	pop	{r4, r5, r6, pc}
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:119
            colors) ? ;
 116:	f7ff fffe 	bl	0 <<core::result::Result<T,E> as core::ops::try::Try>::from_error>
 11a:	f88d 0047 	strb.w	r0, [sp, #71]	; 0x47
 11e:	e7ff      	b.n	120 <piet_embedded_graphics::batch::draw_blocks+0x120>
 120:	f50d 60bf 	add.w	r0, sp, #1528	; 0x5f8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:126
    }
 124:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
 128:	e7ff      	b.n	12a <piet_embedded_graphics::batch::draw_blocks+0x12a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:128
}
 12a:	e7ef      	b.n	10c <piet_embedded_graphics::batch::draw_blocks+0x10c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:112
    for PixelBlock { x_left, x_right, y_top, y_bottom, colors, .. } in blocks {
 12c:	e7a8      	b.n	80 <piet_embedded_graphics::batch::draw_blocks+0x80>
 12e:	2000      	movs	r0, #0
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:127
    Ok(())
 130:	f88d 0047 	strb.w	r0, [sp, #71]	; 0x47
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:128
}
 134:	e7ea      	b.n	10c <piet_embedded_graphics::batch::draw_blocks+0x10c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:112
    for PixelBlock { x_left, x_right, y_top, y_bottom, colors, .. } in blocks {
 136:	f8bd 082c 	ldrh.w	r0, [sp, #2092]	; 0x82c
 13a:	f8ad 0ab4 	strh.w	r0, [sp, #2740]	; 0xab4
 13e:	f8bd 082e 	ldrh.w	r0, [sp, #2094]	; 0x82e
 142:	f8ad 0ab6 	strh.w	r0, [sp, #2742]	; 0xab6
 146:	f8bd 0830 	ldrh.w	r0, [sp, #2096]	; 0x830
 14a:	f8ad 0ab8 	strh.w	r0, [sp, #2744]	; 0xab8
 14e:	f8bd 0832 	ldrh.w	r0, [sp, #2098]	; 0x832
 152:	f8ad 0aba 	strh.w	r0, [sp, #2746]	; 0xaba
 156:	f60d 20bc 	addw	r0, sp, #2748	; 0xabc
 15a:	f50d 61ec 	add.w	r1, sp, #1888	; 0x760
 15e:	22cc      	movs	r2, #204	; 0xcc
 160:	9009      	str	r0, [sp, #36]	; 0x24
 162:	9208      	str	r2, [sp, #32]
 164:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:114
        display.set_pixels(
 168:	9810      	ldr	r0, [sp, #64]	; 0x40
 16a:	f8bd 3ab6 	ldrh.w	r3, [sp, #2742]	; 0xab6
 16e:	f8bd 2ab8 	ldrh.w	r2, [sp, #2744]	; 0xab8
 172:	f8bd 1ab4 	ldrh.w	r1, [sp, #2740]	; 0xab4
 176:	f8bd caba 	ldrh.w	ip, [sp, #2746]	; 0xaba
 17a:	f60d 3e8c 	addw	lr, sp, #2956	; 0xb8c
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:119
            colors) ? ;
 17e:	9007      	str	r0, [sp, #28]
 180:	4670      	mov	r0, lr
 182:	9c09      	ldr	r4, [sp, #36]	; 0x24
 184:	9106      	str	r1, [sp, #24]
 186:	4621      	mov	r1, r4
 188:	9d08      	ldr	r5, [sp, #32]
 18a:	9205      	str	r2, [sp, #20]
 18c:	462a      	mov	r2, r5
 18e:	9304      	str	r3, [sp, #16]
 190:	f8cd c00c 	str.w	ip, [sp, #12]
 194:	f8cd e008 	str.w	lr, [sp, #8]
 198:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:114
        display.set_pixels(
 19c:	4668      	mov	r0, sp
 19e:	9902      	ldr	r1, [sp, #8]
 1a0:	6041      	str	r1, [r0, #4]
 1a2:	9a03      	ldr	r2, [sp, #12]
 1a4:	6002      	str	r2, [r0, #0]
 1a6:	9807      	ldr	r0, [sp, #28]
 1a8:	9906      	ldr	r1, [sp, #24]
 1aa:	9a05      	ldr	r2, [sp, #20]
 1ac:	9b04      	ldr	r3, [sp, #16]
 1ae:	f7ff fffe 	bl	0 <st7735_lcd::ST7735<SPI,DC,RST>::set_pixels>
 1b2:	f88d 0b8b 	strb.w	r0, [sp, #2955]	; 0xb8b
 1b6:	e797      	b.n	e8 <piet_embedded_graphics::batch::draw_blocks+0xe8>
 1b8:	f60d 0034 	addw	r0, sp, #2100	; 0x834
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:112
    for PixelBlock { x_left, x_right, y_top, y_bottom, colors, .. } in blocks {
 1bc:	f7ff fffe 	bl	0 <core::ptr::real_drop_in_place>
 1c0:	e7b9      	b.n	136 <piet_embedded_graphics::batch::draw_blocks+0x136>

Disassembly of section .text._ZN22piet_embedded_graphics5batch7to_rows17h120b92b06a517fdcE:

00000000 <piet_embedded_graphics::batch::to_rows>:
_ZN22piet_embedded_graphics5batch7to_rows17h120b92b06a517fdcE():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:132
fn to_rows<P>(pixels: P) -> RowIterator<P>
   0:	b510      	push	{r4, lr}
   2:	b0a4      	sub	sp, #144	; 0x90
   4:	aa02      	add	r2, sp, #8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:136
        pixels,
   6:	e8b1 5018 	ldmia.w	r1!, {r3, r4, ip, lr}
   a:	e8a2 5018 	stmia.w	r2!, {r3, r4, ip, lr}
   e:	e891 5018 	ldmia.w	r1, {r3, r4, ip, lr}
  12:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
  16:	a90a      	add	r1, sp, #40	; 0x28
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:140
        colors: RowColors::new(),
  18:	9001      	str	r0, [sp, #4]
  1a:	4608      	mov	r0, r1
  1c:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::new>
  20:	e7ff      	b.n	22 <piet_embedded_graphics::batch::to_rows+0x22>
  22:	a802      	add	r0, sp, #8
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:135
    RowIterator::<P> {
  24:	9901      	ldr	r1, [sp, #4]
  26:	e8b0 500c 	ldmia.w	r0!, {r2, r3, ip, lr}
  2a:	e8a1 500c 	stmia.w	r1!, {r2, r3, ip, lr}
  2e:	e890 500c 	ldmia.w	r0, {r2, r3, ip, lr}
  32:	e881 500c 	stmia.w	r1, {r2, r3, ip, lr}
  36:	2000      	movs	r0, #0
  38:	9901      	ldr	r1, [sp, #4]
  3a:	f8a1 0088 	strh.w	r0, [r1, #136]	; 0x88
  3e:	f8a1 008a 	strh.w	r0, [r1, #138]	; 0x8a
  42:	f8a1 008c 	strh.w	r0, [r1, #140]	; 0x8c
  46:	f101 0020 	add.w	r0, r1, #32
  4a:	a90a      	add	r1, sp, #40	; 0x28
  4c:	2268      	movs	r2, #104	; 0x68
  4e:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  52:	2001      	movs	r0, #1
  54:	9901      	ldr	r1, [sp, #4]
  56:	f881 008e 	strb.w	r0, [r1, #142]	; 0x8e
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:143
}
  5a:	b024      	add	sp, #144	; 0x90
  5c:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN22piet_embedded_graphics5batch9to_blocks17hb57522f469edfebcE:

00000000 <piet_embedded_graphics::batch::to_blocks>:
_ZN22piet_embedded_graphics5batch9to_blocks17hb57522f469edfebcE():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:147
fn to_blocks<R>(rows: R) -> BlockIterator<R>
   0:	b580      	push	{r7, lr}
   2:	b0d8      	sub	sp, #352	; 0x160
   4:	aa01      	add	r2, sp, #4
   6:	2390      	movs	r3, #144	; 0x90
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:151
        rows,
   8:	9000      	str	r0, [sp, #0]
   a:	4610      	mov	r0, r2
   c:	461a      	mov	r2, r3
   e:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  12:	a825      	add	r0, sp, #148	; 0x94
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:156
        colors: BlockColors::new(),
  14:	f7ff fffe 	bl	0 <heapless::vec::Vec<T,N>::new>
  18:	e7ff      	b.n	1a <piet_embedded_graphics::batch::to_blocks+0x1a>
  1a:	a901      	add	r1, sp, #4
  1c:	2290      	movs	r2, #144	; 0x90
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:150
    BlockIterator::<R> {
  1e:	9800      	ldr	r0, [sp, #0]
  20:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  24:	2000      	movs	r0, #0
  26:	9900      	ldr	r1, [sp, #0]
  28:	f8a1 015c 	strh.w	r0, [r1, #348]	; 0x15c
  2c:	f8a1 015e 	strh.w	r0, [r1, #350]	; 0x15e
  30:	f8a1 0160 	strh.w	r0, [r1, #352]	; 0x160
  34:	f8a1 0162 	strh.w	r0, [r1, #354]	; 0x162
  38:	f101 0090 	add.w	r0, r1, #144	; 0x90
  3c:	a925      	add	r1, sp, #148	; 0x94
  3e:	22cc      	movs	r2, #204	; 0xcc
  40:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
  44:	2001      	movs	r0, #1
  46:	9900      	ldr	r1, [sp, #0]
  48:	f881 0164 	strb.w	r0, [r1, #356]	; 0x164
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/piet-embedded/piet-embedded-graphics/src/batch.rs:159
}    
  4c:	b058      	add	sp, #352	; 0x160
  4e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hf75d1d84330943f2E:

00000000 <<I as core::iter::traits::collect::IntoIterator>::into_iter>:
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hf75d1d84330943f2E():
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/iter/traits/collect.rs:247
   0:	b580      	push	{r7, lr}
   2:	f44f 72b4 	mov.w	r2, #360	; 0x168
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/iter/traits/collect.rs:248
   6:	f7ff fffe 	bl	0 <__aeabi_memcpy4>
/rustc/412f43ac5b4ae8c3599e71c6972112e9be4758fa/src/libcore/iter/traits/collect.rs:249
   a:	bd80      	pop	{r7, pc}

app-1da0d8acf4e589c0.y5rr8cvos2qf8lx.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 y5rr8cvos2qf8lx
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
00000000         *UND*	00000000 piet_embedded_graphics::display::start_display
00000000         *UND*	00000000 .hidden app::app_sensor::start_sensor_listener
00000000         *UND*	00000000 .hidden app::touch_sensor::start_touch_sensor
00000000         *UND*	00000000 .hidden app::display::test_display
00000000         *UND*	00000000 core::panic::Location::file
00000000         *UND*	00000000 core::panic::Location::line
00000000         *UND*	00000000 core::panic::PanicInfo::payload
00000000         *UND*	00000000 core::panic::PanicInfo::location
00000000         *UND*	00000000 core::option::Option<T>::unwrap
00000000         *UND*	00000000 core::result::Result<T,E>::expect
00000000         *UND*	00000000 core::result::Result<T,E>::expect
00000000         *UND*	00000000 core::panicking::panic
00000000         *UND*	00000000 <dyn core::any::Any+core::marker::Send>::downcast_ref
00000000         *UND*	00000000 mynewt::sys::console::flush
00000000         *UND*	00000000 mynewt::sys::console::print
00000000         *UND*	00000000 mynewt::sys::console::buffer
00000000         *UND*	00000000 mynewt::sys::console::printint
00000000         *UND*	00000000 mynewt::kernel::os::eventq_run
00000000         *UND*	00000000 mynewt::kernel::os::eventq_dflt_get
00000000         *UND*	00000000 mynewt::sysinit
00000000 g     F .text.main	000000de main
00000000 g     F .text.rust_begin_unwind	000000f0 rust_begin_unwind
00000000         *UND*	00000000 start_ble



Disassembly of section .text.main:

00000000 <main>:
main():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:58
};

///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                 //  Don't mangle the name "main"
extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
   0:	b08c      	sub	sp, #48	; 0x30
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:63
    //  Initialise the Mynewt packages and internal temperature sensor driver. Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c
    mynewt::sysinit();
   2:	f7ff fffe 	bl	0 <mynewt::sysinit>
   6:	e7ff      	b.n	2 <app::app_sensor::start_sensor_listener+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:71
    //  sensor_network::start_server_transport()
    //    .expect("NET fail");

    //  Start polling the simulated temperature sensor every 10 seconds in the background.
    //  TODO: Replace by touch handler.
    app_sensor::start_sensor_listener()
   8:	f7ff fffe 	bl	0 <app::app_sensor::start_sensor_listener>
   c:	9007      	str	r0, [sp, #28]
   e:	e7ff      	b.n	10 <main+0x10>
  10:	f240 0100 	movw	r1, #0
  14:	f2c0 0100 	movt	r1, #0
  18:	2208      	movs	r2, #8
  1a:	9807      	ldr	r0, [sp, #28]
  1c:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  20:	e7ff      	b.n	2 <start_ble+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:76
        .expect("TMP fail");

    //  Start Bluetooth Beacon.  TODO: Create a safe wrapper for starting Bluetooth LE.
    extern { fn start_ble() -> i32; }
    let rc = unsafe { start_ble() };
  22:	f7ff fffe 	bl	0 <start_ble>
  26:	9008      	str	r0, [sp, #32]
  28:	e7ff      	b.n	2a <main+0x2a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:77
    assert!(rc == 0, "BLE fail");
  2a:	9808      	ldr	r0, [sp, #32]
  2c:	2800      	cmp	r0, #0
  2e:	d104      	bne.n	3a <main+0x3a>
  30:	e7ff      	b.n	32 <main+0x32>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:80

    //  Start the display
    druid::start_display()
  32:	f7ff fffe 	bl	0 <piet_embedded_graphics::display::start_display>
  36:	9006      	str	r0, [sp, #24]
  38:	e010      	b.n	5c <main+0x5c>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:77
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
  56:	f7ff fffe 	bl	0 <core::panicking::panic>
  5a:	defe      	udf	#254	; 0xfe
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:80
    druid::start_display()
  5c:	f240 0100 	movw	r1, #0
  60:	f2c0 0100 	movt	r1, #0
  64:	2208      	movs	r2, #8
  66:	9806      	ldr	r0, [sp, #24]
  68:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  6c:	e7ff      	b.n	2 <app::display::test_display+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:85
        .expect("DSP fail");

    //  Test the display
    #[cfg(feature = "display_app")]  //  If graphics display app is enabled...
    display::test_display()
  6e:	f7ff fffe 	bl	0 <app::display::test_display>
  72:	9004      	str	r0, [sp, #16]
  74:	e7ff      	b.n	76 <main+0x76>
  76:	f240 0100 	movw	r1, #0
  7a:	f2c0 0100 	movt	r1, #0
  7e:	220d      	movs	r2, #13
  80:	9804      	ldr	r0, [sp, #16]
  82:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  86:	e7ff      	b.n	2 <app::touch_sensor::start_touch_sensor+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:89
        .expect("DSP test fail");

    //  Start the touch sensor
    touch_sensor::start_touch_sensor()
  88:	f7ff fffe 	bl	0 <app::touch_sensor::start_touch_sensor>
  8c:	9003      	str	r0, [sp, #12]
  8e:	e7ff      	b.n	90 <main+0x90>
  90:	f240 0100 	movw	r1, #0
  94:	f2c0 0100 	movt	r1, #0
  98:	2208      	movs	r2, #8
  9a:	9803      	ldr	r0, [sp, #12]
  9c:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  a0:	e7ff      	b.n	a2 <main+0xa2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:101
    //  Launch the druid UI app
    #[cfg(feature = "ui_app")]  //  If druid UI app is enabled...
    ui::launch();

    //  Main event loop
    loop {                            //  Loop forever...
  a2:	e7ff      	b.n	a4 <main+0xa4>
  a4:	a809      	add	r0, sp, #36	; 0x24
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:103
        os::eventq_run(               //  Processing events...
            os::eventq_dflt_get()     //  From default event queue.
  a6:	f7ff fffe 	bl	0 <mynewt::kernel::os::eventq_dflt_get>
  aa:	e7ff      	b.n	22 <main+0x22>
  ac:	f240 0100 	movw	r1, #0
  b0:	f2c0 0100 	movt	r1, #0
  b4:	a809      	add	r0, sp, #36	; 0x24
  b6:	2208      	movs	r2, #8
  b8:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  bc:	9002      	str	r0, [sp, #8]
  be:	e7ff      	b.n	c0 <main+0xc0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:102
        os::eventq_run(               //  Processing events...
  c0:	9802      	ldr	r0, [sp, #8]
  c2:	f7ff fffe 	bl	0 <mynewt::kernel::os::eventq_run>
  c6:	9001      	str	r0, [sp, #4]
  c8:	e7ff      	b.n	ca <main+0xca>
  ca:	f240 0100 	movw	r1, #0
  ce:	f2c0 0100 	movt	r1, #0
  d2:	2208      	movs	r2, #8
  d4:	9801      	ldr	r0, [sp, #4]
  d6:	f7ff fffe 	bl	0 <core::result::Result<T,E>::expect>
  da:	e7ff      	b.n	dc <main+0xdc>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:101
    loop {                            //  Loop forever...
  dc:	e7e2      	b.n	a4 <main+0xa4>

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:112
    //  Never comes here
}

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
   0:	b08a      	sub	sp, #40	; 0x28
   2:	9004      	str	r0, [sp, #16]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:114
    //  Display the filename and line number to the Semihosting Console.
    console::print("panic ");
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	2106      	movs	r1, #6
   e:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  12:	e7ff      	b.n	14 <rust_begin_unwind+0x14>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:115
    if let Some(location) = info.location() {
  14:	9804      	ldr	r0, [sp, #16]
  16:	f7ff fffe 	bl	0 <core::panic::PanicInfo::location>
  1a:	9005      	str	r0, [sp, #20]
  1c:	e7ff      	b.n	1e <rust_begin_unwind+0x1e>
  1e:	9805      	ldr	r0, [sp, #20]
  20:	2800      	cmp	r0, #0
  22:	d108      	bne.n	36 <rust_begin_unwind+0x36>
  24:	e7ff      	b.n	26 <rust_begin_unwind+0x26>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:122
        let line = location.line();
        console::print("at ");       console::buffer(&file);
        console::print(" line ");    console::printint(line as i32);
        console::print("\n");        console::flush();
    } else {
        console::print("no loc\n");  console::flush();
  26:	f240 0000 	movw	r0, #0
  2a:	f2c0 0000 	movt	r0, #0
  2e:	2107      	movs	r1, #7
  30:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  34:	e031      	b.n	9a <rust_begin_unwind+0x9a>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:115
    if let Some(location) = info.location() {
  36:	9805      	ldr	r0, [sp, #20]
  38:	9006      	str	r0, [sp, #24]
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:116
        let file = location.file();
  3a:	9806      	ldr	r0, [sp, #24]
  3c:	f7ff fffe 	bl	0 <core::panic::Location::file>
  40:	9108      	str	r1, [sp, #32]
  42:	9007      	str	r0, [sp, #28]
  44:	e7ff      	b.n	46 <rust_begin_unwind+0x46>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:117
        let line = location.line();
  46:	9806      	ldr	r0, [sp, #24]
  48:	f7ff fffe 	bl	0 <core::panic::Location::line>
  4c:	9009      	str	r0, [sp, #36]	; 0x24
  4e:	e7ff      	b.n	50 <rust_begin_unwind+0x50>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:118
        console::print("at ");       console::buffer(&file);
  50:	f240 0000 	movw	r0, #0
  54:	f2c0 0000 	movt	r0, #0
  58:	2103      	movs	r1, #3
  5a:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  5e:	e7ff      	b.n	60 <rust_begin_unwind+0x60>
  60:	9807      	ldr	r0, [sp, #28]
  62:	9908      	ldr	r1, [sp, #32]
  64:	f7ff fffe 	bl	0 <mynewt::sys::console::buffer>
  68:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:119
        console::print(" line ");    console::printint(line as i32);
  6a:	f240 0000 	movw	r0, #0
  6e:	f2c0 0000 	movt	r0, #0
  72:	2106      	movs	r1, #6
  74:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  78:	e7ff      	b.n	7a <rust_begin_unwind+0x7a>
  7a:	9809      	ldr	r0, [sp, #36]	; 0x24
  7c:	f7ff fffe 	bl	0 <mynewt::sys::console::printint>
  80:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:120
        console::print("\n");        console::flush();
  82:	f240 0000 	movw	r0, #0
  86:	f2c0 0000 	movt	r0, #0
  8a:	2101      	movs	r1, #1
  8c:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  90:	e7ff      	b.n	2 <mynewt::sys::console::flush+0x2>
  92:	f7ff fffe 	bl	0 <mynewt::sys::console::flush>
  96:	e7ff      	b.n	98 <rust_begin_unwind+0x98>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:115
    if let Some(location) = info.location() {
  98:	e003      	b.n	a2 <rust_begin_unwind+0xa2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:122
        console::print("no loc\n");  console::flush();
  9a:	f7ff fffe 	bl	0 <mynewt::sys::console::flush>
  9e:	e7ff      	b.n	a0 <rust_begin_unwind+0xa0>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:115
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
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:125
    }
    //  Pause in the debugger.
    bkpt();
  a4:	e7ff      	b.n	a6 <rust_begin_unwind+0xa6>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:127
    //  Display the payload.
    console::print(info.payload().downcast_ref::<&str>().unwrap());
  a6:	9804      	ldr	r0, [sp, #16]
  a8:	f7ff fffe 	bl	0 <core::panic::PanicInfo::payload>
  ac:	9003      	str	r0, [sp, #12]
  ae:	9102      	str	r1, [sp, #8]
  b0:	e7ff      	b.n	b2 <rust_begin_unwind+0xb2>
  b2:	9803      	ldr	r0, [sp, #12]
  b4:	9902      	ldr	r1, [sp, #8]
  b6:	f7ff fffe 	bl	0 <<dyn core::any::Any+core::marker::Send>::downcast_ref>
  ba:	9001      	str	r0, [sp, #4]
  bc:	e7ff      	b.n	be <rust_begin_unwind+0xbe>
  be:	9801      	ldr	r0, [sp, #4]
  c0:	f7ff fffe 	bl	0 <core::option::Option<T>::unwrap>
  c4:	9000      	str	r0, [sp, #0]
  c6:	e7ff      	b.n	c8 <rust_begin_unwind+0xc8>
  c8:	9800      	ldr	r0, [sp, #0]
  ca:	6800      	ldr	r0, [r0, #0]
  cc:	9900      	ldr	r1, [sp, #0]
  ce:	6849      	ldr	r1, [r1, #4]
  d0:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  d4:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:128
    console::print("\n");  console::flush();
  d6:	f240 0000 	movw	r0, #0
  da:	f2c0 0000 	movt	r0, #0
  de:	2101      	movs	r1, #1
  e0:	f7ff fffe 	bl	0 <mynewt::sys::console::print>
  e4:	e7ff      	b.n	2 <mynewt::sys::console::flush+0x2>
  e6:	f7ff fffe 	bl	0 <mynewt::sys::console::flush>
  ea:	e7ff      	b.n	ec <rust_begin_unwind+0xec>
/Users/Luppy/PineTime/pinetime-rust-mynewt/rust/app/src/lib.rs:130
    //  Loop forever so that device won't restart.
    loop {}
  ec:	e7ff      	b.n	ee <rust_begin_unwind+0xee>
  ee:	e7fe      	b.n	ee <rust_begin_unwind+0xee>
arm-none-eabi-objdump: lib.rmeta: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.15yydn68vvmvuok2.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.185rybjag3u6nz1y.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.2dz8qltt39wo39j0.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.2fiebdqzjcjlhh5i.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.2su6vllo4n4sfmxx.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.2upwd3355h29lo27.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.3qnxh3fxvoqh46ed.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.3u72kxo7ofzcwykn.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.3ztvo67zda8mhvq2.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.443ouz32g0ggdgyl.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.4gon3pescdpipuhv.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.56fall6s8dipdxg4.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.n6e1990egtctct7.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-1da0d8acf4e589c0.y5rr8cvos2qf8lx.rcgu.bc.z: File format not recognized
