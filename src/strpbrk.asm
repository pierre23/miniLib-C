	bits 64
	global strpbrk:function

	section .text
strpbrk:
	mov rcx, 0
	jmp loop_compter

bad_substr:
	mov rcx, 0
	inc rdi
	jmp loop_compter
	
find_str:
	mov al, [rdi]
        mov bl, [rsi+rcx]
	cmp bl, 0
	je bad_substr
	cmp al, bl
	je return_value
	inc rcx
	jmp find_str
	
loop_compter:
	mov al, [rdi]
        mov bl, [rsi+rcx]
	cmp byte[rdi], 0x0
	je return_nil
	jmp find_str

return_value:
	mov rax, rdi
	ret
return_nil:
	mov rax, 0x0
	ret
