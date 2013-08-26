.data
n: .word 2		# valor atribuido a n para calcular n!
new: .asciiz "\n"
str: .asciiz "! = "	# string a ser impresso no console
.text

.globl main

main:
   # inicializacao do argumento com o valor atribuido a n
   lw   $a0,n        	

   # salvamento de contexto da rotina main		
   addi $sp,$sp,-4	
   sw   $ra,0($sp)	# endereco para onde se deve retornar ao termino de main

   # invocacao da rotina que calcula o fatorial
   jal  fact		

   # impressao do resultado no consoole
   move $t0,$v0		# move o valor retornado para um temporario
   lw   $a0,n		# imprime o valor de n 
   jal  print_int
   la   $a0,str		# imprime o string
   jal  print_str
   move $a0,$t0		# imprime o valor de n!
   jal  print_int

   # restauracao de contexto da rotina main
   lw   $ra,0($sp)	# endereco de retorno
   addi $sp,$sp,4 

   # retorno da rotina main
   jr   $ra  	
	
fact:   
   # salvamento de contexto da rotina fact
   ...
   
   # teste do valor de n
   ...

   # CASO DEGENERADO: n! = 1, se n < 1
   ... 	

   # restauracao de contexto da rotina fact (caso degenerado)
   ...  		

   # retorno da rotina fact (no caso degenerado)
   ...       

L1:
   # CASO REGULAR: calculo de n! = n.(n-1)!

   # calculo de (n-1)!
   ...  	      
   
   # restauracao de contexto da rotina fact (caso regular)
   ...
   
   # calculo de n.(n-1)!
   ...

   # retorno da rotina fact (no caso degenerado)
   ...

# rotina para impressao de inteiro
print_int:          # $a0 = inteiro a imprimir
  li $v0,1          # syscall para imprimir um inteiro
  syscall           # imprime o valor 
  jr $ra            # retorna para a funcao chamadora

#rotina para impresssao de string
print_str:          # $a0 = endereco do string a imprimir
  li $v0,4          # syscall para imprimir um string
  syscall           # imprime o string str
  jr $ra            # retorna para a funcao chamadora
