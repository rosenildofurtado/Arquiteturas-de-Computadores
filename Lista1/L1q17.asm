.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	addi $9, $0, 1 # Guarda 1
	
	add $10, $8, $2 # soma os dois números
	
	srl $4, $10, 1 # divide por 2 (Divisão inteira)
	addi $2, $0, 1
	syscall
	
virgula:addi $4, $0, ','
	addi $2, $0, 11
	syscall	# imprime a virgula
	
  and $11, $10, $9 # obtem 0 ou 1
	sll $12, $11, 1
	sll $13, $11, 3
	add $14, $12, $13 # multiplipa por 10
	srl $4, $14, 1
	
decimo:	addi $2, $0, 1
	syscall 
	
	
	addi $2, $0, 10
	syscall
