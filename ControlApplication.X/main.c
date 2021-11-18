/* 
 * File:   main.c
 * Author: Xochiquetzal
 *
 * Created on 11 de noviembre de 2021, 09:01 AM
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include "../Serial_HAL.X/Serial_HAL.h"
#include "../Timer_HAL.X/Timer_HAL.h"
/*
 * 
 */

//#define TIMER_MODE

volatile uint8_t *PPS = 0;
volatile uint8_t *rt = 0;
// Codificación del Stream
// Control, r(t), y(t), !Control
// Data Visualizer
// Protocolo de comunicación
volatile uint8_t Stream[4];

//Van codificadas las ganancias [Kp, Ki, Kd](PID)
volatile float K[3] = {2.86, 9.43, 0.0};
volatile float q[3];
volatile float et[3] = {0, 0, 0};
volatile float ut[2] = {0, 0};
volatile float Ts = 100e-3;

void InitPeripheral(void);
void SendStream(USARTn_t *usart, volatile uint8_t *str, uint8_t N);

int main(void) {
    q[0] = (K[0] + K[1]*Ts + K[2]/Ts);
    q[1] = (-K[0] - 2*K[2]/Ts);
    q[2] = (K[2]/Ts);
    Stream[0] = 0x03;
    Stream[3] = 0xFC;
    rt = &Stream[1];
    PPS = &Stream[2];
    InitPeripheral();
    while(1){
    }
}

ISR(USART_RX_vect){
    getChar(USART0_BASE, (uint8_t*)rt);
    //TIMER2_BASE->OCRA = *rt;
#ifndef TIMER_MODE
    SendStream(USART0_BASE, (uint8_t*)Stream, 4);
#endif
}
// Periodo de Muestreo
ISR(TIMER1_COMPA_vect){
    PORTB |= 0x01;
    TimerClockSource(TIMER0_BASE, NC_0);
    *PPS = TIMER0_BASE->TNCT;
    TIMER0_BASE->TNCT = 0;
    TimerClockSource(TIMER0_BASE, RiseT0);
#ifdef TIMER_MODE
    SendStream(USART0_BASE, (uint8_t*)Stream, 4);
#endif
    // Promoción implicita -> Promo a entero
    // 10 - 20 el compilador piensa que trabaja con enteros.
    // char - int el compilador hace una promoción a entero.
    // La promoción consiste en llevar a las variables involucradas
    // al tamaño de memoria mayor.
    // Promoción de variable [explicito] typecasting
    et[0] = (float)(*rt) - *PPS;
    /*
    if(et > 0){
        ut = 255;
    }else{
        ut = 0;
    }*/
    //ut[0] = 5.375*et[0];
    ut[0] = ut[1] + q[0]*et[0] + q[1]*et[1] + q[2]*et[2];
    
    TIMER2_BASE->OCRA = (ut[0] > 255)? 255: (ut[0] < 0)? 0: (uint8_t)ut[0];
    // Corrimientos de datos en el tiempo
    et[2] = et[1];
    et[1] = et[0];
    ut[1] = ut[0];
    PORTB &= 0xFE;
}

void SendStream(USARTn_t *usart, volatile uint8_t *str, uint8_t N){
    uint8_t index = 0;
    while(index < N){
        if(sendChar(usart, str[index])){
            index++;
        }
    }
}

void InitPeripheral(void){
    cli();
    //Bare Metal
    DDRD = 0xC2;
    PORTD = 0xC0;
    DDRB = 0x0B;
    
    TCCR1A = 0x40;
    TCCR1B = 0x0B;
    TCNT1 = 0x0000;
    OCR1A = 24999;//100ms
    TIMSK1 = 0x02;//COMA
    
    //Hardware Abstraction Layer (HAL)
    InitSerial(USART0_BASE, 38400);
    SerialInterrupt(USART0_BASE, 0, 1);
    
    InitTimer(TIMER0_BASE, NORMAL_MODE);
    TimerClockSource(TIMER0_BASE, RiseT0);
    
    InitTimer(TIMER2_BASE, FPWM_TOP_MODE);
    TimerOutMode(TIMER2_BASE, 'A', CLEAR_OUT);
    TimerClockSource(TIMER2_BASE, N1_2);
    
    sei();
}