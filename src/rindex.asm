	bits 64
	global rindex:function

	extern strlen

	section .text
	
rindex:
	mov rcx, 0x0
	jmp loop_compter

change_value:
	mov rcx, rdi
	inc rdi
	jmp loop_compter
	
loop_compter:
	cmp byte[rdi], 0
	je return_value
	cmp byte[rdi], sil
	je change_value
	inc rdi
	jmp loop_compter

return_value:
	mov rax, rcx
	ret
