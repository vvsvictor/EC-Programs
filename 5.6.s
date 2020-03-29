
addu $t0, $t1, $t2
#s = -s
not $t0, $t0 # !s
addiu $t0, $t0, 1
addiu $t3, $t1, $t0 # t3 = a-s (hauría de ser - (s>a) si no te overflow)
srl $t3, $t3, 31 # bit 31 a la posicó 1
addiu $t4, $t1, $t0 # t4 = b-s (hauría de ser - (s>b) si no te overflow)
srl $t4, $t4, 31 # bit 31 a la posició 1
#nandc
and $t3, $t4, $t3
not $t3, $t3
