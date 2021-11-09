#include<avr/io.h>
#include<avr/interrupt.h>
#include "Timer_HAL.h"

int main(void) {
    volatile TIMER0_t *miTemporizador = TIMER0_BASE;
    //miTemporizador->TCCRA.COM0A = CLEAR_OUT;
    InitTimer(miTemporizador, CLEAR_OUT);
    miTemporizador->TCCRA.COM0B = TOGGLE_OUT;
    miTemporizador->TCCRB.CS = FT;
    miTemporizador->OCRA = 0x5A;
    miTemporizador->OCRB = 0xA5;
    while(1){
        
    }
}

