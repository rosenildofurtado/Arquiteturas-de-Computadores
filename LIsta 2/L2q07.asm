.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0
	
	addi $10, $0, 4 # constante 4
	addi $11, $0, 100 # constante 100
	addi $12, $0, 400 # constante 400
	addi $4, $0, 'N' # constante N
	div $8, $10
	mfhi $9
	
se:	bne $9, $0, fim # não é divisivel por 4?
	addi $4, $0, 'S' # constante S
	div $8, $11
	mfhi $9
senaoSe: bne $9, $0, fim # não é divisivel por 100?
	div $8, $12
	mfhi $9
senao:	beq $9, $0, fim # é divisivel por 400?
	addi $4, $0, 'N' # constante N
fim: 	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall