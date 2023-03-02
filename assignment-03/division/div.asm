;unsigned long num1 = 50,000,000,000;
;unsigned int num2 = 3,333,333;
;unsigned int quotient = 0, remainder = 0;
;quotient = num1 / num2;
;remainder = num1 % num2;

section .data
    num1  dq  50000000000       ;num1 = BA43B7400
    num2  dd  -3333333           ;num2 = 32DCD5
    quotient  dd  0             ;quotient = 00h
    remainder dd  0             ;remainder = 00h

section .text
global _start
_start:
    ; quotient = num1 / num2
    mov edx, 0                  ;clear edx
    mov eax, dword[num1+0]      ;eax = num1[0-3] = A43B7400
    mov edx, dword[num1+4]      ;edx = num1[4-7]
    idiv dword[num2]             ;eax = num1 / num2 = 3A98
                                ;edx = num1 % num2 = 1388

    mov dword[quotient], eax    ;eax = quotient = 3A98
    mov dword[remainder], edx   ;edx = remainder = 1388

    mov rax, 60
    mov rsp, 0
    syscall