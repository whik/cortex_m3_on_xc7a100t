;/**************************************************************************//**
; * @file     startup_DS_CM3.s
; * @brief    CMSIS Core Device Startup File for
; *           DesignStart Cortex-M3 Device
; * @version  V1.0.0
; * @date     05. May 2017
; ******************************************************************************/
;/* Copyright (c) 2011 - 2017 ARM LIMITED
;
;   All rights reserved.
;   Redistribution and use in source and binary forms, with or without
;   modification, are permitted provided that the following conditions are met:
;   - Redistributions of source code must retain the above copyright
;     notice, this list of conditions and the following disclaimer.
;   - Redistributions in binary form must reproduce the above copyright
;     notice, this list of conditions and the following disclaimer in the
;     documentation and/or other materials provided with the distribution.
;   - Neither the name of ARM nor the names of its contributors may be used
;     to endorse or promote products derived from this software without
;     specific prior written permission.
;   *
;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
;   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;   POSSIBILITY OF SUCH DAMAGE.
;   ---------------------------------------------------------------------------*/
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000C00

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp               ;     Top of Stack
                DCD     Reset_Handler              ;     Reset Handler
                DCD     NMI_Handler                ;     NMI Handler
                DCD     HardFault_Handler          ;     Hard Fault Handler
                DCD     MemManage_Handler          ;     MPU Fault Handler
                DCD     BusFault_Handler           ;     Bus Fault Handler
                DCD     UsageFault_Handler         ;     Usage Fault Handler
                DCD     0                          ;     Reserved
                DCD     0                          ;     Reserved
                DCD     0                          ;     Reserved
                DCD     0                          ;     Reserved
                DCD     SVC_Handler                ;     SVCall Handler
                DCD     DebugMon_Handler           ;     Debug Monitor Handler
                DCD     0                          ;     Reserved
                DCD     PendSV_Handler             ;     PendSV Handler
                DCD     SysTick_Handler            ;     SysTick Handler

                ; External Interrupts
                DCD     UART0_Handler              ;   0 UART0 TX/RX combined
                DCD     0                          ;   1 Unused
                DCD     UART1_Handler              ;   2 UART1 TX/RX combined
                DCD     RESERVED1_Handler          ;   3 Reserved for APB slaves
                DCD     RESERVED2_Handler          ;   4 Reserved for APB slaves
                DCD     RTC_Handler                ;   5 RTC
                DCD     GPIO0_Handler              ;   6 GPIO 0 combined
                DCD     GPIO1_Handler              ;   7 GPIO 1 combined
                DCD     TIMER0_Handler             ;   8 Timer0
                DCD     TIMER1_Handler             ;   9 Timer1
                DCD     DUALTIMER_Handler          ;  10 Dual Timer
                DCD     RESERVED3_Handler          ;  11 Reserved for APB slaves
                DCD     UART_OVF_Handler           ;  12 UART 0/1/2/3/4 overflow
                DCD     RESERVED4_Handler          ;  13 Reserved for APB slaves
                DCD     0                          ;  14 Unused
                DCD     TSC_Handler                ;  15 MPS2+ baseboard Touch Screen
                DCD     GPIO0_0_Handler            ;  16 GPIO0 individual interrupt ( 0)
                DCD     GPIO0_1_Handler            ;  17 GPIO0 individual interrupt ( 1)
                DCD     GPIO0_2_Handler            ;  18 GPIO0 individual interrupt ( 2)
                DCD     GPIO0_3_Handler            ;  19 GPIO0 individual interrupt ( 3)
                DCD     GPIO0_4_Handler            ;  20 GPIO0 individual interrupt ( 4)
                DCD     GPIO0_5_Handler            ;  21 GPIO0 individual interrupt ( 5)
                DCD     GPIO0_6_Handler            ;  22 GPIO0 individual interrupt ( 6)
                DCD     GPIO0_7_Handler            ;  23 GPIO0 individual interrupt ( 7)
                DCD     GPIO0_8_Handler            ;  24 GPIO0 individual interrupt ( 8)
                DCD     GPIO0_9_Handler            ;  25 GPIO0 individual interrupt ( 9)
                DCD     GPIO0_10_Handler           ;  26 GPIO0 individual interrupt (10)
                DCD     GPIO0_11_Handler           ;  27 GPIO0 individual interrupt (11)
                DCD     GPIO0_12_Handler           ;  28 GPIO0 individual interrupt (12)
                DCD     GPIO0_13_Handler           ;  29 GPIO0 individual interrupt (13)
                DCD     GPIO0_14_Handler           ;  30 GPIO0 individual interrupt (14)
                DCD     GPIO0_15_Handler           ;  31 GPIO0 individual interrupt (15)
                DCD     RESERVED5_Handler          ;  32 Reserved for Flash
                DCD     RESERVED6_Handler          ;  33 Reserved for Flash
                DCD     RESERVED7_Handler          ;  34 reserved for Cordio BT4
                DCD     RESERVED8_Handler          ;  35 reserved for Cordio BT4
                DCD     RESERVED9_Handler          ;  36 reserved for Cordio BT4
                DCD     RESERVED10_Handler         ;  37 reserved for Cordio BT4
                DCD     RESERVED11_Handler         ;  38 reserved for Cordio BT4
                DCD     RESERVED12_Handler         ;  39 reserved for Cordio BT4
                DCD     RESERVED13_Handler         ;  40 reserved for Cordio BT4
                DCD     RESERVED14_Handler         ;  41 reserved for Cordio BT4
                DCD     GPIO2_Handler              ;  42 Combined
                DCD     GPIO3_Handler              ;  43 Combined
                DCD     TRNG_Handler               ;  44 True Random Number Generator
                DCD     UART2_Handler              ;  45 UART 2 TX/RX compined
                DCD     UART3_Handler              ;  46 UART 3 TX/RX compined
                DCD     ETHERNET_Handler           ;  47 Ethernet Interrupt
                DCD     I2S_Handler                ;  48 I2S Interrupt
                DCD     MPS2_SPI0_Handler          ;  49 SPI Header interrupt
                DCD     MPS2_SPI1_Handler          ;  50 CLCD SPI interrupt
                DCD     MPS2_SPI2_Handler          ;  51 ADC for Shield
                DCD     MPS2_SPI3_Handler          ;  52 Shield0 SPI
                DCD     MPS2_SPI4_Handler          ;  53 Shield1 SPI
                DCD     GPIO4_Handler              ;  54 GPIO 4 combined
                DCD     GPIO5_Handler              ;  55 GPIO 5 combined
                DCD     UART4_Handler              ;  56 UART 4 TX/Rx combined
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

Default_Handler PROC
                EXPORT UART0_Handler              [WEAK]
                EXPORT UART1_Handler              [WEAK]
                EXPORT RESERVED1_Handler          [WEAK]
                EXPORT RESERVED2_Handler          [WEAK]
                EXPORT RTC_Handler                [WEAK]
                EXPORT GPIO0_Handler              [WEAK]
                EXPORT GPIO1_Handler              [WEAK]
                EXPORT TIMER0_Handler             [WEAK]
                EXPORT TIMER1_Handler             [WEAK]
                EXPORT DUALTIMER_Handler          [WEAK]
                EXPORT RESERVED3_Handler          [WEAK]
                EXPORT UART_OVF_Handler           [WEAK]
                EXPORT RESERVED4_Handler          [WEAK]
                EXPORT TSC_Handler                [WEAK]
                EXPORT GPIO0_0_Handler            [WEAK]
                EXPORT GPIO0_1_Handler            [WEAK]
                EXPORT GPIO0_2_Handler            [WEAK]
                EXPORT GPIO0_3_Handler            [WEAK]
                EXPORT GPIO0_4_Handler            [WEAK]
                EXPORT GPIO0_5_Handler            [WEAK]
                EXPORT GPIO0_6_Handler            [WEAK]
                EXPORT GPIO0_7_Handler            [WEAK]
                EXPORT GPIO0_8_Handler            [WEAK]
                EXPORT GPIO0_9_Handler            [WEAK]
                EXPORT GPIO0_10_Handler           [WEAK]
                EXPORT GPIO0_11_Handler           [WEAK]
                EXPORT GPIO0_12_Handler           [WEAK]
                EXPORT GPIO0_13_Handler           [WEAK]
                EXPORT GPIO0_14_Handler           [WEAK]
                EXPORT GPIO0_15_Handler           [WEAK]
                EXPORT RESERVED5_Handler          [WEAK]
                EXPORT RESERVED6_Handler          [WEAK]
                EXPORT RESERVED7_Handler          [WEAK]
                EXPORT RESERVED8_Handler          [WEAK]
                EXPORT RESERVED9_Handler          [WEAK]
                EXPORT RESERVED10_Handler         [WEAK]
                EXPORT RESERVED11_Handler         [WEAK]
                EXPORT RESERVED12_Handler         [WEAK]
                EXPORT RESERVED13_Handler         [WEAK]
                EXPORT RESERVED14_Handler         [WEAK]
                EXPORT GPIO2_Handler              [WEAK]
                EXPORT GPIO3_Handler              [WEAK]
                EXPORT TRNG_Handler               [WEAK]
                EXPORT UART2_Handler              [WEAK]
                EXPORT UART3_Handler              [WEAK]
                EXPORT ETHERNET_Handler           [WEAK]
                EXPORT I2S_Handler                [WEAK]
                EXPORT MPS2_SPI0_Handler          [WEAK]
                EXPORT MPS2_SPI1_Handler          [WEAK]
                EXPORT MPS2_SPI2_Handler          [WEAK]
                EXPORT MPS2_SPI3_Handler          [WEAK]
                EXPORT MPS2_SPI4_Handler          [WEAK]
                EXPORT GPIO4_Handler              [WEAK]
                EXPORT GPIO5_Handler              [WEAK]
                EXPORT UART4_Handler              [WEAK]

UART0_Handler
UART1_Handler
RESERVED1_Handler
RESERVED2_Handler
RTC_Handler
GPIO0_Handler
GPIO1_Handler
TIMER0_Handler
TIMER1_Handler
DUALTIMER_Handler
RESERVED3_Handler
UART_OVF_Handler
RESERVED4_Handler
TSC_Handler
GPIO0_0_Handler
GPIO0_1_Handler
GPIO0_2_Handler
GPIO0_3_Handler
GPIO0_4_Handler
GPIO0_5_Handler
GPIO0_6_Handler
GPIO0_7_Handler
GPIO0_8_Handler
GPIO0_9_Handler
GPIO0_10_Handler
GPIO0_11_Handler
GPIO0_12_Handler
GPIO0_13_Handler
GPIO0_14_Handler
GPIO0_15_Handler
RESERVED5_Handler
RESERVED6_Handler
RESERVED7_Handler
RESERVED8_Handler
RESERVED9_Handler
RESERVED10_Handler
RESERVED11_Handler
RESERVED12_Handler
RESERVED13_Handler
RESERVED14_Handler
GPIO2_Handler
GPIO3_Handler
TRNG_Handler
UART2_Handler
UART3_Handler
ETHERNET_Handler
I2S_Handler
MPS2_SPI0_Handler
MPS2_SPI1_Handler
MPS2_SPI2_Handler
MPS2_SPI3_Handler
MPS2_SPI4_Handler
GPIO4_Handler
GPIO5_Handler
UART4_Handler
                B       .

                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap

__user_initial_stackheap PROC
                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR
                ENDP

                ALIGN

                ENDIF


                END
