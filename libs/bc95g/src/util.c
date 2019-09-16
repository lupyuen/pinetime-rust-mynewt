#include <console/console.h>
#include "util.h"

///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Put common strings here to reduce space.

const char *_nbt = "NBT ";  //  Trailer for console output
int debug_bc95g = 0;

const char *_okfailed(int ok) {
    if (ok) { return " OK\n"; }
    return " FAILED\n";
}

void _log(const char *func, int ok) {
    console_printf("%s%s%s", _nbt, func, _okfailed(ok));
    console_flush();
}
