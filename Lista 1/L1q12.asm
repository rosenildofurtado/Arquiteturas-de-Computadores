.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o n�mero n1 digitado em $8
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # Guarda o n�mero n2 digitado em $9
	addi $2, $0, 5
	syscall
	add $10, $0, $2 # Guarda o n�mero n3 digitado em $10
	
	sll $11, $8, 1
	add $11, $11, $8 # t� multiplicado por 3 nesse ponto
	sll $12, $9, 3
	add $12, $12, $9 # t� multiplicado por 9 nesse ponto
	sll $13, $10, 4
	sub $13, $13, $10 # t� multiplicado por 15 nesse ponto
	
soma:	add $14, $12, $11 # V�riavel soma 
	add $14, $14, $13 # V�riavel soma 
	addi $15, $0, 27 # V�riavel soma dos pesos
	
divide:	div $14, $15 
	mflo $4
	addi $2, $0, 1
	syscall
	
virgula:addi $4, $0, ','
	addi $2, $0, 11
	syscall	# imprime a virgula
	
decimo:	mfhi $16
	addi $17, $0, 10
	mult $16, $17 # multiplica por 10
	mflo $18
	div $18, $15
	mflo $4
	addi $2, $0, 1
	syscall # imprimi uma casa decimal sem arredondamento
	
	addi $2, $0, 10 
	syscall # encerra o programa
