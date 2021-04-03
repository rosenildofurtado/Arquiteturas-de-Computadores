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
	add $8, $8, $11
	addi $12, $0, 3 # constate 3
	not $13, $8
	andi $14, $13, 1
	add $8, $8, $14
	
forA:	slt $25, $8, $9 
	beq $25, $0, sai # enquanto a<b
	srl $15, $8, 1
forB:	slt $24, $12, $15 
	beq $24, $0, fimForB
	div $8, $12
	mfhi $16
	beq $16, $0, prox
	addi $12, $12, 2
	j forB
		
fimForB: addi $11, $11, 1
prox: 	addi $12, $0, 3 # constate 3
	addi $8, $8, 2
	
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
