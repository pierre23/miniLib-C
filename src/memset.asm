	bits 64
	global memset:function

	section .text
memset:
	xor rcx, rcx
	call loop_compter

loop_compter:
	cmp rcx, rdx
	je return_value
	mov [rdi+rcx], sil
	inc rcx
	jmp loop_compter

return_value:
	mov rax, rdi
	ret
