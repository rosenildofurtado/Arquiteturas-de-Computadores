.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o número digitado em $8
	addi $2, $0, 5
	syscall
	add $25, $0, $2 # Guarda o número digitado em $25
	addi $9, $0, 1000 # constante 1000
	addi $10, $0, 100 # constante 100
	addi $11, $0, 10 # constante 10
	addi $12, $0, 32 # constante 32
	addi $13, $0, 11 # constante 11
	addi $14, $0, 15 # constante 15
	
inicio:	div $8, $9
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
	addi $4, $15, 48 
	bne $23, $0, impM 
testaM: bne $15, $0, flagM
	addi $4, $0, 32 # constante 32
	j impM
flagM:	addi $23, $0, 1 # constante 1
impM:	addi $2, $0, 11
	syscall
	
	div $8, $10
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
	addi $4, $15, 48 
	bne $23, $0, impC 
testaC: bne $15, $0, flagC
	addi $4, $0, 32 # constante 32
	j impC
flagC:	addi $23, $0, 1 # constante 1
impC:	addi $2, $0, 11
	syscall
	
	div $8, $11
	mfhi $8 # guarda o resto
	mflo $15 # guarda o algarismo
	addi $4, $15, 48 
	bne $23, $0, impD 
testaD: bne $15, $0, flagD
	addi $4, $0, 32 # constante 32
	j impD
flagD:	addi $23, $0, 1 # constante 1
impD:	addi $2, $0, 11
	syscall
	
	
	addi $4, $8, 48 
impU:	addi $2, $0, 11
	syscall

	bne $24, $0, fim # termina se imprimiu o segundo numero
	addi $4, $0, ',' # constante ,
	addi $2, $0, 11
	syscall
	addi $8, $25, 0 # atualiza $8 com o segundo numero
	addi $24, $0, 1 
	addi $23, $0, 0 
	j inicio # volta para imprimir o segundo numero
		
fim:	addi $2, $0, 10
	syscall
