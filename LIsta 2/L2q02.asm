.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0
	slt $10, $8, $0
	sll $4, $8, 1
	beq $10, $0, fim
	mul $4, $8, $8
fim: 	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall