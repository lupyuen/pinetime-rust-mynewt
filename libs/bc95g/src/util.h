#ifndef __ESP8266_UTIL_H__
#define __ESP8266_UTIL_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Common strings here to reduce space

//  Return " OK\n" if ok, else return " FAILED\n".
const char *_okfailed(int ok);

//  Log a message to the console like: "ESP func OK" or "ESP func failed". Flush the console after logging.
void _log(const char *func, int ok);

extern const char *_esp;  //  Trailer for console output: "ESP "

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_UTIL_H__ */
