.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # n
	addi $9, $0, 1 # contador 1
	addi $10, $0, 0 # contador linhas 
	addi $11, $0, 0 # contador colunas
	
	slt $12, $8, $0
	bne $12, $0, sai
	addi $25, $10, 1

forA:	beq $8, $10, sai
	addi $13, $10, 1
forB:	beq $25, $11, fimForB
	addi $4, $9, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	addi $9, $9, 1
	addi $11, $11, 1
	j forB
	
fimForB: addi $10, $10, 1
	addi $25, $10, 1
	addi $11, $0, 0 # contador colunas
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	j forA
sai:	
fim:	addi $2, $0, 10
	syscall
