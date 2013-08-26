.data

str:
  .ascii "the ans is = "
  .text
  addiu $2, $0, 4
  lui $1, 4097
  ori $4, $1, 0
  syscall
  addiu $2, $0, 1
  addiu $4, $0, 5
  syscall
