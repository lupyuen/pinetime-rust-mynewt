#include <console/console.h>
#include "util.h"

///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Put common strings here to reduce space.

const char *_esp = "ESP ";  //  Trailer for console output

const char *_okfailed(int ok) {
    if (ok) { return " OK\n"; }
    return " FAILED\n";
}

void _log(const char *func, int ok) {
    console_printf("%s%s%s", _esp, func, _okfailed(ok));
    console_flush();
}
