	bits 64
	global strcasecmp:function

	section .text
strcasecmp:
	jmp loop_compter

check_lower:
	cmp al, 90
	jg loop_cmp_bl
	add al, 32
	jmp loop_cmp_bl

check_lower_bl:
	cmp bl, 90
	jg cmp
	add bl, 32
	jmp cmp

loop_compter:
	mov al, [rdi]
	mov bl, [rsi]
	jmp loop_cmp

loop_cmp:	
	cmp al, 64
	jg check_lower
	jmp loop_cmp_bl
	
loop_cmp_bl:
	cmp bl, 64
	jg check_lower_bl	
	jmp cmp
	
cmp:
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
