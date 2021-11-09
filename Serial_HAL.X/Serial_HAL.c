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

int8_t InitSerial(USARTn_t *usart, uint32_t baud){
    usart->UCSRnB.RXENn = 1;
    usart->UCSRnB.TXENn = 1;
    usart->UCSRnC.UMSELn = 0b00;
    usart->UCSRnC.UPMn = 0b00;
    usart->UCSRnC.UCSZn = 0b11;
    usart->UBRRn = (uint16_t)round((float)F_CPU/16.0/(float)baud - 1);
    return 0;
}

uint8_t sendChar(USARTn_t *usart, uint8_t chr){
    uint8_t sendReady = usart->UCSRnA.UDREn;
    if(1 == sendReady){
        usart->UDRn = chr;
    }
    return sendReady;
}

uint8_t getChar(USARTn_t *usart, uint8_t *chr){
    uint8_t receiveReady = usart->UCSRnA.RXCn;
    if(1 == receiveReady){
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



/*
void USART_Transmit(uint8_t data){
    while (!(UCSR0A & (1<<UDRE0))){}
    UDR0 = data;
}

uint8_t USART_Receive(void){
    while (!(UCSR0A & (1<<RXC0))){}
    return UDR0;
}

void USART_SendString(char *str){
    char *chrIndex = str;
    while(*(chrIndex) != '\0'){
        USART_Transmit(*chrIndex);
        chrIndex++;
    }
}*/