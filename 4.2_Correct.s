func:
  ble $a1, $a2, fi_if #i < j --> fi_if
  li $t0, N
  mult $a2, $t0 #j * N
  mflo $t1 #$t1 = j * N
  addu $t1, $t1, $a1 # $t1= j*N + I
  sll $t1, $t1, 2 # $t1*= 4
  addu $t1, $t1, $a0 # $t1 = &mat[j][i]
  lw $t1, 0($t1) # t1 = mat[j][i]
  #@mat[i][j] = @mat + (i*N + j)*4
  mult $a1, $t0 # N * i
  mflo $t3 # t3 = N*i
  addu $t3, $t3, $a2 # t3 = N*i + j
  sll $t3, $t3, 2 # t33 *= 4
  addu $t3, $t3, $a0 #t3 = & mat[i][j]
  sw $t1, 0($t3) # mat[i][j] = mat [j][i]
fi_if:
  jr $ra
