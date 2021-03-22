.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0
	addi $2, $0, 5
	syscall
	add $9, $2, $0
	addi $2, $0, 5
	syscall
	add $10, $2, $0
	
	addi $11, $0, 3 # Peso 3
	addi $12, $0, 'A' # caracter A
	sll $13, $9, 1 # multiplicou a segunda nota por 2
	mul $14, $10, $11 # multiplicou a terceira nota por 3
	add $15, $8, $13 
	add $15, $15, $14 # somou $8 + 2*$9 + 3*$10
	addi $11, $0, 6 # constante 6
	div $15, $11
media:	mflo $4 # media
	addi $2, $0, 1
	syscall
	addi $11, $0, 60 # constante 60
	slt $16, $4, $11 # ver se media<60
	beq $16, $0, fim 
	addi $12, $0, 'R' # atualiza caracter
fim: 	add $4, $12, $0
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall