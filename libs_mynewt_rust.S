In archive bin/targets/bluepill_my_sensor/app/libs/mynewt_rust/libs_mynewt_rust.a:

mynewt_rust.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 mynewt_rust.c
00000000 l    d  .text	00000000 .text
00000000 l    d  .data	00000000 .data
00000000 l    d  .bss	00000000 .bss
00000000 l    d  .text.rust_sysinit	00000000 .text.rust_sysinit
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_aranges	00000000 .debug_aranges
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_line	00000000 .debug_line
00000000 l    d  .debug_str	00000000 .debug_str
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .comment	00000000 .comment
00000000 l    d  .ARM.attributes	00000000 .ARM.attributes
00000000 g     F .text.rust_sysinit	00000010 rust_sysinit
00000000         *UND*	00000000 sysinit_start
00000000         *UND*	00000000 sysinit_app
00000000         *UND*	00000000 sysinit_end



Disassembly of section .text.rust_sysinit:

00000000 <rust_sysinit>:
#include <sysinit/sysinit.h>  //  Contains all app settings consolidated from "apps/my_sensor_app/syscfg.yml" and "targets/bluepill_my_sensor/syscfg.yml"

void rust_sysinit() {
   0:	b508      	push	{r3, lr}
    sysinit();
   2:	f7ff fffe 	bl	0 <sysinit_start>
   6:	f7ff fffe 	bl	0 <sysinit_app>
   a:	f7ff fffe 	bl	0 <sysinit_end>
}
   e:	bd08      	pop	{r3, pc}
