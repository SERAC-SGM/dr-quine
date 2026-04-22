section .data
	s1 db "section .data",10,9,"s1 db ",34,"hello world!",34,10,9,"len equ $-s1",10,10,"section .text",10,9,"global _start",10,10,"_start:",10,9,"mov rax, 1",10,9,"mov rdi, 1",10,9,"mov rsi, s1",10,9,"mov rdx, len",10,9,"syscall",10,10,9,"mov rax, 60",10,9,"xor rdi, rdi",10,9,"syscall",10
	len equ $-s1

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, s1
	mov rdx, len
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
