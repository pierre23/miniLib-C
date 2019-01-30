	bits 64
	global strlen:function

	section .text
strlen:
	xor rcx, rcx
	call loop_compter

loop_compter:
	cmp byte[rdi], 0x0
	je return_value
	inc rdi
	inc rcx
	jmp loop_compter

return_value:
	mov rax, rcx
	ret
