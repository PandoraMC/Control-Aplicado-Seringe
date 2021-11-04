#include<avr/io.h>
#include<avr/interrupt.h>

int main(void){
    cli();
    
    //uint8_t value;
    // Configurar los puertos de entrada/salida I/O
    DDRB = 0b00000011;
    //  7654 3210
    //2^
    // 
    //  IIII IIOO
    // 128 64 32 16 8 4     ||   2 1
    // El objetivo es alinear el valor
    // Offset 4
    
    PCICR = 1;
    PCMSK0 = 0b00001100;
    
    sei();
    while(1){
        //value = PINB;
        // Solo se necesitan los 4 bits más significativos
        //value = value >> 2;
        // 0xA5
        // 0b10100101
        // corrimiento 1
        // 0b01010010
        // corrimiento 2
        // 0b00101001
        // 0x29
        
        //while(1){}
        
        //PORTB = value;
    }
}
// Programación basada en EVENTOS
ISR(PCINT0_vect){
    static uint8_t value;
    value = PINB;
    value = value >> 2;
    PORTB = value | 0x04;
    //0000 1100
    //0000 0011
}