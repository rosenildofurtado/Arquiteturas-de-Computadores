.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0 # dia
	addi $2, $0, 5
	syscall
	add $9, $2, $0 # mes
	addi $2, $0, 5
	syscall
	add $10, $2, $0 # ano
	addi $11, $0, 3 # constante 3
	addi $12, $0, 5 # constante 5
	add $13, $8, $9
	add $13, $13, $10 # somou os três números
div:	div $13, $11
	mfhi $14
	mflo $4
	addi $2, $0, 1
	syscall
	addi $4, $0, ','
	addi $2, $0, 11
	syscall		# imprime a parte inteira com a vírgula
	
	addi $15, $0, 10
	mul $17, $14, $15
	div $17, $11
	mflo $4
	
se:	slt $18, $4, $12
	bne $18, $0, fim
	addi $4, $4, 1
fim:	addi $2, $0, 1
	syscall

	addi $2, $0, 10
	syscall
