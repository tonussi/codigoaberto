# a instrucao lbu transfere o byte residente
# em um endereco de memoria para o byte 0 de
# um registrador e a instrucao sb transfere
# o byte 0 de um registrador para um endereco de memoria

# [byte 3][byte 2][byte 1][byte 0]
# [MSB   ][   -  ][  -   ][LSB   ]

# ATRIBUICAO DE UM VALOR DE 8 BITS
# PARA A POSICAO DE MEMORIA
# APONTADA POR $GP (0X81) E OUTRO
# VALOR DE 8 BITS PARA O REGISTRADOR $T1 (0XDC)

.text

.globl main

main:
	add $s0, $zero, $gp
	lbu $t0, 0($0)
	sb $t1, 1($s0)