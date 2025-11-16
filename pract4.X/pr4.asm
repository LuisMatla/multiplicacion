;Practica 4. Multiplicacion.

__CONFIG _WDT_OFF&_PWRTE_ON&_XT_OSC&_LVP_OFF&_CP_OFF ;configura los fusibles del microcontrolador.
LIST P=16F877A                     ;especifica el microcontrolador a usar (PIC16F877A).
#include "P16F877A.INC"            ;incluye el archivo de definiciones del PIC16F877A.
TEMP EQU 0x20                      ;declara la variable temporal en la dirección 0x20.
ORG 0x00                           ;establece el origen del programa en la dirección 0x00 (vector de reset).
GOTO INICIO                        ;salta a la etiqueta INICIO al iniciar el programa.
ORG 0x05                           ;establece el origen en 0x05 (vector de interrupción, aunque no se usa).

INICIO                              ;etiqueta de inicio del programa.
BSF STATUS, RP0                    ;pone en 1 el bit RP0 del registro STATUS (selecciona banco 1).
BCF STATUS, RP1                    ;pone en 0 el bit RP1 del registro STATUS (banco 1).
MOVLW b'00001111'                  ;mueve el valor binario 00001111 (15 decimal) al registro W.
MOVWF TRISC                        ;configura PORTC como entrada (bits 0-3 como entrada).
MOVLW b'00000000'                  ;mueve el valor binario 00000000 (0 decimal) al registro W.
MOVWF TRISB                        ;configura PORTB como salida (todos los bits como salida).
BCF STATUS, RP0                    ;pone en 0 el bit RP0 del registro STATUS (regresa al banco 0).
BCF STATUS, RP1                    ;pone en 0 el bit RP1 del registro STATUS (banco 0).

MAIN                                ;etiqueta del bucle principal.
MOVF PORTC, W                       ;carga el valor del puerto C en el registro W.
MOVWF TEMP                         ;guarda el valor en la variable temporal TEMP.
MOVF TEMP, W                       ;pone nuevamente el valor de TEMP en W.
ADDWF TEMP, W                      ;suma TEMP + W (TEMP*2), y se guarda el resultado en W.
ADDWF TEMP, W                      ;suma TEMP*2 + TEMP = TEMP*3.
ADDWF TEMP, W                      ;suma TEMP*3 + TEMP = TEMP*4.
ADDWF TEMP, W                      ;suma TEMP*4 + TEMP = TEMP*5.
MOVWF PORTB                        ;mueve el resultado al puerto B.
GOTO MAIN                          ;regresa al inicio del bucle MAIN (bucle infinito).
END                                ;fin del programa.
