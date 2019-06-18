In archive rustlib.a:

aligned-55d29df8ea3c0ef1.aligned.3p3w7k3t-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 aligned.3p3w7k3t-cgu.0



aligned-be062abff940bd17.aligned.av1qgrjm-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 aligned.av1qgrjm-cgu.0



as_slice-1b2be7b00dce2d1f.as_slice.1ah3y62u-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 as_slice.1ah3y62u-cgu.0



bare_metal-054f093981ad13a9.bare_metal.agoid89k-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 bare_metal.agoid89k-cgu.0
00000109 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000009a l       .debug_str	00000000 
000000e8 l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
00000142 l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
000000f9 l       .debug_str	00000000 
00000000 l    d  .text._ZN10bare_metal15CriticalSection3new17h3a47390f9e9891e0E	00000000 .text._ZN10bare_metal15CriticalSection3new17h3a47390f9e9891e0E
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN10bare_metal15CriticalSection3new17h3a47390f9e9891e0E	00000002 bare_metal::CriticalSection::new



Disassembly of section .text._ZN10bare_metal15CriticalSection3new17h3a47390f9e9891e0E:

00000000 <bare_metal::CriticalSection::new>:
_ZN10bare_metal15CriticalSection3new17h3a47390f9e9891e0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/bare-metal-0.2.4/src/lib.rs:68
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
00000000 l    d  .text.__cpsid	00000000 .text.(char, short *, int, double)
00000000 l    d  .text.__cpsie	00000000 .text.(char, short *, int,...)
00000000 l    d  .text.__delay	00000000 .text.__delay
00000000 l    d  .text.__dmb	00000000 .text.__dmb
00000000 l    d  .text.__dsb	00000000 .text.(double, short, bool)
00000000 l    d  .text.__isb	00000000 .text.(int, short, bool)
00000000 l    d  .text.__msp_r	00000000 .text.__msp_r
00000000 l    d  .text.__msp_w	00000000 .text.__msp_w
00000000 l    d  .text.__nop	00000000 .text.__nop
00000000 l    d  .text.__primask	00000000 .text.__primask
00000000 l    d  .text.__psp_r	00000000 .text.__psp_r
00000000 l    d  .text.__psp_w	00000000 .text.__psp_w
00000000 l    d  .text.__sev	00000000 .text.(short,...)(void)
00000000 l    d  .text.__wfe	00000000 .text.(wchar_t, float,...)
00000000 l    d  .text.__wfi	00000000 .text.(wchar_t, float, int)
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

cortex_m-227e1b5697658e5e.cortex_m.7fph9s8g-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cortex_m.7fph9s8g-cgu.0
00003102 l       .debug_str	00000000 
00002956 l       .debug_str	00000000 
00002961 l       .debug_str	00000000 
000029d2 l       .debug_str	00000000 
000029e4 l       .debug_str	00000000 
00002a50 l       .debug_str	00000000 
00002a5d l       .debug_str	00000000 
00002ac9 l       .debug_str	00000000 
00002ad6 l       .debug_str	00000000 
00002b42 l       .debug_str	00000000 
00002b4f l       .debug_str	00000000 
00002bbe l       .debug_str	00000000 
00002bcc l       .debug_str	00000000 
00002c3d l       .debug_str	00000000 
00002cb0 l       .debug_str	00000000 
00002d20 l       .debug_str	00000000 
00002d92 l       .debug_str	00000000 
00002e04 l       .debug_str	00000000 
00002e15 l       .debug_str	00000000 
00002e82 l       .debug_str	00000000 
00002e8e l       .debug_str	00000000 
00002efa l       .debug_str	00000000 
00002f05 l       .debug_str	00000000 
00002f79 l       .debug_str	00000000 
00002f8c l       .debug_str	00000000 
00003001 l       .debug_str	00000000 
00003015 l       .debug_str	00000000 
00003082 l       .debug_str	00000000 
0000308e l       .debug_str	00000000 
00003115 l       .debug_str	00000000 
0000318b l       .debug_str	00000000 
000031a0 l       .debug_str	00000000 
0000320c l       .debug_str	00000000 
00003217 l       .debug_str	00000000 
00003289 l       .debug_str	00000000 
0000329a l       .debug_str	00000000 
00003306 l       .debug_str	00000000 
00003311 l       .debug_str	00000000 
00003351 l       .debug_str	00000000 
00003357 l       .debug_str	00000000 
0000338c l       .debug_str	00000000 
00003390 l       .debug_str	00000000 
000033c5 l       .debug_str	00000000 
000033c9 l       .debug_str	00000000 
000033d1 l       .debug_str	00000000 
000033d9 l       .debug_str	00000000 
000033e3 l       .debug_str	00000000 
000033eb l       .debug_str	00000000 
000033f3 l       .debug_str	00000000 
000033f9 l       .debug_str	00000000 
00003401 l       .debug_str	00000000 
00003409 l       .debug_str	00000000 
0000340f l       .debug_str	00000000 
00003418 l       .debug_str	00000000 
0000341f l       .debug_str	00000000 
00003426 l       .debug_str	00000000 
00003434 l       .debug_str	00000000 
00003464 l       .debug_str	00000000 
000034c9 l       .debug_str	00000000 
000034cf l       .debug_str	00000000 
000034f9 l       .debug_str	00000000 
00003530 l       .debug_str	00000000 
00003535 l       .debug_str	00000000 
00003540 l       .debug_str	00000000 
00003544 l       .debug_str	00000000 
00003548 l       .debug_str	00000000 
0000354c l       .debug_str	00000000 
00003551 l       .debug_str	00000000 
00003556 l       .debug_str	00000000 
00003561 l       .debug_str	00000000 
00003567 l       .debug_str	00000000 
0000356b l       .debug_str	00000000 
00003572 l       .debug_str	00000000 
00003579 l       .debug_str	00000000 
000035ab l       .debug_str	00000000 
00003612 l       .debug_str	00000000 
0000363e l       .debug_str	00000000 
00003673 l       .debug_str	00000000 
00003679 l       .debug_str	00000000 
0000367f l       .debug_str	00000000 
00003685 l       .debug_str	00000000 
0000368b l       .debug_str	00000000 
000036bb l       .debug_str	00000000 
00003720 l       .debug_str	00000000 
0000374a l       .debug_str	00000000 
0000377f l       .debug_str	00000000 
00003784 l       .debug_str	00000000 
0000378b l       .debug_str	00000000 
00003792 l       .debug_str	00000000 
00003799 l       .debug_str	00000000 
000037a2 l       .debug_str	00000000 
000037a9 l       .debug_str	00000000 
000037b1 l       .debug_str	00000000 
000037b6 l       .debug_str	00000000 
000037bb l       .debug_str	00000000 
000037c0 l       .debug_str	00000000 
000037c9 l       .debug_str	00000000 
000037d4 l       .debug_str	00000000 
000037d8 l       .debug_str	00000000 
000037dc l       .debug_str	00000000 
0000380c l       .debug_str	00000000 
00003871 l       .debug_str	00000000 
0000389b l       .debug_str	00000000 
000038d0 l       .debug_str	00000000 
000038d4 l       .debug_str	00000000 
000038da l       .debug_str	00000000 
0000390a l       .debug_str	00000000 
0000396f l       .debug_str	00000000 
00003999 l       .debug_str	00000000 
000039ce l       .debug_str	00000000 
000039d2 l       .debug_str	00000000 
000039dc l       .debug_str	00000000 
000039e0 l       .debug_str	00000000 
000039ea l       .debug_str	00000000 
000039ee l       .debug_str	00000000 
000039f8 l       .debug_str	00000000 
00003a26 l       .debug_str	00000000 
00003a8b l       .debug_str	00000000 
00003ab5 l       .debug_str	00000000 
00003b21 l       .debug_str	00000000 
00003b2b l       .debug_str	00000000 
00003b59 l       .debug_str	00000000 
00003b8e l       .debug_str	00000000 
00003b92 l       .debug_str	00000000 
00003b98 l       .debug_str	00000000 
00003b9c l       .debug_str	00000000 
00003ba1 l       .debug_str	00000000 
00003ba6 l       .debug_str	00000000 
00003bae l       .debug_str	00000000 
00003bb6 l       .debug_str	00000000 
00003bbe l       .debug_str	00000000 
00003bc6 l       .debug_str	00000000 
00003bce l       .debug_str	00000000 
00003bd6 l       .debug_str	00000000 
00003c06 l       .debug_str	00000000 
00003c6b l       .debug_str	00000000 
00003c95 l       .debug_str	00000000 
00003ccb l       .debug_str	00000000 
00003cd0 l       .debug_str	00000000 
00003cd5 l       .debug_str	00000000 
00003cda l       .debug_str	00000000 
00003ce5 l       .debug_str	00000000 
00003cea l       .debug_str	00000000 
00003cf5 l       .debug_str	00000000 
00003cfa l       .debug_str	00000000 
00003d05 l       .debug_str	00000000 
00003d0a l       .debug_str	00000000 
00003d15 l       .debug_str	00000000 
00003d19 l       .debug_str	00000000 
00003d1e l       .debug_str	00000000 
00003d4f l       .debug_str	00000000 
00003db5 l       .debug_str	00000000 
00003de0 l       .debug_str	00000000 
00003e15 l       .debug_str	00000000 
00003e1a l       .debug_str	00000000 
00003e1f l       .debug_str	00000000 
00003e25 l       .debug_str	00000000 
00003e29 l       .debug_str	00000000 
00003e2e l       .debug_str	00000000 
00003e34 l       .debug_str	00000000 
00003e39 l       .debug_str	00000000 
00003e3e l       .debug_str	00000000 
00003e43 l       .debug_str	00000000 
00003e49 l       .debug_str	00000000 
00003e4e l       .debug_str	00000000 
00003e53 l       .debug_str	00000000 
00003e5e l       .debug_str	00000000 
00003e64 l       .debug_str	00000000 
00003e94 l       .debug_str	00000000 
00003ef9 l       .debug_str	00000000 
00003f23 l       .debug_str	00000000 
00003f59 l       .debug_str	00000000 
00003f5d l       .debug_str	00000000 
00003f61 l       .debug_str	00000000 
00003f65 l       .debug_str	00000000 
00003f6b l       .debug_str	00000000 
00003f9c l       .debug_str	00000000 
00004002 l       .debug_str	00000000 
0000402d l       .debug_str	00000000 
00004063 l       .debug_str	00000000 
00004068 l       .debug_str	00000000 
0000406e l       .debug_str	00000000 
00004074 l       .debug_str	00000000 
00004079 l       .debug_str	00000000 
0000407e l       .debug_str	00000000 
00004083 l       .debug_str	00000000 
0000408d l       .debug_str	00000000 
000040be l       .debug_str	00000000 
00004124 l       .debug_str	00000000 
0000414f l       .debug_str	00000000 
0000418e l       .debug_str	00000000 
000041ce l       .debug_str	00000000 
000041d4 l       .debug_str	00000000 
00004214 l       .debug_str	00000000 
0000421a l       .debug_str	00000000 
00004259 l       .debug_str	00000000 
0000425e l       .debug_str	00000000 
0000429f l       .debug_str	00000000 
000042a9 l       .debug_str	00000000 
000042ef l       .debug_str	00000000 
000042fd l       .debug_str	00000000 
00004364 l       .debug_str	00000000 
000043cc l       .debug_str	00000000 
00004437 l       .debug_str	00000000 
000044a3 l       .debug_str	00000000 
0000450a l       .debug_str	00000000 
0000456f l       .debug_str	00000000 
000045d4 l       .debug_str	00000000 
00004638 l       .debug_str	00000000 
0000469f l       .debug_str	00000000 
000046a5 l       .debug_str	00000000 
000046cc l       .debug_str	00000000 
000046d1 l       .debug_str	00000000 
000046ef l       .debug_str	00000000 
000046f6 l       .debug_str	00000000 
00004715 l       .debug_str	00000000 
00004734 l       .debug_str	00000000 
00004753 l       .debug_str	00000000 
00004762 l       .debug_str	00000000 
00004767 l       .debug_str	00000000 
00004787 l       .debug_str	00000000 
00004792 l       .debug_str	00000000 
000047ad l       .debug_str	00000000 
000047ca l       .debug_str	00000000 
000047e5 l       .debug_str	00000000 
00004800 l       .debug_str	00000000 
0000481b l       .debug_str	00000000 
00004836 l       .debug_str	00000000 
00004855 l       .debug_str	00000000 
00004870 l       .debug_str	00000000 
0000488c l       .debug_str	00000000 
000048a7 l       .debug_str	00000000 
000048c3 l       .debug_str	00000000 
000048df l       .debug_str	00000000 
00004905 l       .debug_str	00000000 
0000492c l       .debug_str	00000000 
00004935 l       .debug_str	00000000 
00004960 l       .debug_str	00000000 
0000496b l       .debug_str	00000000 
0000498f l       .debug_str	00000000 
000049b3 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000098 l       .debug_str	00000000 
000000e4 l       .debug_str	00000000 
000000eb l       .debug_str	00000000 
000000f4 l       .debug_str	00000000 
000000f8 l       .debug_str	00000000 
000000fc l       .debug_str	00000000 
00000107 l       .debug_str	00000000 
00000110 l       .debug_str	00000000 
00000115 l       .debug_str	00000000 
0000011a l       .debug_str	00000000 
00000120 l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
00000126 l       .debug_str	00000000 
00000136 l       .debug_str	00000000 
0000013b l       .debug_str	00000000 
00000160 l       .debug_str	00000000 
00000165 l       .debug_str	00000000 
0000017e l       .debug_str	00000000 
0000018f l       .debug_str	00000000 
00000194 l       .debug_str	00000000 
00000197 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001ae l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001d2 l       .debug_str	00000000 
000001dd l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
000001f1 l       .debug_str	00000000 
000001f8 l       .debug_str	00000000 
00000200 l       .debug_str	00000000 
0000020a l       .debug_str	00000000 
00000230 l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
0000023c l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
00000243 l       .debug_str	00000000 
0000024a l       .debug_str	00000000 
0000024e l       .debug_str	00000000 
00000251 l       .debug_str	00000000 
00000254 l       .debug_str	00000000 
00000259 l       .debug_str	00000000 
0000025f l       .debug_str	00000000 
00000266 l       .debug_str	00000000 
0000026e l       .debug_str	00000000 
00000278 l       .debug_str	00000000 
0000027f l       .debug_str	00000000 
00000284 l       .debug_str	00000000 
00000289 l       .debug_str	00000000 
00000290 l       .debug_str	00000000 
00000296 l       .debug_str	00000000 
000002a4 l       .debug_str	00000000 
000002b0 l       .debug_str	00000000 
000002c0 l       .debug_str	00000000 
000002ce l       .debug_str	00000000 
000002d3 l       .debug_str	00000000 
000002d8 l       .debug_str	00000000 
000002e1 l       .debug_str	00000000 
000002ef l       .debug_str	00000000 
000002f7 l       .debug_str	00000000 
00000302 l       .debug_str	00000000 
0000030f l       .debug_str	00000000 
00000315 l       .debug_str	00000000 
00000319 l       .debug_str	00000000 
0000031d l       .debug_str	00000000 
00000323 l       .debug_str	00000000 
0000032a l       .debug_str	00000000 
00000334 l       .debug_str	00000000 
00000339 l       .debug_str	00000000 
00000343 l       .debug_str	00000000 
0000034c l       .debug_str	00000000 
00000356 l       .debug_str	00000000 
0000035e l       .debug_str	00000000 
00000366 l       .debug_str	00000000 
0000036a l       .debug_str	00000000 
00000373 l       .debug_str	00000000 
000003d0 l       .debug_str	00000000 
000003d5 l       .debug_str	00000000 
000003d7 l       .debug_str	00000000 
000003dd l       .debug_str	00000000 
000003e2 l       .debug_str	00000000 
000003e7 l       .debug_str	00000000 
000003ed l       .debug_str	00000000 
000003f3 l       .debug_str	00000000 
000003f9 l       .debug_str	00000000 
00000407 l       .debug_str	00000000 
00000411 l       .debug_str	00000000 
00000415 l       .debug_str	00000000 
0000041d l       .debug_str	00000000 
00000425 l       .debug_str	00000000 
00000439 l       .debug_str	00000000 
00000445 l       .debug_str	00000000 
00000450 l       .debug_str	00000000 
00000457 l       .debug_str	00000000 
0000045d l       .debug_str	00000000 
00000461 l       .debug_str	00000000 
00000467 l       .debug_str	00000000 
0000046a l       .debug_str	00000000 
00000479 l       .debug_str	00000000 
00000480 l       .debug_str	00000000 
00000484 l       .debug_str	00000000 
0000048d l       .debug_str	00000000 
00000499 l       .debug_str	00000000 
000004b2 l       .debug_str	00000000 
000004b7 l       .debug_str	00000000 
000004c8 l       .debug_str	00000000 
000004d2 l       .debug_str	00000000 
00000530 l       .debug_str	00000000 
0000053b l       .debug_str	00000000 
00000558 l       .debug_str	00000000 
0000055c l       .debug_str	00000000 
00000564 l       .debug_str	00000000 
0000057b l       .debug_str	00000000 
0000059f l       .debug_str	00000000 
000005bb l       .debug_str	00000000 
000005c0 l       .debug_str	00000000 
000005c9 l       .debug_str	00000000 
000005d0 l       .debug_str	00000000 
000005e9 l       .debug_str	00000000 
000005f3 l       .debug_str	00000000 
0000060d l       .debug_str	00000000 
00000669 l       .debug_str	00000000 
00000671 l       .debug_str	00000000 
000006c0 l       .debug_str	00000000 
000006cc l       .debug_str	00000000 
000006d6 l       .debug_str	00000000 
000006df l       .debug_str	00000000 
000006e3 l       .debug_str	00000000 
000006ed l       .debug_str	00000000 
000006f2 l       .debug_str	00000000 
000006f6 l       .debug_str	00000000 
000006fb l       .debug_str	00000000 
00000702 l       .debug_str	00000000 
00000707 l       .debug_str	00000000 
0000070c l       .debug_str	00000000 
00000712 l       .debug_str	00000000 
00000717 l       .debug_str	00000000 
0000074a l       .debug_str	00000000 
0000076a l       .debug_str	00000000 
0000076c l       .debug_str	00000000 
000007c8 l       .debug_str	00000000 
000007d2 l       .debug_str	00000000 
000007d4 l       .debug_str	00000000 
000007d9 l       .debug_str	00000000 
00000809 l       .debug_str	00000000 
0000081c l       .debug_str	00000000 
00000820 l       .debug_str	00000000 
0000082b l       .debug_str	00000000 
00000870 l       .debug_str	00000000 
0000087e l       .debug_str	00000000 
0000089f l       .debug_str	00000000 
000008d3 l       .debug_str	00000000 
000008e1 l       .debug_str	00000000 
000008e6 l       .debug_str	00000000 
000008ed l       .debug_str	00000000 
000008f5 l       .debug_str	00000000 
00000900 l       .debug_str	00000000 
00000903 l       .debug_str	00000000 
00000905 l       .debug_str	00000000 
00000920 l       .debug_str	00000000 
00000945 l       .debug_str	00000000 
0000094b l       .debug_str	00000000 
00000950 l       .debug_str	00000000 
0000097f l       .debug_str	00000000 
00000989 l       .debug_str	00000000 
0000098f l       .debug_str	00000000 
00000993 l       .debug_str	00000000 
000009c4 l       .debug_str	00000000 
000009d8 l       .debug_str	00000000 
000009e1 l       .debug_str	00000000 
00000a21 l       .debug_str	00000000 
00000a2b l       .debug_str	00000000 
00000a5c l       .debug_str	00000000 
00000a6f l       .debug_str	00000000 
00000aae l       .debug_str	00000000 
00000ab7 l       .debug_str	00000000 
00000ae9 l       .debug_str	00000000 
00000af5 l       .debug_str	00000000 
00000afa l       .debug_str	00000000 
00000b00 l       .debug_str	00000000 
00000b07 l       .debug_str	00000000 
00000b09 l       .debug_str	00000000 
00000b0e l       .debug_str	00000000 
00000b14 l       .debug_str	00000000 
00000b1a l       .debug_str	00000000 
00000b1e l       .debug_str	00000000 
00000b2b l       .debug_str	00000000 
00000b32 l       .debug_str	00000000 
00000b36 l       .debug_str	00000000 
00000b67 l       .debug_str	00000000 
00000b7b l       .debug_str	00000000 
00000b84 l       .debug_str	00000000 
00000bc4 l       .debug_str	00000000 
00000bce l       .debug_str	00000000 
00000bff l       .debug_str	00000000 
00000c1e l       .debug_str	00000000 
00000c25 l       .debug_str	00000000 
00000c31 l       .debug_str	00000000 
00000c39 l       .debug_str	00000000 
00000c42 l       .debug_str	00000000 
00000c47 l       .debug_str	00000000 
00000c4a l       .debug_str	00000000 
00000c53 l       .debug_str	00000000 
00000c5a l       .debug_str	00000000 
00000c5d l       .debug_str	00000000 
00000c63 l       .debug_str	00000000 
00000c6d l       .debug_str	00000000 
00000c75 l       .debug_str	00000000 
00000c7b l       .debug_str	00000000 
00000c86 l       .debug_str	00000000 
00000c8f l       .debug_str	00000000 
00000cb2 l       .debug_str	00000000 
00000cd1 l       .debug_str	00000000 
00000cf8 l       .debug_str	00000000 
00000d02 l       .debug_str	00000000 
00000d97 l       .debug_str	00000000 
00000da3 l       .debug_str	00000000 
00000dc7 l       .debug_str	00000000 
00000dc9 l       .debug_str	00000000 
00000e14 l       .debug_str	00000000 
00000e24 l       .debug_str	00000000 
00000e28 l       .debug_str	00000000 
00000e36 l       .debug_str	00000000 
00000e3a l       .debug_str	00000000 
00000e3c l       .debug_str	00000000 
00000e3e l       .debug_str	00000000 
00000e85 l       .debug_str	00000000 
00000e91 l       .debug_str	00000000 
00000ee6 l       .debug_str	00000000 
00000ef0 l       .debug_str	00000000 
00000ef7 l       .debug_str	00000000 
00000f42 l       .debug_str	00000000 
00000f4d l       .debug_str	00000000 
00000f53 l       .debug_str	00000000 
00000f59 l       .debug_str	00000000 
00000f5f l       .debug_str	00000000 
00000f71 l       .debug_str	00000000 
00000faa l       .debug_str	00000000 
00000fb3 l       .debug_str	00000000 
00000fcd l       .debug_str	00000000 
00000fdf l       .debug_str	00000000 
00000fe7 l       .debug_str	00000000 
00001025 l       .debug_str	00000000 
00001030 l       .debug_str	00000000 
0000104c l       .debug_str	00000000 
00001056 l       .debug_str	00000000 
0000106d l       .debug_str	00000000 
00001073 l       .debug_str	00000000 
000010e3 l       .debug_str	00000000 
000010f0 l       .debug_str	00000000 
00001111 l       .debug_str	00000000 
00001117 l       .debug_str	00000000 
0000111b l       .debug_str	00000000 
0000111f l       .debug_str	00000000 
00001148 l       .debug_str	00000000 
0000114c l       .debug_str	00000000 
00001185 l       .debug_str	00000000 
0000118e l       .debug_str	00000000 
00001196 l       .debug_str	00000000 
000011d3 l       .debug_str	00000000 
000011dd l       .debug_str	00000000 
000011f9 l       .debug_str	00000000 
00001201 l       .debug_str	00000000 
00001203 l       .debug_str	00000000 
00001242 l       .debug_str	00000000 
00001256 l       .debug_str	00000000 
0000125a l       .debug_str	00000000 
00001267 l       .debug_str	00000000 
000012f1 l       .debug_str	00000000 
000012fd l       .debug_str	00000000 
000012ff l       .debug_str	00000000 
00001303 l       .debug_str	00000000 
00001342 l       .debug_str	00000000 
00001350 l       .debug_str	00000000 
000013db l       .debug_str	00000000 
0000140b l       .debug_str	00000000 
0000141d l       .debug_str	00000000 
0000145c l       .debug_str	00000000 
00001460 l       .debug_str	00000000 
00001475 l       .debug_str	00000000 
00001507 l       .debug_str	00000000 
00001509 l       .debug_str	00000000 
0000150d l       .debug_str	00000000 
0000154a l       .debug_str	00000000 
0000154e l       .debug_str	00000000 
00001559 l       .debug_str	00000000 
00001563 l       .debug_str	00000000 
00001568 l       .debug_str	00000000 
00001573 l       .debug_str	00000000 
000015b2 l       .debug_str	00000000 
000015c0 l       .debug_str	00000000 
0000164b l       .debug_str	00000000 
0000164f l       .debug_str	00000000 
0000168e l       .debug_str	00000000 
0000169e l       .debug_str	00000000 
0000172b l       .debug_str	00000000 
0000176a l       .debug_str	00000000 
0000177a l       .debug_str	00000000 
00001807 l       .debug_str	00000000 
00001846 l       .debug_str	00000000 
00001858 l       .debug_str	00000000 
000018e7 l       .debug_str	00000000 
00001926 l       .debug_str	00000000 
00001933 l       .debug_str	00000000 
000019bd l       .debug_str	00000000 
000019e6 l       .debug_str	00000000 
000019ea l       .debug_str	00000000 
00001a30 l       .debug_str	00000000 
00001a36 l       .debug_str	00000000 
00001a60 l       .debug_str	00000000 
00001a6f l       .debug_str	00000000 
00001a80 l       .debug_str	00000000 
00001ab9 l       .debug_str	00000000 
00001ac1 l       .debug_str	00000000 
00001ada l       .debug_str	00000000 
00001ae1 l       .debug_str	00000000 
00001b1f l       .debug_str	00000000 
00001b29 l       .debug_str	00000000 
00001b44 l       .debug_str	00000000 
00001b49 l       .debug_str	00000000 
00001b88 l       .debug_str	00000000 
00001b98 l       .debug_str	00000000 
00001c27 l       .debug_str	00000000 
00001c29 l       .debug_str	00000000 
00001c68 l       .debug_str	00000000 
00001c7a l       .debug_str	00000000 
00001d0b l       .debug_str	00000000 
00001d4a l       .debug_str	00000000 
00001d59 l       .debug_str	00000000 
00001de7 l       .debug_str	00000000 
00001e26 l       .debug_str	00000000 
00001e37 l       .debug_str	00000000 
00001ec7 l       .debug_str	00000000 
00001ecb l       .debug_str	00000000 
00001ecf l       .debug_str	00000000 
00001ed3 l       .debug_str	00000000 
00001ed7 l       .debug_str	00000000 
00001edb l       .debug_str	00000000 
00001ee0 l       .debug_str	00000000 
00001ee5 l       .debug_str	00000000 
00001ef1 l       .debug_str	00000000 
00001ef6 l       .debug_str	00000000 
00001efe l       .debug_str	00000000 
00001f65 l       .debug_str	00000000 
00001f68 l       .debug_str	00000000 
00001f8b l       .debug_str	00000000 
00001f91 l       .debug_str	00000000 
00001f9b l       .debug_str	00000000 
00001fa6 l       .debug_str	00000000 
00001fee l       .debug_str	00000000 
00001ff7 l       .debug_str	00000000 
0000203f l       .debug_str	00000000 
00002069 l       .debug_str	00000000 
000020b1 l       .debug_str	00000000 
000020b9 l       .debug_str	00000000 
000020ee l       .debug_str	00000000 
0000211b l       .debug_str	00000000 
0000211d l       .debug_str	00000000 
00002175 l       .debug_str	00000000 
000021cb l       .debug_str	00000000 
00002221 l       .debug_str	00000000 
00002240 l       .debug_str	00000000 
0000226f l       .debug_str	00000000 
00002279 l       .debug_str	00000000 
000022a8 l       .debug_str	00000000 
0000231f l       .debug_str	00000000 
00002333 l       .debug_str	00000000 
0000233e l       .debug_str	00000000 
000023aa l       .debug_str	00000000 
00002417 l       .debug_str	00000000 
0000248b l       .debug_str	00000000 
000024a0 l       .debug_str	00000000 
00002514 l       .debug_str	00000000 
00002583 l       .debug_str	00000000 
00002593 l       .debug_str	00000000 
000025fe l       .debug_str	00000000 
0000260a l       .debug_str	00000000 
0000264a l       .debug_str	00000000 
0000264d l       .debug_str	00000000 
0000268f l       .debug_str	00000000 
00002694 l       .debug_str	00000000 
000026c2 l       .debug_str	00000000 
0000272f l       .debug_str	00000000 
0000279e l       .debug_str	00000000 
0000280d l       .debug_str	00000000 
0000287e l       .debug_str	00000000 
000028ea l       .debug_str	00000000 
000028ec l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.0	00000018 .Lanon.140d0f48ceba58ab409392c70bb4580d.0
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.1	00000007 .Lanon.140d0f48ceba58ab409392c70bb4580d.1
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.10	00000009 .Lanon.140d0f48ceba58ab409392c70bb4580d.10
00000000 l     O .rodata.cst4	00000004 .Lanon.140d0f48ceba58ab409392c70bb4580d.11
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.12	00000010 .Lanon.140d0f48ceba58ab409392c70bb4580d.12
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.13	00000009 .Lanon.140d0f48ceba58ab409392c70bb4580d.13
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.14	00000010 .Lanon.140d0f48ceba58ab409392c70bb4580d.14
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.15	0000000a .Lanon.140d0f48ceba58ab409392c70bb4580d.15
00000008 l     O .rodata.cst8	00000008 .Lanon.140d0f48ceba58ab409392c70bb4580d.16
00000004 l     O .rodata.cst4	00000004 .Lanon.140d0f48ceba58ab409392c70bb4580d.17
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.18	00000007 .Lanon.140d0f48ceba58ab409392c70bb4580d.18
00000008 l     O .rodata.cst4	00000004 .Lanon.140d0f48ceba58ab409392c70bb4580d.19
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.2	00000006 .Lanon.140d0f48ceba58ab409392c70bb4580d.2
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.20	00000010 .Lanon.140d0f48ceba58ab409392c70bb4580d.20
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.21	0000000c .Lanon.140d0f48ceba58ab409392c70bb4580d.21
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.22	0000000a .Lanon.140d0f48ceba58ab409392c70bb4580d.22
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.23	00000003 .Lanon.140d0f48ceba58ab409392c70bb4580d.23
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.24	00000003 .Lanon.140d0f48ceba58ab409392c70bb4580d.24
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.25	00000009 .Lanon.140d0f48ceba58ab409392c70bb4580d.25
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.26	00000006 .Lanon.140d0f48ceba58ab409392c70bb4580d.26
00000010 l     O .rodata.cst8	00000008 .Lanon.140d0f48ceba58ab409392c70bb4580d.27
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.3	0000000c .Lanon.140d0f48ceba58ab409392c70bb4580d.3
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.4	00000006 .Lanon.140d0f48ceba58ab409392c70bb4580d.4
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.5	0000000a .Lanon.140d0f48ceba58ab409392c70bb4580d.5
00000000 l     O .rodata.cst8	00000008 .Lanon.140d0f48ceba58ab409392c70bb4580d.6
00000000 l     O .rodata.cst16	00000010 .Lanon.140d0f48ceba58ab409392c70bb4580d.7
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.8	00000009 .Lanon.140d0f48ceba58ab409392c70bb4580d.8
00000000 l     O .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.9	0000000e .Lanon.140d0f48ceba58ab409392c70bb4580d.9
00000000 l     O .rodata..Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h00c7a093c9c63b47E	0000001c .Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h00c7a093c9c63b47E
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h62fc6c6e8aac17fcE	0000003a <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9f2de2a72af09cc6E	00000006 <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca839ad35b02dd71E	0000003a <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17h06ade1b2fea2f8f8E	00000002 core::ptr::real_drop_in_place
00000000 l     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h9a348e3076f9729bE	0000010c <&mut W as core::fmt::Write>::write_char
00000000 l     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h12100dae57348505E	00000026 <&mut W as core::fmt::Write>::write_fmt
00000000 l     F .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hd2e314001924b83dE	00000106 <&mut W as core::fmt::Write>::write_str
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h62fc6c6e8aac17fcE	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h62fc6c6e8aac17fcE
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9f2de2a72af09cc6E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9f2de2a72af09cc6E
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca839ad35b02dd71E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca839ad35b02dd71E
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h06ade1b2fea2f8f8E	00000000 .text._ZN4core3ptr18real_drop_in_place17h06ade1b2fea2f8f8E
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h9a348e3076f9729bE	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h9a348e3076f9729bE
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h12100dae57348505E	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h12100dae57348505E
00000000 l    d  .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hd2e314001924b83dE	00000000 .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hd2e314001924b83dE
00000000 l    d  .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE	00000000 .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE
00000000 l    d  .text._ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E	00000000 .text._ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E
00000000 l    d  .text._ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E	00000000 .text._ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E
00000000 l    d  .text._ZN8cortex_m3itm9write_fmt17h4a4fd729f2c66829E	00000000 .text._ZN8cortex_m3itm9write_fmt17h4a4fd729f2c66829E
00000000 l    d  .text._ZN8cortex_m3itm9write_str17h8d8e10b4c67e43c3E	00000000 .text._ZN8cortex_m3itm9write_str17h8d8e10b4c67e43c3E
00000000 l    d  .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hd2c8f4872fa24111E	00000000 .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hd2c8f4872fa24111E
00000000 l    d  .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h7f385fb6ecf7b553E	00000000 .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h7f385fb6ecf7b553E
00000000 l    d  .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h9d180040a4a4dd30E	00000000 .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h9d180040a4a4dd30E
00000000 l    d  .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17ha27e1406b2ee98b9E	00000000 .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17ha27e1406b2ee98b9E
00000000 l    d  .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17h823c0cdb8fd92d53E	00000000 .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17h823c0cdb8fd92d53E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17ha33db9ec02bcf5d7E	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17ha33db9ec02bcf5d7E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h16061290493404a9E	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h16061290493404a9E
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim8write_u817hf5984d6404aaf636E	00000000 .text._ZN8cortex_m10peripheral3itm4Stim8write_u817hf5984d6404aaf636E
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617h53c21ff7f354a014E	00000000 .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617h53c21ff7f354a014E
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217h126976650e7975aaE	00000000 .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217h126976650e7975aaE
00000000 l    d  .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17hdbd890bb34216f11E	00000000 .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17hdbd890bb34216f11E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h109b59719ddbbca6E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h109b59719ddbbca6E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb9Exception4irqn17h4332944dc5fc4d4dE	00000000 .text._ZN8cortex_m10peripheral3scb9Exception4irqn17h4332944dc5fc4d4dE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb10VectActive4from17h239dc07ce3e3af2cE	00000000 .text._ZN8cortex_m10peripheral3scb10VectActive4from17h239dc07ce3e3af2cE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17ha5e8a57d669133feE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17ha5e8a57d669133feE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17haeaf3c4b463d2e9bE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17haeaf3c4b463d2e9bE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he4ee4906044a2eb9E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he4ee4906044a2eb9E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h11eb33d8595df8d0E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h11eb33d8595df8d0E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h442986c9e1b256f7E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h442986c9e1b256f7E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17head1e6a94d2cd79fE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17head1e6a94d2cd79fE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17h57c5694c386b70deE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17h57c5694c386b70deE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h5b46a3b5158c4e6dE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h5b46a3b5158c4e6dE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h87f5530121b472c5E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h87f5530121b472c5E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h00c7a093c9c63b47E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h00c7a093c9c63b47E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3b55d81d22aacfceE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3b55d81d22aacfceE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h07638ebc2d6e7388E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h07638ebc2d6e7388E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h083578f28bfd56a8E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h083578f28bfd56a8E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h025ea95e34767598E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h025ea95e34767598E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h5e71118e8d2fde3aE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h5e71118e8d2fde3aE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h576d368d43939080E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h576d368d43939080E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17hb54b375ce80e811fE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17hb54b375ce80e811fE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17h05c06a007858d85dE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17h05c06a007858d85dE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h333fe7dea2dde9a3E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h333fe7dea2dde9a3E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h4587b661ba004f43E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h4587b661ba004f43E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17hef57ab6262d167d3E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17hef57ab6262d167d3E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h12dd47db4b75d7cdE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h12dd47db4b75d7cdE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h8c697bbd39741eddE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h8c697bbd39741eddE
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17hdf6c267ff359ed39E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17hdf6c267ff359ed39E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17hc7bec0914fd76b22E	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17hc7bec0914fd76b22E
00000000 l    d  .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17h8e509ef18931a6ceE	00000000 .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17h8e509ef18931a6ceE
00000000 l    d  .text._ZN8cortex_m10peripheral11Peripherals5steal17hf8f26c82adefb6b6E	00000000 .text._ZN8cortex_m10peripheral11Peripherals5steal17hf8f26c82adefb6b6E
00000000 l    d  .text._ZN8cortex_m10peripheral3CBP3new17hf231e52218bcfb76E	00000000 .text._ZN8cortex_m10peripheral3CBP3new17hf231e52218bcfb76E
00000000 l    d  .text._ZN8cortex_m10peripheral3CBP3ptr17hf03eb2bbd0975c01E	00000000 .text._ZN8cortex_m10peripheral3CBP3ptr17hf03eb2bbd0975c01E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd03c2ca1e0c023b5E	00000000 .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd03c2ca1e0c023b5E
00000000 l    d  .text._ZN8cortex_m10peripheral5CPUID3ptr17ha27566c578b7be02E	00000000 .text._ZN8cortex_m10peripheral5CPUID3ptr17ha27566c578b7be02E
00000000 l    d  .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17hbec086371c1bb4ccE	00000000 .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17hbec086371c1bb4ccE
00000000 l    d  .text._ZN8cortex_m10peripheral3DCB3ptr17h1ad1321cd9b3358fE	00000000 .text._ZN8cortex_m10peripheral3DCB3ptr17h1ad1321cd9b3358fE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h55bde78de4329ed7E	00000000 .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h55bde78de4329ed7E
00000000 l    d  .text._ZN8cortex_m10peripheral3DWT3ptr17h43afe1d569358c54E	00000000 .text._ZN8cortex_m10peripheral3DWT3ptr17h43afe1d569358c54E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha8cad503d33939eeE	00000000 .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha8cad503d33939eeE
00000000 l    d  .text._ZN8cortex_m10peripheral3FPB3ptr17h671ce5b0bdda4077E	00000000 .text._ZN8cortex_m10peripheral3FPB3ptr17h671ce5b0bdda4077E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha9d4023ec4f9a8a5E	00000000 .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha9d4023ec4f9a8a5E
00000000 l    d  .text._ZN8cortex_m10peripheral3ITM3ptr17h0a2de636a7f65aadE	00000000 .text._ZN8cortex_m10peripheral3ITM3ptr17h0a2de636a7f65aadE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h031fda693d13bc5dE	00000000 .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h031fda693d13bc5dE
00000000 l    d  .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h9cbb5749fa25a00eE	00000000 .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h9cbb5749fa25a00eE
00000000 l    d  .text._ZN8cortex_m10peripheral3MPU3ptr17h12d778228a56fb49E	00000000 .text._ZN8cortex_m10peripheral3MPU3ptr17h12d778228a56fb49E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9a5f0f3cf0b6c4abE	00000000 .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9a5f0f3cf0b6c4abE
00000000 l    d  .text._ZN8cortex_m10peripheral4NVIC3ptr17hde76b9f317c18ee1E	00000000 .text._ZN8cortex_m10peripheral4NVIC3ptr17hde76b9f317c18ee1E
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he51759cc6e244771E	00000000 .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he51759cc6e244771E
00000000 l    d  .text._ZN8cortex_m10peripheral3SCB3ptr17h65ddcefb56d56f18E	00000000 .text._ZN8cortex_m10peripheral3SCB3ptr17h65ddcefb56d56f18E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha96740f0e126291aE	00000000 .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha96740f0e126291aE
00000000 l    d  .text._ZN8cortex_m10peripheral4SYST3ptr17hd9ee883576d923e3E	00000000 .text._ZN8cortex_m10peripheral4SYST3ptr17hd9ee883576d923e3E
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb77f44de12cdb2f2E	00000000 .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb77f44de12cdb2f2E
00000000 l    d  .text._ZN8cortex_m10peripheral4TPIU3ptr17h95803cdf51a2d107E	00000000 .text._ZN8cortex_m10peripheral4TPIU3ptr17h95803cdf51a2d107E
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h881fa450975a5772E	00000000 .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h881fa450975a5772E
00000000 l    d  .text._ZN8cortex_m8register7control7Control4bits17h18bc9932c0720048E	00000000 .text._ZN8cortex_m8register7control7Control4bits17h18bc9932c0720048E
00000000 l    d  .text._ZN8cortex_m8register7control7Control5npriv17h16ec04b89492bec0E	00000000 .text._ZN8cortex_m8register7control7Control5npriv17h16ec04b89492bec0E
00000000 l    d  .text._ZN8cortex_m8register7control7Control5spsel17h3deccecf735c6c04E	00000000 .text._ZN8cortex_m8register7control7Control5spsel17h3deccecf735c6c04E
00000000 l    d  .text._ZN8cortex_m8register7control7Control4fpca17h6f1ef6142bf128f5E	00000000 .text._ZN8cortex_m8register7control7Control4fpca17h6f1ef6142bf128f5E
00000000 l    d  .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E	00000000 .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E
00000000 l    d  .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E	00000000 .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E
00000000 l    d  .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17hedb88d624423cbf1E	00000000 .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17hedb88d624423cbf1E
00000000 l    d  .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h89b7c6284a21e754E	00000000 .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h89b7c6284a21e754E
00000000 l    d  .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17h49448ef5a705b979E	00000000 .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17h49448ef5a705b979E
00000000 l    d  .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bacbfbb734dd2c3E	00000000 .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bacbfbb734dd2c3E
00000000 l    d  .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hc7a50642d23399daE	00000000 .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hc7a50642d23399daE
00000000 l    d  .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17hafbcd44c4020124fE	00000000 .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17hafbcd44c4020124fE
00000000 l    d  .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h47199d686fdaa245E	00000000 .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h47199d686fdaa245E
00000000 l    d  .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17hdcd59b25a4810f41E	00000000 .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17hdcd59b25a4810f41E
00000000 l    d  .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hb3942e9de531228bE	00000000 .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hb3942e9de531228bE
00000000 l    d  .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.0	00000000 .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.0
00000000 l    d  .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.12	00000000 .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.12
00000000 l    d  .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.14	00000000 .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.14
00000000 l    d  .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.20	00000000 .rodata..Lanon.140d0f48ceba58ab409392c70bb4580d.20
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     O .bss.CORE_PERIPHERALS	00000001 CORE_PERIPHERALS
00000000         *UND*	00000000 core::fmt::num::imp::<impl core::fmt::Display for u8>::fmt
00000000         *UND*	00000000 core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::LowerHex for u8>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::UpperHex for u8>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::LowerHex for u32>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::UpperHex for u32>::fmt
00000000         *UND*	00000000 core::fmt::write
00000000         *UND*	00000000 core::fmt::builders::DebugTuple::field
00000000         *UND*	00000000 core::fmt::builders::DebugTuple::finish
00000000         *UND*	00000000 core::fmt::builders::DebugStruct::field
00000000         *UND*	00000000 core::fmt::builders::DebugStruct::finish
00000000         *UND*	00000000 core::fmt::Formatter::debug_tuple
00000000         *UND*	00000000 core::fmt::Formatter::debug_struct
00000000         *UND*	00000000 core::fmt::Formatter::debug_lower_hex
00000000         *UND*	00000000 core::fmt::Formatter::debug_upper_hex
00000000 g     F .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE	00000104 <cortex_m::itm::Port as core::fmt::Write>::write_str
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd03c2ca1e0c023b5E	0000000a <cortex_m::peripheral::CBP as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h55bde78de4329ed7E	0000000a <cortex_m::peripheral::DCB as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha8cad503d33939eeE	0000000a <cortex_m::peripheral::DWT as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha9d4023ec4f9a8a5E	0000000a <cortex_m::peripheral::FPB as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h031fda693d13bc5dE	00000006 <cortex_m::peripheral::ITM as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9a5f0f3cf0b6c4abE	0000000a <cortex_m::peripheral::MPU as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha96740f0e126291aE	0000000a <cortex_m::peripheral::SCB as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he51759cc6e244771E	0000000a <cortex_m::peripheral::NVIC as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb77f44de12cdb2f2E	0000000a <cortex_m::peripheral::SYST as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h881fa450975a5772E	00000008 <cortex_m::peripheral::TPIU as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17hdcd59b25a4810f41E	00000034 <cortex_m::register::control::Fpca as core::fmt::Debug>::fmt
00000000 g     F .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17hbec086371c1bb4ccE	0000000a <cortex_m::peripheral::CPUID as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17hafbcd44c4020124fE	00000034 <cortex_m::register::control::Npriv as core::fmt::Debug>::fmt
00000000 g     F .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h47199d686fdaa245E	00000030 <cortex_m::register::control::Spsel as core::fmt::Debug>::fmt
00000000 g     F .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h9cbb5749fa25a00eE	00000006 <cortex_m::peripheral::ITM as core::ops::deref::DerefMut>::deref_mut
00000000 g     F .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17hedb88d624423cbf1E	000000a4 <cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt
00000000 g     F .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hc7a50642d23399daE	00000040 <cortex_m::register::control::Control as core::fmt::Debug>::fmt
00000000 g     F .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hb3942e9de531228bE	00000034 <cortex_m::register::primask::Primask as core::fmt::Debug>::fmt
00000000 g     F .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h89b7c6284a21e754E	00000098 <cortex_m::peripheral::scb::VectActive as core::fmt::Debug>::fmt
00000000 g     F .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17h49448ef5a705b979E	00000086 <cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt
00000000 g     F .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hb3942e9de531228bE	00000034 <cortex_m::register::faultmask::Faultmask as core::fmt::Debug>::fmt
00000000 g     F .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bacbfbb734dd2c3E	00000034 <cortex_m::peripheral::syst::SystClkSource as core::fmt::Debug>::fmt
00000000 g     F .text._ZN8cortex_m10peripheral11Peripherals5steal17hf8f26c82adefb6b6E	0000000e cortex_m::peripheral::Peripherals::steal
00000000 g     F .text._ZN8cortex_m10peripheral3CBP3new17hf231e52218bcfb76E	00000002 cortex_m::peripheral::CBP::new
00000000 g     F .text._ZN8cortex_m10peripheral3CBP3ptr17hf03eb2bbd0975c01E	0000000a cortex_m::peripheral::CBP::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3DCB3ptr17h1ad1321cd9b3358fE	0000000a cortex_m::peripheral::DCB::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3DWT3ptr17h43afe1d569358c54E	0000000a cortex_m::peripheral::DWT::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3FPB3ptr17h671ce5b0bdda4077E	0000000a cortex_m::peripheral::FPB::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3ITM3ptr17h0a2de636a7f65aadE	00000006 cortex_m::peripheral::ITM::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3MPU3ptr17h12d778228a56fb49E	0000000a cortex_m::peripheral::MPU::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3SCB3ptr17h65ddcefb56d56f18E	0000000a cortex_m::peripheral::SCB::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h9d180040a4a4dd30E	00000012 cortex_m::peripheral::dcb::<impl cortex_m::peripheral::DCB>::enable_trace
00000000 g     F .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17ha27e1406b2ee98b9E	00000012 cortex_m::peripheral::dcb::<impl cortex_m::peripheral::DCB>::disable_trace
00000000 g     F .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17h823c0cdb8fd92d53E	00000010 cortex_m::peripheral::dcb::<impl cortex_m::peripheral::DCB>::is_debugger_attached
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h16061290493404a9E	0000000c cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::get_cycle_count
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17ha33db9ec02bcf5d7E	00000012 cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::enable_cycle_counter
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17hdbd890bb34216f11E	0000000c cortex_m::peripheral::itm::Stim::is_fifo_ready
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim8write_u817hf5984d6404aaf636E	00000004 cortex_m::peripheral::itm::Stim::write_u8
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617h53c21ff7f354a014E	00000004 cortex_m::peripheral::itm::Stim::write_u16
00000000 g     F .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217h126976650e7975aaE	00000004 cortex_m::peripheral::itm::Stim::write_u32
00000000 g     F .text._ZN8cortex_m10peripheral3scb10VectActive4from17h239dc07ce3e3af2cE	00000060 cortex_m::peripheral::scb::VectActive::from
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17head1e6a94d2cd79fE	00000010 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_pendsv
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h109b59719ddbbca6E	00000062 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::vect_active
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h5b46a3b5158c4e6dE	00000010 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_pendsv
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h87f5530121b472c5E	0000001a cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::get_priority
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h00c7a093c9c63b47E	0000001a cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_priority
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h442986c9e1b256f7E	00000026 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::system_reset
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17ha5e8a57d669133feE	00000012 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_sleepdeep
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17haeaf3c4b463d2e9bE	00000012 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_sleepdeep
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he4ee4906044a2eb9E	00000012 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_sleeponexit
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h11eb33d8595df8d0E	00000012 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_sleeponexit
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17h57c5694c386b70deE	00000010 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::is_pendsv_pending
00000000 g     F .text._ZN8cortex_m10peripheral3scb9Exception4irqn17h4332944dc5fc4d4dE	00000038 cortex_m::peripheral::scb::Exception::irqn
00000000 g     F .text._ZN8cortex_m10peripheral4NVIC3ptr17hde76b9f317c18ee1E	0000000a cortex_m::peripheral::NVIC::ptr
00000000 g     F .text._ZN8cortex_m10peripheral4SYST3ptr17hd9ee883576d923e3E	0000000a cortex_m::peripheral::SYST::ptr
00000000 g     F .text._ZN8cortex_m10peripheral4TPIU3ptr17h95803cdf51a2d107E	00000008 cortex_m::peripheral::TPIU::ptr
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17h05c06a007858d85dE	0000000c cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_reload
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17hdf6c267ff359ed39E	00000016 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::is_precise
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17h8e509ef18931a6ceE	0000000c cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::set_reload
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17hb54b375ce80e811fE	0000000c cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_current
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17hef57ab6262d167d3E	00000010 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::has_wrapped
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3b55d81d22aacfceE	0000000e cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::clear_current
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h025ea95e34767598E	00000012 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::enable_counter
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h07638ebc2d6e7388E	00000012 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::disable_counter
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h5e71118e8d2fde3aE	00000012 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::enable_interrupt
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h576d368d43939080E	00000016 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_clock_source
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17hc7bec0914fd76b22E	0000001a cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::set_clock_source
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h083578f28bfd56a8E	00000012 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::disable_interrupt
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h333fe7dea2dde9a3E	00000010 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_ticks_per_10ms
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h12dd47db4b75d7cdE	00000010 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::is_counter_enabled
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h4587b661ba004f43E	00000010 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::has_reference_clock
00000000 g     F .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h8c697bbd39741eddE	00000010 cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::is_interrupt_enabled
00000000 g     F .text._ZN8cortex_m10peripheral5CPUID3ptr17ha27566c578b7be02E	0000000a cortex_m::peripheral::CPUID::ptr
00000000 g     F .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hd2c8f4872fa24111E	00000010 cortex_m::peripheral::cpuid::<impl cortex_m::peripheral::CPUID>::select_cache
00000000 g     F .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h7f385fb6ecf7b553E	00000024 cortex_m::peripheral::cpuid::<impl cortex_m::peripheral::CPUID>::cache_num_sets_ways
00000000 g     F .text._ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E	00000096 cortex_m::itm::write_aligned
00000000 g     F .text._ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E	00000102 cortex_m::itm::write_all
00000000 g     F .text._ZN8cortex_m3itm9write_fmt17h4a4fd729f2c66829E	00000028 cortex_m::itm::write_fmt
00000000 g     F .text._ZN8cortex_m3itm9write_str17h8d8e10b4c67e43c3E	00000102 cortex_m::itm::write_str
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E	0000000c cortex_m::register::control::Fpca::is_not_active
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E	0000000a cortex_m::register::control::Fpca::is_active
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E	0000000a cortex_m::register::control::Npriv::is_privileged
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E	0000000c cortex_m::register::control::Npriv::is_unprivileged
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E	0000000a cortex_m::register::control::Spsel::is_msp
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E	0000000c cortex_m::register::control::Spsel::is_psp
00000000 g     F .text._ZN8cortex_m8register7control7Control4bits17h18bc9932c0720048E	00000004 cortex_m::register::control::Control::bits
00000000 g     F .text._ZN8cortex_m8register7control7Control4fpca17h6f1ef6142bf128f5E	0000000e cortex_m::register::control::Control::fpca
00000000 g     F .text._ZN8cortex_m8register7control7Control5npriv17h16ec04b89492bec0E	00000008 cortex_m::register::control::Control::npriv
00000000 g     F .text._ZN8cortex_m8register7control7Control5spsel17h3deccecf735c6c04E	00000008 cortex_m::register::control::Control::spsel
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E	0000000c cortex_m::register::primask::Primask::is_inactive
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E	0000000a cortex_m::register::primask::Primask::is_active
00000000 g     F .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E	0000000c cortex_m::register::faultmask::Faultmask::is_inactive
00000000 g     F .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E	0000000a cortex_m::register::faultmask::Faultmask::is_active
00000000         *UND*	00000000 __dsb
00000000         *UND*	00000000 __nop



Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h62fc6c6e8aac17fcE:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h62fc6c6e8aac17fcE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u32$GT$3fmt17hc183193e86b0db88E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_lower_hex>
   c:	b128      	cbz	r0, 1a <<&T as core::fmt::Debug>::fmt+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::LowerHex for u32>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_upper_hex>
  20:	b128      	cbz	r0, 2e <<&T as core::fmt::Debug>::fmt+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::UpperHex for u32>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <core::fmt::num::imp::<impl core::fmt::Display for u32>::fmt>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9f2de2a72af09cc6E:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9f2de2a72af09cc6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	6800      	ldr	r0, [r0, #0]
   2:	f7ff bffe 	b.w	0 <<&T as core::fmt::Debug>::fmt>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca839ad35b02dd71E:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hca839ad35b02dd71E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num49_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u8$GT$3fmt17h271d1c938b44f4eaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_lower_hex>
   c:	b128      	cbz	r0, 1a <<&T as core::fmt::Debug>::fmt+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::LowerHex for u8>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_upper_hex>
  20:	b128      	cbz	r0, 2e <<&T as core::fmt::Debug>::fmt+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::UpperHex for u8>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <core::fmt::num::imp::<impl core::fmt::Display for u8>::fmt>

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h06ade1b2fea2f8f8E:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h06ade1b2fea2f8f8E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:195
   0:	4770      	bx	lr

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h9a348e3076f9729bE:

00000000 <<&mut W as core::fmt::Write>::write_char>:
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h9a348e3076f9729bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:205
   0:	b081      	sub	sp, #4
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:206
   2:	6802      	ldr	r2, [r0, #0]
   4:	2000      	movs	r0, #0
_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817hc04470e71cfe4e80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:440
   6:	2980      	cmp	r1, #128	; 0x80
_ZN4core3fmt5Write10write_char17h25433175e53bb667E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:170
   8:	9000      	str	r0, [sp, #0]
_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817hc04470e71cfe4e80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:440
   a:	d20a      	bcs.n	22 <<&mut W as core::fmt::Write>::write_char+0x22>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:441
   c:	f88d 1000 	strb.w	r1, [sp]
  10:	4608      	mov	r0, r1
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:25

struct Port<'p>(&'p mut Stim);

impl<'p> fmt::Write for Port<'p> {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        write_all(self.0, s.as_bytes());
  12:	6812      	ldr	r2, [r2, #0]
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            left -= 2;
        }

        // final byte
        if left == 1 {
            while !port.is_fifo_ready() {}
  16:	2901      	cmp	r1, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  18:	bf1c      	itt	ne
  1a:	6811      	ldrne	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  1c:	2901      	cmpne	r1, #1
  1e:	d144      	bne.n	aa <<&mut W as core::fmt::Write>::write_char+0xaa>
  20:	e049      	b.n	b6 <<&mut W as core::fmt::Write>::write_char+0xb6>
_ZN4core4char7methods22_$LT$impl$u20$char$GT$11encode_utf817hc04470e71cfe4e80E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:443
  22:	ebb0 2fd1 	cmp.w	r0, r1, lsr #11
  26:	d10d      	bne.n	44 <<&mut W as core::fmt::Write>::write_char+0x44>
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
  42:	e01a      	b.n	7a <<&mut W as core::fmt::Write>::write_char+0x7a>
  44:	2000      	movs	r0, #0
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/char/methods.rs:447
  46:	ebb0 4f11 	cmp.w	r0, r1, lsr #16
  4a:	d138      	bne.n	be <<&mut W as core::fmt::Write>::write_char+0xbe>
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
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:25
        write_all(self.0, s.as_bytes());
  7a:	6812      	ldr	r2, [r2, #0]
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7c:	6813      	ldr	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  7e:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  80:	bf1c      	itt	ne
  82:	6813      	ldrne	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  84:	2b01      	cmpne	r3, #1
  86:	d005      	beq.n	94 <<&mut W as core::fmt::Write>::write_char+0x94>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  88:	6813      	ldr	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  8a:	2b01      	cmp	r3, #1
  8c:	d002      	beq.n	94 <<&mut W as core::fmt::Write>::write_char+0x94>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  8e:	6813      	ldr	r3, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  90:	2b01      	cmp	r3, #1
  92:	d1f3      	bne.n	7c <<&mut W as core::fmt::Write>::write_char+0x7c>
  94:	f8bd 3000 	ldrh.w	r3, [sp]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  98:	2900      	cmp	r1, #0
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  9a:	8013      	strh	r3, [r2, #0]
  9c:	d00c      	beq.n	b8 <<&mut W as core::fmt::Write>::write_char+0xb8>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  9e:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  a0:	2901      	cmp	r1, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a2:	bf1c      	itt	ne
  a4:	6811      	ldrne	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  a6:	2901      	cmpne	r1, #1
  a8:	d005      	beq.n	b6 <<&mut W as core::fmt::Write>::write_char+0xb6>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  aa:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ac:	2901      	cmp	r1, #1
  ae:	d002      	beq.n	b6 <<&mut W as core::fmt::Write>::write_char+0xb6>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b0:	6811      	ldr	r1, [r2, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  b2:	2901      	cmp	r1, #1
  b4:	d1f3      	bne.n	9e <<&mut W as core::fmt::Write>::write_char+0x9e>
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  b6:	7010      	strb	r0, [r2, #0]
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h9a348e3076f9729bE():
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
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:25
        write_all(self.0, s.as_bytes());
  e8:	6810      	ldr	r0, [r2, #0]
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ea:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  ec:	2901      	cmp	r1, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ee:	bf1c      	itt	ne
  f0:	6801      	ldrne	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  f2:	2901      	cmpne	r1, #1
  f4:	d005      	beq.n	102 <<&mut W as core::fmt::Write>::write_char+0x102>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  f8:	2901      	cmp	r1, #1
  fa:	d002      	beq.n	102 <<&mut W as core::fmt::Write>::write_char+0x102>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  fc:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  fe:	2901      	cmp	r1, #1
 100:	d1f3      	bne.n	ea <<&mut W as core::fmt::Write>::write_char+0xea>
 102:	9900      	ldr	r1, [sp, #0]
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
 104:	6001      	str	r1, [r0, #0]
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h9a348e3076f9729bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:207
 106:	2000      	movs	r0, #0
 108:	b001      	add	sp, #4
 10a:	4770      	bx	lr

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h12100dae57348505E:

00000000 <<&mut W as core::fmt::Write>::write_fmt>:
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h12100dae57348505E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:209
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b088      	sub	sp, #32
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:210
   4:	6800      	ldr	r0, [r0, #0]
   6:	aa02      	add	r2, sp, #8
   8:	9001      	str	r0, [sp, #4]
_ZN4core3fmt5Write9write_fmt17h530049205d81a56bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:195
   a:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
   e:	4610      	mov	r0, r2
  10:	f240 0100 	movw	r1, #0
  14:	f2c0 0100 	movt	r1, #0
  18:	e880 5078 	stmia.w	r0, {r3, r4, r5, r6, ip, lr}
  1c:	a801      	add	r0, sp, #4
  1e:	f7ff fffe 	bl	0 <core::fmt::write>
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h12100dae57348505E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:211
  22:	b008      	add	sp, #32
  24:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hd2e314001924b83dE:

00000000 <<&mut W as core::fmt::Write>::write_str>:
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07e      	beq.n	102 <<&mut W as core::fmt::Write>::write_str+0x102>
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hd2e314001924b83dE():
   4:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   6:	07cb      	lsls	r3, r1, #31
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE():
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
   a:	d00f      	beq.n	2c <<&mut W as core::fmt::Write>::write_str+0x2c>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   c:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   e:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  10:	bf1c      	itt	ne
  12:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  14:	2b01      	cmpne	r3, #1
  16:	d005      	beq.n	24 <<&mut W as core::fmt::Write>::write_str+0x24>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  18:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1a:	2b01      	cmp	r3, #1
  1c:	d002      	beq.n	24 <<&mut W as core::fmt::Write>::write_str+0x24>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1e:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  20:	2b01      	cmp	r3, #1
  22:	d1f3      	bne.n	c <<&mut W as core::fmt::Write>::write_str+0xc>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  24:	f811 3b01 	ldrb.w	r3, [r1], #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  28:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  2a:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  2c:	f001 0303 	and.w	r3, r1, #3
  30:	2b02      	cmp	r3, #2
  32:	d111      	bne.n	58 <<&mut W as core::fmt::Write>::write_str+0x58>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  34:	2a02      	cmp	r2, #2
  36:	d354      	bcc.n	e2 <<&mut W as core::fmt::Write>::write_str+0xe2>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  38:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  3a:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  3c:	bf1c      	itt	ne
  3e:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  40:	2b01      	cmpne	r3, #1
  42:	d005      	beq.n	50 <<&mut W as core::fmt::Write>::write_str+0x50>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  44:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  46:	2b01      	cmp	r3, #1
  48:	d002      	beq.n	50 <<&mut W as core::fmt::Write>::write_str+0x50>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  4a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  4c:	2b01      	cmp	r3, #1
  4e:	d1f3      	bne.n	38 <<&mut W as core::fmt::Write>::write_str+0x38>
  50:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  54:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  56:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  58:	2a00      	cmp	r2, #0
  5a:	d052      	beq.n	102 <<&mut W as core::fmt::Write>::write_str+0x102>
  5c:	b5b0      	push	{r4, r5, r7, lr}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5e:	f022 0c03 	bic.w	ip, r2, #3
  62:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  64:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  68:	d015      	beq.n	96 <<&mut W as core::fmt::Write>::write_str+0x96>
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
  6a:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6e:	2300      	movs	r3, #0
  70:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  72:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  74:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  76:	bf1c      	itt	ne
  78:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7a:	2d01      	cmpne	r5, #1
  7c:	d005      	beq.n	8a <<&mut W as core::fmt::Write>::write_str+0x8a>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  80:	2d01      	cmp	r5, #1
  82:	d002      	beq.n	8a <<&mut W as core::fmt::Write>::write_str+0x8a>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  84:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  86:	2d01      	cmp	r5, #1
  88:	d1f3      	bne.n	72 <<&mut W as core::fmt::Write>::write_str+0x72>
  8a:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8e:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  90:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  92:	6005      	str	r5, [r0, #0]
  94:	d1ed      	bne.n	72 <<&mut W as core::fmt::Write>::write_str+0x72>
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  96:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17heeb408278a2315f2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  9a:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  9c:	2a02      	cmp	r2, #2
  9e:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  a2:	d30f      	bcc.n	c4 <<&mut W as core::fmt::Write>::write_str+0xc4>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a4:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a6:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a8:	bf1c      	itt	ne
  aa:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  ac:	2b01      	cmpne	r3, #1
  ae:	d005      	beq.n	bc <<&mut W as core::fmt::Write>::write_str+0xbc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b0:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b2:	2b01      	cmp	r3, #1
  b4:	d002      	beq.n	bc <<&mut W as core::fmt::Write>::write_str+0xbc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b6:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b8:	2b01      	cmp	r3, #1
  ba:	d1f3      	bne.n	a4 <<&mut W as core::fmt::Write>::write_str+0xa4>
  bc:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  c0:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  c2:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c4:	2a01      	cmp	r2, #1
  c6:	d11c      	bne.n	102 <<&mut W as core::fmt::Write>::write_str+0x102>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  ca:	2a01      	cmp	r2, #1
  cc:	d017      	beq.n	fe <<&mut W as core::fmt::Write>::write_str+0xfe>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ce:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d0:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d2:	bf1c      	itt	ne
  d4:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d6:	2a01      	cmpne	r2, #1
  d8:	d011      	beq.n	fe <<&mut W as core::fmt::Write>::write_str+0xfe>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  da:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  dc:	2a01      	cmp	r2, #1
  de:	d1f3      	bne.n	c8 <<&mut W as core::fmt::Write>::write_str+0xc8>
  e0:	e00d      	b.n	fe <<&mut W as core::fmt::Write>::write_str+0xfe>
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e2:	2a01      	cmp	r2, #1
  e4:	d10d      	bne.n	102 <<&mut W as core::fmt::Write>::write_str+0x102>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e8:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ea:	bf1c      	itt	ne
  ec:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ee:	2a01      	cmpne	r2, #1
  f0:	d005      	beq.n	fe <<&mut W as core::fmt::Write>::write_str+0xfe>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f2:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f4:	2a01      	cmp	r2, #1
  f6:	d002      	beq.n	fe <<&mut W as core::fmt::Write>::write_str+0xfe>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  fa:	2a01      	cmp	r2, #1
  fc:	d1f3      	bne.n	e6 <<&mut W as core::fmt::Write>::write_str+0xe6>
  fe:	7809      	ldrb	r1, [r1, #0]
 100:	7001      	strb	r1, [r0, #0]
_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hd2e314001924b83dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:203
 102:	2000      	movs	r0, #0
 104:	4770      	bx	lr

Disassembly of section .text._ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE:

00000000 <<cortex_m::itm::Port as core::fmt::Write>::write_str>:
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07d      	beq.n	100 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x100>
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE():
   4:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   6:	07cb      	lsls	r3, r1, #31
   8:	d00f      	beq.n	2a <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x2a>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   c:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   e:	bf1c      	itt	ne
  10:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  12:	2b01      	cmpne	r3, #1
  14:	d005      	beq.n	22 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x22>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  16:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  18:	2b01      	cmp	r3, #1
  1a:	d002      	beq.n	22 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x22>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1c:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1e:	2b01      	cmp	r3, #1
  20:	d1f3      	bne.n	a <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xa>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  22:	f811 3b01 	ldrb.w	r3, [r1], #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  26:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  28:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  2a:	f001 0303 	and.w	r3, r1, #3
  2e:	2b02      	cmp	r3, #2
  30:	d111      	bne.n	56 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x56>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  32:	2a02      	cmp	r2, #2
  34:	d354      	bcc.n	e0 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xe0>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  36:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  38:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  3a:	bf1c      	itt	ne
  3c:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  3e:	2b01      	cmpne	r3, #1
  40:	d005      	beq.n	4e <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x4e>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  42:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  44:	2b01      	cmp	r3, #1
  46:	d002      	beq.n	4e <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x4e>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  48:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  4a:	2b01      	cmp	r3, #1
  4c:	d1f3      	bne.n	36 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x36>
  4e:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  52:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  54:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  56:	2a00      	cmp	r2, #0
  58:	d052      	beq.n	100 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x100>
  5a:	b5b0      	push	{r4, r5, r7, lr}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5c:	f022 0c03 	bic.w	ip, r2, #3
  60:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  62:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  66:	d015      	beq.n	94 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x94>
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
  68:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6c:	2300      	movs	r3, #0
  6e:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  70:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  72:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  74:	bf1c      	itt	ne
  76:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  78:	2d01      	cmpne	r5, #1
  7a:	d005      	beq.n	88 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x88>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7c:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7e:	2d01      	cmp	r5, #1
  80:	d002      	beq.n	88 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x88>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  82:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  84:	2d01      	cmp	r5, #1
  86:	d1f3      	bne.n	70 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x70>
  88:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8c:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  8e:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  90:	6005      	str	r5, [r0, #0]
  92:	d1ed      	bne.n	70 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x70>
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  94:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17heeb408278a2315f2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  98:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  9a:	2a02      	cmp	r2, #2
  9c:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  a0:	d30f      	bcc.n	c2 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xc2>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a2:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a4:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a6:	bf1c      	itt	ne
  a8:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  aa:	2b01      	cmpne	r3, #1
  ac:	d005      	beq.n	ba <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xba>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ae:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b0:	2b01      	cmp	r3, #1
  b2:	d002      	beq.n	ba <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xba>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b4:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b6:	2b01      	cmp	r3, #1
  b8:	d1f3      	bne.n	a2 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xa2>
  ba:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  be:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  c0:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c2:	2a01      	cmp	r2, #1
  c4:	d11c      	bne.n	100 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x100>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  c8:	2a01      	cmp	r2, #1
  ca:	d017      	beq.n	fc <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  cc:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ce:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d0:	bf1c      	itt	ne
  d2:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d4:	2a01      	cmpne	r2, #1
  d6:	d011      	beq.n	fc <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  da:	2a01      	cmp	r2, #1
  dc:	d1f3      	bne.n	c6 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xc6>
  de:	e00d      	b.n	fc <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xfc>
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e0:	2a01      	cmp	r2, #1
  e2:	d10d      	bne.n	100 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0x100>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e4:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e6:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e8:	bf1c      	itt	ne
  ea:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ec:	2a01      	cmpne	r2, #1
  ee:	d005      	beq.n	fc <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f0:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f2:	2a01      	cmp	r2, #1
  f4:	d002      	beq.n	fc <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f8:	2a01      	cmp	r2, #1
  fa:	d1f3      	bne.n	e4 <<cortex_m::itm::Port as core::fmt::Write>::write_str+0xe4>
  fc:	7809      	ldrb	r1, [r1, #0]
  fe:	7001      	strb	r1, [r0, #0]
_ZN56_$LT$cortex_m..itm..Port$u20$as$u20$core..fmt..Write$GT$9write_str17h0b3c3d462ec4cc2cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:27
    }
 100:	2000      	movs	r0, #0
 102:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E:

00000000 <cortex_m::itm::write_all>:
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07d      	beq.n	100 <cortex_m::itm::write_all+0x100>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   4:	07cb      	lsls	r3, r1, #31
   6:	d00f      	beq.n	28 <cortex_m::itm::write_all+0x28>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   a:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   c:	bf1c      	itt	ne
   e:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  10:	2b01      	cmpne	r3, #1
  12:	d005      	beq.n	20 <cortex_m::itm::write_all+0x20>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  16:	2b01      	cmp	r3, #1
  18:	d002      	beq.n	20 <cortex_m::itm::write_all+0x20>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1c:	2b01      	cmp	r3, #1
  1e:	d1f3      	bne.n	8 <cortex_m::itm::write_all+0x8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  20:	f811 3b01 	ldrb.w	r3, [r1], #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  24:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  26:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  28:	f001 0303 	and.w	r3, r1, #3
  2c:	2b02      	cmp	r3, #2
  2e:	d111      	bne.n	54 <cortex_m::itm::write_all+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  30:	2a02      	cmp	r2, #2
  32:	d355      	bcc.n	e0 <cortex_m::itm::write_all+0xe0>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  34:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  36:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  38:	bf1c      	itt	ne
  3a:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  3c:	2b01      	cmpne	r3, #1
  3e:	d005      	beq.n	4c <cortex_m::itm::write_all+0x4c>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  40:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  42:	2b01      	cmp	r3, #1
  44:	d002      	beq.n	4c <cortex_m::itm::write_all+0x4c>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  46:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  48:	2b01      	cmp	r3, #1
  4a:	d1f3      	bne.n	34 <cortex_m::itm::write_all+0x34>
  4c:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  50:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  52:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  54:	2a00      	cmp	r2, #0
  56:	d053      	beq.n	100 <cortex_m::itm::write_all+0x100>
  58:	b5b0      	push	{r4, r5, r7, lr}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5a:	f022 0c03 	bic.w	ip, r2, #3
  5e:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  60:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  64:	d015      	beq.n	92 <cortex_m::itm::write_all+0x92>
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
  66:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6a:	2300      	movs	r3, #0
  6c:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  6e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  70:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  72:	bf1c      	itt	ne
  74:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  76:	2d01      	cmpne	r5, #1
  78:	d005      	beq.n	86 <cortex_m::itm::write_all+0x86>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7a:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7c:	2d01      	cmp	r5, #1
  7e:	d002      	beq.n	86 <cortex_m::itm::write_all+0x86>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  80:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  82:	2d01      	cmp	r5, #1
  84:	d1f3      	bne.n	6e <cortex_m::itm::write_all+0x6e>
  86:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8a:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  8c:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  8e:	6005      	str	r5, [r0, #0]
  90:	d1ed      	bne.n	6e <cortex_m::itm::write_all+0x6e>
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  92:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17heeb408278a2315f2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  96:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  98:	2a02      	cmp	r2, #2
  9a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  9e:	d30f      	bcc.n	c0 <cortex_m::itm::write_all+0xc0>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a0:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a2:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a4:	bf1c      	itt	ne
  a6:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  a8:	2b01      	cmpne	r3, #1
  aa:	d005      	beq.n	b8 <cortex_m::itm::write_all+0xb8>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ac:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  ae:	2b01      	cmp	r3, #1
  b0:	d002      	beq.n	b8 <cortex_m::itm::write_all+0xb8>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b2:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b4:	2b01      	cmp	r3, #1
  b6:	d1f3      	bne.n	a0 <cortex_m::itm::write_all+0xa0>
  b8:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  bc:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  be:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c0:	2a01      	cmp	r2, #1
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:73
}
  c2:	bf18      	it	ne
  c4:	4770      	bxne	lr
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  c8:	2a01      	cmp	r2, #1
  ca:	d017      	beq.n	fc <cortex_m::itm::write_all+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  cc:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ce:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d0:	bf1c      	itt	ne
  d2:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d4:	2a01      	cmpne	r2, #1
  d6:	d011      	beq.n	fc <cortex_m::itm::write_all+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  da:	2a01      	cmp	r2, #1
  dc:	d1f3      	bne.n	c6 <cortex_m::itm::write_all+0xc6>
  de:	e00d      	b.n	fc <cortex_m::itm::write_all+0xfc>
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e0:	2a01      	cmp	r2, #1
  e2:	d10d      	bne.n	100 <cortex_m::itm::write_all+0x100>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e4:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e6:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e8:	bf1c      	itt	ne
  ea:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ec:	2a01      	cmpne	r2, #1
  ee:	d005      	beq.n	fc <cortex_m::itm::write_all+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f0:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f2:	2a01      	cmp	r2, #1
  f4:	d002      	beq.n	fc <cortex_m::itm::write_all+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f8:	2a01      	cmp	r2, #1
  fa:	d1f3      	bne.n	e4 <cortex_m::itm::write_all+0xe4>
  fc:	7809      	ldrb	r1, [r1, #0]
  fe:	7001      	strb	r1, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:73
}
 100:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E:

00000000 <cortex_m::itm::write_aligned>:
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
   0:	2a00      	cmp	r2, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:122
            port.write_u8(*ptr);
        }
    }
}
   2:	bf08      	it	eq
   4:	4770      	bxeq	lr
   6:	b5b0      	push	{r4, r5, r7, lr}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
   8:	f022 0c03 	bic.w	ip, r2, #3
   c:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
   e:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  12:	d015      	beq.n	40 <cortex_m::itm::write_aligned+0x40>
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
  14:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  18:	2300      	movs	r3, #0
  1a:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1c:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  1e:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  20:	bf1c      	itt	ne
  22:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  24:	2d01      	cmpne	r5, #1
  26:	d005      	beq.n	34 <cortex_m::itm::write_aligned+0x34>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  28:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  2a:	2d01      	cmp	r5, #1
  2c:	d002      	beq.n	34 <cortex_m::itm::write_aligned+0x34>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  2e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  30:	2d01      	cmp	r5, #1
  32:	d1f3      	bne.n	1c <cortex_m::itm::write_aligned+0x1c>
  34:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  38:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  3a:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  3c:	6005      	str	r5, [r0, #0]
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  3e:	d1ed      	bne.n	1c <cortex_m::itm::write_aligned+0x1c>
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  40:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17heeb408278a2315f2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  44:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  46:	2a02      	cmp	r2, #2
  48:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  4c:	d202      	bcs.n	54 <cortex_m::itm::write_aligned+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  4e:	2a01      	cmp	r2, #1
  50:	d012      	beq.n	78 <cortex_m::itm::write_aligned+0x78>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:122
}
  52:	4770      	bx	lr
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  54:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  56:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  58:	bf1c      	itt	ne
  5a:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  5c:	2b01      	cmpne	r3, #1
  5e:	d005      	beq.n	6c <cortex_m::itm::write_aligned+0x6c>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  60:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  62:	2b01      	cmp	r3, #1
  64:	d002      	beq.n	6c <cortex_m::itm::write_aligned+0x6c>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  66:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  68:	2b01      	cmp	r3, #1
  6a:	d1f3      	bne.n	54 <cortex_m::itm::write_aligned+0x54>
  6c:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  70:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  72:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  74:	2a01      	cmp	r2, #1
  76:	d1ec      	bne.n	52 <cortex_m::itm::write_aligned+0x52>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  78:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  7a:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7c:	bf1c      	itt	ne
  7e:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  80:	2a01      	cmpne	r2, #1
  82:	d005      	beq.n	90 <cortex_m::itm::write_aligned+0x90>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  84:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  86:	2a01      	cmp	r2, #1
  88:	d002      	beq.n	90 <cortex_m::itm::write_aligned+0x90>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  8a:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  8c:	2a01      	cmp	r2, #1
  8e:	d1f3      	bne.n	78 <cortex_m::itm::write_aligned+0x78>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:119
            port.write_u8(*ptr);
  90:	7809      	ldrb	r1, [r1, #0]
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  92:	7001      	strb	r1, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:122
}
  94:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m3itm9write_fmt17h4a4fd729f2c66829E:

00000000 <cortex_m::itm::write_fmt>:
_ZN8cortex_m3itm9write_fmt17h4a4fd729f2c66829E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:125

/// Writes `fmt::Arguments` to the ITM `port`
pub fn write_fmt(port: &mut Stim, args: fmt::Arguments) {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	b088      	sub	sp, #32
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:128
    use core::fmt::Write;

    Port(port).write_fmt(args).ok();
   4:	9000      	str	r0, [sp, #0]
   6:	4668      	mov	r0, sp
   8:	9001      	str	r0, [sp, #4]
   a:	aa02      	add	r2, sp, #8
_ZN4core3fmt5Write9write_fmt17h530049205d81a56bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:195
   c:	e891 5078 	ldmia.w	r1, {r3, r4, r5, r6, ip, lr}
  10:	f240 0100 	movw	r1, #0
  14:	4610      	mov	r0, r2
  16:	f2c0 0100 	movt	r1, #0
  1a:	e880 5078 	stmia.w	r0, {r3, r4, r5, r6, ip, lr}
  1e:	a801      	add	r0, sp, #4
  20:	f7ff fffe 	bl	0 <core::fmt::write>
_ZN8cortex_m3itm9write_fmt17h4a4fd729f2c66829E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:129
}
  24:	b008      	add	sp, #32
  26:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN8cortex_m3itm9write_str17h8d8e10b4c67e43c3E:

00000000 <cortex_m::itm::write_str>:
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:36
        if len == 0 {
   0:	2a00      	cmp	r2, #0
   2:	d07d      	beq.n	100 <cortex_m::itm::write_str+0x100>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:41
        if ptr as usize % 2 == 1 {
   4:	07cb      	lsls	r3, r1, #31
   6:	d00f      	beq.n	28 <cortex_m::itm::write_str+0x28>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
            while !port.is_fifo_ready() {}
   a:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   c:	bf1c      	itt	ne
   e:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  10:	2b01      	cmpne	r3, #1
  12:	d005      	beq.n	20 <cortex_m::itm::write_str+0x20>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  16:	2b01      	cmp	r3, #1
  18:	d002      	beq.n	20 <cortex_m::itm::write_str+0x20>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  1a:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:42
  1c:	2b01      	cmp	r3, #1
  1e:	d1f3      	bne.n	8 <cortex_m::itm::write_str+0x8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:43
            port.write_u8(*ptr);
  20:	f811 3b01 	ldrb.w	r3, [r1], #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:47
            len -= 1;
  24:	3a01      	subs	r2, #1
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  26:	7003      	strb	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:51
        if ptr as usize % 4 == 2 {
  28:	f001 0303 	and.w	r3, r1, #3
  2c:	2b02      	cmp	r3, #2
  2e:	d111      	bne.n	54 <cortex_m::itm::write_str+0x54>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:52
            if len > 1 {
  30:	2a02      	cmp	r2, #2
  32:	d355      	bcc.n	e0 <cortex_m::itm::write_str+0xe0>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  34:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
                while !port.is_fifo_ready() {}
  36:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  38:	bf1c      	itt	ne
  3a:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  3c:	2b01      	cmpne	r3, #1
  3e:	d005      	beq.n	4c <cortex_m::itm::write_str+0x4c>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  40:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  42:	2b01      	cmp	r3, #1
  44:	d002      	beq.n	4c <cortex_m::itm::write_str+0x4c>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  46:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:54
  48:	2b01      	cmp	r3, #1
  4a:	d1f3      	bne.n	34 <cortex_m::itm::write_str+0x34>
  4c:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:59
                len -= 2;
  50:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  52:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:93
        if len == 0 {
  54:	2a00      	cmp	r2, #0
  56:	d053      	beq.n	100 <cortex_m::itm::write_str+0x100>
  58:	b5b0      	push	{r4, r5, r7, lr}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:97
        let split = len & !0b11;
  5a:	f022 0c03 	bic.w	ip, r2, #3
  5e:	2300      	movs	r3, #0
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  60:	ebb3 0f92 	cmp.w	r3, r2, lsr #2
  64:	d015      	beq.n	92 <cortex_m::itm::write_str+0x92>
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
  66:	ea4f 0e92 	mov.w	lr, r2, lsr #2
  6a:	2300      	movs	r3, #0
  6c:	460c      	mov	r4, r1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  6e:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
        while !stim.is_fifo_ready() {}
  70:	2d01      	cmp	r5, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  72:	bf1c      	itt	ne
  74:	6805      	ldrne	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  76:	2d01      	cmpne	r5, #1
  78:	d005      	beq.n	86 <cortex_m::itm::write_str+0x86>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  7a:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  7c:	2d01      	cmp	r5, #1
  7e:	d002      	beq.n	86 <cortex_m::itm::write_str+0x86>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  80:	6805      	ldr	r5, [r0, #0]
_ZN8cortex_m3itm11write_words17hea111f1efa6fb541E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:15
  82:	2d01      	cmp	r5, #1
  84:	d1f3      	bne.n	6e <cortex_m::itm::write_str+0x6e>
  86:	f854 5b04 	ldr.w	r5, [r4], #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
  8a:	3301      	adds	r3, #1
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17h08524424f0191e33E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  8c:	4573      	cmp	r3, lr
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  8e:	6005      	str	r5, [r0, #0]
  90:	d1ed      	bne.n	6e <cortex_m::itm::write_str+0x6e>
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:104
        let mut left = len & 0b11;
  92:	f002 0203 	and.w	r2, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17heeb408278a2315f2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  96:	4461      	add	r1, ip
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:108
        if left > 1 {
  98:	2a02      	cmp	r2, #2
  9a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  9e:	d30f      	bcc.n	c0 <cortex_m::itm::write_str+0xc0>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a0:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
            while !port.is_fifo_ready() {}
  a2:	2b01      	cmp	r3, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  a4:	bf1c      	itt	ne
  a6:	6803      	ldrne	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  a8:	2b01      	cmpne	r3, #1
  aa:	d005      	beq.n	b8 <cortex_m::itm::write_str+0xb8>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  ac:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  ae:	2b01      	cmp	r3, #1
  b0:	d002      	beq.n	b8 <cortex_m::itm::write_str+0xb8>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  b2:	6803      	ldr	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:109
  b4:	2b01      	cmp	r3, #1
  b6:	d1f3      	bne.n	a0 <cortex_m::itm::write_str+0xa0>
  b8:	f831 3b02 	ldrh.w	r3, [r1], #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:113
            left -= 2;
  bc:	3a02      	subs	r2, #2
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  be:	8003      	strh	r3, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:117
        if left == 1 {
  c0:	2a01      	cmp	r2, #1
_ZN8cortex_m3itm9write_str17h8d8e10b4c67e43c3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:134

/// Writes a string to the ITM `port`
pub fn write_str(port: &mut Stim, string: &str) {
    write_all(port, string.as_bytes())
}
  c2:	bf18      	it	ne
  c4:	4770      	bxne	lr
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  c6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
            while !port.is_fifo_ready() {}
  c8:	2a01      	cmp	r2, #1
  ca:	d017      	beq.n	fc <cortex_m::itm::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  cc:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  ce:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d0:	bf1c      	itt	ne
  d2:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  d4:	2a01      	cmpne	r2, #1
  d6:	d011      	beq.n	fc <cortex_m::itm::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  d8:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm13write_aligned17h5db71ed7835f4618E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:118
  da:	2a01      	cmp	r2, #1
  dc:	d1f3      	bne.n	c6 <cortex_m::itm::write_str+0xc6>
  de:	e00d      	b.n	fc <cortex_m::itm::write_str+0xfc>
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:61
                if len == 1 {
  e0:	2a01      	cmp	r2, #1
  e2:	d10d      	bne.n	100 <cortex_m::itm::write_str+0x100>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e4:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
                    while !port.is_fifo_ready() {}
  e6:	2a01      	cmp	r2, #1
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  e8:	bf1c      	itt	ne
  ea:	6802      	ldrne	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  ec:	2a01      	cmpne	r2, #1
  ee:	d005      	beq.n	fc <cortex_m::itm::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f0:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f2:	2a01      	cmp	r2, #1
  f4:	d002      	beq.n	fc <cortex_m::itm::write_str+0xfc>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  f6:	6802      	ldr	r2, [r0, #0]
_ZN8cortex_m3itm9write_all17h34ed86ddbf0ecd73E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:63
  f8:	2a01      	cmp	r2, #1
  fa:	d1f3      	bne.n	e4 <cortex_m::itm::write_str+0xe4>
  fc:	7809      	ldrb	r1, [r1, #0]
  fe:	7001      	strb	r1, [r0, #0]
_ZN8cortex_m3itm9write_str17h8d8e10b4c67e43c3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/itm.rs:134
}
 100:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hd2c8f4872fa24111E:

00000000 <cortex_m::peripheral::cpuid::<impl cortex_m::peripheral::CPUID>::select_cache>:
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hd2c8f4872fa24111E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:84
    ///
    /// * `level`: the required cache level minus 1, e.g. 0 for L1, 1 for L2
    /// * `ind`: select instruction cache or data/unified cache
    ///
    /// `level` is masked to be between 0 and 7.
    pub fn select_cache(&mut self, level: u8, ind: CsselrCacheType) {
   0:	f64e 5084 	movw	r0, #60804	; 0xed84
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:92
        const CSSELR_LEVEL_POS: u32 = 1;
        const CSSELR_LEVEL_MASK: u32 = 0x7 << CSSELR_LEVEL_POS;

        unsafe {
            self.csselr.write(
                (((level as u32) << CSSELR_LEVEL_POS) & CSSELR_LEVEL_MASK)
   4:	f361 0243 	bfi	r2, r1, #1, #3
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6002      	str	r2, [r0, #0]
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hd2c8f4872fa24111E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:96
                    | (((ind as u32) << CSSELR_IND_POS) & CSSELR_IND_MASK),
            )
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h7f385fb6ecf7b553E:

00000000 <cortex_m::peripheral::cpuid::<impl cortex_m::peripheral::CPUID>::cache_num_sets_ways>:
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h7f385fb6ecf7b553E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:99

    /// Returns the number of sets and ways in the selected cache
    pub fn cache_num_sets_ways(&mut self, level: u8, ind: CsselrCacheType) -> (u16, u16) {
   0:	b510      	push	{r4, lr}
   2:	f64e 5480 	movw	r4, #60800	; 0xed80
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$12select_cache17hd2c8f4872fa24111E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:92
                (((level as u32) << CSSELR_LEVEL_POS) & CSSELR_LEVEL_MASK)
   6:	f361 0243 	bfi	r2, r1, #1, #3
   a:	f2ce 0400 	movt	r4, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6062      	str	r2, [r4, #4]
_ZN8cortex_m3asm3dsb17ha21627ee28972a95E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
        () => unsafe {
            extern "C" {
                fn __dsb();
            }

            __dsb()
  10:	f7ff fffe 	bl	0 <__dsb>
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  14:	6821      	ldr	r1, [r4, #0]
_ZN8cortex_m10peripheral5cpuid45_$LT$impl$u20$cortex_m..peripheral..CPUID$GT$19cache_num_sets_ways17h7f385fb6ecf7b553E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:109

        self.select_cache(level, ind);
        ::asm::dsb();
        let ccsidr = self.ccsidr.read();
        (
            (1 + ((ccsidr & CCSIDR_NUMSETS_MASK) >> CCSIDR_NUMSETS_POS)) as u16,
  16:	f3c1 304e 	ubfx	r0, r1, #13, #15
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:110
            (1 + ((ccsidr & CCSIDR_ASSOCIATIVITY_MASK) >> CCSIDR_ASSOCIATIVITY_POS)) as u16,
  1a:	f3c1 01c9 	ubfx	r1, r1, #3, #10
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:109
            (1 + ((ccsidr & CCSIDR_NUMSETS_MASK) >> CCSIDR_NUMSETS_POS)) as u16,
  1e:	3001      	adds	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:110
            (1 + ((ccsidr & CCSIDR_ASSOCIATIVITY_MASK) >> CCSIDR_ASSOCIATIVITY_POS)) as u16,
  20:	3101      	adds	r1, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/cpuid.rs:112
        )
    }
  22:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h9d180040a4a4dd30E:

00000000 <cortex_m::peripheral::dcb::<impl cortex_m::peripheral::DCB>::enable_trace>:
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h9d180040a4a4dd30E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:28
impl DCB {
    /// Enables TRACE. This is for example required by the
    /// `peripheral::DWT` cycle counter to work properly.
    /// As by STM documentation, this flag is not reset on
    /// soft-reset, only on power reset.
    pub fn enable_trace(&mut self) {
   0:	f64e 50fc 	movw	r0, #60924	; 0xedfc
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace28_$u7b$$u7b$closure$u7d$$u7d$17hbd0fa21ecfb49578E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:31
        // set bit 24 / TRCENA
        unsafe {
            self.demcr.modify(|w| w | DCB_DEMCR_TRCENA);
   a:	f041 7180 	orr.w	r1, r1, #16777216	; 0x1000000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$12enable_trace17h9d180040a4a4dd30E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:33
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17ha27e1406b2ee98b9E:

00000000 <cortex_m::peripheral::dcb::<impl cortex_m::peripheral::DCB>::disable_trace>:
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17ha27e1406b2ee98b9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:36

    /// Disables TRACE. See `DCB::enable_trace()` for more details
    pub fn disable_trace(&mut self) {
   0:	f64e 50fc 	movw	r0, #60924	; 0xedfc
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace28_$u7b$$u7b$closure$u7d$$u7d$17hf003e309e26b414fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:39
        // unset bit 24 / TRCENA
        unsafe {
            self.demcr.modify(|w| w & !DCB_DEMCR_TRCENA);
   a:	f021 7180 	bic.w	r1, r1, #16777216	; 0x1000000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$13disable_trace17ha27e1406b2ee98b9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:41
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17h823c0cdb8fd92d53E:

00000000 <cortex_m::peripheral::dcb::<impl cortex_m::peripheral::DCB>::is_debugger_attached>:
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17h823c0cdb8fd92d53E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:50
    /// Note: This function is [reported not to
    /// work](http://web.archive.org/web/20180821191012/https://community.nxp.com/thread/424925#comment-782843)
    /// on Cortex-M0 devices. Per the ARM v6-M Architecture Reference Manual, "Access to the DHCSR
    /// from software running on the processor is IMPLEMENTATION DEFINED". Indeed, from the
    /// [Cortex-M0+ r0p1 Technical Reference Manual](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0484c/BABJHEIG.html), "Note Software cannot access the debug registers."
    pub fn is_debugger_attached() -> bool {
   0:	f64e 50f0 	movw	r0, #60912	; 0xedf0
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17hf2262a78e61f32b5E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	7800      	ldrb	r0, [r0, #0]
_ZN8cortex_m10peripheral3dcb43_$LT$impl$u20$cortex_m..peripheral..DCB$GT$20is_debugger_attached17h823c0cdb8fd92d53E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dcb.rs:56
        unsafe {
            // do an 8-bit read of the 32-bit DHCSR register, and get the LSB
            let value = ptr::read_volatile(Self::ptr() as *const u8);
            value & 0x1 == 1
        }
    }
   a:	f000 0001 	and.w	r0, r0, #1
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17ha33db9ec02bcf5d7E:

00000000 <cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::enable_cycle_counter>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17ha33db9ec02bcf5d7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:68
}

impl DWT {
    /// Enables the cycle counter
    #[cfg(not(armv6m))]
    pub fn enable_cycle_counter(&mut self) {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter28_$u7b$$u7b$closure$u7d$$u7d$17hf20b4e83f57686adE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:69
        unsafe { self.ctrl.modify(|r| r | 1) }
   a:	f041 0101 	orr.w	r1, r1, #1
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17ha33db9ec02bcf5d7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:70
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h16061290493404a9E:

00000000 <cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::get_cycle_count>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h16061290493404a9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:74

    /// Returns the current clock cycle count
    #[cfg(not(armv6m))]
    pub fn get_cycle_count() -> u32 {
   0:	f241 0004 	movw	r0, #4100	; 0x1004
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17h16061290493404a9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/dwt.rs:77
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).cyccnt.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim8write_u817hf5984d6404aaf636E:

00000000 <cortex_m::peripheral::itm::Stim::write_u8>:
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   0:	7001      	strb	r1, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim8write_u817hf5984d6404aaf636E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:40

impl Stim {
    /// Writes an `u8` payload into the stimulus port
    pub fn write_u8(&mut self, value: u8) {
        unsafe { ptr::write_volatile(self.register.get() as *mut u8, value) }
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim9write_u1617h53c21ff7f354a014E:

00000000 <cortex_m::peripheral::itm::Stim::write_u16>:
_ZN4core3ptr14write_volatile17h99cb0c34d2e4de8bE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   0:	8001      	strh	r1, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim9write_u1617h53c21ff7f354a014E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:45

    /// Writes an `u16` payload into the stimulus port
    pub fn write_u16(&mut self, value: u16) {
        unsafe { ptr::write_volatile(self.register.get() as *mut u16, value) }
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim9write_u3217h126976650e7975aaE:

00000000 <cortex_m::peripheral::itm::Stim::write_u32>:
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   0:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim9write_u3217h126976650e7975aaE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:50

    /// Writes an `u32` payload into the stimulus port
    pub fn write_u32(&mut self, value: u32) {
        unsafe { ptr::write_volatile(self.register.get(), value) }
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17hdbd890bb34216f11E:

00000000 <cortex_m::peripheral::itm::Stim::is_fifo_ready>:
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   0:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3itm4Stim13is_fifo_ready17hdbd890bb34216f11E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:54

    /// Returns `true` if the stimulus port is ready to accept more data
    pub fn is_fifo_ready(&self) -> bool {
        unsafe { ptr::read_volatile(self.register.get()) == 1 }
   2:	3801      	subs	r0, #1
   4:	fab0 f080 	clz	r0, r0
   8:	0940      	lsrs	r0, r0, #5
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/itm.rs:55
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h109b59719ddbbca6E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::vect_active>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17h109b59719ddbbca6E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:165
    }
}

impl SCB {
    /// Returns the active exception number
    pub fn vect_active() -> VectActive {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
   8:	6800      	ldr	r0, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:168
        let icsr = unsafe { ptr::read(&(*SCB::ptr()).icsr as *const _ as *const u32) };

        match icsr as u8 {
   a:	b2c2      	uxtb	r2, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:169
            0 => VectActive::ThreadMode,
   c:	2a0f      	cmp	r2, #15
   e:	d80c      	bhi.n	2a <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::vect_active+0x2a>
  10:	e8df f002 	tbb	[pc, r2]
  14:	0f080b0e 	.word	0x0f080b0e
  18:	0b181512 	.word	0x0b181512
  1c:	1b0b0b0b 	.word	0x1b0b0b0b
  20:	24210b1e 	.word	0x24210b1e
  24:	2001      	movs	r0, #1
  26:	2100      	movs	r1, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:187
            12 => VectActive::Exception(Exception::DebugMonitor),
            14 => VectActive::Exception(Exception::PendSV),
            15 => VectActive::Exception(Exception::SysTick),
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
        }
    }
  28:	4770      	bx	lr
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:185
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
  2a:	f1a0 0110 	sub.w	r1, r0, #16
  2e:	2002      	movs	r0, #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:187
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

Disassembly of section .text._ZN8cortex_m10peripheral3scb9Exception4irqn17h4332944dc5fc4d4dE:

00000000 <cortex_m::peripheral::scb::Exception::irqn>:
_ZN8cortex_m10peripheral3scb9Exception4irqn17h4332944dc5fc4d4dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:235
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
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:251
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

Disassembly of section .text._ZN8cortex_m10peripheral3scb10VectActive4from17h239dc07ce3e3af2cE:

00000000 <cortex_m::peripheral::scb::VectActive::from>:
_ZN8cortex_m10peripheral3scb10VectActive4from17h239dc07ce3e3af2cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:272
    },
}

impl VectActive {
    /// Converts a `byte` into `VectActive`
    pub fn from(vect_active: u8) -> Option<Self> {
   0:	b2c2      	uxtb	r2, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:274
        Some(match vect_active {
            0 => VectActive::ThreadMode,
   2:	2a0f      	cmp	r2, #15
   4:	d80c      	bhi.n	20 <cortex_m::peripheral::scb::VectActive::from+0x20>
   6:	e8df f002 	tbb	[pc, r2]
   a:	0b12      	.short	0x0b12
   c:	19161308 	.word	0x19161308
  10:	0b0b0b1c 	.word	0x0b0b0b1c
  14:	0b221f0b 	.word	0x0b221f0b
  18:	2825      	.short	0x2825
  1a:	2001      	movs	r0, #1
  1c:	2100      	movs	r1, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:293
            14 => VectActive::Exception(Exception::PendSV),
            15 => VectActive::Exception(Exception::SysTick),
            irqn if irqn >= 16 => VectActive::Interrupt { irqn },
            _ => return None,
        })
    }
  1e:	4770      	bx	lr
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:290
            irqn if irqn >= 16 => VectActive::Interrupt { irqn },
  20:	2a0f      	cmp	r2, #15
  22:	bf82      	ittt	hi
  24:	4601      	movhi	r1, r0
  26:	2002      	movhi	r0, #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:293
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

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17ha5e8a57d669133feE:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_sleepdeep>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17ha5e8a57d669133feE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:585

const SCB_SCR_SLEEPDEEP: u32 = 0x1 << 2;

impl SCB {
    /// Set the SLEEPDEEP bit in the SCR register
    pub fn set_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17ha1d03209ca407ae0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:587
        unsafe {
            self.scr.modify(|scr| scr | SCB_SCR_SLEEPDEEP);
   a:	f041 0104 	orr.w	r1, r1, #4
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17ha5e8a57d669133feE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:589
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17haeaf3c4b463d2e9bE:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_sleepdeep>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17haeaf3c4b463d2e9bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:592

    /// Clear the SLEEPDEEP bit in the SCR register
    pub fn clear_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17h945c35410ece4cf3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:594
        unsafe {
            self.scr.modify(|scr| scr & !SCB_SCR_SLEEPDEEP);
   a:	f021 0104 	bic.w	r1, r1, #4
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17haeaf3c4b463d2e9bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:596
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he4ee4906044a2eb9E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_sleeponexit>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he4ee4906044a2eb9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:603

const SCB_SCR_SLEEPONEXIT: u32 = 0x1 << 1;

impl SCB {
    /// Set the SLEEPONEXIT bit in the SCR register
    pub fn set_sleeponexit(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit28_$u7b$$u7b$closure$u7d$$u7d$17he6ff2e3f70b5d78cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:605
        unsafe {
            self.scr.modify(|scr| scr | SCB_SCR_SLEEPONEXIT);
   a:	f041 0102 	orr.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15set_sleeponexit17he4ee4906044a2eb9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:607
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h11eb33d8595df8d0E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_sleeponexit>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h11eb33d8595df8d0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:610

    /// Clear the SLEEPONEXIT bit in the SCR register
    pub fn clear_sleeponexit(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit28_$u7b$$u7b$closure$u7d$$u7d$17hc0c0ec753ee23cc5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:612
        unsafe {
            self.scr.modify(|scr| scr & !SCB_SCR_SLEEPONEXIT);
   a:	f021 0102 	bic.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17clear_sleeponexit17h11eb33d8595df8d0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:614
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h442986c9e1b256f7E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::system_reset>:
_ZN8cortex_m3asm3dsb17ha21627ee28972a95E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
   0:	f7ff fffe 	bl	0 <__dsb>
   4:	f64e 500c 	movw	r0, #60684	; 0xed0c
   8:	2204      	movs	r2, #4
   a:	f2ce 0000 	movt	r0, #57344	; 0xe000
   e:	f2c0 52fa 	movt	r2, #1530	; 0x5fa
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  12:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset28_$u7b$$u7b$closure$u7d$$u7d$17h6a91da9e8eaf9723E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:629
        ::asm::dsb();
        unsafe {
            self.aircr.modify(
                |r| {
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
            r & SCB_AIRCR_PRIGROUP_MASK | // keep priority group unchanged
  14:	f401 61a0 	and.w	r1, r1, #1280	; 0x500
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:628
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
  18:	4311      	orrs	r1, r2
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  1a:	6001      	str	r1, [r0, #0]
_ZN8cortex_m3asm3dsb17ha21627ee28972a95E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
  1c:	f7ff fffe 	bl	0 <__dsb>
_ZN8cortex_m3asm3nop17h931e2e9eb3eef5e1E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:76
            __nop()
  20:	f7ff fffe 	bl	0 <__nop>
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h442986c9e1b256f7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:637
            )
        };
        ::asm::dsb();
        loop {
            // wait for the reset
            ::asm::nop(); // avoid rust-lang/rust#28728
  24:	e7fc      	b.n	20 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::system_reset+0x20>

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17head1e6a94d2cd79fE:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_pendsv>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17head1e6a94d2cd79fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:650
const SCB_ICSR_PENDSTSET: u32 = 1 << 26;
const SCB_ICSR_PENDSTCLR: u32 = 1 << 25;

impl SCB {
    /// Set the PENDSVSET bit in the ICSR register which will pend the PendSV interrupt
    pub fn set_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 5180 	mov.w	r1, #268435456	; 0x10000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17head1e6a94d2cd79fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:654
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVSET);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17h57c5694c386b70deE:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::is_pendsv_pending>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17h57c5694c386b70deE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:657

    /// Check if PENDSVSET bit in the ICSR register is set meaning PendSV interrupt is pending
    pub fn is_pendsv_pending() -> bool {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17h57c5694c386b70deE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:658
        unsafe { (*Self::ptr()).icsr.read() & SCB_ICSR_PENDSVSET == SCB_ICSR_PENDSVSET }
   a:	f3c0 7000 	ubfx	r0, r0, #28, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:659
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h5b46a3b5158c4e6dE:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_pendsv>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h5b46a3b5158c4e6dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:662

    /// Set the PENDSVCLR bit in the ICSR register which will clear a pending PendSV interrupt
    pub fn clear_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 6100 	mov.w	r1, #134217728	; 0x8000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h5b46a3b5158c4e6dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:666
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVCLR);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h87f5530121b472c5E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::get_priority>:
_ZN8cortex_m10peripheral3scb13SystemHandler5index17h3fd73539df29af51E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:731

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
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17h87f5530121b472c5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:768
            // NOTE(unsafe) atomic read with no side effects
            let shpr = unsafe { (*Self::ptr()).shpr[usize::from((index - 8) / 4)].read() };
            let prio = (shpr >> (8 * (index % 4))) & 0x000000ff;
            prio as u8
        }
    }
  16:	5c40      	ldrb	r0, [r0, r1]
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h00c7a093c9c63b47E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_priority>:
_ZN8cortex_m10peripheral3scb13SystemHandler5index17h3fd73539df29af51E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:731
            SystemHandler::MemoryManagement => 4,
   0:	b248      	sxtb	r0, r1
   2:	f240 0100 	movw	r1, #0
   6:	f2c0 0100 	movt	r1, #0
   a:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
   e:	f64e 5118 	movw	r1, #60696	; 0xed18
  12:	f2ce 0100 	movt	r1, #57344	; 0xe000
_ZN4core3ptr14write_volatile17hc39b2783c51eefd0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  16:	5442      	strb	r2, [r0, r1]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h00c7a093c9c63b47E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:800
                let prio = u32::from(prio) << shift;

                (value & !mask) | prio
            });
        }
    }
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3b55d81d22aacfceE:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::clear_current>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3b55d81d22aacfceE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:43

impl SYST {
    /// Clears current value to 0
    ///
    /// After calling `clear_current()`, the next call to `has_wrapped()` will return `false`.
    pub fn clear_current(&mut self) {
   0:	f24e 0018 	movw	r0, #57368	; 0xe018
   4:	2100      	movs	r1, #0
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   a:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$13clear_current17h3b55d81d22aacfceE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:45
        unsafe { self.cvr.write(0) }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h07638ebc2d6e7388E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::disable_counter>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h07638ebc2d6e7388E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:48

    /// Disables counter
    pub fn disable_counter(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter28_$u7b$$u7b$closure$u7d$$u7d$17h936f40774f19c1caE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:49
        unsafe { self.csr.modify(|v| v & !SYST_CSR_ENABLE) }
   a:	f021 0101 	bic.w	r1, r1, #1
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$15disable_counter17h07638ebc2d6e7388E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:50
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h083578f28bfd56a8E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::disable_interrupt>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h083578f28bfd56a8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:53

    /// Disables SysTick interrupt
    pub fn disable_interrupt(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt28_$u7b$$u7b$closure$u7d$$u7d$17h2e7fb2a61ef1988fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:54
        unsafe { self.csr.modify(|v| v & !SYST_CSR_TICKINT) }
   a:	f021 0102 	bic.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$17disable_interrupt17h083578f28bfd56a8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:55
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h025ea95e34767598E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::enable_counter>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h025ea95e34767598E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:69
    /// - Program reload value
    /// - Clear current value
    /// - Program Control and Status register"
    ///
    /// The sequence translates to `self.set_reload(x); self.clear_current(); self.enable_counter()`
    pub fn enable_counter(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter28_$u7b$$u7b$closure$u7d$$u7d$17hb2ba49027f0f2304E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:70
        unsafe { self.csr.modify(|v| v | SYST_CSR_ENABLE) }
   a:	f041 0101 	orr.w	r1, r1, #1
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$14enable_counter17h025ea95e34767598E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:71
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h5e71118e8d2fde3aE:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::enable_interrupt>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h5e71118e8d2fde3aE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:74

    /// Enables SysTick interrupt
    pub fn enable_interrupt(&mut self) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt28_$u7b$$u7b$closure$u7d$$u7d$17h313ee9428d3fa7aeE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:75
        unsafe { self.csr.modify(|v| v | SYST_CSR_TICKINT) }
   a:	f041 0102 	orr.w	r1, r1, #2
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16enable_interrupt17h5e71118e8d2fde3aE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:76
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h576d368d43939080E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_clock_source>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h576d368d43939080E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:82

    /// Gets clock source
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and can clear the
    /// bit that indicates that the timer has wrapped (cf. `SYST.has_wrapped`)
    pub fn get_clock_source(&mut self) -> SystClkSource {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	2101      	movs	r1, #1
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   a:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16get_clock_source17h576d368d43939080E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:84
        // NOTE(unsafe) atomic read with no side effects
        let clk_source_bit = self.csr.read() & SYST_CSR_CLKSOURCE != 0;
   c:	f000 0004 	and.w	r0, r0, #4
  10:	ea81 0090 	eor.w	r0, r1, r0, lsr #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:89
        match clk_source_bit {
            false => SystClkSource::External,
            true => SystClkSource::Core,
        }
    }
  14:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17hb54b375ce80e811fE:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_current>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17hb54b375ce80e811fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:92

    /// Gets current value
    pub fn get_current() -> u32 {
   0:	f24e 0018 	movw	r0, #57368	; 0xe018
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11get_current17hb54b375ce80e811fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:95
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).cvr.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17h05c06a007858d85dE:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_reload>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17h05c06a007858d85dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:98

    /// Gets reload value
    pub fn get_reload() -> u32 {
   0:	f24e 0014 	movw	r0, #57364	; 0xe014
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10get_reload17h05c06a007858d85dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:101
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).rvr.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h333fe7dea2dde9a3E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::get_ticks_per_10ms>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h333fe7dea2dde9a3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:108
    /// Returns the reload value with which the counter would wrap once per 10
    /// ms
    ///
    /// Returns `0` if the value is not known (e.g. because the clock can
    /// change dynamically).
    pub fn get_ticks_per_10ms() -> u32 {
   0:	f24e 001c 	movw	r0, #57372	; 0xe01c
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18get_ticks_per_10ms17h333fe7dea2dde9a3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:110
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).calib.read() & SYST_COUNTER_MASK }
   a:	f020 407f 	bic.w	r0, r0, #4278190080	; 0xff000000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:111
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h4587b661ba004f43E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::has_reference_clock>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h4587b661ba004f43E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:114

    /// Checks if an external reference clock is available
    pub fn has_reference_clock() -> bool {
   0:	f24e 001c 	movw	r0, #57372	; 0xe01c
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$19has_reference_clock17h4587b661ba004f43E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:117
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).calib.read() & SYST_CALIB_NOREF == 0 }
    }
   a:	43c0      	mvns	r0, r0
   c:	0fc0      	lsrs	r0, r0, #31
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17hef57ab6262d167d3E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::has_wrapped>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17hef57ab6262d167d3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:123

    /// Checks if the counter wrapped (underflowed) since the last check
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and will clear
    /// the bit of the read register.
    pub fn has_wrapped(&mut self) -> bool {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$11has_wrapped17hef57ab6262d167d3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:124
        self.csr.read() & SYST_CSR_COUNTFLAG != 0
   a:	f3c0 4000 	ubfx	r0, r0, #16, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:125
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h12dd47db4b75d7cdE:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::is_counter_enabled>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h12dd47db4b75d7cdE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:131

    /// Checks if counter is enabled
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and can clear the
    /// bit that indicates that the timer has wrapped (cf. `SYST.has_wrapped`)
    pub fn is_counter_enabled(&mut self) -> bool {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$18is_counter_enabled17h12dd47db4b75d7cdE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:132
        self.csr.read() & SYST_CSR_ENABLE != 0
   a:	f000 0001 	and.w	r0, r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:133
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h8c697bbd39741eddE:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::is_interrupt_enabled>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h8c697bbd39741eddE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:139

    /// Checks if SysTick interrupt is enabled
    ///
    /// *NOTE* This takes `&mut self` because the read operation is side effectful and can clear the
    /// bit that indicates that the timer has wrapped (cf. `SYST.has_wrapped`)
    pub fn is_interrupt_enabled(&mut self) -> bool {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$20is_interrupt_enabled17h8c697bbd39741eddE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:140
        self.csr.read() & SYST_CSR_TICKINT != 0
   a:	f3c0 0040 	ubfx	r0, r0, #1, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:141
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17hdf6c267ff359ed39E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::is_precise>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17hdf6c267ff359ed39E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:148
    /// Checks if the calibration value is precise
    ///
    /// Returns `false` if using the reload value returned by
    /// `get_ticks_per_10ms()` may result in a period significantly deviating
    /// from 10 ms.
    pub fn is_precise() -> bool {
   0:	f24e 001c 	movw	r0, #57372	; 0xe01c
   4:	2101      	movs	r1, #1
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h92e63e8c8f835ddbE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   a:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10is_precise17hdf6c267ff359ed39E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:150
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).calib.read() & SYST_CALIB_SKEW == 0 }
   c:	f000 4080 	and.w	r0, r0, #1073741824	; 0x40000000
  10:	ea81 7090 	eor.w	r0, r1, r0, lsr #30
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:151
    }
  14:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17hc7bec0914fd76b22E:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::set_clock_source>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$16set_clock_source17hc7bec0914fd76b22E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:154

    /// Sets clock source
    pub fn set_clock_source(&mut self, clk_source: SystClkSource) {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:156
        match clk_source {
            SystClkSource::External => unsafe { self.csr.modify(|v| v & !SYST_CSR_CLKSOURCE) },
   4:	2900      	cmp	r1, #0
   6:	f2ce 0000 	movt	r0, #57344	; 0xe000
   a:	6802      	ldr	r2, [r0, #0]
   c:	f042 0304 	orr.w	r3, r2, #4
  10:	bf18      	it	ne
  12:	f022 0304 	bicne.w	r3, r2, #4
  16:	6003      	str	r3, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:159
            SystClkSource::Core => unsafe { self.csr.modify(|v| v | SYST_CSR_CLKSOURCE) },
        }
    }
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17h8e509ef18931a6ceE:

00000000 <cortex_m::peripheral::syst::<impl cortex_m::peripheral::SYST>::set_reload>:
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17h8e509ef18931a6ceE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:166
    /// Sets reload value
    ///
    /// Valid values are between `1` and `0x00ffffff`.
    ///
    /// *NOTE* To make the timer wrap every `N` ticks set the reload value to `N - 1`
    pub fn set_reload(&mut self, value: u32) {
   0:	f24e 0014 	movw	r0, #57364	; 0xe014
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17h805cf84299217b43E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   8:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral4syst44_$LT$impl$u20$cortex_m..peripheral..SYST$GT$10set_reload17h8e509ef18931a6ceE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:168
        unsafe { self.rvr.write(value) }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral11Peripherals5steal17hf8f26c82adefb6b6E:

00000000 <cortex_m::peripheral::Peripherals::steal>:
_ZN8cortex_m10peripheral11Peripherals5steal17hf8f26c82adefb6b6E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:172

    /// Unchecked version of `Peripherals::take`
    pub unsafe fn steal() -> Self {
        debug_assert!(!CORE_PERIPHERALS);

        CORE_PERIPHERALS = true;
   0:	f240 0000 	movw	r0, #0
   4:	2101      	movs	r1, #1
   6:	f2c0 0000 	movt	r0, #0
   a:	7001      	strb	r1, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:212
            },
            TPIU: TPIU {
                _marker: PhantomData,
            },
        }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3CBP3new17hf231e52218bcfb76E:

00000000 <cortex_m::peripheral::CBP::new>:
_ZN8cortex_m10peripheral3CBP3new17hf231e52218bcfb76E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:228
impl CBP {
    pub(crate) unsafe fn new() -> Self {
        CBP {
            _marker: PhantomData,
        }
    }
   0:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3CBP3ptr17hf03eb2bbd0975c01E:

00000000 <cortex_m::peripheral::CBP::ptr>:
_ZN8cortex_m10peripheral3CBP3ptr17hf03eb2bbd0975c01E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:231

    /// Returns a pointer to the register block
    pub fn ptr() -> *const self::cbp::RegisterBlock {
   0:	f64e 7050 	movw	r0, #61264	; 0xef50
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:233
        0xE000_EF50 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd03c2ca1e0c023b5E:

00000000 <<cortex_m::peripheral::CBP as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..CBP$u20$as$u20$core..ops..deref..Deref$GT$5deref17hd03c2ca1e0c023b5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:240

#[cfg(not(armv6m))]
impl ops::Deref for CBP {
    type Target = self::cbp::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 7050 	movw	r0, #61264	; 0xef50
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:242
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral5CPUID3ptr17ha27566c578b7be02E:

00000000 <cortex_m::peripheral::CPUID::ptr>:
_ZN8cortex_m10peripheral5CPUID3ptr17ha27566c578b7be02E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:254

unsafe impl Send for CPUID {}

impl CPUID {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const self::cpuid::RegisterBlock {
   0:	f64e 5000 	movw	r0, #60672	; 0xed00
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:256
        0xE000_ED00 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17hbec086371c1bb4ccE:

00000000 <<cortex_m::peripheral::CPUID as core::ops::deref::Deref>::deref>:
_ZN71_$LT$cortex_m..peripheral..CPUID$u20$as$u20$core..ops..deref..Deref$GT$5deref17hbec086371c1bb4ccE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:262
}

impl ops::Deref for CPUID {
    type Target = self::cpuid::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5000 	movw	r0, #60672	; 0xed00
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:264
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3DCB3ptr17h1ad1321cd9b3358fE:

00000000 <cortex_m::peripheral::DCB::ptr>:
_ZN8cortex_m10peripheral3DCB3ptr17h1ad1321cd9b3358fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:276

unsafe impl Send for DCB {}

impl DCB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const dcb::RegisterBlock {
   0:	f64e 50f0 	movw	r0, #60912	; 0xedf0
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:278
        0xE000_EDF0 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h55bde78de4329ed7E:

00000000 <<cortex_m::peripheral::DCB as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..DCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17h55bde78de4329ed7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:284
}

impl ops::Deref for DCB {
    type Target = self::dcb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 50f0 	movw	r0, #60912	; 0xedf0
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:286
        unsafe { &*DCB::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3DWT3ptr17h43afe1d569358c54E:

00000000 <cortex_m::peripheral::DWT::ptr>:
_ZN8cortex_m10peripheral3DWT3ptr17h43afe1d569358c54E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:298

unsafe impl Send for DWT {}

impl DWT {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const dwt::RegisterBlock {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:300
        0xE000_1000 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha8cad503d33939eeE:

00000000 <<cortex_m::peripheral::DWT as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha8cad503d33939eeE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:306
}

impl ops::Deref for DWT {
    type Target = self::dwt::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:308
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3FPB3ptr17h671ce5b0bdda4077E:

00000000 <cortex_m::peripheral::FPB::ptr>:
_ZN8cortex_m10peripheral3FPB3ptr17h671ce5b0bdda4077E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:321
unsafe impl Send for FPB {}

#[cfg(not(armv6m))]
impl FPB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const fpb::RegisterBlock {
   0:	f242 0000 	movw	r0, #8192	; 0x2000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:323
        0xE000_2000 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha9d4023ec4f9a8a5E:

00000000 <<cortex_m::peripheral::FPB as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..FPB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha9d4023ec4f9a8a5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:330

#[cfg(not(armv6m))]
impl ops::Deref for FPB {
    type Target = self::fpb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f242 0000 	movw	r0, #8192	; 0x2000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:332
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3ITM3ptr17h0a2de636a7f65aadE:

00000000 <cortex_m::peripheral::ITM::ptr>:
_ZN8cortex_m10peripheral3ITM3ptr17h0a2de636a7f65aadE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:371
#[cfg(not(armv6m))]
impl ITM {
    /// Returns a pointer to the register block
    pub fn ptr() -> *mut itm::RegisterBlock {
        0xE000_0000 as *mut _
    }
   0:	f04f 4060 	mov.w	r0, #3758096384	; 0xe0000000
   4:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h031fda693d13bc5dE:

00000000 <<cortex_m::peripheral::ITM as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..Deref$GT$5deref17h031fda693d13bc5dE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:380
impl ops::Deref for ITM {
    type Target = self::itm::RegisterBlock;

    fn deref(&self) -> &Self::Target {
        unsafe { &*Self::ptr() }
    }
   0:	f04f 4060 	mov.w	r0, #3758096384	; 0xe0000000
   4:	4770      	bx	lr

Disassembly of section .text._ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h9cbb5749fa25a00eE:

00000000 <<cortex_m::peripheral::ITM as core::ops::deref::DerefMut>::deref_mut>:
_ZN72_$LT$cortex_m..peripheral..ITM$u20$as$u20$core..ops..deref..DerefMut$GT$9deref_mut17h9cbb5749fa25a00eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:387

#[cfg(not(armv6m))]
impl ops::DerefMut for ITM {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { &mut *Self::ptr() }
    }
   0:	f04f 4060 	mov.w	r0, #3758096384	; 0xe0000000
   4:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3MPU3ptr17h12d778228a56fb49E:

00000000 <cortex_m::peripheral::MPU::ptr>:
_ZN8cortex_m10peripheral3MPU3ptr17h12d778228a56fb49E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:399

unsafe impl Send for MPU {}

impl MPU {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const mpu::RegisterBlock {
   0:	f64e 5090 	movw	r0, #60816	; 0xed90
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:401
        0xE000_ED90 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9a5f0f3cf0b6c4abE:

00000000 <<cortex_m::peripheral::MPU as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..MPU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h9a5f0f3cf0b6c4abE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:407
}

impl ops::Deref for MPU {
    type Target = self::mpu::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5090 	movw	r0, #60816	; 0xed90
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:409
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4NVIC3ptr17hde76b9f317c18ee1E:

00000000 <cortex_m::peripheral::NVIC::ptr>:
_ZN8cortex_m10peripheral4NVIC3ptr17hde76b9f317c18ee1E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:421

unsafe impl Send for NVIC {}

impl NVIC {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const nvic::RegisterBlock {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:423
        0xE000_E100 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he51759cc6e244771E:

00000000 <<cortex_m::peripheral::NVIC as core::ops::deref::Deref>::deref>:
_ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he51759cc6e244771E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:429
}

impl ops::Deref for NVIC {
    type Target = self::nvic::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:431
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3SCB3ptr17h65ddcefb56d56f18E:

00000000 <cortex_m::peripheral::SCB::ptr>:
_ZN8cortex_m10peripheral3SCB3ptr17h65ddcefb56d56f18E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:443

unsafe impl Send for SCB {}

impl SCB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const scb::RegisterBlock {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:445
        0xE000_ED04 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha96740f0e126291aE:

00000000 <<cortex_m::peripheral::SCB as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha96740f0e126291aE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:451
}

impl ops::Deref for SCB {
    type Target = self::scb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:453
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4SYST3ptr17hd9ee883576d923e3E:

00000000 <cortex_m::peripheral::SYST::ptr>:
_ZN8cortex_m10peripheral4SYST3ptr17hd9ee883576d923e3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:465

unsafe impl Send for SYST {}

impl SYST {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const syst::RegisterBlock {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:467
        0xE000_E010 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb77f44de12cdb2f2E:

00000000 <<cortex_m::peripheral::SYST as core::ops::deref::Deref>::deref>:
_ZN70_$LT$cortex_m..peripheral..SYST$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb77f44de12cdb2f2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:473
}

impl ops::Deref for SYST {
    type Target = self::syst::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f24e 0010 	movw	r0, #57360	; 0xe010
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:475
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4TPIU3ptr17h95803cdf51a2d107E:

00000000 <cortex_m::peripheral::TPIU::ptr>:
_ZN8cortex_m10peripheral4TPIU3ptr17h95803cdf51a2d107E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:488
unsafe impl Send for TPIU {}

#[cfg(not(armv6m))]
impl TPIU {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const tpiu::RegisterBlock {
   0:	2000      	movs	r0, #0
   2:	f2ce 0004 	movt	r0, #57348	; 0xe004
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:490
        0xE004_0000 as *const _
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h881fa450975a5772E:

00000000 <<cortex_m::peripheral::TPIU as core::ops::deref::Deref>::deref>:
_ZN70_$LT$cortex_m..peripheral..TPIU$u20$as$u20$core..ops..deref..Deref$GT$5deref17h881fa450975a5772E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:497

#[cfg(not(armv6m))]
impl ops::Deref for TPIU {
    type Target = self::tpiu::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	2000      	movs	r0, #0
   2:	f2ce 0004 	movt	r0, #57348	; 0xe004
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/mod.rs:499
        unsafe { &*Self::ptr() }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control4bits17h18bc9932c0720048E:

00000000 <cortex_m::register::control::Control::bits>:
_ZN8cortex_m8register7control7Control4bits17h18bc9932c0720048E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:12
}

impl Control {
    /// Returns the contents of the register as raw bits
    pub fn bits(&self) -> u32 {
        self.bits
   0:	6800      	ldr	r0, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:13
    }
   2:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control5npriv17h16ec04b89492bec0E:

00000000 <cortex_m::register::control::Control::npriv>:
_ZN8cortex_m8register7control7Control5npriv17h16ec04b89492bec0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:17

    /// Thread mode privilege level
    pub fn npriv(&self) -> Npriv {
        if self.bits & (1 << 0) == (1 << 0) {
   0:	6800      	ldr	r0, [r0, #0]
   2:	f000 0001 	and.w	r0, r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:22
            Npriv::Unprivileged
        } else {
            Npriv::Privileged
        }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control5spsel17h3deccecf735c6c04E:

00000000 <cortex_m::register::control::Control::spsel>:
_ZN8cortex_m8register7control7Control5spsel17h3deccecf735c6c04E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:26

    /// Currently active stack pointer
    pub fn spsel(&self) -> Spsel {
        if self.bits & (1 << 1) == (1 << 1) {
   0:	7800      	ldrb	r0, [r0, #0]
   2:	f3c0 0040 	ubfx	r0, r0, #1, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:31
            Spsel::Psp
        } else {
            Spsel::Msp
        }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control7Control4fpca17h6f1ef6142bf128f5E:

00000000 <cortex_m::register::control::Control::fpca>:
_ZN8cortex_m8register7control7Control4fpca17h6f1ef6142bf128f5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:35

    /// Whether context floating-point is currently active
    pub fn fpca(&self) -> Fpca {
        if self.bits & (1 << 2) == (1 << 2) {
   0:	7800      	ldrb	r0, [r0, #0]
   2:	2101      	movs	r1, #1
   4:	f000 0004 	and.w	r0, r0, #4
   8:	ea81 0090 	eor.w	r0, r1, r0, lsr #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:40
            Fpca::Active
        } else {
            Fpca::NotActive
        }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E:

00000000 <cortex_m::register::control::Fpca::is_active>:
_ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:96
    NotActive,
}

impl Fpca {
    /// Is a floating-point context active?
    pub fn is_active(&self) -> bool {
   0:	7800      	ldrb	r0, [r0, #0]
_ZN74_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..cmp..PartialEq$GT$2eq17h34de2f54719192adE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:86
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   2:	fab0 f080 	clz	r0, r0
   6:	0940      	lsrs	r0, r0, #5
_ZN8cortex_m8register7control4Fpca9is_active17h20782a2018fe82f3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:98
        *self == Fpca::Active
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E:

00000000 <cortex_m::register::control::Fpca::is_not_active>:
_ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:101

    /// Is a floating-point context not active?
    pub fn is_not_active(&self) -> bool {
   0:	7800      	ldrb	r0, [r0, #0]
_ZN74_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..cmp..PartialEq$GT$2eq17h34de2f54719192adE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:86
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   2:	3801      	subs	r0, #1
   4:	fab0 f080 	clz	r0, r0
   8:	0940      	lsrs	r0, r0, #5
_ZN8cortex_m8register7control4Fpca13is_not_active17hbced988fe1c63557E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:103
        *self == Fpca::NotActive
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17hedb88d624423cbf1E:

00000000 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt>:
_ZN73_$LT$cortex_m..peripheral..scb..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17hedb88d624423cbf1E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:191
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	3801      	subs	r0, #1
   8:	2807      	cmp	r0, #7
   a:	d80c      	bhi.n	26 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x26>
   c:	e8df f000 	tbb	[pc, r0]
  10:	20191204 	.word	0x20191204
  14:	3c342d27 	.word	0x3c342d27
  18:	ac01      	add	r4, sp, #4
  1a:	f240 0200 	movw	r2, #0
  1e:	f2c0 0200 	movt	r2, #0
  22:	2309      	movs	r3, #9
  24:	e036      	b.n	94 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x94>
  26:	ac01      	add	r4, sp, #4
  28:	f240 0200 	movw	r2, #0
  2c:	f2c0 0200 	movt	r2, #0
  30:	230e      	movs	r3, #14
  32:	e02f      	b.n	94 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x94>
  34:	ac01      	add	r4, sp, #4
  36:	f240 0200 	movw	r2, #0
  3a:	f2c0 0200 	movt	r2, #0
  3e:	2310      	movs	r3, #16
  40:	e028      	b.n	94 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x94>
  42:	ac01      	add	r4, sp, #4
  44:	f240 0200 	movw	r2, #0
  48:	f2c0 0200 	movt	r2, #0
  4c:	2308      	movs	r3, #8
  4e:	e021      	b.n	94 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x94>
  50:	ac01      	add	r4, sp, #4
  52:	f240 0200 	movw	r2, #0
  56:	f2c0 0200 	movt	r2, #0
  5a:	230a      	movs	r3, #10
  5c:	e01a      	b.n	94 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x94>
  5e:	f240 0200 	movw	r2, #0
  62:	ac01      	add	r4, sp, #4
  64:	f2c0 0200 	movt	r2, #0
  68:	e00b      	b.n	82 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x82>
  6a:	ac01      	add	r4, sp, #4
  6c:	f240 0200 	movw	r2, #0
  70:	f2c0 0200 	movt	r2, #0
  74:	230c      	movs	r3, #12
  76:	e00d      	b.n	94 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x94>
  78:	f240 0200 	movw	r2, #0
  7c:	ac01      	add	r4, sp, #4
  7e:	f2c0 0200 	movt	r2, #0
  82:	4620      	mov	r0, r4
  84:	2306      	movs	r3, #6
  86:	e006      	b.n	96 <<cortex_m::peripheral::scb::Exception as core::fmt::Debug>::fmt+0x96>
  88:	ac01      	add	r4, sp, #4
  8a:	f240 0200 	movw	r2, #0
  8e:	f2c0 0200 	movt	r2, #0
  92:	2307      	movs	r3, #7
  94:	4620      	mov	r0, r4
  96:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  9a:	4620      	mov	r0, r4
  9c:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  a0:	b004      	add	sp, #16
  a2:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h89b7c6284a21e754E:

00000000 <<cortex_m::peripheral::scb::VectActive as core::fmt::Debug>::fmt>:
_ZN74_$LT$cortex_m..peripheral..scb..VectActive$u20$as$u20$core..fmt..Debug$GT$3fmt17h89b7c6284a21e754E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:255
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b086      	sub	sp, #24
   4:	4604      	mov	r4, r0
   6:	7800      	ldrb	r0, [r0, #0]
   8:	2801      	cmp	r0, #1
   a:	d01f      	beq.n	4c <<cortex_m::peripheral::scb::VectActive as core::fmt::Debug>::fmt+0x4c>
   c:	2802      	cmp	r0, #2
   e:	d135      	bne.n	7c <<cortex_m::peripheral::scb::VectActive as core::fmt::Debug>::fmt+0x7c>
  10:	ad02      	add	r5, sp, #8
  12:	f240 0200 	movw	r2, #0
  16:	f2c0 0200 	movt	r2, #0
  1a:	2309      	movs	r3, #9
  1c:	4628      	mov	r0, r5
  1e:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_struct>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:266
        irqn: u8,
  22:	1c60      	adds	r0, r4, #1
  24:	9005      	str	r0, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:255
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
  26:	f240 0000 	movw	r0, #0
  2a:	f240 0100 	movw	r1, #0
  2e:	f2c0 0000 	movt	r0, #0
  32:	ab05      	add	r3, sp, #20
  34:	9000      	str	r0, [sp, #0]
  36:	f2c0 0100 	movt	r1, #0
  3a:	4628      	mov	r0, r5
  3c:	2204      	movs	r2, #4
  3e:	f7ff fffe 	bl	0 <core::fmt::builders::DebugStruct::field>
  42:	4628      	mov	r0, r5
  44:	f7ff fffe 	bl	0 <core::fmt::builders::DebugStruct::finish>
  48:	b006      	add	sp, #24
  4a:	bdb0      	pop	{r4, r5, r7, pc}
  4c:	ad02      	add	r5, sp, #8
  4e:	f240 0200 	movw	r2, #0
  52:	f2c0 0200 	movt	r2, #0
  56:	2309      	movs	r3, #9
  58:	4628      	mov	r0, r5
  5a:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  5e:	f240 0200 	movw	r2, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:261
    Exception(Exception),
  62:	1c60      	adds	r0, r4, #1
  64:	a905      	add	r1, sp, #20
  66:	9005      	str	r0, [sp, #20]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:255
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
  68:	f2c0 0200 	movt	r2, #0
  6c:	4628      	mov	r0, r5
  6e:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::field>
  72:	4628      	mov	r0, r5
  74:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  78:	b006      	add	sp, #24
  7a:	bdb0      	pop	{r4, r5, r7, pc}
  7c:	ac02      	add	r4, sp, #8
  7e:	f240 0200 	movw	r2, #0
  82:	f2c0 0200 	movt	r2, #0
  86:	230a      	movs	r3, #10
  88:	4620      	mov	r0, r4
  8a:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  8e:	4620      	mov	r0, r4
  90:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  94:	b006      	add	sp, #24
  96:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17h49448ef5a705b979E:

00000000 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt>:
_ZN77_$LT$cortex_m..peripheral..scb..SystemHandler$u20$as$u20$core..fmt..Debug$GT$3fmt17h49448ef5a705b979E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/scb.rs:693
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	3801      	subs	r0, #1
   8:	2805      	cmp	r0, #5
   a:	d80b      	bhi.n	24 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt+0x24>
   c:	e8df f000 	tbb	[pc, r0]
  10:	1e181103 	.word	0x1e181103
  14:	2d25      	.short	0x2d25
  16:	ac01      	add	r4, sp, #4
  18:	f240 0200 	movw	r2, #0
  1c:	f2c0 0200 	movt	r2, #0
  20:	2308      	movs	r3, #8
  22:	e028      	b.n	76 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt+0x76>
  24:	ac01      	add	r4, sp, #4
  26:	f240 0200 	movw	r2, #0
  2a:	f2c0 0200 	movt	r2, #0
  2e:	2310      	movs	r3, #16
  30:	e021      	b.n	76 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt+0x76>
  32:	ac01      	add	r4, sp, #4
  34:	f240 0200 	movw	r2, #0
  38:	f2c0 0200 	movt	r2, #0
  3c:	230a      	movs	r3, #10
  3e:	e01a      	b.n	76 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt+0x76>
  40:	f240 0200 	movw	r2, #0
  44:	ac01      	add	r4, sp, #4
  46:	f2c0 0200 	movt	r2, #0
  4a:	e00b      	b.n	64 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt+0x64>
  4c:	ac01      	add	r4, sp, #4
  4e:	f240 0200 	movw	r2, #0
  52:	f2c0 0200 	movt	r2, #0
  56:	230c      	movs	r3, #12
  58:	e00d      	b.n	76 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt+0x76>
  5a:	f240 0200 	movw	r2, #0
  5e:	ac01      	add	r4, sp, #4
  60:	f2c0 0200 	movt	r2, #0
  64:	4620      	mov	r0, r4
  66:	2306      	movs	r3, #6
  68:	e006      	b.n	78 <<cortex_m::peripheral::scb::SystemHandler as core::fmt::Debug>::fmt+0x78>
  6a:	ac01      	add	r4, sp, #4
  6c:	f240 0200 	movw	r2, #0
  70:	f2c0 0200 	movt	r2, #0
  74:	2307      	movs	r3, #7
  76:	4620      	mov	r0, r4
  78:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  7c:	4620      	mov	r0, r4
  7e:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  82:	b004      	add	sp, #16
  84:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bacbfbb734dd2c3E:

00000000 <<cortex_m::peripheral::syst::SystClkSource as core::fmt::Debug>::fmt>:
_ZN78_$LT$cortex_m..peripheral..syst..SystClkSource$u20$as$u20$core..fmt..Debug$GT$3fmt17h8bacbfbb734dd2c3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/peripheral/syst.rs:21
#[derive(Clone, Copy, Debug)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <<cortex_m::peripheral::syst::SystClkSource as core::fmt::Debug>::fmt+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	2308      	movs	r3, #8
  18:	e005      	b.n	26 <<cortex_m::peripheral::syst::SystClkSource as core::fmt::Debug>::fmt+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	2304      	movs	r3, #4
  26:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hc7a50642d23399daE:

00000000 <<cortex_m::register::control::Control as core::fmt::Debug>::fmt>:
_ZN73_$LT$cortex_m..register..control..Control$u20$as$u20$core..fmt..Debug$GT$3fmt17hc7a50642d23399daE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:4
#[derive(Clone, Copy, Debug)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	ad01      	add	r5, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	4604      	mov	r4, r0
   c:	f2c0 0200 	movt	r2, #0
  10:	4628      	mov	r0, r5
  12:	2307      	movs	r3, #7
  14:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_struct>
  18:	f240 0000 	movw	r0, #0
  1c:	f240 0100 	movw	r1, #0
  20:	f2c0 0000 	movt	r0, #0
  24:	ab03      	add	r3, sp, #12
  26:	9000      	str	r0, [sp, #0]
  28:	f2c0 0100 	movt	r1, #0
  2c:	4628      	mov	r0, r5
  2e:	2204      	movs	r2, #4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:6
    bits: u32,
  30:	9403      	str	r4, [sp, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:4
#[derive(Clone, Copy, Debug)]
  32:	f7ff fffe 	bl	0 <core::fmt::builders::DebugStruct::field>
  36:	4628      	mov	r0, r5
  38:	f7ff fffe 	bl	0 <core::fmt::builders::DebugStruct::finish>
  3c:	b004      	add	sp, #16
  3e:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17hafbcd44c4020124fE:

00000000 <<cortex_m::register::control::Npriv as core::fmt::Debug>::fmt>:
_ZN71_$LT$cortex_m..register..control..Npriv$u20$as$u20$core..fmt..Debug$GT$3fmt17hafbcd44c4020124fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:44
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <<cortex_m::register::control::Npriv as core::fmt::Debug>::fmt+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	230c      	movs	r3, #12
  18:	e005      	b.n	26 <<cortex_m::register::control::Npriv as core::fmt::Debug>::fmt+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	230a      	movs	r3, #10
  26:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h47199d686fdaa245E:

00000000 <<cortex_m::register::control::Spsel as core::fmt::Debug>::fmt>:
_ZN71_$LT$cortex_m..register..control..Spsel$u20$as$u20$core..fmt..Debug$GT$3fmt17h47199d686fdaa245E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:65
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d104      	bne.n	16 <<cortex_m::register::control::Spsel as core::fmt::Debug>::fmt+0x16>
   c:	f240 0200 	movw	r2, #0
  10:	f2c0 0200 	movt	r2, #0
  14:	e003      	b.n	a <<cortex_m::register::control::Spsel as core::fmt::Debug>::fmt+0xa>
  16:	f240 0200 	movw	r2, #0
  1a:	f2c0 0200 	movt	r2, #0
  1e:	4620      	mov	r0, r4
  20:	2303      	movs	r3, #3
  22:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  26:	4620      	mov	r0, r4
  28:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  2c:	b004      	add	sp, #16
  2e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17hdcd59b25a4810f41E:

00000000 <<cortex_m::register::control::Fpca as core::fmt::Debug>::fmt>:
_ZN70_$LT$cortex_m..register..control..Fpca$u20$as$u20$core..fmt..Debug$GT$3fmt17hdcd59b25a4810f41E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/control.rs:86
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <<cortex_m::register::control::Fpca as core::fmt::Debug>::fmt+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	2309      	movs	r3, #9
  18:	e005      	b.n	26 <<cortex_m::register::control::Fpca as core::fmt::Debug>::fmt+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	2306      	movs	r3, #6
  26:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hb3942e9de531228bE:

00000000 <<cortex_m::register::primask::Primask as core::fmt::Debug>::fmt>:
_ZN73_$LT$cortex_m..register..primask..Primask$u20$as$u20$core..fmt..Debug$GT$3fmt17hb3942e9de531228bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/register/primask.rs:4
//! Priority mask register

/// All exceptions with configurable priority are ...
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	7800      	ldrb	r0, [r0, #0]
   6:	ac01      	add	r4, sp, #4
   8:	2801      	cmp	r0, #1
   a:	d106      	bne.n	1a <<cortex_m::register::primask::Primask as core::fmt::Debug>::fmt+0x1a>
   c:	f240 0200 	movw	r2, #0
  10:	4620      	mov	r0, r4
  12:	f2c0 0200 	movt	r2, #0
  16:	2308      	movs	r3, #8
  18:	e005      	b.n	26 <<cortex_m::register::primask::Primask as core::fmt::Debug>::fmt+0x26>
  1a:	f240 0200 	movw	r2, #0
  1e:	4620      	mov	r0, r4
  20:	f2c0 0200 	movt	r2, #0
  24:	2306      	movs	r3, #6
  26:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  30:	b004      	add	sp, #16
  32:	bd10      	pop	{r4, pc}

cortex_m-7bcea70b8214c918.cortex_m.6br79ov8-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cortex_m.6br79ov8-cgu.0
00001105 l       .debug_str	00000000 
0000115f l       .debug_str	00000000 
0000116d l       .debug_str	00000000 
0000119d l       .debug_str	00000000 
00001202 l       .debug_str	00000000 
00001208 l       .debug_str	00000000 
00001232 l       .debug_str	00000000 
00001268 l       .debug_str	00000000 
0000126d l       .debug_str	00000000 
00001272 l       .debug_str	00000000 
0000127d l       .debug_str	00000000 
00001282 l       .debug_str	00000000 
0000128d l       .debug_str	00000000 
00001292 l       .debug_str	00000000 
0000129d l       .debug_str	00000000 
000012a2 l       .debug_str	00000000 
000012ad l       .debug_str	00000000 
000012b2 l       .debug_str	00000000 
000012bd l       .debug_str	00000000 
000012c1 l       .debug_str	00000000 
000012f2 l       .debug_str	00000000 
00001358 l       .debug_str	00000000 
00001383 l       .debug_str	00000000 
000013b8 l       .debug_str	00000000 
000013bd l       .debug_str	00000000 
000013c2 l       .debug_str	00000000 
000013c8 l       .debug_str	00000000 
000013cc l       .debug_str	00000000 
000013d1 l       .debug_str	00000000 
000013d7 l       .debug_str	00000000 
000013dc l       .debug_str	00000000 
000013e1 l       .debug_str	00000000 
000013e6 l       .debug_str	00000000 
000013ec l       .debug_str	00000000 
000013f1 l       .debug_str	00000000 
000013f6 l       .debug_str	00000000 
00001401 l       .debug_str	00000000 
00001407 l       .debug_str	00000000 
00001437 l       .debug_str	00000000 
0000149c l       .debug_str	00000000 
000014c6 l       .debug_str	00000000 
000014e5 l       .debug_str	00000000 
00001504 l       .debug_str	00000000 
00001513 l       .debug_str	00000000 
00001518 l       .debug_str	00000000 
0000151e l       .debug_str	00000000 
00001539 l       .debug_str	00000000 
00001555 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000099 l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000ef l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000110 l       .debug_str	00000000 
0000011a l       .debug_str	00000000 
0000012b l       .debug_str	00000000 
00000134 l       .debug_str	00000000 
0000013f l       .debug_str	00000000 
00000146 l       .debug_str	00000000 
00000153 l       .debug_str	00000000 
0000015a l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
0000016c l       .debug_str	00000000 
0000017a l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
00000183 l       .debug_str	00000000 
00000187 l       .debug_str	00000000 
00000189 l       .debug_str	00000000 
000001b9 l       .debug_str	00000000 
000001cc l       .debug_str	00000000 
000001d0 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e1 l       .debug_str	00000000 
000001e7 l       .debug_str	00000000 
000001ec l       .debug_str	00000000 
000001fc l       .debug_str	00000000 
0000020e l       .debug_str	00000000 
00000247 l       .debug_str	00000000 
00000250 l       .debug_str	00000000 
00000255 l       .debug_str	00000000 
0000026f l       .debug_str	00000000 
00000281 l       .debug_str	00000000 
0000028a l       .debug_str	00000000 
00000292 l       .debug_str	00000000 
0000029a l       .debug_str	00000000 
0000029c l       .debug_str	00000000 
000002db l       .debug_str	00000000 
000002ef l       .debug_str	00000000 
0000030b l       .debug_str	00000000 
0000030d l       .debug_str	00000000 
00000311 l       .debug_str	00000000 
0000031a l       .debug_str	00000000 
0000032f l       .debug_str	00000000 
000003c1 l       .debug_str	00000000 
000003cd l       .debug_str	00000000 
000003cf l       .debug_str	00000000 
00000400 l       .debug_str	00000000 
00000414 l       .debug_str	00000000 
00000418 l       .debug_str	00000000 
00000421 l       .debug_str	00000000 
0000045a l       .debug_str	00000000 
00000463 l       .debug_str	00000000 
0000046b l       .debug_str	00000000 
00000472 l       .debug_str	00000000 
00000475 l       .debug_str	00000000 
0000047f l       .debug_str	00000000 
00000496 l       .debug_str	00000000 
0000049a l       .debug_str	00000000 
000004d7 l       .debug_str	00000000 
000004e1 l       .debug_str	00000000 
000004ec l       .debug_str	00000000 
0000052a l       .debug_str	00000000 
00000543 l       .debug_str	00000000 
00000549 l       .debug_str	00000000 
0000054f l       .debug_str	00000000 
00000575 l       .debug_str	00000000 
00000579 l       .debug_str	00000000 
0000057d l       .debug_str	00000000 
00000584 l       .debug_str	00000000 
00000596 l       .debug_str	00000000 
000005a7 l       .debug_str	00000000 
000005ab l       .debug_str	00000000 
000005ea l       .debug_str	00000000 
000005f8 l       .debug_str	00000000 
00000683 l       .debug_str	00000000 
00000687 l       .debug_str	00000000 
000006c6 l       .debug_str	00000000 
000006d6 l       .debug_str	00000000 
00000763 l       .debug_str	00000000 
00000767 l       .debug_str	00000000 
00000790 l       .debug_str	00000000 
00000794 l       .debug_str	00000000 
000007d3 l       .debug_str	00000000 
000007e0 l       .debug_str	00000000 
0000086a l       .debug_str	00000000 
00000893 l       .debug_str	00000000 
00000897 l       .debug_str	00000000 
000008d5 l       .debug_str	00000000 
000008e0 l       .debug_str	00000000 
00000927 l       .debug_str	00000000 
0000093c l       .debug_str	00000000 
0000093f l       .debug_str	00000000 
00000969 l       .debug_str	00000000 
0000099a l       .debug_str	00000000 
000009ad l       .debug_str	00000000 
000009b5 l       .debug_str	00000000 
000009c4 l       .debug_str	00000000 
000009d5 l       .debug_str	00000000 
00000a0e l       .debug_str	00000000 
00000a16 l       .debug_str	00000000 
00000a2f l       .debug_str	00000000 
00000a36 l       .debug_str	00000000 
00000a74 l       .debug_str	00000000 
00000a7e l       .debug_str	00000000 
00000a99 l       .debug_str	00000000 
00000a9d l       .debug_str	00000000 
00000aa3 l       .debug_str	00000000 
00000aa7 l       .debug_str	00000000 
00000aab l       .debug_str	00000000 
00000aaf l       .debug_str	00000000 
00000ab3 l       .debug_str	00000000 
00000ab7 l       .debug_str	00000000 
00000abc l       .debug_str	00000000 
00000ac1 l       .debug_str	00000000 
00000ac6 l       .debug_str	00000000 
00000ad2 l       .debug_str	00000000 
00000b46 l       .debug_str	00000000 
00000bb5 l       .debug_str	00000000 
00000bc5 l       .debug_str	00000000 
00000c30 l       .debug_str	00000000 
00000c3c l       .debug_str	00000000 
00000c47 l       .debug_str	00000000 
00000c4b l       .debug_str	00000000 
00000c55 l       .debug_str	00000000 
00000c5a l       .debug_str	00000000 
00000c65 l       .debug_str	00000000 
00000c9e l       .debug_str	00000000 
00000ca6 l       .debug_str	00000000 
00000d13 l       .debug_str	00000000 
00000d82 l       .debug_str	00000000 
00000dee l       .debug_str	00000000 
00000df0 l       .debug_str	00000000 
00000e5a l       .debug_str	00000000 
00000e65 l       .debug_str	00000000 
00000ed6 l       .debug_str	00000000 
00000ee8 l       .debug_str	00000000 
00000eed l       .debug_str	00000000 
00000f59 l       .debug_str	00000000 
00000f66 l       .debug_str	00000000 
00000fd2 l       .debug_str	00000000 
00000fdf l       .debug_str	00000000 
0000104b l       .debug_str	00000000 
00001058 l       .debug_str	00000000 
00001098 l       .debug_str	00000000 
0000109e l       .debug_str	00000000 
000010d3 l       .debug_str	00000000 
000010d8 l       .debug_str	00000000 
000010df l       .debug_str	00000000 
000010e6 l       .debug_str	00000000 
000010ed l       .debug_str	00000000 
000010f6 l       .debug_str	00000000 
000010fd l       .debug_str	00000000 
0000110a l       .debug_str	00000000 
00001112 l       .debug_str	00000000 
00001114 l       .debug_str	00000000 
00001119 l       .debug_str	00000000 
0000111e l       .debug_str	00000000 
00001127 l       .debug_str	00000000 
00001130 l       .debug_str	00000000 
0000113b l       .debug_str	00000000 
0000114f l       .debug_str	00000000 
00001153 l       .debug_str	00000000 
0000115b l       .debug_str	00000000 
00000000 l     O .rodata..Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h167a06255413aec0E	0000001c .Lswitch.table._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h167a06255413aec0E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h8cc43c144673a983E	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h8cc43c144673a983E
00000000 l    d  .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17ha8be8f9d0e345e23E	00000000 .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17ha8be8f9d0e345e23E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17hb394e577c199d611E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17hb394e577c199d611E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb7cbp_new17h7e572854c69d5b27E	00000000 .text._ZN8cortex_m10peripheral3scb7cbp_new17h7e572854c69d5b27E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h016992a1bed8c5b5E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h016992a1bed8c5b5E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h8cf739a118a534d2E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h8cf739a118a534d2E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h96668d5b553356a2E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h96668d5b553356a2E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17he0576b6b9826a818E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17he0576b6b9826a818E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf924b67a7bfe4adbE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf924b67a7bfe4adbE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h1928ad88c302ee23E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h1928ad88c302ee23E
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17hc8a6a39b7f8ff22cE	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17hc8a6a39b7f8ff22cE
00000000 l    d  .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h167a06255413aec0E	00000000 .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h167a06255413aec0E
00000000 l    d  .text._ZN8cortex_m10peripheral11Peripherals5steal17hd16bf29374105a89E	00000000 .text._ZN8cortex_m10peripheral11Peripherals5steal17hd16bf29374105a89E
00000000 l    d  .text._ZN8cortex_m10peripheral3DWT3ptr17h9047bf817d9894b3E	00000000 .text._ZN8cortex_m10peripheral3DWT3ptr17h9047bf817d9894b3E
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha22958b8f9073395E	00000000 .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha22958b8f9073395E
00000000 l    d  .text._ZN8cortex_m10peripheral4NVIC3ptr17h72ff6a485e849affE	00000000 .text._ZN8cortex_m10peripheral4NVIC3ptr17h72ff6a485e849affE
00000000 l    d  .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he25d399912258abaE	00000000 .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he25d399912258abaE
00000000 l    d  .text._ZN8cortex_m10peripheral3SCB3ptr17heac631c55de3781bE	00000000 .text._ZN8cortex_m10peripheral3SCB3ptr17heac631c55de3781bE
00000000 l    d  .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb8b7a5b65fb9351cE	00000000 .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb8b7a5b65fb9351cE
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 CORE_PERIPHERALS
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha22958b8f9073395E	0000000a <cortex_m::peripheral::DWT as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb8b7a5b65fb9351cE	0000000a <cortex_m::peripheral::SCB as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he25d399912258abaE	0000000a <cortex_m::peripheral::NVIC as core::ops::deref::Deref>::deref
00000000 g     F .text._ZN8cortex_m10peripheral11Peripherals5steal17hd16bf29374105a89E	0000000e cortex_m::peripheral::Peripherals::steal
00000000 g     F .text._ZN8cortex_m10peripheral3DWT3ptr17h9047bf817d9894b3E	0000000a cortex_m::peripheral::DWT::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3SCB3ptr17heac631c55de3781bE	0000000a cortex_m::peripheral::SCB::ptr
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17ha8be8f9d0e345e23E	0000000c cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::get_cycle_count
00000000 g     F .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h8cc43c144673a983E	00000012 cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::enable_cycle_counter
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17he0576b6b9826a818E	00000010 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_pendsv
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17hb394e577c199d611E	00000062 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::vect_active
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h1928ad88c302ee23E	00000010 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_pendsv
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17hc8a6a39b7f8ff22cE	0000001a cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::get_priority
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h167a06255413aec0E	0000001a cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_priority
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h96668d5b553356a2E	00000026 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::system_reset
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h016992a1bed8c5b5E	00000012 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_sleepdeep
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h8cf739a118a534d2E	00000012 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_sleepdeep
00000000 g     F .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf924b67a7bfe4adbE	00000010 cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::is_pendsv_pending
00000000 g     F .text._ZN8cortex_m10peripheral3scb7cbp_new17h7e572854c69d5b27E	00000002 cortex_m::peripheral::scb::cbp_new
00000000 g     F .text._ZN8cortex_m10peripheral4NVIC3ptr17h72ff6a485e849affE	0000000a cortex_m::peripheral::NVIC::ptr
00000000         *UND*	00000000 __dsb
00000000         *UND*	00000000 __nop



Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h8cc43c144673a983E:

00000000 <cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::enable_cycle_counter>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h8cc43c144673a983E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:39

pub use cortex_m_0_6::peripheral::dwt::Comparator;

impl DWT {
    /// Enables the cycle counter
    pub fn enable_cycle_counter(&mut self) {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h4db9683c5c9717ceE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter28_$u7b$$u7b$closure$u7d$$u7d$17heb07f34aff70d7a7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:40
        unsafe { self.ctrl.modify(|r| r | 1) }
   a:	f041 0101 	orr.w	r1, r1, #1
_ZN4core3ptr14write_volatile17hb6503266826ca93aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$20enable_cycle_counter17h8cc43c144673a983E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:41
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17ha8be8f9d0e345e23E:

00000000 <cortex_m::peripheral::dwt::<impl cortex_m::peripheral::DWT>::get_cycle_count>:
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17ha8be8f9d0e345e23E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:44

    /// Returns the current clock cycle count
    pub fn get_cycle_count() -> u32 {
   0:	f241 0004 	movw	r0, #4100	; 0x1004
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h4db9683c5c9717ceE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3dwt43_$LT$impl$u20$cortex_m..peripheral..DWT$GT$15get_cycle_count17ha8be8f9d0e345e23E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/dwt.rs:47
        // NOTE(unsafe) atomic read with no side effects
        unsafe { (*Self::ptr()).cyccnt.read() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17hb394e577c199d611E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::vect_active>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17hb394e577c199d611E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:156
    }
}

impl SCB {
    /// Returns the active exception number
    pub fn vect_active() -> VectActive {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core10intrinsics19copy_nonoverlapping17h2c8c83426c41e097E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$11vect_active17hb394e577c199d611E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:159
        let icsr = unsafe { ptr::read(&(*SCB::ptr()).icsr as *const _ as *const u32) };

        match icsr as u8 {
   a:	b2c2      	uxtb	r2, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:160
            0 => VectActive::ThreadMode,
   c:	2a0f      	cmp	r2, #15
   e:	d80c      	bhi.n	2a <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::vect_active+0x2a>
  10:	e8df f002 	tbb	[pc, r2]
  14:	0f080b0e 	.word	0x0f080b0e
  18:	0b181512 	.word	0x0b181512
  1c:	1b0b0b0b 	.word	0x1b0b0b0b
  20:	24210b1e 	.word	0x24210b1e
  24:	2001      	movs	r0, #1
  26:	2100      	movs	r1, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:178
            12 => VectActive::Exception(Exception::DebugMonitor),
            14 => VectActive::Exception(Exception::PendSV),
            15 => VectActive::Exception(Exception::SysTick),
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
        }
    }
  28:	4770      	bx	lr
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:176
            irqn => VectActive::Interrupt { irqn: irqn - 16 },
  2a:	f1a0 0110 	sub.w	r1, r0, #16
  2e:	2002      	movs	r0, #2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:178
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

Disassembly of section .text._ZN8cortex_m10peripheral3scb7cbp_new17h7e572854c69d5b27E:

00000000 <cortex_m::peripheral::scb::cbp_new>:
_ZN8cortex_m10peripheral3scb7cbp_new17h7e572854c69d5b27E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:195
use self::scb_consts::*;

#[cfg(not(armv6m))]
unsafe fn cbp_new() -> CBP {
    core::mem::transmute(())
}
   0:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h016992a1bed8c5b5E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_sleepdeep>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h016992a1bed8c5b5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:477

const SCB_SCR_SLEEPDEEP: u32 = 0x1 << 2;

impl SCB {
    /// Set the SLEEPDEEP bit in the SCR register
    pub fn set_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h4db9683c5c9717ceE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17h0152b511443cb140E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:479
        unsafe {
            self.scr.modify(|scr| scr | SCB_SCR_SLEEPDEEP);
   a:	f041 0104 	orr.w	r1, r1, #4
_ZN4core3ptr14write_volatile17hb6503266826ca93aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$13set_sleepdeep17h016992a1bed8c5b5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:481
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h8cf739a118a534d2E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_sleepdeep>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h8cf739a118a534d2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:484

    /// Clear the SLEEPDEEP bit in the SCR register
    pub fn clear_sleepdeep(&mut self) {
   0:	f64e 5010 	movw	r0, #60688	; 0xed10
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h4db9683c5c9717ceE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep28_$u7b$$u7b$closure$u7d$$u7d$17h9249b254cf66d9e5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:486
        unsafe {
            self.scr.modify(|scr| scr & !SCB_SCR_SLEEPDEEP);
   a:	f021 0104 	bic.w	r1, r1, #4
_ZN4core3ptr14write_volatile17hb6503266826ca93aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   e:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$15clear_sleepdeep17h8cf739a118a534d2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:488
        }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h96668d5b553356a2E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::system_reset>:
_ZN8cortex_m3asm3dsb17ha21627ee28972a95E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
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
_ZN4core3ptr13read_volatile17h4db9683c5c9717ceE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
  12:	6801      	ldr	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset28_$u7b$$u7b$closure$u7d$$u7d$17h52b06209c865f7a2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:503
        ::asm::dsb();
        unsafe {
            self.aircr.modify(
                |r| {
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
            r & SCB_AIRCR_PRIGROUP_MASK | // keep priority group unchanged
  14:	f401 61a0 	and.w	r1, r1, #1280	; 0x500
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:502
                    SCB_AIRCR_VECTKEY | // otherwise the write is ignored
  18:	4311      	orrs	r1, r2
_ZN4core3ptr14write_volatile17hb6503266826ca93aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  1a:	6001      	str	r1, [r0, #0]
_ZN8cortex_m3asm3dsb17ha21627ee28972a95E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:191
  1c:	f7ff fffe 	bl	0 <__dsb>
_ZN8cortex_m3asm3nop17h931e2e9eb3eef5e1E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:76
            __nop()
  20:	f7ff fffe 	bl	0 <__nop>
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12system_reset17h96668d5b553356a2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:511
            )
        };
        ::asm::dsb();
        loop {
            // wait for the reset
            ::asm::nop(); // avoid rust-lang/rust#28728
  24:	e7fc      	b.n	20 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::system_reset+0x20>

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17he0576b6b9826a818E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_pendsv>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17he0576b6b9826a818E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:524
const SCB_ICSR_PENDSTSET: u32 = 1 << 26;
const SCB_ICSR_PENDSTCLR: u32 = 1 << 25;

impl SCB {
    /// Set the PENDSVSET bit in the ICSR register which will pend the PendSV interrupt
    pub fn set_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 5180 	mov.w	r1, #268435456	; 0x10000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17hb6503266826ca93aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$10set_pendsv17he0576b6b9826a818E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:528
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVSET);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf924b67a7bfe4adbE:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::is_pendsv_pending>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf924b67a7bfe4adbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:531

    /// Check if PENDSVSET bit in the ICSR register is set meaning PendSV interrupt is pending
    pub fn is_pendsv_pending() -> bool {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr13read_volatile17h4db9683c5c9717ceE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:871
   8:	6800      	ldr	r0, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$17is_pendsv_pending17hf924b67a7bfe4adbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:532
        unsafe { (*Self::ptr()).icsr.read() & SCB_ICSR_PENDSVSET == SCB_ICSR_PENDSVSET }
   a:	f3c0 7000 	ubfx	r0, r0, #28, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:533
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h1928ad88c302ee23E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::clear_pendsv>:
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h1928ad88c302ee23E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:536

    /// Set the PENDSVCLR bit in the ICSR register which will clear a pending PendSV interrupt
    pub fn clear_pendsv() {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f04f 6100 	mov.w	r1, #134217728	; 0x8000000
   8:	f2ce 0000 	movt	r0, #57344	; 0xe000
_ZN4core3ptr14write_volatile17hb6503266826ca93aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
   c:	6001      	str	r1, [r0, #0]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12clear_pendsv17h1928ad88c302ee23E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:540
        unsafe {
            (*Self::ptr()).icsr.write(SCB_ICSR_PENDSVCLR);
        }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17hc8a6a39b7f8ff22cE:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::get_priority>:
_ZN8cortex_m10peripheral3scb20system_handler_index17hfe3842359a8f0575E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:568
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
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12get_priority17hc8a6a39b7f8ff22cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:604
            // NOTE(unsafe) atomic read with no side effects
            let shpr = unsafe { (*Self::ptr()).shpr[usize::from((index - 8) / 4)].read() };
            let prio = (shpr >> (8 * (index % 4))) & 0x000000ff;
            prio as u8
        }
    }
  16:	5c40      	ldrb	r0, [r0, r1]
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h167a06255413aec0E:

00000000 <cortex_m::peripheral::scb::<impl cortex_m::peripheral::SCB>::set_priority>:
_ZN8cortex_m10peripheral3scb20system_handler_index17hfe3842359a8f0575E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:568
        SystemHandler::MemoryManagement => 4,
   0:	b248      	sxtb	r0, r1
   2:	f240 0100 	movw	r1, #0
   6:	f2c0 0100 	movt	r1, #0
   a:	f851 0020 	ldr.w	r0, [r1, r0, lsl #2]
   e:	f64e 5118 	movw	r1, #60696	; 0xed18
  12:	f2ce 0100 	movt	r1, #57344	; 0xe000
_ZN4core3ptr14write_volatile17hf8fd25ba11a2d3d1E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:939
  16:	5442      	strb	r2, [r0, r1]
_ZN8cortex_m10peripheral3scb43_$LT$impl$u20$cortex_m..peripheral..SCB$GT$12set_priority17h167a06255413aec0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/scb.rs:636
                let prio = u32::from(prio) << shift;

                (value & !mask) | prio
            });
        }
    }
  18:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral11Peripherals5steal17hd16bf29374105a89E:

00000000 <cortex_m::peripheral::Peripherals::steal>:
_ZN8cortex_m10peripheral11Peripherals5steal17hd16bf29374105a89E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:164

    /// Unchecked version of `Peripherals::take`
    pub unsafe fn steal() -> Self {
        debug_assert!(!CORE_PERIPHERALS);

        CORE_PERIPHERALS = true;
   0:	f240 0000 	movw	r0, #0
   4:	2101      	movs	r1, #1
   6:	f2c0 0000 	movt	r0, #0
   a:	7001      	strb	r1, [r0, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:166
        core::mem::transmute(())
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3DWT3ptr17h9047bf817d9894b3E:

00000000 <cortex_m::peripheral::DWT::ptr>:
_ZN8cortex_m10peripheral3DWT3ptr17h9047bf817d9894b3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:180

unsafe impl Send for DWT {}

impl DWT {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const dwt::RegisterBlock {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:182
        0xE000_1000 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha22958b8f9073395E:

00000000 <<cortex_m::peripheral::DWT as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..DWT$u20$as$u20$core..ops..deref..Deref$GT$5deref17ha22958b8f9073395E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:188
}

impl ops::Deref for DWT {
    type Target = self::dwt::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f241 0000 	movw	r0, #4096	; 0x1000
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:190
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral4NVIC3ptr17h72ff6a485e849affE:

00000000 <cortex_m::peripheral::NVIC::ptr>:
_ZN8cortex_m10peripheral4NVIC3ptr17h72ff6a485e849affE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:202

unsafe impl Send for NVIC {}

impl NVIC {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const nvic::RegisterBlock {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:204
        0xE000_E100 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he25d399912258abaE:

00000000 <<cortex_m::peripheral::NVIC as core::ops::deref::Deref>::deref>:
_ZN70_$LT$cortex_m..peripheral..NVIC$u20$as$u20$core..ops..deref..Deref$GT$5deref17he25d399912258abaE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:210
}

impl ops::Deref for NVIC {
    type Target = self::nvic::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f24e 1000 	movw	r0, #57600	; 0xe100
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:212
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN8cortex_m10peripheral3SCB3ptr17heac631c55de3781bE:

00000000 <cortex_m::peripheral::SCB::ptr>:
_ZN8cortex_m10peripheral3SCB3ptr17heac631c55de3781bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:224

unsafe impl Send for SCB {}

impl SCB {
    /// Returns a pointer to the register block
    pub fn ptr() -> *const scb::RegisterBlock {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:226
        0xE000_ED04 as *const _
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb8b7a5b65fb9351cE:

00000000 <<cortex_m::peripheral::SCB as core::ops::deref::Deref>::deref>:
_ZN69_$LT$cortex_m..peripheral..SCB$u20$as$u20$core..ops..deref..Deref$GT$5deref17hb8b7a5b65fb9351cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:232
}

impl ops::Deref for SCB {
    type Target = self::scb::RegisterBlock;

    fn deref(&self) -> &Self::Target {
   0:	f64e 5004 	movw	r0, #60676	; 0xed04
   4:	f2ce 0000 	movt	r0, #57344	; 0xe000
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.5.10/src/peripheral/mod.rs:234
        unsafe { &*Self::ptr() }
    }
   8:	4770      	bx	lr

cstr_core-96c88e47e39f167d.cstr_core.47f33sl1-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cstr_core.47f33sl1-cgu.0
0000193a l       .debug_str	00000000 
00001d04 l       .debug_str	00000000 
00001d08 l       .debug_str	00000000 
00001d0d l       .debug_str	00000000 
00001d36 l       .debug_str	00000000 
00001d41 l       .debug_str	00000000 
00001d66 l       .debug_str	00000000 
00001d69 l       .debug_str	00000000 
00001dcb l       .debug_str	00000000 
00001dd3 l       .debug_str	00000000 
00001dd9 l       .debug_str	00000000 
00001ddd l       .debug_str	00000000 
00001e4d l       .debug_str	00000000 
00001e61 l       .debug_str	00000000 
00001e7d l       .debug_str	00000000 
00001eee l       .debug_str	00000000 
00001efe l       .debug_str	00000000 
00001f5d l       .debug_str	00000000 
00001fbe l       .debug_str	00000000 
00001fc6 l       .debug_str	00000000 
0000200e l       .debug_str	00000000 
00002019 l       .debug_str	00000000 
00002061 l       .debug_str	00000000 
0000208b l       .debug_str	00000000 
000020c0 l       .debug_str	00000000 
000020fa l       .debug_str	00000000 
00002178 l       .debug_str	00000000 
00002182 l       .debug_str	00000000 
00002210 l       .debug_str	00000000 
00002262 l       .debug_str	00000000 
000022c2 l       .debug_str	00000000 
000022ca l       .debug_str	00000000 
0000232f l       .debug_str	00000000 
0000235f l       .debug_str	00000000 
00002368 l       .debug_str	00000000 
000023a4 l       .debug_str	00000000 
000023b8 l       .debug_str	00000000 
000023bd l       .debug_str	00000000 
000023d3 l       .debug_str	00000000 
000023d5 l       .debug_str	00000000 
00002410 l       .debug_str	00000000 
0000243e l       .debug_str	00000000 
00002445 l       .debug_str	00000000 
00002449 l       .debug_str	00000000 
00002455 l       .debug_str	00000000 
0000245f l       .debug_str	00000000 
00002469 l       .debug_str	00000000 
0000248c l       .debug_str	00000000 
000024e1 l       .debug_str	00000000 
000024e4 l       .debug_str	00000000 
00002544 l       .debug_str	00000000 
00002550 l       .debug_str	00000000 
000025a0 l       .debug_str	00000000 
00002603 l       .debug_str	00000000 
0000260b l       .debug_str	00000000 
00002632 l       .debug_str	00000000 
0000265d l       .debug_str	00000000 
0000267e l       .debug_str	00000000 
00002683 l       .debug_str	00000000 
0000268a l       .debug_str	00000000 
000026ac l       .debug_str	00000000 
000026b0 l       .debug_str	00000000 
000026b5 l       .debug_str	00000000 
000026bd l       .debug_str	00000000 
000026c8 l       .debug_str	00000000 
000026d3 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000099 l       .debug_str	00000000 
000000e6 l       .debug_str	00000000 
000000ed l       .debug_str	00000000 
000000f7 l       .debug_str	00000000 
000000fb l       .debug_str	00000000 
00000107 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000111 l       .debug_str	00000000 
00000122 l       .debug_str	00000000 
0000013c l       .debug_str	00000000 
00000162 l       .debug_str	00000000 
00000169 l       .debug_str	00000000 
0000016e l       .debug_str	00000000 
00000175 l       .debug_str	00000000 
00000178 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
0000017f l       .debug_str	00000000 
00000186 l       .debug_str	00000000 
0000018a l       .debug_str	00000000 
0000018d l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
00000195 l       .debug_str	00000000 
0000019b l       .debug_str	00000000 
000001a2 l       .debug_str	00000000 
000001aa l       .debug_str	00000000 
000001b4 l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001bb l       .debug_str	00000000 
000001c0 l       .debug_str	00000000 
000001c6 l       .debug_str	00000000 
000001ce l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001db l       .debug_str	00000000 
000001e4 l       .debug_str	00000000 
00000243 l       .debug_str	00000000 
00000248 l       .debug_str	00000000 
0000024a l       .debug_str	00000000 
00000250 l       .debug_str	00000000 
00000255 l       .debug_str	00000000 
0000025a l       .debug_str	00000000 
00000260 l       .debug_str	00000000 
00000266 l       .debug_str	00000000 
0000026d l       .debug_str	00000000 
00000272 l       .debug_str	00000000 
00000274 l       .debug_str	00000000 
00000279 l       .debug_str	00000000 
00000287 l       .debug_str	00000000 
00000291 l       .debug_str	00000000 
00000295 l       .debug_str	00000000 
0000029d l       .debug_str	00000000 
000002a5 l       .debug_str	00000000 
000002b9 l       .debug_str	00000000 
000002c5 l       .debug_str	00000000 
000002d0 l       .debug_str	00000000 
000002d7 l       .debug_str	00000000 
000002dd l       .debug_str	00000000 
000002e1 l       .debug_str	00000000 
000002e7 l       .debug_str	00000000 
000002ed l       .debug_str	00000000 
000002f0 l       .debug_str	00000000 
000002ff l       .debug_str	00000000 
00000306 l       .debug_str	00000000 
0000030a l       .debug_str	00000000 
00000313 l       .debug_str	00000000 
0000031f l       .debug_str	00000000 
00000338 l       .debug_str	00000000 
0000033d l       .debug_str	00000000 
0000034e l       .debug_str	00000000 
00000358 l       .debug_str	00000000 
000003b6 l       .debug_str	00000000 
000003c1 l       .debug_str	00000000 
000003de l       .debug_str	00000000 
000003e2 l       .debug_str	00000000 
000003ea l       .debug_str	00000000 
00000401 l       .debug_str	00000000 
00000425 l       .debug_str	00000000 
00000441 l       .debug_str	00000000 
00000446 l       .debug_str	00000000 
0000044f l       .debug_str	00000000 
00000456 l       .debug_str	00000000 
0000046f l       .debug_str	00000000 
00000479 l       .debug_str	00000000 
00000493 l       .debug_str	00000000 
000004fa l       .debug_str	00000000 
00000503 l       .debug_str	00000000 
00000517 l       .debug_str	00000000 
00000520 l       .debug_str	00000000 
00000527 l       .debug_str	00000000 
00000532 l       .debug_str	00000000 
00000537 l       .debug_str	00000000 
00000542 l       .debug_str	00000000 
00000547 l       .debug_str	00000000 
0000054d l       .debug_str	00000000 
0000054f l       .debug_str	00000000 
000005e4 l       .debug_str	00000000 
000005f0 l       .debug_str	00000000 
000005f6 l       .debug_str	00000000 
000005fa l       .debug_str	00000000 
00000607 l       .debug_str	00000000 
0000062b l       .debug_str	00000000 
0000062d l       .debug_str	00000000 
00000633 l       .debug_str	00000000 
00000638 l       .debug_str	00000000 
000006cf l       .debug_str	00000000 
000006db l       .debug_str	00000000 
000006dd l       .debug_str	00000000 
000006e2 l       .debug_str	00000000 
000006f0 l       .debug_str	00000000 
00000715 l       .debug_str	00000000 
00000717 l       .debug_str	00000000 
0000073d l       .debug_str	00000000 
00000745 l       .debug_str	00000000 
00000747 l       .debug_str	00000000 
00000780 l       .debug_str	00000000 
00000796 l       .debug_str	00000000 
000007a1 l       .debug_str	00000000 
000007a3 l       .debug_str	00000000 
000007ee l       .debug_str	00000000 
000007fe l       .debug_str	00000000 
00000802 l       .debug_str	00000000 
00000810 l       .debug_str	00000000 
00000814 l       .debug_str	00000000 
00000816 l       .debug_str	00000000 
00000818 l       .debug_str	00000000 
0000085f l       .debug_str	00000000 
0000086b l       .debug_str	00000000 
000008c0 l       .debug_str	00000000 
000008ca l       .debug_str	00000000 
000008d1 l       .debug_str	00000000 
000008f8 l       .debug_str	00000000 
00000905 l       .debug_str	00000000 
00000909 l       .debug_str	00000000 
00000914 l       .debug_str	00000000 
00000918 l       .debug_str	00000000 
00000952 l       .debug_str	00000000 
00000971 l       .debug_str	00000000 
00000973 l       .debug_str	00000000 
00000975 l       .debug_str	00000000 
00000979 l       .debug_str	00000000 
0000099f l       .debug_str	00000000 
000009ab l       .debug_str	00000000 
000009b6 l       .debug_str	00000000 
00000a10 l       .debug_str	00000000 
00000a1e l       .debug_str	00000000 
00000ab8 l       .debug_str	00000000 
00000ac9 l       .debug_str	00000000 
00000aee l       .debug_str	00000000 
00000b0e l       .debug_str	00000000 
00000b13 l       .debug_str	00000000 
00000bbc l       .debug_str	00000000 
00000bcd l       .debug_str	00000000 
00000bd3 l       .debug_str	00000000 
00000c20 l       .debug_str	00000000 
00000c24 l       .debug_str	00000000 
00000c2a l       .debug_str	00000000 
00000c7d l       .debug_str	00000000 
00000c85 l       .debug_str	00000000 
00000c8f l       .debug_str	00000000 
00000d3b l       .debug_str	00000000 
00000d74 l       .debug_str	00000000 
00000d7b l       .debug_str	00000000 
00000d85 l       .debug_str	00000000 
00000d8a l       .debug_str	00000000 
00000d96 l       .debug_str	00000000 
00000d9e l       .debug_str	00000000 
00000da7 l       .debug_str	00000000 
00000dac l       .debug_str	00000000 
00000daf l       .debug_str	00000000 
00000db8 l       .debug_str	00000000 
00000dbf l       .debug_str	00000000 
00000dc2 l       .debug_str	00000000 
00000dc8 l       .debug_str	00000000 
00000dd2 l       .debug_str	00000000 
00000dda l       .debug_str	00000000 
00000de0 l       .debug_str	00000000 
00000deb l       .debug_str	00000000 
00000df4 l       .debug_str	00000000 
00000e17 l       .debug_str	00000000 
00000e36 l       .debug_str	00000000 
00000e5d l       .debug_str	00000000 
00000e67 l       .debug_str	00000000 
00000e99 l       .debug_str	00000000 
00000ea0 l       .debug_str	00000000 
00000ea6 l       .debug_str	00000000 
00000eab l       .debug_str	00000000 
00000edb l       .debug_str	00000000 
00000ee4 l       .debug_str	00000000 
00000eea l       .debug_str	00000000 
00000efb l       .debug_str	00000000 
00000f01 l       .debug_str	00000000 
00000f84 l       .debug_str	00000000 
00000f8e l       .debug_str	00000000 
00001014 l       .debug_str	00000000 
00001023 l       .debug_str	00000000 
00001025 l       .debug_str	00000000 
0000109a l       .debug_str	00000000 
000010c5 l       .debug_str	00000000 
000010cb l       .debug_str	00000000 
000010d2 l       .debug_str	00000000 
000010da l       .debug_str	00000000 
000010e3 l       .debug_str	00000000 
000010eb l       .debug_str	00000000 
000010ef l       .debug_str	00000000 
00001100 l       .debug_str	00000000 
00001109 l       .debug_str	00000000 
0000112d l       .debug_str	00000000 
00001137 l       .debug_str	00000000 
0000115f l       .debug_str	00000000 
00001168 l       .debug_str	00000000 
000011d2 l       .debug_str	00000000 
0000121b l       .debug_str	00000000 
0000127e l       .debug_str	00000000 
000012f1 l       .debug_str	00000000 
0000133c l       .debug_str	00000000 
00001347 l       .debug_str	00000000 
0000134d l       .debug_str	00000000 
00001353 l       .debug_str	00000000 
0000139b l       .debug_str	00000000 
000013a3 l       .debug_str	00000000 
000013ea l       .debug_str	00000000 
000013f3 l       .debug_str	00000000 
00001487 l       .debug_str	00000000 
000014e7 l       .debug_str	00000000 
00001575 l       .debug_str	00000000 
00001579 l       .debug_str	00000000 
0000160b l       .debug_str	00000000 
0000164f l       .debug_str	00000000 
000016bc l       .debug_str	00000000 
00001735 l       .debug_str	00000000 
000017a9 l       .debug_str	00000000 
000017b2 l       .debug_str	00000000 
000017be l       .debug_str	00000000 
000017d9 l       .debug_str	00000000 
000017db l       .debug_str	00000000 
0000185b l       .debug_str	00000000 
0000189f l       .debug_str	00000000 
000018de l       .debug_str	00000000 
00001920 l       .debug_str	00000000 
00001933 l       .debug_str	00000000 
0000193e l       .debug_str	00000000 
00001976 l       .debug_str	00000000 
00001985 l       .debug_str	00000000 
00001987 l       .debug_str	00000000 
0000198b l       .debug_str	00000000 
000019fb l       .debug_str	00000000 
00001a08 l       .debug_str	00000000 
00001a0e l       .debug_str	00000000 
00001a14 l       .debug_str	00000000 
00001aa0 l       .debug_str	00000000 
00001ab9 l       .debug_str	00000000 
00001af2 l       .debug_str	00000000 
00001b28 l       .debug_str	00000000 
00001b67 l       .debug_str	00000000 
00001b6e l       .debug_str	00000000 
00001b97 l       .debug_str	00000000 
00001b9e l       .debug_str	00000000 
00001ba0 l       .debug_str	00000000 
00001ba7 l       .debug_str	00000000 
00001bcd l       .debug_str	00000000 
00001bd4 l       .debug_str	00000000 
00001bdd l       .debug_str	00000000 
00001c07 l       .debug_str	00000000 
00001c0b l       .debug_str	00000000 
00001c0e l       .debug_str	00000000 
00001c72 l       .debug_str	00000000 
00001c7c l       .debug_str	00000000 
00001c81 l       .debug_str	00000000 
00001cfa l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.0	00000010 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.0
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.1	00000010 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.1
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.10	00000015 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.10
00000000 l     O .rodata.cst4	00000004 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.11
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.12	00000010 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.12
00000000 l     O .rodata.cst16	00000010 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.13
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.14	0000000b .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.14
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.15	00000010 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.15
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.3	00000008 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.3
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.4	00000000 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.4
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.5	00000001 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.5
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.6	00000023 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.6
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.7	0000002b .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.7
00000000 l     O .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.9	00000008 .Lanon.8ff178f6bd2c8b6593c7ec724bb70360.9
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h408a39571514bebeE	0000003a <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb991ee124beba006E	00000056 <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN4core3ptr18real_drop_in_place17h070bfcc240f83278E	00000002 core::ptr::real_drop_in_place
00000000 l     O .rodata.str.2	00000057 str.2
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h408a39571514bebeE	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h408a39571514bebeE
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb991ee124beba006E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb991ee124beba006E
00000000 l    d  .text._ZN4core3ptr18real_drop_in_place17h070bfcc240f83278E	00000000 .text._ZN4core3ptr18real_drop_in_place17h070bfcc240f83278E
00000000 l    d  .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hea2f60c52c056d12E	00000000 .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hea2f60c52c056d12E
00000000 l    d  .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h8e6a2a2a8e9f35e3E	00000000 .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h8e6a2a2a8e9f35e3E
00000000 l    d  .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17h4081b2271d74a704E	00000000 .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17h4081b2271d74a704E
00000000 l    d  .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E	00000000 .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E
00000000 l    d  .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h6f7f27e7b2bba444E	00000000 .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h6f7f27e7b2bba444E
00000000 l    d  .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h79d759d4acc302e9E	00000000 .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h79d759d4acc302e9E
00000000 l    d  .text._ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E	00000000 .text._ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E
00000000 l    d  .text._ZN9cstr_core4CStr19from_bytes_with_nul17h6003d014fb6ed675E	00000000 .text._ZN9cstr_core4CStr19from_bytes_with_nul17h6003d014fb6ed675E
00000000 l    d  .text._ZN9cstr_core4CStr6to_str17hd5952fda5bf1c004E	00000000 .text._ZN9cstr_core4CStr6to_str17hd5952fda5bf1c004E
00000000 l    d  .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE	00000000 .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE
00000000 l    d  .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E	00000000 .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E
00000000 l    d  .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E	00000000 .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E
00000000 l    d  .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h06e7275e2b27cfc5E	00000000 .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h06e7275e2b27cfc5E
00000000 l    d  .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd9b8ca36a3da57fE	00000000 .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd9b8ca36a3da57fE
00000000 l    d  .rodata.str.2	00000000 .rodata.str.2
00000000 l    d  .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.2	00000000 .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.2
00000000 l    d  .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.8	00000000 .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.8
00000000 l    d  .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.12	00000000 .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.12
00000000 l    d  .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.15	00000000 .rodata..Lanon.8ff178f6bd2c8b6593c7ec724bb70360.15
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17h4081b2271d74a704E	0000002c <cstr_core::ascii::EscapeDefault as core::iter::traits::double_ended::DoubleEndedIterator>::next_back
00000000         *UND*	00000000 core::fmt::num::imp::<impl core::fmt::Display for usize>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::LowerHex for usize>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::UpperHex for usize>::fmt
00000000         *UND*	00000000 core::fmt::builders::DebugTuple::field
00000000         *UND*	00000000 core::fmt::builders::DebugTuple::finish
00000000         *UND*	00000000 core::fmt::builders::DebugStruct::field
00000000         *UND*	00000000 core::fmt::builders::DebugStruct::finish
00000000         *UND*	00000000 core::fmt::Formatter::debug_tuple
00000000         *UND*	00000000 core::fmt::Formatter::debug_struct
00000000         *UND*	00000000 core::fmt::Formatter::debug_lower_hex
00000000         *UND*	00000000 core::fmt::Formatter::debug_upper_hex
00000000         *UND*	00000000 core::fmt::Formatter::write_fmt
00000000         *UND*	00000000 core::fmt::Formatter::write_str
00000000         *UND*	00000000 core::str::from_utf8
00000000         *UND*	00000000 core::slice::slice_index_len_fail
00000000         *UND*	00000000 core::panicking::panic_bounds_check
00000000 g     F .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E	00000050 <cstr_core::CStr as core::cmp::Ord>::cmp
00000000 g     F .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E	000001a2 <cstr_core::CStr as core::fmt::Debug>::fmt
00000000 g     F .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE	0000003e <cstr_core::CStr as core::cmp::PartialEq>::eq
00000000         *UND*	00000000 <core::fmt::Formatter as core::fmt::Write>::write_char
00000000 g     F .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E	00000050 <cstr_core::CStr as core::cmp::PartialOrd>::partial_cmp
00000000 g     F .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h6f7f27e7b2bba444E	0000000c <&cstr_core::CStr as core::default::Default>::default
00000000 g     F .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h06e7275e2b27cfc5E	00000040 <cstr_core::FromBytesWithNulError as core::fmt::Debug>::fmt
00000000         *UND*	00000000 memchr::fallback::memchr
00000000 g     F .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h79d759d4acc302e9E	00000082 <cstr_core::FromBytesWithNulError as core::fmt::Display>::fmt
00000000 g     F .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd9b8ca36a3da57fE	00000058 <cstr_core::FromBytesWithNulErrorKind as core::fmt::Debug>::fmt
00000000 g     F .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hea2f60c52c056d12E	0000002e <cstr_core::ascii::EscapeDefault as core::iter::traits::iterator::Iterator>::next
00000000 g     F .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h8e6a2a2a8e9f35e3E	00000016 <cstr_core::ascii::EscapeDefault as core::iter::traits::iterator::Iterator>::size_hint
00000000 g     F .text._ZN9cstr_core4CStr19from_bytes_with_nul17h6003d014fb6ed675E	00000038 cstr_core::CStr::from_bytes_with_nul
00000000 g     F .text._ZN9cstr_core4CStr6to_str17hd5952fda5bf1c004E	00000018 cstr_core::CStr::to_str
00000000 g     F .text._ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E	00000032 cstr_core::CStr::from_ptr
00000000         *UND*	00000000 memcmp



Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h408a39571514bebeE:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h408a39571514bebeE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h4ad837c30b835d03E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_lower_hex>
   c:	b128      	cbz	r0, 1a <<&T as core::fmt::Debug>::fmt+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::LowerHex for usize>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_upper_hex>
  20:	b128      	cbz	r0, 2e <<&T as core::fmt::Debug>::fmt+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::UpperHex for usize>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <core::fmt::num::imp::<impl core::fmt::Display for usize>::fmt>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb991ee124beba006E:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb991ee124beba006E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	6805      	ldr	r5, [r0, #0]
   6:	ac01      	add	r4, sp, #4
_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd9b8ca36a3da57fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
pub struct FromBytesWithNulError {
    kind: FromBytesWithNulErrorKind,
}

#[derive(Clone, PartialEq, Eq, Debug)]
   8:	6828      	ldr	r0, [r5, #0]
   a:	2801      	cmp	r0, #1
   c:	d10c      	bne.n	28 <<&T as core::fmt::Debug>::fmt+0x28>
   e:	f240 0200 	movw	r2, #0
  12:	4620      	mov	r0, r4
  14:	f2c0 0200 	movt	r2, #0
  18:	2310      	movs	r3, #16
  1a:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  1e:	4620      	mov	r0, r4
  20:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb991ee124beba006E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
  24:	b004      	add	sp, #16
  26:	bdb0      	pop	{r4, r5, r7, pc}
_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd9b8ca36a3da57fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
  28:	f240 0200 	movw	r2, #0
  2c:	4620      	mov	r0, r4
  2e:	f2c0 0200 	movt	r2, #0
  32:	230b      	movs	r3, #11
  34:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  38:	f240 0200 	movw	r2, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:327
enum FromBytesWithNulErrorKind {
    InteriorNul(usize),
  3c:	1d28      	adds	r0, r5, #4
  3e:	9000      	str	r0, [sp, #0]
  40:	4669      	mov	r1, sp
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
  42:	f2c0 0200 	movt	r2, #0
  46:	4620      	mov	r0, r4
  48:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::field>
  4c:	4620      	mov	r0, r4
  4e:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb991ee124beba006E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
  52:	b004      	add	sp, #16
  54:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN4core3ptr18real_drop_in_place17h070bfcc240f83278E:

00000000 <core::ptr::real_drop_in_place>:
_ZN4core3ptr18real_drop_in_place17h070bfcc240f83278E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:195
   0:	4770      	bx	lr

Disassembly of section .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hea2f60c52c056d12E:

00000000 <<cstr_core::ascii::EscapeDefault as core::iter::traits::iterator::Iterator>::next>:
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hea2f60c52c056d12E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:153
        fn next(&mut self) -> Option<u8> {
   0:	e9d0 1200 	ldrd	r1, r2, [r0]
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf396f0a65ad37774E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
   4:	4291      	cmp	r1, r2
   6:	d210      	bcs.n	2a <<cstr_core::ascii::EscapeDefault as core::iter::traits::iterator::Iterator>::next+0x2a>
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hdc2ea4f7a5fb8afbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
   8:	2904      	cmp	r1, #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
   a:	f101 0201 	add.w	r2, r1, #1
_ZN4core3ptr5write17hab612d41e6b8829cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:734
   e:	6002      	str	r2, [r0, #0]
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hdc2ea4f7a5fb8afbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
  10:	bf3f      	itttt	cc
  12:	4408      	addcc	r0, r1
  14:	7a01      	ldrbcc	r1, [r0, #8]
  16:	2001      	movcc	r0, #1
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hea2f60c52c056d12E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:155
        }
  18:	4770      	bxcc	lr
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hdc2ea4f7a5fb8afbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
  1a:	f240 0000 	movw	r0, #0
  1e:	2204      	movs	r2, #4
  20:	f2c0 0000 	movt	r0, #0
  24:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
  28:	defe      	udf	#254	; 0xfe
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hea2f60c52c056d12E():
  2a:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:155
        }
  2c:	4770      	bx	lr

Disassembly of section .text._ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h8e6a2a2a8e9f35e3E:

00000000 <<cstr_core::ascii::EscapeDefault as core::iter::traits::iterator::Iterator>::size_hint>:
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h8e6a2a2a8e9f35e3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:156
        fn size_hint(&self) -> (usize, Option<usize>) {
   0:	e9d1 2100 	ldrd	r2, r1, [r1]
   4:	2301      	movs	r3, #1
_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$13steps_between17ha1e310704f7ce508E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:72
   6:	4291      	cmp	r1, r2
   8:	bf98      	it	ls
   a:	4611      	movls	r1, r2
   c:	1a89      	subs	r1, r1, r2
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$9size_hint17h0a340bc097eca776E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:190
   e:	e9c0 1300 	strd	r1, r3, [r0]
  12:	6081      	str	r1, [r0, #8]
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$9size_hint17h8e6a2a2a8e9f35e3E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:158
        }
  14:	4770      	bx	lr

Disassembly of section .text._ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17h4081b2271d74a704E:

00000000 <<cstr_core::ascii::EscapeDefault as core::iter::traits::double_ended::DoubleEndedIterator>::next_back>:
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17h4081b2271d74a704E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:161
        fn next_back(&mut self) -> Option<u8> {
   0:	e9d0 2100 	ldrd	r2, r1, [r0]
_ZN4core4iter5range116_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$9next_back17he126702ba9e18867E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:242
   4:	428a      	cmp	r2, r1
   6:	d20f      	bcs.n	28 <<cstr_core::ascii::EscapeDefault as core::iter::traits::double_ended::DoubleEndedIterator>::next_back+0x28>
_ZN47_$LT$usize$u20$as$u20$core..ops..arith..Sub$GT$3sub17h81f89cb3777c4555E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ops/arith.rs:198
   8:	3901      	subs	r1, #1
_ZN4core4iter5range116_$LT$impl$u20$core..iter..traits..double_ended..DoubleEndedIterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$9next_back17he126702ba9e18867E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:243
   a:	6041      	str	r1, [r0, #4]
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back28_$u7b$$u7b$closure$u7d$$u7d$17h582662072a198d12E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:162
            self.range.next_back().map(|i| self.data[i])
   c:	2904      	cmp	r1, #4
   e:	bf3f      	itttt	cc
  10:	4408      	addcc	r0, r1
  12:	7a01      	ldrbcc	r1, [r0, #8]
  14:	2001      	movcc	r0, #1
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17h4081b2271d74a704E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:163
        }
  16:	4770      	bxcc	lr
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back28_$u7b$$u7b$closure$u7d$$u7d$17h582662072a198d12E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:162
            self.range.next_back().map(|i| self.data[i])
  18:	f240 0000 	movw	r0, #0
  1c:	2204      	movs	r2, #4
  1e:	f2c0 0000 	movt	r0, #0
  22:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
  26:	defe      	udf	#254	; 0xfe
_ZN105_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..double_ended..DoubleEndedIterator$GT$9next_back17h4081b2271d74a704E():
  28:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:163
        }
  2a:	4770      	bx	lr

Disassembly of section .text._ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E:

00000000 <<cstr_core::CStr as core::fmt::Debug>::fmt>:
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:670
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
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:671
        write!(f, "\"")?;
  2c:	4610      	mov	r0, r2
  2e:	4641      	mov	r1, r8
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  30:	960a      	str	r6, [sp, #40]	; 0x28
  32:	4693      	mov	fp, r2
  34:	f8cd a024 	str.w	sl, [sp, #36]	; 0x24
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:671
  38:	f7ff fffe 	bl	0 <core::fmt::Formatter::write_fmt>
  3c:	2800      	cmp	r0, #0
  3e:	f040 809b 	bne.w	178 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x178>
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
    /// assert_eq!(c_str.to_bytes(), b"foo");
    /// ```
    #[inline]
    pub fn to_bytes(&self) -> &[u8] {
        let bytes = self.to_bytes_with_nul();
        &bytes[..bytes.len() - 1]
  42:	1e78      	subs	r0, r7, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
  44:	2f00      	cmp	r7, #0
  46:	f000 80a8 	beq.w	19a <<cstr_core::CStr as core::fmt::Debug>::fmt+0x19a>
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h7ad7333a26abe875E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/collect.rs:246
  4a:	ab09      	add	r3, sp, #36	; 0x24
  4c:	f10d 0c0c 	add.w	ip, sp, #12
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hb6c67dc67cf77ac7E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  50:	182e      	adds	r6, r5, r0
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:672
        for byte in self.to_bytes()
  52:	f108 070c 	add.w	r7, r8, #12
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h7ad7333a26abe875E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/collect.rs:246
  56:	cb0e      	ldmia	r3, {r1, r2, r3}
  58:	f04f 0801 	mov.w	r8, #1
  5c:	e88c 000e 	stmia.w	ip, {r1, r2, r3}
  60:	ab06      	add	r3, sp, #24
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:672
  62:	f10d 0c30 	add.w	ip, sp, #48	; 0x30
_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17h7ad7333a26abe875E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/traits/collect.rs:246
  66:	cb0e      	ldmia	r3, {r1, r2, r3}
  68:	e88d 000e 	stmia.w	sp, {r1, r2, r3}
  6c:	2100      	movs	r1, #0
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:672
  6e:	ab03      	add	r3, sp, #12
  70:	910b      	str	r1, [sp, #44]	; 0x2c
  72:	e9cd 5609 	strd	r5, r6, [sp, #36]	; 0x24
  76:	910f      	str	r1, [sp, #60]	; 0x3c
  78:	cb0d      	ldmia	r3, {r0, r2, r3}
  7a:	e88c 000d 	stmia.w	ip, {r0, r2, r3}
  7e:	f10d 0c40 	add.w	ip, sp, #64	; 0x40
  82:	e89d 000d 	ldmia.w	sp, {r0, r2, r3}
  86:	e88c 000d 	stmia.w	ip, {r0, r2, r3}
_ZN116_$LT$core..iter..adapters..flatten..FlattenCompat$LT$I$C$U$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h754543db0356ca57E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/flatten.rs:216
  8a:	07c8      	lsls	r0, r1, #31
  8c:	d003      	beq.n	96 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x96>
  8e:	e9dd 100c 	ldrd	r1, r0, [sp, #48]	; 0x30
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf396f0a65ad37774E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
  92:	4281      	cmp	r1, r0
  94:	d33f      	bcc.n	116 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x116>
_ZN85_$LT$core..slice..Iter$LT$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h90a9738c1c22b8b9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:3082
  96:	4628      	mov	r0, r5
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:3086
  98:	42b5      	cmp	r5, r6
  9a:	f000 8060 	beq.w	15e <<cstr_core::CStr as core::fmt::Debug>::fmt+0x15e>
  9e:	7802      	ldrb	r2, [r0, #0]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17hb6c67dc67cf77ac7E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  a0:	1c45      	adds	r5, r0, #1
_ZN4core5slice13Iter$LT$T$GT$14post_inc_start17hf6c0cf8dc1292bfdE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:3041
  a2:	9509      	str	r5, [sp, #36]	; 0x24
_ZN9cstr_core5ascii14escape_default17heaf129901b0e87c0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:128
            b'\t' => ([b'\\', b't', 0, 0], 2),
  a4:	f1a2 0309 	sub.w	r3, r2, #9
  a8:	2b1e      	cmp	r3, #30
  aa:	d817      	bhi.n	dc <<cstr_core::CStr as core::fmt::Debug>::fmt+0xdc>
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
  da:	e014      	b.n	106 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x106>
  dc:	2a5c      	cmp	r2, #92	; 0x5c
  de:	d102      	bne.n	e6 <<cstr_core::CStr as core::fmt::Debug>::fmt+0xe6>
  e0:	f645 415c 	movw	r1, #23644	; 0x5c5c
  e4:	e00f      	b.n	106 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x106>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:134
            b'\x20'...b'\x7e' => ([c, 0, 0, 0], 1),
  e6:	f1a2 0020 	sub.w	r0, r2, #32
  ea:	b2c0      	uxtb	r0, r0
  ec:	285f      	cmp	r0, #95	; 0x5f
  ee:	d221      	bcs.n	134 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x134>
_ZN116_$LT$core..iter..adapters..flatten..FlattenCompat$LT$I$C$U$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h754543db0356ca57E():
  f0:	2001      	movs	r0, #1
  f2:	4611      	mov	r1, r2
  f4:	e008      	b.n	108 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x108>
  f6:	f242 715c 	movw	r1, #10076	; 0x275c
  fa:	e004      	b.n	106 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x106>
  fc:	f247 215c 	movw	r1, #29276	; 0x725c
 100:	e001      	b.n	106 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x106>
 102:	f242 215c 	movw	r1, #8796	; 0x225c
 106:	2002      	movs	r0, #2
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/adapters/flatten.rs:221
 108:	e9cd 010d 	strd	r0, r1, [sp, #52]	; 0x34
 10c:	2100      	movs	r1, #0
 10e:	e9cd 810b 	strd	r8, r1, [sp, #44]	; 0x2c
_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hf396f0a65ad37774E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/iter/range.rs:171
 112:	4281      	cmp	r1, r0
 114:	d2bf      	bcs.n	96 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x96>
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hdc2ea4f7a5fb8afbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
 116:	2904      	cmp	r1, #4
_ZN4core3num23_$LT$impl$u20$usize$GT$15overflowing_add17hde7e9fa4130a5804E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3349
 118:	f101 0001 	add.w	r0, r1, #1
_ZN4core3ptr5write17hab612d41e6b8829cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:734
 11c:	900c      	str	r0, [sp, #48]	; 0x30
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hdc2ea4f7a5fb8afbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
 11e:	d234      	bcs.n	18a <<cstr_core::CStr as core::fmt::Debug>::fmt+0x18a>
 120:	1878      	adds	r0, r7, r1
 122:	7a01      	ldrb	r1, [r0, #8]
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:676
            f.write_char(byte as char)?;
 124:	4658      	mov	r0, fp
 126:	f7ff fffe 	bl	0 <<core::fmt::Formatter as core::fmt::Write>::write_char>
 12a:	2101      	movs	r1, #1
 12c:	2800      	cmp	r0, #0
 12e:	f43f afac 	beq.w	8a <<cstr_core::CStr as core::fmt::Debug>::fmt+0x8a>
 132:	e025      	b.n	180 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x180>
_ZN9cstr_core5ascii14escape_default17heaf129901b0e87c0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:135
            _ => ([b'\\', b'x', hexify(c >> 4), hexify(c & 0xf)], 4),
 134:	f002 000f 	and.w	r0, r2, #15
_ZN9cstr_core5ascii14escape_default6hexify17hd36ec8af4ab1f057E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:145
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
_ZN9cstr_core5ascii14escape_default17heaf129901b0e87c0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:135
            _ => ([b'\\', b'x', hexify(c >> 4), hexify(c & 0xf)], 4),
 14e:	0409      	lsls	r1, r1, #16
 150:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
 154:	f647 015c 	movw	r1, #30812	; 0x785c
 158:	4301      	orrs	r1, r0
 15a:	2004      	movs	r0, #4
 15c:	e7d4      	b.n	108 <<cstr_core::CStr as core::fmt::Debug>::fmt+0x108>
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
 15e:	2000      	movs	r0, #0
 160:	a909      	add	r1, sp, #36	; 0x24
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 162:	e9cd 900d 	strd	r9, r0, [sp, #52]	; 0x34
 166:	e9cd 000b 	strd	r0, r0, [sp, #44]	; 0x2c
 16a:	2001      	movs	r0, #1
 16c:	e9cd a009 	strd	sl, r0, [sp, #36]	; 0x24
_ZN52_$LT$cstr_core..CStr$u20$as$u20$core..fmt..Debug$GT$3fmt17h8842e40ee149e7b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:678
        write!(f, "\"")
 170:	4658      	mov	r0, fp
 172:	f7ff fffe 	bl	0 <core::fmt::Formatter::write_fmt>
 176:	4606      	mov	r6, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:679
    }
 178:	4630      	mov	r0, r6
 17a:	b013      	add	sp, #76	; 0x4c
 17c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 180:	2601      	movs	r6, #1
 182:	4630      	mov	r0, r6
 184:	b013      	add	sp, #76	; 0x4c
 186:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_ZN90_$LT$cstr_core..ascii..EscapeDefault$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next28_$u7b$$u7b$closure$u7d$$u7d$17hdc2ea4f7a5fb8afbE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:154
            self.range.next().map(|i| self.data[i])
 18a:	f240 0000 	movw	r0, #0
 18e:	2204      	movs	r2, #4
 190:	f2c0 0000 	movt	r0, #0
 194:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 198:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
 19a:	2100      	movs	r1, #0
 19c:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
 1a0:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h6f7f27e7b2bba444E:

00000000 <<&cstr_core::CStr as core::default::Default>::default>:
_ZN62_$LT$$RF$cstr_core..CStr$u20$as$u20$core..default..Default$GT$7default17h6f7f27e7b2bba444E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:686
    }
   0:	f240 0000 	movw	r0, #0
   4:	2101      	movs	r1, #1
   6:	f2c0 0000 	movt	r0, #0
   a:	4770      	bx	lr

Disassembly of section .text._ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h79d759d4acc302e9E:

00000000 <<cstr_core::FromBytesWithNulError as core::fmt::Display>::fmt>:
_ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h79d759d4acc302e9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:820
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b08a      	sub	sp, #40	; 0x28
   4:	4605      	mov	r5, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:822
            FromBytesWithNulErrorKind::InteriorNul(..) => {
   6:	6800      	ldr	r0, [r0, #0]
   8:	460c      	mov	r4, r1
   a:	2801      	cmp	r0, #1
   c:	d10d      	bne.n	2a <<cstr_core::FromBytesWithNulError as core::fmt::Display>::fmt+0x2a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:826
                f.write_str("data provided is not nul terminated")?
   e:	f240 0100 	movw	r1, #0
  12:	4620      	mov	r0, r4
  14:	f2c0 0100 	movt	r1, #0
  18:	2223      	movs	r2, #35	; 0x23
  1a:	f7ff fffe 	bl	0 <core::fmt::Formatter::write_str>
  1e:	2800      	cmp	r0, #0
  20:	bf0c      	ite	eq
  22:	2000      	moveq	r0, #0
  24:	2001      	movne	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:833
    }
  26:	b00a      	add	sp, #40	; 0x28
  28:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:823
                f.write_str("data provided contains an interior nul byte")?
  2a:	f240 0100 	movw	r1, #0
  2e:	4620      	mov	r0, r4
  30:	f2c0 0100 	movt	r1, #0
  34:	222b      	movs	r2, #43	; 0x2b
  36:	f7ff fffe 	bl	0 <core::fmt::Formatter::write_str>
  3a:	4601      	mov	r1, r0
  3c:	2001      	movs	r0, #1
  3e:	b109      	cbz	r1, 44 <<cstr_core::FromBytesWithNulError as core::fmt::Display>::fmt+0x44>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:833
    }
  40:	b00a      	add	sp, #40	; 0x28
  42:	bdb0      	pop	{r4, r5, r7, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:829
        if let FromBytesWithNulErrorKind::InteriorNul(pos) = self.kind {
  44:	6869      	ldr	r1, [r5, #4]
  46:	9101      	str	r1, [sp, #4]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:830
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
_ZN71_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Display$GT$3fmt17h79d759d4acc302e9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:830
  70:	4620      	mov	r0, r4
  72:	f7ff fffe 	bl	0 <core::fmt::Formatter::write_fmt>
  76:	2800      	cmp	r0, #0
  78:	bf0c      	ite	eq
  7a:	2000      	moveq	r0, #0
  7c:	2001      	movne	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:833
    }
  7e:	b00a      	add	sp, #40	; 0x28
  80:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E:

00000000 <cstr_core::CStr::from_ptr>:
_ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:895
    pub unsafe fn from_ptr<'a>(ptr: *const c_char) -> &'a CStr {
   0:	2100      	movs	r1, #0
   2:	e004      	b.n	e <cstr_core::CStr::from_ptr+0xe>
_ZN9cstr_core6strlen17h56117eb05d4584bdE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
   4:	78d2      	ldrb	r2, [r2, #3]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:50
        n += 1;
   6:	3104      	adds	r1, #4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
   8:	2a00      	cmp	r2, #0
_ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
   a:	bf08      	it	eq
   c:	4770      	bxeq	lr
_ZN9cstr_core6strlen17h56117eb05d4584bdE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
   e:	5c42      	ldrb	r2, [r0, r1]
  10:	2a00      	cmp	r2, #0
  12:	bf04      	itt	eq
  14:	f041 0101 	orreq.w	r1, r1, #1
_ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
  18:	4770      	bxeq	lr
_ZN9cstr_core6strlen17h56117eb05d4584bdE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
  1a:	1842      	adds	r2, r0, r1
  1c:	7853      	ldrb	r3, [r2, #1]
  1e:	2b00      	cmp	r3, #0
  20:	bf04      	itt	eq
  22:	f041 0102 	orreq.w	r1, r1, #2
_ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
  26:	4770      	bxeq	lr
_ZN9cstr_core6strlen17h56117eb05d4584bdE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:49
    while *p.offset(n as isize) != 0 {
  28:	7893      	ldrb	r3, [r2, #2]
  2a:	2b00      	cmp	r3, #0
  2c:	d1ea      	bne.n	4 <cstr_core::CStr::from_ptr+0x4>
  2e:	3103      	adds	r1, #3
_ZN9cstr_core4CStr8from_ptr17h8dd780023dafede8E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:899
    }
  30:	4770      	bx	lr

Disassembly of section .text._ZN9cstr_core4CStr19from_bytes_with_nul17h6003d014fb6ed675E:

00000000 <cstr_core::CStr::from_bytes_with_nul>:
_ZN9cstr_core4CStr19from_bytes_with_nul17h6003d014fb6ed675E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:933
    pub fn from_bytes_with_nul(bytes: &[u8]) -> Result<&CStr, FromBytesWithNulError> {
   0:	b570      	push	{r4, r5, r6, lr}
   2:	4604      	mov	r4, r0
_ZN6memchr6memchr17hbdd57b7991187ca7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/lib.rs:156
    #[inline(always)]
    fn imp(n1: u8, haystack: &[u8]) -> Option<usize> {
        fallback::memchr(n1, haystack)
    }

    if haystack.is_empty() {
   4:	b172      	cbz	r2, 24 <cstr_core::CStr::from_bytes_with_nul+0x24>
_ZN6memchr6memchr3imp17h795fbb828ab63f9eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/lib.rs:153
        fallback::memchr(n1, haystack)
   6:	2000      	movs	r0, #0
   8:	4615      	mov	r5, r2
   a:	460e      	mov	r6, r1
   c:	f7ff fffe 	bl	0 <memchr::fallback::memchr>
_ZN9cstr_core4CStr19from_bytes_with_nul17h6003d014fb6ed675E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:935
        if let Some(nul_pos) = nul_pos {
  10:	2801      	cmp	r0, #1
  12:	d107      	bne.n	24 <cstr_core::CStr::from_bytes_with_nul+0x24>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:936
            if nul_pos + 1 != bytes.len() {
  14:	1c48      	adds	r0, r1, #1
  16:	42a8      	cmp	r0, r5
  18:	d108      	bne.n	2c <cstr_core::CStr::from_bytes_with_nul+0x2c>
  1a:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:939
            Ok(unsafe { CStr::from_bytes_with_nul_unchecked(bytes) })
  1c:	e9c4 6501 	strd	r6, r5, [r4, #4]
  20:	6020      	str	r0, [r4, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:943
    }
  22:	bd70      	pop	{r4, r5, r6, pc}
  24:	2001      	movs	r0, #1
  26:	e9c4 0000 	strd	r0, r0, [r4]
  2a:	bd70      	pop	{r4, r5, r6, pc}
  2c:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:937
                return Err(FromBytesWithNulError::interior_nul(nul_pos));
  2e:	e9c4 0101 	strd	r0, r1, [r4, #4]
  32:	2001      	movs	r0, #1
  34:	6020      	str	r0, [r4, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:943
    }
  36:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN9cstr_core4CStr6to_str17hd5952fda5bf1c004E:

00000000 <cstr_core::CStr::to_str>:
_ZN9cstr_core4CStr6to_str17hd5952fda5bf1c004E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1080
    /// use cstr_core::CStr;
    ///
    /// let c_str = CStr::from_bytes_with_nul(b"foo\0").unwrap();
    /// assert_eq!(c_str.to_str(), Ok("foo"));
    /// ```
    pub fn to_str(&self) -> Result<&str, Utf8Error> {
   0:	b580      	push	{r7, lr}
   2:	4613      	mov	r3, r2
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   4:	3a01      	subs	r2, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   6:	b113      	cbz	r3, e <cstr_core::CStr::to_str+0xe>
_ZN9cstr_core4CStr6to_str17hd5952fda5bf1c004E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1085
        // NB: When CStr is changed to perform the length check in .to_bytes()
        // instead of in from_ptr(), it may be worth considering if this should
        // be rewritten to do the UTF-8 check inline with the length calculation
        // instead of doing it afterwards.
        str::from_utf8(self.to_bytes())
   8:	f7ff fffe 	bl	0 <core::str::from_utf8>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1086
    }
   c:	bd80      	pop	{r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
   e:	4610      	mov	r0, r2
  10:	2100      	movs	r1, #0
  12:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
  16:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE:

00000000 <<cstr_core::CStr as core::cmp::PartialEq>::eq>:
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1156
        }
    }
}

impl PartialEq for CStr {
    fn eq(&self, other: &CStr) -> bool {
   0:	b580      	push	{r7, lr}
   2:	4694      	mov	ip, r2
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   4:	1e4a      	subs	r2, r1, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   6:	b181      	cbz	r1, 2a <<cstr_core::CStr as core::cmp::PartialEq>::eq+0x2a>
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
   8:	1e59      	subs	r1, r3, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   a:	b19b      	cbz	r3, 34 <<cstr_core::CStr as core::cmp::PartialEq>::eq+0x34>
_ZN68_$LT$$u5b$A$u5d$$u20$as$u20$core..slice..SlicePartialEq$LT$A$GT$$GT$5equal17h6158e9f6e134098aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5242
   c:	428a      	cmp	r2, r1
   e:	bf1c      	itt	ne
  10:	2000      	movne	r0, #0
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1158
        self.to_bytes().eq(other.to_bytes())
    }
  12:	bd80      	popne	{r7, pc}
_ZN68_$LT$$u5b$A$u5d$$u20$as$u20$core..slice..SlicePartialEq$LT$A$GT$$GT$5equal17h6158e9f6e134098aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5245
  14:	4560      	cmp	r0, ip
  16:	d006      	beq.n	26 <<cstr_core::CStr as core::cmp::PartialEq>::eq+0x26>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5250
  18:	4661      	mov	r1, ip
  1a:	f7ff fffe 	bl	0 <memcmp>
  1e:	fab0 f080 	clz	r0, r0
  22:	0940      	lsrs	r0, r0, #5
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1158
  24:	bd80      	pop	{r7, pc}
  26:	2001      	movs	r0, #1
  28:	bd80      	pop	{r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  2a:	4610      	mov	r0, r2
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE():
  2c:	2100      	movs	r1, #0
  2e:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
  32:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  34:	4608      	mov	r0, r1
_ZN56_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialEq$GT$2eq17h798b42703b6d984fE():
  36:	2100      	movs	r1, #0
  38:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
  3c:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E:

00000000 <<cstr_core::CStr as core::cmp::PartialOrd>::partial_cmp>:
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1162
}
impl Eq for CStr {}
impl PartialOrd for CStr {
    fn partial_cmp(&self, other: &CStr) -> Option<Ordering> {
   0:	b5b0      	push	{r4, r5, r7, lr}
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   2:	1e4c      	subs	r4, r1, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   4:	b1d1      	cbz	r1, 3c <<cstr_core::CStr as core::cmp::PartialOrd>::partial_cmp+0x3c>
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
   6:	1e5d      	subs	r5, r3, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   8:	b1eb      	cbz	r3, 46 <<cstr_core::CStr as core::cmp::PartialOrd>::partial_cmp+0x46>
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E():
   a:	4694      	mov	ip, r2
_ZN4core3cmp3Ord3min17h03d010af1e2c3392E():
   c:	4622      	mov	r2, r4
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
   e:	4661      	mov	r1, ip
_ZN4core3cmp3Ord3min17h03d010af1e2c3392E():
  10:	42ac      	cmp	r4, r5
  12:	bf88      	it	hi
  14:	462a      	movhi	r2, r5
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
  16:	f7ff fffe 	bl	0 <memcmp>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5329
  1a:	2800      	cmp	r0, #0
  1c:	d005      	beq.n	2a <<cstr_core::CStr as core::cmp::PartialOrd>::partial_cmp+0x2a>
  1e:	f04f 0001 	mov.w	r0, #1
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5331
  22:	bfb8      	it	lt
  24:	f04f 30ff 	movlt.w	r0, #4294967295	; 0xffffffff
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1164
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
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1164
  3a:	bdb0      	pop	{r4, r5, r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  3c:	4620      	mov	r0, r4
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E():
  3e:	2100      	movs	r1, #0
  40:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
  44:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  46:	4628      	mov	r0, r5
_ZN57_$LT$cstr_core..CStr$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h4494d21be78637d9E():
  48:	2100      	movs	r1, #0
  4a:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
  4e:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E:

00000000 <<cstr_core::CStr as core::cmp::Ord>::cmp>:
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1167
}
impl Ord for CStr {
    fn cmp(&self, other: &CStr) -> Ordering {
   0:	b5b0      	push	{r4, r5, r7, lr}
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
        &bytes[..bytes.len() - 1]
   2:	1e4c      	subs	r4, r1, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   4:	b1d1      	cbz	r1, 3c <<cstr_core::CStr as core::cmp::Ord>::cmp+0x3c>
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
   6:	1e5d      	subs	r5, r3, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
   8:	b1eb      	cbz	r3, 46 <<cstr_core::CStr as core::cmp::Ord>::cmp+0x46>
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E():
   a:	4694      	mov	ip, r2
_ZN4core3cmp3Ord3min17h03d010af1e2c3392E():
   c:	4622      	mov	r2, r4
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
   e:	4661      	mov	r1, ip
_ZN4core3cmp3Ord3min17h03d010af1e2c3392E():
  10:	42ac      	cmp	r4, r5
  12:	bf88      	it	hi
  14:	462a      	movhi	r2, r5
_ZN64_$LT$$u5b$u8$u5d$$u20$as$u20$core..slice..SliceOrd$LT$u8$GT$$GT$7compare17hfda3e932e5442d1dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5326
  16:	f7ff fffe 	bl	0 <memcmp>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5329
  1a:	2800      	cmp	r0, #0
  1c:	d005      	beq.n	2a <<cstr_core::CStr as core::cmp::Ord>::cmp+0x2a>
  1e:	f04f 0001 	mov.w	r0, #1
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:5331
  22:	bfb8      	it	lt
  24:	f04f 30ff 	movlt.w	r0, #4294967295	; 0xffffffff
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1169
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
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1169
  3a:	bdb0      	pop	{r4, r5, r7, pc}
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  3c:	4620      	mov	r0, r4
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E():
  3e:	2100      	movs	r1, #0
  40:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
  44:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h2f7697f004fab061E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
  46:	4628      	mov	r0, r5
_ZN50_$LT$cstr_core..CStr$u20$as$u20$core..cmp..Ord$GT$3cmp17h120141077cf3fe08E():
  48:	2100      	movs	r1, #0
  4a:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
  4e:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h06e7275e2b27cfc5E:

00000000 <<cstr_core::FromBytesWithNulError as core::fmt::Debug>::fmt>:
_ZN69_$LT$cstr_core..FromBytesWithNulError$u20$as$u20$core..fmt..Debug$GT$3fmt17h06e7275e2b27cfc5E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:320
#[derive(Clone, PartialEq, Eq, Debug)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	ad01      	add	r5, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	4604      	mov	r4, r0
   c:	f2c0 0200 	movt	r2, #0
  10:	4628      	mov	r0, r5
  12:	2315      	movs	r3, #21
  14:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_struct>
  18:	f240 0000 	movw	r0, #0
  1c:	f240 0100 	movw	r1, #0
  20:	f2c0 0000 	movt	r0, #0
  24:	ab03      	add	r3, sp, #12
  26:	9000      	str	r0, [sp, #0]
  28:	f2c0 0100 	movt	r1, #0
  2c:	4628      	mov	r0, r5
  2e:	2204      	movs	r2, #4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:322
    kind: FromBytesWithNulErrorKind,
  30:	9403      	str	r4, [sp, #12]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:320
#[derive(Clone, PartialEq, Eq, Debug)]
  32:	f7ff fffe 	bl	0 <core::fmt::builders::DebugStruct::field>
  36:	4628      	mov	r0, r5
  38:	f7ff fffe 	bl	0 <core::fmt::builders::DebugStruct::finish>
  3c:	b004      	add	sp, #16
  3e:	bdb0      	pop	{r4, r5, r7, pc}

Disassembly of section .text._ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd9b8ca36a3da57fE:

00000000 <<cstr_core::FromBytesWithNulErrorKind as core::fmt::Debug>::fmt>:
_ZN73_$LT$cstr_core..FromBytesWithNulErrorKind$u20$as$u20$core..fmt..Debug$GT$3fmt17hbd9b8ca36a3da57fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	b084      	sub	sp, #16
   4:	4604      	mov	r4, r0
   6:	6800      	ldr	r0, [r0, #0]
   8:	2801      	cmp	r0, #1
   a:	d10d      	bne.n	28 <<cstr_core::FromBytesWithNulErrorKind as core::fmt::Debug>::fmt+0x28>
   c:	ac01      	add	r4, sp, #4
   e:	f240 0200 	movw	r2, #0
  12:	f2c0 0200 	movt	r2, #0
  16:	2310      	movs	r3, #16
  18:	4620      	mov	r0, r4
  1a:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  1e:	4620      	mov	r0, r4
  20:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  24:	b004      	add	sp, #16
  26:	bdb0      	pop	{r4, r5, r7, pc}
  28:	ad01      	add	r5, sp, #4
  2a:	f240 0200 	movw	r2, #0
  2e:	f2c0 0200 	movt	r2, #0
  32:	230b      	movs	r3, #11
  34:	4628      	mov	r0, r5
  36:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  3a:	f240 0200 	movw	r2, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:327
    InteriorNul(usize),
  3e:	1d20      	adds	r0, r4, #4
  40:	9000      	str	r0, [sp, #0]
  42:	4669      	mov	r1, sp
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:325
#[derive(Clone, PartialEq, Eq, Debug)]
  44:	f2c0 0200 	movt	r2, #0
  48:	4628      	mov	r0, r5
  4a:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::field>
  4e:	4628      	mov	r0, r5
  50:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  54:	b004      	add	sp, #16
  56:	bdb0      	pop	{r4, r5, r7, pc}

cty-30fd3ac5a8e2432f.cty.2q2s446n-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cty.2q2s446n-cgu.0



cty-dc10dbba77bee408.cty.41dx79zg-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 cty.41dx79zg-cgu.0



generic_array-43bceb8b27b86816.generic_array.4b3lo0bb-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 generic_array.4b3lo0bb-cgu.0
000003f2 l       .debug_str	00000000 
00000469 l       .debug_str	00000000 
00000483 l       .debug_str	00000000 
000004e1 l       .debug_str	00000000 
000004ec l       .debug_str	00000000 
00000509 l       .debug_str	00000000 
00000522 l       .debug_str	00000000 
0000052c l       .debug_str	00000000 
0000055e l       .debug_str	00000000 
00000565 l       .debug_str	00000000 
000005a3 l       .debug_str	00000000 
000005b9 l       .debug_str	00000000 
000005bb l       .debug_str	00000000 
000005c4 l       .debug_str	00000000 
000005c9 l       .debug_str	00000000 
000005d0 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000009e l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
000000fe l       .debug_str	00000000 
00000102 l       .debug_str	00000000 
0000010e l       .debug_str	00000000 
00000117 l       .debug_str	00000000 
0000011a l       .debug_str	00000000 
00000124 l       .debug_str	00000000 
0000012b l       .debug_str	00000000 
00000131 l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
0000016f l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
000001b3 l       .debug_str	00000000 
000001b8 l       .debug_str	00000000 
000001bf l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001c6 l       .debug_str	00000000 
000001cd l       .debug_str	00000000 
000001d1 l       .debug_str	00000000 
000001d4 l       .debug_str	00000000 
000001d7 l       .debug_str	00000000 
000001dc l       .debug_str	00000000 
000001e2 l       .debug_str	00000000 
000001e9 l       .debug_str	00000000 
000001f1 l       .debug_str	00000000 
000001fb l       .debug_str	00000000 
00000202 l       .debug_str	00000000 
00000207 l       .debug_str	00000000 
00000213 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
00000222 l       .debug_str	00000000 
00000226 l       .debug_str	00000000 
0000022b l       .debug_str	00000000 
00000234 l       .debug_str	00000000 
00000239 l       .debug_str	00000000 
0000023c l       .debug_str	00000000 
00000240 l       .debug_str	00000000 
00000249 l       .debug_str	00000000 
00000250 l       .debug_str	00000000 
00000255 l       .debug_str	00000000 
0000025a l       .debug_str	00000000 
00000260 l       .debug_str	00000000 
00000266 l       .debug_str	00000000 
00000270 l       .debug_str	00000000 
00000273 l       .debug_str	00000000 
00000279 l       .debug_str	00000000 
00000283 l       .debug_str	00000000 
0000028b l       .debug_str	00000000 
00000291 l       .debug_str	00000000 
00000297 l       .debug_str	00000000 
000002a2 l       .debug_str	00000000 
000002ab l       .debug_str	00000000 
000002ce l       .debug_str	00000000 
000002ed l       .debug_str	00000000 
000002ef l       .debug_str	00000000 
000002f4 l       .debug_str	00000000 
0000031b l       .debug_str	00000000 
00000320 l       .debug_str	00000000 
00000326 l       .debug_str	00000000 
0000032c l       .debug_str	00000000 
0000032f l       .debug_str	00000000 
0000033e l       .debug_str	00000000 
00000345 l       .debug_str	00000000 
00000349 l       .debug_str	00000000 
00000352 l       .debug_str	00000000 
0000035a l       .debug_str	00000000 
00000362 l       .debug_str	00000000 
00000369 l       .debug_str	00000000 
0000037d l       .debug_str	00000000 
00000389 l       .debug_str	00000000 
00000395 l       .debug_str	00000000 
000003ae l       .debug_str	00000000 
000003b3 l       .debug_str	00000000 
000003c4 l       .debug_str	00000000 
000003ce l       .debug_str	00000000 
000003dc l       .debug_str	00000000 
000003e0 l       .debug_str	00000000 
000003eb l       .debug_str	00000000 
000003f8 l       .debug_str	00000000 
000003fc l       .debug_str	00000000 
00000400 l       .debug_str	00000000 
00000408 l       .debug_str	00000000 
0000041f l       .debug_str	00000000 
00000443 l       .debug_str	00000000 
0000045f l       .debug_str	00000000 
00000000 l     O .rodata.cst16	00000010 .Lanon.6ffe82a7e693133c45f4f2de6f51803c.0
00000010 l     O .rodata.cst16	00000010 .Lanon.6ffe82a7e693133c45f4f2de6f51803c.1
00000000 l     O .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.4	00000010 .Lanon.6ffe82a7e693133c45f4f2de6f51803c.4
00000000 l     O .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.6	00000010 .Lanon.6ffe82a7e693133c45f4f2de6f51803c.6
00000000 l    d  .text._ZN13generic_array21from_iter_length_fail17h88581819bb7e565bE	00000000 .text._ZN13generic_array21from_iter_length_fail17h88581819bb7e565bE
00000000 l    d  .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.2	00000000 .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.2
00000000 l    d  .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.3	00000000 .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.3
00000000 l    d  .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.5	00000000 .rodata..Lanon.6ffe82a7e693133c45f4f2de6f51803c.5
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN13generic_array21from_iter_length_fail17h88581819bb7e565bE	00000044 generic_array::from_iter_length_fail
00000000 g     O .rodata._ZN13generic_array3hex11LOWER_CHARS17h55409b6ffb5086c2E	00000008 generic_array::hex::LOWER_CHARS
00000000 g     O .rodata._ZN13generic_array3hex11UPPER_CHARS17h513baed1de8a0e9cE	00000008 generic_array::hex::UPPER_CHARS
00000000         *UND*	00000000 core::fmt::num::imp::<impl core::fmt::Display for usize>::fmt
00000000         *UND*	00000000 core::panicking::panic_fmt



Disassembly of section .text._ZN13generic_array21from_iter_length_fail17h88581819bb7e565bE:

00000000 <generic_array::from_iter_length_fail>:
_ZN13generic_array21from_iter_length_fail17h88581819bb7e565bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:319
    }
}

#[inline(never)]
#[cold]
fn from_iter_length_fail(length: usize, expected: usize) -> ! {
   0:	b08c      	sub	sp, #48	; 0x30
   2:	e9cd 0100 	strd	r0, r1, [sp]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:320
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
_ZN13generic_array21from_iter_length_fail17h88581819bb7e565bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:320
  32:	f240 0100 	movw	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  36:	9002      	str	r0, [sp, #8]
  38:	a802      	add	r0, sp, #8
_ZN13generic_array21from_iter_length_fail17h88581819bb7e565bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/generic-array-0.12.0/src/lib.rs:320
  3a:	f2c0 0100 	movt	r1, #0
  3e:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
  42:	defe      	udf	#254	; 0xfe

memchr-91277b16307c71e0.memchr.5ka8y02u-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 memchr.5ka8y02u-cgu.0
00000907 l       .debug_str	00000000 
00000b0d l       .debug_str	00000000 
00000b3d l       .debug_str	00000000 
00000b6d l       .debug_str	00000000 
00000b9d l       .debug_str	00000000 
00000ba5 l       .debug_str	00000000 
00000bd6 l       .debug_str	00000000 
00000c07 l       .debug_str	00000000 
00000c10 l       .debug_str	00000000 
00000c16 l       .debug_str	00000000 
00000c1c l       .debug_str	00000000 
00000c20 l       .debug_str	00000000 
00000c2a l       .debug_str	00000000 
00000c2e l       .debug_str	00000000 
00000c32 l       .debug_str	00000000 
00000c36 l       .debug_str	00000000 
00000c3a l       .debug_str	00000000 
00000c3e l       .debug_str	00000000 
00000c42 l       .debug_str	00000000 
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
0000012f l       .debug_str	00000000 
00000138 l       .debug_str	00000000 
0000013a l       .debug_str	00000000 
00000185 l       .debug_str	00000000 
00000190 l       .debug_str	00000000 
0000019a l       .debug_str	00000000 
0000019f l       .debug_str	00000000 
000001a5 l       .debug_str	00000000 
000001ab l       .debug_str	00000000 
000001f3 l       .debug_str	00000000 
000001fb l       .debug_str	00000000 
00000201 l       .debug_str	00000000 
00000207 l       .debug_str	00000000 
00000293 l       .debug_str	00000000 
000002a5 l       .debug_str	00000000 
000002ae l       .debug_str	00000000 
000002b5 l       .debug_str	00000000 
000002bb l       .debug_str	00000000 
000002bf l       .debug_str	00000000 
000002c5 l       .debug_str	00000000 
000002cb l       .debug_str	00000000 
000002cf l       .debug_str	00000000 
000002d3 l       .debug_str	00000000 
000002e0 l       .debug_str	00000000 
00000363 l       .debug_str	00000000 
0000036d l       .debug_str	00000000 
000003f5 l       .debug_str	00000000 
00000406 l       .debug_str	00000000 
00000408 l       .debug_str	00000000 
0000047d l       .debug_str	00000000 
000004aa l       .debug_str	00000000 
000004b0 l       .debug_str	00000000 
000004b7 l       .debug_str	00000000 
000004c0 l       .debug_str	00000000 
000004f5 l       .debug_str	00000000 
00000501 l       .debug_str	00000000 
00000503 l       .debug_str	00000000 
00000507 l       .debug_str	00000000 
0000050b l       .debug_str	00000000 
00000513 l       .debug_str	00000000 
00000515 l       .debug_str	00000000 
0000054d l       .debug_str	00000000 
00000565 l       .debug_str	00000000 
0000056c l       .debug_str	00000000 
00000570 l       .debug_str	00000000 
00000575 l       .debug_str	00000000 
0000057a l       .debug_str	00000000 
00000588 l       .debug_str	00000000 
00000592 l       .debug_str	00000000 
0000059a l       .debug_str	00000000 
000005a2 l       .debug_str	00000000 
000005ad l       .debug_str	00000000 
000005eb l       .debug_str	00000000 
00000603 l       .debug_str	00000000 
00000607 l       .debug_str	00000000 
0000060b l       .debug_str	00000000 
00000613 l       .debug_str	00000000 
00000651 l       .debug_str	00000000 
00000666 l       .debug_str	00000000 
00000668 l       .debug_str	00000000 
0000066c l       .debug_str	00000000 
000006b4 l       .debug_str	00000000 
000006c1 l       .debug_str	00000000 
000006c5 l       .debug_str	00000000 
00000701 l       .debug_str	00000000 
00000714 l       .debug_str	00000000 
00000719 l       .debug_str	00000000 
0000071b l       .debug_str	00000000 
0000074b l       .debug_str	00000000 
00000753 l       .debug_str	00000000 
00000757 l       .debug_str	00000000 
0000075b l       .debug_str	00000000 
00000793 l       .debug_str	00000000 
0000079b l       .debug_str	00000000 
000007e9 l       .debug_str	00000000 
000007f5 l       .debug_str	00000000 
000007fa l       .debug_str	00000000 
000007fd l       .debug_str	00000000 
00000800 l       .debug_str	00000000 
00000830 l       .debug_str	00000000 
00000838 l       .debug_str	00000000 
00000864 l       .debug_str	00000000 
00000868 l       .debug_str	00000000 
0000086a l       .debug_str	00000000 
0000086e l       .debug_str	00000000 
000008a6 l       .debug_str	00000000 
000008ae l       .debug_str	00000000 
000008fc l       .debug_str	00000000 
000008ff l       .debug_str	00000000 
00000903 l       .debug_str	00000000 
0000090c l       .debug_str	00000000 
00000935 l       .debug_str	00000000 
00000940 l       .debug_str	00000000 
00000946 l       .debug_str	00000000 
0000096b l       .debug_str	00000000 
0000096e l       .debug_str	00000000 
000009a6 l       .debug_str	00000000 
000009be l       .debug_str	00000000 
000009f6 l       .debug_str	00000000 
000009ff l       .debug_str	00000000 
00000a4e l       .debug_str	00000000 
00000a86 l       .debug_str	00000000 
00000a8f l       .debug_str	00000000 
00000ade l       .debug_str	00000000 
00000000 l    d  .text._ZN6memchr8fallback6memchr17h65c68e11b3eadb36E	00000000 .text._ZN6memchr8fallback6memchr17h65c68e11b3eadb36E
00000000 l    d  .text._ZN6memchr8fallback7memchr217h8a4f41633e2d529fE	00000000 .text._ZN6memchr8fallback7memchr217h8a4f41633e2d529fE
00000000 l    d  .text._ZN6memchr8fallback7memchr317h2f4d880199f064efE	00000000 .text._ZN6memchr8fallback7memchr317h2f4d880199f064efE
00000000 l    d  .text._ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E	00000000 .text._ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E
00000000 l    d  .text._ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E	00000000 .text._ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E
00000000 l    d  .text._ZN6memchr8fallback8memrchr317hd0b263e7569dac84E	00000000 .text._ZN6memchr8fallback8memrchr317hd0b263e7569dac84E
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN6memchr8fallback6memchr17h65c68e11b3eadb36E	00000182 memchr::fallback::memchr
00000000 g     F .text._ZN6memchr8fallback7memchr217h8a4f41633e2d529fE	000001a2 memchr::fallback::memchr2
00000000 g     F .text._ZN6memchr8fallback7memchr317h2f4d880199f064efE	00000214 memchr::fallback::memchr3
00000000 g     F .text._ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E	00000196 memchr::fallback::memrchr
00000000 g     F .text._ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E	000001ba memchr::fallback::memrchr2
00000000 g     F .text._ZN6memchr8fallback8memrchr317hd0b263e7569dac84E	00000242 memchr::fallback::memrchr3



Disassembly of section .text._ZN6memchr8fallback6memchr17h65c68e11b3eadb36E:

00000000 <memchr::fallback::memchr>:
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:45
#[inline(always)]
fn repeat_byte(b: u8) -> usize {
    (b as usize) * (usize::MAX / 255)
}

pub fn memchr(n1: u8, haystack: &[u8]) -> Option<usize> {
   0:	b570      	push	{r4, r5, r6, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   2:	eb01 0c02 	add.w	ip, r1, r2
_ZN6memchr8fallback11repeat_byte17hc0f3dab16c60b503E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   6:	fa5f fe80 	uxtb.w	lr, r0
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:55
    let start_ptr = haystack.as_ptr();
    let end_ptr = haystack[haystack.len()..].as_ptr();
    let mut ptr = start_ptr;

    unsafe {
        if haystack.len() < USIZE_BYTES {
   a:	2a03      	cmp	r2, #3
   c:	d825      	bhi.n	5a <memchr::fallback::memchr+0x5a>
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    confirm: F,
) -> Option<usize> {
    debug_assert!(start_ptr <= ptr);
    debug_assert!(ptr <= end_ptr);

    while ptr < end_ptr {
   e:	2a00      	cmp	r2, #0
  10:	f000 808c 	beq.w	12c <memchr::fallback::memchr+0x12c>
  14:	2000      	movs	r0, #0
  16:	460a      	mov	r2, r1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  18:	5c0b      	ldrb	r3, [r1, r0]
  1a:	4573      	cmp	r3, lr
  1c:	f000 8089 	beq.w	132 <memchr::fallback::memchr+0x132>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  20:	180b      	adds	r3, r1, r0
  22:	1c5c      	adds	r4, r3, #1
  24:	4564      	cmp	r4, ip
  26:	f080 8081 	bcs.w	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  2a:	7824      	ldrb	r4, [r4, #0]
  2c:	4574      	cmp	r4, lr
  2e:	f000 8085 	beq.w	13c <memchr::fallback::memchr+0x13c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  32:	1c9c      	adds	r4, r3, #2
  34:	4564      	cmp	r4, ip
  36:	d279      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  38:	7824      	ldrb	r4, [r4, #0]
  3a:	4574      	cmp	r4, lr
  3c:	f000 8083 	beq.w	146 <memchr::fallback::memchr+0x146>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  40:	3303      	adds	r3, #3
  42:	4563      	cmp	r3, ip
  44:	d272      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  46:	781b      	ldrb	r3, [r3, #0]
  48:	4573      	cmp	r3, lr
  4a:	f000 8081 	beq.w	150 <memchr::fallback::memchr+0x150>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  4e:	3004      	adds	r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  50:	3204      	adds	r2, #4
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
  52:	180b      	adds	r3, r1, r0
  54:	4563      	cmp	r3, ip
  56:	d3df      	bcc.n	18 <memchr::fallback::memchr+0x18>
  58:	e068      	b.n	12c <memchr::fallback::memchr+0x12c>
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
  5a:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17hc443ed0f7d99ab73E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  5e:	680b      	ldr	r3, [r1, #0]
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
  60:	fb0e f000 	mul.w	r0, lr, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:60
        if contains_zero_byte(chunk ^ vn1) {
  64:	ea83 0400 	eor.w	r4, r3, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  68:	f1a4 3501 	sub.w	r5, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  6c:	ea25 0404 	bic.w	r4, r5, r4
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:60
        if contains_zero_byte(chunk ^ vn1) {
  70:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
  74:	d01f      	beq.n	b6 <memchr::fallback::memchr+0xb6>
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  76:	2a01      	cmp	r2, #1
  78:	db58      	blt.n	12c <memchr::fallback::memchr+0x12c>
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:60
        if contains_zero_byte(chunk ^ vn1) {
  7a:	b2d8      	uxtb	r0, r3
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  7c:	4570      	cmp	r0, lr
  7e:	4608      	mov	r0, r1
  80:	d058      	beq.n	134 <memchr::fallback::memchr+0x134>
  82:	4608      	mov	r0, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  84:	1c42      	adds	r2, r0, #1
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  86:	4562      	cmp	r2, ip
  88:	d250      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  8a:	7813      	ldrb	r3, [r2, #0]
  8c:	4573      	cmp	r3, lr
  8e:	d064      	beq.n	15a <memchr::fallback::memchr+0x15a>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  90:	1c82      	adds	r2, r0, #2
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  92:	4562      	cmp	r2, ip
  94:	d24a      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  96:	7813      	ldrb	r3, [r2, #0]
  98:	4573      	cmp	r3, lr
  9a:	d068      	beq.n	16e <memchr::fallback::memchr+0x16e>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  9c:	1cc2      	adds	r2, r0, #3
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  9e:	4562      	cmp	r2, ip
  a0:	d244      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  a2:	7813      	ldrb	r3, [r2, #0]
  a4:	4573      	cmp	r3, lr
  a6:	d067      	beq.n	178 <memchr::fallback::memchr+0x178>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  a8:	3004      	adds	r0, #4
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  aa:	4560      	cmp	r0, ip
  ac:	d23e      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  ae:	7802      	ldrb	r2, [r0, #0]
  b0:	4572      	cmp	r2, lr
  b2:	d1e7      	bne.n	84 <memchr::fallback::memchr+0x84>
  b4:	e03e      	b.n	134 <memchr::fallback::memchr+0x134>
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:64
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
  b6:	f001 0303 	and.w	r3, r1, #3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:67
        while loop_size == LOOP_SIZE && ptr <= ptr_sub(end_ptr, loop_size) {
  ba:	2a08      	cmp	r2, #8
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:64
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
  bc:	f1c3 0304 	rsb	r3, r3, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  c0:	440b      	add	r3, r1
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:67
        while loop_size == LOOP_SIZE && ptr <= ptr_sub(end_ptr, loop_size) {
  c2:	d317      	bcc.n	f4 <memchr::fallback::memchr+0xf4>
  c4:	f1ac 0208 	sub.w	r2, ip, #8
  c8:	4293      	cmp	r3, r2
  ca:	d903      	bls.n	d4 <memchr::fallback::memchr+0xd4>
  cc:	e012      	b.n	f4 <memchr::fallback::memchr+0xf4>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  ce:	3308      	adds	r3, #8
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:67
  d0:	4293      	cmp	r3, r2
  d2:	d80f      	bhi.n	f4 <memchr::fallback::memchr+0xf4>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:70
            let a = *(ptr as *const usize);
  d4:	e9d3 4500 	ldrd	r4, r5, [r3]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:73
            let eqb = contains_zero_byte(b ^ vn1);
  d8:	4045      	eors	r5, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:72
            let eqa = contains_zero_byte(a ^ vn1);
  da:	4044      	eors	r4, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  dc:	f1a4 3601 	sub.w	r6, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  e0:	ea26 0404 	bic.w	r4, r6, r4
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  e4:	f1a5 3601 	sub.w	r6, r5, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  e8:	ea26 0505 	bic.w	r5, r6, r5
  ec:	432c      	orrs	r4, r5
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:74
            if eqa || eqb {
  ee:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
  f2:	d0ec      	beq.n	ce <memchr::fallback::memchr+0xce>
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  f4:	4563      	cmp	r3, ip
  f6:	d219      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  f8:	7818      	ldrb	r0, [r3, #0]
  fa:	4570      	cmp	r0, lr
  fc:	d032      	beq.n	164 <memchr::fallback::memchr+0x164>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  fe:	1c58      	adds	r0, r3, #1
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 100:	4560      	cmp	r0, ip
 102:	d213      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 104:	7802      	ldrb	r2, [r0, #0]
 106:	4572      	cmp	r2, lr
 108:	d014      	beq.n	134 <memchr::fallback::memchr+0x134>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 10a:	1c98      	adds	r0, r3, #2
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 10c:	4560      	cmp	r0, ip
 10e:	d20d      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 110:	7802      	ldrb	r2, [r0, #0]
 112:	4572      	cmp	r2, lr
 114:	d00e      	beq.n	134 <memchr::fallback::memchr+0x134>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 116:	1cd8      	adds	r0, r3, #3
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 118:	4560      	cmp	r0, ip
 11a:	d207      	bcs.n	12c <memchr::fallback::memchr+0x12c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 11c:	7802      	ldrb	r2, [r0, #0]
 11e:	4572      	cmp	r2, lr
 120:	d008      	beq.n	134 <memchr::fallback::memchr+0x134>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 122:	3304      	adds	r3, #4
 124:	2000      	movs	r0, #0
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 126:	4563      	cmp	r3, ip
 128:	d3e6      	bcc.n	f8 <memchr::fallback::memchr+0xf8>
 12a:	e000      	b.n	12e <memchr::fallback::memchr+0x12e>
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
 12c:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:81
}
 12e:	4611      	mov	r1, r2
 130:	bd70      	pop	{r4, r5, r6, pc}
_ZN6memchr8fallback14forward_search17h825c8ea6cecbac5fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 132:	4408      	add	r0, r1
_ZN6memchr8fallback6memchr17h65c68e11b3eadb36E():
 134:	1a42      	subs	r2, r0, r1
 136:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:81
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

Disassembly of section .text._ZN6memchr8fallback7memchr217h8a4f41633e2d529fE:

00000000 <memchr::fallback::memchr2>:
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:84
pub fn memchr2(n1: u8, n2: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   4:	eb02 0c03 	add.w	ip, r2, r3
_ZN6memchr8fallback11repeat_byte17hc0f3dab16c60b503E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   8:	fa5f fe81 	uxtb.w	lr, r1
   c:	fa5f f880 	uxtb.w	r8, r0
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:94
        if haystack.len() < USIZE_BYTES {
  10:	2b03      	cmp	r3, #3
  12:	d832      	bhi.n	7a <memchr::fallback::memchr2+0x7a>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  14:	2b00      	cmp	r3, #0
  16:	f000 80b2 	beq.w	17e <memchr::fallback::memchr2+0x17e>
  1a:	2000      	movs	r0, #0
  1c:	4611      	mov	r1, r2
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  1e:	5c13      	ldrb	r3, [r2, r0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  20:	4543      	cmp	r3, r8
  22:	bf18      	it	ne
  24:	4573      	cmpne	r3, lr
  26:	f000 80b2 	beq.w	18e <memchr::fallback::memchr2+0x18e>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  2a:	1815      	adds	r5, r2, r0
  2c:	1c6e      	adds	r6, r5, #1
  2e:	4566      	cmp	r6, ip
  30:	f080 80a5 	bcs.w	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  34:	7836      	ldrb	r6, [r6, #0]
  36:	1c4b      	adds	r3, r1, #1
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  38:	4546      	cmp	r6, r8
  3a:	bf18      	it	ne
  3c:	4576      	cmpne	r6, lr
  3e:	f000 80a7 	beq.w	190 <memchr::fallback::memchr2+0x190>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  42:	1cae      	adds	r6, r5, #2
  44:	4566      	cmp	r6, ip
  46:	f080 809a 	bcs.w	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  4a:	7836      	ldrb	r6, [r6, #0]
  4c:	1c8b      	adds	r3, r1, #2
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  4e:	4546      	cmp	r6, r8
  50:	bf18      	it	ne
  52:	4576      	cmpne	r6, lr
  54:	f000 809c 	beq.w	190 <memchr::fallback::memchr2+0x190>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  58:	3503      	adds	r5, #3
  5a:	4565      	cmp	r5, ip
  5c:	f080 808f 	bcs.w	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  60:	782d      	ldrb	r5, [r5, #0]
  62:	1ccb      	adds	r3, r1, #3
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  64:	4545      	cmp	r5, r8
  66:	bf18      	it	ne
  68:	4575      	cmpne	r5, lr
  6a:	f000 8091 	beq.w	190 <memchr::fallback::memchr2+0x190>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  6e:	3004      	adds	r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  70:	3104      	adds	r1, #4
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
  72:	1813      	adds	r3, r2, r0
  74:	4563      	cmp	r3, ip
  76:	d3d2      	bcc.n	1e <memchr::fallback::memchr2+0x1e>
  78:	e081      	b.n	17e <memchr::fallback::memchr2+0x17e>
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
  7a:	f04f 3101 	mov.w	r1, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17hc443ed0f7d99ab73E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  7e:	6815      	ldr	r5, [r2, #0]
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
  80:	fb0e f001 	mul.w	r0, lr, r1
  84:	fb08 f101 	mul.w	r1, r8, r1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:99
        let eq1 = contains_zero_byte(chunk ^ vn1);
  88:	ea85 0601 	eor.w	r6, r5, r1
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  8c:	f1a6 3701 	sub.w	r7, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  90:	ea27 0606 	bic.w	r6, r7, r6
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:100
        let eq2 = contains_zero_byte(chunk ^ vn2);
  94:	ea85 0700 	eor.w	r7, r5, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  98:	f1a7 3401 	sub.w	r4, r7, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  9c:	43bc      	bics	r4, r7
  9e:	4334      	orrs	r4, r6
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:101
        if eq1 || eq2 {
  a0:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
  a4:	d02a      	beq.n	fc <memchr::fallback::memchr2+0xfc>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  a6:	2b01      	cmp	r3, #1
  a8:	db69      	blt.n	17e <memchr::fallback::memchr2+0x17e>
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:101
        if eq1 || eq2 {
  aa:	b2e8      	uxtb	r0, r5
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  ac:	4540      	cmp	r0, r8
  ae:	d069      	beq.n	184 <memchr::fallback::memchr2+0x184>
  b0:	4570      	cmp	r0, lr
  b2:	4610      	mov	r0, r2
  b4:	d067      	beq.n	186 <memchr::fallback::memchr2+0x186>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
  b6:	4611      	mov	r1, r2
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  b8:	1c48      	adds	r0, r1, #1
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  ba:	4560      	cmp	r0, ip
  bc:	d25f      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  be:	7803      	ldrb	r3, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  c0:	4543      	cmp	r3, r8
  c2:	bf18      	it	ne
  c4:	4573      	cmpne	r3, lr
  c6:	d05e      	beq.n	186 <memchr::fallback::memchr2+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  c8:	1c88      	adds	r0, r1, #2
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  ca:	4560      	cmp	r0, ip
  cc:	d257      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  ce:	7803      	ldrb	r3, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  d0:	4543      	cmp	r3, r8
  d2:	bf18      	it	ne
  d4:	4573      	cmpne	r3, lr
  d6:	d056      	beq.n	186 <memchr::fallback::memchr2+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  d8:	1cc8      	adds	r0, r1, #3
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  da:	4560      	cmp	r0, ip
  dc:	d24f      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  de:	7803      	ldrb	r3, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  e0:	4543      	cmp	r3, r8
  e2:	bf18      	it	ne
  e4:	4573      	cmpne	r3, lr
  e6:	d04e      	beq.n	186 <memchr::fallback::memchr2+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  e8:	1d08      	adds	r0, r1, #4
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  ea:	4560      	cmp	r0, ip
  ec:	d247      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  ee:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
  f0:	4541      	cmp	r1, r8
  f2:	d048      	beq.n	186 <memchr::fallback::memchr2+0x186>
  f4:	4571      	cmp	r1, lr
  f6:	4601      	mov	r1, r0
  f8:	d1de      	bne.n	b8 <memchr::fallback::memchr2+0xb8>
  fa:	e044      	b.n	186 <memchr::fallback::memchr2+0x186>
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:105
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
  fc:	f002 0303 	and.w	r3, r2, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 100:	f1ac 0504 	sub.w	r5, ip, #4
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:105
 104:	f1c3 0304 	rsb	r3, r3, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 108:	4413      	add	r3, r2
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:108
        while ptr <= ptr_sub(end_ptr, USIZE_BYTES) {
 10a:	42ab      	cmp	r3, r5
 10c:	d903      	bls.n	116 <memchr::fallback::memchr2+0x116>
 10e:	e012      	b.n	136 <memchr::fallback::memchr2+0x136>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 110:	3304      	adds	r3, #4
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:108
 112:	42ab      	cmp	r3, r5
 114:	d80f      	bhi.n	136 <memchr::fallback::memchr2+0x136>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:111
            let chunk = *(ptr as *const usize);
 116:	681c      	ldr	r4, [r3, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:112
            let eq1 = contains_zero_byte(chunk ^ vn1);
 118:	ea84 0601 	eor.w	r6, r4, r1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:113
            let eq2 = contains_zero_byte(chunk ^ vn2);
 11c:	4044      	eors	r4, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 11e:	f1a6 3701 	sub.w	r7, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 122:	ea27 0606 	bic.w	r6, r7, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 126:	f1a4 3701 	sub.w	r7, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
 12a:	ea27 0404 	bic.w	r4, r7, r4
 12e:	4334      	orrs	r4, r6
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:114
            if eq1 || eq2 {
 130:	f014 3f80 	tst.w	r4, #2155905152	; 0x80808080
 134:	d0ec      	beq.n	110 <memchr::fallback::memchr2+0x110>
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 136:	4563      	cmp	r3, ip
 138:	d221      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 13a:	7818      	ldrb	r0, [r3, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 13c:	4540      	cmp	r0, r8
 13e:	bf18      	it	ne
 140:	4570      	cmpne	r0, lr
 142:	d029      	beq.n	198 <memchr::fallback::memchr2+0x198>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 144:	1c58      	adds	r0, r3, #1
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 146:	4560      	cmp	r0, ip
 148:	d219      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 14a:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 14c:	4541      	cmp	r1, r8
 14e:	bf18      	it	ne
 150:	4571      	cmpne	r1, lr
 152:	d018      	beq.n	186 <memchr::fallback::memchr2+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 154:	1c98      	adds	r0, r3, #2
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 156:	4560      	cmp	r0, ip
 158:	d211      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 15a:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 15c:	4541      	cmp	r1, r8
 15e:	bf18      	it	ne
 160:	4571      	cmpne	r1, lr
 162:	d010      	beq.n	186 <memchr::fallback::memchr2+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 164:	1cd8      	adds	r0, r3, #3
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 166:	4560      	cmp	r0, ip
 168:	d209      	bcs.n	17e <memchr::fallback::memchr2+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 16a:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 16c:	4541      	cmp	r1, r8
 16e:	bf18      	it	ne
 170:	4571      	cmpne	r1, lr
 172:	d008      	beq.n	186 <memchr::fallback::memchr2+0x186>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 174:	3304      	adds	r3, #4
 176:	2000      	movs	r0, #0
_ZN6memchr8fallback14forward_search17he7d0ca46d3ba1910E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 178:	4563      	cmp	r3, ip
 17a:	d3de      	bcc.n	13a <memchr::fallback::memchr2+0x13a>
 17c:	e000      	b.n	180 <memchr::fallback::memchr2+0x180>
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
 17e:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:121
}
 180:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 184:	4610      	mov	r0, r2
 186:	1a81      	subs	r1, r0, r2
 188:	2001      	movs	r0, #1
 18a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
_ZN6memchr8fallback7memchr228_$u7b$$u7b$closure$u7d$$u7d$17h7c9ddfd3afbc3f28E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:87
    let confirm = |byte| byte == n1 || byte == n2;
 18e:	1813      	adds	r3, r2, r0
_ZN6memchr8fallback3sub17hdb15cf4fbff8b00bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345

/// Subtract `b` from `a` and return the difference. `a` should be greater than
/// or equal to `b`.
fn sub(a: *const u8, b: *const u8) -> usize {
    debug_assert!(a >= b);
    (a as usize) - (b as usize)
 190:	1a99      	subs	r1, r3, r2
 192:	2001      	movs	r0, #1
_ZN6memchr8fallback7memchr217h8a4f41633e2d529fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:121
}
 194:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 198:	4618      	mov	r0, r3
 19a:	1a81      	subs	r1, r0, r2
 19c:	2001      	movs	r0, #1
 19e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

Disassembly of section .text._ZN6memchr8fallback7memchr317h2f4d880199f064efE:

00000000 <memchr::fallback::memchr3>:
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:124
pub fn memchr3(n1: u8, n2: u8, n3: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   4:	9d09      	ldr	r5, [sp, #36]	; 0x24
_ZN6memchr8fallback11repeat_byte17hc0f3dab16c60b503E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   6:	fa5f f982 	uxtb.w	r9, r2
   a:	fa5f fe81 	uxtb.w	lr, r1
   e:	fa5f f880 	uxtb.w	r8, r0
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  12:	eb03 0c05 	add.w	ip, r3, r5
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:135
        if haystack.len() < USIZE_BYTES {
  16:	2d03      	cmp	r5, #3
  18:	d83e      	bhi.n	98 <memchr::fallback::memchr3+0x98>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  1a:	2d00      	cmp	r5, #0
  1c:	f000 80e3 	beq.w	1e6 <memchr::fallback::memchr3+0x1e6>
  20:	2000      	movs	r0, #0
  22:	4619      	mov	r1, r3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  24:	5c1d      	ldrb	r5, [r3, r0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  26:	454d      	cmp	r5, r9
  28:	bf18      	it	ne
  2a:	4545      	cmpne	r5, r8
  2c:	f000 80de 	beq.w	1ec <memchr::fallback::memchr3+0x1ec>
  30:	4575      	cmp	r5, lr
  32:	f000 80db 	beq.w	1ec <memchr::fallback::memchr3+0x1ec>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  36:	181e      	adds	r6, r3, r0
  38:	1c77      	adds	r7, r6, #1
  3a:	4567      	cmp	r7, ip
  3c:	f080 80d3 	bcs.w	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  40:	783f      	ldrb	r7, [r7, #0]
  42:	1c4d      	adds	r5, r1, #1
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  44:	454f      	cmp	r7, r9
  46:	f000 80d2 	beq.w	1ee <memchr::fallback::memchr3+0x1ee>
  4a:	4547      	cmp	r7, r8
  4c:	bf18      	it	ne
  4e:	4577      	cmpne	r7, lr
  50:	f000 80cd 	beq.w	1ee <memchr::fallback::memchr3+0x1ee>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  54:	1cb7      	adds	r7, r6, #2
  56:	4567      	cmp	r7, ip
  58:	f080 80c5 	bcs.w	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  5c:	783f      	ldrb	r7, [r7, #0]
  5e:	1c8d      	adds	r5, r1, #2
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  60:	454f      	cmp	r7, r9
  62:	f000 80c4 	beq.w	1ee <memchr::fallback::memchr3+0x1ee>
  66:	4547      	cmp	r7, r8
  68:	bf18      	it	ne
  6a:	4577      	cmpne	r7, lr
  6c:	f000 80bf 	beq.w	1ee <memchr::fallback::memchr3+0x1ee>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  70:	3603      	adds	r6, #3
  72:	4566      	cmp	r6, ip
  74:	f080 80b7 	bcs.w	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  78:	7836      	ldrb	r6, [r6, #0]
  7a:	1ccd      	adds	r5, r1, #3
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  7c:	454e      	cmp	r6, r9
  7e:	f000 80b6 	beq.w	1ee <memchr::fallback::memchr3+0x1ee>
  82:	4546      	cmp	r6, r8
  84:	bf18      	it	ne
  86:	4576      	cmpne	r6, lr
  88:	f000 80b1 	beq.w	1ee <memchr::fallback::memchr3+0x1ee>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  8c:	3004      	adds	r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  8e:	3104      	adds	r1, #4
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
  90:	181a      	adds	r2, r3, r0
  92:	4562      	cmp	r2, ip
  94:	d3c6      	bcc.n	24 <memchr::fallback::memchr3+0x24>
  96:	e0a6      	b.n	1e6 <memchr::fallback::memchr3+0x1e6>
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
  98:	f04f 3601 	mov.w	r6, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17hc443ed0f7d99ab73E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  9c:	681f      	ldr	r7, [r3, #0]
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
  9e:	fb09 fa06 	mul.w	sl, r9, r6
  a2:	fb0e fb06 	mul.w	fp, lr, r6
  a6:	fb08 f606 	mul.w	r6, r8, r6
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:140
        let eq1 = contains_zero_byte(chunk ^ vn1);
  aa:	ea87 0406 	eor.w	r4, r7, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  ae:	f1a4 3201 	sub.w	r2, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  b2:	43a2      	bics	r2, r4
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:141
        let eq2 = contains_zero_byte(chunk ^ vn2);
  b4:	ea87 040b 	eor.w	r4, r7, fp
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  b8:	f1a4 3001 	sub.w	r0, r4, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  bc:	43a0      	bics	r0, r4
  be:	4310      	orrs	r0, r2
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:142
        let eq3 = contains_zero_byte(chunk ^ vn3);
  c0:	ea87 020a 	eor.w	r2, r7, sl
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  c4:	f1a2 3401 	sub.w	r4, r2, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  c8:	ea24 0202 	bic.w	r2, r4, r2
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:143
        if eq1 || eq2 || eq3 {
  cc:	4310      	orrs	r0, r2
  ce:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
  d2:	d038      	beq.n	146 <memchr::fallback::memchr3+0x146>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  d4:	2d01      	cmp	r5, #1
  d6:	f2c0 8086 	blt.w	1e6 <memchr::fallback::memchr3+0x1e6>
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:143
        if eq1 || eq2 || eq3 {
  da:	b2f8      	uxtb	r0, r7
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  dc:	4548      	cmp	r0, r9
  de:	f000 808f 	beq.w	200 <memchr::fallback::memchr3+0x200>
  e2:	4540      	cmp	r0, r8
  e4:	f000 8091 	beq.w	20a <memchr::fallback::memchr3+0x20a>
  e8:	4570      	cmp	r0, lr
  ea:	4618      	mov	r0, r3
  ec:	f000 8084 	beq.w	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
  f0:	4619      	mov	r1, r3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  f2:	1c48      	adds	r0, r1, #1
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
  f4:	4560      	cmp	r0, ip
  f6:	d276      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
  f8:	7805      	ldrb	r5, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  fa:	454d      	cmp	r5, r9
  fc:	bf18      	it	ne
  fe:	4545      	cmpne	r5, r8
 100:	d07a      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
 102:	4575      	cmp	r5, lr
 104:	d078      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 106:	1c88      	adds	r0, r1, #2
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 108:	4560      	cmp	r0, ip
 10a:	d26c      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 10c:	7805      	ldrb	r5, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 10e:	454d      	cmp	r5, r9
 110:	d072      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
 112:	4545      	cmp	r5, r8
 114:	bf18      	it	ne
 116:	4575      	cmpne	r5, lr
 118:	d06e      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 11a:	1cc8      	adds	r0, r1, #3
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 11c:	4560      	cmp	r0, ip
 11e:	d262      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 120:	7805      	ldrb	r5, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 122:	454d      	cmp	r5, r9
 124:	d068      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
 126:	4545      	cmp	r5, r8
 128:	bf18      	it	ne
 12a:	4575      	cmpne	r5, lr
 12c:	d064      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 12e:	1d08      	adds	r0, r1, #4
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 130:	4560      	cmp	r0, ip
 132:	d258      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 134:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 136:	4549      	cmp	r1, r9
 138:	bf18      	it	ne
 13a:	4541      	cmpne	r1, r8
 13c:	d05c      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
 13e:	4571      	cmp	r1, lr
 140:	4601      	mov	r1, r0
 142:	d1d6      	bne.n	f2 <memchr::fallback::memchr3+0xf2>
 144:	e058      	b.n	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:147
        ptr = ptr_add(ptr, USIZE_BYTES - (start_ptr as usize & align));
 146:	f003 0003 	and.w	r0, r3, #3
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 14a:	f1ac 0704 	sub.w	r7, ip, #4
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:147
 14e:	f1c0 0004 	rsb	r0, r0, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 152:	181d      	adds	r5, r3, r0
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:150
        while ptr <= ptr_sub(end_ptr, USIZE_BYTES) {
 154:	42bd      	cmp	r5, r7
 156:	d903      	bls.n	160 <memchr::fallback::memchr3+0x160>
 158:	e019      	b.n	18e <memchr::fallback::memchr3+0x18e>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 15a:	3504      	adds	r5, #4
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:150
 15c:	42bd      	cmp	r5, r7
 15e:	d816      	bhi.n	18e <memchr::fallback::memchr3+0x18e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:153
            let chunk = *(ptr as *const usize);
 160:	6828      	ldr	r0, [r5, #0]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:154
            let eq1 = contains_zero_byte(chunk ^ vn1);
 162:	ea80 0206 	eor.w	r2, r0, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 166:	f1a2 3401 	sub.w	r4, r2, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 16a:	ea24 0202 	bic.w	r2, r4, r2
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:155
            let eq2 = contains_zero_byte(chunk ^ vn2);
 16e:	ea80 040b 	eor.w	r4, r0, fp
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 172:	f1a4 3101 	sub.w	r1, r4, #16843009	; 0x1010101
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:156
            let eq3 = contains_zero_byte(chunk ^ vn3);
 176:	ea80 000a 	eor.w	r0, r0, sl
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 17a:	43a1      	bics	r1, r4
 17c:	4311      	orrs	r1, r2
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 17e:	f1a0 3201 	sub.w	r2, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
 182:	ea22 0000 	bic.w	r0, r2, r0
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:157
            if eq1 || eq2 || eq3 {
 186:	4308      	orrs	r0, r1
 188:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
 18c:	d0e5      	beq.n	15a <memchr::fallback::memchr3+0x15a>
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 18e:	4565      	cmp	r5, ip
 190:	d229      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 192:	7828      	ldrb	r0, [r5, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 194:	4548      	cmp	r0, r9
 196:	bf18      	it	ne
 198:	4540      	cmpne	r0, r8
 19a:	d02c      	beq.n	1f6 <memchr::fallback::memchr3+0x1f6>
 19c:	4570      	cmp	r0, lr
 19e:	d02a      	beq.n	1f6 <memchr::fallback::memchr3+0x1f6>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1a0:	1c68      	adds	r0, r5, #1
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1a2:	4560      	cmp	r0, ip
 1a4:	d21f      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 1a6:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1a8:	4549      	cmp	r1, r9
 1aa:	d025      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
 1ac:	4541      	cmp	r1, r8
 1ae:	bf18      	it	ne
 1b0:	4571      	cmpne	r1, lr
 1b2:	d021      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1b4:	1ca8      	adds	r0, r5, #2
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1b6:	4560      	cmp	r0, ip
 1b8:	d215      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 1ba:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1bc:	4549      	cmp	r1, r9
 1be:	d01b      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
 1c0:	4541      	cmp	r1, r8
 1c2:	bf18      	it	ne
 1c4:	4571      	cmpne	r1, lr
 1c6:	d017      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1c8:	1ce8      	adds	r0, r5, #3
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1ca:	4560      	cmp	r0, ip
 1cc:	d20b      	bcs.n	1e6 <memchr::fallback::memchr3+0x1e6>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:296
        if confirm(*ptr) {
 1ce:	7801      	ldrb	r1, [r0, #0]
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1d0:	4549      	cmp	r1, r9
 1d2:	d011      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
 1d4:	4541      	cmp	r1, r8
 1d6:	bf18      	it	ne
 1d8:	4571      	cmpne	r1, lr
 1da:	d00d      	beq.n	1f8 <memchr::fallback::memchr3+0x1f8>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1dc:	3504      	adds	r5, #4
 1de:	2000      	movs	r0, #0
_ZN6memchr8fallback14forward_search17h46582af00d9afb2fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:295
    while ptr < end_ptr {
 1e0:	4565      	cmp	r5, ip
 1e2:	d3d6      	bcc.n	192 <memchr::fallback::memchr3+0x192>
 1e4:	e000      	b.n	1e8 <memchr::fallback::memchr3+0x1e8>
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
 1e6:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:164
}
 1e8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_ZN6memchr8fallback7memchr328_$u7b$$u7b$closure$u7d$$u7d$17h28b268d966fc86b0E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:128
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1ec:	181d      	adds	r5, r3, r0
_ZN6memchr8fallback3sub17hdb15cf4fbff8b00bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 1ee:	1ae9      	subs	r1, r5, r3
 1f0:	2001      	movs	r0, #1
_ZN6memchr8fallback7memchr317h2f4d880199f064efE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:164
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

Disassembly of section .text._ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E:

00000000 <memchr::fallback::memrchr>:
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:167
pub fn memrchr(n1: u8, haystack: &[u8]) -> Option<usize> {
   0:	b570      	push	{r4, r5, r6, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   2:	eb01 0e02 	add.w	lr, r1, r2
_ZN4core3cmp3Ord3min17hc435043d92167076E():
   6:	2a08      	cmp	r2, #8
   8:	4614      	mov	r4, r2
_ZN6memchr8fallback11repeat_byte17hc0f3dab16c60b503E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   a:	fa5f fc80 	uxtb.w	ip, r0
_ZN4core3cmp3Ord3min17hc435043d92167076E():
   e:	bf28      	it	cs
  10:	2408      	movcs	r4, #8
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:177
        if haystack.len() < USIZE_BYTES {
  12:	2a03      	cmp	r2, #3
  14:	d826      	bhi.n	64 <memchr::fallback::memrchr+0x64>
_ZN6memchr8fallback14reverse_search17h6074a2d0d70b7a7eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  16:	1e90      	subs	r0, r2, #2
  18:	1ed3      	subs	r3, r2, #3
  1a:	188d      	adds	r5, r1, r2
  1c:	428d      	cmp	r5, r1
  1e:	f240 808e 	bls.w	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  22:	180c      	adds	r4, r1, r0
  24:	7866      	ldrb	r6, [r4, #1]
  26:	4566      	cmp	r6, ip
  28:	f000 808b 	beq.w	142 <memchr::fallback::memrchr+0x142>
  2c:	3d01      	subs	r5, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  2e:	428d      	cmp	r5, r1
  30:	f240 8085 	bls.w	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  34:	5c0d      	ldrb	r5, [r1, r0]
  36:	4565      	cmp	r5, ip
  38:	f000 8088 	beq.w	14c <memchr::fallback::memrchr+0x14c>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  3c:	428c      	cmp	r4, r1
  3e:	d97e      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  40:	f814 5c01 	ldrb.w	r5, [r4, #-1]
  44:	4565      	cmp	r5, ip
  46:	f000 8086 	beq.w	156 <memchr::fallback::memrchr+0x156>
  4a:	18cd      	adds	r5, r1, r3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  4c:	428d      	cmp	r5, r1
  4e:	d976      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  50:	f814 4c02 	ldrb.w	r4, [r4, #-2]
  54:	3804      	subs	r0, #4
  56:	3b04      	subs	r3, #4
  58:	3a04      	subs	r2, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  5a:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback14reverse_search17h6074a2d0d70b7a7eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  5e:	4564      	cmp	r4, ip
  60:	d1db      	bne.n	1a <memchr::fallback::memrchr+0x1a>
  62:	e02e      	b.n	c2 <memchr::fallback::memrchr+0xc2>
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
  64:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
_ZN4core10intrinsics19copy_nonoverlapping17hc443ed0f7d99ab73E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  68:	f85e 3c04 	ldr.w	r3, [lr, #-4]
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
  6c:	fb0c f000 	mul.w	r0, ip, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:182
        if contains_zero_byte(chunk ^ vn1) {
  70:	4043      	eors	r3, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  72:	f1a3 3501 	sub.w	r5, r3, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  76:	ea25 0303 	bic.w	r3, r5, r3
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:182
        if contains_zero_byte(chunk ^ vn1) {
  7a:	f013 3f80 	tst.w	r3, #2155905152	; 0x80808080
  7e:	d024      	beq.n	ca <memchr::fallback::memrchr+0xca>
_ZN6memchr8fallback14reverse_search17h6074a2d0d70b7a7eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  80:	1e90      	subs	r0, r2, #2
  82:	1ed3      	subs	r3, r2, #3
  84:	188d      	adds	r5, r1, r2
  86:	428d      	cmp	r5, r1
  88:	d959      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  8a:	180c      	adds	r4, r1, r0
  8c:	7866      	ldrb	r6, [r4, #1]
  8e:	4566      	cmp	r6, ip
  90:	d066      	beq.n	160 <memchr::fallback::memrchr+0x160>
  92:	3d01      	subs	r5, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  94:	428d      	cmp	r5, r1
  96:	d952      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  98:	5c0d      	ldrb	r5, [r1, r0]
  9a:	4565      	cmp	r5, ip
  9c:	d065      	beq.n	16a <memchr::fallback::memrchr+0x16a>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  9e:	428c      	cmp	r4, r1
  a0:	d94d      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  a2:	f814 5c01 	ldrb.w	r5, [r4, #-1]
  a6:	4565      	cmp	r5, ip
  a8:	d064      	beq.n	174 <memchr::fallback::memrchr+0x174>
  aa:	18cd      	adds	r5, r1, r3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  ac:	428d      	cmp	r5, r1
  ae:	d946      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  b0:	f814 4c02 	ldrb.w	r4, [r4, #-2]
  b4:	3804      	subs	r0, #4
  b6:	3b04      	subs	r3, #4
  b8:	3a04      	subs	r2, #4
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  ba:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback14reverse_search17h6074a2d0d70b7a7eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  be:	4564      	cmp	r4, ip
  c0:	d1e0      	bne.n	84 <memchr::fallback::memrchr+0x84>
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
  c2:	1888      	adds	r0, r1, r2
  c4:	1a41      	subs	r1, r0, r1
  c6:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
  c8:	bd70      	pop	{r4, r5, r6, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:186
        ptr = (end_ptr as usize & !align) as *const u8;
  ca:	f02e 0303 	bic.w	r3, lr, #3
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:188
        while loop_size == LOOP_SIZE && ptr >= ptr_add(start_ptr, loop_size) {
  ce:	2a08      	cmp	r2, #8
  d0:	d316      	bcc.n	100 <memchr::fallback::memrchr+0x100>
  d2:	f101 0e08 	add.w	lr, r1, #8
  d6:	459e      	cmp	lr, r3
  d8:	d812      	bhi.n	100 <memchr::fallback::memrchr+0x100>
  da:	4264      	negs	r4, r4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:191
            let a = *(ptr_sub(ptr, 2 * USIZE_BYTES) as *const usize);
  dc:	e953 6502 	ldrd	r6, r5, [r3, #-8]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:194
            let eqb = contains_zero_byte(b ^ vn1);
  e0:	4045      	eors	r5, r0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:193
            let eqa = contains_zero_byte(a ^ vn1);
  e2:	4046      	eors	r6, r0
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  e4:	f1a6 3201 	sub.w	r2, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  e8:	43b2      	bics	r2, r6
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  ea:	f1a5 3601 	sub.w	r6, r5, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  ee:	ea26 0505 	bic.w	r5, r6, r5
  f2:	432a      	orrs	r2, r5
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:195
            if eqa || eqb {
  f4:	f012 3f80 	tst.w	r2, #2155905152	; 0x80808080
  f8:	d102      	bne.n	100 <memchr::fallback::memrchr+0x100>
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  fa:	4423      	add	r3, r4
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:188
        while loop_size == LOOP_SIZE && ptr >= ptr_add(start_ptr, loop_size) {
  fc:	4573      	cmp	r3, lr
  fe:	d2ed      	bcs.n	dc <memchr::fallback::memrchr+0xdc>
_ZN6memchr8fallback14reverse_search17h6074a2d0d70b7a7eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 100:	1e98      	subs	r0, r3, #2
 102:	1c82      	adds	r2, r0, #2
 104:	428a      	cmp	r2, r1
 106:	d91a      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 108:	4602      	mov	r2, r0
 10a:	f812 6f01 	ldrb.w	r6, [r2, #1]!
 10e:	4566      	cmp	r6, ip
 110:	d035      	beq.n	17e <memchr::fallback::memrchr+0x17e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 112:	428a      	cmp	r2, r1
 114:	d913      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 116:	7802      	ldrb	r2, [r0, #0]
 118:	4562      	cmp	r2, ip
 11a:	d034      	beq.n	186 <memchr::fallback::memrchr+0x186>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 11c:	4288      	cmp	r0, r1
 11e:	d90e      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 120:	4602      	mov	r2, r0
 122:	f812 6d01 	ldrb.w	r6, [r2, #-1]!
 126:	4566      	cmp	r6, ip
 128:	d031      	beq.n	18e <memchr::fallback::memrchr+0x18e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 12a:	428a      	cmp	r2, r1
 12c:	d907      	bls.n	13e <memchr::fallback::memrchr+0x13e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 12e:	1f02      	subs	r2, r0, #4
 130:	f810 0c02 	ldrb.w	r0, [r0, #-2]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 134:	3b04      	subs	r3, #4
_ZN6memchr8fallback14reverse_search17h6074a2d0d70b7a7eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 136:	4560      	cmp	r0, ip
 138:	4610      	mov	r0, r2
 13a:	d1e2      	bne.n	102 <memchr::fallback::memrchr+0x102>
 13c:	e020      	b.n	180 <memchr::fallback::memrchr+0x180>
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
 13e:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
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
_ZN6memchr8fallback14reverse_search17h6074a2d0d70b7a7eE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 17e:	1c43      	adds	r3, r0, #1
_ZN6memchr8fallback3sub17hdb15cf4fbff8b00bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 180:	1a59      	subs	r1, r3, r1
 182:	2001      	movs	r0, #1
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
 184:	bd70      	pop	{r4, r5, r6, pc}
 186:	3b02      	subs	r3, #2
_ZN6memchr8fallback3sub17hdb15cf4fbff8b00bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 188:	1a59      	subs	r1, r3, r1
 18a:	2001      	movs	r0, #1
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
 18c:	bd70      	pop	{r4, r5, r6, pc}
 18e:	3b03      	subs	r3, #3
_ZN6memchr8fallback3sub17hdb15cf4fbff8b00bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 190:	1a59      	subs	r1, r3, r1
 192:	2001      	movs	r0, #1
_ZN6memchr8fallback7memrchr17h1c2fd79873a6fa86E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:202
}
 194:	bd70      	pop	{r4, r5, r6, pc}

Disassembly of section .text._ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E:

00000000 <memchr::fallback::memrchr2>:
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:205
pub fn memrchr2(n1: u8, n2: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
   4:	eb02 0c03 	add.w	ip, r2, r3
_ZN6memchr8fallback11repeat_byte17hc0f3dab16c60b503E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   8:	fa5f fe81 	uxtb.w	lr, r1
   c:	fa5f f880 	uxtb.w	r8, r0
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:215
        if haystack.len() < USIZE_BYTES {
  10:	2b03      	cmp	r3, #3
  12:	d836      	bhi.n	82 <memchr::fallback::memrchr2+0x82>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  14:	1e99      	subs	r1, r3, #2
  16:	1edc      	subs	r4, r3, #3
  18:	18d7      	adds	r7, r2, r3
  1a:	4297      	cmp	r7, r2
  1c:	f240 80c0 	bls.w	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  20:	1855      	adds	r5, r2, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  22:	f1ac 0601 	sub.w	r6, ip, #1
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  26:	7868      	ldrb	r0, [r5, #1]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  28:	4540      	cmp	r0, r8
  2a:	bf18      	it	ne
  2c:	4570      	cmpne	r0, lr
  2e:	f000 80bb 	beq.w	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
  32:	1e78      	subs	r0, r7, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  34:	4290      	cmp	r0, r2
  36:	f240 80b3 	bls.w	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  3a:	5c50      	ldrb	r0, [r2, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  3c:	f1ac 0602 	sub.w	r6, ip, #2
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  40:	4540      	cmp	r0, r8
  42:	bf18      	it	ne
  44:	4570      	cmpne	r0, lr
  46:	f000 80af 	beq.w	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  4a:	4295      	cmp	r5, r2
  4c:	f240 80a8 	bls.w	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  50:	f815 0c01 	ldrb.w	r0, [r5, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  54:	f1ac 0603 	sub.w	r6, ip, #3
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  58:	4540      	cmp	r0, r8
  5a:	bf18      	it	ne
  5c:	4570      	cmpne	r0, lr
  5e:	f000 80a3 	beq.w	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
  62:	1910      	adds	r0, r2, r4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  64:	4290      	cmp	r0, r2
  66:	f240 809b 	bls.w	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  6a:	f815 5c02 	ldrb.w	r5, [r5, #-2]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  6e:	3b04      	subs	r3, #4
  70:	4545      	cmp	r5, r8
  72:	d04d      	beq.n	110 <memchr::fallback::memrchr2+0x110>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
  74:	3904      	subs	r1, #4
  76:	3c04      	subs	r4, #4
  78:	f1ac 0c04 	sub.w	ip, ip, #4
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
  7c:	4575      	cmp	r5, lr
  7e:	d1cb      	bne.n	18 <memchr::fallback::memrchr2+0x18>
  80:	e046      	b.n	110 <memchr::fallback::memrchr2+0x110>
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
  82:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
  86:	fb08 f500 	mul.w	r5, r8, r0
  8a:	fb0e f900 	mul.w	r9, lr, r0
_ZN4core10intrinsics19copy_nonoverlapping17hc443ed0f7d99ab73E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  8e:	f85c 0c04 	ldr.w	r0, [ip, #-4]
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:220
        let eq1 = contains_zero_byte(chunk ^ vn1);
  92:	ea80 0105 	eor.w	r1, r0, r5
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  96:	f1a1 3601 	sub.w	r6, r1, #16843009	; 0x1010101
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:221
        let eq2 = contains_zero_byte(chunk ^ vn2);
  9a:	ea80 0009 	eor.w	r0, r0, r9
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  9e:	ea26 0101 	bic.w	r1, r6, r1
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  a2:	f1a0 3601 	sub.w	r6, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  a6:	ea26 0000 	bic.w	r0, r6, r0
  aa:	4308      	orrs	r0, r1
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:222
        if eq1 || eq2 {
  ac:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
  b0:	d033      	beq.n	11a <memchr::fallback::memrchr2+0x11a>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  b2:	1e99      	subs	r1, r3, #2
  b4:	1edc      	subs	r4, r3, #3
  b6:	18d7      	adds	r7, r2, r3
  b8:	4297      	cmp	r7, r2
  ba:	d971      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  bc:	1855      	adds	r5, r2, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  be:	f1ac 0601 	sub.w	r6, ip, #1
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  c2:	7868      	ldrb	r0, [r5, #1]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  c4:	4540      	cmp	r0, r8
  c6:	bf18      	it	ne
  c8:	4570      	cmpne	r0, lr
  ca:	d06d      	beq.n	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
  cc:	1e78      	subs	r0, r7, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  ce:	4290      	cmp	r0, r2
  d0:	d966      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  d2:	5c50      	ldrb	r0, [r2, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  d4:	f1ac 0602 	sub.w	r6, ip, #2
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  d8:	4540      	cmp	r0, r8
  da:	bf18      	it	ne
  dc:	4570      	cmpne	r0, lr
  de:	d063      	beq.n	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  e0:	4295      	cmp	r5, r2
  e2:	d95d      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  e4:	f815 0c01 	ldrb.w	r0, [r5, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  e8:	f1ac 0603 	sub.w	r6, ip, #3
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  ec:	4540      	cmp	r0, r8
  ee:	bf18      	it	ne
  f0:	4570      	cmpne	r0, lr
  f2:	d059      	beq.n	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
  f4:	1910      	adds	r0, r2, r4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  f6:	4290      	cmp	r0, r2
  f8:	d952      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  fa:	f815 5c02 	ldrb.w	r5, [r5, #-2]
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
  fe:	3b04      	subs	r3, #4
 100:	4545      	cmp	r5, r8
 102:	d005      	beq.n	110 <memchr::fallback::memrchr2+0x110>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
 104:	3904      	subs	r1, #4
 106:	3c04      	subs	r4, #4
 108:	f1ac 0c04 	sub.w	ip, ip, #4
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
 10c:	4575      	cmp	r5, lr
 10e:	d1d2      	bne.n	b6 <memchr::fallback::memrchr2+0xb6>
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
 110:	18d6      	adds	r6, r2, r3
 112:	1ab1      	subs	r1, r6, r2
 114:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
}
 116:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:226
        ptr = (end_ptr as usize & !align) as *const u8;
 11a:	f02c 0003 	bic.w	r0, ip, #3
 11e:	1d16      	adds	r6, r2, #4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:228
        while ptr >= ptr_add(start_ptr, USIZE_BYTES) {
 120:	1e83      	subs	r3, r0, #2
 122:	1c99      	adds	r1, r3, #2
 124:	461f      	mov	r7, r3
 126:	42b1      	cmp	r1, r6
 128:	d312      	bcc.n	150 <memchr::fallback::memrchr2+0x150>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:231
            let chunk = *(ptr_sub(ptr, USIZE_BYTES) as *const usize);
 12a:	f857 0c02 	ldr.w	r0, [r7, #-2]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:232
            let eq1 = contains_zero_byte(chunk ^ vn1);
 12e:	ea80 0305 	eor.w	r3, r0, r5
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:233
            let eq2 = contains_zero_byte(chunk ^ vn2);
 132:	ea80 0009 	eor.w	r0, r0, r9
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 136:	f1a3 3401 	sub.w	r4, r3, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 13a:	ea24 0303 	bic.w	r3, r4, r3
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 13e:	f1a0 3401 	sub.w	r4, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
 142:	ea24 0000 	bic.w	r0, r4, r0
 146:	4318      	orrs	r0, r3
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:234
            if eq1 || eq2 {
 148:	1f3b      	subs	r3, r7, #4
 14a:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
 14e:	d0e8      	beq.n	122 <memchr::fallback::memrchr2+0x122>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 150:	1cb8      	adds	r0, r7, #2
 152:	4290      	cmp	r0, r2
 154:	d924      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 156:	463b      	mov	r3, r7
 158:	f813 0f01 	ldrb.w	r0, [r3, #1]!
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 15c:	4540      	cmp	r0, r8
 15e:	bf18      	it	ne
 160:	4570      	cmpne	r0, lr
 162:	d020      	beq.n	1a6 <memchr::fallback::memrchr2+0x1a6>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 164:	4293      	cmp	r3, r2
 166:	d91b      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 168:	7838      	ldrb	r0, [r7, #0]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 16a:	1e8e      	subs	r6, r1, #2
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 16c:	4540      	cmp	r0, r8
 16e:	bf18      	it	ne
 170:	4570      	cmpne	r0, lr
 172:	d019      	beq.n	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 174:	4297      	cmp	r7, r2
 176:	d913      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 178:	463b      	mov	r3, r7
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 17a:	1ece      	subs	r6, r1, #3
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 17c:	f813 0d01 	ldrb.w	r0, [r3, #-1]!
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 180:	4540      	cmp	r0, r8
 182:	bf18      	it	ne
 184:	4570      	cmpne	r0, lr
 186:	d00f      	beq.n	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback14reverse_search17ha8483d4c886d95afE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 188:	4293      	cmp	r3, r2
 18a:	d909      	bls.n	1a0 <memchr::fallback::memrchr2+0x1a0>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 18c:	f817 3c02 	ldrb.w	r3, [r7, #-2]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 190:	3904      	subs	r1, #4
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 192:	4543      	cmp	r3, r8
 194:	d00c      	beq.n	1b0 <memchr::fallback::memrchr2+0x1b0>
 196:	3f04      	subs	r7, #4
 198:	4573      	cmp	r3, lr
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 19a:	460e      	mov	r6, r1
 19c:	d1d8      	bne.n	150 <memchr::fallback::memrchr2+0x150>
 19e:	e003      	b.n	1a8 <memchr::fallback::memrchr2+0x1a8>
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
 1a0:	2000      	movs	r0, #0
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
}
 1a2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
_ZN6memchr8fallback8memrchr228_$u7b$$u7b$closure$u7d$$u7d$17he1167ba1b63ed853E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:208
    let confirm = |byte| byte == n1 || byte == n2;
 1a6:	1c7e      	adds	r6, r7, #1
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
 1a8:	1ab1      	subs	r1, r6, r2
 1aa:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
}
 1ac:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1b0:	460e      	mov	r6, r1
_ZN6memchr8fallback8memrchr217ha5fe41622b8ca226E():
 1b2:	1ab1      	subs	r1, r6, r2
 1b4:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:241
 1b6:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}

Disassembly of section .text._ZN6memchr8fallback8memrchr317hd0b263e7569dac84E:

00000000 <memchr::fallback::memrchr3>:
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:244
pub fn memrchr3(n1: u8, n2: u8, n3: u8, haystack: &[u8]) -> Option<usize> {
   0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   4:	b082      	sub	sp, #8
   6:	f8dd c02c 	ldr.w	ip, [sp, #44]	; 0x2c
_ZN6memchr8fallback11repeat_byte17hc0f3dab16c60b503E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:42
    (b as usize) * (usize::MAX / 255)
   a:	b2d5      	uxtb	r5, r2
   c:	fa5f fa81 	uxtb.w	sl, r1
  10:	fa5f f980 	uxtb.w	r9, r0
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  14:	eb03 0e0c 	add.w	lr, r3, ip
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:255
        if haystack.len() < USIZE_BYTES {
  18:	f1bc 0f03 	cmp.w	ip, #3
  1c:	d843      	bhi.n	a6 <memchr::fallback::memrchr3+0xa6>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  1e:	f1ac 0102 	sub.w	r1, ip, #2
  22:	f1ac 0403 	sub.w	r4, ip, #3
  26:	eb03 000c 	add.w	r0, r3, ip
  2a:	4298      	cmp	r0, r3
  2c:	f240 80ff 	bls.w	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  30:	185f      	adds	r7, r3, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  32:	f1ae 0601 	sub.w	r6, lr, #1
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
  36:	787a      	ldrb	r2, [r7, #1]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  38:	42aa      	cmp	r2, r5
  3a:	f000 809a 	beq.w	172 <memchr::fallback::memrchr3+0x172>
  3e:	454a      	cmp	r2, r9
  40:	bf18      	it	ne
  42:	4552      	cmpne	r2, sl
  44:	f000 8095 	beq.w	172 <memchr::fallback::memrchr3+0x172>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
  48:	3801      	subs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  4a:	4298      	cmp	r0, r3
  4c:	f240 80ef 	bls.w	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  50:	5c58      	ldrb	r0, [r3, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  52:	f1ae 0602 	sub.w	r6, lr, #2
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  56:	42a8      	cmp	r0, r5
  58:	f000 808b 	beq.w	172 <memchr::fallback::memrchr3+0x172>
  5c:	4548      	cmp	r0, r9
  5e:	bf18      	it	ne
  60:	4550      	cmpne	r0, sl
  62:	f000 8086 	beq.w	172 <memchr::fallback::memrchr3+0x172>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  66:	429f      	cmp	r7, r3
  68:	f240 80e1 	bls.w	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  6c:	f817 0c01 	ldrb.w	r0, [r7, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
  70:	f1ae 0603 	sub.w	r6, lr, #3
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  74:	42a8      	cmp	r0, r5
  76:	d07c      	beq.n	172 <memchr::fallback::memrchr3+0x172>
  78:	4548      	cmp	r0, r9
  7a:	bf18      	it	ne
  7c:	4550      	cmpne	r0, sl
  7e:	d078      	beq.n	172 <memchr::fallback::memrchr3+0x172>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
  80:	1918      	adds	r0, r3, r4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  82:	4298      	cmp	r0, r3
  84:	f240 80d3 	bls.w	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
  88:	f817 0c02 	ldrb.w	r0, [r7, #-2]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
  8c:	f1ac 0c04 	sub.w	ip, ip, #4
  90:	42a8      	cmp	r0, r5
  92:	bf18      	it	ne
  94:	4548      	cmpne	r0, r9
  96:	d06a      	beq.n	16e <memchr::fallback::memrchr3+0x16e>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
  98:	3904      	subs	r1, #4
  9a:	3c04      	subs	r4, #4
  9c:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
  a0:	4550      	cmp	r0, sl
  a2:	d1c0      	bne.n	26 <memchr::fallback::memrchr3+0x26>
  a4:	e063      	b.n	16e <memchr::fallback::memrchr3+0x16e>
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
  a6:	f04f 3001 	mov.w	r0, #16843009	; 0x1010101
  aa:	9500      	str	r5, [sp, #0]
  ac:	fb05 fb00 	mul.w	fp, r5, r0
  b0:	f8cd 9004 	str.w	r9, [sp, #4]
  b4:	464d      	mov	r5, r9
  b6:	fb09 f900 	mul.w	r9, r9, r0
  ba:	fb0a f800 	mul.w	r8, sl, r0
_ZN4core10intrinsics19copy_nonoverlapping17hc443ed0f7d99ab73E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/intrinsics.rs:1412
  be:	f85e 0c04 	ldr.w	r0, [lr, #-4]
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:260
        let eq1 = contains_zero_byte(chunk ^ vn1);
  c2:	ea80 0109 	eor.w	r1, r0, r9
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  c6:	f1a1 3201 	sub.w	r2, r1, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  ca:	ea22 0101 	bic.w	r1, r2, r1
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:261
        let eq2 = contains_zero_byte(chunk ^ vn2);
  ce:	ea80 0208 	eor.w	r2, r0, r8
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  d2:	f1a2 3401 	sub.w	r4, r2, #16843009	; 0x1010101
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:262
        let eq3 = contains_zero_byte(chunk ^ vn3);
  d6:	ea80 000b 	eor.w	r0, r0, fp
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
  da:	ea24 0202 	bic.w	r2, r4, r2
  de:	4311      	orrs	r1, r2
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
  e0:	f1a0 3201 	sub.w	r2, r0, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
  e4:	ea22 0000 	bic.w	r0, r2, r0
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:263
        if eq1 || eq2 || eq3 {
  e8:	4308      	orrs	r0, r1
  ea:	f010 3f80 	tst.w	r0, #2155905152	; 0x80808080
  ee:	d045      	beq.n	17c <memchr::fallback::memrchr3+0x17c>
  f0:	e9dd 5800 	ldrd	r5, r8, [sp]
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
  f4:	f1ac 0102 	sub.w	r1, ip, #2
  f8:	f1ac 0403 	sub.w	r4, ip, #3
  fc:	eb03 000c 	add.w	r0, r3, ip
 100:	4298      	cmp	r0, r3
 102:	f240 8094 	bls.w	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 106:	185f      	adds	r7, r3, r1
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 108:	f1ae 0601 	sub.w	r6, lr, #1
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 10c:	787a      	ldrb	r2, [r7, #1]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 10e:	42aa      	cmp	r2, r5
 110:	d02f      	beq.n	172 <memchr::fallback::memrchr3+0x172>
 112:	4542      	cmp	r2, r8
 114:	bf18      	it	ne
 116:	4552      	cmpne	r2, sl
 118:	d02b      	beq.n	172 <memchr::fallback::memrchr3+0x172>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
 11a:	3801      	subs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 11c:	4298      	cmp	r0, r3
 11e:	f240 8086 	bls.w	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 122:	5c58      	ldrb	r0, [r3, r1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 124:	f1ae 0602 	sub.w	r6, lr, #2
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 128:	42a8      	cmp	r0, r5
 12a:	d022      	beq.n	172 <memchr::fallback::memrchr3+0x172>
 12c:	4540      	cmp	r0, r8
 12e:	bf18      	it	ne
 130:	4550      	cmpne	r0, sl
 132:	d01e      	beq.n	172 <memchr::fallback::memrchr3+0x172>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 134:	429f      	cmp	r7, r3
 136:	d97a      	bls.n	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 138:	f817 0c01 	ldrb.w	r0, [r7, #-1]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 13c:	f1ae 0603 	sub.w	r6, lr, #3
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 140:	42a8      	cmp	r0, r5
 142:	d016      	beq.n	172 <memchr::fallback::memrchr3+0x172>
 144:	4540      	cmp	r0, r8
 146:	bf18      	it	ne
 148:	4550      	cmpne	r0, sl
 14a:	d012      	beq.n	172 <memchr::fallback::memrchr3+0x172>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
 14c:	1918      	adds	r0, r3, r4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 14e:	4298      	cmp	r0, r3
 150:	d96d      	bls.n	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 152:	f817 0c02 	ldrb.w	r0, [r7, #-2]
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 156:	f1ac 0c04 	sub.w	ip, ip, #4
 15a:	42a8      	cmp	r0, r5
 15c:	bf18      	it	ne
 15e:	4540      	cmpne	r0, r8
 160:	d005      	beq.n	16e <memchr::fallback::memrchr3+0x16e>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
 162:	3904      	subs	r1, #4
 164:	3c04      	subs	r4, #4
 166:	f1ae 0e04 	sub.w	lr, lr, #4
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
 16a:	4550      	cmp	r0, sl
 16c:	d1c6      	bne.n	fc <memchr::fallback::memrchr3+0xfc>
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
 16e:	eb03 060c 	add.w	r6, r3, ip
 172:	1af1      	subs	r1, r6, r3
 174:	2001      	movs	r0, #1
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:283
}
 176:	b002      	add	sp, #8
 178:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:267
        ptr = (end_ptr as usize & !align) as *const u8;
 17c:	f02e 0103 	bic.w	r1, lr, #3
 180:	1d18      	adds	r0, r3, #4
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:269
        while ptr >= ptr_add(start_ptr, USIZE_BYTES) {
 182:	1e8c      	subs	r4, r1, #2
 184:	1ca1      	adds	r1, r4, #2
 186:	4622      	mov	r2, r4
 188:	4281      	cmp	r1, r0
 18a:	d318      	bcc.n	1be <memchr::fallback::memrchr3+0x1be>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:272
            let chunk = *(ptr_sub(ptr, USIZE_BYTES) as *const usize);
 18c:	f852 4c02 	ldr.w	r4, [r2, #-2]
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:273
            let eq1 = contains_zero_byte(chunk ^ vn1);
 190:	ea84 0609 	eor.w	r6, r4, r9
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 194:	f1a6 3701 	sub.w	r7, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 198:	43b7      	bics	r7, r6
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:274
            let eq2 = contains_zero_byte(chunk ^ vn2);
 19a:	ea84 0608 	eor.w	r6, r4, r8
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 19e:	f1a6 3501 	sub.w	r5, r6, #16843009	; 0x1010101
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 1a2:	ea25 0606 	bic.w	r6, r5, r6
 1a6:	4337      	orrs	r7, r6
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:275
            let eq3 = contains_zero_byte(chunk ^ vn3);
 1a8:	ea84 060b 	eor.w	r6, r4, fp
_ZN4core3num23_$LT$impl$u20$usize$GT$12wrapping_sub17h21c9a3837c4f2b48E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/num/mod.rs:3071
 1ac:	f1a6 3501 	sub.w	r5, r6, #16843009	; 0x1010101
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:276
            if eq1 || eq2 || eq3 {
 1b0:	1f14      	subs	r4, r2, #4
_ZN6memchr8fallback18contains_zero_byte17hd43a865c32c02dc2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:33
    x.wrapping_sub(LO_USIZE) & !x & HI_USIZE != 0
 1b2:	ea25 0606 	bic.w	r6, r5, r6
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:276
            if eq1 || eq2 || eq3 {
 1b6:	4337      	orrs	r7, r6
 1b8:	f017 3f80 	tst.w	r7, #2155905152	; 0x80808080
 1bc:	d0e2      	beq.n	184 <memchr::fallback::memrchr3+0x184>
 1be:	e9dd 5400 	ldrd	r5, r4, [sp]
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 1c2:	1c90      	adds	r0, r2, #2
 1c4:	4298      	cmp	r0, r3
 1c6:	d932      	bls.n	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 1c8:	4610      	mov	r0, r2
 1ca:	f810 7f01 	ldrb.w	r7, [r0, #1]!
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1ce:	42af      	cmp	r7, r5
 1d0:	bf18      	it	ne
 1d2:	42a7      	cmpne	r7, r4
 1d4:	d025      	beq.n	222 <memchr::fallback::memrchr3+0x222>
 1d6:	4557      	cmp	r7, sl
 1d8:	d023      	beq.n	222 <memchr::fallback::memrchr3+0x222>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 1da:	4298      	cmp	r0, r3
 1dc:	d927      	bls.n	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 1de:	7810      	ldrb	r0, [r2, #0]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1e0:	1e8f      	subs	r7, r1, #2
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1e2:	42a8      	cmp	r0, r5
 1e4:	d01e      	beq.n	224 <memchr::fallback::memrchr3+0x224>
 1e6:	42a0      	cmp	r0, r4
 1e8:	bf18      	it	ne
 1ea:	4550      	cmpne	r0, sl
 1ec:	d01a      	beq.n	224 <memchr::fallback::memrchr3+0x224>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 1ee:	429a      	cmp	r2, r3
 1f0:	d91d      	bls.n	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 1f2:	4610      	mov	r0, r2
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 1f4:	1ecf      	subs	r7, r1, #3
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
 1f6:	f810 6d01 	ldrb.w	r6, [r0, #-1]!
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 1fa:	42ae      	cmp	r6, r5
 1fc:	d012      	beq.n	224 <memchr::fallback::memrchr3+0x224>
 1fe:	42a6      	cmp	r6, r4
 200:	bf18      	it	ne
 202:	4556      	cmpne	r6, sl
 204:	d00e      	beq.n	224 <memchr::fallback::memrchr3+0x224>
_ZN6memchr8fallback14reverse_search17h36c6ee9d7f7d7aebE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:314
    while ptr > start_ptr {
 206:	4298      	cmp	r0, r3
 208:	d911      	bls.n	22e <memchr::fallback::memrchr3+0x22e>
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:316
        if confirm(*ptr) {
 20a:	f812 0c02 	ldrb.w	r0, [r2, #-2]
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 20e:	3904      	subs	r1, #4
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
    let confirm = |byte| byte == n1 || byte == n2 || byte == n3;
 210:	42a8      	cmp	r0, r5
 212:	bf18      	it	ne
 214:	42a0      	cmpne	r0, r4
 216:	d00e      	beq.n	236 <memchr::fallback::memrchr3+0x236>
 218:	3a04      	subs	r2, #4
 21a:	4550      	cmp	r0, sl
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 21c:	460f      	mov	r7, r1
_ZN6memchr8fallback8memrchr328_$u7b$$u7b$closure$u7d$$u7d$17hb2c27d95332c2339E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:248
 21e:	d1d0      	bne.n	1c2 <memchr::fallback::memrchr3+0x1c2>
 220:	e000      	b.n	224 <memchr::fallback::memrchr3+0x224>
 222:	1c57      	adds	r7, r2, #1
_ZN6memchr8fallback3sub17hdb15cf4fbff8b00bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 224:	1af9      	subs	r1, r7, r3
 226:	2001      	movs	r0, #1
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:283
}
 228:	b002      	add	sp, #8
 22a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 22e:	2000      	movs	r0, #0
 230:	b002      	add	sp, #8
 232:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_ZN4core3ptr33_$LT$impl$u20$$BP$const$u20$T$GT$6offset17h4e4d34e4f8a70e93E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/ptr.rs:1077
 236:	460f      	mov	r7, r1
_ZN6memchr8fallback3sub17hdb15cf4fbff8b00bE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:345
    (a as usize) - (b as usize)
 238:	1ac9      	subs	r1, r1, r3
 23a:	2001      	movs	r0, #1
_ZN6memchr8fallback8memrchr317hd0b263e7569dac84E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/memchr-2.2.0/src/fallback.rs:283
}
 23c:	b002      	add	sp, #8
 23e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

mylib-0948c04052cf796a.mylib.6fgjgbzt-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 mylib.6fgjgbzt-cgu.0
000019b0 l       .debug_str	00000000 
00001b69 l       .debug_str	00000000 
00001b6e l       .debug_str	00000000 
00001b73 l       .debug_str	00000000 
00001b7d l       .debug_str	00000000 
00001b89 l       .debug_str	00000000 
00001c0c l       .debug_str	00000000 
00001c16 l       .debug_str	00000000 
00001c1c l       .debug_str	00000000 
00001c22 l       .debug_str	00000000 
00001c26 l       .debug_str	00000000 
00001c33 l       .debug_str	00000000 
00001cb9 l       .debug_str	00000000 
00001cc8 l       .debug_str	00000000 
00001cca l       .debug_str	00000000 
00001d3f l       .debug_str	00000000 
00001d6a l       .debug_str	00000000 
00001d70 l       .debug_str	00000000 
00001d77 l       .debug_str	00000000 
00001d83 l       .debug_str	00000000 
00001d8b l       .debug_str	00000000 
00001d94 l       .debug_str	00000000 
00001d99 l       .debug_str	00000000 
00001d9c l       .debug_str	00000000 
00001da5 l       .debug_str	00000000 
00001dac l       .debug_str	00000000 
00001daf l       .debug_str	00000000 
00001db5 l       .debug_str	00000000 
00001dbf l       .debug_str	00000000 
00001dc7 l       .debug_str	00000000 
00001dcd l       .debug_str	00000000 
00001dd8 l       .debug_str	00000000 
00001de1 l       .debug_str	00000000 
00001e04 l       .debug_str	00000000 
00001e23 l       .debug_str	00000000 
00001e4a l       .debug_str	00000000 
00001e54 l       .debug_str	00000000 
00001e86 l       .debug_str	00000000 
00001e8d l       .debug_str	00000000 
00001ec9 l       .debug_str	00000000 
00001edc l       .debug_str	00000000 
00001ee2 l       .debug_str	00000000 
00001f26 l       .debug_str	00000000 
00001f3c l       .debug_str	00000000 
00001f45 l       .debug_str	00000000 
00001f49 l       .debug_str	00000000 
00001f88 l       .debug_str	00000000 
00001f9a l       .debug_str	00000000 
00001fa3 l       .debug_str	00000000 
00001fa7 l       .debug_str	00000000 
00001fd1 l       .debug_str	00000000 
00001fd6 l       .debug_str	00000000 
0000201e l       .debug_str	00000000 
00002027 l       .debug_str	00000000 
0000206f l       .debug_str	00000000 
0000207e l       .debug_str	00000000 
000020c6 l       .debug_str	00000000 
00002130 l       .debug_str	00000000 
00002138 l       .debug_str	00000000 
0000213c l       .debug_str	00000000 
00002142 l       .debug_str	00000000 
00002165 l       .debug_str	00000000 
000021b9 l       .debug_str	00000000 
00002215 l       .debug_str	00000000 
0000221a l       .debug_str	00000000 
0000226c l       .debug_str	00000000 
000022c6 l       .debug_str	00000000 
000022d3 l       .debug_str	00000000 
00002300 l       .debug_str	00000000 
00002305 l       .debug_str	00000000 
0000236d l       .debug_str	00000000 
000023d7 l       .debug_str	00000000 
00002440 l       .debug_str	00000000 
000024a6 l       .debug_str	00000000 
0000250d l       .debug_str	00000000 
00002577 l       .debug_str	00000000 
000025df l       .debug_str	00000000 
0000264e l       .debug_str	00000000 
000026b5 l       .debug_str	00000000 
00002721 l       .debug_str	00000000 
0000272b l       .debug_str	00000000 
00002734 l       .debug_str	00000000 
00002741 l       .debug_str	00000000 
000027a7 l       .debug_str	00000000 
000027ea l       .debug_str	00000000 
00002800 l       .debug_str	00000000 
00002884 l       .debug_str	00000000 
000028c3 l       .debug_str	00000000 
000028d4 l       .debug_str	00000000 
0000290f l       .debug_str	00000000 
00002921 l       .debug_str	00000000 
00002926 l       .debug_str	00000000 
00002928 l       .debug_str	00000000 
0000293a l       .debug_str	00000000 
00002940 l       .debug_str	00000000 
00002948 l       .debug_str	00000000 
0000294d l       .debug_str	00000000 
0000295a l       .debug_str	00000000 
00002967 l       .debug_str	00000000 
0000296e l       .debug_str	00000000 
0000297e l       .debug_str	00000000 
00002990 l       .debug_str	00000000 
0000299c l       .debug_str	00000000 
000029a1 l       .debug_str	00000000 
000029a9 l       .debug_str	00000000 
000029ad l       .debug_str	00000000 
000029b2 l       .debug_str	00000000 
000029ba l       .debug_str	00000000 
000029d0 l       .debug_str	00000000 
000029ee l       .debug_str	00000000 
000029f7 l       .debug_str	00000000 
000029fc l       .debug_str	00000000 
00002a01 l       .debug_str	00000000 
00002a05 l       .debug_str	00000000 
00002a0e l       .debug_str	00000000 
00002a18 l       .debug_str	00000000 
00002a30 l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
0000004c l       .debug_str	00000000 
0000007c l       .debug_str	00000000 
00000082 l       .debug_str	00000000 
00000089 l       .debug_str	00000000 
00000090 l       .debug_str	00000000 
000000a2 l       .debug_str	00000000 
000000b1 l       .debug_str	00000000 
000000b5 l       .debug_str	00000000 
000000bd l       .debug_str	00000000 
000000c1 l       .debug_str	00000000 
000000c5 l       .debug_str	00000000 
000000cf l       .debug_str	00000000 
000000d9 l       .debug_str	00000000 
000000df l       .debug_str	00000000 
00000103 l       .debug_str	00000000 
0000016c l       .debug_str	00000000 
00000173 l       .debug_str	00000000 
0000017b l       .debug_str	00000000 
0000018a l       .debug_str	00000000 
000001c9 l       .debug_str	00000000 
000001d3 l       .debug_str	00000000 
000001e0 l       .debug_str	00000000 
000001e3 l       .debug_str	00000000 
000001ee l       .debug_str	00000000 
000001f7 l       .debug_str	00000000 
00000202 l       .debug_str	00000000 
0000020e l       .debug_str	00000000 
00000212 l       .debug_str	00000000 
0000021b l       .debug_str	00000000 
0000021e l       .debug_str	00000000 
00000225 l       .debug_str	00000000 
0000022d l       .debug_str	00000000 
00000235 l       .debug_str	00000000 
0000023f l       .debug_str	00000000 
00000245 l       .debug_str	00000000 
0000024c l       .debug_str	00000000 
00000256 l       .debug_str	00000000 
0000025d l       .debug_str	00000000 
00000262 l       .debug_str	00000000 
00000269 l       .debug_str	00000000 
0000026e l       .debug_str	00000000 
00000272 l       .debug_str	00000000 
0000027d l       .debug_str	00000000 
00000288 l       .debug_str	00000000 
0000028f l       .debug_str	00000000 
000002a6 l       .debug_str	00000000 
000002d3 l       .debug_str	00000000 
000002d5 l       .debug_str	00000000 
000002da l       .debug_str	00000000 
000002de l       .debug_str	00000000 
00000313 l       .debug_str	00000000 
00000319 l       .debug_str	00000000 
0000031f l       .debug_str	00000000 
0000032e l       .debug_str	00000000 
0000033e l       .debug_str	00000000 
0000034e l       .debug_str	00000000 
00000356 l       .debug_str	00000000 
0000037e l       .debug_str	00000000 
000003db l       .debug_str	00000000 
00000440 l       .debug_str	00000000 
00000447 l       .debug_str	00000000 
0000044f l       .debug_str	00000000 
00000458 l       .debug_str	00000000 
00000476 l       .debug_str	00000000 
00000486 l       .debug_str	00000000 
00000494 l       .debug_str	00000000 
0000049f l       .debug_str	00000000 
000004ac l       .debug_str	00000000 
000004bb l       .debug_str	00000000 
000004c5 l       .debug_str	00000000 
000004e5 l       .debug_str	00000000 
000004fb l       .debug_str	00000000 
00000505 l       .debug_str	00000000 
0000050e l       .debug_str	00000000 
00000517 l       .debug_str	00000000 
0000053c l       .debug_str	00000000 
00000552 l       .debug_str	00000000 
0000055d l       .debug_str	00000000 
00000573 l       .debug_str	00000000 
0000057b l       .debug_str	00000000 
000005b1 l       .debug_str	00000000 
000005c4 l       .debug_str	00000000 
000005d8 l       .debug_str	00000000 
00000614 l       .debug_str	00000000 
00000625 l       .debug_str	00000000 
0000062a l       .debug_str	00000000 
00000664 l       .debug_str	00000000 
0000066b l       .debug_str	00000000 
0000066e l       .debug_str	00000000 
00000672 l       .debug_str	00000000 
00000679 l       .debug_str	00000000 
0000067d l       .debug_str	00000000 
00000680 l       .debug_str	00000000 
00000683 l       .debug_str	00000000 
00000688 l       .debug_str	00000000 
0000068e l       .debug_str	00000000 
00000695 l       .debug_str	00000000 
0000069d l       .debug_str	00000000 
000006a7 l       .debug_str	00000000 
000006ab l       .debug_str	00000000 
000006b4 l       .debug_str	00000000 
00000711 l       .debug_str	00000000 
00000716 l       .debug_str	00000000 
0000071b l       .debug_str	00000000 
0000071d l       .debug_str	00000000 
00000723 l       .debug_str	00000000 
00000728 l       .debug_str	00000000 
0000072d l       .debug_str	00000000 
00000733 l       .debug_str	00000000 
00000739 l       .debug_str	00000000 
0000073f l       .debug_str	00000000 
0000074d l       .debug_str	00000000 
00000757 l       .debug_str	00000000 
0000075b l       .debug_str	00000000 
00000763 l       .debug_str	00000000 
0000076b l       .debug_str	00000000 
00000772 l       .debug_str	00000000 
0000077e l       .debug_str	00000000 
00000789 l       .debug_str	00000000 
00000790 l       .debug_str	00000000 
00000796 l       .debug_str	00000000 
0000079a l       .debug_str	00000000 
000007a0 l       .debug_str	00000000 
000007a6 l       .debug_str	00000000 
000007a9 l       .debug_str	00000000 
000007b8 l       .debug_str	00000000 
000007bf l       .debug_str	00000000 
000007c3 l       .debug_str	00000000 
000007cc l       .debug_str	00000000 
000007d8 l       .debug_str	00000000 
000007f1 l       .debug_str	00000000 
000007f6 l       .debug_str	00000000 
00000807 l       .debug_str	00000000 
00000811 l       .debug_str	00000000 
0000086f l       .debug_str	00000000 
0000087a l       .debug_str	00000000 
00000897 l       .debug_str	00000000 
0000089b l       .debug_str	00000000 
000008a3 l       .debug_str	00000000 
000008ba l       .debug_str	00000000 
000008de l       .debug_str	00000000 
000008fa l       .debug_str	00000000 
000008ff l       .debug_str	00000000 
00000908 l       .debug_str	00000000 
0000090f l       .debug_str	00000000 
00000928 l       .debug_str	00000000 
00000932 l       .debug_str	00000000 
0000094c l       .debug_str	00000000 
000009a0 l       .debug_str	00000000 
000009a8 l       .debug_str	00000000 
000009b3 l       .debug_str	00000000 
000009bd l       .debug_str	00000000 
000009c7 l       .debug_str	00000000 
000009cb l       .debug_str	00000000 
00000a1d l       .debug_str	00000000 
00000a79 l       .debug_str	00000000 
00000a7d l       .debug_str	00000000 
00000a86 l       .debug_str	00000000 
00000a8a l       .debug_str	00000000 
00000a94 l       .debug_str	00000000 
00000a9a l       .debug_str	00000000 
00000abb l       .debug_str	00000000 
00000af2 l       .debug_str	00000000 
00000b31 l       .debug_str	00000000 
00000b38 l       .debug_str	00000000 
00000b40 l       .debug_str	00000000 
00000b57 l       .debug_str	00000000 
00000b60 l       .debug_str	00000000 
00000b88 l       .debug_str	00000000 
00000bac l       .debug_str	00000000 
00000bb1 l       .debug_str	00000000 
00000bb7 l       .debug_str	00000000 
00000bc1 l       .debug_str	00000000 
00000bca l       .debug_str	00000000 
00000bd3 l       .debug_str	00000000 
00000bde l       .debug_str	00000000 
00000be8 l       .debug_str	00000000 
00000c0e l       .debug_str	00000000 
00000c26 l       .debug_str	00000000 
00000c30 l       .debug_str	00000000 
00000c52 l       .debug_str	00000000 
00000c5a l       .debug_str	00000000 
00000c61 l       .debug_str	00000000 
00000c84 l       .debug_str	00000000 
00000cac l       .debug_str	00000000 
00000cc5 l       .debug_str	00000000 
00000cd0 l       .debug_str	00000000 
00000cf8 l       .debug_str	00000000 
00000d1e l       .debug_str	00000000 
00000d28 l       .debug_str	00000000 
00000d30 l       .debug_str	00000000 
00000d37 l       .debug_str	00000000 
00000d3e l       .debug_str	00000000 
00000d43 l       .debug_str	00000000 
00000d65 l       .debug_str	00000000 
00000d8c l       .debug_str	00000000 
00000da4 l       .debug_str	00000000 
00000dae l       .debug_str	00000000 
00000dd6 l       .debug_str	00000000 
00000dfb l       .debug_str	00000000 
00000e07 l       .debug_str	00000000 
00000e0f l       .debug_str	00000000 
00000e2e l       .debug_str	00000000 
00000e87 l       .debug_str	00000000 
00000ee8 l       .debug_str	00000000 
00000ef3 l       .debug_str	00000000 
00000f39 l       .debug_str	00000000 
00000f87 l       .debug_str	00000000 
00000f91 l       .debug_str	00000000 
00000fcd l       .debug_str	00000000 
00001011 l       .debug_str	00000000 
0000101a l       .debug_str	00000000 
0000102a l       .debug_str	00000000 
00001032 l       .debug_str	00000000 
00001086 l       .debug_str	00000000 
000010e2 l       .debug_str	00000000 
000010ee l       .debug_str	00000000 
000010f7 l       .debug_str	00000000 
00001103 l       .debug_str	00000000 
0000110f l       .debug_str	00000000 
00001118 l       .debug_str	00000000 
00001120 l       .debug_str	00000000 
00001128 l       .debug_str	00000000 
0000113d l       .debug_str	00000000 
00001144 l       .debug_str	00000000 
0000116c l       .debug_str	00000000 
0000118e l       .debug_str	00000000 
00001196 l       .debug_str	00000000 
0000119f l       .debug_str	00000000 
000011ad l       .debug_str	00000000 
000011b4 l       .debug_str	00000000 
000011bb l       .debug_str	00000000 
000011cb l       .debug_str	00000000 
000011d4 l       .debug_str	00000000 
000011e2 l       .debug_str	00000000 
000011f0 l       .debug_str	00000000 
000011fc l       .debug_str	00000000 
00001208 l       .debug_str	00000000 
00001211 l       .debug_str	00000000 
00001220 l       .debug_str	00000000 
00001228 l       .debug_str	00000000 
00001241 l       .debug_str	00000000 
00001252 l       .debug_str	00000000 
0000125c l       .debug_str	00000000 
00001264 l       .debug_str	00000000 
0000127e l       .debug_str	00000000 
0000128a l       .debug_str	00000000 
000012ae l       .debug_str	00000000 
000012c7 l       .debug_str	00000000 
000012cc l       .debug_str	00000000 
000012d7 l       .debug_str	00000000 
000012fa l       .debug_str	00000000 
00001303 l       .debug_str	00000000 
0000131e l       .debug_str	00000000 
0000132b l       .debug_str	00000000 
00001350 l       .debug_str	00000000 
00001358 l       .debug_str	00000000 
00001378 l       .debug_str	00000000 
0000138e l       .debug_str	00000000 
00001399 l       .debug_str	00000000 
000013a9 l       .debug_str	00000000 
000013ad l       .debug_str	00000000 
000013c8 l       .debug_str	00000000 
000013d0 l       .debug_str	00000000 
000013f8 l       .debug_str	00000000 
0000141b l       .debug_str	00000000 
00001443 l       .debug_str	00000000 
00001469 l       .debug_str	00000000 
00001471 l       .debug_str	00000000 
00001488 l       .debug_str	00000000 
0000148d l       .debug_str	00000000 
00001495 l       .debug_str	00000000 
0000149e l       .debug_str	00000000 
000014a7 l       .debug_str	00000000 
000014b0 l       .debug_str	00000000 
000014d8 l       .debug_str	00000000 
000014fc l       .debug_str	00000000 
00001524 l       .debug_str	00000000 
0000154f l       .debug_str	00000000 
00001577 l       .debug_str	00000000 
0000159a l       .debug_str	00000000 
000015a3 l       .debug_str	00000000 
000015b8 l       .debug_str	00000000 
000015c3 l       .debug_str	00000000 
000015ca l       .debug_str	00000000 
000015f2 l       .debug_str	00000000 
00001614 l       .debug_str	00000000 
00001623 l       .debug_str	00000000 
0000162e l       .debug_str	00000000 
0000163d l       .debug_str	00000000 
00001652 l       .debug_str	00000000 
0000166a l       .debug_str	00000000 
000016bd l       .debug_str	00000000 
00001718 l       .debug_str	00000000 
0000172d l       .debug_str	00000000 
00001746 l       .debug_str	00000000 
0000176e l       .debug_str	00000000 
000017ae l       .debug_str	00000000 
000017b3 l       .debug_str	00000000 
000017e5 l       .debug_str	00000000 
000017f3 l       .debug_str	00000000 
000017f7 l       .debug_str	00000000 
000017fd l       .debug_str	00000000 
00001801 l       .debug_str	00000000 
0000180f l       .debug_str	00000000 
0000184d l       .debug_str	00000000 
0000185d l       .debug_str	00000000 
00001861 l       .debug_str	00000000 
00001866 l       .debug_str	00000000 
0000186a l       .debug_str	00000000 
0000186f l       .debug_str	00000000 
00001875 l       .debug_str	00000000 
00001879 l       .debug_str	00000000 
00001889 l       .debug_str	00000000 
00001895 l       .debug_str	00000000 
000018a1 l       .debug_str	00000000 
000018ad l       .debug_str	00000000 
000018ba l       .debug_str	00000000 
000018c6 l       .debug_str	00000000 
000018d4 l       .debug_str	00000000 
000018eb l       .debug_str	00000000 
000018fd l       .debug_str	00000000 
00001900 l       .debug_str	00000000 
00001920 l       .debug_str	00000000 
00001929 l       .debug_str	00000000 
00001932 l       .debug_str	00000000 
00001944 l       .debug_str	00000000 
00001953 l       .debug_str	00000000 
0000198d l       .debug_str	00000000 
0000199e l       .debug_str	00000000 
000019a0 l       .debug_str	00000000 
000019bb l       .debug_str	00000000 
000019d5 l       .debug_str	00000000 
000019e1 l       .debug_str	00000000 
000019eb l       .debug_str	00000000 
000019f1 l       .debug_str	00000000 
000019f6 l       .debug_str	00000000 
00001a07 l       .debug_str	00000000 
00001a10 l       .debug_str	00000000 
00001a18 l       .debug_str	00000000 
00001a22 l       .debug_str	00000000 
00001a2f l       .debug_str	00000000 
00001a76 l       .debug_str	00000000 
00001a94 l       .debug_str	00000000 
00001a9d l       .debug_str	00000000 
00001aa2 l       .debug_str	00000000 
00001aab l       .debug_str	00000000 
00001adb l       .debug_str	00000000 
00001ae4 l       .debug_str	00000000 
00001aea l       .debug_str	00000000 
00001b2e l       .debug_str	00000000 
00001b49 l       .debug_str	00000000 
00001b51 l       .debug_str	00000000 
00001b5a l       .debug_str	00000000 
00001b64 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.11	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.11
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.13	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.13
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.14	00000011 .Lanon.586ce42fc55749843a9229a56173fbcf.14
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.16	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.16
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.18	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.18
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.19	00000016 .Lanon.586ce42fc55749843a9229a56173fbcf.19
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.2	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.2
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.21	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.21
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.22	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.22
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.23	00000019 .Lanon.586ce42fc55749843a9229a56173fbcf.23
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.24	00000001 .Lanon.586ce42fc55749843a9229a56173fbcf.24
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.25	0000000a .Lanon.586ce42fc55749843a9229a56173fbcf.25
00000000 l     O .rodata.cst8	00000008 .Lanon.586ce42fc55749843a9229a56173fbcf.26
00000000 l     O .rodata.cst16	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.27
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.28	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.28
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.3	0000000a .Lanon.586ce42fc55749843a9229a56173fbcf.3
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.30	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.30
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.31	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.31
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.32	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.32
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.33	00000011 .Lanon.586ce42fc55749843a9229a56173fbcf.33
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.34	00000011 .Lanon.586ce42fc55749843a9229a56173fbcf.34
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.35	00000001 .Lanon.586ce42fc55749843a9229a56173fbcf.35
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.36	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.36
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.38	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.38
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.39	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.39
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.4	0000000d .Lanon.586ce42fc55749843a9229a56173fbcf.4
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.40	00000010 .Lanon.586ce42fc55749843a9229a56173fbcf.40
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.42	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.42
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.43	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.43
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.44	0000004b .Lanon.586ce42fc55749843a9229a56173fbcf.44
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.45	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.45
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.46	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.46
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.47	00000021 .Lanon.586ce42fc55749843a9229a56173fbcf.47
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.48	00000012 .Lanon.586ce42fc55749843a9229a56173fbcf.48
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.49	00000009 .Lanon.586ce42fc55749843a9229a56173fbcf.49
00000000 l     O .rodata.cst4	00000004 .Lanon.586ce42fc55749843a9229a56173fbcf.5
00000008 l     O .rodata.cst8	00000008 .Lanon.586ce42fc55749843a9229a56173fbcf.50
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.51	00000001 .Lanon.586ce42fc55749843a9229a56173fbcf.51
00000000 l     O .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.9	00000018 .Lanon.586ce42fc55749843a9229a56173fbcf.9
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3cd16d96a1ab09b9E	0000003a <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbb6268d049e95435E	00000050 <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9a0951cf9a1a237E	0000003a <&T as core::fmt::Debug>::fmt
00000000 l     F .text._ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE	000002d4 mylib::listen_sensor::read_temperature
00000000 l     O .data._ZN5mylib6mynewt6sensor17LISTENER_INTERNAL17h558a6fa11f6c60d7E	00000018 mylib::mynewt::sensor::LISTENER_INTERNAL
00000000 l     F .text._ZN5mylib6mynewt6sensor21null_sensor_data_func17hd8c42d7d02a586efE	00000004 mylib::mynewt::sensor::null_sensor_data_func
00000000 l     O .bss._ZN5mylib9send_coap12NETWORK_TASK17had6f3c509df1c5ddE	00000050 mylib::send_coap::NETWORK_TASK
00000000 l     O .bss._ZN5mylib9send_coap16NETWORK_IS_READY17h9c862a27d6aefdb0E.0.0	00000001 _ZN5mylib9send_coap16NETWORK_IS_READY17h9c862a27d6aefdb0E.0.0
00000000 l     F .text._ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E	0000011a mylib::send_coap::network_task_func
00000000 l     O .bss._ZN5mylib9send_coap18NETWORK_TASK_STACK17hfae71d0c8a5b92e9E	00000400 mylib::send_coap::NETWORK_TASK_STACK
00000000 l     O .rodata.str.2	00000010 str.2
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3cd16d96a1ab09b9E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3cd16d96a1ab09b9E
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbb6268d049e95435E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbb6268d049e95435E
00000000 l    d  .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9a0951cf9a1a237E	00000000 .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9a0951cf9a1a237E
00000000 l    d  .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000000 .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE
00000000 l    d  .text._ZN70_$LT$mylib..mynewt..os..os_event$u20$as$u20$core..default..Default$GT$7default17hd0f0cd69f8864351E	00000000 .text._ZN70_$LT$mylib..mynewt..os..os_event$u20$as$u20$core..default..Default$GT$7default17hd0f0cd69f8864351E
00000000 l    d  .text._ZN72_$LT$mylib..mynewt..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h482826e974b6b674E	00000000 .text._ZN72_$LT$mylib..mynewt..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h482826e974b6b674E
00000000 l    d  .text._ZN71_$LT$mylib..mynewt..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17hd8128d4c19f97636E	00000000 .text._ZN71_$LT$mylib..mynewt..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17hd8128d4c19f97636E
00000000 l    d  .text._ZN68_$LT$mylib..mynewt..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h51ca089748e9a617E	00000000 .text._ZN68_$LT$mylib..mynewt..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h51ca089748e9a617E
00000000 l    d  .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE	00000000 .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE
00000000 l    d  .text._ZN72_$LT$mylib..mynewt..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17h944ab538693cd27cE	00000000 .text._ZN72_$LT$mylib..mynewt..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17h944ab538693cd27cE
00000000 l    d  .text._ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E	00000000 .text._ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E
00000000 l    d  .text._ZN77_$LT$mylib..mynewt..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd585e14b041eaa38E	00000000 .text._ZN77_$LT$mylib..mynewt..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd585e14b041eaa38E
00000000 l    d  .text._ZN69_$LT$mylib..mynewt..os..os_task$u20$as$u20$core..default..Default$GT$7default17hffe52c3c59b86de4E	00000000 .text._ZN69_$LT$mylib..mynewt..os..os_task$u20$as$u20$core..default..Default$GT$7default17hffe52c3c59b86de4E
00000000 l    d  .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000000 .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E
00000000 l    d  .text._ZN68_$LT$mylib..mynewt..os..os_sem$u20$as$u20$core..default..Default$GT$7default17hadd0a9434ed12decE	00000000 .text._ZN68_$LT$mylib..mynewt..os..os_sem$u20$as$u20$core..default..Default$GT$7default17hadd0a9434ed12decE
00000000 l    d  .text._ZN5mylib6mynewt6sensor21null_sensor_data_func17hd8c42d7d02a586efE	00000000 .text._ZN5mylib6mynewt6sensor21null_sensor_data_func17hd8c42d7d02a586efE
00000000 l    d  .text._ZN98_$LT$mylib..mynewt..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17hf0a2a793a330461fE	00000000 .text._ZN98_$LT$mylib..mynewt..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17hf0a2a793a330461fE
00000000 l    d  .text._ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE	00000000 .text._ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE
00000000 l    d  .text._ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E	00000000 .text._ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E
00000000 l    d  .text.main	00000000 .text.main
00000000 l    d  .text.rust_begin_unwind	00000000 .text.rust_begin_unwind
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.0	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.0
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.1	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.1
00000000 l    d  .data._ZN5mylib6mynewt6sensor17LISTENER_INTERNAL17h558a6fa11f6c60d7E	00000000 .data._ZN5mylib6mynewt6sensor17LISTENER_INTERNAL17h558a6fa11f6c60d7E
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.6	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.6
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.7	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.7
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.8	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.8
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.10	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.10
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.12	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.12
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.15	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.15
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.17	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.17
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.20	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.20
00000000 l    d  .bss._ZN5mylib9send_coap12NETWORK_TASK17had6f3c509df1c5ddE	00000000 .bss._ZN5mylib9send_coap12NETWORK_TASK17had6f3c509df1c5ddE
00000000 l    d  .bss._ZN5mylib9send_coap18NETWORK_TASK_STACK17hfae71d0c8a5b92e9E	00000000 .bss._ZN5mylib9send_coap18NETWORK_TASK_STACK17hfae71d0c8a5b92e9E
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.29	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.29
00000000 l    d  .rodata.str.2	00000000 .rodata.str.2
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.37	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.37
00000000 l    d  .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.41	00000000 .rodata..Lanon.586ce42fc55749843a9229a56173fbcf.41
00000000 l    d  .bss._ZN5mylib9send_coap16NETWORK_IS_READY17h9c862a27d6aefdb0E.0.0	00000000 .bss._ZN5mylib9send_coap16NETWORK_IS_READY17h9c862a27d6aefdb0E.0.0
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000         *UND*	00000000 core::fmt::num::imp::<impl core::fmt::Display for u8>::fmt
00000000         *UND*	00000000 core::fmt::num::imp::<impl core::fmt::Display for i32>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::LowerHex for u8>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::UpperHex for u8>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::LowerHex for i32>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::UpperHex for i32>::fmt
00000000         *UND*	00000000 core::fmt::num::<impl core::fmt::LowerHex for usize>::fmt
00000000         *UND*	00000000 core::fmt::Formatter::debug_lower_hex
00000000         *UND*	00000000 core::fmt::Formatter::debug_upper_hex
00000000         *UND*	00000000 core::fmt::Formatter::alternate
00000000         *UND*	00000000 core::panic::Location::file
00000000         *UND*	00000000 core::panic::Location::line
00000000         *UND*	00000000 core::panic::PanicInfo::location
00000000         *UND*	00000000 core::slice::slice_index_len_fail
00000000         *UND*	00000000 core::panicking::panic_bounds_check
00000000         *UND*	00000000 core::panicking::panic
00000000         *UND*	00000000 core::panicking::panic_fmt
00000000 g     F .text._ZN68_$LT$mylib..mynewt..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h51ca089748e9a617E	0000000a <mylib::mynewt::os::os_dev as core::default::Default>::default
00000000 g     F .text._ZN68_$LT$mylib..mynewt..os..os_sem$u20$as$u20$core..default..Default$GT$7default17hadd0a9434ed12decE	00000008 <mylib::mynewt::os::os_sem as core::default::Default>::default
00000000 g     F .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE	0000000c <mylib::mynewt::os::os_mbuf as core::default::Default>::default
00000000 g     F .text._ZN69_$LT$mylib..mynewt..os..os_task$u20$as$u20$core..default..Default$GT$7default17hffe52c3c59b86de4E	0000000a <mylib::mynewt::os::os_task as core::default::Default>::default
00000000 g     F .text._ZN70_$LT$mylib..mynewt..os..os_event$u20$as$u20$core..default..Default$GT$7default17hd0f0cd69f8864351E	0000000c <mylib::mynewt::os::os_event as core::default::Default>::default
00000000 g     F .text._ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E	0000000a <mylib::mynewt::os::os_mutex as core::default::Default>::default
00000000 g     F .text._ZN71_$LT$mylib..mynewt..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17hd8128d4c19f97636E	00000010 <mylib::mynewt::os::hal_timer as core::default::Default>::default
00000000 g     F .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE	0000000c <mylib::mynewt::os::os_eventq as core::default::Default>::default
00000000 g     F .text._ZN71_$LT$mylib..mynewt..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17hd8128d4c19f97636E	00000010 <mylib::mynewt::os::os_mqueue as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h482826e974b6b674E	00000014 <mylib::mynewt::os::os_callout as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17h944ab538693cd27cE	00000012 <mylib::mynewt::os::os_mempool as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::tinycbor::File as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_memblock as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_task_obj as core::default::Default>::default
00000000 g     F .text._ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E	0000000a <mylib::mynewt::os::os_mbuf_pool as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::os_task_list as core::default::Default>::default
00000000 g     F .text._ZN68_$LT$mylib..mynewt..os..os_sem$u20$as$u20$core..default..Default$GT$7default17hadd0a9434ed12decE	00000008 <mylib::mynewt::os::os_mbuf_pkthdr as core::default::Default>::default
00000000 g     F .text._ZN68_$LT$mylib..mynewt..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h51ca089748e9a617E	0000000a <mylib::mynewt::os::os_mempool_ext as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::os_task_stailq as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::os_callout_list as core::default::Default>::default
00000000 g     F .text._ZN77_$LT$mylib..mynewt..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd585e14b041eaa38E	0000000e <mylib::mynewt::os::os_sanity_check as core::default::Default>::default
00000000 g     F .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE	0000000c <mylib::mynewt::tinycbor::CborValue as core::default::Default>::default
00000000 g     F .text._ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E	0000000a <mylib::mynewt::tinycbor::CborParser as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::tinycbor::cbor_iovec as core::default::Default>::default
00000000 g     F .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE	0000000c <mylib::mynewt::tinycbor::CborEncoder as core::default::Default>::default
00000000 g     F .text._ZN77_$LT$mylib..mynewt..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd585e14b041eaa38E	0000000e <mylib::mynewt::os::os_time_change_info as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_dev__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_sem__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_mbuf__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_task__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::os_task__bindgen_ty_2 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_task__bindgen_ty_3 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_event__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_mutex__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::hal_timer__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::os_eventq__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::os_mqueue__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E	0000000a <mylib::mynewt::os::os_time_change_listener as core::default::Default>::default
00000000 g     F .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E	00000006 <mylib::mynewt::os::os_callout__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_mempool__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_mempool__bindgen_ty_2 as core::default::Default>::default
00000000 g     F .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE	0000000c <mylib::mynewt::sensor_network::sensor_value as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_memblock__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_task_obj__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_mbuf_pool__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_mbuf_pkthdr__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_sanity_check__bindgen_ty_1 as core::default::Default>::default
00000000 g     F .text._ZN98_$LT$mylib..mynewt..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17hf0a2a793a330461fE	0000000e <mylib::mynewt::sensor_network::sensor_network_interface as core::default::Default>::default
00000000 g     F .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE	00000004 <mylib::mynewt::os::os_time_change_listener__bindgen_ty_1 as core::default::Default>::default
00000000         *UND*	00000000 cstr_core::CStr::from_ptr
00000000         *UND*	00000000 __aeabi_memclr4
00000000         *UND*	00000000 __bkpt
00000000         *UND*	00000000 cbor_encode_int
00000000         *UND*	00000000 cbor_encode_text_string
00000000         *UND*	00000000 cbor_encoder_close_container
00000000         *UND*	00000000 cbor_encoder_create_map
00000000         *UND*	00000000 console_buffer
00000000         *UND*	00000000 console_flush
00000000         *UND*	00000000 console_printhex
00000000         *UND*	00000000 device_get_name
00000000         *UND*	00000000 do_collector_post
00000000         *UND*	00000000 do_server_post
00000000         *UND*	00000000 g_encoder
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
00000000         *UND*	00000000 root_map
00000000 g     F .text.rust_begin_unwind	00000072 rust_begin_unwind
00000000         *UND*	00000000 rust_sysinit
00000000         *UND*	00000000 sensor_get_device
00000000         *UND*	00000000 sensor_mgr_find_next_bydevname
00000000         *UND*	00000000 sensor_register_listener
00000000         *UND*	00000000 sensor_set_poll_rate_ms
00000000         *UND*	00000000 should_send_to_collector



Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3cd16d96a1ab09b9E:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3cd16d96a1ab09b9E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$i32$GT$3fmt17hc0a5c2426ccebe61E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_lower_hex>
   c:	b128      	cbz	r0, 1a <<&T as core::fmt::Debug>::fmt+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::LowerHex for i32>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_upper_hex>
  20:	b128      	cbz	r0, 2e <<&T as core::fmt::Debug>::fmt+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::UpperHex for i32>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <core::fmt::num::imp::<impl core::fmt::Display for i32>::fmt>

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbb6268d049e95435E:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbb6268d049e95435E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
   4:	b082      	sub	sp, #8
_ZN54_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Pointer$GT$3fmt17h3602c568aeeeaf2cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2009
   6:	f8d1 8000 	ldr.w	r8, [r1]
   a:	460c      	mov	r4, r1
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2008
   c:	e9d1 6702 	ldrd	r6, r7, [r1, #8]
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbb6268d049e95435E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
  10:	6805      	ldr	r5, [r0, #0]
_ZN54_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Pointer$GT$3fmt17h3602c568aeeeaf2cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2015
  12:	4608      	mov	r0, r1
  14:	f7ff fffe 	bl	0 <core::fmt::Formatter::alternate>
  18:	6821      	ldr	r1, [r4, #0]
  1a:	b148      	cbz	r0, 30 <<&T as core::fmt::Debug>::fmt+0x30>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2016
  1c:	f041 0108 	orr.w	r1, r1, #8
  20:	6021      	str	r1, [r4, #0]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2018
  22:	68a0      	ldr	r0, [r4, #8]
  24:	2800      	cmp	r0, #0
  26:	bf02      	ittt	eq
  28:	2001      	moveq	r0, #1
  2a:	220a      	moveq	r2, #10
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2019
  2c:	e9c4 0202 	strdeq	r0, r2, [r4, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2022
  30:	f041 0004 	orr.w	r0, r1, #4
  34:	6020      	str	r0, [r4, #0]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2024
  36:	6828      	ldr	r0, [r5, #0]
  38:	4621      	mov	r1, r4
  3a:	9001      	str	r0, [sp, #4]
  3c:	a801      	add	r0, sp, #4
  3e:	f7ff fffe 	bl	0 <core::fmt::num::<impl core::fmt::LowerHex for usize>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2026
  42:	e9c4 6702 	strd	r6, r7, [r4, #8]
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:2027
  46:	f8c4 8000 	str.w	r8, [r4]
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hbb6268d049e95435E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
  4a:	b002      	add	sp, #8
  4c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

Disassembly of section .text._ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9a0951cf9a1a237E:

00000000 <<&T as core::fmt::Debug>::fmt>:
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hc9a0951cf9a1a237E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:1914
   0:	b5b0      	push	{r4, r5, r7, lr}
   2:	6805      	ldr	r5, [r0, #0]
_ZN4core3fmt3num49_$LT$impl$u20$core..fmt..Debug$u20$for$u20$u8$GT$3fmt17h271d1c938b44f4eaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:147
   4:	4608      	mov	r0, r1
   6:	460c      	mov	r4, r1
   8:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_lower_hex>
   c:	b128      	cbz	r0, 1a <<&T as core::fmt::Debug>::fmt+0x1a>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:148
   e:	4628      	mov	r0, r5
  10:	4621      	mov	r1, r4
  12:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  16:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::LowerHex for u8>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:149
  1a:	4620      	mov	r0, r4
  1c:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_upper_hex>
  20:	b128      	cbz	r0, 2e <<&T as core::fmt::Debug>::fmt+0x2e>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:150
  22:	4628      	mov	r0, r5
  24:	4621      	mov	r1, r4
  26:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  2a:	f7ff bffe 	b.w	0 <core::fmt::num::<impl core::fmt::UpperHex for u8>::fmt>
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/num.rs:152
  2e:	4628      	mov	r0, r5
  30:	4621      	mov	r1, r4
  32:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
  36:	f7ff bffe 	b.w	0 <core::fmt::num::imp::<impl core::fmt::Display for u8>::fmt>

Disassembly of section .text._ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE:

00000000 <<mylib::mynewt::tinycbor::File as core::default::Default>::default>:
_ZN72_$LT$mylib..mynewt..tinycbor..File$u20$as$u20$core..default..Default$GT$7default17ha1e81293a702204aE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/tinycbor.rs:31
    pub vmt: *const File_methods,
}
impl Default for File {
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
   0:	2000      	movs	r0, #0
   2:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$mylib..mynewt..os..os_event$u20$as$u20$core..default..Default$GT$7default17hd0f0cd69f8864351E:

00000000 <<mylib::mynewt::os::os_event as core::default::Default>::default>:
_ZN70_$LT$mylib..mynewt..os..os_event$u20$as$u20$core..default..Default$GT$7default17hd0f0cd69f8864351E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:306
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_event {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17hcd7cf3c8a5a941c6E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
_ZN70_$LT$mylib..mynewt..os..os_event$u20$as$u20$core..default..Default$GT$7default17hd0f0cd69f8864351E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:308
        unsafe { ::core::mem::zeroed() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN72_$LT$mylib..mynewt..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h482826e974b6b674E:

00000000 <<mylib::mynewt::os::os_callout as core::default::Default>::default>:
_ZN72_$LT$mylib..mynewt..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h482826e974b6b674E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:387
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_callout {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h4502de1f61055122E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
   e:	e9c0 1106 	strd	r1, r1, [r0, #24]
_ZN72_$LT$mylib..mynewt..os..os_callout$u20$as$u20$core..default..Default$GT$7default17h482826e974b6b674E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:389
        unsafe { ::core::mem::zeroed() }
    }
  12:	4770      	bx	lr

Disassembly of section .text._ZN71_$LT$mylib..mynewt..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17hd8128d4c19f97636E:

00000000 <<mylib::mynewt::os::hal_timer as core::default::Default>::default>:
_ZN71_$LT$mylib..mynewt..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17hd8128d4c19f97636E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:444
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for hal_timer {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17ha0c166ec42daa0e0E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
_ZN71_$LT$mylib..mynewt..os..hal_timer$u20$as$u20$core..default..Default$GT$7default17hd8128d4c19f97636E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:446
        unsafe { ::core::mem::zeroed() }
    }
   e:	4770      	bx	lr

Disassembly of section .text._ZN68_$LT$mylib..mynewt..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h51ca089748e9a617E:

00000000 <<mylib::mynewt::os::os_dev as core::default::Default>::default>:
_ZN68_$LT$mylib..mynewt..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h51ca089748e9a617E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:524
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_dev {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17hf8f524c9f8f324aaE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2124      	movs	r1, #36	; 0x24
   4:	f7ff fffe 	bl	0 <__aeabi_memclr4>
_ZN68_$LT$mylib..mynewt..os..os_dev$u20$as$u20$core..default..Default$GT$7default17h51ca089748e9a617E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:526
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE:

00000000 <<mylib::mynewt::os::os_mbuf as core::default::Default>::default>:
_ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:646
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_mbuf {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h30141c0a30dea17cE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
_ZN69_$LT$mylib..mynewt..os..os_mbuf$u20$as$u20$core..default..Default$GT$7default17h198c7c398eb06b6aE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:648
        unsafe { ::core::mem::zeroed() }
    }
   a:	4770      	bx	lr

Disassembly of section .text._ZN72_$LT$mylib..mynewt..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17h944ab538693cd27cE:

00000000 <<mylib::mynewt::os::os_mempool as core::default::Default>::default>:
_ZN72_$LT$mylib..mynewt..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17h944ab538693cd27cE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:851
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_mempool {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17he0f4c7d1aaf12430E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	e9c0 1104 	strd	r1, r1, [r0, #16]
   e:	6181      	str	r1, [r0, #24]
_ZN72_$LT$mylib..mynewt..os..os_mempool$u20$as$u20$core..default..Default$GT$7default17h944ab538693cd27cE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:853
        unsafe { ::core::mem::zeroed() }
    }
  10:	4770      	bx	lr

Disassembly of section .text._ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E:

00000000 <<mylib::mynewt::os::os_mutex as core::default::Default>::default>:
_ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:952
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_mutex {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h9433c5c55d4d4a6dE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	6081      	str	r1, [r0, #8]
_ZN70_$LT$mylib..mynewt..os..os_mutex$u20$as$u20$core..default..Default$GT$7default17hd66c9ca0cbe832d4E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:954
        unsafe { ::core::mem::zeroed() }
    }
   8:	4770      	bx	lr

Disassembly of section .text._ZN77_$LT$mylib..mynewt..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd585e14b041eaa38E:

00000000 <<mylib::mynewt::os::os_sanity_check as core::default::Default>::default>:
_ZN77_$LT$mylib..mynewt..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd585e14b041eaa38E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:986
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_sanity_check {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h6ede2b24a97b64ffE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	6101      	str	r1, [r0, #16]
_ZN77_$LT$mylib..mynewt..os..os_sanity_check$u20$as$u20$core..default..Default$GT$7default17hd585e14b041eaa38E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:988
        unsafe { ::core::mem::zeroed() }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN69_$LT$mylib..mynewt..os..os_task$u20$as$u20$core..default..Default$GT$7default17hffe52c3c59b86de4E:

00000000 <<mylib::mynewt::os::os_task as core::default::Default>::default>:
_ZN69_$LT$mylib..mynewt..os..os_task$u20$as$u20$core..default..Default$GT$7default17hffe52c3c59b86de4E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:1083
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_task {
    fn default() -> Self {
   0:	b580      	push	{r7, lr}
_ZN4core3mem6zeroed17h1f42f7d724e687a3E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	2150      	movs	r1, #80	; 0x50
   4:	f7ff fffe 	bl	0 <__aeabi_memclr4>
_ZN69_$LT$mylib..mynewt..os..os_task$u20$as$u20$core..default..Default$GT$7default17hffe52c3c59b86de4E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:1085
        unsafe { ::core::mem::zeroed() }
    }
   8:	bd80      	pop	{r7, pc}

Disassembly of section .text._ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E:

00000000 <<mylib::mynewt::os::os_task_list as core::default::Default>::default>:
_ZN74_$LT$mylib..mynewt..os..os_task_list$u20$as$u20$core..default..Default$GT$7default17h3f2f239d70e49c29E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:1140
    pub tqh_last: *mut *mut os_task,
}
impl Default for os_task_list {
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
   0:	2000      	movs	r0, #0
   2:	2100      	movs	r1, #0
   4:	4770      	bx	lr

Disassembly of section .text._ZN68_$LT$mylib..mynewt..os..os_sem$u20$as$u20$core..default..Default$GT$7default17hadd0a9434ed12decE:

00000000 <<mylib::mynewt::os::os_sem as core::default::Default>::default>:
_ZN68_$LT$mylib..mynewt..os..os_sem$u20$as$u20$core..default..Default$GT$7default17hadd0a9434ed12decE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:1194
    fn default() -> Self {
        unsafe { ::core::mem::zeroed() }
    }
}
impl Default for os_sem {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h60a99a1d8b26f49aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
_ZN68_$LT$mylib..mynewt..os..os_sem$u20$as$u20$core..default..Default$GT$7default17hadd0a9434ed12decE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/os.rs:1196
        unsafe { ::core::mem::zeroed() }
    }
   6:	4770      	bx	lr

Disassembly of section .text._ZN5mylib6mynewt6sensor21null_sensor_data_func17hd8c42d7d02a586efE:

00000000 <mylib::mynewt::sensor::null_sensor_data_func>:
_ZN5mylib6mynewt6sensor21null_sensor_data_func17hd8c42d7d02a586efE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/sensor.rs:32
    sl_func: null_sensor_data_func,
    ..zero!(SensorListener)
};

///  Define a dummy sensor data function in case there is none.
extern fn null_sensor_data_func(_sensor: SensorPtr, _arg: SensorArg, _sensor_data: SensorDataPtr, _sensor_type: SensorType) -> i32 { 0 }
   0:	2000      	movs	r0, #0
   2:	4770      	bx	lr

Disassembly of section .text._ZN98_$LT$mylib..mynewt..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17hf0a2a793a330461fE:

00000000 <<mylib::mynewt::sensor_network::sensor_network_interface as core::default::Default>::default>:
_ZN98_$LT$mylib..mynewt..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17hf0a2a793a330461fE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/sensor_network.rs:49
        ) -> ::cty::c_int,
    >,
    pub transport_registered: u8,
}
impl Default for sensor_network_interface {
    fn default() -> Self {
   0:	2100      	movs	r1, #0
_ZN4core3mem6zeroed17h44e5719cfc7dfd90E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/mem.rs:447
   2:	e9c0 1100 	strd	r1, r1, [r0]
   6:	e9c0 1102 	strd	r1, r1, [r0, #8]
   a:	6101      	str	r1, [r0, #16]
_ZN98_$LT$mylib..mynewt..sensor_network..sensor_network_interface$u20$as$u20$core..default..Default$GT$7default17hf0a2a793a330461fE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/sensor_network.rs:51
        unsafe { ::core::mem::zeroed() }
    }
   c:	4770      	bx	lr

Disassembly of section .text._ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE:

00000000 <mylib::listen_sensor::read_temperature>:
_ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:69
///  This listener function is called by Mynewt every 10 seconds (for local sensors) or when sensor data is received
///  (for Remote Sensors).  Mynewt has fetched the raw or computed temperature value, passed through `sensor_data`.
///  If this is a Sensor Node, we send the sensor data to the Collector Node.
///  If this is a Collector Node or Standalone Node, we send the sensor data to the CoAP server.  
///  Return 0 if we have processed the sensor data successfully.
extern fn read_temperature(sensor: SensorPtr, _arg: SensorArg, sensor_data: SensorDataPtr, sensor_type: SensorType) -> i32 {
   0:	b5f0      	push	{r4, r5, r6, r7, lr}
   2:	b091      	sub	sp, #68	; 0x44
   4:	4604      	mov	r4, r0
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  16:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:73
    console_print(b"read_temperature\n");
    //  Check that the temperature data is valid.
    //  TODO
    if unsafe { is_null_sensor_data(sensor_data) } { return SYS_EINVAL; }  //  Exit if data is missing
  1a:	4630      	mov	r0, r6
  1c:	f7ff fffe 	bl	0 <is_null_sensor_data>
  20:	b118      	cbz	r0, 2a <mylib::listen_sensor::read_temperature+0x2a>
  22:	f06f 0001 	mvn.w	r0, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:104
            return 0; 
        }            
    }
    //#endif  //  MYNEWT_VAL(SENSOR_COAP)
    0
}
  26:	b011      	add	sp, #68	; 0x44
  28:	bdf0      	pop	{r4, r5, r6, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:74
    assert!(unsafe { !is_null_sensor(sensor) });
  2a:	4620      	mov	r0, r4
  2c:	f7ff fffe 	bl	0 <is_null_sensor>
  30:	2800      	cmp	r0, #0
  32:	f040 80c1 	bne.w	1b8 <mylib::listen_sensor::read_temperature+0x1b8>
  36:	e9dd 1016 	ldrd	r1, r0, [sp, #88]	; 0x58
_ZN5mylib13listen_sensor15get_temperature17h2edc08c394ae5068E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
#[allow(unreachable_patterns)]
#[allow(unused_variables)]
fn get_temperature(sensor_data: *const CVoid, sensor_type: SensorType) -> SensorValue {
    let mut return_value = SensorValue::default();
    match sensor_type {                                //  Is this raw or computed temperature?
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  3a:	f081 6180 	eor.w	r1, r1, #67108864	; 0x4000000
  3e:	ea41 0700 	orr.w	r7, r1, r0
_ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:78
    let device = unsafe { sensor_get_device(sensor) };
  42:	4620      	mov	r0, r4
  44:	f7ff fffe 	bl	0 <sensor_get_device>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:79
    let device_name_ptr: *const c_char = unsafe { device_get_name(device) };
  48:	f7ff fffe 	bl	0 <device_get_name>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:80
    let device_name: &CStr = unsafe { CStr::from_ptr(device_name_ptr) };
  4c:	f7ff fffe 	bl	0 <cstr_core::CStr::from_ptr>
  50:	4604      	mov	r4, r0
  52:	460d      	mov	r5, r1
  54:	2000      	movs	r0, #0
_ZN5mylib13listen_sensor15get_temperature17h2edc08c394ae5068E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:114
        SENSOR_TYPE_AMBIENT_TEMPERATURE_RAW => {  //  If this is raw temperature...
  56:	b9c7      	cbnz	r7, 8a <mylib::listen_sensor::read_temperature+0x8a>
  58:	a905      	add	r1, sp, #20
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:116
            //  Interpret the sensor data as a sensor_temp_raw_data struct that contains raw temp.
            let mut rawtempdata = SensorTempRawData {
  5a:	f88d 0018 	strb.w	r0, [sp, #24]
  5e:	9005      	str	r0, [sp, #20]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:120
                strd_temp_raw: 0,
                strd_temp_raw_is_valid: 0,
            };
            let rc = unsafe { get_temp_raw_data(sensor_data, &mut rawtempdata) };
  60:	4630      	mov	r0, r6
  62:	f7ff fffe 	bl	0 <get_temp_raw_data>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
            assert!(rc == 0);
  66:	2800      	cmp	r0, #0
  68:	f040 80b4 	bne.w	1d4 <mylib::listen_sensor::read_temperature+0x1d4>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:124

            //  Check that the raw temperature data is valid.
            if rawtempdata.strd_temp_raw_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  6c:	f89d 0018 	ldrb.w	r0, [sp, #24]
  70:	2800      	cmp	r0, #0
  72:	f000 80a8 	beq.w	1c6 <mylib::listen_sensor::read_temperature+0x1c6>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
  76:	f240 0000 	movw	r0, #0
  7a:	2119      	movs	r1, #25
  7c:	f2c0 0000 	movt	r0, #0
  80:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  84:	f7ff fffe 	bl	0 <console_flush>
  88:	e00e      	b.n	a8 <mylib::listen_sensor::read_temperature+0xa8>
_ZN5mylib13listen_sensor15get_temperature17h2edc08c394ae5068E():
  8a:	a905      	add	r1, sp, #20
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:132
            return_value.val = SensorValueType::Uint(rawtempdata.strd_temp_raw);  //  Raw Temperature in integer (0 to 4095)
            console_print(b"TMP listener got rawtmp \n");  // return_value->int_val);
        },
        SENSOR_TYPE_AMBIENT_TEMPERATURE => {      //  If this is computed temperature...
            //  Interpret the sensor data as a sensor_temp_data struct that contains computed temp.
            let mut tempdata = SensorTempData {
  8c:	f88d 0018 	strb.w	r0, [sp, #24]
  90:	9005      	str	r0, [sp, #20]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:136
                std_temp: 0.0,
                std_temp_is_valid: 0,
            };
            let rc = unsafe { get_temp_data(sensor_data, &mut tempdata) };
  92:	4630      	mov	r0, r6
  94:	f7ff fffe 	bl	0 <get_temp_data>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:137
            assert!(rc == 0);
  98:	2800      	cmp	r0, #0
  9a:	f040 80a2 	bne.w	1e2 <mylib::listen_sensor::read_temperature+0x1e2>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:140

            //  Check that the computed temperature data is valid.
            if tempdata.std_temp_is_valid == 0 { return return_value; }  //  Exit if data is not valid
  9e:	f89d 0018 	ldrb.w	r0, [sp, #24]
  a2:	2800      	cmp	r0, #0
  a4:	f000 808f 	beq.w	1c6 <mylib::listen_sensor::read_temperature+0x1c6>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
  a8:	f240 0000 	movw	r0, #0
  ac:	2111      	movs	r1, #17
  ae:	f2c0 0000 	movt	r0, #0
  b2:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  b6:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib9send_coap16send_sensor_data17h1d71c865427412bcE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:94
///  so this function will return without waiting for the message to be transmitted.  
///  Return 0 if successful, SYS_EAGAIN if network is not ready yet.
pub fn send_sensor_data(sensor_val: &SensorValue, sensor_node: &CStr) -> Result<(), i32>  {  //  Returns an error code upon error.
	console_print(b"send_sensor_data\n");
    //  TODO: Remove val
    let mut val = sensor_value{
  ba:	f240 0600 	movw	r6, #0
  be:	2000      	movs	r0, #0
  c0:	9003      	str	r0, [sp, #12]
  c2:	f2c0 0600 	movt	r6, #0
  c6:	f8ad 0008 	strh.w	r0, [sp, #8]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:101
        val_type: 0,
        int_val: 0,
        float_val: 0.0,
    };
	//  For Sensor Node: Transmit the sensor data to the Collector Node as CBOR.
	if unsafe { should_send_to_collector(&mut val, sensor_node.as_ptr()) } { 
  ca:	4621      	mov	r1, r4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:94
    let mut val = sensor_value{
  cc:	9001      	str	r0, [sp, #4]
  ce:	4668      	mov	r0, sp
  d0:	9600      	str	r6, [sp, #0]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:101
	if unsafe { should_send_to_collector(&mut val, sensor_node.as_ptr()) } { 
  d2:	f7ff fffe 	bl	0 <should_send_to_collector>
  d6:	b3b0      	cbz	r0, 70 <mylib::listen_sensor::read_temperature+0x70>
_ZN5mylib9send_coap29send_sensor_data_to_collector17h5b00a786ced834d6E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:179
///  to be transmitted.  Return 0 if successful, `SYS_EAGAIN` if network is not ready yet.
///  The CoAP payload needs to be very compact (under 32 bytes) so it will be encoded in CBOR like this:
///  `{ t: 2870 }`
fn send_sensor_data_to_collector(sensor_val: &SensorValue, _node_id: &CStr) -> Result<(), i32>  {  //  Returns an error code upon error.
	////  TODO: if let SensorValueType::None = sensor_val.val { assert!(false); }
    if unsafe { !NETWORK_IS_READY } { return Err(SYS_EAGAIN); }  //  If network is not ready, tell caller (Sensor Listener) to try later.
  d8:	f240 0000 	movw	r0, #0
  dc:	f2c0 0000 	movt	r0, #0
  e0:	7800      	ldrb	r0, [r0, #0]
  e2:	2801      	cmp	r0, #1
  e4:	d15a      	bne.n	19c <mylib::listen_sensor::read_temperature+0x19c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:184

    //  Start composing the CoAP Collector message with the sensor data in the payload.  This will 
    //  block other tasks from composing and posting CoAP messages (through a semaphore).
    //  We only have 1 memory buffer for composing CoAP messages so it needs to be locked.
    let rc = unsafe { init_collector_post() };  assert!(rc);
  e6:	f7ff fffe 	bl	0 <init_collector_post>
  ea:	2800      	cmp	r0, #0
  ec:	f000 80af 	beq.w	24e <mylib::listen_sensor::read_temperature+0x24e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:187

    //  Compose the CoAP Payload in CBOR using the `coap!()` macro.
    let _payload = coap!(@cbor {
  f0:	f240 0400 	movw	r4, #0
  f4:	f240 0500 	movw	r5, #0
  f8:	f2c0 0400 	movt	r4, #0
  fc:	f2c0 0500 	movt	r5, #0
 100:	4620      	mov	r0, r4
 102:	4629      	mov	r1, r5
 104:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 108:	f7ff fffe 	bl	0 <cbor_encoder_create_map>
 10c:	f240 0100 	movw	r1, #0
 110:	4628      	mov	r0, r5
 112:	f2c0 0100 	movt	r1, #0
 116:	2201      	movs	r2, #1
 118:	f7ff fffe 	bl	0 <cbor_encode_text_string>
 11c:	4628      	mov	r0, r5
 11e:	f240 42d2 	movw	r2, #1234	; 0x4d2
 122:	2300      	movs	r3, #0
 124:	f7ff fffe 	bl	0 <cbor_encode_int>
 128:	4620      	mov	r0, r4
 12a:	4629      	mov	r1, r5
 12c:	f7ff fffe 	bl	0 <cbor_encoder_close_container>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:195
    });

    //  Post the CoAP Collector message to the CoAP Background Task for transmission.  After posting the
    //  message to the background task, we release a semaphore that unblocks other requests
    //  to compose and post CoAP messages.
    let rc = unsafe { do_collector_post() };  assert!(rc);
 130:	f7ff fffe 	bl	0 <do_collector_post>
 134:	2800      	cmp	r0, #0
 136:	f000 8091 	beq.w	25c <mylib::listen_sensor::read_temperature+0x25c>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
 13a:	f240 0000 	movw	r0, #0
 13e:	2121      	movs	r1, #33	; 0x21
 140:	f2c0 0000 	movt	r0, #0
 144:	e023      	b.n	18e <mylib::listen_sensor::read_temperature+0x18e>
_ZN9cstr_core4CStr8to_bytes17h01698a6d2c5e5247E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cstr_core-0.1.2/src/lib.rs:1033
    /// assert_eq!(c_str.to_bytes(), b"foo");
    /// ```
    #[inline]
    pub fn to_bytes(&self) -> &[u8] {
        let bytes = self.to_bytes_with_nul();
        &bytes[..bytes.len() - 1]
 146:	1e68      	subs	r0, r5, #1
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h3271bd4ab5986fe2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2745
 148:	2d00      	cmp	r5, #0
 14a:	d051      	beq.n	1f0 <mylib::listen_sensor::read_temperature+0x1f0>
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:129
    assert_ne!(node_id.to_bytes()[0], 0);
 14c:	2800      	cmp	r0, #0
 14e:	d053      	beq.n	1f8 <mylib::listen_sensor::read_temperature+0x1f8>
 150:	7820      	ldrb	r0, [r4, #0]
 152:	2800      	cmp	r0, #0
 154:	d059      	beq.n	20a <mylib::listen_sensor::read_temperature+0x20a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:130
	if unsafe { !NETWORK_IS_READY } { return Err(SYS_EAGAIN); }  //  If network is not ready, tell caller (Sensor Listener) to try later.
 156:	f240 0000 	movw	r0, #0
 15a:	f2c0 0000 	movt	r0, #0
 15e:	7800      	ldrb	r0, [r0, #0]
 160:	2801      	cmp	r0, #1
 162:	d11b      	bne.n	19c <mylib::listen_sensor::read_temperature+0x19c>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:131
	let device_id = unsafe { get_device_id() };  assert_ne!(device_id, 0 as *const ::cty::c_char);
 164:	f7ff fffe 	bl	0 <get_device_id>
 168:	2800      	cmp	r0, #0
 16a:	9004      	str	r0, [sp, #16]
 16c:	d07d      	beq.n	26a <mylib::listen_sensor::read_temperature+0x26a>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:136
	let rc = unsafe { init_server_post(0 as *const ::cty::c_char) };  assert!(rc);
 16e:	2000      	movs	r0, #0
 170:	f7ff fffe 	bl	0 <init_server_post>
 174:	2800      	cmp	r0, #0
 176:	f000 809f 	beq.w	2b8 <mylib::listen_sensor::read_temperature+0x2b8>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:155
    let rc = unsafe { do_server_post() };  assert!(rc);
 17a:	f7ff fffe 	bl	0 <do_server_post>
 17e:	2800      	cmp	r0, #0
 180:	f000 80a1 	beq.w	2c6 <mylib::listen_sensor::read_temperature+0x2c6>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
 184:	f240 0000 	movw	r0, #0
 188:	214b      	movs	r1, #75	; 0x4b
 18a:	f2c0 0000 	movt	r0, #0
_ZN5mylib9send_coap16send_sensor_data17h1d71c865427412bcE():
 18e:	f7ff fffe 	bl	0 <console_buffer>
 192:	f7ff fffe 	bl	0 <console_flush>
 196:	2000      	movs	r0, #0
_ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:96
    if let Err(err) = rc {
 198:	b158      	cbz	r0, 1b2 <mylib::listen_sensor::read_temperature+0x1b2>
 19a:	e001      	b.n	1a0 <mylib::listen_sensor::read_temperature+0x1a0>
 19c:	2001      	movs	r0, #1
 19e:	b140      	cbz	r0, 1b2 <mylib::listen_sensor::read_temperature+0x1b2>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
 1a0:	f240 0000 	movw	r0, #0
 1a4:	2116      	movs	r1, #22
 1a6:	f2c0 0000 	movt	r0, #0
 1aa:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
 1ae:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib13listen_sensor16read_temperature17h8d029ed87c61b3dbE():
 1b2:	2000      	movs	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:104
}
 1b4:	b011      	add	sp, #68	; 0x44
 1b6:	bdf0      	pop	{r4, r5, r6, r7, pc}
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:74
    assert!(unsafe { !is_null_sensor(sensor) });
 1b8:	f240 0000 	movw	r0, #0
 1bc:	f2c0 0000 	movt	r0, #0
 1c0:	f7ff fffe 	bl	0 <core::panicking::panic>
 1c4:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:85
    if let SensorValueType::None = temp_sensor_value.val { assert!(false); }  //  Invalid type
 1c6:	f240 0000 	movw	r0, #0
 1ca:	f2c0 0000 	movt	r0, #0
 1ce:	f7ff fffe 	bl	0 <core::panicking::panic>
 1d2:	defe      	udf	#254	; 0xfe
_ZN5mylib13listen_sensor15get_temperature17h2edc08c394ae5068E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:121
            assert!(rc == 0);
 1d4:	f240 0000 	movw	r0, #0
 1d8:	f2c0 0000 	movt	r0, #0
 1dc:	f7ff fffe 	bl	0 <core::panicking::panic>
 1e0:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:137
            assert!(rc == 0);
 1e2:	f240 0000 	movw	r0, #0
 1e6:	f2c0 0000 	movt	r0, #0
 1ea:	f7ff fffe 	bl	0 <core::panicking::panic>
 1ee:	defe      	udf	#254	; 0xfe
_ZN99_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h3271bd4ab5986fe2E():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/slice/mod.rs:2746
 1f0:	2100      	movs	r1, #0
 1f2:	f7ff fffe 	bl	0 <core::slice::slice_index_len_fail>
 1f6:	defe      	udf	#254	; 0xfe
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:129
    assert_ne!(node_id.to_bytes()[0], 0);
 1f8:	f240 0000 	movw	r0, #0
 1fc:	2100      	movs	r1, #0
 1fe:	f2c0 0000 	movt	r0, #0
 202:	2200      	movs	r2, #0
 204:	f7ff fffe 	bl	0 <core::panicking::panic_bounds_check>
 208:	defe      	udf	#254	; 0xfe
 20a:	f240 0000 	movw	r0, #0
 20e:	a910      	add	r1, sp, #64	; 0x40
 210:	f2c0 0000 	movt	r0, #0
 214:	940f      	str	r4, [sp, #60]	; 0x3c
 216:	900e      	str	r0, [sp, #56]	; 0x38
 218:	e9cd 010c 	strd	r0, r1, [sp, #48]	; 0x30
 21c:	a80f      	add	r0, sp, #60	; 0x3c
 21e:	900b      	str	r0, [sp, #44]	; 0x2c
 220:	2002      	movs	r0, #2
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 222:	900a      	str	r0, [sp, #40]	; 0x28
 224:	a80b      	add	r0, sp, #44	; 0x2c
 226:	9009      	str	r0, [sp, #36]	; 0x24
 228:	2000      	movs	r0, #0
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:129
 22a:	9610      	str	r6, [sp, #64]	; 0x40
 22c:	f240 0100 	movw	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 230:	e9cd 0007 	strd	r0, r0, [sp, #28]
 234:	2003      	movs	r0, #3
 236:	9006      	str	r0, [sp, #24]
 238:	f240 0000 	movw	r0, #0
 23c:	f2c0 0000 	movt	r0, #0
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:129
 240:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 244:	9005      	str	r0, [sp, #20]
 246:	a805      	add	r0, sp, #20
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:129
 248:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
 24c:	defe      	udf	#254	; 0xfe
_ZN5mylib9send_coap29send_sensor_data_to_collector17h5b00a786ced834d6E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:184
    let rc = unsafe { init_collector_post() };  assert!(rc);
 24e:	f240 0000 	movw	r0, #0
 252:	f2c0 0000 	movt	r0, #0
 256:	f7ff fffe 	bl	0 <core::panicking::panic>
 25a:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:195
    let rc = unsafe { do_collector_post() };  assert!(rc);
 25c:	f240 0000 	movw	r0, #0
 260:	f2c0 0000 	movt	r0, #0
 264:	f7ff fffe 	bl	0 <core::panicking::panic>
 268:	defe      	udf	#254	; 0xfe
_ZN5mylib9send_coap16send_sensor_data17h1d71c865427412bcE():
 26a:	a804      	add	r0, sp, #16
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:131
	let device_id = unsafe { get_device_id() };  assert_ne!(device_id, 0 as *const ::cty::c_char);
 26c:	900f      	str	r0, [sp, #60]	; 0x3c
 26e:	f240 0000 	movw	r0, #0
 272:	a910      	add	r1, sp, #64	; 0x40
 274:	f2c0 0000 	movt	r0, #0
 278:	900e      	str	r0, [sp, #56]	; 0x38
 27a:	e9cd 010c 	strd	r0, r1, [sp, #48]	; 0x30
 27e:	a80f      	add	r0, sp, #60	; 0x3c
 280:	900b      	str	r0, [sp, #44]	; 0x2c
 282:	f240 0000 	movw	r0, #0
 286:	f2c0 0000 	movt	r0, #0
 28a:	f240 0100 	movw	r1, #0
 28e:	9010      	str	r0, [sp, #64]	; 0x40
 290:	2002      	movs	r0, #2
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 292:	900a      	str	r0, [sp, #40]	; 0x28
 294:	a80b      	add	r0, sp, #44	; 0x2c
 296:	9009      	str	r0, [sp, #36]	; 0x24
 298:	2000      	movs	r0, #0
 29a:	e9cd 0007 	strd	r0, r0, [sp, #28]
 29e:	2003      	movs	r0, #3
 2a0:	9006      	str	r0, [sp, #24]
 2a2:	f240 0000 	movw	r0, #0
 2a6:	f2c0 0000 	movt	r0, #0
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:131
 2aa:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 2ae:	9005      	str	r0, [sp, #20]
 2b0:	a805      	add	r0, sp, #20
_ZN5mylib9send_coap26send_sensor_data_to_server17h0034999ea1774952E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:131
 2b2:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
 2b6:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:136
	let rc = unsafe { init_server_post(0 as *const ::cty::c_char) };  assert!(rc);
 2b8:	f240 0000 	movw	r0, #0
 2bc:	f2c0 0000 	movt	r0, #0
 2c0:	f7ff fffe 	bl	0 <core::panicking::panic>
 2c4:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:155
    let rc = unsafe { do_server_post() };  assert!(rc);
 2c6:	f240 0000 	movw	r0, #0
 2ca:	f2c0 0000 	movt	r0, #0
 2ce:	f7ff fffe 	bl	0 <core::panicking::panic>
 2d2:	defe      	udf	#254	; 0xfe

Disassembly of section .text._ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E:

00000000 <mylib::send_coap::network_task_func>:
_ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:57
extern "C" fn network_task_func(_arg: *mut ::cty::c_void) {
   0:	b08e      	sub	sp, #56	; 0x38
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
   2:	f240 0000 	movw	r0, #0
   6:	210a      	movs	r1, #10
   8:	f2c0 0000 	movt	r0, #0
   c:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  10:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:58
	console_print(b"NET start\n");  assert!(unsafe { !NETWORK_IS_READY });
  14:	f240 0400 	movw	r4, #0
  18:	f2c0 0400 	movt	r4, #0
  1c:	7820      	ldrb	r0, [r4, #0]
  1e:	2801      	cmp	r0, #1
  20:	d026      	beq.n	70 <mylib::send_coap::network_task_func+0x70>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:62
	if unsafe { is_standalone_node() } || unsafe { is_collector_node() } {
  22:	f7ff fffe 	bl	0 <is_standalone_node>
  26:	b910      	cbnz	r0, 8 <is_collector_node+0x8>
  28:	f7ff fffe 	bl	0 <is_collector_node>
  2c:	b120      	cbz	r0, c <register_server_transport+0xc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:63
		let rc = unsafe { register_server_transport() };  assert_eq!(rc, 0);
  2e:	f7ff fffe 	bl	0 <register_server_transport>
  32:	2800      	cmp	r0, #0
  34:	9001      	str	r0, [sp, #4]
  36:	d122      	bne.n	7e <mylib::send_coap::network_task_func+0x7e>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:67
	if unsafe { is_collector_node() } || unsafe { is_sensor_node() } {
  38:	f7ff fffe 	bl	0 <is_collector_node>
  3c:	b910      	cbnz	r0, 8 <is_sensor_node+0x8>
  3e:	f7ff fffe 	bl	0 <is_sensor_node>
  42:	b120      	cbz	r0, c <register_collector_transport+0xc>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:68
		let rc = unsafe { register_collector_transport() };  assert_eq!(rc, 0);
  44:	f7ff fffe 	bl	0 <register_collector_transport>
  48:	2800      	cmp	r0, #0
  4a:	9001      	str	r0, [sp, #4]
  4c:	d13e      	bne.n	cc <mylib::send_coap::network_task_func+0xcc>
  4e:	2001      	movs	r0, #1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:73
	unsafe { NETWORK_IS_READY = true; }  //  Indicate that network is ready.
  50:	7020      	strb	r0, [r4, #0]
  52:	f240 0400 	movw	r4, #0
  56:	f2c0 0400 	movt	r4, #0
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
  5a:	4620      	mov	r0, r4
  5c:	2111      	movs	r1, #17
  5e:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  62:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:77
		unsafe { os_time_delay(10 * OS_TICKS_PER_SEC); }                   //  Wait 10 seconds before repeating.
  66:	f242 7010 	movw	r0, #10000	; 0x2710
  6a:	f7ff fffe 	bl	0 <os_time_delay>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:75
	loop {  //  Loop forever...        
  6e:	e7f4      	b.n	ffffffec <.Lanon.586ce42fc55749843a9229a56173fbcf.50+0xffffffe4>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:58
	console_print(b"NET start\n");  assert!(unsafe { !NETWORK_IS_READY });
  70:	f240 0000 	movw	r0, #0
  74:	f2c0 0000 	movt	r0, #0
  78:	f7ff fffe 	bl	0 <core::panicking::panic>
  7c:	defe      	udf	#254	; 0xfe
  7e:	a801      	add	r0, sp, #4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:63
		let rc = unsafe { register_server_transport() };  assert_eq!(rc, 0);
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
_ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:63
  be:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
  c2:	9002      	str	r0, [sp, #8]
  c4:	a802      	add	r0, sp, #8
_ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:63
  c6:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
  ca:	defe      	udf	#254	; 0xfe
  cc:	a801      	add	r0, sp, #4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:68
		let rc = unsafe { register_collector_transport() };  assert_eq!(rc, 0);
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
_ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:68
 10c:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 110:	9002      	str	r0, [sp, #8]
 112:	a802      	add	r0, sp, #8
_ZN5mylib9send_coap17network_task_func17h4cb9c6d5020b51c1E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:68
 114:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
 118:	defe      	udf	#254	; 0xfe

Disassembly of section .text.main:

00000000 <main>:
main():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:32
use crate::listen_sensor::*;    //  Import listen_sensor.rs for polling the temperature sensor
use crate::send_coap::*;        //  Import send_coap.rs for sending sensor data

///  main() will be called at Mynewt startup. It replaces the C version of the main() function.
#[no_mangle]                     //  Don't mangle the name "main"
pub extern "C" fn main() -> ! {  //  Declare extern "C" because it will be called by Mynewt
   0:	b092      	sub	sp, #72	; 0x48
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:34
    //  Init Mynewt system.
    unsafe { rust_sysinit()  };
   2:	f7ff fffe 	bl	0 <rust_sysinit>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:35
    unsafe { console_flush() };
   6:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
   a:	f240 0000 	movw	r0, #0
   e:	210a      	movs	r1, #10
  10:	f2c0 0000 	movt	r0, #0
  14:	240a      	movs	r4, #10
  16:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  1a:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib9send_coap18start_network_task17hbb48babd6a17a35bE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:37
    let rc = unsafe { os_task_init( //  Create a new task and start it...
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
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:46
    assert_eq!(rc, 0);
  56:	2800      	cmp	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:37
    let rc = unsafe { os_task_init( //  Create a new task and start it...
  58:	9009      	str	r0, [sp, #36]	; 0x24
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:46
    assert_eq!(rc, 0);
  5a:	d13f      	bne.n	dc <main+0xdc>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
  5c:	f240 0000 	movw	r0, #0
  60:	210a      	movs	r1, #10
  62:	f2c0 0000 	movt	r0, #0
  66:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  6a:	f7ff fffe 	bl	0 <console_flush>
_ZN5mylib13listen_sensor21start_sensor_listener17h8f429df31dac62b8E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:34
    let rc = unsafe { sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME) };
  6e:	f240 0000 	movw	r0, #0
  72:	f242 7110 	movw	r1, #10000	; 0x2710
  76:	f2c0 0000 	movt	r0, #0
  7a:	f7ff fffe 	bl	0 <sensor_set_poll_rate_ms>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:35
    assert_eq!(rc, 0);
  7e:	2800      	cmp	r0, #0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:34
    let rc = unsafe { sensor_set_poll_rate_ms(SENSOR_DEVICE, SENSOR_POLL_TIME) };
  80:	9009      	str	r0, [sp, #36]	; 0x24
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:35
    assert_eq!(rc, 0);
  82:	d151      	bne.n	128 <main+0x128>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:38
    let listen_sensor = unsafe { sensor_mgr_find_next_bydevname(SENSOR_DEVICE, null_sensor()) };
  84:	f7ff fffe 	bl	0 <null_sensor>
  88:	4601      	mov	r1, r0
  8a:	f240 0000 	movw	r0, #0
  8e:	f2c0 0000 	movt	r0, #0
  92:	f7ff fffe 	bl	0 <sensor_mgr_find_next_bydevname>
  96:	4604      	mov	r4, r0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:39
    assert!(unsafe{ !is_null_sensor(listen_sensor) });
  98:	f7ff fffe 	bl	0 <is_null_sensor>
  9c:	2800      	cmp	r0, #0
  9e:	d16a      	bne.n	176 <main+0x176>
_ZN5mylib6mynewt6sensor17register_listener17h5f4754571eae406fE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/sensor.rs:15
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
  a0:	f240 0100 	movw	r1, #0
  a4:	f2c0 0100 	movt	r1, #0
  a8:	e9d1 0200 	ldrd	r0, r2, [r1]
  ac:	4310      	orrs	r0, r2
  ae:	d169      	bne.n	184 <main+0x184>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/sensor.rs:17
    unsafe { LISTENER_INTERNAL = listener };
  b0:	f240 0300 	movw	r3, #0
  b4:	2000      	movs	r0, #0
  b6:	f04f 6280 	mov.w	r2, #67108864	; 0x4000000
  ba:	f04f 0c01 	mov.w	ip, #1
  be:	f2c0 0300 	movt	r3, #0
  c2:	e9c1 2000 	strd	r2, r0, [r1]
  c6:	e9c1 3c02 	strd	r3, ip, [r1, #8]
  ca:	6108      	str	r0, [r1, #16]
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/sensor.rs:19
    unsafe { sensor_register_listener(sensor, &mut LISTENER_INTERNAL) };
  cc:	4620      	mov	r0, r4
  ce:	f7ff fffe 	bl	0 <sensor_register_listener>
main():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:53

    //  Main event loop
    loop {                            //  Loop forever...
        unsafe {
            os_eventq_run(            //  Process events...
                os_eventq_dflt_get()  //  From default event queue.
  d2:	f7ff fffe 	bl	0 <os_eventq_dflt_get>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:52
            os_eventq_run(            //  Process events...
  d6:	f7ff fffe 	bl	0 <os_eventq_run>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:50
    loop {                            //  Loop forever...
  da:	e7fa      	b.n	d2 <main+0xd2>
  dc:	a809      	add	r0, sp, #36	; 0x24
_ZN5mylib9send_coap18start_network_task17hbb48babd6a17a35bE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:46
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
_ZN5mylib9send_coap18start_network_task17hbb48babd6a17a35bE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:46
 110:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 114:	900b      	str	r0, [sp, #44]	; 0x2c
 116:	f240 0000 	movw	r0, #0
 11a:	f2c0 0000 	movt	r0, #0
 11e:	900a      	str	r0, [sp, #40]	; 0x28
 120:	a80a      	add	r0, sp, #40	; 0x28
_ZN5mylib9send_coap18start_network_task17hbb48babd6a17a35bE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/send_coap.rs:46
 122:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
 126:	defe      	udf	#254	; 0xfe
main():
 128:	a809      	add	r0, sp, #36	; 0x24
_ZN5mylib13listen_sensor21start_sensor_listener17h8f429df31dac62b8E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:35
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
_ZN5mylib13listen_sensor21start_sensor_listener17h8f429df31dac62b8E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:35
 168:	f2c0 0100 	movt	r1, #0
_ZN4core3fmt9Arguments6new_v117ha99294a9defa432aE():
/rustc/50a0defd5a93523067ef239936cc2e0755220904/src/libcore/fmt/mod.rs:316
 16c:	900a      	str	r0, [sp, #40]	; 0x28
 16e:	a80a      	add	r0, sp, #40	; 0x28
_ZN5mylib13listen_sensor21start_sensor_listener17h8f429df31dac62b8E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:35
 170:	f7ff fffe 	bl	0 <core::panicking::panic_fmt>
 174:	defe      	udf	#254	; 0xfe
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/listen_sensor.rs:39
    assert!(unsafe{ !is_null_sensor(listen_sensor) });
 176:	f240 0000 	movw	r0, #0
 17a:	f2c0 0000 	movt	r0, #0
 17e:	f7ff fffe 	bl	0 <core::panicking::panic>
 182:	defe      	udf	#254	; 0xfe
_ZN5mylib6mynewt6sensor17register_listener17h5f4754571eae406fE():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/mynewt/sensor.rs:15
    unsafe { assert!(LISTENER_INTERNAL.sl_sensor_type == 0) };  //  Make sure it's not used.
 184:	f240 0000 	movw	r0, #0
 188:	f2c0 0000 	movt	r0, #0
 18c:	f7ff fffe 	bl	0 <core::panicking::panic>
 190:	defe      	udf	#254	; 0xfe

Disassembly of section .text.rust_begin_unwind:

00000000 <rust_begin_unwind>:
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:64

///  This function is called on panic, like an assertion failure. We display the filename and line number and pause in the debugger. From https://os.phil-opp.com/freestanding-rust-binary/
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    //  Display the filename and line number to the Semihosting Console.
    if let Some(location) = info.location() {
   0:	f7ff fffe 	bl	0 <core::panic::PanicInfo::location>
   4:	b338      	cbz	r0, 56 <rust_begin_unwind+0x56>
   6:	4604      	mov	r4, r0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:65
        let file = location.file();
   8:	f7ff fffe 	bl	0 <core::panic::Location::file>
   c:	4605      	mov	r5, r0
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:66
        let line = location.line();
   e:	4620      	mov	r0, r4
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:65
        let file = location.file();
  10:	460e      	mov	r6, r1
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:66
        let line = location.line();
  12:	f7ff fffe 	bl	0 <core::panic::Location::line>
  16:	4604      	mov	r4, r0
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
  18:	f240 0000 	movw	r0, #0
  1c:	f2c0 0000 	movt	r0, #0
  20:	2109      	movs	r1, #9
  22:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  26:	f7ff fffe 	bl	0 <console_flush>
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:68
        console_print(b"panic at ");
        unsafe { console_buffer(file.as_ptr(), file.len() as u32) }
  2a:	4628      	mov	r0, r5
  2c:	4631      	mov	r1, r6
  2e:	f7ff fffe 	bl	0 <console_buffer>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
        console_buffer(msg.as_ptr(), len as u32);
  32:	f240 0000 	movw	r0, #0
  36:	2108      	movs	r1, #8
  38:	f2c0 0000 	movt	r0, #0
  3c:	f7ff fffe 	bl	0 <console_buffer>
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:12
        console_flush();  //  TODO: Remove this.
  40:	f7ff fffe 	bl	0 <console_flush>
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:70
        console_print(b" line 0x");
        unsafe { console_printhex(line as u8) }  //  TODO: Print in decimal not hex. Allow more than 255 lines.
  44:	b2e0      	uxtb	r0, r4
  46:	f7ff fffe 	bl	0 <console_printhex>
_ZN5mylib4base13console_print17hee1ead095790f478E():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/base.rs:11
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
_ZN8cortex_m3asm4bkpt17h756c5667fd4cf09cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/cortex-m-0.6.0/src/asm.rs:19
        () => unsafe {
            extern "C" {
                fn __bkpt();
            }

            __bkpt();
  6c:	f7ff fffe 	bl	0 <__bkpt>
rust_begin_unwind():
/Users/Luppy/mynewt/stm32bluepill-mynewt-sensor/src/lib.rs:80
        unsafe { console_flush() }
    }
    //  Pause in the debugger.
    bkpt();
    //  Loop forever so that device won't restart.
    loop {}
  70:	e7fe      	b.n	70 <rust_begin_unwind+0x70>

stable_deref_trait-7217bd26359e1e62.stable_deref_trait.btqg1xsq-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 stable_deref_trait.btqg1xsq-cgu.0



typenum-5e43afd1a912f4cf.typenum.8pty03hv-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 typenum.8pty03hv-cgu.0
00000761 l       .debug_str	00000000 
0000072f l       .debug_str	00000000 
00000733 l       .debug_str	00000000 
0000073c l       .debug_str	00000000 
00000748 l       .debug_str	00000000 
00000766 l       .debug_str	00000000 
00000777 l       .debug_str	00000000 
00000781 l       .debug_str	00000000 
000007df l       .debug_str	00000000 
000007ea l       .debug_str	00000000 
00000807 l       .debug_str	00000000 
0000080b l       .debug_str	00000000 
00000822 l       .debug_str	00000000 
00000846 l       .debug_str	00000000 
00000862 l       .debug_str	00000000 
00000867 l       .debug_str	00000000 
00000870 l       .debug_str	00000000 
00000877 l       .debug_str	00000000 
00000890 l       .debug_str	00000000 
0000089a l       .debug_str	00000000 
000008b4 l       .debug_str	00000000 
000008c6 l       .debug_str	00000000 
000008c9 l       .debug_str	00000000 
000008db l       .debug_str	00000000 
000008e1 l       .debug_str	00000000 
000008f8 l       .debug_str	00000000 
00000900 l       .debug_str	00000000 
00000912 l       .debug_str	00000000 
00000926 l       .debug_str	00000000 
0000092f l       .debug_str	00000000 
00000936 l       .debug_str	00000000 
00000941 l       .debug_str	00000000 
00000946 l       .debug_str	00000000 
00000951 l       .debug_str	00000000 
00000956 l       .debug_str	00000000 
00000965 l       .debug_str	00000000 
0000096b l       .debug_str	00000000 
00000000 l       .debug_str	00000000 
00000041 l       .debug_str	00000000 
00000098 l       .debug_str	00000000 
000000e4 l       .debug_str	00000000 
000000e9 l       .debug_str	00000000 
000000f0 l       .debug_str	00000000 
000000f3 l       .debug_str	00000000 
000000f6 l       .debug_str	00000000 
000000fa l       .debug_str	00000000 
00000101 l       .debug_str	00000000 
00000105 l       .debug_str	00000000 
00000108 l       .debug_str	00000000 
0000010b l       .debug_str	00000000 
00000110 l       .debug_str	00000000 
00000116 l       .debug_str	00000000 
0000011d l       .debug_str	00000000 
00000125 l       .debug_str	00000000 
0000012f l       .debug_str	00000000 
00000137 l       .debug_str	00000000 
0000013c l       .debug_str	00000000 
00000145 l       .debug_str	00000000 
0000014d l       .debug_str	00000000 
00000151 l       .debug_str	00000000 
00000155 l       .debug_str	00000000 
0000015b l       .debug_str	00000000 
000001be l       .debug_str	00000000 
000001c2 l       .debug_str	00000000 
000001c8 l       .debug_str	00000000 
0000026b l       .debug_str	00000000 
0000026f l       .debug_str	00000000 
000002e6 l       .debug_str	00000000 
000002ed l       .debug_str	00000000 
000002f1 l       .debug_str	00000000 
00000344 l       .debug_str	00000000 
00000397 l       .debug_str	00000000 
000003ee l       .debug_str	00000000 
00000441 l       .debug_str	00000000 
00000499 l       .debug_str	00000000 
000004ec l       .debug_str	00000000 
0000053c l       .debug_str	00000000 
0000058d l       .debug_str	00000000 
00000592 l       .debug_str	00000000 
000005a8 l       .debug_str	00000000 
000005b0 l       .debug_str	00000000 
000005b7 l       .debug_str	00000000 
000005bb l       .debug_str	00000000 
000005bf l       .debug_str	00000000 
000005c2 l       .debug_str	00000000 
000005eb l       .debug_str	00000000 
000005ed l       .debug_str	00000000 
00000623 l       .debug_str	00000000 
00000625 l       .debug_str	00000000 
00000627 l       .debug_str	00000000 
00000654 l       .debug_str	00000000 
00000657 l       .debug_str	00000000 
00000669 l       .debug_str	00000000 
0000066b l       .debug_str	00000000 
00000671 l       .debug_str	00000000 
00000675 l       .debug_str	00000000 
0000067a l       .debug_str	00000000 
0000067f l       .debug_str	00000000 
00000685 l       .debug_str	00000000 
0000068b l       .debug_str	00000000 
00000692 l       .debug_str	00000000 
00000697 l       .debug_str	00000000 
0000069d l       .debug_str	00000000 
000006a2 l       .debug_str	00000000 
000006b0 l       .debug_str	00000000 
000006ba l       .debug_str	00000000 
000006be l       .debug_str	00000000 
000006c6 l       .debug_str	00000000 
000006ce l       .debug_str	00000000 
000006d5 l       .debug_str	00000000 
000006e9 l       .debug_str	00000000 
000006f5 l       .debug_str	00000000 
00000700 l       .debug_str	00000000 
00000707 l       .debug_str	00000000 
0000070d l       .debug_str	00000000 
00000711 l       .debug_str	00000000 
00000717 l       .debug_str	00000000 
0000071d l       .debug_str	00000000 
00000720 l       .debug_str	00000000 
00000000 l     O .rodata..Lanon.d99c441b3bc02c502250ffbff647a69b.0	00000002 .Lanon.d99c441b3bc02c502250ffbff647a69b.0
00000000 l     O .rodata..Lanon.d99c441b3bc02c502250ffbff647a69b.1	00000002 .Lanon.d99c441b3bc02c502250ffbff647a69b.1
00000000 l     O .rodata..Lanon.d99c441b3bc02c502250ffbff647a69b.2	00000005 .Lanon.d99c441b3bc02c502250ffbff647a69b.2
00000000 l     O .rodata..Lanon.d99c441b3bc02c502250ffbff647a69b.3	00000002 .Lanon.d99c441b3bc02c502250ffbff647a69b.3
00000000 l     O .rodata..Lanon.d99c441b3bc02c502250ffbff647a69b.4	00000005 .Lanon.d99c441b3bc02c502250ffbff647a69b.4
00000000 l     O .rodata..Lanon.d99c441b3bc02c502250ffbff647a69b.5	00000007 .Lanon.d99c441b3bc02c502250ffbff647a69b.5
00000000 l     O .rodata.cst4	00000004 .Lanon.d99c441b3bc02c502250ffbff647a69b.6
00000000 l     O .rodata..Lanon.d99c441b3bc02c502250ffbff647a69b.7	00000005 .Lanon.d99c441b3bc02c502250ffbff647a69b.7
00000000 l    d  .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17h91c1b2a5c4bc9ccaE	00000000 .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17h91c1b2a5c4bc9ccaE
00000000 l    d  .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000000 .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E
00000000 l    d  .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417he7f259208740878fE	00000000 .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417he7f259208740878fE
00000000 l    d  .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17h25ad4ac5a38c56e2E	00000000 .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17h25ad4ac5a38c56e2E
00000000 l    d  .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17hb0e00963cc1b12aaE	00000000 .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17hb0e00963cc1b12aaE
00000000 l    d  .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf5dbf79d3b29738E	00000000 .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf5dbf79d3b29738E
00000000 l    d  .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h362f0dbe3a515173E	00000000 .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h362f0dbe3a515173E
00000000 l    d  .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h6c2f3b716a45824cE	00000000 .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h6c2f3b716a45824cE
00000000 l    d  .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h477a4f0bd9ae987cE	00000000 .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h477a4f0bd9ae987cE
00000000 l    d  .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17hccc2e396b35683b7E	00000000 .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17hccc2e396b35683b7E
00000000 l    d  .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h3f1abc5535d6cc21E	00000000 .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h3f1abc5535d6cc21E
00000000 l    d  .debug_loc	00000000 .debug_loc
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .debug_line	00000000 .debug_line
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UInt<typenum::uint::UTerm,typenum::bit::B1> as core::ops::arith::Sub<typenum::bit::B1>>::sub
00000000         *UND*	00000000 core::fmt::builders::DebugTuple::finish
00000000         *UND*	00000000 core::fmt::Formatter::debug_tuple
00000000 g     F .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17hccc2e396b35683b7E	00000020 <typenum::Less as core::fmt::Debug>::fmt
00000000 g     F .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h3f1abc5535d6cc21E	00000020 <typenum::Equal as core::fmt::Debug>::fmt
00000000 g     F .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h477a4f0bd9ae987cE	00000020 <typenum::Greater as core::fmt::Debug>::fmt
00000000 g     F .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17h25ad4ac5a38c56e2E	00000020 <typenum::bit::B0 as core::fmt::Debug>::fmt
00000000 g     F .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17hb0e00963cc1b12aaE	00000020 <typenum::bit::B1 as core::fmt::Debug>::fmt
00000000 g     F .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h362f0dbe3a515173E	00000020 <typenum::int::Z0 as core::fmt::Debug>::fmt
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as core::ops::bit::Not>::not
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as core::ops::bit::Not>::not
00000000 g     F .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf5dbf79d3b29738E	00000020 <typenum::uint::UTerm as core::fmt::Debug>::fmt
00000000 g     F .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h6c2f3b716a45824cE	00000020 <typenum::array::ATerm as core::fmt::Debug>::fmt
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as core::ops::bit::BitOr>::bitor
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::int::Z0 as core::ops::arith::Neg>::neg
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::int::Z0 as core::ops::arith::Sub>::sub
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as core::ops::bit::BitXor>::bitxor
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as core::ops::bit::BitAnd>::bitand
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as core::ops::bit::BitXor>::bitxor
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::arith::Sub>::sub
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::array::ATerm as core::ops::arith::Add>::add
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::array::ATerm as core::ops::arith::Neg>::neg
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::array::ATerm as core::ops::arith::Sub>::sub
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as typenum::type_operators::Max>::max
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as typenum::type_operators::Min>::min
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as typenum::type_operators::Max>::max
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as typenum::type_operators::Min>::min
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::int::Z0 as typenum::type_operators::Max>::max
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::int::Z0 as typenum::type_operators::Min>::min
00000000 g     F .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17h91c1b2a5c4bc9ccaE	00000002 <typenum::uint::UTerm as typenum::type_operators::Len>::len
00000000 g     F .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17h91c1b2a5c4bc9ccaE	00000002 <typenum::array::ATerm as typenum::type_operators::Len>::len
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 typenum::array::<impl core::ops::arith::Mul<typenum::array::ATerm> for typenum::int::Z0>::mul
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as core::ops::bit::BitOr<typenum::bit::B1>>::bitor
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as core::ops::bit::BitXor<typenum::bit::B1>>::bitxor
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as core::ops::bit::BitAnd<typenum::bit::B0>>::bitand
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as core::ops::bit::BitXor<typenum::bit::B0>>::bitxor
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::bit::Shl<typenum::bit::B0>>::shl
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::bit::Shl<typenum::bit::B1>>::shl
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::bit::Shr<typenum::bit::B0>>::shr
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::bit::Shr<typenum::bit::B1>>::shr
00000000 g     F .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417he7f259208740878fE	00000006 <typenum::private::InvertedUTerm as typenum::private::InvertedUnsigned>::to_u64
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::arith::Add<typenum::bit::B0>>::add
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::arith::Add<typenum::bit::B1>>::add
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::arith::Mul<typenum::bit::B0>>::mul
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::arith::Mul<typenum::bit::B1>>::mul
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::uint::UTerm as core::ops::arith::Sub<typenum::bit::B0>>::sub
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as typenum::type_operators::Max<typenum::bit::B1>>::max
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B0 as typenum::type_operators::Min<typenum::bit::B1>>::min
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as typenum::type_operators::Max<typenum::bit::B0>>::max
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::bit::B1 as typenum::type_operators::Min<typenum::bit::B0>>::min
00000000 g     F .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E	00000002 <typenum::int::Z0 as typenum::type_operators::Pow<typenum::int::Z0>>::powi



Disassembly of section .text._ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17h91c1b2a5c4bc9ccaE:

00000000 <<typenum::uint::UTerm as typenum::type_operators::Len>::len>:
_ZN69_$LT$typenum..uint..UTerm$u20$as$u20$typenum..type_operators..Len$GT$3len17h91c1b2a5c4bc9ccaE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/uint.rs:244
/// Length of `UTerm` by itself is 0
impl Len for UTerm {
    type Output = U0;
    fn len(&self) -> Self::Output {
        UTerm
    }
   0:	4770      	bx	lr

Disassembly of section .text._ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E:

00000000 <<typenum::uint::UInt<typenum::uint::UTerm,typenum::bit::B1> as core::ops::arith::Sub<typenum::bit::B1>>::sub>:
_ZN132_$LT$typenum..uint..UInt$LT$typenum..uint..UTerm$C$typenum..bit..B1$GT$$u20$as$u20$core..ops..arith..Sub$LT$typenum..bit..B1$GT$$GT$3sub17h5db282b74a2f4371E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/uint.rs:403
/// `UInt<UTerm, B1> - B1 = UTerm`
impl Sub<B1> for UInt<UTerm, B1> {
    type Output = UTerm;
    fn sub(self, _: B1) -> Self::Output {
        UTerm
    }
   0:	4770      	bx	lr

Disassembly of section .text._ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417he7f259208740878fE:

00000000 <<typenum::private::InvertedUTerm as typenum::private::InvertedUnsigned>::to_u64>:
_ZN86_$LT$typenum..private..InvertedUTerm$u20$as$u20$typenum..private..InvertedUnsigned$GT$6to_u6417he7f259208740878fE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/private.rs:116
}

impl InvertedUnsigned for InvertedUTerm {
    fn to_u64() -> u64 {
        0
    }
   0:	2000      	movs	r0, #0
   2:	2100      	movs	r1, #0
   4:	4770      	bx	lr

Disassembly of section .text._ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17h25ad4ac5a38c56e2E:

00000000 <<typenum::bit::B0 as core::fmt::Debug>::fmt>:
_ZN53_$LT$typenum..bit..B0$u20$as$u20$core..fmt..Debug$GT$3fmt17h25ad4ac5a38c56e2E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/bit.rs:19
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
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17hb0e00963cc1b12aaE:

00000000 <<typenum::bit::B1 as core::fmt::Debug>::fmt>:
_ZN53_$LT$typenum..bit..B1$u20$as$u20$core..fmt..Debug$GT$3fmt17hb0e00963cc1b12aaE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/bit.rs:31
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
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf5dbf79d3b29738E:

00000000 <<typenum::uint::UTerm as core::fmt::Debug>::fmt>:
_ZN57_$LT$typenum..uint..UTerm$u20$as$u20$core..fmt..Debug$GT$3fmt17hcf5dbf79d3b29738E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/uint.rs:49
#[derive(Eq, PartialEq, Ord, PartialOrd, Clone, Copy, Hash, Debug, Default)]
   0:	b510      	push	{r4, lr}
   2:	b084      	sub	sp, #16
   4:	ac01      	add	r4, sp, #4
   6:	f240 0200 	movw	r2, #0
   a:	f2c0 0200 	movt	r2, #0
   e:	2305      	movs	r3, #5
  10:	4620      	mov	r0, r4
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h362f0dbe3a515173E:

00000000 <<typenum::int::Z0 as core::fmt::Debug>::fmt>:
_ZN53_$LT$typenum..int..Z0$u20$as$u20$core..fmt..Debug$GT$3fmt17h362f0dbe3a515173E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/int.rs:74
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
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h6c2f3b716a45824cE:

00000000 <<typenum::array::ATerm as core::fmt::Debug>::fmt>:
_ZN58_$LT$typenum..array..ATerm$u20$as$u20$core..fmt..Debug$GT$3fmt17h6c2f3b716a45824cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/array.rs:11
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
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h477a4f0bd9ae987cE:

00000000 <<typenum::Greater as core::fmt::Debug>::fmt>:
_ZN53_$LT$typenum..Greater$u20$as$u20$core..fmt..Debug$GT$3fmt17h477a4f0bd9ae987cE():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/lib.rs:84
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
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17hccc2e396b35683b7E:

00000000 <<typenum::Less as core::fmt::Debug>::fmt>:
_ZN50_$LT$typenum..Less$u20$as$u20$core..fmt..Debug$GT$3fmt17hccc2e396b35683b7E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/lib.rs:89
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
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

Disassembly of section .text._ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h3f1abc5535d6cc21E:

00000000 <<typenum::Equal as core::fmt::Debug>::fmt>:
_ZN51_$LT$typenum..Equal$u20$as$u20$core..fmt..Debug$GT$3fmt17h3f1abc5535d6cc21E():
/Users/Luppy/.cargo/registry/src/github.com-1ecc6299db9ec823/typenum-1.10.0/src/lib.rs:94
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
  12:	f7ff fffe 	bl	0 <core::fmt::Formatter::debug_tuple>
  16:	4620      	mov	r0, r4
  18:	f7ff fffe 	bl	0 <core::fmt::builders::DebugTuple::finish>
  1c:	b004      	add	sp, #16
  1e:	bd10      	pop	{r4, pc}

vcell-66dc4500e46a6b24.vcell.2a5lr7d4-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 vcell.2a5lr7d4-cgu.0



volatile_register-80e64bac8e19725e.volatile_register.9i4532rz-cgu.0.rcgu.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 volatile_register.9i4532rz-cgu.0


