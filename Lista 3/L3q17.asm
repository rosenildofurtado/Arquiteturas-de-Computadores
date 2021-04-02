.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # a
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # b
	mul $10, $8, $9 # a * b
	addi $11, $0, 100000
	addi $12, $0, 10
	addi $13, $0, 6
	
forA:	beq $13, $0, continue
	div $10, $11
	mflo $14
	mfhi $25
	bne $14, $0, continue #verifica quantos algarismos tem a * b
	div $11, $12
	mflo $11
	addi $13, $13, -1
	j forA

continue: addi $24, $0, 1
	beq $13, $24, sai
	beq $25, $0, reduz
	andi $15, $13, 1
	srl $16, $13, 1	
	
while:	beq $10, $0, sai
	addi $17, $10, 0
	addi $18, $11, 0
	addi $19, $0, 0
compara: beq $19, $16, sai
	div $17, $18
	mfhi $17
	mflo $20
	div $17, $12
	mflo $17
	mfhi $21
	bne $20, $21, prox
	addi $22, $0, 100
	div $18, $22
	mflo $18
	addi $19, $19, 1
	j compara
prox:	addi $10, $10, -1
	j while
reduz: 	addi $10, $10, -1
sai:	addi $4, $10, 0
	addi $2, $0, 1
	syscall
fim:	addi $2, $0, 10
	syscall
