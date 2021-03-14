.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 10 # constante 10
	addi $10, $0, 0 # Váriavel soma
	div $8, $9
	mfhi $4
	addi $2, $0, 1
	syscall # imprime a unidade
	mflo $8
	div $8, $9
	mfhi $4
	addi $2, $0, 1
	syscall # imprime a dezena
	mflo $8
	div $8, $9
	mfhi $4
	addi $2, $0, 1
	syscall # imprime a centena
	addi $2, $0, 10
	syscall
