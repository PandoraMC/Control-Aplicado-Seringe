/* 
 * File:   Serial_HAL.c
 * Author: Developer
 *
 * Created on 6 de noviembre de 2021, 02:23 PM
 */

#include "Serial_HAL.h"
#include <avr/io.h>
#include <math.h>

#ifndef F_CPU
#define F_CPU 16000000
#warning "Define a F_CPU. default 16MHz"
#endif

float InitSerial(USARTn_t *usart, uint32_t baud){
    float volatile fUBRRn = (float)F_CPU/16.0/(float)baud - 1;
    float volatile fBaud;
    usart->UCSRnB.RXENn = 1;
    usart->UCSRnB.TXENn = 1;
    usart->UCSRnC.UMSELn = ASYNC_MODE;
    usart->UCSRnC.UPMn = P_NONE;
    usart->UCSRnC.UCSZn = 0b11;
    usart->UBRRn = (uint16_t)round(fUBRRn);
    fBaud = (float)F_CPU/16.0/(float)(usart->UBRRn + 1);
    return fBaud/baud - 1;
}

void SerialInterrupt(USARTn_t *usart, uint8_t TxActive, uint8_t RxActive){
    usart->UCSRnB.RXCIEn = RxActive;
    usart->UCSRnB.TXCIEn = TxActive;
}

uint8_t sendChar(USARTn_t *usart, uint8_t chr){
    uint8_t sendReady = usart->UCSRnA.UDREn;
    if(1U == sendReady){
        usart->UDRn = chr;
    }
    return sendReady;
}

uint8_t getChar(USARTn_t *usart, uint8_t *chr){
    uint8_t receiveReady = usart->UCSRnA.RXCn;
    if(1U == receiveReady){
        *chr = usart->UDRn;
    }
    return receiveReady;
}

void sendString(USARTn_t *usart, uint8_t *str){
    uint8_t *chrIndex = str;
    while(*(chrIndex) != '\0'){
        if(sendChar(usart, *chrIndex)){
            chrIndex++;
        }
    }
}