.data
number1: .quad 2
number2: .quad 3

.global main

.text
assignment_names:	.asciz "\n Assignment 1: Powers\n Kenzo Heijman\n Samuel ...\n kheijman@tudelft.nl\n ...\n"

main:
	#prologue
	pushq %rbp			# push base pointer
	movq %rsp, %rbp			# copy stack pointer to base pointer

	movq $0, %rax			# no vector registsers for printf
	movq $assignment_names, %rdi	# move names string to argument register for printf
	call printf			# call printf to print names

	movq number1, %rdi
	movq number2, %rsi

	call pow

	movq $0, %rdi
	movq $0, %rsi
	movq $0, %rax	
	movq $0, %r9
	
	call exit


	## function that cumputes the first argument to the power of the second
pow:
	pushq %rbp			# push base pointer
	movq %rsp, %rbp			# copy stack pointer

	movq %rdi, %rax	 		# move arg1 to rax (number)
	movq %rsi, %r9			# move exponent to r9

	mulq %rdi			# multiply rax with rdi

	dec %r9 			# decrement exponent with 1 

	movq $0, %rdi
	movq $0, %rsi

	#movq %rax, %rdi 		# move number to arg1
	#movq %r9, %rsi 		# move exp to arg2

	#cmpq $1, %r9  			# check if exponent is bigger than 1

	movq %rbp, %rsp
	popq %rbp

	#jg pow				# do pow again if exp is bigger than 1
