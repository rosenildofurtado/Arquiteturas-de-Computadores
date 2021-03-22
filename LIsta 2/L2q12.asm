.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0 # n1
	addi $2, $0, 5
	syscall
	add $9, $2, $0 # n2
	addi $2, $0, 5
	syscall
	add $10, $2, $0 # faltas
	addi $11, $0, 3 # constante 3
	addi $12, $0, 10 # constante 10
	addi $13, $0, 5 # constante 5
	
	sll $14, $8, 1 # primeira nota com peso 2
	sll $15, $9, 1
	add $15, $15, $9 # segunda nota com peso 3
	add $16, $14, $15 # soma as duas notas com os pesos
divide:	div $16, $13
	mflo $4
	addi $24, $4, 0 # media final
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	
	addi $17, $0, 0 # penalidade
	slt $18, $10, $13
	bne $18, $0, fim
	div $10, $13
	mflo $19
	mul $17, $19, $12
	sub $24, $24, $17

fim:	addi $4, $17, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	addi $4, $24, 0
	addi $2, $0, 1
	syscall
		
	addi $2, $0, 10
	syscall
