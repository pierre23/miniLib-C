	bits 64
	global strstr:function

	section .text
strstr:
	mov bl, [rsi]
	cmp bl, 0x0
	je ret_empty
	mov r10, rdi
	mov rdx, 0
	mov rcx, 0
	jmp loop_compter

bad_substr:
	mov rcx, 0
	jmp loop_compter
	
find_str:
	mov al, [rdi]
        mov bl, [rsi+rcx]
	cmp bl, 0
	je return_value
	cmp al, bl
	jne bad_substr
	inc rdi
	inc rcx
	jmp find_str
	
loop_compter:
	mov al, [rdi]
        mov bl, [rsi+rcx]
	cmp byte[rdi], 0x0
	je return_nil
	mov rdx, rdi
	cmp al, bl
	je find_str
	inc rdi
	jmp loop_compter

return_value:
	mov rax, rdx
	ret
return_nil:
	mov rax, 0x0
	ret

ret_empty:
	mov rax, rdi
	ret
