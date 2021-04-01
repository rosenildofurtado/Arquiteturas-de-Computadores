.text	
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0 # n
	addi $9, $0, 1 # fatorial
	
while:	beq $8, $0, sai
	mul $9, $9, $8
	subi $8, $8, 1
	j while
	
sai:	add $4, $9, $0
	addi $2, $0, 1
	syscall
	
fim:	addi $2, $0, 10
	syscall
