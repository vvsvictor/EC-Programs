#SECTION A
#First solution
	move $t0, $zero	
	la $t3, N #&N
	lw $t3, 0($t3) # N
loop:
	bge $t0, $t3, end
	li $t4, 3
	mult $t3, $t4
	mflo $t4
	addu $t4, $t4, $t0
	sll $t4, $t4, 2
	addu $t4, $t4, $a0
	lw $t4, 0($t4)
	addu $t2, $t2, $t4
	addiu $t0, $t0, 1
	b loop
end:

#SECTION B
#First solution 
	move $t0, $zero
 	la $t3, N
	lw $t3,0($t3)
loop:
	bge $t0, $t3, end
	mult $t0, $t3
	mflo $t4
	addiu 
