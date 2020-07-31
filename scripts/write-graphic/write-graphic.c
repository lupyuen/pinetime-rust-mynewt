#include <stdio.h>
#include <stdlib.h>

/// Boot Graphic to be written. Converted from PNG file by https://github.com/lupyuen/pinetime-graphic
static const uint8_t image_data[] = {  //  Should be 115,200 bytes
#include "graphic.inc"
};

/// Write Boot Graphic as binary file.
int main() {
    FILE *f = fopen("boot-graphic.bin", "wb");
    fwrite (image_data , sizeof(uint8_t), sizeof(image_data), f);
    fclose(f);
    return 0;
}