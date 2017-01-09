Sorting_Floor(int*):
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-120], rdi        ; inbox / input_array

        mov     DWORD PTR [rbp-12], 0           ; ZERO = 0 - already init

        mov     eax, DWORD PTR [rbp-12]         ; copyfrom ZERO
        mov     DWORD PTR [rbp-4], eax          ; i = ZERO

        mov     eax, DWORD PTR [rbp-12]         ; copyfrom ZERO
        mov     DWORD PTR [rbp-16], eax         ; end_index = ZERO

        mov     eax, DWORD PTR [rbp-12]         ; copyfrom ZERO
        add     eax, 1                          ; bump+
        mov     DWORD PTR [rbp-8], eax          ; num_swaps=1

        mov     DWORD PTR [rbp-20], 777         ; a - don't init
        mov     DWORD PTR [rbp-24], 888         ; b - don't init
        mov     DWORD PTR [rbp-28], 999         ; outbox - ignore
.L3:
        mov     rax, QWORD PTR [rbp-120]        ; input_array
        mov     eax, DWORD PTR [rax]            ; pull one from inbox

        test    eax, eax                        ; jump if zero, to .L2
        je      .L2

        ; floor[i] = *input_array;
        mov     rax, QWORD PTR [rbp-120]        ; inbox item already in hand
        mov     edx, DWORD PTR [rax]
        mov     eax, DWORD PTR [rbp-4]          ; [i]
        cdqe
        mov     DWORD PTR [rbp-112+rax*4], edx  ; copy to floor[i]

        add     QWORD PTR [rbp-120], 4          ; ignore, want next inbox item
        add     DWORD PTR [rbp-4], 1            ; ++i
        jmp     .L3
.L2:
        ; floor[i] = 0
        mov     eax, DWORD PTR [rbp-4]          ; i
        cdqe
        mov     DWORD PTR [rbp-112+rax*4], 0    ; floor[i] = 0

        mov     eax, DWORD PTR [rbp-4]          ; copyfrom i
        mov     DWORD PTR [rbp-16], eax         ; end_index = i

        sub     DWORD PTR [rbp-16], 2           ; end_index -= 2
.L9:
        cmp     DWORD PTR [rbp-8], 0            ; num_swaps
        je      .L4

        mov     eax, DWORD PTR [rbp-12]         ; copyfrom ZERO
        mov     DWORD PTR [rbp-8], eax          ; num_swaps = 0

        mov     eax, DWORD PTR [rbp-16]         ; copyfrom end_index
        mov     DWORD PTR [rbp-4], eax          ; i = end_index
.L8:
        cmp     DWORD PTR [rbp-4], 0            ; i : implicitly held
        js      .L9                             ; jump if signed : i<0

        mov     eax, DWORD PTR [rbp-4]          ; i
        cdqe
        mov     eax, DWORD PTR [rbp-112+rax*4]  ; copyfrom floor[i]
        mov     DWORD PTR [rbp-20], eax         ; a = floor[i]

        add     DWORD PTR [rbp-4], 1
        mov     eax, DWORD PTR [rbp-4]          ; ++i

        cdqe
        mov     eax, DWORD PTR [rbp-112+rax*4]
        mov     DWORD PTR [rbp-24], eax         ; b = floor[i]

        mov     eax, DWORD PTR [rbp-24]         ; b held
        sub     eax, DWORD PTR [rbp-20]         ; b - a
        test    eax, eax
        js      .L6
        sub     DWORD PTR [rbp-4], 1            ; --i
        jmp     .L7
.L6:
        mov     eax, DWORD PTR [rbp-4]          ; i
        cdqe
        mov     edx, DWORD PTR [rbp-20]         ; copyfrom a
        mov     DWORD PTR [rbp-112+rax*4], edx  ; floor[i] = a

        sub     DWORD PTR [rbp-4], 1            ; --i

        mov     eax, DWORD PTR [rbp-4]          ; i
        cdqe
        mov     edx, DWORD PTR [rbp-24]         ; copyfrom b
        mov     DWORD PTR [rbp-112+rax*4], edx  ; floor[i] = b

        add     DWORD PTR [rbp-8], 1            ; ++num_swaps
.L7:
        sub     DWORD PTR [rbp-4], 1            ; --i
        jmp     .L8
.L4:
        mov     eax, DWORD PTR [rbp-12]         ; copyfrom ZERO
        mov     DWORD PTR [rbp-4], eax          ; i=0
.L11:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR [rbp-112+rax*4]
        test    eax, eax
        je      .L12                            ; break if floor[i]==0

        mov     eax, DWORD PTR [rbp-4]          ; i
        cdqe
        mov     eax, DWORD PTR [rbp-112+rax*4]
        mov     DWORD PTR [rbp-28], eax         ; put floor[i] into outbox

        add     DWORD PTR [rbp-4], 1            ; ++i
        jmp     .L11
.L12:
        nop
        pop     rbp
        ret
