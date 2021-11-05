/* 
 * File:   main.c
 * Author: Developer
 *
 * Created on 5 de noviembre de 2021, 11:58 AM
 */

#include <avr/io.h>
#include <avr/interrupt.h>

uint8_t x = 0;

int main(void) {
    cli();
    // Configurar monitor
    DDRB = 0x0F;
    /*
    // Configurar el temporizador
    //   7654 3210
    // 0b1010 0000
    DDRD = 0xA0;
    TCCR0A = 0x00;
    TCCR0B = 0x07;
      */
    
    // Configurar para Clear Timer on Compare
    // SysTick
    DDRD = 0xF0;
    TCCR0A = 0x42;
    TCCR0B = 0x01;
    OCR0A = 255;
    TIMSK0 = 0x01;
    sei();
    // Core Independent Peripheral
    while(1){
        //PORTB = TCNT0;
    }
}
// Ocurrencia periodica
// Se hace el proceso de actualización de la variable de control
// u(k)
ISR(TIMER0_OVF_vect){
    x ++;
    PORTB = x;
}
// Capa de abstracción de hardware