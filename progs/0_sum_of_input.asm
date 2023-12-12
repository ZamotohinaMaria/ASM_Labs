; <- semicolon marks a commentary

; this program outputs a sum of an input array
; INPUT FORMAT:
; <NUMBERS COUNT> <NUMBER 1>, <NUMBER 2>, ..., <NUMBER N>
;

; NOTE: this program is intentionally simplified, you can write a more optimal version yourself :)

%include "io64.inc" ; SEE http://asmcourse.cs.msu.ru/?page_id=169

section .bss
buffer: resQ 1024 ; buffer for an input array (element type: long long)

section .text
global main ; main must be a global symbol

main:
    mov rbp, rsp; for correct debugging      
    xor rax,rax     ; set result to zero
    GET_UDEC 8, rdx ; read the numbers count, rdx=N
    test rdx, rdx   ; check the number
    jz end          ; if N=0 - no work to do, goto end
    cmp rdx, 1024   ; check N <= 1024
    ja too_long     ; if greater -> print error and exit

    ; for(rcx=0; rcx<rdx; ++rcx) ...
    xor rcx,rcx     ; rcx = 0
  input_loop_start:         
    GET_DEC 8, r8           ; read the next number
    mov [buffer+8*rcx], r8  ; save the number to the buffer, buffer[rcx] = rax;
    add rcx, 1              ; ++rcx
    cmp rcx,rdx             ; check rcx<rdx
    jl input_loop_start     
    
    ; for(rcx=0; rcx<rdx; ++rcx) ...
    xor rcx,rcx             ; rcx = 0
  main_loop_start:
    add rax, [buffer+8*rcx] ; rax+=buffer[rcx]
    add rcx, 1              ; ++rcx
    cmp rcx,rdx             ; check rcx<rdx
    jl main_loop_start
    
  end:
    PRINT_DEC 8,rax         ; print the result (from rax)
    xor eax, eax            ; set the exit code to 0
    ret         
    
  too_long:
    PRINT_STRING "TOO LONG (max 1024)"
    mov eax, 1              ; set the exit code to 1 (exit code !=0 means error)
    ret
  
  

  
    
    
    
    
    

        
    
    