# b > !a -->overflow
not $t3, $t1
addiu $t3, $t3, $t2
srl $t3, $t3, 31
not $t3, $t3

#Better
nor $t0, $zero, $t1
sgtu $t3, $t3, $t0
