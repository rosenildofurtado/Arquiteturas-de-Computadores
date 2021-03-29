.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 10 # constante 10
	addi $10, $0, 0 # Váriavel soma
	div $8, $9
	mfhi $4
	mflo $8
somaU:	add $10, $10, $4 # soma com a unidade
	div $8, $9
	mfhi $4
	mflo $8
somaD:	add $10, $10, $4 # soma com a dezena
	div $8, $9
	mfhi $4
	mflo $8
somaC:	add $10, $10, $4 # soma com a centena
	add $4, $10, $0
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall