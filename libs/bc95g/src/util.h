#ifndef __BC95G_UTIL_H__
#define __BC95G_UTIL_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Common strings here to reduce space

//  Return " OK\n" if ok, else return " FAILED\n".
const char *_okfailed(int ok);

//  Log a message to the console like: "NBT func OK" or "NBT func failed". Flush the console after logging.
void _log(const char *func, int ok);

extern const char *_nbt;  //  Trailer for console output: "NBT "
extern int debug_bc95g;   //  Set to non-zero for debug mode

#ifdef __cplusplus
}
#endif

#endif /* __BC95G_UTIL_H__ */
