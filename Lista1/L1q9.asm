.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número de segundos digitado em $8
	addi $9, $0, 60 # Vai guardar o valor para divisão
	addi $10, $0, 3600 # Vai guardar o valor para a divisão
	addi $11, $0, ':' # Vai guardar o caracter :
	div $8,$10
	mflo $4
	addi $2, $0, 1
	syscall # imprime hora
	add $4, $0, $11
	addi $2, $0, 11
	syscall
	
	mfhi $12
	div $12,$9
	mflo $4
	addi $2, $0, 1
	syscall # imprime os minutos
	add $4, $0, $11
	addi $2, $0, 11
	syscall
	
	mfhi $4
	addi $2, $0, 1
	syscall # imprime os segundos
	
	addi $2, $0, 10
	syscall # encerra o programa
