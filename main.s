	
	.data
message:
	.ascii "Hello\n"
lenght = . - message   
	.text
	.type printInt, @function
	.type printString, @function
	.global _start

_start: 
	movq $1024,%rax
	call printInt
	movq $message,%rsi
	movq $lenght,%rdx
	call printString
	movq $60,%rax
	syscall
	nop


