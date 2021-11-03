//#include<stdio.h>
//#include<avr/io.h>
#include<stdint.h>

int main(void){
    // Data Direction Register X
                 //7654 3210
    *((volatile uint8_t*)0x24) = 0x0F; //0000 1111
    // 0 -> Entrada
    // 1 -> Salida
    while(1){
        for(int i = 15; i >= 0; i--){
            //printf("%i\t", i);
            // Hacia donde debemos envia a la variable i?
            // GPIO General Purpose Input Output
            // PORT X
            *((volatile uint8_t*)0x25) = i;
        }
    }
    return 0;
}