/* 
 * File:   Serial_HAL.h
 * Author: Developer
 *
 * Created on 6 de noviembre de 2021, 02:23 PM
 */

#ifndef SERIAL_HAL_H
#define	SERIAL_HAL_H

#define USART0_BASE ((USARTn_t *)0xC0)
#define USART1_BASE ((USARTn_t *)0xC8)
#define USART2_BASE ((USARTn_t *)0xD0)
#define USART3_BASE ((USARTn_t *)0x130)

#define ASYNC_MODE 0b00
#define SYNC_MODE  0b01
#define MSPI_MODE  0b11

#define P_NONE 0b00
#define P_EVEN 0b10
#define P_ODD  0b11

#include<stdint.h>
typedef struct{
    uint8_t MPCMn   : 1;
    uint8_t U2Xn    : 1;
    uint8_t UPEn    : 1;
    uint8_t DORn    : 1;
    uint8_t FEn     : 1;
    uint8_t UDREn   : 1;
    uint8_t TXCn    : 1;
    uint8_t RXCn    : 1;
}UCSRnA_t;

typedef struct{
    uint8_t TXB8n  : 1;
    uint8_t RXB8n  : 1;
    uint8_t UCSZn2 : 1;
    uint8_t TXENn  : 1;
    uint8_t RXENn  : 1;
    uint8_t UDRIEn : 1;
    uint8_t TXCIEn : 1;
    uint8_t RXCIEn : 1;
}UCSRnB_t;

typedef struct{
    uint8_t UCPOLn : 1;
    uint8_t UCSZn  : 2;
    uint8_t USBSn  : 1;
    uint8_t UPMn   : 2;
    uint8_t UMSELn : 2;
}UCSRnC_t;

typedef struct{
    UCSRnA_t UCSRnA;
    UCSRnB_t UCSRnB;
    UCSRnC_t UCSRnC;
    uint8_t  :8;
    uint16_t UBRRn;
    uint8_t  UDRn;
}USARTn_t;
/**
 * Inicializa el puerto serie. Soporte actual para U2Xn = 1
 * @param usart Puntero al periférico USART
 * @param baud Velocidad en baudios
 * @return Error de velocidad
 */
float InitSerial(USARTn_t *usart, uint32_t baud);
/**
 * Activa las interrupciones de Transmisión y Recepción
 * @param usart Puntero al periférico USART
 * @param TxActive Activo en alto para la interrupción de transmisión completa
 * @param RxActive Activo en alto para la interrupción de recepción completa
 */
void SerialInterrupt(USARTn_t *usart, uint8_t TxActive, uint8_t RxActive);
/**
 * Envia un simbolo por el puerto serie
 * @param usart Puntero al periférico USART
 * @param chr Simbolo a enviar
 * @return Envío exitoso, El buffer estaba ocupado
 */
uint8_t sendChar(USARTn_t *usart, uint8_t chr);
/**
 * Almacena un simbolo recibido del puerto serie en la direccion de la variable
 * @param usart Puntero al periférico USART
 * @param chr Puntero a la variable de almacenamiento
 * @return Recepción extitosa, dato no recibido
 */
uint8_t getChar(USARTn_t *usart, uint8_t *chr);
/**
 * Envia una cadena de bytes por el puerto serie
 * @param usart Puntero al periférico USART
 * @param str Cadena a enviar
 */
void sendString(USARTn_t *usart, uint8_t *str);

#endif	/* SERIAL_HAL_H */

