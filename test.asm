.386
.model flat, stdcall

includelib libcmt.lib
includelib libvcruntime.lib
includelib libucrt.lib
includelib legacy_stdio_definitions.lib

; ExitProcess PROTO return:DWORD
extern printf:NEAR

.data
text BYTE "Hello world", 0

.code
main PROC C                    ; Specify "C" calling convention
    push offset text
    call printf
    add  esp, 4
;   invoke ExitProcess,0       ; Since the C library called main (this function)
                               ; we can set eax to 0 and use ret to have
                               ; the C runtime close down and return our error
                               ; code instead of invoking ExitProcess
    mov eax, 0
    ret
main ENDP
end 