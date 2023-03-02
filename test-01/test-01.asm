;unsigned char num1 = 250; //data type: 8 bits
;unsigned char num2 = 200; //data type: 8 bits
;unsigned char num3 = 120; //data type: 8 bits
;unsigned short sum = 0 //data type: 16 bits
;unsigned int product = 0; //data type: 32 bits
;sum = num1 + num2;
;product = sum * short(num3);

section .data
    num1 db 250
    num2 db 200
    num3 db 120
    sum  dw 0
    product dd 0

section .text
global _start
_start:
    ; sum = num1 + num2
    ; 450 = 250 + 200
    mov rax, 0
    mov rdx, 0
    mov al, byte[num1]          ;al = 250 = F2h
    add al, byte[num2]          ;num1 + num2 = al = C2h
    adc dl, 0                   ;dl = CF + 0
    mov byte[sum+0], al         ;sum[0:1] = al = C2h
    mov byte[sum+1], dl         ;sum[1:2] = dx = 1
                                ;sum = 1C2h = 450

    mov rax, 0
    mov rdx, 0

    ; product = sum * short(num3)
    ; convert byte[num3] to word
    ; 16 bit * 16 bit = 32 bit [dx:ax]
    ; 54,000 = 450 * 120 = D2F0h
    mov al, byte[num3]          ;al = 120 = 78h
    cbw                         ;ax = 120 = 00:78h
    mul word[sum]               ;ax * sum = 54000 = D2:F0h
    mov word[product+0], ax     ;product[0:2] = D2:F0h
    mov word[product+2], dx     ;product[2:4] = 00:00h
                                ;product = 00:00:D2:F0h = 54,000

    mov rax, 60
    mov rdi, 0
    syscall