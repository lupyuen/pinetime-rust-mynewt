In archive bin/targets/bluepill_my_sensor/generated/bin/bluepill_my_sensor-sysinit-app.a:

bluepill_my_sensor-sysdown-app.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 bluepill_my_sensor-sysdown-app.c
00000000 l    d  .text	00000000 .text
00000000 l    d  .data	00000000 .data
00000000 l    d  .bss	00000000 .bss
00000000 l    d  .rodata.sysdown_cbs	00000000 .rodata.sysdown_cbs
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_aranges	00000000 .debug_aranges
00000000 l    d  .debug_line	00000000 .debug_line
00000000 l    d  .debug_str	00000000 .debug_str
00000000 l    d  .comment	00000000 .comment
00000000 l    d  .ARM.attributes	00000000 .ARM.attributes
00000000 g     O .rodata.sysdown_cbs	00000004 sysdown_cbs



bluepill_my_sensor-sysflash.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 bluepill_my_sensor-sysflash.c
00000000 l    d  .text	00000000 .text
00000000 l    d  .data	00000000 .data
00000000 l    d  .bss	00000000 .bss
00000000 l    d  .rodata.sysflash_map_dflt	00000000 .rodata.sysflash_map_dflt
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_aranges	00000000 .debug_aranges
00000000 l    d  .debug_line	00000000 .debug_line
00000000 l    d  .debug_str	00000000 .debug_str
00000000 l    d  .comment	00000000 .comment
00000000 l    d  .ARM.attributes	00000000 .ARM.attributes
00000000 g     O .rodata.sysflash_map_dflt	00000048 sysflash_map_dflt



bluepill_my_sensor-sysinit-app.o:     file format elf32-littlearm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 bluepill_my_sensor-sysinit-app.c
00000000 l    d  .text	00000000 .text
00000000 l    d  .data	00000000 .data
00000000 l    d  .bss	00000000 .bss
00000000 l    d  .text.sysinit_app	00000000 .text.sysinit_app
00000000 l    d  .debug_info	00000000 .debug_info
00000000 l    d  .debug_abbrev	00000000 .debug_abbrev
00000000 l    d  .debug_aranges	00000000 .debug_aranges
00000000 l    d  .debug_ranges	00000000 .debug_ranges
00000000 l    d  .debug_line	00000000 .debug_line
00000000 l    d  .debug_str	00000000 .debug_str
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000 l    d  .comment	00000000 .comment
00000000 l    d  .ARM.attributes	00000000 .ARM.attributes
00000000 g     F .text.sysinit_app	00000058 sysinit_app
00000000         *UND*	00000000 os_pkg_init
00000000         *UND*	00000000 flash_map_init
00000000         *UND*	00000000 console_pkg_init
00000000         *UND*	00000000 mfg_init
00000000         *UND*	00000000 modlog_init
00000000         *UND*	00000000 oc_init
00000000         *UND*	00000000 oc_register_gatt
00000000         *UND*	00000000 oc_register_ip4
00000000         *UND*	00000000 oc_register_ip6
00000000         *UND*	00000000 oc_register_lora
00000000         *UND*	00000000 oc_register_serial
00000000         *UND*	00000000 sensor_dev_create
00000000         *UND*	00000000 sensor_pkg_init
00000000         *UND*	00000000 stm32f1_adc_create
00000000         *UND*	00000000 temp_stm32_create
00000000         *UND*	00000000 hmac_prng_init
00000000         *UND*	00000000 sensor_network_init
00000000         *UND*	00000000 esp8266_create
00000000         *UND*	00000000 nrf24l01_create
00000000         *UND*	00000000 init_sensor_coap
00000000         *UND*	00000000 remote_sensor_create



Disassembly of section .text.sysinit_app:

00000000 <sysinit_app>:
void init_sensor_coap(void);
void remote_sensor_create(void);

void
sysinit_app(void)
{
   0:	b508      	push	{r3, lr}
    /*** Stage 0 */
    /* 0.0: os_pkg_init (kernel/os) */
    os_pkg_init();
   2:	f7ff fffe 	bl	0 <os_pkg_init>

    /*** Stage 2 */
    /* 2.0: flash_map_init (sys/flash_map) */
    flash_map_init();
   6:	f7ff fffe 	bl	0 <flash_map_init>

    /*** Stage 20 */
    /* 20.0: console_pkg_init (libs/semihosting_console) */
    console_pkg_init();
   a:	f7ff fffe 	bl	0 <console_pkg_init>

    /*** Stage 100 */
    /* 100.0: mfg_init (sys/mfg) */
    mfg_init();
   e:	f7ff fffe 	bl	0 <mfg_init>
    /* 100.1: modlog_init (sys/log/modlog) */
    modlog_init();
  12:	f7ff fffe 	bl	0 <modlog_init>

    /*** Stage 300 */
    /* 300.0: oc_init (net/oic) */
    oc_init();
  16:	f7ff fffe 	bl	0 <oc_init>

    /*** Stage 301 */
    /* 301.0: oc_register_gatt (net/oic) */
    oc_register_gatt();
  1a:	f7ff fffe 	bl	0 <oc_register_gatt>
    /* 301.1: oc_register_ip4 (net/oic) */
    oc_register_ip4();
  1e:	f7ff fffe 	bl	0 <oc_register_ip4>
    /* 301.2: oc_register_ip6 (net/oic) */
    oc_register_ip6();
  22:	f7ff fffe 	bl	0 <oc_register_ip6>
    /* 301.3: oc_register_lora (net/oic) */
    oc_register_lora();
  26:	f7ff fffe 	bl	0 <oc_register_lora>
    /* 301.4: oc_register_serial (net/oic) */
    oc_register_serial();
  2a:	f7ff fffe 	bl	0 <oc_register_serial>

    /*** Stage 500 */
    /* 500.0: sensor_dev_create (hw/sensor/creator) */
    sensor_dev_create();
  2e:	f7ff fffe 	bl	0 <sensor_dev_create>

    /*** Stage 501 */
    /* 501.0: sensor_pkg_init (hw/sensor) */
    sensor_pkg_init();
  32:	f7ff fffe 	bl	0 <sensor_pkg_init>

    /*** Stage 610 */
    /* 610.0: stm32f1_adc_create (libs/adc_stm32f1) */
    stm32f1_adc_create();
  36:	f7ff fffe 	bl	0 <stm32f1_adc_create>

    /*** Stage 620 */
    /* 620.0: temp_stm32_create (libs/temp_stm32) */
    temp_stm32_create();
  3a:	f7ff fffe 	bl	0 <temp_stm32_create>

    /*** Stage 630 */
    /* 630.0: hmac_prng_init (libs/hmac_prng) */
    hmac_prng_init();
  3e:	f7ff fffe 	bl	0 <hmac_prng_init>

    /*** Stage 640 */
    /* 640.0: sensor_network_init (libs/sensor_network) */
    sensor_network_init();
  42:	f7ff fffe 	bl	0 <sensor_network_init>

    /*** Stage 650 */
    /* 650.0: esp8266_create (libs/esp8266) */
    esp8266_create();
  46:	f7ff fffe 	bl	0 <esp8266_create>
    /* 650.1: nrf24l01_create (libs/nrf24l01) */
    nrf24l01_create();
  4a:	f7ff fffe 	bl	0 <nrf24l01_create>

    /*** Stage 660 */
    /* 660.0: init_sensor_coap (libs/sensor_coap) */
    init_sensor_coap();
  4e:	f7ff fffe 	bl	0 <init_sensor_coap>

    /*** Stage 670 */
    /* 670.0: remote_sensor_create (libs/remote_sensor) */
    remote_sensor_create();
  52:	f7ff fffe 	bl	0 <remote_sensor_create>
}
  56:	bd08      	pop	{r3, pc}
