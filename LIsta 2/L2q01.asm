.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0
	addi $2, $0, 5
	syscall
	add $4, $2, $0
	slt $10, $4, $8
	beq $10, $0, fim
	add $4, $8, $0
fim: 	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall
