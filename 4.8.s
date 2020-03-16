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

#Second solution (more efficient)
	move $t0, $zero
	la $t3, N
	lw $t3, 0($t3)
	li $t4,3
	mult $t3, $t4
	mflo $t4
	sll $t4, $t4, 2
	addiu $t4, $t4, $a0
loop:
	bge $t0, $t3, end
	lw $t5, 0($t4)
	addu $t2,$t2, $t5
	addiu $t4, $t4, 4 #STRIDE
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
	addiu $t4, $t4, 4
	sll $t4, $t4, 2
	addu $t4, $t4, $a0
	lw $t4, 0($t4)
	addu $t2, $t2, $t4
	addiu $t0, $t0, 1
	b loop 
end:

#SECTION C
#First solution 
	la $t3, N
	lw $t3, 0($t3)
loop:	
	bge $t0, $t3, end
	addiu $t4, $t3, 1
	mul $t4, $t0
	mflo $t4, 
	sll $t4, $t4, 2
	addu $t4, $t4, $a0
	lw $t4,0($t4)
	addu $t2, $t2, $t4
	addiu $t0, $t0, 1
	b loop
end:

#SECTION D
#First Solution 
	la $t3, N
	lw $t3, 0($t3)
loop:
	bge $t0, $t3, end
	mult $t0, $t3
	mflo $t4
	addu $t4, $t4, $t3
	addiu $t4, $t4, -1
	subu $t4, $t4, $t0
	sll $t4,$t4, 2
	addu $t4, $t4, $a0
	lw $t4,0($t4)
	addu $t2, $t2, $t4
	addiu $t0, $t0, 4
	b loop
end:
 
