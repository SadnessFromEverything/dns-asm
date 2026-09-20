%include "sup_macros.asm"

default rel

extern _error_exit_unrecognized

section .rodata

banner_msg      db  "dnsd v0.0.1 - Martin Bilka", 0x0A
banner_msg_len  equ $ - banner_msg

help_msg        db  "dnsd - authoritative DNS server", 0x0A
                db  "Usage: dnsd [-p PORT] [-h]", 0x0A
                db  "    -p PORT    listen on PORT (default: 5353)", 0x0A
                db  "    -h         print this help message and exit", 0x0A
help_msg_len    equ $ - help_msg

flag_h          db  "-h", 0x00
flag_p          db  "-p", 0x00

section .text
global _start

_start:
    ; argc is at [rsp]
    mov     rcx, [rsp]
    cmp     rcx, 1
    ja      _check_cli_args         ; more than 1 arg -> validate
    jmp     _error_exit_unrecognized

_check_cli_args:
    mov     rsi, [rsp + 16]         ; argv[1] (pointer to string)
    mov     rdi, flag_h
    mov     rcx, 3                  ; "-h\0"
    cld
    repe cmpsb
    je      _display_help_msg

    ; not -h; try -p
    mov     rsi, [rsp + 16]
    mov     rdi, flag_p
    mov     rcx, 3
    cld
    repe cmpsb
    je      _handle_p               ; -p handled in a later weekend

    jmp     _error_exit_unrecognized

_display_help_msg:
    system_write_to_stdout banner_msg, banner_msg_len
    system_write_to_stdout help_msg, help_msg_len
    system_exit 0

_handle_p:
    ; Weekend 2+: parse the port number at argv[2].
    ; For now: not implemented.
    jmp     _error_exit_unrecognized