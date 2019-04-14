//  TODO: Use unit test convention
#include <os/os.h>
#include <console/console.h>
#include <adc_stm32f1/adc_stm32f1.h>
#include <temp_stm32/temp_stm32.h>
#include <hmac_prng/hmac_prng.h>

void test_random(void) {
    int rc;
    stm32f1_adc_create();
    temp_stm32_create();
    rc = hmac_prng_init();  assert(rc == 0);

    int i;
    console_printf("Generated random numbers:\n");
    for (i = 0; i < 10; i++) {
        uint8_t rnd[4];
        memset(&rnd, 0, sizeof(rnd));
        rc = hmac_prng_generate(rnd, sizeof(rnd));  assert(rc == 0);
        console_printf("#%d: ", i); console_dump(rnd, sizeof(rnd)); 
        if (i % 2 == 0) { console_printf(" |  "); }
        else { console_printf("\n"); } ////
    }
    console_flush();  ////
}
