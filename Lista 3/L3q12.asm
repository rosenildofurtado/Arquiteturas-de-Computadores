.text	
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0 # n
	addi $9, $0, 0 # fb1
	addi $10, $0, 1 # fb2
	addi $11, $0, 0 # soma
	addi $12, $0, 0 # contador
	
	beq $8, $12, fim 
	add $4, $9, $0
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $12, $12, 1 # contador
	
	beq $8, $12, fim 
	add $4, $10, $0
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $12, $12, 1 # contador
	
while:	beq $8, $12, fim
	add $4, $9, $10
	add $9, $0, $10
	add $10, $4, $0
	
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $12, $12, 1 # contador
	j while
	
fim:	addi $2, $0, 10
	syscall
