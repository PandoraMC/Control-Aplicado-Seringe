/* 
 * File:   Timer_HAL.h
 * Author: Developer
 *
 * Created on 8 de noviembre de 2021, 12:08 PM
 */

#ifndef TIMER_HAL_H
#define	TIMER_HAL_H

#ifdef	__cplusplus
extern "C" {
#endif

#include<stdint.h>
    
#define TIMER0_BASE ((TIMER0_t *)0x44)
    
#define TOGGLE_OUT 0b01
#define CLEAR_OUT  0b10
    
enum{NC = 0b000, N1, N8, N64, N256, N1024, FT, RT};

typedef struct{
    uint8_t WGM0    : 2;//Estructuras a nivel de bit
    uint8_t         : 2;//Permiten enmascaras de forma abstracta
    uint8_t COM0B   : 2;
    uint8_t COM0A   : 2;
}TCCR0A_t;

typedef struct{
    uint8_t CS      : 3;
    uint8_t WGM0    : 1;
    uint8_t         : 2;
    uint8_t FOCB    : 1;
    uint8_t FOCA    : 1;
}TCCR0B_t;

typedef struct{
    TCCR0A_t TCCRA;
    TCCR0B_t TCCRB;
    uint8_t  TNCT;
    uint8_t  OCRA;
    uint8_t  OCRB;
}TIMER0_t;

void InitTimer(TIMER0_t *timer, uint8_t outMode);

#ifdef	__cplusplus
}
#endif

#endif	/* TIMER_HAL_H */

