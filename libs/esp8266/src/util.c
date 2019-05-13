///////////////////////////////////////////////////////////////////////////////
//  Logging Functions: Put common strings here to reduce space.

const char *_esp = "ESP ";  //  Trailer for console output

const char *_okfailed(int ok) {
    if (ok) { return " OK\n"; }
    return " FAILED\n";
}
