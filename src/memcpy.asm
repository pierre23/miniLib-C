	bits 64
	global memcpy:function

	section .text
memcpy:
	xor rcx, rcx

loop_compter:
	cmp rcx, rdx
	je return_value
	mov al, [rsi]
	mov [rdi+rcx], al
	inc rsi
	inc rcx
	jmp loop_compter

return_value:
	mov rax, rdi
	ret
