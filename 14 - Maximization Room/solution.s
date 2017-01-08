Maximization_Room(int, int):
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi  ; _0
        mov     DWORD PTR [rbp-8], esi  ; _1

        mov     eax, DWORD PTR [rbp-8]  ; _1 ignore, already in hand
        sub     eax, DWORD PTR [rbp-4]  ; _0

        test    eax, eax
        js      .L2                     ; jump if negative

        mov     eax, DWORD PTR [rbp-8]  ; _1
        jmp     .L4
.L2:
        mov     eax, DWORD PTR [rbp-4]  ; _0
.L4:
        pop     rbp                     ; outbox
        ret
