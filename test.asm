.386
.model flat, stdcall

includelib libcmt.lib
includelib libvcruntime.lib
includelib libucrt.lib
includelib legacy_stdio_definitions.lib

; ExitProcess PROTO return:DWORD
extern printf:NEAR
extern scanf:NEAR

.data
input_format BYTE "%d",0
text BYTE "You entered: %d", 0
integer DWORD ?

.code
main PROC C                    ; Specify "C" calling convention
	push offset input_format
	push offset integer
	call scanf
	add esp,8

	push offset integer
    push offset text
	call printf
    add  esp,8
;   invoke ExitProcess,0       ; Since the C library called main (this function)
                               ; we can set eax to 0 and use ret to have
                               ; the C runtime close down and return our error
                               ; code instead of invoking ExitProcess
    mov eax, 0
    ret
main ENDP
end 