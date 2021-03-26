.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o numero de i
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # Guarda o numero de j
	addi $2, $0, 5
	syscall
	add $10, $0, $2 # Guarda o numero de m
		
if:	div $8, $10
	mfhi $11
	div $9, $10
	mfhi $12
	
	addi $4, $0, 'S'
	beq $11, $12, endif
	addi $4, $0, 'N'
	
endif:	addi $2, $0, 11
	syscall
	addi $4, $10, 0	
	addi $2, $0, 1
	syscall
		
fim:	addi $2, $0, 10
	syscall
