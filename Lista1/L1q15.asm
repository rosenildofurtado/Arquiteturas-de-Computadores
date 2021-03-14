.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 1000 # constante 1000
	addi $10, $0, 100 # constante 100
	addi $11, $0, 10 # constante 10
	addi $12, $0, 32 # constante 32
	addi $13, $0, 11 # constante 11
	addi $14, $0, 15 # constante 15
	
	div $8, $9
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
testa0M:add $16, $15, $14
	srl $17, $16, 4 # obtem 0 ou 1
	add $18, $15, $12 # soma o algarismo com 32 (n+32)
	mult $17, $12
	mflo $19 # Guarda 0 ou 1 por 32
	sub $4, $18, $19 # guarda n + 32 - 32 * (0 ou 1) para imprimir
	mult $11, $17 # obtem 0 ou 10
	mflo $20
	sub $2, $13, $20 # Guarda 11 - (0 ou 1)*10
	syscall
	
	div $8, $10
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
testa0C:add $16, $15, $14
	srl $17, $16, 4 # obtem 0 ou 1
	add $18, $15, $12 # soma o algarismo com 32 (n+32)
	mult $17, $12
	mflo $19 # Guarda 0 ou 1 por 32
	sub $4, $18, $19 # guarda n + 32 - 32 * (0 ou 1) para imprimir
	mult $11, $17 # obtem 0 ou 10
	mflo $20
	sub $2, $13, $20 # Guarda 11 - (0 ou 1)*10
	syscall
	
	div $8, $11
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
testa0D:add $16, $15, $14
	srl $17, $16, 4 # obtem 0 ou 1
	add $18, $15, $12 # soma o algarismo com 32 (n+32)
	mult $17, $12
	mflo $19 # Guarda 0 ou 1 por 32
	sub $4, $18, $19 # guarda n + 32 - 32 * (0 ou 1) para imprimir
	mult $11, $17 # obtem 0 ou 10
	mflo $20
	sub $2, $13, $20 # Guarda 11 - (0 ou 1)*10
	syscall
	
	add $15, $0, $8
testa0U:add $16, $15, $14
	srl $17, $16, 4 # obtem 0 ou 1
	add $18, $15, $12 # soma o algarismo com 32 (n+32)
	mult $17, $12
	mflo $19 # Guarda 0 ou 1 por 32
	sub $4, $18, $19 # guarda n + 32 - 32 * (0 ou 1) para imprimir
	mult $11, $17 # obtem 0 ou 10
	mflo $20
	sub $2, $13, $20 # Guarda 11 - (0 ou 1)*10
	syscall
	
	addi $2, $0, 10
	syscall
