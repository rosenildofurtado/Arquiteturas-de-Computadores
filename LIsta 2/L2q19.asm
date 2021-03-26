.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o numero do pais
	addi $9, $0, 10 # constante 10
	addi $10, $0, 1 # constante 1
		
if:	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
	beq $8, $0, endif
	div $8, $9
	mflo $8
	mfhi $11
	mul $12, $11, $10
	add $4, $4, $12
	sll $10, $10, 1
	
endif:	addi $2, $0, 1
	syscall
		
fim:	addi $2, $0, 10
	syscall
