ReCoordinator(int):
        push    rbp
        mov     rbp, rsp
        ; optimization: init div_result to 0 here before inbox <<--------------<<-|
        mov     DWORD PTR [rbp-20], edi    ; _0 numerator from inbox              ^
                                           ;                                      |
        mov     DWORD PTR [rbp-8], 0       ; _14 = 0  | already initialized       |
        mov     DWORD PTR [rbp-12], 4      ; _15 = 4  | do not touch these two    |
                                           ;                                      ^
        ; optimization: init div_result before grabbing inbox  >>-------------->>-|
        mov     eax, DWORD PTR [rbp-8]     ; copyfrom _14=0 : do this before inbox
        mov     DWORD PTR [rbp-4], eax     ; copyto _1 (div_result)
        mov     DWORD PTR [rbp-16], 1337   ; ignore _2 (mod_result)
        ; end moved section
.L3:
        cmp     DWORD PTR [rbp-20], 0      ; _0 while on numerator : copyfrom _0
        js      .L2                        ; JIN

        add     DWORD PTR [rbp-4], 1       ; _1 (div_result) | bump+

        mov     eax, DWORD PTR [rbp-12]    ; _15 = 4
        sub     DWORD PTR [rbp-20], eax    ; copy from _0 first, then sub _15
        jmp     .L3                        ; don't forget to write to _0
.L2:
        ; we actually want to output the mod_result THEN the div_result
        sub     DWORD PTR [rbp-4], 1       ; _1 (div_result) outbox this SECOND >>-->>|
                                           ;                                          v
        mov     edx, DWORD PTR [rbp-20]    ; _0 numerator copyfrom                    |
        mov     eax, DWORD PTR [rbp-12]    ; _15          just add 4                  |
        add     eax, edx                   ; outbox this result          FIRST        |
        mov     DWORD PTR [rbp-16], eax    ; ignore _2 (mod_result) outboxed already  |
                                           ;                                          v
        ; outbox div_result now            ; <<-------------------------------------<<|

        nop                                ; back to beginning
        pop     rbp
        ret
