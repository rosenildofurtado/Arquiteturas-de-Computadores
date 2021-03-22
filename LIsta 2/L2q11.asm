.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0 # a
	addi $2, $0, 5
	syscall
	add $9, $2, $0 # b
	addi $2, $0, 5
	syscall
	add $10, $2, $0 # c
	addi $11, $0, 'N' # constante 'N'
	addi $25, $0, ' ' # constante ' '
	
	beq $8, $9, fim
	beq $10, $9, fim # testa se b=a ou b=c. Não formaria um pico
	slt $12, $8, $9
	slt $13, $9, $10
	add $14, $12, $13
	addi $15, $0, 1 # constante 1
	bne $14, $15, fim
	addi $11, $0, 'P' # constante 'P'
	addi $25, $0, '+' # constante '+'
se:	beq $12, $15, fim	
	addi $25, $0, '-' # constante '-'

fim:	addi $4, $11, 0
	addi $2, $0, 11
	syscall
	addi $4, $25, 0
	addi $2, $0, 11
	syscall

	addi $2, $0, 10
	syscall
