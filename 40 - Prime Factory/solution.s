Prime_Factory(int):
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-52], edi
        mov     DWORD PTR [rbp-20], 0
        mov     eax, DWORD PTR [rbp-20]
        add     eax, 2
        mov     DWORD PTR [rbp-24], eax
        mov     eax, DWORD PTR [rbp-24]
        mov     DWORD PTR [rbp-4], eax
        mov     DWORD PTR [rbp-28], 9999
        mov     eax, DWORD PTR [rbp-52]
        mov     DWORD PTR [rbp-8], eax
        mov     DWORD PTR [rbp-12], 2222
        mov     DWORD PTR [rbp-32], 2333
        mov     DWORD PTR [rbp-16], 2444
        mov     DWORD PTR [rbp-36], 2555
.L7:
        mov     eax, DWORD PTR [rbp-8]
        cmp     eax, DWORD PTR [rbp-4]
        je      .L2
        mov     eax, DWORD PTR [rbp-8]
        mov     DWORD PTR [rbp-12], eax
        mov     eax, DWORD PTR [rbp-4]
        mov     DWORD PTR [rbp-32], eax
        mov     DWORD PTR [rbp-16], 0
.L4:
        cmp     DWORD PTR [rbp-12], 0
        js      .L3
        add     DWORD PTR [rbp-16], 1
        mov     eax, DWORD PTR [rbp-32]
        sub     DWORD PTR [rbp-12], eax
        jmp     .L4
.L3:
        sub     DWORD PTR [rbp-16], 1
        mov     edx, DWORD PTR [rbp-12]
        mov     eax, DWORD PTR [rbp-32]
        add     eax, edx
        mov     DWORD PTR [rbp-36], eax
        cmp     DWORD PTR [rbp-36], 0
        je      .L5
        add     DWORD PTR [rbp-4], 1
        jmp     .L7
.L5:
        mov     eax, DWORD PTR [rbp-16]
        mov     DWORD PTR [rbp-8], eax
        mov     eax, DWORD PTR [rbp-4]
        mov     DWORD PTR [rbp-28], eax
        jmp     .L7
.L2:
        mov     eax, DWORD PTR [rbp-8]
        mov     DWORD PTR [rbp-28], eax
        nop
        pop     rbp
        ret
