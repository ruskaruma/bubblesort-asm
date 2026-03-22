section .data
    arr dd 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    arr_len equ ($ - arr) / 4
    newline db 10
    space db ' '

section .bss
    num_buffer resb 11
    num_buffer_end equ $ - 1

section .text
    global _start

_start:
    mov r8, arr_len
    dec r8

outer_loop:
    cmp r8, 0
    je sort_done

    mov rcx, 0
    mov rbx, arr

inner_loop:
    cmp rcx, r8
    jge end_inner_loop

    mov eax, [rbx + rcx * 4]
    mov edx, [rbx + rcx * 4 + 4]

    cmp eax, edx
    jle no_swap

    mov [rbx + rcx * 4], edx
    mov [rbx + rcx * 4 + 4], eax

no_swap:
    inc rcx
    jmp inner_loop

end_inner_loop:
    dec r8
    jmp outer_loop

sort_done:
    mov r9, 0

print_loop:
    cmp r9, arr_len
    je end_print_loop

    mov eax, [rbx + r9 * 4]
    call print_int

    mov rsi, space
    mov rdx, 1
    call print_string

    inc r9
    jmp print_loop

end_print_loop:
    mov rsi, newline
    mov rdx, 1
    call print_string

    mov rax, 60
    mov rdi, 0
    syscall

print_int:
    push rbx

    mov rcx, num_buffer_end
    mov rbx, 10
    mov [rcx], byte 0
    dec rcx

convert_loop:
    xor rdx, rdx
    div rbx
    add rdx, '0'
    mov [rcx], dl
    dec rcx
    test eax, eax
    jnz convert_loop

    inc rcx
    mov rsi, rcx

    mov rdx, num_buffer_end
    sub rdx, rcx

    call print_string
    
    pop rbx
    ret

print_string:
    mov rax, 1
    mov rdi, 1
    syscall
    ret
