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
const uint8_t Fuzzy0[15][15] = {
    {128,128,123,113,97,72,36,35,36,38,41,41,38,36,35},
    {128,128,123,113,97,72,36,36,36,38,41,41,38,36,36},
    {132,132,128,119,105,83,72,72,72,72,79,79,72,72,72},
    {142,142,136,128,116,105,97,97,97,97,97,97,97,97,97},
    {158,158,150,139,128,119,113,113,113,113,113,113,113,113,113},
    {183,183,172,150,136,128,123,123,123,123,122,122,123,123,123},
    {219,219,183,158,142,132,128,128,128,128,128,128,128,128,128},
    {220,219,183,158,142,132,128,128,128,128,128,128,128,128,128},
    {219,219,183,158,142,132,128,128,128,128,128,128,128,128,128},
    {217,217,183,158,142,132,132,132,132,132,133,133,132,128,128},
    {214,214,176,158,142,142,142,142,142,142,142,142,133,128,128},
    {214,214,176,158,158,158,158,158,158,158,158,142,133,128,128},
    {217,217,183,176,176,183,183,183,183,183,158,142,132,128,128},
    {219,219,217,214,214,217,219,219,219,183,158,142,132,128,128},
    {220,219,217,214,214,217,219,220,219,183,158,142,132,128,128}};

// LookUp Table
volatile uint8_t Fuzzy2[511] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,43,43,43,46,46,46,48,48,48,48,0,0,0,0,0,54,54,54,56,56,56,56,59,59,59,59,61,61,61,64,64,64,64,66,66,71,77,82,87,92,99,105,110,115,120,125,133,138,143,148,153,158,163,171,176,181,186,191,196,201,204,209,212,212,212,212,209,204,201,196,194,189,184,181,176,171,166,163,158,153,148,143,140,135,130,125,122,117,112,107,105,105,105,105,105,107,107,107,110,110,110,110,112,112,112,112,115,115,115,115,117,117,117,117,120,120,120,120,122,122,122,122,125,125,125,125,128,128,128,128,130,130,130,133,133,133,133,135,135,135,135,135,138,138,138,138,140,140,140,140,143,143,143,143,145,145,145,145,148,148,148,148,148,150,150,150,150,153,153,153,153,153,156,156,156,156,156,158,158,158,158,158,158,161,161,161,161,161,161,163,163,163,163,163,163,163,163,166,166,166,166,166,166,166,166,166,166,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,168,166,166,166,166,166,166,166,166,166,166,166,166,166,166,166,163,163,163,163,163,163,163,163
};
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

uint8_t state = 0;

ISR(USART_RX_vect){
    static uint8_t RxData;
    getChar(USART0_BASE, &RxData);
    if(state == 0 && RxData == 0x71){
        state = 1;
        // Asignar instrucciones
    }else if(state == 1){
        *rt = RxData;
        state = 0;
    }
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
    // Control basado en consulta
    //ut[0] = Fuzzy2[(uint16_t)(et[0] + 255.0)];
    //ut[0] = Fuzzy0[(uint16_t)(*rt/255*14)][(uint16_t)(et[0]/255*7+7)];
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