//  Generate pseuorandom numbers with HMAC.  Based on TinyCrypt HMAC PRNG.  Uses temp_stm32 internal temperature sensor as source of entropy.

#include <os/os.h>
#include <hal/hal_bsp.h>
#include <console/console.h>
#include <tinycrypt/hmac_prng.h>
#include <adc_stm32f1/adc_stm32f1.h>
#include <temp_stm32/temp_stm32.h>

static struct tc_hmac_prng_struct prng;  //  TinyCrypt HMAC PRNG.
static uint8_t hw_id[12];  //  Hardware ID is 12 bytes for STM32
static int hw_id_len;      //  Actual length of hardware ID
static uint8_t seed[32];   //  Seed must be >= 32 bytes long

int hmac_prng_init(void) {
    //  Init the pseudorandom number generator with hardware ID and internal temperature sensor entropy.  
    //  Assumes temp_stm32 driver is already started.  Return 0 if successful.
    int rc, rawtemp;
#define ENTROPY
#ifdef ENTROPY
    //  stm32f1_adc_create();  temp_stm32_create();
    struct temp_stm32 *dev = (struct temp_stm32 *) os_dev_open(TEMP_STM32_DEVICE, OS_TIMEOUT_NEVER, NULL);
    assert(dev);

    rc = temp_stm32_get_raw_temperature(dev, sizeof(seed) * 2, &rawtemp, seed);
    assert(rc == 0);
    os_dev_close((struct os_dev *) dev);
#endif  //  ENTROPY

    //  Personalise the random number generator with the hardware ID.
    hw_id_len = hal_bsp_hw_id_len();
    assert(hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.

    hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));
    assert(hw_id_len > 0);
    console_printf("Personalising random number generator with\n");  ////
    console_printf("hw_id: "); console_dump(hw_id, hw_id_len); console_printf("\n"); console_flush(); ////

    //  int tc_hmac_prng_init(TCHmacPrng_t prng, const uint8_t *personalization, unsigned int plen);
    rc = tc_hmac_prng_init(&prng, hw_id, hw_id_len);
    assert(rc);

#ifdef ENTROPY
    console_printf("SEEDING WITH TEMPERATURE SENSOR ENTROPY:\n");
    console_dump(seed, sizeof(seed)); console_printf("\n"); console_flush(); ////
#else
    console_printf("NO ENTROPY\n");
#endif  //  ENTROPY
    //  Seed must be >= 32 bytes long.
    rc = tc_hmac_prng_reseed(&prng, seed, sizeof(seed), NULL, 0);
    assert(rc);
    return 0;
}

int hmac_prng_generate(uint8_t *rnd, unsigned int rndlen) {
    //  Generate a random number of length rndlen bytes and save to rnd.  Return 0 if successful.
    int rc;
    rc = tc_hmac_prng_generate(rnd, rndlen, &prng);
    assert(rc);
    return 0;
}
