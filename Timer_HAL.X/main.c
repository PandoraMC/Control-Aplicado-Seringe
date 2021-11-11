#include<avr/io.h>
#include<avr/interrupt.h>
#include "Timer_HAL.h"

int main(void) {
    TIMER_t *miTemporizador = TIMER0_BASE;
    InitTimer(miTemporizador, NORMAL_MODE);
    TimerClockSource(miTemporizador, RiseT0);
    
    InitTimer(TIMER2_BASE, PWM_TOP_MODE);
    TimerOutMode(TIMER2_BASE, 'A', SET_OUT);
    TimerClockSource(TIMER2_BASE, N12);
    
    while(1){
        
    }
}

