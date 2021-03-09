.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 10 # constante 10
	div $8, $9
	mfhi $4
	mflo $8
	addi $2, $0, 1
	syscall
pulaU:	addi $4, $0, '\n' # Pula linha
	addi $2, $0, 11
	syscall
	div $8, $9
	mfhi $4
	mflo $8
	addi $2, $0, 1
	syscall
pulaD:	addi $4, $0, '\n' # Pula linha
	addi $2, $0, 11
	syscall
	div $8, $9
	mfhi $4
	mflo $8
	addi $2, $0, 1
	syscall
pulaC:	addi $4, $0, '\n' # Pula linha
	addi $2, $0, 11
	syscall
	div $8, $9
	mfhi $4
	mflo $8
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
