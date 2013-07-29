.data
fibs:.word 0:19
size: .word 19
prompt: .asciiz
.text
	la $s0, fibs
	la $s5, size
	lw $s5, 0($s5)

pr:
	la $a0, prompt
	li $v0, 4
	syscall
	li $v0, 100
	syscall
	bgt $v0, $s5, pr
	blt $v0, $zero, pr
	add $s5, $v0, $zero