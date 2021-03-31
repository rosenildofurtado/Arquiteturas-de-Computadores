.text
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0 # Quantidade de números
	addi $9, $0, -999999999 # maior
	addi $10, $0, 0 # contador
	addi $11, $0 , 0 #numero de vezes que o maior aparece
	
while:	beq $10, $8, sai
le:	addi $2, $0, 5
	syscall
Tmenor:	slt $12, $2, $9
	bne $12, $0, cont
	bne $2, $9, maior
	addi $11, $11, 1
	j cont
maior:	add $9, $0, $2
	addi $11, $0, 1
cont:	addi $10, $10, 1
	j while
	
sai:	beq $8, $0, fim
	addi $4, $0, 'M'
	addi $2, $0, 11
	syscall
	addi $4, $9, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'q'
	addi $2, $0, 11
	syscall
	addi $4, $11, 0
	addi $2, $0, 1
	syscall
fim:	addi $2, $0, 10
	syscall
