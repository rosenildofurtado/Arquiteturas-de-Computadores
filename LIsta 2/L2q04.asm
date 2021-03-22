.test
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0
	addi $2, $0, 5
	syscall
	add $9, $2, $0
	addi $10, $0, 61 # Constante 61 equivale a '=' em ascII	
	
	slt $11, $9, $8 # ver se n2<n1
	slt $12, $8, $9 # ver se n1<n2
	sub $13, $11, $12 # Va ser usado na expressão c = 61 - $11 + $10, onde c é o caracter que será impresso
	
	add $4, $8, $0
	addi $2, $0, 1
	syscall
	
	add $4, $10, $0
	beq $8, $9, fim # testa se os números são iguais
	add $4, $10, $13 # atualiza caracter
fim: 	addi $2, $0, 11
	syscall
	
	add $4, $9, $0
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall