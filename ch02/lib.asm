global exit, string_length, print_string, print_char

section .text 

exit:
	mov rax, 0x3C
	syscall
	ret

string_length:
	xor	rax,	rax
.loop:
	cmp	byte[rdi+rax], 0x0
	je	.end
	inc	rax
	jmp	.loop
.end:
	ret

print_string:
	call string_length
	mov	rsi,	rdi
	mov	rdx,	rax
	mov	rdi,	0x1
	mov	rax, 	0x1
	syscall
	ret
	
	
print_char:
	push 	rdi
	mov	rdi,	rsp
	call print_string
	pop	rdi
	ret

print_newline:
	push	rdi
	mov	rdi,	rsp
	call print_char
	pop	rdi
	ret

print_uint: 
	mov rax, rdi
	mov rdi, rsp
	push 0
	sub rsp, 16
	dec rdi
	mov r8, 10
.loop:
	xor rdx, rdx
	div r8
   	or dl, 0x30
	dec rdi
	mov [rdi], dl
	test rax, rax
	jnz .loop
	
	call print_string
	add rsp, 24
	ret
print_int:
	test rdi, rdi
	jns   print_uint
	push rdi
	mov rdi, '-'
	call print_char
	pop rdi
	neg rdi
	jmp print_uint
	

