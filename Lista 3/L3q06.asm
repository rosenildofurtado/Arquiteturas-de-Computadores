.text
main:	addi $8, $0, 0
	addi $9, $0, 0
	addi $10, $0, 10
while:	bne $9, $0, sai
le:	addi $2, $0, 5
	syscall
	add $8, $8, $2
	slt $9, $2, $0
	j while
	
sai:	addi $4, $8, 0
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
