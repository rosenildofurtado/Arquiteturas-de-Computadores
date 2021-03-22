.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0
	addi $2, $0, 5
	syscall
	add $9, $2, $0
	addi $2, $0, 5
	
	addi $10, $0, 60 # constante 60
	addi $11, $0, 65 # constante 65
	addi $12, $0, 35 # constante 65
	addi $13, $0, 40 # constante 65
	addi $4, $0, 'S' # constante S
	
se:	slt $15, $8, $11 # ver se ano<65
	beq $15, $0, fim 
senaoSe: slt $16, $9, $13 # ver se trabalho<40
	beq $16, $0, fim 
senao:	slt $17, $8, $10 # ver se ano<60
	slt $18, $9, $12 # ver se trabalho<35
	add $19, $17, $18
	beq $19, $0, fim
	addi $4, $0, 'N' # constante N
fim: 	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall