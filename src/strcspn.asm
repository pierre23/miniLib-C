	bits 64
	global strcspn:function

	section .text
strcspn:
	mov rdx, 0
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
	inc rdx
	jmp find_str

return_value:
	sub rdx, 1
	mov rax, rdx
	ret

return_nil:
	mov rax, rdx
        ret
