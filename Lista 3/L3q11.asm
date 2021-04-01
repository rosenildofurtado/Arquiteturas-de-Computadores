.text	
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0 # n
	addi $9, $0, 11 # constante 11
	addi $10, $0, 13 # constante 13
	addi $11, $0, 17 # constante 17
	addi $8, $8, 1 
	
while:	beq $9, $0, sai
	div $8, $9
	mfhi $12
	beq $12, $0, sai
	div $8, $10
	mfhi $12
	beq $12, $0, sai
	div $8, $11
	mfhi $12
	beq $12, $0, sai
	addi $8, $8, 1
	j while
	
sai:	addi $4, $8, 0
	addi $2, $0, 1
	syscall
fim:	addi $2, $0, 10
	syscall
