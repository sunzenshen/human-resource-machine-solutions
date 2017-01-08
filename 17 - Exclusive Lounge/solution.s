Exclusive_Lounge(int, int):
        push    rbp
        mov     rbp, rsp
        mov     DWORD PTR [rbp-4], edi  ; _0 where '_' implies floor
        ; inbox
        ; copyto 0
        mov     DWORD PTR [rbp-8], esi  ; _1 arg not used again,
                                        ; directly hold from inbox

        cmp     DWORD PTR [rbp-8], 0    ; _1 already in hand
        js      .L2                     ; jump if negative

        cmp     DWORD PTR [rbp-4], 0    ; grab _0 from floor
        js      .L3                     ; jump if negative

        mov     eax, 0                  ; _4 = 0
        jmp     .L4
.L3:
        mov     eax, 1                  ; _5 = 1
        jmp     .L4
.L2:
        cmp     DWORD PTR [rbp-4], 0    ; _0
        js      .L5                     ; JIN .L5

        mov     eax, 1                  ; _5
        jmp     .L4
.L5:
        mov     eax, 0                  ; _4
.L4:
        pop     rbp                     ; outbox
        ret                             ; jump to beginning
