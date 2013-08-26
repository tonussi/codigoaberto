.data

str:
	.ascii "the ans is = "
	.text
	li $v0, 4
	la $a0, str #addr of string to print
	syscall
	
	li $v0, 1
	li $a0, 5 #int to print
	syscall