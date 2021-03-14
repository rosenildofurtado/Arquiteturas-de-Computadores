.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $9, $0, 1000 # constante 1000
	addi $10, $0, 100 # constante 100
	addi $11, $0, 10 # constante 10
	addi $12, $0, 32 # constante 32
	addi $17, $0, 11 # constante 32
	div $8, $9
	mfhi $8 # guarda o resto
	mflo $13 # guarda o algarismo
	div $13, $13 # obtem 0 ou 1
	mflo $14
	add $4, $13, $12 # soma o algarismo com 32
	mult $14, $12
	mflo $15 # Guarda 0 ou 1 por 32
	sub $4, $4, $15 # guarda n + 32  - 32 * (0 ou 1) para imprimir
	mult $11, $14 # obtem 0 ou 10
	mflo $16
	
	sub $2, $17, $16
	syscall
	div $8, $10
	mfhi $8
	mflo $13 # guarda o algarismo
	div $13, $13 # obtem 0 ou 1
	mflo $14
	add $4, $13, $12 # soma o algarismo com 32
	mult $14, $12
	mflo $15 # Guarda 0 ou 1 por 32
	sub $4, $4, $15 # guarda n + 32  - 32 * (0 ou 1) para imprimir
	mult $11, $14 # obtem 0 ou 10
	mflo $16
	
	sub $2, $17, $16
	syscall
	div $8, $11
	mfhi $8
	mflo $13 # guarda o algarismo
	div $13, $13 # obtem 0 ou 1
	mflo $14
	add $4, $13, $12 # soma o algarismo com 32
	mult $14, $12
	mflo $15 # Guarda 0 ou 1 por 32
	sub $4, $4, $15 # guarda n + 32  - 32 * (0 ou 1) para imprimir
	mult $11, $14 # obtem 0 ou 10
	mflo $16
	
	sub $2, $17, $16
	syscall
	
	div $8, $8 # obtem 0 ou 1
	mflo $14
	add $4, $8, $12 # soma o algarismo com 32
	mult $14, $12
	mflo $15 # Guarda 0 ou 1 por 32
	sub $4, $4, $15 # guarda n + 32  - 32 * (0 ou 1) para imprimir
	mult $11, $14 # obtem 0 ou 10
	mflo $16
	
	sub $2, $17, $16
	syscall
	
	addi $2, $0, 10
	syscall
