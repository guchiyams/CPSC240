section .data
    num1    dw  30000       ;num1 = 30000 = 7530h
    num2    dw  40000       ;num2 = 40000 = 9C40h
    sum     dd  0           ;sum  = 0     = 00h

section .text
global _start
_start:
    mov     dx,     0
    mov     ax,     word [num1]       ;ax = num1 = 7530h
    add     ax,     word [num2]       ;ax = ax + num2 = 1170h
    adc     dx,     0                 ;dx = dx + 0 + 01h  
    mov     word[sum+0],    ax        ;sum = 1170h
    mov     word[sum+2],    dx        ;sum = 11170h

    mov rax, 60
    mov rdi, 0
    syscall