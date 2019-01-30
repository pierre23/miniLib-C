	bits 64
	global strcmp:function

	section .text
strcmp:
	call loop_compter

loop_compter:
	mov al, [rdi]
	mov bl, [rsi]
	cmp al, 0
	je return_value
	cmp bl, 0
	je return_value
	cmp al, bl
	jne return_value
	inc rdi
	inc rsi
	jmp loop_compter

return_value:
	sub al, bl
	movsx rax, al
	ret
