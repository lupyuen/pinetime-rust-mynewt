/**
 * @file nRF24L01P.cpp
 *
 * @author Owen Edwards
 * 
 * @section LICENSE
 *
 * Copyright (c) 2010 Owen Edwards
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * @section DESCRIPTION
 *
 * nRF24L01+ Single Chip 2.4GHz Transceiver from Nordic Semiconductor.
 *
 * Datasheet:
 *
 * http://www.nordicsemi.no/files/Product/data_sheet/nRF24L01P_Product_Specification_1_0.pdf
 */

/**
 * Includes
 */
#include "nRF24L01P.h"

/**
 * Defines
 *
 * (Note that all defines here start with an underscore, e.g. '_NRF24L01P_MODE_UNKNOWN',
 *  and are local to this library.  The defines in the nRF24L01P.h file do not start
 *  with the underscore, and can be used by code to access this library.)
 */

typedef enum {
    _NRF24L01P_MODE_UNKNOWN,
    _NRF24L01P_MODE_POWER_DOWN,
    _NRF24L01P_MODE_STANDBY,
    _NRF24L01P_MODE_RX,
    _NRF24L01P_MODE_TX,
} nRF24L01P_Mode_Type;

/*
 * The following FIFOs are present in nRF24L01+:
 *   TX three level, 32 byte FIFO
 *   RX three level, 32 byte FIFO
 */
#define _NRF24L01P_TX_FIFO_COUNT   3
#define _NRF24L01P_RX_FIFO_COUNT   3

#define _NRF24L01P_TX_FIFO_SIZE   32
#define _NRF24L01P_RX_FIFO_SIZE   32

#define _NRF24L01P_SPI_MAX_DATA_RATE     10000000

#define _NRF24L01P_SPI_CMD_RD_REG            0x00
#define _NRF24L01P_SPI_CMD_WR_REG            0x20
#define _NRF24L01P_SPI_CMD_RD_RX_PAYLOAD     0x61   
#define _NRF24L01P_SPI_CMD_WR_TX_PAYLOAD     0xa0
#define _NRF24L01P_SPI_CMD_FLUSH_TX          0xe1
#define _NRF24L01P_SPI_CMD_FLUSH_RX          0xe2
#define _NRF24L01P_SPI_CMD_REUSE_TX_PL       0xe3
#define _NRF24L01P_SPI_CMD_R_RX_PL_WID       0x60
#define _NRF24L01P_SPI_CMD_W_ACK_PAYLOAD     0xa8
#define _NRF24L01P_SPI_CMD_W_TX_PYLD_NO_ACK  0xb0
#define _NRF24L01P_SPI_CMD_NOP               0xff


#define _NRF24L01P_REG_CONFIG                0x00
#define _NRF24L01P_REG_EN_AA                 0x01
#define _NRF24L01P_REG_EN_RXADDR             0x02
#define _NRF24L01P_REG_SETUP_AW              0x03
#define _NRF24L01P_REG_SETUP_RETR            0x04
#define _NRF24L01P_REG_RF_CH                 0x05
#define _NRF24L01P_REG_RF_SETUP              0x06
#define _NRF24L01P_REG_STATUS                0x07
#define _NRF24L01P_REG_OBSERVE_TX            0x08
#define _NRF24L01P_REG_RPD                   0x09
#define _NRF24L01P_REG_RX_ADDR_P0            0x0a
#define _NRF24L01P_REG_RX_ADDR_P1            0x0b
#define _NRF24L01P_REG_RX_ADDR_P2            0x0c
#define _NRF24L01P_REG_RX_ADDR_P3            0x0d
#define _NRF24L01P_REG_RX_ADDR_P4            0x0e
#define _NRF24L01P_REG_RX_ADDR_P5            0x0f
#define _NRF24L01P_REG_TX_ADDR               0x10
#define _NRF24L01P_REG_RX_PW_P0              0x11
#define _NRF24L01P_REG_RX_PW_P1              0x12
#define _NRF24L01P_REG_RX_PW_P2              0x13
#define _NRF24L01P_REG_RX_PW_P3              0x14
#define _NRF24L01P_REG_RX_PW_P4              0x15
#define _NRF24L01P_REG_RX_PW_P5              0x16
#define _NRF24L01P_REG_FIFO_STATUS           0x17
#define _NRF24L01P_REG_DYNPD                 0x1c
#define _NRF24L01P_REG_FEATURE               0x1d

#define _NRF24L01P_REG_ADDRESS_MASK          0x1f

// CONFIG register:
#define _NRF24L01P_CONFIG_PRIM_RX        (1<<0)
#define _NRF24L01P_CONFIG_PWR_UP         (1<<1)
#define _NRF24L01P_CONFIG_CRC0           (1<<2)
#define _NRF24L01P_CONFIG_EN_CRC         (1<<3)
#define _NRF24L01P_CONFIG_MASK_MAX_RT    (1<<4)
#define _NRF24L01P_CONFIG_MASK_TX_DS     (1<<5)
#define _NRF24L01P_CONFIG_MASK_RX_DR     (1<<6)

#define _NRF24L01P_CONFIG_CRC_MASK       (_NRF24L01P_CONFIG_EN_CRC|_NRF24L01P_CONFIG_CRC0)
#define _NRF24L01P_CONFIG_CRC_NONE       (0)
#define _NRF24L01P_CONFIG_CRC_8BIT       (_NRF24L01P_CONFIG_EN_CRC)
#define _NRF24L01P_CONFIG_CRC_16BIT      (_NRF24L01P_CONFIG_EN_CRC|_NRF24L01P_CONFIG_CRC0)

// EN_AA register:
#define _NRF24L01P_EN_AA_NONE            0

// EN_RXADDR register:
#define _NRF24L01P_EN_RXADDR_NONE        0

// SETUP_AW register:
#define _NRF24L01P_SETUP_AW_AW_MASK      (0x3<<0)
#define _NRF24L01P_SETUP_AW_AW_3BYTE     (0x1<<0)
#define _NRF24L01P_SETUP_AW_AW_4BYTE     (0x2<<0)
#define _NRF24L01P_SETUP_AW_AW_5BYTE     (0x3<<0)

// SETUP_RETR register:
#define _NRF24L01P_SETUP_RETR_NONE       0

// RF_SETUP register:
#define _NRF24L01P_RF_SETUP_RF_PWR_MASK          (0x3<<1)
#define _NRF24L01P_RF_SETUP_RF_PWR_0DBM          (0x3<<1)
#define _NRF24L01P_RF_SETUP_RF_PWR_MINUS_6DBM    (0x2<<1)
#define _NRF24L01P_RF_SETUP_RF_PWR_MINUS_12DBM   (0x1<<1)
#define _NRF24L01P_RF_SETUP_RF_PWR_MINUS_18DBM   (0x0<<1)

#define _NRF24L01P_RF_SETUP_RF_DR_HIGH_BIT       (1 << 3)
#define _NRF24L01P_RF_SETUP_RF_DR_LOW_BIT        (1 << 5)
#define _NRF24L01P_RF_SETUP_RF_DR_MASK           (_NRF24L01P_RF_SETUP_RF_DR_LOW_BIT|_NRF24L01P_RF_SETUP_RF_DR_HIGH_BIT)
#define _NRF24L01P_RF_SETUP_RF_DR_250KBPS        (_NRF24L01P_RF_SETUP_RF_DR_LOW_BIT)
#define _NRF24L01P_RF_SETUP_RF_DR_1MBPS          (0)
#define _NRF24L01P_RF_SETUP_RF_DR_2MBPS          (_NRF24L01P_RF_SETUP_RF_DR_HIGH_BIT)

// STATUS register:
#define _NRF24L01P_STATUS_TX_FULL        (1<<0)
#define _NRF24L01P_STATUS_RX_P_NO        (0x7<<1)
#define _NRF24L01P_STATUS_MAX_RT         (1<<4)
#define _NRF24L01P_STATUS_TX_DS          (1<<5)
#define _NRF24L01P_STATUS_RX_DR          (1<<6)

// RX_PW_P0..RX_PW_P5 registers:
#define _NRF24L01P_RX_PW_Px_MASK         0x3F

#define _NRF24L01P_TIMING_Tundef2pd_us     100000   // 100mS
#define _NRF24L01P_TIMING_Tstby2a_us          130   // 130uS
#define _NRF24L01P_TIMING_Thce_us              10   //  10uS
#define _NRF24L01P_TIMING_Tpd2stby_us        4500   // 4.5mS worst case
#define _NRF24L01P_TIMING_Tpece2csn_us          4   //   4uS

/**
 * Methods
 */

nRF24L01P::nRF24L01P(PinName mosi, 
                     PinName miso, 
                     PinName sck, 
                     PinName csn,
                     PinName ce,
                     PinName irq) : spi_(mosi, miso, sck), nCS_(csn), ce_(ce), nIRQ_(irq) {

    mode = _NRF24L01P_MODE_UNKNOWN;

    disable();

    nCS_ = 1;

    spi_.frequency(_NRF24L01P_SPI_MAX_DATA_RATE/5);     // 2Mbit, 1/5th the maximum transfer rate for the SPI bus
    spi_.format(8,0);                                   // 8-bit, ClockPhase = 0, ClockPolarity = 0

    wait_us(_NRF24L01P_TIMING_Tundef2pd_us);    // Wait for Power-on reset

    setRegister(_NRF24L01P_REG_CONFIG, 0); // Power Down

    setRegister(_NRF24L01P_REG_STATUS, _NRF24L01P_STATUS_MAX_RT|_NRF24L01P_STATUS_TX_DS|_NRF24L01P_STATUS_RX_DR);   // Clear any pending interrupts

    //
    // Setup default configuration
    //
    disableAllRxPipes();
    setRfFrequency();
    setRfOutputPower();
    setAirDataRate();
    setCrcWidth();
    setTxAddress();
    setRxAddress();
    disableAutoAcknowledge();
    disableAutoRetransmit();
    setTransferSize();

    mode = _NRF24L01P_MODE_POWER_DOWN;

}


void nRF24L01P::powerUp(void) {

    int config = getRegister(_NRF24L01P_REG_CONFIG);

    config |= _NRF24L01P_CONFIG_PWR_UP;

    setRegister(_NRF24L01P_REG_CONFIG, config);

    // Wait until the nRF24L01+ powers up
    wait_us( _NRF24L01P_TIMING_Tpd2stby_us );

    mode = _NRF24L01P_MODE_STANDBY;

}


void nRF24L01P::powerDown(void) {

    int config = getRegister(_NRF24L01P_REG_CONFIG);

    config &= ~_NRF24L01P_CONFIG_PWR_UP;

    setRegister(_NRF24L01P_REG_CONFIG, config);

    // Wait until the nRF24L01+ powers down
    wait_us( _NRF24L01P_TIMING_Tpd2stby_us );    // This *may* not be necessary (no timing is shown in the Datasheet), but just to be safe

    mode = _NRF24L01P_MODE_POWER_DOWN;

}


void nRF24L01P::setReceiveMode(void) {

    if ( _NRF24L01P_MODE_POWER_DOWN == mode ) powerUp();

    int config = getRegister(_NRF24L01P_REG_CONFIG);

    config |= _NRF24L01P_CONFIG_PRIM_RX;

    setRegister(_NRF24L01P_REG_CONFIG, config);

    mode = _NRF24L01P_MODE_RX;

}


void nRF24L01P::setTransmitMode(void) {

    if ( _NRF24L01P_MODE_POWER_DOWN == mode ) powerUp();

    int config = getRegister(_NRF24L01P_REG_CONFIG);

    config &= ~_NRF24L01P_CONFIG_PRIM_RX;

    setRegister(_NRF24L01P_REG_CONFIG, config);

    mode = _NRF24L01P_MODE_TX;

}


void nRF24L01P::enable(void) {

    ce_ = 1;
    wait_us( _NRF24L01P_TIMING_Tpece2csn_us );

}


void nRF24L01P::disable(void) {

    ce_ = 0;

}

void nRF24L01P::setRfFrequency(int frequency) {

    if ( ( frequency < NRF24L01P_MIN_RF_FREQUENCY ) || ( frequency > NRF24L01P_MAX_RF_FREQUENCY ) ) {

        error( "nRF24L01P: Invalid RF Frequency setting %d\r\n", frequency );
        return;

    }

    int channel = ( frequency - NRF24L01P_MIN_RF_FREQUENCY ) & 0x7F;

    setRegister(_NRF24L01P_REG_RF_CH, channel);

}


int nRF24L01P::getRfFrequency(void) {

    int channel = getRegister(_NRF24L01P_REG_RF_CH) & 0x7F;

    return ( channel + NRF24L01P_MIN_RF_FREQUENCY );

}


void nRF24L01P::setRfOutputPower(int power) {

    int rfSetup = getRegister(_NRF24L01P_REG_RF_SETUP) & ~_NRF24L01P_RF_SETUP_RF_PWR_MASK;

    switch ( power ) {

        case NRF24L01P_TX_PWR_ZERO_DB:
            rfSetup |= _NRF24L01P_RF_SETUP_RF_PWR_0DBM;
            break;

        case NRF24L01P_TX_PWR_MINUS_6_DB:
            rfSetup |= _NRF24L01P_RF_SETUP_RF_PWR_MINUS_6DBM;
            break;

        case NRF24L01P_TX_PWR_MINUS_12_DB:
            rfSetup |= _NRF24L01P_RF_SETUP_RF_PWR_MINUS_12DBM;
            break;

        case NRF24L01P_TX_PWR_MINUS_18_DB:
            rfSetup |= _NRF24L01P_RF_SETUP_RF_PWR_MINUS_18DBM;
            break;

        default:
            error( "nRF24L01P: Invalid RF Output Power setting %d\r\n", power );
            return;

    }

    setRegister(_NRF24L01P_REG_RF_SETUP, rfSetup);

}


int nRF24L01P::getRfOutputPower(void) {

    int rfPwr = getRegister(_NRF24L01P_REG_RF_SETUP) & _NRF24L01P_RF_SETUP_RF_PWR_MASK;

    switch ( rfPwr ) {

        case _NRF24L01P_RF_SETUP_RF_PWR_0DBM:
            return NRF24L01P_TX_PWR_ZERO_DB;

        case _NRF24L01P_RF_SETUP_RF_PWR_MINUS_6DBM:
            return NRF24L01P_TX_PWR_MINUS_6_DB;

        case _NRF24L01P_RF_SETUP_RF_PWR_MINUS_12DBM:
            return NRF24L01P_TX_PWR_MINUS_12_DB;

        case _NRF24L01P_RF_SETUP_RF_PWR_MINUS_18DBM:
            return NRF24L01P_TX_PWR_MINUS_18_DB;

        default:
            error( "nRF24L01P: Unknown RF Output Power value %d\r\n", rfPwr );
            return 0;

    }
}


void nRF24L01P::setAirDataRate(int rate) {

    int rfSetup = getRegister(_NRF24L01P_REG_RF_SETUP) & ~_NRF24L01P_RF_SETUP_RF_DR_MASK;

    switch ( rate ) {

        case NRF24L01P_DATARATE_250_KBPS:
            rfSetup |= _NRF24L01P_RF_SETUP_RF_DR_250KBPS;
            break;

        case NRF24L01P_DATARATE_1_MBPS:
            rfSetup |= _NRF24L01P_RF_SETUP_RF_DR_1MBPS;
            break;

        case NRF24L01P_DATARATE_2_MBPS:
            rfSetup |= _NRF24L01P_RF_SETUP_RF_DR_2MBPS;
            break;

        default:
            error( "nRF24L01P: Invalid Air Data Rate setting %d\r\n", rate );
            return;

    }

    setRegister(_NRF24L01P_REG_RF_SETUP, rfSetup);

}


int nRF24L01P::getAirDataRate(void) {

    int rfDataRate = getRegister(_NRF24L01P_REG_RF_SETUP) & _NRF24L01P_RF_SETUP_RF_DR_MASK;

    switch ( rfDataRate ) {

        case _NRF24L01P_RF_SETUP_RF_DR_250KBPS:
            return NRF24L01P_DATARATE_250_KBPS;

        case _NRF24L01P_RF_SETUP_RF_DR_1MBPS:
            return NRF24L01P_DATARATE_1_MBPS;

        case _NRF24L01P_RF_SETUP_RF_DR_2MBPS:
            return NRF24L01P_DATARATE_2_MBPS;

        default:
            error( "nRF24L01P: Unknown Air Data Rate value %d\r\n", rfDataRate );
            return 0;

    }
}


void nRF24L01P::setCrcWidth(int width) {

    int config = getRegister(_NRF24L01P_REG_CONFIG) & ~_NRF24L01P_CONFIG_CRC_MASK;

    switch ( width ) {

        case NRF24L01P_CRC_NONE:
            config |= _NRF24L01P_CONFIG_CRC_NONE;
            break;

        case NRF24L01P_CRC_8_BIT:
            config |= _NRF24L01P_CONFIG_CRC_8BIT;
            break;

        case NRF24L01P_CRC_16_BIT:
            config |= _NRF24L01P_CONFIG_CRC_16BIT;
            break;

        default:
            error( "nRF24L01P: Invalid CRC Width setting %d\r\n", width );
            return;

    }

    setRegister(_NRF24L01P_REG_CONFIG, config);

}


int nRF24L01P::getCrcWidth(void) {

    int crcWidth = getRegister(_NRF24L01P_REG_CONFIG) & _NRF24L01P_CONFIG_CRC_MASK;

    switch ( crcWidth ) {

        case _NRF24L01P_CONFIG_CRC_NONE:
            return NRF24L01P_CRC_NONE;

        case _NRF24L01P_CONFIG_CRC_8BIT:
            return NRF24L01P_CRC_8_BIT;

        case _NRF24L01P_CONFIG_CRC_16BIT:
            return NRF24L01P_CRC_16_BIT;

        default:
            error( "nRF24L01P: Unknown CRC Width value %d\r\n", crcWidth );
            return 0;

    }
}


void nRF24L01P::setTransferSize(int size, int pipe) {

    if ( ( pipe < NRF24L01P_PIPE_P0 ) || ( pipe > NRF24L01P_PIPE_P5 ) ) {

        error( "nRF24L01P: Invalid Transfer Size pipe number %d\r\n", pipe );
        return;

    }

    if ( ( size < 0 ) || ( size > _NRF24L01P_RX_FIFO_SIZE ) ) {

        error( "nRF24L01P: Invalid Transfer Size setting %d\r\n", size );
        return;

    }

    int rxPwPxRegister = _NRF24L01P_REG_RX_PW_P0 + ( pipe - NRF24L01P_PIPE_P0 );

    setRegister(rxPwPxRegister, ( size & _NRF24L01P_RX_PW_Px_MASK ) );

}


int nRF24L01P::getTransferSize(int pipe) {

    if ( ( pipe < NRF24L01P_PIPE_P0 ) || ( pipe > NRF24L01P_PIPE_P5 ) ) {

        error( "nRF24L01P: Invalid Transfer Size pipe number %d\r\n", pipe );
        return 0;

    }

    int rxPwPxRegister = _NRF24L01P_REG_RX_PW_P0 + ( pipe - NRF24L01P_PIPE_P0 );

    int size = getRegister(rxPwPxRegister);
    
    return ( size & _NRF24L01P_RX_PW_Px_MASK );

}


void nRF24L01P::disableAllRxPipes(void) {

    setRegister(_NRF24L01P_REG_EN_RXADDR, _NRF24L01P_EN_RXADDR_NONE);

}


void nRF24L01P::disableAutoAcknowledge(void) {

    setRegister(_NRF24L01P_REG_EN_AA, _NRF24L01P_EN_AA_NONE);

}


void nRF24L01P::enableAutoAcknowledge(int pipe) {

    if ( ( pipe < NRF24L01P_PIPE_P0 ) || ( pipe > NRF24L01P_PIPE_P5 ) ) {

        error( "nRF24L01P: Invalid Enable AutoAcknowledge pipe number %d\r\n", pipe );
        return;

    }

    int enAA = getRegister(_NRF24L01P_REG_EN_AA);

    enAA |= ( 1 << (pipe - NRF24L01P_PIPE_P0) );

    setRegister(_NRF24L01P_REG_EN_AA, enAA);

}


void nRF24L01P::disableAutoRetransmit(void) {

    setRegister(_NRF24L01P_REG_SETUP_RETR, _NRF24L01P_SETUP_RETR_NONE);

}

void nRF24L01P::setRxAddress(unsigned long long address, int width, int pipe) {

    if ( ( pipe < NRF24L01P_PIPE_P0 ) || ( pipe > NRF24L01P_PIPE_P5 ) ) {

        error( "nRF24L01P: Invalid setRxAddress pipe number %d\r\n", pipe );
        return;

    }

    if ( ( pipe == NRF24L01P_PIPE_P0 ) || ( pipe == NRF24L01P_PIPE_P1 ) ) {

        int setupAw = getRegister(_NRF24L01P_REG_SETUP_AW) & ~_NRF24L01P_SETUP_AW_AW_MASK;
    
        switch ( width ) {
    
            case 3:
                setupAw |= _NRF24L01P_SETUP_AW_AW_3BYTE;
                break;
    
            case 4:
                setupAw |= _NRF24L01P_SETUP_AW_AW_4BYTE;
                break;
    
            case 5:
                setupAw |= _NRF24L01P_SETUP_AW_AW_5BYTE;
                break;
    
            default:
                error( "nRF24L01P: Invalid setRxAddress width setting %d\r\n", width );
                return;
    
        }
    
        setRegister(_NRF24L01P_REG_SETUP_AW, setupAw);

    } else {
    
        width = 1;
    
    }

    int rxAddrPxRegister = _NRF24L01P_REG_RX_ADDR_P0 + ( pipe - NRF24L01P_PIPE_P0 );

    int cn = (_NRF24L01P_SPI_CMD_WR_REG | (rxAddrPxRegister & _NRF24L01P_REG_ADDRESS_MASK));

    nCS_ = 0;

    int status = spi_.write(cn);

    while ( width-- > 0 ) {

        //
        // LSByte first
        //
        spi_.write((int) (address & 0xFF));
        address >>= 8;

    }

    nCS_ = 1;

    int enRxAddr = getRegister(_NRF24L01P_REG_EN_RXADDR);

    enRxAddr |= (1 << ( pipe - NRF24L01P_PIPE_P0 ) );

    setRegister(_NRF24L01P_REG_EN_RXADDR, enRxAddr);
}

/*
 * This version of setRxAddress is just a wrapper for the version that takes 'long long's,
 *  in case the main code doesn't want to deal with long long's.
 */
void nRF24L01P::setRxAddress(unsigned long msb_address, unsigned long lsb_address, int width, int pipe) {

    unsigned long long address = ( ( (unsigned long long) msb_address ) << 32 ) | ( ( (unsigned long long) lsb_address ) << 0 );

    setRxAddress(address, width, pipe);

}


/*
 * This version of setTxAddress is just a wrapper for the version that takes 'long long's,
 *  in case the main code doesn't want to deal with long long's.
 */
void nRF24L01P::setTxAddress(unsigned long msb_address, unsigned long lsb_address, int width) {

    unsigned long long address = ( ( (unsigned long long) msb_address ) << 32 ) | ( ( (unsigned long long) lsb_address ) << 0 );

    setTxAddress(address, width);

}


void nRF24L01P::setTxAddress(unsigned long long address, int width) {

    int setupAw = getRegister(_NRF24L01P_REG_SETUP_AW) & ~_NRF24L01P_SETUP_AW_AW_MASK;

    switch ( width ) {

        case 3:
            setupAw |= _NRF24L01P_SETUP_AW_AW_3BYTE;
            break;

        case 4:
            setupAw |= _NRF24L01P_SETUP_AW_AW_4BYTE;
            break;

        case 5:
            setupAw |= _NRF24L01P_SETUP_AW_AW_5BYTE;
            break;

        default:
            error( "nRF24L01P: Invalid setTxAddress width setting %d\r\n", width );
            return;

    }

    setRegister(_NRF24L01P_REG_SETUP_AW, setupAw);

    int cn = (_NRF24L01P_SPI_CMD_WR_REG | (_NRF24L01P_REG_TX_ADDR & _NRF24L01P_REG_ADDRESS_MASK));

    nCS_ = 0;

    int status = spi_.write(cn);

    while ( width-- > 0 ) {

        //
        // LSByte first
        //
        spi_.write((int) (address & 0xFF));
        address >>= 8;

    }

    nCS_ = 1;

}


unsigned long long nRF24L01P::getRxAddress(int pipe) {

    if ( ( pipe < NRF24L01P_PIPE_P0 ) || ( pipe > NRF24L01P_PIPE_P5 ) ) {

        error( "nRF24L01P: Invalid setRxAddress pipe number %d\r\n", pipe );
        return 0;

    }

    int width;

    if ( ( pipe == NRF24L01P_PIPE_P0 ) || ( pipe == NRF24L01P_PIPE_P1 ) ) {

        int setupAw = getRegister(_NRF24L01P_REG_SETUP_AW) & _NRF24L01P_SETUP_AW_AW_MASK;

        switch ( setupAw ) {

            case _NRF24L01P_SETUP_AW_AW_3BYTE:
                width = 3;
                break;

            case _NRF24L01P_SETUP_AW_AW_4BYTE:
                width = 4;
                break;

            case _NRF24L01P_SETUP_AW_AW_5BYTE:
                width = 5;
                break;

            default:
                error( "nRF24L01P: Unknown getRxAddress width value %d\r\n", setupAw );
                return 0;

        }

    } else {

        width = 1;

    }

    int rxAddrPxRegister = _NRF24L01P_REG_RX_ADDR_P0 + ( pipe - NRF24L01P_PIPE_P0 );

    int cn = (_NRF24L01P_SPI_CMD_RD_REG | (rxAddrPxRegister & _NRF24L01P_REG_ADDRESS_MASK));

    unsigned long long address = 0;

    nCS_ = 0;

    int status = spi_.write(cn);

    for ( int i=0; i<width; i++ ) {

        //
        // LSByte first
        //
        address |= ( ( (unsigned long long)( spi_.write(_NRF24L01P_SPI_CMD_NOP) & 0xFF ) ) << (i*8) );

    }

    nCS_ = 1;

    if ( !( ( pipe == NRF24L01P_PIPE_P0 ) || ( pipe == NRF24L01P_PIPE_P1 ) ) ) {

        address |= ( getRxAddress(NRF24L01P_PIPE_P1) & ~((unsigned long long) 0xFF) );

    }

    return address;

}

    
unsigned long long nRF24L01P::getTxAddress(void) {

    int setupAw = getRegister(_NRF24L01P_REG_SETUP_AW) & _NRF24L01P_SETUP_AW_AW_MASK;

    int width;

    switch ( setupAw ) {

        case _NRF24L01P_SETUP_AW_AW_3BYTE:
            width = 3;
            break;

        case _NRF24L01P_SETUP_AW_AW_4BYTE:
            width = 4;
            break;

        case _NRF24L01P_SETUP_AW_AW_5BYTE:
            width = 5;
            break;

        default:
            error( "nRF24L01P: Unknown getTxAddress width value %d\r\n", setupAw );
            return 0;

    }

    int cn = (_NRF24L01P_SPI_CMD_RD_REG | (_NRF24L01P_REG_TX_ADDR & _NRF24L01P_REG_ADDRESS_MASK));

    unsigned long long address = 0;

    nCS_ = 0;

    int status = spi_.write(cn);

    for ( int i=0; i<width; i++ ) {

        //
        // LSByte first
        //
        address |= ( ( (unsigned long long)( spi_.write(_NRF24L01P_SPI_CMD_NOP) & 0xFF ) ) << (i*8) );

    }

    nCS_ = 1;

    return address;
}


bool nRF24L01P::readable(int pipe) {

    if ( ( pipe < NRF24L01P_PIPE_P0 ) || ( pipe > NRF24L01P_PIPE_P5 ) ) {

        error( "nRF24L01P: Invalid readable pipe number %d\r\n", pipe );
        return false;

    }

    int status = getStatusRegister();

    return ( ( status & _NRF24L01P_STATUS_RX_DR ) && ( ( ( status & _NRF24L01P_STATUS_RX_P_NO ) >> 1 ) == ( pipe & 0x7 ) ) );

}


int nRF24L01P::write(int pipe, char *data, int count) {

    // Note: the pipe number is ignored in a Transmit / write

    //
    // Save the CE state
    //
    int originalCe = ce_;
    disable();

    if ( count <= 0 ) return 0;

    if ( count > _NRF24L01P_TX_FIFO_SIZE ) count = _NRF24L01P_TX_FIFO_SIZE;

    // Clear the Status bit
    setRegister(_NRF24L01P_REG_STATUS, _NRF24L01P_STATUS_TX_DS);
	
    nCS_ = 0;

    int status = spi_.write(_NRF24L01P_SPI_CMD_WR_TX_PAYLOAD);

    for ( int i = 0; i < count; i++ ) {

        spi_.write(*data++);

    }

    nCS_ = 1;

    int originalMode = mode;
    setTransmitMode();

    enable();
    wait_us(_NRF24L01P_TIMING_Thce_us);
    disable();

    while ( !( getStatusRegister() & _NRF24L01P_STATUS_TX_DS ) ) {

        // Wait for the transfer to complete

    }

    // Clear the Status bit
    setRegister(_NRF24L01P_REG_STATUS, _NRF24L01P_STATUS_TX_DS);

    if ( originalMode == _NRF24L01P_MODE_RX ) {

        setReceiveMode();

    }

    ce_ = originalCe;
    wait_us( _NRF24L01P_TIMING_Tpece2csn_us );

    return count;

}


int nRF24L01P::read(int pipe, char *data, int count) {

    if ( ( pipe < NRF24L01P_PIPE_P0 ) || ( pipe > NRF24L01P_PIPE_P5 ) ) {

        error( "nRF24L01P: Invalid read pipe number %d\r\n", pipe );
        return -1;

    }

    if ( count <= 0 ) return 0;

    if ( count > _NRF24L01P_RX_FIFO_SIZE ) count = _NRF24L01P_RX_FIFO_SIZE;

    if ( readable(pipe) ) {

        nCS_ = 0;

        int status = spi_.write(_NRF24L01P_SPI_CMD_R_RX_PL_WID);

        int rxPayloadWidth = spi_.write(_NRF24L01P_SPI_CMD_NOP);
        
        nCS_ = 1;

        if ( ( rxPayloadWidth < 0 ) || ( rxPayloadWidth > _NRF24L01P_RX_FIFO_SIZE ) ) {
    
            // Received payload error: need to flush the FIFO

            nCS_ = 0;
    
            int status = spi_.write(_NRF24L01P_SPI_CMD_FLUSH_RX);
    
            int rxPayloadWidth = spi_.write(_NRF24L01P_SPI_CMD_NOP);
            
            nCS_ = 1;
            
            //
            // At this point, we should retry the reception,
            //  but for now we'll just fall through...
            //

        } else {

            if ( rxPayloadWidth < count ) count = rxPayloadWidth;

            nCS_ = 0;
        
            int status = spi_.write(_NRF24L01P_SPI_CMD_RD_RX_PAYLOAD);
        
            for ( int i = 0; i < count; i++ ) {
        
                *data++ = spi_.write(_NRF24L01P_SPI_CMD_NOP);
        
            }

            nCS_ = 1;

            // Clear the Status bit
            setRegister(_NRF24L01P_REG_STATUS, _NRF24L01P_STATUS_RX_DR);

            return count;

        }

    } else {

        //
        // What should we do if there is no 'readable' data?
        //  We could wait for data to arrive, but for now, we'll
        //  just return with no data.
        //
        return 0;

    }

    //
    // We get here because an error condition occured;
    //  We could wait for data to arrive, but for now, we'll
    //  just return with no data.
    //
    return -1;

}

void nRF24L01P::setRegister(int regAddress, int regData) {

    //
    // Save the CE state
    //
    int originalCe = ce_;
    disable();

    int cn = (_NRF24L01P_SPI_CMD_WR_REG | (regAddress & _NRF24L01P_REG_ADDRESS_MASK));

    nCS_ = 0;

    int status = spi_.write(cn);

    spi_.write(regData & 0xFF);

    nCS_ = 1;

    ce_ = originalCe;
    wait_us( _NRF24L01P_TIMING_Tpece2csn_us );

}


int nRF24L01P::getRegister(int regAddress) {

    int cn = (_NRF24L01P_SPI_CMD_RD_REG | (regAddress & _NRF24L01P_REG_ADDRESS_MASK));

    nCS_ = 0;

    int status = spi_.write(cn);

    int dn = spi_.write(_NRF24L01P_SPI_CMD_NOP);

    nCS_ = 1;

    return dn;

}

int nRF24L01P::getStatusRegister(void) {

    nCS_ = 0;

    int status = spi_.write(_NRF24L01P_SPI_CMD_NOP);

    nCS_ = 1;

    return status;

}
