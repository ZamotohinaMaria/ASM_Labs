%include "io64.inc" ; SEE http://asmcourse.cs.msu.ru/?page_id=169

; NOTE: this program is intentionally simplified, you can write a more optimal version yourself :)

section .bss
buffer: resb 1025 ; allocate a static buffer


section .text
global main
main:
    GET_STRING buffer, 1025 ; read string (with the trailing zero and '\n', if present)
    mov rcx, -1             ; rcx = -1
    
  loop_start:
    add rcx,1               ; ++rcx
    mov al, [buffer+rcx]    ; al = buffer[rcx]
    cmp al, 0               
    je end                  ; if al == 0 -> end of string
    cmp al, 13 ; '\n'       
    jne loop_start          ; if al == '\n' -> end of string, else go to next symbol

    
  end:
    PRINT_DEC 8, rcx        ; rcx contains length, print result

    xor rax, rax            ; set exit code to 0 and exit from main()
    ret