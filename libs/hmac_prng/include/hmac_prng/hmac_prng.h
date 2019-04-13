//  Generate pseuorandom numbers with HMAC.  Based on TinyCrypt HMAC PRNG.  Uses temp_stm32 internal temperature sensor as source of entropy.
#ifndef __HMAC_PRNG_H__
#define __HMAC_PRNG_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {  //  Expose the types and functions below to C functions.
#endif

//  Init the pseudorandom number generator with hardware ID and internal temperature sensor entropy.  
//  Assumes temp_stm32 driver is already started.  Return 0 if successful.
int hmac_prng_init(void);

//  Generate a random number of length rndlen bytes and save to rnd.  Return 0 if successful.
int hmac_prng_generate(uint8_t *rnd, unsigned int rndlen);

#ifdef __cplusplus
}
#endif

#endif  //  __HMAC_PRNG_H__
