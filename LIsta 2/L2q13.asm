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
	addi $4, $15, 48 
testaM: bne $15, $0, impM
	addi $4, $0, 32 # constante 32
impM:	addi $2, $0, 11
	syscall
	
	div $8, $10
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
	addi $4, $15, 48 
testac: bne $15, $0, impC
	addi $4, $0, 32 # constante 32
impC:	addi $2, $0, 11
	syscall
	
	div $8, $11
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
	addi $4, $15, 48 
testaD: bne $15, $0, impD
	addi $4, $0, 32 # constante 32
impD:	addi $2, $0, 11
	syscall
	
	
	addi $4, $8, 48 
testaU: bne $8, $0, impU
	addi $4, $0, 32 # constante 32
impU:	addi $2, $0, 11
	syscall
	
	addi $2, $0, 10
	syscall
