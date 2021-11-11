#include "Timer_HAL.h"
#include<stdint.h>

void InitTimer(TIMER_t *timer, uint8_t TmrMode){
    //timer->TCCRA.COM0A = outMode;
    timer->TCCRA.WGM = TmrMode;
    timer->TCCRB.WGM = TmrMode >> 2;
}

void TimerOutMode(TIMER_t *timer, uint8_t outSel, uint8_t outMode){
    if('A' == outSel){
        timer->TCCRA.COMA = outMode;
    }else if('B' == outSel){
        timer->TCCRA.COMB = outMode;
    }
}

void TimerClockSource(TIMER_t *timer, uint8_t CS){
    timer->TCCRB.CS = CS;
}