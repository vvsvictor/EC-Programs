func:
  #Section a
  li $t0, 1 #i
  la $t1, N
  lw $t1, 0($t1) #N
loop:
  bge $t0, $t1, end
  la $t2, vecchar #$t2 = &vecchar
  addu $t2, $t2, $t0
  subu $t3, $t1, $t0
  lw $t3, 0($t2)
  addiu $t0, $t0, 2
  b loop
end:

  #Section b
  move $t0, $zero
  la $t1, N
  lw $t1, 0 ($t1)
  la $t2, matint
loop2:
  bge $t0, $t1, end2
  sw $zero, 0($t2)
  addiu $t2, $t2, 4
  addiu $t0, $t0, 1
  b loop2
end2:

  #Section c
  li $t0, 4
  la $t1, N
  lw $t1, 0($t1) #N
  la $t3, matint # & matint
  li $t2, 3
  mult $t1, $t2
  mflo $t2 # 3*N
  addu $t2, $t2, $t0
  sll $t2, $t2, 2
  addu $t2, $t2, $t3 # $t2 = & matint [3][i]
while:
  lw $t4, 0($t2) # $t4 = matint [3][i]
  beq $t4, $zero, end3
  addiu $t4, $t4, -1
  sw $t4, 0($t2)
  addiu $t0, $t0, 3
  b while
end3:

  #Section d
  la $t1, N
  lw $t1, 0($t1) #N
  addiu $t0, $t1, -1
  la $t2, matlong
loop4:
  blt $t0, $zero, end4
  mult $t0, $t1
  mflo $t3
  addiu $t3, $t3, 4
  sll $t3, $t3, 3
  addiu $t3, $t3, $t2
  sw $t0, 0($t3) #matlong[i][4] = i
  addiu $t0, $t0, -1
  b loop4
end4:
