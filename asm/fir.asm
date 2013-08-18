#Filtro FIR

.data
_s:.word 79000, 88000,  89000, 59000, 29000,38000 # constante para os 3 testes
_c:.word -9323,  7453, -6140,  8800, -8997,  8740 # teste 1
#_c:.word  9323,  7453,  6140,  8800,  8997,  8740 # teste 2          
#_c:.word -9323, -7453, -6140, -8800, -8997, -8740 # teste 3
_n:.word 6                             

.text
.globl main

main:

lw $t0,_n
la $t1,_s
la $t2,_c
addi $t4,$zero,0 	    # f=0
addi $t3,$zero,0            # i=0

loop:
  slt  $t8,$t3,$t0
  beq  $t8,$zero,saidaloop
  sll  $t5,$t3,2            # $t5=i*4
  move $t6,$t5              # $t6=$t5     
  add  $t5,$t5,$t1          # $t5=$t5+base[_s]
  add  $t6,$t6,$t2          # $t6=$t6+base[_c]
  lw   $t5,0($t5)           # $t5=lw 0($t5)
  lw   $t6,0($t6)           # $t6=lw 0($t6)
  mul  $t7,$t5,$t6          # $t7=$t5*t6
  add  $t4,$t4,$t7          # $t4=$t4+$t7 
  addi $t3,$t3,1            # $t3=$t3+1
  j loop

saidaloop:
  jr $ra