.text
main: 	addi $2, $0, 12
	syscall # lê o caracter
	subi $4, $2, 32 # subtrai por 32 para obter o equivalente maiúsculo
	addi $2, $0, 11 # imprimi o caracter
	syscall
	addi $2, $0, 10
	syscall # encerra o programa
