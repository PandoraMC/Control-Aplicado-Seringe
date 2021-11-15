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
    
#define TIMER0_BASE ((TIMER_t *)0x44)
#define TIMER2_BASE ((TIMER_t *)0xB0)
    
#define DISCONNECT_OUT  0b00
#define TOGGLE_OUT      0b01
#define CLEAR_OUT       0b10
#define SET_OUT         0b11
    
#define NORMAL_MODE   0b000
#define PWM_TOP_MODE  0b001
#define CTC_MODE      0b010
#define FPWM_TOP_MODE 0b011
#define PWM_OCR_MODE  0b101
#define FPWM_OCR      0b111
    
typedef enum{NC_0 = 0b000, N1_0, N8_0, N64_0, N256_0, N1024_0, FallT0, RiseT0}ClkTmr0_t;
typedef enum{NC_2 = 0b000, N1_2, N8_2, N32_2, N64_2, N128_2, N256_2, N1024_2}ClkTmr2_t;

typedef struct{
    uint8_t WGM     : 2;//Estructuras a nivel de bit
    uint8_t         : 2;//Permiten enmascaras de forma abstracta
    uint8_t COMB    : 2;
    uint8_t COMA    : 2;
}TCCR0A_t;

typedef struct{
    uint8_t CS      : 3;
    uint8_t WGM     : 1;
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
}TIMER_t;

void InitTimer(TIMER_t *timer, uint8_t TmrMode);
void TimerOutMode(TIMER_t *timer, uint8_t outSel,uint8_t outMode);
void TimerClockSource(TIMER_t *timer, uint8_t CS);

#ifdef	__cplusplus
}
#endif

#endif	/* TIMER_HAL_H */

