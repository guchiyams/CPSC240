;unsigned int num1 = 300,000;
;unsigned int num2 = 400,000;
;unsigned long product = 0;
;product = long(num1 * num2);

section .data
    num1  dd  300000        ;num1 = 493E0h
    num2  dd  400000        ;num2 = 61A80h
    product  dq  product    ;product = 00h

section .text
global _start
_start:
    ;product = num1 * num2
    mov  eax,  dword[num1]      ;eax = num1 = 493E0h
    mul  dword[num2]            ;edx:eax = num1 * num2 = 1B:F08EB000

    mov dword [product+0], eax
    mov dword [product+4], edx

    mov rax, 60
    mov rdi, 0
    syscall