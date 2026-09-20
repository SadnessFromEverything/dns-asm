%ifndef SUP_MACROS_ASM
%define SUP_MACROS_ASM

; system_exit(exit_code)
; Terminates the process with the given exit code.
%macro system_exit 1
    mov     eax, 60             ; SYS_exit
    mov     edi, %1             ; exit code
    syscall
%endmacro

; system_write_to_stdout(ptr, len)
; Writes len bytes at ptr to stdout.
%macro system_write_to_stdout 2
    mov     eax, 1              ; SYS_write
    mov     edi, 1              ; fd 1 = stdout
    mov     rsi, %1             ; buffer address
    mov     rdx, %2             ; buffer length
    syscall
%endmacro

%endif