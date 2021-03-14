.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 1 # constante 1
	and $4, $8, $9
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall

