.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0
	addi $2, $0, 5
	syscall
	add $9, $2, $0
	
	sub $11, $9, $8
	slt $10, $9, $8
	add $4, $9, $0
	beq $10, $0, maior
	add $4, $8, $0
	sub $11, $8, $9
maior: 	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	add $4, $11, $0
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall