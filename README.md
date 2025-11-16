# ✖️ Práctica 4: Multiplicación por 5 - PIC16F877A

## 📋 Descripción

Este proyecto implementa un multiplicador por 5 utilizando el microcontrolador **PIC16F877A**. El programa lee un valor de 4 bits desde el **PORTC** (bits 0-3) y calcula su multiplicación por 5 mediante sumas repetidas, mostrando el resultado en el **PORTB**.

### 🎯 Funcionalidad

- **PORTC** (bits 0-3): Configurado como entrada para leer un valor de 4 bits (0-15)
- **PORTB** (bits 0-7): Configurado como salida para mostrar el resultado de la multiplicación
- **Operación:** Multiplica el valor de entrada por 5 usando sumas repetidas

### 🔄 Funcionamiento

El programa implementa la multiplicación por 5 mediante la siguiente operación:
- `resultado = valor × 5`
- Se calcula sumando el valor consigo mismo 5 veces: `valor + valor + valor + valor + valor`

**Ejemplo:**
- Si `PORTC = 00000011` (3 decimal) → `PORTB = 00001111` (15 decimal = 3 × 5)
- Si `PORTC = 00000101` (5 decimal) → `PORTB = 00011001` (25 decimal = 5 × 5)

## 🔧 Tecnologías Utilizadas

![PIC16F877A](https://img.shields.io/badge/PIC16F877A-Microcontroller-blue?style=flat-square)
![Assembly](https://img.shields.io/badge/Assembly-Language-green?style=flat-square)
![MPLAB](https://img.shields.io/badge/MPLAB_X-IDE-orange?style=flat-square)
![Proteus](https://img.shields.io/badge/Proteus-Simulation-purple?style=flat-square)

## 🛠️ Materiales Necesarios

### Componentes Electrónicos

- 🔹 **1x Microcontrolador PIC16F877A**
- 🔹 **1x Cristal oscilador 4MHz** (o según configuración)
- 🔹 **2x Capacitores cerámicos 22pF** (para el cristal)
- 🔹 **1x Resistencia pull-up 10kΩ** (opcional, para MCLR)
- 🔹 **4x Interruptores o DIP switch** (para PORTC, bits 0-3)
- 🔹 **8x LEDs** con resistencias limitadoras (220Ω - 1kΩ) para visualizar el resultado
- 🔹 **8x Resistencias 220Ω - 1kΩ** (para los LEDs)
- 🔹 **1x Capacitor electrolítico 100µF** (filtro de alimentación)
- 🔹 **1x Capacitor cerámico 0.1µF** (desacoplamiento)
- 🔹 **Fuente de alimentación 5V DC** o regulador 7805
- 🔹 **Cables dupont o protoboard** para conexiones

### Herramientas y Software

- 💻 **MPLAB X IDE** o **MPLAB IDE**
- 🔧 **Compilador XC8** o **MPASM**
- 📡 **Programador PIC** (PICKit, ICD, etc.)
- 🔌 **Proteus ISIS** o **Proteus Professional** (para simulación)
- 📐 **Protoboard** o **PCB** para montaje
- 🔨 **Soldador** (si se usa PCB)

## 📁 Estructura del Proyecto

```
practica(4)/
├── README.md                    # Este archivo
├── pract4.X/
│   └── pr4.asm                 # Código fuente en ensamblador
└── dist/
    └── default/
        └── production/
            └── pract4.X.production.hex  # Archivo HEX para programar
```

## 💻 Código

El código está escrito en **ensamblador PIC** y está completamente comentado línea por línea para facilitar su comprensión.

### Características del Código

- ✅ Configuración de puertos (PORTC como entrada, PORTB como salida)
- ✅ Manejo de bancos de memoria del PIC
- ✅ Multiplicación por 5 mediante sumas repetidas
- ✅ Uso de variable temporal para almacenar el valor de entrada
- ✅ Bucle principal infinito para lectura continua
- ✅ Comentarios descriptivos en cada línea

### Algoritmo de Multiplicación

El programa implementa la multiplicación por 5 de la siguiente manera:

```assembly
valor = PORTC (4 bits, rango 0-15)
resultado = valor + valor + valor + valor + valor
PORTB = resultado
```

## 🚀 Instalación y Uso

### 1. Clonar el Repositorio

```bash
git clone https://github.com/LuisMatla/multiplicacion.git
cd multiplicacion
```

### 2. Abrir en MPLAB X

1. Abre **MPLAB X IDE**
2. File → Open Project
3. Selecciona el proyecto `pract4.X` o importa el proyecto

### 3. Compilar el Proyecto

1. Build → Build Main Project (F11)
2. Verifica que no haya errores en la compilación
3. El archivo `.hex` se generará en `dist/default/production/`

### 4. Programar el PIC

1. Conecta tu programador PIC al microcontrolador
2. Tools → Select Tool → [Tu Programador]
3. Production → Build and Program Main Project
4. Espera a que termine la programación

### 5. Simular en Proteus (Opcional)

1. Abre el proyecto en **Proteus ISIS**
2. Ejecuta la simulación
3. Prueba cambiando los valores en PORTC y observa el resultado en PORTB

## 🔧 Configuración del Hardware

### Conexiones PORTC (Entradas)

Los 4 bits menos significativos del PORTC se usan como entrada:

```
PORTC.0 → DIP Switch bit 0 o Interruptor 1
PORTC.1 → DIP Switch bit 1 o Interruptor 2
PORTC.2 → DIP Switch bit 2 o Interruptor 3
PORTC.3 → DIP Switch bit 3 o Interruptor 4
```

### Conexiones PORTB (Salidas)

El PORTB muestra el resultado de la multiplicación (8 bits):

```
PORTB.0 → LED 0 (con resistencia 220Ω) → GND
PORTB.1 → LED 1 (con resistencia 220Ω) → GND
PORTB.2 → LED 2 (con resistencia 220Ω) → GND
PORTB.3 → LED 3 (con resistencia 220Ω) → GND
PORTB.4 → LED 4 (con resistencia 220Ω) → GND
PORTB.5 → LED 5 (con resistencia 220Ω) → GND
PORTB.6 → LED 6 (con resistencia 220Ω) → GND
PORTB.7 → LED 7 (con resistencia 220Ω) → GND
```

### Alimentación

```
VDD (Pin 11, 32) → +5V
VSS (Pin 12, 31) → GND
```

### Oscilador

```
OSC1 (Pin 13) → Cristal 4MHz
OSC2 (Pin 14) → Cristal 4MHz
Capacitores 22pF desde cada pin a GND
```

### Configuración de Fusibles

El programa configura los siguientes fusibles:
- **WDT:** Deshabilitado (Watchdog Timer OFF)
- **PWRTE:** Habilitado (Power-up Timer ON)
- **OSC:** Oscilador XT (Cristal)
- **LVP:** Deshabilitado (Low Voltage Programming OFF)
- **CP:** Deshabilitado (Code Protection OFF)

## 📊 Tabla de Valores

| Entrada (PORTC) | Decimal | Resultado (PORTB) | Decimal | Verificación |
|----------------|---------|-------------------|---------|--------------|
| 0000           | 0       | 00000000          | 0       | 0 × 5 = 0    |
| 0001           | 1       | 00000101          | 5       | 1 × 5 = 5    |
| 0010           | 2       | 00001010          | 10      | 2 × 5 = 10   |
| 0011           | 3       | 00001111          | 15      | 3 × 5 = 15   |
| 0100           | 4       | 00010100          | 20      | 4 × 5 = 20   |
| 0101           | 5       | 00011001          | 25      | 5 × 5 = 25   |
| 0110           | 6       | 00011110          | 30      | 6 × 5 = 30   |
| 0111           | 7       | 00100011          | 35      | 7 × 5 = 35   |
| 1000           | 8       | 00101000          | 40      | 8 × 5 = 40   |
| 1001           | 9       | 00101101          | 45      | 9 × 5 = 45   |
| 1010           | 10      | 00110010          | 50      | 10 × 5 = 50  |
| 1011           | 11      | 00110111          | 55      | 11 × 5 = 55  |
| 1100           | 12      | 00111100          | 60      | 12 × 5 = 60  |
| 1101           | 13      | 01000001          | 65      | 13 × 5 = 65  |
| 1110           | 14      | 01000110          | 70      | 14 × 5 = 70  |
| 1111           | 15      | 01001011          | 75      | 15 × 5 = 75  |

## 🧪 Pruebas

### Prueba Básica

1. ✅ Alimenta el circuito con 5V
2. ✅ Configura el DIP switch en PORTC con un valor (ej: 0011 = 3)
3. ✅ Verifica que los LEDs en PORTB muestren el resultado (ej: 00001111 = 15)
4. ✅ Prueba con diferentes valores y verifica la multiplicación

### Ejemplo de Prueba

- **Entrada:** PORTC = `0011` (3 decimal)
- **Operación:** 3 × 5 = 15
- **Salida esperada:** PORTB = `00001111` (15 decimal)
- **LEDs encendidos:** PORTB.0, PORTB.1, PORTB.2, PORTB.3

## 📝 Notas Técnicas

- El programa utiliza un **bucle infinito** para leer continuamente las entradas
- La multiplicación se realiza mediante **sumas repetidas** (método eficiente para multiplicar por constantes pequeñas)
- El código maneja correctamente los **bancos de memoria** del PIC16F877A
- La configuración de puertos se realiza en el **banco 1** (TRISC, TRISB)
- Las operaciones de lectura/escritura se realizan en el **banco 0** (PORTC, PORTB)
- Se utiliza una **variable temporal** (TEMP) para almacenar el valor de entrada
- El rango de entrada es de 0 a 15 (4 bits), y el resultado máximo es 75 (8 bits)

## 👨‍💻 Autor

**Luis Fernando Contreras Matla.**

## 📚 Información Académica

Esta práctica fue desarrollada como parte de la Experiencia Educativa:

- **Materia:** Microprocesadores y Microcontroladores
- **Universidad:** Universidad Veracruzana
- **Facultad:** Ingeniería Eléctrica y Electrónica
- **Docente:** Rosa María Woo García

## 📄 Licencia

Este proyecto es de uso educativo y académico.

