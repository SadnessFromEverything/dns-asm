%include "sup_macros.asm"

default rel

global _error_exit_unrecognized

section .rodata
error_msg       db  "dnsd: unrecognized argument. Try 'dnsd -h' for usage.", 0x0A
error_msg_len   equ $ - error_msg

section .text

; _error_exit_unrecognized
; Prints an error message and exits with code 1.
_error_exit_unrecognized:
    system_write_to_stdout error_msg, error_msg_len
    system_exit 1