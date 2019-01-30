	bits 64
	global strchr:function

	section .text
strchr:
	call loop_compter

loop_compter:
	cmp byte[rdi], sil
	je return_value
	cmp byte[rdi], 0x0
	je return_nil
	inc rdi
	jmp loop_compter

return_value:
	mov rax, rdi
	ret
return_nil:
	mov rax, 0x0
	ret
