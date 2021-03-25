.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o numero digitado em $8
	addi $9, $0, 100000000 # constante 100000000
	addi $10, $0, 10000000 # constante 10000000
	addi $11, $0, 1000000 # constante 1000000
	addi $12, $0, 100000 # constante 100000
	addi $13, $0, 10000 # constante 10000
	addi $14, $0, 1000 # constante 1000
	addi $15, $0, 100 # constante 100
	addi $16, $0, 10 # constante 10
	addi $17, $0, 11 # constante 11
	addi $18, $0, 11 # constante 11
	
	
cpf1:	div $8, $9
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 1 por 11
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 1 por 10
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf2:	div $8, $10
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 2 por 10
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 2 por 9
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf3:	div $8, $11
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 3 por 9
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 3 por 8
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf4:	div $8, $12
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 4 por 8
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 4 por 7
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf5:	div $8, $13
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 5 por 7
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 5 por 6
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf6:	div $8, $14
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 6 por 6
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 6 por 5
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf7:	div $8, $15
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 7 por 5
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 7 por 4
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf8:	div $8, $16
	mflo $19 # guarda o algarismo
	mfhi $8
	mul $20, $19, $18 # multiplica digito 8 por 4
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $19, $18 # # multiplica digito 8 por 3
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf9:	mul $20, $8, $18 # multiplica digito 9 por 3
	add $21, $21, $20 # soma para o calculo do segundo digito
	addi $18, $18, -1
	mul $22, $8, $18 # # multiplica digito 9 por 2
	add $23, $23, $22 # soma para o calculo do primeiro digito
	
cpf10:	div $23, $17 # soma / 11
	mflo $24
	mfhi $25
	slt $9, $25, $18 # resto < 2
	bne $9, $0, impD1 # se verdade, imprime 0
	sub $4, $17, $25 # 11 - resto
	add $19, $4, $0 # zera $4
impD1:	addi $2, $0, 1
	syscall
	
cpf11:	
	add $4, $0, $0 # zera $4
	mul $20, $19, $18 # multiplica digito 9 por 2
	add $21, $21, $20 # soma para o calculo do segundo digito
	div $21, $17 # soma / 11
	mflo $24
	mfhi $25
	slt $9, $25, $18 # resto < 2
	bne $9, $0, impD2 # se verdade, imprime 0
	sub $4, $17, $25 # 11 - resto
impD2:	addi $2, $0, 1
	syscall
		
fim:	addi $2, $0, 10
	syscall
