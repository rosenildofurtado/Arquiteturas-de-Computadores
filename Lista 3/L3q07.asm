.text
main:	addi $2, $0, 5
	syscall
	addi $9, $0, 1
	addi $10, $0, 0
	
while:	beq $2, $0, sai
	slt $9, $2, $0
	bne $9, $0,le
	add $10, $10, $2
le:	addi $2, $0, 5
	syscall
	j while
	
sai:	addi $4, $10, 0
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
