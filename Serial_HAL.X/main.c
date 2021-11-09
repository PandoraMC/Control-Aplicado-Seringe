/* 
 * File:   main.c
 * Author: Developer
 *
 * Created on 6 de noviembre de 2021, 02:23 PM
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include "Serial_HAL.h"

/*
 * 
 */
int main(void) {
    DDRD = 0x02;
    cli();
    InitSerial(USART0_BASE, 38400);
    USART0_BASE->UCSRnB.RXCIEn = 1;
    sei();
    while(1){
        sendString(USART0_BASE, (uint8_t *)"add 1,0,12\xFF\xFF\xFF");
    }
}

ISR(USART_RX_vect){
    static uint8_t data;
    getChar(USART0_BASE, &data);
    sendChar(USART0_BASE, data);
}