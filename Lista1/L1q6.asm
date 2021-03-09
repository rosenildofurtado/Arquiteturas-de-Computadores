.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 100 # constante 100
	addi $10, $0, 10 # constante 10
	div $8, $9
	mfhi $8
	mflo $4
	addi $2, $0, 1
	syscall
	div $8, $10
	mfhi $8
	mflo $4
	addi $2, $0, 1
	syscall
	mfhi $4
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall