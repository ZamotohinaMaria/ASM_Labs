; my first nasm programm!
; The Caesar cipher
%include "io64.inc"

section .rodata
alph: db "abcdefghijklmnopqrtsuvwxyz1234567890[]()+-*/=&?!/\”’:;@.,", 0

section .data
alen: db 57

section .bss
string: resb 256 ; input string, max len = 256
offset: resb 1 ; offset in the caesar cipher, must be < 57

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    GET_STRING string, 256 ; read string
    ;PRINT_STRING string
    
    GET_DEC 1, offset ; read offset
    ;PRINT_DEC 1, offset
    
    mov rcx, -1
  loop_for_string:
    add rcx, 1 ; inc rcx?
    mov al, [string+rcx]
    cmp al, 0               
    je end ; if al == 0 -> end of string
    cmp al, 13 ; '\n'       
    mov rdx, -1
    jne loop_for_alphabet ; if al == '\n' -> end of string, else go to next symbol
    
  loop_for_alphabet:
    add rdx, 1 ; inc rdx?
    mov ah, [alph+rdx]
    cmp ah, 0
    je loop_for_string ; if ah == 0 -> end of alphabet
    cmp ah, al ; if (str[i] == alphabet[j])
    jne loop_for_alphabet
    
    mov r8, rdx
    add r8, [offset]
    cmp r8, [alen] ; if (j + luft >= alen)
    jnge false
    true:
      mov rbx, rdx
      add rbx, [offset]
      sub rbx, [alen]
      mov al, [alph+rbx] ; str[i] = alphabet[j + luft - alen];
      mov [string+rcx], al
      xor rbx, rbx
      jz loop_for_string
    false:
      mov rbx, rdx
      add rbx, [offset]
      mov al, [alph+rbx] ; str[i] = alphabet[j + luft];
      mov [string+rcx], al
      xor rbx, rbx
      jz loop_for_string
    
            
  end:
    PRINT_STRING string  
    xor rax, rax
    xor rdx, rdx
    xor rcx, rcx
    xor rbx, rbx
    xor r8, r8
    ret