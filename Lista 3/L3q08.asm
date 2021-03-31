.text
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0 # Maior
	addi $9, $2, 0 # menor
	
while:	beq $2, $0, sai
Tmenor:	slt $10, $2, $9
	beq $10, $0, Tmaior
	add $9, $0, $2
Tmaior:	slt $10, $8, $2
	beq $10, $0, le
	add $8, $0, $2
le:	addi $2, $0, 5
	syscall
	j while
	
sai:	beq $8, $0, fim
	addi $4, $0, 'M'
	addi $2, $0, 11
	syscall
	addi $4, $8, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'm'
	addi $2, $0, 11
	syscall
	addi $4, $9, 0
	addi $2, $0, 1
	syscall
fim:	addi $2, $0, 10
	syscall
