#include "Timer_HAL.h"
#include<stdint.h>

void InitTimer(TIMER0_t *timer, uint8_t outMode){
    timer->TCCRA.COM0A = outMode;
}