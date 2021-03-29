.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 1 # constante 1
	and $10, $8, $9
	sub $4, $0, $10 # Faz 0 - x, onde x é 0 ou 1
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall
