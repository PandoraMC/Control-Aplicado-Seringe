/* 
 * File:   Serial_HAL.h
 * Author: Developer
 *
 * Created on 6 de noviembre de 2021, 02:23 PM
 */

#ifndef SERIAL_HAL_H
#define	SERIAL_HAL_H

#define USART0_BASE ((USARTn_t *)0xC0)
#define ASYNC_MODE 0b00
#define SYNC_MODE  0b01
#define MSPI_MODE  0b11

#include<stdint.h>
/*
 * UDRn     0xC6
 * UBBRnH   0xC5
 * UBBRnL   0xC4
 * Reserved 0xC3
 * UCSRnC   0xC2
 * UCSRnB   0xC1
 * UCRRnA   0xC0
 */
typedef union{
    struct{
        uint8_t MPCMn   : 1;
        uint8_t U2Xn    : 1;
        uint8_t UPEn    : 1;
        uint8_t DORn    : 1;
        uint8_t FEn     : 1;
        uint8_t UDREn   : 1;
        uint8_t TXCn    : 1;
        uint8_t RXCn    : 1;
    };
    uint8_t value;
}UCSRnA_t;

typedef struct{
    uint8_t TXB8n  : 1;
    uint8_t RXB8n  : 1;
    uint8_t UCSZn2 : 1;
    uint8_t TXENn  : 1;
    uint8_t RXENn  : 1;
    uint8_t UDRIEn : 1;
    uint8_t TXCIEn : 1;
    uint8_t RXCIEn : 1;
}UCSRnB_t;

typedef struct{
    uint8_t UCPOLn : 1;
    uint8_t UCSZn  : 2;
    uint8_t USBSn  : 1;
    uint8_t UPMn   : 2;
    uint8_t UMSELn : 2;
}UCSRnC_t;

typedef struct{
    UCSRnA_t UCSRnA;
    UCSRnB_t UCSRnB;
    UCSRnC_t UCSRnC;
    uint8_t  :8;
    uint16_t UBRRn;
    uint8_t  UDRn;
}USARTn_t;

int8_t InitSerial(USARTn_t *usart, uint32_t baud);
uint8_t sendChar(USARTn_t *usart, uint8_t chr);
uint8_t getChar(USARTn_t *usart, uint8_t *chr);
void sendString(USARTn_t *usart, uint8_t *str);

#endif	/* SERIAL_HAL_H */

