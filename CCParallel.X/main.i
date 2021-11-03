# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"


# 1 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\lib\\gcc\\avr\\5.4.0\\include\\stdint.h" 1 3 4
# 9 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\lib\\gcc\\avr\\5.4.0\\include\\stdint.h" 3 4
# 1 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\avr\\include\\stdint.h" 1 3 4
# 125 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\avr\\include\\stdint.h" 3 4

# 125 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\avr\\include\\stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 146 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\avr\\include\\stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 163 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\avr\\include\\stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 217 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\avr\\include\\stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 277 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\avr\\include\\stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "c:\\program files (x86)\\microchip\\avr8-gnu-toolchain-win32_x86\\lib\\gcc\\avr\\5.4.0\\include\\stdint.h" 2 3 4
# 4 "main.c" 2


# 5 "main.c"
int main(void){


    *((volatile uint8_t*)0x24) = 0x0F;


    while(1){
        for(int i = 15; i >= 0; i--){




            *((volatile uint8_t*)0x25) = i;
        }
    }
    return 0;
}
