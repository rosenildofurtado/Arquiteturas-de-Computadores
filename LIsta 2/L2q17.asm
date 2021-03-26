.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o numero do pais
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # Guarda o numero da empresa
	addi $2, $0, 5
	syscall
	add $10, $0, $2 # Guarda o numero do produto
	addi $11, $0, 10000 # constante 10000
	addi $12, $0, 1000 # constante 1000
	addi $13, $0, 100 # constante 100
	addi $14, $0, 10 # constante 10
	
	
pais:	div $8, $13
	mflo $15 # guarda o algarismo
	mfhi $8
	add $25, $25, $15 # variavel soma
	div $8, $14
	mflo $16 # guarda o algarismo
	sll $17, $16, 1
	add $17, $17, $16 
	add $25, $25, $17 # variavel soma
	mfhi $18
	add $25, $25, $18 # variavel soma
	
empresa: div $9, $11
	mflo $15 # guarda o algarismo
	mfhi $9
	sll $16, $15, 1
	add $16, $16, $15 
	add $25, $25, $16 # variavel soma
	
	div $9, $12
	mflo $15 # guarda o algarismo
	mfhi $9
	add $25, $25, $15 # variavel soma
	
	div $9, $13
	mflo $15 # guarda o algarismo
	mfhi $9
	sll $16, $15, 1
	add $16, $16, $15 
	add $25, $25, $16 # variavel soma
	
	div $9, $14
	mflo $15 # guarda o algarismo
	mfhi $9
	add $25, $25, $15 # variavel soma
	
	sll $16, $9, 1
	add $16, $16, $9 
	add $25, $25, $16 # variavel soma
	
produto: div $10, $12
	mflo $15 # guarda o algarismo
	mfhi $10
	add $25, $25, $15 # variavel soma
	
	div $10, $13
	mflo $15 # guarda o algarismo
	mfhi $10
	sll $16, $15, 1
	add $16, $16, $15 
	add $25, $25, $16 # variavel soma
	
	div $10, $14
	mflo $15 # guarda o algarismo
	mfhi $10
	add $25, $25, $15 # variavel soma
	
	sll $16, $10, 1
	add $16, $16, $10 
	add $25, $25, $16 # variavel soma
	
	div $25, $14
	mfhi $4
	beq $4, $0, impD
	sub $4, $14, $4
	
impD:	addi $2, $0, 1
	syscall
		
fim:	addi $2, $0, 10
	syscall
