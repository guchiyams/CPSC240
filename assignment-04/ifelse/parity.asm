; unsigned short num1 = 325;
; unsigned short even = 0, odd = 0;
; if(num1 % 2 == 0) {
    ; even++;
; } else {
    ; odd++;
; }
section .data
    num1 dw 325             ; num1 = 0145h
    even dw 0               ; even = 00h
    odd  dw 0               ; odd = 00h

section .text
global _start
_start:
    mov ax, word[num1]      ; ax = num1 = 0145h
    mov dl, 2               ; dl = 2 = 02h
    div dl                  ; ah = remainder = 1 = 01h, al = quotient = 162 = a2h
    cmp ah, 0               ; compare ah (remainder) with 0
    je is_even              ; if ah == 0 (remainder is 0) then jump to is_even block
    inc word[odd]           ; increment odd
    jmp end_if              ; jump to end_if block
is_even:
    inc word[even]          ; increment even
    jmp end_if              ; jump to end_if block
end_if:
    mov rax, 60
    mov rdi, 0
    syscall