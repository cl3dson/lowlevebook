section .data
string: 	db	"12345678", 0x0

global _start
section .text

str_len:
	xor 	rax,	rax

.loop:
	cmp	byte[rdi+rax],	0x0
	je	.end
	inc 	rax
	jmp	.loop

.end:
	ret

_start:
	mov	rdi,	string
	call	str_len
	mov	rdi,	rax
	mov	rax,	0x3c
	syscall
