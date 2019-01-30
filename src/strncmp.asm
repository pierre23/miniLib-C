	bits 64
	global strncmp:function

	section .text
strncmp:
	cmp rdx, 0
	je return_ncomp
	sub rdx, 1
	call loop_compter

loop_compter:
	mov al, [rdi]
	mov bl, [rsi]
	cmp rdx, 0
	je return_value
	cmp al, 0
	je return_value
	cmp bl, 0
	je return_value
	cmp al, bl
	jne return_value
	inc rdi
	dec rdx
	inc rsi
	jmp loop_compter

return_value:
	sub al, bl
	movsx rax, al
	ret

return_ncomp:
	mov rax, 0
	ret
