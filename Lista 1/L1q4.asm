.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	addi $9, $0, 5 # Guarda 5
	
	sll $10, $8, 1 # primeira nota com peso 2
	sll $11, $2, 1
	add $11, $11, $2 # segunda nota com peso 3
	add $12, $10, $11 # soma os duas notas com os pesos
divide:	div $12, $9
	mflo $4
	addi $2, $0, 1
	syscall
	
virgula:addi $4, $0, ','
	addi $2, $0, 11
	syscall	# imprime a virgula
	
	mfhi $13
	sll $12, $13, 1
	sll $13, $13, 3
	add $14, $12, $13 # multiplipa por 10
	div $14, $9
	mflo $4
decimo:	addi $2, $0, 1
	syscall 
		
	addi $2, $0, 10
	syscall
