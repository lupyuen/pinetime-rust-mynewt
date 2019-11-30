In archive target/thumbv7em-none-eabihf/debug/libapp.rlib:

app-9b7b12e8d5cbce98.12ulr3no6t1225s9.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 12ulr3no6t1225s9
0000017e l       .debug_str	00000000 
00000172 l       .debug_str	00000000 
0000017a l       .debug_str	00000000 
00000183 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000093 l       .debug_str	00000000 
000000c6 l       .debug_str	00000000 
000000d2 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000de l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000e5 l       .debug_str	00000000 
000000e9 l       .debug_str	00000000 
000000ef l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
00000107 l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
00000000 l     F .text._ZN8arrayvec4char5write17h631709076dcacfd8E	00000038 _ZN8arrayvec4char5write17h631709076dcacfd8E
00000000 l    d  .text._ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE	00000000 .text._ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE
00000000 l    d  .text._ZN8arrayvec4char5write17h631709076dcacfd8E	00000000 .text._ZN8arrayvec4char5write17h631709076dcacfd8E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core3ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h86a9e4f7932a1a54E
00000000         *UND*	00000000 _ZN4core3ptr5write17h48c21f88731c456eE
00000000 g     F .text._ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE	00000274 .hidden _ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE



Disassembly of section .text._ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE:

00000000 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>:
_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:39
/// On success, return the byte length of the encoding (1, 2, 3 or 4).<br>
/// On error, return `EncodeUtf8Error` if the buffer was too short for the char.
///
/// Safety: `ptr` must be writable for `len` bytes.
#[inline]
pub unsafe fn encode_utf8(ch: char, ptr: *mut u8, len: usize) -> Result<usize, EncodeUtf8Error>
   0:	b580      	push	{r7, lr}
   2:	b0a6      	sub	sp, #152	; 0x98
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	901e      	str	r0, [sp, #120]	; 0x78
   c:	911f      	str	r1, [sp, #124]	; 0x7c
   e:	9220      	str	r2, [sp, #128]	; 0x80
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:41
{
    let code = ch as u32;
  10:	981e      	ldr	r0, [sp, #120]	; 0x78
  12:	9023      	str	r0, [sp, #140]	; 0x8c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:42
    if code < MAX_ONE_B && len >= 1 {
  14:	9823      	ldr	r0, [sp, #140]	; 0x8c
  16:	2880      	cmp	r0, #128	; 0x80
  18:	931d      	str	r3, [sp, #116]	; 0x74
  1a:	f8cd c070 	str.w	ip, [sp, #112]	; 0x70
  1e:	f8cd e06c 	str.w	lr, [sp, #108]	; 0x6c
  22:	d304      	bcc.n	2e <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x2e>
  24:	e7ff      	b.n	26 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x26>
  26:	2000      	movs	r0, #0
  28:	f88d 0091 	strb.w	r0, [sp, #145]	; 0x91
  2c:	e006      	b.n	3c <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x3c>
  2e:	9820      	ldr	r0, [sp, #128]	; 0x80
  30:	2800      	cmp	r0, #0
  32:	bf18      	it	ne
  34:	2001      	movne	r0, #1
  36:	f88d 0091 	strb.w	r0, [sp, #145]	; 0x91
  3a:	e7ff      	b.n	3c <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x3c>
  3c:	f89d 0091 	ldrb.w	r0, [sp, #145]	; 0x91
  40:	07c0      	lsls	r0, r0, #31
  42:	2800      	cmp	r0, #0
  44:	d010      	beq.n	68 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x68>
  46:	e7ff      	b.n	48 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x48>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:43
        write(ptr, 0, code as u8);
  48:	981f      	ldr	r0, [sp, #124]	; 0x7c
  4a:	9a23      	ldr	r2, [sp, #140]	; 0x8c
  4c:	2100      	movs	r1, #0
  4e:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
  52:	e7ff      	b.n	54 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x54>
  54:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:44
        return Ok(1);
  56:	9022      	str	r0, [sp, #136]	; 0x88
  58:	2000      	movs	r0, #0
  5a:	9021      	str	r0, [sp, #132]	; 0x84
  5c:	e003      	b.n	66 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x66>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:62
        write(ptr, 2, (code >>  6 & 0x3F) as u8 | TAG_CONT);
        write(ptr, 3, (code & 0x3F) as u8 | TAG_CONT);
        return Ok(4);
    };
    Err(EncodeUtf8Error)
}
  5e:	9821      	ldr	r0, [sp, #132]	; 0x84
  60:	9922      	ldr	r1, [sp, #136]	; 0x88
  62:	b026      	add	sp, #152	; 0x98
  64:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:44
        return Ok(1);
  66:	e7fa      	b.n	5e <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x5e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:45
    } else if code < MAX_TWO_B && len >= 2 {
  68:	9823      	ldr	r0, [sp, #140]	; 0x8c
  6a:	f5b0 6f00 	cmp.w	r0, #2048	; 0x800
  6e:	d304      	bcc.n	7a <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x7a>
  70:	e7ff      	b.n	72 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x72>
  72:	2000      	movs	r0, #0
  74:	f88d 0092 	strb.w	r0, [sp, #146]	; 0x92
  78:	e007      	b.n	8a <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x8a>
  7a:	9820      	ldr	r0, [sp, #128]	; 0x80
  7c:	2100      	movs	r1, #0
  7e:	2801      	cmp	r0, #1
  80:	bf88      	it	hi
  82:	2101      	movhi	r1, #1
  84:	f88d 1092 	strb.w	r1, [sp, #146]	; 0x92
  88:	e7ff      	b.n	8a <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x8a>
  8a:	f89d 0092 	ldrb.w	r0, [sp, #146]	; 0x92
  8e:	07c0      	lsls	r0, r0, #31
  90:	2800      	cmp	r0, #0
  92:	d02e      	beq.n	f2 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0xf2>
  94:	e7ff      	b.n	96 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x96>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:46
        write(ptr, 0, (code >> 6 & 0x1F) as u8 | TAG_TWO_B);
  96:	981f      	ldr	r0, [sp, #124]	; 0x7c
  98:	9923      	ldr	r1, [sp, #140]	; 0x8c
  9a:	0989      	lsrs	r1, r1, #6
  9c:	901a      	str	r0, [sp, #104]	; 0x68
  9e:	9119      	str	r1, [sp, #100]	; 0x64
  a0:	e7ff      	b.n	a2 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0xa2>
  a2:	f64f 70fe 	movw	r0, #65534	; 0xfffe
  a6:	f2c0 70ff 	movt	r0, #2047	; 0x7ff
  aa:	9919      	ldr	r1, [sp, #100]	; 0x64
  ac:	f360 115f 	bfi	r1, r0, #5, #27
  b0:	2000      	movs	r0, #0
  b2:	9a1a      	ldr	r2, [sp, #104]	; 0x68
  b4:	9018      	str	r0, [sp, #96]	; 0x60
  b6:	4610      	mov	r0, r2
  b8:	9b18      	ldr	r3, [sp, #96]	; 0x60
  ba:	9117      	str	r1, [sp, #92]	; 0x5c
  bc:	4619      	mov	r1, r3
  be:	9a17      	ldr	r2, [sp, #92]	; 0x5c
  c0:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
  c4:	e7ff      	b.n	c6 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0xc6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:47
        write(ptr, 1, (code & 0x3F) as u8 | TAG_CONT);
  c6:	981f      	ldr	r0, [sp, #124]	; 0x7c
  c8:	f89d 108c 	ldrb.w	r1, [sp, #140]	; 0x8c
  cc:	f64f 72fe 	movw	r2, #65534	; 0xfffe
  d0:	f2c0 32ff 	movt	r2, #1023	; 0x3ff
  d4:	f362 119f 	bfi	r1, r2, #6, #26
  d8:	2201      	movs	r2, #1
  da:	9116      	str	r1, [sp, #88]	; 0x58
  dc:	4611      	mov	r1, r2
  de:	9a16      	ldr	r2, [sp, #88]	; 0x58
  e0:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
  e4:	e7ff      	b.n	e6 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0xe6>
  e6:	2002      	movs	r0, #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:48
        return Ok(2);
  e8:	9022      	str	r0, [sp, #136]	; 0x88
  ea:	2000      	movs	r0, #0
  ec:	9021      	str	r0, [sp, #132]	; 0x84
  ee:	e7ff      	b.n	f0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0xf0>
  f0:	e7b9      	b.n	66 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x66>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:49
    } else if code < MAX_THREE_B && len >= 3 {
  f2:	9823      	ldr	r0, [sp, #140]	; 0x8c
  f4:	f5b0 3f80 	cmp.w	r0, #65536	; 0x10000
  f8:	d304      	bcc.n	104 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x104>
  fa:	e7ff      	b.n	fc <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0xfc>
  fc:	2000      	movs	r0, #0
  fe:	f88d 0093 	strb.w	r0, [sp, #147]	; 0x93
 102:	e007      	b.n	114 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x114>
 104:	9820      	ldr	r0, [sp, #128]	; 0x80
 106:	2100      	movs	r1, #0
 108:	2802      	cmp	r0, #2
 10a:	bf88      	it	hi
 10c:	2101      	movhi	r1, #1
 10e:	f88d 1093 	strb.w	r1, [sp, #147]	; 0x93
 112:	e7ff      	b.n	114 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x114>
 114:	f89d 0093 	ldrb.w	r0, [sp, #147]	; 0x93
 118:	07c0      	lsls	r0, r0, #31
 11a:	2800      	cmp	r0, #0
 11c:	d046      	beq.n	1ac <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1ac>
 11e:	e7ff      	b.n	120 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x120>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:50
        write(ptr, 0, (code >> 12 & 0x0F) as u8 | TAG_THREE_B);
 120:	981f      	ldr	r0, [sp, #124]	; 0x7c
 122:	9923      	ldr	r1, [sp, #140]	; 0x8c
 124:	0b09      	lsrs	r1, r1, #12
 126:	9015      	str	r0, [sp, #84]	; 0x54
 128:	9114      	str	r1, [sp, #80]	; 0x50
 12a:	e7ff      	b.n	12c <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x12c>
 12c:	f64f 70fe 	movw	r0, #65534	; 0xfffe
 130:	f6c0 70ff 	movt	r0, #4095	; 0xfff
 134:	9914      	ldr	r1, [sp, #80]	; 0x50
 136:	f360 111f 	bfi	r1, r0, #4, #28
 13a:	2000      	movs	r0, #0
 13c:	9a15      	ldr	r2, [sp, #84]	; 0x54
 13e:	9013      	str	r0, [sp, #76]	; 0x4c
 140:	4610      	mov	r0, r2
 142:	9b13      	ldr	r3, [sp, #76]	; 0x4c
 144:	9112      	str	r1, [sp, #72]	; 0x48
 146:	4619      	mov	r1, r3
 148:	9a12      	ldr	r2, [sp, #72]	; 0x48
 14a:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
 14e:	e7ff      	b.n	150 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x150>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:51
        write(ptr, 1, (code >>  6 & 0x3F) as u8 | TAG_CONT);
 150:	981f      	ldr	r0, [sp, #124]	; 0x7c
 152:	9923      	ldr	r1, [sp, #140]	; 0x8c
 154:	0989      	lsrs	r1, r1, #6
 156:	9011      	str	r0, [sp, #68]	; 0x44
 158:	9110      	str	r1, [sp, #64]	; 0x40
 15a:	e7ff      	b.n	15c <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x15c>
 15c:	f64f 70fe 	movw	r0, #65534	; 0xfffe
 160:	f2c0 30ff 	movt	r0, #1023	; 0x3ff
 164:	9910      	ldr	r1, [sp, #64]	; 0x40
 166:	f360 119f 	bfi	r1, r0, #6, #26
 16a:	2001      	movs	r0, #1
 16c:	9a11      	ldr	r2, [sp, #68]	; 0x44
 16e:	900f      	str	r0, [sp, #60]	; 0x3c
 170:	4610      	mov	r0, r2
 172:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 174:	910e      	str	r1, [sp, #56]	; 0x38
 176:	4619      	mov	r1, r3
 178:	9a0e      	ldr	r2, [sp, #56]	; 0x38
 17a:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
 17e:	e7ff      	b.n	180 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x180>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:52
        write(ptr, 2, (code & 0x3F) as u8 | TAG_CONT);
 180:	981f      	ldr	r0, [sp, #124]	; 0x7c
 182:	f89d 108c 	ldrb.w	r1, [sp, #140]	; 0x8c
 186:	f64f 72fe 	movw	r2, #65534	; 0xfffe
 18a:	f2c0 32ff 	movt	r2, #1023	; 0x3ff
 18e:	f362 119f 	bfi	r1, r2, #6, #26
 192:	2202      	movs	r2, #2
 194:	910d      	str	r1, [sp, #52]	; 0x34
 196:	4611      	mov	r1, r2
 198:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 19a:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
 19e:	e7ff      	b.n	1a0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1a0>
 1a0:	2003      	movs	r0, #3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:53
        return Ok(3);
 1a2:	9022      	str	r0, [sp, #136]	; 0x88
 1a4:	2000      	movs	r0, #0
 1a6:	9021      	str	r0, [sp, #132]	; 0x84
 1a8:	e7ff      	b.n	1aa <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1aa>
 1aa:	e7a1      	b.n	f0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0xf0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:54
    } else if len >= 4 {
 1ac:	9820      	ldr	r0, [sp, #128]	; 0x80
 1ae:	2804      	cmp	r0, #4
 1b0:	d35d      	bcc.n	26e <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x26e>
 1b2:	e7ff      	b.n	1b4 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1b4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:55
        write(ptr, 0, (code >> 18 & 0x07) as u8 | TAG_FOUR_B);
 1b4:	981f      	ldr	r0, [sp, #124]	; 0x7c
 1b6:	9923      	ldr	r1, [sp, #140]	; 0x8c
 1b8:	0c89      	lsrs	r1, r1, #18
 1ba:	900c      	str	r0, [sp, #48]	; 0x30
 1bc:	910b      	str	r1, [sp, #44]	; 0x2c
 1be:	e7ff      	b.n	1c0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1c0>
 1c0:	f64f 70fe 	movw	r0, #65534	; 0xfffe
 1c4:	f6c1 70ff 	movt	r0, #8191	; 0x1fff
 1c8:	990b      	ldr	r1, [sp, #44]	; 0x2c
 1ca:	f360 01df 	bfi	r1, r0, #3, #29
 1ce:	2000      	movs	r0, #0
 1d0:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 1d2:	900a      	str	r0, [sp, #40]	; 0x28
 1d4:	4610      	mov	r0, r2
 1d6:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 1d8:	9109      	str	r1, [sp, #36]	; 0x24
 1da:	4619      	mov	r1, r3
 1dc:	9a09      	ldr	r2, [sp, #36]	; 0x24
 1de:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
 1e2:	e7ff      	b.n	1e4 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1e4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:56
        write(ptr, 1, (code >> 12 & 0x3F) as u8 | TAG_CONT);
 1e4:	981f      	ldr	r0, [sp, #124]	; 0x7c
 1e6:	9923      	ldr	r1, [sp, #140]	; 0x8c
 1e8:	0b09      	lsrs	r1, r1, #12
 1ea:	9008      	str	r0, [sp, #32]
 1ec:	9107      	str	r1, [sp, #28]
 1ee:	e7ff      	b.n	1f0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1f0>
 1f0:	f64f 70fe 	movw	r0, #65534	; 0xfffe
 1f4:	f2c0 30ff 	movt	r0, #1023	; 0x3ff
 1f8:	9907      	ldr	r1, [sp, #28]
 1fa:	f360 119f 	bfi	r1, r0, #6, #26
 1fe:	2001      	movs	r0, #1
 200:	9a08      	ldr	r2, [sp, #32]
 202:	9006      	str	r0, [sp, #24]
 204:	4610      	mov	r0, r2
 206:	9b06      	ldr	r3, [sp, #24]
 208:	9105      	str	r1, [sp, #20]
 20a:	4619      	mov	r1, r3
 20c:	9a05      	ldr	r2, [sp, #20]
 20e:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
 212:	e7ff      	b.n	214 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x214>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:57
        write(ptr, 2, (code >>  6 & 0x3F) as u8 | TAG_CONT);
 214:	981f      	ldr	r0, [sp, #124]	; 0x7c
 216:	9923      	ldr	r1, [sp, #140]	; 0x8c
 218:	0989      	lsrs	r1, r1, #6
 21a:	9004      	str	r0, [sp, #16]
 21c:	9103      	str	r1, [sp, #12]
 21e:	e7ff      	b.n	220 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x220>
 220:	f64f 70fe 	movw	r0, #65534	; 0xfffe
 224:	f2c0 30ff 	movt	r0, #1023	; 0x3ff
 228:	9903      	ldr	r1, [sp, #12]
 22a:	f360 119f 	bfi	r1, r0, #6, #26
 22e:	2002      	movs	r0, #2
 230:	9a04      	ldr	r2, [sp, #16]
 232:	9002      	str	r0, [sp, #8]
 234:	4610      	mov	r0, r2
 236:	9b02      	ldr	r3, [sp, #8]
 238:	9101      	str	r1, [sp, #4]
 23a:	4619      	mov	r1, r3
 23c:	9a01      	ldr	r2, [sp, #4]
 23e:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
 242:	e7ff      	b.n	244 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x244>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:58
        write(ptr, 3, (code & 0x3F) as u8 | TAG_CONT);
 244:	981f      	ldr	r0, [sp, #124]	; 0x7c
 246:	f89d 108c 	ldrb.w	r1, [sp, #140]	; 0x8c
 24a:	f64f 72fe 	movw	r2, #65534	; 0xfffe
 24e:	f2c0 32ff 	movt	r2, #1023	; 0x3ff
 252:	f362 119f 	bfi	r1, r2, #6, #26
 256:	2203      	movs	r2, #3
 258:	9100      	str	r1, [sp, #0]
 25a:	4611      	mov	r1, r2
 25c:	9a00      	ldr	r2, [sp, #0]
 25e:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
 262:	e7ff      	b.n	264 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x264>
 264:	2004      	movs	r0, #4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:59
        return Ok(4);
 266:	9022      	str	r0, [sp, #136]	; 0x88
 268:	2000      	movs	r0, #0
 26a:	9021      	str	r0, [sp, #132]	; 0x84
 26c:	e79d      	b.n	1aa <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x1aa>
 26e:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:61
    Err(EncodeUtf8Error)
 270:	9021      	str	r0, [sp, #132]	; 0x84
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:62
}
 272:	e6f4      	b.n	5e <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE+0x5e>

Disassembly of section .text._ZN8arrayvec4char5write17h631709076dcacfd8E:

00000000 <_ZN8arrayvec4char5write17h631709076dcacfd8E>:
_ZN8arrayvec4char5write17h631709076dcacfd8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:28
unsafe fn write(ptr: *mut u8, index: usize, byte: u8) {
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9005      	str	r0, [sp, #20]
   c:	9106      	str	r1, [sp, #24]
   e:	f88d 201f 	strb.w	r2, [sp, #31]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:29
    ptr::write(ptr.add(index), byte)
  12:	9805      	ldr	r0, [sp, #20]
  14:	9906      	ldr	r1, [sp, #24]
  16:	9304      	str	r3, [sp, #16]
  18:	f8cd c00c 	str.w	ip, [sp, #12]
  1c:	f8cd e008 	str.w	lr, [sp, #8]
  20:	f7ff fffe 	bl	0 <_ZN4core3ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h86a9e4f7932a1a54E>
  24:	9001      	str	r0, [sp, #4]
  26:	e7ff      	b.n	28 <_ZN8arrayvec4char5write17h631709076dcacfd8E+0x28>
  28:	f89d 101f 	ldrb.w	r1, [sp, #31]
  2c:	9801      	ldr	r0, [sp, #4]
  2e:	f7ff fffe 	bl	0 <_ZN4core3ptr5write17h48c21f88731c456eE>
  32:	e7ff      	b.n	34 <_ZN8arrayvec4char5write17h631709076dcacfd8E+0x34>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/char.rs:30
}
  34:	b008      	add	sp, #32
  36:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.1bjukv3v4k0ycr7s.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1bjukv3v4k0ycr7s
00000106 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
00000090 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000096 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE	00000000 .text._ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE	00000010 .hidden _ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE



Disassembly of section .text._ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE:

00000000 <_ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE>:
_ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/clone.rs:167
   0:	b082      	sub	sp, #8
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/clone.rs:168
   6:	9801      	ldr	r0, [sp, #4]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/clone.rs:169
   8:	7800      	ldrb	r0, [r0, #0]
   a:	9100      	str	r1, [sp, #0]
   c:	b002      	add	sp, #8
   e:	4770      	bx	lr

app-9b7b12e8d5cbce98.1ctpqy3zikjg3fy2.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1ctpqy3zikjg3fy2
0000013b l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
0000009a l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000cc l       .debug_str	00000000 
00000000 l    d  .text._ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E	00000000 .text._ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E	00000002 _ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E



Disassembly of section .text._ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E:

00000000 <_ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E>:
_ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/marker.rs:432
   0:	4770      	bx	lr

app-9b7b12e8d5cbce98.1mlp6aodb4i09mzo.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1mlp6aodb4i09mzo
0000015d l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
0000009b l       .debug_str	00000000 
0000009e l       .debug_str	00000000 
00000126 l       .debug_str	00000000 
000000a0 l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000cc l       .debug_str	00000000 
000000d3 l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
00000000 l    d  .text._ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE	00000000 .text._ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE	0000001e _ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE
00000000         *UND*	00000000 _ZN95_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$u8$GT$$GT$4from17h6ee2795358adec6eE



Disassembly of section .text._ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE:

00000000 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE>:
_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/convert.rs:539
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	4601      	mov	r1, r0
   6:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/convert.rs:540
   a:	f89d 000f 	ldrb.w	r0, [sp, #15]
   e:	9102      	str	r1, [sp, #8]
  10:	f7ff fffe 	bl	0 <_ZN95_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$u8$GT$$GT$4from17h6ee2795358adec6eE>
  14:	9001      	str	r0, [sp, #4]
  16:	e7ff      	b.n	18 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/convert.rs:541
  18:	9801      	ldr	r0, [sp, #4]
  1a:	b004      	add	sp, #16
  1c:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.1s9nw4io6l85dnto.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1s9nw4io6l85dnto
000001e3 l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001cc l       .debug_str	00000000 
000001f9 l       .debug_str	00000000 
000001fd l       .debug_str	00000000 
000001ff l       .debug_str	00000000 
00000215 l       .debug_str	00000000 
00000248 l       .debug_str	00000000 
0000027d l       .debug_str	00000000 
000002c4 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009e l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b3 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000cb l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000106 l       .debug_str	00000000 
00000141 l       .debug_str	00000000 
00000178 l       .debug_str	00000000 
00000181 l       .debug_str	00000000 
0000018e l       .debug_str	00000000 
00000191 l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001a4 l       .debug_str	00000000 
000001a8 l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001b2 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE	00000000 .text._ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E	00000000 .text._ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE	00000022 .hidden _ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE
00000000 g     F .text._ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E	0000000c .hidden _ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E
00000000         *UND*	00000000 .hidden _ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E



Disassembly of section .text._ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE:

00000000 <_ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE>:
_ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ops/function.rs:231
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	4601      	mov	r1, r0
   6:	9005      	str	r0, [sp, #20]
   8:	9805      	ldr	r0, [sp, #20]
   a:	9103      	str	r1, [sp, #12]
   c:	f7ff fffe 	bl	0 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E>
  10:	9002      	str	r0, [sp, #8]
  12:	9101      	str	r1, [sp, #4]
  14:	e7ff      	b.n	16 <_ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE+0x16>
  16:	9802      	ldr	r0, [sp, #8]
  18:	f000 0001 	and.w	r0, r0, #1
  1c:	9901      	ldr	r1, [sp, #4]
  1e:	b006      	add	sp, #24
  20:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E:

00000000 <_ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E>:
_ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:195
   0:	b082      	sub	sp, #8
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
   6:	9100      	str	r1, [sp, #0]
   8:	b002      	add	sp, #8
   a:	4770      	bx	lr

app-9b7b12e8d5cbce98.1t1nsou0xqr1p6vw.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1t1nsou0xqr1p6vw
000021cb l       .debug_str	00000000 
000029fa l       .debug_str	00000000 
00002a05 l       .debug_str	00000000 
00002a10 l       .debug_str	00000000 
00002a20 l       .debug_str	00000000 
00002a30 l       .debug_str	00000000 
00002a63 l       .debug_str	00000000 
00002a78 l       .debug_str	00000000 
00002a81 l       .debug_str	00000000 
00002ade l       .debug_str	00000000 
00002b43 l       .debug_str	00000000 
00002b4d l       .debug_str	00000000 
00002b5d l       .debug_str	00000000 
00002b72 l       .debug_str	00000000 
00002b7a l       .debug_str	00000000 
00002bde l       .debug_str	00000000 
00002c4a l       .debug_str	00000000 
00002c51 l       .debug_str	00000000 
00002c59 l       .debug_str	00000000 
00002c77 l       .debug_str	00000000 
00002c87 l       .debug_str	00000000 
00002cba l       .debug_str	00000000 
00002ccf l       .debug_str	00000000 
00002ce2 l       .debug_str	00000000 
00002cf7 l       .debug_str	00000000 
00002cfe l       .debug_str	00000000 
00002d13 l       .debug_str	00000000 
00002d3d l       .debug_str	00000000 
00002db9 l       .debug_str	00000000 
00002e3d l       .debug_str	00000000 
00002e44 l       .debug_str	00000000 
00002e4c l       .debug_str	00000000 
00002e6a l       .debug_str	00000000 
00002e7a l       .debug_str	00000000 
00002eea l       .debug_str	00000000 
00002f41 l       .debug_str	00000000 
00002f94 l       .debug_str	00000000 
00002f98 l       .debug_str	00000000 
00002fa0 l       .debug_str	00000000 
00002fa6 l       .debug_str	00000000 
00002fab l       .debug_str	00000000 
00002fb3 l       .debug_str	00000000 
00002fb8 l       .debug_str	00000000 
00003028 l       .debug_str	00000000 
0000305e l       .debug_str	00000000 
00003090 l       .debug_str	00000000 
00003094 l       .debug_str	00000000 
00003099 l       .debug_str	00000000 
0000309f l       .debug_str	00000000 
000030a4 l       .debug_str	00000000 
000030b6 l       .debug_str	00000000 
000030d1 l       .debug_str	00000000 
000030d6 l       .debug_str	00000000 
000030d8 l       .debug_str	00000000 
000030da l       .debug_str	00000000 
000030dd l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009b l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c3 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000ce l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000e1 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000f9 l       .debug_str	00000000 
00000104 l       .debug_str	00000000 
0000010c l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
00000122 l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
0000014f l       .debug_str	00000000 
0000015b l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
00000176 l       .debug_str	00000000 
00000180 l       .debug_str	00000000 
0000018d l       .debug_str	00000000 
00000199 l       .debug_str	00000000 
0000019d l       .debug_str	00000000 
000001a1 l       .debug_str	00000000 
000001a8 l       .debug_str	00000000 
000001ab l       .debug_str	00000000 
000001b5 l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001d4 l       .debug_str	00000000 
000001e0 l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
000001ed l       .debug_str	00000000 
000001f4 l       .debug_str	00000000 
000001fc l       .debug_str	00000000 
00000204 l       .debug_str	00000000 
0000020e l       .debug_str	00000000 
00000214 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
00000225 l       .debug_str	00000000 
0000022c l       .debug_str	00000000 
00000233 l       .debug_str	00000000 
00000238 l       .debug_str	00000000 
0000024f l       .debug_str	00000000 
0000027c l       .debug_str	00000000 
0000027e l       .debug_str	00000000 
00000283 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002be l       .debug_str	00000000 
000002c4 l       .debug_str	00000000 
000002d3 l       .debug_str	00000000 
000002e3 l       .debug_str	00000000 
000002f3 l       .debug_str	00000000 
000002fb l       .debug_str	00000000 
00000324 l       .debug_str	00000000 
00000382 l       .debug_str	00000000 
000003e8 l       .debug_str	00000000 
000003ef l       .debug_str	00000000 
000003f7 l       .debug_str	00000000 
00000400 l       .debug_str	00000000 
0000041e l       .debug_str	00000000 
0000042e l       .debug_str	00000000 
0000043c l       .debug_str	00000000 
00000447 l       .debug_str	00000000 
00000454 l       .debug_str	00000000 
00000463 l       .debug_str	00000000 
0000046d l       .debug_str	00000000 
00000483 l       .debug_str	00000000 
0000048d l       .debug_str	00000000 
00000496 l       .debug_str	00000000 
0000049f l       .debug_str	00000000 
000004c5 l       .debug_str	00000000 
000004db l       .debug_str	00000000 
000004e6 l       .debug_str	00000000 
000004fc l       .debug_str	00000000 
00000504 l       .debug_str	00000000 
00000525 l       .debug_str	00000000 
0000052e l       .debug_str	00000000 
00000537 l       .debug_str	00000000 
00000542 l       .debug_str	00000000 
0000054c l       .debug_str	00000000 
00000552 l       .debug_str	00000000 
0000058a l       .debug_str	00000000 
000005ca l       .debug_str	00000000 
000005d1 l       .debug_str	00000000 
000005d9 l       .debug_str	00000000 
000005f0 l       .debug_str	00000000 
000005f9 l       .debug_str	00000000 
0000061b l       .debug_str	00000000 
00000625 l       .debug_str	00000000 
0000064c l       .debug_str	00000000 
00000664 l       .debug_str	00000000 
0000066e l       .debug_str	00000000 
00000691 l       .debug_str	00000000 
00000693 l       .debug_str	00000000 
000006db l       .debug_str	00000000 
000006de l       .debug_str	00000000 
00000706 l       .debug_str	00000000 
00000712 l       .debug_str	00000000 
00000718 l       .debug_str	00000000 
0000071e l       .debug_str	00000000 
00000727 l       .debug_str	00000000 
0000072e l       .debug_str	00000000 
00000734 l       .debug_str	00000000 
00000739 l       .debug_str	00000000 
00000742 l       .debug_str	00000000 
0000074b l       .debug_str	00000000 
00000754 l       .debug_str	00000000 
0000075a l       .debug_str	00000000 
00000780 l       .debug_str	00000000 
00000789 l       .debug_str	00000000 
00000790 l       .debug_str	00000000 
00000798 l       .debug_str	00000000 
0000079d l       .debug_str	00000000 
000007b1 l       .debug_str	00000000 
000007e3 l       .debug_str	00000000 
000007f7 l       .debug_str	00000000 
00000829 l       .debug_str	00000000 
00000832 l       .debug_str	00000000 
00000836 l       .debug_str	00000000 
00000869 l       .debug_str	00000000 
00000889 l       .debug_str	00000000 
0000088b l       .debug_str	00000000 
000008be l       .debug_str	00000000 
000008e7 l       .debug_str	00000000 
00000927 l       .debug_str	00000000 
00000943 l       .debug_str	00000000 
00000983 l       .debug_str	00000000 
000009ca l       .debug_str	00000000 
00000a0a l       .debug_str	00000000 
00000a31 l       .debug_str	00000000 
00000a71 l       .debug_str	00000000 
00000a96 l       .debug_str	00000000 
00000ad6 l       .debug_str	00000000 
00000ae4 l       .debug_str	00000000 
00000ae6 l       .debug_str	00000000 
00000aee l       .debug_str	00000000 
00000af0 l       .debug_str	00000000 
00000b31 l       .debug_str	00000000 
00000b64 l       .debug_str	00000000 
00000ba5 l       .debug_str	00000000 
00000be6 l       .debug_str	00000000 
00000c27 l       .debug_str	00000000 
00000c68 l       .debug_str	00000000 
00000ca9 l       .debug_str	00000000 
00000cf4 l       .debug_str	00000000 
00000d35 l       .debug_str	00000000 
00000d80 l       .debug_str	00000000 
00000dc1 l       .debug_str	00000000 
00000e02 l       .debug_str	00000000 
00000e71 l       .debug_str	00000000 
00000e9c l       .debug_str	00000000 
00000f0b l       .debug_str	00000000 
00000f1d l       .debug_str	00000000 
00000f22 l       .debug_str	00000000 
00000f92 l       .debug_str	00000000 
00000fc0 l       .debug_str	00000000 
00000fea l       .debug_str	00000000 
0000105a l       .debug_str	00000000 
00001086 l       .debug_str	00000000 
00001089 l       .debug_str	00000000 
00001090 l       .debug_str	00000000 
00001099 l       .debug_str	00000000 
000010a8 l       .debug_str	00000000 
000010ac l       .debug_str	00000000 
000010b4 l       .debug_str	00000000 
000010ba l       .debug_str	00000000 
000010c6 l       .debug_str	00000000 
000010ce l       .debug_str	00000000 
00001128 l       .debug_str	00000000 
0000118a l       .debug_str	00000000 
00001195 l       .debug_str	00000000 
000011dc l       .debug_str	00000000 
0000122b l       .debug_str	00000000 
00001235 l       .debug_str	00000000 
00001272 l       .debug_str	00000000 
000012b7 l       .debug_str	00000000 
000012c0 l       .debug_str	00000000 
000012d0 l       .debug_str	00000000 
000012d8 l       .debug_str	00000000 
0000132d l       .debug_str	00000000 
0000138a l       .debug_str	00000000 
00001396 l       .debug_str	00000000 
0000139f l       .debug_str	00000000 
000013ab l       .debug_str	00000000 
000013b7 l       .debug_str	00000000 
000013c0 l       .debug_str	00000000 
000013c8 l       .debug_str	00000000 
000013d0 l       .debug_str	00000000 
000013e5 l       .debug_str	00000000 
000013ec l       .debug_str	00000000 
0000140c l       .debug_str	00000000 
00001413 l       .debug_str	00000000 
0000141b l       .debug_str	00000000 
00001425 l       .debug_str	00000000 
0000143c l       .debug_str	00000000 
00001441 l       .debug_str	00000000 
00001449 l       .debug_str	00000000 
00001452 l       .debug_str	00000000 
0000145b l       .debug_str	00000000 
00001464 l       .debug_str	00000000 
0000146c l       .debug_str	00000000 
00001473 l       .debug_str	00000000 
0000147f l       .debug_str	00000000 
0000148a l       .debug_str	00000000 
00001492 l       .debug_str	00000000 
0000149a l       .debug_str	00000000 
00001596 l       .debug_str	00000000 
0000169a l       .debug_str	00000000 
000016a8 l       .debug_str	00000000 
000016b3 l       .debug_str	00000000 
000016bd l       .debug_str	00000000 
000016d1 l       .debug_str	00000000 
000016dc l       .debug_str	00000000 
0000170a l       .debug_str	00000000 
00001785 l       .debug_str	00000000 
00001808 l       .debug_str	00000000 
00001816 l       .debug_str	00000000 
00001875 l       .debug_str	00000000 
000018dc l       .debug_str	00000000 
000018f2 l       .debug_str	00000000 
00001902 l       .debug_str	00000000 
00001911 l       .debug_str	00000000 
00001915 l       .debug_str	00000000 
0000191c l       .debug_str	00000000 
00001922 l       .debug_str	00000000 
00001926 l       .debug_str	00000000 
0000192c l       .debug_str	00000000 
00001932 l       .debug_str	00000000 
0000193e l       .debug_str	00000000 
00001946 l       .debug_str	00000000 
0000194c l       .debug_str	00000000 
00001954 l       .debug_str	00000000 
0000195a l       .debug_str	00000000 
0000197d l       .debug_str	00000000 
0000198d l       .debug_str	00000000 
000019c0 l       .debug_str	00000000 
00001a00 l       .debug_str	00000000 
00001a48 l       .debug_str	00000000 
00001a4c l       .debug_str	00000000 
00001a52 l       .debug_str	00000000 
00001a58 l       .debug_str	00000000 
00001a5e l       .debug_str	00000000 
00001a70 l       .debug_str	00000000 
00001aa5 l       .debug_str	00000000 
00001ae7 l       .debug_str	00000000 
00001b31 l       .debug_str	00000000 
00001b35 l       .debug_str	00000000 
00001b3b l       .debug_str	00000000 
00001b41 l       .debug_str	00000000 
00001b47 l       .debug_str	00000000 
00001b59 l       .debug_str	00000000 
00001b8e l       .debug_str	00000000 
00001bd0 l       .debug_str	00000000 
00001c1a l       .debug_str	00000000 
00001c1e l       .debug_str	00000000 
00001c24 l       .debug_str	00000000 
00001c2a l       .debug_str	00000000 
00001c30 l       .debug_str	00000000 
00001c36 l       .debug_str	00000000 
00001c47 l       .debug_str	00000000 
00001c7b l       .debug_str	00000000 
00001cbc l       .debug_str	00000000 
00001d05 l       .debug_str	00000000 
00001d0a l       .debug_str	00000000 
00001d0f l       .debug_str	00000000 
00001d13 l       .debug_str	00000000 
00001d19 l       .debug_str	00000000 
00001d1f l       .debug_str	00000000 
00001d25 l       .debug_str	00000000 
00001d36 l       .debug_str	00000000 
00001d6a l       .debug_str	00000000 
00001dab l       .debug_str	00000000 
00001df4 l       .debug_str	00000000 
00001df8 l       .debug_str	00000000 
00001e01 l       .debug_str	00000000 
00001e12 l       .debug_str	00000000 
00001e46 l       .debug_str	00000000 
00001e87 l       .debug_str	00000000 
00001ed0 l       .debug_str	00000000 
00001ed5 l       .debug_str	00000000 
00001ed9 l       .debug_str	00000000 
00001ee2 l       .debug_str	00000000 
00001ee9 l       .debug_str	00000000 
00001ef1 l       .debug_str	00000000 
00001f03 l       .debug_str	00000000 
00001f38 l       .debug_str	00000000 
00001f7a l       .debug_str	00000000 
00001fc4 l       .debug_str	00000000 
00001fc8 l       .debug_str	00000000 
00001fce l       .debug_str	00000000 
00001fd4 l       .debug_str	00000000 
00001fda l       .debug_str	00000000 
00001fe0 l       .debug_str	00000000 
00001fe8 l       .debug_str	00000000 
00001ff6 l       .debug_str	00000000 
00002005 l       .debug_str	00000000 
00002016 l       .debug_str	00000000 
00002021 l       .debug_str	00000000 
0000202c l       .debug_str	00000000 
00002037 l       .debug_str	00000000 
0000203e l       .debug_str	00000000 
00002061 l       .debug_str	00000000 
00002073 l       .debug_str	00000000 
000020a8 l       .debug_str	00000000 
000020ea l       .debug_str	00000000 
00002134 l       .debug_str	00000000 
00002138 l       .debug_str	00000000 
00002142 l       .debug_str	00000000 
00002154 l       .debug_str	00000000 
00002189 l       .debug_str	00000000 
00002215 l       .debug_str	00000000 
0000221a l       .debug_str	00000000 
00002224 l       .debug_str	00000000 
00002236 l       .debug_str	00000000 
0000226b l       .debug_str	00000000 
000022ad l       .debug_str	00000000 
000022f7 l       .debug_str	00000000 
0000230b l       .debug_str	00000000 
0000230f l       .debug_str	00000000 
0000231d l       .debug_str	00000000 
0000232d l       .debug_str	00000000 
00002336 l       .debug_str	00000000 
00002341 l       .debug_str	00000000 
00002350 l       .debug_str	00000000 
00002365 l       .debug_str	00000000 
00002396 l       .debug_str	00000000 
00002433 l       .debug_str	00000000 
000024d8 l       .debug_str	00000000 
000024e3 l       .debug_str	00000000 
000024ec l       .debug_str	00000000 
0000250d l       .debug_str	00000000 
00002520 l       .debug_str	00000000 
00002556 l       .debug_str	00000000 
000025d9 l       .debug_str	00000000 
00002664 l       .debug_str	00000000 
00002680 l       .debug_str	00000000 
000026cc l       .debug_str	00000000 
00002720 l       .debug_str	00000000 
0000273d l       .debug_str	00000000 
00002751 l       .debug_str	00000000 
0000279d l       .debug_str	00000000 
000027f1 l       .debug_str	00000000 
00002807 l       .debug_str	00000000 
0000281b l       .debug_str	00000000 
00002862 l       .debug_str	00000000 
000028b1 l       .debug_str	00000000 
000028ba l       .debug_str	00000000 
000028c8 l       .debug_str	00000000 
000028f9 l       .debug_str	00000000 
000028ff l       .debug_str	00000000 
00002907 l       .debug_str	00000000 
0000290e l       .debug_str	00000000 
00002916 l       .debug_str	00000000 
00002921 l       .debug_str	00000000 
00002929 l       .debug_str	00000000 
00002938 l       .debug_str	00000000 
0000293c l       .debug_str	00000000 
00002947 l       .debug_str	00000000 
00002953 l       .debug_str	00000000 
0000295e l       .debug_str	00000000 
0000296f l       .debug_str	00000000 
00002975 l       .debug_str	00000000 
0000297d l       .debug_str	00000000 
00002984 l       .debug_str	00000000 
0000298e l       .debug_str	00000000 
00002996 l       .debug_str	00000000 
0000299e l       .debug_str	00000000 
000029c0 l       .debug_str	00000000 
000029cb l       .debug_str	00000000 
000029d7 l       .debug_str	00000000 
000029df l       .debug_str	00000000 
000029e8 l       .debug_str	00000000 
000029f3 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.2	00000010 .Lanon.0225fb9332e4e78b260f33065c7b3030.2
00000000 l     O .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.4	00000010 .Lanon.0225fb9332e4e78b260f33065c7b3030.4
00000000 l    d  .text._ZN4core6result13unwrap_failed17h36f9698e0163315cE	00000000 .text._ZN4core6result13unwrap_failed17h36f9698e0163315cE
00000000 l    d  .text._ZN4core6result13unwrap_failed17h6fb9906b67310abfE	00000000 .text._ZN4core6result13unwrap_failed17h6fb9906b67310abfE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E
00000000 l    d  .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE	00000000 .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE
00000000 l    d  .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE	00000000 .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE
00000000 l    d  .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.0	00000000 .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.0
00000000 l    d  .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.1	00000000 .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.1
00000000 l    d  .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.3	00000000 .rodata..Lanon.0225fb9332e4e78b260f33065c7b3030.3
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E
00000000         *UND*	00000000 _ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h24ed07049a960f85E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17h6eff93599ae7026fE
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE
00000000         *UND*	00000000 .hidden _ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E
00000000 g     F .text._ZN4core6result13unwrap_failed17h36f9698e0163315cE	00000084 _ZN4core6result13unwrap_failed17h36f9698e0163315cE
00000000         *UND*	00000000 _ZN4core6result13unwrap_failed17h6c248e770c6c35d7E
00000000 g     F .text._ZN4core6result13unwrap_failed17h6fb9906b67310abfE	00000094 _ZN4core6result13unwrap_failed17h6fb9906b67310abfE
00000000         *UND*	00000000 _ZN4core6result13unwrap_failed17he36fc62af42cc300E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE	00000050 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E	0000005a _ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E	00000052 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE	00000054 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E	00000050 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE	000000ba _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE	000000ba _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE	000000ba _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E	000000ba _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE	000000ba _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E	000000c0 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE	000000cc _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E	000000ba _ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E
00000000 g     F .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE	000000ba _ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE
00000000         *UND*	00000000 _ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E
00000000         *UND*	00000000 _ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17ha2fd627f14e44dd1E
00000000         *UND*	00000000 _ZN62_$LT$druid_shell..error..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17hf448feb18771eb8eE
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E	00000012 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E	00000010 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E	0000001a _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E	0000000e _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE	00000020 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE
00000000 g     F .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE	00000028 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE
00000000         *UND*	00000000 _ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE
00000000         *UND*	00000000 _ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E



Disassembly of section .text._ZN4core6result13unwrap_failed17h36f9698e0163315cE:

00000000 <_ZN4core6result13unwrap_failed17h36f9698e0163315cE>:
_ZN4core6result13unwrap_failed17h36f9698e0163315cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:998
   0:	b098      	sub	sp, #96	; 0x60
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9007      	str	r0, [sp, #28]
   8:	9108      	str	r1, [sp, #32]
   a:	a807      	add	r0, sp, #28
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
   c:	9014      	str	r0, [sp, #80]	; 0x50
   e:	a809      	add	r0, sp, #36	; 0x24
  10:	9015      	str	r0, [sp, #84]	; 0x54
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:1
/*
  12:	9814      	ldr	r0, [sp, #80]	; 0x50
  14:	9016      	str	r0, [sp, #88]	; 0x58
  16:	9815      	ldr	r0, [sp, #84]	; 0x54
  18:	9017      	str	r0, [sp, #92]	; 0x5c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  1a:	9816      	ldr	r0, [sp, #88]	; 0x58
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:18
  1c:	f240 0100 	movw	r1, #0
  20:	f2c0 0100 	movt	r1, #0
  24:	9206      	str	r2, [sp, #24]
  26:	9305      	str	r3, [sp, #20]
  28:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h6eff93599ae7026fE>
  2c:	9004      	str	r0, [sp, #16]
  2e:	9103      	str	r1, [sp, #12]
  30:	e7ff      	b.n	32 <_ZN4core6result13unwrap_failed17h36f9698e0163315cE+0x32>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  32:	9817      	ldr	r0, [sp, #92]	; 0x5c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:18
  34:	f240 0100 	movw	r1, #0
  38:	f2c0 0100 	movt	r1, #0
  3c:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE>
  40:	9002      	str	r0, [sp, #8]
  42:	9101      	str	r1, [sp, #4]
  44:	e7ff      	b.n	46 <_ZN4core6result13unwrap_failed17h36f9698e0163315cE+0x46>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  46:	9804      	ldr	r0, [sp, #16]
  48:	9010      	str	r0, [sp, #64]	; 0x40
  4a:	9903      	ldr	r1, [sp, #12]
  4c:	9111      	str	r1, [sp, #68]	; 0x44
  4e:	9a02      	ldr	r2, [sp, #8]
  50:	9212      	str	r2, [sp, #72]	; 0x48
  52:	9b01      	ldr	r3, [sp, #4]
  54:	9313      	str	r3, [sp, #76]	; 0x4c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:18
  56:	46ec      	mov	ip, sp
  58:	f04f 0e02 	mov.w	lr, #2
  5c:	f8cc e000 	str.w	lr, [ip]
  60:	f240 0100 	movw	r1, #0
  64:	f2c0 0100 	movt	r1, #0
  68:	a80a      	add	r0, sp, #40	; 0x28
  6a:	ab10      	add	r3, sp, #64	; 0x40
  6c:	4672      	mov	r2, lr
  6e:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
  72:	e7ff      	b.n	2 <_ZN4core6result13unwrap_failed17h36f9698e0163315cE+0x2>
  74:	f240 0100 	movw	r1, #0
  78:	f2c0 0100 	movt	r1, #0
  7c:	a80a      	add	r0, sp, #40	; 0x28
  7e:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
  82:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN4core6result13unwrap_failed17h6fb9906b67310abfE:

00000000 <_ZN4core6result13unwrap_failed17h6fb9906b67310abfE>:
_ZN4core6result13unwrap_failed17h6fb9906b67310abfE():
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:1
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
  38:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h6eff93599ae7026fE>
  3c:	9005      	str	r0, [sp, #20]
  3e:	9104      	str	r1, [sp, #16]
  40:	e7ff      	b.n	42 <_ZN4core6result13unwrap_failed17h6fb9906b67310abfE+0x42>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:999
  42:	981b      	ldr	r0, [sp, #108]	; 0x6c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:18
  44:	f240 0100 	movw	r1, #0
  48:	f2c0 0100 	movt	r1, #0
  4c:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E>
  50:	9003      	str	r0, [sp, #12]
  52:	9102      	str	r1, [sp, #8]
  54:	e7ff      	b.n	56 <_ZN4core6result13unwrap_failed17h6fb9906b67310abfE+0x56>
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
  7e:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
  82:	e7ff      	b.n	2 <_ZN4core6result13unwrap_failed17h6fb9906b67310abfE+0x2>
  84:	f240 0100 	movw	r1, #0
  88:	f2c0 0100 	movt	r1, #0
  8c:	a80e      	add	r0, sp, #56	; 0x38
  8e:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
  92:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE>:
_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:824
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	f88d 0017 	strb.w	r0, [sp, #23]
   e:	9106      	str	r1, [sp, #24]
  10:	9207      	str	r2, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:826
  12:	f89d 0017 	ldrb.w	r0, [sp, #23]
  16:	07c1      	lsls	r1, r0, #31
  18:	2900      	cmp	r1, #0
  1a:	9304      	str	r3, [sp, #16]
  1c:	f8cd c00c 	str.w	ip, [sp, #12]
  20:	f8cd e008 	str.w	lr, [sp, #8]
  24:	9001      	str	r0, [sp, #4]
  26:	d005      	beq.n	34 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE+0x34>
  28:	e7ff      	b.n	2a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE+0x2a>
  2a:	9801      	ldr	r0, [sp, #4]
  2c:	2801      	cmp	r0, #1
  2e:	d007      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE+0x40>
  30:	e7ff      	b.n	32 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE+0x32>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  32:	defe      	udf	#254	; 0xfe
  34:	f89d 0017 	ldrb.w	r0, [sp, #23]
  38:	07c0      	lsls	r0, r0, #31
  3a:	2800      	cmp	r0, #0
  3c:	d005      	beq.n	4a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE+0x4a>
  3e:	e006      	b.n	4e <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE+0x4e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:827
  40:	9806      	ldr	r0, [sp, #24]
  42:	9907      	ldr	r1, [sp, #28]
  44:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE>
  48:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  4a:	b00a      	add	sp, #40	; 0x28
  4c:	bd80      	pop	{r7, pc}
  4e:	e7fc      	b.n	4a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE+0x4a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E>:
_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:824
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9106      	str	r1, [sp, #24]
   c:	9207      	str	r2, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:826
   e:	6800      	ldr	r0, [r0, #0]
  10:	2800      	cmp	r0, #0
  12:	9305      	str	r3, [sp, #20]
  14:	f8cd c010 	str.w	ip, [sp, #16]
  18:	f8cd e00c 	str.w	lr, [sp, #12]
  1c:	9002      	str	r0, [sp, #8]
  1e:	d005      	beq.n	2c <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E+0x2c>
  20:	e7ff      	b.n	22 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E+0x22>
  22:	9802      	ldr	r0, [sp, #8]
  24:	2801      	cmp	r0, #1
  26:	d00b      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E+0x40>
  28:	e7ff      	b.n	2a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E+0x2a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  2a:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:826
  2c:	9803      	ldr	r0, [sp, #12]
  2e:	6841      	ldr	r1, [r0, #4]
  30:	9108      	str	r1, [sp, #32]
  32:	9808      	ldr	r0, [sp, #32]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  34:	9903      	ldr	r1, [sp, #12]
  36:	680a      	ldr	r2, [r1, #0]
  38:	2a00      	cmp	r2, #0
  3a:	9001      	str	r0, [sp, #4]
  3c:	d009      	beq.n	52 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E+0x52>
  3e:	e00b      	b.n	58 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E+0x58>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:827
  40:	9803      	ldr	r0, [sp, #12]
  42:	6841      	ldr	r1, [r0, #4]
  44:	9109      	str	r1, [sp, #36]	; 0x24
  46:	9806      	ldr	r0, [sp, #24]
  48:	9907      	ldr	r1, [sp, #28]
  4a:	9a09      	ldr	r2, [sp, #36]	; 0x24
  4c:	f7ff fffe 	bl	0 <_ZN4core6result13unwrap_failed17h6c248e770c6c35d7E>
  50:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  52:	9801      	ldr	r0, [sp, #4]
  54:	b00a      	add	sp, #40	; 0x28
  56:	bd80      	pop	{r7, pc}
  58:	e7fb      	b.n	52 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E+0x52>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>:
_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:824
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9005      	str	r0, [sp, #20]
   c:	9106      	str	r1, [sp, #24]
   e:	9207      	str	r2, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:826
  10:	9805      	ldr	r0, [sp, #20]
  12:	1e41      	subs	r1, r0, #1
  14:	bf18      	it	ne
  16:	2101      	movne	r1, #1
  18:	2801      	cmp	r0, #1
  1a:	9304      	str	r3, [sp, #16]
  1c:	f8cd c00c 	str.w	ip, [sp, #12]
  20:	f8cd e008 	str.w	lr, [sp, #8]
  24:	9101      	str	r1, [sp, #4]
  26:	d005      	beq.n	34 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E+0x34>
  28:	e7ff      	b.n	2a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E+0x2a>
  2a:	9801      	ldr	r0, [sp, #4]
  2c:	2801      	cmp	r0, #1
  2e:	d005      	beq.n	3c <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E+0x3c>
  30:	e7ff      	b.n	32 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E+0x32>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  32:	defe      	udf	#254	; 0xfe
  34:	9805      	ldr	r0, [sp, #20]
  36:	2801      	cmp	r0, #1
  38:	d008      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E+0x4c>
  3a:	e009      	b.n	50 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E+0x50>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:827
  3c:	9805      	ldr	r0, [sp, #20]
  3e:	9009      	str	r0, [sp, #36]	; 0x24
  40:	9806      	ldr	r0, [sp, #24]
  42:	9907      	ldr	r1, [sp, #28]
  44:	9a09      	ldr	r2, [sp, #36]	; 0x24
  46:	f7ff fffe 	bl	0 <_ZN4core6result13unwrap_failed17h6c248e770c6c35d7E>
  4a:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  4c:	b00a      	add	sp, #40	; 0x28
  4e:	bd80      	pop	{r7, pc}
  50:	e7fc      	b.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E+0x4c>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE>:
_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:824
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9105      	str	r1, [sp, #20]
   c:	9206      	str	r2, [sp, #24]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:826
   e:	6800      	ldr	r0, [r0, #0]
  10:	2800      	cmp	r0, #0
  12:	9304      	str	r3, [sp, #16]
  14:	f8cd c00c 	str.w	ip, [sp, #12]
  18:	f8cd e008 	str.w	lr, [sp, #8]
  1c:	9001      	str	r0, [sp, #4]
  1e:	d005      	beq.n	2c <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE+0x2c>
  20:	e7ff      	b.n	22 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE+0x22>
  22:	9801      	ldr	r0, [sp, #4]
  24:	2801      	cmp	r0, #1
  26:	d006      	beq.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE+0x36>
  28:	e7ff      	b.n	2a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE+0x2a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  2a:	defe      	udf	#254	; 0xfe
  2c:	9802      	ldr	r0, [sp, #8]
  2e:	6801      	ldr	r1, [r0, #0]
  30:	2900      	cmp	r1, #0
  32:	d00c      	beq.n	4e <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE+0x4e>
  34:	e00d      	b.n	52 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE+0x52>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:827
  36:	9802      	ldr	r0, [sp, #8]
  38:	6841      	ldr	r1, [r0, #4]
  3a:	6882      	ldr	r2, [r0, #8]
  3c:	9108      	str	r1, [sp, #32]
  3e:	9209      	str	r2, [sp, #36]	; 0x24
  40:	9805      	ldr	r0, [sp, #20]
  42:	9906      	ldr	r1, [sp, #24]
  44:	9a08      	ldr	r2, [sp, #32]
  46:	9b09      	ldr	r3, [sp, #36]	; 0x24
  48:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE>
  4c:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  4e:	b00a      	add	sp, #40	; 0x28
  50:	bd80      	pop	{r7, pc}
  52:	e7fc      	b.n	4e <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE+0x4e>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E>:
_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:824
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	f88d 0017 	strb.w	r0, [sp, #23]
   e:	9106      	str	r1, [sp, #24]
  10:	9207      	str	r2, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:826
  12:	f89d 0017 	ldrb.w	r0, [sp, #23]
  16:	07c1      	lsls	r1, r0, #31
  18:	2900      	cmp	r1, #0
  1a:	9304      	str	r3, [sp, #16]
  1c:	f8cd c00c 	str.w	ip, [sp, #12]
  20:	f8cd e008 	str.w	lr, [sp, #8]
  24:	9001      	str	r0, [sp, #4]
  26:	d005      	beq.n	34 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E+0x34>
  28:	e7ff      	b.n	2a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E+0x2a>
  2a:	9801      	ldr	r0, [sp, #4]
  2c:	2801      	cmp	r0, #1
  2e:	d007      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E+0x40>
  30:	e7ff      	b.n	32 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E+0x32>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  32:	defe      	udf	#254	; 0xfe
  34:	f89d 0017 	ldrb.w	r0, [sp, #23]
  38:	07c0      	lsls	r0, r0, #31
  3a:	2800      	cmp	r0, #0
  3c:	d005      	beq.n	4a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E+0x4a>
  3e:	e006      	b.n	4e <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E+0x4e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:827
  40:	9806      	ldr	r0, [sp, #24]
  42:	9907      	ldr	r1, [sp, #28]
  44:	f7ff fffe 	bl	0 <_ZN4core6result13unwrap_failed17he36fc62af42cc300E>
  48:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:829
  4a:	b00a      	add	sp, #40	; 0x28
  4c:	bd80      	pop	{r7, pc}
  4e:	e7fc      	b.n	4a <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E+0x4a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	1e42      	subs	r2, r0, #1
  28:	bf18      	it	ne
  2a:	2201      	movne	r2, #1
  2c:	2801      	cmp	r0, #1
  2e:	9101      	str	r1, [sp, #4]
  30:	9200      	str	r2, [sp, #0]
  32:	d005      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x40>
  34:	e7ff      	b.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x36>
  36:	9800      	ldr	r0, [sp, #0]
  38:	2801      	cmp	r0, #1
  3a:	d007      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x4c>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  3e:	defe      	udf	#254	; 0xfe
  40:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  42:	f88d 001f 	strb.w	r0, [sp, #31]
  46:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4a:	e010      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x6e>
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  4e:	f88d 001e 	strb.w	r0, [sp, #30]
  52:	9902      	ldr	r1, [sp, #8]
  54:	9105      	str	r1, [sp, #20]
  56:	f88d 001d 	strb.w	r0, [sp, #29]
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	9006      	str	r0, [sp, #24]
  5e:	9806      	ldr	r0, [sp, #24]
  60:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE>
  64:	e7ff      	b.n	66 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x66>
  66:	2001      	movs	r0, #1
  68:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  6c:	e7ff      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x6e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  6e:	f89d 001d 	ldrb.w	r0, [sp, #29]
  72:	07c0      	lsls	r0, r0, #31
  74:	2800      	cmp	r0, #0
  76:	d104      	bne.n	82 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x82>
  78:	e7ff      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	2801      	cmp	r0, #1
  7e:	d008      	beq.n	92 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x92>
  80:	e011      	b.n	a6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0xa6>
  82:	2000      	movs	r0, #0
  84:	f88d 001d 	strb.w	r0, [sp, #29]
  88:	e7f7      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x7a>
  8a:	f89d 000f 	ldrb.w	r0, [sp, #15]
  8e:	b008      	add	sp, #32
  90:	bd80      	pop	{r7, pc}
  92:	f89d 001f 	ldrb.w	r0, [sp, #31]
  96:	07c0      	lsls	r0, r0, #31
  98:	2800      	cmp	r0, #0
  9a:	d0f6      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x8a>
  9c:	e7ff      	b.n	9e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	f88d 001f 	strb.w	r0, [sp, #31]
  a4:	e7f1      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x8a>
  a6:	f89d 001e 	ldrb.w	r0, [sp, #30]
  aa:	07c0      	lsls	r0, r0, #31
  ac:	2800      	cmp	r0, #0
  ae:	d0ec      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x8a>
  b0:	e7ff      	b.n	b2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0xb2>
  b2:	2000      	movs	r0, #0
  b4:	f88d 001e 	strb.w	r0, [sp, #30]
  b8:	e7e7      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE+0x8a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	1e42      	subs	r2, r0, #1
  28:	bf18      	it	ne
  2a:	2201      	movne	r2, #1
  2c:	2801      	cmp	r0, #1
  2e:	9101      	str	r1, [sp, #4]
  30:	9200      	str	r2, [sp, #0]
  32:	d005      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x40>
  34:	e7ff      	b.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x36>
  36:	9800      	ldr	r0, [sp, #0]
  38:	2801      	cmp	r0, #1
  3a:	d007      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x4c>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  3e:	defe      	udf	#254	; 0xfe
  40:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  42:	f88d 001f 	strb.w	r0, [sp, #31]
  46:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4a:	e010      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x6e>
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  4e:	f88d 001e 	strb.w	r0, [sp, #30]
  52:	9902      	ldr	r1, [sp, #8]
  54:	9105      	str	r1, [sp, #20]
  56:	f88d 001d 	strb.w	r0, [sp, #29]
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	9006      	str	r0, [sp, #24]
  5e:	9806      	ldr	r0, [sp, #24]
  60:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE>
  64:	e7ff      	b.n	66 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x66>
  66:	2001      	movs	r0, #1
  68:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  6c:	e7ff      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x6e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  6e:	f89d 001d 	ldrb.w	r0, [sp, #29]
  72:	07c0      	lsls	r0, r0, #31
  74:	2800      	cmp	r0, #0
  76:	d104      	bne.n	82 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x82>
  78:	e7ff      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	2801      	cmp	r0, #1
  7e:	d008      	beq.n	92 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x92>
  80:	e011      	b.n	a6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0xa6>
  82:	2000      	movs	r0, #0
  84:	f88d 001d 	strb.w	r0, [sp, #29]
  88:	e7f7      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x7a>
  8a:	f89d 000f 	ldrb.w	r0, [sp, #15]
  8e:	b008      	add	sp, #32
  90:	bd80      	pop	{r7, pc}
  92:	f89d 001f 	ldrb.w	r0, [sp, #31]
  96:	07c0      	lsls	r0, r0, #31
  98:	2800      	cmp	r0, #0
  9a:	d0f6      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x8a>
  9c:	e7ff      	b.n	9e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	f88d 001f 	strb.w	r0, [sp, #31]
  a4:	e7f1      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x8a>
  a6:	f89d 001e 	ldrb.w	r0, [sp, #30]
  aa:	07c0      	lsls	r0, r0, #31
  ac:	2800      	cmp	r0, #0
  ae:	d0ec      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x8a>
  b0:	e7ff      	b.n	b2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0xb2>
  b2:	2000      	movs	r0, #0
  b4:	f88d 001e 	strb.w	r0, [sp, #30]
  b8:	e7e7      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE+0x8a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	1e42      	subs	r2, r0, #1
  28:	bf18      	it	ne
  2a:	2201      	movne	r2, #1
  2c:	2801      	cmp	r0, #1
  2e:	9101      	str	r1, [sp, #4]
  30:	9200      	str	r2, [sp, #0]
  32:	d005      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x40>
  34:	e7ff      	b.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x36>
  36:	9800      	ldr	r0, [sp, #0]
  38:	2801      	cmp	r0, #1
  3a:	d007      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x4c>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  3e:	defe      	udf	#254	; 0xfe
  40:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  42:	f88d 001f 	strb.w	r0, [sp, #31]
  46:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4a:	e010      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x6e>
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  4e:	f88d 001e 	strb.w	r0, [sp, #30]
  52:	9902      	ldr	r1, [sp, #8]
  54:	9105      	str	r1, [sp, #20]
  56:	f88d 001d 	strb.w	r0, [sp, #29]
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	9006      	str	r0, [sp, #24]
  5e:	9806      	ldr	r0, [sp, #24]
  60:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E>
  64:	e7ff      	b.n	66 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x66>
  66:	2001      	movs	r0, #1
  68:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  6c:	e7ff      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x6e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  6e:	f89d 001d 	ldrb.w	r0, [sp, #29]
  72:	07c0      	lsls	r0, r0, #31
  74:	2800      	cmp	r0, #0
  76:	d104      	bne.n	82 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x82>
  78:	e7ff      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	2801      	cmp	r0, #1
  7e:	d008      	beq.n	92 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x92>
  80:	e011      	b.n	a6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0xa6>
  82:	2000      	movs	r0, #0
  84:	f88d 001d 	strb.w	r0, [sp, #29]
  88:	e7f7      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x7a>
  8a:	f89d 000f 	ldrb.w	r0, [sp, #15]
  8e:	b008      	add	sp, #32
  90:	bd80      	pop	{r7, pc}
  92:	f89d 001f 	ldrb.w	r0, [sp, #31]
  96:	07c0      	lsls	r0, r0, #31
  98:	2800      	cmp	r0, #0
  9a:	d0f6      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x8a>
  9c:	e7ff      	b.n	9e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	f88d 001f 	strb.w	r0, [sp, #31]
  a4:	e7f1      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x8a>
  a6:	f89d 001e 	ldrb.w	r0, [sp, #30]
  aa:	07c0      	lsls	r0, r0, #31
  ac:	2800      	cmp	r0, #0
  ae:	d0ec      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x8a>
  b0:	e7ff      	b.n	b2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0xb2>
  b2:	2000      	movs	r0, #0
  b4:	f88d 001e 	strb.w	r0, [sp, #30]
  b8:	e7e7      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE+0x8a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	1e42      	subs	r2, r0, #1
  28:	bf18      	it	ne
  2a:	2201      	movne	r2, #1
  2c:	2801      	cmp	r0, #1
  2e:	9101      	str	r1, [sp, #4]
  30:	9200      	str	r2, [sp, #0]
  32:	d005      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x40>
  34:	e7ff      	b.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x36>
  36:	9800      	ldr	r0, [sp, #0]
  38:	2801      	cmp	r0, #1
  3a:	d007      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x4c>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  3e:	defe      	udf	#254	; 0xfe
  40:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  42:	f88d 001f 	strb.w	r0, [sp, #31]
  46:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4a:	e010      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x6e>
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  4e:	f88d 001e 	strb.w	r0, [sp, #30]
  52:	9902      	ldr	r1, [sp, #8]
  54:	9105      	str	r1, [sp, #20]
  56:	f88d 001d 	strb.w	r0, [sp, #29]
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	9006      	str	r0, [sp, #24]
  5e:	9806      	ldr	r0, [sp, #24]
  60:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E>
  64:	e7ff      	b.n	66 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x66>
  66:	2001      	movs	r0, #1
  68:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  6c:	e7ff      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x6e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  6e:	f89d 001d 	ldrb.w	r0, [sp, #29]
  72:	07c0      	lsls	r0, r0, #31
  74:	2800      	cmp	r0, #0
  76:	d104      	bne.n	82 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x82>
  78:	e7ff      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	2801      	cmp	r0, #1
  7e:	d008      	beq.n	92 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x92>
  80:	e011      	b.n	a6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0xa6>
  82:	2000      	movs	r0, #0
  84:	f88d 001d 	strb.w	r0, [sp, #29]
  88:	e7f7      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x7a>
  8a:	f89d 000f 	ldrb.w	r0, [sp, #15]
  8e:	b008      	add	sp, #32
  90:	bd80      	pop	{r7, pc}
  92:	f89d 001f 	ldrb.w	r0, [sp, #31]
  96:	07c0      	lsls	r0, r0, #31
  98:	2800      	cmp	r0, #0
  9a:	d0f6      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x8a>
  9c:	e7ff      	b.n	9e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	f88d 001f 	strb.w	r0, [sp, #31]
  a4:	e7f1      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x8a>
  a6:	f89d 001e 	ldrb.w	r0, [sp, #30]
  aa:	07c0      	lsls	r0, r0, #31
  ac:	2800      	cmp	r0, #0
  ae:	d0ec      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x8a>
  b0:	e7ff      	b.n	b2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0xb2>
  b2:	2000      	movs	r0, #0
  b4:	f88d 001e 	strb.w	r0, [sp, #30]
  b8:	e7e7      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E+0x8a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	1e42      	subs	r2, r0, #1
  28:	bf18      	it	ne
  2a:	2201      	movne	r2, #1
  2c:	2801      	cmp	r0, #1
  2e:	9101      	str	r1, [sp, #4]
  30:	9200      	str	r2, [sp, #0]
  32:	d005      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x40>
  34:	e7ff      	b.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x36>
  36:	9800      	ldr	r0, [sp, #0]
  38:	2801      	cmp	r0, #1
  3a:	d007      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x4c>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  3e:	defe      	udf	#254	; 0xfe
  40:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  42:	f88d 001f 	strb.w	r0, [sp, #31]
  46:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4a:	e010      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x6e>
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  4e:	f88d 001e 	strb.w	r0, [sp, #30]
  52:	9902      	ldr	r1, [sp, #8]
  54:	9105      	str	r1, [sp, #20]
  56:	f88d 001d 	strb.w	r0, [sp, #29]
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	9006      	str	r0, [sp, #24]
  5e:	9806      	ldr	r0, [sp, #24]
  60:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E>
  64:	e7ff      	b.n	66 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x66>
  66:	2001      	movs	r0, #1
  68:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  6c:	e7ff      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x6e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  6e:	f89d 001d 	ldrb.w	r0, [sp, #29]
  72:	07c0      	lsls	r0, r0, #31
  74:	2800      	cmp	r0, #0
  76:	d104      	bne.n	82 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x82>
  78:	e7ff      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	2801      	cmp	r0, #1
  7e:	d008      	beq.n	92 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x92>
  80:	e011      	b.n	a6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0xa6>
  82:	2000      	movs	r0, #0
  84:	f88d 001d 	strb.w	r0, [sp, #29]
  88:	e7f7      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x7a>
  8a:	f89d 000f 	ldrb.w	r0, [sp, #15]
  8e:	b008      	add	sp, #32
  90:	bd80      	pop	{r7, pc}
  92:	f89d 001f 	ldrb.w	r0, [sp, #31]
  96:	07c0      	lsls	r0, r0, #31
  98:	2800      	cmp	r0, #0
  9a:	d0f6      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x8a>
  9c:	e7ff      	b.n	9e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	f88d 001f 	strb.w	r0, [sp, #31]
  a4:	e7f1      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x8a>
  a6:	f89d 001e 	ldrb.w	r0, [sp, #30]
  aa:	07c0      	lsls	r0, r0, #31
  ac:	2800      	cmp	r0, #0
  ae:	d0ec      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x8a>
  b0:	e7ff      	b.n	b2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0xb2>
  b2:	2000      	movs	r0, #0
  b4:	f88d 001e 	strb.w	r0, [sp, #30]
  b8:	e7e7      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE+0x8a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	f5b0 1288 	subs.w	r2, r0, #1114112	; 0x110000
  2a:	bf18      	it	ne
  2c:	2201      	movne	r2, #1
  2e:	f5b0 1f88 	cmp.w	r0, #1114112	; 0x110000
  32:	9101      	str	r1, [sp, #4]
  34:	9200      	str	r2, [sp, #0]
  36:	d005      	beq.n	44 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x44>
  38:	e7ff      	b.n	3a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x3a>
  3a:	9800      	ldr	r0, [sp, #0]
  3c:	2801      	cmp	r0, #1
  3e:	d007      	beq.n	50 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x50>
  40:	e7ff      	b.n	42 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x42>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  42:	defe      	udf	#254	; 0xfe
  44:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  46:	f88d 001f 	strb.w	r0, [sp, #31]
  4a:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4e:	e010      	b.n	72 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x72>
  50:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  52:	f88d 001e 	strb.w	r0, [sp, #30]
  56:	9902      	ldr	r1, [sp, #8]
  58:	9105      	str	r1, [sp, #20]
  5a:	f88d 001d 	strb.w	r0, [sp, #29]
  5e:	9805      	ldr	r0, [sp, #20]
  60:	9006      	str	r0, [sp, #24]
  62:	9806      	ldr	r0, [sp, #24]
  64:	f7ff fffe 	bl	0 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE>
  68:	e7ff      	b.n	6a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x6a>
  6a:	2001      	movs	r0, #1
  6c:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  70:	e7ff      	b.n	72 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x72>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  72:	f89d 001d 	ldrb.w	r0, [sp, #29]
  76:	07c0      	lsls	r0, r0, #31
  78:	2800      	cmp	r0, #0
  7a:	d105      	bne.n	88 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x88>
  7c:	e7ff      	b.n	7e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x7e>
  7e:	9802      	ldr	r0, [sp, #8]
  80:	f5b0 1f88 	cmp.w	r0, #1114112	; 0x110000
  84:	d008      	beq.n	98 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x98>
  86:	e011      	b.n	ac <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0xac>
  88:	2000      	movs	r0, #0
  8a:	f88d 001d 	strb.w	r0, [sp, #29]
  8e:	e7f6      	b.n	7e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x7e>
  90:	f89d 000f 	ldrb.w	r0, [sp, #15]
  94:	b008      	add	sp, #32
  96:	bd80      	pop	{r7, pc}
  98:	f89d 001f 	ldrb.w	r0, [sp, #31]
  9c:	07c0      	lsls	r0, r0, #31
  9e:	2800      	cmp	r0, #0
  a0:	d0f6      	beq.n	90 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x90>
  a2:	e7ff      	b.n	a4 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0xa4>
  a4:	2000      	movs	r0, #0
  a6:	f88d 001f 	strb.w	r0, [sp, #31]
  aa:	e7f1      	b.n	90 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x90>
  ac:	f89d 001e 	ldrb.w	r0, [sp, #30]
  b0:	07c0      	lsls	r0, r0, #31
  b2:	2800      	cmp	r0, #0
  b4:	d0ec      	beq.n	90 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x90>
  b6:	e7ff      	b.n	b8 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0xb8>
  b8:	2000      	movs	r0, #0
  ba:	f88d 001e 	strb.w	r0, [sp, #30]
  be:	e7e7      	b.n	90 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E+0x90>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9003      	str	r0, [sp, #12]
   a:	9104      	str	r1, [sp, #16]
   c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   e:	f88d 002f 	strb.w	r0, [sp, #47]	; 0x2f
  12:	f88d 002d 	strb.w	r0, [sp, #45]	; 0x2d
  16:	f88d 002e 	strb.w	r0, [sp, #46]	; 0x2e
  1a:	2001      	movs	r0, #1
  1c:	f88d 002e 	strb.w	r0, [sp, #46]	; 0x2e
  20:	f88d 002f 	strb.w	r0, [sp, #47]	; 0x2f
  24:	f88d 002d 	strb.w	r0, [sp, #45]	; 0x2d
  28:	9803      	ldr	r0, [sp, #12]
  2a:	2800      	cmp	r0, #0
  2c:	4601      	mov	r1, r0
  2e:	bf18      	it	ne
  30:	2101      	movne	r1, #1
  32:	2800      	cmp	r0, #0
  34:	9202      	str	r2, [sp, #8]
  36:	9301      	str	r3, [sp, #4]
  38:	9100      	str	r1, [sp, #0]
  3a:	d005      	beq.n	48 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x48>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x3e>
  3e:	9800      	ldr	r0, [sp, #0]
  40:	2801      	cmp	r0, #1
  42:	d007      	beq.n	54 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x54>
  44:	e7ff      	b.n	46 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x46>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  46:	defe      	udf	#254	; 0xfe
  48:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  4a:	f88d 002f 	strb.w	r0, [sp, #47]	; 0x2f
  4e:	f88d 0017 	strb.w	r0, [sp, #23]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  52:	e015      	b.n	80 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x80>
  54:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  56:	f88d 002e 	strb.w	r0, [sp, #46]	; 0x2e
  5a:	9903      	ldr	r1, [sp, #12]
  5c:	9a04      	ldr	r2, [sp, #16]
  5e:	9107      	str	r1, [sp, #28]
  60:	9208      	str	r2, [sp, #32]
  62:	f88d 002d 	strb.w	r0, [sp, #45]	; 0x2d
  66:	9807      	ldr	r0, [sp, #28]
  68:	9908      	ldr	r1, [sp, #32]
  6a:	9009      	str	r0, [sp, #36]	; 0x24
  6c:	910a      	str	r1, [sp, #40]	; 0x28
  6e:	9809      	ldr	r0, [sp, #36]	; 0x24
  70:	990a      	ldr	r1, [sp, #40]	; 0x28
  72:	f7ff fffe 	bl	0 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E>
  76:	e7ff      	b.n	78 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x78>
  78:	2001      	movs	r0, #1
  7a:	f88d 0017 	strb.w	r0, [sp, #23]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  7e:	e7ff      	b.n	80 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x80>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  80:	f89d 002d 	ldrb.w	r0, [sp, #45]	; 0x2d
  84:	07c0      	lsls	r0, r0, #31
  86:	2800      	cmp	r0, #0
  88:	d104      	bne.n	94 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x94>
  8a:	e7ff      	b.n	8c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x8c>
  8c:	9803      	ldr	r0, [sp, #12]
  8e:	2800      	cmp	r0, #0
  90:	d008      	beq.n	a4 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0xa4>
  92:	e011      	b.n	b8 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0xb8>
  94:	2000      	movs	r0, #0
  96:	f88d 002d 	strb.w	r0, [sp, #45]	; 0x2d
  9a:	e7f7      	b.n	8c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x8c>
  9c:	f89d 0017 	ldrb.w	r0, [sp, #23]
  a0:	b00c      	add	sp, #48	; 0x30
  a2:	bd80      	pop	{r7, pc}
  a4:	f89d 002f 	ldrb.w	r0, [sp, #47]	; 0x2f
  a8:	07c0      	lsls	r0, r0, #31
  aa:	2800      	cmp	r0, #0
  ac:	d0f6      	beq.n	9c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x9c>
  ae:	e7ff      	b.n	b0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0xb0>
  b0:	2000      	movs	r0, #0
  b2:	f88d 002f 	strb.w	r0, [sp, #47]	; 0x2f
  b6:	e7f1      	b.n	9c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x9c>
  b8:	f89d 002e 	ldrb.w	r0, [sp, #46]	; 0x2e
  bc:	07c0      	lsls	r0, r0, #31
  be:	2800      	cmp	r0, #0
  c0:	d0ec      	beq.n	9c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x9c>
  c2:	e7ff      	b.n	c4 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0xc4>
  c4:	2000      	movs	r0, #0
  c6:	f88d 002e 	strb.w	r0, [sp, #46]	; 0x2e
  ca:	e7e7      	b.n	9c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE+0x9c>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	1e42      	subs	r2, r0, #1
  28:	bf18      	it	ne
  2a:	2201      	movne	r2, #1
  2c:	2801      	cmp	r0, #1
  2e:	9101      	str	r1, [sp, #4]
  30:	9200      	str	r2, [sp, #0]
  32:	d005      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x40>
  34:	e7ff      	b.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x36>
  36:	9800      	ldr	r0, [sp, #0]
  38:	2801      	cmp	r0, #1
  3a:	d007      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x4c>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  3e:	defe      	udf	#254	; 0xfe
  40:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  42:	f88d 001f 	strb.w	r0, [sp, #31]
  46:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4a:	e010      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x6e>
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  4e:	f88d 001e 	strb.w	r0, [sp, #30]
  52:	9902      	ldr	r1, [sp, #8]
  54:	9105      	str	r1, [sp, #20]
  56:	f88d 001d 	strb.w	r0, [sp, #29]
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	9006      	str	r0, [sp, #24]
  5e:	9806      	ldr	r0, [sp, #24]
  60:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE>
  64:	e7ff      	b.n	66 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x66>
  66:	2001      	movs	r0, #1
  68:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  6c:	e7ff      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x6e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  6e:	f89d 001d 	ldrb.w	r0, [sp, #29]
  72:	07c0      	lsls	r0, r0, #31
  74:	2800      	cmp	r0, #0
  76:	d104      	bne.n	82 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x82>
  78:	e7ff      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	2801      	cmp	r0, #1
  7e:	d008      	beq.n	92 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x92>
  80:	e011      	b.n	a6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0xa6>
  82:	2000      	movs	r0, #0
  84:	f88d 001d 	strb.w	r0, [sp, #29]
  88:	e7f7      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x7a>
  8a:	f89d 000f 	ldrb.w	r0, [sp, #15]
  8e:	b008      	add	sp, #32
  90:	bd80      	pop	{r7, pc}
  92:	f89d 001f 	ldrb.w	r0, [sp, #31]
  96:	07c0      	lsls	r0, r0, #31
  98:	2800      	cmp	r0, #0
  9a:	d0f6      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x8a>
  9c:	e7ff      	b.n	9e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	f88d 001f 	strb.w	r0, [sp, #31]
  a4:	e7f1      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x8a>
  a6:	f89d 001e 	ldrb.w	r0, [sp, #30]
  aa:	07c0      	lsls	r0, r0, #31
  ac:	2800      	cmp	r0, #0
  ae:	d0ec      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x8a>
  b0:	e7ff      	b.n	b2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0xb2>
  b2:	2000      	movs	r0, #0
  b4:	f88d 001e 	strb.w	r0, [sp, #30]
  b8:	e7e7      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E+0x8a>

Disassembly of section .text._ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE:

00000000 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE>:
_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:519
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001d 	strb.w	r0, [sp, #29]
  12:	f88d 001e 	strb.w	r0, [sp, #30]
  16:	2001      	movs	r0, #1
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	f88d 001f 	strb.w	r0, [sp, #31]
  20:	f88d 001d 	strb.w	r0, [sp, #29]
  24:	9802      	ldr	r0, [sp, #8]
  26:	1e42      	subs	r2, r0, #1
  28:	bf18      	it	ne
  2a:	2201      	movne	r2, #1
  2c:	2801      	cmp	r0, #1
  2e:	9101      	str	r1, [sp, #4]
  30:	9200      	str	r2, [sp, #0]
  32:	d005      	beq.n	40 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x40>
  34:	e7ff      	b.n	36 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x36>
  36:	9800      	ldr	r0, [sp, #0]
  38:	2801      	cmp	r0, #1
  3a:	d007      	beq.n	4c <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x4c>
  3c:	e7ff      	b.n	3e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  3e:	defe      	udf	#254	; 0xfe
  40:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:521
  42:	f88d 001f 	strb.w	r0, [sp, #31]
  46:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  4a:	e010      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x6e>
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:522
  4e:	f88d 001e 	strb.w	r0, [sp, #30]
  52:	9902      	ldr	r1, [sp, #8]
  54:	9105      	str	r1, [sp, #20]
  56:	f88d 001d 	strb.w	r0, [sp, #29]
  5a:	9805      	ldr	r0, [sp, #20]
  5c:	9006      	str	r0, [sp, #24]
  5e:	9806      	ldr	r0, [sp, #24]
  60:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE>
  64:	e7ff      	b.n	66 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x66>
  66:	2001      	movs	r0, #1
  68:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:520
  6c:	e7ff      	b.n	6e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x6e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:524
  6e:	f89d 001d 	ldrb.w	r0, [sp, #29]
  72:	07c0      	lsls	r0, r0, #31
  74:	2800      	cmp	r0, #0
  76:	d104      	bne.n	82 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x82>
  78:	e7ff      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x7a>
  7a:	9802      	ldr	r0, [sp, #8]
  7c:	2801      	cmp	r0, #1
  7e:	d008      	beq.n	92 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x92>
  80:	e011      	b.n	a6 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0xa6>
  82:	2000      	movs	r0, #0
  84:	f88d 001d 	strb.w	r0, [sp, #29]
  88:	e7f7      	b.n	7a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x7a>
  8a:	f89d 000f 	ldrb.w	r0, [sp, #15]
  8e:	b008      	add	sp, #32
  90:	bd80      	pop	{r7, pc}
  92:	f89d 001f 	ldrb.w	r0, [sp, #31]
  96:	07c0      	lsls	r0, r0, #31
  98:	2800      	cmp	r0, #0
  9a:	d0f6      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x8a>
  9c:	e7ff      	b.n	9e <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	f88d 001f 	strb.w	r0, [sp, #31]
  a4:	e7f1      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x8a>
  a6:	f89d 001e 	ldrb.w	r0, [sp, #30]
  aa:	07c0      	lsls	r0, r0, #31
  ac:	2800      	cmp	r0, #0
  ae:	d0ec      	beq.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x8a>
  b0:	e7ff      	b.n	b2 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0xb2>
  b2:	2000      	movs	r0, #0
  b4:	f88d 001e 	strb.w	r0, [sp, #30]
  b8:	e7e7      	b.n	8a <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE+0x8a>

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1292
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1293
   6:	9801      	ldr	r0, [sp, #4]
   8:	9002      	str	r0, [sp, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1294
   a:	9802      	ldr	r0, [sp, #8]
   c:	9100      	str	r1, [sp, #0]
   e:	b003      	add	sp, #12
  10:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1292
   0:	b081      	sub	sp, #4
   2:	2001      	movs	r0, #1
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1293
   4:	f88d 0003 	strb.w	r0, [sp, #3]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1294
   8:	f89d 0003 	ldrb.w	r0, [sp, #3]
   c:	b001      	add	sp, #4
   e:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1282
   0:	b082      	sub	sp, #8
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1283
   6:	f8d1 c000 	ldr.w	ip, [r1]
   a:	6849      	ldr	r1, [r1, #4]
   c:	6041      	str	r1, [r0, #4]
   e:	f8c0 c000 	str.w	ip, [r0]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1284
  12:	9201      	str	r2, [sp, #4]
  14:	9300      	str	r3, [sp, #0]
  16:	b002      	add	sp, #8
  18:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1282
   0:	b082      	sub	sp, #8
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1283
   6:	9801      	ldr	r0, [sp, #4]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1284
   8:	9100      	str	r1, [sp, #0]
   a:	b002      	add	sp, #8
   c:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1282
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b082      	sub	sp, #8
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1283
   8:	e8b1 5030 	ldmia.w	r1!, {r4, r5, ip, lr}
   c:	e8a0 5030 	stmia.w	r0!, {r4, r5, ip, lr}
  10:	e891 5030 	ldmia.w	r1, {r4, r5, ip, lr}
  14:	e880 5030 	stmia.w	r0, {r4, r5, ip, lr}
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1284
  18:	9201      	str	r2, [sp, #4]
  1a:	9300      	str	r3, [sp, #0]
  1c:	b002      	add	sp, #8
  1e:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE:

00000000 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE>:
_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1282
   0:	b510      	push	{r4, lr}
   2:	b082      	sub	sp, #8
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1283
   8:	f8d1 c000 	ldr.w	ip, [r1]
   c:	f8d1 e004 	ldr.w	lr, [r1, #4]
  10:	688c      	ldr	r4, [r1, #8]
  12:	68c9      	ldr	r1, [r1, #12]
  14:	60c1      	str	r1, [r0, #12]
  16:	6084      	str	r4, [r0, #8]
  18:	f8c0 e004 	str.w	lr, [r0, #4]
  1c:	f8c0 c000 	str.w	ip, [r0]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/result.rs:1284
  20:	9201      	str	r2, [sp, #4]
  22:	9300      	str	r3, [sp, #0]
  24:	b002      	add	sp, #8
  26:	bd10      	pop	{r4, pc}

app-9b7b12e8d5cbce98.1zfer0cyyeyxyymg.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 1zfer0cyyeyxyymg
000006e6 l       .debug_str	00000000 
000006d2 l       .debug_str	00000000 
000006dd l       .debug_str	00000000 
00000709 l       .debug_str	00000000 
00000728 l       .debug_str	00000000 
0000072d l       .debug_str	00000000 
00000754 l       .debug_str	00000000 
00000759 l       .debug_str	00000000 
0000075f l       .debug_str	00000000 
00000765 l       .debug_str	00000000 
00000774 l       .debug_str	00000000 
0000077b l       .debug_str	00000000 
0000077f l       .debug_str	00000000 
00000788 l       .debug_str	00000000 
00000790 l       .debug_str	00000000 
00000798 l       .debug_str	00000000 
0000079f l       .debug_str	00000000 
000007b3 l       .debug_str	00000000 
000007bf l       .debug_str	00000000 
000007cb l       .debug_str	00000000 
000007e4 l       .debug_str	00000000 
000007e9 l       .debug_str	00000000 
000007fa l       .debug_str	00000000 
00000804 l       .debug_str	00000000 
00000812 l       .debug_str	00000000 
00000816 l       .debug_str	00000000 
00000821 l       .debug_str	00000000 
00000828 l       .debug_str	00000000 
0000082e l       .debug_str	00000000 
00000832 l       .debug_str	00000000 
00000836 l       .debug_str	00000000 
0000083e l       .debug_str	00000000 
00000855 l       .debug_str	00000000 
00000879 l       .debug_str	00000000 
00000895 l       .debug_str	00000000 
0000089f l       .debug_str	00000000 
000008b9 l       .debug_str	00000000 
00000917 l       .debug_str	00000000 
00000922 l       .debug_str	00000000 
0000093f l       .debug_str	00000000 
00000958 l       .debug_str	00000000 
00000962 l       .debug_str	00000000 
00000978 l       .debug_str	00000000 
0000097e l       .debug_str	00000000 
00000984 l       .debug_str	00000000 
000009a5 l       .debug_str	00000000 
000009c7 l       .debug_str	00000000 
000009ca l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
00000093 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000aa l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000c2 l       .debug_str	00000000 
000000cd l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000118 l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
0000013f l       .debug_str	00000000 
00000149 l       .debug_str	00000000 
00000156 l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
00000167 l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
0000016e l       .debug_str	00000000 
00000171 l       .debug_str	00000000 
00000174 l       .debug_str	00000000 
00000179 l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
0000018e l       .debug_str	00000000 
00000198 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001a6 l       .debug_str	00000000 
000001aa l       .debug_str	00000000 
000001b5 l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
000001c4 l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e6 l       .debug_str	00000000 
000001f2 l       .debug_str	00000000 
00000228 l       .debug_str	00000000 
0000022c l       .debug_str	00000000 
00000263 l       .debug_str	00000000 
00000268 l       .debug_str	00000000 
0000026c l       .debug_str	00000000 
00000270 l       .debug_str	00000000 
00000273 l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
00000277 l       .debug_str	00000000 
0000029f l       .debug_str	00000000 
0000031a l       .debug_str	00000000 
00000320 l       .debug_str	00000000 
00000358 l       .debug_str	00000000 
00000391 l       .debug_str	00000000 
00000407 l       .debug_str	00000000 
0000040f l       .debug_str	00000000 
00000486 l       .debug_str	00000000 
0000048f l       .debug_str	00000000 
000004c8 l       .debug_str	00000000 
0000054c l       .debug_str	00000000 
00000555 l       .debug_str	00000000 
0000055a l       .debug_str	00000000 
0000057a l       .debug_str	00000000 
00000587 l       .debug_str	00000000 
0000058a l       .debug_str	00000000 
0000058e l       .debug_str	00000000 
00000598 l       .debug_str	00000000 
000005a3 l       .debug_str	00000000 
000005ad l       .debug_str	00000000 
000005b6 l       .debug_str	00000000 
000005c7 l       .debug_str	00000000 
000005ee l       .debug_str	00000000 
000005f1 l       .debug_str	00000000 
000005fa l       .debug_str	00000000 
000005ff l       .debug_str	00000000 
00000609 l       .debug_str	00000000 
0000060e l       .debug_str	00000000 
00000614 l       .debug_str	00000000 
00000619 l       .debug_str	00000000 
0000061e l       .debug_str	00000000 
00000625 l       .debug_str	00000000 
0000062e l       .debug_str	00000000 
00000638 l       .debug_str	00000000 
0000063f l       .debug_str	00000000 
00000645 l       .debug_str	00000000 
0000064a l       .debug_str	00000000 
00000656 l       .debug_str	00000000 
0000065e l       .debug_str	00000000 
00000665 l       .debug_str	00000000 
0000066a l       .debug_str	00000000 
00000673 l       .debug_str	00000000 
00000678 l       .debug_str	00000000 
0000067b l       .debug_str	00000000 
00000684 l       .debug_str	00000000 
0000068b l       .debug_str	00000000 
00000690 l       .debug_str	00000000 
00000695 l       .debug_str	00000000 
0000069b l       .debug_str	00000000 
000006a1 l       .debug_str	00000000 
000006ab l       .debug_str	00000000 
000006ae l       .debug_str	00000000 
000006b4 l       .debug_str	00000000 
000006be l       .debug_str	00000000 
000006c6 l       .debug_str	00000000 
000006cc l       .debug_str	00000000 
00000000 l     O .rodata.cst4	00000004 .Lanon.1a68dc5987f6def67a397007d32ad73f.0
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.11	00000008 .Lanon.1a68dc5987f6def67a397007d32ad73f.11
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.12	00000010 .Lanon.1a68dc5987f6def67a397007d32ad73f.12
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.14	00000008 .Lanon.1a68dc5987f6def67a397007d32ad73f.14
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.15	00000010 .Lanon.1a68dc5987f6def67a397007d32ad73f.15
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.17	00000008 .Lanon.1a68dc5987f6def67a397007d32ad73f.17
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.18	00000010 .Lanon.1a68dc5987f6def67a397007d32ad73f.18
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.19	00000018 .Lanon.1a68dc5987f6def67a397007d32ad73f.19
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.4	00000018 .Lanon.1a68dc5987f6def67a397007d32ad73f.4
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.6	00000008 .Lanon.1a68dc5987f6def67a397007d32ad73f.6
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.7	00000000 .Lanon.1a68dc5987f6def67a397007d32ad73f.7
00000000 l     O .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.9	00000010 .Lanon.1a68dc5987f6def67a397007d32ad73f.9
00000000 l     O .rodata.str.0	0000001a str.0
00000000 l     O .rodata.str.1	00000021 str.1
00000000 l    d  .text._ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE	00000000 .text._ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE
00000000 l    d  .text._ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E	00000000 .text._ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E
00000000 l    d  .text._ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E	00000000 .text._ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E
00000000 l    d  .text._ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE	00000000 .text._ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE
00000000 l    d  .text._ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E	00000000 .text._ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E
00000000 l    d  .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE	00000000 .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE
00000000 l    d  .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E	00000000 .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E
00000000 l    d  .text._ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE	00000000 .text._ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE
00000000 l    d  .text._ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE	00000000 .text._ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.1	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.1
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.2	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.2
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.3	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.3
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.5	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.5
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.8	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.8
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.10	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.10
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.13	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.13
00000000 l    d  .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.16	00000000 .rodata..Lanon.1a68dc5987f6def67a397007d32ad73f.16
00000000 l    d  .rodata.str.0	00000000 .rodata.str.0
00000000 l    d  .rodata.str.1	00000000 .rodata.str.1
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE	0000000c .hidden _ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE
00000000 g     F .text._ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E	0000011a .hidden _ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E
00000000 g     F .text._ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE	00000002 .hidden _ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE
00000000 g     F .text._ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE	00000010 .hidden _ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE
00000000 g     F .text._ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E	0000031a .hidden _ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E
00000000         *UND*	00000000 _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h454ef22920ac32f5E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17hfa0c1fd27421f772E
00000000         *UND*	00000000 .hidden _ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E
00000000         *UND*	00000000 _ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h70be3ebb33ef544dE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17he59896ae2e279711E
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 _ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E
00000000         *UND*	00000000 _ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h3e269ca172b8335aE
00000000 g     F .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE	00000026 _ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE
00000000 g     F .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E	00000026 _ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E
00000000 g     F .text._ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E	00000084 _ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E
00000000 g     F .text._ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE	00000058 _ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE
00000000         *UND*	00000000 hal_gpio_init_out
00000000         *UND*	00000000 hal_gpio_write
00000000         *UND*	00000000 hal_spi_config
00000000         *UND*	00000000 hal_spi_enable
00000000         *UND*	00000000 hal_spi_txrx
00000000         *UND*	00000000 os_time_delay



Disassembly of section .text._ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE:

00000000 <_ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE>:
_ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:11
};

/// Rust Embedded HAL interface for Mynewt SPI
impl MynewtSPI {
    /// Create a new SPI port
    pub fn new() -> Self {
   0:	b082      	sub	sp, #8
   2:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:12
        MynewtSPI {
   4:	9000      	str	r0, [sp, #0]
   6:	9001      	str	r0, [sp, #4]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:16
            spi_num: 0,
            cs_pin:  0,
        }
    }
   8:	9800      	ldr	r0, [sp, #0]
   a:	9901      	ldr	r1, [sp, #4]
   c:	b002      	add	sp, #8
   e:	4770      	bx	lr

Disassembly of section .text._ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E:

00000000 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E>:
_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:19

    /// Initiaise the SPI port
    pub fn init(&mut self, spi_num: i32, cs_pin: i32, spi_settings: *mut hal::hal_spi_settings) 
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0fa      	sub	sp, #488	; 0x1e8
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9017      	str	r0, [sp, #92]	; 0x5c
   e:	9118      	str	r1, [sp, #96]	; 0x60
  10:	9219      	str	r2, [sp, #100]	; 0x64
  12:	931a      	str	r3, [sp, #104]	; 0x68
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:21
        -> MynewtResult<()> {
        let rc = unsafe { hal::hal_spi_config(spi_num, spi_settings) };
  14:	9818      	ldr	r0, [sp, #96]	; 0x60
  16:	991a      	ldr	r1, [sp, #104]	; 0x68
  18:	f8cd c058 	str.w	ip, [sp, #88]	; 0x58
  1c:	f8cd e054 	str.w	lr, [sp, #84]	; 0x54
  20:	9414      	str	r4, [sp, #80]	; 0x50
  22:	9513      	str	r5, [sp, #76]	; 0x4c
  24:	f7ff fffe 	bl	0 <hal_spi_config>
  28:	901c      	str	r0, [sp, #112]	; 0x70
  2a:	e7ff      	b.n	2c <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x2c>
  2c:	a81c      	add	r0, sp, #112	; 0x70
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:22
        assert_eq!(rc, 0, "spi config fail");
  2e:	901d      	str	r0, [sp, #116]	; 0x74
  30:	f240 0000 	movw	r0, #0
  34:	f2c0 0000 	movt	r0, #0
  38:	901e      	str	r0, [sp, #120]	; 0x78
  3a:	981d      	ldr	r0, [sp, #116]	; 0x74
  3c:	901f      	str	r0, [sp, #124]	; 0x7c
  3e:	981e      	ldr	r0, [sp, #120]	; 0x78
  40:	9020      	str	r0, [sp, #128]	; 0x80
  42:	981f      	ldr	r0, [sp, #124]	; 0x7c
  44:	6800      	ldr	r0, [r0, #0]
  46:	9920      	ldr	r1, [sp, #128]	; 0x80
  48:	6809      	ldr	r1, [r1, #0]
  4a:	4288      	cmp	r0, r1
  4c:	d014      	beq.n	78 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x78>
  4e:	e7ff      	b.n	50 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x50>
  50:	981f      	ldr	r0, [sp, #124]	; 0x7c
  52:	9030      	str	r0, [sp, #192]	; 0xc0
  54:	9820      	ldr	r0, [sp, #128]	; 0x80
  56:	9031      	str	r0, [sp, #196]	; 0xc4
  58:	4668      	mov	r0, sp
  5a:	2100      	movs	r1, #0
  5c:	6001      	str	r1, [r0, #0]
  5e:	f240 0100 	movw	r1, #0
  62:	f2c0 0100 	movt	r1, #0
  66:	f240 0300 	movw	r3, #0
  6a:	f2c0 0300 	movt	r3, #0
  6e:	a832      	add	r0, sp, #200	; 0xc8
  70:	2201      	movs	r2, #1
  72:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
  76:	e004      	b.n	82 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x82>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:24

        let rc = unsafe { hal::hal_spi_enable(spi_num) };
  78:	9818      	ldr	r0, [sp, #96]	; 0x60
  7a:	f7ff fffe 	bl	0 <hal_spi_enable>
  7e:	903b      	str	r0, [sp, #236]	; 0xec
  80:	e04e      	b.n	120 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x120>
  82:	a830      	add	r0, sp, #192	; 0xc0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:22
        assert_eq!(rc, 0, "spi config fail");
  84:	902d      	str	r0, [sp, #180]	; 0xb4
  86:	a831      	add	r0, sp, #196	; 0xc4
  88:	902e      	str	r0, [sp, #184]	; 0xb8
  8a:	a832      	add	r0, sp, #200	; 0xc8
  8c:	902f      	str	r0, [sp, #188]	; 0xbc
  8e:	982d      	ldr	r0, [sp, #180]	; 0xb4
  90:	9038      	str	r0, [sp, #224]	; 0xe0
  92:	982e      	ldr	r0, [sp, #184]	; 0xb8
  94:	9039      	str	r0, [sp, #228]	; 0xe4
  96:	982f      	ldr	r0, [sp, #188]	; 0xbc
  98:	903a      	str	r0, [sp, #232]	; 0xe8
  9a:	9838      	ldr	r0, [sp, #224]	; 0xe0
  9c:	f240 0100 	movw	r1, #0
  a0:	f2c0 0100 	movt	r1, #0
  a4:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
  a8:	9012      	str	r0, [sp, #72]	; 0x48
  aa:	9111      	str	r1, [sp, #68]	; 0x44
  ac:	e7ff      	b.n	ae <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0xae>
  ae:	9839      	ldr	r0, [sp, #228]	; 0xe4
  b0:	f240 0100 	movw	r1, #0
  b4:	f2c0 0100 	movt	r1, #0
  b8:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
  bc:	9010      	str	r0, [sp, #64]	; 0x40
  be:	910f      	str	r1, [sp, #60]	; 0x3c
  c0:	e7ff      	b.n	c2 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0xc2>
  c2:	983a      	ldr	r0, [sp, #232]	; 0xe8
  c4:	f240 0100 	movw	r1, #0
  c8:	f2c0 0100 	movt	r1, #0
  cc:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17hfa0c1fd27421f772E>
  d0:	900e      	str	r0, [sp, #56]	; 0x38
  d2:	910d      	str	r1, [sp, #52]	; 0x34
  d4:	e7ff      	b.n	d6 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0xd6>
  d6:	9812      	ldr	r0, [sp, #72]	; 0x48
  d8:	9027      	str	r0, [sp, #156]	; 0x9c
  da:	9911      	ldr	r1, [sp, #68]	; 0x44
  dc:	9128      	str	r1, [sp, #160]	; 0xa0
  de:	9a10      	ldr	r2, [sp, #64]	; 0x40
  e0:	9229      	str	r2, [sp, #164]	; 0xa4
  e2:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
  e4:	932a      	str	r3, [sp, #168]	; 0xa8
  e6:	f8dd c038 	ldr.w	ip, [sp, #56]	; 0x38
  ea:	f8cd c0ac 	str.w	ip, [sp, #172]	; 0xac
  ee:	f8dd e034 	ldr.w	lr, [sp, #52]	; 0x34
  f2:	f8cd e0b0 	str.w	lr, [sp, #176]	; 0xb0
  f6:	466c      	mov	r4, sp
  f8:	2503      	movs	r5, #3
  fa:	6025      	str	r5, [r4, #0]
  fc:	f240 0100 	movw	r1, #0
 100:	f2c0 0100 	movt	r1, #0
 104:	a821      	add	r0, sp, #132	; 0x84
 106:	ab27      	add	r3, sp, #156	; 0x9c
 108:	462a      	mov	r2, r5
 10a:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 10e:	e7ff      	b.n	2 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x2>
 110:	f240 0100 	movw	r1, #0
 114:	f2c0 0100 	movt	r1, #0
 118:	a821      	add	r0, sp, #132	; 0x84
 11a:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 11e:	defe      	udf	#254	; 0xfe
 120:	a83b      	add	r0, sp, #236	; 0xec
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:25
        assert_eq!(rc, 0, "spi enable fail");
 122:	903c      	str	r0, [sp, #240]	; 0xf0
 124:	f240 0000 	movw	r0, #0
 128:	f2c0 0000 	movt	r0, #0
 12c:	903d      	str	r0, [sp, #244]	; 0xf4
 12e:	983c      	ldr	r0, [sp, #240]	; 0xf0
 130:	903e      	str	r0, [sp, #248]	; 0xf8
 132:	983d      	ldr	r0, [sp, #244]	; 0xf4
 134:	903f      	str	r0, [sp, #252]	; 0xfc
 136:	983e      	ldr	r0, [sp, #248]	; 0xf8
 138:	6800      	ldr	r0, [r0, #0]
 13a:	993f      	ldr	r1, [sp, #252]	; 0xfc
 13c:	6809      	ldr	r1, [r1, #0]
 13e:	4288      	cmp	r0, r1
 140:	d014      	beq.n	16c <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x16c>
 142:	e7ff      	b.n	144 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x144>
 144:	983e      	ldr	r0, [sp, #248]	; 0xf8
 146:	904f      	str	r0, [sp, #316]	; 0x13c
 148:	983f      	ldr	r0, [sp, #252]	; 0xfc
 14a:	9050      	str	r0, [sp, #320]	; 0x140
 14c:	4668      	mov	r0, sp
 14e:	2100      	movs	r1, #0
 150:	6001      	str	r1, [r0, #0]
 152:	f240 0100 	movw	r1, #0
 156:	f2c0 0100 	movt	r1, #0
 15a:	f240 0300 	movw	r3, #0
 15e:	f2c0 0300 	movt	r3, #0
 162:	a851      	add	r0, sp, #324	; 0x144
 164:	2201      	movs	r2, #1
 166:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 16a:	e005      	b.n	178 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x178>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:27

        let rc = unsafe { hal::hal_gpio_init_out(cs_pin, 1) };
 16c:	9819      	ldr	r0, [sp, #100]	; 0x64
 16e:	2101      	movs	r1, #1
 170:	f7ff fffe 	bl	0 <hal_gpio_init_out>
 174:	905a      	str	r0, [sp, #360]	; 0x168
 176:	e04e      	b.n	216 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x216>
 178:	a84f      	add	r0, sp, #316	; 0x13c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:25
        assert_eq!(rc, 0, "spi enable fail");
 17a:	904c      	str	r0, [sp, #304]	; 0x130
 17c:	a850      	add	r0, sp, #320	; 0x140
 17e:	904d      	str	r0, [sp, #308]	; 0x134
 180:	a851      	add	r0, sp, #324	; 0x144
 182:	904e      	str	r0, [sp, #312]	; 0x138
 184:	984c      	ldr	r0, [sp, #304]	; 0x130
 186:	9057      	str	r0, [sp, #348]	; 0x15c
 188:	984d      	ldr	r0, [sp, #308]	; 0x134
 18a:	9058      	str	r0, [sp, #352]	; 0x160
 18c:	984e      	ldr	r0, [sp, #312]	; 0x138
 18e:	9059      	str	r0, [sp, #356]	; 0x164
 190:	9857      	ldr	r0, [sp, #348]	; 0x15c
 192:	f240 0100 	movw	r1, #0
 196:	f2c0 0100 	movt	r1, #0
 19a:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
 19e:	900c      	str	r0, [sp, #48]	; 0x30
 1a0:	910b      	str	r1, [sp, #44]	; 0x2c
 1a2:	e7ff      	b.n	1a4 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x1a4>
 1a4:	9858      	ldr	r0, [sp, #352]	; 0x160
 1a6:	f240 0100 	movw	r1, #0
 1aa:	f2c0 0100 	movt	r1, #0
 1ae:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
 1b2:	900a      	str	r0, [sp, #40]	; 0x28
 1b4:	9109      	str	r1, [sp, #36]	; 0x24
 1b6:	e7ff      	b.n	1b8 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x1b8>
 1b8:	9859      	ldr	r0, [sp, #356]	; 0x164
 1ba:	f240 0100 	movw	r1, #0
 1be:	f2c0 0100 	movt	r1, #0
 1c2:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17hfa0c1fd27421f772E>
 1c6:	9008      	str	r0, [sp, #32]
 1c8:	9107      	str	r1, [sp, #28]
 1ca:	e7ff      	b.n	1cc <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x1cc>
 1cc:	980c      	ldr	r0, [sp, #48]	; 0x30
 1ce:	9046      	str	r0, [sp, #280]	; 0x118
 1d0:	990b      	ldr	r1, [sp, #44]	; 0x2c
 1d2:	9147      	str	r1, [sp, #284]	; 0x11c
 1d4:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 1d6:	9248      	str	r2, [sp, #288]	; 0x120
 1d8:	9b09      	ldr	r3, [sp, #36]	; 0x24
 1da:	9349      	str	r3, [sp, #292]	; 0x124
 1dc:	f8dd c020 	ldr.w	ip, [sp, #32]
 1e0:	f8cd c128 	str.w	ip, [sp, #296]	; 0x128
 1e4:	f8dd e01c 	ldr.w	lr, [sp, #28]
 1e8:	f8cd e12c 	str.w	lr, [sp, #300]	; 0x12c
 1ec:	466c      	mov	r4, sp
 1ee:	2503      	movs	r5, #3
 1f0:	6025      	str	r5, [r4, #0]
 1f2:	f240 0100 	movw	r1, #0
 1f6:	f2c0 0100 	movt	r1, #0
 1fa:	a840      	add	r0, sp, #256	; 0x100
 1fc:	ab46      	add	r3, sp, #280	; 0x118
 1fe:	462a      	mov	r2, r5
 200:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 204:	e7ff      	b.n	2 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x2>
 206:	f240 0100 	movw	r1, #0
 20a:	f2c0 0100 	movt	r1, #0
 20e:	a840      	add	r0, sp, #256	; 0x100
 210:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 214:	defe      	udf	#254	; 0xfe
 216:	a85a      	add	r0, sp, #360	; 0x168
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:28
        assert_eq!(rc, 0, "spi init fail");
 218:	905b      	str	r0, [sp, #364]	; 0x16c
 21a:	f240 0000 	movw	r0, #0
 21e:	f2c0 0000 	movt	r0, #0
 222:	905c      	str	r0, [sp, #368]	; 0x170
 224:	985b      	ldr	r0, [sp, #364]	; 0x16c
 226:	905d      	str	r0, [sp, #372]	; 0x174
 228:	985c      	ldr	r0, [sp, #368]	; 0x170
 22a:	905e      	str	r0, [sp, #376]	; 0x178
 22c:	985d      	ldr	r0, [sp, #372]	; 0x174
 22e:	6800      	ldr	r0, [r0, #0]
 230:	995e      	ldr	r1, [sp, #376]	; 0x178
 232:	6809      	ldr	r1, [r1, #0]
 234:	4288      	cmp	r0, r1
 236:	d014      	beq.n	262 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x262>
 238:	e7ff      	b.n	23a <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x23a>
 23a:	985d      	ldr	r0, [sp, #372]	; 0x174
 23c:	906e      	str	r0, [sp, #440]	; 0x1b8
 23e:	985e      	ldr	r0, [sp, #376]	; 0x178
 240:	906f      	str	r0, [sp, #444]	; 0x1bc
 242:	4668      	mov	r0, sp
 244:	2100      	movs	r1, #0
 246:	6001      	str	r1, [r0, #0]
 248:	f240 0100 	movw	r1, #0
 24c:	f2c0 0100 	movt	r1, #0
 250:	f240 0300 	movw	r3, #0
 254:	f2c0 0300 	movt	r3, #0
 258:	a870      	add	r0, sp, #448	; 0x1c0
 25a:	2201      	movs	r2, #1
 25c:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 260:	e00c      	b.n	27c <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x27c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:29
        self.spi_num = spi_num;
 262:	9818      	ldr	r0, [sp, #96]	; 0x60
 264:	9917      	ldr	r1, [sp, #92]	; 0x5c
 266:	6008      	str	r0, [r1, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:30
        self.cs_pin  = cs_pin;
 268:	9819      	ldr	r0, [sp, #100]	; 0x64
 26a:	9917      	ldr	r1, [sp, #92]	; 0x5c
 26c:	6048      	str	r0, [r1, #4]
 26e:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:31
        Ok(())
 270:	901b      	str	r0, [sp, #108]	; 0x6c
 272:	2001      	movs	r0, #1
 274:	901b      	str	r0, [sp, #108]	; 0x6c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:32
    }
 276:	981b      	ldr	r0, [sp, #108]	; 0x6c
 278:	b07a      	add	sp, #488	; 0x1e8
 27a:	bdb0      	pop	{r4, r5, r7, pc}
 27c:	a86e      	add	r0, sp, #440	; 0x1b8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:28
        assert_eq!(rc, 0, "spi init fail");
 27e:	906b      	str	r0, [sp, #428]	; 0x1ac
 280:	a86f      	add	r0, sp, #444	; 0x1bc
 282:	906c      	str	r0, [sp, #432]	; 0x1b0
 284:	a870      	add	r0, sp, #448	; 0x1c0
 286:	906d      	str	r0, [sp, #436]	; 0x1b4
 288:	986b      	ldr	r0, [sp, #428]	; 0x1ac
 28a:	9076      	str	r0, [sp, #472]	; 0x1d8
 28c:	986c      	ldr	r0, [sp, #432]	; 0x1b0
 28e:	9077      	str	r0, [sp, #476]	; 0x1dc
 290:	986d      	ldr	r0, [sp, #436]	; 0x1b4
 292:	9078      	str	r0, [sp, #480]	; 0x1e0
 294:	9876      	ldr	r0, [sp, #472]	; 0x1d8
 296:	f240 0100 	movw	r1, #0
 29a:	f2c0 0100 	movt	r1, #0
 29e:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
 2a2:	9006      	str	r0, [sp, #24]
 2a4:	9105      	str	r1, [sp, #20]
 2a6:	e7ff      	b.n	2a8 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x2a8>
 2a8:	9877      	ldr	r0, [sp, #476]	; 0x1dc
 2aa:	f240 0100 	movw	r1, #0
 2ae:	f2c0 0100 	movt	r1, #0
 2b2:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
 2b6:	9004      	str	r0, [sp, #16]
 2b8:	9103      	str	r1, [sp, #12]
 2ba:	e7ff      	b.n	2bc <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x2bc>
 2bc:	9878      	ldr	r0, [sp, #480]	; 0x1e0
 2be:	f240 0100 	movw	r1, #0
 2c2:	f2c0 0100 	movt	r1, #0
 2c6:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17hfa0c1fd27421f772E>
 2ca:	9002      	str	r0, [sp, #8]
 2cc:	9101      	str	r1, [sp, #4]
 2ce:	e7ff      	b.n	2d0 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x2d0>
 2d0:	9806      	ldr	r0, [sp, #24]
 2d2:	9065      	str	r0, [sp, #404]	; 0x194
 2d4:	9905      	ldr	r1, [sp, #20]
 2d6:	9166      	str	r1, [sp, #408]	; 0x198
 2d8:	9a04      	ldr	r2, [sp, #16]
 2da:	9267      	str	r2, [sp, #412]	; 0x19c
 2dc:	9b03      	ldr	r3, [sp, #12]
 2de:	9368      	str	r3, [sp, #416]	; 0x1a0
 2e0:	f8dd c008 	ldr.w	ip, [sp, #8]
 2e4:	f8cd c1a4 	str.w	ip, [sp, #420]	; 0x1a4
 2e8:	f8dd e004 	ldr.w	lr, [sp, #4]
 2ec:	f8cd e1a8 	str.w	lr, [sp, #424]	; 0x1a8
 2f0:	466c      	mov	r4, sp
 2f2:	2503      	movs	r5, #3
 2f4:	6025      	str	r5, [r4, #0]
 2f6:	f240 0100 	movw	r1, #0
 2fa:	f2c0 0100 	movt	r1, #0
 2fe:	a85f      	add	r0, sp, #380	; 0x17c
 300:	ab65      	add	r3, sp, #404	; 0x194
 302:	462a      	mov	r2, r5
 304:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 308:	e7ff      	b.n	2 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E+0x2>
 30a:	f240 0100 	movw	r1, #0
 30e:	f2c0 0100 	movt	r1, #0
 312:	a85f      	add	r0, sp, #380	; 0x17c
 314:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 318:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E:

00000000 <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E>:
_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:38
}

/// Rust Embedded HAL interface for Mynewt SPI
impl embedded_hal::blocking::spi::Write<u8> for MynewtSPI {
    /// Write to the SPI port
    fn write(&mut self, words: &[u8]) -> Result<(), Self::Error> {
   0:	b580      	push	{r7, lr}
   2:	b090      	sub	sp, #64	; 0x40
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	900a      	str	r0, [sp, #40]	; 0x28
   c:	910b      	str	r1, [sp, #44]	; 0x2c
   e:	920c      	str	r2, [sp, #48]	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:40
        //  Select the device
        unsafe { hal::hal_gpio_write(self.cs_pin, 0) };
  10:	980a      	ldr	r0, [sp, #40]	; 0x28
  12:	6840      	ldr	r0, [r0, #4]
  14:	2100      	movs	r1, #0
  16:	9309      	str	r3, [sp, #36]	; 0x24
  18:	f8cd c020 	str.w	ip, [sp, #32]
  1c:	f8cd e01c 	str.w	lr, [sp, #28]
  20:	f7ff fffe 	bl	0 <hal_gpio_write>
  24:	e7ff      	b.n	26 <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E+0x26>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:42
        //  Send the data
        unsafe { hal::hal_spi_txrx(self.spi_num, 
  26:	980a      	ldr	r0, [sp, #40]	; 0x28
  28:	6800      	ldr	r0, [r0, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:43
            core::mem::transmute(words.as_ptr()),  //  TX Buffer
  2a:	990b      	ldr	r1, [sp, #44]	; 0x2c
  2c:	9a0c      	ldr	r2, [sp, #48]	; 0x30
  2e:	9006      	str	r0, [sp, #24]
  30:	4608      	mov	r0, r1
  32:	4611      	mov	r1, r2
  34:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$6as_ptr17he59896ae2e279711E>
  38:	9005      	str	r0, [sp, #20]
  3a:	e7ff      	b.n	3c <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E+0x3c>
  3c:	9805      	ldr	r0, [sp, #20]
  3e:	900f      	str	r0, [sp, #60]	; 0x3c
  40:	990f      	ldr	r1, [sp, #60]	; 0x3c
  42:	9104      	str	r1, [sp, #16]
  44:	e7ff      	b.n	46 <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E+0x46>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:44
            core::ptr::null_mut(),                 //  RX Buffer (don't receive)
  46:	f7ff fffe 	bl	0 <_ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E>
  4a:	9003      	str	r0, [sp, #12]
  4c:	e7ff      	b.n	4e <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E+0x4e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:45
            words.len() as i32) };                 //  Length
  4e:	980b      	ldr	r0, [sp, #44]	; 0x2c
  50:	990c      	ldr	r1, [sp, #48]	; 0x30
  52:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h70be3ebb33ef544dE>
  56:	9002      	str	r0, [sp, #8]
  58:	e7ff      	b.n	5a <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E+0x5a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:42
        unsafe { hal::hal_spi_txrx(self.spi_num, 
  5a:	9806      	ldr	r0, [sp, #24]
  5c:	9904      	ldr	r1, [sp, #16]
  5e:	9a03      	ldr	r2, [sp, #12]
  60:	9b02      	ldr	r3, [sp, #8]
  62:	f7ff fffe 	bl	0 <hal_spi_txrx>
  66:	9001      	str	r0, [sp, #4]
  68:	e7ff      	b.n	6a <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E+0x6a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:47
        //  De-select the device
        unsafe { hal::hal_gpio_write(self.cs_pin, 1) };
  6a:	980a      	ldr	r0, [sp, #40]	; 0x28
  6c:	6840      	ldr	r0, [r0, #4]
  6e:	2101      	movs	r1, #1
  70:	f7ff fffe 	bl	0 <hal_gpio_write>
  74:	e7ff      	b.n	76 <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E+0x76>
  76:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:48
        Ok(())
  78:	900d      	str	r0, [sp, #52]	; 0x34
  7a:	2001      	movs	r0, #1
  7c:	900d      	str	r0, [sp, #52]	; 0x34
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:49
    }
  7e:	980d      	ldr	r0, [sp, #52]	; 0x34
  80:	b010      	add	sp, #64	; 0x40
  82:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE:

00000000 <_ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE>:
_ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:58
}

/// Rust Embedded HAL interface for Mynewt GPIO
impl MynewtGPIO {
    /// Create a new output GPIO pin
    pub fn new() -> Self {
   0:	b081      	sub	sp, #4
   2:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:59
        MynewtGPIO {
   4:	9000      	str	r0, [sp, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:62
            pin: 0,
        }
    }
   6:	9800      	ldr	r0, [sp, #0]
   8:	b001      	add	sp, #4
   a:	4770      	bx	lr

Disassembly of section .text._ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E:

00000000 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E>:
_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:65

    /// Initialise the output GPIO pin
    pub fn init(&mut self, pin: i32) -> MynewtResult<()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0ac      	sub	sp, #176	; 0xb0
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9009      	str	r0, [sp, #36]	; 0x24
   a:	910a      	str	r1, [sp, #40]	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:68
        //  TODO: let dc = pins.d0.into_push_pull_output(&mut pins.port);
        //  TODO: let rst = pins.d1.into_push_pull_output(&mut pins.port);
        let rc = unsafe { hal::hal_gpio_init_out(pin, 0) };
   c:	980a      	ldr	r0, [sp, #40]	; 0x28
   e:	2100      	movs	r1, #0
  10:	9208      	str	r2, [sp, #32]
  12:	9307      	str	r3, [sp, #28]
  14:	f7ff fffe 	bl	0 <hal_gpio_init_out>
  18:	900c      	str	r0, [sp, #48]	; 0x30
  1a:	e7ff      	b.n	1c <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0x1c>
  1c:	a80c      	add	r0, sp, #48	; 0x30
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:69
        assert_eq!(rc, 0, "gpio fail");
  1e:	900d      	str	r0, [sp, #52]	; 0x34
  20:	f240 0000 	movw	r0, #0
  24:	f2c0 0000 	movt	r0, #0
  28:	900e      	str	r0, [sp, #56]	; 0x38
  2a:	980d      	ldr	r0, [sp, #52]	; 0x34
  2c:	900f      	str	r0, [sp, #60]	; 0x3c
  2e:	980e      	ldr	r0, [sp, #56]	; 0x38
  30:	9010      	str	r0, [sp, #64]	; 0x40
  32:	980f      	ldr	r0, [sp, #60]	; 0x3c
  34:	6800      	ldr	r0, [r0, #0]
  36:	9910      	ldr	r1, [sp, #64]	; 0x40
  38:	6809      	ldr	r1, [r1, #0]
  3a:	4288      	cmp	r0, r1
  3c:	d014      	beq.n	68 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0x68>
  3e:	e7ff      	b.n	40 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0x40>
  40:	980f      	ldr	r0, [sp, #60]	; 0x3c
  42:	9020      	str	r0, [sp, #128]	; 0x80
  44:	9810      	ldr	r0, [sp, #64]	; 0x40
  46:	9021      	str	r0, [sp, #132]	; 0x84
  48:	4668      	mov	r0, sp
  4a:	2100      	movs	r1, #0
  4c:	6001      	str	r1, [r0, #0]
  4e:	f240 0100 	movw	r1, #0
  52:	f2c0 0100 	movt	r1, #0
  56:	f240 0300 	movw	r3, #0
  5a:	f2c0 0300 	movt	r3, #0
  5e:	a822      	add	r0, sp, #136	; 0x88
  60:	2201      	movs	r2, #1
  62:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
  66:	e009      	b.n	7c <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0x7c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:70
        self.pin = pin;
  68:	980a      	ldr	r0, [sp, #40]	; 0x28
  6a:	9909      	ldr	r1, [sp, #36]	; 0x24
  6c:	6008      	str	r0, [r1, #0]
  6e:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:71
        Ok(())
  70:	900b      	str	r0, [sp, #44]	; 0x2c
  72:	2001      	movs	r0, #1
  74:	900b      	str	r0, [sp, #44]	; 0x2c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:72
    }
  76:	980b      	ldr	r0, [sp, #44]	; 0x2c
  78:	b02c      	add	sp, #176	; 0xb0
  7a:	bdb0      	pop	{r4, r5, r7, pc}
  7c:	a820      	add	r0, sp, #128	; 0x80
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:69
        assert_eq!(rc, 0, "gpio fail");
  7e:	901d      	str	r0, [sp, #116]	; 0x74
  80:	a821      	add	r0, sp, #132	; 0x84
  82:	901e      	str	r0, [sp, #120]	; 0x78
  84:	a822      	add	r0, sp, #136	; 0x88
  86:	901f      	str	r0, [sp, #124]	; 0x7c
  88:	981d      	ldr	r0, [sp, #116]	; 0x74
  8a:	9028      	str	r0, [sp, #160]	; 0xa0
  8c:	981e      	ldr	r0, [sp, #120]	; 0x78
  8e:	9029      	str	r0, [sp, #164]	; 0xa4
  90:	981f      	ldr	r0, [sp, #124]	; 0x7c
  92:	902a      	str	r0, [sp, #168]	; 0xa8
  94:	9828      	ldr	r0, [sp, #160]	; 0xa0
  96:	f240 0100 	movw	r1, #0
  9a:	f2c0 0100 	movt	r1, #0
  9e:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
  a2:	9006      	str	r0, [sp, #24]
  a4:	9105      	str	r1, [sp, #20]
  a6:	e7ff      	b.n	a8 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0xa8>
  a8:	9829      	ldr	r0, [sp, #164]	; 0xa4
  aa:	f240 0100 	movw	r1, #0
  ae:	f2c0 0100 	movt	r1, #0
  b2:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
  b6:	9004      	str	r0, [sp, #16]
  b8:	9103      	str	r1, [sp, #12]
  ba:	e7ff      	b.n	bc <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0xbc>
  bc:	982a      	ldr	r0, [sp, #168]	; 0xa8
  be:	f240 0100 	movw	r1, #0
  c2:	f2c0 0100 	movt	r1, #0
  c6:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17hfa0c1fd27421f772E>
  ca:	9002      	str	r0, [sp, #8]
  cc:	9101      	str	r1, [sp, #4]
  ce:	e7ff      	b.n	d0 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0xd0>
  d0:	9806      	ldr	r0, [sp, #24]
  d2:	9017      	str	r0, [sp, #92]	; 0x5c
  d4:	9905      	ldr	r1, [sp, #20]
  d6:	9118      	str	r1, [sp, #96]	; 0x60
  d8:	9a04      	ldr	r2, [sp, #16]
  da:	9219      	str	r2, [sp, #100]	; 0x64
  dc:	9b03      	ldr	r3, [sp, #12]
  de:	931a      	str	r3, [sp, #104]	; 0x68
  e0:	f8dd c008 	ldr.w	ip, [sp, #8]
  e4:	f8cd c06c 	str.w	ip, [sp, #108]	; 0x6c
  e8:	f8dd e004 	ldr.w	lr, [sp, #4]
  ec:	f8cd e070 	str.w	lr, [sp, #112]	; 0x70
  f0:	466c      	mov	r4, sp
  f2:	2503      	movs	r5, #3
  f4:	6025      	str	r5, [r4, #0]
  f6:	f240 0100 	movw	r1, #0
  fa:	f2c0 0100 	movt	r1, #0
  fe:	a811      	add	r0, sp, #68	; 0x44
 100:	ab17      	add	r3, sp, #92	; 0x5c
 102:	462a      	mov	r2, r5
 104:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 108:	e7ff      	b.n	2 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E+0x2>
 10a:	f240 0100 	movw	r1, #0
 10e:	f2c0 0100 	movt	r1, #0
 112:	a811      	add	r0, sp, #68	; 0x44
 114:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 118:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE:

00000000 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE>:
_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:78
}

/// Rust Embedded HAL interface for Mynewt GPIO
impl embedded_hal::digital::v2::OutputPin for MynewtGPIO {
    /// Set the GPIO pin to low
    fn set_low(&mut self) -> Result<(), Self::Error> {
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	4601      	mov	r1, r0
   6:	9001      	str	r0, [sp, #4]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:79
        unsafe { hal::hal_gpio_write(self.pin, 0) };
   8:	9801      	ldr	r0, [sp, #4]
   a:	6800      	ldr	r0, [r0, #0]
   c:	2200      	movs	r2, #0
   e:	9100      	str	r1, [sp, #0]
  10:	4611      	mov	r1, r2
  12:	f7ff fffe 	bl	0 <hal_gpio_write>
  16:	e7ff      	b.n	18 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE+0x18>
  18:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:80
        Ok(())
  1a:	9002      	str	r0, [sp, #8]
  1c:	2001      	movs	r0, #1
  1e:	9002      	str	r0, [sp, #8]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:81
    }
  20:	9802      	ldr	r0, [sp, #8]
  22:	b004      	add	sp, #16
  24:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E:

00000000 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E>:
_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:84

    /// Set the GPIO pin to high
    fn set_high(&mut self) -> Result<(), Self::Error> {
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	4601      	mov	r1, r0
   6:	9001      	str	r0, [sp, #4]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:85
        unsafe { hal::hal_gpio_write(self.pin, 1) };
   8:	9801      	ldr	r0, [sp, #4]
   a:	6800      	ldr	r0, [r0, #0]
   c:	2201      	movs	r2, #1
   e:	9100      	str	r1, [sp, #0]
  10:	4611      	mov	r1, r2
  12:	f7ff fffe 	bl	0 <hal_gpio_write>
  16:	e7ff      	b.n	18 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E+0x18>
  18:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:86
        Ok(())
  1a:	9002      	str	r0, [sp, #8]
  1c:	2001      	movs	r0, #1
  1e:	9002      	str	r0, [sp, #8]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:87
    }
  20:	9802      	ldr	r0, [sp, #8]
  22:	b004      	add	sp, #16
  24:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE:

00000000 <_ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE>:
_ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:99
impl MynewtDelay {
    /// Create a new delay
    pub fn new() -> Self {
        MynewtDelay {
        }
    }
   0:	4770      	bx	lr

Disassembly of section .text._ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE:

00000000 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE>:
_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:105
}

/// Rust Embedded HAL interface for Mynewt Delay
impl embedded_hal::blocking::delay::DelayMs<u8> for MynewtDelay {
    /// Sleep for the specified number of milliseconds
    fn delay_ms(&mut self, ms: u8) {
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9005      	str	r0, [sp, #20]
   a:	f88d 101b 	strb.w	r1, [sp, #27]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:108
        //  TODO: Get this constant from Mynewt
        const OS_TICKS_PER_SEC: u32 = 1000;
        let delay_ticks = (ms as u32) * OS_TICKS_PER_SEC / 1000;
   e:	f89d 001b 	ldrb.w	r0, [sp, #27]
  12:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
  16:	fba0 0101 	umull	r0, r1, r0, r1
  1a:	2900      	cmp	r1, #0
  1c:	9204      	str	r2, [sp, #16]
  1e:	9303      	str	r3, [sp, #12]
  20:	9002      	str	r0, [sp, #8]
  22:	d112      	bne.n	4a <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE+0x4a>
  24:	e7ff      	b.n	26 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE+0x26>
  26:	e7ff      	b.n	28 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE+0x28>
  28:	f644 50d3 	movw	r0, #19923	; 0x4dd3
  2c:	f2c1 0062 	movt	r0, #4194	; 0x1062
  30:	9902      	ldr	r1, [sp, #8]
  32:	fba1 0200 	umull	r0, r2, r1, r0
  36:	0992      	lsrs	r2, r2, #6
  38:	9207      	str	r2, [sp, #28]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:109
        unsafe { os::os_time_delay(delay_ticks) };
  3a:	9a07      	ldr	r2, [sp, #28]
  3c:	9001      	str	r0, [sp, #4]
  3e:	4610      	mov	r0, r2
  40:	f7ff fffe 	bl	0 <os_time_delay>
  44:	e7ff      	b.n	46 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE+0x46>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:110
    }
  46:	b008      	add	sp, #32
  48:	bd80      	pop	{r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/mynewt_hal.rs:108
        let delay_ticks = (ms as u32) * OS_TICKS_PER_SEC / 1000;
  4a:	f240 0000 	movw	r0, #0
  4e:	f2c0 0000 	movt	r0, #0
  52:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  56:	defe      	udf	#254	; 0xfe

app-9b7b12e8d5cbce98.20x17epymehj2cm.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 20x17epymehj2cm
00000103 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
00000113 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000bf l       .debug_str	00000000 
000000cb l       .debug_str	00000000 
000000d1 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000dc l       .debug_str	00000000 
000000e3 l       .debug_str	00000000 
000000e7 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.021febc20b7b865b8c923ed839f3ba78.0	0000000d .Lanon.021febc20b7b865b8c923ed839f3ba78.0
00000000 l    d  .text._ZN3app5hello6launch17ha20511fa91a8038aE	00000000 .text._ZN3app5hello6launch17ha20511fa91a8038aE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app5hello6launch17ha20511fa91a8038aE	00000052 .hidden _ZN3app5hello6launch17ha20511fa91a8038aE
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE
00000000         *UND*	00000000 _ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E
00000000         *UND*	00000000 _ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E
00000000         *UND*	00000000 _ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E
00000000         *UND*	00000000 _ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE



Disassembly of section .text._ZN3app5hello6launch17ha20511fa91a8038aE:

00000000 <_ZN3app5hello6launch17ha20511fa91a8038aE>:
_ZN3app5hello6launch17ha20511fa91a8038aE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/hello.rs:19

#![no_std]  ////
use druid::widget::{Align, Button, Column, Label, Padding};
use druid::{AppLauncher, LocalizedString, Widget, WindowDesc};

pub fn launch() {
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/hello.rs:21
    //  Build a new window
    let main_window = WindowDesc::new(ui_builder);
   4:	f7ff fffe 	bl	0 <_ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E>
   8:	9105      	str	r1, [sp, #20]
   a:	9004      	str	r0, [sp, #16]
   c:	e7ff      	b.n	e <_ZN3app5hello6launch17ha20511fa91a8038aE+0xe>
   e:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/hello.rs:22
    let data = 0_u32;
  10:	9006      	str	r0, [sp, #24]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/hello.rs:24
    //  Launch the window
    AppLauncher::with_window(main_window)
  12:	9804      	ldr	r0, [sp, #16]
  14:	9905      	ldr	r1, [sp, #20]
  16:	f7ff fffe 	bl	0 <_ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E>
  1a:	9003      	str	r0, [sp, #12]
  1c:	9102      	str	r1, [sp, #8]
  1e:	e7ff      	b.n	20 <_ZN3app5hello6launch17ha20511fa91a8038aE+0x20>
  20:	9803      	ldr	r0, [sp, #12]
  22:	9902      	ldr	r1, [sp, #8]
  24:	f7ff fffe 	bl	0 <_ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E>
  28:	9001      	str	r0, [sp, #4]
  2a:	9100      	str	r1, [sp, #0]
  2c:	e7ff      	b.n	2e <_ZN3app5hello6launch17ha20511fa91a8038aE+0x2e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/hello.rs:26
        .use_simple_logger()
        .launch(data)
  2e:	9b06      	ldr	r3, [sp, #24]
  30:	a807      	add	r0, sp, #28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/hello.rs:24
    AppLauncher::with_window(main_window)
  32:	9901      	ldr	r1, [sp, #4]
  34:	9a00      	ldr	r2, [sp, #0]
  36:	f7ff fffe 	bl	0 <_ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE>
  3a:	e7ff      	b.n	2 <_ZN3app5hello6launch17ha20511fa91a8038aE+0x2>
  3c:	f240 0100 	movw	r1, #0
  40:	f2c0 0100 	movt	r1, #0
  44:	a807      	add	r0, sp, #28
  46:	220d      	movs	r2, #13
  48:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52b63500e3c3368dE>
  4c:	e7ff      	b.n	4e <_ZN3app5hello6launch17ha20511fa91a8038aE+0x4e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/hello.rs:28
        .expect("launch failed");
}
  4e:	b00a      	add	sp, #40	; 0x28
  50:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.276jooca2j2qznpw.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 276jooca2j2qznpw
00000315 l       .debug_str	00000000 
000002fc l       .debug_str	00000000 
00000300 l       .debug_str	00000000 
00000308 l       .debug_str	00000000 
0000030d l       .debug_str	00000000 
0000031a l       .debug_str	00000000 
00000328 l       .debug_str	00000000 
0000032e l       .debug_str	00000000 
00000333 l       .debug_str	00000000 
00000338 l       .debug_str	00000000 
00000348 l       .debug_str	00000000 
0000034c l       .debug_str	00000000 
00000358 l       .debug_str	00000000 
00000379 l       .debug_str	00000000 
0000037d l       .debug_str	00000000 
0000037f l       .debug_str	00000000 
00000389 l       .debug_str	00000000 
0000038d l       .debug_str	00000000 
00000390 l       .debug_str	00000000 
00000395 l       .debug_str	00000000 
0000039e l       .debug_str	00000000 
000003ac l       .debug_str	00000000 
000003be l       .debug_str	00000000 
000003d2 l       .debug_str	00000000 
000003d6 l       .debug_str	00000000 
000003df l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
00000093 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000aa l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000c2 l       .debug_str	00000000 
000000cd l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000118 l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
0000013f l       .debug_str	00000000 
00000149 l       .debug_str	00000000 
00000156 l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
00000166 l       .debug_str	00000000 
00000172 l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
000001c5 l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001da l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
000001eb l       .debug_str	00000000 
000001f1 l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
000001fc l       .debug_str	00000000 
00000201 l       .debug_str	00000000 
00000241 l       .debug_str	00000000 
00000257 l       .debug_str	00000000 
0000025b l       .debug_str	00000000 
0000025e l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
00000265 l       .debug_str	00000000 
00000267 l       .debug_str	00000000 
00000269 l       .debug_str	00000000 
0000026d l       .debug_str	00000000 
00000295 l       .debug_str	00000000 
000002d0 l       .debug_str	00000000 
000002e1 l       .debug_str	00000000 
000002ee l       .debug_str	00000000 
000002f1 l       .debug_str	00000000 
000002f8 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.0	00000017 .Lanon.5b5426344ce94e65603f8145c1e9e639.0
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.1	00000001 .Lanon.5b5426344ce94e65603f8145c1e9e639.1
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.15	0000000d .Lanon.5b5426344ce94e65603f8145c1e9e639.15
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.17	00000003 .Lanon.5b5426344ce94e65603f8145c1e9e639.17
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.19	00000005 .Lanon.5b5426344ce94e65603f8145c1e9e639.19
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.2	00000001 .Lanon.5b5426344ce94e65603f8145c1e9e639.2
00000000 l     O .rodata.cst4	00000004 .Lanon.5b5426344ce94e65603f8145c1e9e639.20
00000004 l     O .rodata.cst4	00000004 .Lanon.5b5426344ce94e65603f8145c1e9e639.21
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.22	00000005 .Lanon.5b5426344ce94e65603f8145c1e9e639.22
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.3	00000001 .Lanon.5b5426344ce94e65603f8145c1e9e639.3
00000008 l     O .rodata.cst4	00000004 .Lanon.5b5426344ce94e65603f8145c1e9e639.31
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.32	00000007 .Lanon.5b5426344ce94e65603f8145c1e9e639.32
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.34	00000006 .Lanon.5b5426344ce94e65603f8145c1e9e639.34
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.39	00000048 .Lanon.5b5426344ce94e65603f8145c1e9e639.39
00000000 l     O .rodata..Lanon.5b5426344ce94e65603f8145c1e9e639.8	00000007 .Lanon.5b5426344ce94e65603f8145c1e9e639.8
00000000 l     F .text._ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E	000005a2 _ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E
00000000 l    d  .text._ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E	00000000 .text._ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E
00000000 l    d  .text._ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E	00000000 .text._ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E	0000001a .hidden _ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E
00000000         *UND*	00000000 _ZN6mynewt3sys7console10print_strn17hae4b5c0e79c5c721E
00000000         *UND*	00000000 _ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17ha056d3b92fa56924E
00000000         *UND*	00000000 _ZN6mynewt3sys7console8printint17h36988b93cf5d6403E
00000000         *UND*	00000000 _ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network12prepare_post17h9fc92ba2c33d5dd3E
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network13get_device_id17he772fb12ed0c0e61E
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network14do_server_post17he40d0f3ac342657bE
00000000         *UND*	00000000 _ZN6mynewt4libs14sensor_network16init_server_post17h59ee68426957fe4cE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17h6e85f5392955a7ecE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext13value_to_cstr17h4847bf093081617eE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext20json_set_geolocation17h5e05a90765b15f38E
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext20json_set_text_string17hf2605e025c3812a8E
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context11CoapContext4fail17h2b3f1d76ad01296bE
00000000         *UND*	00000000 _ZN6mynewt8encoding12coap_context12COAP_CONTEXT17h74f817095306340aE
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE
00000000         *UND*	00000000 _ZN75_$LT$str$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h182b4f39567db2cbE
00000000         *UND*	00000000 _ZN84_$LT$mynewt..Strn$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h5ce633819fd18553E
00000000         *UND*	00000000 json_helper_close_array
00000000         *UND*	00000000 json_helper_object_array_end_item
00000000         *UND*	00000000 json_helper_object_array_start_item
00000000         *UND*	00000000 json_helper_set_array
00000000         *UND*	00000000 json_helper_set_int
00000000         *UND*	00000000 json_helper_set_text_string
00000000         *UND*	00000000 json_rep_end_root_object
00000000         *UND*	00000000 json_rep_start_root_object



Disassembly of section .text._ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E:

00000000 <_ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E>:
_ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:59
        send_sensor_data(&transmit_value)
    }
}

#[cfg(not(feature = "use_float"))]  //  If floating-point and geolocation are disabled, send sensor data without geolocation
pub fn aggregate_sensor_data(sensor_value: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	4601      	mov	r1, r0
   6:	9003      	str	r0, [sp, #12]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:61
    //  Transmit sensor value without geolocation and return the result
    send_sensor_data(sensor_value)
   8:	9803      	ldr	r0, [sp, #12]
   a:	9102      	str	r1, [sp, #8]
   c:	f7ff fffe 	bl	0 <_ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E>
  10:	9001      	str	r0, [sp, #4]
  12:	e7ff      	b.n	14 <_ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E+0x14>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:62
}
  14:	9801      	ldr	r0, [sp, #4]
  16:	b004      	add	sp, #16
  18:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E:

00000000 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E>:
_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:75
/// {"values":[
///   {"key":"t",      "value":1715, "geo": { "lat": ..., "long": ... }},
///   {"key":"device", "value":"0102030405060708090a0b0c0d0e0f10"}
/// ]}
/// ```
fn send_sensor_data(val: &SensorValue) -> MynewtResult<()>  {  //  Returns an error code upon error.
   0:	b580      	push	{r7, lr}
   2:	f5ad 7d1c 	sub.w	sp, sp, #624	; 0x270
   6:	4601      	mov	r1, r0
   8:	902b      	str	r0, [sp, #172]	; 0xac
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:76
    console::print("Rust send_sensor_data: ");
   a:	f240 0000 	movw	r0, #0
   e:	f2c0 0000 	movt	r0, #0
  12:	2217      	movs	r2, #23
  14:	912a      	str	r1, [sp, #168]	; 0xa8
  16:	4611      	mov	r1, r2
  18:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  1c:	e7ff      	b.n	1e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x1e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:77
    if let SensorValueType::Uint(i) = val.value {
  1e:	982b      	ldr	r0, [sp, #172]	; 0xac
  20:	6840      	ldr	r0, [r0, #4]
  22:	2801      	cmp	r0, #1
  24:	d115      	bne.n	52 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x52>
  26:	e7ff      	b.n	28 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x28>
  28:	982b      	ldr	r0, [sp, #172]	; 0xac
  2a:	6880      	ldr	r0, [r0, #8]
  2c:	902d      	str	r0, [sp, #180]	; 0xb4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:78
        console::print_strn(val.key);
  2e:	982b      	ldr	r0, [sp, #172]	; 0xac
  30:	6800      	ldr	r0, [r0, #0]
  32:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console10print_strn17hae4b5c0e79c5c721E>
  36:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:79
        console::print("=");
  38:	f240 0000 	movw	r0, #0
  3c:	f2c0 0000 	movt	r0, #0
  40:	2101      	movs	r1, #1
  42:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  46:	e7ff      	b.n	48 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x48>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:80
        console::printint(i as i32);
  48:	982d      	ldr	r0, [sp, #180]	; 0xb4
  4a:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console8printint17h36988b93cf5d6403E>
  4e:	e7ff      	b.n	50 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x50>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:77
    if let SensorValueType::Uint(i) = val.value {
  50:	e7ff      	b.n	52 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x52>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:82
    }
    console::print("\n");
  52:	f240 0000 	movw	r0, #0
  56:	f2c0 0000 	movt	r0, #0
  5a:	2101      	movs	r1, #1
  5c:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  60:	e7ff      	b.n	2 <_ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:83
    console::flush(); ////
  62:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E>
  66:	e7ff      	b.n	68 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x68>
  68:	a835      	add	r0, sp, #212	; 0xd4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:86

    //  Get a randomly-generated device ID that changes each time we restart the device.
    let device_id = sensor_network::get_device_id() ? ;
  6a:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network13get_device_id17he772fb12ed0c0e61E>
  6e:	e7ff      	b.n	70 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x70>
  70:	a831      	add	r0, sp, #196	; 0xc4
  72:	a935      	add	r1, sp, #212	; 0xd4
  74:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17he53953eb8f0e8d2eE>
  78:	e7ff      	b.n	7a <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x7a>
  7a:	9831      	ldr	r0, [sp, #196]	; 0xc4
  7c:	2800      	cmp	r0, #0
  7e:	9029      	str	r0, [sp, #164]	; 0xa4
  80:	d017      	beq.n	b2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xb2>
  82:	e7ff      	b.n	84 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x84>
  84:	9829      	ldr	r0, [sp, #164]	; 0xa4
  86:	2801      	cmp	r0, #1
  88:	d001      	beq.n	8e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x8e>
  8a:	e7ff      	b.n	8c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x8c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:121
    console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=");
    console::print_strn(&device_id); console::print("\n");

    //  The CoAP Background Task will transmit the message in the background.
    Ok(())
}
  8c:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:86
    let device_id = sensor_network::get_device_id() ? ;
  8e:	9832      	ldr	r0, [sp, #200]	; 0xc8
  90:	9039      	str	r0, [sp, #228]	; 0xe4
  92:	9839      	ldr	r0, [sp, #228]	; 0xe4
  94:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  98:	9028      	str	r0, [sp, #160]	; 0xa0
  9a:	e7ff      	b.n	9c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x9c>
  9c:	9828      	ldr	r0, [sp, #160]	; 0xa0
  9e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
  a2:	902c      	str	r0, [sp, #176]	; 0xb0
  a4:	e7ff      	b.n	a6 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xa6>
  a6:	e003      	b.n	b0 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xb0>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:121
}
  a8:	982c      	ldr	r0, [sp, #176]	; 0xb0
  aa:	f50d 7d1c 	add.w	sp, sp, #624	; 0x270
  ae:	bd80      	pop	{r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:86
    let device_id = sensor_network::get_device_id() ? ;
  b0:	e7fa      	b.n	a8 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xa8>
  b2:	9832      	ldr	r0, [sp, #200]	; 0xc8
  b4:	9933      	ldr	r1, [sp, #204]	; 0xcc
  b6:	9a34      	ldr	r2, [sp, #208]	; 0xd0
  b8:	923c      	str	r2, [sp, #240]	; 0xf0
  ba:	913b      	str	r1, [sp, #236]	; 0xec
  bc:	903a      	str	r0, [sp, #232]	; 0xe8
  be:	983a      	ldr	r0, [sp, #232]	; 0xe8
  c0:	993b      	ldr	r1, [sp, #236]	; 0xec
  c2:	9a3c      	ldr	r2, [sp, #240]	; 0xf0
  c4:	9230      	str	r2, [sp, #192]	; 0xc0
  c6:	912f      	str	r1, [sp, #188]	; 0xbc
  c8:	902e      	str	r0, [sp, #184]	; 0xb8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:91
    let rc = sensor_network::init_server_post( strn!(()) ) ? ;  //  `strn!(())` means use default CoAP URI in `syscfg.yml`
  ca:	f240 0100 	movw	r1, #0
  ce:	f2c0 0100 	movt	r1, #0
  d2:	a842      	add	r0, sp, #264	; 0x108
  d4:	2201      	movs	r2, #1
  d6:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE>
  da:	e7ff      	b.n	dc <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xdc>
  dc:	a840      	add	r0, sp, #256	; 0x100
  de:	a942      	add	r1, sp, #264	; 0x108
  e0:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network16init_server_post17h59ee68426957fe4cE>
  e4:	e7ff      	b.n	e6 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xe6>
  e6:	a83e      	add	r0, sp, #248	; 0xf8
  e8:	a940      	add	r1, sp, #256	; 0x100
  ea:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E>
  ee:	e7ff      	b.n	f0 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xf0>
  f0:	f89d 00f8 	ldrb.w	r0, [sp, #248]	; 0xf8
  f4:	07c1      	lsls	r1, r0, #31
  f6:	2900      	cmp	r1, #0
  f8:	9027      	str	r0, [sp, #156]	; 0x9c
  fa:	d012      	beq.n	122 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x122>
  fc:	e7ff      	b.n	fe <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xfe>
  fe:	9827      	ldr	r0, [sp, #156]	; 0x9c
 100:	2801      	cmp	r0, #1
 102:	d1c3      	bne.n	8c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x8c>
 104:	e7ff      	b.n	106 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x106>
 106:	983f      	ldr	r0, [sp, #252]	; 0xfc
 108:	9045      	str	r0, [sp, #276]	; 0x114
 10a:	9845      	ldr	r0, [sp, #276]	; 0x114
 10c:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
 110:	9026      	str	r0, [sp, #152]	; 0x98
 112:	e7ff      	b.n	114 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x114>
 114:	9826      	ldr	r0, [sp, #152]	; 0x98
 116:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 11a:	902c      	str	r0, [sp, #176]	; 0xb0
 11c:	e7ff      	b.n	11e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x11e>
 11e:	e7ff      	b.n	120 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x120>
 120:	e7c6      	b.n	b0 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xb0>
 122:	f89d 00f9 	ldrb.w	r0, [sp, #249]	; 0xf9
 126:	f88d 011b 	strb.w	r0, [sp, #283]	; 0x11b
 12a:	f89d 011b 	ldrb.w	r0, [sp, #283]	; 0x11b
 12e:	f88d 00f7 	strb.w	r0, [sp, #247]	; 0xf7
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:94
    if !rc { return Err(MynewtError::SYS_EAGAIN); }
 132:	f89d 00f7 	ldrb.w	r0, [sp, #247]	; 0xf7
 136:	07c0      	lsls	r0, r0, #31
 138:	2800      	cmp	r0, #0
 13a:	d106      	bne.n	14a <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x14a>
 13c:	e7ff      	b.n	13e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x13e>
 13e:	f06f 0005 	mvn.w	r0, #5
 142:	9047      	str	r0, [sp, #284]	; 0x11c
 144:	9847      	ldr	r0, [sp, #284]	; 0x11c
 146:	902c      	str	r0, [sp, #176]	; 0xb0
 148:	e7ea      	b.n	120 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x120>
 14a:	a84b      	add	r0, sp, #300	; 0x12c
 14c:	2132      	movs	r1, #50	; 0x32
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
    let _payload = coap!( @json {        
 14e:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network12prepare_post17h9fc92ba2c33d5dd3E>
 152:	e7ff      	b.n	154 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x154>
 154:	a849      	add	r0, sp, #292	; 0x124
 156:	a94b      	add	r1, sp, #300	; 0x12c
 158:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E>
 15c:	e7ff      	b.n	15e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x15e>
 15e:	f89d 0124 	ldrb.w	r0, [sp, #292]	; 0x124
 162:	07c1      	lsls	r1, r0, #31
 164:	2900      	cmp	r1, #0
 166:	9025      	str	r0, [sp, #148]	; 0x94
 168:	d013      	beq.n	192 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x192>
 16a:	e7ff      	b.n	16c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x16c>
 16c:	9825      	ldr	r0, [sp, #148]	; 0x94
 16e:	2801      	cmp	r0, #1
 170:	f47f af8c 	bne.w	8c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x8c>
 174:	e7ff      	b.n	176 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x176>
 176:	984a      	ldr	r0, [sp, #296]	; 0x128
 178:	904d      	str	r0, [sp, #308]	; 0x134
 17a:	984d      	ldr	r0, [sp, #308]	; 0x134
 17c:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
 180:	9024      	str	r0, [sp, #144]	; 0x90
 182:	e7ff      	b.n	184 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x184>
 184:	9824      	ldr	r0, [sp, #144]	; 0x90
 186:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 18a:	902c      	str	r0, [sp, #176]	; 0xb0
 18c:	e7ff      	b.n	18e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x18e>
 18e:	e7ff      	b.n	190 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x190>
 190:	e7c6      	b.n	120 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x120>
 192:	f89d 0125 	ldrb.w	r0, [sp, #293]	; 0x125
 196:	f88d 013b 	strb.w	r0, [sp, #315]	; 0x13b
 19a:	f7ff fffe 	bl	0 <json_rep_start_root_object>
 19e:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 1a0:	f240 0000 	movw	r0, #0
 1a4:	f2c0 0000 	movt	r0, #0
 1a8:	904f      	str	r0, [sp, #316]	; 0x13c
 1aa:	2007      	movs	r0, #7
 1ac:	9050      	str	r0, [sp, #320]	; 0x140
 1ae:	f240 0000 	movw	r0, #0
 1b2:	f2c0 0000 	movt	r0, #0
 1b6:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17h6e85f5392955a7ecE>
 1ba:	9023      	str	r0, [sp, #140]	; 0x8c
 1bc:	e7ff      	b.n	1be <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x1be>
 1be:	984f      	ldr	r0, [sp, #316]	; 0x13c
 1c0:	9950      	ldr	r1, [sp, #320]	; 0x140
 1c2:	9084      	str	r0, [sp, #528]	; 0x210
 1c4:	9185      	str	r1, [sp, #532]	; 0x214
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
 1c6:	9884      	ldr	r0, [sp, #528]	; 0x210
 1c8:	9985      	ldr	r1, [sp, #532]	; 0x214
 1ca:	9086      	str	r0, [sp, #536]	; 0x218
 1cc:	9187      	str	r1, [sp, #540]	; 0x21c
 1ce:	9986      	ldr	r1, [sp, #536]	; 0x218
 1d0:	9a87      	ldr	r2, [sp, #540]	; 0x21c
_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
 1d2:	9122      	str	r1, [sp, #136]	; 0x88
 1d4:	9221      	str	r2, [sp, #132]	; 0x84
 1d6:	e7ff      	b.n	1d8 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x1d8>
 1d8:	f240 0000 	movw	r0, #0
 1dc:	f2c0 0000 	movt	r0, #0
 1e0:	9922      	ldr	r1, [sp, #136]	; 0x88
 1e2:	9a21      	ldr	r2, [sp, #132]	; 0x84
 1e4:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 1e8:	9020      	str	r0, [sp, #128]	; 0x80
 1ea:	e7ff      	b.n	1ec <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x1ec>
 1ec:	9823      	ldr	r0, [sp, #140]	; 0x8c
 1ee:	9920      	ldr	r1, [sp, #128]	; 0x80
 1f0:	f7ff fffe 	bl	0 <json_helper_set_array>
 1f4:	e7ff      	b.n	1f6 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x1f6>
 1f6:	982b      	ldr	r0, [sp, #172]	; 0xac
 1f8:	68c1      	ldr	r1, [r0, #12]
 1fa:	6900      	ldr	r0, [r0, #16]
 1fc:	9151      	str	r1, [sp, #324]	; 0x144
 1fe:	9052      	str	r0, [sp, #328]	; 0x148
 200:	982b      	ldr	r0, [sp, #172]	; 0xac
 202:	6840      	ldr	r0, [r0, #4]
 204:	2801      	cmp	r0, #1
 206:	f040 80d9 	bne.w	3bc <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x3bc>
 20a:	e7ff      	b.n	20c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x20c>
 20c:	982b      	ldr	r0, [sp, #172]	; 0xac
 20e:	6880      	ldr	r0, [r0, #8]
 210:	9053      	str	r0, [sp, #332]	; 0x14c
 212:	f240 0000 	movw	r0, #0
 216:	f2c0 0000 	movt	r0, #0
 21a:	9054      	str	r0, [sp, #336]	; 0x150
 21c:	200d      	movs	r0, #13
 21e:	9055      	str	r0, [sp, #340]	; 0x154
 220:	9854      	ldr	r0, [sp, #336]	; 0x150
 222:	9955      	ldr	r1, [sp, #340]	; 0x154
 224:	9098      	str	r0, [sp, #608]	; 0x260
 226:	9199      	str	r1, [sp, #612]	; 0x264
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
 228:	9898      	ldr	r0, [sp, #608]	; 0x260
 22a:	9999      	ldr	r1, [sp, #612]	; 0x264
 22c:	909a      	str	r0, [sp, #616]	; 0x268
 22e:	919b      	str	r1, [sp, #620]	; 0x26c
 230:	999a      	ldr	r1, [sp, #616]	; 0x268
 232:	9a9b      	ldr	r2, [sp, #620]	; 0x26c
_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
 234:	911f      	str	r1, [sp, #124]	; 0x7c
 236:	921e      	str	r2, [sp, #120]	; 0x78
 238:	e7ff      	b.n	23a <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x23a>
 23a:	f240 0000 	movw	r0, #0
 23e:	f2c0 0000 	movt	r0, #0
 242:	991f      	ldr	r1, [sp, #124]	; 0x7c
 244:	9a1e      	ldr	r2, [sp, #120]	; 0x78
 246:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 24a:	901d      	str	r0, [sp, #116]	; 0x74
 24c:	e7ff      	b.n	24e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x24e>
 24e:	981d      	ldr	r0, [sp, #116]	; 0x74
 250:	f7ff fffe 	bl	0 <json_helper_object_array_start_item>
 254:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 256:	f240 0000 	movw	r0, #0
 25a:	f2c0 0000 	movt	r0, #0
 25e:	2103      	movs	r1, #3
 260:	f7ff fffe 	bl	0 <_ZN75_$LT$str$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h182b4f39567db2cbE>
 264:	901c      	str	r0, [sp, #112]	; 0x70
 266:	911b      	str	r1, [sp, #108]	; 0x6c
 268:	e7ff      	b.n	26a <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x26a>
 26a:	981c      	ldr	r0, [sp, #112]	; 0x70
 26c:	9056      	str	r0, [sp, #344]	; 0x158
 26e:	991b      	ldr	r1, [sp, #108]	; 0x6c
 270:	9157      	str	r1, [sp, #348]	; 0x15c
 272:	9a2b      	ldr	r2, [sp, #172]	; 0xac
 274:	6810      	ldr	r0, [r2, #0]
 276:	f7ff fffe 	bl	0 <_ZN84_$LT$mynewt..Strn$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h5ce633819fd18553E>
 27a:	901a      	str	r0, [sp, #104]	; 0x68
 27c:	9119      	str	r1, [sp, #100]	; 0x64
 27e:	e7ff      	b.n	280 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x280>
 280:	981a      	ldr	r0, [sp, #104]	; 0x68
 282:	9058      	str	r0, [sp, #352]	; 0x160
 284:	9919      	ldr	r1, [sp, #100]	; 0x64
 286:	9159      	str	r1, [sp, #356]	; 0x164
 288:	f240 0000 	movw	r0, #0
 28c:	f2c0 0000 	movt	r0, #0
 290:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17h6e85f5392955a7ecE>
 294:	9018      	str	r0, [sp, #96]	; 0x60
 296:	e7ff      	b.n	298 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x298>
 298:	9956      	ldr	r1, [sp, #344]	; 0x158
 29a:	9a57      	ldr	r2, [sp, #348]	; 0x15c
 29c:	f240 0000 	movw	r0, #0
 2a0:	f2c0 0000 	movt	r0, #0
 2a4:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 2a8:	9017      	str	r0, [sp, #92]	; 0x5c
 2aa:	e7ff      	b.n	2ac <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2ac>
 2ac:	9958      	ldr	r1, [sp, #352]	; 0x160
 2ae:	9a59      	ldr	r2, [sp, #356]	; 0x164
 2b0:	f240 0000 	movw	r0, #0
 2b4:	f2c0 0000 	movt	r0, #0
 2b8:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext13value_to_cstr17h4847bf093081617eE>
 2bc:	9016      	str	r0, [sp, #88]	; 0x58
 2be:	e7ff      	b.n	2c0 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2c0>
 2c0:	9818      	ldr	r0, [sp, #96]	; 0x60
 2c2:	9917      	ldr	r1, [sp, #92]	; 0x5c
 2c4:	9a16      	ldr	r2, [sp, #88]	; 0x58
 2c6:	f7ff fffe 	bl	0 <json_helper_set_text_string>
 2ca:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 2cc:	f240 0000 	movw	r0, #0
 2d0:	f2c0 0000 	movt	r0, #0
 2d4:	2105      	movs	r1, #5
 2d6:	f7ff fffe 	bl	0 <_ZN75_$LT$str$u20$as$u20$mynewt..encoding..coap_context..ToBytesOptionalNull$GT$21to_bytes_optional_nul17h182b4f39567db2cbE>
 2da:	9015      	str	r0, [sp, #84]	; 0x54
 2dc:	9114      	str	r1, [sp, #80]	; 0x50
 2de:	e7ff      	b.n	2e0 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2e0>
 2e0:	9815      	ldr	r0, [sp, #84]	; 0x54
 2e2:	905a      	str	r0, [sp, #360]	; 0x168
 2e4:	9914      	ldr	r1, [sp, #80]	; 0x50
 2e6:	915b      	str	r1, [sp, #364]	; 0x16c
 2e8:	9a53      	ldr	r2, [sp, #332]	; 0x14c
 2ea:	2300      	movs	r3, #0
 2ec:	935d      	str	r3, [sp, #372]	; 0x174
 2ee:	925c      	str	r2, [sp, #368]	; 0x170
 2f0:	f240 0000 	movw	r0, #0
 2f4:	f2c0 0000 	movt	r0, #0
 2f8:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17h6e85f5392955a7ecE>
 2fc:	9013      	str	r0, [sp, #76]	; 0x4c
 2fe:	e7ff      	b.n	300 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x300>
 300:	995a      	ldr	r1, [sp, #360]	; 0x168
 302:	9a5b      	ldr	r2, [sp, #364]	; 0x16c
 304:	f240 0000 	movw	r0, #0
 308:	f2c0 0000 	movt	r0, #0
 30c:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 310:	9012      	str	r0, [sp, #72]	; 0x48
 312:	e7ff      	b.n	314 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x314>
 314:	9a5c      	ldr	r2, [sp, #368]	; 0x170
 316:	9b5d      	ldr	r3, [sp, #372]	; 0x174
 318:	9813      	ldr	r0, [sp, #76]	; 0x4c
 31a:	9912      	ldr	r1, [sp, #72]	; 0x48
 31c:	f7ff fffe 	bl	0 <json_helper_set_int>
 320:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 322:	f240 0100 	movw	r1, #0
 326:	f2c0 0100 	movt	r1, #0
 32a:	a85e      	add	r0, sp, #376	; 0x178
 32c:	2204      	movs	r2, #4
 32e:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE>
 332:	e7ff      	b.n	6 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x6>
 334:	f240 0100 	movw	r1, #0
 338:	f2c0 0100 	movt	r1, #0
 33c:	a861      	add	r0, sp, #388	; 0x184
 33e:	2204      	movs	r2, #4
 340:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE>
 344:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 346:	f240 0100 	movw	r1, #0
 34a:	f2c0 0100 	movt	r1, #0
 34e:	a864      	add	r0, sp, #400	; 0x190
 350:	2205      	movs	r2, #5
 352:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE>
 356:	e7ff      	b.n	358 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x358>
 358:	9851      	ldr	r0, [sp, #324]	; 0x144
 35a:	9952      	ldr	r1, [sp, #328]	; 0x148
 35c:	466a      	mov	r2, sp
 35e:	6051      	str	r1, [r2, #4]
 360:	6010      	str	r0, [r2, #0]
 362:	f240 0000 	movw	r0, #0
 366:	f2c0 0000 	movt	r0, #0
 36a:	a95e      	add	r1, sp, #376	; 0x178
 36c:	aa61      	add	r2, sp, #388	; 0x184
 36e:	ab64      	add	r3, sp, #400	; 0x190
 370:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext20json_set_geolocation17h5e05a90765b15f38E>
 374:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 376:	f240 0000 	movw	r0, #0
 37a:	f2c0 0000 	movt	r0, #0
 37e:	9067      	str	r0, [sp, #412]	; 0x19c
 380:	200d      	movs	r0, #13
 382:	9068      	str	r0, [sp, #416]	; 0x1a0
 384:	9867      	ldr	r0, [sp, #412]	; 0x19c
 386:	9968      	ldr	r1, [sp, #416]	; 0x1a0
 388:	9094      	str	r0, [sp, #592]	; 0x250
 38a:	9195      	str	r1, [sp, #596]	; 0x254
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
 38c:	9894      	ldr	r0, [sp, #592]	; 0x250
 38e:	9995      	ldr	r1, [sp, #596]	; 0x254
 390:	9096      	str	r0, [sp, #600]	; 0x258
 392:	9197      	str	r1, [sp, #604]	; 0x25c
 394:	9996      	ldr	r1, [sp, #600]	; 0x258
 396:	9a97      	ldr	r2, [sp, #604]	; 0x25c
_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
 398:	9111      	str	r1, [sp, #68]	; 0x44
 39a:	9210      	str	r2, [sp, #64]	; 0x40
 39c:	e7ff      	b.n	39e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x39e>
 39e:	f240 0000 	movw	r0, #0
 3a2:	f2c0 0000 	movt	r0, #0
 3a6:	9911      	ldr	r1, [sp, #68]	; 0x44
 3a8:	9a10      	ldr	r2, [sp, #64]	; 0x40
 3aa:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 3ae:	900f      	str	r0, [sp, #60]	; 0x3c
 3b0:	e7ff      	b.n	3b2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x3b2>
 3b2:	980f      	ldr	r0, [sp, #60]	; 0x3c
 3b4:	f7ff fffe 	bl	0 <json_helper_object_array_end_item>
 3b8:	e7ff      	b.n	3ba <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x3ba>
 3ba:	e00c      	b.n	3d6 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x3d6>
 3bc:	2001      	movs	r0, #1
 3be:	f88d 01a7 	strb.w	r0, [sp, #423]	; 0x1a7
 3c2:	f89d 11a7 	ldrb.w	r1, [sp, #423]	; 0x1a7
 3c6:	f240 0000 	movw	r0, #0
 3ca:	f2c0 0000 	movt	r0, #0
 3ce:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext4fail17h2b3f1d76ad01296bE>
 3d2:	e7ff      	b.n	3d4 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x3d4>
 3d4:	e7ff      	b.n	3d6 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x3d6>
 3d6:	f240 0000 	movw	r0, #0
 3da:	f2c0 0000 	movt	r0, #0
 3de:	906a      	str	r0, [sp, #424]	; 0x1a8
 3e0:	200d      	movs	r0, #13
 3e2:	906b      	str	r0, [sp, #428]	; 0x1ac
 3e4:	986a      	ldr	r0, [sp, #424]	; 0x1a8
 3e6:	996b      	ldr	r1, [sp, #428]	; 0x1ac
 3e8:	9090      	str	r0, [sp, #576]	; 0x240
 3ea:	9191      	str	r1, [sp, #580]	; 0x244
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
 3ec:	9890      	ldr	r0, [sp, #576]	; 0x240
 3ee:	9991      	ldr	r1, [sp, #580]	; 0x244
 3f0:	9092      	str	r0, [sp, #584]	; 0x248
 3f2:	9193      	str	r1, [sp, #588]	; 0x24c
 3f4:	9992      	ldr	r1, [sp, #584]	; 0x248
 3f6:	9a93      	ldr	r2, [sp, #588]	; 0x24c
_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
 3f8:	910e      	str	r1, [sp, #56]	; 0x38
 3fa:	920d      	str	r2, [sp, #52]	; 0x34
 3fc:	e7ff      	b.n	3fe <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x3fe>
 3fe:	f240 0000 	movw	r0, #0
 402:	f2c0 0000 	movt	r0, #0
 406:	990e      	ldr	r1, [sp, #56]	; 0x38
 408:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 40a:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 40e:	900c      	str	r0, [sp, #48]	; 0x30
 410:	e7ff      	b.n	412 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x412>
 412:	980c      	ldr	r0, [sp, #48]	; 0x30
 414:	f7ff fffe 	bl	0 <json_helper_object_array_start_item>
 418:	e7ff      	b.n	a <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xa>
 41a:	f240 0100 	movw	r1, #0
 41e:	f2c0 0100 	movt	r1, #0
 422:	a86d      	add	r0, sp, #436	; 0x1b4
 424:	2204      	movs	r2, #4
 426:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE>
 42a:	e7ff      	b.n	42c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x42c>
 42c:	a86d      	add	r0, sp, #436	; 0x1b4
 42e:	906c      	str	r0, [sp, #432]	; 0x1b0
 430:	f240 0100 	movw	r1, #0
 434:	f2c0 0100 	movt	r1, #0
 438:	a871      	add	r0, sp, #452	; 0x1c4
 43a:	2207      	movs	r2, #7
 43c:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE>
 440:	e7ff      	b.n	442 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x442>
 442:	a871      	add	r0, sp, #452	; 0x1c4
 444:	9070      	str	r0, [sp, #448]	; 0x1c0
 446:	996c      	ldr	r1, [sp, #432]	; 0x1b0
 448:	9a70      	ldr	r2, [sp, #448]	; 0x1c0
 44a:	f240 0000 	movw	r0, #0
 44e:	f2c0 0000 	movt	r0, #0
 452:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext20json_set_text_string17hf2605e025c3812a8E>
 456:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 458:	f240 0100 	movw	r1, #0
 45c:	f2c0 0100 	movt	r1, #0
 460:	a875      	add	r0, sp, #468	; 0x1d4
 462:	2206      	movs	r2, #6
 464:	f7ff fffe 	bl	0 <_ZN6mynewt4Strn3new17hf60a68be5a9fdb0eE>
 468:	e7ff      	b.n	46a <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x46a>
 46a:	a875      	add	r0, sp, #468	; 0x1d4
 46c:	9074      	str	r0, [sp, #464]	; 0x1d0
 46e:	a82e      	add	r0, sp, #184	; 0xb8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:107
        "device": &device_id,
 470:	9078      	str	r0, [sp, #480]	; 0x1e0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
    let _payload = coap!( @json {        
 472:	9974      	ldr	r1, [sp, #464]	; 0x1d0
 474:	9a78      	ldr	r2, [sp, #480]	; 0x1e0
 476:	f240 0000 	movw	r0, #0
 47a:	f2c0 0000 	movt	r0, #0
 47e:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext20json_set_text_string17hf2605e025c3812a8E>
 482:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 484:	f240 0000 	movw	r0, #0
 488:	f2c0 0000 	movt	r0, #0
 48c:	9079      	str	r0, [sp, #484]	; 0x1e4
 48e:	200d      	movs	r0, #13
 490:	907a      	str	r0, [sp, #488]	; 0x1e8
 492:	9879      	ldr	r0, [sp, #484]	; 0x1e4
 494:	997a      	ldr	r1, [sp, #488]	; 0x1e8
 496:	908c      	str	r0, [sp, #560]	; 0x230
 498:	918d      	str	r1, [sp, #564]	; 0x234
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
 49a:	988c      	ldr	r0, [sp, #560]	; 0x230
 49c:	998d      	ldr	r1, [sp, #564]	; 0x234
 49e:	908e      	str	r0, [sp, #568]	; 0x238
 4a0:	918f      	str	r1, [sp, #572]	; 0x23c
 4a2:	998e      	ldr	r1, [sp, #568]	; 0x238
 4a4:	9a8f      	ldr	r2, [sp, #572]	; 0x23c
_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
 4a6:	910b      	str	r1, [sp, #44]	; 0x2c
 4a8:	920a      	str	r2, [sp, #40]	; 0x28
 4aa:	e7ff      	b.n	4ac <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x4ac>
 4ac:	f240 0000 	movw	r0, #0
 4b0:	f2c0 0000 	movt	r0, #0
 4b4:	990b      	ldr	r1, [sp, #44]	; 0x2c
 4b6:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 4b8:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 4bc:	9009      	str	r0, [sp, #36]	; 0x24
 4be:	e7ff      	b.n	4c0 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x4c0>
 4c0:	9809      	ldr	r0, [sp, #36]	; 0x24
 4c2:	f7ff fffe 	bl	0 <json_helper_object_array_end_item>
 4c6:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 4c8:	f240 0000 	movw	r0, #0
 4cc:	f2c0 0000 	movt	r0, #0
 4d0:	907b      	str	r0, [sp, #492]	; 0x1ec
 4d2:	2007      	movs	r0, #7
 4d4:	907c      	str	r0, [sp, #496]	; 0x1f0
 4d6:	f240 0000 	movw	r0, #0
 4da:	f2c0 0000 	movt	r0, #0
 4de:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11to_void_ptr17h6e85f5392955a7ecE>
 4e2:	9008      	str	r0, [sp, #32]
 4e4:	e7ff      	b.n	4e6 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x4e6>
 4e6:	987b      	ldr	r0, [sp, #492]	; 0x1ec
 4e8:	997c      	ldr	r1, [sp, #496]	; 0x1f0
 4ea:	9088      	str	r0, [sp, #544]	; 0x220
 4ec:	9189      	str	r1, [sp, #548]	; 0x224
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
 4ee:	9888      	ldr	r0, [sp, #544]	; 0x220
 4f0:	9989      	ldr	r1, [sp, #548]	; 0x224
 4f2:	908a      	str	r0, [sp, #552]	; 0x228
 4f4:	918b      	str	r1, [sp, #556]	; 0x22c
 4f6:	998a      	ldr	r1, [sp, #552]	; 0x228
 4f8:	9a8b      	ldr	r2, [sp, #556]	; 0x22c
_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:98
 4fa:	9107      	str	r1, [sp, #28]
 4fc:	9206      	str	r2, [sp, #24]
 4fe:	e7ff      	b.n	500 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x500>
 500:	f240 0000 	movw	r0, #0
 504:	f2c0 0000 	movt	r0, #0
 508:	9907      	ldr	r1, [sp, #28]
 50a:	9a06      	ldr	r2, [sp, #24]
 50c:	f7ff fffe 	bl	0 <_ZN6mynewt8encoding12coap_context11CoapContext11key_to_cstr17h709da273506faeb4E>
 510:	9005      	str	r0, [sp, #20]
 512:	e7ff      	b.n	514 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x514>
 514:	9808      	ldr	r0, [sp, #32]
 516:	9905      	ldr	r1, [sp, #20]
 518:	f7ff fffe 	bl	0 <json_helper_close_array>
 51c:	e7ff      	b.n	2 <json_rep_end_root_object+0x2>
 51e:	f7ff fffe 	bl	0 <json_rep_end_root_object>
 522:	e7ff      	b.n	524 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x524>
 524:	a87f      	add	r0, sp, #508	; 0x1fc
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:113
    sensor_network::do_server_post() ? ;
 526:	f7ff fffe 	bl	0 <_ZN6mynewt4libs14sensor_network14do_server_post17he40d0f3ac342657bE>
 52a:	e7ff      	b.n	52c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x52c>
 52c:	a87d      	add	r0, sp, #500	; 0x1f4
 52e:	a97f      	add	r1, sp, #508	; 0x1fc
 530:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h162fe43a7cc21263E>
 534:	e7ff      	b.n	536 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x536>
 536:	f89d 01f4 	ldrb.w	r0, [sp, #500]	; 0x1f4
 53a:	07c1      	lsls	r1, r0, #31
 53c:	2900      	cmp	r1, #0
 53e:	9004      	str	r0, [sp, #16]
 540:	d012      	beq.n	568 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x568>
 542:	e7ff      	b.n	544 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x544>
 544:	9804      	ldr	r0, [sp, #16]
 546:	2801      	cmp	r0, #1
 548:	f47f ada0 	bne.w	8c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x8c>
 54c:	e7ff      	b.n	54e <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x54e>
 54e:	987e      	ldr	r0, [sp, #504]	; 0x1f8
 550:	9081      	str	r0, [sp, #516]	; 0x204
 552:	9881      	ldr	r0, [sp, #516]	; 0x204
 554:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
 558:	9003      	str	r0, [sp, #12]
 55a:	e7ff      	b.n	55c <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x55c>
 55c:	9803      	ldr	r0, [sp, #12]
 55e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 562:	902c      	str	r0, [sp, #176]	; 0xb0
 564:	e7ff      	b.n	566 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x566>
 566:	e613      	b.n	190 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x190>
 568:	f89d 01f5 	ldrb.w	r0, [sp, #501]	; 0x1f5
 56c:	f88d 020b 	strb.w	r0, [sp, #523]	; 0x20b
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:116
    console::print("NET view your sensor at \nhttps://blue-pill-geolocate.appspot.com?device=");
 570:	f240 0000 	movw	r0, #0
 574:	f2c0 0000 	movt	r0, #0
 578:	2148      	movs	r1, #72	; 0x48
 57a:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
 57e:	e7ff      	b.n	580 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x580>
 580:	a82e      	add	r0, sp, #184	; 0xb8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:117
    console::print_strn(&device_id); console::print("\n");
 582:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console10print_strn17hae4b5c0e79c5c721E>
 586:	e7ff      	b.n	2 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x2>
 588:	f240 0000 	movw	r0, #0
 58c:	f2c0 0000 	movt	r0, #0
 590:	2101      	movs	r1, #1
 592:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
 596:	e7ff      	b.n	598 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0x598>
 598:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:120
    Ok(())
 59a:	902c      	str	r0, [sp, #176]	; 0xb0
 59c:	2001      	movs	r0, #1
 59e:	902c      	str	r0, [sp, #176]	; 0xb0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_network.rs:121
}
 5a0:	e582      	b.n	a8 <_ZN3app11app_network16send_sensor_data17h6d277e5fff8b4b53E+0xa8>

app-9b7b12e8d5cbce98.27rdm6uyhgszchef.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 27rdm6uyhgszchef
0000032c l       .debug_str	00000000 
00000371 l       .debug_str	00000000 
00000375 l       .debug_str	00000000 
00000379 l       .debug_str	00000000 
00000381 l       .debug_str	00000000 
00000398 l       .debug_str	00000000 
000003bc l       .debug_str	00000000 
000003d8 l       .debug_str	00000000 
000003e2 l       .debug_str	00000000 
000003fc l       .debug_str	00000000 
0000045a l       .debug_str	00000000 
00000465 l       .debug_str	00000000 
00000482 l       .debug_str	00000000 
0000049b l       .debug_str	00000000 
000004a5 l       .debug_str	00000000 
000004bb l       .debug_str	00000000 
000004d9 l       .debug_str	00000000 
000004e2 l       .debug_str	00000000 
000004e7 l       .debug_str	00000000 
000004ec l       .debug_str	00000000 
000004f0 l       .debug_str	00000000 
000004f9 l       .debug_str	00000000 
00000503 l       .debug_str	00000000 
0000051b l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000bb l       .debug_str	00000000 
000000c2 l       .debug_str	00000000 
000000c5 l       .debug_str	00000000 
000000c9 l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
000000dd l       .debug_str	00000000 
000000e1 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000110 l       .debug_str	00000000 
00000115 l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
00000129 l       .debug_str	00000000 
0000012f l       .debug_str	00000000 
00000132 l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
0000013b l       .debug_str	00000000 
00000143 l       .debug_str	00000000 
00000147 l       .debug_str	00000000 
0000014f l       .debug_str	00000000 
00000157 l       .debug_str	00000000 
0000015e l       .debug_str	00000000 
00000164 l       .debug_str	00000000 
00000178 l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
00000191 l       .debug_str	00000000 
00000198 l       .debug_str	00000000 
0000019c l       .debug_str	00000000 
000001a1 l       .debug_str	00000000 
000001a8 l       .debug_str	00000000 
000001b1 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001c7 l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
000001e9 l       .debug_str	00000000 
000001ec l       .debug_str	00000000 
000001f0 l       .debug_str	00000000 
000001f9 l       .debug_str	00000000 
00000200 l       .debug_str	00000000 
00000205 l       .debug_str	00000000 
0000020a l       .debug_str	00000000 
00000210 l       .debug_str	00000000 
00000216 l       .debug_str	00000000 
00000220 l       .debug_str	00000000 
00000223 l       .debug_str	00000000 
00000229 l       .debug_str	00000000 
00000233 l       .debug_str	00000000 
0000023b l       .debug_str	00000000 
00000241 l       .debug_str	00000000 
00000247 l       .debug_str	00000000 
00000252 l       .debug_str	00000000 
0000025b l       .debug_str	00000000 
0000027e l       .debug_str	00000000 
0000029d l       .debug_str	00000000 
0000029f l       .debug_str	00000000 
000002a4 l       .debug_str	00000000 
000002cb l       .debug_str	00000000 
000002d0 l       .debug_str	00000000 
000002d6 l       .debug_str	00000000 
000002dc l       .debug_str	00000000 
000002df l       .debug_str	00000000 
000002ee l       .debug_str	00000000 
000002f5 l       .debug_str	00000000 
000002f9 l       .debug_str	00000000 
00000302 l       .debug_str	00000000 
0000030e l       .debug_str	00000000 
00000327 l       .debug_str	00000000 
0000033d l       .debug_str	00000000 
00000347 l       .debug_str	00000000 
00000355 l       .debug_str	00000000 
00000359 l       .debug_str	00000000 
00000364 l       .debug_str	00000000 
0000036b l       .debug_str	00000000 
00000000 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.0
00000008 l     O .rodata.cst8	00000008 .Lanon.3ed011473997af99b525cde47c9eaaac.1
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.10	00000007 .Lanon.3ed011473997af99b525cde47c9eaaac.10
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.11	00000003 .Lanon.3ed011473997af99b525cde47c9eaaac.11
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.12	00000006 .Lanon.3ed011473997af99b525cde47c9eaaac.12
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.13	00000001 .Lanon.3ed011473997af99b525cde47c9eaaac.13
00000000 l     O .rodata..Lanon.3ed011473997af99b525cde47c9eaaac.3	00000018 .Lanon.3ed011473997af99b525cde47c9eaaac.3
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
00000000         *UND*	00000000 .hidden _ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E
00000000         *UND*	00000000 .hidden _ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE
00000000         *UND*	00000000 .hidden _ZN3app5hello6launch17ha20511fa91a8038aE
00000000         *UND*	00000000 .hidden _ZN3app7display13start_display17h81b47d71c1289238E
00000000         *UND*	00000000 .hidden _ZN3app7display4test17h4382f834d7e04d48E
00000000         *UND*	00000000 _ZN4core5panic8Location4file17h94cc6af18de736c4E
00000000         *UND*	00000000 _ZN4core5panic8Location4line17h3ffc63f14d0a6636E
00000000         *UND*	00000000 _ZN4core5panic9PanicInfo8location17h5226165d8771f8a2E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 _ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17ha056d3b92fa56924E
00000000         *UND*	00000000 _ZN6mynewt3sys7console6buffer17hdac5aa6521c5a469E
00000000         *UND*	00000000 _ZN6mynewt3sys7console8printint17h36988b93cf5d6403E
00000000         *UND*	00000000 _ZN6mynewt6kernel2os10eventq_run17h4edaade253fbd69cE
00000000         *UND*	00000000 _ZN6mynewt6kernel2os15eventq_dflt_get17h98f9329688c1613bE
00000000         *UND*	00000000 _ZN6mynewt7sysinit17h124af2da86dec657E
00000000 g     F .text.main	000000ce main
00000000 g     F .text.rust_begin_unwind	000000ac rust_begin_unwind
00000000         *UND*	00000000 start_ble



Disassembly of section .text.main:

00000000 <main>:
main():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:56
};

///  Main program that initialises the sensor, network driver and starts reading and sending sensor data in the background.
///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                 //  Don't mangle the name "main"
extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
   0:	b08a      	sub	sp, #40	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:61
    //  Initialise the Mynewt packages and internal temperature sensor driver. Any startup
    //  functions defined in pkg.yml of our custom drivers and libraries will be called by 
    //  sysinit().  Here are the startup functions consolidated by Mynewt:
    //  bin/targets/nrf52_my_sensor/generated/src/nrf52_my_sensor-sysinit-app.c
    mynewt::sysinit();
   2:	f7ff fffe 	bl	0 <_ZN6mynewt7sysinit17h124af2da86dec657E>
   6:	e7ff      	b.n	2 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:69
    //  sensor_network::start_server_transport()
    //    .expect("NET fail");

    //  Start polling the simulated temperature sensor every 10 seconds in the background.
    //  TODO: Replace by touch handler.
    app_sensor::start_sensor_listener()
   8:	f7ff fffe 	bl	0 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E>
   c:	9006      	str	r0, [sp, #24]
   e:	e7ff      	b.n	10 <main+0x10>
  10:	f240 0100 	movw	r1, #0
  14:	f2c0 0100 	movt	r1, #0
  18:	2208      	movs	r2, #8
  1a:	9806      	ldr	r0, [sp, #24]
  1c:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  20:	e7ff      	b.n	2 <start_ble+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:74
        .expect("TMP fail");

    //  Start Bluetooth Beacon.  TODO: Create a safe wrapper for starting Bluetooth LE.
    extern { fn start_ble() -> i32; }
    let rc = unsafe { start_ble() };
  22:	f7ff fffe 	bl	0 <start_ble>
  26:	9007      	str	r0, [sp, #28]
  28:	e7ff      	b.n	2a <main+0x2a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:75
    assert!(rc == 0, "BLE fail");
  2a:	9807      	ldr	r0, [sp, #28]
  2c:	2800      	cmp	r0, #0
  2e:	d007      	beq.n	40 <main+0x40>
  30:	e7ff      	b.n	32 <main+0x32>
  32:	f240 0000 	movw	r0, #0
  36:	f2c0 0000 	movt	r0, #0
  3a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  3e:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:78

    //  Start the display
    display::start_display()
  40:	f7ff fffe 	bl	0 <_ZN3app7display13start_display17h81b47d71c1289238E>
  44:	9005      	str	r0, [sp, #20]
  46:	e7ff      	b.n	48 <main+0x48>
  48:	f240 0100 	movw	r1, #0
  4c:	f2c0 0100 	movt	r1, #0
  50:	2208      	movs	r2, #8
  52:	9805      	ldr	r0, [sp, #20]
  54:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  58:	e7ff      	b.n	2 <_ZN3app7display4test17h4382f834d7e04d48E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:82
        .expect("DSP fail");

    //  Test the display
    display::test()
  5a:	f7ff fffe 	bl	0 <_ZN3app7display4test17h4382f834d7e04d48E>
  5e:	9004      	str	r0, [sp, #16]
  60:	e7ff      	b.n	62 <main+0x62>
  62:	f240 0100 	movw	r1, #0
  66:	f2c0 0100 	movt	r1, #0
  6a:	220d      	movs	r2, #13
  6c:	9804      	ldr	r0, [sp, #16]
  6e:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  72:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:86
        .expect("DSP test fail");

    //  Start the touch sensor
    touch_sensor::start_touch_sensor()
  74:	f7ff fffe 	bl	0 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE>
  78:	9003      	str	r0, [sp, #12]
  7a:	e7ff      	b.n	7c <main+0x7c>
  7c:	f240 0100 	movw	r1, #0
  80:	f2c0 0100 	movt	r1, #0
  84:	2208      	movs	r2, #8
  86:	9803      	ldr	r0, [sp, #12]
  88:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  8c:	e7ff      	b.n	2 <_ZN3app5hello6launch17ha20511fa91a8038aE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:94
    //  Test the touch sensor
    //  touch_sensor::test()
    //    .expect("TCH test fail");

    //  Launch the Druid UI
    hello::launch();
  8e:	f7ff fffe 	bl	0 <_ZN3app5hello6launch17ha20511fa91a8038aE>
  92:	e7ff      	b.n	94 <main+0x94>
  94:	a808      	add	r0, sp, #32
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:99

    //  Main event loop
    loop {                            //  Loop forever...
        os::eventq_run(               //  Processing events...
            os::eventq_dflt_get()     //  From default event queue.
  96:	f7ff fffe 	bl	0 <_ZN6mynewt6kernel2os15eventq_dflt_get17h98f9329688c1613bE>
  9a:	e7ff      	b.n	22 <main+0x22>
  9c:	f240 0100 	movw	r1, #0
  a0:	f2c0 0100 	movt	r1, #0
  a4:	a808      	add	r0, sp, #32
  a6:	2208      	movs	r2, #8
  a8:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E>
  ac:	9002      	str	r0, [sp, #8]
  ae:	e7ff      	b.n	b0 <main+0xb0>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:98
        os::eventq_run(               //  Processing events...
  b0:	9802      	ldr	r0, [sp, #8]
  b2:	f7ff fffe 	bl	0 <_ZN6mynewt6kernel2os10eventq_run17h4edaade253fbd69cE>
  b6:	9001      	str	r0, [sp, #4]
  b8:	e7ff      	b.n	ba <main+0xba>
  ba:	f240 0100 	movw	r1, #0
  be:	f2c0 0100 	movt	r1, #0
  c2:	2208      	movs	r2, #8
  c4:	9801      	ldr	r0, [sp, #4]
  c6:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  ca:	e7ff      	b.n	cc <main+0xcc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:97
    loop {                            //  Loop forever...
  cc:	e7e2      	b.n	94 <main+0x94>

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:108
    //  Never comes here
}

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
   0:	b088      	sub	sp, #32
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:110
    //  Display the filename and line number to the Semihosting Console.
    console::print("panic ");
   6:	f240 0000 	movw	r0, #0
   a:	f2c0 0000 	movt	r0, #0
   e:	2206      	movs	r2, #6
  10:	9101      	str	r1, [sp, #4]
  12:	4611      	mov	r1, r2
  14:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  18:	e7ff      	b.n	1a <rust_begin_unwind+0x1a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:111
    if let Some(location) = info.location() {
  1a:	9802      	ldr	r0, [sp, #8]
  1c:	f7ff fffe 	bl	0 <_ZN4core5panic9PanicInfo8location17h5226165d8771f8a2E>
  20:	9003      	str	r0, [sp, #12]
  22:	e7ff      	b.n	24 <rust_begin_unwind+0x24>
  24:	9803      	ldr	r0, [sp, #12]
  26:	2800      	cmp	r0, #0
  28:	d032      	beq.n	90 <rust_begin_unwind+0x90>
  2a:	e7ff      	b.n	2c <rust_begin_unwind+0x2c>
  2c:	9803      	ldr	r0, [sp, #12]
  2e:	9004      	str	r0, [sp, #16]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:112
        let file = location.file();
  30:	9804      	ldr	r0, [sp, #16]
  32:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4file17h94cc6af18de736c4E>
  36:	9106      	str	r1, [sp, #24]
  38:	9005      	str	r0, [sp, #20]
  3a:	e7ff      	b.n	3c <rust_begin_unwind+0x3c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:113
        let line = location.line();
  3c:	9804      	ldr	r0, [sp, #16]
  3e:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4line17h3ffc63f14d0a6636E>
  42:	9007      	str	r0, [sp, #28]
  44:	e7ff      	b.n	46 <rust_begin_unwind+0x46>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:114
        console::print("at ");       console::buffer(&file);
  46:	f240 0000 	movw	r0, #0
  4a:	f2c0 0000 	movt	r0, #0
  4e:	2103      	movs	r1, #3
  50:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  54:	e7ff      	b.n	56 <rust_begin_unwind+0x56>
  56:	9805      	ldr	r0, [sp, #20]
  58:	9906      	ldr	r1, [sp, #24]
  5a:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console6buffer17hdac5aa6521c5a469E>
  5e:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:115
        console::print(" line ");    console::printint(line as i32);
  60:	f240 0000 	movw	r0, #0
  64:	f2c0 0000 	movt	r0, #0
  68:	2106      	movs	r1, #6
  6a:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  6e:	e7ff      	b.n	70 <rust_begin_unwind+0x70>
  70:	9807      	ldr	r0, [sp, #28]
  72:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console8printint17h36988b93cf5d6403E>
  76:	e7ff      	b.n	2 <rust_begin_unwind+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:116
        console::print("\n");        console::flush();
  78:	f240 0000 	movw	r0, #0
  7c:	f2c0 0000 	movt	r0, #0
  80:	2101      	movs	r1, #1
  82:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  86:	e7ff      	b.n	2 <_ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E+0x2>
  88:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E>
  8c:	e7ff      	b.n	8e <rust_begin_unwind+0x8e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:111
    if let Some(location) = info.location() {
  8e:	e00a      	b.n	a6 <rust_begin_unwind+0xa6>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:118
    } else {
        console::print("no loc\n");  console::flush();
  90:	f240 0000 	movw	r0, #0
  94:	f2c0 0000 	movt	r0, #0
  98:	2107      	movs	r1, #7
  9a:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  9e:	e7ff      	b.n	2 <_ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E+0x2>
  a0:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5flush17h0b9090b7b6978a44E>
  a4:	e7ff      	b.n	a6 <rust_begin_unwind+0xa6>
_ZN8cortex_m3asm4bkpt17h15d676c3288af66bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.1/src/asm.rs:11
/// exception.
#[inline(always)]
pub fn bkpt() {
    match () {
        #[cfg(all(cortex_m, feature = "inline-asm"))]
        () => unsafe { asm!("bkpt" :::: "volatile") },
  a6:	be00      	bkpt	0x0000
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:121
    }
    //  Pause in the debugger.
    bkpt();
  a8:	e7ff      	b.n	aa <rust_begin_unwind+0xaa>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/lib.rs:123
    //  Loop forever so that device won't restart.
    loop {}
  aa:	e7fe      	b.n	aa <rust_begin_unwind+0xaa>

app-9b7b12e8d5cbce98.2mayv2qx0n0p0ab3.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 2mayv2qx0n0p0ab3
000002b9 l       .debug_str	00000000 
000003d6 l       .debug_str	00000000 
000003e1 l       .debug_str	00000000 
000003fe l       .debug_str	00000000 
00000417 l       .debug_str	00000000 
00000421 l       .debug_str	00000000 
00000453 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000bb l       .debug_str	00000000 
000000c2 l       .debug_str	00000000 
000000c5 l       .debug_str	00000000 
000000c9 l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000ea l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
000000fc l       .debug_str	00000000 
00000108 l       .debug_str	00000000 
00000110 l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
0000011b l       .debug_str	00000000 
00000120 l       .debug_str	00000000 
00000129 l       .debug_str	00000000 
0000012e l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000135 l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
00000145 l       .debug_str	00000000 
0000014a l       .debug_str	00000000 
0000014f l       .debug_str	00000000 
00000155 l       .debug_str	00000000 
0000015b l       .debug_str	00000000 
00000165 l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
0000016e l       .debug_str	00000000 
00000178 l       .debug_str	00000000 
00000180 l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
000001c3 l       .debug_str	00000000 
000001e2 l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
000001e9 l       .debug_str	00000000 
00000210 l       .debug_str	00000000 
00000215 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
00000221 l       .debug_str	00000000 
00000224 l       .debug_str	00000000 
00000233 l       .debug_str	00000000 
0000023a l       .debug_str	00000000 
0000023e l       .debug_str	00000000 
00000247 l       .debug_str	00000000 
0000024f l       .debug_str	00000000 
00000257 l       .debug_str	00000000 
0000025e l       .debug_str	00000000 
00000272 l       .debug_str	00000000 
0000027e l       .debug_str	00000000 
0000028a l       .debug_str	00000000 
000002a3 l       .debug_str	00000000 
000002a8 l       .debug_str	00000000 
000002c3 l       .debug_str	00000000 
000002d1 l       .debug_str	00000000 
000002d5 l       .debug_str	00000000 
000002e0 l       .debug_str	00000000 
000002e7 l       .debug_str	00000000 
000002ed l       .debug_str	00000000 
000002f1 l       .debug_str	00000000 
000002f5 l       .debug_str	00000000 
000002fd l       .debug_str	00000000 
00000314 l       .debug_str	00000000 
00000338 l       .debug_str	00000000 
00000354 l       .debug_str	00000000 
0000035e l       .debug_str	00000000 
00000378 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E	00000000 .text._ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E	0000004c .hidden _ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E



Disassembly of section .text._ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E:

00000000 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>:
_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E():
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

app-9b7b12e8d5cbce98.33w1ovg264oh73nb.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 33w1ovg264oh73nb
000003ec l       .debug_str	00000000 
0000034b l       .debug_str	00000000 
00000359 l       .debug_str	00000000 
00000380 l       .debug_str	00000000 
000003d4 l       .debug_str	00000000 
00000435 l       .debug_str	00000000 
00000443 l       .debug_str	00000000 
0000044d l       .debug_str	00000000 
0000049a l       .debug_str	00000000 
000004ac l       .debug_str	00000000 
000004b4 l       .debug_str	00000000 
000004e3 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
0000009b l       .debug_str	00000000 
000000a1 l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000aa l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b4 l       .debug_str	00000000 
000000ba l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000d1 l       .debug_str	00000000 
000000d3 l       .debug_str	00000000 
000000ea l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
0000014f l       .debug_str	00000000 
0000015f l       .debug_str	00000000 
00000164 l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
0000018f l       .debug_str	00000000 
000001fb l       .debug_str	00000000 
0000020b l       .debug_str	00000000 
00000215 l       .debug_str	00000000 
00000238 l       .debug_str	00000000 
0000027b l       .debug_str	00000000 
00000290 l       .debug_str	00000000 
0000029e l       .debug_str	00000000 
000002c4 l       .debug_str	00000000 
00000337 l       .debug_str	00000000 
00000000 l    d  .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E	00000000 .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E
00000000 l    d  .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E	00000000 .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E
00000000 l    d  .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E	00000000 .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E	00000018 _ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E
00000000 g     F .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E	0000001c _ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E
00000000 g     F .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E	0000001c _ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E
00000000         *UND*	00000000 __aeabi_memcpy



Disassembly of section .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E:

00000000 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E>:
_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:19
    fn clone(&self) -> Self { *self }
}

impl<T> MaybeUninit<T> {
    /// Create a new MaybeUninit with uninitialized interior
    pub unsafe fn uninitialized() -> Self {
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:20
        MaybeUninit { inner: StdMaybeUninit::uninit() }
   4:	9002      	str	r0, [sp, #8]
   6:	e7ff      	b.n	8 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E+0x8>
   8:	a903      	add	r1, sp, #12
   a:	2214      	movs	r2, #20
   c:	9802      	ldr	r0, [sp, #8]
   e:	f7ff fffe 	bl	0 <__aeabi_memcpy>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:21
    }
  12:	9001      	str	r0, [sp, #4]
  14:	b008      	add	sp, #32
  16:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E:

00000000 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E>:
_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:32

    // Raw pointer casts written so that we don't reference or access the
    // uninitialized interior value

    /// Return a raw pointer to the start of the interior array
    pub fn ptr(&self) -> *const T::Item
   0:	b085      	sub	sp, #20
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:35
        where T: Array
    {
        self.inner.as_ptr() as *const T::Item
   6:	9802      	ldr	r0, [sp, #8]
   8:	9003      	str	r0, [sp, #12]
_ZN4core3mem20MaybeUninit$LT$T$GT$6as_ptr17h9fc157f126312689E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:1215
   a:	9803      	ldr	r0, [sp, #12]
   c:	9004      	str	r0, [sp, #16]
_ZN76_$LT$core..mem..ManuallyDrop$LT$T$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1cd431dfc47abf51E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:879
   e:	9804      	ldr	r0, [sp, #16]
_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:35
  10:	9101      	str	r1, [sp, #4]
  12:	9000      	str	r0, [sp, #0]
  14:	e7ff      	b.n	16 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E+0x16>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:36
    }
  16:	9800      	ldr	r0, [sp, #0]
  18:	b005      	add	sp, #20
  1a:	4770      	bx	lr

Disassembly of section .text._ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E:

00000000 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E>:
_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:39

    /// Return a mut raw pointer to the start of the interior array
    pub fn ptr_mut(&mut self) -> *mut T::Item
   0:	b085      	sub	sp, #20
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:42
        where T: Array
    {
        self.inner.as_mut_ptr() as *mut T::Item
   6:	9802      	ldr	r0, [sp, #8]
   8:	9003      	str	r0, [sp, #12]
_ZN4core3mem20MaybeUninit$LT$T$GT$10as_mut_ptr17h900b2ba1045a5749E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:1252
   a:	9803      	ldr	r0, [sp, #12]
   c:	9004      	str	r0, [sp, #16]
_ZN79_$LT$core..mem..ManuallyDrop$LT$T$GT$$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h0f184f984d0c795bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:887
   e:	9804      	ldr	r0, [sp, #16]
_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:42
  10:	9101      	str	r1, [sp, #4]
  12:	9000      	str	r0, [sp, #0]
  14:	e7ff      	b.n	16 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E+0x16>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/maybe_uninit.rs:43
    }
  16:	9800      	ldr	r0, [sp, #0]
  18:	b005      	add	sp, #20
  1a:	4770      	bx	lr

app-9b7b12e8d5cbce98.3c72b4u84dsw2o7l.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3c72b4u84dsw2o7l
0000099d l       .debug_str	00000000 
000008e7 l       .debug_str	00000000 
000008f3 l       .debug_str	00000000 
0000090c l       .debug_str	00000000 
00000911 l       .debug_str	00000000 
00000922 l       .debug_str	00000000 
0000092c l       .debug_str	00000000 
0000093a l       .debug_str	00000000 
00000945 l       .debug_str	00000000 
0000094c l       .debug_str	00000000 
00000952 l       .debug_str	00000000 
00000956 l       .debug_str	00000000 
0000095a l       .debug_str	00000000 
00000962 l       .debug_str	00000000 
00000979 l       .debug_str	00000000 
000009b9 l       .debug_str	00000000 
000009c3 l       .debug_str	00000000 
000009dd l       .debug_str	00000000 
00000a3b l       .debug_str	00000000 
00000a46 l       .debug_str	00000000 
00000a63 l       .debug_str	00000000 
00000a7c l       .debug_str	00000000 
00000a86 l       .debug_str	00000000 
00000a9c l       .debug_str	00000000 
00000aa0 l       .debug_str	00000000 
00000aa6 l       .debug_str	00000000 
00000ab0 l       .debug_str	00000000 
00000abb l       .debug_str	00000000 
00000ac4 l       .debug_str	00000000 
00000acf l       .debug_str	00000000 
00000adb l       .debug_str	00000000 
00000ae4 l       .debug_str	00000000 
00000aeb l       .debug_str	00000000 
00000af3 l       .debug_str	00000000 
00000afb l       .debug_str	00000000 
00000b05 l       .debug_str	00000000 
00000b0b l       .debug_str	00000000 
00000b12 l       .debug_str	00000000 
00000b19 l       .debug_str	00000000 
00000b46 l       .debug_str	00000000 
00000b7b l       .debug_str	00000000 
00000b81 l       .debug_str	00000000 
00000b87 l       .debug_str	00000000 
00000b96 l       .debug_str	00000000 
00000ba6 l       .debug_str	00000000 
00000bb6 l       .debug_str	00000000 
00000bbe l       .debug_str	00000000 
00000be7 l       .debug_str	00000000 
00000c45 l       .debug_str	00000000 
00000cab l       .debug_str	00000000 
00000cb2 l       .debug_str	00000000 
00000cba l       .debug_str	00000000 
00000cc3 l       .debug_str	00000000 
00000ce1 l       .debug_str	00000000 
00000cf1 l       .debug_str	00000000 
00000cff l       .debug_str	00000000 
00000d0a l       .debug_str	00000000 
00000d17 l       .debug_str	00000000 
00000d26 l       .debug_str	00000000 
00000d3c l       .debug_str	00000000 
00000d46 l       .debug_str	00000000 
00000d4f l       .debug_str	00000000 
00000d58 l       .debug_str	00000000 
00000d7e l       .debug_str	00000000 
00000d94 l       .debug_str	00000000 
00000d9f l       .debug_str	00000000 
00000db5 l       .debug_str	00000000 
00000dbd l       .debug_str	00000000 
00000dde l       .debug_str	00000000 
00000de7 l       .debug_str	00000000 
00000df0 l       .debug_str	00000000 
00000dfb l       .debug_str	00000000 
00000e05 l       .debug_str	00000000 
00000e2c l       .debug_str	00000000 
00000e44 l       .debug_str	00000000 
00000e4e l       .debug_str	00000000 
00000e71 l       .debug_str	00000000 
00000e78 l       .debug_str	00000000 
00000e7d l       .debug_str	00000000 
00000ea4 l       .debug_str	00000000 
00000ea9 l       .debug_str	00000000 
00000eaf l       .debug_str	00000000 
00000eb5 l       .debug_str	00000000 
00000eb9 l       .debug_str	00000000 
00000ec6 l       .debug_str	00000000 
00000ecd l       .debug_str	00000000 
00000ed1 l       .debug_str	00000000 
00000ed3 l       .debug_str	00000000 
00000edb l       .debug_str	00000000 
00000ee2 l       .debug_str	00000000 
00000ee8 l       .debug_str	00000000 
00000eef l       .debug_str	00000000 
00000ef5 l       .debug_str	00000000 
00000efa l       .debug_str	00000000 
00000f09 l       .debug_str	00000000 
00000f17 l       .debug_str	00000000 
00000f21 l       .debug_str	00000000 
00000f26 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
00000096 l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000ad l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000c0 l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
0000010f l       .debug_str	00000000 
00000146 l       .debug_str	00000000 
00000151 l       .debug_str	00000000 
00000159 l       .debug_str	00000000 
0000015b l       .debug_str	00000000 
0000015f l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
00000172 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
00000180 l       .debug_str	00000000 
0000018a l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001a4 l       .debug_str	00000000 
000001ae l       .debug_str	00000000 
000001bd l       .debug_str	00000000 
000001f3 l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
00000225 l       .debug_str	00000000 
00000231 l       .debug_str	00000000 
00000238 l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
00000242 l       .debug_str	00000000 
0000024c l       .debug_str	00000000 
00000252 l       .debug_str	00000000 
00000257 l       .debug_str	00000000 
0000025e l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
00000267 l       .debug_str	00000000 
00000289 l       .debug_str	00000000 
000002c1 l       .debug_str	00000000 
000002c3 l       .debug_str	00000000 
000002c8 l       .debug_str	00000000 
000002cc l       .debug_str	00000000 
0000030c l       .debug_str	00000000 
00000313 l       .debug_str	00000000 
00000317 l       .debug_str	00000000 
00000322 l       .debug_str	00000000 
0000032d l       .debug_str	00000000 
00000334 l       .debug_str	00000000 
0000034b l       .debug_str	00000000 
00000353 l       .debug_str	00000000 
0000035d l       .debug_str	00000000 
00000374 l       .debug_str	00000000 
0000037d l       .debug_str	00000000 
000003b4 l       .debug_str	00000000 
000003bd l       .debug_str	00000000 
000003c0 l       .debug_str	00000000 
000003c4 l       .debug_str	00000000 
000003cc l       .debug_str	00000000 
000003d0 l       .debug_str	00000000 
000003d7 l       .debug_str	00000000 
000003df l       .debug_str	00000000 
000003f3 l       .debug_str	00000000 
00000426 l       .debug_str	00000000 
00000431 l       .debug_str	00000000 
00000467 l       .debug_str	00000000 
0000046e l       .debug_str	00000000 
00000476 l       .debug_str	00000000 
00000481 l       .debug_str	00000000 
0000048c l       .debug_str	00000000 
00000499 l       .debug_str	00000000 
000004a4 l       .debug_str	00000000 
000004ac l       .debug_str	00000000 
000004b7 l       .debug_str	00000000 
000004c2 l       .debug_str	00000000 
000004cc l       .debug_str	00000000 
000004d7 l       .debug_str	00000000 
000004e2 l       .debug_str	00000000 
000004ef l       .debug_str	00000000 
000004fb l       .debug_str	00000000 
00000508 l       .debug_str	00000000 
00000516 l       .debug_str	00000000 
00000520 l       .debug_str	00000000 
0000052d l       .debug_str	00000000 
00000539 l       .debug_str	00000000 
0000053d l       .debug_str	00000000 
00000540 l       .debug_str	00000000 
00000543 l       .debug_str	00000000 
00000548 l       .debug_str	00000000 
0000054e l       .debug_str	00000000 
00000555 l       .debug_str	00000000 
0000055d l       .debug_str	00000000 
00000567 l       .debug_str	00000000 
0000056a l       .debug_str	00000000 
0000056e l       .debug_str	00000000 
00000575 l       .debug_str	00000000 
000005b3 l       .debug_str	00000000 
000005c6 l       .debug_str	00000000 
000005c9 l       .debug_str	00000000 
000005cb l       .debug_str	00000000 
000005f3 l       .debug_str	00000000 
00000636 l       .debug_str	00000000 
0000064e l       .debug_str	00000000 
0000068e l       .debug_str	00000000 
000006a3 l       .debug_str	00000000 
000006dd l       .debug_str	00000000 
000006ec l       .debug_str	00000000 
0000072b l       .debug_str	00000000 
0000073f l       .debug_str	00000000 
00000743 l       .debug_str	00000000 
00000746 l       .debug_str	00000000 
0000074f l       .debug_str	00000000 
00000754 l       .debug_str	00000000 
0000075e l       .debug_str	00000000 
00000763 l       .debug_str	00000000 
00000769 l       .debug_str	00000000 
0000076e l       .debug_str	00000000 
00000773 l       .debug_str	00000000 
0000077a l       .debug_str	00000000 
00000783 l       .debug_str	00000000 
0000078d l       .debug_str	00000000 
00000794 l       .debug_str	00000000 
0000079a l       .debug_str	00000000 
0000079f l       .debug_str	00000000 
000007ab l       .debug_str	00000000 
000007b3 l       .debug_str	00000000 
000007bc l       .debug_str	00000000 
000007c1 l       .debug_str	00000000 
000007c4 l       .debug_str	00000000 
000007cd l       .debug_str	00000000 
000007d4 l       .debug_str	00000000 
000007d9 l       .debug_str	00000000 
000007de l       .debug_str	00000000 
000007e4 l       .debug_str	00000000 
000007ea l       .debug_str	00000000 
000007f4 l       .debug_str	00000000 
000007f7 l       .debug_str	00000000 
000007fd l       .debug_str	00000000 
00000807 l       .debug_str	00000000 
0000080f l       .debug_str	00000000 
00000815 l       .debug_str	00000000 
0000081b l       .debug_str	00000000 
00000826 l       .debug_str	00000000 
0000082f l       .debug_str	00000000 
00000852 l       .debug_str	00000000 
00000871 l       .debug_str	00000000 
00000898 l       .debug_str	00000000 
0000089d l       .debug_str	00000000 
000008a3 l       .debug_str	00000000 
000008a9 l       .debug_str	00000000 
000008b8 l       .debug_str	00000000 
000008bf l       .debug_str	00000000 
000008c3 l       .debug_str	00000000 
000008cc l       .debug_str	00000000 
000008d4 l       .debug_str	00000000 
000008db l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.0	00000012 .Lanon.3711d76dcd6be36eee60e912647a3d26.0
00000000 l     O .rodata.cst4	00000004 .Lanon.3711d76dcd6be36eee60e912647a3d26.1
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.10	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.10
00000000 l     O .rodata.cst8	00000008 .Lanon.3711d76dcd6be36eee60e912647a3d26.11
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.12	0000000e .Lanon.3711d76dcd6be36eee60e912647a3d26.12
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.13	0000000f .Lanon.3711d76dcd6be36eee60e912647a3d26.13
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.14	00000013 .Lanon.3711d76dcd6be36eee60e912647a3d26.14
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.15	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.15
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.16	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.16
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.17	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.17
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.18	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.18
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.19	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.19
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.20	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.20
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.21	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.21
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.22	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.22
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.23	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.23
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.24	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.24
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.25	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.25
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.26	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.26
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.27	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.27
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.28	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.28
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.29	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.29
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.30	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.30
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.31	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.31
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.32	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.32
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.33	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.33
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.34	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.34
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.35	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.35
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.36	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.36
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.37	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.37
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.38	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.38
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.39	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.39
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.40	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.40
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.41	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.41
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.42	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.42
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.43	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.43
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.44	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.44
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.45	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.45
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.46	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.46
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.47	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.47
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.48	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.48
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.49	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.49
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.5	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.5
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.50	00000010 .Lanon.3711d76dcd6be36eee60e912647a3d26.50
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.52	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.52
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.53	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.53
00000008 l     O .rodata.cst8	00000008 .Lanon.3711d76dcd6be36eee60e912647a3d26.54
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.55	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.55
00000010 l     O .rodata.cst8	00000008 .Lanon.3711d76dcd6be36eee60e912647a3d26.56
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.57	00000018 .Lanon.3711d76dcd6be36eee60e912647a3d26.57
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.7	00000008 .Lanon.3711d76dcd6be36eee60e912647a3d26.7
00000000 l     O .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.8	00000000 .Lanon.3711d76dcd6be36eee60e912647a3d26.8
00000000 l     O .bss._ZN3app12touch_sensor10I2C_BUFFER17h67077e8df853a3fbE	00000001 _ZN3app12touch_sensor10I2C_BUFFER17h67077e8df853a3fbE
00000000 l     O .bss._ZN3app12touch_sensor10TOUCH_DATA17h8efc9362a2bbef48E	00000052 _ZN3app12touch_sensor10TOUCH_DATA17h8efc9362a2bbef48E
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_DELAY17hcd285be8630849acE	00000000 _ZN3app12touch_sensor11TOUCH_DELAY17hcd285be8630849acE
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_EVENT17h3d138bd335dcfa2aE	00000010 _ZN3app12touch_sensor11TOUCH_EVENT17h3d138bd335dcfa2aE
00000000 l     O .bss._ZN3app12touch_sensor11TOUCH_RESET17h2ba7890188a115c1E	00000004 _ZN3app12touch_sensor11TOUCH_RESET17h2ba7890188a115c1E
00000000 l     F .text._ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE	000006b0 _ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE
00000000 l     F .text._ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE	0000018a _ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE
00000000 l     F .text._ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E	00000066 _ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E
00000000 l     F .text._ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E	00000046 _ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E
00000000 l     O .bss._ZN3app12touch_sensor3buf17hfa819c19783b733eE	0000003f _ZN3app12touch_sensor3buf17hfa819c19783b733eE
00000000 l     O .bss._ZN3app12touch_sensor8I2C_DATA17h4361e6116372ebf6E	00000008 _ZN3app12touch_sensor8I2C_DATA17h4361e6116372ebf6E
00000000 l     O .rodata.str.0	0000001c str.0
00000000 l     O .rodata.str.1	00000021 str.1
00000000 l     O .rodata.str.2	0000001c str.2
00000000 l    d  .text._ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE	00000000 .text._ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE
00000000 l    d  .text._ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E	00000000 .text._ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E
00000000 l    d  .text._ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E	00000000 .text._ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E
00000000 l    d  .text._ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE	00000000 .text._ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE
00000000 l    d  .text._ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE	00000000 .text._ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_RESET17h2ba7890188a115c1E	00000000 .bss._ZN3app12touch_sensor11TOUCH_RESET17h2ba7890188a115c1E
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_DELAY17hcd285be8630849acE	00000000 .bss._ZN3app12touch_sensor11TOUCH_DELAY17hcd285be8630849acE
00000000 l    d  .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.2	00000000 .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.2
00000000 l    d  .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.3	00000000 .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.3
00000000 l    d  .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.4	00000000 .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.4
00000000 l    d  .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.6	00000000 .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.6
00000000 l    d  .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.9	00000000 .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.9
00000000 l    d  .bss._ZN3app12touch_sensor10TOUCH_DATA17h8efc9362a2bbef48E	00000000 .bss._ZN3app12touch_sensor10TOUCH_DATA17h8efc9362a2bbef48E
00000000 l    d  .rodata.str.0	00000000 .rodata.str.0
00000000 l    d  .rodata.str.1	00000000 .rodata.str.1
00000000 l    d  .rodata.str.2	00000000 .rodata.str.2
00000000 l    d  .bss._ZN3app12touch_sensor3buf17hfa819c19783b733eE	00000000 .bss._ZN3app12touch_sensor3buf17hfa819c19783b733eE
00000000 l    d  .bss._ZN3app12touch_sensor11TOUCH_EVENT17h3d138bd335dcfa2aE	00000000 .bss._ZN3app12touch_sensor11TOUCH_EVENT17h3d138bd335dcfa2aE
00000000 l    d  .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.51	00000000 .rodata..Lanon.3711d76dcd6be36eee60e912647a3d26.51
00000000 l    d  .bss._ZN3app12touch_sensor8I2C_DATA17h4361e6116372ebf6E	00000000 .bss._ZN3app12touch_sensor8I2C_DATA17h4361e6116372ebf6E
00000000 l    d  .bss._ZN3app12touch_sensor10I2C_BUFFER17h67077e8df853a3fbE	00000000 .bss._ZN3app12touch_sensor10I2C_BUFFER17h67077e8df853a3fbE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 .hidden _ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E
00000000 g     F .text._ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE	00000268 .hidden _ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE
00000000         *UND*	00000000 .hidden _ZN3app7display10show_touch17hb30bdb206ccb1c66E
00000000         *UND*	00000000 _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h454ef22920ac32f5E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17hfa0c1fd27421f772E
00000000         *UND*	00000000 .hidden _ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E
00000000         *UND*	00000000 _ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E
00000000         *UND*	00000000 _ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h958b1d5f87088d8dE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17ha3acb9c0604817feE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h70be3ebb33ef544dE
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E
00000000         *UND*	00000000 _ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 _ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E
00000000         *UND*	00000000 _ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17h3e269ca172b8335aE
00000000         *UND*	00000000 _ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h3b15381b8b2160abE
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17ha056d3b92fa56924E
00000000         *UND*	00000000 _ZN6mynewt6kernel2os15eventq_dflt_get17h98f9329688c1613bE
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E
00000000         *UND*	00000000 _ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE
00000000         *UND*	00000000 _ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E
00000000         *UND*	00000000 _ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE
00000000         *UND*	00000000 __aeabi_memclr
00000000         *UND*	00000000 __aeabi_memcpy
00000000         *UND*	00000000 hal_gpio_irq_enable
00000000         *UND*	00000000 hal_gpio_irq_init
00000000         *UND*	00000000 hal_i2c_master_read
00000000         *UND*	00000000 hal_i2c_master_write
00000000         *UND*	00000000 os_eventq_put



Disassembly of section .text._ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE:

00000000 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE>:
_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:40
/// ```rust
/// let peripherals = nrf52::Peripherals::take().unwrap();
/// let nfcpins = peripherals.UICR.nfcpins.read().bits();
/// console::print("nfcpins = "); console::printhex(nfcpins as u8); console::print("\n");
/// ```
pub fn start_touch_sensor() -> MynewtResult<()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0bc      	sub	sp, #240	; 0xf0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:41
    console::print("Rust touch sensor\n");
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	2112      	movs	r1, #18
   e:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  12:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:44

    //  Init GPIO for the Reset Pin
    unsafe { TOUCH_RESET.init(TOUCH_RESET_PIN) ? };
  14:	f240 0000 	movw	r0, #0
  18:	f2c0 0000 	movt	r0, #0
  1c:	210a      	movs	r1, #10
  1e:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E>
  22:	9010      	str	r0, [sp, #64]	; 0x40
  24:	e7ff      	b.n	26 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x26>
  26:	9810      	ldr	r0, [sp, #64]	; 0x40
  28:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
  2c:	9012      	str	r0, [sp, #72]	; 0x48
  2e:	e7ff      	b.n	30 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x30>
  30:	9812      	ldr	r0, [sp, #72]	; 0x48
  32:	1e41      	subs	r1, r0, #1
  34:	bf18      	it	ne
  36:	2101      	movne	r1, #1
  38:	2801      	cmp	r0, #1
  3a:	910f      	str	r1, [sp, #60]	; 0x3c
  3c:	d015      	beq.n	6a <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x6a>
  3e:	e7ff      	b.n	40 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x40>
  40:	980f      	ldr	r0, [sp, #60]	; 0x3c
  42:	2801      	cmp	r0, #1
  44:	d001      	beq.n	4a <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x4a>
  46:	e7ff      	b.n	48 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x48>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:70
    assert_eq!(rc, 0, "IRQ init fail");

    //  Start monitoring for touch controller interrupts
    unsafe { hal::hal_gpio_irq_enable(TOUCH_INTERRUPT_PIN) };
    Ok(())
}
  48:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:44
    unsafe { TOUCH_RESET.init(TOUCH_RESET_PIN) ? };
  4a:	9812      	ldr	r0, [sp, #72]	; 0x48
  4c:	9013      	str	r0, [sp, #76]	; 0x4c
  4e:	9813      	ldr	r0, [sp, #76]	; 0x4c
  50:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  54:	900e      	str	r0, [sp, #56]	; 0x38
  56:	e7ff      	b.n	58 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x58>
  58:	980e      	ldr	r0, [sp, #56]	; 0x38
  5a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
  5e:	9011      	str	r0, [sp, #68]	; 0x44
  60:	e7ff      	b.n	62 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x62>
  62:	e7ff      	b.n	64 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x64>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:70
}
  64:	9811      	ldr	r0, [sp, #68]	; 0x44
  66:	b03c      	add	sp, #240	; 0xf0
  68:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:48
        TOUCH_RESET.set_low() ? ;
  6a:	f240 0000 	movw	r0, #0
  6e:	f2c0 0000 	movt	r0, #0
  72:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE>
  76:	900d      	str	r0, [sp, #52]	; 0x34
  78:	e7ff      	b.n	7a <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x7a>
  7a:	980d      	ldr	r0, [sp, #52]	; 0x34
  7c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
  80:	9015      	str	r0, [sp, #84]	; 0x54
  82:	e7ff      	b.n	84 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x84>
  84:	9815      	ldr	r0, [sp, #84]	; 0x54
  86:	1e41      	subs	r1, r0, #1
  88:	bf18      	it	ne
  8a:	2101      	movne	r1, #1
  8c:	2801      	cmp	r0, #1
  8e:	910c      	str	r1, [sp, #48]	; 0x30
  90:	d011      	beq.n	b6 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0xb6>
  92:	e7ff      	b.n	94 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x94>
  94:	980c      	ldr	r0, [sp, #48]	; 0x30
  96:	2801      	cmp	r0, #1
  98:	d1d6      	bne.n	48 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x48>
  9a:	e7ff      	b.n	9c <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x9c>
  9c:	9815      	ldr	r0, [sp, #84]	; 0x54
  9e:	9016      	str	r0, [sp, #88]	; 0x58
  a0:	9816      	ldr	r0, [sp, #88]	; 0x58
  a2:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  a6:	900b      	str	r0, [sp, #44]	; 0x2c
  a8:	e7ff      	b.n	aa <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0xaa>
  aa:	980b      	ldr	r0, [sp, #44]	; 0x2c
  ac:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
  b0:	9011      	str	r0, [sp, #68]	; 0x44
  b2:	e7ff      	b.n	b4 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0xb4>
  b4:	e7d6      	b.n	64 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x64>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:49
        TOUCH_DELAY.delay_ms(20);
  b6:	f240 0000 	movw	r0, #0
  ba:	f2c0 0000 	movt	r0, #0
  be:	2114      	movs	r1, #20
  c0:	f7ff fffe 	bl	0 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE>
  c4:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:50
        TOUCH_RESET.set_high() ? ;
  c6:	f240 0000 	movw	r0, #0
  ca:	f2c0 0000 	movt	r0, #0
  ce:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E>
  d2:	900a      	str	r0, [sp, #40]	; 0x28
  d4:	e7ff      	b.n	d6 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0xd6>
  d6:	980a      	ldr	r0, [sp, #40]	; 0x28
  d8:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
  dc:	9018      	str	r0, [sp, #96]	; 0x60
  de:	e7ff      	b.n	e0 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0xe0>
  e0:	9818      	ldr	r0, [sp, #96]	; 0x60
  e2:	1e41      	subs	r1, r0, #1
  e4:	bf18      	it	ne
  e6:	2101      	movne	r1, #1
  e8:	2801      	cmp	r0, #1
  ea:	9109      	str	r1, [sp, #36]	; 0x24
  ec:	d011      	beq.n	112 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x112>
  ee:	e7ff      	b.n	f0 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0xf0>
  f0:	9809      	ldr	r0, [sp, #36]	; 0x24
  f2:	2801      	cmp	r0, #1
  f4:	d1a8      	bne.n	48 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x48>
  f6:	e7ff      	b.n	f8 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0xf8>
  f8:	9818      	ldr	r0, [sp, #96]	; 0x60
  fa:	9019      	str	r0, [sp, #100]	; 0x64
  fc:	9819      	ldr	r0, [sp, #100]	; 0x64
  fe:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
 102:	9008      	str	r0, [sp, #32]
 104:	e7ff      	b.n	106 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x106>
 106:	9808      	ldr	r0, [sp, #32]
 108:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 10c:	9011      	str	r0, [sp, #68]	; 0x44
 10e:	e7ff      	b.n	110 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x110>
 110:	e7a8      	b.n	64 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x64>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:51
        TOUCH_DELAY.delay_ms(200); TOUCH_DELAY.delay_ms(200);    
 112:	f240 0000 	movw	r0, #0
 116:	f2c0 0000 	movt	r0, #0
 11a:	21c8      	movs	r1, #200	; 0xc8
 11c:	f7ff fffe 	bl	0 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE>
 120:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x2>
 122:	f240 0000 	movw	r0, #0
 126:	f2c0 0000 	movt	r0, #0
 12a:	21c8      	movs	r1, #200	; 0xc8
 12c:	f7ff fffe 	bl	0 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE>
 130:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:55
    unsafe { TOUCH_EVENT.ev_cb = Some( touch_event_callback ) };
 132:	f240 0000 	movw	r0, #0
 136:	f2c0 0000 	movt	r0, #0
 13a:	f240 0100 	movw	r1, #0
 13e:	f2c0 0100 	movt	r1, #0
 142:	6041      	str	r1, [r0, #4]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:60
        Some( touch_interrupt_handler ),  //  Call `touch_interrupt_handler()` upon detecting interrupt
 144:	f240 0000 	movw	r0, #0
 148:	f2c0 0000 	movt	r0, #0
 14c:	901c      	str	r0, [sp, #112]	; 0x70
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:61
        core::ptr::null_mut(),            //  No arguments for `touch_interrupt_handler()`
 14e:	f7ff fffe 	bl	0 <_ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E>
 152:	9007      	str	r0, [sp, #28]
 154:	e7ff      	b.n	156 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x156>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:58
    let rc = unsafe { hal::hal_gpio_irq_init(
 156:	991c      	ldr	r1, [sp, #112]	; 0x70
 158:	4668      	mov	r0, sp
 15a:	2201      	movs	r2, #1
 15c:	6002      	str	r2, [r0, #0]
 15e:	201c      	movs	r0, #28
 160:	2302      	movs	r3, #2
 162:	9a07      	ldr	r2, [sp, #28]
 164:	f7ff fffe 	bl	0 <hal_gpio_irq_init>
 168:	901b      	str	r0, [sp, #108]	; 0x6c
 16a:	e7ff      	b.n	16c <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x16c>
 16c:	a81b      	add	r0, sp, #108	; 0x6c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:65
    assert_eq!(rc, 0, "IRQ init fail");
 16e:	901d      	str	r0, [sp, #116]	; 0x74
 170:	f240 0000 	movw	r0, #0
 174:	f2c0 0000 	movt	r0, #0
 178:	901e      	str	r0, [sp, #120]	; 0x78
 17a:	981d      	ldr	r0, [sp, #116]	; 0x74
 17c:	901f      	str	r0, [sp, #124]	; 0x7c
 17e:	981e      	ldr	r0, [sp, #120]	; 0x78
 180:	9020      	str	r0, [sp, #128]	; 0x80
 182:	981f      	ldr	r0, [sp, #124]	; 0x7c
 184:	6800      	ldr	r0, [r0, #0]
 186:	9920      	ldr	r1, [sp, #128]	; 0x80
 188:	6809      	ldr	r1, [r1, #0]
 18a:	4288      	cmp	r0, r1
 18c:	d014      	beq.n	1b8 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x1b8>
 18e:	e7ff      	b.n	190 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x190>
 190:	981f      	ldr	r0, [sp, #124]	; 0x7c
 192:	9030      	str	r0, [sp, #192]	; 0xc0
 194:	9820      	ldr	r0, [sp, #128]	; 0x80
 196:	9031      	str	r0, [sp, #196]	; 0xc4
 198:	4668      	mov	r0, sp
 19a:	2100      	movs	r1, #0
 19c:	6001      	str	r1, [r0, #0]
 19e:	f240 0100 	movw	r1, #0
 1a2:	f2c0 0100 	movt	r1, #0
 1a6:	f240 0300 	movw	r3, #0
 1aa:	f2c0 0300 	movt	r3, #0
 1ae:	a832      	add	r0, sp, #200	; 0xc8
 1b0:	2201      	movs	r2, #1
 1b2:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 1b6:	e003      	b.n	1c0 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x1c0>
 1b8:	201c      	movs	r0, #28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:68
    unsafe { hal::hal_gpio_irq_enable(TOUCH_INTERRUPT_PIN) };
 1ba:	f7ff fffe 	bl	0 <hal_gpio_irq_enable>
 1be:	e04e      	b.n	25e <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x25e>
 1c0:	a830      	add	r0, sp, #192	; 0xc0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:65
    assert_eq!(rc, 0, "IRQ init fail");
 1c2:	902d      	str	r0, [sp, #180]	; 0xb4
 1c4:	a831      	add	r0, sp, #196	; 0xc4
 1c6:	902e      	str	r0, [sp, #184]	; 0xb8
 1c8:	a832      	add	r0, sp, #200	; 0xc8
 1ca:	902f      	str	r0, [sp, #188]	; 0xbc
 1cc:	982d      	ldr	r0, [sp, #180]	; 0xb4
 1ce:	9038      	str	r0, [sp, #224]	; 0xe0
 1d0:	982e      	ldr	r0, [sp, #184]	; 0xb8
 1d2:	9039      	str	r0, [sp, #228]	; 0xe4
 1d4:	982f      	ldr	r0, [sp, #188]	; 0xbc
 1d6:	903a      	str	r0, [sp, #232]	; 0xe8
 1d8:	9838      	ldr	r0, [sp, #224]	; 0xe0
 1da:	f240 0100 	movw	r1, #0
 1de:	f2c0 0100 	movt	r1, #0
 1e2:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
 1e6:	9006      	str	r0, [sp, #24]
 1e8:	9105      	str	r1, [sp, #20]
 1ea:	e7ff      	b.n	1ec <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x1ec>
 1ec:	9839      	ldr	r0, [sp, #228]	; 0xe4
 1ee:	f240 0100 	movw	r1, #0
 1f2:	f2c0 0100 	movt	r1, #0
 1f6:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h67aeaac95d81aa22E>
 1fa:	9004      	str	r0, [sp, #16]
 1fc:	9103      	str	r1, [sp, #12]
 1fe:	e7ff      	b.n	200 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x200>
 200:	983a      	ldr	r0, [sp, #232]	; 0xe8
 202:	f240 0100 	movw	r1, #0
 206:	f2c0 0100 	movt	r1, #0
 20a:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17hfa0c1fd27421f772E>
 20e:	9002      	str	r0, [sp, #8]
 210:	9101      	str	r1, [sp, #4]
 212:	e7ff      	b.n	214 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x214>
 214:	9806      	ldr	r0, [sp, #24]
 216:	9027      	str	r0, [sp, #156]	; 0x9c
 218:	9905      	ldr	r1, [sp, #20]
 21a:	9128      	str	r1, [sp, #160]	; 0xa0
 21c:	9a04      	ldr	r2, [sp, #16]
 21e:	9229      	str	r2, [sp, #164]	; 0xa4
 220:	9b03      	ldr	r3, [sp, #12]
 222:	932a      	str	r3, [sp, #168]	; 0xa8
 224:	f8dd c008 	ldr.w	ip, [sp, #8]
 228:	f8cd c0ac 	str.w	ip, [sp, #172]	; 0xac
 22c:	f8dd e004 	ldr.w	lr, [sp, #4]
 230:	f8cd e0b0 	str.w	lr, [sp, #176]	; 0xb0
 234:	466c      	mov	r4, sp
 236:	2503      	movs	r5, #3
 238:	6025      	str	r5, [r4, #0]
 23a:	f240 0100 	movw	r1, #0
 23e:	f2c0 0100 	movt	r1, #0
 242:	a821      	add	r0, sp, #132	; 0x84
 244:	ab27      	add	r3, sp, #156	; 0x9c
 246:	462a      	mov	r2, r5
 248:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
 24c:	e7ff      	b.n	2 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x2>
 24e:	f240 0100 	movw	r1, #0
 252:	f2c0 0100 	movt	r1, #0
 256:	a821      	add	r0, sp, #132	; 0x84
 258:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 25c:	defe      	udf	#254	; 0xfe
 25e:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:69
    Ok(())
 260:	9011      	str	r0, [sp, #68]	; 0x44
 262:	2001      	movs	r0, #1
 264:	9011      	str	r0, [sp, #68]	; 0x44
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:70
}
 266:	e6fd      	b.n	64 <_ZN3app12touch_sensor18start_touch_sensor17h3e9f93262e716f9eE+0x64>

Disassembly of section .text._ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E:

00000000 <_ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E>:
_ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:73

/// Interrupt handler for the touch controller, triggered when a touch is detected
extern "C" fn touch_interrupt_handler(arg: *mut core::ffi::c_void) {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:75
    //  We forward a touch event to the Default Event Queue for deferred processing.  Don't do any processing here.
    unsafe { TOUCH_EVENT.ev_arg = arg };
   8:	9802      	ldr	r0, [sp, #8]
   a:	f240 0200 	movw	r2, #0
   e:	f2c0 0200 	movt	r2, #0
  12:	6090      	str	r0, [r2, #8]
  14:	a804      	add	r0, sp, #16
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:77
    //  Fetch the Default Event Queue. TODO: Use dedicated Event Queue for higher priority processing.
    let queue = os::eventq_dflt_get()
  16:	9101      	str	r1, [sp, #4]
  18:	f7ff fffe 	bl	0 <_ZN6mynewt6kernel2os15eventq_dflt_get17h98f9329688c1613bE>
  1c:	e7ff      	b.n	2 <_ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E+0x2>
  1e:	f240 0100 	movw	r1, #0
  22:	f2c0 0100 	movt	r1, #0
  26:	a804      	add	r0, sp, #16
  28:	2208      	movs	r2, #8
  2a:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h43e5b58bf895e472E>
  2e:	9003      	str	r0, [sp, #12]
  30:	e7ff      	b.n	32 <_ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E+0x32>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:79
        .expect("GET fail");
	unsafe { os::os_eventq_put(queue, &mut TOUCH_EVENT) };  //  Trigger the callback function `touch_event_callback()`
  32:	9803      	ldr	r0, [sp, #12]
  34:	f240 0100 	movw	r1, #0
  38:	f2c0 0100 	movt	r1, #0
  3c:	f7ff fffe 	bl	0 <os_eventq_put>
  40:	e7ff      	b.n	42 <_ZN3app12touch_sensor23touch_interrupt_handler17h17f70818f8205431E+0x42>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:80
}
  42:	b006      	add	sp, #24
  44:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E:

00000000 <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E>:
_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:83

/// Callback for the touch event that is triggered when a touch is detected
extern "C" fn touch_event_callback(_event: *mut os_event) {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	4601      	mov	r1, r0
   6:	9005      	str	r0, [sp, #20]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:87
    //  console::printhex(unsafe { os::os_time_get() } as u8); console::print(" touch\n");
    unsafe { 
        //  Fetch the touch data from the touch controller
        read_touchdata(&mut TOUCH_DATA)
   8:	f240 0000 	movw	r0, #0
   c:	f2c0 0000 	movt	r0, #0
  10:	9104      	str	r1, [sp, #16]
  12:	f7ff fffe 	bl	0 <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E>
  16:	9003      	str	r0, [sp, #12]
  18:	e7ff      	b.n	1a <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E+0x1a>
  1a:	f240 0100 	movw	r1, #0
  1e:	f2c0 0100 	movt	r1, #0
  22:	220e      	movs	r2, #14
  24:	9803      	ldr	r0, [sp, #12]
  26:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  2a:	e7ff      	b.n	2c <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E+0x2c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:91
            .expect("touchdata fail");
        //  Display the touch data
        display::show_touch(
            TOUCH_DATA.touches[0].x,
  2c:	e7ff      	b.n	2e <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E+0x2e>
  2e:	f240 0000 	movw	r0, #0
  32:	f2c0 0000 	movt	r0, #0
  36:	8800      	ldrh	r0, [r0, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:92
            TOUCH_DATA.touches[0].y
  38:	9002      	str	r0, [sp, #8]
  3a:	e7ff      	b.n	3c <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E+0x3c>
  3c:	f240 0000 	movw	r0, #0
  40:	f2c0 0000 	movt	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:90
        display::show_touch(
  44:	8841      	ldrh	r1, [r0, #2]
  46:	9802      	ldr	r0, [sp, #8]
  48:	f7ff fffe 	bl	0 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E>
  4c:	9001      	str	r0, [sp, #4]
  4e:	e7ff      	b.n	50 <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E+0x50>
  50:	f240 0100 	movw	r1, #0
  54:	f2c0 0100 	movt	r1, #0
  58:	220f      	movs	r2, #15
  5a:	9801      	ldr	r0, [sp, #4]
  5c:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  60:	e7ff      	b.n	62 <_ZN3app12touch_sensor20touch_event_callback17h8ccbccf15983e4c0E+0x62>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:99
    }
    //  Disable the console output because it slows down the rendering
    //  console::printint(unsafe { TOUCH_DATA.touches[0].x } as i32); console::print(", ");
    //  console::printint(unsafe { TOUCH_DATA.touches[0].y } as i32); console::print("\n");
    //  console::flush();   
}
  62:	b006      	add	sp, #24
  64:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE:

00000000 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE>:
_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:106
/// Touch data will be populated here
static mut TOUCH_DATA: TouchEventInfo = fill_zero!(TouchEventInfo);

/// Read touch controller data. This only works when the screen has been tapped and the touch controller wakes up.
/// Ported from https://github.com/lupyuen/hynitron_i2c_cst0xxse/blob/master/cst0xx_core.c#L407-L466
fn read_touchdata(data: &mut TouchEventInfo) -> MynewtResult<()> {
   0:	b580      	push	{r7, lr}
   2:	b0e6      	sub	sp, #408	; 0x198
   4:	4601      	mov	r1, r0
   6:	902e      	str	r0, [sp, #184]	; 0xb8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:107
    read_register_range(           //  Read the range of I2C registers...
   8:	4668      	mov	r0, sp
   a:	223f      	movs	r2, #63	; 0x3f
   c:	6002      	str	r2, [r0, #0]
   e:	f240 0300 	movw	r3, #0
  12:	f2c0 0300 	movt	r3, #0
  16:	2015      	movs	r0, #21
  18:	f04f 0c00 	mov.w	ip, #0
  1c:	912d      	str	r1, [sp, #180]	; 0xb4
  1e:	4661      	mov	r1, ip
  20:	f7ff fffe 	bl	0 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE>
  24:	902c      	str	r0, [sp, #176]	; 0xb0
  26:	e7ff      	b.n	28 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x28>
  28:	f240 0100 	movw	r1, #0
  2c:	f2c0 0100 	movt	r1, #0
  30:	2213      	movs	r2, #19
  32:	982c      	ldr	r0, [sp, #176]	; 0xb0
  34:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h52a9a57dad7abd84E>
  38:	e7ff      	b.n	3a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x3a>
  3a:	f50d 7089 	add.w	r0, sp, #274	; 0x112
  3e:	2152      	movs	r1, #82	; 0x52
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:113
        TOUCH_CONTROLLER_ADDRESS,  //  From the touch controller
        0,                         //  Starting from register 0
        POINT_READ_BUF as u8,      //  Number of registers to read
        unsafe { &mut buf }        //  Save the read data into `buf`
    ).expect("read touchdata fail");
    *data = fill_zero!(TouchEventInfo);
  40:	902b      	str	r0, [sp, #172]	; 0xac
  42:	912a      	str	r1, [sp, #168]	; 0xa8
  44:	f7ff fffe 	bl	0 <__aeabi_memclr>
  48:	a830      	add	r0, sp, #192	; 0xc0
  4a:	992b      	ldr	r1, [sp, #172]	; 0xac
  4c:	9a2a      	ldr	r2, [sp, #168]	; 0xa8
  4e:	f7ff fffe 	bl	0 <__aeabi_memcpy>
  52:	9029      	str	r0, [sp, #164]	; 0xa4
  54:	e7ff      	b.n	56 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x56>
  56:	982e      	ldr	r0, [sp, #184]	; 0xb8
  58:	a930      	add	r1, sp, #192	; 0xc0
  5a:	2252      	movs	r2, #82	; 0x52
  5c:	f7ff fffe 	bl	0 <__aeabi_memcpy>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:114
    data.point_num = unsafe { buf[FT_TOUCH_POINT_NUM] & 0x0F };
  60:	9028      	str	r0, [sp, #160]	; 0xa0
  62:	e7ff      	b.n	64 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x64>
  64:	f240 0000 	movw	r0, #0
  68:	f2c0 0000 	movt	r0, #0
  6c:	7880      	ldrb	r0, [r0, #2]
  6e:	f000 000f 	and.w	r0, r0, #15
  72:	992e      	ldr	r1, [sp, #184]	; 0xb8
  74:	f881 0051 	strb.w	r0, [r1, #81]	; 0x51
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:115
    data.count     = 0;
  78:	982e      	ldr	r0, [sp, #184]	; 0xb8
  7a:	2100      	movs	r1, #0
  7c:	f880 1050 	strb.w	r1, [r0, #80]	; 0x50
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:118

    //  Populate the first 5 touch points
    for i in 0..CFG_MAX_TOUCH_POINTS {
  80:	9159      	str	r1, [sp, #356]	; 0x164
  82:	2005      	movs	r0, #5
  84:	905a      	str	r0, [sp, #360]	; 0x168
  86:	9859      	ldr	r0, [sp, #356]	; 0x164
  88:	995a      	ldr	r1, [sp, #360]	; 0x168
  8a:	f7ff fffe 	bl	0 <_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h3b15381b8b2160abE>
  8e:	9027      	str	r0, [sp, #156]	; 0x9c
  90:	9126      	str	r1, [sp, #152]	; 0x98
  92:	e7ff      	b.n	94 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x94>
  94:	9827      	ldr	r0, [sp, #156]	; 0x9c
  96:	905b      	str	r0, [sp, #364]	; 0x16c
  98:	9926      	ldr	r1, [sp, #152]	; 0x98
  9a:	915c      	str	r1, [sp, #368]	; 0x170
  9c:	e7ff      	b.n	9e <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x9e>
  9e:	a85b      	add	r0, sp, #364	; 0x16c
  a0:	f7ff fffe 	bl	0 <_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h958b1d5f87088d8dE>
  a4:	915f      	str	r1, [sp, #380]	; 0x17c
  a6:	905e      	str	r0, [sp, #376]	; 0x178
  a8:	e7ff      	b.n	aa <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xaa>
  aa:	985e      	ldr	r0, [sp, #376]	; 0x178
  ac:	2800      	cmp	r0, #0
  ae:	9025      	str	r0, [sp, #148]	; 0x94
  b0:	d014      	beq.n	dc <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xdc>
  b2:	e7ff      	b.n	b4 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xb4>
  b4:	9825      	ldr	r0, [sp, #148]	; 0x94
  b6:	2801      	cmp	r0, #1
  b8:	d001      	beq.n	be <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xbe>
  ba:	e7ff      	b.n	bc <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xbc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:151
            && (data.point_num == 0) {
            break;
        }
    }
    Ok(())
}
  bc:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:118
    for i in 0..CFG_MAX_TOUCH_POINTS {
  be:	985f      	ldr	r0, [sp, #380]	; 0x17c
  c0:	9060      	str	r0, [sp, #384]	; 0x180
  c2:	9860      	ldr	r0, [sp, #384]	; 0x180
  c4:	905d      	str	r0, [sp, #372]	; 0x174
  c6:	985d      	ldr	r0, [sp, #372]	; 0x174
  c8:	9061      	str	r0, [sp, #388]	; 0x184
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:119
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
  ca:	9861      	ldr	r0, [sp, #388]	; 0x184
  cc:	2106      	movs	r1, #6
  ce:	fba1 0100 	umull	r0, r1, r1, r0
  d2:	2900      	cmp	r1, #0
  d4:	9024      	str	r0, [sp, #144]	; 0x90
  d6:	f040 81cd 	bne.w	474 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x474>
  da:	e007      	b.n	ec <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xec>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:118
    for i in 0..CFG_MAX_TOUCH_POINTS {
  dc:	e7ff      	b.n	de <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xde>
  de:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:150
    Ok(())
  e0:	902f      	str	r0, [sp, #188]	; 0xbc
  e2:	2001      	movs	r0, #1
  e4:	902f      	str	r0, [sp, #188]	; 0xbc
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:151
}
  e6:	982f      	ldr	r0, [sp, #188]	; 0xbc
  e8:	b066      	add	sp, #408	; 0x198
  ea:	bd80      	pop	{r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:119
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
  ec:	9824      	ldr	r0, [sp, #144]	; 0x90
  ee:	1d41      	adds	r1, r0, #5
  f0:	460a      	mov	r2, r1
  f2:	4281      	cmp	r1, r0
  f4:	9223      	str	r2, [sp, #140]	; 0x8c
  f6:	f0c0 81c4 	bcc.w	482 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x482>
  fa:	e7ff      	b.n	fc <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xfc>
  fc:	9823      	ldr	r0, [sp, #140]	; 0x8c
  fe:	283e      	cmp	r0, #62	; 0x3e
 100:	f200 81c6 	bhi.w	490 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x490>
 104:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 106:	f240 0000 	movw	r0, #0
 10a:	f2c0 0000 	movt	r0, #0
 10e:	9923      	ldr	r1, [sp, #140]	; 0x8c
 110:	5c40      	ldrb	r0, [r0, r1]
 112:	0900      	lsrs	r0, r0, #4
 114:	9022      	str	r0, [sp, #136]	; 0x88
 116:	e7ff      	b.n	118 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x118>
 118:	9822      	ldr	r0, [sp, #136]	; 0x88
 11a:	f88d 0189 	strb.w	r0, [sp, #393]	; 0x189
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:120
        if pointid >= HYN_MAX_ID { break; }
 11e:	f89d 1189 	ldrb.w	r1, [sp, #393]	; 0x189
 122:	290f      	cmp	r1, #15
 124:	d302      	bcc.n	12c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x12c>
 126:	e7ff      	b.n	128 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x128>
 128:	e7ff      	b.n	12a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x12a>
 12a:	e7d8      	b.n	de <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0xde>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:123
        data.count += 1;
 12c:	982e      	ldr	r0, [sp, #184]	; 0xb8
 12e:	f890 0050 	ldrb.w	r0, [r0, #80]	; 0x50
 132:	3001      	adds	r0, #1
 134:	b2c1      	uxtb	r1, r0
 136:	4602      	mov	r2, r0
 138:	4281      	cmp	r1, r0
 13a:	9221      	str	r2, [sp, #132]	; 0x84
 13c:	f040 81b1 	bne.w	4a2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x4a2>
 140:	e7ff      	b.n	142 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x142>
 142:	982e      	ldr	r0, [sp, #184]	; 0xb8
 144:	9921      	ldr	r1, [sp, #132]	; 0x84
 146:	f880 1050 	strb.w	r1, [r0, #80]	; 0x50
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:124
        let x_high = unsafe { buf[HYN_TOUCH_X_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 14a:	9861      	ldr	r0, [sp, #388]	; 0x184
 14c:	2206      	movs	r2, #6
 14e:	fba2 0200 	umull	r0, r2, r2, r0
 152:	2a00      	cmp	r2, #0
 154:	9020      	str	r0, [sp, #128]	; 0x80
 156:	f040 81ab 	bne.w	4b0 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x4b0>
 15a:	e7ff      	b.n	15c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x15c>
 15c:	9820      	ldr	r0, [sp, #128]	; 0x80
 15e:	1cc1      	adds	r1, r0, #3
 160:	460a      	mov	r2, r1
 162:	4281      	cmp	r1, r0
 164:	921f      	str	r2, [sp, #124]	; 0x7c
 166:	f0c0 81aa 	bcc.w	4be <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x4be>
 16a:	e7ff      	b.n	16c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x16c>
 16c:	981f      	ldr	r0, [sp, #124]	; 0x7c
 16e:	283e      	cmp	r0, #62	; 0x3e
 170:	f200 81ac 	bhi.w	4cc <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x4cc>
 174:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 176:	f240 0000 	movw	r0, #0
 17a:	f2c0 0000 	movt	r0, #0
 17e:	991f      	ldr	r1, [sp, #124]	; 0x7c
 180:	5c40      	ldrb	r0, [r0, r1]
 182:	f000 000f 	and.w	r0, r0, #15
 186:	f8ad 018a 	strh.w	r0, [sp, #394]	; 0x18a
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:125
        let x_low  = unsafe { buf[HYN_TOUCH_X_L_POS + HYN_TOUCH_STEP * i] } as u16;
 18a:	9861      	ldr	r0, [sp, #388]	; 0x184
 18c:	2206      	movs	r2, #6
 18e:	fba2 0200 	umull	r0, r2, r2, r0
 192:	2a00      	cmp	r2, #0
 194:	901e      	str	r0, [sp, #120]	; 0x78
 196:	f040 81a2 	bne.w	4de <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x4de>
 19a:	e7ff      	b.n	19c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x19c>
 19c:	981e      	ldr	r0, [sp, #120]	; 0x78
 19e:	1d01      	adds	r1, r0, #4
 1a0:	460a      	mov	r2, r1
 1a2:	4281      	cmp	r1, r0
 1a4:	921d      	str	r2, [sp, #116]	; 0x74
 1a6:	f0c0 81a1 	bcc.w	4ec <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x4ec>
 1aa:	e7ff      	b.n	1ac <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x1ac>
 1ac:	981d      	ldr	r0, [sp, #116]	; 0x74
 1ae:	283e      	cmp	r0, #62	; 0x3e
 1b0:	f200 81a3 	bhi.w	4fa <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x4fa>
 1b4:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 1b6:	f240 0000 	movw	r0, #0
 1ba:	f2c0 0000 	movt	r0, #0
 1be:	991d      	ldr	r1, [sp, #116]	; 0x74
 1c0:	5c40      	ldrb	r0, [r0, r1]
 1c2:	f8ad 018c 	strh.w	r0, [sp, #396]	; 0x18c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:126
        data.touches[i].x  = (x_high << 8) | x_low;
 1c6:	f8bd 018a 	ldrh.w	r0, [sp, #394]	; 0x18a
 1ca:	0200      	lsls	r0, r0, #8
 1cc:	901c      	str	r0, [sp, #112]	; 0x70
 1ce:	e7ff      	b.n	1d0 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x1d0>
 1d0:	f8bd 018c 	ldrh.w	r0, [sp, #396]	; 0x18c
 1d4:	9961      	ldr	r1, [sp, #388]	; 0x184
 1d6:	2909      	cmp	r1, #9
 1d8:	901b      	str	r0, [sp, #108]	; 0x6c
 1da:	911a      	str	r1, [sp, #104]	; 0x68
 1dc:	f200 8196 	bhi.w	50c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x50c>
 1e0:	e7ff      	b.n	1e2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x1e2>
 1e2:	982e      	ldr	r0, [sp, #184]	; 0xb8
 1e4:	991c      	ldr	r1, [sp, #112]	; 0x70
 1e6:	9a1b      	ldr	r2, [sp, #108]	; 0x6c
 1e8:	ea41 0302 	orr.w	r3, r1, r2
 1ec:	f8dd c068 	ldr.w	ip, [sp, #104]	; 0x68
 1f0:	f820 303c 	strh.w	r3, [r0, ip, lsl #3]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:128
        let y_high = unsafe { buf[HYN_TOUCH_Y_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 1f4:	9861      	ldr	r0, [sp, #388]	; 0x184
 1f6:	2306      	movs	r3, #6
 1f8:	fba3 0300 	umull	r0, r3, r3, r0
 1fc:	2b00      	cmp	r3, #0
 1fe:	9019      	str	r0, [sp, #100]	; 0x64
 200:	f040 818d 	bne.w	51e <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x51e>
 204:	e7ff      	b.n	206 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x206>
 206:	9819      	ldr	r0, [sp, #100]	; 0x64
 208:	1d41      	adds	r1, r0, #5
 20a:	460a      	mov	r2, r1
 20c:	4281      	cmp	r1, r0
 20e:	9218      	str	r2, [sp, #96]	; 0x60
 210:	f0c0 818c 	bcc.w	52c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x52c>
 214:	e7ff      	b.n	216 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x216>
 216:	9818      	ldr	r0, [sp, #96]	; 0x60
 218:	283e      	cmp	r0, #62	; 0x3e
 21a:	f200 818e 	bhi.w	53a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x53a>
 21e:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 220:	f240 0000 	movw	r0, #0
 224:	f2c0 0000 	movt	r0, #0
 228:	9918      	ldr	r1, [sp, #96]	; 0x60
 22a:	5c40      	ldrb	r0, [r0, r1]
 22c:	f000 000f 	and.w	r0, r0, #15
 230:	f8ad 018e 	strh.w	r0, [sp, #398]	; 0x18e
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:129
        let y_low  = unsafe { buf[HYN_TOUCH_Y_L_POS + HYN_TOUCH_STEP * i] } as u16;
 234:	9861      	ldr	r0, [sp, #388]	; 0x184
 236:	2206      	movs	r2, #6
 238:	fba2 0200 	umull	r0, r2, r2, r0
 23c:	2a00      	cmp	r2, #0
 23e:	9017      	str	r0, [sp, #92]	; 0x5c
 240:	f040 8184 	bne.w	54c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x54c>
 244:	e7ff      	b.n	246 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x246>
 246:	9817      	ldr	r0, [sp, #92]	; 0x5c
 248:	1d81      	adds	r1, r0, #6
 24a:	460a      	mov	r2, r1
 24c:	4281      	cmp	r1, r0
 24e:	9216      	str	r2, [sp, #88]	; 0x58
 250:	f0c0 8183 	bcc.w	55a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x55a>
 254:	e7ff      	b.n	256 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x256>
 256:	9816      	ldr	r0, [sp, #88]	; 0x58
 258:	283e      	cmp	r0, #62	; 0x3e
 25a:	f200 8185 	bhi.w	568 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x568>
 25e:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 260:	f240 0000 	movw	r0, #0
 264:	f2c0 0000 	movt	r0, #0
 268:	9916      	ldr	r1, [sp, #88]	; 0x58
 26a:	5c40      	ldrb	r0, [r0, r1]
 26c:	f8ad 0190 	strh.w	r0, [sp, #400]	; 0x190
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:130
        data.touches[i].y  = (y_high << 8) | y_low;
 270:	f8bd 018e 	ldrh.w	r0, [sp, #398]	; 0x18e
 274:	0200      	lsls	r0, r0, #8
 276:	9015      	str	r0, [sp, #84]	; 0x54
 278:	e7ff      	b.n	27a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x27a>
 27a:	f8bd 0190 	ldrh.w	r0, [sp, #400]	; 0x190
 27e:	9961      	ldr	r1, [sp, #388]	; 0x184
 280:	2909      	cmp	r1, #9
 282:	9014      	str	r0, [sp, #80]	; 0x50
 284:	9113      	str	r1, [sp, #76]	; 0x4c
 286:	f200 8178 	bhi.w	57a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x57a>
 28a:	e7ff      	b.n	28c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x28c>
 28c:	982e      	ldr	r0, [sp, #184]	; 0xb8
 28e:	9913      	ldr	r1, [sp, #76]	; 0x4c
 290:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 294:	9a15      	ldr	r2, [sp, #84]	; 0x54
 296:	9b14      	ldr	r3, [sp, #80]	; 0x50
 298:	ea42 0c03 	orr.w	ip, r2, r3
 29c:	f8a0 c002 	strh.w	ip, [r0, #2]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:134
            unsafe { buf[HYN_TOUCH_EVENT_POS + HYN_TOUCH_STEP * i] } >> 6;
 2a0:	9861      	ldr	r0, [sp, #388]	; 0x184
 2a2:	f04f 0c06 	mov.w	ip, #6
 2a6:	fbac 0c00 	umull	r0, ip, ip, r0
 2aa:	f1bc 0f00 	cmp.w	ip, #0
 2ae:	9012      	str	r0, [sp, #72]	; 0x48
 2b0:	f040 816c 	bne.w	58c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x58c>
 2b4:	e7ff      	b.n	2b6 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2b6>
 2b6:	9812      	ldr	r0, [sp, #72]	; 0x48
 2b8:	1cc1      	adds	r1, r0, #3
 2ba:	460a      	mov	r2, r1
 2bc:	4281      	cmp	r1, r0
 2be:	9211      	str	r2, [sp, #68]	; 0x44
 2c0:	f0c0 816b 	bcc.w	59a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x59a>
 2c4:	e7ff      	b.n	2c6 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2c6>
 2c6:	9811      	ldr	r0, [sp, #68]	; 0x44
 2c8:	283e      	cmp	r0, #62	; 0x3e
 2ca:	f200 816d 	bhi.w	5a8 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x5a8>
 2ce:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 2d0:	f240 0000 	movw	r0, #0
 2d4:	f2c0 0000 	movt	r0, #0
 2d8:	9911      	ldr	r1, [sp, #68]	; 0x44
 2da:	5c40      	ldrb	r0, [r0, r1]
 2dc:	0980      	lsrs	r0, r0, #6
 2de:	9010      	str	r0, [sp, #64]	; 0x40
 2e0:	e7ff      	b.n	2e2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2e2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:133
        data.touches[i].action =
 2e2:	9861      	ldr	r0, [sp, #388]	; 0x184
 2e4:	2809      	cmp	r0, #9
 2e6:	900f      	str	r0, [sp, #60]	; 0x3c
 2e8:	f200 8167 	bhi.w	5ba <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x5ba>
 2ec:	e7ff      	b.n	2ee <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2ee>
 2ee:	982e      	ldr	r0, [sp, #184]	; 0xb8
 2f0:	990f      	ldr	r1, [sp, #60]	; 0x3c
 2f2:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 2f6:	9a10      	ldr	r2, [sp, #64]	; 0x40
 2f8:	7102      	strb	r2, [r0, #4]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:136
            unsafe { buf[HYN_TOUCH_ID_POS    + HYN_TOUCH_STEP * i] } >> 4;
 2fa:	9861      	ldr	r0, [sp, #388]	; 0x184
 2fc:	2306      	movs	r3, #6
 2fe:	fba3 0300 	umull	r0, r3, r3, r0
 302:	2b00      	cmp	r3, #0
 304:	900e      	str	r0, [sp, #56]	; 0x38
 306:	f040 8161 	bne.w	5cc <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x5cc>
 30a:	e7ff      	b.n	30c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x30c>
 30c:	980e      	ldr	r0, [sp, #56]	; 0x38
 30e:	1d41      	adds	r1, r0, #5
 310:	460a      	mov	r2, r1
 312:	4281      	cmp	r1, r0
 314:	920d      	str	r2, [sp, #52]	; 0x34
 316:	f0c0 8160 	bcc.w	5da <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x5da>
 31a:	e7ff      	b.n	31c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x31c>
 31c:	980d      	ldr	r0, [sp, #52]	; 0x34
 31e:	283e      	cmp	r0, #62	; 0x3e
 320:	f200 8162 	bhi.w	5e8 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x5e8>
 324:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 326:	f240 0000 	movw	r0, #0
 32a:	f2c0 0000 	movt	r0, #0
 32e:	990d      	ldr	r1, [sp, #52]	; 0x34
 330:	5c40      	ldrb	r0, [r0, r1]
 332:	0900      	lsrs	r0, r0, #4
 334:	900c      	str	r0, [sp, #48]	; 0x30
 336:	e7ff      	b.n	338 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x338>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:135
        data.touches[i].finger =
 338:	9861      	ldr	r0, [sp, #388]	; 0x184
 33a:	2809      	cmp	r0, #9
 33c:	900b      	str	r0, [sp, #44]	; 0x2c
 33e:	f200 815c 	bhi.w	5fa <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x5fa>
 342:	e7ff      	b.n	344 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x344>
 344:	982e      	ldr	r0, [sp, #184]	; 0xb8
 346:	990b      	ldr	r1, [sp, #44]	; 0x2c
 348:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 34c:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 34e:	7142      	strb	r2, [r0, #5]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:140
            unsafe { buf[HYN_TOUCH_XY_POS + HYN_TOUCH_STEP * i] };  //  Can't be constant value
 350:	9861      	ldr	r0, [sp, #388]	; 0x184
 352:	2306      	movs	r3, #6
 354:	fba3 0300 	umull	r0, r3, r3, r0
 358:	2b00      	cmp	r3, #0
 35a:	900a      	str	r0, [sp, #40]	; 0x28
 35c:	f040 8156 	bne.w	60c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x60c>
 360:	e7ff      	b.n	362 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x362>
 362:	980a      	ldr	r0, [sp, #40]	; 0x28
 364:	1dc1      	adds	r1, r0, #7
 366:	460a      	mov	r2, r1
 368:	4281      	cmp	r1, r0
 36a:	9209      	str	r2, [sp, #36]	; 0x24
 36c:	f0c0 8155 	bcc.w	61a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x61a>
 370:	e7ff      	b.n	372 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x372>
 372:	9809      	ldr	r0, [sp, #36]	; 0x24
 374:	283e      	cmp	r0, #62	; 0x3e
 376:	f200 8157 	bhi.w	628 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x628>
 37a:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 37c:	f240 0000 	movw	r0, #0
 380:	f2c0 0000 	movt	r0, #0
 384:	9909      	ldr	r1, [sp, #36]	; 0x24
 386:	5c40      	ldrb	r0, [r0, r1]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:139
        data.touches[i].pressure =
 388:	9a61      	ldr	r2, [sp, #388]	; 0x184
 38a:	2a09      	cmp	r2, #9
 38c:	9008      	str	r0, [sp, #32]
 38e:	9207      	str	r2, [sp, #28]
 390:	f200 8153 	bhi.w	63a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x63a>
 394:	e7ff      	b.n	396 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x396>
 396:	982e      	ldr	r0, [sp, #184]	; 0xb8
 398:	9907      	ldr	r1, [sp, #28]
 39a:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 39e:	9a08      	ldr	r2, [sp, #32]
 3a0:	7182      	strb	r2, [r0, #6]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:142
            unsafe { buf[HYN_TOUCH_MISC   + HYN_TOUCH_STEP * i] } >> 4;
 3a2:	9861      	ldr	r0, [sp, #388]	; 0x184
 3a4:	2306      	movs	r3, #6
 3a6:	fba3 0300 	umull	r0, r3, r3, r0
 3aa:	2b00      	cmp	r3, #0
 3ac:	9006      	str	r0, [sp, #24]
 3ae:	f040 814d 	bne.w	64c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x64c>
 3b2:	e7ff      	b.n	3b4 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x3b4>
 3b4:	9806      	ldr	r0, [sp, #24]
 3b6:	f100 0108 	add.w	r1, r0, #8
 3ba:	460a      	mov	r2, r1
 3bc:	4281      	cmp	r1, r0
 3be:	9205      	str	r2, [sp, #20]
 3c0:	f0c0 814b 	bcc.w	65a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x65a>
 3c4:	e7ff      	b.n	3c6 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x3c6>
 3c6:	9805      	ldr	r0, [sp, #20]
 3c8:	283e      	cmp	r0, #62	; 0x3e
 3ca:	f200 814d 	bhi.w	668 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x668>
 3ce:	e7ff      	b.n	2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x2>
 3d0:	f240 0000 	movw	r0, #0
 3d4:	f2c0 0000 	movt	r0, #0
 3d8:	9905      	ldr	r1, [sp, #20]
 3da:	5c40      	ldrb	r0, [r0, r1]
 3dc:	0900      	lsrs	r0, r0, #4
 3de:	9004      	str	r0, [sp, #16]
 3e0:	e7ff      	b.n	3e2 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x3e2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:141
        data.touches[i].area =
 3e2:	9861      	ldr	r0, [sp, #388]	; 0x184
 3e4:	2809      	cmp	r0, #9
 3e6:	9003      	str	r0, [sp, #12]
 3e8:	f200 8147 	bhi.w	67a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x67a>
 3ec:	e7ff      	b.n	3ee <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x3ee>
 3ee:	982e      	ldr	r0, [sp, #184]	; 0xb8
 3f0:	9903      	ldr	r1, [sp, #12]
 3f2:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 3f6:	9a04      	ldr	r2, [sp, #16]
 3f8:	71c2      	strb	r2, [r0, #7]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:145
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 3fa:	9861      	ldr	r0, [sp, #388]	; 0x184
 3fc:	280a      	cmp	r0, #10
 3fe:	9002      	str	r0, [sp, #8]
 400:	d322      	bcc.n	448 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x448>
 402:	e143      	b.n	68c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x68c>
 404:	2000      	movs	r0, #0
 406:	f88d 0192 	strb.w	r0, [sp, #402]	; 0x192
 40a:	e008      	b.n	41e <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x41e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:146
            && (data.point_num == 0) {
 40c:	982e      	ldr	r0, [sp, #184]	; 0xb8
 40e:	f890 0051 	ldrb.w	r0, [r0, #81]	; 0x51
 412:	fab0 f080 	clz	r0, r0
 416:	0940      	lsrs	r0, r0, #5
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:145
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 418:	f88d 0192 	strb.w	r0, [sp, #402]	; 0x192
 41c:	e7ff      	b.n	41e <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x41e>
 41e:	f89d 0192 	ldrb.w	r0, [sp, #402]	; 0x192
 422:	07c0      	lsls	r0, r0, #31
 424:	2800      	cmp	r0, #0
 426:	d123      	bne.n	470 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x470>
 428:	e023      	b.n	472 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x472>
 42a:	2001      	movs	r0, #1
 42c:	f88d 0193 	strb.w	r0, [sp, #403]	; 0x193
 430:	e004      	b.n	43c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x43c>
 432:	9861      	ldr	r0, [sp, #388]	; 0x184
 434:	280a      	cmp	r0, #10
 436:	9001      	str	r0, [sp, #4]
 438:	d30e      	bcc.n	458 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x458>
 43a:	e130      	b.n	69e <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x69e>
 43c:	f89d 0193 	ldrb.w	r0, [sp, #403]	; 0x193
 440:	07c0      	lsls	r0, r0, #31
 442:	2800      	cmp	r0, #0
 444:	d1e2      	bne.n	40c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x40c>
 446:	e7dd      	b.n	404 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x404>
 448:	982e      	ldr	r0, [sp, #184]	; 0xb8
 44a:	9902      	ldr	r1, [sp, #8]
 44c:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 450:	7900      	ldrb	r0, [r0, #4]
 452:	2800      	cmp	r0, #0
 454:	d0e9      	beq.n	42a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x42a>
 456:	e7ec      	b.n	432 <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x432>
 458:	982e      	ldr	r0, [sp, #184]	; 0xb8
 45a:	9901      	ldr	r1, [sp, #4]
 45c:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
 460:	7900      	ldrb	r0, [r0, #4]
 462:	3802      	subs	r0, #2
 464:	fab0 f080 	clz	r0, r0
 468:	0940      	lsrs	r0, r0, #5
 46a:	f88d 0193 	strb.w	r0, [sp, #403]	; 0x193
 46e:	e7e5      	b.n	43c <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x43c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:147
            break;
 470:	e65b      	b.n	12a <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x12a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:118
    for i in 0..CFG_MAX_TOUCH_POINTS {
 472:	e614      	b.n	9e <_ZN3app12touch_sensor14read_touchdata17h315ddd7f519790ecE+0x9e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:119
        let pointid = unsafe { buf[HYN_TOUCH_ID_POS + HYN_TOUCH_STEP * i] } >> 4;
 474:	f240 0000 	movw	r0, #0
 478:	f2c0 0000 	movt	r0, #0
 47c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 480:	defe      	udf	#254	; 0xfe
 482:	f240 0000 	movw	r0, #0
 486:	f2c0 0000 	movt	r0, #0
 48a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 48e:	defe      	udf	#254	; 0xfe
 490:	f240 0000 	movw	r0, #0
 494:	f2c0 0000 	movt	r0, #0
 498:	223f      	movs	r2, #63	; 0x3f
 49a:	9923      	ldr	r1, [sp, #140]	; 0x8c
 49c:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 4a0:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:123
        data.count += 1;
 4a2:	f240 0000 	movw	r0, #0
 4a6:	f2c0 0000 	movt	r0, #0
 4aa:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4ae:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:124
        let x_high = unsafe { buf[HYN_TOUCH_X_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 4b0:	f240 0000 	movw	r0, #0
 4b4:	f2c0 0000 	movt	r0, #0
 4b8:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4bc:	defe      	udf	#254	; 0xfe
 4be:	f240 0000 	movw	r0, #0
 4c2:	f2c0 0000 	movt	r0, #0
 4c6:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4ca:	defe      	udf	#254	; 0xfe
 4cc:	f240 0000 	movw	r0, #0
 4d0:	f2c0 0000 	movt	r0, #0
 4d4:	223f      	movs	r2, #63	; 0x3f
 4d6:	991f      	ldr	r1, [sp, #124]	; 0x7c
 4d8:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 4dc:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:125
        let x_low  = unsafe { buf[HYN_TOUCH_X_L_POS + HYN_TOUCH_STEP * i] } as u16;
 4de:	f240 0000 	movw	r0, #0
 4e2:	f2c0 0000 	movt	r0, #0
 4e6:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4ea:	defe      	udf	#254	; 0xfe
 4ec:	f240 0000 	movw	r0, #0
 4f0:	f2c0 0000 	movt	r0, #0
 4f4:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4f8:	defe      	udf	#254	; 0xfe
 4fa:	f240 0000 	movw	r0, #0
 4fe:	f2c0 0000 	movt	r0, #0
 502:	223f      	movs	r2, #63	; 0x3f
 504:	991d      	ldr	r1, [sp, #116]	; 0x74
 506:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 50a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:126
        data.touches[i].x  = (x_high << 8) | x_low;
 50c:	f240 0000 	movw	r0, #0
 510:	f2c0 0000 	movt	r0, #0
 514:	220a      	movs	r2, #10
 516:	991a      	ldr	r1, [sp, #104]	; 0x68
 518:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 51c:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:128
        let y_high = unsafe { buf[HYN_TOUCH_Y_H_POS + HYN_TOUCH_STEP * i] & 0x0F } as u16;
 51e:	f240 0000 	movw	r0, #0
 522:	f2c0 0000 	movt	r0, #0
 526:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 52a:	defe      	udf	#254	; 0xfe
 52c:	f240 0000 	movw	r0, #0
 530:	f2c0 0000 	movt	r0, #0
 534:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 538:	defe      	udf	#254	; 0xfe
 53a:	f240 0000 	movw	r0, #0
 53e:	f2c0 0000 	movt	r0, #0
 542:	223f      	movs	r2, #63	; 0x3f
 544:	9918      	ldr	r1, [sp, #96]	; 0x60
 546:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 54a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:129
        let y_low  = unsafe { buf[HYN_TOUCH_Y_L_POS + HYN_TOUCH_STEP * i] } as u16;
 54c:	f240 0000 	movw	r0, #0
 550:	f2c0 0000 	movt	r0, #0
 554:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 558:	defe      	udf	#254	; 0xfe
 55a:	f240 0000 	movw	r0, #0
 55e:	f2c0 0000 	movt	r0, #0
 562:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 566:	defe      	udf	#254	; 0xfe
 568:	f240 0000 	movw	r0, #0
 56c:	f2c0 0000 	movt	r0, #0
 570:	223f      	movs	r2, #63	; 0x3f
 572:	9916      	ldr	r1, [sp, #88]	; 0x58
 574:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 578:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:130
        data.touches[i].y  = (y_high << 8) | y_low;
 57a:	f240 0000 	movw	r0, #0
 57e:	f2c0 0000 	movt	r0, #0
 582:	220a      	movs	r2, #10
 584:	9913      	ldr	r1, [sp, #76]	; 0x4c
 586:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 58a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:134
            unsafe { buf[HYN_TOUCH_EVENT_POS + HYN_TOUCH_STEP * i] } >> 6;
 58c:	f240 0000 	movw	r0, #0
 590:	f2c0 0000 	movt	r0, #0
 594:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 598:	defe      	udf	#254	; 0xfe
 59a:	f240 0000 	movw	r0, #0
 59e:	f2c0 0000 	movt	r0, #0
 5a2:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 5a6:	defe      	udf	#254	; 0xfe
 5a8:	f240 0000 	movw	r0, #0
 5ac:	f2c0 0000 	movt	r0, #0
 5b0:	223f      	movs	r2, #63	; 0x3f
 5b2:	9911      	ldr	r1, [sp, #68]	; 0x44
 5b4:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 5b8:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:133
        data.touches[i].action =
 5ba:	f240 0000 	movw	r0, #0
 5be:	f2c0 0000 	movt	r0, #0
 5c2:	220a      	movs	r2, #10
 5c4:	990f      	ldr	r1, [sp, #60]	; 0x3c
 5c6:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 5ca:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:136
            unsafe { buf[HYN_TOUCH_ID_POS    + HYN_TOUCH_STEP * i] } >> 4;
 5cc:	f240 0000 	movw	r0, #0
 5d0:	f2c0 0000 	movt	r0, #0
 5d4:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 5d8:	defe      	udf	#254	; 0xfe
 5da:	f240 0000 	movw	r0, #0
 5de:	f2c0 0000 	movt	r0, #0
 5e2:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 5e6:	defe      	udf	#254	; 0xfe
 5e8:	f240 0000 	movw	r0, #0
 5ec:	f2c0 0000 	movt	r0, #0
 5f0:	223f      	movs	r2, #63	; 0x3f
 5f2:	990d      	ldr	r1, [sp, #52]	; 0x34
 5f4:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 5f8:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:135
        data.touches[i].finger =
 5fa:	f240 0000 	movw	r0, #0
 5fe:	f2c0 0000 	movt	r0, #0
 602:	220a      	movs	r2, #10
 604:	990b      	ldr	r1, [sp, #44]	; 0x2c
 606:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 60a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:140
            unsafe { buf[HYN_TOUCH_XY_POS + HYN_TOUCH_STEP * i] };  //  Can't be constant value
 60c:	f240 0000 	movw	r0, #0
 610:	f2c0 0000 	movt	r0, #0
 614:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 618:	defe      	udf	#254	; 0xfe
 61a:	f240 0000 	movw	r0, #0
 61e:	f2c0 0000 	movt	r0, #0
 622:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 626:	defe      	udf	#254	; 0xfe
 628:	f240 0000 	movw	r0, #0
 62c:	f2c0 0000 	movt	r0, #0
 630:	223f      	movs	r2, #63	; 0x3f
 632:	9909      	ldr	r1, [sp, #36]	; 0x24
 634:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 638:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:139
        data.touches[i].pressure =
 63a:	f240 0000 	movw	r0, #0
 63e:	f2c0 0000 	movt	r0, #0
 642:	220a      	movs	r2, #10
 644:	9907      	ldr	r1, [sp, #28]
 646:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 64a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:142
            unsafe { buf[HYN_TOUCH_MISC   + HYN_TOUCH_STEP * i] } >> 4;
 64c:	f240 0000 	movw	r0, #0
 650:	f2c0 0000 	movt	r0, #0
 654:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 658:	defe      	udf	#254	; 0xfe
 65a:	f240 0000 	movw	r0, #0
 65e:	f2c0 0000 	movt	r0, #0
 662:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 666:	defe      	udf	#254	; 0xfe
 668:	f240 0000 	movw	r0, #0
 66c:	f2c0 0000 	movt	r0, #0
 670:	223f      	movs	r2, #63	; 0x3f
 672:	9905      	ldr	r1, [sp, #20]
 674:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 678:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:141
        data.touches[i].area =
 67a:	f240 0000 	movw	r0, #0
 67e:	f2c0 0000 	movt	r0, #0
 682:	220a      	movs	r2, #10
 684:	9903      	ldr	r1, [sp, #12]
 686:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 68a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:145
        if (data.touches[i].action == 0 || data.touches[i].action == 2)  //  If touch is down or contact
 68c:	f240 0000 	movw	r0, #0
 690:	f2c0 0000 	movt	r0, #0
 694:	220a      	movs	r2, #10
 696:	9902      	ldr	r1, [sp, #8]
 698:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 69c:	defe      	udf	#254	; 0xfe
 69e:	f240 0000 	movw	r0, #0
 6a2:	f2c0 0000 	movt	r0, #0
 6a6:	220a      	movs	r2, #10
 6a8:	9901      	ldr	r1, [sp, #4]
 6aa:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 6ae:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE:

00000000 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE>:
_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:210

/// Event that will be forwarded to the Event Queue when a touch interrupt is triggered
static mut TOUCH_EVENT: os_event = fill_zero!(os_event);  //  Init all fields to 0 or NULL

/// Read a range of I2C registers from the I2C address `addr` (7-bit address), starting at `start_register` for count `num_registers`. Save into `buffer`.
fn read_register_range(addr: u8, start_register: u8, num_registers: u8, buffer: &mut[u8]) -> MynewtResult<()> {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b094      	sub	sp, #80	; 0x50
   4:	f8dd c060 	ldr.w	ip, [sp, #96]	; 0x60
   8:	469e      	mov	lr, r3
   a:	4614      	mov	r4, r2
   c:	460d      	mov	r5, r1
   e:	4606      	mov	r6, r0
  10:	f88d 0031 	strb.w	r0, [sp, #49]	; 0x31
  14:	f88d 1032 	strb.w	r1, [sp, #50]	; 0x32
  18:	f88d 2033 	strb.w	r2, [sp, #51]	; 0x33
  1c:	930d      	str	r3, [sp, #52]	; 0x34
  1e:	f8cd c038 	str.w	ip, [sp, #56]	; 0x38
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:211
    assert!(buffer.len() >= num_registers as usize, "i2c buf");  //  Buffer too small
  22:	980d      	ldr	r0, [sp, #52]	; 0x34
  24:	990e      	ldr	r1, [sp, #56]	; 0x38
  26:	f8cd e02c 	str.w	lr, [sp, #44]	; 0x2c
  2a:	940a      	str	r4, [sp, #40]	; 0x28
  2c:	9509      	str	r5, [sp, #36]	; 0x24
  2e:	9608      	str	r6, [sp, #32]
  30:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h70be3ebb33ef544dE>
  34:	9007      	str	r0, [sp, #28]
  36:	e7ff      	b.n	38 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x38>
  38:	f89d 0033 	ldrb.w	r0, [sp, #51]	; 0x33
  3c:	9907      	ldr	r1, [sp, #28]
  3e:	4281      	cmp	r1, r0
  40:	d207      	bcs.n	52 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x52>
  42:	e7ff      	b.n	44 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x44>
  44:	f240 0000 	movw	r0, #0
  48:	f2c0 0000 	movt	r0, #0
  4c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  50:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:212
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
  52:	f89d 0032 	ldrb.w	r0, [sp, #50]	; 0x32
  56:	f89d 1033 	ldrb.w	r1, [sp, #51]	; 0x33
  5a:	4408      	add	r0, r1
  5c:	b2c1      	uxtb	r1, r0
  5e:	4602      	mov	r2, r0
  60:	4281      	cmp	r1, r0
  62:	9206      	str	r2, [sp, #24]
  64:	f040 808a 	bne.w	17c <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x17c>
  68:	e7ff      	b.n	6a <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x6a>
  6a:	9806      	ldr	r0, [sp, #24]
  6c:	b241      	sxtb	r1, r0
  6e:	f1b1 3fff 	cmp.w	r1, #4294967295	; 0xffffffff
  72:	dc07      	bgt.n	84 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x84>
  74:	e7ff      	b.n	76 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x76>
  76:	f240 0000 	movw	r0, #0
  7a:	f2c0 0000 	movt	r0, #0
  7e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  82:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:221
    //    Send the Start Condition (High to Low SDA Transition)...
    //    Followed by I2C Address (7 bits)...
    //    Followed by Write Mode (1 bit, value 0)...
    //    Followed by starting Register Number (8 bits)
    unsafe { 
        I2C_BUFFER[0] = start_register;  //  I2C Packet buffer contains starting Register Number (1 byte)
  84:	f89d 0032 	ldrb.w	r0, [sp, #50]	; 0x32
  88:	9005      	str	r0, [sp, #20]
  8a:	e7ff      	b.n	8c <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x8c>
  8c:	f240 0000 	movw	r0, #0
  90:	f2c0 0000 	movt	r0, #0
  94:	9905      	ldr	r1, [sp, #20]
  96:	7001      	strb	r1, [r0, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:222
        I2C_DATA.address = addr;         //  I2C Packet address (7 bits)
  98:	f89d 2031 	ldrb.w	r2, [sp, #49]	; 0x31
  9c:	f240 0300 	movw	r3, #0
  a0:	f2c0 0300 	movt	r3, #0
  a4:	701a      	strb	r2, [r3, #0]
  a6:	2101      	movs	r1, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:223
        I2C_DATA.len = I2C_BUFFER.len() as u16;     //  I2C Packet data size is 1 byte
  a8:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h70be3ebb33ef544dE>
  ac:	9004      	str	r0, [sp, #16]
  ae:	e7ff      	b.n	b0 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0xb0>
  b0:	f240 0000 	movw	r0, #0
  b4:	f2c0 0000 	movt	r0, #0
  b8:	9904      	ldr	r1, [sp, #16]
  ba:	8041      	strh	r1, [r0, #2]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:224
        I2C_DATA.buffer = I2C_BUFFER.as_mut_ptr();  //  I2C Packet data points to packet buffer
  bc:	f240 0000 	movw	r0, #0
  c0:	f2c0 0000 	movt	r0, #0
  c4:	2101      	movs	r1, #1
  c6:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17ha3acb9c0604817feE>
  ca:	9003      	str	r0, [sp, #12]
  cc:	e7ff      	b.n	ce <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0xce>
  ce:	f240 0000 	movw	r0, #0
  d2:	f2c0 0000 	movt	r0, #0
  d6:	9903      	ldr	r1, [sp, #12]
  d8:	6041      	str	r1, [r0, #4]
  da:	2201      	movs	r2, #1
  dc:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
  e0:	f04f 0c00 	mov.w	ip, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:226
    };
    let _rc1 = unsafe { hal::hal_i2c_master_write(1, &mut I2C_DATA, 1000, 0) };  //  No stop yet, must continue even if we hit an error
  e4:	9002      	str	r0, [sp, #8]
  e6:	4610      	mov	r0, r2
  e8:	9902      	ldr	r1, [sp, #8]
  ea:	461a      	mov	r2, r3
  ec:	4663      	mov	r3, ip
  ee:	f7ff fffe 	bl	0 <hal_i2c_master_write>
  f2:	9010      	str	r0, [sp, #64]	; 0x40
  f4:	e7ff      	b.n	f6 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0xf6>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:232
    //  Step 3: Prepare to receive the stream of I2C Device Register values...
    //    Send the Start Condition (High to Low SDA Transition)...
    //    Followed by I2C Address (7 bits)...
    //    Followed by Read Mode (1 bit, value 1)
    unsafe { 
        I2C_BUFFER[0] = 0x00;     //  I2C Packet buffer should be empty (provided by caller)
  f6:	e7ff      	b.n	f8 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0xf8>
  f8:	f240 0000 	movw	r0, #0
  fc:	f2c0 0000 	movt	r0, #0
 100:	2100      	movs	r1, #0
 102:	7001      	strb	r1, [r0, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:233
        I2C_DATA.address = addr;  //  I2C Packet address (7 bits)
 104:	f89d 0031 	ldrb.w	r0, [sp, #49]	; 0x31
 108:	f240 0100 	movw	r1, #0
 10c:	f2c0 0100 	movt	r1, #0
 110:	7008      	strb	r0, [r1, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:234
        I2C_DATA.len = num_registers as u16;    //  I2C Packet data size is number of Registers to read
 112:	f89d 0033 	ldrb.w	r0, [sp, #51]	; 0x33
 116:	8048      	strh	r0, [r1, #2]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:235
        I2C_DATA.buffer = buffer.as_mut_ptr();  //  I2C Packet data points to packet buffer
 118:	980d      	ldr	r0, [sp, #52]	; 0x34
 11a:	990e      	ldr	r1, [sp, #56]	; 0x38
 11c:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$10as_mut_ptr17ha3acb9c0604817feE>
 120:	9001      	str	r0, [sp, #4]
 122:	e7ff      	b.n	124 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x124>
 124:	f240 0000 	movw	r0, #0
 128:	f2c0 0000 	movt	r0, #0
 12c:	9901      	ldr	r1, [sp, #4]
 12e:	6041      	str	r1, [r0, #4]
 130:	f44f 727a 	mov.w	r2, #1000	; 0x3e8
 134:	2301      	movs	r3, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:239
    };
    //  Step 4: Receive the requested number of Register values from I2C Device (1 byte per register)
    //  Step 5: Send the Stop Condition (Low to High SDA Transition)
    let rc2 = unsafe { hal::hal_i2c_master_read(1, &mut I2C_DATA, 1000, 1) };
 136:	9000      	str	r0, [sp, #0]
 138:	4618      	mov	r0, r3
 13a:	9900      	ldr	r1, [sp, #0]
 13c:	f7ff fffe 	bl	0 <hal_i2c_master_read>
 140:	9011      	str	r0, [sp, #68]	; 0x44
 142:	e7ff      	b.n	144 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x144>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:240
    if rc2 == hal::HAL_I2C_ERR_ADDR_NACK as i32 {
 144:	9811      	ldr	r0, [sp, #68]	; 0x44
 146:	2804      	cmp	r0, #4
 148:	d113      	bne.n	172 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x172>
 14a:	e7ff      	b.n	14c <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x14c>
 14c:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:241
        assert!(false, "i2c fail");  //  I2C read failed
 14e:	2800      	cmp	r0, #0
 150:	d107      	bne.n	162 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x162>
 152:	e7ff      	b.n	154 <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x154>
 154:	f240 0000 	movw	r0, #0
 158:	f2c0 0000 	movt	r0, #0
 15c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 160:	defe      	udf	#254	; 0xfe
 162:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:242
        return Ok(());               //  TODO: Return an error
 164:	900f      	str	r0, [sp, #60]	; 0x3c
 166:	2001      	movs	r0, #1
 168:	900f      	str	r0, [sp, #60]	; 0x3c
 16a:	e7ff      	b.n	16c <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x16c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:245
    }
    Ok(())
}
 16c:	980f      	ldr	r0, [sp, #60]	; 0x3c
 16e:	b014      	add	sp, #80	; 0x50
 170:	bd70      	pop	{r4, r5, r6, pc}
 172:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:244
    Ok(())
 174:	900f      	str	r0, [sp, #60]	; 0x3c
 176:	2001      	movs	r0, #1
 178:	900f      	str	r0, [sp, #60]	; 0x3c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:245
}
 17a:	e7f7      	b.n	16c <_ZN3app12touch_sensor19read_register_range17h1428a2a978873aedE+0x16c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/touch_sensor.rs:212
    assert!(start_register + num_registers < 128, "i2c addr");   //  Not 7-bit address
 17c:	f240 0000 	movw	r0, #0
 180:	f2c0 0000 	movt	r0, #0
 184:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 188:	defe      	udf	#254	; 0xfe

app-9b7b12e8d5cbce98.3t2x0g5nmu6tdzr8.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3t2x0g5nmu6tdzr8
000006c4 l       .debug_str	00000000 
0000016c l       .debug_str	00000000 
00000179 l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
0000018b l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001f8 l       .debug_str	00000000 
00000291 l       .debug_str	00000000 
000002ca l       .debug_str	00000000 
000002cc l       .debug_str	00000000 
000002ce l       .debug_str	00000000 
0000030c l       .debug_str	00000000 
000003a3 l       .debug_str	00000000 
000003d7 l       .debug_str	00000000 
00000474 l       .debug_str	00000000 
0000050d l       .debug_str	00000000 
00000541 l       .debug_str	00000000 
0000054a l       .debug_str	00000000 
00000558 l       .debug_str	00000000 
00000570 l       .debug_str	00000000 
0000057e l       .debug_str	00000000 
000005b3 l       .debug_str	00000000 
0000060d l       .debug_str	00000000 
000006ff l       .debug_str	00000000 
00000752 l       .debug_str	00000000 
00000785 l       .debug_str	00000000 
0000078a l       .debug_str	00000000 
00000790 l       .debug_str	00000000 
000007ee l       .debug_str	00000000 
00000858 l       .debug_str	00000000 
0000085b l       .debug_str	00000000 
0000085e l       .debug_str	00000000 
0000086b l       .debug_str	00000000 
00000875 l       .debug_str	00000000 
00000885 l       .debug_str	00000000 
0000088a l       .debug_str	00000000 
0000088e l       .debug_str	00000000 
000008c8 l       .debug_str	00000000 
0000090a l       .debug_str	00000000 
0000090d l       .debug_str	00000000 
00000910 l       .debug_str	00000000 
00000914 l       .debug_str	00000000 
0000091e l       .debug_str	00000000 
00000923 l       .debug_str	00000000 
0000092b l       .debug_str	00000000 
0000092d l       .debug_str	00000000 
00000935 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
000000b7 l       .debug_str	00000000 
000000be l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000d3 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000df l       .debug_str	00000000 
000000e5 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000106 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
00000121 l       .debug_str	00000000 
00000128 l       .debug_str	00000000 
0000012f l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.0	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.0
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.1	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.1
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.10	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.10
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.11	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.11
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.12	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.12
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.13	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.13
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.14	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.14
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.15	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.15
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.16	00000016 .Lanon.1d0295b317c38934ce5072454de248f2.16
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.17	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.17
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.18	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.18
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.19	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.19
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.2	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.2
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.3	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.3
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.4	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.4
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.5	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.5
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.6	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.6
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.7	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.7
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.8	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.8
00000000 l     O .rodata..Lanon.1d0295b317c38934ce5072454de248f2.9	00000018 .Lanon.1d0295b317c38934ce5072454de248f2.9
00000000 l     O .rodata.str.0	0000006d str.0
00000000 l     O .rodata.str.1	0000001f str.1
00000000 l     O .rodata.str.2	00000021 str.2
00000000 l     O .rodata.str.3	0000001c str.3
00000000 l     O .rodata.str.4	00000021 str.4
00000000 l    d  .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E	00000000 .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E
00000000 l    d  .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E	00000000 .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E
00000000 l    d  .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E	00000000 .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E
00000000 l    d  .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE	00000000 .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE
00000000 l    d  .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE	00000000 .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE
00000000 l    d  .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE	00000000 .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE
00000000 l    d  .rodata.str.0	00000000 .rodata.str.0
00000000 l    d  .rodata.str.1	00000000 .rodata.str.1
00000000 l    d  .rodata.str.2	00000000 .rodata.str.2
00000000 l    d  .rodata.str.3	00000000 .rodata.str.3
00000000 l    d  .rodata.str.4	00000000 .rodata.str.4
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E
00000000         *UND*	00000000 _ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$embedded_graphics..coord..ToUnsigned$GT$11to_unsigned17h37ece76dbcf44ae9E
00000000 g     F .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E	00000016 _ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E
00000000 g     F .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E	0000003c _ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E
00000000 g     F .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E	000000a0 _ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E
00000000 g     F .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE	00000492 _ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE
00000000 g     F .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE	0000004c _ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE
00000000 g     F .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE	0000005c _ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE
00000000         *UND*	00000000 _ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6expect17h11f523cfa739cd28E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$7is_none17h56d587a776011ee7E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$7is_some17h6e54c9c146c3d215E
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 _ZN83_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..default..Default$GT$7default17hfde0c1ef0e1e8160E



Disassembly of section .text._ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E:

00000000 <_ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E>:
_ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:128
    C: PixelColor,
{
    type Item = Pixel<C>;
    type IntoIter = CircleIterator<C>;

    fn into_iter(self) -> Self::IntoIter {
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:129
        (&self).into_iter()
   8:	9201      	str	r2, [sp, #4]
   a:	9300      	str	r3, [sp, #0]
   c:	f7ff fffe 	bl	0 <_ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E>
  10:	e7ff      	b.n	12 <_ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E+0x12>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:130
    }
  12:	b002      	add	sp, #8
  14:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E:

00000000 <_ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E>:
_ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:114
    fn fill(mut self, color: Option<C>) -> Self {
   0:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
   4:	b085      	sub	sp, #20
   6:	469c      	mov	ip, r3
   8:	4696      	mov	lr, r2
   a:	460c      	mov	r4, r1
   c:	4605      	mov	r5, r0
   e:	f8ad 2010 	strh.w	r2, [sp, #16]
  12:	f8ad 3012 	strh.w	r3, [sp, #18]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:115
        self.style.fill_color = color;
  16:	f8bd 2010 	ldrh.w	r2, [sp, #16]
  1a:	f8bd 3012 	ldrh.w	r3, [sp, #18]
  1e:	818a      	strh	r2, [r1, #12]
  20:	81cb      	strh	r3, [r1, #14]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:117
        self
  22:	e891 03cc 	ldmia.w	r1, {r2, r3, r6, r7, r8, r9}
  26:	e880 03cc 	stmia.w	r0, {r2, r3, r6, r7, r8, r9}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:118
    }
  2a:	f8cd c00c 	str.w	ip, [sp, #12]
  2e:	f8cd e008 	str.w	lr, [sp, #8]
  32:	9401      	str	r4, [sp, #4]
  34:	9500      	str	r5, [sp, #0]
  36:	b005      	add	sp, #20
  38:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}

Disassembly of section .text._ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E:

00000000 <_ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E>:
_ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:140
    C: PixelColor,
{
    type Item = Pixel<C>;
    type IntoIter = CircleIterator<C>;

    fn into_iter(self) -> Self::IntoIter {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	460a      	mov	r2, r1
   6:	9108      	str	r1, [sp, #32]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:142
        CircleIterator {
            center: self.center,
   8:	9908      	ldr	r1, [sp, #32]
   a:	680b      	ldr	r3, [r1, #0]
   c:	f8d1 c004 	ldr.w	ip, [r1, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:143
            radius: self.radius,
  10:	f8d1 e008 	ldr.w	lr, [r1, #8]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:144
            style: self.style,
  14:	8a8c      	ldrh	r4, [r1, #20]
  16:	f8ad 402c 	strh.w	r4, [sp, #44]	; 0x2c
  1a:	68cc      	ldr	r4, [r1, #12]
  1c:	6909      	ldr	r1, [r1, #16]
  1e:	910a      	str	r1, [sp, #40]	; 0x28
  20:	9409      	str	r4, [sp, #36]	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:145
            x: -(self.radius as i32),
  22:	9908      	ldr	r1, [sp, #32]
  24:	6889      	ldr	r1, [r1, #8]
  26:	f1b1 4f00 	cmp.w	r1, #2147483648	; 0x80000000
  2a:	9207      	str	r2, [sp, #28]
  2c:	9006      	str	r0, [sp, #24]
  2e:	9305      	str	r3, [sp, #20]
  30:	f8cd c010 	str.w	ip, [sp, #16]
  34:	f8cd e00c 	str.w	lr, [sp, #12]
  38:	9102      	str	r1, [sp, #8]
  3a:	d023      	beq.n	84 <_ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E+0x84>
  3c:	e7ff      	b.n	3e <_ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E+0x3e>
  3e:	9802      	ldr	r0, [sp, #8]
  40:	4241      	negs	r1, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:146
            y: -(self.radius as i32),
  42:	9a08      	ldr	r2, [sp, #32]
  44:	6892      	ldr	r2, [r2, #8]
  46:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
  4a:	9101      	str	r1, [sp, #4]
  4c:	9200      	str	r2, [sp, #0]
  4e:	d020      	beq.n	92 <_ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E+0x92>
  50:	e7ff      	b.n	52 <_ZN120_$LT$$RF$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hde8ba020b79464b8E+0x52>
  52:	9800      	ldr	r0, [sp, #0]
  54:	4241      	negs	r1, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:141
        CircleIterator {
  56:	9a05      	ldr	r2, [sp, #20]
  58:	9b06      	ldr	r3, [sp, #24]
  5a:	601a      	str	r2, [r3, #0]
  5c:	f8dd c010 	ldr.w	ip, [sp, #16]
  60:	f8c3 c004 	str.w	ip, [r3, #4]
  64:	f8dd e00c 	ldr.w	lr, [sp, #12]
  68:	f8c3 e008 	str.w	lr, [r3, #8]
  6c:	f8bd 402c 	ldrh.w	r4, [sp, #44]	; 0x2c
  70:	839c      	strh	r4, [r3, #28]
  72:	9c09      	ldr	r4, [sp, #36]	; 0x24
  74:	9d0a      	ldr	r5, [sp, #40]	; 0x28
  76:	619d      	str	r5, [r3, #24]
  78:	615c      	str	r4, [r3, #20]
  7a:	9c01      	ldr	r4, [sp, #4]
  7c:	60dc      	str	r4, [r3, #12]
  7e:	6119      	str	r1, [r3, #16]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:148
        }
    }
  80:	b00c      	add	sp, #48	; 0x30
  82:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:145
            x: -(self.radius as i32),
  84:	f240 0000 	movw	r0, #0
  88:	f2c0 0000 	movt	r0, #0
  8c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  90:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:146
            y: -(self.radius as i32),
  92:	f240 0000 	movw	r0, #0
  96:	f2c0 0000 	movt	r0, #0
  9a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  9e:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE:

00000000 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE>:
_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:168
    C: PixelColor,
{
    type Item = Pixel<C>;

    // https://stackoverflow.com/questions/1201200/fast-algorithm-for-drawing-filled-circles
    fn next(&mut self) -> Option<Self::Item> {
   0:	b580      	push	{r7, lr}
   2:	b0c2      	sub	sp, #264	; 0x108
   4:	460a      	mov	r2, r1
   6:	911d      	str	r1, [sp, #116]	; 0x74
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:170
        // If border or stroke colour is `None`, treat entire object as transparent and exit early
        if self.style.stroke_color.is_none() && self.style.fill_color.is_none() {
   8:	991d      	ldr	r1, [sp, #116]	; 0x74
   a:	3118      	adds	r1, #24
   c:	901c      	str	r0, [sp, #112]	; 0x70
   e:	4608      	mov	r0, r1
  10:	921b      	str	r2, [sp, #108]	; 0x6c
  12:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$7is_none17h56d587a776011ee7E>
  16:	901a      	str	r0, [sp, #104]	; 0x68
  18:	e00f      	b.n	3a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3a>
  1a:	2000      	movs	r0, #0
  1c:	f88d 007b 	strb.w	r0, [sp, #123]	; 0x7b
  20:	e005      	b.n	2e <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2e>
  22:	981d      	ldr	r0, [sp, #116]	; 0x74
  24:	3014      	adds	r0, #20
  26:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$7is_none17h56d587a776011ee7E>
  2a:	9019      	str	r0, [sp, #100]	; 0x64
  2c:	e00a      	b.n	44 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x44>
  2e:	f89d 007b 	ldrb.w	r0, [sp, #123]	; 0x7b
  32:	07c0      	lsls	r0, r0, #31
  34:	2800      	cmp	r0, #0
  36:	d10b      	bne.n	50 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x50>
  38:	e010      	b.n	5c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x5c>
  3a:	981a      	ldr	r0, [sp, #104]	; 0x68
  3c:	07c1      	lsls	r1, r0, #31
  3e:	2900      	cmp	r1, #0
  40:	d1ef      	bne.n	22 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x22>
  42:	e7ea      	b.n	1a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1a>
  44:	9819      	ldr	r0, [sp, #100]	; 0x64
  46:	f000 0101 	and.w	r1, r0, #1
  4a:	f88d 107b 	strb.w	r1, [sp, #123]	; 0x7b
  4e:	e7ee      	b.n	2e <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2e>
  50:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:171
            return None;
  52:	991c      	ldr	r1, [sp, #112]	; 0x70
  54:	6008      	str	r0, [r1, #0]
  56:	e7ff      	b.n	58 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x58>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:228
                }
            }
        };

        item.map(|(x, y, c)| Pixel(Coord::new(x, y).to_unsigned(), c))
    }
  58:	b042      	add	sp, #264	; 0x108
  5a:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:174
        let cx = self.center[0];
  5c:	981d      	ldr	r0, [sp, #116]	; 0x74
  5e:	2100      	movs	r1, #0
  60:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E>
  64:	9018      	str	r0, [sp, #96]	; 0x60
  66:	e7ff      	b.n	68 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x68>
  68:	9818      	ldr	r0, [sp, #96]	; 0x60
  6a:	6801      	ldr	r1, [r0, #0]
  6c:	911f      	str	r1, [sp, #124]	; 0x7c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:175
        let cy = self.center[1];
  6e:	981d      	ldr	r0, [sp, #116]	; 0x74
  70:	2101      	movs	r1, #1
  72:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E>
  76:	9017      	str	r0, [sp, #92]	; 0x5c
  78:	e7ff      	b.n	7a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x7a>
  7a:	9817      	ldr	r0, [sp, #92]	; 0x5c
  7c:	6801      	ldr	r1, [r0, #0]
  7e:	9120      	str	r1, [sp, #128]	; 0x80
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:177
        let radius = self.radius as i32 - self.style.stroke_width as i32 + 1;
  80:	991d      	ldr	r1, [sp, #116]	; 0x74
  82:	688a      	ldr	r2, [r1, #8]
  84:	7f09      	ldrb	r1, [r1, #28]
  86:	1a53      	subs	r3, r2, r1
  88:	428a      	cmp	r2, r1
  8a:	9316      	str	r3, [sp, #88]	; 0x58
  8c:	f180 8191 	bvs.w	3b2 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3b2>
  90:	e7ff      	b.n	92 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x92>
  92:	9816      	ldr	r0, [sp, #88]	; 0x58
  94:	1c41      	adds	r1, r0, #1
  96:	460a      	mov	r2, r1
  98:	4281      	cmp	r1, r0
  9a:	9215      	str	r2, [sp, #84]	; 0x54
  9c:	f180 8190 	bvs.w	3c0 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3c0>
  a0:	e7ff      	b.n	a2 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0xa2>
  a2:	9815      	ldr	r0, [sp, #84]	; 0x54
  a4:	9021      	str	r0, [sp, #132]	; 0x84
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:178
        let outer_radius = self.radius as i32;
  a6:	991d      	ldr	r1, [sp, #116]	; 0x74
  a8:	6889      	ldr	r1, [r1, #8]
  aa:	9122      	str	r1, [sp, #136]	; 0x88
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:180
        let radius_sq = radius * radius;
  ac:	9921      	ldr	r1, [sp, #132]	; 0x84
  ae:	fb01 f201 	mul.w	r2, r1, r1
  b2:	fb81 1301 	smull	r1, r3, r1, r1
  b6:	ebb3 7fe1 	cmp.w	r3, r1, asr #31
  ba:	9214      	str	r2, [sp, #80]	; 0x50
  bc:	f040 8187 	bne.w	3ce <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3ce>
  c0:	e7ff      	b.n	c2 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0xc2>
  c2:	9814      	ldr	r0, [sp, #80]	; 0x50
  c4:	9023      	str	r0, [sp, #140]	; 0x8c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:181
        let outer_radius_sq = outer_radius * outer_radius;
  c6:	9922      	ldr	r1, [sp, #136]	; 0x88
  c8:	fb01 f201 	mul.w	r2, r1, r1
  cc:	fb81 1301 	smull	r1, r3, r1, r1
  d0:	ebb3 7fe1 	cmp.w	r3, r1, asr #31
  d4:	9213      	str	r2, [sp, #76]	; 0x4c
  d6:	f040 8181 	bne.w	3dc <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3dc>
  da:	e7ff      	b.n	dc <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0xdc>
  dc:	9813      	ldr	r0, [sp, #76]	; 0x4c
  de:	9024      	str	r0, [sp, #144]	; 0x90
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:183
        let item = loop {
  e0:	e7ff      	b.n	e2 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0xe2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:184
            let tx = self.x;
  e2:	981d      	ldr	r0, [sp, #116]	; 0x74
  e4:	68c0      	ldr	r0, [r0, #12]
  e6:	9029      	str	r0, [sp, #164]	; 0xa4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:185
            let ty = self.y;
  e8:	981d      	ldr	r0, [sp, #116]	; 0x74
  ea:	6900      	ldr	r0, [r0, #16]
  ec:	902a      	str	r0, [sp, #168]	; 0xa8
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:186
            let len = tx * tx + ty * ty;
  ee:	9829      	ldr	r0, [sp, #164]	; 0xa4
  f0:	fb00 f100 	mul.w	r1, r0, r0
  f4:	fb80 0200 	smull	r0, r2, r0, r0
  f8:	ebb2 7fe0 	cmp.w	r2, r0, asr #31
  fc:	9112      	str	r1, [sp, #72]	; 0x48
  fe:	f040 8174 	bne.w	3ea <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3ea>
 102:	e7ff      	b.n	104 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x104>
 104:	982a      	ldr	r0, [sp, #168]	; 0xa8
 106:	fb00 f100 	mul.w	r1, r0, r0
 10a:	fb80 0200 	smull	r0, r2, r0, r0
 10e:	ebb2 7fe0 	cmp.w	r2, r0, asr #31
 112:	9111      	str	r1, [sp, #68]	; 0x44
 114:	f040 8170 	bne.w	3f8 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3f8>
 118:	e7ff      	b.n	11a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x11a>
 11a:	9812      	ldr	r0, [sp, #72]	; 0x48
 11c:	9911      	ldr	r1, [sp, #68]	; 0x44
 11e:	1842      	adds	r2, r0, r1
 120:	4613      	mov	r3, r2
 122:	4282      	cmp	r2, r0
 124:	9310      	str	r3, [sp, #64]	; 0x40
 126:	f180 816e 	bvs.w	406 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x406>
 12a:	e7ff      	b.n	12c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x12c>
 12c:	9810      	ldr	r0, [sp, #64]	; 0x40
 12e:	902b      	str	r0, [sp, #172]	; 0xac
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:188
            let is_border = len > radius_sq - radius && len < outer_radius_sq + radius;
 130:	992b      	ldr	r1, [sp, #172]	; 0xac
 132:	9a23      	ldr	r2, [sp, #140]	; 0x8c
 134:	9b21      	ldr	r3, [sp, #132]	; 0x84
 136:	eba2 0c03 	sub.w	ip, r2, r3
 13a:	429a      	cmp	r2, r3
 13c:	910f      	str	r1, [sp, #60]	; 0x3c
 13e:	f8cd c038 	str.w	ip, [sp, #56]	; 0x38
 142:	f180 8167 	bvs.w	414 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x414>
 146:	e01d      	b.n	184 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x184>
 148:	2000      	movs	r0, #0
 14a:	f88d 00b2 	strb.w	r0, [sp, #178]	; 0xb2
 14e:	e00a      	b.n	166 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x166>
 150:	982b      	ldr	r0, [sp, #172]	; 0xac
 152:	9924      	ldr	r1, [sp, #144]	; 0x90
 154:	9a21      	ldr	r2, [sp, #132]	; 0x84
 156:	440a      	add	r2, r1
 158:	4613      	mov	r3, r2
 15a:	428a      	cmp	r2, r1
 15c:	900d      	str	r0, [sp, #52]	; 0x34
 15e:	930c      	str	r3, [sp, #48]	; 0x30
 160:	f180 815f 	bvs.w	422 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x422>
 164:	e013      	b.n	18e <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x18e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:191
            let is_fill = len <= outer_radius_sq;
 166:	982b      	ldr	r0, [sp, #172]	; 0xac
 168:	9924      	ldr	r1, [sp, #144]	; 0x90
 16a:	2200      	movs	r2, #0
 16c:	4288      	cmp	r0, r1
 16e:	bfd8      	it	le
 170:	2201      	movle	r2, #1
 172:	f88d 20b3 	strb.w	r2, [sp, #179]	; 0xb3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 176:	f89d 00b2 	ldrb.w	r0, [sp, #178]	; 0xb2
 17a:	ea4f 70c0 	mov.w	r0, r0, lsl #31
 17e:	2800      	cmp	r0, #0
 180:	d112      	bne.n	1a8 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1a8>
 182:	e00d      	b.n	1a0 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:188
            let is_border = len > radius_sq - radius && len < outer_radius_sq + radius;
 184:	980f      	ldr	r0, [sp, #60]	; 0x3c
 186:	990e      	ldr	r1, [sp, #56]	; 0x38
 188:	4288      	cmp	r0, r1
 18a:	dce1      	bgt.n	150 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x150>
 18c:	e7dc      	b.n	148 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x148>
 18e:	2000      	movs	r0, #0
 190:	990d      	ldr	r1, [sp, #52]	; 0x34
 192:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 194:	4291      	cmp	r1, r2
 196:	bfb8      	it	lt
 198:	2001      	movlt	r0, #1
 19a:	f88d 00b2 	strb.w	r0, [sp, #178]	; 0xb2
 19e:	e7e2      	b.n	166 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x166>
 1a0:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 1a2:	f88d 00c7 	strb.w	r0, [sp, #199]	; 0xc7
 1a6:	e005      	b.n	1b4 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1b4>
 1a8:	981d      	ldr	r0, [sp, #116]	; 0x74
 1aa:	3018      	adds	r0, #24
 1ac:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$7is_some17h6e54c9c146c3d215E>
 1b0:	900b      	str	r0, [sp, #44]	; 0x2c
 1b2:	e005      	b.n	1c0 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1c0>
 1b4:	f89d 00c7 	ldrb.w	r0, [sp, #199]	; 0xc7
 1b8:	07c0      	lsls	r0, r0, #31
 1ba:	2800      	cmp	r0, #0
 1bc:	d106      	bne.n	1cc <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1cc>
 1be:	e037      	b.n	230 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x230>
 1c0:	980b      	ldr	r0, [sp, #44]	; 0x2c
 1c2:	f000 0101 	and.w	r1, r0, #1
 1c6:	f88d 10c7 	strb.w	r1, [sp, #199]	; 0xc7
 1ca:	e7f3      	b.n	1b4 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1b4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:195
                    cx + tx,
 1cc:	981f      	ldr	r0, [sp, #124]	; 0x7c
 1ce:	9929      	ldr	r1, [sp, #164]	; 0xa4
 1d0:	4401      	add	r1, r0
 1d2:	460a      	mov	r2, r1
 1d4:	4281      	cmp	r1, r0
 1d6:	920a      	str	r2, [sp, #40]	; 0x28
 1d8:	f180 812a 	bvs.w	430 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x430>
 1dc:	e7ff      	b.n	1de <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1de>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:196
                    cy + ty,
 1de:	9820      	ldr	r0, [sp, #128]	; 0x80
 1e0:	992a      	ldr	r1, [sp, #168]	; 0xa8
 1e2:	4401      	add	r1, r0
 1e4:	460a      	mov	r2, r1
 1e6:	4281      	cmp	r1, r0
 1e8:	9209      	str	r2, [sp, #36]	; 0x24
 1ea:	f180 8128 	bvs.w	43e <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x43e>
 1ee:	e7ff      	b.n	1f0 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x1f0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:197
                    self.style.stroke_color.expect("Border color not defined"),
 1f0:	981d      	ldr	r0, [sp, #116]	; 0x74
 1f2:	8b41      	ldrh	r1, [r0, #26]
 1f4:	8b00      	ldrh	r0, [r0, #24]
 1f6:	f240 0200 	movw	r2, #0
 1fa:	f2c0 0200 	movt	r2, #0
 1fe:	2318      	movs	r3, #24
 200:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6expect17h11f523cfa739cd28E>
 204:	9008      	str	r0, [sp, #32]
 206:	e7ff      	b.n	208 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x208>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:194
                Some((
 208:	980a      	ldr	r0, [sp, #40]	; 0x28
 20a:	9032      	str	r0, [sp, #200]	; 0xc8
 20c:	9909      	ldr	r1, [sp, #36]	; 0x24
 20e:	9133      	str	r1, [sp, #204]	; 0xcc
 210:	9a08      	ldr	r2, [sp, #32]
 212:	f8ad 20d0 	strh.w	r2, [sp, #208]	; 0xd0
 216:	9b32      	ldr	r3, [sp, #200]	; 0xc8
 218:	f8dd c0cc 	ldr.w	ip, [sp, #204]	; 0xcc
 21c:	f8dd e0d0 	ldr.w	lr, [sp, #208]	; 0xd0
 220:	f8cd e0c0 	str.w	lr, [sp, #192]	; 0xc0
 224:	f8cd c0bc 	str.w	ip, [sp, #188]	; 0xbc
 228:	932e      	str	r3, [sp, #184]	; 0xb8
 22a:	2301      	movs	r3, #1
 22c:	932d      	str	r3, [sp, #180]	; 0xb4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 22e:	e051      	b.n	2d4 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2d4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:199
            } else if is_fill && self.style.fill_color.is_some() {
 230:	f89d 00b3 	ldrb.w	r0, [sp, #179]	; 0xb3
 234:	07c0      	lsls	r0, r0, #31
 236:	2800      	cmp	r0, #0
 238:	d104      	bne.n	244 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x244>
 23a:	e7ff      	b.n	23c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x23c>
 23c:	2000      	movs	r0, #0
 23e:	f88d 00d7 	strb.w	r0, [sp, #215]	; 0xd7
 242:	e005      	b.n	250 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x250>
 244:	981d      	ldr	r0, [sp, #116]	; 0x74
 246:	3014      	adds	r0, #20
 248:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$7is_some17h6e54c9c146c3d215E>
 24c:	9007      	str	r0, [sp, #28]
 24e:	e005      	b.n	25c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x25c>
 250:	f89d 00d7 	ldrb.w	r0, [sp, #215]	; 0xd7
 254:	07c0      	lsls	r0, r0, #31
 256:	2800      	cmp	r0, #0
 258:	d106      	bne.n	268 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x268>
 25a:	e037      	b.n	2cc <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2cc>
 25c:	9807      	ldr	r0, [sp, #28]
 25e:	f000 0101 	and.w	r1, r0, #1
 262:	f88d 10d7 	strb.w	r1, [sp, #215]	; 0xd7
 266:	e7f3      	b.n	250 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x250>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:201
                    cx + tx,
 268:	981f      	ldr	r0, [sp, #124]	; 0x7c
 26a:	9929      	ldr	r1, [sp, #164]	; 0xa4
 26c:	4401      	add	r1, r0
 26e:	460a      	mov	r2, r1
 270:	4281      	cmp	r1, r0
 272:	9206      	str	r2, [sp, #24]
 274:	f180 80ea 	bvs.w	44c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x44c>
 278:	e7ff      	b.n	27a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x27a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:202
                    cy + ty,
 27a:	9820      	ldr	r0, [sp, #128]	; 0x80
 27c:	992a      	ldr	r1, [sp, #168]	; 0xa8
 27e:	4401      	add	r1, r0
 280:	460a      	mov	r2, r1
 282:	4281      	cmp	r1, r0
 284:	9205      	str	r2, [sp, #20]
 286:	f180 80e8 	bvs.w	45a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x45a>
 28a:	e7ff      	b.n	28c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x28c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:203
                    self.style.fill_color.expect("Fill color not defined"),
 28c:	981d      	ldr	r0, [sp, #116]	; 0x74
 28e:	8ac1      	ldrh	r1, [r0, #22]
 290:	8a80      	ldrh	r0, [r0, #20]
 292:	f240 0200 	movw	r2, #0
 296:	f2c0 0200 	movt	r2, #0
 29a:	2316      	movs	r3, #22
 29c:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6expect17h11f523cfa739cd28E>
 2a0:	9004      	str	r0, [sp, #16]
 2a2:	e7ff      	b.n	2a4 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2a4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:200
                Some((
 2a4:	9806      	ldr	r0, [sp, #24]
 2a6:	9036      	str	r0, [sp, #216]	; 0xd8
 2a8:	9905      	ldr	r1, [sp, #20]
 2aa:	9137      	str	r1, [sp, #220]	; 0xdc
 2ac:	9a04      	ldr	r2, [sp, #16]
 2ae:	f8ad 20e0 	strh.w	r2, [sp, #224]	; 0xe0
 2b2:	9b36      	ldr	r3, [sp, #216]	; 0xd8
 2b4:	f8dd c0dc 	ldr.w	ip, [sp, #220]	; 0xdc
 2b8:	f8dd e0e0 	ldr.w	lr, [sp, #224]	; 0xe0
 2bc:	f8cd e0c0 	str.w	lr, [sp, #192]	; 0xc0
 2c0:	f8cd c0bc 	str.w	ip, [sp, #188]	; 0xbc
 2c4:	932e      	str	r3, [sp, #184]	; 0xb8
 2c6:	2301      	movs	r3, #1
 2c8:	932d      	str	r3, [sp, #180]	; 0xb4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:199
            } else if is_fill && self.style.fill_color.is_some() {
 2ca:	e002      	b.n	2d2 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2d2>
 2cc:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:206
                None
 2ce:	902d      	str	r0, [sp, #180]	; 0xb4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:199
            } else if is_fill && self.style.fill_color.is_some() {
 2d0:	e7ff      	b.n	2d2 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2d2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:193
            let item = if is_border && self.style.stroke_color.is_some() {
 2d2:	e7ff      	b.n	2d4 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2d4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:209
            self.x += 1;
 2d4:	981d      	ldr	r0, [sp, #116]	; 0x74
 2d6:	68c0      	ldr	r0, [r0, #12]
 2d8:	1c41      	adds	r1, r0, #1
 2da:	460a      	mov	r2, r1
 2dc:	4281      	cmp	r1, r0
 2de:	9203      	str	r2, [sp, #12]
 2e0:	f180 80c2 	bvs.w	468 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x468>
 2e4:	e7ff      	b.n	2e6 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2e6>
 2e6:	981d      	ldr	r0, [sp, #116]	; 0x74
 2e8:	9903      	ldr	r1, [sp, #12]
 2ea:	60c1      	str	r1, [r0, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:211
            if self.x > self.radius as i32 {
 2ec:	981d      	ldr	r0, [sp, #116]	; 0x74
 2ee:	6882      	ldr	r2, [r0, #8]
 2f0:	68c0      	ldr	r0, [r0, #12]
 2f2:	4290      	cmp	r0, r2
 2f4:	dd19      	ble.n	32a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x32a>
 2f6:	e7ff      	b.n	2f8 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x2f8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:212
                self.x = -(self.radius as i32);
 2f8:	981d      	ldr	r0, [sp, #116]	; 0x74
 2fa:	6880      	ldr	r0, [r0, #8]
 2fc:	f1b0 4f00 	cmp.w	r0, #2147483648	; 0x80000000
 300:	9002      	str	r0, [sp, #8]
 302:	f000 80b8 	beq.w	476 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x476>
 306:	e7ff      	b.n	308 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x308>
 308:	981d      	ldr	r0, [sp, #116]	; 0x74
 30a:	9902      	ldr	r1, [sp, #8]
 30c:	424a      	negs	r2, r1
 30e:	60c2      	str	r2, [r0, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:213
                self.y += 1;
 310:	981d      	ldr	r0, [sp, #116]	; 0x74
 312:	6900      	ldr	r0, [r0, #16]
 314:	1c42      	adds	r2, r0, #1
 316:	4613      	mov	r3, r2
 318:	4282      	cmp	r2, r0
 31a:	9301      	str	r3, [sp, #4]
 31c:	f180 80b2 	bvs.w	484 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x484>
 320:	e7ff      	b.n	322 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x322>
 322:	981d      	ldr	r0, [sp, #116]	; 0x74
 324:	9901      	ldr	r1, [sp, #4]
 326:	6101      	str	r1, [r0, #16]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:211
            if self.x > self.radius as i32 {
 328:	e7ff      	b.n	32a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x32a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:216
            if self.y > self.radius as i32 {
 32a:	981d      	ldr	r0, [sp, #116]	; 0x74
 32c:	6881      	ldr	r1, [r0, #8]
 32e:	6900      	ldr	r0, [r0, #16]
 330:	4288      	cmp	r0, r1
 332:	dd10      	ble.n	356 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x356>
 334:	e7ff      	b.n	336 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x336>
 336:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:217
                break None;
 338:	9025      	str	r0, [sp, #148]	; 0x94
 33a:	e7ff      	b.n	33c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x33c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:227
        item.map(|(x, y, c)| Pixel(Coord::new(x, y).to_unsigned(), c))
 33c:	9825      	ldr	r0, [sp, #148]	; 0x94
 33e:	9926      	ldr	r1, [sp, #152]	; 0x98
 340:	9a27      	ldr	r2, [sp, #156]	; 0x9c
 342:	9b28      	ldr	r3, [sp, #160]	; 0xa0
 344:	9340      	str	r3, [sp, #256]	; 0x100
 346:	923f      	str	r2, [sp, #252]	; 0xfc
 348:	913e      	str	r1, [sp, #248]	; 0xf8
 34a:	903d      	str	r0, [sp, #244]	; 0xf4
 34c:	a93d      	add	r1, sp, #244	; 0xf4
 34e:	981c      	ldr	r0, [sp, #112]	; 0x70
 350:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E>
 354:	e02c      	b.n	3b0 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3b0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:220
            if let Some(i) = item {
 356:	982d      	ldr	r0, [sp, #180]	; 0xb4
 358:	2801      	cmp	r0, #1
 35a:	d128      	bne.n	3ae <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3ae>
 35c:	e7ff      	b.n	35e <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x35e>
 35e:	982e      	ldr	r0, [sp, #184]	; 0xb8
 360:	992f      	ldr	r1, [sp, #188]	; 0xbc
 362:	9a30      	ldr	r2, [sp, #192]	; 0xc0
 364:	923b      	str	r2, [sp, #236]	; 0xec
 366:	913a      	str	r1, [sp, #232]	; 0xe8
 368:	9039      	str	r0, [sp, #228]	; 0xe4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:221
                if i.0 >= 0 && i.1 >= 0 {
 36a:	9839      	ldr	r0, [sp, #228]	; 0xe4
 36c:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
 370:	dc04      	bgt.n	37c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x37c>
 372:	e7ff      	b.n	374 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x374>
 374:	2000      	movs	r0, #0
 376:	f88d 00f3 	strb.w	r0, [sp, #243]	; 0xf3
 37a:	e008      	b.n	38e <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x38e>
 37c:	983a      	ldr	r0, [sp, #232]	; 0xe8
 37e:	2100      	movs	r1, #0
 380:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
 384:	bfc8      	it	gt
 386:	2101      	movgt	r1, #1
 388:	f88d 10f3 	strb.w	r1, [sp, #243]	; 0xf3
 38c:	e7ff      	b.n	38e <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x38e>
 38e:	f89d 00f3 	ldrb.w	r0, [sp, #243]	; 0xf3
 392:	07c0      	lsls	r0, r0, #31
 394:	2800      	cmp	r0, #0
 396:	d009      	beq.n	3ac <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3ac>
 398:	e7ff      	b.n	39a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x39a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:222
                    break item;
 39a:	982d      	ldr	r0, [sp, #180]	; 0xb4
 39c:	992e      	ldr	r1, [sp, #184]	; 0xb8
 39e:	9a2f      	ldr	r2, [sp, #188]	; 0xbc
 3a0:	9b30      	ldr	r3, [sp, #192]	; 0xc0
 3a2:	9328      	str	r3, [sp, #160]	; 0xa0
 3a4:	9227      	str	r2, [sp, #156]	; 0x9c
 3a6:	9126      	str	r1, [sp, #152]	; 0x98
 3a8:	9025      	str	r0, [sp, #148]	; 0x94
 3aa:	e7c7      	b.n	33c <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x33c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:220
            if let Some(i) = item {
 3ac:	e7ff      	b.n	3ae <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x3ae>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:183
        let item = loop {
 3ae:	e698      	b.n	e2 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0xe2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:228
    }
 3b0:	e652      	b.n	58 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE+0x58>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:177
        let radius = self.radius as i32 - self.style.stroke_width as i32 + 1;
 3b2:	f240 0000 	movw	r0, #0
 3b6:	f2c0 0000 	movt	r0, #0
 3ba:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 3be:	defe      	udf	#254	; 0xfe
 3c0:	f240 0000 	movw	r0, #0
 3c4:	f2c0 0000 	movt	r0, #0
 3c8:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 3cc:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:180
        let radius_sq = radius * radius;
 3ce:	f240 0000 	movw	r0, #0
 3d2:	f2c0 0000 	movt	r0, #0
 3d6:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 3da:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:181
        let outer_radius_sq = outer_radius * outer_radius;
 3dc:	f240 0000 	movw	r0, #0
 3e0:	f2c0 0000 	movt	r0, #0
 3e4:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 3e8:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:186
            let len = tx * tx + ty * ty;
 3ea:	f240 0000 	movw	r0, #0
 3ee:	f2c0 0000 	movt	r0, #0
 3f2:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 3f6:	defe      	udf	#254	; 0xfe
 3f8:	f240 0000 	movw	r0, #0
 3fc:	f2c0 0000 	movt	r0, #0
 400:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 404:	defe      	udf	#254	; 0xfe
 406:	f240 0000 	movw	r0, #0
 40a:	f2c0 0000 	movt	r0, #0
 40e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 412:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:188
            let is_border = len > radius_sq - radius && len < outer_radius_sq + radius;
 414:	f240 0000 	movw	r0, #0
 418:	f2c0 0000 	movt	r0, #0
 41c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 420:	defe      	udf	#254	; 0xfe
 422:	f240 0000 	movw	r0, #0
 426:	f2c0 0000 	movt	r0, #0
 42a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 42e:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:195
                    cx + tx,
 430:	f240 0000 	movw	r0, #0
 434:	f2c0 0000 	movt	r0, #0
 438:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 43c:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:196
                    cy + ty,
 43e:	f240 0000 	movw	r0, #0
 442:	f2c0 0000 	movt	r0, #0
 446:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 44a:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:201
                    cx + tx,
 44c:	f240 0000 	movw	r0, #0
 450:	f2c0 0000 	movt	r0, #0
 454:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 458:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:202
                    cy + ty,
 45a:	f240 0000 	movw	r0, #0
 45e:	f2c0 0000 	movt	r0, #0
 462:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 466:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:209
            self.x += 1;
 468:	f240 0000 	movw	r0, #0
 46c:	f2c0 0000 	movt	r0, #0
 470:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 474:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:212
                self.x = -(self.radius as i32);
 476:	f240 0000 	movw	r0, #0
 47a:	f2c0 0000 	movt	r0, #0
 47e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 482:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:213
                self.y += 1;
 484:	f240 0000 	movw	r0, #0
 488:	f2c0 0000 	movt	r0, #0
 48c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 490:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE:

00000000 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE>:
_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:227
        item.map(|(x, y, c)| Pixel(Coord::new(x, y).to_unsigned(), c))
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	460a      	mov	r2, r1
   6:	680b      	ldr	r3, [r1, #0]
   8:	9307      	str	r3, [sp, #28]
   a:	684b      	ldr	r3, [r1, #4]
   c:	9308      	str	r3, [sp, #32]
   e:	8909      	ldrh	r1, [r1, #8]
  10:	f8ad 1026 	strh.w	r1, [sp, #38]	; 0x26
  14:	9907      	ldr	r1, [sp, #28]
  16:	9b08      	ldr	r3, [sp, #32]
  18:	9005      	str	r0, [sp, #20]
  1a:	4608      	mov	r0, r1
  1c:	4619      	mov	r1, r3
  1e:	9204      	str	r2, [sp, #16]
  20:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
  24:	9003      	str	r0, [sp, #12]
  26:	9102      	str	r1, [sp, #8]
  28:	e7ff      	b.n	2a <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE+0x2a>
  2a:	9803      	ldr	r0, [sp, #12]
  2c:	9902      	ldr	r1, [sp, #8]
  2e:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$embedded_graphics..coord..ToUnsigned$GT$11to_unsigned17h37ece76dbcf44ae9E>
  32:	9001      	str	r0, [sp, #4]
  34:	9100      	str	r1, [sp, #0]
  36:	e7ff      	b.n	38 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE+0x38>
  38:	f8bd 0026 	ldrh.w	r0, [sp, #38]	; 0x26
  3c:	9901      	ldr	r1, [sp, #4]
  3e:	9a05      	ldr	r2, [sp, #20]
  40:	6011      	str	r1, [r2, #0]
  42:	9b00      	ldr	r3, [sp, #0]
  44:	6053      	str	r3, [r2, #4]
  46:	8110      	strh	r0, [r2, #8]
  48:	b00a      	add	sp, #40	; 0x28
  4a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE:

00000000 <_ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE>:
_ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:62
    pub fn new(center: Coord, radius: u32) -> Self {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08e      	sub	sp, #56	; 0x38
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	9108      	str	r1, [sp, #32]
   c:	9209      	str	r2, [sp, #36]	; 0x24
   e:	930a      	str	r3, [sp, #40]	; 0x28
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:64
            center,
  10:	9908      	ldr	r1, [sp, #32]
  12:	9a09      	ldr	r2, [sp, #36]	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:65
            radius,
  14:	9b0a      	ldr	r3, [sp, #40]	; 0x28
  16:	ad0b      	add	r5, sp, #44	; 0x2c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:66
            style: Style::default(),
  18:	9007      	str	r0, [sp, #28]
  1a:	4628      	mov	r0, r5
  1c:	f8cd c018 	str.w	ip, [sp, #24]
  20:	f8cd e014 	str.w	lr, [sp, #20]
  24:	9404      	str	r4, [sp, #16]
  26:	9103      	str	r1, [sp, #12]
  28:	9202      	str	r2, [sp, #8]
  2a:	9301      	str	r3, [sp, #4]
  2c:	f7ff fffe 	bl	0 <_ZN83_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..default..Default$GT$7default17hfde0c1ef0e1e8160E>
  30:	e7ff      	b.n	32 <_ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE+0x32>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:63
        Circle {
  32:	9803      	ldr	r0, [sp, #12]
  34:	9907      	ldr	r1, [sp, #28]
  36:	6008      	str	r0, [r1, #0]
  38:	9a02      	ldr	r2, [sp, #8]
  3a:	604a      	str	r2, [r1, #4]
  3c:	9b01      	ldr	r3, [sp, #4]
  3e:	608b      	str	r3, [r1, #8]
  40:	f8bd c034 	ldrh.w	ip, [sp, #52]	; 0x34
  44:	f8a1 c014 	strh.w	ip, [r1, #20]
  48:	f8dd c02c 	ldr.w	ip, [sp, #44]	; 0x2c
  4c:	f8dd e030 	ldr.w	lr, [sp, #48]	; 0x30
  50:	f8c1 e010 	str.w	lr, [r1, #16]
  54:	f8c1 c00c 	str.w	ip, [r1, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/primitives/circle.rs:68
    }
  58:	b00e      	add	sp, #56	; 0x38
  5a:	bdb0      	pop	{r4, r5, r7, pc}

app-9b7b12e8d5cbce98.3x2ym8o7y6h3w9yn.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3x2ym8o7y6h3w9yn
000000ea l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
00000128 l       .debug_str	00000000 
0000012e l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
00000000 l     F .text._ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E	00000024 _ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E
00000000 l    d  .text._ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E	00000000 .text._ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E
00000000 l    d  .text._ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE	00000000 .text._ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE	0000001e .hidden _ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE



Disassembly of section .text._ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E:

00000000 <_ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E>:
_ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:2502
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	f8ad 0008 	strh.w	r0, [sp, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:2503
   8:	f8bd 0008 	ldrh.w	r0, [sp, #8]
   c:	ba00      	rev	r0, r0
   e:	0c00      	lsrs	r0, r0, #16
  10:	f8ad 000a 	strh.w	r0, [sp, #10]
  14:	f8bd 000a 	ldrh.w	r0, [sp, #10]
  18:	9101      	str	r1, [sp, #4]
  1a:	9000      	str	r0, [sp, #0]
  1c:	e7ff      	b.n	1e <_ZN4core3num21_$LT$impl$u20$u16$GT$10swap_bytes17h1d1ab78723915538E+0x1e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:2504
  1e:	9800      	ldr	r0, [sp, #0]
  20:	b003      	add	sp, #12
  22:	4770      	bx	lr

Disassembly of section .text._ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE:

00000000 <_ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE>:
_ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:2616
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	4601      	mov	r1, r0
   6:	f8ad 000e 	strh.w	r0, [sp, #14]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:2623
   a:	f8bd 000e 	ldrh.w	r0, [sp, #14]
   e:	9102      	str	r1, [sp, #8]
  10:	f7ff fffe 	bl	0 <_ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE>
  14:	9001      	str	r0, [sp, #4]
  16:	e7ff      	b.n	18 <_ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:2625
  18:	9801      	ldr	r0, [sp, #4]
  1a:	b004      	add	sp, #16
  1c:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.3ythfrr2onbxhq54.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 3ythfrr2onbxhq54
0000016b l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
00000096 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
00000182 l       .debug_str	00000000 
000000b6 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000c3 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000cf l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000da l       .debug_str	00000000 
000000dc l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
000000fc l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000141 l       .debug_str	00000000 
00000158 l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
00000163 l       .debug_str	00000000 
00000169 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E	00000000 .text._ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E	0000002e _ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E
00000000         *UND*	00000000 _ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E



Disassembly of section .text._ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E:

00000000 <_ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E>:
_ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/iterator.rs:982
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b088      	sub	sp, #32
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9105      	str	r1, [sp, #20]
   e:	9206      	str	r2, [sp, #24]
  10:	9307      	str	r3, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/iterator.rs:983
  12:	9905      	ldr	r1, [sp, #20]
  14:	9a06      	ldr	r2, [sp, #24]
  16:	9b07      	ldr	r3, [sp, #28]
  18:	f8cd c010 	str.w	ip, [sp, #16]
  1c:	f8cd e00c 	str.w	lr, [sp, #12]
  20:	9402      	str	r4, [sp, #8]
  22:	9501      	str	r5, [sp, #4]
  24:	f7ff fffe 	bl	0 <_ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E>
  28:	e7ff      	b.n	2a <_ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E+0x2a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/iterator.rs:984
  2a:	b008      	add	sp, #32
  2c:	bdb0      	pop	{r4, r5, r7, pc}

app-9b7b12e8d5cbce98.442kj81u5yysbtpp.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 442kj81u5yysbtpp
00001f38 l       .debug_str	00000000 
000026ab l       .debug_str	00000000 
000026dd l       .debug_str	00000000 
00002719 l       .debug_str	00000000 
00002727 l       .debug_str	00000000 
00002763 l       .debug_str	00000000 
0000276e l       .debug_str	00000000 
000027ab l       .debug_str	00000000 
000027ba l       .debug_str	00000000 
000027bf l       .debug_str	00000000 
000027e4 l       .debug_str	00000000 
00002822 l       .debug_str	00000000 
00002859 l       .debug_str	00000000 
00002898 l       .debug_str	00000000 
000028d1 l       .debug_str	00000000 
00002935 l       .debug_str	00000000 
0000296a l       .debug_str	00000000 
0000296c l       .debug_str	00000000 
0000296e l       .debug_str	00000000 
00002973 l       .debug_str	00000000 
0000298e l       .debug_str	00000000 
00002992 l       .debug_str	00000000 
00002997 l       .debug_str	00000000 
0000299b l       .debug_str	00000000 
000029b8 l       .debug_str	00000000 
000029bc l       .debug_str	00000000 
00002a01 l       .debug_str	00000000 
00002a0a l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
000000a7 l       .debug_str	00000000 
000000ae l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000be l       .debug_str	00000000 
000000c2 l       .debug_str	00000000 
000000c6 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000ce l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f2 l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
000000fd l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
00000139 l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
00000180 l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
000001a1 l       .debug_str	00000000 
000001aa l       .debug_str	00000000 
000001b0 l       .debug_str	00000000 
000001b7 l       .debug_str	00000000 
000001ba l       .debug_str	00000000 
000001c6 l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
000001e5 l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
000002a1 l       .debug_str	00000000 
000002ac l       .debug_str	00000000 
000002f3 l       .debug_str	00000000 
00000342 l       .debug_str	00000000 
0000034c l       .debug_str	00000000 
00000389 l       .debug_str	00000000 
000003ce l       .debug_str	00000000 
000003d7 l       .debug_str	00000000 
000003e7 l       .debug_str	00000000 
000003ef l       .debug_str	00000000 
00000444 l       .debug_str	00000000 
000004a1 l       .debug_str	00000000 
000004ad l       .debug_str	00000000 
000004b6 l       .debug_str	00000000 
000004c2 l       .debug_str	00000000 
000004ce l       .debug_str	00000000 
000004d7 l       .debug_str	00000000 
000004df l       .debug_str	00000000 
000004e9 l       .debug_str	00000000 
000004f1 l       .debug_str	00000000 
000004fb l       .debug_str	00000000 
00000510 l       .debug_str	00000000 
00000517 l       .debug_str	00000000 
00000537 l       .debug_str	00000000 
0000053e l       .debug_str	00000000 
00000546 l       .debug_str	00000000 
00000550 l       .debug_str	00000000 
0000055b l       .debug_str	00000000 
00000564 l       .debug_str	00000000 
0000056f l       .debug_str	00000000 
0000057b l       .debug_str	00000000 
00000584 l       .debug_str	00000000 
0000058b l       .debug_str	00000000 
00000593 l       .debug_str	00000000 
0000059b l       .debug_str	00000000 
000005a5 l       .debug_str	00000000 
000005ab l       .debug_str	00000000 
000005b2 l       .debug_str	00000000 
000005b9 l       .debug_str	00000000 
000005e6 l       .debug_str	00000000 
0000061b l       .debug_str	00000000 
00000621 l       .debug_str	00000000 
00000627 l       .debug_str	00000000 
00000636 l       .debug_str	00000000 
00000646 l       .debug_str	00000000 
00000656 l       .debug_str	00000000 
0000065e l       .debug_str	00000000 
00000687 l       .debug_str	00000000 
000006e5 l       .debug_str	00000000 
0000074b l       .debug_str	00000000 
00000752 l       .debug_str	00000000 
0000075a l       .debug_str	00000000 
00000763 l       .debug_str	00000000 
00000781 l       .debug_str	00000000 
00000791 l       .debug_str	00000000 
0000079f l       .debug_str	00000000 
000007aa l       .debug_str	00000000 
000007b7 l       .debug_str	00000000 
000007c6 l       .debug_str	00000000 
000007dc l       .debug_str	00000000 
000007e6 l       .debug_str	00000000 
000007ef l       .debug_str	00000000 
000007f8 l       .debug_str	00000000 
0000081e l       .debug_str	00000000 
00000834 l       .debug_str	00000000 
0000083f l       .debug_str	00000000 
00000855 l       .debug_str	00000000 
0000085d l       .debug_str	00000000 
0000087e l       .debug_str	00000000 
00000895 l       .debug_str	00000000 
0000089a l       .debug_str	00000000 
000008a2 l       .debug_str	00000000 
000008ab l       .debug_str	00000000 
000008b4 l       .debug_str	00000000 
000008bd l       .debug_str	00000000 
000008c5 l       .debug_str	00000000 
000008c9 l       .debug_str	00000000 
000008d0 l       .debug_str	00000000 
000008dc l       .debug_str	00000000 
000008e7 l       .debug_str	00000000 
000008ef l       .debug_str	00000000 
000008f7 l       .debug_str	00000000 
00000973 l       .debug_str	00000000 
000009f7 l       .debug_str	00000000 
00000af3 l       .debug_str	00000000 
00000bf7 l       .debug_str	00000000 
00000c05 l       .debug_str	00000000 
00000c10 l       .debug_str	00000000 
00000c1a l       .debug_str	00000000 
00000c2e l       .debug_str	00000000 
00000c39 l       .debug_str	00000000 
00000c67 l       .debug_str	00000000 
00000ce2 l       .debug_str	00000000 
00000d65 l       .debug_str	00000000 
00000d73 l       .debug_str	00000000 
00000dd2 l       .debug_str	00000000 
00000e39 l       .debug_str	00000000 
00000e4f l       .debug_str	00000000 
00000e5f l       .debug_str	00000000 
00000e6e l       .debug_str	00000000 
00000e72 l       .debug_str	00000000 
00000e79 l       .debug_str	00000000 
00000e7f l       .debug_str	00000000 
00000e83 l       .debug_str	00000000 
00000e89 l       .debug_str	00000000 
00000e8f l       .debug_str	00000000 
00000e9b l       .debug_str	00000000 
00000ea3 l       .debug_str	00000000 
00000ea9 l       .debug_str	00000000 
00000eb1 l       .debug_str	00000000 
00000eb7 l       .debug_str	00000000 
00000eda l       .debug_str	00000000 
00000eea l       .debug_str	00000000 
00000f1d l       .debug_str	00000000 
00000f5d l       .debug_str	00000000 
00000fa5 l       .debug_str	00000000 
00000fa9 l       .debug_str	00000000 
00000faf l       .debug_str	00000000 
00000fb5 l       .debug_str	00000000 
00000fbb l       .debug_str	00000000 
00000fcd l       .debug_str	00000000 
00001002 l       .debug_str	00000000 
00001044 l       .debug_str	00000000 
0000108e l       .debug_str	00000000 
00001092 l       .debug_str	00000000 
00001098 l       .debug_str	00000000 
0000109e l       .debug_str	00000000 
000010a4 l       .debug_str	00000000 
000010b6 l       .debug_str	00000000 
000010eb l       .debug_str	00000000 
0000112d l       .debug_str	00000000 
00001177 l       .debug_str	00000000 
0000117b l       .debug_str	00000000 
00001181 l       .debug_str	00000000 
00001187 l       .debug_str	00000000 
0000118d l       .debug_str	00000000 
00001193 l       .debug_str	00000000 
000011a4 l       .debug_str	00000000 
000011d8 l       .debug_str	00000000 
00001219 l       .debug_str	00000000 
00001262 l       .debug_str	00000000 
00001267 l       .debug_str	00000000 
0000126c l       .debug_str	00000000 
00001270 l       .debug_str	00000000 
00001276 l       .debug_str	00000000 
0000127c l       .debug_str	00000000 
00001282 l       .debug_str	00000000 
00001293 l       .debug_str	00000000 
000012c7 l       .debug_str	00000000 
00001308 l       .debug_str	00000000 
00001351 l       .debug_str	00000000 
00001355 l       .debug_str	00000000 
0000135e l       .debug_str	00000000 
0000136f l       .debug_str	00000000 
000013a3 l       .debug_str	00000000 
000013e4 l       .debug_str	00000000 
0000142d l       .debug_str	00000000 
00001432 l       .debug_str	00000000 
00001436 l       .debug_str	00000000 
0000143f l       .debug_str	00000000 
00001446 l       .debug_str	00000000 
0000144e l       .debug_str	00000000 
00001460 l       .debug_str	00000000 
00001495 l       .debug_str	00000000 
000014d7 l       .debug_str	00000000 
00001521 l       .debug_str	00000000 
00001525 l       .debug_str	00000000 
0000152b l       .debug_str	00000000 
00001531 l       .debug_str	00000000 
00001537 l       .debug_str	00000000 
0000153d l       .debug_str	00000000 
00001545 l       .debug_str	00000000 
00001553 l       .debug_str	00000000 
00001562 l       .debug_str	00000000 
00001573 l       .debug_str	00000000 
0000157e l       .debug_str	00000000 
00001589 l       .debug_str	00000000 
00001594 l       .debug_str	00000000 
0000159b l       .debug_str	00000000 
000015be l       .debug_str	00000000 
000015d0 l       .debug_str	00000000 
00001605 l       .debug_str	00000000 
00001647 l       .debug_str	00000000 
00001691 l       .debug_str	00000000 
00001695 l       .debug_str	00000000 
0000169f l       .debug_str	00000000 
000016b1 l       .debug_str	00000000 
000016e6 l       .debug_str	00000000 
00001728 l       .debug_str	00000000 
00001772 l       .debug_str	00000000 
00001777 l       .debug_str	00000000 
00001781 l       .debug_str	00000000 
00001793 l       .debug_str	00000000 
000017c8 l       .debug_str	00000000 
0000180a l       .debug_str	00000000 
00001854 l       .debug_str	00000000 
00001868 l       .debug_str	00000000 
00001876 l       .debug_str	00000000 
00001886 l       .debug_str	00000000 
0000188f l       .debug_str	00000000 
0000189a l       .debug_str	00000000 
000018a9 l       .debug_str	00000000 
000018be l       .debug_str	00000000 
000018ef l       .debug_str	00000000 
0000198c l       .debug_str	00000000 
00001a31 l       .debug_str	00000000 
00001a3c l       .debug_str	00000000 
00001a45 l       .debug_str	00000000 
00001a66 l       .debug_str	00000000 
00001a79 l       .debug_str	00000000 
00001aaf l       .debug_str	00000000 
00001b32 l       .debug_str	00000000 
00001bbd l       .debug_str	00000000 
00001bd9 l       .debug_str	00000000 
00001c25 l       .debug_str	00000000 
00001c79 l       .debug_str	00000000 
00001c96 l       .debug_str	00000000 
00001caa l       .debug_str	00000000 
00001cf6 l       .debug_str	00000000 
00001d4a l       .debug_str	00000000 
00001d60 l       .debug_str	00000000 
00001d74 l       .debug_str	00000000 
00001dbb l       .debug_str	00000000 
00001e0a l       .debug_str	00000000 
00001e13 l       .debug_str	00000000 
00001e21 l       .debug_str	00000000 
00001e52 l       .debug_str	00000000 
00001e58 l       .debug_str	00000000 
00001e60 l       .debug_str	00000000 
00001e67 l       .debug_str	00000000 
00001e6f l       .debug_str	00000000 
00001e7a l       .debug_str	00000000 
00001e82 l       .debug_str	00000000 
00001e91 l       .debug_str	00000000 
00001e95 l       .debug_str	00000000 
00001ea0 l       .debug_str	00000000 
00001eac l       .debug_str	00000000 
00001eb7 l       .debug_str	00000000 
00001ec8 l       .debug_str	00000000 
00001ece l       .debug_str	00000000 
00001ed6 l       .debug_str	00000000 
00001edd l       .debug_str	00000000 
00001ee7 l       .debug_str	00000000 
00001eef l       .debug_str	00000000 
00001ef7 l       .debug_str	00000000 
00001f19 l       .debug_str	00000000 
00001f24 l       .debug_str	00000000 
00001f30 l       .debug_str	00000000 
00001f41 l       .debug_str	00000000 
00001f4c l       .debug_str	00000000 
00001f53 l       .debug_str	00000000 
00001f5e l       .debug_str	00000000 
00001f69 l       .debug_str	00000000 
00001f79 l       .debug_str	00000000 
00001f83 l       .debug_str	00000000 
00001f89 l       .debug_str	00000000 
00001fab l       .debug_str	00000000 
00001fe3 l       .debug_str	00000000 
00002023 l       .debug_str	00000000 
0000202a l       .debug_str	00000000 
00002032 l       .debug_str	00000000 
00002049 l       .debug_str	00000000 
00002052 l       .debug_str	00000000 
00002062 l       .debug_str	00000000 
00002071 l       .debug_str	00000000 
00002079 l       .debug_str	00000000 
00002080 l       .debug_str	00000000 
00002088 l       .debug_str	00000000 
000020a6 l       .debug_str	00000000 
000020b6 l       .debug_str	00000000 
000020e9 l       .debug_str	00000000 
000020fe l       .debug_str	00000000 
00002107 l       .debug_str	00000000 
00002164 l       .debug_str	00000000 
000021c9 l       .debug_str	00000000 
000021d3 l       .debug_str	00000000 
000021e3 l       .debug_str	00000000 
000021f8 l       .debug_str	00000000 
00002200 l       .debug_str	00000000 
00002264 l       .debug_str	00000000 
000022d0 l       .debug_str	00000000 
000022d7 l       .debug_str	00000000 
000022df l       .debug_str	00000000 
000022fd l       .debug_str	00000000 
0000230d l       .debug_str	00000000 
00002340 l       .debug_str	00000000 
00002355 l       .debug_str	00000000 
00002368 l       .debug_str	00000000 
0000237d l       .debug_str	00000000 
00002384 l       .debug_str	00000000 
00002399 l       .debug_str	00000000 
000023c3 l       .debug_str	00000000 
000023f5 l       .debug_str	00000000 
000023fe l       .debug_str	00000000 
00002405 l       .debug_str	00000000 
0000240b l       .debug_str	00000000 
00002411 l       .debug_str	00000000 
0000241f l       .debug_str	00000000 
0000242a l       .debug_str	00000000 
0000242f l       .debug_str	00000000 
0000243c l       .debug_str	00000000 
00002472 l       .debug_str	00000000 
0000247b l       .debug_str	00000000 
00002484 l       .debug_str	00000000 
00002492 l       .debug_str	00000000 
000024aa l       .debug_str	00000000 
000024b8 l       .debug_str	00000000 
000024ba l       .debug_str	00000000 
000024ef l       .debug_str	00000000 
000024f1 l       .debug_str	00000000 
000024f9 l       .debug_str	00000000 
000024fb l       .debug_str	00000000 
00002534 l       .debug_str	00000000 
000025cd l       .debug_str	00000000 
00002627 l       .debug_str	00000000 
00002663 l       .debug_str	00000000 
0000266f l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.67b9b3963d856a096dd97332a4cd738f.2	00000018 .Lanon.67b9b3963d856a096dd97332a4cd738f.2
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E	00000000 .text._ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E	00000000 .text._ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E	00000000 .text._ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE	00000000 .text._ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE	00000000 .text._ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE	00000000 .text._ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E	00000000 .text._ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E
00000000 l    d  .text._ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE	00000000 .text._ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE
00000000 l    d  .text._ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE	00000000 .text._ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE
00000000 l    d  .rodata..Lanon.67b9b3963d856a096dd97332a4cd738f.0	00000000 .rodata..Lanon.67b9b3963d856a096dd97332a4cd738f.0
00000000 l    d  .rodata..Lanon.67b9b3963d856a096dd97332a4cd738f.1	00000000 .rodata..Lanon.67b9b3963d856a096dd97332a4cd738f.1
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE
00000000         *UND*	00000000 _ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE
00000000         *UND*	00000000 _ZN4core6option13expect_failed17h3eeb96a257d935a1E
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E	000000c4 _ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E	00000036 _ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E	00000056 _ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE	0000005a _ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE	0000005a _ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE	0000003e _ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E	000000a4 _ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E
00000000 g     F .text._ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE	000000b0 _ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000 g     F .text._ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE	00000058 _ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE
00000000         *UND*	00000000 .hidden _ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E



Disassembly of section .text._ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E:

00000000 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E>:
_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:414
   0:	b580      	push	{r7, lr}
   2:	b092      	sub	sp, #72	; 0x48
   4:	460a      	mov	r2, r1
   6:	2300      	movs	r3, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:416
   8:	f88d 3046 	strb.w	r3, [sp, #70]	; 0x46
   c:	f88d 3047 	strb.w	r3, [sp, #71]	; 0x47
  10:	2301      	movs	r3, #1
  12:	f88d 3047 	strb.w	r3, [sp, #71]	; 0x47
  16:	f88d 3046 	strb.w	r3, [sp, #70]	; 0x46
  1a:	6809      	ldr	r1, [r1, #0]
  1c:	2900      	cmp	r1, #0
  1e:	9203      	str	r2, [sp, #12]
  20:	9002      	str	r0, [sp, #8]
  22:	9101      	str	r1, [sp, #4]
  24:	d02e      	beq.n	84 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x84>
  26:	e7ff      	b.n	28 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x28>
  28:	9801      	ldr	r0, [sp, #4]
  2a:	2801      	cmp	r0, #1
  2c:	d001      	beq.n	32 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x32>
  2e:	e7ff      	b.n	30 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x30>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:419
  30:	defe      	udf	#254	; 0xfe
  32:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:416
  34:	f88d 0047 	strb.w	r0, [sp, #71]	; 0x47
  38:	9903      	ldr	r1, [sp, #12]
  3a:	684a      	ldr	r2, [r1, #4]
  3c:	688b      	ldr	r3, [r1, #8]
  3e:	f8d1 c00c 	ldr.w	ip, [r1, #12]
  42:	f8cd c01c 	str.w	ip, [sp, #28]
  46:	9306      	str	r3, [sp, #24]
  48:	9205      	str	r2, [sp, #20]
  4a:	f88d 0046 	strb.w	r0, [sp, #70]	; 0x46
  4e:	9805      	ldr	r0, [sp, #20]
  50:	9a06      	ldr	r2, [sp, #24]
  52:	9b07      	ldr	r3, [sp, #28]
  54:	9310      	str	r3, [sp, #64]	; 0x40
  56:	920f      	str	r2, [sp, #60]	; 0x3c
  58:	900e      	str	r0, [sp, #56]	; 0x38
  5a:	980e      	ldr	r0, [sp, #56]	; 0x38
  5c:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
  5e:	9b10      	ldr	r3, [sp, #64]	; 0x40
  60:	930d      	str	r3, [sp, #52]	; 0x34
  62:	920c      	str	r2, [sp, #48]	; 0x30
  64:	900b      	str	r0, [sp, #44]	; 0x2c
  66:	a808      	add	r0, sp, #32
  68:	a90b      	add	r1, sp, #44	; 0x2c
  6a:	f7ff fffe 	bl	0 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17h0ec332704679812cE>
  6e:	e7ff      	b.n	70 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x70>
  70:	9808      	ldr	r0, [sp, #32]
  72:	9909      	ldr	r1, [sp, #36]	; 0x24
  74:	9a0a      	ldr	r2, [sp, #40]	; 0x28
  76:	9b02      	ldr	r3, [sp, #8]
  78:	60da      	str	r2, [r3, #12]
  7a:	6099      	str	r1, [r3, #8]
  7c:	6058      	str	r0, [r3, #4]
  7e:	2001      	movs	r0, #1
  80:	6018      	str	r0, [r3, #0]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:415
  82:	e003      	b.n	8c <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x8c>
  84:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:417
  86:	9902      	ldr	r1, [sp, #8]
  88:	6008      	str	r0, [r1, #0]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:415
  8a:	e7ff      	b.n	8c <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x8c>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:419
  8c:	f89d 0046 	ldrb.w	r0, [sp, #70]	; 0x46
  90:	07c0      	lsls	r0, r0, #31
  92:	2800      	cmp	r0, #0
  94:	d105      	bne.n	a2 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0xa2>
  96:	e7ff      	b.n	98 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x98>
  98:	9803      	ldr	r0, [sp, #12]
  9a:	6801      	ldr	r1, [r0, #0]
  9c:	2901      	cmp	r1, #1
  9e:	d006      	beq.n	ae <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0xae>
  a0:	e00f      	b.n	c2 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0xc2>
  a2:	2000      	movs	r0, #0
  a4:	f88d 0046 	strb.w	r0, [sp, #70]	; 0x46
  a8:	e7f6      	b.n	98 <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0x98>
  aa:	b012      	add	sp, #72	; 0x48
  ac:	bd80      	pop	{r7, pc}
  ae:	f89d 0047 	ldrb.w	r0, [sp, #71]	; 0x47
  b2:	07c0      	lsls	r0, r0, #31
  b4:	2800      	cmp	r0, #0
  b6:	d0f8      	beq.n	aa <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0xaa>
  b8:	e7ff      	b.n	ba <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0xba>
  ba:	2000      	movs	r0, #0
  bc:	f88d 0047 	strb.w	r0, [sp, #71]	; 0x47
  c0:	e7f3      	b.n	aa <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0xaa>
  c2:	e7f2      	b.n	aa <_ZN4core6option15Option$LT$T$GT$3map17h939549a7968c4696E+0xaa>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E:

00000000 <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E>:
_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:237
   0:	b085      	sub	sp, #20
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:239
   6:	9802      	ldr	r0, [sp, #8]
   8:	6800      	ldr	r0, [r0, #0]
   a:	2800      	cmp	r0, #0
   c:	9101      	str	r1, [sp, #4]
   e:	9000      	str	r0, [sp, #0]
  10:	d00b      	beq.n	2a <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E+0x2a>
  12:	e7ff      	b.n	14 <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E+0x14>
  14:	9800      	ldr	r0, [sp, #0]
  16:	2801      	cmp	r0, #1
  18:	d001      	beq.n	1e <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E+0x1e>
  1a:	e7ff      	b.n	1c <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E+0x1c>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:242
  1c:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:239
  1e:	9802      	ldr	r0, [sp, #8]
  20:	3008      	adds	r0, #8
  22:	9004      	str	r0, [sp, #16]
  24:	9804      	ldr	r0, [sp, #16]
  26:	9003      	str	r0, [sp, #12]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:238
  28:	e002      	b.n	30 <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E+0x30>
  2a:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:240
  2c:	9003      	str	r0, [sp, #12]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:238
  2e:	e7ff      	b.n	30 <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E+0x30>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:242
  30:	9803      	ldr	r0, [sp, #12]
  32:	b005      	add	sp, #20
  34:	4770      	bx	lr

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E:

00000000 <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E>:
_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:311
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9007      	str	r0, [sp, #28]
   e:	9108      	str	r1, [sp, #32]
  10:	9209      	str	r2, [sp, #36]	; 0x24
  12:	930a      	str	r3, [sp, #40]	; 0x28
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:313
  14:	9807      	ldr	r0, [sp, #28]
  16:	2800      	cmp	r0, #0
  18:	f8cd c018 	str.w	ip, [sp, #24]
  1c:	f8cd e014 	str.w	lr, [sp, #20]
  20:	9404      	str	r4, [sp, #16]
  22:	9503      	str	r5, [sp, #12]
  24:	9002      	str	r0, [sp, #8]
  26:	d00d      	beq.n	44 <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E+0x44>
  28:	e7ff      	b.n	2a <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E+0x2a>
  2a:	9802      	ldr	r0, [sp, #8]
  2c:	2801      	cmp	r0, #1
  2e:	d001      	beq.n	34 <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E+0x34>
  30:	e7ff      	b.n	32 <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E+0x32>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:316
  32:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:313
  34:	9808      	ldr	r0, [sp, #32]
  36:	900b      	str	r0, [sp, #44]	; 0x2c
  38:	980b      	ldr	r0, [sp, #44]	; 0x2c
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:316
  3a:	9907      	ldr	r1, [sp, #28]
  3c:	2901      	cmp	r1, #1
  3e:	9001      	str	r0, [sp, #4]
  40:	d005      	beq.n	4e <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E+0x4e>
  42:	e007      	b.n	54 <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E+0x54>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:314
  44:	9809      	ldr	r0, [sp, #36]	; 0x24
  46:	990a      	ldr	r1, [sp, #40]	; 0x28
  48:	f7ff fffe 	bl	0 <_ZN4core6option13expect_failed17h3eeb96a257d935a1E>
  4c:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:316
  4e:	9801      	ldr	r0, [sp, #4]
  50:	b00c      	add	sp, #48	; 0x30
  52:	bdb0      	pop	{r4, r5, r7, pc}
  54:	e7fb      	b.n	4e <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E+0x4e>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE:

00000000 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE>:
_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:344
   0:	b08a      	sub	sp, #40	; 0x28
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9006      	str	r0, [sp, #24]
   8:	9107      	str	r1, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:346
   a:	9806      	ldr	r0, [sp, #24]
   c:	2800      	cmp	r0, #0
   e:	4601      	mov	r1, r0
  10:	bf18      	it	ne
  12:	2101      	movne	r1, #1
  14:	2800      	cmp	r0, #0
  16:	9205      	str	r2, [sp, #20]
  18:	9304      	str	r3, [sp, #16]
  1a:	9103      	str	r1, [sp, #12]
  1c:	d011      	beq.n	42 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE+0x42>
  1e:	e7ff      	b.n	20 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE+0x20>
  20:	9803      	ldr	r0, [sp, #12]
  22:	2801      	cmp	r0, #1
  24:	d001      	beq.n	2a <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE+0x2a>
  26:	e7ff      	b.n	28 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE+0x28>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:349
  28:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:346
  2a:	9806      	ldr	r0, [sp, #24]
  2c:	9907      	ldr	r1, [sp, #28]
  2e:	9008      	str	r0, [sp, #32]
  30:	9109      	str	r1, [sp, #36]	; 0x24
  32:	9808      	ldr	r0, [sp, #32]
  34:	9909      	ldr	r1, [sp, #36]	; 0x24
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:349
  36:	9a06      	ldr	r2, [sp, #24]
  38:	2a00      	cmp	r2, #0
  3a:	9002      	str	r0, [sp, #8]
  3c:	9101      	str	r1, [sp, #4]
  3e:	d107      	bne.n	50 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE+0x50>
  40:	e00a      	b.n	58 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE+0x58>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:12
  42:	f240 0000 	movw	r0, #0
  46:	f2c0 0000 	movt	r0, #0
  4a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  4e:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:349
  50:	9802      	ldr	r0, [sp, #8]
  52:	9901      	ldr	r1, [sp, #4]
  54:	b00a      	add	sp, #40	; 0x28
  56:	4770      	bx	lr
  58:	e7fa      	b.n	50 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE+0x50>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE:

00000000 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE>:
_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:344
   0:	b086      	sub	sp, #24
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	f88d 0014 	strb.w	r0, [sp, #20]
   a:	f88d 1015 	strb.w	r1, [sp, #21]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:346
   e:	f89d 0014 	ldrb.w	r0, [sp, #20]
  12:	07c1      	lsls	r1, r0, #31
  14:	2900      	cmp	r1, #0
  16:	9204      	str	r2, [sp, #16]
  18:	9303      	str	r3, [sp, #12]
  1a:	9002      	str	r0, [sp, #8]
  1c:	d012      	beq.n	44 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE+0x44>
  1e:	e7ff      	b.n	20 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE+0x20>
  20:	9802      	ldr	r0, [sp, #8]
  22:	2801      	cmp	r0, #1
  24:	d001      	beq.n	2a <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE+0x2a>
  26:	e7ff      	b.n	28 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE+0x28>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:349
  28:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:346
  2a:	f89d 0015 	ldrb.w	r0, [sp, #21]
  2e:	f88d 0017 	strb.w	r0, [sp, #23]
  32:	f89d 0017 	ldrb.w	r0, [sp, #23]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:349
  36:	f89d 1014 	ldrb.w	r1, [sp, #20]
  3a:	07c9      	lsls	r1, r1, #31
  3c:	2900      	cmp	r1, #0
  3e:	9001      	str	r0, [sp, #4]
  40:	d107      	bne.n	52 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE+0x52>
  42:	e009      	b.n	58 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE+0x58>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/macros.rs:12
  44:	f240 0000 	movw	r0, #0
  48:	f2c0 0000 	movt	r0, #0
  4c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  50:	defe      	udf	#254	; 0xfe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:349
  52:	9801      	ldr	r0, [sp, #4]
  54:	b006      	add	sp, #24
  56:	4770      	bx	lr
  58:	e7fb      	b.n	52 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE+0x52>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE:

00000000 <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE>:
_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:184
   0:	b084      	sub	sp, #16
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:186
   6:	9802      	ldr	r0, [sp, #8]
   8:	6800      	ldr	r0, [r0, #0]
   a:	2800      	cmp	r0, #0
   c:	4602      	mov	r2, r0
   e:	bf18      	it	ne
  10:	2201      	movne	r2, #1
  12:	2800      	cmp	r0, #0
  14:	9101      	str	r1, [sp, #4]
  16:	9200      	str	r2, [sp, #0]
  18:	d009      	beq.n	2e <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE+0x2e>
  1a:	e7ff      	b.n	1c <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE+0x1c>
  1c:	9800      	ldr	r0, [sp, #0]
  1e:	2801      	cmp	r0, #1
  20:	d001      	beq.n	26 <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE+0x26>
  22:	e7ff      	b.n	24 <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE+0x24>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:189
  24:	defe      	udf	#254	; 0xfe
  26:	2001      	movs	r0, #1
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:186
  28:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:185
  2c:	e003      	b.n	36 <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE+0x36>
  2e:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:187
  30:	f88d 000f 	strb.w	r0, [sp, #15]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:185
  34:	e7ff      	b.n	36 <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE+0x36>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:189
  36:	f89d 000f 	ldrb.w	r0, [sp, #15]
  3a:	b004      	add	sp, #16
  3c:	4770      	bx	lr

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E:

00000000 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E>:
_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:622
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9002      	str	r0, [sp, #8]
   8:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:624
   a:	f88d 001f 	strb.w	r0, [sp, #31]
   e:	f88d 001e 	strb.w	r0, [sp, #30]
  12:	2001      	movs	r0, #1
  14:	f88d 001f 	strb.w	r0, [sp, #31]
  18:	f88d 001e 	strb.w	r0, [sp, #30]
  1c:	9802      	ldr	r0, [sp, #8]
  1e:	2800      	cmp	r0, #0
  20:	4602      	mov	r2, r0
  22:	bf18      	it	ne
  24:	2201      	movne	r2, #1
  26:	2800      	cmp	r0, #0
  28:	9101      	str	r1, [sp, #4]
  2a:	9200      	str	r2, [sp, #0]
  2c:	d017      	beq.n	5e <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x5e>
  2e:	e7ff      	b.n	30 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x30>
  30:	9800      	ldr	r0, [sp, #0]
  32:	2801      	cmp	r0, #1
  34:	d001      	beq.n	3a <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x3a>
  36:	e7ff      	b.n	38 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x38>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:627
  38:	defe      	udf	#254	; 0xfe
  3a:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:624
  3c:	f88d 001f 	strb.w	r0, [sp, #31]
  40:	9902      	ldr	r1, [sp, #8]
  42:	9105      	str	r1, [sp, #20]
  44:	f88d 001e 	strb.w	r0, [sp, #30]
  48:	9805      	ldr	r0, [sp, #20]
  4a:	9006      	str	r0, [sp, #24]
  4c:	9806      	ldr	r0, [sp, #24]
  4e:	f7ff fffe 	bl	0 <_ZN4core3ops8function6FnOnce9call_once17h8261298e159a1e4fE>
  52:	f88d 1011 	strb.w	r1, [sp, #17]
  56:	f88d 0010 	strb.w	r0, [sp, #16]
  5a:	e7ff      	b.n	5c <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x5c>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:623
  5c:	e003      	b.n	66 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x66>
  5e:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:625
  60:	f88d 0010 	strb.w	r0, [sp, #16]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:623
  64:	e7ff      	b.n	66 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x66>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:627
  66:	f89d 001e 	ldrb.w	r0, [sp, #30]
  6a:	07c0      	lsls	r0, r0, #31
  6c:	2800      	cmp	r0, #0
  6e:	d104      	bne.n	7a <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x7a>
  70:	e7ff      	b.n	72 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x72>
  72:	9802      	ldr	r0, [sp, #8]
  74:	2800      	cmp	r0, #0
  76:	d10a      	bne.n	8e <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x8e>
  78:	e013      	b.n	a2 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0xa2>
  7a:	2000      	movs	r0, #0
  7c:	f88d 001e 	strb.w	r0, [sp, #30]
  80:	e7f7      	b.n	72 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x72>
  82:	f89d 0010 	ldrb.w	r0, [sp, #16]
  86:	f89d 1011 	ldrb.w	r1, [sp, #17]
  8a:	b008      	add	sp, #32
  8c:	bd80      	pop	{r7, pc}
  8e:	f89d 001f 	ldrb.w	r0, [sp, #31]
  92:	07c0      	lsls	r0, r0, #31
  94:	2800      	cmp	r0, #0
  96:	d0f4      	beq.n	82 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x82>
  98:	e7ff      	b.n	9a <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x9a>
  9a:	2000      	movs	r0, #0
  9c:	f88d 001f 	strb.w	r0, [sp, #31]
  a0:	e7ef      	b.n	82 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x82>
  a2:	e7ee      	b.n	82 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E+0x82>

Disassembly of section .text._ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE:

00000000 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE>:
_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:367
   0:	b580      	push	{r7, lr}
   2:	b087      	sub	sp, #28
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	f8ad 0010 	strh.w	r0, [sp, #16]
   e:	f8ad 1012 	strh.w	r1, [sp, #18]
  12:	f8ad 2014 	strh.w	r2, [sp, #20]
  16:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:369
  18:	f88d 001a 	strb.w	r0, [sp, #26]
  1c:	f88d 001b 	strb.w	r0, [sp, #27]
  20:	2001      	movs	r0, #1
  22:	f88d 001b 	strb.w	r0, [sp, #27]
  26:	f88d 001a 	strb.w	r0, [sp, #26]
  2a:	f8bd 0010 	ldrh.w	r0, [sp, #16]
  2e:	4601      	mov	r1, r0
  30:	2800      	cmp	r0, #0
  32:	9303      	str	r3, [sp, #12]
  34:	f8cd c008 	str.w	ip, [sp, #8]
  38:	f8cd e004 	str.w	lr, [sp, #4]
  3c:	9100      	str	r1, [sp, #0]
  3e:	d011      	beq.n	64 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x64>
  40:	e7ff      	b.n	42 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x42>
  42:	9800      	ldr	r0, [sp, #0]
  44:	2801      	cmp	r0, #1
  46:	d001      	beq.n	4c <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x4c>
  48:	e7ff      	b.n	4a <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x4a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:372
  4a:	defe      	udf	#254	; 0xfe
  4c:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:369
  4e:	f88d 001b 	strb.w	r0, [sp, #27]
  52:	f8bd 0012 	ldrh.w	r0, [sp, #18]
  56:	f8ad 0018 	strh.w	r0, [sp, #24]
  5a:	f8bd 0018 	ldrh.w	r0, [sp, #24]
  5e:	f8ad 0016 	strh.w	r0, [sp, #22]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:368
  62:	e007      	b.n	74 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x74>
  64:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:370
  66:	f88d 001a 	strb.w	r0, [sp, #26]
  6a:	f8bd 0014 	ldrh.w	r0, [sp, #20]
  6e:	f8ad 0016 	strh.w	r0, [sp, #22]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:368
  72:	e7ff      	b.n	74 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x74>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:372
  74:	f89d 001a 	ldrb.w	r0, [sp, #26]
  78:	07c0      	lsls	r0, r0, #31
  7a:	2800      	cmp	r0, #0
  7c:	d105      	bne.n	8a <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x8a>
  7e:	e7ff      	b.n	80 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x80>
  80:	f8bd 0010 	ldrh.w	r0, [sp, #16]
  84:	2801      	cmp	r0, #1
  86:	d008      	beq.n	9a <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x9a>
  88:	e011      	b.n	ae <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0xae>
  8a:	2000      	movs	r0, #0
  8c:	f88d 001a 	strb.w	r0, [sp, #26]
  90:	e7f6      	b.n	80 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x80>
  92:	f8bd 0016 	ldrh.w	r0, [sp, #22]
  96:	b007      	add	sp, #28
  98:	bd80      	pop	{r7, pc}
  9a:	f89d 001b 	ldrb.w	r0, [sp, #27]
  9e:	07c0      	lsls	r0, r0, #31
  a0:	2800      	cmp	r0, #0
  a2:	d0f6      	beq.n	92 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x92>
  a4:	e7ff      	b.n	a6 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0xa6>
  a6:	2000      	movs	r0, #0
  a8:	f88d 001b 	strb.w	r0, [sp, #27]
  ac:	e7f1      	b.n	92 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x92>
  ae:	e7f0      	b.n	92 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE+0x92>

Disassembly of section .text._ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE:

00000000 <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE>:
_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:148
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4601      	mov	r1, r0
   6:	9004      	str	r0, [sp, #16]
   8:	9804      	ldr	r0, [sp, #16]
   a:	9006      	str	r0, [sp, #24]
   c:	9806      	ldr	r0, [sp, #24]
   e:	8800      	ldrh	r0, [r0, #0]
  10:	4602      	mov	r2, r0
  12:	2800      	cmp	r0, #0
  14:	9103      	str	r1, [sp, #12]
  16:	9202      	str	r2, [sp, #8]
  18:	d005      	beq.n	26 <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE+0x26>
  1a:	e7ff      	b.n	1c <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE+0x1c>
  1c:	9802      	ldr	r0, [sp, #8]
  1e:	2801      	cmp	r0, #1
  20:	d005      	beq.n	2e <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE+0x2e>
  22:	e7ff      	b.n	24 <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE+0x24>
  24:	defe      	udf	#254	; 0xfe
  26:	2000      	movs	r0, #0
  28:	f8ad 0014 	strh.w	r0, [sp, #20]
  2c:	e00e      	b.n	4c <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE+0x4c>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:156
  2e:	9806      	ldr	r0, [sp, #24]
  30:	3002      	adds	r0, #2
  32:	9007      	str	r0, [sp, #28]
  34:	9807      	ldr	r0, [sp, #28]
  36:	f7ff fffe 	bl	0 <_ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E>
  3a:	9001      	str	r0, [sp, #4]
  3c:	e7ff      	b.n	3e <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE+0x3e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/option.rs:148
  3e:	9801      	ldr	r0, [sp, #4]
  40:	f8ad 0016 	strh.w	r0, [sp, #22]
  44:	2101      	movs	r1, #1
  46:	f8ad 1014 	strh.w	r1, [sp, #20]
  4a:	e7ff      	b.n	4c <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE+0x4c>
  4c:	f8bd 0014 	ldrh.w	r0, [sp, #20]
  50:	f8bd 1016 	ldrh.w	r1, [sp, #22]
  54:	b008      	add	sp, #32
  56:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.46fe3uwfwh9g1u34.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 46fe3uwfwh9g1u34
00001b08 l       .debug_str	00000000 
00002887 l       .debug_str	00000000 
000028c6 l       .debug_str	00000000 
000028d2 l       .debug_str	00000000 
000028d9 l       .debug_str	00000000 
000028dc l       .debug_str	00000000 
000028e2 l       .debug_str	00000000 
000028e8 l       .debug_str	00000000 
000028f1 l       .debug_str	00000000 
000028f7 l       .debug_str	00000000 
000028f9 l       .debug_str	00000000 
000028fd l       .debug_str	00000000 
00002923 l       .debug_str	00000000 
00002928 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008b l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009a l       .debug_str	00000000 
000000a5 l       .debug_str	00000000 
000000ae l       .debug_str	00000000 
000000b3 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000bf l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000c9 l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
000000da l       .debug_str	00000000 
000000de l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000e4 l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
0000011b l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
0000012d l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
00000145 l       .debug_str	00000000 
00000148 l       .debug_str	00000000 
0000014e l       .debug_str	00000000 
0000015c l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
00000169 l       .debug_str	00000000 
00000171 l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
00000183 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
0000018e l       .debug_str	00000000 
00000191 l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
00000198 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001a3 l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001c5 l       .debug_str	00000000 
000001d0 l       .debug_str	00000000 
000001dd l       .debug_str	00000000 
000001eb l       .debug_str	00000000 
000001f5 l       .debug_str	00000000 
00000203 l       .debug_str	00000000 
0000020d l       .debug_str	00000000 
00000216 l       .debug_str	00000000 
0000021a l       .debug_str	00000000 
00000220 l       .debug_str	00000000 
0000022a l       .debug_str	00000000 
0000022e l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
0000023c l       .debug_str	00000000 
00000242 l       .debug_str	00000000 
00000247 l       .debug_str	00000000 
00000251 l       .debug_str	00000000 
0000025e l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
0000026b l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
0000027c l       .debug_str	00000000 
00000282 l       .debug_str	00000000 
00000287 l       .debug_str	00000000 
00000293 l       .debug_str	00000000 
0000029a l       .debug_str	00000000 
0000029c l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002c0 l       .debug_str	00000000 
000002c7 l       .debug_str	00000000 
000002d7 l       .debug_str	00000000 
0000031c l       .debug_str	00000000 
00000389 l       .debug_str	00000000 
0000041f l       .debug_str	00000000 
000004de l       .debug_str	00000000 
000004e6 l       .debug_str	00000000 
000004eb l       .debug_str	00000000 
000004f1 l       .debug_str	00000000 
000004f5 l       .debug_str	00000000 
000004f9 l       .debug_str	00000000 
000004fc l       .debug_str	00000000 
00000525 l       .debug_str	00000000 
0000055b l       .debug_str	00000000 
0000055d l       .debug_str	00000000 
0000058a l       .debug_str	00000000 
0000058d l       .debug_str	00000000 
000005dd l       .debug_str	00000000 
0000063a l       .debug_str	00000000 
0000068e l       .debug_str	00000000 
00000705 l       .debug_str	00000000 
00000789 l       .debug_str	00000000 
00000804 l       .debug_str	00000000 
000008a2 l       .debug_str	00000000 
0000094d l       .debug_str	00000000 
000009ef l       .debug_str	00000000 
00000ab4 l       .debug_str	00000000 
00000b86 l       .debug_str	00000000 
00000c4f l       .debug_str	00000000 
00000d39 l       .debug_str	00000000 
00000e40 l       .debug_str	00000000 
00000f46 l       .debug_str	00000000 
00000f4a l       .debug_str	00000000 
00000f4c l       .debug_str	00000000 
0000104a l       .debug_str	00000000 
0000114b l       .debug_str	00000000 
0000114d l       .debug_str	00000000 
0000122d l       .debug_str	00000000 
00001327 l       .debug_str	00000000 
0000132c l       .debug_str	00000000 
00001331 l       .debug_str	00000000 
00001335 l       .debug_str	00000000 
00001346 l       .debug_str	00000000 
00001456 l       .debug_str	00000000 
00001465 l       .debug_str	00000000 
00001491 l       .debug_str	00000000 
000014d6 l       .debug_str	00000000 
0000150f l       .debug_str	00000000 
000015a6 l       .debug_str	00000000 
00001644 l       .debug_str	00000000 
000016ff l       .debug_str	00000000 
000017b9 l       .debug_str	00000000 
0000186b l       .debug_str	00000000 
00001900 l       .debug_str	00000000 
000019ac l       .debug_str	00000000 
000019b5 l       .debug_str	00000000 
000019ca l       .debug_str	00000000 
000019d3 l       .debug_str	00000000 
000019e2 l       .debug_str	00000000 
000019e8 l       .debug_str	00000000 
000019ed l       .debug_str	00000000 
000019f6 l       .debug_str	00000000 
000019f8 l       .debug_str	00000000 
000019fa l       .debug_str	00000000 
00001a04 l       .debug_str	00000000 
00001a0f l       .debug_str	00000000 
00001a16 l       .debug_str	00000000 
00001a1e l       .debug_str	00000000 
00001a2a l       .debug_str	00000000 
00001a31 l       .debug_str	00000000 
00001a39 l       .debug_str	00000000 
00001a41 l       .debug_str	00000000 
00001a48 l       .debug_str	00000000 
00001a5c l       .debug_str	00000000 
00001a68 l       .debug_str	00000000 
00001a74 l       .debug_str	00000000 
00001a7e l       .debug_str	00000000 
00001a87 l       .debug_str	00000000 
00001a90 l       .debug_str	00000000 
00001a99 l       .debug_str	00000000 
00001aa6 l       .debug_str	00000000 
00001ac9 l       .debug_str	00000000 
00001ad4 l       .debug_str	00000000 
00001aea l       .debug_str	00000000 
00001af5 l       .debug_str	00000000 
00001b00 l       .debug_str	00000000 
00001b11 l       .debug_str	00000000 
00001b26 l       .debug_str	00000000 
00001b2f l       .debug_str	00000000 
00001b64 l       .debug_str	00000000 
00001b70 l       .debug_str	00000000 
00001b79 l       .debug_str	00000000 
00001b7f l       .debug_str	00000000 
00001b8f l       .debug_str	00000000 
00001b9e l       .debug_str	00000000 
00001ba0 l       .debug_str	00000000 
00001bd9 l       .debug_str	00000000 
00001be0 l       .debug_str	00000000 
00001be7 l       .debug_str	00000000 
00001bf8 l       .debug_str	00000000 
00001c37 l       .debug_str	00000000 
00001c6a l       .debug_str	00000000 
00001cf5 l       .debug_str	00000000 
00001dcc l       .debug_str	00000000 
00001eef l       .debug_str	00000000 
00001f66 l       .debug_str	00000000 
00001fea l       .debug_str	00000000 
00002065 l       .debug_str	00000000 
00002103 l       .debug_str	00000000 
000021ae l       .debug_str	00000000 
00002250 l       .debug_str	00000000 
00002336 l       .debug_str	00000000 
00002439 l       .debug_str	00000000 
0000253b l       .debug_str	00000000 
00002635 l       .debug_str	00000000 
00002712 l       .debug_str	00000000 
0000271c l       .debug_str	00000000 
00002743 l       .debug_str	00000000 
00002745 l       .debug_str	00000000 
00002780 l       .debug_str	00000000 
000027cf l       .debug_str	00000000 
00002814 l       .debug_str	00000000 
00002825 l       .debug_str	00000000 
00002870 l       .debug_str	00000000 
00000000 l    d  .text._ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E	00000000 .text._ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E
00000000 l    d  .text._ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E	00000000 .text._ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E
00000000 l    d  .text._ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E	00000000 .text._ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E
00000000 l    d  .text._ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE	00000000 .text._ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E	00000018 _ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E
00000000 g     F .text._ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E	00000024 _ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E
00000000 g     F .text._ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E	00000016 _ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E
00000000 g     F .text._ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE	0000002a _ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE



Disassembly of section .text._ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E:

00000000 <_ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E>:
_ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E():
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:141
    /// [`Widget`] for this window.
    ///
    /// It is possible that a `WindowDesc` can be reused to launch multiple windows.
    ///
    /// [`Widget`]: trait.Widget.html
    pub fn new<W, F>(root: F) -> WindowDesc<T>
   0:	b085      	sub	sp, #20
   2:	2000      	movs	r0, #0
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:150
    {
        // wrap this closure in another closure that dyns the result
        // this just makes our API slightly cleaner; callers don't need to explicitly box.
        ////let root_builder: Arc<WidgetBuilderFn<T>> = Arc::new(move || Box::new(root()));
        WindowDesc {
            _todo: None,
   4:	9003      	str	r0, [sp, #12]
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:149
        WindowDesc {
   6:	9803      	ldr	r0, [sp, #12]
   8:	9904      	ldr	r1, [sp, #16]
   a:	9001      	str	r0, [sp, #4]
   c:	9102      	str	r1, [sp, #8]
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:159
            size: None,
            menu: MenuDesc::platform_default(),
            id: WindowId::next(),
            */
        }
    }
   e:	e7ff      	b.n	10 <_ZN5druid3app19WindowDesc$LT$T$GT$3new17h1692add99307ff33E+0x10>
  10:	9801      	ldr	r0, [sp, #4]
  12:	9902      	ldr	r1, [sp, #8]
  14:	b005      	add	sp, #20
  16:	4770      	bx	lr

Disassembly of section .text._ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E:

00000000 <_ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E>:
_ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E():
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:70
    pub fn with_window(window: WindowDesc<T>) -> Self {
   0:	b088      	sub	sp, #32
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9002      	str	r0, [sp, #8]
   8:	9103      	str	r1, [sp, #12]
   a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:72
            _todo: None,
   c:	9006      	str	r0, [sp, #24]
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:71
        AppLauncher {
   e:	9806      	ldr	r0, [sp, #24]
  10:	9907      	ldr	r1, [sp, #28]
  12:	9004      	str	r0, [sp, #16]
  14:	9105      	str	r1, [sp, #20]
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:79
    }
  16:	9201      	str	r2, [sp, #4]
  18:	9300      	str	r3, [sp, #0]
  1a:	e7ff      	b.n	1c <_ZN5druid3app20AppLauncher$LT$T$GT$11with_window17hd5f88df3d20562c2E+0x1c>
  1c:	9804      	ldr	r0, [sp, #16]
  1e:	9905      	ldr	r1, [sp, #20]
  20:	b008      	add	sp, #32
  22:	4770      	bx	lr

Disassembly of section .text._ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E:

00000000 <_ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E>:
_ZN5druid3app20AppLauncher$LT$T$GT$17use_simple_logger17h20a6dd4b01da0cc6E():
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:103
    pub fn use_simple_logger(self) -> Self {
   0:	b084      	sub	sp, #16
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9002      	str	r0, [sp, #8]
   8:	9103      	str	r1, [sp, #12]
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:105
        self
   a:	9802      	ldr	r0, [sp, #8]
   c:	9903      	ldr	r1, [sp, #12]
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:106
    }
   e:	9201      	str	r2, [sp, #4]
  10:	9300      	str	r3, [sp, #0]
  12:	b004      	add	sp, #16
  14:	4770      	bx	lr

Disassembly of section .text._ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE:

00000000 <_ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE>:
_ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE():
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:112
    pub fn launch(mut self, data: T) -> Result<(), PlatformError> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b088      	sub	sp, #32
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9104      	str	r1, [sp, #16]
   e:	9205      	str	r2, [sp, #20]
  10:	9306      	str	r3, [sp, #24]
  12:	2100      	movs	r1, #0
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:130
        Ok(())
  14:	6001      	str	r1, [r0, #0]
/Users/Luppy/mynewt/druid-embedded/druid/src/app.rs:131
    }
  16:	f8cd c00c 	str.w	ip, [sp, #12]
  1a:	f8cd e008 	str.w	lr, [sp, #8]
  1e:	9401      	str	r4, [sp, #4]
  20:	9500      	str	r5, [sp, #0]
  22:	e7ff      	b.n	24 <_ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE+0x24>
  24:	e7ff      	b.n	26 <_ZN5druid3app20AppLauncher$LT$T$GT$6launch17hb37d516619a5dd1fE+0x26>
  26:	b008      	add	sp, #32
  28:	bdb0      	pop	{r4, r5, r7, pc}

app-9b7b12e8d5cbce98.48pkrwpcbpntplvj.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 48pkrwpcbpntplvj
000000bd l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
00000092 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3mem7size_of17ha670e8b105afdb72E	00000000 .text._ZN4core3mem7size_of17ha670e8b105afdb72E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3mem7size_of17ha670e8b105afdb72E	00000012 _ZN4core3mem7size_of17ha670e8b105afdb72E



Disassembly of section .text._ZN4core3mem7size_of17ha670e8b105afdb72E:

00000000 <_ZN4core3mem7size_of17ha670e8b105afdb72E>:
_ZN4core3mem7size_of17ha670e8b105afdb72E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:235
   0:	b082      	sub	sp, #8
   2:	2008      	movs	r0, #8
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:236
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	9000      	str	r0, [sp, #0]
   a:	e7ff      	b.n	c <_ZN4core3mem7size_of17ha670e8b105afdb72E+0xc>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:237
   c:	9800      	ldr	r0, [sp, #0]
   e:	b002      	add	sp, #8
  10:	4770      	bx	lr

app-9b7b12e8d5cbce98.4djg1kt2q51mwy2a.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4djg1kt2q51mwy2a
000000de l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
000000a7 l       .debug_str	00000000 
000000ae l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
000000b4 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E	00000000 .text._ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E	00000004 _ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E



Disassembly of section .text._ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E:

00000000 <_ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E>:
_ZN4core3ptr8null_mut17hc49ac7c76f12c1c0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:229
   0:	2000      	movs	r0, #0
   2:	4770      	bx	lr

app-9b7b12e8d5cbce98.4nj5x684xrrfo05s.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4nj5x684xrrfo05s
00000213 l       .debug_str	00000000 
000001fe l       .debug_str	00000000 
00000205 l       .debug_str	00000000 
00000209 l       .debug_str	00000000 
0000020e l       .debug_str	00000000 
00000218 l       .debug_str	00000000 
0000021c l       .debug_str	00000000 
00000229 l       .debug_str	00000000 
0000022e l       .debug_str	00000000 
00000260 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008f l       .debug_str	00000000 
00000098 l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000b3 l       .debug_str	00000000 
000000b7 l       .debug_str	00000000 
000000bf l       .debug_str	00000000 
000000c6 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000cc l       .debug_str	00000000 
000000dd l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
00000154 l       .debug_str	00000000 
0000016a l       .debug_str	00000000 
000001e7 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E	00000000 .text._ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E
00000000 l    d  .text._ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE	00000000 .text._ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core4iter6traits8iterator8Iterator3nth17h1d7126df6a14a513E
00000000 g     F .text._ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E	0000002e _ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E
00000000         *UND*	00000000 .hidden _ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E
00000000 g     F .text._ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE	00000040 _ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE



Disassembly of section .text._ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E:

00000000 <_ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E>:
_ZN4core4iter8adapters13Skip$LT$I$GT$3new17h21aa02133f2fe839E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1409
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b087      	sub	sp, #28
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9104      	str	r1, [sp, #16]
   e:	9205      	str	r2, [sp, #20]
  10:	9306      	str	r3, [sp, #24]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1410
  12:	9904      	ldr	r1, [sp, #16]
  14:	9a05      	ldr	r2, [sp, #20]
  16:	9b06      	ldr	r3, [sp, #24]
  18:	6001      	str	r1, [r0, #0]
  1a:	6042      	str	r2, [r0, #4]
  1c:	6083      	str	r3, [r0, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1411
  1e:	f8cd c00c 	str.w	ip, [sp, #12]
  22:	f8cd e008 	str.w	lr, [sp, #8]
  26:	9401      	str	r4, [sp, #4]
  28:	9500      	str	r5, [sp, #0]
  2a:	b007      	add	sp, #28
  2c:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE:

00000000 <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE>:
_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1419
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	4601      	mov	r1, r0
   6:	9001      	str	r0, [sp, #4]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1420
   8:	9801      	ldr	r0, [sp, #4]
   a:	6880      	ldr	r0, [r0, #8]
   c:	2800      	cmp	r0, #0
   e:	9100      	str	r1, [sp, #0]
  10:	d106      	bne.n	20 <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE+0x20>
  12:	e7ff      	b.n	14 <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE+0x14>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1421
  14:	9801      	ldr	r0, [sp, #4]
  16:	f7ff fffe 	bl	0 <_ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E>
  1a:	9002      	str	r0, [sp, #8]
  1c:	e7ff      	b.n	1e <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE+0x1e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1420
  1e:	e00c      	b.n	3a <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE+0x3a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1423
  20:	9801      	ldr	r0, [sp, #4]
  22:	6880      	ldr	r0, [r0, #8]
  24:	9003      	str	r0, [sp, #12]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1424
  26:	9801      	ldr	r0, [sp, #4]
  28:	2100      	movs	r1, #0
  2a:	6081      	str	r1, [r0, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1425
  2c:	9801      	ldr	r0, [sp, #4]
  2e:	9903      	ldr	r1, [sp, #12]
  30:	f7ff fffe 	bl	0 <_ZN4core4iter6traits8iterator8Iterator3nth17h1d7126df6a14a513E>
  34:	9002      	str	r0, [sp, #8]
  36:	e7ff      	b.n	38 <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE+0x38>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1420
  38:	e7ff      	b.n	3a <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE+0x3a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/mod.rs:1427
  3a:	9802      	ldr	r0, [sp, #8]
  3c:	b004      	add	sp, #16
  3e:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.4thgnvzmko4oxom3.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4thgnvzmko4oxom3
00001b5f l       .debug_str	00000000 
000023fe l       .debug_str	00000000 
00002405 l       .debug_str	00000000 
0000240d l       .debug_str	00000000 
0000242b l       .debug_str	00000000 
0000243b l       .debug_str	00000000 
0000246e l       .debug_str	00000000 
00002483 l       .debug_str	00000000 
00002496 l       .debug_str	00000000 
000024ab l       .debug_str	00000000 
000024b2 l       .debug_str	00000000 
000024c7 l       .debug_str	00000000 
000024f1 l       .debug_str	00000000 
000024f5 l       .debug_str	00000000 
000024fe l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000ad l       .debug_str	00000000 
000000b0 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c5 l       .debug_str	00000000 
000000cf l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000dc l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000e7 l       .debug_str	00000000 
000000ef l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
0000012b l       .debug_str	00000000 
00000132 l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
00000149 l       .debug_str	00000000 
00000154 l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
0000016c l       .debug_str	00000000 
00000174 l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
0000018a l       .debug_str	00000000 
00000194 l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001aa l       .debug_str	00000000 
000001b7 l       .debug_str	00000000 
000001c3 l       .debug_str	00000000 
000001d0 l       .debug_str	00000000 
000001de l       .debug_str	00000000 
000001e8 l       .debug_str	00000000 
000001f5 l       .debug_str	00000000 
00000201 l       .debug_str	00000000 
00000206 l       .debug_str	00000000 
0000020a l       .debug_str	00000000 
00000215 l       .debug_str	00000000 
00000220 l       .debug_str	00000000 
00000227 l       .debug_str	00000000 
00000266 l       .debug_str	00000000 
0000027c l       .debug_str	00000000 
00000280 l       .debug_str	00000000 
00000283 l       .debug_str	00000000 
00000286 l       .debug_str	00000000 
00000288 l       .debug_str	00000000 
0000028a l       .debug_str	00000000 
0000028e l       .debug_str	00000000 
000002b6 l       .debug_str	00000000 
000002bd l       .debug_str	00000000 
000002c0 l       .debug_str	00000000 
000002c9 l       .debug_str	00000000 
000002cf l       .debug_str	00000000 
000002d6 l       .debug_str	00000000 
000002d9 l       .debug_str	00000000 
000002e5 l       .debug_str	00000000 
000002ed l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
000002f9 l       .debug_str	00000000 
00000310 l       .debug_str	00000000 
0000036a l       .debug_str	00000000 
0000036f l       .debug_str	00000000 
000003d1 l       .debug_str	00000000 
000003dc l       .debug_str	00000000 
00000423 l       .debug_str	00000000 
00000472 l       .debug_str	00000000 
0000047c l       .debug_str	00000000 
000004b9 l       .debug_str	00000000 
000004fe l       .debug_str	00000000 
00000507 l       .debug_str	00000000 
00000517 l       .debug_str	00000000 
0000051f l       .debug_str	00000000 
00000574 l       .debug_str	00000000 
000005d1 l       .debug_str	00000000 
000005dd l       .debug_str	00000000 
000005e6 l       .debug_str	00000000 
000005f2 l       .debug_str	00000000 
000005fe l       .debug_str	00000000 
00000607 l       .debug_str	00000000 
0000060f l       .debug_str	00000000 
00000617 l       .debug_str	00000000 
00000621 l       .debug_str	00000000 
00000636 l       .debug_str	00000000 
0000063d l       .debug_str	00000000 
0000065d l       .debug_str	00000000 
00000664 l       .debug_str	00000000 
0000066c l       .debug_str	00000000 
00000676 l       .debug_str	00000000 
00000681 l       .debug_str	00000000 
0000068a l       .debug_str	00000000 
00000695 l       .debug_str	00000000 
000006a1 l       .debug_str	00000000 
000006a5 l       .debug_str	00000000 
000006ae l       .debug_str	00000000 
000006b5 l       .debug_str	00000000 
000006bd l       .debug_str	00000000 
000006c5 l       .debug_str	00000000 
000006cf l       .debug_str	00000000 
000006d5 l       .debug_str	00000000 
000006dc l       .debug_str	00000000 
000006e3 l       .debug_str	00000000 
00000710 l       .debug_str	00000000 
00000745 l       .debug_str	00000000 
0000074b l       .debug_str	00000000 
00000751 l       .debug_str	00000000 
00000760 l       .debug_str	00000000 
00000770 l       .debug_str	00000000 
00000780 l       .debug_str	00000000 
00000788 l       .debug_str	00000000 
000007b1 l       .debug_str	00000000 
0000080f l       .debug_str	00000000 
00000875 l       .debug_str	00000000 
0000087c l       .debug_str	00000000 
00000884 l       .debug_str	00000000 
0000088d l       .debug_str	00000000 
000008ab l       .debug_str	00000000 
000008bb l       .debug_str	00000000 
000008c9 l       .debug_str	00000000 
000008d4 l       .debug_str	00000000 
000008e1 l       .debug_str	00000000 
000008f0 l       .debug_str	00000000 
00000906 l       .debug_str	00000000 
00000910 l       .debug_str	00000000 
00000919 l       .debug_str	00000000 
00000922 l       .debug_str	00000000 
00000948 l       .debug_str	00000000 
0000095e l       .debug_str	00000000 
00000969 l       .debug_str	00000000 
0000097f l       .debug_str	00000000 
00000987 l       .debug_str	00000000 
000009a8 l       .debug_str	00000000 
000009bf l       .debug_str	00000000 
000009c4 l       .debug_str	00000000 
000009cc l       .debug_str	00000000 
000009d5 l       .debug_str	00000000 
000009de l       .debug_str	00000000 
000009e7 l       .debug_str	00000000 
000009ef l       .debug_str	00000000 
000009f3 l       .debug_str	00000000 
000009fa l       .debug_str	00000000 
00000a06 l       .debug_str	00000000 
00000a11 l       .debug_str	00000000 
00000a19 l       .debug_str	00000000 
00000a21 l       .debug_str	00000000 
00000a9d l       .debug_str	00000000 
00000b21 l       .debug_str	00000000 
00000c1d l       .debug_str	00000000 
00000d21 l       .debug_str	00000000 
00000d2f l       .debug_str	00000000 
00000d3a l       .debug_str	00000000 
00000d44 l       .debug_str	00000000 
00000d58 l       .debug_str	00000000 
00000d63 l       .debug_str	00000000 
00000d91 l       .debug_str	00000000 
00000e0c l       .debug_str	00000000 
00000e8f l       .debug_str	00000000 
00000e9d l       .debug_str	00000000 
00000efc l       .debug_str	00000000 
00000f63 l       .debug_str	00000000 
00000f79 l       .debug_str	00000000 
00000f89 l       .debug_str	00000000 
00000f98 l       .debug_str	00000000 
00000f9c l       .debug_str	00000000 
00000fa3 l       .debug_str	00000000 
00000fa9 l       .debug_str	00000000 
00000fad l       .debug_str	00000000 
00000fb3 l       .debug_str	00000000 
00000fb9 l       .debug_str	00000000 
00000fc5 l       .debug_str	00000000 
00000fcd l       .debug_str	00000000 
00000fd3 l       .debug_str	00000000 
00000fdb l       .debug_str	00000000 
00000fe1 l       .debug_str	00000000 
00001004 l       .debug_str	00000000 
00001014 l       .debug_str	00000000 
00001047 l       .debug_str	00000000 
00001087 l       .debug_str	00000000 
000010cf l       .debug_str	00000000 
000010d3 l       .debug_str	00000000 
000010d9 l       .debug_str	00000000 
000010df l       .debug_str	00000000 
000010e5 l       .debug_str	00000000 
000010f7 l       .debug_str	00000000 
0000112c l       .debug_str	00000000 
0000116e l       .debug_str	00000000 
000011b8 l       .debug_str	00000000 
000011bc l       .debug_str	00000000 
000011c2 l       .debug_str	00000000 
000011c8 l       .debug_str	00000000 
000011ce l       .debug_str	00000000 
000011e0 l       .debug_str	00000000 
00001215 l       .debug_str	00000000 
00001257 l       .debug_str	00000000 
000012a1 l       .debug_str	00000000 
000012a5 l       .debug_str	00000000 
000012ab l       .debug_str	00000000 
000012b1 l       .debug_str	00000000 
000012b7 l       .debug_str	00000000 
000012bd l       .debug_str	00000000 
000012ce l       .debug_str	00000000 
00001302 l       .debug_str	00000000 
00001343 l       .debug_str	00000000 
0000138c l       .debug_str	00000000 
00001391 l       .debug_str	00000000 
00001396 l       .debug_str	00000000 
0000139a l       .debug_str	00000000 
000013a0 l       .debug_str	00000000 
000013a6 l       .debug_str	00000000 
000013ac l       .debug_str	00000000 
000013bd l       .debug_str	00000000 
000013f1 l       .debug_str	00000000 
00001432 l       .debug_str	00000000 
0000147b l       .debug_str	00000000 
0000147f l       .debug_str	00000000 
00001488 l       .debug_str	00000000 
00001499 l       .debug_str	00000000 
000014cd l       .debug_str	00000000 
0000150e l       .debug_str	00000000 
00001557 l       .debug_str	00000000 
0000155c l       .debug_str	00000000 
00001560 l       .debug_str	00000000 
00001569 l       .debug_str	00000000 
00001570 l       .debug_str	00000000 
00001578 l       .debug_str	00000000 
0000158a l       .debug_str	00000000 
000015bf l       .debug_str	00000000 
00001601 l       .debug_str	00000000 
0000164b l       .debug_str	00000000 
0000164f l       .debug_str	00000000 
00001655 l       .debug_str	00000000 
0000165b l       .debug_str	00000000 
00001661 l       .debug_str	00000000 
00001667 l       .debug_str	00000000 
0000166f l       .debug_str	00000000 
0000167d l       .debug_str	00000000 
0000168c l       .debug_str	00000000 
0000169d l       .debug_str	00000000 
000016a8 l       .debug_str	00000000 
000016b3 l       .debug_str	00000000 
000016be l       .debug_str	00000000 
000016c5 l       .debug_str	00000000 
000016e8 l       .debug_str	00000000 
000016fa l       .debug_str	00000000 
0000172f l       .debug_str	00000000 
00001771 l       .debug_str	00000000 
000017bb l       .debug_str	00000000 
000017bf l       .debug_str	00000000 
000017c9 l       .debug_str	00000000 
000017db l       .debug_str	00000000 
00001810 l       .debug_str	00000000 
00001852 l       .debug_str	00000000 
0000189c l       .debug_str	00000000 
000018a1 l       .debug_str	00000000 
000018ab l       .debug_str	00000000 
000018bd l       .debug_str	00000000 
000018f2 l       .debug_str	00000000 
00001934 l       .debug_str	00000000 
0000197e l       .debug_str	00000000 
00001992 l       .debug_str	00000000 
00001996 l       .debug_str	00000000 
000019a4 l       .debug_str	00000000 
000019b4 l       .debug_str	00000000 
000019bd l       .debug_str	00000000 
000019c8 l       .debug_str	00000000 
000019d7 l       .debug_str	00000000 
000019ec l       .debug_str	00000000 
00001a1d l       .debug_str	00000000 
00001aba l       .debug_str	00000000 
00001b6a l       .debug_str	00000000 
00001b73 l       .debug_str	00000000 
00001b94 l       .debug_str	00000000 
00001ba7 l       .debug_str	00000000 
00001bdd l       .debug_str	00000000 
00001c60 l       .debug_str	00000000 
00001ceb l       .debug_str	00000000 
00001d07 l       .debug_str	00000000 
00001d53 l       .debug_str	00000000 
00001da7 l       .debug_str	00000000 
00001dc4 l       .debug_str	00000000 
00001dd8 l       .debug_str	00000000 
00001e24 l       .debug_str	00000000 
00001e78 l       .debug_str	00000000 
00001e8e l       .debug_str	00000000 
00001ea2 l       .debug_str	00000000 
00001ee9 l       .debug_str	00000000 
00001f38 l       .debug_str	00000000 
00001f41 l       .debug_str	00000000 
00001f4f l       .debug_str	00000000 
00001f80 l       .debug_str	00000000 
00001f86 l       .debug_str	00000000 
00001f8e l       .debug_str	00000000 
00001f95 l       .debug_str	00000000 
00001f9d l       .debug_str	00000000 
00001fa8 l       .debug_str	00000000 
00001fb0 l       .debug_str	00000000 
00001fbf l       .debug_str	00000000 
00001fc3 l       .debug_str	00000000 
00001fce l       .debug_str	00000000 
00001fda l       .debug_str	00000000 
00001fe5 l       .debug_str	00000000 
00001ff6 l       .debug_str	00000000 
00001ffc l       .debug_str	00000000 
00002004 l       .debug_str	00000000 
0000200b l       .debug_str	00000000 
00002015 l       .debug_str	00000000 
0000201d l       .debug_str	00000000 
00002025 l       .debug_str	00000000 
00002047 l       .debug_str	00000000 
00002052 l       .debug_str	00000000 
0000205e l       .debug_str	00000000 
00002066 l       .debug_str	00000000 
0000206f l       .debug_str	00000000 
0000207a l       .debug_str	00000000 
00002081 l       .debug_str	00000000 
0000208c l       .debug_str	00000000 
00002097 l       .debug_str	00000000 
000020a7 l       .debug_str	00000000 
000020b1 l       .debug_str	00000000 
000020b7 l       .debug_str	00000000 
000020d9 l       .debug_str	00000000 
00002111 l       .debug_str	00000000 
00002151 l       .debug_str	00000000 
00002158 l       .debug_str	00000000 
00002160 l       .debug_str	00000000 
00002177 l       .debug_str	00000000 
00002180 l       .debug_str	00000000 
00002190 l       .debug_str	00000000 
0000219f l       .debug_str	00000000 
000021a7 l       .debug_str	00000000 
000021ae l       .debug_str	00000000 
000021b6 l       .debug_str	00000000 
000021d4 l       .debug_str	00000000 
000021e4 l       .debug_str	00000000 
00002217 l       .debug_str	00000000 
0000222c l       .debug_str	00000000 
00002235 l       .debug_str	00000000 
00002292 l       .debug_str	00000000 
000022f7 l       .debug_str	00000000 
00002301 l       .debug_str	00000000 
00002311 l       .debug_str	00000000 
00002326 l       .debug_str	00000000 
0000232e l       .debug_str	00000000 
00002392 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.02815433f30225389b329e2b355c274a.1	0000000e .Lanon.02815433f30225389b329e2b355c274a.1
00000000 l     O .rodata..Lanon.02815433f30225389b329e2b355c274a.2	00000006 .Lanon.02815433f30225389b329e2b355c274a.2
00000000 l     O .rodata..Lanon.02815433f30225389b329e2b355c274a.4	0000000c .Lanon.02815433f30225389b329e2b355c274a.4
00000000 l     O .rodata._ZN3app10app_sensor13SENSOR_DEVICE17h7fd3313c84fbb6b2E	0000000c _ZN3app10app_sensor13SENSOR_DEVICE17h7fd3313c84fbb6b2E
00000000 l    d  .text._ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E	00000000 .text._ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E
00000000 l    d  .rodata..Lanon.02815433f30225389b329e2b355c274a.0	00000000 .rodata..Lanon.02815433f30225389b329e2b355c274a.0
00000000 l    d  .rodata._ZN3app10app_sensor13SENSOR_DEVICE17h7fd3313c84fbb6b2E	00000000 .rodata._ZN3app10app_sensor13SENSOR_DEVICE17h7fd3313c84fbb6b2E
00000000 l    d  .rodata..Lanon.02815433f30225389b329e2b355c274a.3	00000000 .rodata..Lanon.02815433f30225389b329e2b355c274a.3
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E	00000176 .hidden _ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E
00000000         *UND*	00000000 .hidden _ZN3app11app_network21aggregate_sensor_data17hf3311a85264fd6f3E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E
00000000         *UND*	00000000 _ZN6mynewt2hw10sensor_mgr14find_bydevname17h7fd6a37c54484babE
00000000         *UND*	00000000 _ZN6mynewt2hw6sensor17register_listener17hc0f73f95db8d44ccE
00000000         *UND*	00000000 _ZN6mynewt2hw6sensor19new_sensor_listener17h69b84da3289d11a1E
00000000         *UND*	00000000 _ZN6mynewt2hw6sensor8bindings16set_poll_rate_ms17hea1f72573f4b1a64E
00000000         *UND*	00000000 _ZN6mynewt3sys7console5print17ha056d3b92fa56924E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE
00000000         *UND*	00000000 _ZN99_$LT$mynewt..hw..sensor_mgr..SensorsByDevname$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcc62a5a8f3e5f2f9E



Disassembly of section .text._ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E:

00000000 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E>:
_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:46
///  Type of sensor: Raw temperature sensor (integer sensor values 0 to 4095)
const TEMP_SENSOR_TYPE: sensor_type_t = sensor::SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW;

///  Ask Mynewt to poll or read the temperature sensor and call `aggregate_sensor_data()`
///  Return `Ok()` if successful, else return `Err()` with `MynewtError` error code inside.
pub fn start_sensor_listener() -> MynewtResult<()>  {  //  Returns an error code upon error.
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b0bd      	sub	sp, #244	; 0xf4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:47
    console::print("Rust TMP poll\n");
   4:	f240 0000 	movw	r0, #0
   8:	f2c0 0000 	movt	r0, #0
   c:	210e      	movs	r1, #14
   e:	f7ff fffe 	bl	0 <_ZN6mynewt3sys7console5print17ha056d3b92fa56924E>
  12:	e7ff      	b.n	2 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:50

    //  Fetch the sensor by name.
    let sensor = sensor_mgr::find_bydevname(&SENSOR_DEVICE)
  14:	f240 0100 	movw	r1, #0
  18:	f2c0 0100 	movt	r1, #0
  1c:	a80d      	add	r0, sp, #52	; 0x34
  1e:	f7ff fffe 	bl	0 <_ZN6mynewt2hw10sensor_mgr14find_bydevname17h7fd6a37c54484babE>
  22:	e7ff      	b.n	24 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x24>
  24:	a80d      	add	r0, sp, #52	; 0x34
  26:	f7ff fffe 	bl	0 <_ZN99_$LT$mynewt..hw..sensor_mgr..SensorsByDevname$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcc62a5a8f3e5f2f9E>
  2a:	900a      	str	r0, [sp, #40]	; 0x28
  2c:	9109      	str	r1, [sp, #36]	; 0x24
  2e:	e7ff      	b.n	30 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x30>
  30:	f240 0200 	movw	r2, #0
  34:	f2c0 0200 	movt	r2, #0
  38:	2306      	movs	r3, #6
  3a:	980a      	ldr	r0, [sp, #40]	; 0x28
  3c:	9909      	ldr	r1, [sp, #36]	; 0x24
  3e:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6expect17h1138b371e5815a64E>
  42:	900c      	str	r0, [sp, #48]	; 0x30
  44:	e7ff      	b.n	46 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x46>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:55
        .next()             //  Fetch the first sensor that matches
        .expect("no TMP");  //  Stop if no sensor found

    //  At power on, we ask Mynewt to poll our temperature sensor every 10 seconds.
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;
  46:	f240 0000 	movw	r0, #0
  4a:	f2c0 0000 	movt	r0, #0
  4e:	f247 5130 	movw	r1, #30000	; 0x7530
  52:	f7ff fffe 	bl	0 <_ZN6mynewt2hw6sensor8bindings16set_poll_rate_ms17hea1f72573f4b1a64E>
  56:	9008      	str	r0, [sp, #32]
  58:	e7ff      	b.n	5a <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x5a>
  5a:	9808      	ldr	r0, [sp, #32]
  5c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
  60:	9011      	str	r0, [sp, #68]	; 0x44
  62:	e7ff      	b.n	64 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x64>
  64:	9811      	ldr	r0, [sp, #68]	; 0x44
  66:	1e41      	subs	r1, r0, #1
  68:	bf18      	it	ne
  6a:	2101      	movne	r1, #1
  6c:	2801      	cmp	r0, #1
  6e:	9107      	str	r1, [sp, #28]
  70:	d016      	beq.n	a0 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xa0>
  72:	e7ff      	b.n	74 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x74>
  74:	9807      	ldr	r0, [sp, #28]
  76:	2801      	cmp	r0, #1
  78:	d001      	beq.n	7e <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x7e>
  7a:	e7ff      	b.n	7c <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x7c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:69
    //  Register the Listener Function to be called with the polled sensor data.
    sensor::register_listener(sensor, listener) ? ;  //  `?` means in case of error, return error now.

    //  Return `Ok()` to indicate success.  This line should not end with a semicolon (;).
    Ok(())
  7c:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:55
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;
  7e:	9811      	ldr	r0, [sp, #68]	; 0x44
  80:	9012      	str	r0, [sp, #72]	; 0x48
  82:	9812      	ldr	r0, [sp, #72]	; 0x48
  84:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  88:	9006      	str	r0, [sp, #24]
  8a:	e7ff      	b.n	8c <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x8c>
  8c:	9806      	ldr	r0, [sp, #24]
  8e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
  92:	900b      	str	r0, [sp, #44]	; 0x2c
  94:	e7ff      	b.n	96 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x96>
  96:	e002      	b.n	9e <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x9e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:69
  98:	980b      	ldr	r0, [sp, #44]	; 0x2c
  9a:	b03d      	add	sp, #244	; 0xf4
  9c:	bdf0      	pop	{r4, r5, r6, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:55
    sensor::set_poll_rate_ms(&SENSOR_DEVICE, SENSOR_POLL_TIME) ? ;
  9e:	e7fb      	b.n	98 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x98>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:58
    let listener = sensor::new_sensor_listener(
  a0:	f240 0000 	movw	r0, #0
  a4:	f2c0 0000 	movt	r0, #0
  a8:	4669      	mov	r1, sp
  aa:	6008      	str	r0, [r1, #0]
  ac:	f240 0100 	movw	r1, #0
  b0:	f2c0 0100 	movt	r1, #0
  b4:	a822      	add	r0, sp, #136	; 0x88
  b6:	f04f 6280 	mov.w	r2, #67108864	; 0x4000000
  ba:	2300      	movs	r3, #0
  bc:	f7ff fffe 	bl	0 <_ZN6mynewt2hw6sensor19new_sensor_listener17h69b84da3289d11a1E>
  c0:	e7ff      	b.n	c2 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xc2>
  c2:	a81a      	add	r0, sp, #104	; 0x68
  c4:	a922      	add	r1, sp, #136	; 0x88
  c6:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h9aa807070cf9aedeE>
  ca:	e7ff      	b.n	cc <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xcc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:62
    ) ? ;
  cc:	981a      	ldr	r0, [sp, #104]	; 0x68
  ce:	2800      	cmp	r0, #0
  d0:	9005      	str	r0, [sp, #20]
  d2:	d012      	beq.n	fa <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xfa>
  d4:	e7ff      	b.n	d6 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xd6>
  d6:	9805      	ldr	r0, [sp, #20]
  d8:	2801      	cmp	r0, #1
  da:	d1cf      	bne.n	7c <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x7c>
  dc:	e7ff      	b.n	de <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xde>
  de:	981b      	ldr	r0, [sp, #108]	; 0x6c
  e0:	902b      	str	r0, [sp, #172]	; 0xac
  e2:	982b      	ldr	r0, [sp, #172]	; 0xac
  e4:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  e8:	9004      	str	r0, [sp, #16]
  ea:	e7ff      	b.n	ec <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xec>
  ec:	9804      	ldr	r0, [sp, #16]
  ee:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
  f2:	900b      	str	r0, [sp, #44]	; 0x2c
  f4:	e7ff      	b.n	f6 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xf6>
  f6:	e7ff      	b.n	f8 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xf8>
  f8:	e7d1      	b.n	9e <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x9e>
  fa:	a81a      	add	r0, sp, #104	; 0x68
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:58
    let listener = sensor::new_sensor_listener(
  fc:	3008      	adds	r0, #8
  fe:	a92c      	add	r1, sp, #176	; 0xb0
 100:	460a      	mov	r2, r1
 102:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
 106:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
 10a:	a814      	add	r0, sp, #80	; 0x50
 10c:	4602      	mov	r2, r0
 10e:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
 112:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:65
    sensor::register_listener(sensor, listener) ? ;  //  `?` means in case of error, return error now.
 116:	990c      	ldr	r1, [sp, #48]	; 0x30
 118:	aa34      	add	r2, sp, #208	; 0xd0
 11a:	4613      	mov	r3, r2
 11c:	e890 50f0 	ldmia.w	r0, {r4, r5, r6, r7, ip, lr}
 120:	e883 50f0 	stmia.w	r3, {r4, r5, r6, r7, ip, lr}
 124:	4608      	mov	r0, r1
 126:	4611      	mov	r1, r2
 128:	f7ff fffe 	bl	0 <_ZN6mynewt2hw6sensor17register_listener17hc0f73f95db8d44ccE>
 12c:	9003      	str	r0, [sp, #12]
 12e:	e7ff      	b.n	130 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x130>
 130:	9803      	ldr	r0, [sp, #12]
 132:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
 136:	9033      	str	r0, [sp, #204]	; 0xcc
 138:	e7ff      	b.n	13a <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x13a>
 13a:	9833      	ldr	r0, [sp, #204]	; 0xcc
 13c:	1e41      	subs	r1, r0, #1
 13e:	bf18      	it	ne
 140:	2101      	movne	r1, #1
 142:	2801      	cmp	r0, #1
 144:	9102      	str	r1, [sp, #8]
 146:	d011      	beq.n	16c <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x16c>
 148:	e7ff      	b.n	14a <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x14a>
 14a:	9802      	ldr	r0, [sp, #8]
 14c:	2801      	cmp	r0, #1
 14e:	d195      	bne.n	7c <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x7c>
 150:	e7ff      	b.n	152 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x152>
 152:	9833      	ldr	r0, [sp, #204]	; 0xcc
 154:	903a      	str	r0, [sp, #232]	; 0xe8
 156:	983a      	ldr	r0, [sp, #232]	; 0xe8
 158:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
 15c:	9001      	str	r0, [sp, #4]
 15e:	e7ff      	b.n	160 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x160>
 160:	9801      	ldr	r0, [sp, #4]
 162:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 166:	900b      	str	r0, [sp, #44]	; 0x2c
 168:	e7ff      	b.n	16a <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x16a>
 16a:	e7c5      	b.n	f8 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0xf8>
 16c:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:68
    Ok(())
 16e:	900b      	str	r0, [sp, #44]	; 0x2c
 170:	2001      	movs	r0, #1
 172:	900b      	str	r0, [sp, #44]	; 0x2c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/app_sensor.rs:69
 174:	e790      	b.n	98 <_ZN3app10app_sensor21start_sensor_listener17h1834b00f1893c612E+0x98>

app-9b7b12e8d5cbce98.4tsjyjq57vs1r4zn.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4tsjyjq57vs1r4zn
00000ef0 l       .debug_str	00000000 
00000f27 l       .debug_str	00000000 
00000f2d l       .debug_str	00000000 
00000f34 l       .debug_str	00000000 
00000f3e l       .debug_str	00000000 
00000f4c l       .debug_str	00000000 
00000f8c l       .debug_str	00000000 
00000f8e l       .debug_str	00000000 
00000f93 l       .debug_str	00000000 
00001002 l       .debug_str	00000000 
000010ae l       .debug_str	00000000 
0000119e l       .debug_str	00000000 
000011a9 l       .debug_str	00000000 
000011b3 l       .debug_str	00000000 
000011bc l       .debug_str	00000000 
000011c9 l       .debug_str	00000000 
00001202 l       .debug_str	00000000 
000012ae l       .debug_str	00000000 
0000136a l       .debug_str	00000000 
00001371 l       .debug_str	00000000 
00001378 l       .debug_str	00000000 
0000137f l       .debug_str	00000000 
00001383 l       .debug_str	00000000 
000013b9 l       .debug_str	00000000 
00001465 l       .debug_str	00000000 
0000151b l       .debug_str	00000000 
00001520 l       .debug_str	00000000 
00001539 l       .debug_str	00000000 
000015a7 l       .debug_str	00000000 
000015ab l       .debug_str	00000000 
000015ae l       .debug_str	00000000 
000015b6 l       .debug_str	00000000 
000015bb l       .debug_str	00000000 
000015c1 l       .debug_str	00000000 
000015c7 l       .debug_str	00000000 
000015cd l       .debug_str	00000000 
000015e1 l       .debug_str	00000000 
000015e9 l       .debug_str	00000000 
000015f0 l       .debug_str	00000000 
000015fe l       .debug_str	00000000 
0000160a l       .debug_str	00000000 
0000160d l       .debug_str	00000000 
00001610 l       .debug_str	00000000 
00001613 l       .debug_str	00000000 
00001616 l       .debug_str	00000000 
0000161e l       .debug_str	00000000 
00001624 l       .debug_str	00000000 
00001646 l       .debug_str	00000000 
00001648 l       .debug_str	00000000 
0000164a l       .debug_str	00000000 
00001650 l       .debug_str	00000000 
00001655 l       .debug_str	00000000 
00001661 l       .debug_str	00000000 
0000166d l       .debug_str	00000000 
0000167a l       .debug_str	00000000 
0000167f l       .debug_str	00000000 
0000168c l       .debug_str	00000000 
00001690 l       .debug_str	00000000 
00001707 l       .debug_str	00000000 
0000170e l       .debug_str	00000000 
00001717 l       .debug_str	00000000 
00001725 l       .debug_str	00000000 
0000173d l       .debug_str	00000000 
0000174b l       .debug_str	00000000 
00001780 l       .debug_str	00000000 
00001784 l       .debug_str	00000000 
00001790 l       .debug_str	00000000 
000017d1 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000090 l       .debug_str	00000000 
00000093 l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000b6 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000d3 l       .debug_str	00000000 
000000d8 l       .debug_str	00000000 
000000df l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
00000123 l       .debug_str	00000000 
0000012e l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
00000141 l       .debug_str	00000000 
0000014c l       .debug_str	00000000 
00000156 l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
0000016c l       .debug_str	00000000 
00000179 l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
00000192 l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
000001aa l       .debug_str	00000000 
000001b7 l       .debug_str	00000000 
000001c3 l       .debug_str	00000000 
000001cf l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e1 l       .debug_str	00000000 
000001e7 l       .debug_str	00000000 
000001ed l       .debug_str	00000000 
000001f4 l       .debug_str	00000000 
000001fa l       .debug_str	00000000 
00000200 l       .debug_str	00000000 
00000207 l       .debug_str	00000000 
0000020d l       .debug_str	00000000 
00000215 l       .debug_str	00000000 
0000021c l       .debug_str	00000000 
00000222 l       .debug_str	00000000 
00000228 l       .debug_str	00000000 
0000022e l       .debug_str	00000000 
00000234 l       .debug_str	00000000 
0000023a l       .debug_str	00000000 
00000241 l       .debug_str	00000000 
00000248 l       .debug_str	00000000 
00000250 l       .debug_str	00000000 
00000258 l       .debug_str	00000000 
00000260 l       .debug_str	00000000 
00000267 l       .debug_str	00000000 
0000026f l       .debug_str	00000000 
00000276 l       .debug_str	00000000 
0000027d l       .debug_str	00000000 
00000284 l       .debug_str	00000000 
0000028b l       .debug_str	00000000 
00000292 l       .debug_str	00000000 
00000299 l       .debug_str	00000000 
0000029f l       .debug_str	00000000 
000002a5 l       .debug_str	00000000 
000002ab l       .debug_str	00000000 
000002b1 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002c0 l       .debug_str	00000000 
000002c8 l       .debug_str	00000000 
000002d4 l       .debug_str	00000000 
000002df l       .debug_str	00000000 
000002e4 l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
000002f8 l       .debug_str	00000000 
00000303 l       .debug_str	00000000 
0000030b l       .debug_str	00000000 
00000312 l       .debug_str	00000000 
0000031c l       .debug_str	00000000 
0000031f l       .debug_str	00000000 
00000323 l       .debug_str	00000000 
0000032e l       .debug_str	00000000 
00000332 l       .debug_str	00000000 
00000336 l       .debug_str	00000000 
0000033b l       .debug_str	00000000 
00000344 l       .debug_str	00000000 
00000347 l       .debug_str	00000000 
0000034b l       .debug_str	00000000 
0000034e l       .debug_str	00000000 
00000352 l       .debug_str	00000000 
00000355 l       .debug_str	00000000 
00000359 l       .debug_str	00000000 
000003b6 l       .debug_str	00000000 
000003bf l       .debug_str	00000000 
000003ca l       .debug_str	00000000 
000003d5 l       .debug_str	00000000 
000003e3 l       .debug_str	00000000 
000003e8 l       .debug_str	00000000 
00000424 l       .debug_str	00000000 
00000443 l       .debug_str	00000000 
0000044a l       .debug_str	00000000 
0000044f l       .debug_str	00000000 
00000451 l       .debug_str	00000000 
00000456 l       .debug_str	00000000 
0000045a l       .debug_str	00000000 
00000465 l       .debug_str	00000000 
000004b3 l       .debug_str	00000000 
00000512 l       .debug_str	00000000 
0000057e l       .debug_str	00000000 
000005de l       .debug_str	00000000 
0000064a l       .debug_str	00000000 
000006b6 l       .debug_str	00000000 
00000704 l       .debug_str	00000000 
00000763 l       .debug_str	00000000 
000007cf l       .debug_str	00000000 
0000083b l       .debug_str	00000000 
00000889 l       .debug_str	00000000 
000008e8 l       .debug_str	00000000 
00000939 l       .debug_str	00000000 
0000099b l       .debug_str	00000000 
00000a0a l       .debug_str	00000000 
00000a79 l       .debug_str	00000000 
00000acc l       .debug_str	00000000 
00000b30 l       .debug_str	00000000 
00000b86 l       .debug_str	00000000 
00000bed l       .debug_str	00000000 
00000c33 l       .debug_str	00000000 
00000c8b l       .debug_str	00000000 
00000c97 l       .debug_str	00000000 
00000c9d l       .debug_str	00000000 
00000ce4 l       .debug_str	00000000 
00000d5a l       .debug_str	00000000 
00000da6 l       .debug_str	00000000 
00000e04 l       .debug_str	00000000 
00000e16 l       .debug_str	00000000 
00000e1c l       .debug_str	00000000 
00000e29 l       .debug_str	00000000 
00000e2d l       .debug_str	00000000 
00000e33 l       .debug_str	00000000 
00000e42 l       .debug_str	00000000 
00000e46 l       .debug_str	00000000 
00000e4c l       .debug_str	00000000 
00000e51 l       .debug_str	00000000 
00000e5a l       .debug_str	00000000 
00000e64 l       .debug_str	00000000 
00000e6b l       .debug_str	00000000 
00000e71 l       .debug_str	00000000 
00000e76 l       .debug_str	00000000 
00000e7c l       .debug_str	00000000 
00000e87 l       .debug_str	00000000 
00000e92 l       .debug_str	00000000 
00000e99 l       .debug_str	00000000 
00000ea0 l       .debug_str	00000000 
00000ed6 l       .debug_str	00000000 
00000ee3 l       .debug_str	00000000 
00000ef2 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.0	00000018 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.0
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.1	00000018 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.1
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.10	00000002 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.10
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.11	00000002 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.11
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.12	00000001 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.12
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.13	00000001 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.13
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.14	00000001 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.14
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.15	00000001 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.15
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.16	00000012 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.16
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.2	00000018 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.2
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.3	00000018 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.3
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.4	00000003 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.4
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.5	00000006 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.5
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.6	00000001 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.6
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.7	00000003 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.7
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.8	00000001 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.8
00000000 l     O .rodata..Lanon.721c6c037cc9fc2fcae1c5829b0365e0.9	00000002 .Lanon.721c6c037cc9fc2fcae1c5829b0365e0.9
00000000 l     O .rodata.str.0	00000058 str.0
00000000 l     O .rodata.str.1	0000001c str.1
00000000 l    d  .text._ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE	00000000 .text._ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E
00000000 l    d  .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE	00000000 .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE
00000000 l    d  .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E	00000000 .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E
00000000 l    d  .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E	00000000 .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E
00000000 l    d  .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE	00000000 .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE
00000000 l    d  .rodata.str.0	00000000 .rodata.str.0
00000000 l    d  .rodata.str.1	00000000 .rodata.str.1
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE
00000000 g     F .text._ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE	0000003c _ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E	000000ca _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE	0000000e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E	0000000e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E	0000000e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE	0000008e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE	0000000e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE	0000000e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE	00000040 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE	00000172 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE	0000000e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E	0000000e _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE	0000013c _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E	00000262 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E	00000070 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E	00000748 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E
00000000 g     F .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE	000000ec _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE
00000000         *UND*	00000000 _ZN10st7735_lcd37_IMPL_NUM_ToPrimitive_FOR_Orientation83_$LT$impl$u20$num_traits..cast..ToPrimitive$u20$for$u20$st7735_lcd..Orientation$GT$6to_u6417h19dbecc7a21c32baE
00000000         *UND*	00000000 _ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E
00000000         *UND*	00000000 _ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE
00000000         *UND*	00000000 _ZN122_$LT$embedded_graphics..primitives..rectangle..Rectangle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h7d15a2b2844f81e9E
00000000         *UND*	00000000 _ZN127_$LT$embedded_graphics..primitives..rectangle..RectangleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h534698dbaf34ce31E
00000000         *UND*	00000000 _ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E
00000000         *UND*	00000000 _ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E
00000000 g     F .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E	000000c8 _ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E
00000000 g     F .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E	000000c8 _ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E
00000000 g     F .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE	000000c4 _ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE
00000000         *UND*	00000000 .hidden _ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E
00000000         *UND*	00000000 _ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE
00000000         *UND*	00000000 _ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E
00000000         *UND*	00000000 _ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E
00000000         *UND*	00000000 _ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE



Disassembly of section .text._ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE:

00000000 <_ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE>:
_ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:60
        self.to_u64().as_ref().and_then(ToPrimitive::to_usize)
    }

    /// Converts the value of `self` to an `u8`.
    #[inline]
    fn to_u8(&self) -> Option<u8> {
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4601      	mov	r1, r0
   6:	9005      	str	r0, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:61
        self.to_u64().as_ref().and_then(ToPrimitive::to_u8)
   8:	9805      	ldr	r0, [sp, #20]
   a:	9104      	str	r1, [sp, #16]
   c:	f7ff fffe 	bl	0 <_ZN10st7735_lcd37_IMPL_NUM_ToPrimitive_FOR_Orientation83_$LT$impl$u20$num_traits..cast..ToPrimitive$u20$for$u20$st7735_lcd..Orientation$GT$6to_u6417h19dbecc7a21c32baE>
  10:	9309      	str	r3, [sp, #36]	; 0x24
  12:	9208      	str	r2, [sp, #32]
  14:	9107      	str	r1, [sp, #28]
  16:	9006      	str	r0, [sp, #24]
  18:	e7ff      	b.n	1a <_ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE+0x1a>
  1a:	a806      	add	r0, sp, #24
  1c:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E>
  20:	9003      	str	r0, [sp, #12]
  22:	e7ff      	b.n	24 <_ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE+0x24>
  24:	9803      	ldr	r0, [sp, #12]
  26:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E>
  2a:	9002      	str	r0, [sp, #8]
  2c:	9101      	str	r1, [sp, #4]
  2e:	e7ff      	b.n	30 <_ZN10num_traits4cast11ToPrimitive5to_u817hf95ca494669afa8fE+0x30>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:62
    }
  30:	9802      	ldr	r0, [sp, #8]
  32:	f000 0001 	and.w	r0, r0, #1
  36:	9901      	ldr	r1, [sp, #4]
  38:	b00a      	add	sp, #40	; 0x28
  3a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:117
        self.write_command(Instruction::DISPON, None)?;
        delay.delay_ms(200);
        Ok(())
    }

    pub fn hard_reset(&mut self) -> Result<(), ()>
   0:	b580      	push	{r7, lr}
   2:	b092      	sub	sp, #72	; 0x48
   4:	4601      	mov	r1, r0
   6:	9009      	str	r0, [sp, #36]	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:119
    {
        self.rst.set_high().map_err(|_| ())?;
   8:	9809      	ldr	r0, [sp, #36]	; 0x24
   a:	300c      	adds	r0, #12
   c:	9108      	str	r1, [sp, #32]
   e:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E>
  12:	9007      	str	r0, [sp, #28]
  14:	e7ff      	b.n	16 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x16>
  16:	9807      	ldr	r0, [sp, #28]
  18:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h5c77443bfedfb83cE>
  1c:	9006      	str	r0, [sp, #24]
  1e:	e7ff      	b.n	20 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x20>
  20:	9806      	ldr	r0, [sp, #24]
  22:	f000 0001 	and.w	r0, r0, #1
  26:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  2a:	f88d 002b 	strb.w	r0, [sp, #43]	; 0x2b
  2e:	e7ff      	b.n	30 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x30>
  30:	f89d 002b 	ldrb.w	r0, [sp, #43]	; 0x2b
  34:	07c1      	lsls	r1, r0, #31
  36:	2900      	cmp	r1, #0
  38:	9005      	str	r0, [sp, #20]
  3a:	d012      	beq.n	62 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x62>
  3c:	e7ff      	b.n	3e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x3e>
  3e:	9805      	ldr	r0, [sp, #20]
  40:	2801      	cmp	r0, #1
  42:	d001      	beq.n	48 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x48>
  44:	e7ff      	b.n	46 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x46>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:122
        self.rst.set_low().map_err(|_| ())?;
        self.rst.set_high().map_err(|_| ())
    }
  46:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:119
        self.rst.set_high().map_err(|_| ())?;
  48:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  4c:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  4e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  52:	f88d 002a 	strb.w	r0, [sp, #42]	; 0x2a
  56:	e7ff      	b.n	58 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x58>
  58:	e7ff      	b.n	5a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x5a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:122
    }
  5a:	f89d 002a 	ldrb.w	r0, [sp, #42]	; 0x2a
  5e:	b012      	add	sp, #72	; 0x48
  60:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:120
        self.rst.set_low().map_err(|_| ())?;
  62:	9809      	ldr	r0, [sp, #36]	; 0x24
  64:	300c      	adds	r0, #12
  66:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE>
  6a:	9004      	str	r0, [sp, #16]
  6c:	e7ff      	b.n	6e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x6e>
  6e:	9804      	ldr	r0, [sp, #16]
  70:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hb7e6fc6680648a78E>
  74:	9003      	str	r0, [sp, #12]
  76:	e7ff      	b.n	78 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x78>
  78:	9803      	ldr	r0, [sp, #12]
  7a:	f000 0001 	and.w	r0, r0, #1
  7e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  82:	f88d 0037 	strb.w	r0, [sp, #55]	; 0x37
  86:	e7ff      	b.n	88 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x88>
  88:	f89d 0037 	ldrb.w	r0, [sp, #55]	; 0x37
  8c:	07c1      	lsls	r1, r0, #31
  8e:	2900      	cmp	r1, #0
  90:	9002      	str	r0, [sp, #8]
  92:	d00d      	beq.n	b0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0xb0>
  94:	e7ff      	b.n	96 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x96>
  96:	9802      	ldr	r0, [sp, #8]
  98:	2801      	cmp	r0, #1
  9a:	d1d4      	bne.n	46 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x46>
  9c:	e7ff      	b.n	9e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x9e>
  9e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  a2:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  a4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  a8:	f88d 002a 	strb.w	r0, [sp, #42]	; 0x2a
  ac:	e7ff      	b.n	ae <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0xae>
  ae:	e7d4      	b.n	5a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x5a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:121
        self.rst.set_high().map_err(|_| ())
  b0:	9809      	ldr	r0, [sp, #36]	; 0x24
  b2:	300c      	adds	r0, #12
  b4:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E>
  b8:	9001      	str	r0, [sp, #4]
  ba:	e7ff      	b.n	bc <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0xbc>
  bc:	9801      	ldr	r0, [sp, #4]
  be:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h95b0cfe2b4a22f9cE>
  c2:	f88d 002a 	strb.w	r0, [sp, #42]	; 0x2a
  c6:	e7ff      	b.n	c8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0xc8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:122
    }
  c8:	e7c7      	b.n	5a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset17h78d7d535024beec1E+0x5a>

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:120
        self.rst.set_low().map_err(|_| ())?;
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h5c8f3455109d94fbE+0xa>
   a:	b003      	add	sp, #12
   c:	4770      	bx	lr

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:119
        self.rst.set_high().map_err(|_| ())?;
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17h76042a1b6a6185d6E+0xa>
   a:	b003      	add	sp, #12
   c:	4770      	bx	lr

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:121
        self.rst.set_high().map_err(|_| ())
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10hard_reset28_$u7b$$u7b$closure$u7d$$u7d$17hcba8a47e0496bcc2E+0xa>
   a:	b003      	add	sp, #12
   c:	4770      	bx	lr

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:133
            self.write_data(params.unwrap())?;
        }
        Ok(())
    }

    fn write_data(&mut self, data: &[u8]) -> Result<(), ()> {
   0:	b580      	push	{r7, lr}
   2:	b090      	sub	sp, #64	; 0x40
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9008      	str	r0, [sp, #32]
   c:	9109      	str	r1, [sp, #36]	; 0x24
   e:	920a      	str	r2, [sp, #40]	; 0x28
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:134
        self.dc.set_high().map_err(|_| ())?;
  10:	9808      	ldr	r0, [sp, #32]
  12:	3008      	adds	r0, #8
  14:	9307      	str	r3, [sp, #28]
  16:	f8cd c018 	str.w	ip, [sp, #24]
  1a:	f8cd e014 	str.w	lr, [sp, #20]
  1e:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$8set_high17h4e4be0b543c342b8E>
  22:	9004      	str	r0, [sp, #16]
  24:	e7ff      	b.n	26 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x26>
  26:	9804      	ldr	r0, [sp, #16]
  28:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17hca3f14262bdcce1aE>
  2c:	9003      	str	r0, [sp, #12]
  2e:	e7ff      	b.n	30 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x30>
  30:	9803      	ldr	r0, [sp, #12]
  32:	f000 0001 	and.w	r0, r0, #1
  36:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  3a:	f88d 002f 	strb.w	r0, [sp, #47]	; 0x2f
  3e:	e7ff      	b.n	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x40>
  40:	f89d 002f 	ldrb.w	r0, [sp, #47]	; 0x2f
  44:	07c1      	lsls	r1, r0, #31
  46:	2900      	cmp	r1, #0
  48:	9002      	str	r0, [sp, #8]
  4a:	d012      	beq.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x72>
  4c:	e7ff      	b.n	4e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x4e>
  4e:	9802      	ldr	r0, [sp, #8]
  50:	2801      	cmp	r0, #1
  52:	d001      	beq.n	58 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x58>
  54:	e7ff      	b.n	56 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x56>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:136
        self.spi.write(data).map_err(|_| ())
    }
  56:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:134
        self.dc.set_high().map_err(|_| ())?;
  58:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  5c:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  5e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  62:	f88d 002e 	strb.w	r0, [sp, #46]	; 0x2e
  66:	e7ff      	b.n	68 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x68>
  68:	e7ff      	b.n	6a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x6a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:136
    }
  6a:	f89d 002e 	ldrb.w	r0, [sp, #46]	; 0x2e
  6e:	b010      	add	sp, #64	; 0x40
  70:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:135
        self.spi.write(data).map_err(|_| ())
  72:	9808      	ldr	r0, [sp, #32]
  74:	9909      	ldr	r1, [sp, #36]	; 0x24
  76:	9a0a      	ldr	r2, [sp, #40]	; 0x28
  78:	f7ff fffe 	bl	0 <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E>
  7c:	9001      	str	r0, [sp, #4]
  7e:	e7ff      	b.n	80 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x80>
  80:	9801      	ldr	r0, [sp, #4]
  82:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h13365c9d8dba676bE>
  86:	f88d 002e 	strb.w	r0, [sp, #46]	; 0x2e
  8a:	e7ff      	b.n	8c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x8c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:136
    }
  8c:	e7ed      	b.n	6a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data17h435fa651f62fbdbcE+0x6a>

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:134
        self.dc.set_high().map_err(|_| ())?;
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17haabc5de3be4dfc8aE+0xa>
   a:	b003      	add	sp, #12
   c:	4770      	bx	lr

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:135
        self.spi.write(data).map_err(|_| ())
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_data28_$u7b$$u7b$closure$u7d$$u7d$17hecb25957cd07415aE+0xa>
   a:	b003      	add	sp, #12
   c:	4770      	bx	lr

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:139

    /// Writes a data word to the display.
    fn write_word(&mut self, value: u16) -> Result<(), ()> {
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9004      	str	r0, [sp, #16]
   a:	f8ad 1014 	strh.w	r1, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:140
        let bytes: [u8; 2] = unsafe { transmute(value.to_be()) };
   e:	f8bd 0014 	ldrh.w	r0, [sp, #20]
  12:	9203      	str	r2, [sp, #12]
  14:	9302      	str	r3, [sp, #8]
  16:	f7ff fffe 	bl	0 <_ZN4core3num21_$LT$impl$u20$u16$GT$5to_be17he12204f441ca10cdE>
  1a:	9001      	str	r0, [sp, #4]
  1c:	e7ff      	b.n	1e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE+0x1e>
  1e:	9801      	ldr	r0, [sp, #4]
  20:	f8ad 0016 	strh.w	r0, [sp, #22]
  24:	e7ff      	b.n	26 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE+0x26>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:141
        self.write_data(&bytes)
  26:	9804      	ldr	r0, [sp, #16]
  28:	f10d 0116 	add.w	r1, sp, #22
  2c:	2202      	movs	r2, #2
  2e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE>
  32:	9000      	str	r0, [sp, #0]
  34:	e7ff      	b.n	36 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$10write_word17h232778019088608fE+0x36>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:142
    }
  36:	9800      	ldr	r0, [sp, #0]
  38:	f000 0001 	and.w	r0, r0, #1
  3c:	b006      	add	sp, #24
  3e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:124
    fn write_command(&mut self, command: Instruction, params: Option<&[u8]>) -> Result<(), ()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0a2      	sub	sp, #136	; 0x88
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	9014      	str	r0, [sp, #80]	; 0x50
   e:	f88d 1057 	strb.w	r1, [sp, #87]	; 0x57
  12:	9216      	str	r2, [sp, #88]	; 0x58
  14:	9317      	str	r3, [sp, #92]	; 0x5c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:125
        self.dc.set_low().map_err(|_| ())?;
  16:	9814      	ldr	r0, [sp, #80]	; 0x50
  18:	3008      	adds	r0, #8
  1a:	f8cd c04c 	str.w	ip, [sp, #76]	; 0x4c
  1e:	f8cd e048 	str.w	lr, [sp, #72]	; 0x48
  22:	9411      	str	r4, [sp, #68]	; 0x44
  24:	9510      	str	r5, [sp, #64]	; 0x40
  26:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE>
  2a:	900f      	str	r0, [sp, #60]	; 0x3c
  2c:	e7ff      	b.n	2e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x2e>
  2e:	980f      	ldr	r0, [sp, #60]	; 0x3c
  30:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h838f5153890d9501E>
  34:	900e      	str	r0, [sp, #56]	; 0x38
  36:	e7ff      	b.n	38 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x38>
  38:	980e      	ldr	r0, [sp, #56]	; 0x38
  3a:	f000 0001 	and.w	r0, r0, #1
  3e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  42:	f88d 0063 	strb.w	r0, [sp, #99]	; 0x63
  46:	e7ff      	b.n	48 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x48>
  48:	f89d 0063 	ldrb.w	r0, [sp, #99]	; 0x63
  4c:	07c1      	lsls	r1, r0, #31
  4e:	2900      	cmp	r1, #0
  50:	900d      	str	r0, [sp, #52]	; 0x34
  52:	d012      	beq.n	7a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x7a>
  54:	e7ff      	b.n	56 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x56>
  56:	980d      	ldr	r0, [sp, #52]	; 0x34
  58:	2801      	cmp	r0, #1
  5a:	d001      	beq.n	60 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x60>
  5c:	e7ff      	b.n	5e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x5e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:131
    }
  5e:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:125
        self.dc.set_low().map_err(|_| ())?;
  60:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  64:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  66:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  6a:	f88d 0062 	strb.w	r0, [sp, #98]	; 0x62
  6e:	e7ff      	b.n	70 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x70>
  70:	e7ff      	b.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x72>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:131
    }
  72:	f89d 0062 	ldrb.w	r0, [sp, #98]	; 0x62
  76:	b022      	add	sp, #136	; 0x88
  78:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:126
        self.spi.write(&[command.to_u8().unwrap()]).map_err(|_| ())?;
  7a:	9814      	ldr	r0, [sp, #80]	; 0x50
  7c:	f10d 0157 	add.w	r1, sp, #87	; 0x57
  80:	900c      	str	r0, [sp, #48]	; 0x30
  82:	4608      	mov	r0, r1
  84:	f7ff fffe 	bl	0 <_ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE>
  88:	900b      	str	r0, [sp, #44]	; 0x2c
  8a:	910a      	str	r1, [sp, #40]	; 0x28
  8c:	e7ff      	b.n	8e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x8e>
  8e:	980b      	ldr	r0, [sp, #44]	; 0x2c
  90:	f000 0001 	and.w	r0, r0, #1
  94:	990a      	ldr	r1, [sp, #40]	; 0x28
  96:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE>
  9a:	9009      	str	r0, [sp, #36]	; 0x24
  9c:	e7ff      	b.n	9e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x9e>
  9e:	9809      	ldr	r0, [sp, #36]	; 0x24
  a0:	f88d 006f 	strb.w	r0, [sp, #111]	; 0x6f
  a4:	f10d 016f 	add.w	r1, sp, #111	; 0x6f
  a8:	2201      	movs	r2, #1
  aa:	980c      	ldr	r0, [sp, #48]	; 0x30
  ac:	f7ff fffe 	bl	0 <_ZN91_$LT$app..mynewt_hal..MynewtSPI$u20$as$u20$embedded_hal..blocking..spi..Write$LT$u8$GT$$GT$5write17hc181d8a1ded35268E>
  b0:	9008      	str	r0, [sp, #32]
  b2:	e7ff      	b.n	b4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0xb4>
  b4:	9808      	ldr	r0, [sp, #32]
  b6:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h4f1dcf85ec7b89afE>
  ba:	9007      	str	r0, [sp, #28]
  bc:	e7ff      	b.n	be <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0xbe>
  be:	9807      	ldr	r0, [sp, #28]
  c0:	f000 0001 	and.w	r0, r0, #1
  c4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  c8:	f88d 006e 	strb.w	r0, [sp, #110]	; 0x6e
  cc:	e7ff      	b.n	ce <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0xce>
  ce:	f89d 006e 	ldrb.w	r0, [sp, #110]	; 0x6e
  d2:	07c1      	lsls	r1, r0, #31
  d4:	2900      	cmp	r1, #0
  d6:	9006      	str	r0, [sp, #24]
  d8:	d00d      	beq.n	f6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0xf6>
  da:	e7ff      	b.n	dc <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0xdc>
  dc:	9806      	ldr	r0, [sp, #24]
  de:	2801      	cmp	r0, #1
  e0:	d1bd      	bne.n	5e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x5e>
  e2:	e7ff      	b.n	e4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0xe4>
  e4:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  e8:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  ea:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  ee:	f88d 0062 	strb.w	r0, [sp, #98]	; 0x62
  f2:	e7ff      	b.n	f4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0xf4>
  f4:	e7bd      	b.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x72>
  f6:	a816      	add	r0, sp, #88	; 0x58
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:127
        if params.is_some() {
  f8:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$7is_some17h2b3680a6e34da84eE>
  fc:	9005      	str	r0, [sp, #20]
  fe:	e7ff      	b.n	100 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x100>
 100:	9805      	ldr	r0, [sp, #20]
 102:	07c1      	lsls	r1, r0, #31
 104:	2900      	cmp	r1, #0
 106:	d030      	beq.n	16a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x16a>
 108:	e7ff      	b.n	10a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x10a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:128
            self.write_data(params.unwrap())?;
 10a:	9814      	ldr	r0, [sp, #80]	; 0x50
 10c:	9916      	ldr	r1, [sp, #88]	; 0x58
 10e:	9a17      	ldr	r2, [sp, #92]	; 0x5c
 110:	9004      	str	r0, [sp, #16]
 112:	4608      	mov	r0, r1
 114:	4611      	mov	r1, r2
 116:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6unwrap17hd911a71707d0cbbdE>
 11a:	9003      	str	r0, [sp, #12]
 11c:	9102      	str	r1, [sp, #8]
 11e:	e7ff      	b.n	120 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x120>
 120:	9804      	ldr	r0, [sp, #16]
 122:	9903      	ldr	r1, [sp, #12]
 124:	9a02      	ldr	r2, [sp, #8]
 126:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE>
 12a:	9001      	str	r0, [sp, #4]
 12c:	e7ff      	b.n	12e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x12e>
 12e:	9801      	ldr	r0, [sp, #4]
 130:	f000 0001 	and.w	r0, r0, #1
 134:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 138:	f88d 007b 	strb.w	r0, [sp, #123]	; 0x7b
 13c:	e7ff      	b.n	13e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x13e>
 13e:	f89d 007b 	ldrb.w	r0, [sp, #123]	; 0x7b
 142:	07c1      	lsls	r1, r0, #31
 144:	2900      	cmp	r1, #0
 146:	9000      	str	r0, [sp, #0]
 148:	d00e      	beq.n	168 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x168>
 14a:	e7ff      	b.n	14c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x14c>
 14c:	9800      	ldr	r0, [sp, #0]
 14e:	2801      	cmp	r0, #1
 150:	f47f af85 	bne.w	5e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x5e>
 154:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 156:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 15a:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 15c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 160:	f88d 0062 	strb.w	r0, [sp, #98]	; 0x62
 164:	e7ff      	b.n	166 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x166>
 166:	e784      	b.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x72>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:127
        if params.is_some() {
 168:	e7ff      	b.n	16a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x16a>
 16a:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:130
        Ok(())
 16c:	f88d 0062 	strb.w	r0, [sp, #98]	; 0x62
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:131
    }
 170:	e77f      	b.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command17hf8f54921f09bec4cE+0x72>

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:126
        self.spi.write(&[command.to_u8().unwrap()]).map_err(|_| ())?;
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17hcb781cbffa49605bE+0xa>
   a:	b003      	add	sp, #12
   c:	4770      	bx	lr

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:125
        self.dc.set_low().map_err(|_| ())?;
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	e7ff      	b.n	a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$13write_command28_$u7b$$u7b$closure$u7d$$u7d$17he4d1a161adbf6d28E+0xa>
   a:	b003      	add	sp, #12
   c:	4770      	bx	lr

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:144

    pub fn set_orientation(&mut self, orientation: &Orientation) -> Result<(), ()> {
   0:	b580      	push	{r7, lr}
   2:	b09c      	sub	sp, #112	; 0x70
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	900e      	str	r0, [sp, #56]	; 0x38
   a:	910f      	str	r1, [sp, #60]	; 0x3c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:145
        if self.rgb {
   c:	980e      	ldr	r0, [sp, #56]	; 0x38
   e:	7d00      	ldrb	r0, [r0, #20]
  10:	07c0      	lsls	r0, r0, #31
  12:	2800      	cmp	r0, #0
  14:	920d      	str	r2, [sp, #52]	; 0x34
  16:	930c      	str	r3, [sp, #48]	; 0x30
  18:	d048      	beq.n	ac <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xac>
  1a:	e7ff      	b.n	1c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x1c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:146
            self.write_command(
  1c:	980e      	ldr	r0, [sp, #56]	; 0x38
  1e:	2136      	movs	r1, #54	; 0x36
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:147
                Instruction::MADCTL, Some(&[orientation.to_u8().unwrap()]
  20:	f88d 1043 	strb.w	r1, [sp, #67]	; 0x43
  24:	990f      	ldr	r1, [sp, #60]	; 0x3c
  26:	900b      	str	r0, [sp, #44]	; 0x2c
  28:	4608      	mov	r0, r1
  2a:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE>
  2e:	900a      	str	r0, [sp, #40]	; 0x28
  30:	9109      	str	r1, [sp, #36]	; 0x24
  32:	e7ff      	b.n	34 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x34>
  34:	980a      	ldr	r0, [sp, #40]	; 0x28
  36:	f000 0001 	and.w	r0, r0, #1
  3a:	9909      	ldr	r1, [sp, #36]	; 0x24
  3c:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE>
  40:	9008      	str	r0, [sp, #32]
  42:	e7ff      	b.n	44 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x44>
  44:	9808      	ldr	r0, [sp, #32]
  46:	f88d 004f 	strb.w	r0, [sp, #79]	; 0x4f
  4a:	f10d 014f 	add.w	r1, sp, #79	; 0x4f
  4e:	9111      	str	r1, [sp, #68]	; 0x44
  50:	2101      	movs	r1, #1
  52:	9112      	str	r1, [sp, #72]	; 0x48
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:146
            self.write_command(
  54:	9a11      	ldr	r2, [sp, #68]	; 0x44
  56:	9b12      	ldr	r3, [sp, #72]	; 0x48
  58:	f89d 1043 	ldrb.w	r1, [sp, #67]	; 0x43
  5c:	980b      	ldr	r0, [sp, #44]	; 0x2c
  5e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE>
  62:	9007      	str	r0, [sp, #28]
  64:	e7ff      	b.n	66 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x66>
  66:	9807      	ldr	r0, [sp, #28]
  68:	f000 0001 	and.w	r0, r0, #1
  6c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  70:	f88d 0042 	strb.w	r0, [sp, #66]	; 0x42
  74:	e7ff      	b.n	76 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x76>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:148
            ))?;
  76:	f89d 0042 	ldrb.w	r0, [sp, #66]	; 0x42
  7a:	07c1      	lsls	r1, r0, #31
  7c:	2900      	cmp	r1, #0
  7e:	9006      	str	r0, [sp, #24]
  80:	d013      	beq.n	aa <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xaa>
  82:	e7ff      	b.n	84 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x84>
  84:	9806      	ldr	r0, [sp, #24]
  86:	2801      	cmp	r0, #1
  88:	d001      	beq.n	8e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x8e>
  8a:	e7ff      	b.n	8c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x8c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:155
            self.write_command(
                Instruction::MADCTL, Some(&[orientation.to_u8().unwrap() | 0x08 ]
            ))?;
        }
        Ok(())
    }
  8c:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:148
            ))?;
  8e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  92:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  94:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  98:	f88d 0041 	strb.w	r0, [sp, #65]	; 0x41
  9c:	e7ff      	b.n	9e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x9e>
  9e:	e003      	b.n	a8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xa8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:155
    }
  a0:	f89d 0041 	ldrb.w	r0, [sp, #65]	; 0x41
  a4:	b01c      	add	sp, #112	; 0x70
  a6:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:148
            ))?;
  a8:	e7fa      	b.n	a0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xa0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:145
        if self.rgb {
  aa:	e043      	b.n	134 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x134>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:150
            self.write_command(
  ac:	980e      	ldr	r0, [sp, #56]	; 0x38
  ae:	2136      	movs	r1, #54	; 0x36
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:151
                Instruction::MADCTL, Some(&[orientation.to_u8().unwrap() | 0x08 ]
  b0:	f88d 1057 	strb.w	r1, [sp, #87]	; 0x57
  b4:	990f      	ldr	r1, [sp, #60]	; 0x3c
  b6:	9005      	str	r0, [sp, #20]
  b8:	4608      	mov	r0, r1
  ba:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE>
  be:	9004      	str	r0, [sp, #16]
  c0:	9103      	str	r1, [sp, #12]
  c2:	e7ff      	b.n	c4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xc4>
  c4:	9804      	ldr	r0, [sp, #16]
  c6:	f000 0001 	and.w	r0, r0, #1
  ca:	9903      	ldr	r1, [sp, #12]
  cc:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6unwrap17hfe61b06687fe004cE>
  d0:	9002      	str	r0, [sp, #8]
  d2:	e7ff      	b.n	d4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xd4>
  d4:	9802      	ldr	r0, [sp, #8]
  d6:	f040 0108 	orr.w	r1, r0, #8
  da:	f88d 1063 	strb.w	r1, [sp, #99]	; 0x63
  de:	f10d 0163 	add.w	r1, sp, #99	; 0x63
  e2:	9116      	str	r1, [sp, #88]	; 0x58
  e4:	2101      	movs	r1, #1
  e6:	9117      	str	r1, [sp, #92]	; 0x5c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:150
            self.write_command(
  e8:	9a16      	ldr	r2, [sp, #88]	; 0x58
  ea:	9b17      	ldr	r3, [sp, #92]	; 0x5c
  ec:	f89d 1057 	ldrb.w	r1, [sp, #87]	; 0x57
  f0:	9805      	ldr	r0, [sp, #20]
  f2:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE>
  f6:	9001      	str	r0, [sp, #4]
  f8:	e7ff      	b.n	fa <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xfa>
  fa:	9801      	ldr	r0, [sp, #4]
  fc:	f000 0001 	and.w	r0, r0, #1
 100:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 104:	f88d 0056 	strb.w	r0, [sp, #86]	; 0x56
 108:	e7ff      	b.n	10a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x10a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:152
            ))?;
 10a:	f89d 0056 	ldrb.w	r0, [sp, #86]	; 0x56
 10e:	07c1      	lsls	r1, r0, #31
 110:	2900      	cmp	r1, #0
 112:	9000      	str	r0, [sp, #0]
 114:	d00d      	beq.n	132 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x132>
 116:	e7ff      	b.n	118 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x118>
 118:	9800      	ldr	r0, [sp, #0]
 11a:	2801      	cmp	r0, #1
 11c:	d1b6      	bne.n	8c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x8c>
 11e:	e7ff      	b.n	120 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x120>
 120:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 124:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 126:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 12a:	f88d 0041 	strb.w	r0, [sp, #65]	; 0x41
 12e:	e7ff      	b.n	130 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x130>
 130:	e7ba      	b.n	a8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xa8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:145
        if self.rgb {
 132:	e7ff      	b.n	134 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0x134>
 134:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:154
        Ok(())
 136:	f88d 0041 	strb.w	r0, [sp, #65]	; 0x41
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:155
    }
 13a:	e7b1      	b.n	a0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE+0xa0>

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:164
        self.dx = dx;
        self.dy = dy;
    }

    /// Sets the address window for the display.
    fn set_address_window(&mut self, sx: u16, sy: u16, ex: u16, ey: u16) -> Result<(), ()> {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b0a8      	sub	sp, #160	; 0xa0
   4:	f8dd c0b0 	ldr.w	ip, [sp, #176]	; 0xb0
   8:	469e      	mov	lr, r3
   a:	4614      	mov	r4, r2
   c:	460d      	mov	r5, r1
   e:	4606      	mov	r6, r0
  10:	9016      	str	r0, [sp, #88]	; 0x58
  12:	f8ad 105c 	strh.w	r1, [sp, #92]	; 0x5c
  16:	f8ad 205e 	strh.w	r2, [sp, #94]	; 0x5e
  1a:	f8ad 3060 	strh.w	r3, [sp, #96]	; 0x60
  1e:	f8ad c062 	strh.w	ip, [sp, #98]	; 0x62
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:165
        self.write_command(Instruction::CASET, None)?;
  22:	9816      	ldr	r0, [sp, #88]	; 0x58
  24:	212a      	movs	r1, #42	; 0x2a
  26:	f88d 1067 	strb.w	r1, [sp, #103]	; 0x67
  2a:	2100      	movs	r1, #0
  2c:	911b      	str	r1, [sp, #108]	; 0x6c
  2e:	911a      	str	r1, [sp, #104]	; 0x68
  30:	911a      	str	r1, [sp, #104]	; 0x68
  32:	9a1a      	ldr	r2, [sp, #104]	; 0x68
  34:	9b1b      	ldr	r3, [sp, #108]	; 0x6c
  36:	f89d 1067 	ldrb.w	r1, [sp, #103]	; 0x67
  3a:	f8cd e054 	str.w	lr, [sp, #84]	; 0x54
  3e:	9414      	str	r4, [sp, #80]	; 0x50
  40:	9513      	str	r5, [sp, #76]	; 0x4c
  42:	9612      	str	r6, [sp, #72]	; 0x48
  44:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E>
  48:	9011      	str	r0, [sp, #68]	; 0x44
  4a:	e7ff      	b.n	4c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x4c>
  4c:	9811      	ldr	r0, [sp, #68]	; 0x44
  4e:	f000 0001 	and.w	r0, r0, #1
  52:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  56:	f88d 0066 	strb.w	r0, [sp, #102]	; 0x66
  5a:	e7ff      	b.n	5c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x5c>
  5c:	f89d 0066 	ldrb.w	r0, [sp, #102]	; 0x66
  60:	07c1      	lsls	r1, r0, #31
  62:	2900      	cmp	r1, #0
  64:	9010      	str	r0, [sp, #64]	; 0x40
  66:	d012      	beq.n	8e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x8e>
  68:	e7ff      	b.n	6a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x6a>
  6a:	9810      	ldr	r0, [sp, #64]	; 0x40
  6c:	2801      	cmp	r0, #1
  6e:	d001      	beq.n	74 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x74>
  70:	e7ff      	b.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x72>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:171
        self.write_word(sx + self.dx)?;
        self.write_word(ex + self.dx)?;
        self.write_command(Instruction::RASET, None)?;
        self.write_word(sy + self.dy)?;
        self.write_word(ey + self.dy)
    }
  72:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:165
        self.write_command(Instruction::CASET, None)?;
  74:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  78:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  7a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  7e:	f88d 0065 	strb.w	r0, [sp, #101]	; 0x65
  82:	e7ff      	b.n	84 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x84>
  84:	e7ff      	b.n	86 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x86>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:171
    }
  86:	f89d 0065 	ldrb.w	r0, [sp, #101]	; 0x65
  8a:	b028      	add	sp, #160	; 0xa0
  8c:	bd70      	pop	{r4, r5, r6, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:166
        self.write_word(sx + self.dx)?;
  8e:	9816      	ldr	r0, [sp, #88]	; 0x58
  90:	f8bd 105c 	ldrh.w	r1, [sp, #92]	; 0x5c
  94:	8a02      	ldrh	r2, [r0, #16]
  96:	4411      	add	r1, r2
  98:	b28a      	uxth	r2, r1
  9a:	460b      	mov	r3, r1
  9c:	428a      	cmp	r2, r1
  9e:	900f      	str	r0, [sp, #60]	; 0x3c
  a0:	930e      	str	r3, [sp, #56]	; 0x38
  a2:	f040 80c2 	bne.w	22a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x22a>
  a6:	e7ff      	b.n	a8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0xa8>
  a8:	980f      	ldr	r0, [sp, #60]	; 0x3c
  aa:	990e      	ldr	r1, [sp, #56]	; 0x38
  ac:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E>
  b0:	900d      	str	r0, [sp, #52]	; 0x34
  b2:	e7ff      	b.n	b4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0xb4>
  b4:	980d      	ldr	r0, [sp, #52]	; 0x34
  b6:	f000 0001 	and.w	r0, r0, #1
  ba:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  be:	f88d 0077 	strb.w	r0, [sp, #119]	; 0x77
  c2:	e7ff      	b.n	c4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0xc4>
  c4:	f89d 0077 	ldrb.w	r0, [sp, #119]	; 0x77
  c8:	07c1      	lsls	r1, r0, #31
  ca:	2900      	cmp	r1, #0
  cc:	900c      	str	r0, [sp, #48]	; 0x30
  ce:	d00d      	beq.n	ec <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0xec>
  d0:	e7ff      	b.n	d2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0xd2>
  d2:	980c      	ldr	r0, [sp, #48]	; 0x30
  d4:	2801      	cmp	r0, #1
  d6:	d1cc      	bne.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x72>
  d8:	e7ff      	b.n	da <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0xda>
  da:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  de:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  e0:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  e4:	f88d 0065 	strb.w	r0, [sp, #101]	; 0x65
  e8:	e7ff      	b.n	ea <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0xea>
  ea:	e7cc      	b.n	86 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x86>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:167
        self.write_word(ex + self.dx)?;
  ec:	9816      	ldr	r0, [sp, #88]	; 0x58
  ee:	f8bd 1060 	ldrh.w	r1, [sp, #96]	; 0x60
  f2:	8a02      	ldrh	r2, [r0, #16]
  f4:	4411      	add	r1, r2
  f6:	b28a      	uxth	r2, r1
  f8:	460b      	mov	r3, r1
  fa:	428a      	cmp	r2, r1
  fc:	900b      	str	r0, [sp, #44]	; 0x2c
  fe:	930a      	str	r3, [sp, #40]	; 0x28
 100:	f040 809a 	bne.w	238 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x238>
 104:	e7ff      	b.n	106 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x106>
 106:	980b      	ldr	r0, [sp, #44]	; 0x2c
 108:	990a      	ldr	r1, [sp, #40]	; 0x28
 10a:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E>
 10e:	9009      	str	r0, [sp, #36]	; 0x24
 110:	e7ff      	b.n	112 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x112>
 112:	9809      	ldr	r0, [sp, #36]	; 0x24
 114:	f000 0001 	and.w	r0, r0, #1
 118:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 11c:	f88d 007f 	strb.w	r0, [sp, #127]	; 0x7f
 120:	e7ff      	b.n	122 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x122>
 122:	f89d 007f 	ldrb.w	r0, [sp, #127]	; 0x7f
 126:	07c1      	lsls	r1, r0, #31
 128:	2900      	cmp	r1, #0
 12a:	9008      	str	r0, [sp, #32]
 12c:	d00d      	beq.n	14a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x14a>
 12e:	e7ff      	b.n	130 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x130>
 130:	9808      	ldr	r0, [sp, #32]
 132:	2801      	cmp	r0, #1
 134:	d19d      	bne.n	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x72>
 136:	e7ff      	b.n	138 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x138>
 138:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 13c:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 13e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 142:	f88d 0065 	strb.w	r0, [sp, #101]	; 0x65
 146:	e7ff      	b.n	148 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x148>
 148:	e79d      	b.n	86 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x86>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:168
        self.write_command(Instruction::RASET, None)?;
 14a:	9816      	ldr	r0, [sp, #88]	; 0x58
 14c:	212b      	movs	r1, #43	; 0x2b
 14e:	f88d 1087 	strb.w	r1, [sp, #135]	; 0x87
 152:	2100      	movs	r1, #0
 154:	9123      	str	r1, [sp, #140]	; 0x8c
 156:	9122      	str	r1, [sp, #136]	; 0x88
 158:	9122      	str	r1, [sp, #136]	; 0x88
 15a:	9a22      	ldr	r2, [sp, #136]	; 0x88
 15c:	9b23      	ldr	r3, [sp, #140]	; 0x8c
 15e:	f89d 1087 	ldrb.w	r1, [sp, #135]	; 0x87
 162:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E>
 166:	9007      	str	r0, [sp, #28]
 168:	e7ff      	b.n	16a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x16a>
 16a:	9807      	ldr	r0, [sp, #28]
 16c:	f000 0001 	and.w	r0, r0, #1
 170:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 174:	f88d 0086 	strb.w	r0, [sp, #134]	; 0x86
 178:	e7ff      	b.n	17a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x17a>
 17a:	f89d 0086 	ldrb.w	r0, [sp, #134]	; 0x86
 17e:	07c1      	lsls	r1, r0, #31
 180:	2900      	cmp	r1, #0
 182:	9006      	str	r0, [sp, #24]
 184:	d00e      	beq.n	1a4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x1a4>
 186:	e7ff      	b.n	188 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x188>
 188:	9806      	ldr	r0, [sp, #24]
 18a:	2801      	cmp	r0, #1
 18c:	f47f af71 	bne.w	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x72>
 190:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 192:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 196:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 198:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 19c:	f88d 0065 	strb.w	r0, [sp, #101]	; 0x65
 1a0:	e7ff      	b.n	1a2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x1a2>
 1a2:	e770      	b.n	86 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x86>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:169
        self.write_word(sy + self.dy)?;
 1a4:	9816      	ldr	r0, [sp, #88]	; 0x58
 1a6:	f8bd 105e 	ldrh.w	r1, [sp, #94]	; 0x5e
 1aa:	8a42      	ldrh	r2, [r0, #18]
 1ac:	4411      	add	r1, r2
 1ae:	b28a      	uxth	r2, r1
 1b0:	460b      	mov	r3, r1
 1b2:	428a      	cmp	r2, r1
 1b4:	9005      	str	r0, [sp, #20]
 1b6:	9304      	str	r3, [sp, #16]
 1b8:	d145      	bne.n	246 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x246>
 1ba:	e7ff      	b.n	1bc <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x1bc>
 1bc:	9805      	ldr	r0, [sp, #20]
 1be:	9904      	ldr	r1, [sp, #16]
 1c0:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E>
 1c4:	9003      	str	r0, [sp, #12]
 1c6:	e7ff      	b.n	1c8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x1c8>
 1c8:	9803      	ldr	r0, [sp, #12]
 1ca:	f000 0001 	and.w	r0, r0, #1
 1ce:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 1d2:	f88d 0097 	strb.w	r0, [sp, #151]	; 0x97
 1d6:	e7ff      	b.n	1d8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x1d8>
 1d8:	f89d 0097 	ldrb.w	r0, [sp, #151]	; 0x97
 1dc:	07c1      	lsls	r1, r0, #31
 1de:	2900      	cmp	r1, #0
 1e0:	9002      	str	r0, [sp, #8]
 1e2:	d00e      	beq.n	202 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x202>
 1e4:	e7ff      	b.n	1e6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x1e6>
 1e6:	9802      	ldr	r0, [sp, #8]
 1e8:	2801      	cmp	r0, #1
 1ea:	f47f af42 	bne.w	72 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x72>
 1ee:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 1f0:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 1f4:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 1f6:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 1fa:	f88d 0065 	strb.w	r0, [sp, #101]	; 0x65
 1fe:	e7ff      	b.n	200 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x200>
 200:	e741      	b.n	86 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x86>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:170
        self.write_word(ey + self.dy)
 202:	9816      	ldr	r0, [sp, #88]	; 0x58
 204:	f8bd 1062 	ldrh.w	r1, [sp, #98]	; 0x62
 208:	8a42      	ldrh	r2, [r0, #18]
 20a:	4411      	add	r1, r2
 20c:	b28a      	uxth	r2, r1
 20e:	460b      	mov	r3, r1
 210:	428a      	cmp	r2, r1
 212:	9001      	str	r0, [sp, #4]
 214:	9300      	str	r3, [sp, #0]
 216:	d11d      	bne.n	254 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x254>
 218:	e7ff      	b.n	21a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x21a>
 21a:	9801      	ldr	r0, [sp, #4]
 21c:	9900      	ldr	r1, [sp, #0]
 21e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E>
 222:	f88d 0065 	strb.w	r0, [sp, #101]	; 0x65
 226:	e7ff      	b.n	228 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x228>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:171
    }
 228:	e72d      	b.n	86 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$18set_address_window17h3f03525f3b52ede4E+0x86>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:166
        self.write_word(sx + self.dx)?;
 22a:	f240 0000 	movw	r0, #0
 22e:	f2c0 0000 	movt	r0, #0
 232:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 236:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:167
        self.write_word(ex + self.dx)?;
 238:	f240 0000 	movw	r0, #0
 23c:	f2c0 0000 	movt	r0, #0
 240:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 244:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:169
        self.write_word(sy + self.dy)?;
 246:	f240 0000 	movw	r0, #0
 24a:	f2c0 0000 	movt	r0, #0
 24e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 252:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:170
        self.write_word(ey + self.dy)
 254:	f240 0000 	movw	r0, #0
 258:	f2c0 0000 	movt	r0, #0
 25c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 260:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:60
    pub fn new(
   0:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
   4:	b08f      	sub	sp, #60	; 0x3c
   6:	f8dd c064 	ldr.w	ip, [sp, #100]	; 0x64
   a:	f8dd e060 	ldr.w	lr, [sp, #96]	; 0x60
   e:	9c17      	ldr	r4, [sp, #92]	; 0x5c
  10:	461d      	mov	r5, r3
  12:	4616      	mov	r6, r2
  14:	460f      	mov	r7, r1
  16:	4680      	mov	r8, r0
  18:	9105      	str	r1, [sp, #20]
  1a:	9206      	str	r2, [sp, #24]
  1c:	9307      	str	r3, [sp, #28]
  1e:	f88d e022 	strb.w	lr, [sp, #34]	; 0x22
  22:	f88d c023 	strb.w	ip, [sp, #35]	; 0x23
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:69
            spi,
  26:	9905      	ldr	r1, [sp, #20]
  28:	9a06      	ldr	r2, [sp, #24]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:70
            dc,
  2a:	9b07      	ldr	r3, [sp, #28]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:71
            rst,
  2c:	f8dd c05c 	ldr.w	ip, [sp, #92]	; 0x5c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:72
            rgb,
  30:	f89d e022 	ldrb.w	lr, [sp, #34]	; 0x22
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:73
            inverted,
  34:	f89d 9023 	ldrb.w	r9, [sp, #35]	; 0x23
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:68
        let display = ST7735 {
  38:	9109      	str	r1, [sp, #36]	; 0x24
  3a:	920a      	str	r2, [sp, #40]	; 0x28
  3c:	930b      	str	r3, [sp, #44]	; 0x2c
  3e:	f8cd c030 	str.w	ip, [sp, #48]	; 0x30
  42:	f88d e038 	strb.w	lr, [sp, #56]	; 0x38
  46:	f88d 9039 	strb.w	r9, [sp, #57]	; 0x39
  4a:	2100      	movs	r1, #0
  4c:	f8ad 1034 	strh.w	r1, [sp, #52]	; 0x34
  50:	f8ad 1036 	strh.w	r1, [sp, #54]	; 0x36
  54:	a909      	add	r1, sp, #36	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:78
        display
  56:	e891 560c 	ldmia.w	r1, {r2, r3, r9, sl, ip, lr}
  5a:	e880 560c 	stmia.w	r0, {r2, r3, r9, sl, ip, lr}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:79
    }
  5e:	9404      	str	r4, [sp, #16]
  60:	9503      	str	r5, [sp, #12]
  62:	9602      	str	r6, [sp, #8]
  64:	9701      	str	r7, [sp, #4]
  66:	f8cd 8000 	str.w	r8, [sp]
  6a:	b00f      	add	sp, #60	; 0x3c
  6c:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:82
    pub fn init<DELAY>(&mut self, delay: &mut DELAY) -> Result<(), ()>
   0:	b580      	push	{r7, lr}
   2:	b0f6      	sub	sp, #472	; 0x1d8
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9028      	str	r0, [sp, #160]	; 0xa0
   a:	9129      	str	r1, [sp, #164]	; 0xa4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:85
        self.hard_reset()?;
   c:	9828      	ldr	r0, [sp, #160]	; 0xa0
   e:	9227      	str	r2, [sp, #156]	; 0x9c
  10:	9326      	str	r3, [sp, #152]	; 0x98
  12:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
  16:	9025      	str	r0, [sp, #148]	; 0x94
  18:	e7ff      	b.n	1a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x1a>
  1a:	9825      	ldr	r0, [sp, #148]	; 0x94
  1c:	f000 0001 	and.w	r0, r0, #1
  20:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  24:	f88d 00ab 	strb.w	r0, [sp, #171]	; 0xab
  28:	e7ff      	b.n	2a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x2a>
  2a:	f89d 00ab 	ldrb.w	r0, [sp, #171]	; 0xab
  2e:	07c1      	lsls	r1, r0, #31
  30:	2900      	cmp	r1, #0
  32:	9024      	str	r0, [sp, #144]	; 0x90
  34:	d012      	beq.n	5c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5c>
  36:	e7ff      	b.n	38 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x38>
  38:	9824      	ldr	r0, [sp, #144]	; 0x90
  3a:	2801      	cmp	r0, #1
  3c:	d001      	beq.n	42 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x42>
  3e:	e7ff      	b.n	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:115
    }
  40:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:85
        self.hard_reset()?;
  42:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  46:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  48:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  4c:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
  50:	e7ff      	b.n	52 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x52>
  52:	e7ff      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:115
    }
  54:	f89d 00aa 	ldrb.w	r0, [sp, #170]	; 0xaa
  58:	b076      	add	sp, #472	; 0x1d8
  5a:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:86
        self.write_command(Instruction::SWRESET, None)?;
  5c:	9828      	ldr	r0, [sp, #160]	; 0xa0
  5e:	2101      	movs	r1, #1
  60:	f88d 10b3 	strb.w	r1, [sp, #179]	; 0xb3
  64:	2100      	movs	r1, #0
  66:	912e      	str	r1, [sp, #184]	; 0xb8
  68:	912d      	str	r1, [sp, #180]	; 0xb4
  6a:	912d      	str	r1, [sp, #180]	; 0xb4
  6c:	9a2d      	ldr	r2, [sp, #180]	; 0xb4
  6e:	9b2e      	ldr	r3, [sp, #184]	; 0xb8
  70:	f89d 10b3 	ldrb.w	r1, [sp, #179]	; 0xb3
  74:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
  78:	9023      	str	r0, [sp, #140]	; 0x8c
  7a:	e7ff      	b.n	7c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x7c>
  7c:	9823      	ldr	r0, [sp, #140]	; 0x8c
  7e:	f000 0001 	and.w	r0, r0, #1
  82:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  86:	f88d 00b2 	strb.w	r0, [sp, #178]	; 0xb2
  8a:	e7ff      	b.n	8c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x8c>
  8c:	f89d 00b2 	ldrb.w	r0, [sp, #178]	; 0xb2
  90:	07c1      	lsls	r1, r0, #31
  92:	2900      	cmp	r1, #0
  94:	9022      	str	r0, [sp, #136]	; 0x88
  96:	d00d      	beq.n	b4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0xb4>
  98:	e7ff      	b.n	9a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x9a>
  9a:	9822      	ldr	r0, [sp, #136]	; 0x88
  9c:	2801      	cmp	r0, #1
  9e:	d1cf      	bne.n	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
  a0:	e7ff      	b.n	a2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0xa2>
  a2:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  a6:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  a8:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  ac:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
  b0:	e7ff      	b.n	b2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0xb2>
  b2:	e7cf      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:87
        delay.delay_ms(200);
  b4:	9829      	ldr	r0, [sp, #164]	; 0xa4
  b6:	21c8      	movs	r1, #200	; 0xc8
  b8:	f7ff fffe 	bl	0 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE>
  bc:	e7ff      	b.n	be <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0xbe>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:88
        self.write_command(Instruction::SLPOUT, None)?;
  be:	9828      	ldr	r0, [sp, #160]	; 0xa0
  c0:	2111      	movs	r1, #17
  c2:	f88d 10c3 	strb.w	r1, [sp, #195]	; 0xc3
  c6:	2100      	movs	r1, #0
  c8:	9132      	str	r1, [sp, #200]	; 0xc8
  ca:	9131      	str	r1, [sp, #196]	; 0xc4
  cc:	9131      	str	r1, [sp, #196]	; 0xc4
  ce:	9a31      	ldr	r2, [sp, #196]	; 0xc4
  d0:	9b32      	ldr	r3, [sp, #200]	; 0xc8
  d2:	f89d 10c3 	ldrb.w	r1, [sp, #195]	; 0xc3
  d6:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
  da:	9021      	str	r0, [sp, #132]	; 0x84
  dc:	e7ff      	b.n	de <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0xde>
  de:	9821      	ldr	r0, [sp, #132]	; 0x84
  e0:	f000 0001 	and.w	r0, r0, #1
  e4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  e8:	f88d 00c2 	strb.w	r0, [sp, #194]	; 0xc2
  ec:	e7ff      	b.n	ee <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0xee>
  ee:	f89d 00c2 	ldrb.w	r0, [sp, #194]	; 0xc2
  f2:	07c1      	lsls	r1, r0, #31
  f4:	2900      	cmp	r1, #0
  f6:	9020      	str	r0, [sp, #128]	; 0x80
  f8:	d00d      	beq.n	116 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x116>
  fa:	e7ff      	b.n	fc <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0xfc>
  fc:	9820      	ldr	r0, [sp, #128]	; 0x80
  fe:	2801      	cmp	r0, #1
 100:	d19e      	bne.n	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 102:	e7ff      	b.n	104 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x104>
 104:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 108:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 10a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 10e:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 112:	e7ff      	b.n	114 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x114>
 114:	e79e      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:89
        delay.delay_ms(200);
 116:	9829      	ldr	r0, [sp, #164]	; 0xa4
 118:	21c8      	movs	r1, #200	; 0xc8
 11a:	f7ff fffe 	bl	0 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE>
 11e:	e7ff      	b.n	120 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x120>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:90
        self.write_command(Instruction::FRMCTR1, Some(&[0x01, 0x2C, 0x2D]))?;
 120:	9828      	ldr	r0, [sp, #160]	; 0xa0
 122:	21b1      	movs	r1, #177	; 0xb1
 124:	f88d 10d3 	strb.w	r1, [sp, #211]	; 0xd3
 128:	f240 0100 	movw	r1, #0
 12c:	f2c0 0100 	movt	r1, #0
 130:	9135      	str	r1, [sp, #212]	; 0xd4
 132:	2103      	movs	r1, #3
 134:	9136      	str	r1, [sp, #216]	; 0xd8
 136:	9a35      	ldr	r2, [sp, #212]	; 0xd4
 138:	9b36      	ldr	r3, [sp, #216]	; 0xd8
 13a:	f89d 10d3 	ldrb.w	r1, [sp, #211]	; 0xd3
 13e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 142:	901f      	str	r0, [sp, #124]	; 0x7c
 144:	e7ff      	b.n	146 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x146>
 146:	981f      	ldr	r0, [sp, #124]	; 0x7c
 148:	f000 0001 	and.w	r0, r0, #1
 14c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 150:	f88d 00d2 	strb.w	r0, [sp, #210]	; 0xd2
 154:	e7ff      	b.n	156 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x156>
 156:	f89d 00d2 	ldrb.w	r0, [sp, #210]	; 0xd2
 15a:	07c1      	lsls	r1, r0, #31
 15c:	2900      	cmp	r1, #0
 15e:	901e      	str	r0, [sp, #120]	; 0x78
 160:	d00e      	beq.n	180 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x180>
 162:	e7ff      	b.n	164 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x164>
 164:	981e      	ldr	r0, [sp, #120]	; 0x78
 166:	2801      	cmp	r0, #1
 168:	f47f af6a 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 16c:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 16e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 172:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 174:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 178:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 17c:	e7ff      	b.n	17e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x17e>
 17e:	e769      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:91
        self.write_command(Instruction::FRMCTR2, Some(&[0x01, 0x2C, 0x2D]))?;
 180:	9828      	ldr	r0, [sp, #160]	; 0xa0
 182:	21b2      	movs	r1, #178	; 0xb2
 184:	f88d 10e3 	strb.w	r1, [sp, #227]	; 0xe3
 188:	f240 0100 	movw	r1, #0
 18c:	f2c0 0100 	movt	r1, #0
 190:	9139      	str	r1, [sp, #228]	; 0xe4
 192:	2103      	movs	r1, #3
 194:	913a      	str	r1, [sp, #232]	; 0xe8
 196:	9a39      	ldr	r2, [sp, #228]	; 0xe4
 198:	9b3a      	ldr	r3, [sp, #232]	; 0xe8
 19a:	f89d 10e3 	ldrb.w	r1, [sp, #227]	; 0xe3
 19e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 1a2:	901d      	str	r0, [sp, #116]	; 0x74
 1a4:	e7ff      	b.n	1a6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x1a6>
 1a6:	981d      	ldr	r0, [sp, #116]	; 0x74
 1a8:	f000 0001 	and.w	r0, r0, #1
 1ac:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 1b0:	f88d 00e2 	strb.w	r0, [sp, #226]	; 0xe2
 1b4:	e7ff      	b.n	1b6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x1b6>
 1b6:	f89d 00e2 	ldrb.w	r0, [sp, #226]	; 0xe2
 1ba:	07c1      	lsls	r1, r0, #31
 1bc:	2900      	cmp	r1, #0
 1be:	901c      	str	r0, [sp, #112]	; 0x70
 1c0:	d00e      	beq.n	1e0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x1e0>
 1c2:	e7ff      	b.n	1c4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x1c4>
 1c4:	981c      	ldr	r0, [sp, #112]	; 0x70
 1c6:	2801      	cmp	r0, #1
 1c8:	f47f af3a 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 1cc:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 1ce:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 1d2:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 1d4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 1d8:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 1dc:	e7ff      	b.n	1de <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x1de>
 1de:	e739      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:92
        self.write_command(Instruction::FRMCTR3,
 1e0:	9828      	ldr	r0, [sp, #160]	; 0xa0
 1e2:	21b3      	movs	r1, #179	; 0xb3
 1e4:	f88d 10f3 	strb.w	r1, [sp, #243]	; 0xf3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:93
            Some(&[0x01, 0x2C, 0x2D, 0x01, 0x2C, 0x2D]))?;
 1e8:	f240 0100 	movw	r1, #0
 1ec:	f2c0 0100 	movt	r1, #0
 1f0:	913d      	str	r1, [sp, #244]	; 0xf4
 1f2:	2106      	movs	r1, #6
 1f4:	913e      	str	r1, [sp, #248]	; 0xf8
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:92
        self.write_command(Instruction::FRMCTR3,
 1f6:	9a3d      	ldr	r2, [sp, #244]	; 0xf4
 1f8:	9b3e      	ldr	r3, [sp, #248]	; 0xf8
 1fa:	f89d 10f3 	ldrb.w	r1, [sp, #243]	; 0xf3
 1fe:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 202:	901b      	str	r0, [sp, #108]	; 0x6c
 204:	e7ff      	b.n	206 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x206>
 206:	981b      	ldr	r0, [sp, #108]	; 0x6c
 208:	f000 0001 	and.w	r0, r0, #1
 20c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 210:	f88d 00f2 	strb.w	r0, [sp, #242]	; 0xf2
 214:	e7ff      	b.n	216 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x216>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:93
            Some(&[0x01, 0x2C, 0x2D, 0x01, 0x2C, 0x2D]))?;
 216:	f89d 00f2 	ldrb.w	r0, [sp, #242]	; 0xf2
 21a:	07c1      	lsls	r1, r0, #31
 21c:	2900      	cmp	r1, #0
 21e:	901a      	str	r0, [sp, #104]	; 0x68
 220:	d00e      	beq.n	240 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x240>
 222:	e7ff      	b.n	224 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x224>
 224:	981a      	ldr	r0, [sp, #104]	; 0x68
 226:	2801      	cmp	r0, #1
 228:	f47f af0a 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 22c:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 22e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 232:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 234:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 238:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 23c:	e7ff      	b.n	23e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x23e>
 23e:	e709      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:94
        self.write_command(Instruction::INVCTR, Some(&[0x07]))?;
 240:	9828      	ldr	r0, [sp, #160]	; 0xa0
 242:	21b4      	movs	r1, #180	; 0xb4
 244:	f88d 1103 	strb.w	r1, [sp, #259]	; 0x103
 248:	f240 0100 	movw	r1, #0
 24c:	f2c0 0100 	movt	r1, #0
 250:	9141      	str	r1, [sp, #260]	; 0x104
 252:	2101      	movs	r1, #1
 254:	9142      	str	r1, [sp, #264]	; 0x108
 256:	9a41      	ldr	r2, [sp, #260]	; 0x104
 258:	9b42      	ldr	r3, [sp, #264]	; 0x108
 25a:	f89d 1103 	ldrb.w	r1, [sp, #259]	; 0x103
 25e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 262:	9019      	str	r0, [sp, #100]	; 0x64
 264:	e7ff      	b.n	266 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x266>
 266:	9819      	ldr	r0, [sp, #100]	; 0x64
 268:	f000 0001 	and.w	r0, r0, #1
 26c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 270:	f88d 0102 	strb.w	r0, [sp, #258]	; 0x102
 274:	e7ff      	b.n	276 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x276>
 276:	f89d 0102 	ldrb.w	r0, [sp, #258]	; 0x102
 27a:	07c1      	lsls	r1, r0, #31
 27c:	2900      	cmp	r1, #0
 27e:	9018      	str	r0, [sp, #96]	; 0x60
 280:	d00e      	beq.n	2a0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x2a0>
 282:	e7ff      	b.n	284 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x284>
 284:	9818      	ldr	r0, [sp, #96]	; 0x60
 286:	2801      	cmp	r0, #1
 288:	f47f aeda 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 28c:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 28e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 292:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 294:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 298:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 29c:	e7ff      	b.n	29e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x29e>
 29e:	e6d9      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:95
        self.write_command(Instruction::PWCTR1, Some(&[0xA2, 0x02, 0x84]))?;
 2a0:	9828      	ldr	r0, [sp, #160]	; 0xa0
 2a2:	21c0      	movs	r1, #192	; 0xc0
 2a4:	f88d 1113 	strb.w	r1, [sp, #275]	; 0x113
 2a8:	f240 0100 	movw	r1, #0
 2ac:	f2c0 0100 	movt	r1, #0
 2b0:	9145      	str	r1, [sp, #276]	; 0x114
 2b2:	2103      	movs	r1, #3
 2b4:	9146      	str	r1, [sp, #280]	; 0x118
 2b6:	9a45      	ldr	r2, [sp, #276]	; 0x114
 2b8:	9b46      	ldr	r3, [sp, #280]	; 0x118
 2ba:	f89d 1113 	ldrb.w	r1, [sp, #275]	; 0x113
 2be:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 2c2:	9017      	str	r0, [sp, #92]	; 0x5c
 2c4:	e7ff      	b.n	2c6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x2c6>
 2c6:	9817      	ldr	r0, [sp, #92]	; 0x5c
 2c8:	f000 0001 	and.w	r0, r0, #1
 2cc:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 2d0:	f88d 0112 	strb.w	r0, [sp, #274]	; 0x112
 2d4:	e7ff      	b.n	2d6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x2d6>
 2d6:	f89d 0112 	ldrb.w	r0, [sp, #274]	; 0x112
 2da:	07c1      	lsls	r1, r0, #31
 2dc:	2900      	cmp	r1, #0
 2de:	9016      	str	r0, [sp, #88]	; 0x58
 2e0:	d00e      	beq.n	300 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x300>
 2e2:	e7ff      	b.n	2e4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x2e4>
 2e4:	9816      	ldr	r0, [sp, #88]	; 0x58
 2e6:	2801      	cmp	r0, #1
 2e8:	f47f aeaa 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 2ec:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 2ee:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 2f2:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 2f4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 2f8:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 2fc:	e7ff      	b.n	2fe <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x2fe>
 2fe:	e6a9      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:96
        self.write_command(Instruction::PWCTR2, Some(&[0xC5]))?;
 300:	9828      	ldr	r0, [sp, #160]	; 0xa0
 302:	21c1      	movs	r1, #193	; 0xc1
 304:	f88d 1123 	strb.w	r1, [sp, #291]	; 0x123
 308:	f240 0100 	movw	r1, #0
 30c:	f2c0 0100 	movt	r1, #0
 310:	9149      	str	r1, [sp, #292]	; 0x124
 312:	2101      	movs	r1, #1
 314:	914a      	str	r1, [sp, #296]	; 0x128
 316:	9a49      	ldr	r2, [sp, #292]	; 0x124
 318:	9b4a      	ldr	r3, [sp, #296]	; 0x128
 31a:	f89d 1123 	ldrb.w	r1, [sp, #291]	; 0x123
 31e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 322:	9015      	str	r0, [sp, #84]	; 0x54
 324:	e7ff      	b.n	326 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x326>
 326:	9815      	ldr	r0, [sp, #84]	; 0x54
 328:	f000 0001 	and.w	r0, r0, #1
 32c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 330:	f88d 0122 	strb.w	r0, [sp, #290]	; 0x122
 334:	e7ff      	b.n	336 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x336>
 336:	f89d 0122 	ldrb.w	r0, [sp, #290]	; 0x122
 33a:	07c1      	lsls	r1, r0, #31
 33c:	2900      	cmp	r1, #0
 33e:	9014      	str	r0, [sp, #80]	; 0x50
 340:	d00e      	beq.n	360 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x360>
 342:	e7ff      	b.n	344 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x344>
 344:	9814      	ldr	r0, [sp, #80]	; 0x50
 346:	2801      	cmp	r0, #1
 348:	f47f ae7a 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 34c:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 34e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 352:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 354:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 358:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 35c:	e7ff      	b.n	35e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x35e>
 35e:	e679      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:97
        self.write_command(Instruction::PWCTR3, Some(&[0x0A, 0x00]))?;
 360:	9828      	ldr	r0, [sp, #160]	; 0xa0
 362:	21c2      	movs	r1, #194	; 0xc2
 364:	f88d 1133 	strb.w	r1, [sp, #307]	; 0x133
 368:	f240 0100 	movw	r1, #0
 36c:	f2c0 0100 	movt	r1, #0
 370:	914d      	str	r1, [sp, #308]	; 0x134
 372:	2102      	movs	r1, #2
 374:	914e      	str	r1, [sp, #312]	; 0x138
 376:	9a4d      	ldr	r2, [sp, #308]	; 0x134
 378:	9b4e      	ldr	r3, [sp, #312]	; 0x138
 37a:	f89d 1133 	ldrb.w	r1, [sp, #307]	; 0x133
 37e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 382:	9013      	str	r0, [sp, #76]	; 0x4c
 384:	e7ff      	b.n	386 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x386>
 386:	9813      	ldr	r0, [sp, #76]	; 0x4c
 388:	f000 0001 	and.w	r0, r0, #1
 38c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 390:	f88d 0132 	strb.w	r0, [sp, #306]	; 0x132
 394:	e7ff      	b.n	396 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x396>
 396:	f89d 0132 	ldrb.w	r0, [sp, #306]	; 0x132
 39a:	07c1      	lsls	r1, r0, #31
 39c:	2900      	cmp	r1, #0
 39e:	9012      	str	r0, [sp, #72]	; 0x48
 3a0:	d00e      	beq.n	3c0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x3c0>
 3a2:	e7ff      	b.n	3a4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x3a4>
 3a4:	9812      	ldr	r0, [sp, #72]	; 0x48
 3a6:	2801      	cmp	r0, #1
 3a8:	f47f ae4a 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 3ac:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 3ae:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 3b2:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 3b4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 3b8:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 3bc:	e7ff      	b.n	3be <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x3be>
 3be:	e649      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:98
        self.write_command(Instruction::PWCTR4, Some(&[0x8A, 0x2A]))?;
 3c0:	9828      	ldr	r0, [sp, #160]	; 0xa0
 3c2:	21c3      	movs	r1, #195	; 0xc3
 3c4:	f88d 1143 	strb.w	r1, [sp, #323]	; 0x143
 3c8:	f240 0100 	movw	r1, #0
 3cc:	f2c0 0100 	movt	r1, #0
 3d0:	9151      	str	r1, [sp, #324]	; 0x144
 3d2:	2102      	movs	r1, #2
 3d4:	9152      	str	r1, [sp, #328]	; 0x148
 3d6:	9a51      	ldr	r2, [sp, #324]	; 0x144
 3d8:	9b52      	ldr	r3, [sp, #328]	; 0x148
 3da:	f89d 1143 	ldrb.w	r1, [sp, #323]	; 0x143
 3de:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 3e2:	9011      	str	r0, [sp, #68]	; 0x44
 3e4:	e7ff      	b.n	3e6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x3e6>
 3e6:	9811      	ldr	r0, [sp, #68]	; 0x44
 3e8:	f000 0001 	and.w	r0, r0, #1
 3ec:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 3f0:	f88d 0142 	strb.w	r0, [sp, #322]	; 0x142
 3f4:	e7ff      	b.n	3f6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x3f6>
 3f6:	f89d 0142 	ldrb.w	r0, [sp, #322]	; 0x142
 3fa:	07c1      	lsls	r1, r0, #31
 3fc:	2900      	cmp	r1, #0
 3fe:	9010      	str	r0, [sp, #64]	; 0x40
 400:	d00e      	beq.n	420 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x420>
 402:	e7ff      	b.n	404 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x404>
 404:	9810      	ldr	r0, [sp, #64]	; 0x40
 406:	2801      	cmp	r0, #1
 408:	f47f ae1a 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 40c:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 40e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 412:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 414:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 418:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 41c:	e7ff      	b.n	41e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x41e>
 41e:	e619      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:99
        self.write_command(Instruction::PWCTR5, Some(&[0x8A, 0xEE]))?;
 420:	9828      	ldr	r0, [sp, #160]	; 0xa0
 422:	21c4      	movs	r1, #196	; 0xc4
 424:	f88d 1153 	strb.w	r1, [sp, #339]	; 0x153
 428:	f240 0100 	movw	r1, #0
 42c:	f2c0 0100 	movt	r1, #0
 430:	9155      	str	r1, [sp, #340]	; 0x154
 432:	2102      	movs	r1, #2
 434:	9156      	str	r1, [sp, #344]	; 0x158
 436:	9a55      	ldr	r2, [sp, #340]	; 0x154
 438:	9b56      	ldr	r3, [sp, #344]	; 0x158
 43a:	f89d 1153 	ldrb.w	r1, [sp, #339]	; 0x153
 43e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 442:	900f      	str	r0, [sp, #60]	; 0x3c
 444:	e7ff      	b.n	446 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x446>
 446:	980f      	ldr	r0, [sp, #60]	; 0x3c
 448:	f000 0001 	and.w	r0, r0, #1
 44c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 450:	f88d 0152 	strb.w	r0, [sp, #338]	; 0x152
 454:	e7ff      	b.n	456 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x456>
 456:	f89d 0152 	ldrb.w	r0, [sp, #338]	; 0x152
 45a:	07c1      	lsls	r1, r0, #31
 45c:	2900      	cmp	r1, #0
 45e:	900e      	str	r0, [sp, #56]	; 0x38
 460:	d00e      	beq.n	480 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x480>
 462:	e7ff      	b.n	464 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x464>
 464:	980e      	ldr	r0, [sp, #56]	; 0x38
 466:	2801      	cmp	r0, #1
 468:	f47f adea 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 46c:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 46e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 472:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 474:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 478:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 47c:	e7ff      	b.n	47e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x47e>
 47e:	e5e9      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:100
        self.write_command(Instruction::VMCTR1, Some(&[0x0E]))?;
 480:	9828      	ldr	r0, [sp, #160]	; 0xa0
 482:	21c5      	movs	r1, #197	; 0xc5
 484:	f88d 1163 	strb.w	r1, [sp, #355]	; 0x163
 488:	f240 0100 	movw	r1, #0
 48c:	f2c0 0100 	movt	r1, #0
 490:	9159      	str	r1, [sp, #356]	; 0x164
 492:	2101      	movs	r1, #1
 494:	915a      	str	r1, [sp, #360]	; 0x168
 496:	9a59      	ldr	r2, [sp, #356]	; 0x164
 498:	9b5a      	ldr	r3, [sp, #360]	; 0x168
 49a:	f89d 1163 	ldrb.w	r1, [sp, #355]	; 0x163
 49e:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 4a2:	900d      	str	r0, [sp, #52]	; 0x34
 4a4:	e7ff      	b.n	4a6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x4a6>
 4a6:	980d      	ldr	r0, [sp, #52]	; 0x34
 4a8:	f000 0001 	and.w	r0, r0, #1
 4ac:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 4b0:	f88d 0162 	strb.w	r0, [sp, #354]	; 0x162
 4b4:	e7ff      	b.n	4b6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x4b6>
 4b6:	f89d 0162 	ldrb.w	r0, [sp, #354]	; 0x162
 4ba:	07c1      	lsls	r1, r0, #31
 4bc:	2900      	cmp	r1, #0
 4be:	900c      	str	r0, [sp, #48]	; 0x30
 4c0:	d00e      	beq.n	4e0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x4e0>
 4c2:	e7ff      	b.n	4c4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x4c4>
 4c4:	980c      	ldr	r0, [sp, #48]	; 0x30
 4c6:	2801      	cmp	r0, #1
 4c8:	f47f adba 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 4cc:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 4ce:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 4d2:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 4d4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 4d8:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 4dc:	e7ff      	b.n	4de <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x4de>
 4de:	e5b9      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:101
        if self.inverted {
 4e0:	9828      	ldr	r0, [sp, #160]	; 0xa0
 4e2:	7d40      	ldrb	r0, [r0, #21]
 4e4:	07c0      	lsls	r0, r0, #31
 4e6:	2800      	cmp	r0, #0
 4e8:	d02f      	beq.n	54a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54a>
 4ea:	e7ff      	b.n	4ec <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x4ec>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:102
            self.write_command(Instruction::INVON, None)?;
 4ec:	9828      	ldr	r0, [sp, #160]	; 0xa0
 4ee:	2121      	movs	r1, #33	; 0x21
 4f0:	f88d 1173 	strb.w	r1, [sp, #371]	; 0x173
 4f4:	2100      	movs	r1, #0
 4f6:	915e      	str	r1, [sp, #376]	; 0x178
 4f8:	915d      	str	r1, [sp, #372]	; 0x174
 4fa:	915d      	str	r1, [sp, #372]	; 0x174
 4fc:	9a5d      	ldr	r2, [sp, #372]	; 0x174
 4fe:	9b5e      	ldr	r3, [sp, #376]	; 0x178
 500:	f89d 1173 	ldrb.w	r1, [sp, #371]	; 0x173
 504:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 508:	900b      	str	r0, [sp, #44]	; 0x2c
 50a:	e7ff      	b.n	50c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x50c>
 50c:	980b      	ldr	r0, [sp, #44]	; 0x2c
 50e:	f000 0001 	and.w	r0, r0, #1
 512:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 516:	f88d 0172 	strb.w	r0, [sp, #370]	; 0x172
 51a:	e7ff      	b.n	51c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x51c>
 51c:	f89d 0172 	ldrb.w	r0, [sp, #370]	; 0x172
 520:	07c1      	lsls	r1, r0, #31
 522:	2900      	cmp	r1, #0
 524:	900a      	str	r0, [sp, #40]	; 0x28
 526:	d00f      	beq.n	548 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x548>
 528:	e7ff      	b.n	52a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x52a>
 52a:	980a      	ldr	r0, [sp, #40]	; 0x28
 52c:	2801      	cmp	r0, #1
 52e:	f47f ad87 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 532:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 534:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 538:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 53a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 53e:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 542:	e7ff      	b.n	544 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x544>
 544:	e7ff      	b.n	546 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x546>
 546:	e585      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:101
        if self.inverted {
 548:	e02d      	b.n	5a6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5a6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:104
            self.write_command(Instruction::INVOFF, None)?;
 54a:	9828      	ldr	r0, [sp, #160]	; 0xa0
 54c:	2120      	movs	r1, #32
 54e:	f88d 1183 	strb.w	r1, [sp, #387]	; 0x183
 552:	2100      	movs	r1, #0
 554:	9162      	str	r1, [sp, #392]	; 0x188
 556:	9161      	str	r1, [sp, #388]	; 0x184
 558:	9161      	str	r1, [sp, #388]	; 0x184
 55a:	9a61      	ldr	r2, [sp, #388]	; 0x184
 55c:	9b62      	ldr	r3, [sp, #392]	; 0x188
 55e:	f89d 1183 	ldrb.w	r1, [sp, #387]	; 0x183
 562:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 566:	9009      	str	r0, [sp, #36]	; 0x24
 568:	e7ff      	b.n	56a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x56a>
 56a:	9809      	ldr	r0, [sp, #36]	; 0x24
 56c:	f000 0001 	and.w	r0, r0, #1
 570:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 574:	f88d 0182 	strb.w	r0, [sp, #386]	; 0x182
 578:	e7ff      	b.n	57a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x57a>
 57a:	f89d 0182 	ldrb.w	r0, [sp, #386]	; 0x182
 57e:	07c1      	lsls	r1, r0, #31
 580:	2900      	cmp	r1, #0
 582:	9008      	str	r0, [sp, #32]
 584:	d00e      	beq.n	5a4 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5a4>
 586:	e7ff      	b.n	588 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x588>
 588:	9808      	ldr	r0, [sp, #32]
 58a:	2801      	cmp	r0, #1
 58c:	f47f ad58 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 590:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 592:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 596:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 598:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 59c:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 5a0:	e7ff      	b.n	5a2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5a2>
 5a2:	e7d0      	b.n	546 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x546>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:101
        if self.inverted {
 5a4:	e7ff      	b.n	5a6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5a6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:106
        if self.rgb {
 5a6:	9828      	ldr	r0, [sp, #160]	; 0xa0
 5a8:	7d00      	ldrb	r0, [r0, #20]
 5aa:	07c0      	lsls	r0, r0, #31
 5ac:	2800      	cmp	r0, #0
 5ae:	d032      	beq.n	616 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x616>
 5b0:	e7ff      	b.n	5b2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5b2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:107
            self.write_command(Instruction::MADCTL, Some(&[0x00]))?;
 5b2:	9828      	ldr	r0, [sp, #160]	; 0xa0
 5b4:	2136      	movs	r1, #54	; 0x36
 5b6:	f88d 1193 	strb.w	r1, [sp, #403]	; 0x193
 5ba:	f240 0100 	movw	r1, #0
 5be:	f2c0 0100 	movt	r1, #0
 5c2:	9165      	str	r1, [sp, #404]	; 0x194
 5c4:	2101      	movs	r1, #1
 5c6:	9166      	str	r1, [sp, #408]	; 0x198
 5c8:	9a65      	ldr	r2, [sp, #404]	; 0x194
 5ca:	9b66      	ldr	r3, [sp, #408]	; 0x198
 5cc:	f89d 1193 	ldrb.w	r1, [sp, #403]	; 0x193
 5d0:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 5d4:	9007      	str	r0, [sp, #28]
 5d6:	e7ff      	b.n	5d8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5d8>
 5d8:	9807      	ldr	r0, [sp, #28]
 5da:	f000 0001 	and.w	r0, r0, #1
 5de:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 5e2:	f88d 0192 	strb.w	r0, [sp, #402]	; 0x192
 5e6:	e7ff      	b.n	5e8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5e8>
 5e8:	f89d 0192 	ldrb.w	r0, [sp, #402]	; 0x192
 5ec:	07c1      	lsls	r1, r0, #31
 5ee:	2900      	cmp	r1, #0
 5f0:	9006      	str	r0, [sp, #24]
 5f2:	d00f      	beq.n	614 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x614>
 5f4:	e7ff      	b.n	5f6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x5f6>
 5f6:	9806      	ldr	r0, [sp, #24]
 5f8:	2801      	cmp	r0, #1
 5fa:	f47f ad21 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 5fe:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 600:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 604:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 606:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 60a:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 60e:	e7ff      	b.n	610 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x610>
 610:	e7ff      	b.n	612 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x612>
 612:	e51f      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:106
        if self.rgb {
 614:	e030      	b.n	678 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x678>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:109
            self.write_command(Instruction::MADCTL, Some(&[0x08]))?;
 616:	9828      	ldr	r0, [sp, #160]	; 0xa0
 618:	2136      	movs	r1, #54	; 0x36
 61a:	f88d 11a3 	strb.w	r1, [sp, #419]	; 0x1a3
 61e:	f240 0100 	movw	r1, #0
 622:	f2c0 0100 	movt	r1, #0
 626:	9169      	str	r1, [sp, #420]	; 0x1a4
 628:	2101      	movs	r1, #1
 62a:	916a      	str	r1, [sp, #424]	; 0x1a8
 62c:	9a69      	ldr	r2, [sp, #420]	; 0x1a4
 62e:	9b6a      	ldr	r3, [sp, #424]	; 0x1a8
 630:	f89d 11a3 	ldrb.w	r1, [sp, #419]	; 0x1a3
 634:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 638:	9005      	str	r0, [sp, #20]
 63a:	e7ff      	b.n	63c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x63c>
 63c:	9805      	ldr	r0, [sp, #20]
 63e:	f000 0001 	and.w	r0, r0, #1
 642:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 646:	f88d 01a2 	strb.w	r0, [sp, #418]	; 0x1a2
 64a:	e7ff      	b.n	64c <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x64c>
 64c:	f89d 01a2 	ldrb.w	r0, [sp, #418]	; 0x1a2
 650:	07c1      	lsls	r1, r0, #31
 652:	2900      	cmp	r1, #0
 654:	9004      	str	r0, [sp, #16]
 656:	d00e      	beq.n	676 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x676>
 658:	e7ff      	b.n	65a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x65a>
 65a:	9804      	ldr	r0, [sp, #16]
 65c:	2801      	cmp	r0, #1
 65e:	f47f acef 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 662:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 664:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 668:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 66a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 66e:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 672:	e7ff      	b.n	674 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x674>
 674:	e7cd      	b.n	612 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x612>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:106
        if self.rgb {
 676:	e7ff      	b.n	678 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x678>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:111
        self.write_command(Instruction::COLMOD, Some(&[0x05]))?;
 678:	9828      	ldr	r0, [sp, #160]	; 0xa0
 67a:	213a      	movs	r1, #58	; 0x3a
 67c:	f88d 11b3 	strb.w	r1, [sp, #435]	; 0x1b3
 680:	f240 0100 	movw	r1, #0
 684:	f2c0 0100 	movt	r1, #0
 688:	916d      	str	r1, [sp, #436]	; 0x1b4
 68a:	2101      	movs	r1, #1
 68c:	916e      	str	r1, [sp, #440]	; 0x1b8
 68e:	9a6d      	ldr	r2, [sp, #436]	; 0x1b4
 690:	9b6e      	ldr	r3, [sp, #440]	; 0x1b8
 692:	f89d 11b3 	ldrb.w	r1, [sp, #435]	; 0x1b3
 696:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 69a:	9003      	str	r0, [sp, #12]
 69c:	e7ff      	b.n	69e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x69e>
 69e:	9803      	ldr	r0, [sp, #12]
 6a0:	f000 0001 	and.w	r0, r0, #1
 6a4:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 6a8:	f88d 01b2 	strb.w	r0, [sp, #434]	; 0x1b2
 6ac:	e7ff      	b.n	6ae <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x6ae>
 6ae:	f89d 01b2 	ldrb.w	r0, [sp, #434]	; 0x1b2
 6b2:	07c1      	lsls	r1, r0, #31
 6b4:	2900      	cmp	r1, #0
 6b6:	9002      	str	r0, [sp, #8]
 6b8:	d00e      	beq.n	6d8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x6d8>
 6ba:	e7ff      	b.n	6bc <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x6bc>
 6bc:	9802      	ldr	r0, [sp, #8]
 6be:	2801      	cmp	r0, #1
 6c0:	f47f acbe 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 6c4:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 6c6:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 6ca:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 6cc:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 6d0:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 6d4:	e7ff      	b.n	6d6 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x6d6>
 6d6:	e4bd      	b.n	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:112
        self.write_command(Instruction::DISPON, None)?;
 6d8:	9828      	ldr	r0, [sp, #160]	; 0xa0
 6da:	2129      	movs	r1, #41	; 0x29
 6dc:	f88d 11c3 	strb.w	r1, [sp, #451]	; 0x1c3
 6e0:	2100      	movs	r1, #0
 6e2:	9172      	str	r1, [sp, #456]	; 0x1c8
 6e4:	9171      	str	r1, [sp, #452]	; 0x1c4
 6e6:	9171      	str	r1, [sp, #452]	; 0x1c4
 6e8:	9a71      	ldr	r2, [sp, #452]	; 0x1c4
 6ea:	9b72      	ldr	r3, [sp, #456]	; 0x1c8
 6ec:	f89d 11c3 	ldrb.w	r1, [sp, #451]	; 0x1c3
 6f0:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 6f4:	9001      	str	r0, [sp, #4]
 6f6:	e7ff      	b.n	6f8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x6f8>
 6f8:	9801      	ldr	r0, [sp, #4]
 6fa:	f000 0001 	and.w	r0, r0, #1
 6fe:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 702:	f88d 01c2 	strb.w	r0, [sp, #450]	; 0x1c2
 706:	e7ff      	b.n	708 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x708>
 708:	f89d 01c2 	ldrb.w	r0, [sp, #450]	; 0x1c2
 70c:	07c1      	lsls	r1, r0, #31
 70e:	2900      	cmp	r1, #0
 710:	9000      	str	r0, [sp, #0]
 712:	d00f      	beq.n	734 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x734>
 714:	e7ff      	b.n	716 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x716>
 716:	9800      	ldr	r0, [sp, #0]
 718:	2801      	cmp	r0, #1
 71a:	f47f ac91 	bne.w	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x40>
 71e:	e7ff      	b.n	2 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E+0x2>
 720:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
 724:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
 726:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
 72a:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
 72e:	e7ff      	b.n	730 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x730>
 730:	f7ff bc90 	b.w	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:113
        delay.delay_ms(200);
 734:	9829      	ldr	r0, [sp, #164]	; 0xa4
 736:	21c8      	movs	r1, #200	; 0xc8
 738:	f7ff fffe 	bl	0 <_ZN97_$LT$app..mynewt_hal..MynewtDelay$u20$as$u20$embedded_hal..blocking..delay..DelayMs$LT$u8$GT$$GT$8delay_ms17h2b43dd712f0e044dE>
 73c:	e7ff      	b.n	73e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x73e>
 73e:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:114
        Ok(())
 740:	f88d 00aa 	strb.w	r0, [sp, #170]	; 0xaa
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:115
    }
 744:	f7ff bc86 	b.w	54 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E+0x54>

Disassembly of section .text._ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE:

00000000 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE>:
_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:174

    /// Sets a pixel color at the given coords.
    pub fn set_pixel(&mut self, x: u16, y: u16, color: u16) -> Result <(), ()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b094      	sub	sp, #80	; 0x50
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	900b      	str	r0, [sp, #44]	; 0x2c
   e:	f8ad 1030 	strh.w	r1, [sp, #48]	; 0x30
  12:	f8ad 2032 	strh.w	r2, [sp, #50]	; 0x32
  16:	f8ad 3034 	strh.w	r3, [sp, #52]	; 0x34
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:175
        self.set_address_window(x, y, x, y)?;
  1a:	980b      	ldr	r0, [sp, #44]	; 0x2c
  1c:	f8bd 1030 	ldrh.w	r1, [sp, #48]	; 0x30
  20:	f8bd 2032 	ldrh.w	r2, [sp, #50]	; 0x32
  24:	466b      	mov	r3, sp
  26:	601a      	str	r2, [r3, #0]
  28:	910a      	str	r1, [sp, #40]	; 0x28
  2a:	9b0a      	ldr	r3, [sp, #40]	; 0x28
  2c:	f8cd c024 	str.w	ip, [sp, #36]	; 0x24
  30:	f8cd e020 	str.w	lr, [sp, #32]
  34:	9407      	str	r4, [sp, #28]
  36:	9506      	str	r5, [sp, #24]
  38:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE>
  3c:	9005      	str	r0, [sp, #20]
  3e:	e7ff      	b.n	40 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x40>
  40:	9805      	ldr	r0, [sp, #20]
  42:	f000 0001 	and.w	r0, r0, #1
  46:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  4a:	f88d 0037 	strb.w	r0, [sp, #55]	; 0x37
  4e:	e7ff      	b.n	50 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x50>
  50:	f89d 0037 	ldrb.w	r0, [sp, #55]	; 0x37
  54:	07c1      	lsls	r1, r0, #31
  56:	2900      	cmp	r1, #0
  58:	9004      	str	r0, [sp, #16]
  5a:	d012      	beq.n	82 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x82>
  5c:	e7ff      	b.n	5e <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x5e>
  5e:	9804      	ldr	r0, [sp, #16]
  60:	2801      	cmp	r0, #1
  62:	d001      	beq.n	68 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x68>
  64:	e7ff      	b.n	66 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x66>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:178
        self.write_command(Instruction::RAMWR, None)?;
        self.write_word(color)
    }
  66:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:175
        self.set_address_window(x, y, x, y)?;
  68:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  6c:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  6e:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  72:	f88d 0036 	strb.w	r0, [sp, #54]	; 0x36
  76:	e7ff      	b.n	78 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x78>
  78:	e7ff      	b.n	7a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x7a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:178
    }
  7a:	f89d 0036 	ldrb.w	r0, [sp, #54]	; 0x36
  7e:	b014      	add	sp, #80	; 0x50
  80:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:176
        self.write_command(Instruction::RAMWR, None)?;
  82:	980b      	ldr	r0, [sp, #44]	; 0x2c
  84:	212c      	movs	r1, #44	; 0x2c
  86:	f88d 103f 	strb.w	r1, [sp, #63]	; 0x3f
  8a:	2100      	movs	r1, #0
  8c:	9111      	str	r1, [sp, #68]	; 0x44
  8e:	9110      	str	r1, [sp, #64]	; 0x40
  90:	9110      	str	r1, [sp, #64]	; 0x40
  92:	9a10      	ldr	r2, [sp, #64]	; 0x40
  94:	9b11      	ldr	r3, [sp, #68]	; 0x44
  96:	f89d 103f 	ldrb.w	r1, [sp, #63]	; 0x3f
  9a:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE>
  9e:	9003      	str	r0, [sp, #12]
  a0:	e7ff      	b.n	a2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0xa2>
  a2:	9803      	ldr	r0, [sp, #12]
  a4:	f000 0001 	and.w	r0, r0, #1
  a8:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
  ac:	f88d 003e 	strb.w	r0, [sp, #62]	; 0x3e
  b0:	e7ff      	b.n	b2 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0xb2>
  b2:	f89d 003e 	ldrb.w	r0, [sp, #62]	; 0x3e
  b6:	07c1      	lsls	r1, r0, #31
  b8:	2900      	cmp	r1, #0
  ba:	9002      	str	r0, [sp, #8]
  bc:	d00d      	beq.n	da <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0xda>
  be:	e7ff      	b.n	c0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0xc0>
  c0:	9802      	ldr	r0, [sp, #8]
  c2:	2801      	cmp	r0, #1
  c4:	d1cf      	bne.n	66 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x66>
  c6:	e7ff      	b.n	c8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0xc8>
  c8:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17h54a98e8170547aa2E>
  cc:	e7ff      	b.n	2 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E+0x2>
  ce:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17hd64f001ea27ee423E>
  d2:	f88d 0036 	strb.w	r0, [sp, #54]	; 0x36
  d6:	e7ff      	b.n	d8 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0xd8>
  d8:	e7cf      	b.n	7a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x7a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:177
        self.write_word(color)
  da:	980b      	ldr	r0, [sp, #44]	; 0x2c
  dc:	f8bd 1034 	ldrh.w	r1, [sp, #52]	; 0x34
  e0:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE>
  e4:	f88d 0036 	strb.w	r0, [sp, #54]	; 0x36
  e8:	e7ff      	b.n	ea <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0xea>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:178
    }
  ea:	e7c6      	b.n	7a <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$9set_pixel17hbd52fef0fed6dddeE+0x7a>

Disassembly of section .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E:

00000000 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E>:
_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:209
where
    SPI: spi::Write<u8>,
    DC: OutputPin,
    RST: OutputPin,
{
    fn draw<T>(&mut self, item_pixels: T)
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b0b4      	sub	sp, #208	; 0xd0
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9006      	str	r0, [sp, #24]
   a:	a812      	add	r0, sp, #72	; 0x48
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
    where
        T: IntoIterator<Item = Pixel<Rgb565>>,
    {
        for Pixel(coord, color) in item_pixels {
   c:	4684      	mov	ip, r0
   e:	e8b1 4030 	ldmia.w	r1!, {r4, r5, lr}
  12:	e8ac 4030 	stmia.w	ip!, {r4, r5, lr}
  16:	e891 4070 	ldmia.w	r1, {r4, r5, r6, lr}
  1a:	e88c 4070 	stmia.w	ip, {r4, r5, r6, lr}
  1e:	a907      	add	r1, sp, #28
  20:	9005      	str	r0, [sp, #20]
  22:	4608      	mov	r0, r1
  24:	9905      	ldr	r1, [sp, #20]
  26:	9204      	str	r2, [sp, #16]
  28:	9303      	str	r3, [sp, #12]
  2a:	f7ff fffe 	bl	0 <_ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E>
  2e:	e7ff      	b.n	30 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0x30>
  30:	a807      	add	r0, sp, #28
  32:	a919      	add	r1, sp, #100	; 0x64
  34:	e8b0 501c 	ldmia.w	r0!, {r2, r3, r4, ip, lr}
  38:	e8a1 501c 	stmia.w	r1!, {r2, r3, r4, ip, lr}
  3c:	e890 503c 	ldmia.w	r0, {r2, r3, r4, r5, ip, lr}
  40:	e881 503c 	stmia.w	r1, {r2, r3, r4, r5, ip, lr}
  44:	e7ff      	b.n	46 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0x46>
  46:	a827      	add	r0, sp, #156	; 0x9c
  48:	a919      	add	r1, sp, #100	; 0x64
  4a:	f7ff fffe 	bl	0 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E>
  4e:	e7ff      	b.n	50 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0x50>
  50:	9827      	ldr	r0, [sp, #156]	; 0x9c
  52:	2800      	cmp	r0, #0
  54:	9002      	str	r0, [sp, #8]
  56:	d028      	beq.n	aa <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0xaa>
  58:	e7ff      	b.n	5a <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0x5a>
  5a:	9802      	ldr	r0, [sp, #8]
  5c:	2801      	cmp	r0, #1
  5e:	d001      	beq.n	64 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0x64>
  60:	e7ff      	b.n	62 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0x62>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:216
            self.set_pixel(coord.0 as u16, coord.1 as u16, color.0).expect("pixel write failed");
        }
    }
  62:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  64:	9828      	ldr	r0, [sp, #160]	; 0xa0
  66:	9929      	ldr	r1, [sp, #164]	; 0xa4
  68:	9a2a      	ldr	r2, [sp, #168]	; 0xa8
  6a:	922d      	str	r2, [sp, #180]	; 0xb4
  6c:	912c      	str	r1, [sp, #176]	; 0xb0
  6e:	902b      	str	r0, [sp, #172]	; 0xac
  70:	982b      	ldr	r0, [sp, #172]	; 0xac
  72:	992c      	ldr	r1, [sp, #176]	; 0xb0
  74:	9a2d      	ldr	r2, [sp, #180]	; 0xb4
  76:	9230      	str	r2, [sp, #192]	; 0xc0
  78:	912f      	str	r1, [sp, #188]	; 0xbc
  7a:	902e      	str	r0, [sp, #184]	; 0xb8
  7c:	982e      	ldr	r0, [sp, #184]	; 0xb8
  7e:	992f      	ldr	r1, [sp, #188]	; 0xbc
  80:	9a30      	ldr	r2, [sp, #192]	; 0xc0
  82:	9226      	str	r2, [sp, #152]	; 0x98
  84:	9125      	str	r1, [sp, #148]	; 0x94
  86:	9024      	str	r0, [sp, #144]	; 0x90
  88:	9824      	ldr	r0, [sp, #144]	; 0x90
  8a:	9925      	ldr	r1, [sp, #148]	; 0x94
  8c:	9031      	str	r0, [sp, #196]	; 0xc4
  8e:	9132      	str	r1, [sp, #200]	; 0xc8
  90:	f8bd 0098 	ldrh.w	r0, [sp, #152]	; 0x98
  94:	f8ad 00ce 	strh.w	r0, [sp, #206]	; 0xce
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:214
            self.set_pixel(coord.0 as u16, coord.1 as u16, color.0).expect("pixel write failed");
  98:	9806      	ldr	r0, [sp, #24]
  9a:	9931      	ldr	r1, [sp, #196]	; 0xc4
  9c:	9a32      	ldr	r2, [sp, #200]	; 0xc8
  9e:	f8bd 30ce 	ldrh.w	r3, [sp, #206]	; 0xce
  a2:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E>
  a6:	9001      	str	r0, [sp, #4]
  a8:	e000      	b.n	ac <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0xac>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  aa:	e00b      	b.n	c4 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0xc4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:214
            self.set_pixel(coord.0 as u16, coord.1 as u16, color.0).expect("pixel write failed");
  ac:	9801      	ldr	r0, [sp, #4]
  ae:	f000 0001 	and.w	r0, r0, #1
  b2:	f240 0100 	movw	r1, #0
  b6:	f2c0 0100 	movt	r1, #0
  ba:	2212      	movs	r2, #18
  bc:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E>
  c0:	e7ff      	b.n	c2 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0xc2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  c2:	e7c0      	b.n	46 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E+0x46>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:216
    }
  c4:	b034      	add	sp, #208	; 0xd0
  c6:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E:

00000000 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E>:
_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:209
    fn draw<T>(&mut self, item_pixels: T)
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b0b0      	sub	sp, #192	; 0xc0
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9006      	str	r0, [sp, #24]
   a:	a810      	add	r0, sp, #64	; 0x40
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
   c:	4684      	mov	ip, r0
   e:	e8b1 4030 	ldmia.w	r1!, {r4, r5, lr}
  12:	e8ac 4030 	stmia.w	ip!, {r4, r5, lr}
  16:	e891 4070 	ldmia.w	r1, {r4, r5, r6, lr}
  1a:	e88c 4070 	stmia.w	ip, {r4, r5, r6, lr}
  1e:	a907      	add	r1, sp, #28
  20:	9005      	str	r0, [sp, #20]
  22:	4608      	mov	r0, r1
  24:	9905      	ldr	r1, [sp, #20]
  26:	9204      	str	r2, [sp, #16]
  28:	9303      	str	r3, [sp, #12]
  2a:	f7ff fffe 	bl	0 <_ZN122_$LT$embedded_graphics..primitives..rectangle..Rectangle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h7d15a2b2844f81e9E>
  2e:	e7ff      	b.n	30 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0x30>
  30:	a807      	add	r0, sp, #28
  32:	a917      	add	r1, sp, #92	; 0x5c
  34:	e8b0 500c 	ldmia.w	r0!, {r2, r3, ip, lr}
  38:	e8a1 500c 	stmia.w	r1!, {r2, r3, ip, lr}
  3c:	e890 501c 	ldmia.w	r0, {r2, r3, r4, ip, lr}
  40:	e881 501c 	stmia.w	r1, {r2, r3, r4, ip, lr}
  44:	e7ff      	b.n	46 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0x46>
  46:	a823      	add	r0, sp, #140	; 0x8c
  48:	a917      	add	r1, sp, #92	; 0x5c
  4a:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..primitives..rectangle..RectangleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h534698dbaf34ce31E>
  4e:	e7ff      	b.n	50 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0x50>
  50:	9823      	ldr	r0, [sp, #140]	; 0x8c
  52:	2800      	cmp	r0, #0
  54:	9002      	str	r0, [sp, #8]
  56:	d028      	beq.n	aa <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0xaa>
  58:	e7ff      	b.n	5a <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0x5a>
  5a:	9802      	ldr	r0, [sp, #8]
  5c:	2801      	cmp	r0, #1
  5e:	d001      	beq.n	64 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0x64>
  60:	e7ff      	b.n	62 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0x62>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:216
    }
  62:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  64:	9824      	ldr	r0, [sp, #144]	; 0x90
  66:	9925      	ldr	r1, [sp, #148]	; 0x94
  68:	9a26      	ldr	r2, [sp, #152]	; 0x98
  6a:	9229      	str	r2, [sp, #164]	; 0xa4
  6c:	9128      	str	r1, [sp, #160]	; 0xa0
  6e:	9027      	str	r0, [sp, #156]	; 0x9c
  70:	9827      	ldr	r0, [sp, #156]	; 0x9c
  72:	9928      	ldr	r1, [sp, #160]	; 0xa0
  74:	9a29      	ldr	r2, [sp, #164]	; 0xa4
  76:	922c      	str	r2, [sp, #176]	; 0xb0
  78:	912b      	str	r1, [sp, #172]	; 0xac
  7a:	902a      	str	r0, [sp, #168]	; 0xa8
  7c:	982a      	ldr	r0, [sp, #168]	; 0xa8
  7e:	992b      	ldr	r1, [sp, #172]	; 0xac
  80:	9a2c      	ldr	r2, [sp, #176]	; 0xb0
  82:	9222      	str	r2, [sp, #136]	; 0x88
  84:	9121      	str	r1, [sp, #132]	; 0x84
  86:	9020      	str	r0, [sp, #128]	; 0x80
  88:	9820      	ldr	r0, [sp, #128]	; 0x80
  8a:	9921      	ldr	r1, [sp, #132]	; 0x84
  8c:	902d      	str	r0, [sp, #180]	; 0xb4
  8e:	912e      	str	r1, [sp, #184]	; 0xb8
  90:	f8bd 0088 	ldrh.w	r0, [sp, #136]	; 0x88
  94:	f8ad 00be 	strh.w	r0, [sp, #190]	; 0xbe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:214
            self.set_pixel(coord.0 as u16, coord.1 as u16, color.0).expect("pixel write failed");
  98:	9806      	ldr	r0, [sp, #24]
  9a:	992d      	ldr	r1, [sp, #180]	; 0xb4
  9c:	9a2e      	ldr	r2, [sp, #184]	; 0xb8
  9e:	f8bd 30be 	ldrh.w	r3, [sp, #190]	; 0xbe
  a2:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E>
  a6:	9001      	str	r0, [sp, #4]
  a8:	e000      	b.n	ac <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0xac>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  aa:	e00b      	b.n	c4 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0xc4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:214
            self.set_pixel(coord.0 as u16, coord.1 as u16, color.0).expect("pixel write failed");
  ac:	9801      	ldr	r0, [sp, #4]
  ae:	f000 0001 	and.w	r0, r0, #1
  b2:	f240 0100 	movw	r1, #0
  b6:	f2c0 0100 	movt	r1, #0
  ba:	2212      	movs	r2, #18
  bc:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E>
  c0:	e7ff      	b.n	c2 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0xc2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  c2:	e7c0      	b.n	46 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E+0x46>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:216
    }
  c4:	b030      	add	sp, #192	; 0xc0
  c6:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE:

00000000 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE>:
_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:209
    fn draw<T>(&mut self, item_pixels: T)
   0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
   4:	b0ac      	sub	sp, #176	; 0xb0
   6:	460a      	mov	r2, r1
   8:	4603      	mov	r3, r0
   a:	9005      	str	r0, [sp, #20]
   c:	a80e      	add	r0, sp, #56	; 0x38
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
   e:	4684      	mov	ip, r0
  10:	e891 41f0 	ldmia.w	r1, {r4, r5, r6, r7, r8, lr}
  14:	e88c 41f0 	stmia.w	ip, {r4, r5, r6, r7, r8, lr}
  18:	a906      	add	r1, sp, #24
  1a:	9004      	str	r0, [sp, #16]
  1c:	4608      	mov	r0, r1
  1e:	9904      	ldr	r1, [sp, #16]
  20:	9203      	str	r2, [sp, #12]
  22:	9302      	str	r3, [sp, #8]
  24:	f7ff fffe 	bl	0 <_ZN116_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17hd5545e31687e32c5E>
  28:	e7ff      	b.n	2a <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0x2a>
  2a:	a806      	add	r0, sp, #24
  2c:	a914      	add	r1, sp, #80	; 0x50
  2e:	e8b0 500c 	ldmia.w	r0!, {r2, r3, ip, lr}
  32:	e8a1 500c 	stmia.w	r1!, {r2, r3, ip, lr}
  36:	e890 500c 	ldmia.w	r0, {r2, r3, ip, lr}
  3a:	e881 500c 	stmia.w	r1, {r2, r3, ip, lr}
  3e:	e7ff      	b.n	40 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0x40>
  40:	a81f      	add	r0, sp, #124	; 0x7c
  42:	a914      	add	r1, sp, #80	; 0x50
  44:	f7ff fffe 	bl	0 <_ZN121_$LT$embedded_graphics..primitives..circle..CircleIterator$LT$C$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h6338abb6cd576d3dE>
  48:	e7ff      	b.n	4a <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0x4a>
  4a:	981f      	ldr	r0, [sp, #124]	; 0x7c
  4c:	2800      	cmp	r0, #0
  4e:	9001      	str	r0, [sp, #4]
  50:	d028      	beq.n	a4 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0xa4>
  52:	e7ff      	b.n	54 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0x54>
  54:	9801      	ldr	r0, [sp, #4]
  56:	2801      	cmp	r0, #1
  58:	d001      	beq.n	5e <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0x5e>
  5a:	e7ff      	b.n	5c <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0x5c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:216
    }
  5c:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  5e:	9820      	ldr	r0, [sp, #128]	; 0x80
  60:	9921      	ldr	r1, [sp, #132]	; 0x84
  62:	9a22      	ldr	r2, [sp, #136]	; 0x88
  64:	9225      	str	r2, [sp, #148]	; 0x94
  66:	9124      	str	r1, [sp, #144]	; 0x90
  68:	9023      	str	r0, [sp, #140]	; 0x8c
  6a:	9823      	ldr	r0, [sp, #140]	; 0x8c
  6c:	9924      	ldr	r1, [sp, #144]	; 0x90
  6e:	9a25      	ldr	r2, [sp, #148]	; 0x94
  70:	9228      	str	r2, [sp, #160]	; 0xa0
  72:	9127      	str	r1, [sp, #156]	; 0x9c
  74:	9026      	str	r0, [sp, #152]	; 0x98
  76:	9826      	ldr	r0, [sp, #152]	; 0x98
  78:	9927      	ldr	r1, [sp, #156]	; 0x9c
  7a:	9a28      	ldr	r2, [sp, #160]	; 0xa0
  7c:	921e      	str	r2, [sp, #120]	; 0x78
  7e:	911d      	str	r1, [sp, #116]	; 0x74
  80:	901c      	str	r0, [sp, #112]	; 0x70
  82:	981c      	ldr	r0, [sp, #112]	; 0x70
  84:	991d      	ldr	r1, [sp, #116]	; 0x74
  86:	9029      	str	r0, [sp, #164]	; 0xa4
  88:	912a      	str	r1, [sp, #168]	; 0xa8
  8a:	f8bd 0078 	ldrh.w	r0, [sp, #120]	; 0x78
  8e:	f8ad 00ae 	strh.w	r0, [sp, #174]	; 0xae
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:214
            self.set_pixel(coord.0 as u16, coord.1 as u16, color.0).expect("pixel write failed");
  92:	9805      	ldr	r0, [sp, #20]
  94:	9929      	ldr	r1, [sp, #164]	; 0xa4
  96:	9a2a      	ldr	r2, [sp, #168]	; 0xa8
  98:	f8bd 30ae 	ldrh.w	r3, [sp, #174]	; 0xae
  9c:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE>
  a0:	9000      	str	r0, [sp, #0]
  a2:	e000      	b.n	a6 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0xa6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  a4:	e00b      	b.n	be <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0xbe>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:214
            self.set_pixel(coord.0 as u16, coord.1 as u16, color.0).expect("pixel write failed");
  a6:	9800      	ldr	r0, [sp, #0]
  a8:	f000 0001 	and.w	r0, r0, #1
  ac:	f240 0100 	movw	r1, #0
  b0:	f2c0 0100 	movt	r1, #0
  b4:	2212      	movs	r2, #18
  b6:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h62a4c28f4b9c3dd5E>
  ba:	e7ff      	b.n	bc <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0xbc>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:213
        for Pixel(coord, color) in item_pixels {
  bc:	e7c0      	b.n	40 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE+0x40>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/st7735-lcd-0.6.1/src/lib.rs:216
    }
  be:	b02c      	add	sp, #176	; 0xb0
  c0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

app-9b7b12e8d5cbce98.4xhwzkn01xyri3xh.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4xhwzkn01xyri3xh
00000a98 l       .debug_str	00000000 
00000a7e l       .debug_str	00000000 
00000a84 l       .debug_str	00000000 
00000a8f l       .debug_str	00000000 
00000abb l       .debug_str	00000000 
00000ada l       .debug_str	00000000 
00000adf l       .debug_str	00000000 
00000b06 l       .debug_str	00000000 
00000b0c l       .debug_str	00000000 
00000b1b l       .debug_str	00000000 
00000b22 l       .debug_str	00000000 
00000b26 l       .debug_str	00000000 
00000b2f l       .debug_str	00000000 
00000b37 l       .debug_str	00000000 
00000b3f l       .debug_str	00000000 
00000b4b l       .debug_str	00000000 
00000b57 l       .debug_str	00000000 
00000b70 l       .debug_str	00000000 
00000b75 l       .debug_str	00000000 
00000b86 l       .debug_str	00000000 
00000b90 l       .debug_str	00000000 
00000b9e l       .debug_str	00000000 
00000ba2 l       .debug_str	00000000 
00000bad l       .debug_str	00000000 
00000bb4 l       .debug_str	00000000 
00000bba l       .debug_str	00000000 
00000bbe l       .debug_str	00000000 
00000bc2 l       .debug_str	00000000 
00000bca l       .debug_str	00000000 
00000be1 l       .debug_str	00000000 
00000c05 l       .debug_str	00000000 
00000c21 l       .debug_str	00000000 
00000c2b l       .debug_str	00000000 
00000c45 l       .debug_str	00000000 
00000ca3 l       .debug_str	00000000 
00000cae l       .debug_str	00000000 
00000ccb l       .debug_str	00000000 
00000ce4 l       .debug_str	00000000 
00000cee l       .debug_str	00000000 
00000d26 l       .debug_str	00000000 
00000d28 l       .debug_str	00000000 
00000d2a l       .debug_str	00000000 
00000d32 l       .debug_str	00000000 
00000d61 l       .debug_str	00000000 
00000d64 l       .debug_str	00000000 
00000d6a l       .debug_str	00000000 
00000d6e l       .debug_str	00000000 
00000d72 l       .debug_str	00000000 
00000d77 l       .debug_str	00000000 
00000d85 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
00000095 l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a5 l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c1 l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000cb l       .debug_str	00000000 
000000d1 l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
000000e8 l       .debug_str	00000000 
000000ea l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
0000011b l       .debug_str	00000000 
0000011d l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
00000166 l       .debug_str	00000000 
0000016d l       .debug_str	00000000 
00000170 l       .debug_str	00000000 
00000174 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
00000182 l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
0000018a l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001a9 l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001c3 l       .debug_str	00000000 
000001cd l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
00000223 l       .debug_str	00000000 
0000022c l       .debug_str	00000000 
00000232 l       .debug_str	00000000 
00000237 l       .debug_str	00000000 
00000283 l       .debug_str	00000000 
00000288 l       .debug_str	00000000 
0000028b l       .debug_str	00000000 
00000290 l       .debug_str	00000000 
000002c1 l       .debug_str	00000000 
000002fa l       .debug_str	00000000 
000002fc l       .debug_str	00000000 
00000354 l       .debug_str	00000000 
0000038e l       .debug_str	00000000 
000003e4 l       .debug_str	00000000 
0000043a l       .debug_str	00000000 
00000473 l       .debug_str	00000000 
000004ea l       .debug_str	00000000 
000004ff l       .debug_str	00000000 
00000594 l       .debug_str	00000000 
000005aa l       .debug_str	00000000 
000005b0 l       .debug_str	00000000 
00000625 l       .debug_str	00000000 
00000639 l       .debug_str	00000000 
000006cc l       .debug_str	00000000 
00000744 l       .debug_str	00000000 
00000754 l       .debug_str	00000000 
0000075d l       .debug_str	00000000 
00000767 l       .debug_str	00000000 
0000076e l       .debug_str	00000000 
00000773 l       .debug_str	00000000 
000007c6 l       .debug_str	00000000 
000007dd l       .debug_str	00000000 
000007e1 l       .debug_str	00000000 
000007e5 l       .debug_str	00000000 
000007ec l       .debug_str	00000000 
000007f4 l       .debug_str	00000000 
00000808 l       .debug_str	00000000 
0000080a l       .debug_str	00000000 
0000083c l       .debug_str	00000000 
00000885 l       .debug_str	00000000 
00000893 l       .debug_str	00000000 
000008dc l       .debug_str	00000000 
000008ea l       .debug_str	00000000 
00000937 l       .debug_str	00000000 
00000949 l       .debug_str	00000000 
00000997 l       .debug_str	00000000 
000009aa l       .debug_str	00000000 
000009af l       .debug_str	00000000 
000009c3 l       .debug_str	00000000 
000009f5 l       .debug_str	00000000 
000009fa l       .debug_str	00000000 
00000a01 l       .debug_str	00000000 
00000a0d l       .debug_str	00000000 
00000a15 l       .debug_str	00000000 
00000a1c l       .debug_str	00000000 
00000a21 l       .debug_str	00000000 
00000a2a l       .debug_str	00000000 
00000a2f l       .debug_str	00000000 
00000a32 l       .debug_str	00000000 
00000a3b l       .debug_str	00000000 
00000a42 l       .debug_str	00000000 
00000a47 l       .debug_str	00000000 
00000a4d l       .debug_str	00000000 
00000a53 l       .debug_str	00000000 
00000a5d l       .debug_str	00000000 
00000a60 l       .debug_str	00000000 
00000a66 l       .debug_str	00000000 
00000a70 l       .debug_str	00000000 
00000a78 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.0	00000018 .Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.0
00000000 l     O .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.1	00000018 .Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.1
00000000 l     O .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.2	00000018 .Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.2
00000000 l     O .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.5	00000018 .Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.5
00000000 l     O .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.6	00000018 .Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.6
00000000 l     O .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.7	00000018 .Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.7
00000000 l     O .rodata.str.0	0000005f str.0
00000000 l     O .rodata.str.1	00000021 str.1
00000000 l     O .rodata.str.2	0000001c str.2
00000000 l    d  .text._ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E	00000000 .text._ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE
00000000 l    d  .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE	00000000 .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE
00000000 l    d  .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE	00000000 .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE
00000000 l    d  .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE	00000000 .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE
00000000 l    d  .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E	00000000 .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E
00000000 l    d  .text._ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E	00000000 .text._ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E
00000000 l    d  .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E	00000000 .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E
00000000 l    d  .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE	00000000 .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE
00000000 l    d  .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E	00000000 .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E
00000000 l    d  .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E	00000000 .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E
00000000 l    d  .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE	00000000 .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE
00000000 l    d  .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.0	00000000 .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.0
00000000 l    d  .rodata.str.0	00000000 .rodata.str.0
00000000 l    d  .rodata.str.1	00000000 .rodata.str.1
00000000 l    d  .rodata.str.2	00000000 .rodata.str.2
00000000 l    d  .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.3	00000000 .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.3
00000000 l    d  .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.4	00000000 .rodata..Lanon.96ccfa61c2df5bb0808cbcdc547aaa0f.4
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core10intrinsics19copy_nonoverlapping17hd1067cf12b28a7acE
00000000 g     F .text._ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E	00000046 _ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E
00000000         *UND*	00000000 _ZN4core3fmt5write17h51826aee11d21b9bE
00000000         *UND*	00000000 _ZN4core3ptr18real_drop_in_place17h5df3a5b758832e14E
00000000         *UND*	00000000 _ZN4core3ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h86a9e4f7932a1a54E
00000000         *UND*	00000000 _ZN4core3ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hf9f063c19b937917E
00000000         *UND*	00000000 .hidden _ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E
00000000         *UND*	00000000 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE
00000000         *UND*	00000000 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE
00000000         *UND*	00000000 _ZN4core5slice14from_raw_parts17h63b51f352ffb2514E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000 g     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E	00000028 _ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E
00000000 g     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E	00000038 _ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E
00000000 g     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE	00000034 _ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE
00000000 g     F .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE	00000030 _ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE
00000000 g     F .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE	0000000c _ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE
00000000 g     F .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE	00000040 _ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE
00000000 g     F .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E	00000012 _ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E
00000000 g     F .text._ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E	00000048 _ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E
00000000 g     F .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E	0000011a _ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E
00000000 g     F .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE	0000001e _ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE
00000000 g     F .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E	00000030 _ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E
00000000 g     F .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E	0000004c _ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E
00000000 g     F .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE	000000ce _ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE
00000000         *UND*	00000000 _ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E
00000000         *UND*	00000000 _ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E
00000000         *UND*	00000000 _ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E
00000000         *UND*	00000000 .hidden _ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE
00000000         *UND*	00000000 _ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE
00000000         *UND*	00000000 _ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE
00000000         *UND*	00000000 __aeabi_memcpy



Disassembly of section .text._ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E:

00000000 <_ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E>:
_ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:194
   0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
   4:	b08c      	sub	sp, #48	; 0x30
   6:	460a      	mov	r2, r1
   8:	4603      	mov	r3, r0
   a:	9005      	str	r0, [sp, #20]
   c:	a806      	add	r0, sp, #24
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:195
   e:	4684      	mov	ip, r0
  10:	e891 41f0 	ldmia.w	r1, {r4, r5, r6, r7, r8, lr}
  14:	e88c 41f0 	stmia.w	ip, {r4, r5, r6, r7, r8, lr}
  18:	f240 0100 	movw	r1, #0
  1c:	f2c0 0100 	movt	r1, #0
  20:	f10d 0c14 	add.w	ip, sp, #20
  24:	9004      	str	r0, [sp, #16]
  26:	4660      	mov	r0, ip
  28:	f8dd c010 	ldr.w	ip, [sp, #16]
  2c:	9203      	str	r2, [sp, #12]
  2e:	4662      	mov	r2, ip
  30:	9302      	str	r3, [sp, #8]
  32:	f7ff fffe 	bl	0 <_ZN4core3fmt5write17h51826aee11d21b9bE>
  36:	9001      	str	r0, [sp, #4]
  38:	e7ff      	b.n	3a <_ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E+0x3a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:196
  3a:	9801      	ldr	r0, [sp, #4]
  3c:	f000 0001 	and.w	r0, r0, #1
  40:	b00c      	add	sp, #48	; 0x30
  42:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E:

00000000 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E>:
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:205
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9004      	str	r0, [sp, #16]
   a:	9105      	str	r1, [sp, #20]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:206
   c:	9804      	ldr	r0, [sp, #16]
   e:	6800      	ldr	r0, [r0, #0]
  10:	9905      	ldr	r1, [sp, #20]
  12:	9203      	str	r2, [sp, #12]
  14:	9302      	str	r3, [sp, #8]
  16:	f7ff fffe 	bl	0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E>
  1a:	9001      	str	r0, [sp, #4]
  1c:	e7ff      	b.n	1e <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h7f6ca0ce193985a5E+0x1e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:207
  1e:	9801      	ldr	r0, [sp, #4]
  20:	f000 0001 	and.w	r0, r0, #1
  24:	b006      	add	sp, #24
  26:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E:

00000000 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E>:
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:209
   0:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
   4:	b08b      	sub	sp, #44	; 0x2c
   6:	460a      	mov	r2, r1
   8:	4603      	mov	r3, r0
   a:	9004      	str	r0, [sp, #16]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:210
   c:	9804      	ldr	r0, [sp, #16]
   e:	6800      	ldr	r0, [r0, #0]
  10:	f10d 0c14 	add.w	ip, sp, #20
  14:	46e6      	mov	lr, ip
  16:	e891 03f0 	ldmia.w	r1, {r4, r5, r6, r7, r8, r9}
  1a:	e88e 03f0 	stmia.w	lr, {r4, r5, r6, r7, r8, r9}
  1e:	4661      	mov	r1, ip
  20:	9203      	str	r2, [sp, #12]
  22:	9302      	str	r3, [sp, #8]
  24:	f7ff fffe 	bl	0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E>
  28:	9001      	str	r0, [sp, #4]
  2a:	e7ff      	b.n	2c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hc512d88acca2c714E+0x2c>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:211
  2c:	9801      	ldr	r0, [sp, #4]
  2e:	f000 0001 	and.w	r0, r0, #1
  32:	b00b      	add	sp, #44	; 0x2c
  34:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE:

00000000 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE>:
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:201
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9005      	str	r0, [sp, #20]
   c:	9106      	str	r1, [sp, #24]
   e:	9207      	str	r2, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:202
  10:	9805      	ldr	r0, [sp, #20]
  12:	6800      	ldr	r0, [r0, #0]
  14:	9906      	ldr	r1, [sp, #24]
  16:	9a07      	ldr	r2, [sp, #28]
  18:	9304      	str	r3, [sp, #16]
  1a:	f8cd c00c 	str.w	ip, [sp, #12]
  1e:	f8cd e008 	str.w	lr, [sp, #8]
  22:	f7ff fffe 	bl	0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE>
  26:	9001      	str	r0, [sp, #4]
  28:	e7ff      	b.n	2a <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h6a7f811bab881a7dE+0x2a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:203
  2a:	9801      	ldr	r0, [sp, #4]
  2c:	f000 0001 	and.w	r0, r0, #1
  30:	b008      	add	sp, #32
  32:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE:

00000000 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE>:
_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:442

/// `Write` appends written data to the end of the string.
impl<A> fmt::Write for ArrayString<A>
    where A: Array<Item=u8> + Copy
{
    fn write_char(&mut self, c: char) -> fmt::Result {
   0:	b580      	push	{r7, lr}
   2:	b088      	sub	sp, #32
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9005      	str	r0, [sp, #20]
   a:	9106      	str	r1, [sp, #24]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:443
        self.try_push(c).map_err(|_| fmt::Error)
   c:	9805      	ldr	r0, [sp, #20]
   e:	9906      	ldr	r1, [sp, #24]
  10:	9204      	str	r2, [sp, #16]
  12:	9303      	str	r3, [sp, #12]
  14:	f7ff fffe 	bl	0 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE>
  18:	9002      	str	r0, [sp, #8]
  1a:	e7ff      	b.n	1c <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE+0x1c>
  1c:	9802      	ldr	r0, [sp, #8]
  1e:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9847bbd614976960E>
  22:	9001      	str	r0, [sp, #4]
  24:	e7ff      	b.n	26 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char17hfd1471db664690aeE+0x26>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:444
    }
  26:	9801      	ldr	r0, [sp, #4]
  28:	f000 0001 	and.w	r0, r0, #1
  2c:	b008      	add	sp, #32
  2e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE:

00000000 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE>:
_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$10write_char28_$u7b$$u7b$closure$u7d$$u7d$17h6bbf6bf0c0d691dfE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:443
        self.try_push(c).map_err(|_| fmt::Error)
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9100      	str	r1, [sp, #0]
   8:	b003      	add	sp, #12
   a:	4770      	bx	lr

Disassembly of section .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE:

00000000 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE>:
_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:446

    fn write_str(&mut self, s: &str) -> fmt::Result {
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9006      	str	r0, [sp, #24]
   c:	9107      	str	r1, [sp, #28]
   e:	9208      	str	r2, [sp, #32]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:447
        self.try_push_str(s).map_err(|_| fmt::Error)
  10:	9806      	ldr	r0, [sp, #24]
  12:	9907      	ldr	r1, [sp, #28]
  14:	9a08      	ldr	r2, [sp, #32]
  16:	9305      	str	r3, [sp, #20]
  18:	f8cd c010 	str.w	ip, [sp, #16]
  1c:	f8cd e00c 	str.w	lr, [sp, #12]
  20:	f7ff fffe 	bl	0 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE>
  24:	9002      	str	r0, [sp, #8]
  26:	9101      	str	r1, [sp, #4]
  28:	e7ff      	b.n	2a <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE+0x2a>
  2a:	9802      	ldr	r0, [sp, #8]
  2c:	9901      	ldr	r1, [sp, #4]
  2e:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$7map_err17h9a74150641992c5fE>
  32:	9000      	str	r0, [sp, #0]
  34:	e7ff      	b.n	36 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17he52822ba5af4276bE+0x36>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:448
    }
  36:	9800      	ldr	r0, [sp, #0]
  38:	f000 0001 	and.w	r0, r0, #1
  3c:	b00a      	add	sp, #40	; 0x28
  3e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E:

00000000 <_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E>:
_ZN81_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..fmt..Write$GT$9write_str28_$u7b$$u7b$closure$u7d$$u7d$17haa9c43d026c3e6b7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:447
        self.try_push_str(s).map_err(|_| fmt::Error)
   0:	b085      	sub	sp, #20
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9003      	str	r0, [sp, #12]
   8:	9104      	str	r1, [sp, #16]
   a:	9201      	str	r2, [sp, #4]
   c:	9300      	str	r3, [sp, #0]
   e:	b005      	add	sp, #20
  10:	4770      	bx	lr

Disassembly of section .text._ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E:

00000000 <_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E>:
_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:358
    fn deref(&self) -> &str {
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4601      	mov	r1, r0
   6:	9006      	str	r0, [sp, #24]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:360
            let sl = slice::from_raw_parts(self.xs.ptr(), self.len.to_usize());
   8:	9806      	ldr	r0, [sp, #24]
   a:	9105      	str	r1, [sp, #20]
   c:	f7ff fffe 	bl	0 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$3ptr17h8b5c0fb62ddf0f02E>
  10:	9004      	str	r0, [sp, #16]
  12:	e7ff      	b.n	14 <_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E+0x14>
  14:	9806      	ldr	r0, [sp, #24]
  16:	7d00      	ldrb	r0, [r0, #20]
  18:	f88d 0027 	strb.w	r0, [sp, #39]	; 0x27
_ZN45_$LT$u8$u20$as$u20$arrayvec..array..Index$GT$8to_usize17hc252f13f1ebfc9eeE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array.rs:57
    fn from(ix: usize) ->  Self { ix != 0 }
}

impl Index for u8 {
    #[inline(always)]
    fn to_usize(self) -> usize { self as usize }
  1c:	f89d 0027 	ldrb.w	r0, [sp, #39]	; 0x27
_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:360
  20:	9003      	str	r0, [sp, #12]
  22:	e7ff      	b.n	24 <_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E+0x24>
  24:	9804      	ldr	r0, [sp, #16]
  26:	9903      	ldr	r1, [sp, #12]
  28:	f7ff fffe 	bl	0 <_ZN4core5slice14from_raw_parts17h63b51f352ffb2514E>
  2c:	9108      	str	r1, [sp, #32]
  2e:	9007      	str	r0, [sp, #28]
  30:	e7ff      	b.n	32 <_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E+0x32>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:361
            str::from_utf8_unchecked(sl)
  32:	9807      	ldr	r0, [sp, #28]
  34:	9908      	ldr	r1, [sp, #32]
  36:	f7ff fffe 	bl	0 <_ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E>
  3a:	9002      	str	r0, [sp, #8]
  3c:	9101      	str	r1, [sp, #4]
  3e:	e7ff      	b.n	40 <_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E+0x40>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:363
    }
  40:	9802      	ldr	r0, [sp, #8]
  42:	9901      	ldr	r1, [sp, #4]
  44:	b00a      	add	sp, #40	; 0x28
  46:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E:

00000000 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E>:
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:224
    pub fn try_push_str<'a>(&mut self, s: &'a str) -> Result<(), CapacityError<&'a str>> {
   0:	b580      	push	{r7, lr}
   2:	b09a      	sub	sp, #104	; 0x68
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	4686      	mov	lr, r0
   a:	9010      	str	r0, [sp, #64]	; 0x40
   c:	9111      	str	r1, [sp, #68]	; 0x44
   e:	9212      	str	r2, [sp, #72]	; 0x48
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:225
        if s.len() > self.capacity() - self.len() {
  10:	9811      	ldr	r0, [sp, #68]	; 0x44
  12:	9912      	ldr	r1, [sp, #72]	; 0x48
  14:	930f      	str	r3, [sp, #60]	; 0x3c
  16:	f8cd c038 	str.w	ip, [sp, #56]	; 0x38
  1a:	f8cd e034 	str.w	lr, [sp, #52]	; 0x34
  1e:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE>
  22:	900c      	str	r0, [sp, #48]	; 0x30
  24:	e7ff      	b.n	26 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x26>
  26:	9810      	ldr	r0, [sp, #64]	; 0x40
  28:	9019      	str	r0, [sp, #100]	; 0x64
  2a:	e7ff      	b.n	2c <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x2c>
  2c:	9810      	ldr	r0, [sp, #64]	; 0x40
  2e:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E>
  32:	900b      	str	r0, [sp, #44]	; 0x2c
  34:	e7ff      	b.n	36 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x36>
  36:	980b      	ldr	r0, [sp, #44]	; 0x2c
  38:	f1c0 0114 	rsb	r1, r0, #20
  3c:	2214      	movs	r2, #20
  3e:	4282      	cmp	r2, r0
  40:	910a      	str	r1, [sp, #40]	; 0x28
  42:	d35c      	bcc.n	fe <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0xfe>
  44:	e7ff      	b.n	46 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x46>
  46:	980c      	ldr	r0, [sp, #48]	; 0x30
  48:	990a      	ldr	r1, [sp, #40]	; 0x28
  4a:	4288      	cmp	r0, r1
  4c:	d910      	bls.n	70 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x70>
  4e:	e7ff      	b.n	50 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x50>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:226
            return Err(CapacityError::new(s));
  50:	9811      	ldr	r0, [sp, #68]	; 0x44
  52:	9912      	ldr	r1, [sp, #72]	; 0x48
  54:	f7ff fffe 	bl	0 <_ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE>
  58:	9009      	str	r0, [sp, #36]	; 0x24
  5a:	9108      	str	r1, [sp, #32]
  5c:	e7ff      	b.n	5e <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x5e>
  5e:	9809      	ldr	r0, [sp, #36]	; 0x24
  60:	9013      	str	r0, [sp, #76]	; 0x4c
  62:	9908      	ldr	r1, [sp, #32]
  64:	9114      	str	r1, [sp, #80]	; 0x50
  66:	e7ff      	b.n	68 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x68>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:236
    }
  68:	9813      	ldr	r0, [sp, #76]	; 0x4c
  6a:	9914      	ldr	r1, [sp, #80]	; 0x50
  6c:	b01a      	add	sp, #104	; 0x68
  6e:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:229
            let dst = self.xs.ptr_mut().offset(self.len() as isize);
  70:	9810      	ldr	r0, [sp, #64]	; 0x40
  72:	f7ff fffe 	bl	0 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E>
  76:	9007      	str	r0, [sp, #28]
  78:	e7ff      	b.n	7a <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x7a>
  7a:	9810      	ldr	r0, [sp, #64]	; 0x40
  7c:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E>
  80:	9006      	str	r0, [sp, #24]
  82:	e7ff      	b.n	84 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x84>
  84:	9807      	ldr	r0, [sp, #28]
  86:	9906      	ldr	r1, [sp, #24]
  88:	f7ff fffe 	bl	0 <_ZN4core3ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$6offset17hf9f063c19b937917E>
  8c:	9015      	str	r0, [sp, #84]	; 0x54
  8e:	e7ff      	b.n	90 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x90>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:230
            let src = s.as_ptr();
  90:	9811      	ldr	r0, [sp, #68]	; 0x44
  92:	9912      	ldr	r1, [sp, #72]	; 0x48
  94:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE>
  98:	9016      	str	r0, [sp, #88]	; 0x58
  9a:	e7ff      	b.n	9c <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x9c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:231
            ptr::copy_nonoverlapping(src, dst, s.len());
  9c:	9816      	ldr	r0, [sp, #88]	; 0x58
  9e:	9915      	ldr	r1, [sp, #84]	; 0x54
  a0:	9a11      	ldr	r2, [sp, #68]	; 0x44
  a2:	9b12      	ldr	r3, [sp, #72]	; 0x48
  a4:	9005      	str	r0, [sp, #20]
  a6:	4610      	mov	r0, r2
  a8:	9104      	str	r1, [sp, #16]
  aa:	4619      	mov	r1, r3
  ac:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE>
  b0:	9003      	str	r0, [sp, #12]
  b2:	e7ff      	b.n	b4 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0xb4>
  b4:	9805      	ldr	r0, [sp, #20]
  b6:	9904      	ldr	r1, [sp, #16]
  b8:	9a03      	ldr	r2, [sp, #12]
  ba:	f7ff fffe 	bl	0 <_ZN4core10intrinsics19copy_nonoverlapping17hd1067cf12b28a7acE>
  be:	e7ff      	b.n	c0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0xc0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:232
            let newl = self.len() + s.len();
  c0:	9810      	ldr	r0, [sp, #64]	; 0x40
  c2:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E>
  c6:	9002      	str	r0, [sp, #8]
  c8:	e7ff      	b.n	ca <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0xca>
  ca:	9811      	ldr	r0, [sp, #68]	; 0x44
  cc:	9912      	ldr	r1, [sp, #72]	; 0x48
  ce:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE>
  d2:	9001      	str	r0, [sp, #4]
  d4:	e7ff      	b.n	d6 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0xd6>
  d6:	9802      	ldr	r0, [sp, #8]
  d8:	9901      	ldr	r1, [sp, #4]
  da:	1842      	adds	r2, r0, r1
  dc:	4613      	mov	r3, r2
  de:	4282      	cmp	r2, r0
  e0:	9300      	str	r3, [sp, #0]
  e2:	d313      	bcc.n	10c <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x10c>
  e4:	e7ff      	b.n	e6 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0xe6>
  e6:	9800      	ldr	r0, [sp, #0]
  e8:	9017      	str	r0, [sp, #92]	; 0x5c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:233
            self.set_len(newl);
  ea:	9810      	ldr	r0, [sp, #64]	; 0x40
  ec:	9917      	ldr	r1, [sp, #92]	; 0x5c
  ee:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E>
  f2:	e7ff      	b.n	f4 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0xf4>
  f4:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:235
        Ok(())
  f6:	9014      	str	r0, [sp, #80]	; 0x50
  f8:	9013      	str	r0, [sp, #76]	; 0x4c
  fa:	9013      	str	r0, [sp, #76]	; 0x4c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:236
    }
  fc:	e7b4      	b.n	68 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$12try_push_str17h054036823f49a7c6E+0x68>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:225
        if s.len() > self.capacity() - self.len() {
  fe:	f240 0000 	movw	r0, #0
 102:	f2c0 0000 	movt	r0, #0
 106:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 10a:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:232
            let newl = self.len() + s.len();
 10c:	f240 0000 	movw	r0, #0
 110:	f2c0 0000 	movt	r0, #0
 114:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 118:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE:

00000000 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE>:
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:72
    pub fn len(&self) -> usize { self.len.to_usize() }
   0:	b084      	sub	sp, #16
   2:	4601      	mov	r1, r0
   4:	9002      	str	r0, [sp, #8]
   6:	9802      	ldr	r0, [sp, #8]
   8:	7d00      	ldrb	r0, [r0, #20]
   a:	f88d 000f 	strb.w	r0, [sp, #15]
_ZN45_$LT$u8$u20$as$u20$arrayvec..array..Index$GT$8to_usize17hc252f13f1ebfc9eeE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array.rs:57
   e:	f89d 000f 	ldrb.w	r0, [sp, #15]
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:72
  12:	9101      	str	r1, [sp, #4]
  14:	9000      	str	r0, [sp, #0]
  16:	e7ff      	b.n	18 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3len17h0071cded534d17bbE+0x18>
  18:	9800      	ldr	r0, [sp, #0]
  1a:	b004      	add	sp, #16
  1c:	4770      	bx	lr

Disassembly of section .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E:

00000000 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E>:
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:61
    pub fn new() -> ArrayString<A> {
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	a904      	add	r1, sp, #16
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:64
                xs: MaybeUninitCopy::uninitialized(),
   6:	9003      	str	r0, [sp, #12]
   8:	4608      	mov	r0, r1
   a:	f7ff fffe 	bl	0 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$13uninitialized17ha7fc8930ed8a4170E>
   e:	e7ff      	b.n	10 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E+0x10>
  10:	2000      	movs	r0, #0
  12:	9009      	str	r0, [sp, #36]	; 0x24
_ZN45_$LT$u8$u20$as$u20$arrayvec..array..Index$GT$4from17h0861678fa3d4247dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array.rs:59
    #[inline(always)]
    fn from(ix: usize) ->  Self { ix as u8 }
  14:	9809      	ldr	r0, [sp, #36]	; 0x24
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:65
                len: Index::from(0),
  16:	9002      	str	r0, [sp, #8]
  18:	e7ff      	b.n	1a <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E+0x1a>
  1a:	a904      	add	r1, sp, #16
  1c:	2214      	movs	r2, #20
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:63
            ArrayString {
  1e:	9803      	ldr	r0, [sp, #12]
  20:	f7ff fffe 	bl	0 <__aeabi_memcpy>
  24:	9902      	ldr	r1, [sp, #8]
  26:	9a03      	ldr	r2, [sp, #12]
  28:	7511      	strb	r1, [r2, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:68
    }
  2a:	9001      	str	r0, [sp, #4]
  2c:	b00a      	add	sp, #40	; 0x28
  2e:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E:

00000000 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E>:
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:342
    pub unsafe fn set_len(&mut self, length: usize) {
   0:	b088      	sub	sp, #32
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9004      	str	r0, [sp, #16]
   8:	9105      	str	r1, [sp, #20]
   a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/<::core::macros::debug_assert macros>:2
   c:	2800      	cmp	r0, #0
   e:	9203      	str	r2, [sp, #12]
  10:	9302      	str	r3, [sp, #8]
  12:	d111      	bne.n	38 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E+0x38>
  14:	e7ff      	b.n	16 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E+0x16>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:343
        debug_assert!(length <= self.capacity());
  16:	9805      	ldr	r0, [sp, #20]
  18:	9904      	ldr	r1, [sp, #16]
  1a:	9106      	str	r1, [sp, #24]
  1c:	9001      	str	r0, [sp, #4]
  1e:	e7ff      	b.n	20 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E+0x20>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/<::core::macros::debug_assert macros>:2
  20:	9801      	ldr	r0, [sp, #4]
  22:	2815      	cmp	r0, #21
  24:	d307      	bcc.n	36 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E+0x36>
  26:	e7ff      	b.n	28 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E+0x28>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/<::core::macros::panic macros>:3
  28:	f240 0000 	movw	r0, #0
  2c:	f2c0 0000 	movt	r0, #0
  30:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  34:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/<::core::macros::debug_assert macros>:2
  36:	e7ff      	b.n	38 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E+0x38>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:344
        self.len = Index::from(length);
  38:	9805      	ldr	r0, [sp, #20]
  3a:	9007      	str	r0, [sp, #28]
_ZN45_$LT$u8$u20$as$u20$arrayvec..array..Index$GT$4from17h0861678fa3d4247dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array.rs:59
  3c:	9807      	ldr	r0, [sp, #28]
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:344
  3e:	9000      	str	r0, [sp, #0]
  40:	e7ff      	b.n	42 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$7set_len17h3adc009891769021E+0x42>
  42:	9804      	ldr	r0, [sp, #16]
  44:	9900      	ldr	r1, [sp, #0]
  46:	7501      	strb	r1, [r0, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:345
    }
  48:	b008      	add	sp, #32
  4a:	4770      	bx	lr

Disassembly of section .text._ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE:

00000000 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE>:
_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:171
    pub fn try_push(&mut self, c: char) -> Result<(), CapacityError<char>> {
   0:	b580      	push	{r7, lr}
   2:	b094      	sub	sp, #80	; 0x50
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9009      	str	r0, [sp, #36]	; 0x24
   a:	910a      	str	r1, [sp, #40]	; 0x28
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:172
        let len = self.len();
   c:	9809      	ldr	r0, [sp, #36]	; 0x24
   e:	9208      	str	r2, [sp, #32]
  10:	9307      	str	r3, [sp, #28]
  12:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE>
  16:	900c      	str	r0, [sp, #48]	; 0x30
  18:	e7ff      	b.n	1a <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x1a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:174
            let ptr = self.xs.ptr_mut().add(len);
  1a:	9809      	ldr	r0, [sp, #36]	; 0x24
  1c:	f7ff fffe 	bl	0 <_ZN8arrayvec12maybe_uninit20MaybeUninit$LT$T$GT$7ptr_mut17ha73b155834c3a767E>
  20:	9006      	str	r0, [sp, #24]
  22:	e7ff      	b.n	24 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x24>
  24:	990c      	ldr	r1, [sp, #48]	; 0x30
  26:	9806      	ldr	r0, [sp, #24]
  28:	f7ff fffe 	bl	0 <_ZN4core3ptr31_$LT$impl$u20$$BP$mut$u20$T$GT$3add17h86a9e4f7932a1a54E>
  2c:	900d      	str	r0, [sp, #52]	; 0x34
  2e:	e7ff      	b.n	30 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x30>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:175
            let remaining_cap = self.capacity() - len;
  30:	9809      	ldr	r0, [sp, #36]	; 0x24
  32:	9013      	str	r0, [sp, #76]	; 0x4c
  34:	e7ff      	b.n	36 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x36>
  36:	980c      	ldr	r0, [sp, #48]	; 0x30
  38:	f1c0 0114 	rsb	r1, r0, #20
  3c:	2214      	movs	r2, #20
  3e:	4282      	cmp	r2, r0
  40:	9105      	str	r1, [sp, #20]
  42:	d336      	bcc.n	b2 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0xb2>
  44:	e7ff      	b.n	46 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x46>
  46:	9805      	ldr	r0, [sp, #20]
  48:	900e      	str	r0, [sp, #56]	; 0x38
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:176
            match encode_utf8(c, ptr, remaining_cap) {
  4a:	980a      	ldr	r0, [sp, #40]	; 0x28
  4c:	990d      	ldr	r1, [sp, #52]	; 0x34
  4e:	9a0e      	ldr	r2, [sp, #56]	; 0x38
  50:	f7ff fffe 	bl	0 <_ZN8arrayvec4char11encode_utf817h4f46add54f1a8f2fE>
  54:	9110      	str	r1, [sp, #64]	; 0x40
  56:	900f      	str	r0, [sp, #60]	; 0x3c
  58:	e7ff      	b.n	5a <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x5a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:177
                Ok(n) => {
  5a:	980f      	ldr	r0, [sp, #60]	; 0x3c
  5c:	2800      	cmp	r0, #0
  5e:	9004      	str	r0, [sp, #16]
  60:	d005      	beq.n	6e <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x6e>
  62:	e7ff      	b.n	64 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x64>
  64:	9804      	ldr	r0, [sp, #16]
  66:	2801      	cmp	r0, #1
  68:	d018      	beq.n	9c <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x9c>
  6a:	e7ff      	b.n	6c <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x6c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:184
    }
  6c:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:177
                Ok(n) => {
  6e:	9810      	ldr	r0, [sp, #64]	; 0x40
  70:	9011      	str	r0, [sp, #68]	; 0x44
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:178
                    self.set_len(len + n);
  72:	9809      	ldr	r0, [sp, #36]	; 0x24
  74:	990c      	ldr	r1, [sp, #48]	; 0x30
  76:	9a11      	ldr	r2, [sp, #68]	; 0x44
  78:	440a      	add	r2, r1
  7a:	4613      	mov	r3, r2
  7c:	428a      	cmp	r2, r1
  7e:	9003      	str	r0, [sp, #12]
  80:	9302      	str	r3, [sp, #8]
  82:	d31d      	bcc.n	c0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0xc0>
  84:	e7ff      	b.n	86 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x86>
  86:	9803      	ldr	r0, [sp, #12]
  88:	9902      	ldr	r1, [sp, #8]
  8a:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE>
  8e:	e7ff      	b.n	90 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0x90>
  90:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:179
                    Ok(())
  92:	900b      	str	r0, [sp, #44]	; 0x2c
  94:	f44f 1088 	mov.w	r0, #1114112	; 0x110000
  98:	900b      	str	r0, [sp, #44]	; 0x2c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:176
            match encode_utf8(c, ptr, remaining_cap) {
  9a:	e007      	b.n	ac <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0xac>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:181
                Err(_) => Err(CapacityError::new(c)),
  9c:	980a      	ldr	r0, [sp, #40]	; 0x28
  9e:	f7ff fffe 	bl	0 <_ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE>
  a2:	9001      	str	r0, [sp, #4]
  a4:	e7ff      	b.n	a6 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0xa6>
  a6:	9801      	ldr	r0, [sp, #4]
  a8:	900b      	str	r0, [sp, #44]	; 0x2c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:176
            match encode_utf8(c, ptr, remaining_cap) {
  aa:	e7ff      	b.n	ac <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$8try_push17h4c41e6dc1fceeb3cE+0xac>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:184
    }
  ac:	980b      	ldr	r0, [sp, #44]	; 0x2c
  ae:	b014      	add	sp, #80	; 0x50
  b0:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:175
            let remaining_cap = self.capacity() - len;
  b2:	f240 0000 	movw	r0, #0
  b6:	f2c0 0000 	movt	r0, #0
  ba:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  be:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/array_string.rs:178
                    self.set_len(len + n);
  c0:	f240 0000 	movw	r0, #0
  c4:	f2c0 0000 	movt	r0, #0
  c8:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  cc:	defe      	udf	#254	; 0xfe

app-9b7b12e8d5cbce98.4zquf80iy2ejv0wy.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 4zquf80iy2ejv0wy
000005c8 l       .debug_str	00000000 
00000659 l       .debug_str	00000000 
0000065f l       .debug_str	00000000 
00000664 l       .debug_str	00000000 
00000669 l       .debug_str	00000000 
00000670 l       .debug_str	00000000 
00000676 l       .debug_str	00000000 
00000683 l       .debug_str	00000000 
00000687 l       .debug_str	00000000 
0000068c l       .debug_str	00000000 
00000695 l       .debug_str	00000000 
0000069f l       .debug_str	00000000 
000006a6 l       .debug_str	00000000 
000006ac l       .debug_str	00000000 
000006b1 l       .debug_str	00000000 
000006b7 l       .debug_str	00000000 
000006be l       .debug_str	00000000 
000006c8 l       .debug_str	00000000 
000006d6 l       .debug_str	00000000 
00000716 l       .debug_str	00000000 
0000071b l       .debug_str	00000000 
0000078a l       .debug_str	00000000 
00000791 l       .debug_str	00000000 
00000798 l       .debug_str	00000000 
0000079f l       .debug_str	00000000 
000007a6 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
0000009e l       .debug_str	00000000 
000000a5 l       .debug_str	00000000 
000000a8 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b6 l       .debug_str	00000000 
000000b9 l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000ce l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
0000011e l       .debug_str	00000000 
00000126 l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000135 l       .debug_str	00000000 
00000140 l       .debug_str	00000000 
00000148 l       .debug_str	00000000 
0000014c l       .debug_str	00000000 
00000153 l       .debug_str	00000000 
0000015d l       .debug_str	00000000 
00000160 l       .debug_str	00000000 
00000164 l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
0000017c l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
00000188 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
0000018f l       .debug_str	00000000 
00000193 l       .debug_str	00000000 
00000196 l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
00000223 l       .debug_str	00000000 
00000232 l       .debug_str	00000000 
00000266 l       .debug_str	00000000 
0000026d l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
00000280 l       .debug_str	00000000 
0000028b l       .debug_str	00000000 
00000298 l       .debug_str	00000000 
000002a3 l       .debug_str	00000000 
000002ab l       .debug_str	00000000 
000002b6 l       .debug_str	00000000 
000002c1 l       .debug_str	00000000 
000002cb l       .debug_str	00000000 
000002d6 l       .debug_str	00000000 
000002e1 l       .debug_str	00000000 
000002ee l       .debug_str	00000000 
000002fa l       .debug_str	00000000 
00000307 l       .debug_str	00000000 
00000315 l       .debug_str	00000000 
0000031f l       .debug_str	00000000 
0000032c l       .debug_str	00000000 
00000338 l       .debug_str	00000000 
0000036b l       .debug_str	00000000 
00000379 l       .debug_str	00000000 
0000037e l       .debug_str	00000000 
00000381 l       .debug_str	00000000 
00000385 l       .debug_str	00000000 
00000388 l       .debug_str	00000000 
0000038a l       .debug_str	00000000 
0000038c l       .debug_str	00000000 
00000390 l       .debug_str	00000000 
000003b8 l       .debug_str	00000000 
000003e8 l       .debug_str	00000000 
000003f3 l       .debug_str	00000000 
0000041c l       .debug_str	00000000 
00000421 l       .debug_str	00000000 
0000042a l       .debug_str	00000000 
00000432 l       .debug_str	00000000 
0000043b l       .debug_str	00000000 
0000043f l       .debug_str	00000000 
0000044a l       .debug_str	00000000 
0000045c l       .debug_str	00000000 
00000467 l       .debug_str	00000000 
00000471 l       .debug_str	00000000 
0000047a l       .debug_str	00000000 
00000480 l       .debug_str	00000000 
0000048f l       .debug_str	00000000 
00000493 l       .debug_str	00000000 
00000499 l       .debug_str	00000000 
000004a6 l       .debug_str	00000000 
000004ac l       .debug_str	00000000 
000004b7 l       .debug_str	00000000 
000004be l       .debug_str	00000000 
000004c3 l       .debug_str	00000000 
000004ce l       .debug_str	00000000 
000004d5 l       .debug_str	00000000 
000004dc l       .debug_str	00000000 
000004e1 l       .debug_str	00000000 
00000517 l       .debug_str	00000000 
00000524 l       .debug_str	00000000 
00000531 l       .debug_str	00000000 
00000533 l       .debug_str	00000000 
00000568 l       .debug_str	00000000 
0000056a l       .debug_str	00000000 
000005a3 l       .debug_str	00000000 
000005a9 l       .debug_str	00000000 
000005b5 l       .debug_str	00000000 
000005b7 l       .debug_str	00000000 
000005b9 l       .debug_str	00000000 
000005bf l       .debug_str	00000000 
000005d5 l       .debug_str	00000000 
000005d8 l       .debug_str	00000000 
000005e5 l       .debug_str	00000000 
000005eb l       .debug_str	00000000 
000005ef l       .debug_str	00000000 
000005f6 l       .debug_str	00000000 
000005fc l       .debug_str	00000000 
00000610 l       .debug_str	00000000 
00000627 l       .debug_str	00000000 
0000063d l       .debug_str	00000000 
00000641 l       .debug_str	00000000 
00000643 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.0	00000001 .Lanon.ac214dee03fbd9aad6a65b2748ad129a.0
00000000 l     O .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.3	00000010 .Lanon.ac214dee03fbd9aad6a65b2748ad129a.3
00000000 l     O .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.4	0000000f .Lanon.ac214dee03fbd9aad6a65b2748ad129a.4
00000000 l     O .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.6	00000010 .Lanon.ac214dee03fbd9aad6a65b2748ad129a.6
00000000 l     O .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.7	00000011 .Lanon.ac214dee03fbd9aad6a65b2748ad129a.7
00000000 l     O .data._ZN3app7display12SPI_SETTINGS17h6d903c0f3739ba34E	00000008 _ZN3app7display12SPI_SETTINGS17h6d903c0f3739ba34E
00000000 l     O .bss._ZN3app7display14BACKLIGHT_HIGH17hdde29243ae3168fdE	00000004 _ZN3app7display14BACKLIGHT_HIGH17hdde29243ae3168fdE
00000000 l     O .bss._ZN3app7display7DISPLAY17h0c0ba0bf15a1441dE	00000018 _ZN3app7display7DISPLAY17h0c0ba0bf15a1441dE
00000000 l    d  .text._ZN3app7display13start_display17h81b47d71c1289238E	00000000 .text._ZN3app7display13start_display17h81b47d71c1289238E
00000000 l    d  .text._ZN3app7display10show_touch17hb30bdb206ccb1c66E	00000000 .text._ZN3app7display10show_touch17hb30bdb206ccb1c66E
00000000 l    d  .text._ZN3app7display4test17h4382f834d7e04d48E	00000000 .text._ZN3app7display4test17h4382f834d7e04d48E
00000000 l    d  .data._ZN3app7display12SPI_SETTINGS17h6d903c0f3739ba34E	00000000 .data._ZN3app7display12SPI_SETTINGS17h6d903c0f3739ba34E
00000000 l    d  .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.1	00000000 .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.1
00000000 l    d  .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.2	00000000 .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.2
00000000 l    d  .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.5	00000000 .rodata..Lanon.ac214dee03fbd9aad6a65b2748ad129a.5
00000000 l    d  .bss._ZN3app7display7DISPLAY17h0c0ba0bf15a1441dE	00000000 .bss._ZN3app7display7DISPLAY17h0c0ba0bf15a1441dE
00000000 l    d  .bss._ZN3app7display14BACKLIGHT_HIGH17hdde29243ae3168fdE	00000000 .bss._ZN3app7display14BACKLIGHT_HIGH17hdde29243ae3168fdE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E
00000000         *UND*	00000000 _ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E
00000000         *UND*	00000000 _ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E
00000000         *UND*	00000000 _ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE
00000000         *UND*	00000000 _ZN125_$LT$embedded_graphics..primitives..rectangle..Rectangle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hc548e9c477b6c03cE
00000000         *UND*	00000000 _ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE
00000000         *UND*	00000000 _ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E
00000000         *UND*	00000000 _ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E
00000000         *UND*	00000000 _ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE
00000000         *UND*	00000000 _ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E
00000000         *UND*	00000000 _ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E
00000000         *UND*	00000000 _ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE
00000000         *UND*	00000000 _ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE
00000000         *UND*	00000000 _ZN17embedded_graphics10primitives9rectangle18Rectangle$LT$C$GT$3new17h974137b1f3d0fbc4E
00000000         *UND*	00000000 _ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E
00000000         *UND*	00000000 .hidden _ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE
00000000         *UND*	00000000 .hidden _ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E
00000000         *UND*	00000000 .hidden _ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE
00000000         *UND*	00000000 .hidden _ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE
00000000         *UND*	00000000 .hidden _ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E
00000000 g     F .text._ZN3app7display10show_touch17hb30bdb206ccb1c66E	000002a8 .hidden _ZN3app7display10show_touch17hb30bdb206ccb1c66E
00000000 g     F .text._ZN3app7display13start_display17h81b47d71c1289238E	00000334 .hidden _ZN3app7display13start_display17h81b47d71c1289238E
00000000 g     F .text._ZN3app7display4test17h4382f834d7e04d48E	00000162 .hidden _ZN3app7display4test17h4382f834d7e04d48E
00000000         *UND*	00000000 _ZN4core3fmt10ArgumentV13new17h1b9239df91074954E
00000000         *UND*	00000000 _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u16$GT$3fmt17hc4c95b945dca8c87E
00000000         *UND*	00000000 _ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E
00000000         *UND*	00000000 .hidden _ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E
00000000         *UND*	00000000 _ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E
00000000         *UND*	00000000 _ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E
00000000         *UND*	00000000 _ZN83_$LT$mynewt..result..MynewtError$u20$as$u20$core..convert..From$LT$$LP$$RP$$GT$$GT$4from17h25f954951b1a7ea7E
00000000         *UND*	00000000 _ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE
00000000         *UND*	00000000 _ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E
00000000         *UND*	00000000 _ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E



Disassembly of section .text._ZN3app7display13start_display17h81b47d71c1289238E:

00000000 <_ZN3app7display13start_display17h81b47d71c1289238E>:
_ZN3app7display13start_display17h81b47d71c1289238E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:53
    baudrate:   8000,  //  In kHZ. Use SPI at 8MHz (the fastest clock available on the nRF52832) because otherwise refreshing will be super slow.
    word_size:  hal::HAL_SPI_WORD_SIZE_8BIT as u8,
};

/// Initialise the display controller
pub fn start_display() -> MynewtResult<()> {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b0d8      	sub	sp, #352	; 0x160
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:55
    //  Create SPI port and GPIO pins
    let mut spi_port = MynewtSPI::new();
   4:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal9MynewtSPI3new17hb8e04f50d13eaa3fE>
   8:	9123      	str	r1, [sp, #140]	; 0x8c
   a:	9022      	str	r0, [sp, #136]	; 0x88
   c:	e7ff      	b.n	e <_ZN3app7display13start_display17h81b47d71c1289238E+0xe>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:56
    let mut dc_gpio =  MynewtGPIO::new();
   e:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE>
  12:	9024      	str	r0, [sp, #144]	; 0x90
  14:	e7ff      	b.n	16 <_ZN3app7display13start_display17h81b47d71c1289238E+0x16>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:57
    let mut rst_gpio = MynewtGPIO::new();
  16:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE>
  1a:	9025      	str	r0, [sp, #148]	; 0x94
  1c:	e7ff      	b.n	1e <_ZN3app7display13start_display17h81b47d71c1289238E+0x1e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:60

    //  Init SPI port and GPIO pins
    spi_port.init(
  1e:	f240 0300 	movw	r3, #0
  22:	f2c0 0300 	movt	r3, #0
  26:	a822      	add	r0, sp, #136	; 0x88
  28:	2100      	movs	r1, #0
  2a:	2219      	movs	r2, #25
  2c:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal9MynewtSPI4init17hacd34e8ef548df19E>
  30:	9020      	str	r0, [sp, #128]	; 0x80
  32:	e7ff      	b.n	34 <_ZN3app7display13start_display17h81b47d71c1289238E+0x34>
  34:	9820      	ldr	r0, [sp, #128]	; 0x80
  36:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
  3a:	9026      	str	r0, [sp, #152]	; 0x98
  3c:	e7ff      	b.n	3e <_ZN3app7display13start_display17h81b47d71c1289238E+0x3e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:64
        0,   //  Mynewt SPI port 0
        25,  //  LCD_CS (P0.25): Chip select
        unsafe { &mut SPI_SETTINGS }
    ) ? ;
  3e:	9826      	ldr	r0, [sp, #152]	; 0x98
  40:	1e41      	subs	r1, r0, #1
  42:	bf18      	it	ne
  44:	2101      	movne	r1, #1
  46:	2801      	cmp	r0, #1
  48:	911f      	str	r1, [sp, #124]	; 0x7c
  4a:	d016      	beq.n	7a <_ZN3app7display13start_display17h81b47d71c1289238E+0x7a>
  4c:	e7ff      	b.n	4e <_ZN3app7display13start_display17h81b47d71c1289238E+0x4e>
  4e:	981f      	ldr	r0, [sp, #124]	; 0x7c
  50:	2801      	cmp	r0, #1
  52:	d001      	beq.n	58 <_ZN3app7display13start_display17h81b47d71c1289238E+0x58>
  54:	e7ff      	b.n	56 <_ZN3app7display13start_display17h81b47d71c1289238E+0x56>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:96
        DISPLAY.set_orientation(&Orientation::Landscape) ? ;
        //  DISPLAY.set_offset(1, 25);
        DISPLAY.draw(background);
    }
    Ok(())
}
  56:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:64
    ) ? ;
  58:	9826      	ldr	r0, [sp, #152]	; 0x98
  5a:	9027      	str	r0, [sp, #156]	; 0x9c
  5c:	9827      	ldr	r0, [sp, #156]	; 0x9c
  5e:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  62:	901e      	str	r0, [sp, #120]	; 0x78
  64:	e7ff      	b.n	66 <_ZN3app7display13start_display17h81b47d71c1289238E+0x66>
  66:	981e      	ldr	r0, [sp, #120]	; 0x78
  68:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
  6c:	9021      	str	r0, [sp, #132]	; 0x84
  6e:	e7ff      	b.n	70 <_ZN3app7display13start_display17h81b47d71c1289238E+0x70>
  70:	e002      	b.n	78 <_ZN3app7display13start_display17h81b47d71c1289238E+0x78>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:96
}
  72:	9821      	ldr	r0, [sp, #132]	; 0x84
  74:	b058      	add	sp, #352	; 0x160
  76:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:64
    ) ? ;
  78:	e7fb      	b.n	72 <_ZN3app7display13start_display17h81b47d71c1289238E+0x72>
  7a:	a824      	add	r0, sp, #144	; 0x90
  7c:	2112      	movs	r1, #18
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:65
    dc_gpio.init(18) ? ;   //  LCD_RS (P0.18): Clock/data pin (CD)
  7e:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E>
  82:	901d      	str	r0, [sp, #116]	; 0x74
  84:	e7ff      	b.n	86 <_ZN3app7display13start_display17h81b47d71c1289238E+0x86>
  86:	981d      	ldr	r0, [sp, #116]	; 0x74
  88:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
  8c:	9029      	str	r0, [sp, #164]	; 0xa4
  8e:	e7ff      	b.n	90 <_ZN3app7display13start_display17h81b47d71c1289238E+0x90>
  90:	9829      	ldr	r0, [sp, #164]	; 0xa4
  92:	1e41      	subs	r1, r0, #1
  94:	bf18      	it	ne
  96:	2101      	movne	r1, #1
  98:	2801      	cmp	r0, #1
  9a:	911c      	str	r1, [sp, #112]	; 0x70
  9c:	d011      	beq.n	c2 <_ZN3app7display13start_display17h81b47d71c1289238E+0xc2>
  9e:	e7ff      	b.n	a0 <_ZN3app7display13start_display17h81b47d71c1289238E+0xa0>
  a0:	981c      	ldr	r0, [sp, #112]	; 0x70
  a2:	2801      	cmp	r0, #1
  a4:	d1d7      	bne.n	56 <_ZN3app7display13start_display17h81b47d71c1289238E+0x56>
  a6:	e7ff      	b.n	a8 <_ZN3app7display13start_display17h81b47d71c1289238E+0xa8>
  a8:	9829      	ldr	r0, [sp, #164]	; 0xa4
  aa:	902a      	str	r0, [sp, #168]	; 0xa8
  ac:	982a      	ldr	r0, [sp, #168]	; 0xa8
  ae:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  b2:	901b      	str	r0, [sp, #108]	; 0x6c
  b4:	e7ff      	b.n	b6 <_ZN3app7display13start_display17h81b47d71c1289238E+0xb6>
  b6:	981b      	ldr	r0, [sp, #108]	; 0x6c
  b8:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
  bc:	9021      	str	r0, [sp, #132]	; 0x84
  be:	e7ff      	b.n	c0 <_ZN3app7display13start_display17h81b47d71c1289238E+0xc0>
  c0:	e7da      	b.n	78 <_ZN3app7display13start_display17h81b47d71c1289238E+0x78>
  c2:	a825      	add	r0, sp, #148	; 0x94
  c4:	211a      	movs	r1, #26
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:66
    rst_gpio.init(26) ? ;  //  LCD_RESET (P0.26): Display reset
  c6:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E>
  ca:	901a      	str	r0, [sp, #104]	; 0x68
  cc:	e7ff      	b.n	ce <_ZN3app7display13start_display17h81b47d71c1289238E+0xce>
  ce:	981a      	ldr	r0, [sp, #104]	; 0x68
  d0:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
  d4:	902c      	str	r0, [sp, #176]	; 0xb0
  d6:	e7ff      	b.n	d8 <_ZN3app7display13start_display17h81b47d71c1289238E+0xd8>
  d8:	982c      	ldr	r0, [sp, #176]	; 0xb0
  da:	1e41      	subs	r1, r0, #1
  dc:	bf18      	it	ne
  de:	2101      	movne	r1, #1
  e0:	2801      	cmp	r0, #1
  e2:	9119      	str	r1, [sp, #100]	; 0x64
  e4:	d011      	beq.n	10a <_ZN3app7display13start_display17h81b47d71c1289238E+0x10a>
  e6:	e7ff      	b.n	e8 <_ZN3app7display13start_display17h81b47d71c1289238E+0xe8>
  e8:	9819      	ldr	r0, [sp, #100]	; 0x64
  ea:	2801      	cmp	r0, #1
  ec:	d1b3      	bne.n	56 <_ZN3app7display13start_display17h81b47d71c1289238E+0x56>
  ee:	e7ff      	b.n	f0 <_ZN3app7display13start_display17h81b47d71c1289238E+0xf0>
  f0:	982c      	ldr	r0, [sp, #176]	; 0xb0
  f2:	902d      	str	r0, [sp, #180]	; 0xb4
  f4:	982d      	ldr	r0, [sp, #180]	; 0xb4
  f6:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
  fa:	9018      	str	r0, [sp, #96]	; 0x60
  fc:	e7ff      	b.n	fe <_ZN3app7display13start_display17h81b47d71c1289238E+0xfe>
  fe:	9818      	ldr	r0, [sp, #96]	; 0x60
 100:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 104:	9021      	str	r0, [sp, #132]	; 0x84
 106:	e7ff      	b.n	108 <_ZN3app7display13start_display17h81b47d71c1289238E+0x108>
 108:	e7b6      	b.n	78 <_ZN3app7display13start_display17h81b47d71c1289238E+0x78>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:70
        BACKLIGHT_HIGH = MynewtGPIO::new();
 10a:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal10MynewtGPIO3new17h8a9c54680bf69bbdE>
 10e:	9017      	str	r0, [sp, #92]	; 0x5c
 110:	e7ff      	b.n	112 <_ZN3app7display13start_display17h81b47d71c1289238E+0x112>
 112:	f240 0000 	movw	r0, #0
 116:	f2c0 0000 	movt	r0, #0
 11a:	9917      	ldr	r1, [sp, #92]	; 0x5c
 11c:	6001      	str	r1, [r0, #0]
 11e:	2117      	movs	r1, #23
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:71
        BACKLIGHT_HIGH.init(23) ? ;  //  LCD_BACKLIGHT_{LOW,MID,HIGH} (P0.14, 22, 23): Backlight (active low)
 120:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal10MynewtGPIO4init17h35512e0c0fa808b7E>
 124:	9016      	str	r0, [sp, #88]	; 0x58
 126:	e7ff      	b.n	128 <_ZN3app7display13start_display17h81b47d71c1289238E+0x128>
 128:	9816      	ldr	r0, [sp, #88]	; 0x58
 12a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
 12e:	902f      	str	r0, [sp, #188]	; 0xbc
 130:	e7ff      	b.n	132 <_ZN3app7display13start_display17h81b47d71c1289238E+0x132>
 132:	982f      	ldr	r0, [sp, #188]	; 0xbc
 134:	1e41      	subs	r1, r0, #1
 136:	bf18      	it	ne
 138:	2101      	movne	r1, #1
 13a:	2801      	cmp	r0, #1
 13c:	9115      	str	r1, [sp, #84]	; 0x54
 13e:	d012      	beq.n	166 <_ZN3app7display13start_display17h81b47d71c1289238E+0x166>
 140:	e7ff      	b.n	142 <_ZN3app7display13start_display17h81b47d71c1289238E+0x142>
 142:	9815      	ldr	r0, [sp, #84]	; 0x54
 144:	2801      	cmp	r0, #1
 146:	f47f af86 	bne.w	56 <_ZN3app7display13start_display17h81b47d71c1289238E+0x56>
 14a:	e7ff      	b.n	14c <_ZN3app7display13start_display17h81b47d71c1289238E+0x14c>
 14c:	982f      	ldr	r0, [sp, #188]	; 0xbc
 14e:	9030      	str	r0, [sp, #192]	; 0xc0
 150:	9830      	ldr	r0, [sp, #192]	; 0xc0
 152:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
 156:	9014      	str	r0, [sp, #80]	; 0x50
 158:	e7ff      	b.n	15a <_ZN3app7display13start_display17h81b47d71c1289238E+0x15a>
 15a:	9814      	ldr	r0, [sp, #80]	; 0x50
 15c:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 160:	9021      	str	r0, [sp, #132]	; 0x84
 162:	e7ff      	b.n	164 <_ZN3app7display13start_display17h81b47d71c1289238E+0x164>
 164:	e788      	b.n	78 <_ZN3app7display13start_display17h81b47d71c1289238E+0x78>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:72
        BACKLIGHT_HIGH.set_low() ? ;    
 166:	f240 0000 	movw	r0, #0
 16a:	f2c0 0000 	movt	r0, #0
 16e:	f7ff fffe 	bl	0 <_ZN84_$LT$app..mynewt_hal..MynewtGPIO$u20$as$u20$embedded_hal..digital..v2..OutputPin$GT$7set_low17haecc9cd16e86a96cE>
 172:	9013      	str	r0, [sp, #76]	; 0x4c
 174:	e7ff      	b.n	176 <_ZN3app7display13start_display17h81b47d71c1289238E+0x176>
 176:	9813      	ldr	r0, [sp, #76]	; 0x4c
 178:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h395621413dd7c449E>
 17c:	9032      	str	r0, [sp, #200]	; 0xc8
 17e:	e7ff      	b.n	180 <_ZN3app7display13start_display17h81b47d71c1289238E+0x180>
 180:	9832      	ldr	r0, [sp, #200]	; 0xc8
 182:	1e41      	subs	r1, r0, #1
 184:	bf18      	it	ne
 186:	2101      	movne	r1, #1
 188:	2801      	cmp	r0, #1
 18a:	9112      	str	r1, [sp, #72]	; 0x48
 18c:	d012      	beq.n	1b4 <_ZN3app7display13start_display17h81b47d71c1289238E+0x1b4>
 18e:	e7ff      	b.n	190 <_ZN3app7display13start_display17h81b47d71c1289238E+0x190>
 190:	9812      	ldr	r0, [sp, #72]	; 0x48
 192:	2801      	cmp	r0, #1
 194:	f47f af5f 	bne.w	56 <_ZN3app7display13start_display17h81b47d71c1289238E+0x56>
 198:	e7ff      	b.n	19a <_ZN3app7display13start_display17h81b47d71c1289238E+0x19a>
 19a:	9832      	ldr	r0, [sp, #200]	; 0xc8
 19c:	9033      	str	r0, [sp, #204]	; 0xcc
 19e:	9833      	ldr	r0, [sp, #204]	; 0xcc
 1a0:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>
 1a4:	9011      	str	r0, [sp, #68]	; 0x44
 1a6:	e7ff      	b.n	1a8 <_ZN3app7display13start_display17h81b47d71c1289238E+0x1a8>
 1a8:	9811      	ldr	r0, [sp, #68]	; 0x44
 1aa:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 1ae:	9021      	str	r0, [sp, #132]	; 0x84
 1b0:	e7ff      	b.n	1b2 <_ZN3app7display13start_display17h81b47d71c1289238E+0x1b2>
 1b2:	e761      	b.n	78 <_ZN3app7display13start_display17h81b47d71c1289238E+0x78>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:77
        spi_port,    //  SPI Port
 1b4:	9922      	ldr	r1, [sp, #136]	; 0x88
 1b6:	9a23      	ldr	r2, [sp, #140]	; 0x8c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:78
        dc_gpio,     //  GPIO Pin for DC
 1b8:	9b24      	ldr	r3, [sp, #144]	; 0x90
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:79
        rst_gpio,    //  GPIO Pin for RST
 1ba:	9825      	ldr	r0, [sp, #148]	; 0x94
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:76
    unsafe { DISPLAY = st7735_lcd::ST7735::new(
 1bc:	46ec      	mov	ip, sp
 1be:	f04f 0e01 	mov.w	lr, #1
 1c2:	f8cc e008 	str.w	lr, [ip, #8]
 1c6:	f8cc e004 	str.w	lr, [ip, #4]
 1ca:	f8cc 0000 	str.w	r0, [ip]
 1ce:	a835      	add	r0, sp, #212	; 0xd4
 1d0:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$3new17h9e4d0196c0cc7655E>
 1d4:	e7ff      	b.n	2 <_ZN3app7display13start_display17h81b47d71c1289238E+0x2>
 1d6:	f240 0000 	movw	r0, #0
 1da:	f2c0 0000 	movt	r0, #0
 1de:	a935      	add	r1, sp, #212	; 0xd4
 1e0:	e891 503c 	ldmia.w	r1, {r2, r3, r4, r5, ip, lr}
 1e4:	e880 503c 	stmia.w	r0, {r2, r3, r4, r5, ip, lr}
 1e8:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:86
        ::new(Coord::new(0, 0), Coord::new(240, 240))
 1ea:	9010      	str	r0, [sp, #64]	; 0x40
 1ec:	9910      	ldr	r1, [sp, #64]	; 0x40
 1ee:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
 1f2:	900f      	str	r0, [sp, #60]	; 0x3c
 1f4:	910e      	str	r1, [sp, #56]	; 0x38
 1f6:	e7ff      	b.n	1f8 <_ZN3app7display13start_display17h81b47d71c1289238E+0x1f8>
 1f8:	20f0      	movs	r0, #240	; 0xf0
 1fa:	900d      	str	r0, [sp, #52]	; 0x34
 1fc:	990d      	ldr	r1, [sp, #52]	; 0x34
 1fe:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
 202:	900c      	str	r0, [sp, #48]	; 0x30
 204:	910b      	str	r1, [sp, #44]	; 0x2c
 206:	e7ff      	b.n	208 <_ZN3app7display13start_display17h81b47d71c1289238E+0x208>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:85
    let background = Rectangle::<Rgb565>
 208:	4668      	mov	r0, sp
 20a:	990b      	ldr	r1, [sp, #44]	; 0x2c
 20c:	6001      	str	r1, [r0, #0]
 20e:	a842      	add	r0, sp, #264	; 0x108
 210:	990f      	ldr	r1, [sp, #60]	; 0x3c
 212:	9a0e      	ldr	r2, [sp, #56]	; 0x38
 214:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 216:	f7ff fffe 	bl	0 <_ZN17embedded_graphics10primitives9rectangle18Rectangle$LT$C$GT$3new17h974137b1f3d0fbc4E>
 21a:	e7ff      	b.n	21c <_ZN3app7display13start_display17h81b47d71c1289238E+0x21c>
 21c:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:87
        .fill(Some(Rgb565::from((0x0, 0x0, 0x0))));  //  Black
 21e:	f88d 0128 	strb.w	r0, [sp, #296]	; 0x128
 222:	f88d 0129 	strb.w	r0, [sp, #297]	; 0x129
 226:	f88d 012a 	strb.w	r0, [sp, #298]	; 0x12a
 22a:	f89d 012a 	ldrb.w	r0, [sp, #298]	; 0x12a
 22e:	f8bd 1128 	ldrh.w	r1, [sp, #296]	; 0x128
 232:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 236:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
 23a:	900a      	str	r0, [sp, #40]	; 0x28
 23c:	e7ff      	b.n	23e <_ZN3app7display13start_display17h81b47d71c1289238E+0x23e>
 23e:	980a      	ldr	r0, [sp, #40]	; 0x28
 240:	f8ad 0126 	strh.w	r0, [sp, #294]	; 0x126
 244:	2101      	movs	r1, #1
 246:	f8ad 1124 	strh.w	r1, [sp, #292]	; 0x124
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:85
    let background = Rectangle::<Rgb565>
 24a:	f8bd 3126 	ldrh.w	r3, [sp, #294]	; 0x126
 24e:	f8bd 2124 	ldrh.w	r2, [sp, #292]	; 0x124
 252:	a83b      	add	r0, sp, #236	; 0xec
 254:	a942      	add	r1, sp, #264	; 0x108
 256:	f7ff fffe 	bl	0 <_ZN125_$LT$embedded_graphics..primitives..rectangle..Rectangle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hc548e9c477b6c03cE>
 25a:	e7ff      	b.n	2 <_ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:88
    let mut delay = MynewtDelay::new();
 25c:	f7ff fffe 	bl	0 <_ZN3app10mynewt_hal11MynewtDelay3new17heda0a050cddd9cafE>
 260:	e7ff      	b.n	2 <_ZN3app7display13start_display17h81b47d71c1289238E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:90
        DISPLAY.init(&mut delay) ? ;
 262:	f240 0000 	movw	r0, #0
 266:	f2c0 0000 	movt	r0, #0
 26a:	a94b      	add	r1, sp, #300	; 0x12c
 26c:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$4init17h80b289254c4bc026E>
 270:	9009      	str	r0, [sp, #36]	; 0x24
 272:	e7ff      	b.n	274 <_ZN3app7display13start_display17h81b47d71c1289238E+0x274>
 274:	9809      	ldr	r0, [sp, #36]	; 0x24
 276:	f000 0001 	and.w	r0, r0, #1
 27a:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 27e:	f88d 012f 	strb.w	r0, [sp, #303]	; 0x12f
 282:	e7ff      	b.n	284 <_ZN3app7display13start_display17h81b47d71c1289238E+0x284>
 284:	f89d 012f 	ldrb.w	r0, [sp, #303]	; 0x12f
 288:	07c1      	lsls	r1, r0, #31
 28a:	2900      	cmp	r1, #0
 28c:	9008      	str	r0, [sp, #32]
 28e:	d010      	beq.n	2b2 <_ZN3app7display13start_display17h81b47d71c1289238E+0x2b2>
 290:	e7ff      	b.n	292 <_ZN3app7display13start_display17h81b47d71c1289238E+0x292>
 292:	9808      	ldr	r0, [sp, #32]
 294:	2801      	cmp	r0, #1
 296:	f47f aede 	bne.w	56 <_ZN3app7display13start_display17h81b47d71c1289238E+0x56>
 29a:	e7ff      	b.n	2 <_ZN83_$LT$mynewt..result..MynewtError$u20$as$u20$core..convert..From$LT$$LP$$RP$$GT$$GT$4from17h25f954951b1a7ea7E+0x2>
 29c:	f7ff fffe 	bl	0 <_ZN83_$LT$mynewt..result..MynewtError$u20$as$u20$core..convert..From$LT$$LP$$RP$$GT$$GT$4from17h25f954951b1a7ea7E>
 2a0:	9007      	str	r0, [sp, #28]
 2a2:	e7ff      	b.n	2a4 <_ZN3app7display13start_display17h81b47d71c1289238E+0x2a4>
 2a4:	9807      	ldr	r0, [sp, #28]
 2a6:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 2aa:	9021      	str	r0, [sp, #132]	; 0x84
 2ac:	e7ff      	b.n	2ae <_ZN3app7display13start_display17h81b47d71c1289238E+0x2ae>
 2ae:	e7ff      	b.n	2b0 <_ZN3app7display13start_display17h81b47d71c1289238E+0x2b0>
 2b0:	e6e2      	b.n	78 <_ZN3app7display13start_display17h81b47d71c1289238E+0x78>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:91
        DISPLAY.set_orientation(&Orientation::Landscape) ? ;
 2b2:	f240 0000 	movw	r0, #0
 2b6:	f2c0 0000 	movt	r0, #0
 2ba:	f240 0100 	movw	r1, #0
 2be:	f2c0 0100 	movt	r1, #0
 2c2:	f7ff fffe 	bl	0 <_ZN10st7735_lcd28ST7735$LT$SPI$C$DC$C$RST$GT$15set_orientation17h434d781ac565dc1bE>
 2c6:	9006      	str	r0, [sp, #24]
 2c8:	e7ff      	b.n	2ca <_ZN3app7display13start_display17h81b47d71c1289238E+0x2ca>
 2ca:	9806      	ldr	r0, [sp, #24]
 2cc:	f000 0001 	and.w	r0, r0, #1
 2d0:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$11into_result17h90b4fc424b9950b8E>
 2d4:	f88d 0137 	strb.w	r0, [sp, #311]	; 0x137
 2d8:	e7ff      	b.n	2da <_ZN3app7display13start_display17h81b47d71c1289238E+0x2da>
 2da:	f89d 0137 	ldrb.w	r0, [sp, #311]	; 0x137
 2de:	07c1      	lsls	r1, r0, #31
 2e0:	2900      	cmp	r1, #0
 2e2:	9005      	str	r0, [sp, #20]
 2e4:	d00f      	beq.n	306 <_ZN3app7display13start_display17h81b47d71c1289238E+0x306>
 2e6:	e7ff      	b.n	2e8 <_ZN3app7display13start_display17h81b47d71c1289238E+0x2e8>
 2e8:	9805      	ldr	r0, [sp, #20]
 2ea:	2801      	cmp	r0, #1
 2ec:	f47f aeb3 	bne.w	56 <_ZN3app7display13start_display17h81b47d71c1289238E+0x56>
 2f0:	e7ff      	b.n	2 <_ZN83_$LT$mynewt..result..MynewtError$u20$as$u20$core..convert..From$LT$$LP$$RP$$GT$$GT$4from17h25f954951b1a7ea7E+0x2>
 2f2:	f7ff fffe 	bl	0 <_ZN83_$LT$mynewt..result..MynewtError$u20$as$u20$core..convert..From$LT$$LP$$RP$$GT$$GT$4from17h25f954951b1a7ea7E>
 2f6:	9004      	str	r0, [sp, #16]
 2f8:	e7ff      	b.n	2fa <_ZN3app7display13start_display17h81b47d71c1289238E+0x2fa>
 2fa:	9804      	ldr	r0, [sp, #16]
 2fc:	f7ff fffe 	bl	0 <_ZN73_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..ops..try..Try$GT$10from_error17h28b90fc5bdc9b6c9E>
 300:	9021      	str	r0, [sp, #132]	; 0x84
 302:	e7ff      	b.n	304 <_ZN3app7display13start_display17h81b47d71c1289238E+0x304>
 304:	e7d4      	b.n	2b0 <_ZN3app7display13start_display17h81b47d71c1289238E+0x2b0>
 306:	a83b      	add	r0, sp, #236	; 0xec
 308:	a950      	add	r1, sp, #320	; 0x140
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:93
        DISPLAY.draw(background);
 30a:	460a      	mov	r2, r1
 30c:	e8b0 5008 	ldmia.w	r0!, {r3, ip, lr}
 310:	e8a2 5008 	stmia.w	r2!, {r3, ip, lr}
 314:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
 318:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
 31c:	f240 0000 	movw	r0, #0
 320:	f2c0 0000 	movt	r0, #0
 324:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hdcd76bb129f43599E>
 328:	e7ff      	b.n	32a <_ZN3app7display13start_display17h81b47d71c1289238E+0x32a>
 32a:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:95
    Ok(())
 32c:	9021      	str	r0, [sp, #132]	; 0x84
 32e:	2001      	movs	r0, #1
 330:	9021      	str	r0, [sp, #132]	; 0x84
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:96
}
 332:	e69e      	b.n	72 <_ZN3app7display13start_display17h81b47d71c1289238E+0x72>

Disassembly of section .text._ZN3app7display10show_touch17hb30bdb206ccb1c66E:

00000000 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E>:
_ZN3app7display10show_touch17hb30bdb206ccb1c66E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:99

/// Display the touched (X, Y) coordinates
pub fn show_touch(x: u16, y: u16) -> MynewtResult<()> {
   0:	b510      	push	{r4, lr}
   2:	f5ad 7d06 	sub.w	sp, sp, #536	; 0x218
   6:	460a      	mov	r2, r1
   8:	4603      	mov	r3, r0
   a:	f8ad 0054 	strh.w	r0, [sp, #84]	; 0x54
   e:	f8ad 1056 	strh.w	r1, [sp, #86]	; 0x56
  12:	a817      	add	r0, sp, #92	; 0x5c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:101
    //  Format coordinates as text into a fixed-size buffer
    let mut buf_x = ArrayString::<[u8; 20]>::new();
  14:	9214      	str	r2, [sp, #80]	; 0x50
  16:	9313      	str	r3, [sp, #76]	; 0x4c
  18:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E>
  1c:	e7ff      	b.n	1e <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x1e>
  1e:	a81d      	add	r0, sp, #116	; 0x74
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:102
    let mut buf_y = ArrayString::<[u8; 20]>::new();
  20:	f7ff fffe 	bl	0 <_ZN8arrayvec12array_string20ArrayString$LT$A$GT$3new17h6d70e4d2684fcf85E>
  24:	e7ff      	b.n	26 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x26>
  26:	a815      	add	r0, sp, #84	; 0x54
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:103
    write!(&mut buf_x, "  X = {}  ", x)
  28:	902b      	str	r0, [sp, #172]	; 0xac
  2a:	982b      	ldr	r0, [sp, #172]	; 0xac
  2c:	902c      	str	r0, [sp, #176]	; 0xb0
  2e:	982c      	ldr	r0, [sp, #176]	; 0xb0
  30:	f240 0100 	movw	r1, #0
  34:	f2c0 0100 	movt	r1, #0
  38:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h1b9239df91074954E>
  3c:	9012      	str	r0, [sp, #72]	; 0x48
  3e:	9111      	str	r1, [sp, #68]	; 0x44
  40:	e7ff      	b.n	42 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x42>
  42:	9812      	ldr	r0, [sp, #72]	; 0x48
  44:	9029      	str	r0, [sp, #164]	; 0xa4
  46:	9911      	ldr	r1, [sp, #68]	; 0x44
  48:	912a      	str	r1, [sp, #168]	; 0xa8
  4a:	466a      	mov	r2, sp
  4c:	2301      	movs	r3, #1
  4e:	6013      	str	r3, [r2, #0]
  50:	f240 0100 	movw	r1, #0
  54:	f2c0 0100 	movt	r1, #0
  58:	a823      	add	r0, sp, #140	; 0x8c
  5a:	2202      	movs	r2, #2
  5c:	ab29      	add	r3, sp, #164	; 0xa4
  5e:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
  62:	e7ff      	b.n	64 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x64>
  64:	a817      	add	r0, sp, #92	; 0x5c
  66:	a923      	add	r1, sp, #140	; 0x8c
  68:	f7ff fffe 	bl	0 <_ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E>
  6c:	9010      	str	r0, [sp, #64]	; 0x40
  6e:	e7ff      	b.n	70 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x70>
  70:	9810      	ldr	r0, [sp, #64]	; 0x40
  72:	f000 0001 	and.w	r0, r0, #1
  76:	f240 0100 	movw	r1, #0
  7a:	f2c0 0100 	movt	r1, #0
  7e:	220f      	movs	r2, #15
  80:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE>
  84:	e7ff      	b.n	86 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x86>
  86:	f10d 0056 	add.w	r0, sp, #86	; 0x56
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:105
        .expect("show touch fail");
    write!(&mut buf_y, "  Y = {}  ", y)
  8a:	9035      	str	r0, [sp, #212]	; 0xd4
  8c:	9835      	ldr	r0, [sp, #212]	; 0xd4
  8e:	9036      	str	r0, [sp, #216]	; 0xd8
  90:	9836      	ldr	r0, [sp, #216]	; 0xd8
  92:	f240 0100 	movw	r1, #0
  96:	f2c0 0100 	movt	r1, #0
  9a:	f7ff fffe 	bl	0 <_ZN4core3fmt10ArgumentV13new17h1b9239df91074954E>
  9e:	900f      	str	r0, [sp, #60]	; 0x3c
  a0:	910e      	str	r1, [sp, #56]	; 0x38
  a2:	e7ff      	b.n	a4 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0xa4>
  a4:	980f      	ldr	r0, [sp, #60]	; 0x3c
  a6:	9033      	str	r0, [sp, #204]	; 0xcc
  a8:	990e      	ldr	r1, [sp, #56]	; 0x38
  aa:	9134      	str	r1, [sp, #208]	; 0xd0
  ac:	466a      	mov	r2, sp
  ae:	2301      	movs	r3, #1
  b0:	6013      	str	r3, [r2, #0]
  b2:	f240 0100 	movw	r1, #0
  b6:	f2c0 0100 	movt	r1, #0
  ba:	a82d      	add	r0, sp, #180	; 0xb4
  bc:	2202      	movs	r2, #2
  be:	ab33      	add	r3, sp, #204	; 0xcc
  c0:	f7ff fffe 	bl	0 <_ZN4core3fmt9Arguments6new_v117h5c4c761bdd4c3867E>
  c4:	e7ff      	b.n	c6 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0xc6>
  c6:	a81d      	add	r0, sp, #116	; 0x74
  c8:	a92d      	add	r1, sp, #180	; 0xb4
  ca:	f7ff fffe 	bl	0 <_ZN4core3fmt5Write9write_fmt17hbc34763b849ab058E>
  ce:	900d      	str	r0, [sp, #52]	; 0x34
  d0:	e7ff      	b.n	d2 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0xd2>
  d2:	980d      	ldr	r0, [sp, #52]	; 0x34
  d4:	f000 0001 	and.w	r0, r0, #1
  d8:	f240 0100 	movw	r1, #0
  dc:	f2c0 0100 	movt	r1, #0
  e0:	220f      	movs	r2, #15
  e2:	f7ff fffe 	bl	0 <_ZN4core6result19Result$LT$T$C$E$GT$6expect17h1acd3fcca1f40e7fE>
  e6:	e7ff      	b.n	e8 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0xe8>
  e8:	a817      	add	r0, sp, #92	; 0x5c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:110
        .expect("show touch fail");

    //  Prepare the text for rendering
    let text_x = fonts::Font12x16::<Rgb565>
        ::render_str(&buf_x)
  ea:	f7ff fffe 	bl	0 <_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E>
  ee:	900c      	str	r0, [sp, #48]	; 0x30
  f0:	910b      	str	r1, [sp, #44]	; 0x2c
  f2:	e7ff      	b.n	f4 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0xf4>
  f4:	a84c      	add	r0, sp, #304	; 0x130
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:109
    let text_x = fonts::Font12x16::<Rgb565>
  f6:	990c      	ldr	r1, [sp, #48]	; 0x30
  f8:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
  fa:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE>
  fe:	e7ff      	b.n	100 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x100>
 100:	20ff      	movs	r0, #255	; 0xff
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:111
        .stroke(Some(Rgb565::from((0xff, 0xff, 0xff))))  //  White
 102:	f88d 0150 	strb.w	r0, [sp, #336]	; 0x150
 106:	f88d 0151 	strb.w	r0, [sp, #337]	; 0x151
 10a:	f88d 0152 	strb.w	r0, [sp, #338]	; 0x152
 10e:	f89d 0152 	ldrb.w	r0, [sp, #338]	; 0x152
 112:	f8bd 1150 	ldrh.w	r1, [sp, #336]	; 0x150
 116:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 11a:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
 11e:	900a      	str	r0, [sp, #40]	; 0x28
 120:	e7ff      	b.n	122 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x122>
 122:	980a      	ldr	r0, [sp, #40]	; 0x28
 124:	f8ad 014e 	strh.w	r0, [sp, #334]	; 0x14e
 128:	2101      	movs	r1, #1
 12a:	f8ad 114c 	strh.w	r1, [sp, #332]	; 0x14c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:109
    let text_x = fonts::Font12x16::<Rgb565>
 12e:	f8bd 314e 	ldrh.w	r3, [sp, #334]	; 0x14e
 132:	f8bd 214c 	ldrh.w	r2, [sp, #332]	; 0x14c
 136:	a845      	add	r0, sp, #276	; 0x114
 138:	a94c      	add	r1, sp, #304	; 0x130
 13a:	f7ff fffe 	bl	0 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE>
 13e:	e7ff      	b.n	140 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x140>
 140:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:112
        .fill(Some(Rgb565::from((0x00, 0x00, 0x00))))    //  Black
 142:	f88d 0158 	strb.w	r0, [sp, #344]	; 0x158
 146:	f88d 0159 	strb.w	r0, [sp, #345]	; 0x159
 14a:	f88d 015a 	strb.w	r0, [sp, #346]	; 0x15a
 14e:	f89d 015a 	ldrb.w	r0, [sp, #346]	; 0x15a
 152:	f8bd 1158 	ldrh.w	r1, [sp, #344]	; 0x158
 156:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 15a:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
 15e:	9009      	str	r0, [sp, #36]	; 0x24
 160:	e7ff      	b.n	162 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x162>
 162:	9809      	ldr	r0, [sp, #36]	; 0x24
 164:	f8ad 0156 	strh.w	r0, [sp, #342]	; 0x156
 168:	2101      	movs	r1, #1
 16a:	f8ad 1154 	strh.w	r1, [sp, #340]	; 0x154
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:109
    let text_x = fonts::Font12x16::<Rgb565>
 16e:	f8bd 3156 	ldrh.w	r3, [sp, #342]	; 0x156
 172:	f8bd 2154 	ldrh.w	r2, [sp, #340]	; 0x154
 176:	a83e      	add	r0, sp, #248	; 0xf8
 178:	a945      	add	r1, sp, #276	; 0x114
 17a:	f7ff fffe 	bl	0 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E>
 17e:	e7ff      	b.n	180 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x180>
 180:	2028      	movs	r0, #40	; 0x28
 182:	2164      	movs	r1, #100	; 0x64
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:113
        .translate(Coord::new(40, 100));
 184:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
 188:	9008      	str	r0, [sp, #32]
 18a:	9107      	str	r1, [sp, #28]
 18c:	e7ff      	b.n	18e <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x18e>
 18e:	a837      	add	r0, sp, #220	; 0xdc
 190:	a93e      	add	r1, sp, #248	; 0xf8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:109
    let text_x = fonts::Font12x16::<Rgb565>
 192:	9a08      	ldr	r2, [sp, #32]
 194:	9b07      	ldr	r3, [sp, #28]
 196:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E>
 19a:	e7ff      	b.n	19c <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x19c>
 19c:	a81d      	add	r0, sp, #116	; 0x74
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:115
    let text_y = fonts::Font12x16::<Rgb565>
        ::render_str(&buf_y)
 19e:	f7ff fffe 	bl	0 <_ZN88_$LT$arrayvec..array_string..ArrayString$LT$A$GT$$u20$as$u20$core..ops..deref..Deref$GT$5deref17h288aa7cfc1201e14E>
 1a2:	9006      	str	r0, [sp, #24]
 1a4:	9105      	str	r1, [sp, #20]
 1a6:	e7ff      	b.n	1a8 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x1a8>
 1a8:	a86c      	add	r0, sp, #432	; 0x1b0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:114
    let text_y = fonts::Font12x16::<Rgb565>
 1aa:	9906      	ldr	r1, [sp, #24]
 1ac:	9a05      	ldr	r2, [sp, #20]
 1ae:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE>
 1b2:	e7ff      	b.n	1b4 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x1b4>
 1b4:	20ff      	movs	r0, #255	; 0xff
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:116
        .stroke(Some(Rgb565::from((0xff, 0xff, 0xff))))  //  White
 1b6:	f88d 01d0 	strb.w	r0, [sp, #464]	; 0x1d0
 1ba:	f88d 01d1 	strb.w	r0, [sp, #465]	; 0x1d1
 1be:	f88d 01d2 	strb.w	r0, [sp, #466]	; 0x1d2
 1c2:	f89d 01d2 	ldrb.w	r0, [sp, #466]	; 0x1d2
 1c6:	f8bd 11d0 	ldrh.w	r1, [sp, #464]	; 0x1d0
 1ca:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 1ce:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
 1d2:	9004      	str	r0, [sp, #16]
 1d4:	e7ff      	b.n	1d6 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x1d6>
 1d6:	9804      	ldr	r0, [sp, #16]
 1d8:	f8ad 01ce 	strh.w	r0, [sp, #462]	; 0x1ce
 1dc:	2101      	movs	r1, #1
 1de:	f8ad 11cc 	strh.w	r1, [sp, #460]	; 0x1cc
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:114
    let text_y = fonts::Font12x16::<Rgb565>
 1e2:	f8bd 31ce 	ldrh.w	r3, [sp, #462]	; 0x1ce
 1e6:	f8bd 21cc 	ldrh.w	r2, [sp, #460]	; 0x1cc
 1ea:	a865      	add	r0, sp, #404	; 0x194
 1ec:	a96c      	add	r1, sp, #432	; 0x1b0
 1ee:	f7ff fffe 	bl	0 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE>
 1f2:	e7ff      	b.n	1f4 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x1f4>
 1f4:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:117
        .fill(Some(Rgb565::from((0x00, 0x00, 0x00))))    //  Black
 1f6:	f88d 01d8 	strb.w	r0, [sp, #472]	; 0x1d8
 1fa:	f88d 01d9 	strb.w	r0, [sp, #473]	; 0x1d9
 1fe:	f88d 01da 	strb.w	r0, [sp, #474]	; 0x1da
 202:	f89d 01da 	ldrb.w	r0, [sp, #474]	; 0x1da
 206:	f8bd 11d8 	ldrh.w	r1, [sp, #472]	; 0x1d8
 20a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
 20e:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
 212:	9003      	str	r0, [sp, #12]
 214:	e7ff      	b.n	216 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x216>
 216:	9803      	ldr	r0, [sp, #12]
 218:	f8ad 01d6 	strh.w	r0, [sp, #470]	; 0x1d6
 21c:	2101      	movs	r1, #1
 21e:	f8ad 11d4 	strh.w	r1, [sp, #468]	; 0x1d4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:114
    let text_y = fonts::Font12x16::<Rgb565>
 222:	f8bd 31d6 	ldrh.w	r3, [sp, #470]	; 0x1d6
 226:	f8bd 21d4 	ldrh.w	r2, [sp, #468]	; 0x1d4
 22a:	a85e      	add	r0, sp, #376	; 0x178
 22c:	a965      	add	r1, sp, #404	; 0x194
 22e:	f7ff fffe 	bl	0 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E>
 232:	e7ff      	b.n	234 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x234>
 234:	2028      	movs	r0, #40	; 0x28
 236:	2182      	movs	r1, #130	; 0x82
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:118
        .translate(Coord::new(40, 130));
 238:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
 23c:	9002      	str	r0, [sp, #8]
 23e:	9101      	str	r1, [sp, #4]
 240:	e7ff      	b.n	242 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x242>
 242:	a857      	add	r0, sp, #348	; 0x15c
 244:	a95e      	add	r1, sp, #376	; 0x178
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:114
    let text_y = fonts::Font12x16::<Rgb565>
 246:	9a02      	ldr	r2, [sp, #8]
 248:	9b01      	ldr	r3, [sp, #4]
 24a:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E>
 24e:	e7ff      	b.n	250 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x250>
 250:	a837      	add	r0, sp, #220	; 0xdc
 252:	a977      	add	r1, sp, #476	; 0x1dc
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:122
        
    //  Render text to display
    unsafe {
        DISPLAY.draw(text_x);    
 254:	460a      	mov	r2, r1
 256:	e8b0 5008 	ldmia.w	r0!, {r3, ip, lr}
 25a:	e8a2 5008 	stmia.w	r2!, {r3, ip, lr}
 25e:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
 262:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
 266:	f240 0000 	movw	r0, #0
 26a:	f2c0 0000 	movt	r0, #0
 26e:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E>
 272:	e7ff      	b.n	274 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x274>
 274:	a857      	add	r0, sp, #348	; 0x15c
 276:	a97e      	add	r1, sp, #504	; 0x1f8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:123
        DISPLAY.draw(text_y);    
 278:	460a      	mov	r2, r1
 27a:	e8b0 5008 	ldmia.w	r0!, {r3, ip, lr}
 27e:	e8a2 5008 	stmia.w	r2!, {r3, ip, lr}
 282:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
 286:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
 28a:	f240 0000 	movw	r0, #0
 28e:	f2c0 0000 	movt	r0, #0
 292:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E>
 296:	e7ff      	b.n	298 <_ZN3app7display10show_touch17hb30bdb206ccb1c66E+0x298>
 298:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:125
    }
    Ok(())
 29a:	9016      	str	r0, [sp, #88]	; 0x58
 29c:	2001      	movs	r0, #1
 29e:	9016      	str	r0, [sp, #88]	; 0x58
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:126
}
 2a0:	9816      	ldr	r0, [sp, #88]	; 0x58
 2a2:	f50d 7d06 	add.w	sp, sp, #536	; 0x218
 2a6:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN3app7display4test17h4382f834d7e04d48E:

00000000 <_ZN3app7display4test17h4382f834d7e04d48E>:
_ZN3app7display4test17h4382f834d7e04d48E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:129

/// Render the ST7789 display connected to SPI port 0. `start_display()` must have been called earlier.
pub fn test() -> MynewtResult<()> {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b0c6      	sub	sp, #280	; 0x118
   4:	2028      	movs	r0, #40	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:132
    //  Create circle
    let circle = Circle::<Rgb565>
        ::new(Coord::new(40, 40), 40)
   6:	9008      	str	r0, [sp, #32]
   8:	9908      	ldr	r1, [sp, #32]
   a:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
   e:	9007      	str	r0, [sp, #28]
  10:	9106      	str	r1, [sp, #24]
  12:	e7ff      	b.n	14 <_ZN3app7display4test17h4382f834d7e04d48E+0x14>
  14:	a810      	add	r0, sp, #64	; 0x40
  16:	2328      	movs	r3, #40	; 0x28
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:131
    let circle = Circle::<Rgb565>
  18:	9907      	ldr	r1, [sp, #28]
  1a:	9a06      	ldr	r2, [sp, #24]
  1c:	f7ff fffe 	bl	0 <_ZN17embedded_graphics10primitives6circle15Circle$LT$C$GT$3new17hc5ac4a65316928ecE>
  20:	e7ff      	b.n	22 <_ZN3app7display4test17h4382f834d7e04d48E+0x22>
  22:	20ff      	movs	r0, #255	; 0xff
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:133
        .fill(Some(Rgb565::from((0xff, 0x00, 0xff))));  //  Magenta
  24:	f88d 005c 	strb.w	r0, [sp, #92]	; 0x5c
  28:	2100      	movs	r1, #0
  2a:	f88d 105d 	strb.w	r1, [sp, #93]	; 0x5d
  2e:	f88d 005e 	strb.w	r0, [sp, #94]	; 0x5e
  32:	f89d 005e 	ldrb.w	r0, [sp, #94]	; 0x5e
  36:	f8bd 105c 	ldrh.w	r1, [sp, #92]	; 0x5c
  3a:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
  3e:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
  42:	9005      	str	r0, [sp, #20]
  44:	e7ff      	b.n	46 <_ZN3app7display4test17h4382f834d7e04d48E+0x46>
  46:	9805      	ldr	r0, [sp, #20]
  48:	f8ad 005a 	strh.w	r0, [sp, #90]	; 0x5a
  4c:	2101      	movs	r1, #1
  4e:	f8ad 1058 	strh.w	r1, [sp, #88]	; 0x58
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:131
    let circle = Circle::<Rgb565>
  52:	f8bd 305a 	ldrh.w	r3, [sp, #90]	; 0x5a
  56:	f8bd 2058 	ldrh.w	r2, [sp, #88]	; 0x58
  5a:	a80a      	add	r0, sp, #40	; 0x28
  5c:	a910      	add	r1, sp, #64	; 0x40
  5e:	f7ff fffe 	bl	0 <_ZN119_$LT$embedded_graphics..primitives..circle..Circle$LT$C$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17hdc178f7bc3af19d9E>
  62:	e7ff      	b.n	2 <_ZN3app7display4test17h4382f834d7e04d48E+0x2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:136

    //  Create text
    let text = fonts::Font12x16::<Rgb565>
  64:	f240 0100 	movw	r1, #0
  68:	f2c0 0100 	movt	r1, #0
  6c:	a82d      	add	r0, sp, #180	; 0xb4
  6e:	2211      	movs	r2, #17
  70:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE>
  74:	e7ff      	b.n	76 <_ZN3app7display4test17h4382f834d7e04d48E+0x76>
  76:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:138
        ::render_str("I AM RUSTY BEACON")
        .stroke(Some(Rgb565::from((0x00, 0x00, 0x00))))  //  Black
  78:	f88d 00d4 	strb.w	r0, [sp, #212]	; 0xd4
  7c:	f88d 00d5 	strb.w	r0, [sp, #213]	; 0xd5
  80:	f88d 00d6 	strb.w	r0, [sp, #214]	; 0xd6
  84:	f89d 00d6 	ldrb.w	r0, [sp, #214]	; 0xd6
  88:	f8bd 10d4 	ldrh.w	r1, [sp, #212]	; 0xd4
  8c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
  90:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
  94:	9004      	str	r0, [sp, #16]
  96:	e7ff      	b.n	98 <_ZN3app7display4test17h4382f834d7e04d48E+0x98>
  98:	9804      	ldr	r0, [sp, #16]
  9a:	f8ad 00d2 	strh.w	r0, [sp, #210]	; 0xd2
  9e:	2101      	movs	r1, #1
  a0:	f8ad 10d0 	strh.w	r1, [sp, #208]	; 0xd0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:136
    let text = fonts::Font12x16::<Rgb565>
  a4:	f8bd 30d2 	ldrh.w	r3, [sp, #210]	; 0xd2
  a8:	f8bd 20d0 	ldrh.w	r2, [sp, #208]	; 0xd0
  ac:	a826      	add	r0, sp, #152	; 0x98
  ae:	a92d      	add	r1, sp, #180	; 0xb4
  b0:	f7ff fffe 	bl	0 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE>
  b4:	e7ff      	b.n	b6 <_ZN3app7display4test17h4382f834d7e04d48E+0xb6>
  b6:	20ff      	movs	r0, #255	; 0xff
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:139
        .fill(Some(Rgb565::from((0xff, 0xff, 0x00))))    //  Yellow
  b8:	f88d 00dc 	strb.w	r0, [sp, #220]	; 0xdc
  bc:	f88d 00dd 	strb.w	r0, [sp, #221]	; 0xdd
  c0:	2000      	movs	r0, #0
  c2:	f88d 00de 	strb.w	r0, [sp, #222]	; 0xde
  c6:	f89d 00de 	ldrb.w	r0, [sp, #222]	; 0xde
  ca:	f8bd 10dc 	ldrh.w	r1, [sp, #220]	; 0xdc
  ce:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
  d2:	f7ff fffe 	bl	0 <_ZN123_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..convert..From$LT$$LP$u8$C$$u20$u8$C$$u20$u8$RP$$GT$$GT$4from17h6ddbce6ac604d28bE>
  d6:	9003      	str	r0, [sp, #12]
  d8:	e7ff      	b.n	da <_ZN3app7display4test17h4382f834d7e04d48E+0xda>
  da:	9803      	ldr	r0, [sp, #12]
  dc:	f8ad 00da 	strh.w	r0, [sp, #218]	; 0xda
  e0:	2101      	movs	r1, #1
  e2:	f8ad 10d8 	strh.w	r1, [sp, #216]	; 0xd8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:136
    let text = fonts::Font12x16::<Rgb565>
  e6:	f8bd 30da 	ldrh.w	r3, [sp, #218]	; 0xda
  ea:	f8bd 20d8 	ldrh.w	r2, [sp, #216]	; 0xd8
  ee:	a81f      	add	r0, sp, #124	; 0x7c
  f0:	a926      	add	r1, sp, #152	; 0x98
  f2:	f7ff fffe 	bl	0 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E>
  f6:	e7ff      	b.n	f8 <_ZN3app7display4test17h4382f834d7e04d48E+0xf8>
  f8:	2014      	movs	r0, #20
  fa:	2110      	movs	r1, #16
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:140
        .translate(Coord::new(20, 16));
  fc:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
 100:	9002      	str	r0, [sp, #8]
 102:	9101      	str	r1, [sp, #4]
 104:	e7ff      	b.n	106 <_ZN3app7display4test17h4382f834d7e04d48E+0x106>
 106:	a818      	add	r0, sp, #96	; 0x60
 108:	a91f      	add	r1, sp, #124	; 0x7c
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:136
    let text = fonts::Font12x16::<Rgb565>
 10a:	9a02      	ldr	r2, [sp, #8]
 10c:	9b01      	ldr	r3, [sp, #4]
 10e:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E>
 112:	e7ff      	b.n	114 <_ZN3app7display4test17h4382f834d7e04d48E+0x114>
 114:	a80a      	add	r0, sp, #40	; 0x28
 116:	a938      	add	r1, sp, #224	; 0xe0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:144

    //  Render circle and text to display
    unsafe {
        DISPLAY.draw(circle);
 118:	460a      	mov	r2, r1
 11a:	e890 5078 	ldmia.w	r0, {r3, r4, r5, r6, ip, lr}
 11e:	e882 5078 	stmia.w	r2, {r3, r4, r5, r6, ip, lr}
 122:	f240 0000 	movw	r0, #0
 126:	f2c0 0000 	movt	r0, #0
 12a:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17he6c229489c81532fE>
 12e:	e7ff      	b.n	130 <_ZN3app7display4test17h4382f834d7e04d48E+0x130>
 130:	a818      	add	r0, sp, #96	; 0x60
 132:	a93e      	add	r1, sp, #248	; 0xf8
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:145
        DISPLAY.draw(text);    
 134:	460a      	mov	r2, r1
 136:	e8b0 5008 	ldmia.w	r0!, {r3, ip, lr}
 13a:	e8a2 5008 	stmia.w	r2!, {r3, ip, lr}
 13e:	e890 5018 	ldmia.w	r0, {r3, r4, ip, lr}
 142:	e882 5018 	stmia.w	r2, {r3, r4, ip, lr}
 146:	f240 0000 	movw	r0, #0
 14a:	f2c0 0000 	movt	r0, #0
 14e:	f7ff fffe 	bl	0 <_ZN140_$LT$st7735_lcd..ST7735$LT$SPI$C$DC$C$RST$GT$$u20$as$u20$embedded_graphics..Drawing$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$GT$$GT$4draw17hc6a4d79eea7d0f75E>
 152:	e7ff      	b.n	154 <_ZN3app7display4test17h4382f834d7e04d48E+0x154>
 154:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:147
    }
    Ok(())
 156:	9009      	str	r0, [sp, #36]	; 0x24
 158:	2001      	movs	r0, #1
 15a:	9009      	str	r0, [sp, #36]	; 0x24
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/rust/app/src/display.rs:148
}
 15c:	9809      	ldr	r0, [sp, #36]	; 0x24
 15e:	b046      	add	sp, #280	; 0x118
 160:	bd70      	pop	{r4, r5, r6, pc}

app-9b7b12e8d5cbce98.5abeuhp64702alzv.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 5abeuhp64702alzv
00000350 l       .debug_str	00000000 
000003fb l       .debug_str	00000000 
00000404 l       .debug_str	00000000 
00000435 l       .debug_str	00000000 
0000044b l       .debug_str	00000000 
0000044d l       .debug_str	00000000 
00000468 l       .debug_str	00000000 
0000046a l       .debug_str	00000000 
000004d2 l       .debug_str	00000000 
000004d7 l       .debug_str	00000000 
00000529 l       .debug_str	00000000 
0000053b l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
00000091 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009b l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
000000ac l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b7 l       .debug_str	00000000 
000000be l       .debug_str	00000000 
000000c6 l       .debug_str	00000000 
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
0000033a l       .debug_str	00000000 
00000340 l       .debug_str	00000000 
00000346 l       .debug_str	00000000 
00000355 l       .debug_str	00000000 
0000035e l       .debug_str	00000000 
00000367 l       .debug_str	00000000 
00000370 l       .debug_str	00000000 
00000376 l       .debug_str	00000000 
000003a7 l       .debug_str	00000000 
000003c6 l       .debug_str	00000000 
000003ca l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E	00000000 .text._ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E
00000000 l    d  .text._ZN4core3fmt10ArgumentV13new17h1b9239df91074954E	00000000 .text._ZN4core3fmt10ArgumentV13new17h1b9239df91074954E
00000000 l    d  .text._ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE	00000000 .text._ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E	00000032 _ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E
00000000 g     F .text._ZN4core3fmt10ArgumentV13new17h1b9239df91074954E	00000032 _ZN4core3fmt10ArgumentV13new17h1b9239df91074954E
00000000 g     F .text._ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE	00000032 _ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE



Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E:

00000000 <_ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E>:
_ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E():
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
  16:	e7ff      	b.n	18 <_ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:283
  18:	9804      	ldr	r0, [sp, #16]
  1a:	9009      	str	r0, [sp, #36]	; 0x24
  1c:	9809      	ldr	r0, [sp, #36]	; 0x24
  1e:	9000      	str	r0, [sp, #0]
  20:	e7ff      	b.n	22 <_ZN4core3fmt10ArgumentV13new17h0b53ca7b1c2c7581E+0x22>
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

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17h1b9239df91074954E:

00000000 <_ZN4core3fmt10ArgumentV13new17h1b9239df91074954E>:
_ZN4core3fmt10ArgumentV13new17h1b9239df91074954E():
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
  16:	e7ff      	b.n	18 <_ZN4core3fmt10ArgumentV13new17h1b9239df91074954E+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:283
  18:	9804      	ldr	r0, [sp, #16]
  1a:	9009      	str	r0, [sp, #36]	; 0x24
  1c:	9809      	ldr	r0, [sp, #36]	; 0x24
  1e:	9000      	str	r0, [sp, #0]
  20:	e7ff      	b.n	22 <_ZN4core3fmt10ArgumentV13new17h1b9239df91074954E+0x22>
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

Disassembly of section .text._ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE:

00000000 <_ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE>:
_ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE():
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
  16:	e7ff      	b.n	18 <_ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE+0x18>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:283
  18:	9804      	ldr	r0, [sp, #16]
  1a:	9009      	str	r0, [sp, #36]	; 0x24
  1c:	9809      	ldr	r0, [sp, #36]	; 0x24
  1e:	9000      	str	r0, [sp, #0]
  20:	e7ff      	b.n	22 <_ZN4core3fmt10ArgumentV13new17hccc3018768cbf90aE+0x22>
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

app-9b7b12e8d5cbce98.5ar5x7pg41tteeyz.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 5ar5x7pg41tteeyz
0000013b l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a9 l       .debug_str	00000000 
00000140 l       .debug_str	00000000 
000000b2 l       .debug_str	00000000 
00000126 l       .debug_str	00000000 
0000012c l       .debug_str	00000000 
00000130 l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
00000000 l    d  .text._ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E	00000000 .text._ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E	00000010 .hidden _ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E



Disassembly of section .text._ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E:

00000000 <_ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E>:
_ZN84_$LT$embedded_graphics..pixelcolor..rgb565..Rgb565$u20$as$u20$core..clone..Clone$GT$5clone17h8a555face5d8d4d3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/pixelcolor/rgb565.rs:17
///
/// ```text
/// 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
///  r  r  r  r  r  g  g  g  g  g  g  b  b  b  b  b
/// ```
#[derive(Debug, Clone, Copy, PartialEq)]
   0:	b082      	sub	sp, #8
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	8800      	ldrh	r0, [r0, #0]
   a:	9100      	str	r1, [sp, #0]
   c:	b002      	add	sp, #8
   e:	4770      	bx	lr

app-9b7b12e8d5cbce98.5e73fcc4zk5eys71.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 5e73fcc4zk5eys71
0000012c l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000090 l       .debug_str	00000000 
00000095 l       .debug_str	00000000 
0000009e l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
000000f9 l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
00000105 l       .debug_str	00000000 
00000108 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
0000010f l       .debug_str	00000000 
00000114 l       .debug_str	00000000 
00000118 l       .debug_str	00000000 
00000123 l       .debug_str	00000000 
00000128 l       .debug_str	00000000 
00000000 l    d  .text._ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E	00000000 .text._ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core3mem7size_of17h35be0a43c87bd3e0E
00000000         *UND*	00000000 _ZN4core3mem7size_of17ha670e8b105afdb72E
00000000 g     F .text._ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E	00000086 .hidden _ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E



Disassembly of section .text._ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E:

00000000 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E>:
_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:201

macro_rules! impl_to_primitive_uint_to_uint {
    ($SrcT:ident : $( $(#[$cfg:meta])* fn $method:ident -> $DstT:ident ; )*) => {$(
        #[inline]
        $(#[$cfg])*
        fn $method(&self) -> Option<$DstT> {
   0:	b580      	push	{r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	4601      	mov	r1, r0
   6:	9006      	str	r0, [sp, #24]
   8:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:202
            let max = $DstT::MAX as $SrcT;
   a:	9009      	str	r0, [sp, #36]	; 0x24
   c:	20ff      	movs	r0, #255	; 0xff
   e:	9008      	str	r0, [sp, #32]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:203
            if size_of::<$SrcT>() <= size_of::<$DstT>() || *self <= max {
  10:	9105      	str	r1, [sp, #20]
  12:	f7ff fffe 	bl	0 <_ZN4core3mem7size_of17ha670e8b105afdb72E>
  16:	9004      	str	r0, [sp, #16]
  18:	e01a      	b.n	50 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x50>
  1a:	2001      	movs	r0, #1
  1c:	f88d 002f 	strb.w	r0, [sp, #47]	; 0x2f
  20:	e010      	b.n	44 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x44>
  22:	9806      	ldr	r0, [sp, #24]
  24:	6801      	ldr	r1, [r0, #0]
  26:	6840      	ldr	r0, [r0, #4]
  28:	9a08      	ldr	r2, [sp, #32]
  2a:	9b09      	ldr	r3, [sp, #36]	; 0x24
  2c:	1a51      	subs	r1, r2, r1
  2e:	eb73 0000 	sbcs.w	r0, r3, r0
  32:	f04f 0200 	mov.w	r2, #0
  36:	bf28      	it	cs
  38:	2201      	movcs	r2, #1
  3a:	f88d 202f 	strb.w	r2, [sp, #47]	; 0x2f
  3e:	9103      	str	r1, [sp, #12]
  40:	9002      	str	r0, [sp, #8]
  42:	e7ff      	b.n	44 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x44>
  44:	f89d 002f 	ldrb.w	r0, [sp, #47]	; 0x2f
  48:	07c0      	lsls	r0, r0, #31
  4a:	2800      	cmp	r0, #0
  4c:	d109      	bne.n	62 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x62>
  4e:	e010      	b.n	72 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x72>
  50:	f7ff fffe 	bl	0 <_ZN4core3mem7size_of17h35be0a43c87bd3e0E>
  54:	9001      	str	r0, [sp, #4]
  56:	e7ff      	b.n	58 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x58>
  58:	9804      	ldr	r0, [sp, #16]
  5a:	9901      	ldr	r1, [sp, #4]
  5c:	4288      	cmp	r0, r1
  5e:	d9dc      	bls.n	1a <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x1a>
  60:	e7df      	b.n	22 <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x22>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:204
                Some(*self as $DstT)
  62:	9806      	ldr	r0, [sp, #24]
  64:	7800      	ldrb	r0, [r0, #0]
  66:	f88d 001d 	strb.w	r0, [sp, #29]
  6a:	2001      	movs	r0, #1
  6c:	f88d 001c 	strb.w	r0, [sp, #28]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:203
            if size_of::<$SrcT>() <= size_of::<$DstT>() || *self <= max {
  70:	e003      	b.n	7a <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x7a>
  72:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:206
            } else {
                None
  74:	f88d 001c 	strb.w	r0, [sp, #28]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:203
            if size_of::<$SrcT>() <= size_of::<$DstT>() || *self <= max {
  78:	e7ff      	b.n	7a <_ZN53_$LT$u64$u20$as$u20$num_traits..cast..ToPrimitive$GT$5to_u817h705f96c14db7c384E+0x7a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:208
            }
        }
  7a:	f89d 001c 	ldrb.w	r0, [sp, #28]
  7e:	f89d 101d 	ldrb.w	r1, [sp, #29]
  82:	b00c      	add	sp, #48	; 0x30
  84:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.5yyavy3q69atz3j.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 5yyavy3q69atz3j
000002da l       .debug_str	00000000 
0000020a l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
00000224 l       .debug_str	00000000 
0000022a l       .debug_str	00000000 
00000269 l       .debug_str	00000000 
00000270 l       .debug_str	00000000 
000002df l       .debug_str	00000000 
000002e6 l       .debug_str	00000000 
000002ea l       .debug_str	00000000 
000002ef l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
000002f9 l       .debug_str	00000000 
000002fd l       .debug_str	00000000 
0000030a l       .debug_str	00000000 
0000030c l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008a l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
000000d8 l       .debug_str	00000000 
000000e1 l       .debug_str	00000000 
000000ea l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
00000104 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
0000010f l       .debug_str	00000000 
00000114 l       .debug_str	00000000 
0000014a l       .debug_str	00000000 
0000015e l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001dc l       .debug_str	00000000 
000001e2 l       .debug_str	00000000 
000001e7 l       .debug_str	00000000 
000001ed l       .debug_str	00000000 
000001f1 l       .debug_str	00000000 
000001f5 l       .debug_str	00000000 
000001fd l       .debug_str	00000000 
00000204 l       .debug_str	00000000 
00000208 l       .debug_str	00000000 
00000000 l    d  .text._ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E	00000000 .text._ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E
00000000 l    d  .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE	00000000 .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE
00000000 l    d  .text._ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E	00000000 .text._ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E
00000000 l    d  .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE	00000000 .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE
00000000 l    d  .text._ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E	00000000 .text._ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN4core3str15next_code_point17he134a96b70febaf3E
00000000 g     F .text._ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E	00000016 .hidden _ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E
00000000 g     F .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE	0000003c .hidden _ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE
00000000 g     F .text._ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E	00000048 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E
00000000 g     F .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE	00000014 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h70be3ebb33ef544dE
00000000         *UND*	00000000 _ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17hf214c7e39e0e6037E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$3map17h9a1d2a37f008ec30E
00000000 g     F .text._ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E	00000028 .hidden _ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E



Disassembly of section .text._ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E:

00000000 <_ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E>:
_ZN4core3str19from_utf8_unchecked17h246cc5f5f935ec80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:413
   0:	b084      	sub	sp, #16
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9002      	str	r0, [sp, #8]
   8:	9103      	str	r1, [sp, #12]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:414
   a:	9802      	ldr	r0, [sp, #8]
   c:	9903      	ldr	r1, [sp, #12]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:415
   e:	9201      	str	r2, [sp, #4]
  10:	9300      	str	r3, [sp, #0]
  12:	b004      	add	sp, #16
  14:	4770      	bx	lr

Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE:

00000000 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE>:
_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE():
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
_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2071
  20:	9205      	str	r2, [sp, #20]
  22:	9304      	str	r3, [sp, #16]
  24:	9003      	str	r0, [sp, #12]
  26:	9102      	str	r1, [sp, #8]
  28:	e7ff      	b.n	2a <_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE+0x2a>
  2a:	9803      	ldr	r0, [sp, #12]
  2c:	9902      	ldr	r1, [sp, #8]
  2e:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$3len17h70be3ebb33ef544dE>
  32:	9001      	str	r0, [sp, #4]
  34:	e7ff      	b.n	36 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE+0x36>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2072
  36:	9801      	ldr	r0, [sp, #4]
  38:	b00c      	add	sp, #48	; 0x30
  3a:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E:

00000000 <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E>:
_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2583
   0:	b580      	push	{r7, lr}
   2:	b08e      	sub	sp, #56	; 0x38
   4:	460a      	mov	r2, r1
   6:	4603      	mov	r3, r0
   8:	9006      	str	r0, [sp, #24]
   a:	9107      	str	r1, [sp, #28]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2584
   c:	9806      	ldr	r0, [sp, #24]
   e:	9907      	ldr	r1, [sp, #28]
  10:	900a      	str	r0, [sp, #40]	; 0x28
  12:	910b      	str	r1, [sp, #44]	; 0x2c
_ZN4core3str21_$LT$impl$u20$str$GT$8as_bytes17hbca31947ef6ad219E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2153
  14:	980a      	ldr	r0, [sp, #40]	; 0x28
  16:	990b      	ldr	r1, [sp, #44]	; 0x2c
  18:	900c      	str	r0, [sp, #48]	; 0x30
  1a:	910d      	str	r1, [sp, #52]	; 0x34
  1c:	980c      	ldr	r0, [sp, #48]	; 0x30
  1e:	990d      	ldr	r1, [sp, #52]	; 0x34
_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2584
  20:	9205      	str	r2, [sp, #20]
  22:	9304      	str	r3, [sp, #16]
  24:	9003      	str	r0, [sp, #12]
  26:	9102      	str	r1, [sp, #8]
  28:	e7ff      	b.n	2a <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E+0x2a>
  2a:	9803      	ldr	r0, [sp, #12]
  2c:	9902      	ldr	r1, [sp, #8]
  2e:	f7ff fffe 	bl	0 <_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$4iter17hf214c7e39e0e6037E>
  32:	9001      	str	r0, [sp, #4]
  34:	9100      	str	r1, [sp, #0]
  36:	e7ff      	b.n	38 <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E+0x38>
  38:	9801      	ldr	r0, [sp, #4]
  3a:	9008      	str	r0, [sp, #32]
  3c:	9900      	ldr	r1, [sp, #0]
  3e:	9109      	str	r1, [sp, #36]	; 0x24
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:2585
  40:	9808      	ldr	r0, [sp, #32]
  42:	9909      	ldr	r1, [sp, #36]	; 0x24
  44:	b00e      	add	sp, #56	; 0x38
  46:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE:

00000000 <_ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE>:
_ZN4core3str21_$LT$impl$u20$str$GT$6as_ptr17h1d8b9cec5b39e19aE():
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

Disassembly of section .text._ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E:

00000000 <_ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E>:
_ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:567
   0:	b580      	push	{r7, lr}
   2:	b086      	sub	sp, #24
   4:	4601      	mov	r1, r0
   6:	9004      	str	r0, [sp, #16]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:568
   8:	9804      	ldr	r0, [sp, #16]
   a:	9103      	str	r1, [sp, #12]
   c:	f7ff fffe 	bl	0 <_ZN4core3str15next_code_point17he134a96b70febaf3E>
  10:	9002      	str	r0, [sp, #8]
  12:	9101      	str	r1, [sp, #4]
  14:	e7ff      	b.n	16 <_ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E+0x16>
  16:	9802      	ldr	r0, [sp, #8]
  18:	9901      	ldr	r1, [sp, #4]
  1a:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$3map17h9a1d2a37f008ec30E>
  1e:	9000      	str	r0, [sp, #0]
  20:	e7ff      	b.n	22 <_ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E+0x22>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/str/mod.rs:574
  22:	9800      	ldr	r0, [sp, #0]
  24:	b006      	add	sp, #24
  26:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.jn5aans8muxr31g.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 jn5aans8muxr31g
00000138 l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008e l       .debug_str	00000000 
00000095 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000a4 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000c1 l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000ce l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
00000000 l    d  .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE	00000000 .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE
00000000 l    d  .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE	00000000 .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE	00000012 _ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE
00000000 g     F .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE	0000001e _ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE



Disassembly of section .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE:

00000000 <_ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE>:
_ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h3eede62d02206c1cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:15
    element: T,
}

impl<T> CapacityError<T> {
    /// Create a new `CapacityError` from `element`.
    pub fn new(element: T) -> CapacityError<T> {
   0:	b083      	sub	sp, #12
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:17
        CapacityError {
            element: element,
   6:	9801      	ldr	r0, [sp, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:16
        CapacityError {
   8:	9002      	str	r0, [sp, #8]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:19
        }
    }
   a:	9802      	ldr	r0, [sp, #8]
   c:	9100      	str	r1, [sp, #0]
   e:	b003      	add	sp, #12
  10:	4770      	bx	lr

Disassembly of section .text._ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE:

00000000 <_ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE>:
_ZN8arrayvec6errors22CapacityError$LT$T$GT$3new17h82a41328eb34982bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:15
    pub fn new(element: T) -> CapacityError<T> {
   0:	b086      	sub	sp, #24
   2:	460a      	mov	r2, r1
   4:	4603      	mov	r3, r0
   6:	9002      	str	r0, [sp, #8]
   8:	9103      	str	r1, [sp, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:17
            element: element,
   a:	9802      	ldr	r0, [sp, #8]
   c:	9903      	ldr	r1, [sp, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:16
        CapacityError {
   e:	9004      	str	r0, [sp, #16]
  10:	9105      	str	r1, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/arrayvec-0.5.1/src/errors.rs:19
    }
  12:	9804      	ldr	r0, [sp, #16]
  14:	9905      	ldr	r1, [sp, #20]
  16:	9201      	str	r2, [sp, #4]
  18:	9300      	str	r3, [sp, #0]
  1a:	b006      	add	sp, #24
  1c:	4770      	bx	lr

app-9b7b12e8d5cbce98.kv90lxfnc941dky.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 kv90lxfnc941dky
0000071a l       .debug_str	00000000 
00000257 l       .debug_str	00000000 
0000025c l       .debug_str	00000000 
0000025e l       .debug_str	00000000 
00000263 l       .debug_str	00000000 
00000299 l       .debug_str	00000000 
000002a6 l       .debug_str	00000000 
000002b3 l       .debug_str	00000000 
000002b5 l       .debug_str	00000000 
000002ea l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
000002f7 l       .debug_str	00000000 
00000337 l       .debug_str	00000000 
000003a6 l       .debug_str	00000000 
0000044c l       .debug_str	00000000 
000004b9 l       .debug_str	00000000 
0000055d l       .debug_str	00000000 
000005c9 l       .debug_str	00000000 
0000066f l       .debug_str	00000000 
000006db l       .debug_str	00000000 
000006e7 l       .debug_str	00000000 
000006eb l       .debug_str	00000000 
000006f7 l       .debug_str	00000000 
00000704 l       .debug_str	00000000 
00000709 l       .debug_str	00000000 
00000716 l       .debug_str	00000000 
00000791 l       .debug_str	00000000 
00000835 l       .debug_str	00000000 
0000089c l       .debug_str	00000000 
00000942 l       .debug_str	00000000 
000009ab l       .debug_str	00000000 
00000a51 l       .debug_str	00000000 
00000ab8 l       .debug_str	00000000 
00000ac1 l       .debug_str	00000000 
00000acf l       .debug_str	00000000 
00000ae7 l       .debug_str	00000000 
00000af5 l       .debug_str	00000000 
00000b2a l       .debug_str	00000000 
00000b84 l       .debug_str	00000000 
00000b89 l       .debug_str	00000000 
00000c21 l       .debug_str	00000000 
00000c24 l       .debug_str	00000000 
00000c2a l       .debug_str	00000000 
00000cce l       .debug_str	00000000 
00000cdb l       .debug_str	00000000 
00000ce1 l       .debug_str	00000000 
00000ced l       .debug_str	00000000 
00000cf1 l       .debug_str	00000000 
00000cf8 l       .debug_str	00000000 
00000cff l       .debug_str	00000000 
00000d10 l       .debug_str	00000000 
00000d1c l       .debug_str	00000000 
00000d27 l       .debug_str	00000000 
00000d29 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000aa l       .debug_str	00000000 
000000b3 l       .debug_str	00000000 
000000be l       .debug_str	00000000 
000000c5 l       .debug_str	00000000 
000000c9 l       .debug_str	00000000 
000000cd l       .debug_str	00000000 
000000d4 l       .debug_str	00000000 
000000d6 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
0000017e l       .debug_str	00000000 
000001e6 l       .debug_str	00000000 
000001ea l       .debug_str	00000000 
000001f0 l       .debug_str	00000000 
000001ff l       .debug_str	00000000 
00000203 l       .debug_str	00000000 
00000207 l       .debug_str	00000000 
0000020d l       .debug_str	00000000 
00000212 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
0000021e l       .debug_str	00000000 
00000228 l       .debug_str	00000000 
0000022f l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
0000023a l       .debug_str	00000000 
00000240 l       .debug_str	00000000 
0000024b l       .debug_str	00000000 
00000250 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.0	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.0
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.1	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.1
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.10	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.10
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.11	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.11
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.12	000012c0 .Lanon.91bac0972429ee995dc3dba673db7dc5.12
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.13	00000010 .Lanon.91bac0972429ee995dc3dba673db7dc5.13
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.14	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.14
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.15	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.15
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.16	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.16
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.17	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.17
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.18	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.18
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.19	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.19
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.2	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.2
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.20	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.20
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.3	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.3
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.4	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.4
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.5	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.5
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.6	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.6
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.7	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.7
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.8	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.8
00000000 l     O .rodata..Lanon.91bac0972429ee995dc3dba673db7dc5.9	00000018 .Lanon.91bac0972429ee995dc3dba673db7dc5.9
00000000 l     O .rodata.str.0	0000006e str.0
00000000 l     O .rodata.str.1	00000021 str.1
00000000 l     O .rodata.str.2	0000001c str.2
00000000 l     O .rodata.str.3	00000019 str.3
00000000 l     O .rodata.str.4	00000021 str.4
00000000 l     O .rodata.str.5	00000023 str.5
00000000 l    d  .text._ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE	00000000 .text._ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE
00000000 l    d  .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE	00000000 .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE
00000000 l    d  .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E	00000000 .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E
00000000 l    d  .text._ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E	00000000 .text._ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E
00000000 l    d  .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E	00000000 .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E
00000000 l    d  .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE	00000000 .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE
00000000 l    d  .text._ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E	00000000 .text._ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E
00000000 l    d  .rodata.str.0	00000000 .rodata.str.0
00000000 l    d  .rodata.str.1	00000000 .rodata.str.1
00000000 l    d  .rodata.str.2	00000000 .rodata.str.2
00000000 l    d  .rodata.str.3	00000000 .rodata.str.3
00000000 l    d  .rodata.str.4	00000000 .rodata.str.4
00000000 l    d  .rodata.str.5	00000000 .rodata.str.5
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 _ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E
00000000         *UND*	00000000 _ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$embedded_graphics..coord..ToUnsigned$GT$11to_unsigned17h37ece76dbcf44ae9E
00000000 g     F .text._ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE	00000066 _ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE
00000000         *UND*	00000000 _ZN126_$LT$embedded_graphics..fonts..font12x16..Font12x16Conf$u20$as$u20$embedded_graphics..fonts..font_builder..FontBuilderConf$GT$11char_offset17h9ed9a8227efc6570E
00000000 g     F .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE	00000068 _ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE
00000000 g     F .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E	0000006c _ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E
00000000 g     F .text._ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E	0000008c _ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E
00000000 g     F .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E	0000003c _ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E
00000000 g     F .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE	0000003c _ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE
00000000 g     F .text._ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E	0000057c _ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E
00000000         *UND*	00000000 _ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E
00000000         *UND*	00000000 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE
00000000         *UND*	00000000 .hidden _ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E
00000000         *UND*	00000000 _ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE
00000000         *UND*	00000000 _ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 _ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE
00000000         *UND*	00000000 .hidden _ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E
00000000         *UND*	00000000 _ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E
00000000         *UND*	00000000 _ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE
00000000         *UND*	00000000 _ZN83_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..default..Default$GT$7default17hfde0c1ef0e1e8160E
00000000         *UND*	00000000 _ZN89_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..arith..Add$GT$3add17hab6d9056b890c7cfE
00000000         *UND*	00000000 _ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE



Disassembly of section .text._ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE:

00000000 <_ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE>:
_ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:53
    _conf: PhantomData<Conf>,
}

impl<'a, C: PixelColor + Copy, Conf> Copy for FontBuilder<'a, C, Conf> {}
impl<'a, C: PixelColor + Clone, Conf> Clone for FontBuilder<'a, C, Conf> {
    fn clone(&self) -> Self {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	460a      	mov	r2, r1
   6:	9106      	str	r1, [sp, #24]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:55
        Self {
            pos: self.pos,
   8:	9906      	ldr	r1, [sp, #24]
   a:	680b      	ldr	r3, [r1, #0]
   c:	f8d1 c004 	ldr.w	ip, [r1, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:56
            text: self.text,
  10:	f8d1 e008 	ldr.w	lr, [r1, #8]
  14:	68cc      	ldr	r4, [r1, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:57
            style: self.style.clone(),
  16:	3110      	adds	r1, #16
  18:	ad07      	add	r5, sp, #28
  1a:	9005      	str	r0, [sp, #20]
  1c:	4628      	mov	r0, r5
  1e:	9204      	str	r2, [sp, #16]
  20:	9303      	str	r3, [sp, #12]
  22:	f8cd c008 	str.w	ip, [sp, #8]
  26:	f8cd e004 	str.w	lr, [sp, #4]
  2a:	9400      	str	r4, [sp, #0]
  2c:	f7ff fffe 	bl	0 <_ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE>
  30:	e7ff      	b.n	2 <_ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E+0x2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:58
            _conf: Default::default(),
  32:	f7ff fffe 	bl	0 <_ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E>
  36:	e7ff      	b.n	38 <_ZN106_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hcfbb2b6c332f3f9cE+0x38>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:54
        Self {
  38:	9803      	ldr	r0, [sp, #12]
  3a:	9905      	ldr	r1, [sp, #20]
  3c:	6008      	str	r0, [r1, #0]
  3e:	9a02      	ldr	r2, [sp, #8]
  40:	604a      	str	r2, [r1, #4]
  42:	9b01      	ldr	r3, [sp, #4]
  44:	608b      	str	r3, [r1, #8]
  46:	f8dd c000 	ldr.w	ip, [sp]
  4a:	f8c1 c00c 	str.w	ip, [r1, #12]
  4e:	f8bd e024 	ldrh.w	lr, [sp, #36]	; 0x24
  52:	f8a1 e018 	strh.w	lr, [r1, #24]
  56:	f8dd e01c 	ldr.w	lr, [sp, #28]
  5a:	9c08      	ldr	r4, [sp, #32]
  5c:	614c      	str	r4, [r1, #20]
  5e:	f8c1 e010 	str.w	lr, [r1, #16]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:60
        }
    }
  62:	b00a      	add	sp, #40	; 0x28
  64:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE:

00000000 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE>:
_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:94
impl<'a, C, Conf> Font<'a, C> for FontBuilder<'a, C, Conf>
where
    C: PixelColor,
    Conf: FontBuilderConf,
{
    fn render_str(text: &'a str) -> Self {
   0:	b510      	push	{r4, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	4613      	mov	r3, r2
   6:	468c      	mov	ip, r1
   8:	9107      	str	r1, [sp, #28]
   a:	9208      	str	r2, [sp, #32]
   c:	2100      	movs	r1, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:96
        Self {
            pos: Coord::new(0, 0),
   e:	9006      	str	r0, [sp, #24]
  10:	4608      	mov	r0, r1
  12:	9305      	str	r3, [sp, #20]
  14:	f8cd c010 	str.w	ip, [sp, #16]
  18:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
  1c:	9003      	str	r0, [sp, #12]
  1e:	9102      	str	r1, [sp, #8]
  20:	e7ff      	b.n	22 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE+0x22>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:97
            text,
  22:	9807      	ldr	r0, [sp, #28]
  24:	9908      	ldr	r1, [sp, #32]
  26:	aa09      	add	r2, sp, #36	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:98
            style: Style::default(),
  28:	9001      	str	r0, [sp, #4]
  2a:	4610      	mov	r0, r2
  2c:	9100      	str	r1, [sp, #0]
  2e:	f7ff fffe 	bl	0 <_ZN83_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..default..Default$GT$7default17hfde0c1ef0e1e8160E>
  32:	e7ff      	b.n	2 <_ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E+0x2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:99
            _conf: Default::default(),
  34:	f7ff fffe 	bl	0 <_ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E>
  38:	e7ff      	b.n	3a <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..fonts..Font$LT$C$GT$$GT$10render_str17h999a2a5f96c9155bE+0x3a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:95
        Self {
  3a:	9803      	ldr	r0, [sp, #12]
  3c:	9906      	ldr	r1, [sp, #24]
  3e:	6008      	str	r0, [r1, #0]
  40:	9a02      	ldr	r2, [sp, #8]
  42:	604a      	str	r2, [r1, #4]
  44:	9b01      	ldr	r3, [sp, #4]
  46:	608b      	str	r3, [r1, #8]
  48:	f8dd c000 	ldr.w	ip, [sp]
  4c:	f8c1 c00c 	str.w	ip, [r1, #12]
  50:	f8bd e02c 	ldrh.w	lr, [sp, #44]	; 0x2c
  54:	f8a1 e018 	strh.w	lr, [r1, #24]
  58:	f8dd e024 	ldr.w	lr, [sp, #36]	; 0x24
  5c:	9c0a      	ldr	r4, [sp, #40]	; 0x28
  5e:	614c      	str	r4, [r1, #20]
  60:	f8c1 e010 	str.w	lr, [r1, #16]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:101
        }
    }
  64:	b00c      	add	sp, #48	; 0x30
  66:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E:

00000000 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E>:
_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:301
    /// let moved = text.translate(Coord::new(25, 30));
    ///
    /// assert_eq!(text.pos, Coord::new(0, 0));
    /// assert_eq!(moved.pos, Coord::new(25, 30));
    /// ```
    fn translate(&self, by: Coord) -> Self {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b090      	sub	sp, #64	; 0x40
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	9106      	str	r1, [sp, #24]
   c:	9207      	str	r2, [sp, #28]
   e:	9308      	str	r3, [sp, #32]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:303
        Self {
            pos: self.pos + by,
  10:	9906      	ldr	r1, [sp, #24]
  12:	680a      	ldr	r2, [r1, #0]
  14:	6849      	ldr	r1, [r1, #4]
  16:	9b07      	ldr	r3, [sp, #28]
  18:	9d08      	ldr	r5, [sp, #32]
  1a:	9005      	str	r0, [sp, #20]
  1c:	4610      	mov	r0, r2
  1e:	461a      	mov	r2, r3
  20:	462b      	mov	r3, r5
  22:	f8cd c010 	str.w	ip, [sp, #16]
  26:	f8cd e00c 	str.w	lr, [sp, #12]
  2a:	9402      	str	r4, [sp, #8]
  2c:	f7ff fffe 	bl	0 <_ZN89_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..arith..Add$GT$3add17hab6d9056b890c7cfE>
  30:	9001      	str	r0, [sp, #4]
  32:	9100      	str	r1, [sp, #0]
  34:	e7ff      	b.n	36 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E+0x36>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:304
            ..self.clone()
  36:	9906      	ldr	r1, [sp, #24]
  38:	a809      	add	r0, sp, #36	; 0x24
  3a:	f7ff fffe 	bl	0 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E>
  3e:	e7ff      	b.n	40 <_ZN127_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..transform..Transform$GT$9translate17h0fb47af1371db077E+0x40>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:302
        Self {
  40:	9801      	ldr	r0, [sp, #4]
  42:	9905      	ldr	r1, [sp, #20]
  44:	6008      	str	r0, [r1, #0]
  46:	9a00      	ldr	r2, [sp, #0]
  48:	604a      	str	r2, [r1, #4]
  4a:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
  4c:	f8dd c030 	ldr.w	ip, [sp, #48]	; 0x30
  50:	608b      	str	r3, [r1, #8]
  52:	f8c1 c00c 	str.w	ip, [r1, #12]
  56:	f8bd 303c 	ldrh.w	r3, [sp, #60]	; 0x3c
  5a:	830b      	strh	r3, [r1, #24]
  5c:	9b0d      	ldr	r3, [sp, #52]	; 0x34
  5e:	f8dd c038 	ldr.w	ip, [sp, #56]	; 0x38
  62:	f8c1 c014 	str.w	ip, [r1, #20]
  66:	610b      	str	r3, [r1, #16]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:306
        }
    }
  68:	b010      	add	sp, #64	; 0x40
  6a:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E:

00000000 <_ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E>:
_ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:157
    fn into_iter(self) -> Self::IntoIter {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	460a      	mov	r2, r1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:159
            current_char: self.text.chars().next(),
   6:	688b      	ldr	r3, [r1, #8]
   8:	68c9      	ldr	r1, [r1, #12]
   a:	9006      	str	r0, [sp, #24]
   c:	4618      	mov	r0, r3
   e:	9205      	str	r2, [sp, #20]
  10:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E>
  14:	9108      	str	r1, [sp, #32]
  16:	9007      	str	r0, [sp, #28]
  18:	e7ff      	b.n	1a <_ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E+0x1a>
  1a:	a807      	add	r0, sp, #28
  1c:	f7ff fffe 	bl	0 <_ZN75_$LT$core..str..Chars$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b90b9205598293E>
  20:	9004      	str	r0, [sp, #16]
  22:	e7ff      	b.n	24 <_ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E+0x24>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:164
            pos: self.pos,
  24:	9805      	ldr	r0, [sp, #20]
  26:	6801      	ldr	r1, [r0, #0]
  28:	6842      	ldr	r2, [r0, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:161
            text: self.text,
  2a:	6883      	ldr	r3, [r0, #8]
  2c:	f8d0 c00c 	ldr.w	ip, [r0, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:165
            style: self.style,
  30:	f8b0 e018 	ldrh.w	lr, [r0, #24]
  34:	f8ad e02c 	strh.w	lr, [sp, #44]	; 0x2c
  38:	f8d0 e010 	ldr.w	lr, [r0, #16]
  3c:	6944      	ldr	r4, [r0, #20]
  3e:	940a      	str	r4, [sp, #40]	; 0x28
  40:	f8cd e024 	str.w	lr, [sp, #36]	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:166
            _conf: Default::default(),
  44:	9103      	str	r1, [sp, #12]
  46:	9202      	str	r2, [sp, #8]
  48:	9301      	str	r3, [sp, #4]
  4a:	f8cd c000 	str.w	ip, [sp]
  4e:	f7ff fffe 	bl	0 <_ZN77_$LT$core..marker..PhantomData$LT$T$GT$$u20$as$u20$core..default..Default$GT$7default17h66a06b2b8fa007c3E>
  52:	e7ff      	b.n	54 <_ZN129_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h0b580a00bccd7045E+0x54>
  54:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:158
        Self::IntoIter {
  56:	9906      	ldr	r1, [sp, #24]
  58:	6008      	str	r0, [r1, #0]
  5a:	6048      	str	r0, [r1, #4]
  5c:	9a04      	ldr	r2, [sp, #16]
  5e:	608a      	str	r2, [r1, #8]
  60:	60c8      	str	r0, [r1, #12]
  62:	9803      	ldr	r0, [sp, #12]
  64:	6108      	str	r0, [r1, #16]
  66:	9b02      	ldr	r3, [sp, #8]
  68:	614b      	str	r3, [r1, #20]
  6a:	f8dd c004 	ldr.w	ip, [sp, #4]
  6e:	f8c1 c018 	str.w	ip, [r1, #24]
  72:	f8dd e000 	ldr.w	lr, [sp]
  76:	f8c1 e01c 	str.w	lr, [r1, #28]
  7a:	f8bd 402c 	ldrh.w	r4, [sp, #44]	; 0x2c
  7e:	850c      	strh	r4, [r1, #40]	; 0x28
  80:	9c09      	ldr	r4, [sp, #36]	; 0x24
  82:	9d0a      	ldr	r5, [sp, #40]	; 0x28
  84:	624d      	str	r5, [r1, #36]	; 0x24
  86:	620c      	str	r4, [r1, #32]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:168
    }
  88:	b00c      	add	sp, #48	; 0x30
  8a:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E:

00000000 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E>:
_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$4fill17h841eb71d53f9b2b4E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:126
    fn fill(mut self, color: Option<C>) -> Self {
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b085      	sub	sp, #20
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	f8ad 2010 	strh.w	r2, [sp, #16]
  10:	f8ad 3012 	strh.w	r3, [sp, #18]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:127
        self.style.fill_color = color;
  14:	f8bd 2010 	ldrh.w	r2, [sp, #16]
  18:	f8bd 3012 	ldrh.w	r3, [sp, #18]
  1c:	820a      	strh	r2, [r1, #16]
  1e:	824b      	strh	r3, [r1, #18]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:129
        self
  20:	c94c      	ldmia	r1!, {r2, r3, r6}
  22:	c04c      	stmia	r0!, {r2, r3, r6}
  24:	e891 00cc 	ldmia.w	r1, {r2, r3, r6, r7}
  28:	e880 00cc 	stmia.w	r0, {r2, r3, r6, r7}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:130
    }
  2c:	f8cd c00c 	str.w	ip, [sp, #12]
  30:	f8cd e008 	str.w	lr, [sp, #8]
  34:	9401      	str	r4, [sp, #4]
  36:	9500      	str	r5, [sp, #0]
  38:	b005      	add	sp, #20
  3a:	bdf0      	pop	{r4, r5, r6, r7, pc}

Disassembly of section .text._ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE:

00000000 <_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE>:
_ZN132_$LT$embedded_graphics..fonts..font_builder..FontBuilder$LT$C$C$Conf$GT$$u20$as$u20$embedded_graphics..style..WithStyle$LT$C$GT$$GT$6stroke17hd92ac977cbd42c0dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:114
    fn stroke(mut self, color: Option<C>) -> Self {
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b085      	sub	sp, #20
   4:	469c      	mov	ip, r3
   6:	4696      	mov	lr, r2
   8:	460c      	mov	r4, r1
   a:	4605      	mov	r5, r0
   c:	f8ad 2010 	strh.w	r2, [sp, #16]
  10:	f8ad 3012 	strh.w	r3, [sp, #18]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:115
        self.style.stroke_color = color;
  14:	f8bd 2010 	ldrh.w	r2, [sp, #16]
  18:	f8bd 3012 	ldrh.w	r3, [sp, #18]
  1c:	828a      	strh	r2, [r1, #20]
  1e:	82cb      	strh	r3, [r1, #22]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:117
        self
  20:	c94c      	ldmia	r1!, {r2, r3, r6}
  22:	c04c      	stmia	r0!, {r2, r3, r6}
  24:	e891 00cc 	ldmia.w	r1, {r2, r3, r6, r7}
  28:	e880 00cc 	stmia.w	r0, {r2, r3, r6, r7}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:118
    }
  2c:	f8cd c00c 	str.w	ip, [sp, #12]
  30:	f8cd e008 	str.w	lr, [sp, #8]
  34:	9401      	str	r4, [sp, #4]
  36:	9500      	str	r5, [sp, #0]
  38:	b005      	add	sp, #20
  3a:	bdf0      	pop	{r4, r5, r6, r7, pc}

Disassembly of section .text._ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E:

00000000 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E>:
_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:200
    fn next(&mut self) -> Option<Self::Item> {
   0:	b580      	push	{r7, lr}
   2:	b0ca      	sub	sp, #296	; 0x128
   4:	460a      	mov	r2, r1
   6:	9131      	str	r1, [sp, #196]	; 0xc4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:201
        if self.pos[0] + (self.text.len() as i32 * Conf::CHAR_WIDTH as i32) <= 0
   8:	9931      	ldr	r1, [sp, #196]	; 0xc4
   a:	3110      	adds	r1, #16
   c:	2300      	movs	r3, #0
   e:	9030      	str	r0, [sp, #192]	; 0xc0
  10:	4608      	mov	r0, r1
  12:	4619      	mov	r1, r3
  14:	922f      	str	r2, [sp, #188]	; 0xbc
  16:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E>
  1a:	902e      	str	r0, [sp, #184]	; 0xb8
  1c:	e010      	b.n	40 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x40>
  1e:	2001      	movs	r0, #1
  20:	f88d 00cb 	strb.w	r0, [sp, #203]	; 0xcb
  24:	e006      	b.n	34 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x34>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:202
            || self.pos[1] + (Conf::CHAR_HEIGHT as i32) <= 0
  26:	9831      	ldr	r0, [sp, #196]	; 0xc4
  28:	3010      	adds	r0, #16
  2a:	2101      	movs	r1, #1
  2c:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E>
  30:	902d      	str	r0, [sp, #180]	; 0xb4
  32:	e02a      	b.n	8a <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x8a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:201
        if self.pos[0] + (self.text.len() as i32 * Conf::CHAR_WIDTH as i32) <= 0
  34:	f89d 00cb 	ldrb.w	r0, [sp, #203]	; 0xcb
  38:	07c0      	lsls	r0, r0, #31
  3a:	2800      	cmp	r0, #0
  3c:	d137      	bne.n	ae <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xae>
  3e:	e03c      	b.n	ba <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xba>
  40:	982e      	ldr	r0, [sp, #184]	; 0xb8
  42:	6801      	ldr	r1, [r0, #0]
  44:	9a31      	ldr	r2, [sp, #196]	; 0xc4
  46:	6990      	ldr	r0, [r2, #24]
  48:	69d2      	ldr	r2, [r2, #28]
  4a:	912c      	str	r1, [sp, #176]	; 0xb0
  4c:	4611      	mov	r1, r2
  4e:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$3len17hc797b763c5a43c5bE>
  52:	902b      	str	r0, [sp, #172]	; 0xac
  54:	e7ff      	b.n	56 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x56>
  56:	200c      	movs	r0, #12
  58:	992b      	ldr	r1, [sp, #172]	; 0xac
  5a:	fb81 0200 	smull	r0, r2, r1, r0
  5e:	eb01 0341 	add.w	r3, r1, r1, lsl #1
  62:	009b      	lsls	r3, r3, #2
  64:	ebb2 7fe0 	cmp.w	r2, r0, asr #31
  68:	932a      	str	r3, [sp, #168]	; 0xa8
  6a:	f040 81e3 	bne.w	434 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x434>
  6e:	e7ff      	b.n	70 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x70>
  70:	982c      	ldr	r0, [sp, #176]	; 0xb0
  72:	992a      	ldr	r1, [sp, #168]	; 0xa8
  74:	1842      	adds	r2, r0, r1
  76:	4613      	mov	r3, r2
  78:	4282      	cmp	r2, r0
  7a:	9329      	str	r3, [sp, #164]	; 0xa4
  7c:	f180 81e1 	bvs.w	442 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x442>
  80:	e7ff      	b.n	82 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x82>
  82:	9829      	ldr	r0, [sp, #164]	; 0xa4
  84:	2801      	cmp	r0, #1
  86:	dbca      	blt.n	1e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x1e>
  88:	e7cd      	b.n	26 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x26>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:202
            || self.pos[1] + (Conf::CHAR_HEIGHT as i32) <= 0
  8a:	982d      	ldr	r0, [sp, #180]	; 0xb4
  8c:	6801      	ldr	r1, [r0, #0]
  8e:	f101 0210 	add.w	r2, r1, #16
  92:	4613      	mov	r3, r2
  94:	428a      	cmp	r2, r1
  96:	9328      	str	r3, [sp, #160]	; 0xa0
  98:	f180 81da 	bvs.w	450 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x450>
  9c:	e7ff      	b.n	9e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x9e>
  9e:	2000      	movs	r0, #0
  a0:	9928      	ldr	r1, [sp, #160]	; 0xa0
  a2:	2901      	cmp	r1, #1
  a4:	bfb8      	it	lt
  a6:	2001      	movlt	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:201
        if self.pos[0] + (self.text.len() as i32 * Conf::CHAR_WIDTH as i32) <= 0
  a8:	f88d 00cb 	strb.w	r0, [sp, #203]	; 0xcb
  ac:	e7c2      	b.n	34 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x34>
  ae:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:204
            return None;
  b0:	9930      	ldr	r1, [sp, #192]	; 0xc0
  b2:	6008      	str	r0, [r1, #0]
  b4:	e7ff      	b.n	b6 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xb6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:270
    }
  b6:	b04a      	add	sp, #296	; 0x128
  b8:	bd80      	pop	{r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:207
        let char_per_row = Conf::FONT_IMAGE_WIDTH / Conf::CHAR_WIDTH;
  ba:	e7ff      	b.n	bc <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xbc>
  bc:	2028      	movs	r0, #40	; 0x28
  be:	9033      	str	r0, [sp, #204]	; 0xcc
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:209
        let pixel = loop {
  c0:	e7ff      	b.n	c2 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xc2>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:210
            if let Some(current_char) = self.current_char {
  c2:	9831      	ldr	r0, [sp, #196]	; 0xc4
  c4:	6880      	ldr	r0, [r0, #8]
  c6:	f5b0 1f88 	cmp.w	r0, #1114112	; 0x110000
  ca:	f000 81b0 	beq.w	42e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x42e>
  ce:	e7ff      	b.n	d0 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xd0>
  d0:	9831      	ldr	r0, [sp, #196]	; 0xc4
  d2:	6880      	ldr	r0, [r0, #8]
  d4:	9038      	str	r0, [sp, #224]	; 0xe0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:213
                let char_offset = Conf::char_offset(current_char);
  d6:	9838      	ldr	r0, [sp, #224]	; 0xe0
  d8:	f7ff fffe 	bl	0 <_ZN126_$LT$embedded_graphics..fonts..font12x16..Font12x16Conf$u20$as$u20$embedded_graphics..fonts..font_builder..FontBuilderConf$GT$11char_offset17h9ed9a8227efc6570E>
  dc:	9039      	str	r0, [sp, #228]	; 0xe4
  de:	e7ff      	b.n	e0 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xe0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:214
                let row = char_offset / char_per_row;
  e0:	9839      	ldr	r0, [sp, #228]	; 0xe4
  e2:	9933      	ldr	r1, [sp, #204]	; 0xcc
  e4:	2900      	cmp	r1, #0
  e6:	9027      	str	r0, [sp, #156]	; 0x9c
  e8:	9126      	str	r1, [sp, #152]	; 0x98
  ea:	f000 81b8 	beq.w	45e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x45e>
  ee:	e7ff      	b.n	f0 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xf0>
  f0:	9827      	ldr	r0, [sp, #156]	; 0x9c
  f2:	9926      	ldr	r1, [sp, #152]	; 0x98
  f4:	fbb0 f2f1 	udiv	r2, r0, r1
  f8:	923a      	str	r2, [sp, #232]	; 0xe8
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:217
                let char_x = (char_offset - (row * char_per_row)) * Conf::CHAR_WIDTH;
  fa:	9a39      	ldr	r2, [sp, #228]	; 0xe4
  fc:	9b3a      	ldr	r3, [sp, #232]	; 0xe8
  fe:	f8dd c0cc 	ldr.w	ip, [sp, #204]	; 0xcc
 102:	fba3 3c0c 	umull	r3, ip, r3, ip
 106:	f1bc 0f00 	cmp.w	ip, #0
 10a:	9225      	str	r2, [sp, #148]	; 0x94
 10c:	9324      	str	r3, [sp, #144]	; 0x90
 10e:	f040 81ad 	bne.w	46c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x46c>
 112:	e7ff      	b.n	114 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x114>
 114:	9825      	ldr	r0, [sp, #148]	; 0x94
 116:	9924      	ldr	r1, [sp, #144]	; 0x90
 118:	1a42      	subs	r2, r0, r1
 11a:	4288      	cmp	r0, r1
 11c:	9223      	str	r2, [sp, #140]	; 0x8c
 11e:	f0c0 81ac 	bcc.w	47a <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x47a>
 122:	e7ff      	b.n	124 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x124>
 124:	200c      	movs	r0, #12
 126:	9923      	ldr	r1, [sp, #140]	; 0x8c
 128:	fba1 0200 	umull	r0, r2, r1, r0
 12c:	2a00      	cmp	r2, #0
 12e:	9022      	str	r0, [sp, #136]	; 0x88
 130:	f040 81aa 	bne.w	488 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x488>
 134:	e7ff      	b.n	136 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x136>
 136:	9822      	ldr	r0, [sp, #136]	; 0x88
 138:	903b      	str	r0, [sp, #236]	; 0xec
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:218
                let char_y = row * Conf::CHAR_HEIGHT;
 13a:	993a      	ldr	r1, [sp, #232]	; 0xe8
 13c:	2210      	movs	r2, #16
 13e:	fba1 1202 	umull	r1, r2, r1, r2
 142:	2a00      	cmp	r2, #0
 144:	9121      	str	r1, [sp, #132]	; 0x84
 146:	f040 81a6 	bne.w	496 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x496>
 14a:	e7ff      	b.n	14c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x14c>
 14c:	9821      	ldr	r0, [sp, #132]	; 0x84
 14e:	903c      	str	r0, [sp, #240]	; 0xf0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:225
                let bitmap_bit_index = char_x
 150:	993b      	ldr	r1, [sp, #236]	; 0xec
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:226
                    + (Conf::FONT_IMAGE_WIDTH * char_y)
 152:	9a3c      	ldr	r2, [sp, #240]	; 0xf0
 154:	f44f 73f0 	mov.w	r3, #480	; 0x1e0
 158:	fba3 2302 	umull	r2, r3, r3, r2
 15c:	2b00      	cmp	r3, #0
 15e:	9120      	str	r1, [sp, #128]	; 0x80
 160:	921f      	str	r2, [sp, #124]	; 0x7c
 162:	f040 819f 	bne.w	4a4 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x4a4>
 166:	e7ff      	b.n	168 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x168>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:225
                let bitmap_bit_index = char_x
 168:	9820      	ldr	r0, [sp, #128]	; 0x80
 16a:	991f      	ldr	r1, [sp, #124]	; 0x7c
 16c:	1842      	adds	r2, r0, r1
 16e:	4613      	mov	r3, r2
 170:	4282      	cmp	r2, r0
 172:	931e      	str	r3, [sp, #120]	; 0x78
 174:	f0c0 819d 	bcc.w	4b2 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x4b2>
 178:	e7ff      	b.n	17a <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x17a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:227
                    + self.char_walk_x
 17a:	9831      	ldr	r0, [sp, #196]	; 0xc4
 17c:	6800      	ldr	r0, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:225
                let bitmap_bit_index = char_x
 17e:	991e      	ldr	r1, [sp, #120]	; 0x78
 180:	4408      	add	r0, r1
 182:	4602      	mov	r2, r0
 184:	4288      	cmp	r0, r1
 186:	921d      	str	r2, [sp, #116]	; 0x74
 188:	f0c0 819a 	bcc.w	4c0 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x4c0>
 18c:	e7ff      	b.n	18e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x18e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:228
                    + (self.char_walk_y * Conf::FONT_IMAGE_WIDTH);
 18e:	9831      	ldr	r0, [sp, #196]	; 0xc4
 190:	6840      	ldr	r0, [r0, #4]
 192:	f44f 71f0 	mov.w	r1, #480	; 0x1e0
 196:	fba0 0101 	umull	r0, r1, r0, r1
 19a:	2900      	cmp	r1, #0
 19c:	901c      	str	r0, [sp, #112]	; 0x70
 19e:	f040 8196 	bne.w	4ce <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x4ce>
 1a2:	e7ff      	b.n	1a4 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x1a4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:225
                let bitmap_bit_index = char_x
 1a4:	981d      	ldr	r0, [sp, #116]	; 0x74
 1a6:	991c      	ldr	r1, [sp, #112]	; 0x70
 1a8:	1842      	adds	r2, r0, r1
 1aa:	4613      	mov	r3, r2
 1ac:	4282      	cmp	r2, r0
 1ae:	931b      	str	r3, [sp, #108]	; 0x6c
 1b0:	f0c0 8194 	bcc.w	4dc <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x4dc>
 1b4:	e7ff      	b.n	1b6 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x1b6>
 1b6:	981b      	ldr	r0, [sp, #108]	; 0x6c
 1b8:	903d      	str	r0, [sp, #244]	; 0xf4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:230
                let bitmap_byte = bitmap_bit_index / 8;
 1ba:	993d      	ldr	r1, [sp, #244]	; 0xf4
 1bc:	911a      	str	r1, [sp, #104]	; 0x68
 1be:	e7ff      	b.n	1c0 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x1c0>
 1c0:	981a      	ldr	r0, [sp, #104]	; 0x68
 1c2:	08c1      	lsrs	r1, r0, #3
 1c4:	913e      	str	r1, [sp, #248]	; 0xf8
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:231
                let bitmap_bit = 7 - (bitmap_bit_index % 8);
 1c6:	993d      	ldr	r1, [sp, #244]	; 0xf4
 1c8:	9119      	str	r1, [sp, #100]	; 0x64
 1ca:	e7ff      	b.n	1cc <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x1cc>
 1cc:	9819      	ldr	r0, [sp, #100]	; 0x64
 1ce:	f000 0107 	and.w	r1, r0, #7
 1d2:	f1c1 0207 	rsb	r2, r1, #7
 1d6:	2307      	movs	r3, #7
 1d8:	428b      	cmp	r3, r1
 1da:	9218      	str	r2, [sp, #96]	; 0x60
 1dc:	f0c0 8185 	bcc.w	4ea <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x4ea>
 1e0:	e7ff      	b.n	1e2 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x1e2>
 1e2:	9818      	ldr	r0, [sp, #96]	; 0x60
 1e4:	903f      	str	r0, [sp, #252]	; 0xfc
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:233
                let color = if Conf::FONT_IMAGE[bitmap_byte as usize] & (1 << bitmap_bit) != 0 {
 1e6:	993e      	ldr	r1, [sp, #248]	; 0xf8
 1e8:	098a      	lsrs	r2, r1, #6
 1ea:	2a4a      	cmp	r2, #74	; 0x4a
 1ec:	9117      	str	r1, [sp, #92]	; 0x5c
 1ee:	f200 8183 	bhi.w	4f8 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x4f8>
 1f2:	e7ff      	b.n	2 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x2>
 1f4:	f240 0000 	movw	r0, #0
 1f8:	f2c0 0000 	movt	r0, #0
 1fc:	9917      	ldr	r1, [sp, #92]	; 0x5c
 1fe:	5c40      	ldrb	r0, [r0, r1]
 200:	9a3f      	ldr	r2, [sp, #252]	; 0xfc
 202:	f002 0307 	and.w	r3, r2, #7
 206:	f04f 0c01 	mov.w	ip, #1
 20a:	fa0c f303 	lsl.w	r3, ip, r3
 20e:	08d2      	lsrs	r2, r2, #3
 210:	2a00      	cmp	r2, #0
 212:	9016      	str	r0, [sp, #88]	; 0x58
 214:	9315      	str	r3, [sp, #84]	; 0x54
 216:	f040 8179 	bne.w	50c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x50c>
 21a:	e7ff      	b.n	21c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x21c>
 21c:	9816      	ldr	r0, [sp, #88]	; 0x58
 21e:	9915      	ldr	r1, [sp, #84]	; 0x54
 220:	ea00 0201 	and.w	r2, r0, r1
 224:	0612      	lsls	r2, r2, #24
 226:	2a00      	cmp	r2, #0
 228:	d019      	beq.n	25e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x25e>
 22a:	e7ff      	b.n	22c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x22c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:234
                    Some(self.style.stroke_color.unwrap_or(1.into())) // white
 22c:	9831      	ldr	r0, [sp, #196]	; 0xc4
 22e:	8c81      	ldrh	r1, [r0, #36]	; 0x24
 230:	8cc0      	ldrh	r0, [r0, #38]	; 0x26
 232:	2201      	movs	r2, #1
 234:	9014      	str	r0, [sp, #80]	; 0x50
 236:	4610      	mov	r0, r2
 238:	9113      	str	r1, [sp, #76]	; 0x4c
 23a:	f7ff fffe 	bl	0 <_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h729dd920dd2afe8fE>
 23e:	9012      	str	r0, [sp, #72]	; 0x48
 240:	e7ff      	b.n	242 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x242>
 242:	9813      	ldr	r0, [sp, #76]	; 0x4c
 244:	9914      	ldr	r1, [sp, #80]	; 0x50
 246:	9a12      	ldr	r2, [sp, #72]	; 0x48
 248:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$9unwrap_or17h310f09b509f6d40dE>
 24c:	9011      	str	r0, [sp, #68]	; 0x44
 24e:	e7ff      	b.n	250 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x250>
 250:	9811      	ldr	r0, [sp, #68]	; 0x44
 252:	f8ad 0102 	strh.w	r0, [sp, #258]	; 0x102
 256:	2101      	movs	r1, #1
 258:	f8ad 1100 	strh.w	r1, [sp, #256]	; 0x100
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:233
                let color = if Conf::FONT_IMAGE[bitmap_byte as usize] & (1 << bitmap_bit) != 0 {
 25c:	e007      	b.n	26e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x26e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:236
                    self.style.fill_color
 25e:	9831      	ldr	r0, [sp, #196]	; 0xc4
 260:	8c01      	ldrh	r1, [r0, #32]
 262:	8c40      	ldrh	r0, [r0, #34]	; 0x22
 264:	f8ad 1100 	strh.w	r1, [sp, #256]	; 0x100
 268:	f8ad 0102 	strh.w	r0, [sp, #258]	; 0x102
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:233
                let color = if Conf::FONT_IMAGE[bitmap_byte as usize] & (1 << bitmap_bit) != 0 {
 26c:	e7ff      	b.n	26e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x26e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:239
                let x = self.pos[0]
 26e:	9831      	ldr	r0, [sp, #196]	; 0xc4
 270:	3010      	adds	r0, #16
 272:	2100      	movs	r1, #0
 274:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E>
 278:	9010      	str	r0, [sp, #64]	; 0x40
 27a:	e7ff      	b.n	27c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x27c>
 27c:	9810      	ldr	r0, [sp, #64]	; 0x40
 27e:	6801      	ldr	r1, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:240
                    + (Conf::CHAR_WIDTH * self.idx as u32) as i32
 280:	9a31      	ldr	r2, [sp, #196]	; 0xc4
 282:	68d2      	ldr	r2, [r2, #12]
 284:	230c      	movs	r3, #12
 286:	fba3 2302 	umull	r2, r3, r3, r2
 28a:	2b00      	cmp	r3, #0
 28c:	910f      	str	r1, [sp, #60]	; 0x3c
 28e:	920e      	str	r2, [sp, #56]	; 0x38
 290:	f040 8143 	bne.w	51a <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x51a>
 294:	e7ff      	b.n	296 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x296>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:239
                let x = self.pos[0]
 296:	980f      	ldr	r0, [sp, #60]	; 0x3c
 298:	990e      	ldr	r1, [sp, #56]	; 0x38
 29a:	1842      	adds	r2, r0, r1
 29c:	4613      	mov	r3, r2
 29e:	4282      	cmp	r2, r0
 2a0:	930d      	str	r3, [sp, #52]	; 0x34
 2a2:	f180 8141 	bvs.w	528 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x528>
 2a6:	e7ff      	b.n	2a8 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x2a8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:241
                    + self.char_walk_x as i32;
 2a8:	9831      	ldr	r0, [sp, #196]	; 0xc4
 2aa:	6800      	ldr	r0, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:239
                let x = self.pos[0]
 2ac:	990d      	ldr	r1, [sp, #52]	; 0x34
 2ae:	4408      	add	r0, r1
 2b0:	4602      	mov	r2, r0
 2b2:	4288      	cmp	r0, r1
 2b4:	920c      	str	r2, [sp, #48]	; 0x30
 2b6:	f180 813e 	bvs.w	536 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x536>
 2ba:	e7ff      	b.n	2bc <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x2bc>
 2bc:	980c      	ldr	r0, [sp, #48]	; 0x30
 2be:	9041      	str	r0, [sp, #260]	; 0x104
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:242
                let y = self.pos[1] + self.char_walk_y as i32;
 2c0:	9931      	ldr	r1, [sp, #196]	; 0xc4
 2c2:	f101 0010 	add.w	r0, r1, #16
 2c6:	2101      	movs	r1, #1
 2c8:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$core..ops..index..Index$LT$usize$GT$$GT$5index17h0504fe353e39afc2E>
 2cc:	900b      	str	r0, [sp, #44]	; 0x2c
 2ce:	e7ff      	b.n	2d0 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x2d0>
 2d0:	980b      	ldr	r0, [sp, #44]	; 0x2c
 2d2:	6801      	ldr	r1, [r0, #0]
 2d4:	9a31      	ldr	r2, [sp, #196]	; 0xc4
 2d6:	6852      	ldr	r2, [r2, #4]
 2d8:	440a      	add	r2, r1
 2da:	4613      	mov	r3, r2
 2dc:	428a      	cmp	r2, r1
 2de:	930a      	str	r3, [sp, #40]	; 0x28
 2e0:	f180 8130 	bvs.w	544 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x544>
 2e4:	e7ff      	b.n	2e6 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x2e6>
 2e6:	980a      	ldr	r0, [sp, #40]	; 0x28
 2e8:	9042      	str	r0, [sp, #264]	; 0x108
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:244
                self.char_walk_x += 1;
 2ea:	9931      	ldr	r1, [sp, #196]	; 0xc4
 2ec:	6809      	ldr	r1, [r1, #0]
 2ee:	1c4a      	adds	r2, r1, #1
 2f0:	4613      	mov	r3, r2
 2f2:	428a      	cmp	r2, r1
 2f4:	9309      	str	r3, [sp, #36]	; 0x24
 2f6:	f0c0 812c 	bcc.w	552 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x552>
 2fa:	e7ff      	b.n	2fc <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x2fc>
 2fc:	9831      	ldr	r0, [sp, #196]	; 0xc4
 2fe:	9909      	ldr	r1, [sp, #36]	; 0x24
 300:	6001      	str	r1, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:246
                if self.char_walk_x >= Conf::CHAR_WIDTH {
 302:	9831      	ldr	r0, [sp, #196]	; 0xc4
 304:	6800      	ldr	r0, [r0, #0]
 306:	280c      	cmp	r0, #12
 308:	d33e      	bcc.n	388 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x388>
 30a:	e7ff      	b.n	30c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x30c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:247
                    self.char_walk_x = 0;
 30c:	9831      	ldr	r0, [sp, #196]	; 0xc4
 30e:	2100      	movs	r1, #0
 310:	6001      	str	r1, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:248
                    self.char_walk_y += 1;
 312:	9831      	ldr	r0, [sp, #196]	; 0xc4
 314:	6840      	ldr	r0, [r0, #4]
 316:	1c41      	adds	r1, r0, #1
 318:	460a      	mov	r2, r1
 31a:	4281      	cmp	r1, r0
 31c:	9208      	str	r2, [sp, #32]
 31e:	f0c0 811f 	bcc.w	560 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x560>
 322:	e7ff      	b.n	324 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x324>
 324:	9831      	ldr	r0, [sp, #196]	; 0xc4
 326:	9908      	ldr	r1, [sp, #32]
 328:	6041      	str	r1, [r0, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:251
                    if self.char_walk_y >= Conf::CHAR_HEIGHT {
 32a:	9831      	ldr	r0, [sp, #196]	; 0xc4
 32c:	6840      	ldr	r0, [r0, #4]
 32e:	2810      	cmp	r0, #16
 330:	d329      	bcc.n	386 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x386>
 332:	e7ff      	b.n	334 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x334>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:252
                        self.char_walk_y = 0;
 334:	9831      	ldr	r0, [sp, #196]	; 0xc4
 336:	2100      	movs	r1, #0
 338:	6041      	str	r1, [r0, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:253
                        self.idx += 1;
 33a:	9831      	ldr	r0, [sp, #196]	; 0xc4
 33c:	68c0      	ldr	r0, [r0, #12]
 33e:	1c41      	adds	r1, r0, #1
 340:	460a      	mov	r2, r1
 342:	4281      	cmp	r1, r0
 344:	9207      	str	r2, [sp, #28]
 346:	f0c0 8112 	bcc.w	56e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x56e>
 34a:	e7ff      	b.n	34c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x34c>
 34c:	9831      	ldr	r0, [sp, #196]	; 0xc4
 34e:	9907      	ldr	r1, [sp, #28]
 350:	60c1      	str	r1, [r0, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:254
                        self.current_char = self.text.chars().skip(self.idx).next();
 352:	9831      	ldr	r0, [sp, #196]	; 0xc4
 354:	6982      	ldr	r2, [r0, #24]
 356:	69c1      	ldr	r1, [r0, #28]
 358:	4610      	mov	r0, r2
 35a:	f7ff fffe 	bl	0 <_ZN4core3str21_$LT$impl$u20$str$GT$5chars17h8a0f463bf4edf3b1E>
 35e:	9006      	str	r0, [sp, #24]
 360:	9105      	str	r1, [sp, #20]
 362:	e7ff      	b.n	364 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x364>
 364:	9831      	ldr	r0, [sp, #196]	; 0xc4
 366:	68c3      	ldr	r3, [r0, #12]
 368:	a843      	add	r0, sp, #268	; 0x10c
 36a:	9906      	ldr	r1, [sp, #24]
 36c:	9a05      	ldr	r2, [sp, #20]
 36e:	f7ff fffe 	bl	0 <_ZN4core4iter6traits8iterator8Iterator4skip17ha57053688abe8939E>
 372:	e7ff      	b.n	374 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x374>
 374:	a843      	add	r0, sp, #268	; 0x10c
 376:	f7ff fffe 	bl	0 <_ZN94_$LT$core..iter..adapters..Skip$LT$I$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hcce3842060585bcbE>
 37a:	9004      	str	r0, [sp, #16]
 37c:	e7ff      	b.n	37e <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x37e>
 37e:	9831      	ldr	r0, [sp, #196]	; 0xc4
 380:	9904      	ldr	r1, [sp, #16]
 382:	6081      	str	r1, [r0, #8]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:251
                    if self.char_walk_y >= Conf::CHAR_HEIGHT {
 384:	e7ff      	b.n	386 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x386>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:246
                if self.char_walk_x >= Conf::CHAR_WIDTH {
 386:	e7ff      	b.n	388 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x388>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:259
                if let Some(color) = color {
 388:	f8bd 0100 	ldrh.w	r0, [sp, #256]	; 0x100
 38c:	2801      	cmp	r0, #1
 38e:	d14d      	bne.n	42c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x42c>
 390:	e7ff      	b.n	392 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x392>
 392:	f8bd 0102 	ldrh.w	r0, [sp, #258]	; 0x102
 396:	f8ad 0118 	strh.w	r0, [sp, #280]	; 0x118
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:260
                    if x >= 0 && y >= 0 {
 39a:	9841      	ldr	r0, [sp, #260]	; 0x104
 39c:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
 3a0:	dc04      	bgt.n	3ac <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x3ac>
 3a2:	e7ff      	b.n	3a4 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x3a4>
 3a4:	2000      	movs	r0, #0
 3a6:	f88d 011b 	strb.w	r0, [sp, #283]	; 0x11b
 3aa:	e008      	b.n	3be <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x3be>
 3ac:	9842      	ldr	r0, [sp, #264]	; 0x108
 3ae:	2100      	movs	r1, #0
 3b0:	f1b0 3fff 	cmp.w	r0, #4294967295	; 0xffffffff
 3b4:	bfc8      	it	gt
 3b6:	2101      	movgt	r1, #1
 3b8:	f88d 111b 	strb.w	r1, [sp, #283]	; 0x11b
 3bc:	e7ff      	b.n	3be <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x3be>
 3be:	f89d 011b 	ldrb.w	r0, [sp, #283]	; 0x11b
 3c2:	07c0      	lsls	r0, r0, #31
 3c4:	2800      	cmp	r0, #0
 3c6:	d030      	beq.n	42a <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x42a>
 3c8:	e7ff      	b.n	3ca <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x3ca>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:261
                        break Some(Pixel(Coord::new(x, y).to_unsigned(), color));
 3ca:	9841      	ldr	r0, [sp, #260]	; 0x104
 3cc:	9942      	ldr	r1, [sp, #264]	; 0x108
 3ce:	f7ff fffe 	bl	0 <_ZN17embedded_graphics5coord14internal_coord5Coord3new17h5cc04c89c71e58a5E>
 3d2:	9003      	str	r0, [sp, #12]
 3d4:	9102      	str	r1, [sp, #8]
 3d6:	e7ff      	b.n	3d8 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x3d8>
 3d8:	9803      	ldr	r0, [sp, #12]
 3da:	9902      	ldr	r1, [sp, #8]
 3dc:	f7ff fffe 	bl	0 <_ZN104_$LT$embedded_graphics..coord..internal_coord..Coord$u20$as$u20$embedded_graphics..coord..ToUnsigned$GT$11to_unsigned17h37ece76dbcf44ae9E>
 3e0:	9001      	str	r0, [sp, #4]
 3e2:	9100      	str	r1, [sp, #0]
 3e4:	e7ff      	b.n	3e6 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x3e6>
 3e6:	f8bd 0118 	ldrh.w	r0, [sp, #280]	; 0x118
 3ea:	9901      	ldr	r1, [sp, #4]
 3ec:	9147      	str	r1, [sp, #284]	; 0x11c
 3ee:	9a00      	ldr	r2, [sp, #0]
 3f0:	9248      	str	r2, [sp, #288]	; 0x120
 3f2:	f8ad 0124 	strh.w	r0, [sp, #292]	; 0x124
 3f6:	9847      	ldr	r0, [sp, #284]	; 0x11c
 3f8:	9b48      	ldr	r3, [sp, #288]	; 0x120
 3fa:	f8dd c124 	ldr.w	ip, [sp, #292]	; 0x124
 3fe:	f8cd c0dc 	str.w	ip, [sp, #220]	; 0xdc
 402:	9336      	str	r3, [sp, #216]	; 0xd8
 404:	9035      	str	r0, [sp, #212]	; 0xd4
 406:	2001      	movs	r0, #1
 408:	9034      	str	r0, [sp, #208]	; 0xd0
 40a:	e7ff      	b.n	40c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x40c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:269
        pixel
 40c:	9834      	ldr	r0, [sp, #208]	; 0xd0
 40e:	9935      	ldr	r1, [sp, #212]	; 0xd4
 410:	9a36      	ldr	r2, [sp, #216]	; 0xd8
 412:	9b37      	ldr	r3, [sp, #220]	; 0xdc
 414:	f8dd c0c0 	ldr.w	ip, [sp, #192]	; 0xc0
 418:	f8cc 300c 	str.w	r3, [ip, #12]
 41c:	f8cc 2008 	str.w	r2, [ip, #8]
 420:	f8cc 1004 	str.w	r1, [ip, #4]
 424:	f8cc 0000 	str.w	r0, [ip]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:270
    }
 428:	e645      	b.n	b6 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xb6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:259
                if let Some(color) = color {
 42a:	e7ff      	b.n	42c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x42c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:209
        let pixel = loop {
 42c:	e649      	b.n	c2 <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0xc2>
 42e:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:265
                break None;
 430:	9034      	str	r0, [sp, #208]	; 0xd0
 432:	e7eb      	b.n	40c <_ZN134_$LT$embedded_graphics..fonts..font_builder..FontBuilderIterator$LT$C$C$Conf$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h42e63ceda327ae82E+0x40c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:201
        if self.pos[0] + (self.text.len() as i32 * Conf::CHAR_WIDTH as i32) <= 0
 434:	f240 0000 	movw	r0, #0
 438:	f2c0 0000 	movt	r0, #0
 43c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 440:	defe      	udf	#254	; 0xfe
 442:	f240 0000 	movw	r0, #0
 446:	f2c0 0000 	movt	r0, #0
 44a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 44e:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:202
            || self.pos[1] + (Conf::CHAR_HEIGHT as i32) <= 0
 450:	f240 0000 	movw	r0, #0
 454:	f2c0 0000 	movt	r0, #0
 458:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 45c:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:214
                let row = char_offset / char_per_row;
 45e:	f240 0000 	movw	r0, #0
 462:	f2c0 0000 	movt	r0, #0
 466:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 46a:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:217
                let char_x = (char_offset - (row * char_per_row)) * Conf::CHAR_WIDTH;
 46c:	f240 0000 	movw	r0, #0
 470:	f2c0 0000 	movt	r0, #0
 474:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 478:	defe      	udf	#254	; 0xfe
 47a:	f240 0000 	movw	r0, #0
 47e:	f2c0 0000 	movt	r0, #0
 482:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 486:	defe      	udf	#254	; 0xfe
 488:	f240 0000 	movw	r0, #0
 48c:	f2c0 0000 	movt	r0, #0
 490:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 494:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:218
                let char_y = row * Conf::CHAR_HEIGHT;
 496:	f240 0000 	movw	r0, #0
 49a:	f2c0 0000 	movt	r0, #0
 49e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4a2:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:226
                    + (Conf::FONT_IMAGE_WIDTH * char_y)
 4a4:	f240 0000 	movw	r0, #0
 4a8:	f2c0 0000 	movt	r0, #0
 4ac:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4b0:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:225
                let bitmap_bit_index = char_x
 4b2:	f240 0000 	movw	r0, #0
 4b6:	f2c0 0000 	movt	r0, #0
 4ba:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4be:	defe      	udf	#254	; 0xfe
 4c0:	f240 0000 	movw	r0, #0
 4c4:	f2c0 0000 	movt	r0, #0
 4c8:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4cc:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:228
                    + (self.char_walk_y * Conf::FONT_IMAGE_WIDTH);
 4ce:	f240 0000 	movw	r0, #0
 4d2:	f2c0 0000 	movt	r0, #0
 4d6:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4da:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:225
                let bitmap_bit_index = char_x
 4dc:	f240 0000 	movw	r0, #0
 4e0:	f2c0 0000 	movt	r0, #0
 4e4:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4e8:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:231
                let bitmap_bit = 7 - (bitmap_bit_index % 8);
 4ea:	f240 0000 	movw	r0, #0
 4ee:	f2c0 0000 	movt	r0, #0
 4f2:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 4f6:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:233
                let color = if Conf::FONT_IMAGE[bitmap_byte as usize] & (1 << bitmap_bit) != 0 {
 4f8:	f240 0000 	movw	r0, #0
 4fc:	f2c0 0000 	movt	r0, #0
 500:	f44f 5296 	mov.w	r2, #4800	; 0x12c0
 504:	9917      	ldr	r1, [sp, #92]	; 0x5c
 506:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 50a:	defe      	udf	#254	; 0xfe
 50c:	f240 0000 	movw	r0, #0
 510:	f2c0 0000 	movt	r0, #0
 514:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 518:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:240
                    + (Conf::CHAR_WIDTH * self.idx as u32) as i32
 51a:	f240 0000 	movw	r0, #0
 51e:	f2c0 0000 	movt	r0, #0
 522:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 526:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:239
                let x = self.pos[0]
 528:	f240 0000 	movw	r0, #0
 52c:	f2c0 0000 	movt	r0, #0
 530:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 534:	defe      	udf	#254	; 0xfe
 536:	f240 0000 	movw	r0, #0
 53a:	f2c0 0000 	movt	r0, #0
 53e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 542:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:242
                let y = self.pos[1] + self.char_walk_y as i32;
 544:	f240 0000 	movw	r0, #0
 548:	f2c0 0000 	movt	r0, #0
 54c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 550:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:244
                self.char_walk_x += 1;
 552:	f240 0000 	movw	r0, #0
 556:	f2c0 0000 	movt	r0, #0
 55a:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 55e:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:248
                    self.char_walk_y += 1;
 560:	f240 0000 	movw	r0, #0
 564:	f2c0 0000 	movt	r0, #0
 568:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 56c:	defe      	udf	#254	; 0xfe
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/fonts/font_builder.rs:253
                        self.idx += 1;
 56e:	f240 0000 	movw	r0, #0
 572:	f2c0 0000 	movt	r0, #0
 576:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 57a:	defe      	udf	#254	; 0xfe

app-9b7b12e8d5cbce98.o34cg3zor3z5cjo.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 o34cg3zor3z5cjo
000001b4 l       .debug_str	00000000 
0000023e l       .debug_str	00000000 
00000240 l       .debug_str	00000000 
00000245 l       .debug_str	00000000 
00000249 l       .debug_str	00000000 
00000254 l       .debug_str	00000000 
00000259 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000090 l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000a3 l       .debug_str	00000000 
000000ab l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b7 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c4 l       .debug_str	00000000 
000000ca l       .debug_str	00000000 
000000d0 l       .debug_str	00000000 
000000d7 l       .debug_str	00000000 
000000dd l       .debug_str	00000000 
000000e5 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000f2 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
00000104 l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
00000118 l       .debug_str	00000000 
00000120 l       .debug_str	00000000 
00000128 l       .debug_str	00000000 
00000130 l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
0000013f l       .debug_str	00000000 
00000146 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000154 l       .debug_str	00000000 
0000015b l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
00000169 l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
00000175 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
00000181 l       .debug_str	00000000 
00000188 l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
00000198 l       .debug_str	00000000 
000001a4 l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001c5 l       .debug_str	00000000 
00000201 l       .debug_str	00000000 
0000022d l       .debug_str	00000000 
00000232 l       .debug_str	00000000 
00000239 l       .debug_str	00000000 
00000000 l    d  .text._ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE	00000000 .text._ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE	0000003c _ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE
00000000         *UND*	00000000 _ZN10st7735_lcd11instruction37_IMPL_NUM_ToPrimitive_FOR_Instruction96_$LT$impl$u20$num_traits..cast..ToPrimitive$u20$for$u20$st7735_lcd..instruction..Instruction$GT$6to_u6417h208d3aa3ac8a18b3E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E
00000000         *UND*	00000000 _ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E



Disassembly of section .text._ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE:

00000000 <_ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE>:
_ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:60
        self.to_u64().as_ref().and_then(ToPrimitive::to_usize)
    }

    /// Converts the value of `self` to an `u8`.
    #[inline]
    fn to_u8(&self) -> Option<u8> {
   0:	b580      	push	{r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4601      	mov	r1, r0
   6:	9005      	str	r0, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:61
        self.to_u64().as_ref().and_then(ToPrimitive::to_u8)
   8:	9805      	ldr	r0, [sp, #20]
   a:	9104      	str	r1, [sp, #16]
   c:	f7ff fffe 	bl	0 <_ZN10st7735_lcd11instruction37_IMPL_NUM_ToPrimitive_FOR_Instruction96_$LT$impl$u20$num_traits..cast..ToPrimitive$u20$for$u20$st7735_lcd..instruction..Instruction$GT$6to_u6417h208d3aa3ac8a18b3E>
  10:	9309      	str	r3, [sp, #36]	; 0x24
  12:	9208      	str	r2, [sp, #32]
  14:	9107      	str	r1, [sp, #28]
  16:	9006      	str	r0, [sp, #24]
  18:	e7ff      	b.n	1a <_ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE+0x1a>
  1a:	a806      	add	r0, sp, #24
  1c:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$6as_ref17had81b4df4085bf29E>
  20:	9003      	str	r0, [sp, #12]
  22:	e7ff      	b.n	24 <_ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE+0x24>
  24:	9803      	ldr	r0, [sp, #12]
  26:	f7ff fffe 	bl	0 <_ZN4core6option15Option$LT$T$GT$8and_then17h290c7c4165d4f760E>
  2a:	9002      	str	r0, [sp, #8]
  2c:	9101      	str	r1, [sp, #4]
  2e:	e7ff      	b.n	30 <_ZN10num_traits4cast11ToPrimitive5to_u817h77a70f666a20efecE+0x30>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/num-traits-0.2.8/src/cast.rs:62
    }
  30:	9802      	ldr	r0, [sp, #8]
  32:	f000 0001 	and.w	r0, r0, #1
  36:	9901      	ldr	r1, [sp, #4]
  38:	b00a      	add	sp, #40	; 0x28
  3a:	bd80      	pop	{r7, pc}

app-9b7b12e8d5cbce98.uyer0urau233p58.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 uyer0urau233p58
000001cb l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
0000008c l       .debug_str	00000000 
00000093 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009f l       .debug_str	00000000 
000000aa l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000c2 l       .debug_str	00000000 
000001ed l       .debug_str	00000000 
000000cd l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000118 l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
0000013f l       .debug_str	00000000 
00000149 l       .debug_str	00000000 
00000156 l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
00000167 l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
00000178 l       .debug_str	00000000 
0000017a l       .debug_str	00000000 
00000000 l    d  .text._ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E	00000000 .text._ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E	0000000e _ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E



Disassembly of section .text._ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E:

00000000 <_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E>:
_ZN50_$LT$T$u20$as$u20$core..convert..From$LT$T$GT$$GT$4from17hfb2f11701a8ef3f1E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/convert.rs:547
   0:	b082      	sub	sp, #8
   2:	4601      	mov	r1, r0
   4:	9001      	str	r0, [sp, #4]
   6:	9801      	ldr	r0, [sp, #4]
   8:	9100      	str	r1, [sp, #0]
   a:	b002      	add	sp, #8
   c:	4770      	bx	lr

app-9b7b12e8d5cbce98.z59f1boz70zgx2k.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 z59f1boz70zgx2k
000002c8 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000055 l       .debug_str	00000000 
00000085 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
0000009d l       .debug_str	00000000 
000000a6 l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b8 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c0 l       .debug_str	00000000 
000002d3 l       .debug_str	00000000 
000000c7 l       .debug_str	00000000 
000000c9 l       .debug_str	00000000 
00000138 l       .debug_str	00000000 
0000016d l       .debug_str	00000000 
00000178 l       .debug_str	00000000 
0000017d l       .debug_str	00000000 
00000184 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
0000018b l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
000001c6 l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001e0 l       .debug_str	00000000 
000001e3 l       .debug_str	00000000 
00000218 l       .debug_str	00000000 
0000021d l       .debug_str	00000000 
0000026d l       .debug_str	00000000 
00000278 l       .debug_str	00000000 
000002bd l       .debug_str	00000000 
00000000 l    d  .text._ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE	00000000 .text._ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 .hidden _ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE
00000000         *UND*	00000000 _ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE
00000000 g     F .text._ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE	00000062 _ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE



Disassembly of section .text._ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE:

00000000 <_ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE>:
_ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:6
//! Styling struct to customise the look of objects.

use crate::pixelcolor::PixelColor;

/// Style properties for an object
#[derive(Debug, Copy, Clone)]
   0:	b580      	push	{r7, lr}
   2:	b08c      	sub	sp, #48	; 0x30
   4:	460a      	mov	r2, r1
   6:	9108      	str	r1, [sp, #32]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:11
pub struct Style<P: PixelColor> {
    /// Fill colour of the object
    ///
    /// For fonts, this is the background colour of the text
    pub fill_color: Option<P>,
   8:	9908      	ldr	r1, [sp, #32]
   a:	9109      	str	r1, [sp, #36]	; 0x24
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:16

    /// Stroke (border/line) color of the object
    ///
    /// For fonts, this is the foreground colour of the text
    pub stroke_color: Option<P>,
   c:	9908      	ldr	r1, [sp, #32]
   e:	3104      	adds	r1, #4
  10:	910a      	str	r1, [sp, #40]	; 0x28
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:21

    /// Stroke width
    ///
    /// Set the stroke width for an object. Has no effect on fonts.
    pub stroke_width: u8,
  12:	9908      	ldr	r1, [sp, #32]
  14:	3108      	adds	r1, #8
  16:	910b      	str	r1, [sp, #44]	; 0x2c
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:11
    pub fill_color: Option<P>,
  18:	9909      	ldr	r1, [sp, #36]	; 0x24
  1a:	9007      	str	r0, [sp, #28]
  1c:	4608      	mov	r0, r1
  1e:	9206      	str	r2, [sp, #24]
  20:	f7ff fffe 	bl	0 <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE>
  24:	9005      	str	r0, [sp, #20]
  26:	9104      	str	r1, [sp, #16]
  28:	e7ff      	b.n	2a <_ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE+0x2a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:16
    pub stroke_color: Option<P>,
  2a:	980a      	ldr	r0, [sp, #40]	; 0x28
  2c:	f7ff fffe 	bl	0 <_ZN68_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h70f1be704061c8aeE>
  30:	9003      	str	r0, [sp, #12]
  32:	9102      	str	r1, [sp, #8]
  34:	e7ff      	b.n	36 <_ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE+0x36>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:21
    pub stroke_width: u8,
  36:	980b      	ldr	r0, [sp, #44]	; 0x2c
  38:	f7ff fffe 	bl	0 <_ZN4core5clone5impls51_$LT$impl$u20$core..clone..Clone$u20$for$u20$u8$GT$5clone17ha9894ec7186c0ecfE>
  3c:	9001      	str	r0, [sp, #4]
  3e:	e7ff      	b.n	40 <_ZN79_$LT$embedded_graphics..style..Style$LT$P$GT$$u20$as$u20$core..clone..Clone$GT$5clone17hddecdf4dff183a2cE+0x40>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/embedded-graphics-0.5.2/src/style.rs:6
#[derive(Debug, Copy, Clone)]
  40:	9805      	ldr	r0, [sp, #20]
  42:	9907      	ldr	r1, [sp, #28]
  44:	8008      	strh	r0, [r1, #0]
  46:	9a04      	ldr	r2, [sp, #16]
  48:	804a      	strh	r2, [r1, #2]
  4a:	9b03      	ldr	r3, [sp, #12]
  4c:	808b      	strh	r3, [r1, #4]
  4e:	f8dd c008 	ldr.w	ip, [sp, #8]
  52:	f8a1 c006 	strh.w	ip, [r1, #6]
  56:	f8dd e004 	ldr.w	lr, [sp, #4]
  5a:	f881 e008 	strb.w	lr, [r1, #8]
  5e:	b00c      	add	sp, #48	; 0x30
  60:	bd80      	pop	{r7, pc}
arm-none-eabi-objdump: rust.metadata.bin: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.12ulr3no6t1225s9.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.1bjukv3v4k0ycr7s.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.1ctpqy3zikjg3fy2.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.1mlp6aodb4i09mzo.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.1s9nw4io6l85dnto.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.1t1nsou0xqr1p6vw.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.1zfer0cyyeyxyymg.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.20x17epymehj2cm.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.276jooca2j2qznpw.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.27rdm6uyhgszchef.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.2mayv2qx0n0p0ab3.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.33w1ovg264oh73nb.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.3c72b4u84dsw2o7l.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.3t2x0g5nmu6tdzr8.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.3x2ym8o7y6h3w9yn.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.3ythfrr2onbxhq54.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.442kj81u5yysbtpp.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.46fe3uwfwh9g1u34.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.48pkrwpcbpntplvj.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.4djg1kt2q51mwy2a.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.4nj5x684xrrfo05s.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.4thgnvzmko4oxom3.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.4tsjyjq57vs1r4zn.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.4xhwzkn01xyri3xh.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.4zquf80iy2ejv0wy.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.5abeuhp64702alzv.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.5ar5x7pg41tteeyz.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.5e73fcc4zk5eys71.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.5yyavy3q69atz3j.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.jn5aans8muxr31g.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.kv90lxfnc941dky.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.o34cg3zor3z5cjo.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.uyer0urau233p58.rcgu.bc.z: File format not recognized
arm-none-eabi-objdump: app-9b7b12e8d5cbce98.z59f1boz70zgx2k.rcgu.bc.z: File format not recognized
