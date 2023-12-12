; средний уровень:
;   вычислить значение выражения y
;   2 - 7) 𝑦 = 2^(𝑎𝑥+𝑏)
%include "io64.inc"
%include "io64_float.inc"

extern scanf
CEXTERN printf
extern malloc

section .rodata
formatinnum: db "%f", 0

section .data
    
    two: dd 2.0
    a: dd __QNaN__
    b: dd __QNaN__
    x: dd __QNaN__
    y: dd __QNaN__

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    fninit
    ;POLIZ: 2 a x *
    
    push rbx
    sub rsp, 32 ; чтобы избежать ошибки сегментации
    mov dword[rsp], 100
    
    ;input a
    mov rdi, 4 ; кладём в rdi
    call malloc; выделяем в rdi 4 бита
    
    mov rdi, formatinnum; ввод шаблона, по которому вводим значение
    call scanf
    movss [a], xmm0; так как число вещетвенное, оно записывается в xmm регистры
   
    xor rdi, rdi; очищаем, чтобы можно было вновь корректно выделить память
    
    ;input b
    mov rdi, 4
    call malloc
    
    mov rdi, formatinnum
    call scanf
    movss [b], xmm0
    
    xor rdi, rdi
   
    ;input x
    mov rdi, 4 ; кладём туда 16 и говорим malloc'у сколько байт выделить
    call malloc
    
    mov rdi, formatinnum; ввод шаблона, по которому вводим значение
    call scanf
    movss [x], xmm0
    
    fld dword[a]
    fld dword[x]
    fmul
    fld dword[b]
    fadd
    fld dword[two]
    
    FYL2X ;вычисляем показатель
    FLD1 ;загружаем +1.0 в стек
    FLD ST1 ;дублируем показатель в стек
    FPREM ;получаем дробную часть
    F2XM1 ;возводим в дробную часть показателя
    FADD;прибавляем 1 из стека
    FSCALE;возводим в целую часть и умножаем
    FSTP ST1 ; выталкиваем лишнее из вершины
    
    fstp dword[y]
    
    movss xmm0, [y]
    mov  eax, 1
    ;mov rsi, [y]
    mov rdi, formatinnum ; в rdi кидаем шаблон по которому
    call printf
    add rsp, 8
    xor eax, eax
    
    finit
    xor rax, rax
    ret