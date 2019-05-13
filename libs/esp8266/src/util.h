#ifndef __ESP8266_UTIL_H__
#define __ESP8266_UTIL_H__
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Common strings here to reduce space

extern "C" const char *_esp;  //  Trailer for console output: "ESP "

//  Return " OK\n" if ok, else return " FAILED\n".
const char *_okfailed(int ok);

#ifdef __cplusplus
}
#endif

#endif /* __ESP8266_UTIL_H__ */
