#include <sysinit/sysinit.h>
#include <os/os.h>
#include <defs/error.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include <console/console.h>  //  Actually points to libs/semihosting_console
#include <hal/hal_uart.h>     //  UART functions.

#define MY_UART 0  //  Select UART port: 0 means UART2.

static char *cmds[] = {     //  List of ESP8266 commands to be sent.
    "AT+CWMODE_CUR=3\r\n",  //  Set to WiFi Client mode (not WiFi Access Point mode).
    "AT+CWLAP\r\n",         //  List all WiFi access points.
    NULL                    //  No more commands.
};
static char **cmd_ptr = NULL;   //  Pointer to ESP8266 command being sent.
static char *tx_buf = NULL;     //  ESP8266 command buffer being sent.
static char *tx_ptr = NULL;     //  Pointer to next ESP8266 command buffer byte to be sent.
static char rx_buf[256];        //  ESP8266 receive buffer.
static char *rx_ptr = NULL;     //  Pointer to next ESP8266 receive buffer byte to be received.
static struct os_callout next_cmd_callout;  //  Callout to switch to next ESP8266 command after a delay.

static int uart_tx_char(void *arg) {    
    //  UART driver asks for more data to send. Return -1 if no more data is available for TX.
    if (tx_ptr == NULL || *tx_ptr == 0) { return -1; }
    char byte = *tx_ptr++;  //  Fetch next byte from tx buffer.
    return byte;
}

static int uart_rx_char(void *arg, uint8_t byte) {
    //  UART driver reports incoming byte of data. Return -1 if data was dropped.
    if (rx_ptr - rx_buf < sizeof(rx_buf)) { *rx_ptr++ = byte; }  //  Save to rx buffer.
    return 0;
}

static void uart_tx_done(void *arg) {
    //  UART driver reports that transmission is complete.
    //  We wait 5 seconds for the current command to complete, 
    //  then trigger the next_cmd callout to switch to next ESP8266 command.
    int rc = os_callout_reset(&next_cmd_callout, OS_TICKS_PER_SEC * 5);
    assert(rc == 0);
}

static void next_cmd(struct os_event *ev) {
    //  Switch to next ESP8266 command.
    assert(ev);
    if (rx_buf[0]) {  //  If UART data has been received...
        console_printf("< %s\n", rx_buf);   //  Show the UART data.
        memset(rx_buf, 0, sizeof(rx_buf));  //  Empty the rx buffer.
        rx_ptr = rx_buf;
    }
    if (*cmd_ptr == NULL) {      //  No more commands.
        tx_buf = NULL;
        tx_ptr = NULL;
        return; 
    }
    tx_buf = *cmd_ptr++;         //  Fetch next command.
    tx_ptr = tx_buf;
    hal_uart_start_rx(MY_UART);  //  Start receiving UART data.
    hal_uart_start_tx(MY_UART);  //  Start transmitting UART data.
}

static int setup_uart(void) {
    int rc;
    //  Init tx and rx buffers.
    cmd_ptr = cmds;
    if (*cmd_ptr == NULL) {  //  No more commands.
        tx_buf = NULL;
        tx_ptr = NULL;
        return -1; 
    }
    tx_buf = *cmd_ptr++;  //  Fetch first command.
    tx_ptr = tx_buf;
    memset(rx_buf, 0, sizeof(rx_buf));
    rx_ptr = rx_buf;
    //  Define the next_cmd callout to switch to next ESP8266 command.
    os_callout_init(&next_cmd_callout, os_eventq_dflt_get(), next_cmd, NULL);
    //  Define the UART callbacks.
    rc = hal_uart_init_cbs(MY_UART,
        uart_tx_char, uart_tx_done,
        uart_rx_char, NULL);
    if (rc != 0) { return rc; }
    //  Set UART parameters.
    rc = hal_uart_config(MY_UART,
        115200,
        8,
        1,
        HAL_UART_PARITY_NONE,
        HAL_UART_FLOW_CTL_NONE
    );
    if (rc != 0) { return rc; }
    //  Don't call console_printf() tx/rx or some UART data will be dropped.
    hal_uart_start_rx(MY_UART);  //  Start receiving UART data.
    hal_uart_start_tx(MY_UART);  //  Start transmitting UART data.
    return 0;
}

#ifdef NOTUSED
    static tx_bufuct sensor *my_sensor;

    #define MY_SENSOR_DEVICE "bme280_0"
    #define MY_SENSOR_POLL_TIME 2000
    #define LISTENER_CB 1
    #define READ_CB 2

    static int read_temperature(tx_bufuct sensor* sensor, void *arg, void *databuf, sensor_type_t type);

    static tx_bufuct sensor_listener listener = {
    .sl_sensor_type = SENSOR_TYPE_AMBIENT_TEMPERATURE,
    .sl_func = read_temperature,
    .sl_arg = (void *)LISTENER_CB,
    };

    static int
    read_temperature(tx_bufuct sensor* sensor, void *arg, void *databuf, sensor_type_t type) {
        tx_bufuct sensor_temp_data *temp;
        if (!databuf) { return SYS_EINVAL; }
        temp = (tx_bufuct sensor_temp_data *)databuf;
        if (!temp->std_temp_is_valid) { return SYS_EINVAL; }
        console_printf(
            "temp = %d.%d\n",
            (int) (temp->std_temp),
            (int) (10.0 * temp->std_temp) % 10
        );
        return 0;
    }
#endif //  NOTUSED

/**
 * Depending on the type of package, there are different
 * compilation rules for this directory.  This comment applies
 * to packages of type "app."  For other types of packages,
 * please view the documentation at http://mynewt.apache.org/.
 *
 * Put source files in this directory.  All files that have a *.c
 * ending are recursively compiled in the src/ directory and its
 * descendants.  The exception here is the arch/ directory, which
 * is ignored in the default compilation.
 *
 * The arch/<your-arch>/ directories are manually added and
 * recursively compiled for all files that end with either *.c
 * or *.a.  Any directories in arch/ that don't match the
 * architecture being compiled are not compiled.
 *
 * Architecture is set by the BSP/MCU combination.
 */



int
main(int argc, char **argv)
{
    int rc;    
#ifdef ARCH_sim
    mcu_sim_parse_args(argc, argv);  //  Perform some extra setup if we're running in the simulator.
#endif
    sysinit();  //  Initialize all packages.  Create the sensors.
    rc = setup_uart();  //  Starting transmitting and receiving to/from the UART port.
    assert(rc == 0);

#ifdef NOTUSED
    rc = sensor_set_poll_rate_ms(MY_SENSOR_DEVICE, MY_SENSOR_POLL_TIME);
    assert(rc == 0);

    my_sensor = sensor_mgr_find_next_bydevname(MY_SENSOR_DEVICE, NULL);
    assert(my_sensor != NULL);

    rc = sensor_register_listener(my_sensor, &listener);
    assert(rc == 0);
#endif  //  NOTUSED        

    while (1) {
        if (rx_buf[0]) {  //  If UART data has been received...
            console_printf("< %s\n", rx_buf);   //  Show the UART data.
            memset(rx_buf, 0, sizeof(rx_buf));  //  Empty the rx buffer.
            rx_ptr = rx_buf;
        }
        os_eventq_run(os_eventq_dflt_get());  //  Process events from default event queue.
    }
    return 0;  //  Never comes here.
}
