//  repos\apache-mynewt-core\crypto\tinycrypt\include\tinycrypt\hmac_prng.h
#include <os/os.h>
#include <hal/hal_bsp.h>
#include <console/console.h>
#include <tinycrypt/hmac_prng.h>

static struct tc_hmac_prng_struct prng;
static uint8_t hw_id[12];  //  Hardware ID is 12 bytes for STM32
static int hw_id_len;      //  Actual length of hardware ID
static uint8_t seed[32];   //  Seed must be >= 32 bytes long

void test_random(void) {
    //  int hal_bsp_hw_id_len(void);
    //  int hal_bsp_hw_id(uint8_t * id, int max_len);

    hw_id_len = hal_bsp_hw_id_len();
    assert(hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.

    hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));
    assert(hw_id_len > 0);
    console_printf("hw_id: "); console_dump(hw_id, hw_id_len); console_printf("\n"); console_flush(); ////

    //  int tc_hmac_prng_init(TCHmacPrng_t prng, const uint8_t *personalization, unsigned int plen);
    int rc = tc_hmac_prng_init(&prng, hw_id, hw_id_len);
    assert(rc);

    //  int tc_hmac_prng_reseed(TCHmacPrng_t prng, const uint8_t *seed,
		//	unsigned int seedlen, const uint8_t *additional_input,
		//	unsigned int additionallen);

    //  Seed must be >= 32 bytes long.
    rc = tc_hmac_prng_reseed(&prng, seed, sizeof(seed), NULL, 0);
    assert(rc);

    int i;
    console_printf("Generated random numbers:\n");
    for (i = 0; i < 10; i++) {
      uint8_t rnd[4];
      memset(&rnd, 0, sizeof(rnd));
      //  int tc_hmac_prng_generate(uint8_t *out, unsigned int outlen, TCHmacPrng_t prng);
      rc = tc_hmac_prng_generate(rnd, sizeof(rnd), &prng);
      assert(rc);
      console_printf("#%d: ", i); console_dump(rnd, sizeof(rnd)); console_printf("\n"); ////
    }
    console_flush();  ////
    for (;;) {}  ////
}
