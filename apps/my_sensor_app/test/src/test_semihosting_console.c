#include <console/console.h>

void test_semihosting_console(void) {  ////
    //  Test floats.
    console_printf("12.34=");  console_printfloat(12.34f);  console_printf("\n");
    console_printf("9.87=");   console_printfloat(9.87f);   console_printf("\n");
    console_printf("0.89=");   console_printfloat(0.89f);   console_printf("\n");
    console_printf("0.12=");   console_printfloat(0.12f);   console_printf("\n");
    console_printf("-0.12=");  console_printfloat(-0.12f);  console_printf("\n");
    console_printf("-0.89=");  console_printfloat(-0.89f);  console_printf("\n");
    console_printf("-9.87=");  console_printfloat(-9.87f);  console_printf("\n");
    console_printf("-12.34="); console_printfloat(-12.34f); console_printf("\n");
    console_flush();
}
