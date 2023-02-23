section .data
    num1    dw   30000      ;num1 = 30000 = 7530h
    num2    dw   40000      ;num2 = 40000 = 9C40h
    dif     dd   0          ;sum  = 0     = 00h

section .text
global _start
_start:
    mov     dx,     0
    mov     ax,     word[num1]      ;ax = num1 = 7530h
    sub     ax,     word[num2]      ;ax = ax - num2 = -2710
    sbb     dx,     0
    mov     word[dif+0],    ax      
    mov     word[dif+2],    dx

    mov rax, 60
    mov rdi, 0
    syscall