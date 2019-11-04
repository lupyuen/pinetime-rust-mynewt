/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
//  Based on repos/apache-mynewt-core/hw/mcu/stm/stm32_common/src/hal_uart.c
#include "hal/hal_uart.h"
#include "bsp/bsp.h"
#include "mcu/gd32vf103_hal.h"
#include <assert.h>

#define UART_CNT 2

struct hal_uart {
    uint8_t u_open:1;
    uint8_t u_rx_stall:1;
    uint8_t u_tx_started:1;
    uint8_t u_rx_buf;
    hal_uart_rx_char u_rx_func;
    hal_uart_tx_char u_tx_func;
    hal_uart_tx_done u_tx_done;
    void *u_func_arg;
    const struct gd32vf103_uart_cfg *u_cfg;
};
static struct hal_uart uarts[UART_CNT];

// static struct uart_dev hal_uart0;

//  UART Settings
struct gd32vf103_uart_cfg {
    enum rcu_periph_enum dev;      //  UART device e.g. USART0, USART1
    uint32_t irq;                  //  IRQ for the device e.g. USART0_IRQn
    enum rcu_periph_enum rcu_dev;  //  RCU for the device e.g. RCU_USART0
    enum rcu_periph_enum rcu_gpio; //  RCU for the GPIO e.g. RCU_GPIOA
    int8_t pin_tx;                 //  Pins for I/O, e.g. MCU_GPIO_PORTA(9)
    int8_t pin_rx;
    int8_t pin_rts;
    int8_t pin_cts;
};

static const struct gd32vf103_uart_cfg uart_cfg[UART_CNT] = {
    [0] = {
        .dev      = USART0,
        .irq      = USART0_IRQn,
        .rcu_dev  = RCU_USART0
        .rcu_gpio = RCU_GPIOA,
        .pin_tx   = MCU_GPIO_PORTA(9),
        .pin_rx   = MCU_GPIO_PORTA(10),
        .pin_rts  = -1,
        .pin_cts  = -1,
    },
    [1] = {
        .dev      = USART1,
        .irq      = USART1_IRQn,
        .rcu_dev  = RCU_USART1,
        .rcu_gpio = RCU_GPIOA,
        .pin_tx   = MCU_GPIO_PORTA(2),
        .pin_rx   = MCU_GPIO_PORTA(3),
        .pin_rts  = -1,
        .pin_cts  = -1,
    },
};

int
hal_uart_init_cbs(int port, hal_uart_tx_char tx_func, hal_uart_tx_done tx_done,
  hal_uart_rx_char rx_func, void *arg)
{
    struct hal_uart *u;

    if (port != 0) {
        return -1;
    }
    u = &uart;
    if (u->u_open) {
        return -1;
    }
    u->u_rx_func = rx_func;
    u->u_tx_func = tx_func;
    u->u_tx_done = tx_done;
    u->u_func_arg = arg;
    return 0;
}

static int
gd32vf103_hal_uart_tx_fill_fifo(struct hal_uart *u)
{
    int data = 0;

    while ((int32_t)(UART0_REG(UART_REG_TXFIFO)) >= 0) {
        data = u->u_tx_func(u->u_func_arg);
        if (data < 0) {
            if (u->u_tx_done) {
                u->u_tx_done(u->u_func_arg);
            }
            /* No more interrupts for TX */
            UART0_REG(UART_REG_IE) &= ~UART_IP_TXWM;
            u->u_tx_started = 0;
            break;
        } else {
            UART0_REG(UART_REG_TXFIFO) = data;
        }
    }
    return data;
}

void
hal_uart_start_tx(int port)
{
    struct hal_uart *u;
    int sr;
    int rc;

    if (port != 0) {
        return;
    }
    u = &uart;
    __HAL_DISABLE_INTERRUPTS(sr);
    if (u->u_tx_started == 0) {
        UART0_REG(UART_REG_TXCTRL) |= UART_TXEN;
        rc = gd32vf103_hal_uart_tx_fill_fifo(u);
        if (rc >= 0) {
            u->u_tx_started = 1;
            UART0_REG(UART_REG_IE) |= UART_IP_TXWM;
        }
    }
    __HAL_ENABLE_INTERRUPTS(sr);
}

void
hal_uart_start_rx(int port)
{
    struct hal_uart *u;
    int sr;
    int rc;

    if (port != 0) {
        return;
    }
    u = &uart;
    if (u->u_rx_stall) {
        __HAL_DISABLE_INTERRUPTS(sr);
        rc = u->u_rx_func(u->u_func_arg, u->u_rx_buf);
        if (rc == 0) {
            u->u_rx_stall = 0;
            UART0_REG(UART_REG_IE) |= UART_IP_RXWM;
        }

        __HAL_ENABLE_INTERRUPTS(sr);
    }
}

void
hal_uart_blocking_tx(int port, uint8_t data)
{
    struct hal_uart *u;

    if (port != 0) {
        return;
    }

    u = &uart;
    if (!u->u_open) {
        return;
    }

    UART0_REG(UART_REG_TXCTRL) |= UART_TXEN;
    while (UART0_REG(UART_REG_TXFIFO) < 0) {
    }
    UART0_REG(UART_REG_TXFIFO) = data;
}

static void
gd32vf103_uart_irq_handler(int num)
{
    struct hal_uart *u;
    int rc;
    int data;

    u = &uart;
    /* RX Path */
    while (1) {
        data = UART0_REG(UART_REG_RXFIFO);
        if (data < 0) {
            break;
        }
        rc = u->u_rx_func(u->u_func_arg, (uint8_t)data);
        if (rc < 0) {
            /* Don't rise RX interrupts till next hal_uart_start_rx */
            UART0_REG(UART_REG_IE) &= ~UART_IP_RXWM;
            u->u_rx_buf = (uint8_t)data;
            u->u_rx_stall = 1;
        }
    }

    /* TX Path */
    if (u->u_tx_started) {
        gd32vf103_hal_uart_tx_fill_fifo(u);
    }
}

int
hal_uart_init(int port, void *arg)
{
    // port=0 for USART0, 1 for USART1, ...
    struct hal_uart *u;
    if (port < 0 || port >= UART_CNT) {
        return -1;
    }
    u = &uarts[port];
    u->u_cfg = (const struct gd32vf103_uart_cfg *)arg;

    /* TODO: Install interrupt handler */
    plic_set_handler(INT_UART0_BASE, gd32vf103_uart_irq_handler, 3);

    return 0;
}

int
hal_uart_config(int port, int32_t baudrate, uint8_t databits, uint8_t stopbits,
  enum hal_uart_parity parity, enum hal_uart_flow_ctl flow_ctl)
{
    // port=0 for USART0, 1 for USART1, ...
    struct hal_uart *u;
    if (port < 0 || port >= UART_CNT) {
        return -1;
    }

    u = &uarts[port];
    if (u->u_open) {
        return -1;
    }
    cfg = u->u_cfg;
    assert(cfg);

    //  From Examples/USART/Transmitter&receiver_interrupt/main.c
    /* USART interrupt configuration */
    eclic_global_interrupt_enable();
    eclic_priority_group_set(ECLIC_PRIGROUP_LEVEL3_PRIO1);
    eclic_irq_enable(USART0_IRQn, 1, 0);
    /* configure UART */
    gd32vf103_uart_config(port, baudrate, databits, stopbits, parity, flow_ctl);
    /* enable USART TBE interrupt */  
    usart_interrupt_enable(USART0, USART_INT_TBE);

    //  Enable the interrupt
    plic_enable_interrupt(INT_UART0_BASE);

    u->u_rx_stall = 0;
    u->u_tx_started = 0;
    u->u_open = 1;
    u->u_baudrate = baudrate;

    return 0;
}

int
hal_uart_close(int port)
{
    struct hal_uart *u;

    u = &uart;

    if (port == 0) {
        u->u_open = 0;
        UART0_REG(UART_REG_TXCTRL) &= ~UART_TXEN;
        UART0_REG(UART_REG_RXCTRL) = 0;
        plic_disable_interrupt(INT_UART0_BASE);
        return 0;
    }
    return -1;
}

void
hal_uart_sys_clock_changed(void)
{
    struct hal_uart *u;

    u = &uart;

    if (u->u_open) {
        UART0_REG(UART_REG_DIV) = (get_cpu_freq() + (u->u_baudrate / 2)) / u->u_baudrate - 1;
    }
}

//  From Utilities/gd32vf103v_eval.c
void gd32vf103_uart_config(int port, int32_t baudrate, uint8_t databits, uint8_t stopbits,
  enum hal_uart_parity parity, enum hal_uart_flow_ctl flow_ctl) {
    // port=0 for USART0, 1 for USART1, ...
    assert(port >= 0 && port < UART_CNT);
    struct gd32vf103_uart_cfg *cfg = uart_cfg[port]; 

    /* enable GPIO clock */
    rcu_periph_clock_enable(cfg->rcu_gpio);

    /* enable USART clock */
    rcu_periph_clock_enable(cfg->rcu_dev);

    /* connect port to USARTx_Tx */
    //  Previously: gpio_init(COM_GPIO_PORT[port], GPIO_MODE_AF_PP, GPIO_OSPEED_50MHZ, COM_TX_PIN[port]);
    hal_gpio_init_out(cfg->pin_tx, 0);

    /* connect port to USARTx_Rx */
    //  Previously: gpio_init(COM_GPIO_PORT[port], GPIO_MODE_IN_FLOATING, GPIO_OSPEED_50MHZ, COM_RX_PIN[port]);
    hal_gpio_init_in(cfg->pin_rx, HAL_GPIO_PULL_NONE);

    /* USART configure */
    usart_deinit(port);
    usart_baudrate_set(port, baudrate);
    usart_word_length_set(port, 
        (databits == 8) : USART_WL_8BIT ?
        (databits == 9) : USART_WL_9BIT ?
        assert(0));  //  Invalid databits
    usart_stop_bit_set(port, 
        (stopbits == 1) : USART_STB_1BIT ?
        (stopbits == 2) : USART_STB_2BIT ?
        assert(0));  //  Invalid stopbits
    usart_parity_config(port, 
        (parity == HAL_UART_PARITY_NONE) : USART_PM_NONE ?
        (parity == HAL_UART_PARITY_ODD)  : USART_PM_ODD ?
        (parity == HAL_UART_PARITY_EVEN) : USART_PM_EVEN ?
        assert(0));  //  Invalid parity    
    
    usart_hardware_flow_rts_config(port, USART_RTS_DISABLE);
    usart_hardware_flow_cts_config(port, USART_CTS_DISABLE);
    usart_receive_config( port, USART_RECEIVE_ENABLE);
    usart_transmit_config(port, USART_TRANSMIT_ENABLE);
    usart_enable(port);
}
