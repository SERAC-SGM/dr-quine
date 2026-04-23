extern fopen
extern fprintf
global main
; yet another comment
%macro DATA 0
	s1 db "extern fopen%2$cextern fprintf%2$cglobal main%2$c; yet another comment%2$c%%macro DATA 0%2$c%4$cs1 db %3$c%1$s%3$c,0%2$c%4$cfilename db %3$cGrace_kid.s%3$c,0%2$c%4$cmode db %3$cw%3$c,0%2$c%%endmacro%2$c%%macro OPEN_FILE 0%2$c%4$clea rdi, [rel filename]%2$c%4$clea rsi, [rel mode]%2$c%4$cxor eax, eax%2$c%4$ccall fopen%2$c%%endmacro%2$c%%macro WRITE_TO_FILE 0%2$c%4$cmov rdi, rax%2$c%4$clea rsi, [rel s1]%2$c%4$clea rdx, [rel s1]%2$c%4$cmov rcx, 10%2$c%4$cmov r8, 34%2$c%4$cmov r9, 9%2$c%4$cxor eax, eax%2$c%4$ccall fprintf%2$c%%endmacro%2$csection .data%2$c%4$cDATA%2$csection .text%2$cmain:%2$c%4$cOPEN_FILE%2$c%4$cWRITE_TO_FILE%2$c%4$cxor eax, eax%2$c%4$cret%2$c",0
	filename db "Grace_kid.s",0
	mode db "w",0
%endmacro
%macro OPEN_FILE 0
	lea rdi, [rel filename]
	lea rsi, [rel mode]
	xor eax, eax
	call fopen
%endmacro
%macro WRITE_TO_FILE 0
	mov rdi, rax
	lea rsi, [rel s1]
	lea rdx, [rel s1]
	mov rcx, 10
	mov r8, 34
	mov r9, 9
	xor eax, eax
	call fprintf
%endmacro
section .data
	DATA
section .text
main:
	OPEN_FILE
	WRITE_TO_FILE
	xor eax, eax
	ret
