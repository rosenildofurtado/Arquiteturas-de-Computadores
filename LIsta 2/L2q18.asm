.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o numero do pais
	addi $9, $0, 1 # constante 1
	
if:	beq $8, $0, endif
	and $25, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $24, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $23, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $22, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $21, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $20, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $19, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $18, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $17, $8, $9
	srl $8, $8, 1
	beq $8, $0, endif
	and $16, $8, $9
	srl $8, $8, 1
	
endif:	addi $4, $0, 0
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	addi $2, $0, 1
	syscall
	
	addi $4, $16, 0
	addi $2, $0, 1
	syscall
	addi $4, $17, 0
	addi $2, $0, 1
	syscall
	addi $4, $18, 0
	addi $2, $0, 1
	syscall
	addi $4, $19, 0
	addi $2, $0, 1
	syscall
	addi $4, $20, 0
	addi $2, $0, 1
	syscall
	addi $4, $21, 0
	addi $2, $0, 1
	syscall
	addi $4, $22, 0
	addi $2, $0, 1
	syscall
	addi $4, $23, 0
	addi $2, $0, 1
	syscall
	addi $4, $24, 0
	addi $2, $0, 1
	syscall
	addi $4, $25, 0
	addi $2, $0, 1
	syscall
		
fim:	addi $2, $0, 10
	syscall
