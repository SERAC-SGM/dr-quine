extern fopen
extern fclose
extern sprintf
extern fprintf
extern system
default rel
global main
section .data
	i dd 5
	sourcecode db "Sully_%d.s",0
	out_name db "Sully_",0
	s1 db "extern fopen%2$cextern fclose%2$cextern sprintf%2$cextern fprintf%2$cextern system%2$cdefault rel%2$cglobal main%2$csection .data%2$c	i dd %4$d%2$c	sourcecode db %3$cSully_%%d.s%3$c,0%2$c	out_name db %3$cSully_%3$c,0%2$c	s1 db %3$c%1$s%3$c,0%2$c	mode db %3$cw%3$c,0%2$c	command db %3$cnasm -f elf64 -D DECR %%1$s%%2$d.s -o %%1$s%%2$d.o; gcc %%1$s%%2$d.o -o %%1$s%%2$d; ./%%1$s%%2$d%3$c,0%2$csection .bss%2$c	filename resb 64%2$c	cmd_buffer resb 128%2$c	file resq 1%2$csection .text%2$cmain:%2$c	push rbp%2$c	mov rbp, rsp%2$c	sub rsp, 16%2$c	cmp dword [i],0%2$c	jle .return_zero%2$c	%%ifdef DECR%2$c		sub dword [i], 1%2$c	%%endif%2$c	lea rdi, [rel filename]%2$c	lea rsi, [rel sourcecode]%2$c	mov edx, [i]%2$c	xor eax, eax%2$c	call sprintf%2$c	lea rdi, [rel filename]%2$c	lea rsi, [rel mode]%2$c	xor eax, eax%2$c	call fopen%2$c	mov [file], rax%2$c	mov rdi, [file]%2$c	lea rsi, [rel s1]%2$c	lea rdx, [rel s1]%2$c	mov rcx, 10%2$c	mov r8, 34%2$c	mov r9d, [i]%2$c	xor eax, eax%2$c	call fprintf%2$c	mov rdi, [file]%2$c	call fclose%2$c	lea rdi, [rel cmd_buffer]%2$c	lea rsi, [rel command]%2$c	lea rdx, [rel out_name]%2$c	mov ecx, [i]%2$c	xor eax, eax%2$c	call sprintf%2$c	lea rdi, [rel cmd_buffer]%2$c	call system%2$c.return_zero:%2$c	xor eax, eax%2$c	mov rsp, rbp%2$c	pop rbp%2$c	ret%2$c",0
	mode db "w",0
	command db "nasm -f elf64 -D DECR %1$s%2$d.s -o %1$s%2$d.o; gcc %1$s%2$d.o -o %1$s%2$d; ./%1$s%2$d",0
section .bss
	filename resb 64
	cmd_buffer resb 128
	file resq 1
section .text
main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	cmp dword [i],0
	jle .return_zero
	%ifdef DECR
		sub dword [i], 1
	%endif
	lea rdi, [rel filename]
	lea rsi, [rel sourcecode]
	mov edx, [i]
	xor eax, eax
	call sprintf
	lea rdi, [rel filename]
	lea rsi, [rel mode]
	xor eax, eax
	call fopen
	mov [file], rax
	mov rdi, [file]
	lea rsi, [rel s1]
	lea rdx, [rel s1]
	mov rcx, 10
	mov r8, 34
	mov r9d, [i]
	xor eax, eax
	call fprintf
	mov rdi, [file]
	call fclose
	lea rdi, [rel cmd_buffer]
	lea rsi, [rel command]
	lea rdx, [rel out_name]
	mov ecx, [i]
	xor eax, eax
	call sprintf
	lea rdi, [rel cmd_buffer]
	call system
.return_zero:
	xor eax, eax
	mov rsp, rbp
	pop rbp
	ret
