.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2 # guarda o número digitado
	addi $9, $0, 30 # constante 30
	addi $10, $0, 7 # constante 7
testeM:	sub $11, $10, $8 
	srl $12, $11, 31 # testa se n<7
	add $13, $8, $12
	addi $14, $0, 1 # constante 7
testeP:	and $15, $13, $14 # testa se n é par ou impar
	add $4, $9, $15
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall
	