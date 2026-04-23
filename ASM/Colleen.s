extern printf
global main
;outside entry point
section .data
	s1 db "extern printf%2$cglobal main%2$c;outside entry point%2$csection .data%2$c%3$cs1 db %4$c%s%4$c, 0%2$csection .text%2$cmain:%2$c;inside entry point%2$c%3$clea rdi, [rel s1]%2$c%3$clea rsi, [rel s1]%2$c%3$cmov rdx, 10%2$c%3$cmov rcx, 9%2$c%3$cmov r8, 34%2$c%3$cxor eax, eax%2$c%3$ccall printf%2$c%3$cxor eax, eax%2$c%3$cret%2$c", 0
section .text
main:
;inside entry point
	lea rdi, [rel s1]
	lea rsi, [rel s1]
	mov rdx, 10
	mov rcx, 9
	mov r8, 34
	xor eax, eax
	call printf
	xor eax, eax
	ret
