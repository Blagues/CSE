.global main

.text

input: .asciz "%ld"

main:
	pushq %rbp  		# push base pointer
	movq %rsp, %rbp  	# copy stack pointer to base pointer

	subq $8, %rsp  		# reserve stack space
	movq $0, %rax
	movq $input, %rdi 	# load arg1 for scanf
	leaq -8(%rbp), %rsi 	# reserve space for input
	call scanf

	movq -8(%rbp), %rdi	# move input string to rdi

	movq $0, %rax 		# no input in rax for printf
	call printf

	call exit

	# This shit doesn't work lmao
