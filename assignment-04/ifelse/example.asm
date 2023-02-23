section .data
    num1 db 5
    num2 db 9
    max db 0
    min db 0

section .text
global _start
_start:
    mov al, byte[num1]
    mov bl, byte[num2]
    cmp al, bl
    jae else_block
    mov byte[max], bl
    mov byte[min], al
    jmp end_if
else_block:
    mov byte[max], al
    mov byte[min], bl
end_if:
    mov rax, 60
    mov rdi, 0
    syscall