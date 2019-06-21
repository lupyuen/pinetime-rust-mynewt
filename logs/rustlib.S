In archive rustlib.a:

aligned-132f50daa8d161f1.aligned.6vdbdpb2-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 aligned.6vdbdpb2-cgu.0



aligned-61447209071a25d6.aligned.5mjkd2en-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 aligned.5mjkd2en-cgu.0



as_slice-ab9ccef590ab5a7b.as_slice.efembi8u-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 as_slice.efembi8u-cgu.0



bare_metal-10dd96e7fb7c72f2.bare_metal.7o6uioxg-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 bare_metal.7o6uioxg-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000098 l       .debug_str	00000000 
000000e4 l       .debug_str	00000000 
000000ef l       .debug_str	00000000 
000000f2 l       .debug_str	00000000 
000000f5 l       .debug_str	00000000 
00000105 l       .debug_str	00000000 
0000013e l       .debug_str	00000000 
00000000 l    d  .text._ZN10bare_metal15CriticalSection3new17h686002a6e82c5a9cE	00000000 .text._ZN10bare_metal15CriticalSection3new17h686002a6e82c5a9cE
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN10bare_metal15CriticalSection3new17h686002a6e82c5a9cE	00000002 _ZN10bare_metal15CriticalSection3new17h686002a6e82c5a9cE



Disassembly of section .text._ZN10bare_metal15CriticalSection3new17h686002a6e82c5a9cE:

00000000 <_ZN10bare_metal15CriticalSection3new17h686002a6e82c5a9cE>:
_ZN10bare_metal15CriticalSection3new17h686002a6e82c5a9cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/bare-metal-0.2.4/src/lib.rs:68
    ///
    /// This method is meant to be used to create safe abstractions rather than
    /// meant to be directly used in applications.
    pub unsafe fn new() -> Self {
        CriticalSection { _0: () }
    }
   0:	4770      	bx	lr

cortex-m-v7.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    d  .text	00000000 .text
00000000 l    d  .data	00000000 .data
00000000 l    d  .bss	00000000 .bss
00000000 l    d  .text.__basepri_max	00000000 .text.__basepri_max
00000000 l    d  .text.__basepri_r	00000000 .text.__basepri_r
00000000 l    d  .text.__basepri_w	00000000 .text.__basepri_w
00000000 l    d  .text.__faultmask	00000000 .text.__faultmask
00000000 l    d  .ARM.attributes	00000000 .ARM.attributes
00000000 g     F .text.__basepri_max	00000000 __basepri_max
00000000 g     F .text.__basepri_r	00000000 __basepri_r
00000000 g     F .text.__basepri_w	00000000 __basepri_w
00000000 g     F .text.__faultmask	00000000 __faultmask



Disassembly of section .text.__basepri_max:

00000000 <__basepri_max>:
__basepri_max():
   0:	f380 8812 	msr	BASEPRI_MAX, r0
   4:	4770      	bx	lr

Disassembly of section .text.__basepri_r:

00000000 <__basepri_r>:
__basepri_r():
   0:	f3ef 8011 	mrs	r0, BASEPRI
   4:	4770      	bx	lr

Disassembly of section .text.__basepri_w:

00000000 <__basepri_w>:
__basepri_w():
   0:	f380 8811 	msr	BASEPRI, r0
   4:	4770      	bx	lr

Disassembly of section .text.__faultmask:

00000000 <__faultmask>:
__faultmask():
   0:	f3ef 8013 	mrs	r0, FAULTMASK
   4:	4770      	bx	lr

cortex-m.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    d  .text	00000000 .text
00000000 l    d  .data	00000000 .data
00000000 l    d  .bss	00000000 .bss
00000000 l    d  .text.__bkpt	00000000 .text.__bkpt
00000000 l    d  .text.__control	00000000 .text.__control
00000000 l    d  .text.__cpsid	00000000 .text.__cpsid
00000000 l    d  .text.__cpsie	00000000 .text.__cpsie
00000000 l    d  .text.__delay	00000000 .text.__delay
00000000 l    d  .text.__dmb	00000000 .text.__dmb
00000000 l    d  .text.__dsb	00000000 .text.__dsb
00000000 l    d  .text.__isb	00000000 .text.__isb
00000000 l    d  .text.__msp_r	00000000 .text.__msp_r
00000000 l    d  .text.__msp_w	00000000 .text.__msp_w
00000000 l    d  .text.__nop	00000000 .text.__nop
00000000 l    d  .text.__primask	00000000 .text.__primask
00000000 l    d  .text.__psp_r	00000000 .text.__psp_r
00000000 l    d  .text.__psp_w	00000000 .text.__psp_w
00000000 l    d  .text.__sev	00000000 .text.__sev
00000000 l    d  .text.__wfe	00000000 .text.__wfe
00000000 l    d  .text.__wfi	00000000 .text.__wfi
00000000 l    d  .ARM.attributes	00000000 .ARM.attributes
00000000 g     F .text.__bkpt	00000000 __bkpt
00000000 g     F .text.__control	00000000 __control
00000000 g     F .text.__cpsid	00000000 __cpsid
00000000 g     F .text.__cpsie	00000000 __cpsie
00000000 g     F .text.__delay	00000000 __delay
00000000 g     F .text.__dmb	00000000 __dmb
00000000 g     F .text.__dsb	00000000 __dsb
00000000 g     F .text.__isb	00000000 __isb
00000000 g     F .text.__msp_r	00000000 __msp_r
00000000 g     F .text.__msp_w	00000000 __msp_w
00000000 g     F .text.__nop	00000000 __nop
00000000 g     F .text.__primask	00000000 __primask
00000000 g     F .text.__psp_r	00000000 __psp_r
00000000 g     F .text.__psp_w	00000000 __psp_w
00000000 g     F .text.__sev	00000000 __sev
00000000 g     F .text.__wfe	00000000 __wfe
00000000 g     F .text.__wfi	00000000 __wfi



Disassembly of section .text.__bkpt:

00000000 <__bkpt>:
__bkpt():
   0:	be00      	bkpt	0x0000
   2:	4770      	bx	lr

Disassembly of section .text.__control:

00000000 <__control>:
__control():
   0:	f3ef 8014 	mrs	r0, CONTROL
   4:	4770      	bx	lr

Disassembly of section .text.__cpsid:

00000000 <__cpsid>:
__cpsid():
   0:	b672      	cpsid	i
   2:	4770      	bx	lr

Disassembly of section .text.__cpsie:

00000000 <__cpsie>:
__cpsie():
   0:	b662      	cpsie	i
   2:	4770      	bx	lr

Disassembly of section .text.__delay:

00000000 <__delay>:
__delay():
   0:	bf00      	nop
   2:	3801      	subs	r0, #1
   4:	f47f affe 	bne.w	0 <__delay>
   8:	4770      	bx	lr

Disassembly of section .text.__dmb:

00000000 <__dmb>:
__dmb():
   0:	f3bf 8f5f 	dmb	sy
   4:	4770      	bx	lr

Disassembly of section .text.__dsb:

00000000 <__dsb>:
__dsb():
   0:	f3bf 8f4f 	dsb	sy
   4:	4770      	bx	lr

Disassembly of section .text.__isb:

00000000 <__isb>:
__isb():
   0:	f3bf 8f6f 	isb	sy
   4:	4770      	bx	lr

Disassembly of section .text.__msp_r:

00000000 <__msp_r>:
__msp_r():
   0:	f3ef 8008 	mrs	r0, MSP
   4:	4770      	bx	lr

Disassembly of section .text.__msp_w:

00000000 <__msp_w>:
__msp_w():
   0:	f380 8808 	msr	MSP, r0
   4:	4770      	bx	lr

Disassembly of section .text.__nop:

00000000 <__nop>:
__nop():
   0:	4770      	bx	lr

Disassembly of section .text.__primask:

00000000 <__primask>:
__primask():
   0:	f3ef 8010 	mrs	r0, PRIMASK
   4:	4770      	bx	lr

Disassembly of section .text.__psp_r:

00000000 <__psp_r>:
__psp_r():
   0:	f3ef 8009 	mrs	r0, PSP
   4:	4770      	bx	lr

Disassembly of section .text.__psp_w:

00000000 <__psp_w>:
__psp_w():
   0:	f380 8809 	msr	PSP, r0
   4:	4770      	bx	lr

Disassembly of section .text.__sev:

00000000 <__sev>:
__sev():
   0:	bf40      	sev
   2:	4770      	bx	lr

Disassembly of section .text.__wfe:

00000000 <__wfe>:
__wfe():
   0:	bf20      	wfe
   2:	4770      	bx	lr

Disassembly of section .text.__wfi:

00000000 <__wfi>:
__wfi():
   0:	bf30      	wfi
   2:	4770      	bx	lr

cortex_m-361a172a152d3af9.cortex_m.7di2lvzq-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cortex_m.7di2lvzq-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000096 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000e7 l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
0000010c l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
0000011c l       .debug_str	00000000 
00000120 l       .debug_str	00000000 
00000122 l       .debug_str	00000000 
00000132 l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
0000015c l       .debug_str	00000000 
00000161 l       .debug_str	00000000 
0000017a l       .debug_str	00000000 
0000018b l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
00000193 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
000001aa l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
000001c5 l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
000001d9 l       .debug_str	00000000 
000001e0 l       .debug_str	00000000 
000001ed l       .debug_str	00000000 
000001f4 l       .debug_str	00000000 
000001fc l       .debug_str	00000000 
00000206 l       .debug_str	00000000 
0000022c l       .debug_str	00000000 
00000231 l       .debug_str	00000000 
00000238 l       .debug_str	00000000 
0000023b l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
00000246 l       .debug_str	00000000 
0000024a l       .debug_str	00000000 
0000024d l       .debug_str	00000000 
00000250 l       .debug_str	00000000 
00000255 l       .debug_str	00000000 
0000025b l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
0000026a l       .debug_str	00000000 
00000274 l       .debug_str	00000000 
0000027b l       .debug_str	00000000 
00000280 l       .debug_str	00000000 
00000285 l       .debug_str	00000000 
0000028c l       .debug_str	00000000 
00000292 l       .debug_str	00000000 
000002a0 l       .debug_str	00000000 
000002ac l       .debug_str	00000000 
000002bc l       .debug_str	00000000 
000002ca l       .debug_str	00000000 
000002cf l       .debug_str	00000000 
000002d4 l       .debug_str	00000000 
000002dd l       .debug_str	00000000 
000002eb l       .debug_str	00000000 
000002f3 l       .debug_str	00000000 
000002fe l       .debug_str	00000000 
0000030b l       .debug_str	00000000 
00000311 l       .debug_str	00000000 
00000315 l       .debug_str	00000000 
00000319 l       .debug_str	00000000 
0000031f l       .debug_str	00000000 
00000326 l       .debug_str	00000000 
00000330 l       .debug_str	00000000 
00000335 l       .debug_str	00000000 
0000033f l       .debug_str	00000000 
00000348 l       .debug_str	00000000 
00000352 l       .debug_str	00000000 
0000035a l       .debug_str	00000000 
00000362 l       .debug_str	00000000 
00000366 l       .debug_str	00000000 
0000036f l       .debug_str	00000000 
000003cc l       .debug_str	00000000 
000003d1 l       .debug_str	00000000 
000003d3 l       .debug_str	00000000 
000003d9 l       .debug_str	00000000 
000003de l       .debug_str	00000000 
000003e3 l       .debug_str	00000000 
000003e9 l       .debug_str	00000000 
000003ef l       .debug_str	00000000 
000003f5 l       .debug_str	00000000 
00000403 l       .debug_str	00000000 
0000040d l       .debug_str	00000000 
00000411 l       .debug_str	00000000 
00000419 l       .debug_str	00000000 
00000421 l       .debug_str	00000000 
00000435 l       .debug_str	00000000 
00000441 l       .debug_str	00000000 
0000044c l       .debug_str	00000000 
00000453 l       .debug_str	00000000 
00000459 l       .debug_str	00000000 
0000045d l       .debug_str	00000000 
00000463 l       .debug_str	00000000 
00000466 l       .debug_str	00000000 
00000475 l       .debug_str	00000000 
0000047c l       .debug_str	00000000 
00000480 l       .debug_str	00000000 
00000489 l       .debug_str	00000000 
00000495 l       .debug_str	00000000 
000004ae l       .debug_str	00000000 
000004b3 l       .debug_str	00000000 
000004c4 l       .debug_str	00000000 
000004ce l       .debug_str	00000000 
0000052c l       .debug_str	00000000 
00000537 l       .debug_str	00000000 
00000554 l       .debug_str	00000000 
00000558 l       .debug_str	00000000 
00000560 l       .debug_str	00000000 
00000577 l       .debug_str	00000000 
0000059b l       .debug_str	00000000 
000005b7 l       .debug_str	00000000 
000005bc l       .debug_str	00000000 
000005c5 l       .debug_str	00000000 
000005cc l       .debug_str	00000000 
000005e5 l       .debug_str	00000000 
000005ef l       .debug_str	00000000 
00000609 l       .debug_str	00000000 
00000665 l       .debug_str	00000000 
0000066d l       .debug_str	00000000 
000006bc l       .debug_str	00000000 
000006c8 l       .debug_str	00000000 
000006d2 l       .debug_str	00000000 
000006db l       .debug_str	00000000 
000006df l       .debug_str	00000000 
000006e9 l       .debug_str	00000000 
000006ee l       .debug_str	00000000 
000006f2 l       .debug_str	00000000 
000006f7 l       .debug_str	00000000 
000006fe l       .debug_str	00000000 
00000703 l       .debug_str	00000000 
00000708 l       .debug_str	00000000 
0000070e l       .debug_str	00000000 
00000713 l       .debug_str	00000000 
00000746 l       .debug_str	00000000 
00000766 l       .debug_str	00000000 
00000768 l       .debug_str	00000000 
000007c4 l       .debug_str	00000000 
000007ce l       .debug_str	00000000 
000007d0 l       .debug_str	00000000 
000007d5 l       .debug_str	00000000 
00000805 l       .debug_str	00000000 
00000818 l       .debug_str	00000000 
0000081c l       .debug_str	00000000 
00000827 l       .debug_str	00000000 
0000086c l       .debug_str	00000000 
0000087a l       .debug_str	00000000 
0000089b l       .debug_str	00000000 
000008cf l       .debug_str	00000000 
000008dd l       .debug_str	00000000 
000008e2 l       .debug_str	00000000 
000008e9 l       .debug_str	00000000 
000008f1 l       .debug_str	00000000 
000008fc l       .debug_str	00000000 
000008ff l       .debug_str	00000000 
00000901 l       .debug_str	00000000 
0000091c l       .debug_str	00000000 
00000941 l       .debug_str	00000000 
00000947 l       .debug_str	00000000 
0000094c l       .debug_str	00000000 
0000097b l       .debug_str	00000000 
00000985 l       .debug_str	00000000 
0000098b l       .debug_str	00000000 
0000098f l       .debug_str	00000000 
000009c0 l       .debug_str	00000000 
000009d4 l       .debug_str	00000000 
000009dd l       .debug_str	00000000 
00000a1d l       .debug_str	00000000 
00000a27 l       .debug_str	00000000 
00000a58 l       .debug_str	00000000 
00000a6b l       .debug_str	00000000 
00000aaa l       .debug_str	00000000 
00000ab3 l       .debug_str	00000000 
00000ae5 l       .debug_str	00000000 
00000af1 l       .debug_str	00000000 
00000af6 l       .debug_str	00000000 
00000afc l       .debug_str	00000000 
00000b03 l       .debug_str	00000000 
00000b05 l       .debug_str	00000000 
00000b0a l       .debug_str	00000000 
00000b10 l       .debug_str	00000000 
00000b16 l       .debug_str	00000000 
00000b1a l       .debug_str	00000000 
00000b27 l       .debug_str	00000000 
00000b2e l       .debug_str	00000000 
00000b32 l       .debug_str	00000000 
00000b63 l       .debug_str	00000000 
00000b77 l       .debug_str	00000000 
00000b80 l       .debug_str	00000000 
00000bc0 l       .debug_str	00000000 
00000bca l       .debug_str	00000000 
00000bfb l       .debug_str	00000000 
00000c1a l       .debug_str	00000000 
00000c21 l       .debug_str	00000000 
00000c2d l       .debug_str	00000000 
00000c35 l       .debug_str	00000000 
00000c3e l       .debug_str	00000000 
00000c43 l       .debug_str	00000000 
00000c46 l       .debug_str	00000000 
00000c4f l       .debug_str	00000000 
00000c56 l       .debug_str	00000000 
00000c59 l       .debug_str	00000000 
00000c5f l       .debug_str	00000000 
00000c69 l       .debug_str	00000000 
00000c71 l       .debug_str	00000000 
00000c77 l       .debug_str	00000000 
00000c82 l       .debug_str	00000000 
00000c8b l       .debug_str	00000000 
00000cae l       .debug_str	00000000 
00000ccd l       .debug_str	00000000 
00000cf4 l       .debug_str	00000000 
00000cfe l       .debug_str	00000000 
00000d93 l       .debug_str	00000000 
00000d9f l       .debug_str	00000000 
00000dc3 l       .debug_str	00000000 
00000dc5 l       .debug_str	00000000 
00000e10 l       .debug_str	00000000 
00000e20 l       .debug_str	00000000 
00000e24 l       .debug_str	00000000 
00000e32 l       .debug_str	00000000 
00000e36 l       .debug_str	00000000 
00000e38 l       .debug_str	00000000 
00000e3a l       .debug_str	00000000 
00000e81 l       .debug_str	00000000 
00000e8d l       .debug_str	00000000 
00000ee2 l       .debug_str	00000000 
00000eec l       .debug_str	00000000 
00000ef3 l       .debug_str	00000000 
00000f3e l       .debug_str	00000000 
00000f49 l       .debug_str	00000000 
00000f4f l       .debug_str	00000000 
00000f55 l       .debug_str	00000000 
00000f5b l       .debug_str	00000000 
00000f6d l       .debug_str	00000000 
00000fa6 l       .debug_str	00000000 
00000faf l       .debug_str	00000000 
00000fc9 l       .debug_str	00000000 
00000fdb l       .debug_str	00000000 
00000fe3 l       .debug_str	00000000 
00001021 l       .debug_str	00000000 
0000102c l       .debug_str	00000000 
00001048 l       .debug_str	00000000 
00001052 l       .debug_str	00000000 
00001069 l       .debug_str	00000000 
0000106f l       .debug_str	00000000 
000010df l       .debug_str	00000000 
000010ec l       .debug_str	00000000 
0000110d l       .debug_str	00000000 
00001113 l       .debug_str	00000000 
00001117 l       .debug_str	00000000 
0000111b l       .debug_str	00000000 
00001144 l       .debug_str	00000000 
00001148 l       .debug_str	00000000 
00001181 l       .debug_str	00000000 
0000118a l       .debug_str	00000000 
00001192 l       .debug_str	00000000 
000011cf l       .debug_str	00000000 
000011d9 l       .debug_str	00000000 
000011f5 l       .debug_str	00000000 
000011fd l       .debug_str	00000000 
000011ff l       .debug_str	00000000 
0000123e l       .debug_str	00000000 
00001252 l       .debug_str	00000000 
00001256 l       .debug_str	00000000 
00001263 l       .debug_str	00000000 
000012ed l       .debug_str	00000000 
000012f9 l       .debug_str	00000000 
000012fb l       .debug_str	00000000 
000012ff l       .debug_str	00000000 
0000133e l       .debug_str	00000000 
0000134c l       .debug_str	00000000 
000013d7 l       .debug_str	00000000 
00001407 l       .debug_str	00000000 
00001419 l       .debug_str	00000000 
00001458 l       .debug_str	00000000 
0000145c l       .debug_str	00000000 
00001471 l       .debug_str	00000000 
00001503 l       .debug_str	00000000 
00001505 l       .debug_str	00000000 
00001509 l       .debug_str	00000000 
00001546 l       .debug_str	00000000 
0000154a l       .debug_str	00000000 
00001555 l       .debug_str	00000000 
0000155f l       .debug_str	00000000 
00001564 l       .debug_str	00000000 
0000156f l       .debug_str	00000000 
000015ae l       .debug_str	00000000 
000015bc l       .debug_str	00000000 
00001647 l       .debug_str	00000000 
0000164b l       .debug_str	00000000 
0000168a l       .debug_str	00000000 
0000169a l       .debug_str	00000000 
00001727 l       .debug_str	00000000 
00001766 l       .debug_str	00000000 
00001776 l       .debug_str	00000000 
00001803 l       .debug_str	00000000 
00001842 l       .debug_str	00000000 
00001854 l       .debug_str	00000000 
000018e3 l       .debug_str	00000000 
00001922 l       .debug_str	00000000 
0000192f l       .debug_str	00000000 
000019b9 l       .debug_str	00000000 
000019e2 l       .debug_str	00000000 
000019e6 l       .debug_str	00000000 
00001a2c l       .debug_str	00000000 
00001a32 l       .debug_str	00000000 
00001a5c l       .debug_str	00000000 
00001a6b l       .debug_str	00000000 
00001a7c l       .debug_str	00000000 
00001ab5 l       .debug_str	00000000 
00001abd l       .debug_str	00000000 
00001ad6 l       .debug_str	00000000 
00001add l       .debug_str	00000000 
00001b1b l       .debug_str	00000000 
00001b25 l       .debug_str	00000000 
00001b40 l       .debug_str	00000000 
00001b45 l       .debug_str	00000000 
00001b84 l       .debug_str	00000000 
00001b94 l       .debug_str	00000000 
00001c23 l       .debug_str	00000000 
00001c25 l       .debug_str	00000000 
00001c64 l       .debug_str	00000000 
00001c76 l       .debug_str	00000000 
00001d07 l       .debug_str	00000000 
00001d46 l       .debug_str	00000000 
00001d55 l       .debug_str	00000000 
00001de3 l       .debug_str	00000000 
00001e22 l       .debug_str	00000000 
00001e33 l       .debug_str	00000000 
00001ec3 l       .debug_str	00000000 
00001ec7 l       .debug_str	00000000 
00001ecb l       .debug_str	00000000 
00001ecf l       .debug_str	00000000 
00001ed3 l       .debug_str	00000000 
00001ed7 l       .debug_str	00000000 
00001edc l       .debug_str	00000000 
00001ee1 l       .debug_str	00000000 
00001eed l       .debug_str	00000000 
00001ef2 l       .debug_str	00000000 
00001efa l       .debug_str	00000000 
00001f61 l       .debug_str	00000000 
00001f64 l       .debug_str	00000000 
00001f87 l       .debug_str	00000000 
00001f8d l       .debug_str	00000000 
00001f97 l       .debug_str	00000000 
00001fa2 l       .debug_str	00000000 
00001fea l       .debug_str	00000000 
00001ff3 l       .debug_str	00000000 
0000203b l       .debug_str	00000000 
00002043 l       .debug_str	00000000 
0000208b l       .debug_str	00000000 
000020b5 l       .debug_str	00000000 
000020ea l       .debug_str	00000000 
00002102 l       .debug_str	00000000 
00002104 l       .debug_str	00000000 
0000215c l       .debug_str	00000000 
000021b2 l       .debug_str	00000000 
00002208 l       .debug_str	00000000 
00002227 l       .debug_str	00000000 
00002256 l       .debug_str	00000000 
00002260 l       .debug_str	00000000 
0000228f l       .debug_str	00000000 
00002306 l       .debug_str	00000000 
0000231a l       .debug_str	00000000 
00002325 l       .debug_str	00000000 
00002391 l       .debug_str	00000000 
000023fe l       .debug_str	00000000 
00002472 l       .debug_str	00000000 
00002487 l       .debug_str	00000000 
000024fb l       .debug_str	00000000 
0000256a l       .debug_str	00000000 
0000257a l       .debug_str	00000000 
000025e5 l       .debug_str	00000000 
000025f1 l       .debug_str	00000000 
00002631 l       .debug_str	00000000 
00002634 l       .debug_str	00000000 
00002676 l       .debug_str	00000000 
0000267b l       .debug_str	00000000 
000026a9 l       .debug_str	00000000 
00002716 l       .debug_str	00000000 
00002785 l       .debug_str	00000000 
000027f4 l       .debug_str	00000000 
00002865 l       .debug_str	00000000 
000028d1 l       .debug_str	00000000 
000028d3 l       .debug_str	00000000 
0000293d l       .debug_str	00000000 
00002948 l       .debug_str	00000000 
000029b9 l       .debug_str	00000000 
000029cb l       .debug_str	00000000 
00002a37 l       .debug_str	00000000 
00002a44 l       .debug_str	00000000 
00002ab0 l       .debug_str	00000000 
00002abd l       .debug_str	00000000 
00002b29 l       .debug_str	00000000 
00002b36 l       .debug_str	00000000 
00002ba5 l       .debug_str	00000000 
00002bb3 l       .debug_str	00000000 
00002c24 l       .debug_str	00000000 
00002c97 l       .debug_str	00000000 
00002d07 l       .debug_str	00000000 
00002d79 l       .debug_str	00000000 
00002deb l       .debug_str	00000000 
00002dfc l       .debug_str	00000000 
00002e69 l       .debug_str	00000000 
00002e75 l       .debug_str	00000000 
00002ee1 l       .debug_str	00000000 
00002eec l       .debug_str	00000000 
00002f60 l       .debug_str	00000000 
00002f73 l       .debug_str	00000000 
00002fe8 l       .debug_str	00000000 
00002ffc l       .debug_str	00000000 
00003069 l       .debug_str	00000000 
00003075 l       .debug_str	00000000 
000030e9 l       .debug_str	00000000 
000030fc l       .debug_str	00000000 
00003172 l       .debug_str	00000000 
00003187 l       .debug_str	00000000 
000031f3 l       .debug_str	00000000 
000031fe l       .debug_str	00000000 
00003270 l       .debug_str	00000000 
00003281 l       .debug_str	00000000 
000032ed l       .debug_str	00000000 
000032f8 l       .debug_str	00000000 
00003338 l       .debug_str	00000000 
0000333e l       .debug_str	00000000 
00003373 l       .debug_str	00000000 
00003377 l       .debug_str	00000000 
000033ac l       .debug_str	00000000 
000033b0 l       .debug_str	00000000 
000033b8 l       .debug_str	00000000 
000033c0 l       .debug_str	00000000 
000033ca l       .debug_str	00000000 
000033d2 l       .debug_str	00000000 
000033da l       .debug_str	00000000 
000033e0 l       .debug_str	00000000 
000033e8 l       .debug_str	00000000 
000033f0 l       .debug_str	00000000 
000033f6 l       .debug_str	00000000 
000033ff l       .debug_str	00000000 
00003406 l       .debug_str	00000000 
0000340d l       .debug_str	00000000 
0000341b l       .debug_str	00000000 
0000344b l       .debug_str	00000000 
000034b0 l       .debug_str	00000000 
000034b6 l       .debug_str	00000000 
000034e0 l       .debug_str	00000000 
00003517 l       .debug_str	00000000 
0000351c l       .debug_str	00000000 
00003527 l       .debug_str	00000000 
0000352b l       .debug_str	00000000 
0000352f l       .debug_str	00000000 
00003533 l       .debug_str	00000000 
00003538 l       .debug_str	00000000 
0000353d l       .debug_str	00000000 
00003548 l       .debug_str	00000000 
0000354e l       .debug_str	00000000 
00003552 l       .debug_str	00000000 
00003559 l       .debug_str	00000000 
00003560 l       .debug_str	00000000 
00003592 l       .debug_str	00000000 
000035f9 l       .debug_str	00000000 
00003625 l       .debug_str	00000000 
0000365a l       .debug_str	00000000 
00003660 l       .debug_str	00000000 
00003666 l       .debug_str	00000000 
0000366c l       .debug_str	00000000 
00003672 l       .debug_str	00000000 
000036a2 l       .debug_str	00000000 
00003707 l       .debug_str	00000000 
00003731 l       .debug_str	00000000 
00003766 l       .debug_str	00000000 
0000376b l       .debug_str	00000000 
00003772 l       .debug_str	00000000 
00003779 l       .debug_str	00000000 
00003780 l       .debug_str	00000000 
00003789 l       .debug_str	00000000 
00003790 l       .debug_str	00000000 
00003798 l       .debug_str	00000000 
0000379d l       .debug_str	00000000 
000037a2 l       .debug_str	00000000 
000037a7 l       .debug_str	00000000 
000037b0 l       .debug_str	00000000 
000037bb l       .debug_str	00000000 
000037bf l       .debug_str	00000000 
000037c3 l       .debug_str	00000000 
000037f3 l       .debug_str	00000000 
00003858 l       .debug_str	00000000 
00003882 l       .debug_str	00000000 
000038b7 l       .debug_str	00000000 
000038bb l       .debug_str	00000000 
000038c1 l       .debug_str	00000000 
000038f1 l       .debug_str	00000000 
00003956 l       .debug_str	00000000 
00003980 l       .debug_str	00000000 
000039b5 l       .debug_str	00000000 
000039b9 l       .debug_str	00000000 
000039c3 l       .debug_str	00000000 
000039c7 l       .debug_str	00000000 
000039d1 l       .debug_str	00000000 
000039d5 l       .debug_str	00000000 
000039df l       .debug_str	00000000 
00003a0d l       .debug_str	00000000 
00003a72 l       .debug_str	00000000 
00003a9c l       .debug_str	00000000 
00003b08 l       .debug_str	00000000 
00003b12 l       .debug_str	00000000 
00003b40 l       .debug_str	00000000 
00003b75 l       .debug_str	00000000 
00003b79 l       .debug_str	00000000 
00003b7f l       .debug_str	00000000 
00003b83 l       .debug_str	00000000 
00003b88 l       .debug_str	00000000 
00003b8d l       .debug_str	00000000 
00003b95 l       .debug_str	00000000 
00003b9d l       .debug_str	00000000 
00003ba5 l       .debug_str	00000000 
00003bad l       .debug_str	00000000 
00003bb5 l       .debug_str	00000000 
00003bbd l       .debug_str	00000000 
00003bed l       .debug_str	00000000 
00003c52 l       .debug_str	00000000 
00003c7c l       .debug_str	00000000 
00003cb2 l       .debug_str	00000000 
00003cb7 l       .debug_str	00000000 
00003cbc l       .debug_str	00000000 
00003cc1 l       .debug_str	00000000 
00003ccc l       .debug_str	00000000 
00003cd1 l       .debug_str	00000000 
00003cdc l       .debug_str	00000000 
00003ce1 l       .debug_str	00000000 
00003cec l       .debug_str	00000000 
00003cf1 l       .debug_str	00000000 
00003cfc l       .debug_str	00000000 
00003d00 l       .debug_str	00000000 
00003d05 l       .debug_str	00000000 
00003d36 l       .debug_str	00000000 
00003d9c l       .debug_str	00000000 
00003dc7 l       .debug_str	00000000 
00003dfc l       .debug_str	00000000 
00003e01 l       .debug_str	00000000 
00003e06 l       .debug_str	00000000 
00003e0c l       .debug_str	00000000 
00003e10 l       .debug_str	00000000 
00003e15 l       .debug_str	00000000 
00003e1b l       .debug_str	00000000 
00003e20 l       .debug_str	00000000 
00003e25 l       .debug_str	00000000 
00003e2a l       .debug_str	00000000 
00003e30 l       .debug_str	00000000 
00003e35 l       .debug_str	00000000 
00003e3a l       .debug_str	00000000 
00003e45 l       .debug_str	00000000 
00003e4b l       .debug_str	00000000 
00003e7b l       .debug_str	00000000 
00003ee0 l       .debug_str	00000000 
00003f0a l       .debug_str	00000000 
00003f40 l       .debug_str	00000000 
00003f44 l       .debug_str	00000000 
00003f48 l       .debug_str	00000000 
00003f4c l       .debug_str	00000000 
00003f52 l       .debug_str	00000000 
00003f83 l       .debug_str	00000000 
00003fe9 l       .debug_str	00000000 
00004014 l       .debug_str	00000000 
0000404a l       .debug_str	00000000 
0000404f l       .debug_str	00000000 
00004055 l       .debug_str	00000000 
0000405b l       .debug_str	00000000 
00004060 l       .debug_str	00000000 
00004065 l       .debug_str	00000000 
0000406a l       .debug_str	00000000 
00004074 l       .debug_str	00000000 
000040a5 l       .debug_str	00000000 
0000410b l       .debug_str	00000000 
00004136 l       .debug_str	00000000 
00004175 l       .debug_str	00000000 
000041b5 l       .debug_str	00000000 
000041bb l       .debug_str	00000000 
000041fb l       .debug_str	00000000 
00004201 l       .debug_str	00000000 
00004240 l       .debug_str	00000000 
00004245 l       .debug_str	00000000 
00004286 l       .debug_str	00000000 
00004290 l       .debug_str	00000000 
000042d6 l       .debug_str	00000000 
000042e4 l       .debug_str	00000000 
0000434b l       .debug_str	00000000 
000043b3 l       .debug_str	00000000 
0000441e l       .debug_str	00000000 
0000448a l       .debug_str	00000000 
000044f1 l       .debug_str	00000000 
00004556 l       .debug_str	00000000 
000045bb l       .debug_str	00000000 
0000461f l       .debug_str	00000000 
00004686 l       .debug_str	00000000 
0000468c l       .debug_str	00000000 
00004691 l       .debug_str	00000000 
000046b8 l       .debug_str	00000000 
000046c1 l       .debug_str	00000000 
000046df l       .debug_str	00000000 
000046e6 l       .debug_str	00000000 
00004705 l       .debug_str	00000000 
00004724 l       .debug_str	00000000 
00004743 l       .debug_str	00000000 
00004752 l       .debug_str	00000000 
00004757 l       .debug_str	00000000 
00004777 l       .debug_str	00000000 
00004782 l       .debug_str	00000000 
0000479d l       .debug_str	00000000 
000047ba l       .debug_str	00000000 
000047d5 l       .debug_str	00000000 
000047f0 l       .debug_str	00000000 
0000480b l       .debug_str	00000000 
00004826 l       .debug_str	00000000 
00004845 l       .debug_str	00000000 
00004860 l       .debug_str	00000000 
0000487c l       .debug_str	00000000 
00004897 l       .debug_str	00000000 
000048b3 l       .debug_str	00000000 
000048cf l       .debug_str	00000000 
000048f5 l       .debug_str	00000000 
0000491c l       .debug_str	00000000 
00004925 l       .debug_str	00000000 
00004950 l       .debug_str	00000000 
0000495b l       .debug_str	00000000 
0000497f l       .debug_str	00000000 
000049a3 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.0	00000018 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.0
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.1	00000007 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.1
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.10	00000009 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.10
00000000 l     O .rodata.cst4	00000004 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.11
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.12	00000010 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.12
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.13	00000009 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.13
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.14	00000010 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.14
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.15	0000000a .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.15
00000008 l     O .rodata.cst8	00000008 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.16
00000004 l     O .rodata.cst4	00000004 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.17
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.18	00000007 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.18
00000008 l     O .rodata.cst4	00000004 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.19
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.2	00000006 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.2
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.20	00000010 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.20
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.21	0000000c .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.21
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.22	0000000a .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.22
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.23	00000003 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.23
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.24	00000003 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.24
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.25	00000009 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.25
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.26	00000006 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.26
00000010 l     O .rodata.cst8	00000008 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.27
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.3	0000000c .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.3
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.4	00000006 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.4
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.5	0000000a .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.5
00000000 l     O .rodata.cst8	00000008 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.6
00000000 l     O .rodata.cst16	00000010 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.7
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.8	00000009 .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.8
00000000 l     O .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.9	0000000e .Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.9
00000000 l     O .rodata..Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E	0000001c .Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE	0000003a _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E	0000003a _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E	00000006 _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17h140fc1d62a0eb12aE	00000002 _ZN4core3ptr18real_drop_in_place17h140fc1d62a0eb12aE
00000000 l     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E	0000010c _ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E
00000000 l     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E	00000026 _ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E
00000000 l     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E	00000106 _ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h140fc1d62a0eb12aE	00000000 .text._ZN4core3ptr18real_drop_in_place17h140fc1d62a0eb12aE
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E
00000000 l    d  .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E	00000000 .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E
00000000 l    d  .text._ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE	00000000 .text._ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE
00000000 l    d  .text._ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E	00000000 .text._ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E
00000000 l    d  .text._ZN8cortex_m3itm9write_fmt17h84505391dd574c03E	00000000 .text._ZN8cortex_m3itm9write_fmt17h84505391dd574c03E
00000000 l    d  .text._ZN8cortex_m3itm9write_str17hbe0d17177bce7486E	00000000 .text._ZN8cortex_m3itm9write_str17hbe0d17177bce7486E
00000000 l    d  .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E	00000000 .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E
00000000 l    d  .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E	00000000 .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E
00000000 l    d  .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE	00000000 .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE
00000000 l    d  .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE	00000000 .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE
00000000 l    d  .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E	00000000 .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim8write_u817h65891c7d1cb66d84E	00000000 .text._ZN8cortex_m10peripheral3itm4Stim8write_u817h65891c7d1cb66d84E
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617hbb501523cef8caacE	00000000 .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617hbb501523cef8caacE
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217hd460f426a5a71dbbE	00000000 .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217hd460f426a5a71dbbE
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17h1fe57fe929e12d9fE	00000000 .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17h1fe57fe929e12d9fE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb9Exception4irqn17hf3857b33c1a6a39eE	00000000 .text._ZN8cortex_m10peripheral3scb9Exception4irqn17hf3857b33c1a6a39eE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E	00000000 .text._ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h31e288a254da8bc1E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h31e288a254da8bc1E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17h8be2b683cf5d2a43E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17h8be2b683cf5d2a43E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E
00000000 l    d  .text._ZN8cortex_m10peripheral11Peripherals5steal17h16f254e2d499687dE	00000000 .text._ZN8cortex_m10peripheral11Peripherals5steal17h16f254e2d499687dE
00000000 l    d  .text._ZN8cortex_m10peripheral3CBP3new17hbfc0aedb6917d2a6E	00000000 .text._ZN8cortex_m10peripheral3CBP3new17hbfc0aedb6917d2a6E
00000000 l    d  .text._ZN8cortex_m10peripheral3CBP3ptr17hc51a9300c4cb1fdaE	00000000 .text._ZN8cortex_m10peripheral3CBP3ptr17hc51a9300c4cb1fdaE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3de47d8a849d8a11E	00000000 .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3de47d8a849d8a11E
00000000 l    d  .text._ZN8cortex_m10peripheral5CPUID3ptr17h9a462ef52dde8d51E	00000000 .text._ZN8cortex_m10peripheral5CPUID3ptr17h9a462ef52dde8d51E
00000000 l    d  .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3d0dcab989fcdfbeE	00000000 .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3d0dcab989fcdfbeE
00000000 l    d  .text._ZN8cortex_m10peripheral3DCB3ptr17h3e9c13623b27c25bE	00000000 .text._ZN8cortex_m10peripheral3DCB3ptr17h3e9c13623b27c25bE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3eb58bb6922b54aE	00000000 .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3eb58bb6922b54aE
00000000 l    d  .text._ZN8cortex_m10peripheral3DWT3ptr17hdcde3a55a33307a0E	00000000 .text._ZN8cortex_m10peripheral3DWT3ptr17hdcde3a55a33307a0E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9d7f0af99b88ae49E	00000000 .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9d7f0af99b88ae49E
00000000 l    d  .text._ZN8cortex_m10peripheral3FPB3ptr17h225de9906c21501bE	00000000 .text._ZN8cortex_m10peripheral3FPB3ptr17h225de9906c21501bE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h03202933e23c6f31E	00000000 .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h03202933e23c6f31E
00000000 l    d  .text._ZN8cortex_m10peripheral3ITM3ptr17hfc0c06a8a113bd44E	00000000 .text._ZN8cortex_m10peripheral3ITM3ptr17hfc0c06a8a113bd44E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h54d637521666d3f1E	00000000 .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h54d637521666d3f1E
00000000 l    d  .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h12ad89d44da4adbcE	00000000 .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h12ad89d44da4adbcE
00000000 l    d  .text._ZN8cortex_m10peripheral3MPU3ptr17h6309b112b91d94c6E	00000000 .text._ZN8cortex_m10peripheral3MPU3ptr17h6309b112b91d94c6E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1ace581b370983ceE	00000000 .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1ace581b370983ceE
00000000 l    d  .text._ZN8cortex_m10peripheral4NVIC3ptr17h6854e775d2184fa6E	00000000 .text._ZN8cortex_m10peripheral4NVIC3ptr17h6854e775d2184fa6E
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17hcd336525a611e6fbE	00000000 .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17hcd336525a611e6fbE
00000000 l    d  .text._ZN8cortex_m10peripheral3SCB3ptr17h1917a53812942244E	00000000 .text._ZN8cortex_m10peripheral3SCB3ptr17h1917a53812942244E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h33362447562b94b2E	00000000 .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h33362447562b94b2E
00000000 l    d  .text._ZN8cortex_m10peripheral4SYST3ptr17h427d260fe52bd48aE	00000000 .text._ZN8cortex_m10peripheral4SYST3ptr17h427d260fe52bd48aE
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9f8f918fe2a9da25E	00000000 .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9f8f918fe2a9da25E
00000000 l    d  .text._ZN8cortex_m10peripheral4TPIU3ptr17h305400f7bc28ccefE	00000000 .text._ZN8cortex_m10peripheral4TPIU3ptr17h305400f7bc28ccefE
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h68d23d8a47ad71bbE	00000000 .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h68d23d8a47ad71bbE
00000000 l    d  .text._ZN8cortex_m8register7control7Control4bits17h01ec71ce9f9a3928E	00000000 .text._ZN8cortex_m8register7control7Control4bits17h01ec71ce9f9a3928E
00000000 l    d  .text._ZN8cortex_m8register7control7Control5npriv17he2aeb5570818d0f1E	00000000 .text._ZN8cortex_m8register7control7Control5npriv17he2aeb5570818d0f1E
00000000 l    d  .text._ZN8cortex_m8register7control7Control5spsel17h0b93dfb07a8f7753E	00000000 .text._ZN8cortex_m8register7control7Control5spsel17h0b93dfb07a8f7753E
00000000 l    d  .text._ZN8cortex_m8register7control7Control4fpca17h7e94368e99233137E	00000000 .text._ZN8cortex_m8register7control7Control4fpca17h7e94368e99233137E
00000000 l    d  .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E	00000000 .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E
00000000 l    d  .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E	00000000 .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E
00000000 l    d  .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E	00000000 .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E
00000000 l    d  .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E	00000000 .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E
00000000 l    d  .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E	00000000 .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E
00000000 l    d  .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E	00000000 .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E
00000000 l    d  .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe10d2570ed027a4E	00000000 .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe10d2570ed027a4E
00000000 l    d  .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E	00000000 .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E
00000000 l    d  .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E	00000000 .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E
00000000 l    d  .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE	00000000 .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE
00000000 l    d  .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE	00000000 .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE
00000000 l    d  .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.0	00000000 .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.0
00000000 l    d  .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.12	00000000 .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.12
00000000 l    d  .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.14	00000000 .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.14
00000000 l    d  .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.20	00000000 .rodata..Lanon.ad09645c98d2c0c0dd41c868bdd50a7a.20
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     O .bss.CORE_PERIPHERALS	00000001 CORE_PERIPHERALS
00000000         *UND*	00000000 _ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17heb4d046d241d78d0E
00000000         *UND*	00000000 _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17ha7805aa8d849f46cE
00000000         *UND*	00000000 _ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he275dc913fe9b8e5E
00000000         *UND*	00000000 _ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h1d24bfddebe6efa8E
00000000         *UND*	00000000 _ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u32$GT$3fmt17hc8816b6e2fbd78aaE
00000000         *UND*	00000000 _ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17hc1bd8b99f165c287E
00000000         *UND*	00000000 _ZN4core3fmt5write17h51826aee11d21b9bE
00000000         *UND*	00000000 _ZN4core3fmt8builders10DebugTuple5field17h7da5ac79cde13c49E
00000000         *UND*	00000000 _ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE
00000000         *UND*	00000000 _ZN4core3fmt8builders11DebugStruct5field17h80023aaf54882542E
00000000         *UND*	00000000 _ZN4core3fmt8builders11DebugStruct6finish17h9090cd1e84004b71E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter12debug_struct17h0a14031b095ee1baE
00000000         *UND*	00000000 _ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E
00000000 g     F .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E	00000104 _ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3de47d8a849d8a11E	0000000a _ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3de47d8a849d8a11E
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3eb58bb6922b54aE	0000000a _ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3eb58bb6922b54aE
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9d7f0af99b88ae49E	0000000a _ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9d7f0af99b88ae49E
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h03202933e23c6f31E	0000000a _ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h03202933e23c6f31E
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h54d637521666d3f1E	00000006 _ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h54d637521666d3f1E
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1ace581b370983ceE	0000000a _ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1ace581b370983ceE
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h33362447562b94b2E	0000000a _ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h33362447562b94b2E
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17hcd336525a611e6fbE	0000000a _ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17hcd336525a611e6fbE
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9f8f918fe2a9da25E	0000000a _ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9f8f918fe2a9da25E
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h68d23d8a47ad71bbE	00000008 _ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h68d23d8a47ad71bbE
00000000 g     F .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE	00000034 _ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE
00000000 g     F .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3d0dcab989fcdfbeE	0000000a _ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3d0dcab989fcdfbeE
00000000 g     F .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E	00000034 _ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E
00000000 g     F .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E	00000030 _ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E
00000000 g     F .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h12ad89d44da4adbcE	00000006 _ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h12ad89d44da4adbcE
00000000 g     F .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E	000000a4 _ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E
00000000 g     F .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe10d2570ed027a4E	00000040 _ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe10d2570ed027a4E
00000000 g     F .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE	00000034 _ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE
00000000 g     F .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E	00000098 _ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E
00000000 g     F .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E	00000086 _ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E
00000000 g     F .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE	00000034 _ZN77_$LT$cortex_m..register..faultmask..Faultmask$u20$as$u20$core..fmt..Debug$GT$3fmt17h6ea03169869aacf9E
00000000 g     F .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E	00000034 _ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E
00000000 g     F .text._ZN8cortex_m10peripheral11Peripherals5steal17h16f254e2d499687dE	0000000e _ZN8cortex_m10peripheral11Peripherals5steal17h16f254e2d499687dE
00000000 g     F .text._ZN8cortex_m10peripheral3CBP3new17hbfc0aedb6917d2a6E	00000002 _ZN8cortex_m10peripheral3CBP3new17hbfc0aedb6917d2a6E
00000000 g     F .text._ZN8cortex_m10peripheral3CBP3ptr17hc51a9300c4cb1fdaE	0000000a _ZN8cortex_m10peripheral3CBP3ptr17hc51a9300c4cb1fdaE
00000000 g     F .text._ZN8cortex_m10peripheral3DCB3ptr17h3e9c13623b27c25bE	0000000a _ZN8cortex_m10peripheral3DCB3ptr17h3e9c13623b27c25bE
00000000 g     F .text._ZN8cortex_m10peripheral3DWT3ptr17hdcde3a55a33307a0E	0000000a _ZN8cortex_m10peripheral3DWT3ptr17hdcde3a55a33307a0E
00000000 g     F .text._ZN8cortex_m10peripheral3FPB3ptr17h225de9906c21501bE	0000000a _ZN8cortex_m10peripheral3FPB3ptr17h225de9906c21501bE
00000000 g     F .text._ZN8cortex_m10peripheral3ITM3ptr17hfc0c06a8a113bd44E	00000006 _ZN8cortex_m10peripheral3ITM3ptr17hfc0c06a8a113bd44E
00000000 g     F .text._ZN8cortex_m10peripheral3MPU3ptr17h6309b112b91d94c6E	0000000a _ZN8cortex_m10peripheral3MPU3ptr17h6309b112b91d94c6E
00000000 g     F .text._ZN8cortex_m10peripheral3SCB3ptr17h1917a53812942244E	0000000a _ZN8cortex_m10peripheral3SCB3ptr17h1917a53812942244E
00000000 g     F .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE	00000012 _ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE
00000000 g     F .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE	00000012 _ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE
00000000 g     F .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E	00000010 _ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE	0000000c _ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E	00000012 _ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17h1fe57fe929e12d9fE	0000000c _ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17h1fe57fe929e12d9fE
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim8write_u817h65891c7d1cb66d84E	00000004 _ZN8cortex_m10peripheral3itm4Stim8write_u817h65891c7d1cb66d84E
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617hbb501523cef8caacE	00000004 _ZN8cortex_m10peripheral3itm4Stim9write_u1617hbb501523cef8caacE
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217hd460f426a5a71dbbE	00000004 _ZN8cortex_m10peripheral3itm4Stim9write_u3217hd460f426a5a71dbbE
00000000 g     F .text._ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E	00000060 _ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E	00000010 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE	00000062 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE	00000010 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h31e288a254da8bc1E	0000001a _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h31e288a254da8bc1E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E	0000001a _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E	00000026 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E	00000012 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E	00000012 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE	00000012 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E	00000012 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE	00000010 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE
00000000 g     F .text._ZN8cortex_m10peripheral3scb9Exception4irqn17hf3857b33c1a6a39eE	00000038 _ZN8cortex_m10peripheral3scb9Exception4irqn17hf3857b33c1a6a39eE
00000000 g     F .text._ZN8cortex_m10peripheral4NVIC3ptr17h6854e775d2184fa6E	0000000a _ZN8cortex_m10peripheral4NVIC3ptr17h6854e775d2184fa6E
00000000 g     F .text._ZN8cortex_m10peripheral4SYST3ptr17h427d260fe52bd48aE	0000000a _ZN8cortex_m10peripheral4SYST3ptr17h427d260fe52bd48aE
00000000 g     F .text._ZN8cortex_m10peripheral4TPIU3ptr17h305400f7bc28ccefE	00000008 _ZN8cortex_m10peripheral4TPIU3ptr17h305400f7bc28ccefE
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E	0000000c _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE	00000016 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E	0000000c _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E	0000000c _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E	00000010 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E	0000000e _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E	00000012 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE	00000012 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E	00000012 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E	00000016 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17h8be2b683cf5d2a43E	0000001a _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17h8be2b683cf5d2a43E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE	00000012 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE	00000010 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E	00000010 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E	00000010 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE	00000010 _ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE
00000000 g     F .text._ZN8cortex_m10peripheral5CPUID3ptr17h9a462ef52dde8d51E	0000000a _ZN8cortex_m10peripheral5CPUID3ptr17h9a462ef52dde8d51E
00000000 g     F .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E	00000010 _ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E
00000000 g     F .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E	00000024 _ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E
00000000 g     F .text._ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E	00000096 _ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E
00000000 g     F .text._ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE	00000102 _ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE
00000000 g     F .text._ZN8cortex_m3itm9write_fmt17h84505391dd574c03E	00000028 _ZN8cortex_m3itm9write_fmt17h84505391dd574c03E
00000000 g     F .text._ZN8cortex_m3itm9write_str17hbe0d17177bce7486E	00000102 _ZN8cortex_m3itm9write_str17hbe0d17177bce7486E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E	0000000c _ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E	0000000a _ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E	0000000a _ZN8cortex_m8register7control5Npriv13is_privileged17hbfcb70c091cb02b1E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E	0000000c _ZN8cortex_m8register7control5Npriv15is_unprivileged17he66cd5234a42ee79E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E	0000000a _ZN8cortex_m8register7control5Spsel6is_msp17hae380c3c77badd79E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E	0000000c _ZN8cortex_m8register7control5Spsel6is_psp17he9dd5ca1763a0ef8E
00000000 g     F .text._ZN8cortex_m8register7control7Control4bits17h01ec71ce9f9a3928E	00000004 _ZN8cortex_m8register7control7Control4bits17h01ec71ce9f9a3928E
00000000 g     F .text._ZN8cortex_m8register7control7Control4fpca17h7e94368e99233137E	0000000e _ZN8cortex_m8register7control7Control4fpca17h7e94368e99233137E
00000000 g     F .text._ZN8cortex_m8register7control7Control5npriv17he2aeb5570818d0f1E	00000008 _ZN8cortex_m8register7control7Control5npriv17he2aeb5570818d0f1E
00000000 g     F .text._ZN8cortex_m8register7control7Control5spsel17h0b93dfb07a8f7753E	00000008 _ZN8cortex_m8register7control7Control5spsel17h0b93dfb07a8f7753E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E	0000000c _ZN8cortex_m8register7primask7Primask11is_inactive17h793ee0d21d6a9091E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E	0000000a _ZN8cortex_m8register7primask7Primask9is_active17h32ebd014284b427fE
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E	0000000c _ZN8cortex_m8register9faultmask9Faultmask11is_inactive17ha977f618c9ab04b2E
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E	0000000a _ZN8cortex_m8register9faultmask9Faultmask9is_active17h78b3a09538a4ed4dE
00000000         *UND*	00000000 __dsb
00000000         *UND*	00000000 __nop



Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE:

00000000 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hc183193e86b0db88E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E>
   c:	b128      	cbz	r0, 1a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u32$GT$3fmt17hc8816b6e2fbd78aaE>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E>
  20:	b128      	cbz	r0, 2e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17ha208fa1b28110b7fE+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u32$GT$3fmt17hc1bd8b99f165c287E>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17ha7805aa8d849f46cE>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E:

00000000 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num49_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u8$GT$3fmt17h271d1c938b44f4eaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E>
   c:	b128      	cbz	r0, 1a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he275dc913fe9b8e5E>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E>
  20:	b128      	cbz	r0, 2e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9db1ffc1d3ac3a4E+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h1d24bfddebe6efa8E>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17heb4d046d241d78d0E>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E:

00000000 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	6800      	ldr	r0, [r0, #0]
   2:	f7ff bffe 	b.w	0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca115b7b9c5c8f76E>

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h140fc1d62a0eb12aE:

00000000 <_ZN4core3ptr18real_drop_in_place17h140fc1d62a0eb12aE>:
_ZN4core3ptr18real_drop_in_place17h140fc1d62a0eb12aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:195
   0:	4770      	bx	lr

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E:

00000000 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E>:
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:205
   0:	b081      	sub	sp, #4
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:206
   2:	6802      	ldr	r2, [r0, #0]
   4:	2000      	movs	r0, #0
_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817hc04470e71cfe4e80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:440
   6:	2980      	cmp	r1, #128	; 0x80
_ZN4core3fmt5Write10write_char17h91a719b1890e67b5E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:170
   8:	9000      	str	r0, [sp, #0]
_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817hc04470e71cfe4e80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:440
   a:	d20a      	bcs.n	22 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x22>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:441
   c:	f88d 1000 	strb.w	r1, [sp]
  10:	4608      	mov	r0, r1
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:25

struct Port<'p>(&'p mut Stim);

impl<'p> fmt::Write for Port<'p> {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        write_all(self.0, s.as_bytes());
  12:	6812      	ldr	r2, [r2, #0]
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            left -= 2;
        }

        // final byte
        if left == 1 {
            while !port.is_fifo_ready() {}
  16:	2901      	cmp	r1, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  18:	bf1c      	itt	ne
  1a:	6811      	ldrne	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  1c:	2901      	cmpne	r1, #1
  1e:	d144      	bne.n	aa <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0xaa>
  20:	e049      	b.n	b6 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0xb6>
_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817hc04470e71cfe4e80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:443
  22:	ebb0 2fd1 	cmp.w	r0, r1, lsr #11
  26:	d10d      	bne.n	44 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x44>
  28:	2002      	movs	r0, #2
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:444
  2a:	098b      	lsrs	r3, r1, #6
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:445
  2c:	f360 119f 	bfi	r1, r0, #6, #26
  30:	2006      	movs	r0, #6
  32:	f88d 1001 	strb.w	r1, [sp, #1]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:444
  36:	f360 135f 	bfi	r3, r0, #5, #27
  3a:	f88d 3000 	strb.w	r3, [sp]
  3e:	2000      	movs	r0, #0
  40:	2100      	movs	r1, #0
  42:	e01a      	b.n	7a <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x7a>
  44:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:447
  46:	ebb0 4f11 	cmp.w	r0, r1, lsr #16
  4a:	d138      	bne.n	be <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0xbe>
  4c:	f64f 73fe 	movw	r3, #65534	; 0xfffe
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:450
  50:	4608      	mov	r0, r1
  52:	f2c0 33ff 	movt	r3, #1023	; 0x3ff
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:449
  56:	ea4f 1c91 	mov.w	ip, r1, lsr #6
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:450
  5a:	f363 109f 	bfi	r0, r3, #6, #26
  5e:	2302      	movs	r3, #2
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:449
  60:	f363 1c9f 	bfi	ip, r3, #6, #26
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:448
  64:	0b09      	lsrs	r1, r1, #12
  66:	230e      	movs	r3, #14
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:450
  68:	f88d 0002 	strb.w	r0, [sp, #2]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:448
  6c:	f363 111f 	bfi	r1, r3, #4, #28
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:449
  70:	f88d c001 	strb.w	ip, [sp, #1]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:448
  74:	f88d 1000 	strb.w	r1, [sp]
  78:	2101      	movs	r1, #1
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:25
        write_all(self.0, s.as_bytes());
  7a:	6812      	ldr	r2, [r2, #0]
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7c:	6813      	ldr	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  7e:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  80:	bf1c      	itt	ne
  82:	6813      	ldrne	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  84:	2b01      	cmpne	r3, #1
  86:	d005      	beq.n	94 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x94>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  88:	6813      	ldr	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  8a:	2b01      	cmp	r3, #1
  8c:	d002      	beq.n	94 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x94>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  8e:	6813      	ldr	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  90:	2b01      	cmp	r3, #1
  92:	d1f3      	bne.n	7c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x7c>
  94:	f8bd 3000 	ldrh.w	r3, [sp]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  98:	2900      	cmp	r1, #0
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  9a:	8013      	strh	r3, [r2, #0]
  9c:	d00c      	beq.n	b8 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0xb8>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  9e:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  a0:	2901      	cmp	r1, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a2:	bf1c      	itt	ne
  a4:	6811      	ldrne	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  a6:	2901      	cmpne	r1, #1
  a8:	d005      	beq.n	b6 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0xb6>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  aa:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ac:	2901      	cmp	r1, #1
  ae:	d002      	beq.n	b6 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0xb6>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b0:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  b2:	2901      	cmp	r1, #1
  b4:	d1f3      	bne.n	9e <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x9e>
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  b6:	7010      	strb	r0, [r2, #0]
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:207
  b8:	2000      	movs	r0, #0
  ba:	b001      	add	sp, #4
  bc:	4770      	bx	lr
  be:	2002      	movs	r0, #2
_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817hc04470e71cfe4e80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:456
  c0:	460b      	mov	r3, r1
  c2:	f360 139f 	bfi	r3, r0, #6, #26
  c6:	f88d 3003 	strb.w	r3, [sp, #3]
  ca:	23f0      	movs	r3, #240	; 0xf0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:453
  cc:	ea43 4391 	orr.w	r3, r3, r1, lsr #18
  d0:	f88d 3000 	strb.w	r3, [sp]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:455
  d4:	098b      	lsrs	r3, r1, #6
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:454
  d6:	0b09      	lsrs	r1, r1, #12
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:455
  d8:	f360 139f 	bfi	r3, r0, #6, #26
  dc:	f88d 3002 	strb.w	r3, [sp, #2]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:454
  e0:	f360 119f 	bfi	r1, r0, #6, #26
  e4:	f88d 1001 	strb.w	r1, [sp, #1]
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:25
        write_all(self.0, s.as_bytes());
  e8:	6810      	ldr	r0, [r2, #0]
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ea:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  ec:	2901      	cmp	r1, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ee:	bf1c      	itt	ne
  f0:	6801      	ldrne	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  f2:	2901      	cmpne	r1, #1
  f4:	d005      	beq.n	102 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x102>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  f8:	2901      	cmp	r1, #1
  fa:	d002      	beq.n	102 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0x102>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  fc:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  fe:	2901      	cmp	r1, #1
 100:	d1f3      	bne.n	ea <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E+0xea>
 102:	9900      	ldr	r1, [sp, #0]
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
 104:	6001      	str	r1, [r0, #0]
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h93b0ce50c1186020E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:207
 106:	2000      	movs	r0, #0
 108:	b001      	add	sp, #4
 10a:	4770      	bx	lr

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E:

00000000 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E>:
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:209
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b088      	sub	sp, #32
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:210
   4:	6800      	ldr	r0, [r0, #0]
   6:	aa02      	add	r2, sp, #8
   8:	9001      	str	r0, [sp, #4]
_ZN4core3fmt5Write9write_fmt17h36e872a80eb5c8eaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:195
   a:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
   e:	4610      	mov	r0, r2
  10:	f240 0100 	movw	r1, #0
  14:	f2c0 0100 	movt	r1, #0
  18:	e880 5078 	stmia.w	r0, {r3, r4, r5, r6, ip, lr}
  1c:	a801      	add	r0, sp, #4
  1e:	f7ff fffe 	bl	0 <_ZN4core3fmt5write17h51826aee11d21b9bE>
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hee912c0a092e2067E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:211
  22:	b008      	add	sp, #32
  24:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E:

00000000 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E>:
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07e      	beq.n	102 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x102>
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E():
   4:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   6:	07cb      	lsls	r3, r1, #31
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E():
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
   a:	d00f      	beq.n	2c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x2c>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   c:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   e:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  10:	bf1c      	itt	ne
  12:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  14:	2b01      	cmpne	r3, #1
  16:	d005      	beq.n	24 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x24>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  18:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1a:	2b01      	cmp	r3, #1
  1c:	d002      	beq.n	24 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x24>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1e:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  20:	2b01      	cmp	r3, #1
  22:	d1f3      	bne.n	c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xc>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  24:	f811 3b01 	ldrb.w	r3, [r1], #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  28:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  2a:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  2c:	f001 0303 	and.w	r3, r1, #3
  30:	2b02      	cmp	r3, #2
  32:	d111      	bne.n	58 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x58>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  34:	2a02      	cmp	r2, #2
  36:	d354      	bcc.n	e2 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xe2>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  38:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  3a:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  3c:	bf1c      	itt	ne
  3e:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  40:	2b01      	cmpne	r3, #1
  42:	d005      	beq.n	50 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x50>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  44:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  46:	2b01      	cmp	r3, #1
  48:	d002      	beq.n	50 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x50>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  4a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  4c:	2b01      	cmp	r3, #1
  4e:	d1f3      	bne.n	38 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x38>
  50:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  54:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  56:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  58:	2a00      	cmp	r2, #0
  5a:	d052      	beq.n	102 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x102>
  5c:	b5b0      	push	{r4, r5, r7, lr}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5e:	f022 0c03 	bic.w	ip, r2, #3
  62:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  64:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  68:	d015      	beq.n	96 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x96>
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
  6a:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6e:	2300      	movs	r3, #0
  70:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  72:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  74:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  76:	bf1c      	itt	ne
  78:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7a:	2d01      	cmpne	r5, #1
  7c:	d005      	beq.n	8a <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x8a>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  80:	2d01      	cmp	r5, #1
  82:	d002      	beq.n	8a <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x8a>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  84:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  86:	2d01      	cmp	r5, #1
  88:	d1f3      	bne.n	72 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x72>
  8a:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8e:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  90:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  92:	6005      	str	r5, [r0, #0]
  94:	d1ed      	bne.n	72 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x72>
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  96:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h2d4c5f211cc2b268E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  9a:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  9c:	2a02      	cmp	r2, #2
  9e:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  a2:	d30f      	bcc.n	c4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xc4>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a4:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a6:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a8:	bf1c      	itt	ne
  aa:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  ac:	2b01      	cmpne	r3, #1
  ae:	d005      	beq.n	bc <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xbc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b0:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b2:	2b01      	cmp	r3, #1
  b4:	d002      	beq.n	bc <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xbc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b6:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b8:	2b01      	cmp	r3, #1
  ba:	d1f3      	bne.n	a4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xa4>
  bc:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  c0:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  c2:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c4:	2a01      	cmp	r2, #1
  c6:	d11c      	bne.n	102 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x102>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  ca:	2a01      	cmp	r2, #1
  cc:	d017      	beq.n	fe <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xfe>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ce:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d0:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d2:	bf1c      	itt	ne
  d4:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d6:	2a01      	cmpne	r2, #1
  d8:	d011      	beq.n	fe <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xfe>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  da:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  dc:	2a01      	cmp	r2, #1
  de:	d1f3      	bne.n	c8 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xc8>
  e0:	e00d      	b.n	fe <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xfe>
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e2:	2a01      	cmp	r2, #1
  e4:	d10d      	bne.n	102 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0x102>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e8:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ea:	bf1c      	itt	ne
  ec:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ee:	2a01      	cmpne	r2, #1
  f0:	d005      	beq.n	fe <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xfe>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f2:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f4:	2a01      	cmp	r2, #1
  f6:	d002      	beq.n	fe <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xfe>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  fa:	2a01      	cmp	r2, #1
  fc:	d1f3      	bne.n	e6 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E+0xe6>
  fe:	7809      	ldrb	r1, [r1, #0]
 100:	7001      	strb	r1, [r0, #0]
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h8d5472a17d222102E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:203
 102:	2000      	movs	r0, #0
 104:	4770      	bx	lr

Disassembly of section .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E:

00000000 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E>:
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07d      	beq.n	100 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x100>
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E():
   4:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   6:	07cb      	lsls	r3, r1, #31
   8:	d00f      	beq.n	2a <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x2a>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   c:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   e:	bf1c      	itt	ne
  10:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  12:	2b01      	cmpne	r3, #1
  14:	d005      	beq.n	22 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x22>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  16:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  18:	2b01      	cmp	r3, #1
  1a:	d002      	beq.n	22 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x22>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1c:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1e:	2b01      	cmp	r3, #1
  20:	d1f3      	bne.n	a <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xa>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  22:	f811 3b01 	ldrb.w	r3, [r1], #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  26:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  28:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  2a:	f001 0303 	and.w	r3, r1, #3
  2e:	2b02      	cmp	r3, #2
  30:	d111      	bne.n	56 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x56>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  32:	2a02      	cmp	r2, #2
  34:	d354      	bcc.n	e0 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xe0>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  36:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  38:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  3a:	bf1c      	itt	ne
  3c:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  3e:	2b01      	cmpne	r3, #1
  40:	d005      	beq.n	4e <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x4e>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  42:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  44:	2b01      	cmp	r3, #1
  46:	d002      	beq.n	4e <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x4e>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  48:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  4a:	2b01      	cmp	r3, #1
  4c:	d1f3      	bne.n	36 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x36>
  4e:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  52:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  54:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  56:	2a00      	cmp	r2, #0
  58:	d052      	beq.n	100 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x100>
  5a:	b5b0      	push	{r4, r5, r7, lr}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5c:	f022 0c03 	bic.w	ip, r2, #3
  60:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  62:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  66:	d015      	beq.n	94 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x94>
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
  68:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6c:	2300      	movs	r3, #0
  6e:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  70:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  72:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  74:	bf1c      	itt	ne
  76:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  78:	2d01      	cmpne	r5, #1
  7a:	d005      	beq.n	88 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x88>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7c:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7e:	2d01      	cmp	r5, #1
  80:	d002      	beq.n	88 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x88>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  82:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  84:	2d01      	cmp	r5, #1
  86:	d1f3      	bne.n	70 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x70>
  88:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8c:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  8e:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  90:	6005      	str	r5, [r0, #0]
  92:	d1ed      	bne.n	70 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x70>
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  94:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h2d4c5f211cc2b268E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  98:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  9a:	2a02      	cmp	r2, #2
  9c:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  a0:	d30f      	bcc.n	c2 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xc2>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a2:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a4:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a6:	bf1c      	itt	ne
  a8:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  aa:	2b01      	cmpne	r3, #1
  ac:	d005      	beq.n	ba <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xba>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ae:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b0:	2b01      	cmp	r3, #1
  b2:	d002      	beq.n	ba <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xba>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b4:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b6:	2b01      	cmp	r3, #1
  b8:	d1f3      	bne.n	a2 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xa2>
  ba:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  be:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  c0:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c2:	2a01      	cmp	r2, #1
  c4:	d11c      	bne.n	100 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x100>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  c8:	2a01      	cmp	r2, #1
  ca:	d017      	beq.n	fc <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  cc:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ce:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d0:	bf1c      	itt	ne
  d2:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d4:	2a01      	cmpne	r2, #1
  d6:	d011      	beq.n	fc <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  da:	2a01      	cmp	r2, #1
  dc:	d1f3      	bne.n	c6 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xc6>
  de:	e00d      	b.n	fc <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xfc>
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e0:	2a01      	cmp	r2, #1
  e2:	d10d      	bne.n	100 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0x100>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e4:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e6:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e8:	bf1c      	itt	ne
  ea:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ec:	2a01      	cmpne	r2, #1
  ee:	d005      	beq.n	fc <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f0:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f2:	2a01      	cmp	r2, #1
  f4:	d002      	beq.n	fc <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f8:	2a01      	cmp	r2, #1
  fa:	d1f3      	bne.n	e4 <_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E+0xe4>
  fc:	7809      	ldrb	r1, [r1, #0]
  fe:	7001      	strb	r1, [r0, #0]
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h7a39794a13dcfd70E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:27
    }
 100:	2000      	movs	r0, #0
 102:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE:

00000000 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE>:
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07d      	beq.n	100 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x100>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   4:	07cb      	lsls	r3, r1, #31
   6:	d00f      	beq.n	28 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x28>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   a:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   c:	bf1c      	itt	ne
   e:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  10:	2b01      	cmpne	r3, #1
  12:	d005      	beq.n	20 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x20>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  16:	2b01      	cmp	r3, #1
  18:	d002      	beq.n	20 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x20>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1c:	2b01      	cmp	r3, #1
  1e:	d1f3      	bne.n	8 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x8>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  20:	f811 3b01 	ldrb.w	r3, [r1], #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  24:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  26:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  28:	f001 0303 	and.w	r3, r1, #3
  2c:	2b02      	cmp	r3, #2
  2e:	d111      	bne.n	54 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x54>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  30:	2a02      	cmp	r2, #2
  32:	d355      	bcc.n	e0 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xe0>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  34:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  36:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  38:	bf1c      	itt	ne
  3a:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  3c:	2b01      	cmpne	r3, #1
  3e:	d005      	beq.n	4c <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x4c>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  40:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  42:	2b01      	cmp	r3, #1
  44:	d002      	beq.n	4c <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x4c>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  46:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  48:	2b01      	cmp	r3, #1
  4a:	d1f3      	bne.n	34 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x34>
  4c:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  50:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  52:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  54:	2a00      	cmp	r2, #0
  56:	d053      	beq.n	100 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x100>
  58:	b5b0      	push	{r4, r5, r7, lr}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5a:	f022 0c03 	bic.w	ip, r2, #3
  5e:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  60:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  64:	d015      	beq.n	92 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x92>
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
  66:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6a:	2300      	movs	r3, #0
  6c:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  6e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  70:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  72:	bf1c      	itt	ne
  74:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  76:	2d01      	cmpne	r5, #1
  78:	d005      	beq.n	86 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x86>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7a:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7c:	2d01      	cmp	r5, #1
  7e:	d002      	beq.n	86 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x86>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  80:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  82:	2d01      	cmp	r5, #1
  84:	d1f3      	bne.n	6e <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x6e>
  86:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8a:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  8c:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  8e:	6005      	str	r5, [r0, #0]
  90:	d1ed      	bne.n	6e <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x6e>
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  92:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h2d4c5f211cc2b268E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  96:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  98:	2a02      	cmp	r2, #2
  9a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  9e:	d30f      	bcc.n	c0 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xc0>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a0:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a2:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a4:	bf1c      	itt	ne
  a6:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  a8:	2b01      	cmpne	r3, #1
  aa:	d005      	beq.n	b8 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xb8>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ac:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  ae:	2b01      	cmp	r3, #1
  b0:	d002      	beq.n	b8 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xb8>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b2:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b4:	2b01      	cmp	r3, #1
  b6:	d1f3      	bne.n	a0 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xa0>
  b8:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  bc:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  be:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c0:	2a01      	cmp	r2, #1
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:73
}
  c2:	bf18      	it	ne
  c4:	4770      	bxne	lr
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  c8:	2a01      	cmp	r2, #1
  ca:	d017      	beq.n	fc <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  cc:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ce:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d0:	bf1c      	itt	ne
  d2:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d4:	2a01      	cmpne	r2, #1
  d6:	d011      	beq.n	fc <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  da:	2a01      	cmp	r2, #1
  dc:	d1f3      	bne.n	c6 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xc6>
  de:	e00d      	b.n	fc <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xfc>
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e0:	2a01      	cmp	r2, #1
  e2:	d10d      	bne.n	100 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0x100>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e4:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e6:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e8:	bf1c      	itt	ne
  ea:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ec:	2a01      	cmpne	r2, #1
  ee:	d005      	beq.n	fc <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f0:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f2:	2a01      	cmp	r2, #1
  f4:	d002      	beq.n	fc <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f8:	2a01      	cmp	r2, #1
  fa:	d1f3      	bne.n	e4 <_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE+0xe4>
  fc:	7809      	ldrb	r1, [r1, #0]
  fe:	7001      	strb	r1, [r0, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:73
}
 100:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E:

00000000 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E>:
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
   0:	2a00      	cmp	r2, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:122
            port.write_u8(*ptr);
        }
    }
}
   2:	bf08      	it	eq
   4:	4770      	bxeq	lr
   6:	b5b0      	push	{r4, r5, r7, lr}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
   8:	f022 0c03 	bic.w	ip, r2, #3
   c:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
   e:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  12:	d015      	beq.n	40 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x40>
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
  14:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  18:	2300      	movs	r3, #0
  1a:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1c:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  1e:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  20:	bf1c      	itt	ne
  22:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  24:	2d01      	cmpne	r5, #1
  26:	d005      	beq.n	34 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x34>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  28:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  2a:	2d01      	cmp	r5, #1
  2c:	d002      	beq.n	34 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x34>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  2e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  30:	2d01      	cmp	r5, #1
  32:	d1f3      	bne.n	1c <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x1c>
  34:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  38:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  3a:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  3c:	6005      	str	r5, [r0, #0]
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  3e:	d1ed      	bne.n	1c <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x1c>
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  40:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h2d4c5f211cc2b268E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  44:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  46:	2a02      	cmp	r2, #2
  48:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  4c:	d202      	bcs.n	54 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x54>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  4e:	2a01      	cmp	r2, #1
  50:	d012      	beq.n	78 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x78>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:122
}
  52:	4770      	bx	lr
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  54:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  56:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  58:	bf1c      	itt	ne
  5a:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  5c:	2b01      	cmpne	r3, #1
  5e:	d005      	beq.n	6c <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x6c>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  60:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  62:	2b01      	cmp	r3, #1
  64:	d002      	beq.n	6c <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x6c>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  66:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  68:	2b01      	cmp	r3, #1
  6a:	d1f3      	bne.n	54 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x54>
  6c:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  70:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  72:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  74:	2a01      	cmp	r2, #1
  76:	d1ec      	bne.n	52 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x52>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  78:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  7a:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7c:	bf1c      	itt	ne
  7e:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  80:	2a01      	cmpne	r2, #1
  82:	d005      	beq.n	90 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x90>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  84:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  86:	2a01      	cmp	r2, #1
  88:	d002      	beq.n	90 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x90>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  8a:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  8c:	2a01      	cmp	r2, #1
  8e:	d1f3      	bne.n	78 <_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E+0x78>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:119
            port.write_u8(*ptr);
  90:	7809      	ldrb	r1, [r1, #0]
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  92:	7001      	strb	r1, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:122
}
  94:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m3itm9write_fmt17h84505391dd574c03E:

00000000 <_ZN8cortex_m3itm9write_fmt17h84505391dd574c03E>:
_ZN8cortex_m3itm9write_fmt17h84505391dd574c03E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:125

/// Writes `fmt::Arguments` to the ITM `port`
pub fn write_fmt(port: &mut Stim, args: fmt::Arguments) {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b088      	sub	sp, #32
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:128
    use core::fmt::Write;

    Port(port).write_fmt(args).ok();
   4:	9000      	str	r0, [sp, #0]
   6:	4668      	mov	r0, sp
   8:	9001      	str	r0, [sp, #4]
   a:	aa02      	add	r2, sp, #8
_ZN4core3fmt5Write9write_fmt17h36e872a80eb5c8eaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:195
   c:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
  10:	f240 0100 	movw	r1, #0
  14:	4610      	mov	r0, r2
  16:	f2c0 0100 	movt	r1, #0
  1a:	e880 5078 	stmia.w	r0, {r3, r4, r5, r6, ip, lr}
  1e:	a801      	add	r0, sp, #4
  20:	f7ff fffe 	bl	0 <_ZN4core3fmt5write17h51826aee11d21b9bE>
_ZN8cortex_m3itm9write_fmt17h84505391dd574c03E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:129
}
  24:	b008      	add	sp, #32
  26:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN8cortex_m3itm9write_str17hbe0d17177bce7486E:

00000000 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E>:
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07d      	beq.n	100 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x100>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   4:	07cb      	lsls	r3, r1, #31
   6:	d00f      	beq.n	28 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x28>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   a:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   c:	bf1c      	itt	ne
   e:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  10:	2b01      	cmpne	r3, #1
  12:	d005      	beq.n	20 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x20>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  16:	2b01      	cmp	r3, #1
  18:	d002      	beq.n	20 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x20>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1c:	2b01      	cmp	r3, #1
  1e:	d1f3      	bne.n	8 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x8>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  20:	f811 3b01 	ldrb.w	r3, [r1], #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  24:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  26:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  28:	f001 0303 	and.w	r3, r1, #3
  2c:	2b02      	cmp	r3, #2
  2e:	d111      	bne.n	54 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x54>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  30:	2a02      	cmp	r2, #2
  32:	d355      	bcc.n	e0 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xe0>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  34:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  36:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  38:	bf1c      	itt	ne
  3a:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  3c:	2b01      	cmpne	r3, #1
  3e:	d005      	beq.n	4c <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x4c>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  40:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  42:	2b01      	cmp	r3, #1
  44:	d002      	beq.n	4c <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x4c>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  46:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  48:	2b01      	cmp	r3, #1
  4a:	d1f3      	bne.n	34 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x34>
  4c:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  50:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  52:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  54:	2a00      	cmp	r2, #0
  56:	d053      	beq.n	100 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x100>
  58:	b5b0      	push	{r4, r5, r7, lr}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5a:	f022 0c03 	bic.w	ip, r2, #3
  5e:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  60:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  64:	d015      	beq.n	92 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x92>
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
  66:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6a:	2300      	movs	r3, #0
  6c:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  6e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  70:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  72:	bf1c      	itt	ne
  74:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  76:	2d01      	cmpne	r5, #1
  78:	d005      	beq.n	86 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x86>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7a:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7c:	2d01      	cmp	r5, #1
  7e:	d002      	beq.n	86 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x86>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  80:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17h9897e63ac1cc93cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  82:	2d01      	cmp	r5, #1
  84:	d1f3      	bne.n	6e <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x6e>
  86:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8a:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h9bb5ed258bb55a22E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  8c:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  8e:	6005      	str	r5, [r0, #0]
  90:	d1ed      	bne.n	6e <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x6e>
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  92:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h2d4c5f211cc2b268E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  96:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  98:	2a02      	cmp	r2, #2
  9a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  9e:	d30f      	bcc.n	c0 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xc0>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a0:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a2:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a4:	bf1c      	itt	ne
  a6:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  a8:	2b01      	cmpne	r3, #1
  aa:	d005      	beq.n	b8 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xb8>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ac:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  ae:	2b01      	cmp	r3, #1
  b0:	d002      	beq.n	b8 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xb8>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b2:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b4:	2b01      	cmp	r3, #1
  b6:	d1f3      	bne.n	a0 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xa0>
  b8:	f831 3b02 	ldrh.w	r3, [r1], #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  bc:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  be:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c0:	2a01      	cmp	r2, #1
_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:134

/// Writes a string to the ITM `port`
pub fn write_str(port: &mut Stim, string: &str) {
    write_all(port, string.as_bytes())
}
  c2:	bf18      	it	ne
  c4:	4770      	bxne	lr
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  c8:	2a01      	cmp	r2, #1
  ca:	d017      	beq.n	fc <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  cc:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ce:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d0:	bf1c      	itt	ne
  d2:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d4:	2a01      	cmpne	r2, #1
  d6:	d011      	beq.n	fc <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17hd8a569ed16a8ef19E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  da:	2a01      	cmp	r2, #1
  dc:	d1f3      	bne.n	c6 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xc6>
  de:	e00d      	b.n	fc <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xfc>
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e0:	2a01      	cmp	r2, #1
  e2:	d10d      	bne.n	100 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0x100>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e4:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e6:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e8:	bf1c      	itt	ne
  ea:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ec:	2a01      	cmpne	r2, #1
  ee:	d005      	beq.n	fc <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f0:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f2:	2a01      	cmp	r2, #1
  f4:	d002      	beq.n	fc <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xfc>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17ha6039904b6d1e5fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f8:	2a01      	cmp	r2, #1
  fa:	d1f3      	bne.n	e4 <_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E+0xe4>
  fc:	7809      	ldrb	r1, [r1, #0]
  fe:	7001      	strb	r1, [r0, #0]
_ZN8cortex_m3itm9write_str17hbe0d17177bce7486E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:134
}
 100:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E:

00000000 <_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E>:
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:84
    ///
    /// * `level`: the required cache level minus 1, e.g. 0 for L1, 1 for L2
    /// * `ind`: select instruction cache or data/unified cache
    ///
    /// `level` is masked to be between 0 and 7.
    pub fn select_cache(&mut self, level: u8, ind: CsselrCacheType) {
   0:	f64e 5084 	movw	r0, #60804	; 0xed84
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:92
        const CSSELR_LEVEL_POS: u32 = 1;
        const CSSELR_LEVEL_MASK: u32 = 0x7 << CSSELR_LEVEL_POS;

        unsafe {
            self.csselr.write(
                (((level as u32) << CSSELR_LEVEL_POS) & CSSELR_LEVEL_MASK)
   4:	f361 0243 	bfi	r2, r1, #1, #3
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6002      	str	r2, [r0, #0]
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:96
                    | (((ind as u32) << CSSELR_IND_POS) & CSSELR_IND_MASK),
            )
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E:

00000000 <_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E>:
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:99

    /// Returns the number of sets and ways in the selected cache
    pub fn cache_num_sets_ways(&mut self, level: u8, ind: CsselrCacheType) -> (u16, u16) {
   0:	b510      	push	{r4, lr}
   2:	f64e 5480 	movw	r4, #60800	; 0xed80
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hbfbdaa2dad4d34b6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:92
                (((level as u32) << CSSELR_LEVEL_POS) & CSSELR_LEVEL_MASK)
   6:	f361 0243 	bfi	r2, r1, #1, #3
   a:	f2ce 0400 	movt	r4, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6062      	str	r2, [r4, #4]
_ZN8cortex_m3asm3dsb17hf8defc71752d68a1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
        () => unsafe {
            extern "C" {
                fn __dsb();
            }

            __dsb()
  10:	f7ff fffe 	bl	0 <__dsb>
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6821      	ldr	r1, [r4, #0]
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h76c50f193507bc52E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:109

        self.select_cache(level, ind);
        ::asm::dsb();
        let ccsidr = self.ccsidr.read();
        (
            (1 + ((ccsidr & CCSIDR_NUMSETS_MASK) >> CCSIDR_NUMSETS_POS)) as u16,
  16:	f3c1 304e 	ubfx	r0, r1, #13, #15
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:110
            (1 + ((ccsidr & CCSIDR_ASSOCIATIVITY_MASK) >> CCSIDR_ASSOCIATIVITY_POS)) as u16,
  1a:	f3c1 01c9 	ubfx	r1, r1, #3, #10
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:109
            (1 + ((ccsidr & CCSIDR_NUMSETS_MASK) >> CCSIDR_NUMSETS_POS)) as u16,
  1e:	3001      	adds	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:110
            (1 + ((ccsidr & CCSIDR_ASSOCIATIVITY_MASK) >> CCSIDR_ASSOCIATIVITY_POS)) as u16,
  20:	3101      	adds	r1, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:112
        )
    }
  22:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE:

00000000 <_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE>:
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:28
impl DCB {
    /// Enables TRACE. This is for example required by the
    /// `peripheral::DWT` cycle counter to work properly.
    /// As by STM documentation, this flag is not reset on
    /// soft-reset, only on power reset.
    pub fn enable_trace(&mut self) {
   0:	f64e 50fc 	movw	r0, #60924	; 0xedfc
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace28_$u7b$$u7b$closure$u7d$$u7d$17h9edbf5cb8e0872fcE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:31
        // set bit 24 / TRCENA
        unsafe {
            self.demcr.modify(|w| w | DCB_DEMCR_TRCENA);
   a:	f041 7180 	orr.w	r1, r1, #16777216	; 0x1000000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h89962818f2427cfdE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:33
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE:

00000000 <_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE>:
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:36

    /// Disables TRACE. See `DCB::enable_trace()` for more details
    pub fn disable_trace(&mut self) {
   0:	f64e 50fc 	movw	r0, #60924	; 0xedfc
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace28_$u7b$$u7b$closure$u7d$$u7d$17h46c2390710b2a91fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:39
        // unset bit 24 / TRCENA
        unsafe {
            self.demcr.modify(|w| w & !DCB_DEMCR_TRCENA);
   a:	f021 7180 	bic.w	r1, r1, #16777216	; 0x1000000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17h60e7ba711ed7c69dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:41
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E:

00000000 <_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E>:
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:50
    /// Note: This function is [reported not to
    /// work](http://web.archive.org/web/20180821191012/https://community.nxp.com/thread/424925#comment-782843)
    /// on Cortex-M0 devices. Per the ARM v6-M Architecture Reference Manual, "Access to the DHCSR
    /// from software running on the processor is IMPLEMENTATION DEFINED". Indeed, from the
    /// [Cortex-M0+ r0p1 Technical Reference Manual](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0484c/BABJHEIG.html), "Note Software cannot access the debug registers."
    pub fn is_debugger_attached() -> bool {
   0:	f64e 50f0 	movw	r0, #60912	; 0xedf0
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h1959dea16f4ac793E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	7800      	ldrb	r0, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17hcce5148cd51724e8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:56
        unsafe {
            // do an 8-bit read of the 32-bit DHCSR register, and get the LSB
            let value = ptr::read_volatile(Self::ptr() as *const u8);
            value & 0x1 == 1
        }
    }
   a:	f000 0001 	and.w	r0, r0, #1
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E:

00000000 <_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:68
}

impl DWT {
    /// Enables the cycle counter
    #[cfg(not(armv6m))]
    pub fn enable_cycle_counter(&mut self) {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter28_$u7b$$u7b$closure$u7d$$u7d$17h2c7a44c2fe98282cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:69
        unsafe { self.ctrl.modify(|r| r | 1) }
   a:	f041 0101 	orr.w	r1, r1, #1
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h5b206197bb094b91E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:70
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE:

00000000 <_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:74

    /// Returns the current clock cycle count
    #[cfg(not(armv6m))]
    pub fn get_cycle_count() -> u32 {
   0:	f241 0004 	movw	r0, #4100	; 0x1004
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h11d7cfd44891771cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:77
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).cyccnt.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim8write_u817h65891c7d1cb66d84E:

00000000 <_ZN8cortex_m10peripheral3itm4Stim8write_u817h65891c7d1cb66d84E>:
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   0:	7001      	strb	r1, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim8write_u817h65891c7d1cb66d84E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:40

impl Stim {
    /// Writes an `u8` payload into the stimulus port
    pub fn write_u8(&mut self, value: u8) {
        unsafe { ptr::write_volatile(self.register.get() as *mut u8, value) }
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617hbb501523cef8caacE:

00000000 <_ZN8cortex_m10peripheral3itm4Stim9write_u1617hbb501523cef8caacE>:
_ZN4core3ptr14write_volatile17h7dee996f2a2669e6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   0:	8001      	strh	r1, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim9write_u1617hbb501523cef8caacE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:45

    /// Writes an `u16` payload into the stimulus port
    pub fn write_u16(&mut self, value: u16) {
        unsafe { ptr::write_volatile(self.register.get() as *mut u16, value) }
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217hd460f426a5a71dbbE:

00000000 <_ZN8cortex_m10peripheral3itm4Stim9write_u3217hd460f426a5a71dbbE>:
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   0:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim9write_u3217hd460f426a5a71dbbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:50

    /// Writes an `u32` payload into the stimulus port
    pub fn write_u32(&mut self, value: u32) {
        unsafe { ptr::write_volatile(self.register.get(), value) }
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17h1fe57fe929e12d9fE:

00000000 <_ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17h1fe57fe929e12d9fE>:
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   0:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17h1fe57fe929e12d9fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:54

    /// Returns `true` if the stimulus port is ready to accept more data
    pub fn is_fifo_ready(&self) -> bool {
        unsafe { ptr::read_volatile(self.register.get()) == 1 }
   2:	3801      	subs	r0, #1
   4:	fab0 f080 	clz	r0, r0
   8:	0940      	lsrs	r0, r0, #5
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:55
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:165
    }
}

impl SCB {
    /// Returns the active exception number
    pub fn vect_active() -> VectActive {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
   8:	6800      	ldr	r0, [r0, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:168
        let icsr = unsafe { ptr::read(&(*SCB::ptr()).icsr as *const _ as *const u32) };

        match icsr as u8 {
   a:	b2c2      	uxtb	r2, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:169
            0 => VectActive::ThreadMode,
   c:	2a0f      	cmp	r2, #15
   e:	d80c      	bhi.n	2a <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h452f0d5e519bb0abE+0x2a>
  10:	e8df f002 	tbb	[pc, r2]
  14:	0f080b0e 	.word	0x0f080b0e
  18:	0b181512 	.word	0x0b181512
  1c:	1b0b0b0b 	.word	0x1b0b0b0b
  20:	24210b1e 	.word	0x24210b1e
  24:	2001      	movs	r0, #1
  26:	2100      	movs	r1, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:187
            12 => VectActive::Exception(Exception::DebugMonitor),
            14 => VectActive::Exception(Exception::PendSV),
            15 => VectActive::Exception(Exception::SysTick),
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
        }
    }
  28:	4770      	bx	lr
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:185
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
  2a:	f1a0 0110 	sub.w	r1, r0, #16
  2e:	2002      	movs	r0, #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:187
    }
  30:	4770      	bx	lr
  32:	2101      	movs	r1, #1
  34:	2001      	movs	r0, #1
  36:	4770      	bx	lr
  38:	2001      	movs	r0, #1
  3a:	2102      	movs	r1, #2
  3c:	4770      	bx	lr
  3e:	2001      	movs	r0, #1
  40:	2103      	movs	r1, #3
  42:	4770      	bx	lr
  44:	2001      	movs	r0, #1
  46:	2104      	movs	r1, #4
  48:	4770      	bx	lr
  4a:	2001      	movs	r0, #1
  4c:	2105      	movs	r1, #5
  4e:	4770      	bx	lr
  50:	2001      	movs	r0, #1
  52:	2106      	movs	r1, #6
  54:	4770      	bx	lr
  56:	2001      	movs	r0, #1
  58:	2107      	movs	r1, #7
  5a:	4770      	bx	lr
  5c:	2001      	movs	r0, #1
  5e:	2108      	movs	r1, #8
  60:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb9Exception4irqn17hf3857b33c1a6a39eE:

00000000 <_ZN8cortex_m10peripheral3scb9Exception4irqn17hf3857b33c1a6a39eE>:
_ZN8cortex_m10peripheral3scb9Exception4irqn17hf3857b33c1a6a39eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:235
    /// Returns the IRQ number of this `Exception`
    ///
    /// The return value is always within the closed range `[-1, -14]`
    pub fn irqn(&self) -> i8 {
        match *self {
            Exception::NonMaskableInt => -14,
   0:	7800      	ldrb	r0, [r0, #0]
   2:	3801      	subs	r0, #1
   4:	2807      	cmp	r0, #7
   6:	bf84      	itt	hi
   8:	20f2      	movhi	r0, #242	; 0xf2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:251
            #[cfg(not(armv6m))]
            Exception::DebugMonitor => -4,
            Exception::PendSV => -2,
            Exception::SysTick => -1,
        }
    }
   a:	4770      	bxhi	lr
   c:	e8df f000 	tbb	[pc, r0]
  10:	0a080604 	.word	0x0a080604
  14:	12100e0c 	.word	0x12100e0c
  18:	20f3      	movs	r0, #243	; 0xf3
  1a:	4770      	bx	lr
  1c:	20f4      	movs	r0, #244	; 0xf4
  1e:	4770      	bx	lr
  20:	20f5      	movs	r0, #245	; 0xf5
  22:	4770      	bx	lr
  24:	20f6      	movs	r0, #246	; 0xf6
  26:	4770      	bx	lr
  28:	20fb      	movs	r0, #251	; 0xfb
  2a:	4770      	bx	lr
  2c:	20fc      	movs	r0, #252	; 0xfc
  2e:	4770      	bx	lr
  30:	20fe      	movs	r0, #254	; 0xfe
  32:	4770      	bx	lr
  34:	20ff      	movs	r0, #255	; 0xff
  36:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E:

00000000 <_ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E>:
_ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:272
    },
}

impl VectActive {
    /// Converts a `byte` into `VectActive`
    pub fn from(vect_active: u8) -> Option<Self> {
   0:	b2c2      	uxtb	r2, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:274
        Some(match vect_active {
            0 => VectActive::ThreadMode,
   2:	2a0f      	cmp	r2, #15
   4:	d80c      	bhi.n	20 <_ZN8cortex_m10peripheral3scb10VectActive4from17hd46aa4fd92db5b48E+0x20>
   6:	e8df f002 	tbb	[pc, r2]
   a:	0b12      	.short	0x0b12
   c:	19161308 	.word	0x19161308
  10:	0b0b0b1c 	.word	0x0b0b0b1c
  14:	0b221f0b 	.word	0x0b221f0b
  18:	2825      	.short	0x2825
  1a:	2001      	movs	r0, #1
  1c:	2100      	movs	r1, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:293
            14 => VectActive::Exception(Exception::PendSV),
            15 => VectActive::Exception(Exception::SysTick),
            irqn if irqn >= 16 => VectActive::Interrupt { irqn },
            _ => return None,
        })
    }
  1e:	4770      	bx	lr
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:290
            irqn if irqn >= 16 => VectActive::Interrupt { irqn },
  20:	2a0f      	cmp	r2, #15
  22:	bf82      	ittt	hi
  24:	4601      	movhi	r1, r0
  26:	2002      	movhi	r0, #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:293
    }
  28:	4770      	bxhi	lr
  2a:	2100      	movs	r1, #0
  2c:	2003      	movs	r0, #3
  2e:	4770      	bx	lr
  30:	2101      	movs	r1, #1
  32:	2001      	movs	r0, #1
  34:	4770      	bx	lr
  36:	2001      	movs	r0, #1
  38:	2102      	movs	r1, #2
  3a:	4770      	bx	lr
  3c:	2001      	movs	r0, #1
  3e:	2103      	movs	r1, #3
  40:	4770      	bx	lr
  42:	2001      	movs	r0, #1
  44:	2104      	movs	r1, #4
  46:	4770      	bx	lr
  48:	2001      	movs	r0, #1
  4a:	2105      	movs	r1, #5
  4c:	4770      	bx	lr
  4e:	2001      	movs	r0, #1
  50:	2106      	movs	r1, #6
  52:	4770      	bx	lr
  54:	2001      	movs	r0, #1
  56:	2107      	movs	r1, #7
  58:	4770      	bx	lr
  5a:	2001      	movs	r0, #1
  5c:	2108      	movs	r1, #8
  5e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:585

const SCB_SCR_SLEEPDEEP: u32 = 0x1 << 2;

impl SCB {
    /// Set the SLEEPDEEP bit in the SCR register
    pub fn set_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17h99fda022e93bdb8fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:587
        unsafe {
            self.scr.modify(|scr| scr | SCB_SCR_SLEEPDEEP);
   a:	f041 0104 	orr.w	r1, r1, #4
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h7d27eae06e5c9c86E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:589
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:592

    /// Clear the SLEEPDEEP bit in the SCR register
    pub fn clear_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17hbbbd14ed63e63d9bE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:594
        unsafe {
            self.scr.modify(|scr| scr & !SCB_SCR_SLEEPDEEP);
   a:	f021 0104 	bic.w	r1, r1, #4
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17hb185e50488a74340E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:596
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:603

const SCB_SCR_SLEEPONEXIT: u32 = 0x1 << 1;

impl SCB {
    /// Set the SLEEPONEXIT bit in the SCR register
    pub fn set_sleeponexit(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit28_$u7b$$u7b$closure$u7d$$u7d$17hb95d366017694e27E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:605
        unsafe {
            self.scr.modify(|scr| scr | SCB_SCR_SLEEPONEXIT);
   a:	f041 0102 	orr.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he743d10955e99acfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:607
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:610

    /// Clear the SLEEPONEXIT bit in the SCR register
    pub fn clear_sleeponexit(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit28_$u7b$$u7b$closure$u7d$$u7d$17h75247d5ace50d730E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:612
        unsafe {
            self.scr.modify(|scr| scr & !SCB_SCR_SLEEPONEXIT);
   a:	f021 0102 	bic.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h412ceaf90026c780E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:614
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E>:
_ZN8cortex_m3asm3dsb17hf8defc71752d68a1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
   0:	f7ff fffe 	bl	0 <__dsb>
   4:	f64e 500c 	movw	r0, #60684	; 0xed0c
   8:	2204      	movs	r2, #4
   a:	f2ce 0000 	movt	r0, #57344	; 0xe000
   e:	f2c0 52fa 	movt	r2, #1530	; 0x5fa
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  12:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset28_$u7b$$u7b$closure$u7d$$u7d$17h72543cc55f1025a2E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:629
        ::asm::dsb();
        unsafe {
            self.aircr.modify(
                |r| {
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
            r & SCB_AIRCR_PRIGROUP_MASK | // keep priority group unchanged
  14:	f401 61a0 	and.w	r1, r1, #1280	; 0x500
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:628
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
  18:	4311      	orrs	r1, r2
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  1a:	6001      	str	r1, [r0, #0]
_ZN8cortex_m3asm3dsb17hf8defc71752d68a1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
  1c:	f7ff fffe 	bl	0 <__dsb>
_ZN8cortex_m3asm3nop17h618abeb94e3568c9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:76
            __nop()
  20:	f7ff fffe 	bl	0 <__nop>
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:637
            )
        };
        ::asm::dsb();
        loop {
            // wait for the reset
            ::asm::nop(); // avoid rust-lang/rust#28728
  24:	e7fc      	b.n	20 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17hb60dda1e8a2ee077E+0x20>

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:650
const SCB_ICSR_PENDSTSET: u32 = 1 << 26;
const SCB_ICSR_PENDSTCLR: u32 = 1 << 25;

impl SCB {
    /// Set the PENDSVSET bit in the ICSR register which will pend the PendSV interrupt
    pub fn set_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 5180 	mov.w	r1, #268435456	; 0x10000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17hbcb55fd08b2716c9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:654
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVSET);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:657

    /// Check if PENDSVSET bit in the ICSR register is set meaning PendSV interrupt is pending
    pub fn is_pendsv_pending() -> bool {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17he2fffa6b55d5ff1fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:658
        unsafe { (*Self::ptr()).icsr.read() & SCB_ICSR_PENDSVSET == SCB_ICSR_PENDSVSET }
   a:	f3c0 7000 	ubfx	r0, r0, #28, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:659
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:662

    /// Set the PENDSVCLR bit in the ICSR register which will clear a pending PendSV interrupt
    pub fn clear_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 6100 	mov.w	r1, #134217728	; 0x8000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17hda9ef9deab5301ddE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:666
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVCLR);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h31e288a254da8bc1E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h31e288a254da8bc1E>:
_ZN8cortex_m10peripheral3scb13SystemHandler5index17hc11cf0c8ef53d4f0E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:731

impl SystemHandler {
    fn index(&self) -> u8 {
        match *self {
            #[cfg(not(armv6m))]
            SystemHandler::MemoryManagement => 4,
   0:	f240 0100 	movw	r1, #0
   4:	b240      	sxtb	r0, r0
   6:	f2c0 0100 	movt	r1, #0
   a:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
   e:	f64e 5118 	movw	r1, #60696	; 0xed18
  12:	f2ce 0100 	movt	r1, #57344	; 0xe000
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h31e288a254da8bc1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:768
            // NOTE(unsafe) atomic read with no side effects
            let shpr = unsafe { (*Self::ptr()).shpr[usize::from((index - 8) / 4)].read() };
            let prio = (shpr >> (8 * (index % 4))) & 0x000000ff;
            prio as u8
        }
    }
  16:	5c40      	ldrb	r0, [r0, r1]
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E>:
_ZN8cortex_m10peripheral3scb13SystemHandler5index17hc11cf0c8ef53d4f0E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:731
            SystemHandler::MemoryManagement => 4,
   0:	b248      	sxtb	r0, r1
   2:	f240 0100 	movw	r1, #0
   6:	f2c0 0100 	movt	r1, #0
   a:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
   e:	f64e 5118 	movw	r1, #60696	; 0xed18
  12:	f2ce 0100 	movt	r1, #57344	; 0xe000
_ZN4core3ptr14write_volatile17hffada0ef30b984e9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  16:	5442      	strb	r2, [r0, r1]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h401871219e9f92d8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:800
                let prio = u32::from(prio) << shift;

                (value & !mask) | prio
            });
        }
    }
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:43

impl SYST {
    /// Clears current value to 0
    ///
    /// After calling `clear_current()`, the next call to `has_wrapped()` will return `false`.
    pub fn clear_current(&mut self) {
   0:	f24e 0018 	movw	r0, #57368	; 0xe018
   4:	2100      	movs	r1, #0
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   a:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3c35425a0e60f5e5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:45
        unsafe { self.cvr.write(0) }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:48

    /// Disables counter
    pub fn disable_counter(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter28_$u7b$$u7b$closure$u7d$$u7d$17h2a19017109f0a2aaE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:49
        unsafe { self.csr.modify(|v| v & !SYST_CSR_ENABLE) }
   a:	f021 0101 	bic.w	r1, r1, #1
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h44a0eecfad26f83bE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:50
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:53

    /// Disables SysTick interrupt
    pub fn disable_interrupt(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt28_$u7b$$u7b$closure$u7d$$u7d$17h1cc9e49d1a855878E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:54
        unsafe { self.csr.modify(|v| v & !SYST_CSR_TICKINT) }
   a:	f021 0102 	bic.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h1617c02f420172afE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:55
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:69
    /// - Program reload value
    /// - Clear current value
    /// - Program Control and Status register"
    ///
    /// The sequence translates to `self.set_reload(x); self.clear_current(); self.enable_counter()`
    pub fn enable_counter(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter28_$u7b$$u7b$closure$u7d$$u7d$17ha51918d51b32cac0E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:70
        unsafe { self.csr.modify(|v| v | SYST_CSR_ENABLE) }
   a:	f041 0101 	orr.w	r1, r1, #1
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h335dedde5cf16cd3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:71
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:74

    /// Enables SysTick interrupt
    pub fn enable_interrupt(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt28_$u7b$$u7b$closure$u7d$$u7d$17h607e083369e1b22aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:75
        unsafe { self.csr.modify(|v| v | SYST_CSR_TICKINT) }
   a:	f041 0102 	orr.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h677956bfab475e43E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:76
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:82

    /// Gets clock source
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and can clear the
    /// bit that indicates that the timer has wrapped (cf. `SYST.has_wrapped`)
    pub fn get_clock_source(&mut self) -> SystClkSource {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	2101      	movs	r1, #1
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   a:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h2efc0e0ad1787e66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:84
        // NOTE(unsafe) atomic read with no side effects
        let clk_source_bit = self.csr.read() & SYST_CSR_CLKSOURCE != 0;
   c:	f000 0004 	and.w	r0, r0, #4
  10:	ea81 0090 	eor.w	r0, r1, r0, lsr #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:89
        match clk_source_bit {
            false => SystClkSource::External,
            true => SystClkSource::Core,
        }
    }
  14:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:92

    /// Gets current value
    pub fn get_current() -> u32 {
   0:	f24e 0018 	movw	r0, #57368	; 0xe018
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17h0aef5b048f5df649E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:95
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).cvr.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:98

    /// Gets reload value
    pub fn get_reload() -> u32 {
   0:	f24e 0014 	movw	r0, #57364	; 0xe014
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17heaccd43ea3b5b1c6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:101
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).rvr.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:108
    /// Returns the reload value with which the counter would wrap once per 10
    /// ms
    ///
    /// Returns `0` if the value is not known (e.g. because the clock can
    /// change dynamically).
    pub fn get_ticks_per_10ms() -> u32 {
   0:	f24e 001c 	movw	r0, #57372	; 0xe01c
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h4268b7670e8342eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:110
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).calib.read() & SYST_COUNTER_MASK }
   a:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:111
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:114

    /// Checks if an external reference clock is available
    pub fn has_reference_clock() -> bool {
   0:	f24e 001c 	movw	r0, #57372	; 0xe01c
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h5bc4653bd57fe195E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:117
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).calib.read() & SYST_CALIB_NOREF == 0 }
    }
   a:	43c0      	mvns	r0, r0
   c:	0fc0      	lsrs	r0, r0, #31
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:123

    /// Checks if the counter wrapped (underflowed) since the last check
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and will clear
    /// the bit of the read register.
    pub fn has_wrapped(&mut self) -> bool {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17h23138fd1ff039aa3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:124
        self.csr.read() & SYST_CSR_COUNTFLAG != 0
   a:	f3c0 4000 	ubfx	r0, r0, #16, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:125
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:131

    /// Checks if counter is enabled
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and can clear the
    /// bit that indicates that the timer has wrapped (cf. `SYST.has_wrapped`)
    pub fn is_counter_enabled(&mut self) -> bool {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h31113b26b0d092f2E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:132
        self.csr.read() & SYST_CSR_ENABLE != 0
   a:	f000 0001 	and.w	r0, r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:133
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:139

    /// Checks if SysTick interrupt is enabled
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and can clear the
    /// bit that indicates that the timer has wrapped (cf. `SYST.has_wrapped`)
    pub fn is_interrupt_enabled(&mut self) -> bool {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h5658853aae6d450fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:140
        self.csr.read() & SYST_CSR_TICKINT != 0
   a:	f3c0 0040 	ubfx	r0, r0, #1, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:141
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:148
    /// Checks if the calibration value is precise
    ///
    /// Returns `false` if using the reload value returned by
    /// `get_ticks_per_10ms()` may result in a period significantly deviating
    /// from 10 ms.
    pub fn is_precise() -> bool {
   0:	f24e 001c 	movw	r0, #57372	; 0xe01c
   4:	2101      	movs	r1, #1
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hbfc74da91f551713E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   a:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17h2b74e0badf1a1e1aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:150
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).calib.read() & SYST_CALIB_SKEW == 0 }
   c:	f000 4080 	and.w	r0, r0, #1073741824	; 0x40000000
  10:	ea81 7090 	eor.w	r0, r1, r0, lsr #30
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:151
    }
  14:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17h8be2b683cf5d2a43E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17h8be2b683cf5d2a43E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17h8be2b683cf5d2a43E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:154

    /// Sets clock source
    pub fn set_clock_source(&mut self, clk_source: SystClkSource) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:156
        match clk_source {
            SystClkSource::External => unsafe { self.csr.modify(|v| v & !SYST_CSR_CLKSOURCE) },
   4:	2900      	cmp	r1, #0
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
   a:	6802      	ldr	r2, [r0, #0]
   c:	f042 0304 	orr.w	r3, r2, #4
  10:	bf18      	it	ne
  12:	f022 0304 	bicne.w	r3, r2, #4
  16:	6003      	str	r3, [r0, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:159
            SystClkSource::Core => unsafe { self.csr.modify(|v| v | SYST_CSR_CLKSOURCE) },
        }
    }
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E:

00000000 <_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:166
    /// Sets reload value
    ///
    /// Valid values are between `1` and `0x00ffffff`.
    ///
    /// *NOTE* To make the timer wrap every `N` ticks set the reload value to `N - 1`
    pub fn set_reload(&mut self, value: u32) {
   0:	f24e 0014 	movw	r0, #57364	; 0xe014
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h287bc0098450f5f9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   8:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17hc582e77ae322f207E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:168
        unsafe { self.rvr.write(value) }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral11Peripherals5steal17h16f254e2d499687dE:

00000000 <_ZN8cortex_m10peripheral11Peripherals5steal17h16f254e2d499687dE>:
_ZN8cortex_m10peripheral11Peripherals5steal17h16f254e2d499687dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:172

    /// Unchecked version of `Peripherals::take`
    pub unsafe fn steal() -> Self {
        debug_assert!(!CORE_PERIPHERALS);

        CORE_PERIPHERALS = true;
   0:	f240 0000 	movw	r0, #0
   4:	2101      	movs	r1, #1
   6:	f2c0 0000 	movt	r0, #0
   a:	7001      	strb	r1, [r0, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:212
            },
            TPIU: TPIU {
                _marker: PhantomData,
            },
        }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3CBP3new17hbfc0aedb6917d2a6E:

00000000 <_ZN8cortex_m10peripheral3CBP3new17hbfc0aedb6917d2a6E>:
_ZN8cortex_m10peripheral3CBP3new17hbfc0aedb6917d2a6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:228
impl CBP {
    pub(crate) unsafe fn new() -> Self {
        CBP {
            _marker: PhantomData,
        }
    }
   0:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3CBP3ptr17hc51a9300c4cb1fdaE:

00000000 <_ZN8cortex_m10peripheral3CBP3ptr17hc51a9300c4cb1fdaE>:
_ZN8cortex_m10peripheral3CBP3ptr17hc51a9300c4cb1fdaE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:231

    /// Returns a pointer to the register block
    pub fn ptr() -> *const self::cbp::RegisterBlock {
   0:	f64e 7050 	movw	r0, #61264	; 0xef50
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:233
        0xE000_EF50 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3de47d8a849d8a11E:

00000000 <_ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3de47d8a849d8a11E>:
_ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3de47d8a849d8a11E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:240

#[cfg(not(armv6m))]
impl ops::Deref for CBP {
    type Target = self::cbp::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 7050 	movw	r0, #61264	; 0xef50
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:242
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral5CPUID3ptr17h9a462ef52dde8d51E:

00000000 <_ZN8cortex_m10peripheral5CPUID3ptr17h9a462ef52dde8d51E>:
_ZN8cortex_m10peripheral5CPUID3ptr17h9a462ef52dde8d51E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:254

unsafe impl Send for CPUID {}

impl CPUID {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const self::cpuid::RegisterBlock {
   0:	f64e 5000 	movw	r0, #60672	; 0xed00
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:256
        0xE000_ED00 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3d0dcab989fcdfbeE:

00000000 <_ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3d0dcab989fcdfbeE>:
_ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17h3d0dcab989fcdfbeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:262
}

impl ops::Deref for CPUID {
    type Target = self::cpuid::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5000 	movw	r0, #60672	; 0xed00
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:264
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3DCB3ptr17h3e9c13623b27c25bE:

00000000 <_ZN8cortex_m10peripheral3DCB3ptr17h3e9c13623b27c25bE>:
_ZN8cortex_m10peripheral3DCB3ptr17h3e9c13623b27c25bE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:276

unsafe impl Send for DCB {}

impl DCB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const dcb::RegisterBlock {
   0:	f64e 50f0 	movw	r0, #60912	; 0xedf0
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:278
        0xE000_EDF0 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3eb58bb6922b54aE:

00000000 <_ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3eb58bb6922b54aE>:
_ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hc3eb58bb6922b54aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:284
}

impl ops::Deref for DCB {
    type Target = self::dcb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 50f0 	movw	r0, #60912	; 0xedf0
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:286
        unsafe { &*DCB::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3DWT3ptr17hdcde3a55a33307a0E:

00000000 <_ZN8cortex_m10peripheral3DWT3ptr17hdcde3a55a33307a0E>:
_ZN8cortex_m10peripheral3DWT3ptr17hdcde3a55a33307a0E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:298

unsafe impl Send for DWT {}

impl DWT {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const dwt::RegisterBlock {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:300
        0xE000_1000 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9d7f0af99b88ae49E:

00000000 <_ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9d7f0af99b88ae49E>:
_ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9d7f0af99b88ae49E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:306
}

impl ops::Deref for DWT {
    type Target = self::dwt::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:308
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3FPB3ptr17h225de9906c21501bE:

00000000 <_ZN8cortex_m10peripheral3FPB3ptr17h225de9906c21501bE>:
_ZN8cortex_m10peripheral3FPB3ptr17h225de9906c21501bE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:321
unsafe impl Send for FPB {}

#[cfg(not(armv6m))]
impl FPB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const fpb::RegisterBlock {
   0:	f242 0000 	movw	r0, #8192	; 0x2000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:323
        0xE000_2000 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h03202933e23c6f31E:

00000000 <_ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h03202933e23c6f31E>:
_ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h03202933e23c6f31E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:330

#[cfg(not(armv6m))]
impl ops::Deref for FPB {
    type Target = self::fpb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f242 0000 	movw	r0, #8192	; 0x2000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:332
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3ITM3ptr17hfc0c06a8a113bd44E:

00000000 <_ZN8cortex_m10peripheral3ITM3ptr17hfc0c06a8a113bd44E>:
_ZN8cortex_m10peripheral3ITM3ptr17hfc0c06a8a113bd44E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:371
#[cfg(not(armv6m))]
impl ITM {
    /// Returns a pointer to the register block
    pub fn ptr() -> *mut itm::RegisterBlock {
        0xE000_0000 as *mut _
    }
   0:	f04f 4060 	mov.w	r0, #3758096384	; 0xe0000000
   4:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h54d637521666d3f1E:

00000000 <_ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h54d637521666d3f1E>:
_ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h54d637521666d3f1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:380
impl ops::Deref for ITM {
    type Target = self::itm::RegisterBlock;

    fn deref(&self) -> &Self::Target {
        unsafe { &*Self::ptr() }
    }
   0:	f04f 4060 	mov.w	r0, #3758096384	; 0xe0000000
   4:	4770      	bx	lr

Disassembly of section .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h12ad89d44da4adbcE:

00000000 <_ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h12ad89d44da4adbcE>:
_ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h12ad89d44da4adbcE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:387

#[cfg(not(armv6m))]
impl ops::DerefMut for ITM {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { &mut *Self::ptr() }
    }
   0:	f04f 4060 	mov.w	r0, #3758096384	; 0xe0000000
   4:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3MPU3ptr17h6309b112b91d94c6E:

00000000 <_ZN8cortex_m10peripheral3MPU3ptr17h6309b112b91d94c6E>:
_ZN8cortex_m10peripheral3MPU3ptr17h6309b112b91d94c6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:399

unsafe impl Send for MPU {}

impl MPU {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const mpu::RegisterBlock {
   0:	f64e 5090 	movw	r0, #60816	; 0xed90
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:401
        0xE000_ED90 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1ace581b370983ceE:

00000000 <_ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1ace581b370983ceE>:
_ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h1ace581b370983ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:407
}

impl ops::Deref for MPU {
    type Target = self::mpu::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5090 	movw	r0, #60816	; 0xed90
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:409
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4NVIC3ptr17h6854e775d2184fa6E:

00000000 <_ZN8cortex_m10peripheral4NVIC3ptr17h6854e775d2184fa6E>:
_ZN8cortex_m10peripheral4NVIC3ptr17h6854e775d2184fa6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:421

unsafe impl Send for NVIC {}

impl NVIC {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const nvic::RegisterBlock {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:423
        0xE000_E100 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17hcd336525a611e6fbE:

00000000 <_ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17hcd336525a611e6fbE>:
_ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17hcd336525a611e6fbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:429
}

impl ops::Deref for NVIC {
    type Target = self::nvic::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:431
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3SCB3ptr17h1917a53812942244E:

00000000 <_ZN8cortex_m10peripheral3SCB3ptr17h1917a53812942244E>:
_ZN8cortex_m10peripheral3SCB3ptr17h1917a53812942244E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:443

unsafe impl Send for SCB {}

impl SCB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const scb::RegisterBlock {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:445
        0xE000_ED04 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h33362447562b94b2E:

00000000 <_ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h33362447562b94b2E>:
_ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h33362447562b94b2E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:451
}

impl ops::Deref for SCB {
    type Target = self::scb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:453
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4SYST3ptr17h427d260fe52bd48aE:

00000000 <_ZN8cortex_m10peripheral4SYST3ptr17h427d260fe52bd48aE>:
_ZN8cortex_m10peripheral4SYST3ptr17h427d260fe52bd48aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:465

unsafe impl Send for SYST {}

impl SYST {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const syst::RegisterBlock {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:467
        0xE000_E010 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9f8f918fe2a9da25E:

00000000 <_ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9f8f918fe2a9da25E>:
_ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9f8f918fe2a9da25E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:473
}

impl ops::Deref for SYST {
    type Target = self::syst::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:475
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4TPIU3ptr17h305400f7bc28ccefE:

00000000 <_ZN8cortex_m10peripheral4TPIU3ptr17h305400f7bc28ccefE>:
_ZN8cortex_m10peripheral4TPIU3ptr17h305400f7bc28ccefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:488
unsafe impl Send for TPIU {}

#[cfg(not(armv6m))]
impl TPIU {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const tpiu::RegisterBlock {
   0:	2000      	movs	r0, #0
   2:	f2ce 0004 	movt	r0, #57348	; 0xe004
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:490
        0xE004_0000 as *const _
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h68d23d8a47ad71bbE:

00000000 <_ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h68d23d8a47ad71bbE>:
_ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h68d23d8a47ad71bbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:497

#[cfg(not(armv6m))]
impl ops::Deref for TPIU {
    type Target = self::tpiu::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	2000      	movs	r0, #0
   2:	f2ce 0004 	movt	r0, #57348	; 0xe004
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:499
        unsafe { &*Self::ptr() }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control4bits17h01ec71ce9f9a3928E:

00000000 <_ZN8cortex_m8register7control7Control4bits17h01ec71ce9f9a3928E>:
_ZN8cortex_m8register7control7Control4bits17h01ec71ce9f9a3928E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:12
}

impl Control {
    /// Returns the contents of the register as raw bits
    pub fn bits(&self) -> u32 {
        self.bits
   0:	6800      	ldr	r0, [r0, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:13
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control5npriv17he2aeb5570818d0f1E:

00000000 <_ZN8cortex_m8register7control7Control5npriv17he2aeb5570818d0f1E>:
_ZN8cortex_m8register7control7Control5npriv17he2aeb5570818d0f1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:17

    /// Thread mode privilege level
    pub fn npriv(&self) -> Npriv {
        if self.bits & (1 << 0) == (1 << 0) {
   0:	6800      	ldr	r0, [r0, #0]
   2:	f000 0001 	and.w	r0, r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:22
            Npriv::Unprivileged
        } else {
            Npriv::Privileged
        }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control5spsel17h0b93dfb07a8f7753E:

00000000 <_ZN8cortex_m8register7control7Control5spsel17h0b93dfb07a8f7753E>:
_ZN8cortex_m8register7control7Control5spsel17h0b93dfb07a8f7753E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:26

    /// Currently active stack pointer
    pub fn spsel(&self) -> Spsel {
        if self.bits & (1 << 1) == (1 << 1) {
   0:	7800      	ldrb	r0, [r0, #0]
   2:	f3c0 0040 	ubfx	r0, r0, #1, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:31
            Spsel::Psp
        } else {
            Spsel::Msp
        }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control4fpca17h7e94368e99233137E:

00000000 <_ZN8cortex_m8register7control7Control4fpca17h7e94368e99233137E>:
_ZN8cortex_m8register7control7Control4fpca17h7e94368e99233137E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:35

    /// Whether context floating-point is currently active
    pub fn fpca(&self) -> Fpca {
        if self.bits & (1 << 2) == (1 << 2) {
   0:	7800      	ldrb	r0, [r0, #0]
   2:	2101      	movs	r1, #1
   4:	f000 0004 	and.w	r0, r0, #4
   8:	ea81 0090 	eor.w	r0, r1, r0, lsr #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:40
            Fpca::Active
        } else {
            Fpca::NotActive
        }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E:

00000000 <_ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E>:
_ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:96
    NotActive,
}

impl Fpca {
    /// Is a floating-point context active?
    pub fn is_active(&self) -> bool {
   0:	7800      	ldrb	r0, [r0, #0]
_ZN74_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..cmp..PartialEq$GT$2eq17h5c86c3ef0999a0cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:86
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   2:	fab0 f080 	clz	r0, r0
   6:	0940      	lsrs	r0, r0, #5
_ZN8cortex_m8register7control4Fpca9is_active17hc90869dfa7e78124E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:98
        *self == Fpca::Active
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E:

00000000 <_ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E>:
_ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:101

    /// Is a floating-point context not active?
    pub fn is_not_active(&self) -> bool {
   0:	7800      	ldrb	r0, [r0, #0]
_ZN74_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..cmp..PartialEq$GT$2eq17h5c86c3ef0999a0cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:86
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   2:	3801      	subs	r0, #1
   4:	fab0 f080 	clz	r0, r0
   8:	0940      	lsrs	r0, r0, #5
_ZN8cortex_m8register7control4Fpca13is_not_active17hc0385d69b71f57c6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:103
        *self == Fpca::NotActive
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E:

00000000 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E>:
_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:191
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	3801      	subs	r0, #1
   8:	2807      	cmp	r0, #7
   a:	d80c      	bhi.n	26 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x26>
   c:	e8df f000 	tbb	[pc, r0]
  10:	20191204 	.word	0x20191204
  14:	3c342d27 	.word	0x3c342d27
  18:	ac01      	add	r4, sp, #4
  1a:	f240 0200 	movw	r2, #0
  1e:	f2c0 0200 	movt	r2, #0
  22:	2309      	movs	r3, #9
  24:	e036      	b.n	94 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x94>
  26:	ac01      	add	r4, sp, #4
  28:	f240 0200 	movw	r2, #0
  2c:	f2c0 0200 	movt	r2, #0
  30:	230e      	movs	r3, #14
  32:	e02f      	b.n	94 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x94>
  34:	ac01      	add	r4, sp, #4
  36:	f240 0200 	movw	r2, #0
  3a:	f2c0 0200 	movt	r2, #0
  3e:	2310      	movs	r3, #16
  40:	e028      	b.n	94 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x94>
  42:	ac01      	add	r4, sp, #4
  44:	f240 0200 	movw	r2, #0
  48:	f2c0 0200 	movt	r2, #0
  4c:	2308      	movs	r3, #8
  4e:	e021      	b.n	94 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x94>
  50:	ac01      	add	r4, sp, #4
  52:	f240 0200 	movw	r2, #0
  56:	f2c0 0200 	movt	r2, #0
  5a:	230a      	movs	r3, #10
  5c:	e01a      	b.n	94 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x94>
  5e:	f240 0200 	movw	r2, #0
  62:	ac01      	add	r4, sp, #4
  64:	f2c0 0200 	movt	r2, #0
  68:	e00b      	b.n	82 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x82>
  6a:	ac01      	add	r4, sp, #4
  6c:	f240 0200 	movw	r2, #0
  70:	f2c0 0200 	movt	r2, #0
  74:	230c      	movs	r3, #12
  76:	e00d      	b.n	94 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x94>
  78:	f240 0200 	movw	r2, #0
  7c:	ac01      	add	r4, sp, #4
  7e:	f2c0 0200 	movt	r2, #0
  82:	4620      	mov	r0, r4
  84:	2306      	movs	r3, #6
  86:	e006      	b.n	96 <_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bfa356c10b3b836E+0x96>
  88:	ac01      	add	r4, sp, #4
  8a:	f240 0200 	movw	r2, #0
  8e:	f2c0 0200 	movt	r2, #0
  92:	2307      	movs	r3, #7
  94:	4620      	mov	r0, r4
  96:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  9a:	4620      	mov	r0, r4
  9c:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  a0:	b004      	add	sp, #16
  a2:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E:

00000000 <_ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E>:
_ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:255
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b086      	sub	sp, #24
   4:	4604      	mov	r4, r0
   6:	7800      	ldrb	r0, [r0, #0]
   8:	2801      	cmp	r0, #1
   a:	d01f      	beq.n	4c <_ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E+0x4c>
   c:	2802      	cmp	r0, #2
   e:	d135      	bne.n	7c <_ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h21378c3eba1a6166E+0x7c>
  10:	ad02      	add	r5, sp, #8
  12:	f240 0200 	movw	r2, #0
  16:	f2c0 0200 	movt	r2, #0
  1a:	2309      	movs	r3, #9
  1c:	4628      	mov	r0, r5
  1e:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter12debug_struct17h0a14031b095ee1baE>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:266
        irqn: u8,
  22:	1c60      	adds	r0, r4, #1
  24:	9005      	str	r0, [sp, #20]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:255
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
  26:	f240 0000 	movw	r0, #0
  2a:	f240 0100 	movw	r1, #0
  2e:	f2c0 0000 	movt	r0, #0
  32:	ab05      	add	r3, sp, #20
  34:	9000      	str	r0, [sp, #0]
  36:	f2c0 0100 	movt	r1, #0
  3a:	4628      	mov	r0, r5
  3c:	2204      	movs	r2, #4
  3e:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders11DebugStruct5field17h80023aaf54882542E>
  42:	4628      	mov	r0, r5
  44:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders11DebugStruct6finish17h9090cd1e84004b71E>
  48:	b006      	add	sp, #24
  4a:	bdb0      	pop	{r4, r5, r7, pc}
  4c:	ad02      	add	r5, sp, #8
  4e:	f240 0200 	movw	r2, #0
  52:	f2c0 0200 	movt	r2, #0
  56:	2309      	movs	r3, #9
  58:	4628      	mov	r0, r5
  5a:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  5e:	f240 0200 	movw	r2, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:261
    Exception(Exception),
  62:	1c60      	adds	r0, r4, #1
  64:	a905      	add	r1, sp, #20
  66:	9005      	str	r0, [sp, #20]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:255
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
  68:	f2c0 0200 	movt	r2, #0
  6c:	4628      	mov	r0, r5
  6e:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple5field17h7da5ac79cde13c49E>
  72:	4628      	mov	r0, r5
  74:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  78:	b006      	add	sp, #24
  7a:	bdb0      	pop	{r4, r5, r7, pc}
  7c:	ac02      	add	r4, sp, #8
  7e:	f240 0200 	movw	r2, #0
  82:	f2c0 0200 	movt	r2, #0
  86:	230a      	movs	r3, #10
  88:	4620      	mov	r0, r4
  8a:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  8e:	4620      	mov	r0, r4
  90:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  94:	b006      	add	sp, #24
  96:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E:

00000000 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E>:
_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:693
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	3801      	subs	r0, #1
   8:	2805      	cmp	r0, #5
   a:	d80b      	bhi.n	24 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E+0x24>
   c:	e8df f000 	tbb	[pc, r0]
  10:	1e181103 	.word	0x1e181103
  14:	2d25      	.short	0x2d25
  16:	ac01      	add	r4, sp, #4
  18:	f240 0200 	movw	r2, #0
  1c:	f2c0 0200 	movt	r2, #0
  20:	2308      	movs	r3, #8
  22:	e028      	b.n	76 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E+0x76>
  24:	ac01      	add	r4, sp, #4
  26:	f240 0200 	movw	r2, #0
  2a:	f2c0 0200 	movt	r2, #0
  2e:	2310      	movs	r3, #16
  30:	e021      	b.n	76 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E+0x76>
  32:	ac01      	add	r4, sp, #4
  34:	f240 0200 	movw	r2, #0
  38:	f2c0 0200 	movt	r2, #0
  3c:	230a      	movs	r3, #10
  3e:	e01a      	b.n	76 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E+0x76>
  40:	f240 0200 	movw	r2, #0
  44:	ac01      	add	r4, sp, #4
  46:	f2c0 0200 	movt	r2, #0
  4a:	e00b      	b.n	64 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E+0x64>
  4c:	ac01      	add	r4, sp, #4
  4e:	f240 0200 	movw	r2, #0
  52:	f2c0 0200 	movt	r2, #0
  56:	230c      	movs	r3, #12
  58:	e00d      	b.n	76 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E+0x76>
  5a:	f240 0200 	movw	r2, #0
  5e:	ac01      	add	r4, sp, #4
  60:	f2c0 0200 	movt	r2, #0
  64:	4620      	mov	r0, r4
  66:	2306      	movs	r3, #6
  68:	e006      	b.n	78 <_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf9f4c6feb90fdd4E+0x78>
  6a:	ac01      	add	r4, sp, #4
  6c:	f240 0200 	movw	r2, #0
  70:	f2c0 0200 	movt	r2, #0
  74:	2307      	movs	r3, #7
  76:	4620      	mov	r0, r4
  78:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  7c:	4620      	mov	r0, r4
  7e:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  82:	b004      	add	sp, #16
  84:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E:

00000000 <_ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E>:
_ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:21
#[derive(Clone, Copy, Debug)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <_ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	2308      	movs	r3, #8
  18:	e005      	b.n	26 <_ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h4933d7c02ef1ca55E+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	2304      	movs	r3, #4
  26:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe10d2570ed027a4E:

00000000 <_ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe10d2570ed027a4E>:
_ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe10d2570ed027a4E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:4
#[derive(Clone, Copy, Debug)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	ad01      	add	r5, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	4604      	mov	r4, r0
   c:	f2c0 0200 	movt	r2, #0
  10:	4628      	mov	r0, r5
  12:	2307      	movs	r3, #7
  14:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter12debug_struct17h0a14031b095ee1baE>
  18:	f240 0000 	movw	r0, #0
  1c:	f240 0100 	movw	r1, #0
  20:	f2c0 0000 	movt	r0, #0
  24:	ab03      	add	r3, sp, #12
  26:	9000      	str	r0, [sp, #0]
  28:	f2c0 0100 	movt	r1, #0
  2c:	4628      	mov	r0, r5
  2e:	2204      	movs	r2, #4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:6
    bits: u32,
  30:	9403      	str	r4, [sp, #12]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:4
#[derive(Clone, Copy, Debug)]
  32:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders11DebugStruct5field17h80023aaf54882542E>
  36:	4628      	mov	r0, r5
  38:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders11DebugStruct6finish17h9090cd1e84004b71E>
  3c:	b004      	add	sp, #16
  3e:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E:

00000000 <_ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E>:
_ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:44
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <_ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	230c      	movs	r3, #12
  18:	e005      	b.n	26 <_ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f8e049d52ee45a3E+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	230a      	movs	r3, #10
  26:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E:

00000000 <_ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E>:
_ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:65
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d104      	bne.n	16 <_ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E+0x16>
   c:	f240 0200 	movw	r2, #0
  10:	f2c0 0200 	movt	r2, #0
  14:	e003      	b.n	a <_ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h18e8d2c196757fa8E+0xa>
  16:	f240 0200 	movw	r2, #0
  1a:	f2c0 0200 	movt	r2, #0
  1e:	4620      	mov	r0, r4
  20:	2303      	movs	r3, #3
  22:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  26:	4620      	mov	r0, r4
  28:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  2c:	b004      	add	sp, #16
  2e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE:

00000000 <_ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE>:
_ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:86
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <_ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	2309      	movs	r3, #9
  18:	e005      	b.n	26 <_ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17h09edd62c950362cfE+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	2306      	movs	r3, #6
  26:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE:

00000000 <_ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE>:
_ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/primask.rs:4
//! Priority mask register

/// All exceptions with configurable priority are ...
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <_ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	2308      	movs	r3, #8
  18:	e005      	b.n	26 <_ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0c6307a2d04346eE+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	2306      	movs	r3, #6
  26:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

cortex_m-5ceb40aab82f5192.cortex_m.cxh8woth-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cortex_m.cxh8woth-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
000000fd l       .debug_str	00000000 
0000010c l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
00000127 l       .debug_str	00000000 
00000130 l       .debug_str	00000000 
0000013b l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
0000014f l       .debug_str	00000000 
00000156 l       .debug_str	00000000 
0000015e l       .debug_str	00000000 
00000168 l       .debug_str	00000000 
00000176 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
00000183 l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
000001b5 l       .debug_str	00000000 
000001c8 l       .debug_str	00000000 
000001cc l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001dd l       .debug_str	00000000 
000001e3 l       .debug_str	00000000 
000001e8 l       .debug_str	00000000 
000001f8 l       .debug_str	00000000 
0000020a l       .debug_str	00000000 
00000243 l       .debug_str	00000000 
0000024c l       .debug_str	00000000 
00000251 l       .debug_str	00000000 
0000026b l       .debug_str	00000000 
0000027d l       .debug_str	00000000 
00000286 l       .debug_str	00000000 
0000028e l       .debug_str	00000000 
00000296 l       .debug_str	00000000 
00000298 l       .debug_str	00000000 
000002d7 l       .debug_str	00000000 
000002eb l       .debug_str	00000000 
00000307 l       .debug_str	00000000 
00000309 l       .debug_str	00000000 
0000030d l       .debug_str	00000000 
00000316 l       .debug_str	00000000 
0000032b l       .debug_str	00000000 
000003bd l       .debug_str	00000000 
000003c9 l       .debug_str	00000000 
000003cb l       .debug_str	00000000 
000003fc l       .debug_str	00000000 
00000410 l       .debug_str	00000000 
00000414 l       .debug_str	00000000 
0000041d l       .debug_str	00000000 
00000456 l       .debug_str	00000000 
0000045f l       .debug_str	00000000 
00000467 l       .debug_str	00000000 
0000046e l       .debug_str	00000000 
00000471 l       .debug_str	00000000 
0000047b l       .debug_str	00000000 
00000492 l       .debug_str	00000000 
00000496 l       .debug_str	00000000 
000004d3 l       .debug_str	00000000 
000004dd l       .debug_str	00000000 
000004e8 l       .debug_str	00000000 
00000526 l       .debug_str	00000000 
0000053f l       .debug_str	00000000 
00000545 l       .debug_str	00000000 
0000054b l       .debug_str	00000000 
00000571 l       .debug_str	00000000 
00000575 l       .debug_str	00000000 
00000579 l       .debug_str	00000000 
00000580 l       .debug_str	00000000 
00000592 l       .debug_str	00000000 
000005a3 l       .debug_str	00000000 
000005a7 l       .debug_str	00000000 
000005e6 l       .debug_str	00000000 
000005f4 l       .debug_str	00000000 
0000067f l       .debug_str	00000000 
00000683 l       .debug_str	00000000 
000006c2 l       .debug_str	00000000 
000006d2 l       .debug_str	00000000 
0000075f l       .debug_str	00000000 
00000763 l       .debug_str	00000000 
0000078c l       .debug_str	00000000 
00000790 l       .debug_str	00000000 
000007cf l       .debug_str	00000000 
000007dc l       .debug_str	00000000 
00000866 l       .debug_str	00000000 
0000088f l       .debug_str	00000000 
00000893 l       .debug_str	00000000 
000008d1 l       .debug_str	00000000 
000008dc l       .debug_str	00000000 
00000923 l       .debug_str	00000000 
00000938 l       .debug_str	00000000 
0000093b l       .debug_str	00000000 
00000965 l       .debug_str	00000000 
00000996 l       .debug_str	00000000 
000009a9 l       .debug_str	00000000 
000009b1 l       .debug_str	00000000 
000009c0 l       .debug_str	00000000 
000009d1 l       .debug_str	00000000 
00000a0a l       .debug_str	00000000 
00000a12 l       .debug_str	00000000 
00000a2b l       .debug_str	00000000 
00000a32 l       .debug_str	00000000 
00000a70 l       .debug_str	00000000 
00000a7a l       .debug_str	00000000 
00000a95 l       .debug_str	00000000 
00000a99 l       .debug_str	00000000 
00000a9f l       .debug_str	00000000 
00000aa3 l       .debug_str	00000000 
00000aa7 l       .debug_str	00000000 
00000aab l       .debug_str	00000000 
00000aaf l       .debug_str	00000000 
00000ab3 l       .debug_str	00000000 
00000ab8 l       .debug_str	00000000 
00000abd l       .debug_str	00000000 
00000ac2 l       .debug_str	00000000 
00000ace l       .debug_str	00000000 
00000b42 l       .debug_str	00000000 
00000bb1 l       .debug_str	00000000 
00000bc1 l       .debug_str	00000000 
00000c2c l       .debug_str	00000000 
00000c38 l       .debug_str	00000000 
00000c43 l       .debug_str	00000000 
00000c47 l       .debug_str	00000000 
00000c51 l       .debug_str	00000000 
00000c56 l       .debug_str	00000000 
00000c61 l       .debug_str	00000000 
00000c9a l       .debug_str	00000000 
00000ca2 l       .debug_str	00000000 
00000d0f l       .debug_str	00000000 
00000d7e l       .debug_str	00000000 
00000dea l       .debug_str	00000000 
00000dec l       .debug_str	00000000 
00000e56 l       .debug_str	00000000 
00000e61 l       .debug_str	00000000 
00000ed2 l       .debug_str	00000000 
00000ee4 l       .debug_str	00000000 
00000ee9 l       .debug_str	00000000 
00000f55 l       .debug_str	00000000 
00000f62 l       .debug_str	00000000 
00000fce l       .debug_str	00000000 
00000fdb l       .debug_str	00000000 
00001047 l       .debug_str	00000000 
00001054 l       .debug_str	00000000 
00001094 l       .debug_str	00000000 
0000109a l       .debug_str	00000000 
000010cf l       .debug_str	00000000 
000010d4 l       .debug_str	00000000 
000010db l       .debug_str	00000000 
000010e2 l       .debug_str	00000000 
000010e9 l       .debug_str	00000000 
000010f2 l       .debug_str	00000000 
000010f9 l       .debug_str	00000000 
00001101 l       .debug_str	00000000 
00001106 l       .debug_str	00000000 
0000110e l       .debug_str	00000000 
00001110 l       .debug_str	00000000 
00001115 l       .debug_str	00000000 
0000111a l       .debug_str	00000000 
00001123 l       .debug_str	00000000 
0000112c l       .debug_str	00000000 
00001137 l       .debug_str	00000000 
0000114b l       .debug_str	00000000 
0000114f l       .debug_str	00000000 
00001157 l       .debug_str	00000000 
0000115b l       .debug_str	00000000 
00001169 l       .debug_str	00000000 
00001199 l       .debug_str	00000000 
000011fe l       .debug_str	00000000 
00001204 l       .debug_str	00000000 
0000122e l       .debug_str	00000000 
00001264 l       .debug_str	00000000 
00001269 l       .debug_str	00000000 
0000126e l       .debug_str	00000000 
00001279 l       .debug_str	00000000 
0000127e l       .debug_str	00000000 
00001289 l       .debug_str	00000000 
0000128e l       .debug_str	00000000 
00001299 l       .debug_str	00000000 
0000129e l       .debug_str	00000000 
000012a9 l       .debug_str	00000000 
000012ae l       .debug_str	00000000 
000012b9 l       .debug_str	00000000 
000012bd l       .debug_str	00000000 
000012ee l       .debug_str	00000000 
00001354 l       .debug_str	00000000 
0000137f l       .debug_str	00000000 
000013b4 l       .debug_str	00000000 
000013b9 l       .debug_str	00000000 
000013be l       .debug_str	00000000 
000013c4 l       .debug_str	00000000 
000013c8 l       .debug_str	00000000 
000013cd l       .debug_str	00000000 
000013d3 l       .debug_str	00000000 
000013d8 l       .debug_str	00000000 
000013dd l       .debug_str	00000000 
000013e2 l       .debug_str	00000000 
000013e8 l       .debug_str	00000000 
000013ed l       .debug_str	00000000 
000013f2 l       .debug_str	00000000 
000013fd l       .debug_str	00000000 
00001403 l       .debug_str	00000000 
00001433 l       .debug_str	00000000 
00001498 l       .debug_str	00000000 
000014c2 l       .debug_str	00000000 
000014e1 l       .debug_str	00000000 
00001500 l       .debug_str	00000000 
0000150f l       .debug_str	00000000 
00001514 l       .debug_str	00000000 
0000151a l       .debug_str	00000000 
00001535 l       .debug_str	00000000 
00001551 l       .debug_str	00000000 
00000000 l     O .rodata..Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E	0000001c .Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb7cbp_new17h15635938c3d3811fE	00000000 .text._ZN8cortex_m10peripheral3scb7cbp_new17h15635938c3d3811fE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h2e07921eea80f09cE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h2e07921eea80f09cE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E
00000000 l    d  .text._ZN8cortex_m10peripheral11Peripherals5steal17h7838719c0cd622a4E	00000000 .text._ZN8cortex_m10peripheral11Peripherals5steal17h7838719c0cd622a4E
00000000 l    d  .text._ZN8cortex_m10peripheral3DWT3ptr17h0dee2e8c6bc0c32aE	00000000 .text._ZN8cortex_m10peripheral3DWT3ptr17h0dee2e8c6bc0c32aE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h858e146a04d57a27E	00000000 .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h858e146a04d57a27E
00000000 l    d  .text._ZN8cortex_m10peripheral4NVIC3ptr17h28c8b367916d1a3cE	00000000 .text._ZN8cortex_m10peripheral4NVIC3ptr17h28c8b367916d1a3cE
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17h44149804d2682f74E	00000000 .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17h44149804d2682f74E
00000000 l    d  .text._ZN8cortex_m10peripheral3SCB3ptr17h10d6a89216a8857cE	00000000 .text._ZN8cortex_m10peripheral3SCB3ptr17h10d6a89216a8857cE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h2b71cc4d5e9c0cd6E	00000000 .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h2b71cc4d5e9c0cd6E
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 CORE_PERIPHERALS
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h858e146a04d57a27E	0000000a _ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h858e146a04d57a27E
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h2b71cc4d5e9c0cd6E	0000000a _ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h2b71cc4d5e9c0cd6E
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17h44149804d2682f74E	0000000a _ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17h44149804d2682f74E
00000000 g     F .text._ZN8cortex_m10peripheral11Peripherals5steal17h7838719c0cd622a4E	0000000e _ZN8cortex_m10peripheral11Peripherals5steal17h7838719c0cd622a4E
00000000 g     F .text._ZN8cortex_m10peripheral3DWT3ptr17h0dee2e8c6bc0c32aE	0000000a _ZN8cortex_m10peripheral3DWT3ptr17h0dee2e8c6bc0c32aE
00000000 g     F .text._ZN8cortex_m10peripheral3SCB3ptr17h10d6a89216a8857cE	0000000a _ZN8cortex_m10peripheral3SCB3ptr17h10d6a89216a8857cE
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E	0000000c _ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E	00000012 _ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E	00000010 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E	00000062 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE	00000010 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h2e07921eea80f09cE	0000001a _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h2e07921eea80f09cE
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E	0000001a _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E	00000026 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E	00000012 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE	00000012 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E	00000010 _ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E
00000000 g     F .text._ZN8cortex_m10peripheral3scb7cbp_new17h15635938c3d3811fE	00000002 _ZN8cortex_m10peripheral3scb7cbp_new17h15635938c3d3811fE
00000000 g     F .text._ZN8cortex_m10peripheral4NVIC3ptr17h28c8b367916d1a3cE	0000000a _ZN8cortex_m10peripheral4NVIC3ptr17h28c8b367916d1a3cE
00000000         *UND*	00000000 __dsb
00000000         *UND*	00000000 __nop



Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E:

00000000 <_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:39

pub use cortex_m_0_6::peripheral::dwt::Comparator;

impl DWT {
    /// Enables the cycle counter
    pub fn enable_cycle_counter(&mut self) {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h00e65bd62f52ef3cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter28_$u7b$$u7b$closure$u7d$$u7d$17hb98c075c229ec5a1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:40
        unsafe { self.ctrl.modify(|r| r | 1) }
   a:	f041 0101 	orr.w	r1, r1, #1
_ZN4core3ptr14write_volatile17hdc7df0c6d248e87aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h0ee04b37f3c1c4e6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:41
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E:

00000000 <_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:44

    /// Returns the current clock cycle count
    pub fn get_cycle_count() -> u32 {
   0:	f241 0004 	movw	r0, #4100	; 0x1004
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h00e65bd62f52ef3cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h9cda626c8bccee30E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:47
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).cyccnt.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:156
    }
}

impl SCB {
    /// Returns the active exception number
    pub fn vect_active() -> VectActive {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core10intrinsics19copy_nonoverlapping17h49fc411cd27536ccE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:159
        let icsr = unsafe { ptr::read(&(*SCB::ptr()).icsr as *const _ as *const u32) };

        match icsr as u8 {
   a:	b2c2      	uxtb	r2, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:160
            0 => VectActive::ThreadMode,
   c:	2a0f      	cmp	r2, #15
   e:	d80c      	bhi.n	2a <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h9e25731fa0755610E+0x2a>
  10:	e8df f002 	tbb	[pc, r2]
  14:	0f080b0e 	.word	0x0f080b0e
  18:	0b181512 	.word	0x0b181512
  1c:	1b0b0b0b 	.word	0x1b0b0b0b
  20:	24210b1e 	.word	0x24210b1e
  24:	2001      	movs	r0, #1
  26:	2100      	movs	r1, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:178
            12 => VectActive::Exception(Exception::DebugMonitor),
            14 => VectActive::Exception(Exception::PendSV),
            15 => VectActive::Exception(Exception::SysTick),
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
        }
    }
  28:	4770      	bx	lr
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:176
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
  2a:	f1a0 0110 	sub.w	r1, r0, #16
  2e:	2002      	movs	r0, #2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:178
    }
  30:	4770      	bx	lr
  32:	2101      	movs	r1, #1
  34:	2001      	movs	r0, #1
  36:	4770      	bx	lr
  38:	2001      	movs	r0, #1
  3a:	2102      	movs	r1, #2
  3c:	4770      	bx	lr
  3e:	2001      	movs	r0, #1
  40:	2103      	movs	r1, #3
  42:	4770      	bx	lr
  44:	2001      	movs	r0, #1
  46:	2104      	movs	r1, #4
  48:	4770      	bx	lr
  4a:	2001      	movs	r0, #1
  4c:	2105      	movs	r1, #5
  4e:	4770      	bx	lr
  50:	2001      	movs	r0, #1
  52:	2106      	movs	r1, #6
  54:	4770      	bx	lr
  56:	2001      	movs	r0, #1
  58:	2107      	movs	r1, #7
  5a:	4770      	bx	lr
  5c:	2001      	movs	r0, #1
  5e:	2108      	movs	r1, #8
  60:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb7cbp_new17h15635938c3d3811fE:

00000000 <_ZN8cortex_m10peripheral3scb7cbp_new17h15635938c3d3811fE>:
_ZN8cortex_m10peripheral3scb7cbp_new17h15635938c3d3811fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:195
use self::scb_consts::*;

#[cfg(not(armv6m))]
unsafe fn cbp_new() -> CBP {
    core::mem::transmute(())
}
   0:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:477

const SCB_SCR_SLEEPDEEP: u32 = 0x1 << 2;

impl SCB {
    /// Set the SLEEPDEEP bit in the SCR register
    pub fn set_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h00e65bd62f52ef3cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17h4eba286675a3fb5eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:479
        unsafe {
            self.scr.modify(|scr| scr | SCB_SCR_SLEEPDEEP);
   a:	f041 0104 	orr.w	r1, r1, #4
_ZN4core3ptr14write_volatile17hdc7df0c6d248e87aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h8f6daa9fcb012f84E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:481
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:484

    /// Clear the SLEEPDEEP bit in the SCR register
    pub fn clear_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h00e65bd62f52ef3cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17h29f47a7191f0d3f8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:486
        unsafe {
            self.scr.modify(|scr| scr & !SCB_SCR_SLEEPDEEP);
   a:	f021 0104 	bic.w	r1, r1, #4
_ZN4core3ptr14write_volatile17hdc7df0c6d248e87aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h7dddfabf42d2e2ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:488
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E>:
_ZN8cortex_m3asm3dsb17hf8defc71752d68a1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
        () => unsafe {
            extern "C" {
                fn __dsb();
            }

            __dsb()
   0:	f7ff fffe 	bl	0 <__dsb>
   4:	f64e 500c 	movw	r0, #60684	; 0xed0c
   8:	2204      	movs	r2, #4
   a:	f2ce 0000 	movt	r0, #57344	; 0xe000
   e:	f2c0 52fa 	movt	r2, #1530	; 0x5fa
_ZN4core3ptr13read_volatile17h00e65bd62f52ef3cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  12:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset28_$u7b$$u7b$closure$u7d$$u7d$17he1cbb11d9c316de8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:503
        ::asm::dsb();
        unsafe {
            self.aircr.modify(
                |r| {
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
            r & SCB_AIRCR_PRIGROUP_MASK | // keep priority group unchanged
  14:	f401 61a0 	and.w	r1, r1, #1280	; 0x500
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:502
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
  18:	4311      	orrs	r1, r2
_ZN4core3ptr14write_volatile17hdc7df0c6d248e87aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  1a:	6001      	str	r1, [r0, #0]
_ZN8cortex_m3asm3dsb17hf8defc71752d68a1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
  1c:	f7ff fffe 	bl	0 <__dsb>
_ZN8cortex_m3asm3nop17h618abeb94e3568c9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:76
            __nop()
  20:	f7ff fffe 	bl	0 <__nop>
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:511
            )
        };
        ::asm::dsb();
        loop {
            // wait for the reset
            ::asm::nop(); // avoid rust-lang/rust#28728
  24:	e7fc      	b.n	20 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h3dc8e22a7bd77894E+0x20>

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:524
const SCB_ICSR_PENDSTSET: u32 = 1 << 26;
const SCB_ICSR_PENDSTCLR: u32 = 1 << 25;

impl SCB {
    /// Set the PENDSVSET bit in the ICSR register which will pend the PendSV interrupt
    pub fn set_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 5180 	mov.w	r1, #268435456	; 0x10000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17hdc7df0c6d248e87aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17h80cf3c6408f2e883E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:528
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVSET);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:531

    /// Check if PENDSVSET bit in the ICSR register is set meaning PendSV interrupt is pending
    pub fn is_pendsv_pending() -> bool {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h00e65bd62f52ef3cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf05b169508e1f614E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:532
        unsafe { (*Self::ptr()).icsr.read() & SCB_ICSR_PENDSVSET == SCB_ICSR_PENDSVSET }
   a:	f3c0 7000 	ubfx	r0, r0, #28, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:533
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:536

    /// Set the PENDSVCLR bit in the ICSR register which will clear a pending PendSV interrupt
    pub fn clear_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 6100 	mov.w	r1, #134217728	; 0x8000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17hdc7df0c6d248e87aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h21a18a178566727bE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:540
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVCLR);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h2e07921eea80f09cE:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h2e07921eea80f09cE>:
_ZN8cortex_m10peripheral3scb20system_handler_index17h730ded95566673cdE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:568
}

fn system_handler_index(sh: &SystemHandler) -> u8 {
    match *sh {
        #[cfg(not(armv6m))]
        SystemHandler::MemoryManagement => 4,
   0:	f240 0100 	movw	r1, #0
   4:	b240      	sxtb	r0, r0
   6:	f2c0 0100 	movt	r1, #0
   a:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
   e:	f64e 5118 	movw	r1, #60696	; 0xed18
  12:	f2ce 0100 	movt	r1, #57344	; 0xe000
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h2e07921eea80f09cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:604
            // NOTE(unsafe) atomic read with no side effects
            let shpr = unsafe { (*Self::ptr()).shpr[usize::from((index - 8) / 4)].read() };
            let prio = (shpr >> (8 * (index % 4))) & 0x000000ff;
            prio as u8
        }
    }
  16:	5c40      	ldrb	r0, [r0, r1]
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E:

00000000 <_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E>:
_ZN8cortex_m10peripheral3scb20system_handler_index17h730ded95566673cdE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:568
        SystemHandler::MemoryManagement => 4,
   0:	b248      	sxtb	r0, r1
   2:	f240 0100 	movw	r1, #0
   6:	f2c0 0100 	movt	r1, #0
   a:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
   e:	f64e 5118 	movw	r1, #60696	; 0xed18
  12:	f2ce 0100 	movt	r1, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h829b81ef26ce6ad4E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  16:	5442      	strb	r2, [r0, r1]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h9b42cfbd4289c416E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:636
                let prio = u32::from(prio) << shift;

                (value & !mask) | prio
            });
        }
    }
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral11Peripherals5steal17h7838719c0cd622a4E:

00000000 <_ZN8cortex_m10peripheral11Peripherals5steal17h7838719c0cd622a4E>:
_ZN8cortex_m10peripheral11Peripherals5steal17h7838719c0cd622a4E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:164

    /// Unchecked version of `Peripherals::take`
    pub unsafe fn steal() -> Self {
        debug_assert!(!CORE_PERIPHERALS);

        CORE_PERIPHERALS = true;
   0:	f240 0000 	movw	r0, #0
   4:	2101      	movs	r1, #1
   6:	f2c0 0000 	movt	r0, #0
   a:	7001      	strb	r1, [r0, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:166
        core::mem::transmute(())
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3DWT3ptr17h0dee2e8c6bc0c32aE:

00000000 <_ZN8cortex_m10peripheral3DWT3ptr17h0dee2e8c6bc0c32aE>:
_ZN8cortex_m10peripheral3DWT3ptr17h0dee2e8c6bc0c32aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:180

unsafe impl Send for DWT {}

impl DWT {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const dwt::RegisterBlock {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:182
        0xE000_1000 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h858e146a04d57a27E:

00000000 <_ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h858e146a04d57a27E>:
_ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17h858e146a04d57a27E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:188
}

impl ops::Deref for DWT {
    type Target = self::dwt::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:190
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4NVIC3ptr17h28c8b367916d1a3cE:

00000000 <_ZN8cortex_m10peripheral4NVIC3ptr17h28c8b367916d1a3cE>:
_ZN8cortex_m10peripheral4NVIC3ptr17h28c8b367916d1a3cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:202

unsafe impl Send for NVIC {}

impl NVIC {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const nvic::RegisterBlock {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:204
        0xE000_E100 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17h44149804d2682f74E:

00000000 <_ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17h44149804d2682f74E>:
_ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17h44149804d2682f74E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:210
}

impl ops::Deref for NVIC {
    type Target = self::nvic::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:212
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3SCB3ptr17h10d6a89216a8857cE:

00000000 <_ZN8cortex_m10peripheral3SCB3ptr17h10d6a89216a8857cE>:
_ZN8cortex_m10peripheral3SCB3ptr17h10d6a89216a8857cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:224

unsafe impl Send for SCB {}

impl SCB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const scb::RegisterBlock {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:226
        0xE000_ED04 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h2b71cc4d5e9c0cd6E:

00000000 <_ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h2b71cc4d5e9c0cd6E>:
_ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h2b71cc4d5e9c0cd6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:232
}

impl ops::Deref for SCB {
    type Target = self::scb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:234
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

cstr_core-f252417cbb2ae0c5.cstr_core.4unzpfva-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cstr_core.4unzpfva-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000097 l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000e9 l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
00000107 l       .debug_str	00000000 
0000010d l       .debug_str	00000000 
0000011e l       .debug_str	00000000 
00000138 l       .debug_str	00000000 
0000015e l       .debug_str	00000000 
00000165 l       .debug_str	00000000 
0000016a l       .debug_str	00000000 
00000171 l       .debug_str	00000000 
00000174 l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
00000182 l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
00000191 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019e l       .debug_str	00000000 
000001a6 l       .debug_str	00000000 
000001b0 l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
000001b7 l       .debug_str	00000000 
000001bc l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001ca l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001e0 l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
00000244 l       .debug_str	00000000 
00000246 l       .debug_str	00000000 
0000024c l       .debug_str	00000000 
00000251 l       .debug_str	00000000 
00000256 l       .debug_str	00000000 
0000025c l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
00000269 l       .debug_str	00000000 
0000026e l       .debug_str	00000000 
00000270 l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
00000283 l       .debug_str	00000000 
0000028d l       .debug_str	00000000 
00000291 l       .debug_str	00000000 
00000299 l       .debug_str	00000000 
000002a1 l       .debug_str	00000000 
000002b5 l       .debug_str	00000000 
000002c1 l       .debug_str	00000000 
000002cc l       .debug_str	00000000 
000002d3 l       .debug_str	00000000 
000002d9 l       .debug_str	00000000 
000002dd l       .debug_str	00000000 
000002e3 l       .debug_str	00000000 
000002e9 l       .debug_str	00000000 
000002ec l       .debug_str	00000000 
000002fb l       .debug_str	00000000 
00000302 l       .debug_str	00000000 
00000306 l       .debug_str	00000000 
0000030f l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
00000334 l       .debug_str	00000000 
00000339 l       .debug_str	00000000 
0000034a l       .debug_str	00000000 
00000354 l       .debug_str	00000000 
000003b2 l       .debug_str	00000000 
000003bd l       .debug_str	00000000 
000003da l       .debug_str	00000000 
000003de l       .debug_str	00000000 
000003e6 l       .debug_str	00000000 
000003fd l       .debug_str	00000000 
00000421 l       .debug_str	00000000 
0000043d l       .debug_str	00000000 
00000442 l       .debug_str	00000000 
0000044b l       .debug_str	00000000 
00000452 l       .debug_str	00000000 
0000046b l       .debug_str	00000000 
00000475 l       .debug_str	00000000 
0000048f l       .debug_str	00000000 
000004f6 l       .debug_str	00000000 
000004ff l       .debug_str	00000000 
00000513 l       .debug_str	00000000 
0000051c l       .debug_str	00000000 
00000523 l       .debug_str	00000000 
0000052e l       .debug_str	00000000 
00000533 l       .debug_str	00000000 
0000053e l       .debug_str	00000000 
00000543 l       .debug_str	00000000 
00000549 l       .debug_str	00000000 
0000054b l       .debug_str	00000000 
000005e0 l       .debug_str	00000000 
000005ec l       .debug_str	00000000 
000005f2 l       .debug_str	00000000 
000005f6 l       .debug_str	00000000 
00000603 l       .debug_str	00000000 
00000627 l       .debug_str	00000000 
00000629 l       .debug_str	00000000 
0000062f l       .debug_str	00000000 
00000634 l       .debug_str	00000000 
000006cb l       .debug_str	00000000 
000006d7 l       .debug_str	00000000 
000006d9 l       .debug_str	00000000 
000006de l       .debug_str	00000000 
000006ec l       .debug_str	00000000 
00000711 l       .debug_str	00000000 
00000713 l       .debug_str	00000000 
00000739 l       .debug_str	00000000 
00000741 l       .debug_str	00000000 
00000743 l       .debug_str	00000000 
0000077c l       .debug_str	00000000 
00000792 l       .debug_str	00000000 
0000079d l       .debug_str	00000000 
0000079f l       .debug_str	00000000 
000007ea l       .debug_str	00000000 
000007fa l       .debug_str	00000000 
000007fe l       .debug_str	00000000 
0000080c l       .debug_str	00000000 
00000810 l       .debug_str	00000000 
00000812 l       .debug_str	00000000 
00000814 l       .debug_str	00000000 
0000085b l       .debug_str	00000000 
00000867 l       .debug_str	00000000 
000008bc l       .debug_str	00000000 
000008c6 l       .debug_str	00000000 
000008cd l       .debug_str	00000000 
000008f4 l       .debug_str	00000000 
00000901 l       .debug_str	00000000 
00000905 l       .debug_str	00000000 
00000910 l       .debug_str	00000000 
00000914 l       .debug_str	00000000 
0000094e l       .debug_str	00000000 
0000096d l       .debug_str	00000000 
0000096f l       .debug_str	00000000 
00000971 l       .debug_str	00000000 
00000975 l       .debug_str	00000000 
0000099b l       .debug_str	00000000 
000009a7 l       .debug_str	00000000 
000009b2 l       .debug_str	00000000 
00000a0c l       .debug_str	00000000 
00000a1a l       .debug_str	00000000 
00000ab4 l       .debug_str	00000000 
00000ac5 l       .debug_str	00000000 
00000aea l       .debug_str	00000000 
00000b0a l       .debug_str	00000000 
00000b0f l       .debug_str	00000000 
00000bb8 l       .debug_str	00000000 
00000bc9 l       .debug_str	00000000 
00000bcf l       .debug_str	00000000 
00000c1c l       .debug_str	00000000 
00000c20 l       .debug_str	00000000 
00000c26 l       .debug_str	00000000 
00000c79 l       .debug_str	00000000 
00000c81 l       .debug_str	00000000 
00000c8b l       .debug_str	00000000 
00000d37 l       .debug_str	00000000 
00000d70 l       .debug_str	00000000 
00000d77 l       .debug_str	00000000 
00000d81 l       .debug_str	00000000 
00000d86 l       .debug_str	00000000 
00000d92 l       .debug_str	00000000 
00000d9a l       .debug_str	00000000 
00000da3 l       .debug_str	00000000 
00000da8 l       .debug_str	00000000 
00000dab l       .debug_str	00000000 
00000db4 l       .debug_str	00000000 
00000dbb l       .debug_str	00000000 
00000dbe l       .debug_str	00000000 
00000dc4 l       .debug_str	00000000 
00000dce l       .debug_str	00000000 
00000dd6 l       .debug_str	00000000 
00000ddc l       .debug_str	00000000 
00000de7 l       .debug_str	00000000 
00000df0 l       .debug_str	00000000 
00000e13 l       .debug_str	00000000 
00000e32 l       .debug_str	00000000 
00000e59 l       .debug_str	00000000 
00000e63 l       .debug_str	00000000 
00000e95 l       .debug_str	00000000 
00000e9c l       .debug_str	00000000 
00000ea2 l       .debug_str	00000000 
00000ea7 l       .debug_str	00000000 
00000ed7 l       .debug_str	00000000 
00000ee0 l       .debug_str	00000000 
00000ee6 l       .debug_str	00000000 
00000ef7 l       .debug_str	00000000 
00000efd l       .debug_str	00000000 
00000f80 l       .debug_str	00000000 
00000f8a l       .debug_str	00000000 
00001010 l       .debug_str	00000000 
0000101f l       .debug_str	00000000 
00001021 l       .debug_str	00000000 
00001096 l       .debug_str	00000000 
000010c1 l       .debug_str	00000000 
000010c7 l       .debug_str	00000000 
000010ce l       .debug_str	00000000 
000010d6 l       .debug_str	00000000 
000010df l       .debug_str	00000000 
000010e7 l       .debug_str	00000000 
000010eb l       .debug_str	00000000 
000010fc l       .debug_str	00000000 
00001105 l       .debug_str	00000000 
00001129 l       .debug_str	00000000 
00001133 l       .debug_str	00000000 
0000115b l       .debug_str	00000000 
00001164 l       .debug_str	00000000 
000011ce l       .debug_str	00000000 
00001217 l       .debug_str	00000000 
0000127a l       .debug_str	00000000 
000012ed l       .debug_str	00000000 
00001338 l       .debug_str	00000000 
00001343 l       .debug_str	00000000 
00001349 l       .debug_str	00000000 
0000134f l       .debug_str	00000000 
00001397 l       .debug_str	00000000 
0000139f l       .debug_str	00000000 
000013e6 l       .debug_str	00000000 
000013ef l       .debug_str	00000000 
00001483 l       .debug_str	00000000 
000014e3 l       .debug_str	00000000 
00001571 l       .debug_str	00000000 
00001575 l       .debug_str	00000000 
00001607 l       .debug_str	00000000 
0000164b l       .debug_str	00000000 
000016b8 l       .debug_str	00000000 
00001731 l       .debug_str	00000000 
000017a5 l       .debug_str	00000000 
000017ae l       .debug_str	00000000 
000017ba l       .debug_str	00000000 
000017d5 l       .debug_str	00000000 
000017d7 l       .debug_str	00000000 
00001857 l       .debug_str	00000000 
0000189b l       .debug_str	00000000 
000018da l       .debug_str	00000000 
0000191c l       .debug_str	00000000 
0000192f l       .debug_str	00000000 
00001936 l       .debug_str	00000000 
0000193a l       .debug_str	00000000 
00001972 l       .debug_str	00000000 
00001981 l       .debug_str	00000000 
00001983 l       .debug_str	00000000 
00001987 l       .debug_str	00000000 
000019f7 l       .debug_str	00000000 
00001a04 l       .debug_str	00000000 
00001a0a l       .debug_str	00000000 
00001a10 l       .debug_str	00000000 
00001a9c l       .debug_str	00000000 
00001ab5 l       .debug_str	00000000 
00001aee l       .debug_str	00000000 
00001b24 l       .debug_str	00000000 
00001b63 l       .debug_str	00000000 
00001b6a l       .debug_str	00000000 
00001b93 l       .debug_str	00000000 
00001b9a l       .debug_str	00000000 
00001b9c l       .debug_str	00000000 
00001ba3 l       .debug_str	00000000 
00001bc9 l       .debug_str	00000000 
00001bd0 l       .debug_str	00000000 
00001bd9 l       .debug_str	00000000 
00001c03 l       .debug_str	00000000 
00001c07 l       .debug_str	00000000 
00001c0a l       .debug_str	00000000 
00001c6e l       .debug_str	00000000 
00001c78 l       .debug_str	00000000 
00001c7d l       .debug_str	00000000 
00001cf6 l       .debug_str	00000000 
00001d00 l       .debug_str	00000000 
00001d04 l       .debug_str	00000000 
00001d09 l       .debug_str	00000000 
00001d32 l       .debug_str	00000000 
00001d3d l       .debug_str	00000000 
00001d62 l       .debug_str	00000000 
00001d65 l       .debug_str	00000000 
00001dc7 l       .debug_str	00000000 
00001dcf l       .debug_str	00000000 
00001dd5 l       .debug_str	00000000 
00001dd9 l       .debug_str	00000000 
00001e49 l       .debug_str	00000000 
00001e5d l       .debug_str	00000000 
00001e79 l       .debug_str	00000000 
00001eea l       .debug_str	00000000 
00001efa l       .debug_str	00000000 
00001f59 l       .debug_str	00000000 
00001fba l       .debug_str	00000000 
00001fc2 l       .debug_str	00000000 
0000200a l       .debug_str	00000000 
00002015 l       .debug_str	00000000 
0000205d l       .debug_str	00000000 
00002087 l       .debug_str	00000000 
000020bc l       .debug_str	00000000 
000020f6 l       .debug_str	00000000 
00002174 l       .debug_str	00000000 
0000217e l       .debug_str	00000000 
0000220c l       .debug_str	00000000 
0000225e l       .debug_str	00000000 
000022be l       .debug_str	00000000 
000022c6 l       .debug_str	00000000 
0000232b l       .debug_str	00000000 
0000235b l       .debug_str	00000000 
00002364 l       .debug_str	00000000 
000023a0 l       .debug_str	00000000 
000023b4 l       .debug_str	00000000 
000023b9 l       .debug_str	00000000 
000023cf l       .debug_str	00000000 
000023d1 l       .debug_str	00000000 
0000240c l       .debug_str	00000000 
0000243a l       .debug_str	00000000 
00002441 l       .debug_str	00000000 
00002445 l       .debug_str	00000000 
00002451 l       .debug_str	00000000 
0000245b l       .debug_str	00000000 
00002465 l       .debug_str	00000000 
00002488 l       .debug_str	00000000 
000024dd l       .debug_str	00000000 
000024e0 l       .debug_str	00000000 
00002540 l       .debug_str	00000000 
0000254c l       .debug_str	00000000 
0000259c l       .debug_str	00000000 
000025ff l       .debug_str	00000000 
00002607 l       .debug_str	00000000 
0000262e l       .debug_str	00000000 
00002659 l       .debug_str	00000000 
0000267a l       .debug_str	00000000 
0000267f l       .debug_str	00000000 
00002686 l       .debug_str	00000000 
000026a8 l       .debug_str	00000000 
000026ac l       .debug_str	00000000 
000026b1 l       .debug_str	00000000 
000026b9 l       .debug_str	00000000 
000026c4 l       .debug_str	00000000 
000026cf l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.0	00000010 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.0
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.1	00000010 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.1
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.10	00000015 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.10
00000000 l     O .rodata.cst4	00000004 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.11
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.12	00000010 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.12
00000000 l     O .rodata.cst16	00000010 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.13
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.14	0000000b .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.14
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.15	00000010 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.15
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.3	00000008 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.3
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.4	00000000 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.4
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.5	00000001 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.5
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.6	00000023 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.6
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.7	0000002b .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.7
00000000 l     O .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.9	00000008 .Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.9
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E	0000003a _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE	00000056 _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17hb087783d49e493aaE	00000002 _ZN4core3ptr18real_drop_in_place17hb087783d49e493aaE
00000000 l     O .rodata.str.2	00000055 str.2
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17hb087783d49e493aaE	00000000 .text._ZN4core3ptr18real_drop_in_place17hb087783d49e493aaE
00000000 l    d  .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E	00000000 .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E
00000000 l    d  .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E	00000000 .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E
00000000 l    d  .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E	00000000 .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E
00000000 l    d  .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE	00000000 .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE
00000000 l    d  .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h959646321f957e79E	00000000 .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h959646321f957e79E
00000000 l    d  .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E	00000000 .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E
00000000 l    d  .text._ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E	00000000 .text._ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E
00000000 l    d  .text._ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E	00000000 .text._ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E
00000000 l    d  .text._ZN9cstr_core4CStr6to_str17hd17841c191b739c0E	00000000 .text._ZN9cstr_core4CStr6to_str17hd17841c191b739c0E
00000000 l    d  .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E	00000000 .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E
00000000 l    d  .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E	00000000 .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E
00000000 l    d  .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E	00000000 .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E
00000000 l    d  .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ab348c5ea2fdcdE	00000000 .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ab348c5ea2fdcdE
00000000 l    d  .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE	00000000 .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE
00000000 l    d  .rodata.str.2	00000000 .rodata.str.2
00000000 l    d  .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.2	00000000 .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.2
00000000 l    d  .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.8	00000000 .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.8
00000000 l    d  .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.12	00000000 .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.12
00000000 l    d  .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.15	00000000 .rodata..Lanon.83e3ed55c8b3cd02f32545e3ce8c09ef.15
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E	0000002c _ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E
00000000         *UND*	00000000 _ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h7160b6abac7a3a12E
00000000         *UND*	00000000 _ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h562f60f4fbcc2e1dE
00000000         *UND*	00000000 _ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h27565ff90d14f5eeE
00000000         *UND*	00000000 _ZN4core3fmt8builders10DebugTuple5field17h7da5ac79cde13c49E
00000000         *UND*	00000000 _ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE
00000000         *UND*	00000000 _ZN4core3fmt8builders11DebugStruct5field17h80023aaf54882542E
00000000         *UND*	00000000 _ZN4core3fmt8builders11DebugStruct6finish17h9090cd1e84004b71E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter12debug_struct17h0a14031b095ee1baE
00000000         *UND*	00000000 _ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter9write_fmt17h5196b6ebbbf1f100E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter9write_str17hc5ae27b32f81ec5eE
00000000         *UND*	00000000 _ZN4core3str9from_utf817hd7172c09534810eaE
00000000         *UND*	00000000 _ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E
00000000         *UND*	00000000 _ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E
00000000 g     F .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E	00000050 _ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E
00000000 g     F .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE	000001a2 _ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE
00000000 g     F .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E	0000003e _ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E
00000000         *UND*	00000000 _ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$10write_char17hf153f08ea9d8f018E
00000000 g     F .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E	00000050 _ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E
00000000 g     F .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h959646321f957e79E	0000000c _ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h959646321f957e79E
00000000 g     F .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ab348c5ea2fdcdE	00000040 _ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ab348c5ea2fdcdE
00000000         *UND*	00000000 _ZN6memchr8fallback6memchr17hc97ee43e63623d71E
00000000 g     F .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E	00000082 _ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E
00000000 g     F .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE	00000058 _ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE
00000000 g     F .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E	0000002e _ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E
00000000 g     F .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E	00000016 _ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E
00000000 g     F .text._ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E	00000038 _ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E
00000000 g     F .text._ZN9cstr_core4CStr6to_str17hd17841c191b739c0E	00000018 _ZN9cstr_core4CStr6to_str17hd17841c191b739c0E
00000000 g     F .text._ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E	00000032 _ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E
00000000         *UND*	00000000 memcmp



Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E:

00000000 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h4ad837c30b835d03E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E>
   c:	b128      	cbz	r0, 1a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$usize$GT$3fmt17h562f60f4fbcc2e1dE>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E>
  20:	b128      	cbz	r0, 2e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h67b047cfb94e6342E+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h27565ff90d14f5eeE>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h7160b6abac7a3a12E>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE:

00000000 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	6805      	ldr	r5, [r0, #0]
   6:	ac01      	add	r4, sp, #4
_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
pub struct FromBytesWithNulError {
    kind: FromBytesWithNulErrorKind,
}

#[derive(Clone, PartialEq, Eq, Debug)]
   8:	6828      	ldr	r0, [r5, #0]
   a:	2801      	cmp	r0, #1
   c:	d10c      	bne.n	28 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE+0x28>
   e:	f240 0200 	movw	r2, #0
  12:	4620      	mov	r0, r4
  14:	f2c0 0200 	movt	r2, #0
  18:	2310      	movs	r3, #16
  1a:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  1e:	4620      	mov	r0, r4
  20:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
  24:	b004      	add	sp, #16
  26:	bdb0      	pop	{r4, r5, r7, pc}
_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
  28:	f240 0200 	movw	r2, #0
  2c:	4620      	mov	r0, r4
  2e:	f2c0 0200 	movt	r2, #0
  32:	230b      	movs	r3, #11
  34:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  38:	f240 0200 	movw	r2, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:327
enum FromBytesWithNulErrorKind {
    InteriorNul(usize),
  3c:	1d28      	adds	r0, r5, #4
  3e:	9000      	str	r0, [sp, #0]
  40:	4669      	mov	r1, sp
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
  42:	f2c0 0200 	movt	r2, #0
  46:	4620      	mov	r0, r4
  48:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple5field17h7da5ac79cde13c49E>
  4c:	4620      	mov	r0, r4
  4e:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfbcf69ac94efa7fdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
  52:	b004      	add	sp, #16
  54:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17hb087783d49e493aaE:

00000000 <_ZN4core3ptr18real_drop_in_place17hb087783d49e493aaE>:
_ZN4core3ptr18real_drop_in_place17hb087783d49e493aaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:195
   0:	4770      	bx	lr

Disassembly of section .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E:

00000000 <_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E>:
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:153
        fn next(&mut self) -> Option<u8> {
   0:	e9d0 1200 	ldrd	r1, r2, [r0]
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h68fe3113d57bd970E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
   4:	4291      	cmp	r1, r2
   6:	d210      	bcs.n	2a <_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E+0x2a>
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hb728659da68f1148E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
   8:	2904      	cmp	r1, #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
   a:	f101 0201 	add.w	r2, r1, #1
_ZN4core3ptr5write17h955a1c1713deb5d2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:734
   e:	6002      	str	r2, [r0, #0]
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hb728659da68f1148E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
  10:	bf3f      	itttt	cc
  12:	4408      	addcc	r0, r1
  14:	7a01      	ldrbcc	r1, [r0, #8]
  16:	2001      	movcc	r0, #1
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:155
        }
  18:	4770      	bxcc	lr
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hb728659da68f1148E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
  1a:	f240 0000 	movw	r0, #0
  1e:	2204      	movs	r2, #4
  20:	f2c0 0000 	movt	r0, #0
  24:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
  28:	defe      	udf	#254	; 0xfe
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd0d2793f05c23961E():
  2a:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:155
        }
  2c:	4770      	bx	lr

Disassembly of section .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E:

00000000 <_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E>:
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:156
        fn size_hint(&self) -> (usize, Option<usize>) {
   0:	e9d1 2100 	ldrd	r2, r1, [r1]
   4:	2301      	movs	r3, #1
_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$13steps_between17ha1e310704f7ce508E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:72
   6:	4291      	cmp	r1, r2
   8:	bf98      	it	ls
   a:	4611      	movls	r1, r2
   c:	1a89      	subs	r1, r1, r2
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$9size_hint17heb19e6673602c0dbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:190
   e:	e9c0 1300 	strd	r1, r3, [r0]
  12:	6081      	str	r1, [r0, #8]
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17hcd3ca87ca3c61bf8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:158
        }
  14:	4770      	bx	lr

Disassembly of section .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E:

00000000 <_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E>:
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:161
        fn next_back(&mut self) -> Option<u8> {
   0:	e9d0 2100 	ldrd	r2, r1, [r0]
_ZN4core4iter5range116_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$9next_back17ha70fda89dcac9bffE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:242
   4:	428a      	cmp	r2, r1
   6:	d20f      	bcs.n	28 <_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E+0x28>
_ZN47_$LT$usize$u20$as$u20$core..ops..arith..Sub$GT$3sub17h81f89cb3777c4555E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ops/arith.rs:198
   8:	3901      	subs	r1, #1
_ZN4core4iter5range116_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$9next_back17ha70fda89dcac9bffE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:243
   a:	6041      	str	r1, [r0, #4]
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back28_$u7b$$u7b$closure$u7d$$u7d$17h884b16a02fffd8f5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:162
            self.range.next_back().map(|i| self.data[i])
   c:	2904      	cmp	r1, #4
   e:	bf3f      	itttt	cc
  10:	4408      	addcc	r0, r1
  12:	7a01      	ldrbcc	r1, [r0, #8]
  14:	2001      	movcc	r0, #1
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:163
        }
  16:	4770      	bxcc	lr
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back28_$u7b$$u7b$closure$u7d$$u7d$17h884b16a02fffd8f5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:162
            self.range.next_back().map(|i| self.data[i])
  18:	f240 0000 	movw	r0, #0
  1c:	2204      	movs	r2, #4
  1e:	f2c0 0000 	movt	r0, #0
  22:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
  26:	defe      	udf	#254	; 0xfe
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17ha88926c42de1e6c8E():
  28:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:163
        }
  2a:	4770      	bx	lr

Disassembly of section .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE:

00000000 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE>:
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:670
        s.into_bytes()
    }
}

impl fmt::Debug for CStr {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
   0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   4:	b093      	sub	sp, #76	; 0x4c
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
   6:	f240 0900 	movw	r9, #0
   a:	f10d 0824 	add.w	r8, sp, #36	; 0x24
   e:	f240 0a00 	movw	sl, #0
  12:	4605      	mov	r5, r0
  14:	2000      	movs	r0, #0
  16:	f2c0 0900 	movt	r9, #0
  1a:	460f      	mov	r7, r1
  1c:	900e      	str	r0, [sp, #56]	; 0x38
  1e:	f8cd 9034 	str.w	r9, [sp, #52]	; 0x34
  22:	2601      	movs	r6, #1
  24:	e9cd 000b 	strd	r0, r0, [sp, #44]	; 0x2c
  28:	f2c0 0a00 	movt	sl, #0
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:671
        write!(f, "\"")?;
  2c:	4610      	mov	r0, r2
  2e:	4641      	mov	r1, r8
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  30:	960a      	str	r6, [sp, #40]	; 0x28
  32:	4693      	mov	fp, r2
  34:	f8cd a024 	str.w	sl, [sp, #36]	; 0x24
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:671
  38:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter9write_fmt17h5196b6ebbbf1f100E>
  3c:	2800      	cmp	r0, #0
  3e:	f040 809b 	bne.w	178 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x178>
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
    /// assert_eq!(c_str.to_bytes(), b"foo");
    /// ```
    #[inline]
    pub fn to_bytes(&self) -> &[u8] {
        let bytes = self.to_bytes_with_nul();
        &bytes[..bytes.len() - 1]
  42:	1e78      	subs	r0, r7, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
  44:	2f00      	cmp	r7, #0
  46:	f000 80a8 	beq.w	19a <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x19a>
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17he15ff0ab0841544fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/collect.rs:246
  4a:	ab09      	add	r3, sp, #36	; 0x24
  4c:	f10d 0c0c 	add.w	ip, sp, #12
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h213790be534d7a68E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  50:	182e      	adds	r6, r5, r0
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:672
        for byte in self.to_bytes()
  52:	f108 070c 	add.w	r7, r8, #12
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17he15ff0ab0841544fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/collect.rs:246
  56:	cb0e      	ldmia	r3, {r1, r2, r3}
  58:	f04f 0801 	mov.w	r8, #1
  5c:	e88c 000e 	stmia.w	ip, {r1, r2, r3}
  60:	ab06      	add	r3, sp, #24
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:672
  62:	f10d 0c30 	add.w	ip, sp, #48	; 0x30
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17he15ff0ab0841544fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/collect.rs:246
  66:	cb0e      	ldmia	r3, {r1, r2, r3}
  68:	e88d 000e 	stmia.w	sp, {r1, r2, r3}
  6c:	2100      	movs	r1, #0
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:672
  6e:	ab03      	add	r3, sp, #12
  70:	910b      	str	r1, [sp, #44]	; 0x2c
  72:	e9cd 5609 	strd	r5, r6, [sp, #36]	; 0x24
  76:	910f      	str	r1, [sp, #60]	; 0x3c
  78:	cb0d      	ldmia	r3, {r0, r2, r3}
  7a:	e88c 000d 	stmia.w	ip, {r0, r2, r3}
  7e:	f10d 0c40 	add.w	ip, sp, #64	; 0x40
  82:	e89d 000d 	ldmia.w	sp, {r0, r2, r3}
  86:	e88c 000d 	stmia.w	ip, {r0, r2, r3}
_ZN116_$LT$core..iter..adapters..flatten..FlattenCompat$LT$I$C$U$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b72188f96c1265E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/flatten.rs:216
  8a:	07c8      	lsls	r0, r1, #31
  8c:	d003      	beq.n	96 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x96>
  8e:	e9dd 100c 	ldrd	r1, r0, [sp, #48]	; 0x30
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h68fe3113d57bd970E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  92:	4281      	cmp	r1, r0
  94:	d33f      	bcc.n	116 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x116>
_ZN85_$LT$core..slice..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd3a21e27bbea0ff1E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:3082
  96:	4628      	mov	r0, r5
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:3086
  98:	42b5      	cmp	r5, r6
  9a:	f000 8060 	beq.w	15e <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x15e>
  9e:	7802      	ldrb	r2, [r0, #0]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h213790be534d7a68E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  a0:	1c45      	adds	r5, r0, #1
_ZN4core5slice13Iter$LT$T$GT$14post_inc_start17h5db185810199f78bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:3041
  a2:	9509      	str	r5, [sp, #36]	; 0x24
_ZN9cstr_core5ascii14escape_default17h2fae94eed7d98e17E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:128
            b'\t' => ([b'\\', b't', 0, 0], 2),
  a4:	f1a2 0309 	sub.w	r3, r2, #9
  a8:	2b1e      	cmp	r3, #30
  aa:	d817      	bhi.n	dc <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0xdc>
  ac:	f247 415c 	movw	r1, #29788	; 0x745c
  b0:	2002      	movs	r0, #2
  b2:	e8df f003 	tbb	[pc, r3]
  b6:	1029      	.short	0x1029
  b8:	18231818 	.word	0x18231818
  bc:	18181818 	.word	0x18181818
  c0:	18181818 	.word	0x18181818
  c4:	18181818 	.word	0x18181818
  c8:	18181818 	.word	0x18181818
  cc:	26181818 	.word	0x26181818
  d0:	18181818 	.word	0x18181818
  d4:	0020      	.short	0x0020
  d6:	f646 615c 	movw	r1, #28252	; 0x6e5c
  da:	e014      	b.n	106 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x106>
  dc:	2a5c      	cmp	r2, #92	; 0x5c
  de:	d102      	bne.n	e6 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0xe6>
  e0:	f645 415c 	movw	r1, #23644	; 0x5c5c
  e4:	e00f      	b.n	106 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x106>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:134
            b'\x20'...b'\x7e' => ([c, 0, 0, 0], 1),
  e6:	f1a2 0020 	sub.w	r0, r2, #32
  ea:	b2c0      	uxtb	r0, r0
  ec:	285f      	cmp	r0, #95	; 0x5f
  ee:	d221      	bcs.n	134 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x134>
_ZN116_$LT$core..iter..adapters..flatten..FlattenCompat$LT$I$C$U$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h81b72188f96c1265E():
  f0:	2001      	movs	r0, #1
  f2:	4611      	mov	r1, r2
  f4:	e008      	b.n	108 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x108>
  f6:	f242 715c 	movw	r1, #10076	; 0x275c
  fa:	e004      	b.n	106 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x106>
  fc:	f247 215c 	movw	r1, #29276	; 0x725c
 100:	e001      	b.n	106 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x106>
 102:	f242 215c 	movw	r1, #8796	; 0x225c
 106:	2002      	movs	r0, #2
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/flatten.rs:221
 108:	e9cd 010d 	strd	r0, r1, [sp, #52]	; 0x34
 10c:	2100      	movs	r1, #0
 10e:	e9cd 810b 	strd	r8, r1, [sp, #44]	; 0x2c
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h68fe3113d57bd970E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
 112:	4281      	cmp	r1, r0
 114:	d2bf      	bcs.n	96 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x96>
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hb728659da68f1148E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
 116:	2904      	cmp	r1, #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
 118:	f101 0001 	add.w	r0, r1, #1
_ZN4core3ptr5write17h955a1c1713deb5d2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:734
 11c:	900c      	str	r0, [sp, #48]	; 0x30
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hb728659da68f1148E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
 11e:	d234      	bcs.n	18a <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x18a>
 120:	1878      	adds	r0, r7, r1
 122:	7a01      	ldrb	r1, [r0, #8]
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:676
            f.write_char(byte as char)?;
 124:	4658      	mov	r0, fp
 126:	f7ff fffe 	bl	0 <_ZN57_$LT$core..fmt..Formatter$u20$as$u20$core..fmt..Write$GT$10write_char17hf153f08ea9d8f018E>
 12a:	2101      	movs	r1, #1
 12c:	2800      	cmp	r0, #0
 12e:	f43f afac 	beq.w	8a <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x8a>
 132:	e025      	b.n	180 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x180>
_ZN9cstr_core5ascii14escape_default17h2fae94eed7d98e17E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:135
            _ => ([b'\\', b'x', hexify(c >> 4), hexify(c & 0xf)], 4),
 134:	f002 000f 	and.w	r0, r2, #15
_ZN9cstr_core5ascii14escape_default6hexify17h5688f4d57378cce5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:145
                0...9 => b'0' + b,
 138:	2157      	movs	r1, #87	; 0x57
 13a:	280a      	cmp	r0, #10
 13c:	bf38      	it	cc
 13e:	2130      	movcc	r1, #48	; 0x30
 140:	4408      	add	r0, r1
 142:	2157      	movs	r1, #87	; 0x57
 144:	2aa0      	cmp	r2, #160	; 0xa0
 146:	bf38      	it	cc
 148:	2130      	movcc	r1, #48	; 0x30
 14a:	eb01 1112 	add.w	r1, r1, r2, lsr #4
_ZN9cstr_core5ascii14escape_default17h2fae94eed7d98e17E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:135
            _ => ([b'\\', b'x', hexify(c >> 4), hexify(c & 0xf)], 4),
 14e:	0409      	lsls	r1, r1, #16
 150:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
 154:	f647 015c 	movw	r1, #30812	; 0x785c
 158:	4301      	orrs	r1, r0
 15a:	2004      	movs	r0, #4
 15c:	e7d4      	b.n	108 <_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE+0x108>
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
 15e:	2000      	movs	r0, #0
 160:	a909      	add	r1, sp, #36	; 0x24
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 162:	e9cd 900d 	strd	r9, r0, [sp, #52]	; 0x34
 166:	e9cd 000b 	strd	r0, r0, [sp, #44]	; 0x2c
 16a:	2001      	movs	r0, #1
 16c:	e9cd a009 	strd	sl, r0, [sp, #36]	; 0x24
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17hd2c9e74eab7fcbefE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:678
        write!(f, "\"")
 170:	4658      	mov	r0, fp
 172:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter9write_fmt17h5196b6ebbbf1f100E>
 176:	4606      	mov	r6, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:679
    }
 178:	4630      	mov	r0, r6
 17a:	b013      	add	sp, #76	; 0x4c
 17c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 180:	2601      	movs	r6, #1
 182:	4630      	mov	r0, r6
 184:	b013      	add	sp, #76	; 0x4c
 186:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hb728659da68f1148E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
 18a:	f240 0000 	movw	r0, #0
 18e:	2204      	movs	r2, #4
 190:	f2c0 0000 	movt	r0, #0
 194:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 198:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
 19a:	2100      	movs	r1, #0
 19c:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
 1a0:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h959646321f957e79E:

00000000 <_ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h959646321f957e79E>:
_ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h959646321f957e79E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:686
    }
   0:	f240 0000 	movw	r0, #0
   4:	2101      	movs	r1, #1
   6:	f2c0 0000 	movt	r0, #0
   a:	4770      	bx	lr

Disassembly of section .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E:

00000000 <_ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E>:
_ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:820
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4605      	mov	r5, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:822
            FromBytesWithNulErrorKind::InteriorNul(..) => {
   6:	6800      	ldr	r0, [r0, #0]
   8:	460c      	mov	r4, r1
   a:	2801      	cmp	r0, #1
   c:	d10d      	bne.n	2a <_ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E+0x2a>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:826
                f.write_str("data provided is not nul terminated")?
   e:	f240 0100 	movw	r1, #0
  12:	4620      	mov	r0, r4
  14:	f2c0 0100 	movt	r1, #0
  18:	2223      	movs	r2, #35	; 0x23
  1a:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter9write_str17hc5ae27b32f81ec5eE>
  1e:	2800      	cmp	r0, #0
  20:	bf0c      	ite	eq
  22:	2000      	moveq	r0, #0
  24:	2001      	movne	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:833
    }
  26:	b00a      	add	sp, #40	; 0x28
  28:	bdb0      	pop	{r4, r5, r7, pc}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:823
                f.write_str("data provided contains an interior nul byte")?
  2a:	f240 0100 	movw	r1, #0
  2e:	4620      	mov	r0, r4
  30:	f2c0 0100 	movt	r1, #0
  34:	222b      	movs	r2, #43	; 0x2b
  36:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter9write_str17hc5ae27b32f81ec5eE>
  3a:	4601      	mov	r1, r0
  3c:	2001      	movs	r0, #1
  3e:	b109      	cbz	r1, 44 <_ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E+0x44>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:833
    }
  40:	b00a      	add	sp, #40	; 0x28
  42:	bdb0      	pop	{r4, r5, r7, pc}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:829
        if let FromBytesWithNulErrorKind::InteriorNul(pos) = self.kind {
  44:	6869      	ldr	r1, [r5, #4]
  46:	9101      	str	r1, [sp, #4]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:830
            write!(f, " at byte pos {}", pos)?;
  48:	f240 0100 	movw	r1, #0
  4c:	f2c0 0100 	movt	r1, #0
  50:	9109      	str	r1, [sp, #36]	; 0x24
  52:	a901      	add	r1, sp, #4
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  54:	e9cd 0107 	strd	r0, r1, [sp, #28]
  58:	a908      	add	r1, sp, #32
  5a:	9106      	str	r1, [sp, #24]
  5c:	2100      	movs	r1, #0
  5e:	9105      	str	r1, [sp, #20]
  60:	e9cd 0103 	strd	r0, r1, [sp, #12]
  64:	f240 0000 	movw	r0, #0
  68:	f2c0 0000 	movt	r0, #0
  6c:	a902      	add	r1, sp, #8
  6e:	9002      	str	r0, [sp, #8]
_ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h1d4a67d7c4637383E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:830
  70:	4620      	mov	r0, r4
  72:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter9write_fmt17h5196b6ebbbf1f100E>
  76:	2800      	cmp	r0, #0
  78:	bf0c      	ite	eq
  7a:	2000      	moveq	r0, #0
  7c:	2001      	movne	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:833
    }
  7e:	b00a      	add	sp, #40	; 0x28
  80:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E:

00000000 <_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E>:
_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:895
    pub unsafe fn from_ptr<'a>(ptr: *const c_char) -> &'a CStr {
   0:	2100      	movs	r1, #0
   2:	e004      	b.n	e <_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E+0xe>
_ZN9cstr_core6strlen17h99292b93147c4d5cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
   4:	78d2      	ldrb	r2, [r2, #3]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:50
        n += 1;
   6:	3104      	adds	r1, #4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
   8:	2a00      	cmp	r2, #0
_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
   a:	bf08      	it	eq
   c:	4770      	bxeq	lr
_ZN9cstr_core6strlen17h99292b93147c4d5cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
   e:	5c42      	ldrb	r2, [r0, r1]
  10:	2a00      	cmp	r2, #0
  12:	bf04      	itt	eq
  14:	f041 0101 	orreq.w	r1, r1, #1
_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
  18:	4770      	bxeq	lr
_ZN9cstr_core6strlen17h99292b93147c4d5cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
  1a:	1842      	adds	r2, r0, r1
  1c:	7853      	ldrb	r3, [r2, #1]
  1e:	2b00      	cmp	r3, #0
  20:	bf04      	itt	eq
  22:	f041 0102 	orreq.w	r1, r1, #2
_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
  26:	4770      	bxeq	lr
_ZN9cstr_core6strlen17h99292b93147c4d5cE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
  28:	7893      	ldrb	r3, [r2, #2]
  2a:	2b00      	cmp	r3, #0
  2c:	d1ea      	bne.n	4 <_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E+0x4>
  2e:	3103      	adds	r1, #3
_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
  30:	4770      	bx	lr

Disassembly of section .text._ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E:

00000000 <_ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E>:
_ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:933
    pub fn from_bytes_with_nul(bytes: &[u8]) -> Result<&CStr, FromBytesWithNulError> {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	4604      	mov	r4, r0
_ZN6memchr6memchr17h07de94b1724449c9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/lib.rs:156
    #[inline(always)]
    fn imp(n1: u8, haystack: &[u8]) -> Option<usize> {
        fallback::memchr(n1, haystack)
    }

    if haystack.is_empty() {
   4:	b172      	cbz	r2, 24 <_ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E+0x24>
_ZN6memchr6memchr3imp17h71d687e788d0661eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/lib.rs:153
        fallback::memchr(n1, haystack)
   6:	2000      	movs	r0, #0
   8:	4615      	mov	r5, r2
   a:	460e      	mov	r6, r1
   c:	f7ff fffe 	bl	0 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E>
_ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:935
        if let Some(nul_pos) = nul_pos {
  10:	2801      	cmp	r0, #1
  12:	d107      	bne.n	24 <_ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E+0x24>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:936
            if nul_pos + 1 != bytes.len() {
  14:	1c48      	adds	r0, r1, #1
  16:	42a8      	cmp	r0, r5
  18:	d108      	bne.n	2c <_ZN9cstr_core4CStr19from_bytes_with_nul17he02cdb96697c2c86E+0x2c>
  1a:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:939
            Ok(unsafe { CStr::from_bytes_with_nul_unchecked(bytes) })
  1c:	e9c4 6501 	strd	r6, r5, [r4, #4]
  20:	6020      	str	r0, [r4, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:943
    }
  22:	bd70      	pop	{r4, r5, r6, pc}
  24:	2001      	movs	r0, #1
  26:	e9c4 0000 	strd	r0, r0, [r4]
  2a:	bd70      	pop	{r4, r5, r6, pc}
  2c:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:937
                return Err(FromBytesWithNulError::interior_nul(nul_pos));
  2e:	e9c4 0101 	strd	r0, r1, [r4, #4]
  32:	2001      	movs	r0, #1
  34:	6020      	str	r0, [r4, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:943
    }
  36:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN9cstr_core4CStr6to_str17hd17841c191b739c0E:

00000000 <_ZN9cstr_core4CStr6to_str17hd17841c191b739c0E>:
_ZN9cstr_core4CStr6to_str17hd17841c191b739c0E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1080
    /// use cstr_core::CStr;
    ///
    /// let c_str = CStr::from_bytes_with_nul(b"foo\0").unwrap();
    /// assert_eq!(c_str.to_str(), Ok("foo"));
    /// ```
    pub fn to_str(&self) -> Result<&str, Utf8Error> {
   0:	b580      	push	{r7, lr}
   2:	4613      	mov	r3, r2
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   4:	3a01      	subs	r2, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   6:	b113      	cbz	r3, e <_ZN9cstr_core4CStr6to_str17hd17841c191b739c0E+0xe>
_ZN9cstr_core4CStr6to_str17hd17841c191b739c0E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1085
        // NB: When CStr is changed to perform the length check in .to_bytes()
        // instead of in from_ptr(), it may be worth considering if this should
        // be rewritten to do the UTF-8 check inline with the length calculation
        // instead of doing it afterwards.
        str::from_utf8(self.to_bytes())
   8:	f7ff fffe 	bl	0 <_ZN4core3str9from_utf817hd7172c09534810eaE>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1086
    }
   c:	bd80      	pop	{r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
   e:	4610      	mov	r0, r2
  10:	2100      	movs	r1, #0
  12:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
  16:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E:

00000000 <_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E>:
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1156
        }
    }
}

impl PartialEq for CStr {
    fn eq(&self, other: &CStr) -> bool {
   0:	b580      	push	{r7, lr}
   2:	4694      	mov	ip, r2
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   4:	1e4a      	subs	r2, r1, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   6:	b181      	cbz	r1, 2a <_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E+0x2a>
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
   8:	1e59      	subs	r1, r3, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   a:	b19b      	cbz	r3, 34 <_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E+0x34>
_ZN68_$LT$$u5b$A$u5d$$u20$as$u20$core..slice..SlicePartialEq$LT$A$GT$$GT$5equal17h498554a0ff45175eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5242
   c:	428a      	cmp	r2, r1
   e:	bf1c      	itt	ne
  10:	2000      	movne	r0, #0
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1158
        self.to_bytes().eq(other.to_bytes())
    }
  12:	bd80      	popne	{r7, pc}
_ZN68_$LT$$u5b$A$u5d$$u20$as$u20$core..slice..SlicePartialEq$LT$A$GT$$GT$5equal17h498554a0ff45175eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5245
  14:	4560      	cmp	r0, ip
  16:	d006      	beq.n	26 <_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E+0x26>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5250
  18:	4661      	mov	r1, ip
  1a:	f7ff fffe 	bl	0 <memcmp>
  1e:	fab0 f080 	clz	r0, r0
  22:	0940      	lsrs	r0, r0, #5
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1158
  24:	bd80      	pop	{r7, pc}
  26:	2001      	movs	r0, #1
  28:	bd80      	pop	{r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  2a:	4610      	mov	r0, r2
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E():
  2c:	2100      	movs	r1, #0
  2e:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
  32:	defe      	udf	#254	; 0xfe
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  34:	4608      	mov	r0, r1
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17hd7dc797a251423c8E():
  36:	2100      	movs	r1, #0
  38:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
  3c:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E:

00000000 <_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E>:
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1162
}
impl Eq for CStr {}
impl PartialOrd for CStr {
    fn partial_cmp(&self, other: &CStr) -> Option<Ordering> {
   0:	b5b0      	push	{r4, r5, r7, lr}
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   2:	1e4c      	subs	r4, r1, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   4:	b1d1      	cbz	r1, 3c <_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E+0x3c>
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
   6:	1e5d      	subs	r5, r3, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   8:	b1eb      	cbz	r3, 46 <_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E+0x46>
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E():
   a:	4694      	mov	ip, r2
_ZN4core3cmp3Ord3min17h8f623f08703536deE():
   c:	4622      	mov	r2, r4
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
   e:	4661      	mov	r1, ip
_ZN4core3cmp3Ord3min17h8f623f08703536deE():
  10:	42ac      	cmp	r4, r5
  12:	bf88      	it	hi
  14:	462a      	movhi	r2, r5
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
  16:	f7ff fffe 	bl	0 <memcmp>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5329
  1a:	2800      	cmp	r0, #0
  1c:	d005      	beq.n	2a <_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E+0x2a>
  1e:	f04f 0001 	mov.w	r0, #1
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5331
  22:	bfb8      	it	lt
  24:	f04f 30ff 	movlt.w	r0, #4294967295	; 0xffffffff
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1164
        self.to_bytes().partial_cmp(&other.to_bytes())
    }
  28:	bdb0      	pop	{r4, r5, r7, pc}
  2a:	2101      	movs	r1, #1
_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h2338ab55b57caa59E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/cmp.rs:987
  2c:	42ac      	cmp	r4, r5
  2e:	bf38      	it	cc
  30:	f04f 31ff 	movcc.w	r1, #4294967295	; 0xffffffff
  34:	1b60      	subs	r0, r4, r5
  36:	bf18      	it	ne
  38:	4608      	movne	r0, r1
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1164
  3a:	bdb0      	pop	{r4, r5, r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  3c:	4620      	mov	r0, r4
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E():
  3e:	2100      	movs	r1, #0
  40:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
  44:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  46:	4628      	mov	r0, r5
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h3689290b51c564d3E():
  48:	2100      	movs	r1, #0
  4a:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
  4e:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E:

00000000 <_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E>:
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1167
}
impl Ord for CStr {
    fn cmp(&self, other: &CStr) -> Ordering {
   0:	b5b0      	push	{r4, r5, r7, lr}
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   2:	1e4c      	subs	r4, r1, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   4:	b1d1      	cbz	r1, 3c <_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E+0x3c>
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
   6:	1e5d      	subs	r5, r3, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   8:	b1eb      	cbz	r3, 46 <_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E+0x46>
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E():
   a:	4694      	mov	ip, r2
_ZN4core3cmp3Ord3min17h8f623f08703536deE():
   c:	4622      	mov	r2, r4
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
   e:	4661      	mov	r1, ip
_ZN4core3cmp3Ord3min17h8f623f08703536deE():
  10:	42ac      	cmp	r4, r5
  12:	bf88      	it	hi
  14:	462a      	movhi	r2, r5
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
  16:	f7ff fffe 	bl	0 <memcmp>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5329
  1a:	2800      	cmp	r0, #0
  1c:	d005      	beq.n	2a <_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E+0x2a>
  1e:	f04f 0001 	mov.w	r0, #1
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5331
  22:	bfb8      	it	lt
  24:	f04f 30ff 	movlt.w	r0, #4294967295	; 0xffffffff
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1169
        self.to_bytes().cmp(&other.to_bytes())
    }
  28:	bdb0      	pop	{r4, r5, r7, pc}
  2a:	2101      	movs	r1, #1
_ZN4core3cmp5impls50_$LT$impl$u20$core..cmp..Ord$u20$for$u20$usize$GT$3cmp17h2338ab55b57caa59E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/cmp.rs:987
  2c:	42ac      	cmp	r4, r5
  2e:	bf38      	it	cc
  30:	f04f 31ff 	movcc.w	r1, #4294967295	; 0xffffffff
  34:	1b60      	subs	r0, r4, r5
  36:	bf18      	it	ne
  38:	4608      	movne	r0, r1
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1169
  3a:	bdb0      	pop	{r4, r5, r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  3c:	4620      	mov	r0, r4
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E():
  3e:	2100      	movs	r1, #0
  40:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
  44:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h098c71a5ebc81a0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  46:	4628      	mov	r0, r5
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h1fd46cd2470108d1E():
  48:	2100      	movs	r1, #0
  4a:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
  4e:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ab348c5ea2fdcdE:

00000000 <_ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ab348c5ea2fdcdE>:
_ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h53ab348c5ea2fdcdE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:320
#[derive(Clone, PartialEq, Eq, Debug)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	ad01      	add	r5, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	4604      	mov	r4, r0
   c:	f2c0 0200 	movt	r2, #0
  10:	4628      	mov	r0, r5
  12:	2315      	movs	r3, #21
  14:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter12debug_struct17h0a14031b095ee1baE>
  18:	f240 0000 	movw	r0, #0
  1c:	f240 0100 	movw	r1, #0
  20:	f2c0 0000 	movt	r0, #0
  24:	ab03      	add	r3, sp, #12
  26:	9000      	str	r0, [sp, #0]
  28:	f2c0 0100 	movt	r1, #0
  2c:	4628      	mov	r0, r5
  2e:	2204      	movs	r2, #4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:322
    kind: FromBytesWithNulErrorKind,
  30:	9403      	str	r4, [sp, #12]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:320
#[derive(Clone, PartialEq, Eq, Debug)]
  32:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders11DebugStruct5field17h80023aaf54882542E>
  36:	4628      	mov	r0, r5
  38:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders11DebugStruct6finish17h9090cd1e84004b71E>
  3c:	b004      	add	sp, #16
  3e:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE:

00000000 <_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE>:
_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	4604      	mov	r4, r0
   6:	6800      	ldr	r0, [r0, #0]
   8:	2801      	cmp	r0, #1
   a:	d10d      	bne.n	28 <_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a1f35568762631aE+0x28>
   c:	ac01      	add	r4, sp, #4
   e:	f240 0200 	movw	r2, #0
  12:	f2c0 0200 	movt	r2, #0
  16:	2310      	movs	r3, #16
  18:	4620      	mov	r0, r4
  1a:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  1e:	4620      	mov	r0, r4
  20:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  24:	b004      	add	sp, #16
  26:	bdb0      	pop	{r4, r5, r7, pc}
  28:	ad01      	add	r5, sp, #4
  2a:	f240 0200 	movw	r2, #0
  2e:	f2c0 0200 	movt	r2, #0
  32:	230b      	movs	r3, #11
  34:	4628      	mov	r0, r5
  36:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  3a:	f240 0200 	movw	r2, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:327
    InteriorNul(usize),
  3e:	1d20      	adds	r0, r4, #4
  40:	9000      	str	r0, [sp, #0]
  42:	4669      	mov	r1, sp
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
  44:	f2c0 0200 	movt	r2, #0
  48:	4628      	mov	r0, r5
  4a:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple5field17h7da5ac79cde13c49E>
  4e:	4628      	mov	r0, r5
  50:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  54:	b004      	add	sp, #16
  56:	bdb0      	pop	{r4, r5, r7, pc}

cty-2b91c950e78e9034.cty.d2qiqcg6-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cty.d2qiqcg6-cgu.0



cty-f44716f0d63485ff.cty.1yhltxjj-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cty.1yhltxjj-cgu.0



generic_array-3772f2344b78502d.generic_array.75gpl2bq-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 generic_array.75gpl2bq-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000009c l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
0000010a l       .debug_str	00000000 
00000113 l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
00000120 l       .debug_str	00000000 
00000127 l       .debug_str	00000000 
0000012d l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
0000016b l       .debug_str	00000000 
00000177 l       .debug_str	00000000 
000001af l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001be l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001cd l       .debug_str	00000000 
000001d0 l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001d8 l       .debug_str	00000000 
000001de l       .debug_str	00000000 
000001e5 l       .debug_str	00000000 
000001ed l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
000001fe l       .debug_str	00000000 
00000203 l       .debug_str	00000000 
0000020f l       .debug_str	00000000 
00000217 l       .debug_str	00000000 
0000021e l       .debug_str	00000000 
00000222 l       .debug_str	00000000 
00000227 l       .debug_str	00000000 
00000230 l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
00000238 l       .debug_str	00000000 
0000023c l       .debug_str	00000000 
00000245 l       .debug_str	00000000 
0000024c l       .debug_str	00000000 
00000251 l       .debug_str	00000000 
00000256 l       .debug_str	00000000 
0000025c l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
0000026c l       .debug_str	00000000 
0000026f l       .debug_str	00000000 
00000275 l       .debug_str	00000000 
0000027f l       .debug_str	00000000 
00000287 l       .debug_str	00000000 
0000028d l       .debug_str	00000000 
00000293 l       .debug_str	00000000 
0000029e l       .debug_str	00000000 
000002a7 l       .debug_str	00000000 
000002ca l       .debug_str	00000000 
000002e9 l       .debug_str	00000000 
000002eb l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
00000317 l       .debug_str	00000000 
0000031c l       .debug_str	00000000 
00000322 l       .debug_str	00000000 
00000328 l       .debug_str	00000000 
0000032b l       .debug_str	00000000 
0000033a l       .debug_str	00000000 
00000341 l       .debug_str	00000000 
00000345 l       .debug_str	00000000 
0000034e l       .debug_str	00000000 
00000356 l       .debug_str	00000000 
0000035e l       .debug_str	00000000 
00000365 l       .debug_str	00000000 
00000379 l       .debug_str	00000000 
00000385 l       .debug_str	00000000 
00000391 l       .debug_str	00000000 
000003aa l       .debug_str	00000000 
000003af l       .debug_str	00000000 
000003c0 l       .debug_str	00000000 
000003ca l       .debug_str	00000000 
000003d8 l       .debug_str	00000000 
000003dc l       .debug_str	00000000 
000003e7 l       .debug_str	00000000 
000003ee l       .debug_str	00000000 
000003f4 l       .debug_str	00000000 
000003f8 l       .debug_str	00000000 
000003fc l       .debug_str	00000000 
00000404 l       .debug_str	00000000 
0000041b l       .debug_str	00000000 
0000043f l       .debug_str	00000000 
0000045b l       .debug_str	00000000 
00000465 l       .debug_str	00000000 
0000047f l       .debug_str	00000000 
000004dd l       .debug_str	00000000 
000004e8 l       .debug_str	00000000 
00000505 l       .debug_str	00000000 
0000051e l       .debug_str	00000000 
00000528 l       .debug_str	00000000 
0000055a l       .debug_str	00000000 
00000561 l       .debug_str	00000000 
0000059f l       .debug_str	00000000 
000005b5 l       .debug_str	00000000 
000005b7 l       .debug_str	00000000 
000005c0 l       .debug_str	00000000 
000005c5 l       .debug_str	00000000 
000005cc l       .debug_str	00000000 
00000000 l     O .rodata.cst16	00000010 .Lanon.5e0508d9a792c8c6703b2b037f214322.0
00000010 l     O .rodata.cst16	00000010 .Lanon.5e0508d9a792c8c6703b2b037f214322.1
00000000 l     O .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.4	00000010 .Lanon.5e0508d9a792c8c6703b2b037f214322.4
00000000 l     O .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.6	00000010 .Lanon.5e0508d9a792c8c6703b2b037f214322.6
00000000 l    d  .text._ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE	00000000 .text._ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE
00000000 l    d  .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.2	00000000 .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.2
00000000 l    d  .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.3	00000000 .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.3
00000000 l    d  .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.5	00000000 .rodata..Lanon.5e0508d9a792c8c6703b2b037f214322.5
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE	00000044 _ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE
00000000 g     O .rodata._ZN13generic_array3hex11LOWER_CHARS17ha692d3248720f83cE	00000008 _ZN13generic_array3hex11LOWER_CHARS17ha692d3248720f83cE
00000000 g     O .rodata._ZN13generic_array3hex11UPPER_CHARS17h189c1ad6940ef4dcE	00000008 _ZN13generic_array3hex11UPPER_CHARS17h189c1ad6940ef4dcE
00000000         *UND*	00000000 _ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h7160b6abac7a3a12E
00000000         *UND*	00000000 _ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E



Disassembly of section .text._ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE:

00000000 <_ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE>:
_ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:319
    }
}

#[inline(never)]
#[cold]
fn from_iter_length_fail(length: usize, expected: usize) -> ! {
   0:	b08c      	sub	sp, #48	; 0x30
   2:	e9cd 0100 	strd	r0, r1, [sp]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:320
    panic!(
   6:	f240 0000 	movw	r0, #0
   a:	a901      	add	r1, sp, #4
   c:	f2c0 0000 	movt	r0, #0
  10:	900b      	str	r0, [sp, #44]	; 0x2c
  12:	e9cd 0109 	strd	r0, r1, [sp, #36]	; 0x24
  16:	4668      	mov	r0, sp
  18:	9008      	str	r0, [sp, #32]
  1a:	2002      	movs	r0, #2
  1c:	a908      	add	r1, sp, #32
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  1e:	9007      	str	r0, [sp, #28]
  20:	9106      	str	r1, [sp, #24]
  22:	2100      	movs	r1, #0
  24:	9105      	str	r1, [sp, #20]
  26:	e9cd 0103 	strd	r0, r1, [sp, #12]
  2a:	f240 0000 	movw	r0, #0
  2e:	f2c0 0000 	movt	r0, #0
_ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:320
  32:	f240 0100 	movw	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  36:	9002      	str	r0, [sp, #8]
  38:	a802      	add	r0, sp, #8
_ZN13generic_array21from_iter_length_fail17h77565ee05298aebbE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:320
  3a:	f2c0 0100 	movt	r1, #0
  3e:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
  42:	defe      	udf	#254	; 0xfe

memchr-40d06562550ea147.memchr.5q69x7dx-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 memchr.5q69x7dx-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000094 l       .debug_str	00000000 
000000dc l       .debug_str	00000000 
000000e1 l       .debug_str	00000000 
000000e8 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000ee l       .debug_str	00000000 
000000f2 l       .debug_str	00000000 
000000f9 l       .debug_str	00000000 
000000fd l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
00000108 l       .debug_str	00000000 
0000010e l       .debug_str	00000000 
00000115 l       .debug_str	00000000 
0000011d l       .debug_str	00000000 
00000127 l       .debug_str	00000000 
0000012b l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
00000181 l       .debug_str	00000000 
0000018c l       .debug_str	00000000 
00000196 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
000001a1 l       .debug_str	00000000 
000001a7 l       .debug_str	00000000 
000001ef l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
000001fd l       .debug_str	00000000 
00000203 l       .debug_str	00000000 
0000028f l       .debug_str	00000000 
000002a1 l       .debug_str	00000000 
000002aa l       .debug_str	00000000 
000002b1 l       .debug_str	00000000 
000002b7 l       .debug_str	00000000 
000002bb l       .debug_str	00000000 
000002c1 l       .debug_str	00000000 
000002c7 l       .debug_str	00000000 
000002cb l       .debug_str	00000000 
000002cf l       .debug_str	00000000 
000002dc l       .debug_str	00000000 
0000035f l       .debug_str	00000000 
00000369 l       .debug_str	00000000 
000003f1 l       .debug_str	00000000 
00000402 l       .debug_str	00000000 
00000404 l       .debug_str	00000000 
00000479 l       .debug_str	00000000 
000004a6 l       .debug_str	00000000 
000004ac l       .debug_str	00000000 
000004b3 l       .debug_str	00000000 
000004bc l       .debug_str	00000000 
000004f1 l       .debug_str	00000000 
000004fd l       .debug_str	00000000 
000004ff l       .debug_str	00000000 
00000503 l       .debug_str	00000000 
00000507 l       .debug_str	00000000 
0000050f l       .debug_str	00000000 
00000511 l       .debug_str	00000000 
00000549 l       .debug_str	00000000 
00000561 l       .debug_str	00000000 
00000568 l       .debug_str	00000000 
0000056c l       .debug_str	00000000 
00000571 l       .debug_str	00000000 
00000576 l       .debug_str	00000000 
00000584 l       .debug_str	00000000 
0000058e l       .debug_str	00000000 
00000596 l       .debug_str	00000000 
0000059e l       .debug_str	00000000 
000005a9 l       .debug_str	00000000 
000005e7 l       .debug_str	00000000 
000005ff l       .debug_str	00000000 
00000603 l       .debug_str	00000000 
00000607 l       .debug_str	00000000 
0000060f l       .debug_str	00000000 
0000064d l       .debug_str	00000000 
00000662 l       .debug_str	00000000 
00000664 l       .debug_str	00000000 
00000668 l       .debug_str	00000000 
000006b0 l       .debug_str	00000000 
000006bd l       .debug_str	00000000 
000006c1 l       .debug_str	00000000 
000006fd l       .debug_str	00000000 
00000710 l       .debug_str	00000000 
00000715 l       .debug_str	00000000 
00000717 l       .debug_str	00000000 
00000747 l       .debug_str	00000000 
0000074f l       .debug_str	00000000 
00000753 l       .debug_str	00000000 
00000757 l       .debug_str	00000000 
0000078f l       .debug_str	00000000 
00000797 l       .debug_str	00000000 
000007e5 l       .debug_str	00000000 
000007f1 l       .debug_str	00000000 
000007f6 l       .debug_str	00000000 
000007f9 l       .debug_str	00000000 
000007fc l       .debug_str	00000000 
0000082c l       .debug_str	00000000 
00000834 l       .debug_str	00000000 
00000860 l       .debug_str	00000000 
00000864 l       .debug_str	00000000 
00000866 l       .debug_str	00000000 
0000086a l       .debug_str	00000000 
000008a2 l       .debug_str	00000000 
000008aa l       .debug_str	00000000 
000008f8 l       .debug_str	00000000 
000008fb l       .debug_str	00000000 
000008ff l       .debug_str	00000000 
00000903 l       .debug_str	00000000 
00000908 l       .debug_str	00000000 
00000931 l       .debug_str	00000000 
0000093c l       .debug_str	00000000 
00000942 l       .debug_str	00000000 
00000967 l       .debug_str	00000000 
0000096a l       .debug_str	00000000 
000009a2 l       .debug_str	00000000 
000009ba l       .debug_str	00000000 
000009f2 l       .debug_str	00000000 
000009fb l       .debug_str	00000000 
00000a4a l       .debug_str	00000000 
00000a82 l       .debug_str	00000000 
00000a8b l       .debug_str	00000000 
00000ada l       .debug_str	00000000 
00000b09 l       .debug_str	00000000 
00000b39 l       .debug_str	00000000 
00000b69 l       .debug_str	00000000 
00000b99 l       .debug_str	00000000 
00000ba1 l       .debug_str	00000000 
00000bd2 l       .debug_str	00000000 
00000c03 l       .debug_str	00000000 
00000c0c l       .debug_str	00000000 
00000c12 l       .debug_str	00000000 
00000c18 l       .debug_str	00000000 
00000c1c l       .debug_str	00000000 
00000c26 l       .debug_str	00000000 
00000c2a l       .debug_str	00000000 
00000c2e l       .debug_str	00000000 
00000c32 l       .debug_str	00000000 
00000c36 l       .debug_str	00000000 
00000c3a l       .debug_str	00000000 
00000c3e l       .debug_str	00000000 
00000000 l    d  .text._ZN6memchr8fallback6memchr17hc97ee43e63623d71E	00000000 .text._ZN6memchr8fallback6memchr17hc97ee43e63623d71E
00000000 l    d  .text._ZN6memchr8fallback7memchr217h347181afb08c7103E	00000000 .text._ZN6memchr8fallback7memchr217h347181afb08c7103E
00000000 l    d  .text._ZN6memchr8fallback7memchr317h0356d5e2b6830c60E	00000000 .text._ZN6memchr8fallback7memchr317h0356d5e2b6830c60E
00000000 l    d  .text._ZN6memchr8fallback7memrchr17he11431db38624421E	00000000 .text._ZN6memchr8fallback7memrchr17he11431db38624421E
00000000 l    d  .text._ZN6memchr8fallback8memrchr217h105ef38da16f8d66E	00000000 .text._ZN6memchr8fallback8memrchr217h105ef38da16f8d66E
00000000 l    d  .text._ZN6memchr8fallback8memrchr317h69ca9d798adf7785E	00000000 .text._ZN6memchr8fallback8memrchr317h69ca9d798adf7785E
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN6memchr8fallback6memchr17hc97ee43e63623d71E	00000182 _ZN6memchr8fallback6memchr17hc97ee43e63623d71E
00000000 g     F .text._ZN6memchr8fallback7memchr217h347181afb08c7103E	000001a2 _ZN6memchr8fallback7memchr217h347181afb08c7103E
00000000 g     F .text._ZN6memchr8fallback7memchr317h0356d5e2b6830c60E	00000214 _ZN6memchr8fallback7memchr317h0356d5e2b6830c60E
00000000 g     F .text._ZN6memchr8fallback7memrchr17he11431db38624421E	00000196 _ZN6memchr8fallback7memrchr17he11431db38624421E
00000000 g     F .text._ZN6memchr8fallback8memrchr217h105ef38da16f8d66E	000001ba _ZN6memchr8fallback8memrchr217h105ef38da16f8d66E
00000000 g     F .text._ZN6memchr8fallback8memrchr317h69ca9d798adf7785E	00000242 _ZN6memchr8fallback8memrchr317h69ca9d798adf7785E



Disassembly of section .text._ZN6memchr8fallback6memchr17hc97ee43e63623d71E:

00000000 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E>:
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:45
#[inline(always)]
fn repeat_byte(b: u8) -> usize {
    (b as usize) * (usize::MAX / 255)
}

pub fn memchr(n1: u8, haystack: &[u8]) -> Option<usize> {
   0:	b570      	push	{r4, r5, r6, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   2:	eb01 0c02 	add.w	ip, r1, r2
_ZN6memchr8fallback11repeat_byte17h9d9fce73d276d3efE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   6:	fa5f fe80 	uxtb.w	lr, r0
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:55
    let start_ptr = haystack.as_ptr();
    let end_ptr = haystack[haystack.len()..].as_ptr();
    let mut ptr = start_ptr;

    unsafe {
        if haystack.len() < USIZE_BYTES {
   a:	2a03      	cmp	r2, #3
   c:	d825      	bhi.n	5a <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x5a>
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    confirm: F,
) -> Option<usize> {
    debug_assert!(start_ptr <= ptr);
    debug_assert!(ptr <= end_ptr);

    while ptr < end_ptr {
   e:	2a00      	cmp	r2, #0
  10:	f000 808c 	beq.w	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
  14:	2000      	movs	r0, #0
  16:	460a      	mov	r2, r1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  18:	5c0b      	ldrb	r3, [r1, r0]
  1a:	4573      	cmp	r3, lr
  1c:	f000 8089 	beq.w	132 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x132>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  20:	180b      	adds	r3, r1, r0
  22:	1c5c      	adds	r4, r3, #1
  24:	4564      	cmp	r4, ip
  26:	f080 8081 	bcs.w	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  2a:	7824      	ldrb	r4, [r4, #0]
  2c:	4574      	cmp	r4, lr
  2e:	f000 8085 	beq.w	13c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x13c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  32:	1c9c      	adds	r4, r3, #2
  34:	4564      	cmp	r4, ip
  36:	d279      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  38:	7824      	ldrb	r4, [r4, #0]
  3a:	4574      	cmp	r4, lr
  3c:	f000 8083 	beq.w	146 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x146>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  40:	3303      	adds	r3, #3
  42:	4563      	cmp	r3, ip
  44:	d272      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  46:	781b      	ldrb	r3, [r3, #0]
  48:	4573      	cmp	r3, lr
  4a:	f000 8081 	beq.w	150 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x150>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  4e:	3004      	adds	r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  50:	3204      	adds	r2, #4
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
  52:	180b      	adds	r3, r1, r0
  54:	4563      	cmp	r3, ip
  56:	d3df      	bcc.n	18 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x18>
  58:	e068      	b.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
  5a:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17h04a42fa70594521eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  5e:	680b      	ldr	r3, [r1, #0]
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
  60:	fb0e f000 	mul.w	r0, lr, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:60
        if contains_zero_byte(chunk ^ vn1) {
  64:	ea83 0400 	eor.w	r4, r3, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  68:	f1a4 3501 	sub.w	r5, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  6c:	ea25 0404 	bic.w	r4, r5, r4
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:60
        if contains_zero_byte(chunk ^ vn1) {
  70:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
  74:	d01f      	beq.n	b6 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0xb6>
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  76:	2a01      	cmp	r2, #1
  78:	db58      	blt.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:60
        if contains_zero_byte(chunk ^ vn1) {
  7a:	b2d8      	uxtb	r0, r3
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  7c:	4570      	cmp	r0, lr
  7e:	4608      	mov	r0, r1
  80:	d058      	beq.n	134 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x134>
  82:	4608      	mov	r0, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  84:	1c42      	adds	r2, r0, #1
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  86:	4562      	cmp	r2, ip
  88:	d250      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  8a:	7813      	ldrb	r3, [r2, #0]
  8c:	4573      	cmp	r3, lr
  8e:	d064      	beq.n	15a <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x15a>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  90:	1c82      	adds	r2, r0, #2
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  92:	4562      	cmp	r2, ip
  94:	d24a      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  96:	7813      	ldrb	r3, [r2, #0]
  98:	4573      	cmp	r3, lr
  9a:	d068      	beq.n	16e <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x16e>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  9c:	1cc2      	adds	r2, r0, #3
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  9e:	4562      	cmp	r2, ip
  a0:	d244      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  a2:	7813      	ldrb	r3, [r2, #0]
  a4:	4573      	cmp	r3, lr
  a6:	d067      	beq.n	178 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x178>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  a8:	3004      	adds	r0, #4
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  aa:	4560      	cmp	r0, ip
  ac:	d23e      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  ae:	7802      	ldrb	r2, [r0, #0]
  b0:	4572      	cmp	r2, lr
  b2:	d1e7      	bne.n	84 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x84>
  b4:	e03e      	b.n	134 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x134>
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:64
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
  b6:	f001 0303 	and.w	r3, r1, #3
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:67
        while loop_size == LOOP_SIZE && ptr <= ptr_sub(end_ptr, loop_size) {
  ba:	2a08      	cmp	r2, #8
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:64
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
  bc:	f1c3 0304 	rsb	r3, r3, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  c0:	440b      	add	r3, r1
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:67
        while loop_size == LOOP_SIZE && ptr <= ptr_sub(end_ptr, loop_size) {
  c2:	d317      	bcc.n	f4 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0xf4>
  c4:	f1ac 0208 	sub.w	r2, ip, #8
  c8:	4293      	cmp	r3, r2
  ca:	d903      	bls.n	d4 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0xd4>
  cc:	e012      	b.n	f4 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0xf4>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  ce:	3308      	adds	r3, #8
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:67
  d0:	4293      	cmp	r3, r2
  d2:	d80f      	bhi.n	f4 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0xf4>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:70
            let a = *(ptr as *const usize);
  d4:	e9d3 4500 	ldrd	r4, r5, [r3]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:73
            let eqb = contains_zero_byte(b ^ vn1);
  d8:	4045      	eors	r5, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:72
            let eqa = contains_zero_byte(a ^ vn1);
  da:	4044      	eors	r4, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  dc:	f1a4 3601 	sub.w	r6, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  e0:	ea26 0404 	bic.w	r4, r6, r4
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  e4:	f1a5 3601 	sub.w	r6, r5, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  e8:	ea26 0505 	bic.w	r5, r6, r5
  ec:	432c      	orrs	r4, r5
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:74
            if eqa || eqb {
  ee:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
  f2:	d0ec      	beq.n	ce <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0xce>
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  f4:	4563      	cmp	r3, ip
  f6:	d219      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  f8:	7818      	ldrb	r0, [r3, #0]
  fa:	4570      	cmp	r0, lr
  fc:	d032      	beq.n	164 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x164>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  fe:	1c58      	adds	r0, r3, #1
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 100:	4560      	cmp	r0, ip
 102:	d213      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 104:	7802      	ldrb	r2, [r0, #0]
 106:	4572      	cmp	r2, lr
 108:	d014      	beq.n	134 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x134>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 10a:	1c98      	adds	r0, r3, #2
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 10c:	4560      	cmp	r0, ip
 10e:	d20d      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 110:	7802      	ldrb	r2, [r0, #0]
 112:	4572      	cmp	r2, lr
 114:	d00e      	beq.n	134 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x134>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 116:	1cd8      	adds	r0, r3, #3
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 118:	4560      	cmp	r0, ip
 11a:	d207      	bcs.n	12c <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 11c:	7802      	ldrb	r2, [r0, #0]
 11e:	4572      	cmp	r2, lr
 120:	d008      	beq.n	134 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x134>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 122:	3304      	adds	r3, #4
 124:	2000      	movs	r0, #0
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 126:	4563      	cmp	r3, ip
 128:	d3e6      	bcc.n	f8 <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0xf8>
 12a:	e000      	b.n	12e <_ZN6memchr8fallback6memchr17hc97ee43e63623d71E+0x12e>
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
 12c:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:81
}
 12e:	4611      	mov	r1, r2
 130:	bd70      	pop	{r4, r5, r6, pc}
_ZN6memchr8fallback14forward_search17h53e91d78466883eeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 132:	4408      	add	r0, r1
_ZN6memchr8fallback6memchr17hc97ee43e63623d71E():
 134:	1a42      	subs	r2, r0, r1
 136:	2001      	movs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:81
}
 138:	4611      	mov	r1, r2
 13a:	bd70      	pop	{r4, r5, r6, pc}
 13c:	1c50      	adds	r0, r2, #1
 13e:	1a42      	subs	r2, r0, r1
 140:	2001      	movs	r0, #1
 142:	4611      	mov	r1, r2
 144:	bd70      	pop	{r4, r5, r6, pc}
 146:	1c90      	adds	r0, r2, #2
 148:	1a42      	subs	r2, r0, r1
 14a:	2001      	movs	r0, #1
 14c:	4611      	mov	r1, r2
 14e:	bd70      	pop	{r4, r5, r6, pc}
 150:	1cd0      	adds	r0, r2, #3
 152:	1a42      	subs	r2, r0, r1
 154:	2001      	movs	r0, #1
 156:	4611      	mov	r1, r2
 158:	bd70      	pop	{r4, r5, r6, pc}
 15a:	4610      	mov	r0, r2
 15c:	1a42      	subs	r2, r0, r1
 15e:	2001      	movs	r0, #1
 160:	4611      	mov	r1, r2
 162:	bd70      	pop	{r4, r5, r6, pc}
 164:	4618      	mov	r0, r3
 166:	1a42      	subs	r2, r0, r1
 168:	2001      	movs	r0, #1
 16a:	4611      	mov	r1, r2
 16c:	bd70      	pop	{r4, r5, r6, pc}
 16e:	4610      	mov	r0, r2
 170:	1a42      	subs	r2, r0, r1
 172:	2001      	movs	r0, #1
 174:	4611      	mov	r1, r2
 176:	bd70      	pop	{r4, r5, r6, pc}
 178:	4610      	mov	r0, r2
 17a:	1a42      	subs	r2, r0, r1
 17c:	2001      	movs	r0, #1
 17e:	4611      	mov	r1, r2
 180:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN6memchr8fallback7memchr217h347181afb08c7103E:

00000000 <_ZN6memchr8fallback7memchr217h347181afb08c7103E>:
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:84
pub fn memchr2(n1: u8, n2: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   4:	eb02 0c03 	add.w	ip, r2, r3
_ZN6memchr8fallback11repeat_byte17h9d9fce73d276d3efE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   8:	fa5f fe81 	uxtb.w	lr, r1
   c:	fa5f f880 	uxtb.w	r8, r0
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:94
        if haystack.len() < USIZE_BYTES {
  10:	2b03      	cmp	r3, #3
  12:	d832      	bhi.n	7a <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x7a>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  14:	2b00      	cmp	r3, #0
  16:	f000 80b2 	beq.w	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
  1a:	2000      	movs	r0, #0
  1c:	4611      	mov	r1, r2
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  1e:	5c13      	ldrb	r3, [r2, r0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  20:	4543      	cmp	r3, r8
  22:	bf18      	it	ne
  24:	4573      	cmpne	r3, lr
  26:	f000 80b2 	beq.w	18e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x18e>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  2a:	1815      	adds	r5, r2, r0
  2c:	1c6e      	adds	r6, r5, #1
  2e:	4566      	cmp	r6, ip
  30:	f080 80a5 	bcs.w	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  34:	7836      	ldrb	r6, [r6, #0]
  36:	1c4b      	adds	r3, r1, #1
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  38:	4546      	cmp	r6, r8
  3a:	bf18      	it	ne
  3c:	4576      	cmpne	r6, lr
  3e:	f000 80a7 	beq.w	190 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x190>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  42:	1cae      	adds	r6, r5, #2
  44:	4566      	cmp	r6, ip
  46:	f080 809a 	bcs.w	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  4a:	7836      	ldrb	r6, [r6, #0]
  4c:	1c8b      	adds	r3, r1, #2
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  4e:	4546      	cmp	r6, r8
  50:	bf18      	it	ne
  52:	4576      	cmpne	r6, lr
  54:	f000 809c 	beq.w	190 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x190>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  58:	3503      	adds	r5, #3
  5a:	4565      	cmp	r5, ip
  5c:	f080 808f 	bcs.w	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  60:	782d      	ldrb	r5, [r5, #0]
  62:	1ccb      	adds	r3, r1, #3
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  64:	4545      	cmp	r5, r8
  66:	bf18      	it	ne
  68:	4575      	cmpne	r5, lr
  6a:	f000 8091 	beq.w	190 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x190>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  6e:	3004      	adds	r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  70:	3104      	adds	r1, #4
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
  72:	1813      	adds	r3, r2, r0
  74:	4563      	cmp	r3, ip
  76:	d3d2      	bcc.n	1e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x1e>
  78:	e081      	b.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
  7a:	f04f 3101 	mov.w	r1, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17h04a42fa70594521eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  7e:	6815      	ldr	r5, [r2, #0]
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
  80:	fb0e f001 	mul.w	r0, lr, r1
  84:	fb08 f101 	mul.w	r1, r8, r1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:99
        let eq1 = contains_zero_byte(chunk ^ vn1);
  88:	ea85 0601 	eor.w	r6, r5, r1
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  8c:	f1a6 3701 	sub.w	r7, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  90:	ea27 0606 	bic.w	r6, r7, r6
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:100
        let eq2 = contains_zero_byte(chunk ^ vn2);
  94:	ea85 0700 	eor.w	r7, r5, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  98:	f1a7 3401 	sub.w	r4, r7, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  9c:	43bc      	bics	r4, r7
  9e:	4334      	orrs	r4, r6
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:101
        if eq1 || eq2 {
  a0:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
  a4:	d02a      	beq.n	fc <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0xfc>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  a6:	2b01      	cmp	r3, #1
  a8:	db69      	blt.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:101
        if eq1 || eq2 {
  aa:	b2e8      	uxtb	r0, r5
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  ac:	4540      	cmp	r0, r8
  ae:	d069      	beq.n	184 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x184>
  b0:	4570      	cmp	r0, lr
  b2:	4610      	mov	r0, r2
  b4:	d067      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
  b6:	4611      	mov	r1, r2
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  b8:	1c48      	adds	r0, r1, #1
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  ba:	4560      	cmp	r0, ip
  bc:	d25f      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  be:	7803      	ldrb	r3, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  c0:	4543      	cmp	r3, r8
  c2:	bf18      	it	ne
  c4:	4573      	cmpne	r3, lr
  c6:	d05e      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  c8:	1c88      	adds	r0, r1, #2
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  ca:	4560      	cmp	r0, ip
  cc:	d257      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  ce:	7803      	ldrb	r3, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  d0:	4543      	cmp	r3, r8
  d2:	bf18      	it	ne
  d4:	4573      	cmpne	r3, lr
  d6:	d056      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  d8:	1cc8      	adds	r0, r1, #3
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  da:	4560      	cmp	r0, ip
  dc:	d24f      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  de:	7803      	ldrb	r3, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  e0:	4543      	cmp	r3, r8
  e2:	bf18      	it	ne
  e4:	4573      	cmpne	r3, lr
  e6:	d04e      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  e8:	1d08      	adds	r0, r1, #4
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  ea:	4560      	cmp	r0, ip
  ec:	d247      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  ee:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  f0:	4541      	cmp	r1, r8
  f2:	d048      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
  f4:	4571      	cmp	r1, lr
  f6:	4601      	mov	r1, r0
  f8:	d1de      	bne.n	b8 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0xb8>
  fa:	e044      	b.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:105
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
  fc:	f002 0303 	and.w	r3, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 100:	f1ac 0504 	sub.w	r5, ip, #4
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:105
 104:	f1c3 0304 	rsb	r3, r3, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 108:	4413      	add	r3, r2
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:108
        while ptr <= ptr_sub(end_ptr, USIZE_BYTES) {
 10a:	42ab      	cmp	r3, r5
 10c:	d903      	bls.n	116 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x116>
 10e:	e012      	b.n	136 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x136>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 110:	3304      	adds	r3, #4
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:108
 112:	42ab      	cmp	r3, r5
 114:	d80f      	bhi.n	136 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x136>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:111
            let chunk = *(ptr as *const usize);
 116:	681c      	ldr	r4, [r3, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:112
            let eq1 = contains_zero_byte(chunk ^ vn1);
 118:	ea84 0601 	eor.w	r6, r4, r1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:113
            let eq2 = contains_zero_byte(chunk ^ vn2);
 11c:	4044      	eors	r4, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 11e:	f1a6 3701 	sub.w	r7, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 122:	ea27 0606 	bic.w	r6, r7, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 126:	f1a4 3701 	sub.w	r7, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
 12a:	ea27 0404 	bic.w	r4, r7, r4
 12e:	4334      	orrs	r4, r6
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:114
            if eq1 || eq2 {
 130:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
 134:	d0ec      	beq.n	110 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x110>
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 136:	4563      	cmp	r3, ip
 138:	d221      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 13a:	7818      	ldrb	r0, [r3, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 13c:	4540      	cmp	r0, r8
 13e:	bf18      	it	ne
 140:	4570      	cmpne	r0, lr
 142:	d029      	beq.n	198 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x198>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 144:	1c58      	adds	r0, r3, #1
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 146:	4560      	cmp	r0, ip
 148:	d219      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 14a:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 14c:	4541      	cmp	r1, r8
 14e:	bf18      	it	ne
 150:	4571      	cmpne	r1, lr
 152:	d018      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 154:	1c98      	adds	r0, r3, #2
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 156:	4560      	cmp	r0, ip
 158:	d211      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 15a:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 15c:	4541      	cmp	r1, r8
 15e:	bf18      	it	ne
 160:	4571      	cmpne	r1, lr
 162:	d010      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 164:	1cd8      	adds	r0, r3, #3
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 166:	4560      	cmp	r0, ip
 168:	d209      	bcs.n	17e <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 16a:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 16c:	4541      	cmp	r1, r8
 16e:	bf18      	it	ne
 170:	4571      	cmpne	r1, lr
 172:	d008      	beq.n	186 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 174:	3304      	adds	r3, #4
 176:	2000      	movs	r0, #0
_ZN6memchr8fallback14forward_search17hbb41fa160155020eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 178:	4563      	cmp	r3, ip
 17a:	d3de      	bcc.n	13a <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x13a>
 17c:	e000      	b.n	180 <_ZN6memchr8fallback7memchr217h347181afb08c7103E+0x180>
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
 17e:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:121
}
 180:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 184:	4610      	mov	r0, r2
 186:	1a81      	subs	r1, r0, r2
 188:	2001      	movs	r0, #1
 18a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h16445d71915f19c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 18e:	1813      	adds	r3, r2, r0
_ZN6memchr8fallback3sub17h7d8bf4a560c93d0dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345

/// Subtract `b` from `a` and return the difference. `a` should be greater than
/// or equal to `b`.
fn sub(a: *const u8, b: *const u8) -> usize {
    debug_assert!(a >= b);
    (a as usize) - (b as usize)
 190:	1a99      	subs	r1, r3, r2
 192:	2001      	movs	r0, #1
_ZN6memchr8fallback7memchr217h347181afb08c7103E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:121
}
 194:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 198:	4618      	mov	r0, r3
 19a:	1a81      	subs	r1, r0, r2
 19c:	2001      	movs	r0, #1
 19e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

Disassembly of section .text._ZN6memchr8fallback7memchr317h0356d5e2b6830c60E:

00000000 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E>:
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:124
pub fn memchr3(n1: u8, n2: u8, n3: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   4:	9d09      	ldr	r5, [sp, #36]	; 0x24
_ZN6memchr8fallback11repeat_byte17h9d9fce73d276d3efE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   6:	fa5f f982 	uxtb.w	r9, r2
   a:	fa5f fe81 	uxtb.w	lr, r1
   e:	fa5f f880 	uxtb.w	r8, r0
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  12:	eb03 0c05 	add.w	ip, r3, r5
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:135
        if haystack.len() < USIZE_BYTES {
  16:	2d03      	cmp	r5, #3
  18:	d83e      	bhi.n	98 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x98>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  1a:	2d00      	cmp	r5, #0
  1c:	f000 80e3 	beq.w	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
  20:	2000      	movs	r0, #0
  22:	4619      	mov	r1, r3
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  24:	5c1d      	ldrb	r5, [r3, r0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  26:	454d      	cmp	r5, r9
  28:	bf18      	it	ne
  2a:	4545      	cmpne	r5, r8
  2c:	f000 80de 	beq.w	1ec <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ec>
  30:	4575      	cmp	r5, lr
  32:	f000 80db 	beq.w	1ec <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ec>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  36:	181e      	adds	r6, r3, r0
  38:	1c77      	adds	r7, r6, #1
  3a:	4567      	cmp	r7, ip
  3c:	f080 80d3 	bcs.w	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  40:	783f      	ldrb	r7, [r7, #0]
  42:	1c4d      	adds	r5, r1, #1
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  44:	454f      	cmp	r7, r9
  46:	f000 80d2 	beq.w	1ee <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ee>
  4a:	4547      	cmp	r7, r8
  4c:	bf18      	it	ne
  4e:	4577      	cmpne	r7, lr
  50:	f000 80cd 	beq.w	1ee <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ee>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  54:	1cb7      	adds	r7, r6, #2
  56:	4567      	cmp	r7, ip
  58:	f080 80c5 	bcs.w	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  5c:	783f      	ldrb	r7, [r7, #0]
  5e:	1c8d      	adds	r5, r1, #2
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  60:	454f      	cmp	r7, r9
  62:	f000 80c4 	beq.w	1ee <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ee>
  66:	4547      	cmp	r7, r8
  68:	bf18      	it	ne
  6a:	4577      	cmpne	r7, lr
  6c:	f000 80bf 	beq.w	1ee <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ee>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  70:	3603      	adds	r6, #3
  72:	4566      	cmp	r6, ip
  74:	f080 80b7 	bcs.w	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  78:	7836      	ldrb	r6, [r6, #0]
  7a:	1ccd      	adds	r5, r1, #3
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  7c:	454e      	cmp	r6, r9
  7e:	f000 80b6 	beq.w	1ee <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ee>
  82:	4546      	cmp	r6, r8
  84:	bf18      	it	ne
  86:	4576      	cmpne	r6, lr
  88:	f000 80b1 	beq.w	1ee <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1ee>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  8c:	3004      	adds	r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  8e:	3104      	adds	r1, #4
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
  90:	181a      	adds	r2, r3, r0
  92:	4562      	cmp	r2, ip
  94:	d3c6      	bcc.n	24 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x24>
  96:	e0a6      	b.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
  98:	f04f 3601 	mov.w	r6, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17h04a42fa70594521eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  9c:	681f      	ldr	r7, [r3, #0]
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
  9e:	fb09 fa06 	mul.w	sl, r9, r6
  a2:	fb0e fb06 	mul.w	fp, lr, r6
  a6:	fb08 f606 	mul.w	r6, r8, r6
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:140
        let eq1 = contains_zero_byte(chunk ^ vn1);
  aa:	ea87 0406 	eor.w	r4, r7, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  ae:	f1a4 3201 	sub.w	r2, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  b2:	43a2      	bics	r2, r4
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:141
        let eq2 = contains_zero_byte(chunk ^ vn2);
  b4:	ea87 040b 	eor.w	r4, r7, fp
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  b8:	f1a4 3001 	sub.w	r0, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  bc:	43a0      	bics	r0, r4
  be:	4310      	orrs	r0, r2
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:142
        let eq3 = contains_zero_byte(chunk ^ vn3);
  c0:	ea87 020a 	eor.w	r2, r7, sl
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  c4:	f1a2 3401 	sub.w	r4, r2, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  c8:	ea24 0202 	bic.w	r2, r4, r2
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:143
        if eq1 || eq2 || eq3 {
  cc:	4310      	orrs	r0, r2
  ce:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
  d2:	d038      	beq.n	146 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x146>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  d4:	2d01      	cmp	r5, #1
  d6:	f2c0 8086 	blt.w	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:143
        if eq1 || eq2 || eq3 {
  da:	b2f8      	uxtb	r0, r7
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  dc:	4548      	cmp	r0, r9
  de:	f000 808f 	beq.w	200 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x200>
  e2:	4540      	cmp	r0, r8
  e4:	f000 8091 	beq.w	20a <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x20a>
  e8:	4570      	cmp	r0, lr
  ea:	4618      	mov	r0, r3
  ec:	f000 8084 	beq.w	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
  f0:	4619      	mov	r1, r3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  f2:	1c48      	adds	r0, r1, #1
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  f4:	4560      	cmp	r0, ip
  f6:	d276      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  f8:	7805      	ldrb	r5, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  fa:	454d      	cmp	r5, r9
  fc:	bf18      	it	ne
  fe:	4545      	cmpne	r5, r8
 100:	d07a      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
 102:	4575      	cmp	r5, lr
 104:	d078      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 106:	1c88      	adds	r0, r1, #2
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 108:	4560      	cmp	r0, ip
 10a:	d26c      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 10c:	7805      	ldrb	r5, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 10e:	454d      	cmp	r5, r9
 110:	d072      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
 112:	4545      	cmp	r5, r8
 114:	bf18      	it	ne
 116:	4575      	cmpne	r5, lr
 118:	d06e      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 11a:	1cc8      	adds	r0, r1, #3
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 11c:	4560      	cmp	r0, ip
 11e:	d262      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 120:	7805      	ldrb	r5, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 122:	454d      	cmp	r5, r9
 124:	d068      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
 126:	4545      	cmp	r5, r8
 128:	bf18      	it	ne
 12a:	4575      	cmpne	r5, lr
 12c:	d064      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 12e:	1d08      	adds	r0, r1, #4
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 130:	4560      	cmp	r0, ip
 132:	d258      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 134:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 136:	4549      	cmp	r1, r9
 138:	bf18      	it	ne
 13a:	4541      	cmpne	r1, r8
 13c:	d05c      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
 13e:	4571      	cmp	r1, lr
 140:	4601      	mov	r1, r0
 142:	d1d6      	bne.n	f2 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0xf2>
 144:	e058      	b.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:147
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
 146:	f003 0003 	and.w	r0, r3, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 14a:	f1ac 0704 	sub.w	r7, ip, #4
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:147
 14e:	f1c0 0004 	rsb	r0, r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 152:	181d      	adds	r5, r3, r0
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:150
        while ptr <= ptr_sub(end_ptr, USIZE_BYTES) {
 154:	42bd      	cmp	r5, r7
 156:	d903      	bls.n	160 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x160>
 158:	e019      	b.n	18e <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x18e>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 15a:	3504      	adds	r5, #4
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:150
 15c:	42bd      	cmp	r5, r7
 15e:	d816      	bhi.n	18e <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x18e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:153
            let chunk = *(ptr as *const usize);
 160:	6828      	ldr	r0, [r5, #0]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:154
            let eq1 = contains_zero_byte(chunk ^ vn1);
 162:	ea80 0206 	eor.w	r2, r0, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 166:	f1a2 3401 	sub.w	r4, r2, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 16a:	ea24 0202 	bic.w	r2, r4, r2
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:155
            let eq2 = contains_zero_byte(chunk ^ vn2);
 16e:	ea80 040b 	eor.w	r4, r0, fp
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 172:	f1a4 3101 	sub.w	r1, r4, #16843009	; 0x1010101
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:156
            let eq3 = contains_zero_byte(chunk ^ vn3);
 176:	ea80 000a 	eor.w	r0, r0, sl
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 17a:	43a1      	bics	r1, r4
 17c:	4311      	orrs	r1, r2
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 17e:	f1a0 3201 	sub.w	r2, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
 182:	ea22 0000 	bic.w	r0, r2, r0
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:157
            if eq1 || eq2 || eq3 {
 186:	4308      	orrs	r0, r1
 188:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
 18c:	d0e5      	beq.n	15a <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x15a>
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 18e:	4565      	cmp	r5, ip
 190:	d229      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 192:	7828      	ldrb	r0, [r5, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 194:	4548      	cmp	r0, r9
 196:	bf18      	it	ne
 198:	4540      	cmpne	r0, r8
 19a:	d02c      	beq.n	1f6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f6>
 19c:	4570      	cmp	r0, lr
 19e:	d02a      	beq.n	1f6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f6>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1a0:	1c68      	adds	r0, r5, #1
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1a2:	4560      	cmp	r0, ip
 1a4:	d21f      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 1a6:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1a8:	4549      	cmp	r1, r9
 1aa:	d025      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
 1ac:	4541      	cmp	r1, r8
 1ae:	bf18      	it	ne
 1b0:	4571      	cmpne	r1, lr
 1b2:	d021      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1b4:	1ca8      	adds	r0, r5, #2
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1b6:	4560      	cmp	r0, ip
 1b8:	d215      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 1ba:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1bc:	4549      	cmp	r1, r9
 1be:	d01b      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
 1c0:	4541      	cmp	r1, r8
 1c2:	bf18      	it	ne
 1c4:	4571      	cmpne	r1, lr
 1c6:	d017      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1c8:	1ce8      	adds	r0, r5, #3
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1ca:	4560      	cmp	r0, ip
 1cc:	d20b      	bcs.n	1e6 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e6>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 1ce:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1d0:	4549      	cmp	r1, r9
 1d2:	d011      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
 1d4:	4541      	cmp	r1, r8
 1d6:	bf18      	it	ne
 1d8:	4571      	cmpne	r1, lr
 1da:	d00d      	beq.n	1f8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1dc:	3504      	adds	r5, #4
 1de:	2000      	movs	r0, #0
_ZN6memchr8fallback14forward_search17h2419a1c0ccc91739E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1e0:	4565      	cmp	r5, ip
 1e2:	d3d6      	bcc.n	192 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x192>
 1e4:	e000      	b.n	1e8 <_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E+0x1e8>
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
 1e6:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:164
}
 1e8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17heb3d588a49b7e7abE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1ec:	181d      	adds	r5, r3, r0
_ZN6memchr8fallback3sub17h7d8bf4a560c93d0dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 1ee:	1ae9      	subs	r1, r5, r3
 1f0:	2001      	movs	r0, #1
_ZN6memchr8fallback7memchr317h0356d5e2b6830c60E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:164
}
 1f2:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 1f6:	4628      	mov	r0, r5
 1f8:	1ac1      	subs	r1, r0, r3
 1fa:	2001      	movs	r0, #1
 1fc:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 200:	4618      	mov	r0, r3
 202:	1ac1      	subs	r1, r0, r3
 204:	2001      	movs	r0, #1
 206:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 20a:	4618      	mov	r0, r3
 20c:	1ac1      	subs	r1, r0, r3
 20e:	2001      	movs	r0, #1
 210:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

Disassembly of section .text._ZN6memchr8fallback7memrchr17he11431db38624421E:

00000000 <_ZN6memchr8fallback7memrchr17he11431db38624421E>:
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:167
pub fn memrchr(n1: u8, haystack: &[u8]) -> Option<usize> {
   0:	b570      	push	{r4, r5, r6, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   2:	eb01 0e02 	add.w	lr, r1, r2
_ZN4core3cmp3Ord3min17h9e359edb7eeadc7cE():
   6:	2a08      	cmp	r2, #8
   8:	4614      	mov	r4, r2
_ZN6memchr8fallback11repeat_byte17h9d9fce73d276d3efE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   a:	fa5f fc80 	uxtb.w	ip, r0
_ZN4core3cmp3Ord3min17h9e359edb7eeadc7cE():
   e:	bf28      	it	cs
  10:	2408      	movcs	r4, #8
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:177
        if haystack.len() < USIZE_BYTES {
  12:	2a03      	cmp	r2, #3
  14:	d826      	bhi.n	64 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x64>
_ZN6memchr8fallback14reverse_search17hb3409515d36a6aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  16:	1e90      	subs	r0, r2, #2
  18:	1ed3      	subs	r3, r2, #3
  1a:	188d      	adds	r5, r1, r2
  1c:	428d      	cmp	r5, r1
  1e:	f240 808e 	bls.w	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  22:	180c      	adds	r4, r1, r0
  24:	7866      	ldrb	r6, [r4, #1]
  26:	4566      	cmp	r6, ip
  28:	f000 808b 	beq.w	142 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x142>
  2c:	3d01      	subs	r5, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  2e:	428d      	cmp	r5, r1
  30:	f240 8085 	bls.w	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  34:	5c0d      	ldrb	r5, [r1, r0]
  36:	4565      	cmp	r5, ip
  38:	f000 8088 	beq.w	14c <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x14c>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  3c:	428c      	cmp	r4, r1
  3e:	d97e      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  40:	f814 5c01 	ldrb.w	r5, [r4, #-1]
  44:	4565      	cmp	r5, ip
  46:	f000 8086 	beq.w	156 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x156>
  4a:	18cd      	adds	r5, r1, r3
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  4c:	428d      	cmp	r5, r1
  4e:	d976      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  50:	f814 4c02 	ldrb.w	r4, [r4, #-2]
  54:	3804      	subs	r0, #4
  56:	3b04      	subs	r3, #4
  58:	3a04      	subs	r2, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  5a:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback14reverse_search17hb3409515d36a6aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  5e:	4564      	cmp	r4, ip
  60:	d1db      	bne.n	1a <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x1a>
  62:	e02e      	b.n	c2 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0xc2>
_ZN6memchr8fallback7memrchr17he11431db38624421E():
  64:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17h04a42fa70594521eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  68:	f85e 3c04 	ldr.w	r3, [lr, #-4]
_ZN6memchr8fallback7memrchr17he11431db38624421E():
  6c:	fb0c f000 	mul.w	r0, ip, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:182
        if contains_zero_byte(chunk ^ vn1) {
  70:	4043      	eors	r3, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  72:	f1a3 3501 	sub.w	r5, r3, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  76:	ea25 0303 	bic.w	r3, r5, r3
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:182
        if contains_zero_byte(chunk ^ vn1) {
  7a:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
  7e:	d024      	beq.n	ca <_ZN6memchr8fallback7memrchr17he11431db38624421E+0xca>
_ZN6memchr8fallback14reverse_search17hb3409515d36a6aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  80:	1e90      	subs	r0, r2, #2
  82:	1ed3      	subs	r3, r2, #3
  84:	188d      	adds	r5, r1, r2
  86:	428d      	cmp	r5, r1
  88:	d959      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  8a:	180c      	adds	r4, r1, r0
  8c:	7866      	ldrb	r6, [r4, #1]
  8e:	4566      	cmp	r6, ip
  90:	d066      	beq.n	160 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x160>
  92:	3d01      	subs	r5, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  94:	428d      	cmp	r5, r1
  96:	d952      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  98:	5c0d      	ldrb	r5, [r1, r0]
  9a:	4565      	cmp	r5, ip
  9c:	d065      	beq.n	16a <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x16a>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  9e:	428c      	cmp	r4, r1
  a0:	d94d      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  a2:	f814 5c01 	ldrb.w	r5, [r4, #-1]
  a6:	4565      	cmp	r5, ip
  a8:	d064      	beq.n	174 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x174>
  aa:	18cd      	adds	r5, r1, r3
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  ac:	428d      	cmp	r5, r1
  ae:	d946      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  b0:	f814 4c02 	ldrb.w	r4, [r4, #-2]
  b4:	3804      	subs	r0, #4
  b6:	3b04      	subs	r3, #4
  b8:	3a04      	subs	r2, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  ba:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback14reverse_search17hb3409515d36a6aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  be:	4564      	cmp	r4, ip
  c0:	d1e0      	bne.n	84 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x84>
_ZN6memchr8fallback7memrchr17he11431db38624421E():
  c2:	1888      	adds	r0, r1, r2
  c4:	1a41      	subs	r1, r0, r1
  c6:	2001      	movs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
  c8:	bd70      	pop	{r4, r5, r6, pc}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:186
        ptr = (end_ptr as usize & !align) as *const u8;
  ca:	f02e 0303 	bic.w	r3, lr, #3
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:188
        while loop_size == LOOP_SIZE && ptr >= ptr_add(start_ptr, loop_size) {
  ce:	2a08      	cmp	r2, #8
  d0:	d316      	bcc.n	100 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x100>
  d2:	f101 0e08 	add.w	lr, r1, #8
  d6:	459e      	cmp	lr, r3
  d8:	d812      	bhi.n	100 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x100>
  da:	4264      	negs	r4, r4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:191
            let a = *(ptr_sub(ptr, 2 * USIZE_BYTES) as *const usize);
  dc:	e953 6502 	ldrd	r6, r5, [r3, #-8]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:194
            let eqb = contains_zero_byte(b ^ vn1);
  e0:	4045      	eors	r5, r0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:193
            let eqa = contains_zero_byte(a ^ vn1);
  e2:	4046      	eors	r6, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  e4:	f1a6 3201 	sub.w	r2, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  e8:	43b2      	bics	r2, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  ea:	f1a5 3601 	sub.w	r6, r5, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  ee:	ea26 0505 	bic.w	r5, r6, r5
  f2:	432a      	orrs	r2, r5
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:195
            if eqa || eqb {
  f4:	f012 3f80 	tst.w	r2, #2155905152	; 0x80808080
  f8:	d102      	bne.n	100 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x100>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  fa:	4423      	add	r3, r4
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:188
        while loop_size == LOOP_SIZE && ptr >= ptr_add(start_ptr, loop_size) {
  fc:	4573      	cmp	r3, lr
  fe:	d2ed      	bcs.n	dc <_ZN6memchr8fallback7memrchr17he11431db38624421E+0xdc>
_ZN6memchr8fallback14reverse_search17hb3409515d36a6aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 100:	1e98      	subs	r0, r3, #2
 102:	1c82      	adds	r2, r0, #2
 104:	428a      	cmp	r2, r1
 106:	d91a      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 108:	4602      	mov	r2, r0
 10a:	f812 6f01 	ldrb.w	r6, [r2, #1]!
 10e:	4566      	cmp	r6, ip
 110:	d035      	beq.n	17e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x17e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 112:	428a      	cmp	r2, r1
 114:	d913      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 116:	7802      	ldrb	r2, [r0, #0]
 118:	4562      	cmp	r2, ip
 11a:	d034      	beq.n	186 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x186>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 11c:	4288      	cmp	r0, r1
 11e:	d90e      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 120:	4602      	mov	r2, r0
 122:	f812 6d01 	ldrb.w	r6, [r2, #-1]!
 126:	4566      	cmp	r6, ip
 128:	d031      	beq.n	18e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x18e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 12a:	428a      	cmp	r2, r1
 12c:	d907      	bls.n	13e <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x13e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 12e:	1f02      	subs	r2, r0, #4
 130:	f810 0c02 	ldrb.w	r0, [r0, #-2]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 134:	3b04      	subs	r3, #4
_ZN6memchr8fallback14reverse_search17hb3409515d36a6aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 136:	4560      	cmp	r0, ip
 138:	4610      	mov	r0, r2
 13a:	d1e2      	bne.n	102 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x102>
 13c:	e020      	b.n	180 <_ZN6memchr8fallback7memrchr17he11431db38624421E+0x180>
_ZN6memchr8fallback7memrchr17he11431db38624421E():
 13e:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
 140:	bd70      	pop	{r4, r5, r6, pc}
 142:	f1ae 0001 	sub.w	r0, lr, #1
 146:	1a41      	subs	r1, r0, r1
 148:	2001      	movs	r0, #1
 14a:	bd70      	pop	{r4, r5, r6, pc}
 14c:	f1ae 0002 	sub.w	r0, lr, #2
 150:	1a41      	subs	r1, r0, r1
 152:	2001      	movs	r0, #1
 154:	bd70      	pop	{r4, r5, r6, pc}
 156:	f1ae 0003 	sub.w	r0, lr, #3
 15a:	1a41      	subs	r1, r0, r1
 15c:	2001      	movs	r0, #1
 15e:	bd70      	pop	{r4, r5, r6, pc}
 160:	f1ae 0001 	sub.w	r0, lr, #1
 164:	1a41      	subs	r1, r0, r1
 166:	2001      	movs	r0, #1
 168:	bd70      	pop	{r4, r5, r6, pc}
 16a:	f1ae 0002 	sub.w	r0, lr, #2
 16e:	1a41      	subs	r1, r0, r1
 170:	2001      	movs	r0, #1
 172:	bd70      	pop	{r4, r5, r6, pc}
 174:	f1ae 0003 	sub.w	r0, lr, #3
 178:	1a41      	subs	r1, r0, r1
 17a:	2001      	movs	r0, #1
 17c:	bd70      	pop	{r4, r5, r6, pc}
_ZN6memchr8fallback14reverse_search17hb3409515d36a6aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 17e:	1c43      	adds	r3, r0, #1
_ZN6memchr8fallback3sub17h7d8bf4a560c93d0dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 180:	1a59      	subs	r1, r3, r1
 182:	2001      	movs	r0, #1
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
 184:	bd70      	pop	{r4, r5, r6, pc}
 186:	3b02      	subs	r3, #2
_ZN6memchr8fallback3sub17h7d8bf4a560c93d0dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 188:	1a59      	subs	r1, r3, r1
 18a:	2001      	movs	r0, #1
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
 18c:	bd70      	pop	{r4, r5, r6, pc}
 18e:	3b03      	subs	r3, #3
_ZN6memchr8fallback3sub17h7d8bf4a560c93d0dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 190:	1a59      	subs	r1, r3, r1
 192:	2001      	movs	r0, #1
_ZN6memchr8fallback7memrchr17he11431db38624421E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
 194:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN6memchr8fallback8memrchr217h105ef38da16f8d66E:

00000000 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E>:
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:205
pub fn memrchr2(n1: u8, n2: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   4:	eb02 0c03 	add.w	ip, r2, r3
_ZN6memchr8fallback11repeat_byte17h9d9fce73d276d3efE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   8:	fa5f fe81 	uxtb.w	lr, r1
   c:	fa5f f880 	uxtb.w	r8, r0
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:215
        if haystack.len() < USIZE_BYTES {
  10:	2b03      	cmp	r3, #3
  12:	d836      	bhi.n	82 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x82>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  14:	1e99      	subs	r1, r3, #2
  16:	1edc      	subs	r4, r3, #3
  18:	18d7      	adds	r7, r2, r3
  1a:	4297      	cmp	r7, r2
  1c:	f240 80c0 	bls.w	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  20:	1855      	adds	r5, r2, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  22:	f1ac 0601 	sub.w	r6, ip, #1
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  26:	7868      	ldrb	r0, [r5, #1]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  28:	4540      	cmp	r0, r8
  2a:	bf18      	it	ne
  2c:	4570      	cmpne	r0, lr
  2e:	f000 80bb 	beq.w	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
  32:	1e78      	subs	r0, r7, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  34:	4290      	cmp	r0, r2
  36:	f240 80b3 	bls.w	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  3a:	5c50      	ldrb	r0, [r2, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  3c:	f1ac 0602 	sub.w	r6, ip, #2
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  40:	4540      	cmp	r0, r8
  42:	bf18      	it	ne
  44:	4570      	cmpne	r0, lr
  46:	f000 80af 	beq.w	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  4a:	4295      	cmp	r5, r2
  4c:	f240 80a8 	bls.w	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  50:	f815 0c01 	ldrb.w	r0, [r5, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  54:	f1ac 0603 	sub.w	r6, ip, #3
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  58:	4540      	cmp	r0, r8
  5a:	bf18      	it	ne
  5c:	4570      	cmpne	r0, lr
  5e:	f000 80a3 	beq.w	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
  62:	1910      	adds	r0, r2, r4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  64:	4290      	cmp	r0, r2
  66:	f240 809b 	bls.w	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  6a:	f815 5c02 	ldrb.w	r5, [r5, #-2]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  6e:	3b04      	subs	r3, #4
  70:	4545      	cmp	r5, r8
  72:	d04d      	beq.n	110 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x110>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
  74:	3904      	subs	r1, #4
  76:	3c04      	subs	r4, #4
  78:	f1ac 0c04 	sub.w	ip, ip, #4
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
  7c:	4575      	cmp	r5, lr
  7e:	d1cb      	bne.n	18 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x18>
  80:	e046      	b.n	110 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x110>
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
  82:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
  86:	fb08 f500 	mul.w	r5, r8, r0
  8a:	fb0e f900 	mul.w	r9, lr, r0
_ZN4core10intrinsics19copy_nonoverlapping17h04a42fa70594521eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  8e:	f85c 0c04 	ldr.w	r0, [ip, #-4]
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:220
        let eq1 = contains_zero_byte(chunk ^ vn1);
  92:	ea80 0105 	eor.w	r1, r0, r5
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  96:	f1a1 3601 	sub.w	r6, r1, #16843009	; 0x1010101
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:221
        let eq2 = contains_zero_byte(chunk ^ vn2);
  9a:	ea80 0009 	eor.w	r0, r0, r9
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  9e:	ea26 0101 	bic.w	r1, r6, r1
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  a2:	f1a0 3601 	sub.w	r6, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  a6:	ea26 0000 	bic.w	r0, r6, r0
  aa:	4308      	orrs	r0, r1
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:222
        if eq1 || eq2 {
  ac:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
  b0:	d033      	beq.n	11a <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x11a>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  b2:	1e99      	subs	r1, r3, #2
  b4:	1edc      	subs	r4, r3, #3
  b6:	18d7      	adds	r7, r2, r3
  b8:	4297      	cmp	r7, r2
  ba:	d971      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  bc:	1855      	adds	r5, r2, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  be:	f1ac 0601 	sub.w	r6, ip, #1
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  c2:	7868      	ldrb	r0, [r5, #1]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  c4:	4540      	cmp	r0, r8
  c6:	bf18      	it	ne
  c8:	4570      	cmpne	r0, lr
  ca:	d06d      	beq.n	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
  cc:	1e78      	subs	r0, r7, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  ce:	4290      	cmp	r0, r2
  d0:	d966      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  d2:	5c50      	ldrb	r0, [r2, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  d4:	f1ac 0602 	sub.w	r6, ip, #2
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  d8:	4540      	cmp	r0, r8
  da:	bf18      	it	ne
  dc:	4570      	cmpne	r0, lr
  de:	d063      	beq.n	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  e0:	4295      	cmp	r5, r2
  e2:	d95d      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  e4:	f815 0c01 	ldrb.w	r0, [r5, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  e8:	f1ac 0603 	sub.w	r6, ip, #3
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  ec:	4540      	cmp	r0, r8
  ee:	bf18      	it	ne
  f0:	4570      	cmpne	r0, lr
  f2:	d059      	beq.n	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
  f4:	1910      	adds	r0, r2, r4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  f6:	4290      	cmp	r0, r2
  f8:	d952      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  fa:	f815 5c02 	ldrb.w	r5, [r5, #-2]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  fe:	3b04      	subs	r3, #4
 100:	4545      	cmp	r5, r8
 102:	d005      	beq.n	110 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x110>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
 104:	3904      	subs	r1, #4
 106:	3c04      	subs	r4, #4
 108:	f1ac 0c04 	sub.w	ip, ip, #4
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
 10c:	4575      	cmp	r5, lr
 10e:	d1d2      	bne.n	b6 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0xb6>
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
 110:	18d6      	adds	r6, r2, r3
 112:	1ab1      	subs	r1, r6, r2
 114:	2001      	movs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
}
 116:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:226
        ptr = (end_ptr as usize & !align) as *const u8;
 11a:	f02c 0003 	bic.w	r0, ip, #3
 11e:	1d16      	adds	r6, r2, #4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:228
        while ptr >= ptr_add(start_ptr, USIZE_BYTES) {
 120:	1e83      	subs	r3, r0, #2
 122:	1c99      	adds	r1, r3, #2
 124:	461f      	mov	r7, r3
 126:	42b1      	cmp	r1, r6
 128:	d312      	bcc.n	150 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x150>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:231
            let chunk = *(ptr_sub(ptr, USIZE_BYTES) as *const usize);
 12a:	f857 0c02 	ldr.w	r0, [r7, #-2]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:232
            let eq1 = contains_zero_byte(chunk ^ vn1);
 12e:	ea80 0305 	eor.w	r3, r0, r5
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:233
            let eq2 = contains_zero_byte(chunk ^ vn2);
 132:	ea80 0009 	eor.w	r0, r0, r9
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 136:	f1a3 3401 	sub.w	r4, r3, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 13a:	ea24 0303 	bic.w	r3, r4, r3
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 13e:	f1a0 3401 	sub.w	r4, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
 142:	ea24 0000 	bic.w	r0, r4, r0
 146:	4318      	orrs	r0, r3
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:234
            if eq1 || eq2 {
 148:	1f3b      	subs	r3, r7, #4
 14a:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
 14e:	d0e8      	beq.n	122 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x122>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 150:	1cb8      	adds	r0, r7, #2
 152:	4290      	cmp	r0, r2
 154:	d924      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 156:	463b      	mov	r3, r7
 158:	f813 0f01 	ldrb.w	r0, [r3, #1]!
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 15c:	4540      	cmp	r0, r8
 15e:	bf18      	it	ne
 160:	4570      	cmpne	r0, lr
 162:	d020      	beq.n	1a6 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a6>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 164:	4293      	cmp	r3, r2
 166:	d91b      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 168:	7838      	ldrb	r0, [r7, #0]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 16a:	1e8e      	subs	r6, r1, #2
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 16c:	4540      	cmp	r0, r8
 16e:	bf18      	it	ne
 170:	4570      	cmpne	r0, lr
 172:	d019      	beq.n	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 174:	4297      	cmp	r7, r2
 176:	d913      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 178:	463b      	mov	r3, r7
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 17a:	1ece      	subs	r6, r1, #3
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 17c:	f813 0d01 	ldrb.w	r0, [r3, #-1]!
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 180:	4540      	cmp	r0, r8
 182:	bf18      	it	ne
 184:	4570      	cmpne	r0, lr
 186:	d00f      	beq.n	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback14reverse_search17hfa1a07c9c49c9166E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 188:	4293      	cmp	r3, r2
 18a:	d909      	bls.n	1a0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a0>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 18c:	f817 3c02 	ldrb.w	r3, [r7, #-2]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 190:	3904      	subs	r1, #4
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 192:	4543      	cmp	r3, r8
 194:	d00c      	beq.n	1b0 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1b0>
 196:	3f04      	subs	r7, #4
 198:	4573      	cmp	r3, lr
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 19a:	460e      	mov	r6, r1
 19c:	d1d8      	bne.n	150 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x150>
 19e:	e003      	b.n	1a8 <_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E+0x1a8>
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
 1a0:	2000      	movs	r0, #0
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
}
 1a2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17h2d75d76bbf7f0fe9E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 1a6:	1c7e      	adds	r6, r7, #1
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
 1a8:	1ab1      	subs	r1, r6, r2
 1aa:	2001      	movs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
}
 1ac:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1b0:	460e      	mov	r6, r1
_ZN6memchr8fallback8memrchr217h105ef38da16f8d66E():
 1b2:	1ab1      	subs	r1, r6, r2
 1b4:	2001      	movs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
 1b6:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}

Disassembly of section .text._ZN6memchr8fallback8memrchr317h69ca9d798adf7785E:

00000000 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E>:
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:244
pub fn memrchr3(n1: u8, n2: u8, n3: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   4:	b082      	sub	sp, #8
   6:	f8dd c02c 	ldr.w	ip, [sp, #44]	; 0x2c
_ZN6memchr8fallback11repeat_byte17h9d9fce73d276d3efE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   a:	b2d5      	uxtb	r5, r2
   c:	fa5f fa81 	uxtb.w	sl, r1
  10:	fa5f f980 	uxtb.w	r9, r0
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  14:	eb03 0e0c 	add.w	lr, r3, ip
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:255
        if haystack.len() < USIZE_BYTES {
  18:	f1bc 0f03 	cmp.w	ip, #3
  1c:	d843      	bhi.n	a6 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0xa6>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  1e:	f1ac 0102 	sub.w	r1, ip, #2
  22:	f1ac 0403 	sub.w	r4, ip, #3
  26:	eb03 000c 	add.w	r0, r3, ip
  2a:	4298      	cmp	r0, r3
  2c:	f240 80ff 	bls.w	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  30:	185f      	adds	r7, r3, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  32:	f1ae 0601 	sub.w	r6, lr, #1
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  36:	787a      	ldrb	r2, [r7, #1]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  38:	42aa      	cmp	r2, r5
  3a:	f000 809a 	beq.w	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
  3e:	454a      	cmp	r2, r9
  40:	bf18      	it	ne
  42:	4552      	cmpne	r2, sl
  44:	f000 8095 	beq.w	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
  48:	3801      	subs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  4a:	4298      	cmp	r0, r3
  4c:	f240 80ef 	bls.w	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  50:	5c58      	ldrb	r0, [r3, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  52:	f1ae 0602 	sub.w	r6, lr, #2
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  56:	42a8      	cmp	r0, r5
  58:	f000 808b 	beq.w	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
  5c:	4548      	cmp	r0, r9
  5e:	bf18      	it	ne
  60:	4550      	cmpne	r0, sl
  62:	f000 8086 	beq.w	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  66:	429f      	cmp	r7, r3
  68:	f240 80e1 	bls.w	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  6c:	f817 0c01 	ldrb.w	r0, [r7, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  70:	f1ae 0603 	sub.w	r6, lr, #3
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  74:	42a8      	cmp	r0, r5
  76:	d07c      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
  78:	4548      	cmp	r0, r9
  7a:	bf18      	it	ne
  7c:	4550      	cmpne	r0, sl
  7e:	d078      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
  80:	1918      	adds	r0, r3, r4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  82:	4298      	cmp	r0, r3
  84:	f240 80d3 	bls.w	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  88:	f817 0c02 	ldrb.w	r0, [r7, #-2]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  8c:	f1ac 0c04 	sub.w	ip, ip, #4
  90:	42a8      	cmp	r0, r5
  92:	bf18      	it	ne
  94:	4548      	cmpne	r0, r9
  96:	d06a      	beq.n	16e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x16e>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
  98:	3904      	subs	r1, #4
  9a:	3c04      	subs	r4, #4
  9c:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
  a0:	4550      	cmp	r0, sl
  a2:	d1c0      	bne.n	26 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x26>
  a4:	e063      	b.n	16e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x16e>
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
  a6:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
  aa:	9500      	str	r5, [sp, #0]
  ac:	fb05 fb00 	mul.w	fp, r5, r0
  b0:	f8cd 9004 	str.w	r9, [sp, #4]
  b4:	464d      	mov	r5, r9
  b6:	fb09 f900 	mul.w	r9, r9, r0
  ba:	fb0a f800 	mul.w	r8, sl, r0
_ZN4core10intrinsics19copy_nonoverlapping17h04a42fa70594521eE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  be:	f85e 0c04 	ldr.w	r0, [lr, #-4]
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:260
        let eq1 = contains_zero_byte(chunk ^ vn1);
  c2:	ea80 0109 	eor.w	r1, r0, r9
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  c6:	f1a1 3201 	sub.w	r2, r1, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  ca:	ea22 0101 	bic.w	r1, r2, r1
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:261
        let eq2 = contains_zero_byte(chunk ^ vn2);
  ce:	ea80 0208 	eor.w	r2, r0, r8
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  d2:	f1a2 3401 	sub.w	r4, r2, #16843009	; 0x1010101
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:262
        let eq3 = contains_zero_byte(chunk ^ vn3);
  d6:	ea80 000b 	eor.w	r0, r0, fp
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  da:	ea24 0202 	bic.w	r2, r4, r2
  de:	4311      	orrs	r1, r2
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  e0:	f1a0 3201 	sub.w	r2, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  e4:	ea22 0000 	bic.w	r0, r2, r0
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:263
        if eq1 || eq2 || eq3 {
  e8:	4308      	orrs	r0, r1
  ea:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
  ee:	d045      	beq.n	17c <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x17c>
  f0:	e9dd 5800 	ldrd	r5, r8, [sp]
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  f4:	f1ac 0102 	sub.w	r1, ip, #2
  f8:	f1ac 0403 	sub.w	r4, ip, #3
  fc:	eb03 000c 	add.w	r0, r3, ip
 100:	4298      	cmp	r0, r3
 102:	f240 8094 	bls.w	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 106:	185f      	adds	r7, r3, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 108:	f1ae 0601 	sub.w	r6, lr, #1
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 10c:	787a      	ldrb	r2, [r7, #1]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 10e:	42aa      	cmp	r2, r5
 110:	d02f      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
 112:	4542      	cmp	r2, r8
 114:	bf18      	it	ne
 116:	4552      	cmpne	r2, sl
 118:	d02b      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
 11a:	3801      	subs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 11c:	4298      	cmp	r0, r3
 11e:	f240 8086 	bls.w	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 122:	5c58      	ldrb	r0, [r3, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 124:	f1ae 0602 	sub.w	r6, lr, #2
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 128:	42a8      	cmp	r0, r5
 12a:	d022      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
 12c:	4540      	cmp	r0, r8
 12e:	bf18      	it	ne
 130:	4550      	cmpne	r0, sl
 132:	d01e      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 134:	429f      	cmp	r7, r3
 136:	d97a      	bls.n	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 138:	f817 0c01 	ldrb.w	r0, [r7, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 13c:	f1ae 0603 	sub.w	r6, lr, #3
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 140:	42a8      	cmp	r0, r5
 142:	d016      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
 144:	4540      	cmp	r0, r8
 146:	bf18      	it	ne
 148:	4550      	cmpne	r0, sl
 14a:	d012      	beq.n	172 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x172>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
 14c:	1918      	adds	r0, r3, r4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 14e:	4298      	cmp	r0, r3
 150:	d96d      	bls.n	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 152:	f817 0c02 	ldrb.w	r0, [r7, #-2]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 156:	f1ac 0c04 	sub.w	ip, ip, #4
 15a:	42a8      	cmp	r0, r5
 15c:	bf18      	it	ne
 15e:	4540      	cmpne	r0, r8
 160:	d005      	beq.n	16e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x16e>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
 162:	3904      	subs	r1, #4
 164:	3c04      	subs	r4, #4
 166:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
 16a:	4550      	cmp	r0, sl
 16c:	d1c6      	bne.n	fc <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0xfc>
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
 16e:	eb03 060c 	add.w	r6, r3, ip
 172:	1af1      	subs	r1, r6, r3
 174:	2001      	movs	r0, #1
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:283
}
 176:	b002      	add	sp, #8
 178:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:267
        ptr = (end_ptr as usize & !align) as *const u8;
 17c:	f02e 0103 	bic.w	r1, lr, #3
 180:	1d18      	adds	r0, r3, #4
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:269
        while ptr >= ptr_add(start_ptr, USIZE_BYTES) {
 182:	1e8c      	subs	r4, r1, #2
 184:	1ca1      	adds	r1, r4, #2
 186:	4622      	mov	r2, r4
 188:	4281      	cmp	r1, r0
 18a:	d318      	bcc.n	1be <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x1be>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:272
            let chunk = *(ptr_sub(ptr, USIZE_BYTES) as *const usize);
 18c:	f852 4c02 	ldr.w	r4, [r2, #-2]
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:273
            let eq1 = contains_zero_byte(chunk ^ vn1);
 190:	ea84 0609 	eor.w	r6, r4, r9
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 194:	f1a6 3701 	sub.w	r7, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 198:	43b7      	bics	r7, r6
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:274
            let eq2 = contains_zero_byte(chunk ^ vn2);
 19a:	ea84 0608 	eor.w	r6, r4, r8
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 19e:	f1a6 3501 	sub.w	r5, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 1a2:	ea25 0606 	bic.w	r6, r5, r6
 1a6:	4337      	orrs	r7, r6
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:275
            let eq3 = contains_zero_byte(chunk ^ vn3);
 1a8:	ea84 060b 	eor.w	r6, r4, fp
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 1ac:	f1a6 3501 	sub.w	r5, r6, #16843009	; 0x1010101
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:276
            if eq1 || eq2 || eq3 {
 1b0:	1f14      	subs	r4, r2, #4
_ZN6memchr8fallback18contains_zero_byte17h0f5d7a07660b23c5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 1b2:	ea25 0606 	bic.w	r6, r5, r6
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:276
            if eq1 || eq2 || eq3 {
 1b6:	4337      	orrs	r7, r6
 1b8:	f017 3f80 	tst.w	r7, #2155905152	; 0x80808080
 1bc:	d0e2      	beq.n	184 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x184>
 1be:	e9dd 5400 	ldrd	r5, r4, [sp]
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 1c2:	1c90      	adds	r0, r2, #2
 1c4:	4298      	cmp	r0, r3
 1c6:	d932      	bls.n	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 1c8:	4610      	mov	r0, r2
 1ca:	f810 7f01 	ldrb.w	r7, [r0, #1]!
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1ce:	42af      	cmp	r7, r5
 1d0:	bf18      	it	ne
 1d2:	42a7      	cmpne	r7, r4
 1d4:	d025      	beq.n	222 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x222>
 1d6:	4557      	cmp	r7, sl
 1d8:	d023      	beq.n	222 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x222>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 1da:	4298      	cmp	r0, r3
 1dc:	d927      	bls.n	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 1de:	7810      	ldrb	r0, [r2, #0]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1e0:	1e8f      	subs	r7, r1, #2
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1e2:	42a8      	cmp	r0, r5
 1e4:	d01e      	beq.n	224 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x224>
 1e6:	42a0      	cmp	r0, r4
 1e8:	bf18      	it	ne
 1ea:	4550      	cmpne	r0, sl
 1ec:	d01a      	beq.n	224 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x224>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 1ee:	429a      	cmp	r2, r3
 1f0:	d91d      	bls.n	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 1f2:	4610      	mov	r0, r2
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1f4:	1ecf      	subs	r7, r1, #3
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 1f6:	f810 6d01 	ldrb.w	r6, [r0, #-1]!
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1fa:	42ae      	cmp	r6, r5
 1fc:	d012      	beq.n	224 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x224>
 1fe:	42a6      	cmp	r6, r4
 200:	bf18      	it	ne
 202:	4556      	cmpne	r6, sl
 204:	d00e      	beq.n	224 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x224>
_ZN6memchr8fallback14reverse_search17h37941f8cc0a991ceE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 206:	4298      	cmp	r0, r3
 208:	d911      	bls.n	22e <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x22e>
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 20a:	f812 0c02 	ldrb.w	r0, [r2, #-2]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 20e:	3904      	subs	r1, #4
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 210:	42a8      	cmp	r0, r5
 212:	bf18      	it	ne
 214:	42a0      	cmpne	r0, r4
 216:	d00e      	beq.n	236 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x236>
 218:	3a04      	subs	r2, #4
 21a:	4550      	cmp	r0, sl
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 21c:	460f      	mov	r7, r1
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17h7432d6903eaf70f6E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
 21e:	d1d0      	bne.n	1c2 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x1c2>
 220:	e000      	b.n	224 <_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E+0x224>
 222:	1c57      	adds	r7, r2, #1
_ZN6memchr8fallback3sub17h7d8bf4a560c93d0dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 224:	1af9      	subs	r1, r7, r3
 226:	2001      	movs	r0, #1
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:283
}
 228:	b002      	add	sp, #8
 22a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 22e:	2000      	movs	r0, #0
 230:	b002      	add	sp, #8
 232:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hc79cc334f1f0e83cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 236:	460f      	mov	r7, r1
_ZN6memchr8fallback3sub17h7d8bf4a560c93d0dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 238:	1ac9      	subs	r1, r1, r3
 23a:	2001      	movs	r0, #1
_ZN6memchr8fallback8memrchr317h69ca9d798adf7785E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:283
}
 23c:	b002      	add	sp, #8
 23e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

mylib-9b5f404664613177.mylib.9ieylas6-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 mylib.9ieylas6-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000006f l       .debug_str	00000000 
00000075 l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
0000007f l       .debug_str	00000000 
00000086 l       .debug_str	00000000 
00000098 l       .debug_str	00000000 
000000a1 l       .debug_str	00000000 
000000b0 l       .debug_str	00000000 
000000b4 l       .debug_str	00000000 
000000bc l       .debug_str	00000000 
000000c1 l       .debug_str	00000000 
000000c8 l       .debug_str	00000000 
000000cc l       .debug_str	00000000 
000000d1 l       .debug_str	00000000 
000000d5 l       .debug_str	00000000 
000000db l       .debug_str	00000000 
000000e2 l       .debug_str	00000000 
000000e5 l       .debug_str	00000000 
000000f1 l       .debug_str	00000000 
000000f9 l       .debug_str	00000000 
000000fd l       .debug_str	00000000 
00000100 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
0000011d l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019c l       .debug_str	00000000 
000001a0 l       .debug_str	00000000 
00000209 l       .debug_str	00000000 
00000214 l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
000002b8 l       .debug_str	00000000 
000002c2 l       .debug_str	00000000 
00000306 l       .debug_str	00000000 
00000352 l       .debug_str	00000000 
0000035b l       .debug_str	00000000 
0000036b l       .debug_str	00000000 
00000373 l       .debug_str	00000000 
000003cf l       .debug_str	00000000 
00000433 l       .debug_str	00000000 
0000043f l       .debug_str	00000000 
00000448 l       .debug_str	00000000 
00000454 l       .debug_str	00000000 
00000460 l       .debug_str	00000000 
00000469 l       .debug_str	00000000 
00000471 l       .debug_str	00000000 
0000047b l       .debug_str	00000000 
00000483 l       .debug_str	00000000 
0000048d l       .debug_str	00000000 
000004a2 l       .debug_str	00000000 
000004a9 l       .debug_str	00000000 
000004d0 l       .debug_str	00000000 
000004d7 l       .debug_str	00000000 
000004df l       .debug_str	00000000 
000004e9 l       .debug_str	00000000 
000004f4 l       .debug_str	00000000 
000004fd l       .debug_str	00000000 
00000508 l       .debug_str	00000000 
00000514 l       .debug_str	00000000 
00000518 l       .debug_str	00000000 
00000521 l       .debug_str	00000000 
00000528 l       .debug_str	00000000 
00000530 l       .debug_str	00000000 
00000538 l       .debug_str	00000000 
00000542 l       .debug_str	00000000 
00000548 l       .debug_str	00000000 
0000054f l       .debug_str	00000000 
00000556 l       .debug_str	00000000 
00000583 l       .debug_str	00000000 
000005b8 l       .debug_str	00000000 
000005be l       .debug_str	00000000 
000005c4 l       .debug_str	00000000 
000005d3 l       .debug_str	00000000 
000005e3 l       .debug_str	00000000 
000005f3 l       .debug_str	00000000 
000005fb l       .debug_str	00000000 
0000062b l       .debug_str	00000000 
00000690 l       .debug_str	00000000 
000006fd l       .debug_str	00000000 
00000704 l       .debug_str	00000000 
0000070c l       .debug_str	00000000 
00000715 l       .debug_str	00000000 
00000733 l       .debug_str	00000000 
00000743 l       .debug_str	00000000 
00000751 l       .debug_str	00000000 
0000075c l       .debug_str	00000000 
00000769 l       .debug_str	00000000 
00000778 l       .debug_str	00000000 
0000078e l       .debug_str	00000000 
00000798 l       .debug_str	00000000 
000007a1 l       .debug_str	00000000 
000007aa l       .debug_str	00000000 
000007d7 l       .debug_str	00000000 
000007ed l       .debug_str	00000000 
000007f8 l       .debug_str	00000000 
0000080e l       .debug_str	00000000 
00000816 l       .debug_str	00000000 
0000083e l       .debug_str	00000000 
00000855 l       .debug_str	00000000 
0000085a l       .debug_str	00000000 
00000862 l       .debug_str	00000000 
0000086b l       .debug_str	00000000 
00000874 l       .debug_str	00000000 
0000087d l       .debug_str	00000000 
00000885 l       .debug_str	00000000 
0000088c l       .debug_str	00000000 
00000898 l       .debug_str	00000000 
000008a3 l       .debug_str	00000000 
000008ab l       .debug_str	00000000 
000008b3 l       .debug_str	00000000 
000009bd l       .debug_str	00000000 
00000acf l       .debug_str	00000000 
00000add l       .debug_str	00000000 
00000ae8 l       .debug_str	00000000 
00000af2 l       .debug_str	00000000 
00000b06 l       .debug_str	00000000 
00000b11 l       .debug_str	00000000 
00000b46 l       .debug_str	00000000 
00000bcf l       .debug_str	00000000 
00000c60 l       .debug_str	00000000 
00000c6e l       .debug_str	00000000 
00000cd4 l       .debug_str	00000000 
00000d42 l       .debug_str	00000000 
00000d58 l       .debug_str	00000000 
00000d68 l       .debug_str	00000000 
00000d77 l       .debug_str	00000000 
00000d7b l       .debug_str	00000000 
00000d82 l       .debug_str	00000000 
00000d88 l       .debug_str	00000000 
00000d8c l       .debug_str	00000000 
00000d92 l       .debug_str	00000000 
00000d98 l       .debug_str	00000000 
00000da4 l       .debug_str	00000000 
00000dac l       .debug_str	00000000 
00000db2 l       .debug_str	00000000 
00000dba l       .debug_str	00000000 
00000dc0 l       .debug_str	00000000 
00000de3 l       .debug_str	00000000 
00000df3 l       .debug_str	00000000 
00000e2d l       .debug_str	00000000 
00000e74 l       .debug_str	00000000 
00000ec3 l       .debug_str	00000000 
00000ec7 l       .debug_str	00000000 
00000ecd l       .debug_str	00000000 
00000ed3 l       .debug_str	00000000 
00000ed9 l       .debug_str	00000000 
00000eeb l       .debug_str	00000000 
00000f27 l       .debug_str	00000000 
00000f70 l       .debug_str	00000000 
00000fc1 l       .debug_str	00000000 
00000fc5 l       .debug_str	00000000 
00000fcb l       .debug_str	00000000 
00000fd1 l       .debug_str	00000000 
00000fd7 l       .debug_str	00000000 
00000fe9 l       .debug_str	00000000 
00001025 l       .debug_str	00000000 
0000106e l       .debug_str	00000000 
000010bf l       .debug_str	00000000 
000010c3 l       .debug_str	00000000 
000010c9 l       .debug_str	00000000 
000010cf l       .debug_str	00000000 
000010d5 l       .debug_str	00000000 
000010db l       .debug_str	00000000 
000010ec l       .debug_str	00000000 
00001127 l       .debug_str	00000000 
0000116f l       .debug_str	00000000 
000011bf l       .debug_str	00000000 
000011c4 l       .debug_str	00000000 
000011c9 l       .debug_str	00000000 
000011cd l       .debug_str	00000000 
000011d3 l       .debug_str	00000000 
000011d9 l       .debug_str	00000000 
000011df l       .debug_str	00000000 
000011f0 l       .debug_str	00000000 
0000122b l       .debug_str	00000000 
00001273 l       .debug_str	00000000 
000012c3 l       .debug_str	00000000 
000012c7 l       .debug_str	00000000 
000012d0 l       .debug_str	00000000 
000012e1 l       .debug_str	00000000 
0000131c l       .debug_str	00000000 
00001364 l       .debug_str	00000000 
000013b4 l       .debug_str	00000000 
000013b9 l       .debug_str	00000000 
000013bd l       .debug_str	00000000 
000013c6 l       .debug_str	00000000 
000013cd l       .debug_str	00000000 
000013d5 l       .debug_str	00000000 
000013e7 l       .debug_str	00000000 
00001423 l       .debug_str	00000000 
0000146c l       .debug_str	00000000 
000014bd l       .debug_str	00000000 
000014c1 l       .debug_str	00000000 
000014c7 l       .debug_str	00000000 
000014cd l       .debug_str	00000000 
000014d3 l       .debug_str	00000000 
000014d9 l       .debug_str	00000000 
000014e1 l       .debug_str	00000000 
000014ef l       .debug_str	00000000 
000014fe l       .debug_str	00000000 
0000150f l       .debug_str	00000000 
0000151a l       .debug_str	00000000 
00001525 l       .debug_str	00000000 
00001530 l       .debug_str	00000000 
00001537 l       .debug_str	00000000 
0000155a l       .debug_str	00000000 
0000156c l       .debug_str	00000000 
000015a8 l       .debug_str	00000000 
000015f1 l       .debug_str	00000000 
00001642 l       .debug_str	00000000 
00001646 l       .debug_str	00000000 
00001650 l       .debug_str	00000000 
00001662 l       .debug_str	00000000 
0000169e l       .debug_str	00000000 
000016e7 l       .debug_str	00000000 
00001738 l       .debug_str	00000000 
0000173d l       .debug_str	00000000 
00001747 l       .debug_str	00000000 
00001759 l       .debug_str	00000000 
00001795 l       .debug_str	00000000 
000017de l       .debug_str	00000000 
0000182f l       .debug_str	00000000 
00001843 l       .debug_str	00000000 
00001847 l       .debug_str	00000000 
00001855 l       .debug_str	00000000 
00001865 l       .debug_str	00000000 
0000186e l       .debug_str	00000000 
00001879 l       .debug_str	00000000 
00001888 l       .debug_str	00000000 
0000189d l       .debug_str	00000000 
000018d5 l       .debug_str	00000000 
00001980 l       .debug_str	00000000 
00001a33 l       .debug_str	00000000 
00001a3e l       .debug_str	00000000 
00001a47 l       .debug_str	00000000 
00001a68 l       .debug_str	00000000 
00001a7b l       .debug_str	00000000 
00001ab8 l       .debug_str	00000000 
00001b49 l       .debug_str	00000000 
00001be2 l       .debug_str	00000000 
00001bfe l       .debug_str	00000000 
00001c51 l       .debug_str	00000000 
00001cac l       .debug_str	00000000 
00001cc9 l       .debug_str	00000000 
00001cdd l       .debug_str	00000000 
00001d30 l       .debug_str	00000000 
00001d8b l       .debug_str	00000000 
00001da1 l       .debug_str	00000000 
00001db5 l       .debug_str	00000000 
00001e03 l       .debug_str	00000000 
00001e59 l       .debug_str	00000000 
00001e62 l       .debug_str	00000000 
00001e70 l       .debug_str	00000000 
00001ea8 l       .debug_str	00000000 
00001eae l       .debug_str	00000000 
00001eb6 l       .debug_str	00000000 
00001ebd l       .debug_str	00000000 
00001ec5 l       .debug_str	00000000 
00001ed0 l       .debug_str	00000000 
00001ed8 l       .debug_str	00000000 
00001ee7 l       .debug_str	00000000 
00001eeb l       .debug_str	00000000 
00001ef6 l       .debug_str	00000000 
00001f02 l       .debug_str	00000000 
00001f0d l       .debug_str	00000000 
00001f1e l       .debug_str	00000000 
00001f24 l       .debug_str	00000000 
00001f2c l       .debug_str	00000000 
00001f33 l       .debug_str	00000000 
00001f3d l       .debug_str	00000000 
00001f45 l       .debug_str	00000000 
00001f4d l       .debug_str	00000000 
00001f76 l       .debug_str	00000000 
00001f81 l       .debug_str	00000000 
00001f8d l       .debug_str	00000000 
00001f95 l       .debug_str	00000000 
00001f9e l       .debug_str	00000000 
00001fa9 l       .debug_str	00000000 
00001fb0 l       .debug_str	00000000 
00001fbb l       .debug_str	00000000 
00001fc6 l       .debug_str	00000000 
00001fd6 l       .debug_str	00000000 
00001fe0 l       .debug_str	00000000 
00001fe6 l       .debug_str	00000000 
0000200f l       .debug_str	00000000 
0000204e l       .debug_str	00000000 
00002095 l       .debug_str	00000000 
0000209c l       .debug_str	00000000 
000020a4 l       .debug_str	00000000 
000020bb l       .debug_str	00000000 
000020c4 l       .debug_str	00000000 
000020d4 l       .debug_str	00000000 
0000210e l       .debug_str	00000000 
00002123 l       .debug_str	00000000 
0000212c l       .debug_str	00000000 
00002190 l       .debug_str	00000000 
000021fc l       .debug_str	00000000 
00002206 l       .debug_str	00000000 
00002216 l       .debug_str	00000000 
0000222b l       .debug_str	00000000 
00002233 l       .debug_str	00000000 
0000229e l       .debug_str	00000000 
00002311 l       .debug_str	00000000 
00002318 l       .debug_str	00000000 
00002320 l       .debug_str	00000000 
0000233e l       .debug_str	00000000 
0000234e l       .debug_str	00000000 
00002388 l       .debug_str	00000000 
0000239d l       .debug_str	00000000 
000023b0 l       .debug_str	00000000 
000023c5 l       .debug_str	00000000 
000023cc l       .debug_str	00000000 
000023e1 l       .debug_str	00000000 
00002412 l       .debug_str	00000000 
00002495 l       .debug_str	00000000 
00002520 l       .debug_str	00000000 
00002527 l       .debug_str	00000000 
0000252f l       .debug_str	00000000 
0000254d l       .debug_str	00000000 
0000255d l       .debug_str	00000000 
0000259f l       .debug_str	00000000 
000025a9 l       .debug_str	00000000 
000025b6 l       .debug_str	00000000 
000025ec l       .debug_str	00000000 
000025ff l       .debug_str	00000000 
0000263b l       .debug_str	00000000 
0000264c l       .debug_str	00000000 
00002651 l       .debug_str	00000000 
0000268b l       .debug_str	00000000 
00002698 l       .debug_str	00000000 
0000269c l       .debug_str	00000000 
000026a8 l       .debug_str	00000000 
000026de l       .debug_str	00000000 
000026e5 l       .debug_str	00000000 
000026e8 l       .debug_str	00000000 
000026ec l       .debug_str	00000000 
000026f3 l       .debug_str	00000000 
000026f7 l       .debug_str	00000000 
000026fa l       .debug_str	00000000 
000026fd l       .debug_str	00000000 
00002702 l       .debug_str	00000000 
00002708 l       .debug_str	00000000 
0000270f l       .debug_str	00000000 
00002717 l       .debug_str	00000000 
00002721 l       .debug_str	00000000 
00002729 l       .debug_str	00000000 
00002734 l       .debug_str	00000000 
0000273f l       .debug_str	00000000 
0000274c l       .debug_str	00000000 
00002757 l       .debug_str	00000000 
0000275f l       .debug_str	00000000 
0000276a l       .debug_str	00000000 
00002775 l       .debug_str	00000000 
0000277f l       .debug_str	00000000 
0000278a l       .debug_str	00000000 
00002795 l       .debug_str	00000000 
000027a2 l       .debug_str	00000000 
000027ae l       .debug_str	00000000 
000027bb l       .debug_str	00000000 
000027c9 l       .debug_str	00000000 
000027d3 l       .debug_str	00000000 
000027e0 l       .debug_str	00000000 
000027ec l       .debug_str	00000000 
000027f0 l       .debug_str	00000000 
000027f9 l       .debug_str	00000000 
00002856 l       .debug_str	00000000 
0000285b l       .debug_str	00000000 
00002860 l       .debug_str	00000000 
00002862 l       .debug_str	00000000 
00002868 l       .debug_str	00000000 
0000286d l       .debug_str	00000000 
00002872 l       .debug_str	00000000 
00002878 l       .debug_str	00000000 
0000287e l       .debug_str	00000000 
0000288c l       .debug_str	00000000 
00002896 l       .debug_str	00000000 
0000289a l       .debug_str	00000000 
000028a2 l       .debug_str	00000000 
000028aa l       .debug_str	00000000 
000028b1 l       .debug_str	00000000 
000028bd l       .debug_str	00000000 
000028c8 l       .debug_str	00000000 
000028cf l       .debug_str	00000000 
000028d5 l       .debug_str	00000000 
000028d9 l       .debug_str	00000000 
000028df l       .debug_str	00000000 
000028e5 l       .debug_str	00000000 
000028e8 l       .debug_str	00000000 
000028f7 l       .debug_str	00000000 
000028fb l       .debug_str	00000000 
00002904 l       .debug_str	00000000 
00002910 l       .debug_str	00000000 
00002929 l       .debug_str	00000000 
0000292e l       .debug_str	00000000 
0000293f l       .debug_str	00000000 
00002949 l       .debug_str	00000000 
000029a7 l       .debug_str	00000000 
000029b2 l       .debug_str	00000000 
000029cf l       .debug_str	00000000 
000029d3 l       .debug_str	00000000 
000029db l       .debug_str	00000000 
000029f2 l       .debug_str	00000000 
00002a16 l       .debug_str	00000000 
00002a32 l       .debug_str	00000000 
00002a37 l       .debug_str	00000000 
00002a40 l       .debug_str	00000000 
00002a47 l       .debug_str	00000000 
00002a60 l       .debug_str	00000000 
00002a6a l       .debug_str	00000000 
00002a84 l       .debug_str	00000000 
00002ae0 l       .debug_str	00000000 
00002ae4 l       .debug_str	00000000 
00002ae8 l       .debug_str	00000000 
00002af1 l       .debug_str	00000000 
00002af6 l       .debug_str	00000000 
00002aff l       .debug_str	00000000 
00002b41 l       .debug_str	00000000 
00002b8b l       .debug_str	00000000 
00002b92 l       .debug_str	00000000 
00002ba0 l       .debug_str	00000000 
00002bad l       .debug_str	00000000 
00002bd5 l       .debug_str	00000000 
00002c09 l       .debug_str	00000000 
00002c11 l       .debug_str	00000000 
00002c1b l       .debug_str	00000000 
00002c21 l       .debug_str	00000000 
00002c26 l       .debug_str	00000000 
00002c2e l       .debug_str	00000000 
00002c37 l       .debug_str	00000000 
00002c4d l       .debug_str	00000000 
00002c6b l       .debug_str	00000000 
00002c74 l       .debug_str	00000000 
00002c7d l       .debug_str	00000000 
00002c93 l       .debug_str	00000000 
00002cb1 l       .debug_str	00000000 
00002cb6 l       .debug_str	00000000 
00002cba l       .debug_str	00000000 
00002cc3 l       .debug_str	00000000 
00002cd9 l       .debug_str	00000000 
00002cf7 l       .debug_str	00000000 
00002cfe l       .debug_str	00000000 
00002d13 l       .debug_str	00000000 
00002d30 l       .debug_str	00000000 
00002d38 l       .debug_str	00000000 
00002d42 l       .debug_str	00000000 
00002d59 l       .debug_str	00000000 
00002d78 l       .debug_str	00000000 
00002d82 l       .debug_str	00000000 
00002d88 l       .debug_str	00000000 
00002d95 l       .debug_str	00000000 
00002d99 l       .debug_str	00000000 
00002da1 l       .debug_str	00000000 
00002df6 l       .debug_str	00000000 
00002e53 l       .debug_str	00000000 
00002e5b l       .debug_str	00000000 
00002e60 l       .debug_str	00000000 
00002e6d l       .debug_str	00000000 
00002e73 l       .debug_str	00000000 
00002e7c l       .debug_str	00000000 
00002ea5 l       .debug_str	00000000 
00002efa l       .debug_str	00000000 
00002f57 l       .debug_str	00000000 
00002f60 l       .debug_str	00000000 
00002f89 l       .debug_str	00000000 
00002fde l       .debug_str	00000000 
0000303b l       .debug_str	00000000 
00003045 l       .debug_str	00000000 
0000306e l       .debug_str	00000000 
000030c3 l       .debug_str	00000000 
00003120 l       .debug_str	00000000 
00003126 l       .debug_str	00000000 
0000314f l       .debug_str	00000000 
000031a4 l       .debug_str	00000000 
00003201 l       .debug_str	00000000 
0000320a l       .debug_str	00000000 
00003233 l       .debug_str	00000000 
00003288 l       .debug_str	00000000 
000032e5 l       .debug_str	00000000 
00003300 l       .debug_str	00000000 
00003306 l       .debug_str	00000000 
0000330f l       .debug_str	00000000 
00003316 l       .debug_str	00000000 
00003323 l       .debug_str	00000000 
0000335c l       .debug_str	00000000 
0000339d l       .debug_str	00000000 
000033a4 l       .debug_str	00000000 
000033b7 l       .debug_str	00000000 
000033d2 l       .debug_str	00000000 
000033ec l       .debug_str	00000000 
000033f1 l       .debug_str	00000000 
00003402 l       .debug_str	00000000 
0000341b l       .debug_str	00000000 
0000342c l       .debug_str	00000000 
00003445 l       .debug_str	00000000 
00003456 l       .debug_str	00000000 
0000346f l       .debug_str	00000000 
00003481 l       .debug_str	00000000 
0000349b l       .debug_str	00000000 
000034ab l       .debug_str	00000000 
000034c3 l       .debug_str	00000000 
000034c9 l       .debug_str	00000000 
000034e3 l       .debug_str	00000000 
000034e7 l       .debug_str	00000000 
000034eb l       .debug_str	00000000 
000034f0 l       .debug_str	00000000 
000034fc l       .debug_str	00000000 
0000352e l       .debug_str	00000000 
00003538 l       .debug_str	00000000 
00003544 l       .debug_str	00000000 
00003576 l       .debug_str	00000000 
0000357b l       .debug_str	00000000 
00003582 l       .debug_str	00000000 
000035ab l       .debug_str	00000000 
000035d3 l       .debug_str	00000000 
00003623 l       .debug_str	00000000 
0000364b l       .debug_str	00000000 
0000368d l       .debug_str	00000000 
000036b5 l       .debug_str	00000000 
000036e9 l       .debug_str	00000000 
00003711 l       .debug_str	00000000 
00003752 l       .debug_str	00000000 
0000377a l       .debug_str	00000000 
000037ad l       .debug_str	00000000 
000037d5 l       .debug_str	00000000 
00003801 l       .debug_str	00000000 
00003806 l       .debug_str	00000000 
0000380c l       .debug_str	00000000 
00003816 l       .debug_str	00000000 
0000381f l       .debug_str	00000000 
00003828 l       .debug_str	00000000 
00003833 l       .debug_str	00000000 
0000383d l       .debug_str	00000000 
0000386b l       .debug_str	00000000 
00003883 l       .debug_str	00000000 
0000388d l       .debug_str	00000000 
000038b7 l       .debug_str	00000000 
000038bf l       .debug_str	00000000 
000038c6 l       .debug_str	00000000 
000038f1 l       .debug_str	00000000 
00003921 l       .debug_str	00000000 
0000393a l       .debug_str	00000000 
00003945 l       .debug_str	00000000 
0000396d l       .debug_str	00000000 
0000399b l       .debug_str	00000000 
000039a5 l       .debug_str	00000000 
000039ad l       .debug_str	00000000 
000039b4 l       .debug_str	00000000 
000039bb l       .debug_str	00000000 
000039c0 l       .debug_str	00000000 
000039ea l       .debug_str	00000000 
00003a19 l       .debug_str	00000000 
00003a31 l       .debug_str	00000000 
00003a3b l       .debug_str	00000000 
00003a63 l       .debug_str	00000000 
00003a90 l       .debug_str	00000000 
00003ab8 l       .debug_str	00000000 
00003ae2 l       .debug_str	00000000 
00003aea l       .debug_str	00000000 
00003af3 l       .debug_str	00000000 
00003b01 l       .debug_str	00000000 
00003b08 l       .debug_str	00000000 
00003b0f l       .debug_str	00000000 
00003b1f l       .debug_str	00000000 
00003b28 l       .debug_str	00000000 
00003b36 l       .debug_str	00000000 
00003b44 l       .debug_str	00000000 
00003b50 l       .debug_str	00000000 
00003b5c l       .debug_str	00000000 
00003b65 l       .debug_str	00000000 
00003b74 l       .debug_str	00000000 
00003b7c l       .debug_str	00000000 
00003b95 l       .debug_str	00000000 
00003ba6 l       .debug_str	00000000 
00003bae l       .debug_str	00000000 
00003bc8 l       .debug_str	00000000 
00003bd4 l       .debug_str	00000000 
00003c00 l       .debug_str	00000000 
00003c19 l       .debug_str	00000000 
00003c24 l       .debug_str	00000000 
00003c4f l       .debug_str	00000000 
00003c58 l       .debug_str	00000000 
00003c73 l       .debug_str	00000000 
00003c80 l       .debug_str	00000000 
00003cad l       .debug_str	00000000 
00003cb5 l       .debug_str	00000000 
00003cdd l       .debug_str	00000000 
00003cf3 l       .debug_str	00000000 
00003cfe l       .debug_str	00000000 
00003d02 l       .debug_str	00000000 
00003d1d l       .debug_str	00000000 
00003d25 l       .debug_str	00000000 
00003d4d l       .debug_str	00000000 
00003d78 l       .debug_str	00000000 
00003da0 l       .debug_str	00000000 
00003dce l       .debug_str	00000000 
00003df6 l       .debug_str	00000000 
00003e29 l       .debug_str	00000000 
00003e51 l       .debug_str	00000000 
00003e7c l       .debug_str	00000000 
00003e85 l       .debug_str	00000000 
00003e9a l       .debug_str	00000000 
00003ea5 l       .debug_str	00000000 
00003eac l       .debug_str	00000000 
00003ed4 l       .debug_str	00000000 
00003efe l       .debug_str	00000000 
00003f26 l       .debug_str	00000000 
00003f61 l       .debug_str	00000000 
00003f89 l       .debug_str	00000000 
00003fc6 l       .debug_str	00000000 
00003fee l       .debug_str	00000000 
0000402e l       .debug_str	00000000 
00004056 l       .debug_str	00000000 
0000408a l       .debug_str	00000000 
00004093 l       .debug_str	00000000 
000040a6 l       .debug_str	00000000 
000040b1 l       .debug_str	00000000 
000040c1 l       .debug_str	00000000 
000040dd l       .debug_str	00000000 
000040eb l       .debug_str	00000000 
00004113 l       .debug_str	00000000 
0000414e l       .debug_str	00000000 
00004153 l       .debug_str	00000000 
0000415f l       .debug_str	00000000 
00004161 l       .debug_str	00000000 
00004164 l       .debug_str	00000000 
00004175 l       .debug_str	00000000 
0000418e l       .debug_str	00000000 
00004192 l       .debug_str	00000000 
0000419c l       .debug_str	00000000 
000041a1 l       .debug_str	00000000 
000041a8 l       .debug_str	00000000 
000041b0 l       .debug_str	00000000 
000041b8 l       .debug_str	00000000 
000041bf l       .debug_str	00000000 
000041c6 l       .debug_str	00000000 
000041ed l       .debug_str	00000000 
00004240 l       .debug_str	00000000 
0000429b l       .debug_str	00000000 
000042b4 l       .debug_str	00000000 
000042bf l       .debug_str	00000000 
000042ee l       .debug_str	00000000 
00004322 l       .debug_str	00000000 
00004378 l       .debug_str	00000000 
000043d6 l       .debug_str	00000000 
000043fe l       .debug_str	00000000 
00004441 l       .debug_str	00000000 
00004450 l       .debug_str	00000000 
0000445b l       .debug_str	00000000 
0000446a l       .debug_str	00000000 
0000447f l       .debug_str	00000000 
00004497 l       .debug_str	00000000 
000044ea l       .debug_str	00000000 
00004545 l       .debug_str	00000000 
0000455a l       .debug_str	00000000 
00004573 l       .debug_str	00000000 
0000459b l       .debug_str	00000000 
000045e1 l       .debug_str	00000000 
00004613 l       .debug_str	00000000 
00004621 l       .debug_str	00000000 
00004625 l       .debug_str	00000000 
0000462b l       .debug_str	00000000 
00004639 l       .debug_str	00000000 
00004677 l       .debug_str	00000000 
00004687 l       .debug_str	00000000 
0000468b l       .debug_str	00000000 
00004690 l       .debug_str	00000000 
00004695 l       .debug_str	00000000 
0000469b l       .debug_str	00000000 
000046ab l       .debug_str	00000000 
000046b7 l       .debug_str	00000000 
000046c3 l       .debug_str	00000000 
000046cf l       .debug_str	00000000 
000046dc l       .debug_str	00000000 
000046e8 l       .debug_str	00000000 
000046f6 l       .debug_str	00000000 
0000470d l       .debug_str	00000000 
00004722 l       .debug_str	00000000 
00004725 l       .debug_str	00000000 
00004745 l       .debug_str	00000000 
0000474e l       .debug_str	00000000 
00004788 l       .debug_str	00000000 
00004799 l       .debug_str	00000000 
0000479b l       .debug_str	00000000 
000047ca l       .debug_str	00000000 
000047d5 l       .debug_str	00000000 
000047ef l       .debug_str	00000000 
000047fb l       .debug_str	00000000 
00004805 l       .debug_str	00000000 
0000480b l       .debug_str	00000000 
00004810 l       .debug_str	00000000 
00004821 l       .debug_str	00000000 
0000482a l       .debug_str	00000000 
00004832 l       .debug_str	00000000 
0000483c l       .debug_str	00000000 
00004849 l       .debug_str	00000000 
00004890 l       .debug_str	00000000 
000048ae l       .debug_str	00000000 
000048b7 l       .debug_str	00000000 
000048e7 l       .debug_str	00000000 
000048f0 l       .debug_str	00000000 
000048f6 l       .debug_str	00000000 
0000493a l       .debug_str	00000000 
00004955 l       .debug_str	00000000 
0000495d l       .debug_str	00000000 
00004966 l       .debug_str	00000000 
00004970 l       .debug_str	00000000 
00004975 l       .debug_str	00000000 
0000497a l       .debug_str	00000000 
0000497f l       .debug_str	00000000 
0000498d l       .debug_str	00000000 
00004997 l       .debug_str	00000000 
00004a1a l       .debug_str	00000000 
00004a24 l       .debug_str	00000000 
00004a2a l       .debug_str	00000000 
00004a30 l       .debug_str	00000000 
00004a34 l       .debug_str	00000000 
00004a41 l       .debug_str	00000000 
00004ac7 l       .debug_str	00000000 
00004ad6 l       .debug_str	00000000 
00004ad8 l       .debug_str	00000000 
00004b4d l       .debug_str	00000000 
00004b78 l       .debug_str	00000000 
00004b7e l       .debug_str	00000000 
00004b85 l       .debug_str	00000000 
00004b91 l       .debug_str	00000000 
00004b99 l       .debug_str	00000000 
00004ba2 l       .debug_str	00000000 
00004ba7 l       .debug_str	00000000 
00004baa l       .debug_str	00000000 
00004bb3 l       .debug_str	00000000 
00004bba l       .debug_str	00000000 
00004bbd l       .debug_str	00000000 
00004bc3 l       .debug_str	00000000 
00004bcd l       .debug_str	00000000 
00004bd5 l       .debug_str	00000000 
00004bdb l       .debug_str	00000000 
00004be6 l       .debug_str	00000000 
00004bef l       .debug_str	00000000 
00004c12 l       .debug_str	00000000 
00004c31 l       .debug_str	00000000 
00004c58 l       .debug_str	00000000 
00004c62 l       .debug_str	00000000 
00004c94 l       .debug_str	00000000 
00004c9b l       .debug_str	00000000 
00004cd7 l       .debug_str	00000000 
00004cea l       .debug_str	00000000 
00004cf0 l       .debug_str	00000000 
00004d34 l       .debug_str	00000000 
00004d4a l       .debug_str	00000000 
00004d53 l       .debug_str	00000000 
00004d57 l       .debug_str	00000000 
00004d99 l       .debug_str	00000000 
00004dab l       .debug_str	00000000 
00004db4 l       .debug_str	00000000 
00004db8 l       .debug_str	00000000 
00004de2 l       .debug_str	00000000 
00004de7 l       .debug_str	00000000 
00004e2f l       .debug_str	00000000 
00004e38 l       .debug_str	00000000 
00004e80 l       .debug_str	00000000 
00004e88 l       .debug_str	00000000 
00004f00 l       .debug_str	00000000 
00004f08 l       .debug_str	00000000 
00004f7f l       .debug_str	00000000 
00005014 l       .debug_str	00000000 
0000509b l       .debug_str	00000000 
00005113 l       .debug_str	00000000 
00005198 l       .debug_str	00000000 
0000520f l       .debug_str	00000000 
0000527f l       .debug_str	00000000 
000052f1 l       .debug_str	00000000 
00005362 l       .debug_str	00000000 
000053d0 l       .debug_str	00000000 
0000543f l       .debug_str	00000000 
000054b1 l       .debug_str	00000000 
00005528 l       .debug_str	00000000 
00005597 l       .debug_str	00000000 
00005605 l       .debug_str	00000000 
0000568c l       .debug_str	00000000 
0000570b l       .debug_str	00000000 
0000578c l       .debug_str	00000000 
00005810 l       .debug_str	00000000 
00005897 l       .debug_str	00000000 
000058a3 l       .debug_str	00000000 
000058af l       .debug_str	00000000 
000058c4 l       .debug_str	00000000 
0000593c l       .debug_str	00000000 
000059bb l       .debug_str	00000000 
00005a01 l       .debug_str	00000000 
00005a17 l       .debug_str	00000000 
00005a9f l       .debug_str	00000000 
00005b2a l       .debug_str	00000000 
00005bbc l       .debug_str	00000000 
00005bc1 l       .debug_str	00000000 
00005c00 l       .debug_str	00000000 
00005c11 l       .debug_str	00000000 
00005c4c l       .debug_str	00000000 
00005c5e l       .debug_str	00000000 
00005c63 l       .debug_str	00000000 
00005c65 l       .debug_str	00000000 
00005c77 l       .debug_str	00000000 
00005c7d l       .debug_str	00000000 
00005ce2 l       .debug_str	00000000 
00005cea l       .debug_str	00000000 
00005cef l       .debug_str	00000000 
00005cfc l       .debug_str	00000000 
00005d09 l       .debug_str	00000000 
00005d10 l       .debug_str	00000000 
00005d20 l       .debug_str	00000000 
00005d32 l       .debug_str	00000000 
00005d3e l       .debug_str	00000000 
00005d43 l       .debug_str	00000000 
00005d4b l       .debug_str	00000000 
00005d4f l       .debug_str	00000000 
00005d54 l       .debug_str	00000000 
00005d5c l       .debug_str	00000000 
00005d72 l       .debug_str	00000000 
00005d90 l       .debug_str	00000000 
00005d99 l       .debug_str	00000000 
00005d9e l       .debug_str	00000000 
00005da3 l       .debug_str	00000000 
00005da7 l       .debug_str	00000000 
00005db0 l       .debug_str	00000000 
00005dba l       .debug_str	00000000 
00005dd2 l       .debug_str	00000000 
00005de9 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.11	00000010 .Lanon.9efeb2f06c0a343721ec0c21943e311a.11
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.13	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.13
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.14	00000011 .Lanon.9efeb2f06c0a343721ec0c21943e311a.14
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.15	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.15
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.17	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.17
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.18	00000016 .Lanon.9efeb2f06c0a343721ec0c21943e311a.18
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.2	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.2
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.20	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.20
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.21	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.21
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.22	00000019 .Lanon.9efeb2f06c0a343721ec0c21943e311a.22
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.23	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.23
00000000 l     O .rodata.cst8	00000008 .Lanon.9efeb2f06c0a343721ec0c21943e311a.24
00000000 l     O .rodata.cst16	00000010 .Lanon.9efeb2f06c0a343721ec0c21943e311a.25
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.26	00000010 .Lanon.9efeb2f06c0a343721ec0c21943e311a.26
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.28	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.28
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.29	00000010 .Lanon.9efeb2f06c0a343721ec0c21943e311a.29
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.3	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.3
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.30	00000010 .Lanon.9efeb2f06c0a343721ec0c21943e311a.30
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.31	00000011 .Lanon.9efeb2f06c0a343721ec0c21943e311a.31
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.32	00000011 .Lanon.9efeb2f06c0a343721ec0c21943e311a.32
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.33	00000010 .Lanon.9efeb2f06c0a343721ec0c21943e311a.33
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.34	00000001 .Lanon.9efeb2f06c0a343721ec0c21943e311a.34
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.36	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.36
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.37	00000010 .Lanon.9efeb2f06c0a343721ec0c21943e311a.37
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.39	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.39
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.4	0000000d .Lanon.9efeb2f06c0a343721ec0c21943e311a.4
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.40	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.40
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.41	0000004b .Lanon.9efeb2f06c0a343721ec0c21943e311a.41
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.42	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.42
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.43	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.43
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.44	00000021 .Lanon.9efeb2f06c0a343721ec0c21943e311a.44
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.45	00000012 .Lanon.9efeb2f06c0a343721ec0c21943e311a.45
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.46	00000009 .Lanon.9efeb2f06c0a343721ec0c21943e311a.46
00000008 l     O .rodata.cst8	00000008 .Lanon.9efeb2f06c0a343721ec0c21943e311a.47
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.48	00000001 .Lanon.9efeb2f06c0a343721ec0c21943e311a.48
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.49	0000000c .Lanon.9efeb2f06c0a343721ec0c21943e311a.49
00000000 l     O .rodata.cst4	00000004 .Lanon.9efeb2f06c0a343721ec0c21943e311a.5
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.50	00000009 .Lanon.9efeb2f06c0a343721ec0c21943e311a.50
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.51	0000000d .Lanon.9efeb2f06c0a343721ec0c21943e311a.51
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.52	0000000c .Lanon.9efeb2f06c0a343721ec0c21943e311a.52
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.53	0000000b .Lanon.9efeb2f06c0a343721ec0c21943e311a.53
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.54	0000000c .Lanon.9efeb2f06c0a343721ec0c21943e311a.54
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.55	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.55
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.56	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.56
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.57	00000009 .Lanon.9efeb2f06c0a343721ec0c21943e311a.57
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.58	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.58
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.59	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.59
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.60	00000007 .Lanon.9efeb2f06c0a343721ec0c21943e311a.60
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.61	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.61
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.62	0000000c .Lanon.9efeb2f06c0a343721ec0c21943e311a.62
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.63	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.63
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.64	0000000a .Lanon.9efeb2f06c0a343721ec0c21943e311a.64
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.65	00000007 .Lanon.9efeb2f06c0a343721ec0c21943e311a.65
00000000 l     O .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.9	00000018 .Lanon.9efeb2f06c0a343721ec0c21943e311a.9
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE	0000003a _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E	0000003a _ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E	00000242 _ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E
00000000 l     O .data._ZN5mylib6mynewt2hw6sensor17LISTENER_INTERNAL17h6f9ae9cad3c79823E	00000018 _ZN5mylib6mynewt2hw6sensor17LISTENER_INTERNAL17h6f9ae9cad3c79823E
00000000 l     F .text._ZN5mylib6mynewt2hw6sensor21null_sensor_data_func17he576af080a279986E	00000004 _ZN5mylib6mynewt2hw6sensor21null_sensor_data_func17he576af080a279986E
00000000 l     O .bss._ZN5mylib9send_coap12NETWORK_TASK17hfe4c85d5a08ad1acE	00000050 _ZN5mylib9send_coap12NETWORK_TASK17hfe4c85d5a08ad1acE
00000000 l     O .bss._ZN5mylib9send_coap16NETWORK_IS_READY17h8eedfcb9fe69a092E.0.0	00000001 _ZN5mylib9send_coap16NETWORK_IS_READY17h8eedfcb9fe69a092E.0.0
00000000 l     F .text._ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E	0000011a _ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E
00000000 l     O .bss._ZN5mylib9send_coap18NETWORK_TASK_STACK17h8b663783da39d672E	00000400 _ZN5mylib9send_coap18NETWORK_TASK_STACK17h8b663783da39d672E
00000000 l     O .rodata.str.3	00000010 str.3
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E
00000000 l    d  .text._ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE	00000000 .text._ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE
00000000 l    d  .text._ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E	00000000 .text._ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E
00000000 l    d  .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	00000000 .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E
00000000 l    d  .text._ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE	00000000 .text._ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE
00000000 l    d  .text._ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE	00000000 .text._ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE
00000000 l    d  .text._ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE	00000000 .text._ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE
00000000 l    d  .text._ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E	00000000 .text._ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E
00000000 l    d  .text._ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E	00000000 .text._ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E
00000000 l    d  .text._ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE	00000000 .text._ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE
00000000 l    d  .text._ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E	00000000 .text._ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E
00000000 l    d  .text._ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E	00000000 .text._ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E
00000000 l    d  .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	00000000 .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E
00000000 l    d  .text._ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E	00000000 .text._ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E
00000000 l    d  .text._ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE	00000000 .text._ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE
00000000 l    d  .text._ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E	00000000 .text._ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E
00000000 l    d  .text._ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E	00000000 .text._ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E
00000000 l    d  .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000000 .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE
00000000 l    d  .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E	00000000 .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E
00000000 l    d  .text._ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E	00000000 .text._ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E
00000000 l    d  .text._ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E	00000000 .text._ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E
00000000 l    d  .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000000 .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E
00000000 l    d  .text._ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE	00000000 .text._ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE
00000000 l    d  .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE	00000000 .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE
00000000 l    d  .text._ZN5mylib6mynewt2hw6sensor21null_sensor_data_func17he576af080a279986E	00000000 .text._ZN5mylib6mynewt2hw6sensor21null_sensor_data_func17he576af080a279986E
00000000 l    d  .text._ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE	00000000 .text._ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE
00000000 l    d  .text._ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E	00000000 .text._ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E
00000000 l    d  .text._ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E	00000000 .text._ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E	00000000 .text._ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E
00000000 l    d  .text._ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E	00000000 .text._ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E
00000000 l    d  .text.main	00000000 .text.main
00000000 l    d  .text.rust_begin_unwind	00000000 .text.rust_begin_unwind
00000000 l    d  .text._ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE	00000000 .text._ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.0	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.0
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.1	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.1
00000000 l    d  .data._ZN5mylib6mynewt2hw6sensor17LISTENER_INTERNAL17h6f9ae9cad3c79823E	00000000 .data._ZN5mylib6mynewt2hw6sensor17LISTENER_INTERNAL17h6f9ae9cad3c79823E
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.6	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.6
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.7	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.7
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.8	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.8
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.10	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.10
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.12	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.12
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.16	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.16
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.19	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.19
00000000 l    d  .bss._ZN5mylib9send_coap12NETWORK_TASK17hfe4c85d5a08ad1acE	00000000 .bss._ZN5mylib9send_coap12NETWORK_TASK17hfe4c85d5a08ad1acE
00000000 l    d  .bss._ZN5mylib9send_coap18NETWORK_TASK_STACK17h8b663783da39d672E	00000000 .bss._ZN5mylib9send_coap18NETWORK_TASK_STACK17h8b663783da39d672E
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.27	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.27
00000000 l    d  .rodata.str.3	00000000 .rodata.str.3
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.35	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.35
00000000 l    d  .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.38	00000000 .rodata..Lanon.9efeb2f06c0a343721ec0c21943e311a.38
00000000 l    d  .bss._ZN5mylib9send_coap16NETWORK_IS_READY17h8eedfcb9fe69a092E.0.0	00000000 .bss._ZN5mylib9send_coap16NETWORK_IS_READY17h8eedfcb9fe69a092E.0.0
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE	00000010 _ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h2aaf975749bb6b1cE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17hc8dd8eb7cdbfe98cE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor__bindgen_ty_3$u20$as$u20$core..default..Default$GT$7default17h309f01b3610ccf17E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor__bindgen_ty_4$u20$as$u20$core..default..Default$GT$7default17hcc1172401ad6a71eE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN101_$LT$mylib..mynewt..hw..sensor..bindings..os_task__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7fd217d74324c71eE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN101_$LT$mylib..mynewt..hw..sensor..bindings..os_task__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17haf7ba7d2a200f199E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN101_$LT$mylib..mynewt..hw..sensor..bindings..os_task__bindgen_ty_3$u20$as$u20$core..default..Default$GT$7default17h6d9a4af3b8df63d2E
00000000 g     F .text._ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE	0000000c _ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN101_$LT$mylib..mynewt..libs..sensor_coap..os_mempool__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he276f62175cd5300E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN101_$LT$mylib..mynewt..libs..sensor_coap..os_mempool__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17h1f234c804e40a8f1E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN102_$LT$mylib..mynewt..hw..sensor..bindings..os_event__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h4ea54df93f92a8bcE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN102_$LT$mylib..mynewt..hw..sensor..bindings..os_mutex__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h36afc34b5137132aE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN102_$LT$mylib..mynewt..libs..sensor_coap..os_memblock__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf1df87288a25ef5dE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN103_$LT$mylib..mynewt..hw..sensor..bindings..os_eventq__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hb44f7a2daa7ca2aaE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN103_$LT$mylib..mynewt..libs..sensor_coap..os_mbuf_pool__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h37ac2b0e576fa38dE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN104_$LT$mylib..mynewt..hw..sensor..bindings..os_callout__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h697cbb2d3a6c6d61E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN104_$LT$mylib..mynewt..hw..sensor..bindings..os_mempool__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h3fdcadc250213be1E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN104_$LT$mylib..mynewt..hw..sensor..bindings..os_mempool__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17h9eb6d80763c22928E
00000000 g     F .text._ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E	0000000e _ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN105_$LT$mylib..mynewt..hw..sensor..bindings..os_memblock__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h6438b59c17272d3eE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN106_$LT$mylib..mynewt..libs..mynewt_rust..os_sanity_check__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hd5f7ca9ad434557bE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN106_$LT$mylib..mynewt..libs..mynewt_rust..sensor_listener__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hd5977ba5b30fb899E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN106_$LT$mylib..mynewt..libs..mynewt_rust..sensor_notifier__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hade3ec4b47e8a902E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN107_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h843d7969e879e569E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN107_$LT$mylib..mynewt..kernel..os..os_time_change_listener__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he24935c7ac6204cdE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN109_$LT$mylib..mynewt..hw..sensor..bindings..os_sanity_check__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h0feaa15ed59bdca0E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN109_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h8ff115dd6a1fc458E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN109_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notifier__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h637ccd41ee238bb5E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN109_$LT$mylib..mynewt..libs..mynewt_rust..sensor_type_traits__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h3219e485f2732957E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN112_$LT$mylib..mynewt..encoding..json..json_value__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf3a6f726d3914f17E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN112_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf7b7aaa7d82fe4e0E
00000000 g     F .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	0000000a _ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E
00000000 g     F .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	0000000a _ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17h60e4be6e84f5f5e0E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_3$u20$as$u20$core..default..Default$GT$7default17h4464eba725c38e01E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_4$u20$as$u20$core..default..Default$GT$7default17ha73cde4bf76a0e98E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_5$u20$as$u20$core..default..Default$GT$7default17h8ac35a0553f64693E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_6$u20$as$u20$core..default..Default$GT$7default17h0ff45419416194b5E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN115_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h6f9864e8b278f2d7E
00000000         *UND*	00000000 _ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17heb4d046d241d78d0E
00000000         *UND*	00000000 _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h33b3bbdbc74b88baE
00000000         *UND*	00000000 _ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he275dc913fe9b8e5E
00000000         *UND*	00000000 _ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h1d24bfddebe6efa8E
00000000         *UND*	00000000 _ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17hb2119167a92723afE
00000000         *UND*	00000000 _ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hc44988ae29d24532E
00000000         *UND*	00000000 _ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE
00000000         *UND*	00000000 _ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E
00000000         *UND*	00000000 _ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E
00000000         *UND*	00000000 _ZN4core5panic8Location4file17h94cc6af18de736c4E
00000000         *UND*	00000000 _ZN4core5panic8Location4line17h3ffc63f14d0a6636E
00000000         *UND*	00000000 _ZN4core5panic9PanicInfo8location17h5226165d8771f8a2E
00000000         *UND*	00000000 _ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E
00000000         *UND*	00000000 _ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E
00000000         *UND*	00000000 _ZN4core9panicking5panic17h53ca63c6ac6312f8E
00000000         *UND*	00000000 _ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E
00000000 g     F .text._ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E	00000002 _ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E
00000000 g     F .text._ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE	0000011a _ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE
00000000 g     F .text._ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E	0000000a _ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E
00000000 g     F .text._ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E	00000008 _ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	0000000c _ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E	0000000a _ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E
00000000 g     F .text._ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E	0000000c _ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E
00000000 g     F .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	0000000a _ZN78_$LT$mylib..mynewt..kernel..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17he9bfb3f094d874e2E
00000000 g     F .text._ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E	00000010 _ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	0000000c _ZN79_$LT$mylib..mynewt..kernel..os..os_eventq$u20$as$u20$core..default..Default$GT$7default17hf81f4c4eed0fea01E
00000000 g     F .text._ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E	00000010 _ZN79_$LT$mylib..mynewt..kernel..os..os_mqueue$u20$as$u20$core..default..Default$GT$7default17he1eabfd3c9c5059aE
00000000 g     F .text._ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE	00000014 _ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE
00000000 g     F .text._ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E	00000012 _ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN81_$LT$mylib..mynewt..kernel..os..os_memblock$u20$as$u20$core..default..Default$GT$7default17hb70e2a35404ff3f5E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN81_$LT$mylib..mynewt..kernel..os..os_task_obj$u20$as$u20$core..default..Default$GT$7default17hd267e38b78964cd7E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN82_$LT$mylib..mynewt..encoding..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17h16d8f5c8d73d8ce8E
00000000 g     F .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	0000000a _ZN82_$LT$mylib..mynewt..kernel..os..os_mbuf_pool$u20$as$u20$core..default..Default$GT$7default17hfc631c771b8ad3d8E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN82_$LT$mylib..mynewt..kernel..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h6ad5d1325c893b21E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE	00000010 _ZN84_$LT$mylib..mynewt..encoding..json..json_value$u20$as$u20$core..default..Default$GT$7default17ha918853d3f93dfabE
00000000 g     F .text._ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E	00000008 _ZN84_$LT$mylib..mynewt..kernel..os..os_mbuf_pkthdr$u20$as$u20$core..default..Default$GT$7default17h14615e02ac7e02e2E
00000000 g     F .text._ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E	0000000a _ZN84_$LT$mylib..mynewt..kernel..os..os_mempool_ext$u20$as$u20$core..default..Default$GT$7default17hbb33359422b0355dE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN84_$LT$mylib..mynewt..kernel..os..os_task_stailq$u20$as$u20$core..default..Default$GT$7default17hd395c6bb0accfa03E
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	0000000c _ZN84_$LT$mylib..mynewt..libs..sensor_coap..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h920a76fadc95fe44E
00000000 g     F .text._ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E	0000000a _ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E
00000000 g     F .text._ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E	00000008 _ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN85_$LT$mylib..mynewt..kernel..os..os_callout_list$u20$as$u20$core..default..Default$GT$7default17hacb08dfb9d315f7dE
00000000 g     F .text._ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE	0000000e _ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE
00000000 g     F .text._ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E	00000002 _ZN85_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..convert..From$LT$i32$GT$$GT$4from17hf5bfcb9663d3a482E
00000000 g     F .text._ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE	0000000a _ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE
00000000 g     F .text._ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE	0000000a _ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE
00000000 g     F .text._ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE	0000000a _ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	0000000c _ZN87_$LT$mylib..mynewt..encoding..tinycbor..CborValue$u20$as$u20$core..default..Default$GT$7default17h1de8a44b98a2196dE
00000000 g     F .text._ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E	00000012 _ZN87_$LT$mylib..mynewt..libs..sensor_coap..os_mempool$u20$as$u20$core..default..Default$GT$7default17h4ddbf27b97b6cad4E
00000000 g     F .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	0000000a _ZN88_$LT$mylib..mynewt..encoding..tinycbor..CborParser$u20$as$u20$core..default..Default$GT$7default17h0a3e703f11c9ffa7E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN88_$LT$mylib..mynewt..encoding..tinycbor..cbor_iovec$u20$as$u20$core..default..Default$GT$7default17h9ab3be1ec0c1a307E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN88_$LT$mylib..mynewt..libs..sensor_coap..os_memblock$u20$as$u20$core..default..Default$GT$7default17h2d7672e8f0281133E
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	0000000c _ZN89_$LT$mylib..mynewt..encoding..tinycbor..CborEncoder$u20$as$u20$core..default..Default$GT$7default17h3730d6a3b7b87eb0E
00000000 g     F .text._ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE	0000000e _ZN89_$LT$mylib..mynewt..kernel..os..os_time_change_info$u20$as$u20$core..default..Default$GT$7default17h8cb3ceeea00d7257E
00000000 g     F .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	0000000a _ZN89_$LT$mylib..mynewt..libs..sensor_coap..os_mbuf_pool$u20$as$u20$core..default..Default$GT$7default17h04df727234d68cd1E
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	0000000c _ZN89_$LT$mylib..mynewt..libs..sensor_coap..sensor_value$u20$as$u20$core..default..Default$GT$7default17h1f6a572a97868ffbE
00000000 g     F .text._ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E	0000000e _ZN90_$LT$mylib..mynewt..hw..sensor..bindings..sensor_itf$u20$as$u20$core..default..Default$GT$7default17h1891655938f1272dE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN90_$LT$mylib..mynewt..kernel..os..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h429eb1b811f46821E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN90_$LT$mylib..mynewt..kernel..os..os_sem__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17ha8b09db2daae9898E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN91_$LT$mylib..mynewt..kernel..os..os_mbuf__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hb357509788236681E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN91_$LT$mylib..mynewt..kernel..os..os_task__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h118441e24fe64a9eE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN91_$LT$mylib..mynewt..kernel..os..os_task__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17haefc6aae40627d37E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN91_$LT$mylib..mynewt..kernel..os..os_task__bindgen_ty_3$u20$as$u20$core..default..Default$GT$7default17hf2f940fdf2e440ebE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN92_$LT$mylib..mynewt..kernel..os..os_event__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hd029ecee171aa65aE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN92_$LT$mylib..mynewt..kernel..os..os_mutex__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h27d68578cc3c9303E
00000000 g     F .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE	0000000a _ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE
00000000 g     F .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E	00000008 _ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN93_$LT$mylib..mynewt..kernel..os..hal_timer__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf2a3da75438eb086E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN93_$LT$mylib..mynewt..kernel..os..os_eventq__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h99c4e5d1fae27bd7E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN93_$LT$mylib..mynewt..kernel..os..os_mqueue__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hc2410fc13011d655E
00000000 g     F .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E	0000000a _ZN93_$LT$mylib..mynewt..kernel..os..os_time_change_listener$u20$as$u20$core..default..Default$GT$7default17h4c1956f8845f6eeeE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN94_$LT$mylib..mynewt..kernel..os..os_callout__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h3197e8ecd45933d4E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN94_$LT$mylib..mynewt..kernel..os..os_mempool__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h30d40da8a7ebee30E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN94_$LT$mylib..mynewt..kernel..os..os_mempool__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17h8f0e04c0414de32dE
00000000 g     F .text._ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E	00000010 _ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E
00000000 g     F .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E	0000000c _ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notifier$u20$as$u20$core..default..Default$GT$7default17h5316c0c3bcdcca59E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_read_ctx$u20$as$u20$core..default..Default$GT$7default17h33401c6a27569b04E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN95_$LT$mylib..mynewt..kernel..os..os_memblock__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf0f04af4e71230cbE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN95_$LT$mylib..mynewt..kernel..os..os_task_obj__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h27bc7fbe06e15e40E
00000000 g     F .text._ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E	00000010 _ZN96_$LT$mylib..mynewt..hw..sensor..bindings..sensor_timestamp$u20$as$u20$core..default..Default$GT$7default17h6c09419f817bfc18E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN96_$LT$mylib..mynewt..kernel..os..os_mbuf_pool__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h562e492392a30d0aE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN97_$LT$mylib..mynewt..libs..mynewt_rust..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hdb498e4f06b338a2E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN97_$LT$mylib..mynewt..libs..mynewt_rust..sensor__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hb36d57d384a9e5bdE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN97_$LT$mylib..mynewt..libs..mynewt_rust..sensor__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17hb7c0e73ce4cce040E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN97_$LT$mylib..mynewt..libs..mynewt_rust..sensor__bindgen_ty_3$u20$as$u20$core..default..Default$GT$7default17h34ee4452fed8a02dE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN97_$LT$mylib..mynewt..libs..mynewt_rust..sensor__bindgen_ty_4$u20$as$u20$core..default..Default$GT$7default17h503060d86208d3f4E
00000000 g     F .text._ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE	0000000c _ZN98_$LT$mylib..mynewt..encoding..json..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hb4d0a1ab475c3667E
00000000 g     F .text._ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E	00000008 _ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_read_ev_ctx$u20$as$u20$core..default..Default$GT$7default17h584b56ab500a71f7E
00000000 g     F .text._ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E	0000000a _ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN98_$LT$mylib..mynewt..kernel..os..os_mbuf_pkthdr__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17haa3ffeaf3c07db34E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN98_$LT$mylib..mynewt..libs..mynewt_rust..os_task__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h71178c47107c685bE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E	00000006 _ZN98_$LT$mylib..mynewt..libs..mynewt_rust..os_task__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17h2bf9b06fce62f76dE
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN98_$LT$mylib..mynewt..libs..mynewt_rust..os_task__bindgen_ty_3$u20$as$u20$core..default..Default$GT$7default17ha9927272e3838b42E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN98_$LT$mylib..mynewt..libs..sensor_coap..os_mbuf__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h8f8ce82b661a48d2E
00000000 g     F .text._ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE	0000000a _ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE
00000000 g     F .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E	00000008 _ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_2$u20$as$u20$core..default..Default$GT$7default17h08bfa0c7f79dd386E
00000000 g     F .text._ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E	00000010 _ZN99_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_os_ev$u20$as$u20$core..default..Default$GT$7default17h3a71d73701d9a135E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN99_$LT$mylib..mynewt..kernel..os..os_sanity_check__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h0f02a5038f430112E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN99_$LT$mylib..mynewt..libs..mynewt_rust..os_event__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hc0fb160539bdbe90E
00000000 g     F .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE	00000004 _ZN99_$LT$mylib..mynewt..libs..mynewt_rust..os_mutex__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hce8b6a454723912bE
00000000         *UND*	00000000 _ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E
00000000         *UND*	00000000 __aeabi_memclr4
00000000         *UND*	00000000 __aeabi_memclr8
00000000         *UND*	00000000 __bkpt
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush
00000000         *UND*	00000000 console_printhex
00000000         *UND*	00000000 device_get_name
00000000         *UND*	00000000 do_collector_post
00000000         *UND*	00000000 do_server_post
00000000         *UND*	00000000 get_device_id
00000000         *UND*	00000000 get_temp_data
00000000         *UND*	00000000 get_temp_raw_data
00000000         *UND*	00000000 init_collector_post
00000000         *UND*	00000000 init_server_post
00000000         *UND*	00000000 is_collector_node
00000000         *UND*	00000000 is_null_sensor
00000000         *UND*	00000000 is_null_sensor_data
00000000         *UND*	00000000 is_sensor_node
00000000         *UND*	00000000 is_standalone_node
00000000 g     F .text.main	00000192 main
00000000         *UND*	00000000 null_sensor
00000000         *UND*	00000000 os_eventq_dflt_get
00000000         *UND*	00000000 os_eventq_run
00000000         *UND*	00000000 os_task_init
00000000         *UND*	00000000 os_time_delay
00000000         *UND*	00000000 register_collector_transport
00000000         *UND*	00000000 register_server_transport
00000000 g     F .text.rust_begin_unwind	00000072 rust_begin_unwind
00000000         *UND*	00000000 rust_sysinit
00000000         *UND*	00000000 sensor_get_device
00000000         *UND*	00000000 sensor_mgr_find_next_bydevname
00000000         *UND*	00000000 sensor_register_listener
00000000         *UND*	00000000 sensor_set_poll_rate_ms
00000000         *UND*	00000000 should_send_to_collector



Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE:

00000000 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$i32$GT$3fmt17hc0a5c2426ccebe61E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E>
   c:	b128      	cbz	r0, 1a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17hb2119167a92723afE>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E>
  20:	b128      	cbz	r0, 2e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h13ac8c522a55adacE+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hc44988ae29d24532E>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h33b3bbdbc74b88baE>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E:

00000000 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num49_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u8$GT$3fmt17h271d1c938b44f4eaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_lower_hex17h6ead2f28bb05b574E>
   c:	b128      	cbz	r0, 1a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17he275dc913fe9b8e5E>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter15debug_upper_hex17hd6d96e6aa5cb78d8E>
  20:	b128      	cbz	r0, 2e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hef1b000013b2e9f1E+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$u8$GT$3fmt17h1d24bfddebe6efa8E>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <_ZN4core3fmt3num3imp51_$LT$impl$u20$core..fmt..Display$u20$for$u20$u8$GT$3fmt17heb4d046d241d78d0E>

Disassembly of section .text._ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE:

00000000 <_ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE>:
_ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:212
    pub je_arg: *mut ::cty::c_void,
    pub _bitfield_1: __BindgenBitfieldUnit<[u8; 1usize], u8>,
    pub je_encode_buf: [::cty::c_char; 64usize],
}
impl Default for json_encoder {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17hdfac71dcca955acbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	214c      	movs	r1, #76	; 0x4c
   4:	f7ff fffe 	bl	0 <__aeabi_memclr4>
_ZN86_$LT$mylib..mynewt..encoding..json..json_encoder$u20$as$u20$core..default..Default$GT$7default17h3a86dbb2a8a8164dE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:214
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E:

00000000 <_ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E>:
_ZN85_$LT$mylib..mynewt..encoding..json..json_enum_t$u20$as$u20$core..default..Default$GT$7default17hbada56f05cb58551E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:296
    pub value: ::cty::c_longlong,
}
impl Default for json_enum_t {
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
   0:	2000      	movs	r0, #0
   2:	2100      	movs	r1, #0
   4:	2200      	movs	r2, #0
   6:	4770      	bx	lr

Disassembly of section .text._ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E:

00000000 <_ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E>:
_ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:322
    pub subtype: *const json_attr_t,
    pub base: *mut ::cty::c_char,
    pub stride: usize,
}
impl Default for json_array_t__bindgen_ty_1__bindgen_ty_1 {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17he79a03dc3ba22654E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	6081      	str	r1, [r0, #8]
_ZN114_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17he12df112c375aa63E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:324
        unsafe { ::core::mem::zeroed() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE:

00000000 <_ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE>:
_ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:374
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for json_array_t__bindgen_ty_1 {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h9d49fe59e7a448bdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
_ZN100_$LT$mylib..mynewt..encoding..json..json_array_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h667ef8f6053cc85dE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:376
        unsafe { ::core::mem::zeroed() }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE:

00000000 <_ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE>:
_ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:379
}
impl Default for json_array_t {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17hbedf3580ab81a216E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2128      	movs	r1, #40	; 0x28
   4:	f7ff fffe 	bl	0 <__aeabi_memclr8>
_ZN86_$LT$mylib..mynewt..encoding..json..json_array_t$u20$as$u20$core..default..Default$GT$7default17h9ed2b02adbdc200eE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:381
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE:

00000000 <_ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE>:
_ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:406
    pub array: __BindgenUnionField<json_array_t>,
    pub offset: __BindgenUnionField<usize>,
    pub bindgen_union_field: [u64; 6usize],
}
impl Default for json_attr_t__bindgen_ty_1 {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h300ab67281ab2e1fE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2130      	movs	r1, #48	; 0x30
   4:	f7ff fffe 	bl	0 <__aeabi_memclr8>
_ZN99_$LT$mylib..mynewt..encoding..json..json_attr_t__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hf95111df9d32b5bcE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:408
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E:

00000000 <_ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E>:
_ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:426
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for json_attr_t {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h042424392d1317a3E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2150      	movs	r1, #80	; 0x50
   4:	f7ff fffe 	bl	0 <__aeabi_memclr8>
_ZN85_$LT$mylib..mynewt..encoding..json..json_attr_t$u20$as$u20$core..default..Default$GT$7default17hf2866f3a6beda229E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/encoding/json.rs:428
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E:

00000000 <_ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E>:
_ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:409
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_event {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17hde09b20164e48890E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
_ZN78_$LT$mylib..mynewt..kernel..os..os_event$u20$as$u20$core..default..Default$GT$7default17ha9c2a22a0aef1179E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:411
        unsafe { ::core::mem::zeroed() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE:

00000000 <_ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE>:
_ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:541
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_callout {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h16df9f0bb14871d1E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
   e:	e9c0 1106 	strd	r1, r1, [r0, #24]
_ZN80_$LT$mylib..mynewt..kernel..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h35fb82015c01a0aaE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:543
        unsafe { ::core::mem::zeroed() }
    }
  12:	4770      	bx	lr

Disassembly of section .text._ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E:

00000000 <_ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E>:
_ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:642
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for hal_timer {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17he045c8c5fc9a74b0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
_ZN79_$LT$mylib..mynewt..kernel..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17h662e239b89e341a8E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:644
        unsafe { ::core::mem::zeroed() }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E:

00000000 <_ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E>:
_ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:812
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_dev {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h5ff4b613dca1eedbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2124      	movs	r1, #36	; 0x24
   4:	f7ff fffe 	bl	0 <__aeabi_memclr4>
_ZN76_$LT$mylib..mynewt..kernel..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h6796a90f25049da8E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:814
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E:

00000000 <_ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E>:
_ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1040
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_mbuf {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h4e7d3f44c9f5617aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
_ZN77_$LT$mylib..mynewt..kernel..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h148a6d1254104847E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1042
        unsafe { ::core::mem::zeroed() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E:

00000000 <_ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E>:
_ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1521
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_mempool {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h0d783c8dfc17ff07E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
   e:	6181      	str	r1, [r0, #24]
_ZN80_$LT$mylib..mynewt..kernel..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17ha84ccbb9e7b22964E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1523
        unsafe { ::core::mem::zeroed() }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE:

00000000 <_ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE>:
_ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1780
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_sanity_check {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h8b40ea82a9904c0dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	6101      	str	r1, [r0, #16]
_ZN85_$LT$mylib..mynewt..kernel..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd1233b47a9d8cbcbE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1782
        unsafe { ::core::mem::zeroed() }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E:

00000000 <_ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E>:
_ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1918
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_task {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h20b61e8abdfcdcd5E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2150      	movs	r1, #80	; 0x50
   4:	f7ff fffe 	bl	0 <__aeabi_memclr4>
_ZN77_$LT$mylib..mynewt..kernel..os..os_task$u20$as$u20$core..default..Default$GT$7default17hbcc6978df783f1d8E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:1920
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E:

00000000 <_ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E>:
_ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:2131
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_sem {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h683df8b7d7843087E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
_ZN76_$LT$mylib..mynewt..kernel..os..os_sem$u20$as$u20$core..default..Default$GT$7default17h5c8e87c2628b6e14E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/kernel/os.rs:2133
        unsafe { ::core::mem::zeroed() }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE:

00000000 <_ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE>:
_ZN100_$LT$mylib..mynewt..hw..sensor..bindings..os_dev__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h330f6cf2332e2d1aE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:207
    pub stqe_next: *mut os_dev,
}
impl Default for os_dev__bindgen_ty_1 {
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
   0:	2000      	movs	r0, #0
   2:	4770      	bx	lr

Disassembly of section .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E:

00000000 <_ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E>:
_ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:359
    pub spd: __BindgenUnionField<*mut sensor_press_data>,
    pub srhd: __BindgenUnionField<*mut sensor_humid_data>,
    pub bindgen_union_field: u64,
}
impl Default for sensor_data_t {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h2b423228324b0bdaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
_ZN93_$LT$mylib..mynewt..hw..sensor..bindings..sensor_data_t$u20$as$u20$core..default..Default$GT$7default17hb4bfaef90e32f038E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:361
        unsafe { ::core::mem::zeroed() }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E:

00000000 <_ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E>:
_ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:443
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for sensor_listener {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h58d70380eab5e2a6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
_ZN95_$LT$mylib..mynewt..hw..sensor..bindings..sensor_listener$u20$as$u20$core..default..Default$GT$7default17h1dd4f66caf63ca67E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:445
        unsafe { ::core::mem::zeroed() }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E:

00000000 <_ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E>:
_ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:503
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for sensor_type_traits {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h1d19c7d52964ac37E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2130      	movs	r1, #48	; 0x30
   4:	f7ff fffe 	bl	0 <__aeabi_memclr8>
_ZN98_$LT$mylib..mynewt..hw..sensor..bindings..sensor_type_traits$u20$as$u20$core..default..Default$GT$7default17h604a349a45bc2964E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:505
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E:

00000000 <_ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E>:
_ZN100_$LT$mylib..mynewt..hw..sensor..bindings..sensor_notify_ev_ctx$u20$as$u20$core..default..Default$GT$7default17ha4b50f23ab08f5e7E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:515
    pub snec_evtype: sensor_event_type_t,
}
impl Default for sensor_notify_ev_ctx {
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
   0:	2000      	movs	r0, #0
   2:	2100      	movs	r1, #0
   4:	4770      	bx	lr

Disassembly of section .text._ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE:

00000000 <_ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE>:
_ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:739
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for sensor {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h081f11805e8da9edE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2188      	movs	r1, #136	; 0x88
   4:	f7ff fffe 	bl	0 <__aeabi_memclr8>
_ZN86_$LT$mylib..mynewt..hw..sensor..bindings..sensor$u20$as$u20$core..default..Default$GT$7default17h3972b4100904ce9dE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:741
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE:

00000000 <_ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE>:
_ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:1833
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for _bindgen_ty_1 {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h31ea305547e32d20E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2134      	movs	r1, #52	; 0x34
   4:	f7ff fffe 	bl	0 <__aeabi_memclr4>
_ZN93_$LT$mylib..mynewt..hw..sensor..bindings.._bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17hfe61a3a2e7f05b3cE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor/bindings.rs:1835
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN5mylib6mynewt2hw6sensor21null_sensor_data_func17he576af080a279986E:

00000000 <_ZN5mylib6mynewt2hw6sensor21null_sensor_data_func17he576af080a279986E>:
_ZN5mylib6mynewt2hw6sensor21null_sensor_data_func17he576af080a279986E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor.rs:88
extern fn null_sensor_data_func(
    _sensor: sensor_ptr, 
    _arg: sensor_arg, 
    _sensor_data: sensor_data_ptr, 
    _sensor_type: sensor_type_t) -> i32
    { 0 }
   0:	2000      	movs	r0, #0
   2:	4770      	bx	lr

Disassembly of section .text._ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE:

00000000 <_ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE>:
_ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/libs/sensor_coap.rs:430
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for json_value__bindgen_ty_1 {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h0baece6fa5847311E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
_ZN101_$LT$mylib..mynewt..libs..sensor_coap..json_value__bindgen_ty_1$u20$as$u20$core..default..Default$GT$7default17h7186c454935d415bE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/libs/sensor_coap.rs:432
        unsafe { ::core::mem::zeroed() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E:

00000000 <_ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E>:
_ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/libs/sensor_network.rs:40
        ) -> ::cty::c_int,
    >,
    pub transport_registered: u8,
}
impl Default for sensor_network_interface {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h7dc4380bca9ca9cdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	6101      	str	r1, [r0, #16]
_ZN104_$LT$mylib..mynewt..libs..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17h35426a326eb363b6E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/libs/sensor_network.rs:42
        unsafe { ::core::mem::zeroed() }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E:

00000000 <_ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E>:
_ZN5mylib6mynewt6result95_$LT$impl$u20$core..convert..From$LT$mylib..mynewt..result..MynewtError$GT$$u20$for$u20$i32$GT$4from17he768babb092a5c90E():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt.rs:57
    /// Cast `MynewtError` to `i32`
    impl From<MynewtError> for i32 {
        /// Cast `MynewtError` to `i32`
        fn from(err: MynewtError) -> Self {
            err as i32
        }
   0:	4770      	bx	lr

Disassembly of section .text._ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E:

00000000 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E>:
_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:80
///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
///  If this is a Sensor Node, we send the sensor data to the Collector Node.
///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
///  Return 0 if we have processed the sensor data successfully.
extern fn read_temperature(sensor: sensor_ptr, _arg: sensor_arg, 
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b091      	sub	sp, #68	; 0x44
   4:	4604      	mov	r4, r0
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
///  Display message `msg` on the Arm Semihosting console (via OpenOCD).
pub fn console_print(msg: &[u8]) {
    let len = msg.len();
    unsafe {
        //  Call the Semihosting Console API, which is unsafe.
        console_buffer(msg.as_ptr(), len as u32);
   6:	f240 0000 	movw	r0, #0
   a:	f2c0 0000 	movt	r0, #0
   e:	2111      	movs	r1, #17
  10:	4616      	mov	r6, r2
  12:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  16:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:85
    sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> MynewtError {
    console_print(b"read_temperature\n");
    //  Check that the temperature data is valid.
    //  TODO
    if unsafe { is_null_sensor_data(sensor_data) } { return MynewtError::SYS_EINVAL; }  //  Exit if data is missing
  1a:	4630      	mov	r0, r6
  1c:	f7ff fffe 	bl	0 <is_null_sensor_data>
  20:	b118      	cbz	r0, 2a <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x2a>
  22:	f06f 0001 	mvn.w	r0, #1
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:116
            return MynewtError::SYS_EOK; 
        }            
    }
    //  Return 0 to Mynewt to indicate no error.  Should not end with a semicolon (;).
    MynewtError::SYS_EOK
}
  26:	b011      	add	sp, #68	; 0x44
  28:	bdf0      	pop	{r4, r5, r6, r7, pc}
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:86
    assert!(unsafe { !is_null_sensor(sensor) });
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <is_null_sensor>
  30:	2800      	cmp	r0, #0
  32:	f040 809b 	bne.w	16c <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x16c>
  36:	e9dd 1016 	ldrd	r1, r0, [sp, #88]	; 0x58
_ZN5mylib13listen_sensor15get_temperature17had1038eb151d12bfE():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:126
#[allow(unreachable_patterns)]
#[allow(unused_variables)]
fn get_temperature(sensor_data: sensor_data_ptr, sensor_type: sensor_type_t) -> SensorValue {
    let mut return_value = SensorValue::default();
    match sensor_type {                           //  Is this raw or computed temperature?
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  3a:	f081 6180 	eor.w	r1, r1, #67108864	; 0x4000000
  3e:	ea41 0700 	orr.w	r7, r1, r0
_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:91
    let device = unsafe { sensor_get_device(sensor) };
  42:	4620      	mov	r0, r4
  44:	f7ff fffe 	bl	0 <sensor_get_device>
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:92
    let device_name_ptr: *const c_char = unsafe { device_get_name(device) };
  48:	f7ff fffe 	bl	0 <device_get_name>
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:93
    let device_name: &CStr = unsafe { CStr::from_ptr(device_name_ptr) };
  4c:	f7ff fffe 	bl	0 <_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E>
  50:	4604      	mov	r4, r0
  52:	460d      	mov	r5, r1
  54:	2000      	movs	r0, #0
_ZN5mylib13listen_sensor15get_temperature17had1038eb151d12bfE():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:126
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  56:	b9c7      	cbnz	r7, 8a <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x8a>
  58:	a905      	add	r1, sp, #20
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:128
            //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
            let mut rawtempdata = fill_zero!(sensor_temp_raw_data);
  5a:	f88d 0018 	strb.w	r0, [sp, #24]
  5e:	9005      	str	r0, [sp, #20]
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:129
            let rc = unsafe { get_temp_raw_data(sensor_data, &mut rawtempdata) };
  60:	4630      	mov	r0, r6
  62:	f7ff fffe 	bl	0 <get_temp_raw_data>
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:130
            assert!(rc == 0);
  66:	2800      	cmp	r0, #0
  68:	f040 808e 	bne.w	188 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x188>
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:133

            //  Check that the raw temperature data is valid.
            if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  6c:	f89d 0018 	ldrb.w	r0, [sp, #24]
  70:	2800      	cmp	r0, #0
  72:	f000 8082 	beq.w	17a <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x17a>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  76:	f240 0000 	movw	r0, #0
  7a:	2119      	movs	r1, #25
  7c:	f2c0 0000 	movt	r0, #0
  80:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  84:	f7ff fffe 	bl	0 <console_flush>
  88:	e00c      	b.n	a4 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0xa4>
_ZN5mylib13listen_sensor15get_temperature17had1038eb151d12bfE():
  8a:	a905      	add	r1, sp, #20
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:141
            return_value.val = SensorValueType::Uint(rawtempdata.strd_temp_raw);  //  Raw Temperature in integer (0 to 4095)
            console_print(b"TMP listener got rawtmp \n");  // return_value->int_val);
        },
        SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
            //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
            let mut tempdata = fill_zero!(sensor_temp_data);
  8c:	f88d 0018 	strb.w	r0, [sp, #24]
  90:	9005      	str	r0, [sp, #20]
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:142
            let rc = unsafe { get_temp_data(sensor_data, &mut tempdata) };
  92:	4630      	mov	r0, r6
  94:	f7ff fffe 	bl	0 <get_temp_data>
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:143
            assert!(rc == 0);
  98:	2800      	cmp	r0, #0
  9a:	d17c      	bne.n	196 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x196>
  9c:	f89d 0018 	ldrb.w	r0, [sp, #24]
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:146

            //  Check that the computed temperature data is valid.
            if tempdata.std_temp_is_valid() == 0 { return return_value; }  //  Exit if data is not valid
  a0:	07c0      	lsls	r0, r0, #31
  a2:	d06a      	beq.n	17a <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x17a>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  a4:	f240 0000 	movw	r0, #0
  a8:	2111      	movs	r1, #17
  aa:	f2c0 0000 	movt	r0, #0
  ae:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  b2:	f7ff fffe 	bl	0 <console_flush>
  b6:	2000      	movs	r0, #0
_ZN5mylib9send_coap16send_sensor_data17hb3f5ad7bc3c59aa4E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:128
pub fn send_sensor_data(sensor_val: &SensorValue, sensor_node: &CStr) -> MynewtResult<()>  {  //  Returns an error code upon error.
    console_print(b"send_sensor_data\n");
    //  TODO: Remove val
    let mut val = fill_zero!(sensor_value);
    //  For Sensor Node: Transmit the sensor data to the Collector Node as CBOR.
    if unsafe { sensor_network::should_send_to_collector(&mut val, sensor_node.as_ptr()) } { 
  b8:	4621      	mov	r1, r4
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:126
    let mut val = fill_zero!(sensor_value);
  ba:	e9cd 0003 	strd	r0, r0, [sp, #12]
  be:	e9cd 0001 	strd	r0, r0, [sp, #4]
  c2:	a801      	add	r0, sp, #4
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:128
    if unsafe { sensor_network::should_send_to_collector(&mut val, sensor_node.as_ptr()) } { 
  c4:	f7ff fffe 	bl	0 <should_send_to_collector>
  c8:	b1b0      	cbz	r0, 30 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x30>
_ZN5mylib9send_coap29send_sensor_data_to_collector17hee27b36eedd1b0b3E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:297
///  to be transmitted.  Return 0 if successful, `SYS_EAGAIN` if network is not ready yet.
///  The CoAP payload needs to be very compact (under 32 bytes) so it will be encoded in CBOR like this:
///  `{ t: 2870 }`
fn send_sensor_data_to_collector(sensor_val: &SensorValue, _node_id: &CStr) -> MynewtResult<()>  {  //  Returns an error code upon error.
    ////  TODO: if let SensorValueType::None = sensor_val.val { assert!(false); }
    if unsafe { !NETWORK_IS_READY } { return Err(MynewtError::SYS_EAGAIN); }  //  If network is not ready, tell caller (Sensor Listener) to try later.
  ca:	f240 0000 	movw	r0, #0
  ce:	f2c0 0000 	movt	r0, #0
  d2:	7800      	ldrb	r0, [r0, #0]
  d4:	2801      	cmp	r0, #1
  d6:	d139      	bne.n	14c <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x14c>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:302

    //  Start composing the CoAP Collector message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    let rc = unsafe { sensor_network::init_collector_post() };  assert!(rc);
  d8:	f7ff fffe 	bl	0 <init_collector_post>
  dc:	2800      	cmp	r0, #0
  de:	f000 8094 	beq.w	20a <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x20a>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:315
    */

    //  Post the CoAP Collector message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    let rc = unsafe { sensor_network::do_collector_post() };  assert!(rc);
  e2:	f7ff fffe 	bl	0 <do_collector_post>
  e6:	2800      	cmp	r0, #0
  e8:	f000 8096 	beq.w	218 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x218>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  ec:	f240 0000 	movw	r0, #0
  f0:	2121      	movs	r1, #33	; 0x21
  f2:	f2c0 0000 	movt	r0, #0
  f6:	e021      	b.n	13c <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x13c>
_ZN9cstr_core4CStr8to_bytes17h62ad98c7b7c63aecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
    /// assert_eq!(c_str.to_bytes(), b"foo");
    /// ```
    #[inline]
    pub fn to_bytes(&self) -> &[u8] {
        let bytes = self.to_bytes_with_nul();
        &bytes[..bytes.len() - 1]
  f8:	1e68      	subs	r0, r5, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h0359d5933038e6d6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
  fa:	2d00      	cmp	r5, #0
  fc:	d052      	beq.n	1a4 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x1a4>
_ZN5mylib9send_coap26send_sensor_data_to_server17h9e7f4cfab2b86312E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:156
    assert_ne!(node_id.to_bytes()[0], 0);
  fe:	2800      	cmp	r0, #0
 100:	d054      	beq.n	1ac <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x1ac>
 102:	7820      	ldrb	r0, [r4, #0]
 104:	2800      	cmp	r0, #0
 106:	d05a      	beq.n	1be <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x1be>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:157
    if unsafe { !NETWORK_IS_READY } { return Err(MynewtError::SYS_EAGAIN); }  //  If network is not ready, tell caller (Sensor Listener) to try later.
 108:	f240 0000 	movw	r0, #0
 10c:	f2c0 0000 	movt	r0, #0
 110:	7800      	ldrb	r0, [r0, #0]
 112:	2801      	cmp	r0, #1
 114:	d11a      	bne.n	14c <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x14c>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:158
    let device_id_ptr = unsafe { sensor_network::get_device_id() };
 116:	f7ff fffe 	bl	0 <get_device_id>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:159
    let device_id: &CStr = unsafe { CStr::from_ptr(device_id_ptr) };
 11a:	f7ff fffe 	bl	0 <_ZN9cstr_core4CStr8from_ptr17h02056df58ddde440E>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:164
    let rc = unsafe { sensor_network::init_server_post(0 as *const c_char) };  assert!(rc);
 11e:	2000      	movs	r0, #0
 120:	f7ff fffe 	bl	0 <init_server_post>
 124:	2800      	cmp	r0, #0
 126:	d07e      	beq.n	226 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x226>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:185
    let rc = unsafe { sensor_network::do_server_post() };  assert!(rc);
 128:	f7ff fffe 	bl	0 <do_server_post>
 12c:	2800      	cmp	r0, #0
 12e:	f000 8081 	beq.w	234 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x234>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
 132:	f240 0000 	movw	r0, #0
 136:	214b      	movs	r1, #75	; 0x4b
 138:	f2c0 0000 	movt	r0, #0
_ZN5mylib9send_coap16send_sensor_data17hb3f5ad7bc3c59aa4E():
 13c:	f7ff fffe 	bl	0 <console_buffer>
 140:	f7ff fffe 	bl	0 <console_flush>
 144:	2001      	movs	r0, #1
_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:108
    if let Err(err) = rc {  //  `if let` will assign `err` to the error code inside `rc`
 146:	3006      	adds	r0, #6
 148:	d10d      	bne.n	166 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x166>
 14a:	e003      	b.n	154 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x154>
 14c:	f06f 0005 	mvn.w	r0, #5
 150:	3006      	adds	r0, #6
 152:	d108      	bne.n	166 <_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E+0x166>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
 154:	f240 0000 	movw	r0, #0
 158:	2116      	movs	r1, #22
 15a:	f2c0 0000 	movt	r0, #0
 15e:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
 162:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib13listen_sensor16read_temperature17h283273ee5533fd04E():
 166:	2000      	movs	r0, #0
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:116
}
 168:	b011      	add	sp, #68	; 0x44
 16a:	bdf0      	pop	{r4, r5, r6, r7, pc}
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:86
    assert!(unsafe { !is_null_sensor(sensor) });
 16c:	f240 0000 	movw	r0, #0
 170:	f2c0 0000 	movt	r0, #0
 174:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 178:	defe      	udf	#254	; 0xfe
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:98
    if let SensorValueType::None = temp_sensor_value.val { assert!(false); }  //  Invalid type
 17a:	f240 0000 	movw	r0, #0
 17e:	f2c0 0000 	movt	r0, #0
 182:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 186:	defe      	udf	#254	; 0xfe
_ZN5mylib13listen_sensor15get_temperature17had1038eb151d12bfE():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:130
            assert!(rc == 0);
 188:	f240 0000 	movw	r0, #0
 18c:	f2c0 0000 	movt	r0, #0
 190:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 194:	defe      	udf	#254	; 0xfe
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:143
            assert!(rc == 0);
 196:	f240 0000 	movw	r0, #0
 19a:	f2c0 0000 	movt	r0, #0
 19e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 1a2:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h0359d5933038e6d6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
 1a4:	2100      	movs	r1, #0
 1a6:	f7ff fffe 	bl	0 <_ZN4core5slice20slice_index_len_fail17hedb5bb240677a6b7E>
 1aa:	defe      	udf	#254	; 0xfe
_ZN5mylib9send_coap26send_sensor_data_to_server17h9e7f4cfab2b86312E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:156
    assert_ne!(node_id.to_bytes()[0], 0);
 1ac:	f240 0000 	movw	r0, #0
 1b0:	2100      	movs	r1, #0
 1b2:	f2c0 0000 	movt	r0, #0
 1b6:	2200      	movs	r2, #0
 1b8:	f7ff fffe 	bl	0 <_ZN4core9panicking18panic_bounds_check17h946762cd0671aec9E>
 1bc:	defe      	udf	#254	; 0xfe
 1be:	f240 0000 	movw	r0, #0
 1c2:	a910      	add	r1, sp, #64	; 0x40
 1c4:	f2c0 0000 	movt	r0, #0
 1c8:	940f      	str	r4, [sp, #60]	; 0x3c
 1ca:	900e      	str	r0, [sp, #56]	; 0x38
 1cc:	e9cd 010c 	strd	r0, r1, [sp, #48]	; 0x30
 1d0:	a80f      	add	r0, sp, #60	; 0x3c
 1d2:	900b      	str	r0, [sp, #44]	; 0x2c
 1d4:	f240 0000 	movw	r0, #0
 1d8:	f2c0 0000 	movt	r0, #0
 1dc:	f240 0100 	movw	r1, #0
 1e0:	9010      	str	r0, [sp, #64]	; 0x40
 1e2:	2002      	movs	r0, #2
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 1e4:	900a      	str	r0, [sp, #40]	; 0x28
 1e6:	a80b      	add	r0, sp, #44	; 0x2c
 1e8:	9009      	str	r0, [sp, #36]	; 0x24
 1ea:	2000      	movs	r0, #0
 1ec:	e9cd 0007 	strd	r0, r0, [sp, #28]
 1f0:	2003      	movs	r0, #3
 1f2:	9006      	str	r0, [sp, #24]
 1f4:	f240 0000 	movw	r0, #0
 1f8:	f2c0 0000 	movt	r0, #0
_ZN5mylib9send_coap26send_sensor_data_to_server17h9e7f4cfab2b86312E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:156
 1fc:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 200:	9005      	str	r0, [sp, #20]
 202:	a805      	add	r0, sp, #20
_ZN5mylib9send_coap26send_sensor_data_to_server17h9e7f4cfab2b86312E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:156
 204:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 208:	defe      	udf	#254	; 0xfe
_ZN5mylib9send_coap29send_sensor_data_to_collector17hee27b36eedd1b0b3E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:302
    let rc = unsafe { sensor_network::init_collector_post() };  assert!(rc);
 20a:	f240 0000 	movw	r0, #0
 20e:	f2c0 0000 	movt	r0, #0
 212:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 216:	defe      	udf	#254	; 0xfe
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:315
    let rc = unsafe { sensor_network::do_collector_post() };  assert!(rc);
 218:	f240 0000 	movw	r0, #0
 21c:	f2c0 0000 	movt	r0, #0
 220:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 224:	defe      	udf	#254	; 0xfe
_ZN5mylib9send_coap26send_sensor_data_to_server17h9e7f4cfab2b86312E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:164
    let rc = unsafe { sensor_network::init_server_post(0 as *const c_char) };  assert!(rc);
 226:	f240 0000 	movw	r0, #0
 22a:	f2c0 0000 	movt	r0, #0
 22e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 232:	defe      	udf	#254	; 0xfe
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:185
    let rc = unsafe { sensor_network::do_server_post() };  assert!(rc);
 234:	f240 0000 	movw	r0, #0
 238:	f2c0 0000 	movt	r0, #0
 23c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 240:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E:

00000000 <_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E>:
_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:83
extern "C" fn network_task_func(_arg: *mut ::cty::c_void) {
   0:	b08e      	sub	sp, #56	; 0x38
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
   2:	f240 0000 	movw	r0, #0
   6:	210a      	movs	r1, #10
   8:	f2c0 0000 	movt	r0, #0
   c:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  10:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:84
    console_print(b"NET start\n");  assert!(unsafe { !NETWORK_IS_READY });
  14:	f240 0400 	movw	r4, #0
  18:	f2c0 0400 	movt	r4, #0
  1c:	7820      	ldrb	r0, [r4, #0]
  1e:	2801      	cmp	r0, #1
  20:	d026      	beq.n	70 <_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E+0x70>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:89
        sensor_network::is_standalone_node() || 
  22:	f7ff fffe 	bl	0 <is_standalone_node>
  26:	b910      	cbnz	r0, 8 <is_collector_node+0x8>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:90
        sensor_network::is_collector_node() 
  28:	f7ff fffe 	bl	0 <is_collector_node>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:88
    if unsafe { 
  2c:	b120      	cbz	r0, c <register_server_transport+0xc>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:92
        let rc = unsafe { sensor_network::register_server_transport() };  assert_eq!(rc, 0);
  2e:	f7ff fffe 	bl	0 <register_server_transport>
  32:	2800      	cmp	r0, #0
  34:	9001      	str	r0, [sp, #4]
  36:	d122      	bne.n	7e <_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E+0x7e>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:97
        sensor_network::is_collector_node() || 
  38:	f7ff fffe 	bl	0 <is_collector_node>
  3c:	b910      	cbnz	r0, 8 <is_sensor_node+0x8>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:98
        sensor_network::is_sensor_node() 
  3e:	f7ff fffe 	bl	0 <is_sensor_node>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:96
    if unsafe { 
  42:	b120      	cbz	r0, c <register_collector_transport+0xc>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:100
        let rc = unsafe { sensor_network::register_collector_transport() };  assert_eq!(rc, 0);
  44:	f7ff fffe 	bl	0 <register_collector_transport>
  48:	2800      	cmp	r0, #0
  4a:	9001      	str	r0, [sp, #4]
  4c:	d13e      	bne.n	cc <_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E+0xcc>
  4e:	2001      	movs	r0, #1
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:105
    unsafe { NETWORK_IS_READY = true; }  //  Indicate that network is ready.
  50:	7020      	strb	r0, [r4, #0]
  52:	f240 0400 	movw	r4, #0
  56:	f2c0 0400 	movt	r4, #0
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  5a:	4620      	mov	r0, r4
  5c:	2111      	movs	r1, #17
  5e:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  62:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:109
        unsafe { os::os_time_delay(10 * os::OS_TICKS_PER_SEC); }                   //  Wait 10 seconds before repeating.
  66:	f242 7010 	movw	r0, #10000	; 0x2710
  6a:	f7ff fffe 	bl	0 <os_time_delay>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:107
    loop {  //  Loop forever...        
  6e:	e7f4      	b.n	ffffffec <.Lanon.9efeb2f06c0a343721ec0c21943e311a.47+0xffffffe4>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:84
    console_print(b"NET start\n");  assert!(unsafe { !NETWORK_IS_READY });
  70:	f240 0000 	movw	r0, #0
  74:	f2c0 0000 	movt	r0, #0
  78:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
  7c:	defe      	udf	#254	; 0xfe
  7e:	a801      	add	r0, sp, #4
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:92
        let rc = unsafe { sensor_network::register_server_transport() };  assert_eq!(rc, 0);
  80:	900c      	str	r0, [sp, #48]	; 0x30
  82:	f240 0000 	movw	r0, #0
  86:	a90d      	add	r1, sp, #52	; 0x34
  88:	f2c0 0000 	movt	r0, #0
  8c:	900b      	str	r0, [sp, #44]	; 0x2c
  8e:	e9cd 0109 	strd	r0, r1, [sp, #36]	; 0x24
  92:	a80c      	add	r0, sp, #48	; 0x30
  94:	9008      	str	r0, [sp, #32]
  96:	f240 0000 	movw	r0, #0
  9a:	f2c0 0000 	movt	r0, #0
  9e:	f240 0100 	movw	r1, #0
  a2:	900d      	str	r0, [sp, #52]	; 0x34
  a4:	2002      	movs	r0, #2
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  a6:	9007      	str	r0, [sp, #28]
  a8:	a808      	add	r0, sp, #32
  aa:	9006      	str	r0, [sp, #24]
  ac:	2000      	movs	r0, #0
  ae:	e9cd 0004 	strd	r0, r0, [sp, #16]
  b2:	2003      	movs	r0, #3
  b4:	9003      	str	r0, [sp, #12]
  b6:	f240 0000 	movw	r0, #0
  ba:	f2c0 0000 	movt	r0, #0
_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:92
  be:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  c2:	9002      	str	r0, [sp, #8]
  c4:	a802      	add	r0, sp, #8
_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:92
  c6:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
  ca:	defe      	udf	#254	; 0xfe
  cc:	a801      	add	r0, sp, #4
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:100
        let rc = unsafe { sensor_network::register_collector_transport() };  assert_eq!(rc, 0);
  ce:	900c      	str	r0, [sp, #48]	; 0x30
  d0:	f240 0000 	movw	r0, #0
  d4:	a90d      	add	r1, sp, #52	; 0x34
  d6:	f2c0 0000 	movt	r0, #0
  da:	900b      	str	r0, [sp, #44]	; 0x2c
  dc:	e9cd 0109 	strd	r0, r1, [sp, #36]	; 0x24
  e0:	a80c      	add	r0, sp, #48	; 0x30
  e2:	9008      	str	r0, [sp, #32]
  e4:	f240 0000 	movw	r0, #0
  e8:	f2c0 0000 	movt	r0, #0
  ec:	f240 0100 	movw	r1, #0
  f0:	900d      	str	r0, [sp, #52]	; 0x34
  f2:	2002      	movs	r0, #2
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  f4:	9007      	str	r0, [sp, #28]
  f6:	a808      	add	r0, sp, #32
  f8:	9006      	str	r0, [sp, #24]
  fa:	2000      	movs	r0, #0
  fc:	e9cd 0004 	strd	r0, r0, [sp, #16]
 100:	2003      	movs	r0, #3
 102:	9003      	str	r0, [sp, #12]
 104:	f240 0000 	movw	r0, #0
 108:	f2c0 0000 	movt	r0, #0
_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:100
 10c:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 110:	9002      	str	r0, [sp, #8]
 112:	a802      	add	r0, sp, #8
_ZN5mylib9send_coap17network_task_func17hd9a1eeab35a857d1E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:100
 114:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 118:	defe      	udf	#254	; 0xfe

Disassembly of section .text.main:

00000000 <main>:
main():
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:31
use mynewt::kernel::os;         //  Import Mynewt OS API
use crate::base::*;             //  Import `base.rs` for common declarations

///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                     //  Don't mangle the name "main"
pub extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
   0:	b092      	sub	sp, #72	; 0x48
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:33
    //  Init Mynewt system.
    unsafe { base::rust_sysinit()  };
   2:	f7ff fffe 	bl	0 <rust_sysinit>
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:34
    unsafe { console_flush() };
   6:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
   a:	f240 0000 	movw	r0, #0
   e:	210a      	movs	r1, #10
  10:	f2c0 0000 	movt	r0, #0
  14:	240a      	movs	r4, #10
  16:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  1a:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib9send_coap18start_network_task17h74bff87eeb41fc59E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:63
    let rc = unsafe { os::os_task_init( //  Create a new task and start it...
  1e:	f240 0100 	movw	r1, #0
  22:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
  26:	f44f 7080 	mov.w	r0, #256	; 0x100
  2a:	f2c0 0100 	movt	r1, #0
  2e:	e9cd 4200 	strd	r4, r2, [sp]
  32:	f240 0200 	movw	r2, #0
  36:	e9cd 1002 	strd	r1, r0, [sp, #8]
  3a:	f240 0000 	movw	r0, #0
  3e:	f240 0100 	movw	r1, #0
  42:	f2c0 0000 	movt	r0, #0
  46:	f2c0 0100 	movt	r1, #0
  4a:	f2c0 0200 	movt	r2, #0
  4e:	2300      	movs	r3, #0
  50:	2400      	movs	r4, #0
  52:	f7ff fffe 	bl	0 <os_task_init>
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:72
    assert_eq!(rc, 0);
  56:	2800      	cmp	r0, #0
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:63
    let rc = unsafe { os::os_task_init( //  Create a new task and start it...
  58:	9009      	str	r0, [sp, #36]	; 0x24
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:72
    assert_eq!(rc, 0);
  5a:	d13f      	bne.n	dc <main+0xdc>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  5c:	f240 0000 	movw	r0, #0
  60:	210a      	movs	r1, #10
  62:	f2c0 0000 	movt	r0, #0
  66:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  6a:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib13listen_sensor21start_sensor_listener17h1d9f0c2ac57087e6E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:45
    let rc = unsafe { sensor::sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME) };
  6e:	f240 0000 	movw	r0, #0
  72:	f242 7110 	movw	r1, #10000	; 0x2710
  76:	f2c0 0000 	movt	r0, #0
  7a:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:46
    assert_eq!(rc, 0);
  7e:	2800      	cmp	r0, #0
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:45
    let rc = unsafe { sensor::sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME) };
  80:	9009      	str	r0, [sp, #36]	; 0x24
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:46
    assert_eq!(rc, 0);
  82:	d151      	bne.n	128 <main+0x128>
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:49
    let sensor = unsafe { sensor::sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor()) };
  84:	f7ff fffe 	bl	0 <null_sensor>
  88:	4601      	mov	r1, r0
  8a:	f240 0000 	movw	r0, #0
  8e:	f2c0 0000 	movt	r0, #0
  92:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  96:	4604      	mov	r4, r0
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:50
    assert!(unsafe{ !is_null_sensor(sensor) });
  98:	f7ff fffe 	bl	0 <is_null_sensor>
  9c:	2800      	cmp	r0, #0
  9e:	d16a      	bne.n	176 <main+0x176>
_ZN5mylib6mynewt2hw6sensor17register_listener17h1dbbbe32ef06507aE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor.rs:66
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
  a0:	f240 0100 	movw	r1, #0
  a4:	f2c0 0100 	movt	r1, #0
  a8:	e9d1 0200 	ldrd	r0, r2, [r1]
  ac:	4310      	orrs	r0, r2
  ae:	d169      	bne.n	184 <main+0x184>
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor.rs:68
    unsafe { LISTENER_INTERNAL = listener };
  b0:	f240 0300 	movw	r3, #0
  b4:	2000      	movs	r0, #0
  b6:	f04f 6280 	mov.w	r2, #67108864	; 0x4000000
  ba:	f04f 0c01 	mov.w	ip, #1
  be:	f2c0 0300 	movt	r3, #0
  c2:	e9c1 2000 	strd	r2, r0, [r1]
  c6:	e9c1 3c02 	strd	r3, ip, [r1, #8]
  ca:	6108      	str	r0, [r1, #16]
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor.rs:70
    unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) };
  cc:	4620      	mov	r0, r4
  ce:	f7ff fffe 	bl	0 <sensor_register_listener>
main():
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:52

    //  Main event loop
    loop {                            //  Loop forever...
        unsafe {
            os::os_eventq_run(            //  Process events...
                os::os_eventq_dflt_get()  //  From default event queue.
  d2:	f7ff fffe 	bl	0 <os_eventq_dflt_get>
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:51
            os::os_eventq_run(            //  Process events...
  d6:	f7ff fffe 	bl	0 <os_eventq_run>
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:49
    loop {                            //  Loop forever...
  da:	e7fa      	b.n	d2 <main+0xd2>
  dc:	a809      	add	r0, sp, #36	; 0x24
_ZN5mylib9send_coap18start_network_task17h74bff87eeb41fc59E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:72
  de:	9010      	str	r0, [sp, #64]	; 0x40
  e0:	f240 0000 	movw	r0, #0
  e4:	a911      	add	r1, sp, #68	; 0x44
  e6:	f2c0 0000 	movt	r0, #0
  ea:	9008      	str	r0, [sp, #32]
  ec:	e9cd 0106 	strd	r0, r1, [sp, #24]
  f0:	a810      	add	r0, sp, #64	; 0x40
  f2:	9005      	str	r0, [sp, #20]
  f4:	f240 0000 	movw	r0, #0
  f8:	f2c0 0000 	movt	r0, #0
  fc:	f240 0100 	movw	r1, #0
 100:	9011      	str	r0, [sp, #68]	; 0x44
 102:	2002      	movs	r0, #2
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 104:	900f      	str	r0, [sp, #60]	; 0x3c
 106:	a805      	add	r0, sp, #20
 108:	900e      	str	r0, [sp, #56]	; 0x38
 10a:	2003      	movs	r0, #3
 10c:	e9cd 440c 	strd	r4, r4, [sp, #48]	; 0x30
_ZN5mylib9send_coap18start_network_task17h74bff87eeb41fc59E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:72
 110:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 114:	900b      	str	r0, [sp, #44]	; 0x2c
 116:	f240 0000 	movw	r0, #0
 11a:	f2c0 0000 	movt	r0, #0
 11e:	900a      	str	r0, [sp, #40]	; 0x28
 120:	a80a      	add	r0, sp, #40	; 0x28
_ZN5mylib9send_coap18start_network_task17h74bff87eeb41fc59E():
/mnt/c/stm32bluepill-mynewt-sensor/src/send_coap.rs:72
 122:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 126:	defe      	udf	#254	; 0xfe
main():
 128:	a809      	add	r0, sp, #36	; 0x24
_ZN5mylib13listen_sensor21start_sensor_listener17h1d9f0c2ac57087e6E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:46
    assert_eq!(rc, 0);
 12a:	9010      	str	r0, [sp, #64]	; 0x40
 12c:	f240 0000 	movw	r0, #0
 130:	a911      	add	r1, sp, #68	; 0x44
 132:	f2c0 0000 	movt	r0, #0
 136:	9008      	str	r0, [sp, #32]
 138:	e9cd 0106 	strd	r0, r1, [sp, #24]
 13c:	a810      	add	r0, sp, #64	; 0x40
 13e:	9005      	str	r0, [sp, #20]
 140:	f240 0000 	movw	r0, #0
 144:	f2c0 0000 	movt	r0, #0
 148:	f240 0100 	movw	r1, #0
 14c:	9011      	str	r0, [sp, #68]	; 0x44
 14e:	2002      	movs	r0, #2
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 150:	900f      	str	r0, [sp, #60]	; 0x3c
 152:	a805      	add	r0, sp, #20
 154:	900e      	str	r0, [sp, #56]	; 0x38
 156:	2000      	movs	r0, #0
 158:	e9cd 000c 	strd	r0, r0, [sp, #48]	; 0x30
 15c:	2003      	movs	r0, #3
 15e:	900b      	str	r0, [sp, #44]	; 0x2c
 160:	f240 0000 	movw	r0, #0
 164:	f2c0 0000 	movt	r0, #0
_ZN5mylib13listen_sensor21start_sensor_listener17h1d9f0c2ac57087e6E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:46
 168:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 16c:	900a      	str	r0, [sp, #40]	; 0x28
 16e:	a80a      	add	r0, sp, #40	; 0x28
_ZN5mylib13listen_sensor21start_sensor_listener17h1d9f0c2ac57087e6E():
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:46
 170:	f7ff fffe 	bl	0 <_ZN4core9panicking9panic_fmt17h6b4d8e87b0965449E>
 174:	defe      	udf	#254	; 0xfe
/mnt/c/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:50
    assert!(unsafe{ !is_null_sensor(sensor) });
 176:	f240 0000 	movw	r0, #0
 17a:	f2c0 0000 	movt	r0, #0
 17e:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 182:	defe      	udf	#254	; 0xfe
_ZN5mylib6mynewt2hw6sensor17register_listener17h1dbbbe32ef06507aE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt/hw/sensor.rs:66
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
 184:	f240 0000 	movw	r0, #0
 188:	f2c0 0000 	movt	r0, #0
 18c:	f7ff fffe 	bl	0 <_ZN4core9panicking5panic17h53ca63c6ac6312f8E>
 190:	defe      	udf	#254	; 0xfe

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:63

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    //  Display the filename and line number to the Semihosting Console.
    if let Some(location) = info.location() {
   0:	f7ff fffe 	bl	0 <_ZN4core5panic9PanicInfo8location17h5226165d8771f8a2E>
   4:	b338      	cbz	r0, 56 <rust_begin_unwind+0x56>
   6:	4604      	mov	r4, r0
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:64
        let file = location.file();
   8:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4file17h94cc6af18de736c4E>
   c:	4605      	mov	r5, r0
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:65
        let line = location.line();
   e:	4620      	mov	r0, r4
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:64
        let file = location.file();
  10:	460e      	mov	r6, r1
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:65
        let line = location.line();
  12:	f7ff fffe 	bl	0 <_ZN4core5panic8Location4line17h3ffc63f14d0a6636E>
  16:	4604      	mov	r4, r0
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  18:	f240 0000 	movw	r0, #0
  1c:	f2c0 0000 	movt	r0, #0
  20:	2109      	movs	r1, #9
  22:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  26:	f7ff fffe 	bl	0 <console_flush>
rust_begin_unwind():
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:67
        console_print(b"panic at ");
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
  2a:	4628      	mov	r0, r5
  2c:	4631      	mov	r1, r6
  2e:	f7ff fffe 	bl	0 <console_buffer>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  32:	f240 0000 	movw	r0, #0
  36:	2108      	movs	r1, #8
  38:	f2c0 0000 	movt	r0, #0
  3c:	f7ff fffe 	bl	0 <console_buffer>
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:19
        console_flush();  //  TODO: Remove this.
  40:	f7ff fffe 	bl	0 <console_flush>
rust_begin_unwind():
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:69
        console_print(b" line 0x");
        unsafe { console_printhex(line as u8) }  //  TODO: Print in decimal not hex. Allow more than 255 lines.
  44:	b2e0      	uxtb	r0, r4
  46:	f7ff fffe 	bl	0 <console_printhex>
_ZN5mylib4base13console_print17h53afd0cf661b2c25E():
/mnt/c/stm32bluepill-mynewt-sensor/src/base.rs:18
        console_buffer(msg.as_ptr(), len as u32);
  4a:	f240 0000 	movw	r0, #0
  4e:	2101      	movs	r1, #1
  50:	f2c0 0000 	movt	r0, #0
  54:	e004      	b.n	c <rust_begin_unwind+0xc>
  56:	f240 0000 	movw	r0, #0
  5a:	2112      	movs	r1, #18
  5c:	f2c0 0000 	movt	r0, #0
rust_begin_unwind():
  60:	f7ff fffe 	bl	0 <console_buffer>
  64:	f7ff fffe 	bl	0 <console_flush>
  68:	f7ff fffe 	bl	0 <console_flush>
_ZN8cortex_m3asm4bkpt17hc1862ddcb43450fcE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:19
        () => unsafe {
            extern "C" {
                fn __bkpt();
            }

            __bkpt();
  6c:	f7ff fffe 	bl	0 <__bkpt>
rust_begin_unwind():
/mnt/c/stm32bluepill-mynewt-sensor/src/lib.rs:79
        unsafe { console_flush() }
    }
    //  Pause in the debugger.
    bkpt();
    //  Loop forever so that device won't restart.
    loop {}
  70:	e7fe      	b.n	70 <rust_begin_unwind+0x70>

Disassembly of section .text._ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE:

00000000 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE>:
_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE():
/mnt/c/stm32bluepill-mynewt-sensor/src/mynewt.rs:30
    #[derive(Debug, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	6802      	ldr	r2, [r0, #0]
   6:	f102 000f 	add.w	r0, r2, #15
   a:	280e      	cmp	r0, #14
   c:	d80f      	bhi.n	2e <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x2e>
   e:	e8df f000 	tbb	[pc, r0]
  12:	1908      	.short	0x1908
  14:	352f2721 	.word	0x352f2721
  18:	4f49413b 	.word	0x4f49413b
  1c:	69615b55 	.word	0x69615b55
  20:	006f      	.short	0x006f
  22:	f240 0200 	movw	r2, #0
  26:	ac01      	add	r4, sp, #4
  28:	f2c0 0200 	movt	r2, #0
  2c:	e037      	b.n	9e <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x9e>
  2e:	2001      	movs	r0, #1
  30:	ac01      	add	r4, sp, #4
  32:	f6cf 70ff 	movt	r0, #65535	; 0xffff
  36:	4282      	cmp	r2, r0
  38:	d162      	bne.n	100 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x100>
  3a:	f240 0200 	movw	r2, #0
  3e:	f2c0 0200 	movt	r2, #0
  42:	e04c      	b.n	de <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0xde>
  44:	ac01      	add	r4, sp, #4
  46:	f240 0200 	movw	r2, #0
  4a:	f2c0 0200 	movt	r2, #0
  4e:	230d      	movs	r3, #13
  50:	4620      	mov	r0, r4
  52:	e05b      	b.n	10c <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x10c>
  54:	f240 0200 	movw	r2, #0
  58:	ac01      	add	r4, sp, #4
  5a:	f2c0 0200 	movt	r2, #0
  5e:	e03e      	b.n	de <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0xde>
  60:	ac01      	add	r4, sp, #4
  62:	f240 0200 	movw	r2, #0
  66:	f2c0 0200 	movt	r2, #0
  6a:	230b      	movs	r3, #11
  6c:	4620      	mov	r0, r4
  6e:	e04d      	b.n	10c <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x10c>
  70:	f240 0200 	movw	r2, #0
  74:	ac01      	add	r4, sp, #4
  76:	f2c0 0200 	movt	r2, #0
  7a:	e030      	b.n	64 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x64>
  7c:	f240 0200 	movw	r2, #0
  80:	ac01      	add	r4, sp, #4
  82:	f2c0 0200 	movt	r2, #0
  86:	e038      	b.n	74 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x74>
  88:	f240 0200 	movw	r2, #0
  8c:	ac01      	add	r4, sp, #4
  8e:	f2c0 0200 	movt	r2, #0
  92:	e032      	b.n	68 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x68>
  94:	f240 0200 	movw	r2, #0
  98:	ac01      	add	r4, sp, #4
  9a:	f2c0 0200 	movt	r2, #0
  9e:	4620      	mov	r0, r4
  a0:	2309      	movs	r3, #9
  a2:	e033      	b.n	10c <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x10c>
  a4:	f240 0200 	movw	r2, #0
  a8:	ac01      	add	r4, sp, #4
  aa:	f2c0 0200 	movt	r2, #0
  ae:	e024      	b.n	4c <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x4c>
  b0:	f240 0200 	movw	r2, #0
  b4:	ac01      	add	r4, sp, #4
  b6:	f2c0 0200 	movt	r2, #0
  ba:	e01e      	b.n	40 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x40>
  bc:	f240 0200 	movw	r2, #0
  c0:	ac01      	add	r4, sp, #4
  c2:	f2c0 0200 	movt	r2, #0
  c6:	e01f      	b.n	42 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x42>
  c8:	f240 0200 	movw	r2, #0
  cc:	ac01      	add	r4, sp, #4
  ce:	f2c0 0200 	movt	r2, #0
  d2:	e012      	b.n	28 <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x28>
  d4:	f240 0200 	movw	r2, #0
  d8:	ac01      	add	r4, sp, #4
  da:	f2c0 0200 	movt	r2, #0
  de:	4620      	mov	r0, r4
  e0:	230c      	movs	r3, #12
  e2:	e013      	b.n	10c <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x10c>
  e4:	f240 0200 	movw	r2, #0
  e8:	ac01      	add	r4, sp, #4
  ea:	f2c0 0200 	movt	r2, #0
  ee:	e004      	b.n	c <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0xc>
  f0:	f240 0200 	movw	r2, #0
  f4:	ac01      	add	r4, sp, #4
  f6:	f2c0 0200 	movt	r2, #0
  fa:	4620      	mov	r0, r4
  fc:	230a      	movs	r3, #10
  fe:	e005      	b.n	10c <_ZN71_$LT$mylib..mynewt..result..MynewtError$u20$as$u20$core..fmt..Debug$GT$3fmt17he637fff21126bd1cE+0x10c>
 100:	f240 0200 	movw	r2, #0
 104:	f2c0 0200 	movt	r2, #0
 108:	4620      	mov	r0, r4
 10a:	2307      	movs	r3, #7
 10c:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
 110:	4620      	mov	r0, r4
 112:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
 116:	b004      	add	sp, #16
 118:	bd10      	pop	{r4, pc}

stable_deref_trait-7e4aacb4fb4092a5.stable_deref_trait.68qjq3nc-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stable_deref_trait.68qjq3nc-cgu.0



typenum-4c9f84627c822a2d.typenum.amoh2oqh-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 typenum.amoh2oqh-cgu.0
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000096 l       .debug_str	00000000 
000000e0 l       .debug_str	00000000 
000000e5 l       .debug_str	00000000 
000000ec l       .debug_str	00000000 
000000ef l       .debug_str	00000000 
000000f2 l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
000000fd l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000104 l       .debug_str	00000000 
00000107 l       .debug_str	00000000 
0000010c l       .debug_str	00000000 
00000112 l       .debug_str	00000000 
00000119 l       .debug_str	00000000 
00000121 l       .debug_str	00000000 
0000012b l       .debug_str	00000000 
00000133 l       .debug_str	00000000 
00000138 l       .debug_str	00000000 
00000141 l       .debug_str	00000000 
00000149 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000151 l       .debug_str	00000000 
00000157 l       .debug_str	00000000 
000001ba l       .debug_str	00000000 
000001be l       .debug_str	00000000 
000001c4 l       .debug_str	00000000 
00000267 l       .debug_str	00000000 
0000026b l       .debug_str	00000000 
000002e2 l       .debug_str	00000000 
000002e9 l       .debug_str	00000000 
000002ed l       .debug_str	00000000 
00000340 l       .debug_str	00000000 
00000393 l       .debug_str	00000000 
000003ea l       .debug_str	00000000 
0000043d l       .debug_str	00000000 
00000495 l       .debug_str	00000000 
000004e8 l       .debug_str	00000000 
00000538 l       .debug_str	00000000 
00000589 l       .debug_str	00000000 
0000058e l       .debug_str	00000000 
000005a4 l       .debug_str	00000000 
000005ac l       .debug_str	00000000 
000005b3 l       .debug_str	00000000 
000005b7 l       .debug_str	00000000 
000005bb l       .debug_str	00000000 
000005be l       .debug_str	00000000 
000005e7 l       .debug_str	00000000 
000005e9 l       .debug_str	00000000 
0000061f l       .debug_str	00000000 
00000621 l       .debug_str	00000000 
00000623 l       .debug_str	00000000 
00000650 l       .debug_str	00000000 
00000653 l       .debug_str	00000000 
00000665 l       .debug_str	00000000 
00000667 l       .debug_str	00000000 
0000066d l       .debug_str	00000000 
00000671 l       .debug_str	00000000 
00000676 l       .debug_str	00000000 
0000067b l       .debug_str	00000000 
00000681 l       .debug_str	00000000 
00000687 l       .debug_str	00000000 
0000068e l       .debug_str	00000000 
00000693 l       .debug_str	00000000 
00000699 l       .debug_str	00000000 
0000069e l       .debug_str	00000000 
000006ac l       .debug_str	00000000 
000006b6 l       .debug_str	00000000 
000006ba l       .debug_str	00000000 
000006c2 l       .debug_str	00000000 
000006ca l       .debug_str	00000000 
000006d1 l       .debug_str	00000000 
000006e5 l       .debug_str	00000000 
000006f1 l       .debug_str	00000000 
000006fc l       .debug_str	00000000 
00000703 l       .debug_str	00000000 
00000709 l       .debug_str	00000000 
0000070d l       .debug_str	00000000 
00000713 l       .debug_str	00000000 
00000719 l       .debug_str	00000000 
0000071c l       .debug_str	00000000 
0000072b l       .debug_str	00000000 
0000072f l       .debug_str	00000000 
00000738 l       .debug_str	00000000 
00000744 l       .debug_str	00000000 
0000075d l       .debug_str	00000000 
00000762 l       .debug_str	00000000 
00000773 l       .debug_str	00000000 
0000077d l       .debug_str	00000000 
000007db l       .debug_str	00000000 
000007e6 l       .debug_str	00000000 
00000803 l       .debug_str	00000000 
00000807 l       .debug_str	00000000 
0000081e l       .debug_str	00000000 
00000842 l       .debug_str	00000000 
0000085e l       .debug_str	00000000 
00000863 l       .debug_str	00000000 
0000086c l       .debug_str	00000000 
00000873 l       .debug_str	00000000 
0000088c l       .debug_str	00000000 
00000896 l       .debug_str	00000000 
000008b0 l       .debug_str	00000000 
000008c2 l       .debug_str	00000000 
000008c5 l       .debug_str	00000000 
000008d7 l       .debug_str	00000000 
000008dd l       .debug_str	00000000 
000008f4 l       .debug_str	00000000 
000008fc l       .debug_str	00000000 
0000090e l       .debug_str	00000000 
00000922 l       .debug_str	00000000 
0000092b l       .debug_str	00000000 
00000932 l       .debug_str	00000000 
0000093d l       .debug_str	00000000 
00000942 l       .debug_str	00000000 
0000094d l       .debug_str	00000000 
00000952 l       .debug_str	00000000 
00000961 l       .debug_str	00000000 
00000967 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.0	00000002 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.0
00000000 l     O .rodata..Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.1	00000002 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.1
00000000 l     O .rodata..Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.2	00000005 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.2
00000000 l     O .rodata..Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.3	00000002 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.3
00000000 l     O .rodata..Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.4	00000005 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.4
00000000 l     O .rodata..Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.5	00000007 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.5
00000000 l     O .rodata.cst4	00000004 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.6
00000000 l     O .rodata..Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.7	00000005 .Lanon.b1cdd641dffde5abd5d4cd0e2389c4ce.7
00000000 l    d  .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE	00000000 .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE
00000000 l    d  .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000000 .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E
00000000 l    d  .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417hd194300839b7ad94E	00000000 .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417hd194300839b7ad94E
00000000 l    d  .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17hee076fb5a3e24b09E	00000000 .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17hee076fb5a3e24b09E
00000000 l    d  .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17h001227141f324c66E	00000000 .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17h001227141f324c66E
00000000 l    d  .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5ae7c158979ab1aeE	00000000 .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5ae7c158979ab1aeE
00000000 l    d  .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h2c9defcfc06f58d5E	00000000 .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h2c9defcfc06f58d5E
00000000 l    d  .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5246d5a825b3ad5dE	00000000 .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5246d5a825b3ad5dE
00000000 l    d  .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h19d7e11dad2d708eE	00000000 .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h19d7e11dad2d708eE
00000000 l    d  .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17h05d168137b28b29fE	00000000 .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17h05d168137b28b29fE
00000000 l    d  .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h661e44b06c387cecE	00000000 .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h661e44b06c387cecE
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E
00000000         *UND*	00000000 _ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE
00000000         *UND*	00000000 _ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E
00000000 g     F .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17h05d168137b28b29fE	00000020 _ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17h05d168137b28b29fE
00000000 g     F .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h661e44b06c387cecE	00000020 _ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h661e44b06c387cecE
00000000 g     F .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h19d7e11dad2d708eE	00000020 _ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h19d7e11dad2d708eE
00000000 g     F .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17hee076fb5a3e24b09E	00000020 _ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17hee076fb5a3e24b09E
00000000 g     F .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17h001227141f324c66E	00000020 _ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17h001227141f324c66E
00000000 g     F .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h2c9defcfc06f58d5E	00000020 _ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h2c9defcfc06f58d5E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN56_$LT$typenum..bit..B0$u20$as$u20$core..ops..bit..Not$GT$3not17h4e483909f213e4a0E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN56_$LT$typenum..bit..B1$u20$as$u20$core..ops..bit..Not$GT$3not17h999bc8357a3d5081E
00000000 g     F .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5ae7c158979ab1aeE	00000020 _ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5ae7c158979ab1aeE
00000000 g     F .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5246d5a825b3ad5dE	00000020 _ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5246d5a825b3ad5dE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN58_$LT$typenum..bit..B0$u20$as$u20$core..ops..bit..BitOr$GT$5bitor17hf5002f95ef8df3bcE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN58_$LT$typenum..int..Z0$u20$as$u20$core..ops..arith..Neg$GT$3neg17h01d2a66b4188c944E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN58_$LT$typenum..int..Z0$u20$as$u20$core..ops..arith..Sub$GT$3sub17hdc9d9e73961deea3E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN59_$LT$typenum..bit..B0$u20$as$u20$core..ops..bit..BitXor$GT$6bitxor17hbcfc2619286e7780E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN59_$LT$typenum..bit..B1$u20$as$u20$core..ops..bit..BitAnd$GT$6bitand17h52a348d15edc54bdE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN59_$LT$typenum..bit..B1$u20$as$u20$core..ops..bit..BitXor$GT$6bitxor17h4f4068ab9146e4b2E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN62_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..arith..Sub$GT$3sub17hf0c7b938cc802af9E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN63_$LT$typenum..array..ATerm$u20$as$u20$core..ops..arith..Add$GT$3add17hcd45f9f7e92475a2E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN63_$LT$typenum..array..ATerm$u20$as$u20$core..ops..arith..Neg$GT$3neg17h3ec477e9be3796adE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN63_$LT$typenum..array..ATerm$u20$as$u20$core..ops..arith..Sub$GT$3sub17h0896d0ba7c42316eE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN65_$LT$typenum..bit..B0$u20$as$u20$typenum..type_operators..Max$GT$3max17h6a6fd5687c5ef2f9E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN65_$LT$typenum..bit..B0$u20$as$u20$typenum..type_operators..Min$GT$3min17had457ca621b38923E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN65_$LT$typenum..bit..B1$u20$as$u20$typenum..type_operators..Max$GT$3max17h1418b9debecec14eE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN65_$LT$typenum..bit..B1$u20$as$u20$typenum..type_operators..Min$GT$3min17h573ebfd015e2fe22E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN65_$LT$typenum..int..Z0$u20$as$u20$typenum..type_operators..Max$GT$3max17he10b2812d1850bbbE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN65_$LT$typenum..int..Z0$u20$as$u20$typenum..type_operators..Min$GT$3min17hd65b836356b9784aE
00000000 g     F .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE	00000002 _ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE
00000000 g     F .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE	00000002 _ZN70_$LT$typenum..array..ATerm$u20$as$u20$typenum..type_operators..Len$GT$3len17ha104aa2174952e5eE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN7typenum5array97_$LT$impl$u20$core..ops..arith..Mul$LT$typenum..array..ATerm$GT$$u20$for$u20$typenum..int..Z0$GT$3mul17h484a381281eacc2aE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN82_$LT$typenum..bit..B0$u20$as$u20$core..ops..bit..BitOr$LT$typenum..bit..B1$GT$$GT$5bitor17hc6039091710335e1E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN83_$LT$typenum..bit..B0$u20$as$u20$core..ops..bit..BitXor$LT$typenum..bit..B1$GT$$GT$6bitxor17hd97ee9a002019effE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN83_$LT$typenum..bit..B1$u20$as$u20$core..ops..bit..BitAnd$LT$typenum..bit..B0$GT$$GT$6bitand17h9b37e66ffe2dd852E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN83_$LT$typenum..bit..B1$u20$as$u20$core..ops..bit..BitXor$LT$typenum..bit..B0$GT$$GT$6bitxor17h13346302545ececdE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN84_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..bit..Shl$LT$typenum..bit..B0$GT$$GT$3shl17hbd3966de6a646dcfE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN84_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..bit..Shl$LT$typenum..bit..B1$GT$$GT$3shl17h95f34f8e62f95e4bE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN84_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..bit..Shr$LT$typenum..bit..B0$GT$$GT$3shr17h85a37c887e134020E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN84_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..bit..Shr$LT$typenum..bit..B1$GT$$GT$3shr17h8792d9ff91d0c866E
00000000 g     F .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417hd194300839b7ad94E	00000006 _ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417hd194300839b7ad94E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN86_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..arith..Add$LT$typenum..bit..B0$GT$$GT$3add17hcb87b9123fd520f9E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN86_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..arith..Add$LT$typenum..bit..B1$GT$$GT$3add17hb609dd0be33df13cE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN86_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..arith..Mul$LT$typenum..bit..B0$GT$$GT$3mul17h29bc0fc69ec9efd1E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN86_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..arith..Mul$LT$typenum..bit..B1$GT$$GT$3mul17hdd045f563133b795E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN86_$LT$typenum..uint..UTerm$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B0$GT$$GT$3sub17h632d5f21b7d247d6E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN89_$LT$typenum..bit..B0$u20$as$u20$typenum..type_operators..Max$LT$typenum..bit..B1$GT$$GT$3max17hc1571d2e9d00837aE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN89_$LT$typenum..bit..B0$u20$as$u20$typenum..type_operators..Min$LT$typenum..bit..B1$GT$$GT$3min17h2ff8d73d5920e393E
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN89_$LT$typenum..bit..B1$u20$as$u20$typenum..type_operators..Max$LT$typenum..bit..B0$GT$$GT$3max17h91d0f33bb466380cE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN89_$LT$typenum..bit..B1$u20$as$u20$typenum..type_operators..Min$LT$typenum..bit..B0$GT$$GT$3min17hba9885e869ccfb2dE
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E	00000002 _ZN89_$LT$typenum..int..Z0$u20$as$u20$typenum..type_operators..Pow$LT$typenum..int..Z0$GT$$GT$4powi17h2d7a9c821379ebacE



Disassembly of section .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE:

00000000 <_ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE>:
_ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17hdfb3609f127dd41eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/uint.rs:244
/// Length of `UTerm` by itself is 0
impl Len for UTerm {
    type Output = U0;
    fn len(&self) -> Self::Output {
        UTerm
    }
   0:	4770      	bx	lr

Disassembly of section .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E:

00000000 <_ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E>:
_ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17hfeea0ac884894728E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/uint.rs:403
/// `UInt<UTerm, B1> - B1 = UTerm`
impl Sub<B1> for UInt<UTerm, B1> {
    type Output = UTerm;
    fn sub(self, _: B1) -> Self::Output {
        UTerm
    }
   0:	4770      	bx	lr

Disassembly of section .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417hd194300839b7ad94E:

00000000 <_ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417hd194300839b7ad94E>:
_ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417hd194300839b7ad94E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/private.rs:116
}

impl InvertedUnsigned for InvertedUTerm {
    fn to_u64() -> u64 {
        0
    }
   0:	2000      	movs	r0, #0
   2:	2100      	movs	r1, #0
   4:	4770      	bx	lr

Disassembly of section .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17hee076fb5a3e24b09E:

00000000 <_ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17hee076fb5a3e24b09E>:
_ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17hee076fb5a3e24b09E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/bit.rs:19
use {Cmp, Equal, Greater, Less, NonZero, PowerOfTwo};

pub use marker_traits::Bit;

/// The type-level bit 0.
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2302      	movs	r3, #2
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17h001227141f324c66E:

00000000 <_ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17h001227141f324c66E>:
_ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17h001227141f324c66E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/bit.rs:31
        B0
    }
}

/// The type-level bit 1.
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2302      	movs	r3, #2
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5ae7c158979ab1aeE:

00000000 <_ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5ae7c158979ab1aeE>:
_ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5ae7c158979ab1aeE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/uint.rs:49
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2305      	movs	r3, #5
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h2c9defcfc06f58d5E:

00000000 <_ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h2c9defcfc06f58d5E>:
_ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h2c9defcfc06f58d5E():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/int.rs:74
        }
    }
}

/// The type-level signed integer 0.
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2302      	movs	r3, #2
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5246d5a825b3ad5dE:

00000000 <_ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5246d5a825b3ad5dE>:
_ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h5246d5a825b3ad5dE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/array.rs:11
use core::ops::{Add, Div, Mul, Sub};

use super::*;

/// The terminating type for type arrays.
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2305      	movs	r3, #5
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h19d7e11dad2d708eE:

00000000 <_ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h19d7e11dad2d708eE>:
_ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h19d7e11dad2d708eE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/lib.rs:84
pub use int::{NInt, PInt};
pub use array::{ATerm, TArr};

/// A potential output from `Cmp`, this is the type equivalent to the enum variant
/// `core::cmp::Ordering::Greater`.
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2307      	movs	r3, #7
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17h05d168137b28b29fE:

00000000 <_ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17h05d168137b28b29fE>:
_ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17h05d168137b28b29fE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/lib.rs:89
pub struct Greater;

/// A potential output from `Cmp`, this is the type equivalent to the enum variant
/// `core::cmp::Ordering::Less`.
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2304      	movs	r3, #4
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h661e44b06c387cecE:

00000000 <_ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h661e44b06c387cecE>:
_ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h661e44b06c387cecE():
/home/user/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/lib.rs:94
pub struct Less;

/// A potential output from `Cmp`, this is the type equivalent to the enum variant
/// `core::cmp::Ordering::Equal`.
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2305      	movs	r3, #5
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <_ZN4core3fmt9Formatter11debug_tuple17h793087e8ecab9022E>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <_ZN4core3fmt8builders10DebugTuple6finish17h24d91625b3672e6dE>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

vcell-274fabc28493d739.vcell.6ki0ih0m-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 vcell.6ki0ih0m-cgu.0



volatile_register-c96256360e617456.volatile_register.2x7rfnyt-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 volatile_register.2x7rfnyt-cgu.0


