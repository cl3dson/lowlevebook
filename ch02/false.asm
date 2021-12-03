section .text

global _start

_start:
	mov	rdi,	0x1
	mov	rax,	0x3c
	syscall
