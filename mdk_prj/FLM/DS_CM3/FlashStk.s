;/***********************************************************************/
;/*  This file is part of the ARM Toolchain package                     */
;/*  Copyright (c) 2016 Keil - An ARM Company. All rights reserved.     */
;/***********************************************************************/
;/*                                                                     */
;/*  FlashStk.s: Necessary stack size configuration for Flash algorithm */
;/*                                                                     */
;/***********************************************************************/

;/*
; *-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
; */

; <h> Flash Algorithm Stack Configuration
;   <o> Flash Algorithm Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
;   <i> Amount of memory (in bytes) allocated for Flash Algorithm Stack
;   <i> Tailor this value to your Flash Algorithm needs
; </h>

    EXPORT STACK_SIZE
STACK_SIZE EQU 0x64
    END


;By default uVision assumes a stack size of 64 byte.

;Do not add this file to your Flash algorithm project
;  if the Flash programming algorithm uses 64 byte or less stack.

;Add this file to your Flash algorithm project
;  if the Flash programming algorithm uses more than 64 byte stack.
