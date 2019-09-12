//  Generate pseuorandom numbers with HMAC.  Based on TinyCrypt HMAC PRNG.  Uses temp_stm32 internal temperature sensor as source of entropy.

#include <os/os.h>
#include <hal/hal_bsp.h>
#include <console/console.h>
#include <tinycrypt/hmac_prng.h>
#include <temp_stm32/temp_stm32.h>
#include "hmac_prng/hmac_prng.h"

static struct tc_hmac_prng_struct prng;  //  TinyCrypt HMAC PRNG.
static uint8_t hw_id[12];  //  Hardware ID is 12 bytes for STM32
static int hw_id_len;      //  Actual length of hardware ID
static uint8_t seed[32];   //  Seed must be >= 32 bytes long

void hmac_prng_init(void) {
    //  Init the pseudorandom number generator with hardware ID and internal temperature sensor entropy.  
    //  Assumes temp_stm32 driver is already started.  Called by sysinit() during startup, defined in pkg.yml.
    int rc;
#define ENTROPY
#ifdef ENTROPY
    //  Use the internal temperature sensor as a source of entropy (noise) for the generator.
    int rawtemp;
    //  Open the temp_stm32 internal temperature sensor driver.  Assumes already started with "stm32f1_adc_create();  temp_stm32_create();""
    struct temp_stm32 *dev = (struct temp_stm32 *) os_dev_open(MYNEWT_VAL(TEMP_STM32_DEVICE), OS_TIMEOUT_NEVER, NULL);  assert(dev);

    //  Fetch 32 bytes of temperature noise into the seed array.
    rc = temp_stm32_get_raw_temperature(dev, sizeof(seed) * 2, &rawtemp, seed); assert(rc == 0);
    os_dev_close((struct os_dev *) dev);  //  Close the driver.
#endif  //  ENTROPY

    //  Fetch the hardware ID.  This is unique across all microcontrollers.  
    hw_id_len = hal_bsp_hw_id_len();     //  Fetch the length, i.e. 12
    assert(hw_id_len >= sizeof(hw_id));  //  Hardware ID too short.
    hw_id_len = hal_bsp_hw_id(hw_id, sizeof(hw_id));  assert(hw_id_len > 0);  //  Get the hardware ID.

    //  Personalise the random number generator with the hardware ID.
    //  TinyCrypt uses the hardware ID to prevent generating similar random numbers across microcontrollers.
    console_printf("RND personalise with hw id "); console_dump(hw_id, hw_id_len); console_printf("\n"); console_flush(); ////
    rc = tc_hmac_prng_init(&prng, hw_id, hw_id_len);  assert(rc);

#ifdef ENTROPY
    console_printf("RND seed with temp entropy "); console_dump(seed, sizeof(seed)); console_printf("\n"); console_flush(); ////
#else
    console_printf("NO ENTROPY\n");
#endif  //  ENTROPY

    //  Use the temperature entropy data to seed the generator.  Seed must be >= 32 bytes long.
    rc = tc_hmac_prng_reseed(&prng, seed, sizeof(seed), NULL, 0);
    assert(rc);
}

int hmac_prng_generate(uint8_t *rnd, unsigned int rndlen) {
    //  Generate a random number of length rndlen bytes and save to rnd.  Return 0 if successful.
    int rc;
    //  Call TinyCrypt to generate the random number.
    rc = tc_hmac_prng_generate(rnd, rndlen, &prng);  assert(rc);
    return 0;
}
