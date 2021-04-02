.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # a
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # b
	addi $10, $0, 2 # constante 2
	
	slt $11, $9, $8 # Testa se b<a
	beq $11, $0, ok
	addi $25, $8, 0 
	addi $8, $9, 0
	addi $9, $25, 0
ok:	slt $11, $8, $10 # Testa se a<2 e inicia o contador
	addi $12, $0, 3 # constate 3
	
forA:	slt $25, $8, $9
	bne $25, $0, sai
	addi $13, $10, 1
forB:	beq $25, $11, fimForB
	
	
	addi $9, $9, 1
	addi $11, $11, 1
	j forB
	
fimForB: addi $10, $10, 1
	addi $25, $10, 1
	addi $11, $0, 0 # contador colunas
	
	j forA
sai:	addi $4, $0, 'q'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'p'
	addi $2, $0, 11
	syscall
	addi $4, $0, '='
	addi $2, $0, 11
	syscall
	addi $4, $11, 0
	addi $2, $0, 1
	syscall
fim:	addi $2, $0, 10
	syscall
