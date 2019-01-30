	bits 64
	global memmove:function

	section .text
memmove:
	xor rcx, rcx
	sub rdx, 1
	cmp rdi, rsi
	jg loop_inv
	jmp call_loop

call_loop:
	add rdx, 1
	jmp loop
	
loop:
	cmp rdx, rcx
        je return_value
	mov al, [rsi+rcx]
	mov [rdi+rcx], al
	inc rcx
        jmp loop
	
loop_inv:	
	cmp rdx, -1
	je return_value
	mov al, [rsi+rdx]
	mov [rdi+rdx], al
	dec rdx
	jmp loop_inv

return_value:
	mov rax, rdi
	ret

return_nil:
	mov rax, 0
	ret
