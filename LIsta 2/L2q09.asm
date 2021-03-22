.test
# assumindo que os valores permitidos s�o maiores do que 0.
# a partir de 01/01/0000.
# a letra N indica que a data n�o � v�lida
main: 	addi $2, $0, 5
	syscall
	add $13, $2, $0 # dia
	addi $2, $0, 5
	syscall
	add $14, $2, $0 # mes
	addi $2, $0, 5
	syscall
	add $8, $2, $0 # ano
inicio:	addi $10, $0, 4 # constante 4
	addi $11, $0, 100 # constante 100
	addi $12, $0, 400 # constante 400
	addi $15, $0, 0 # constante que ao final do teste ano receber� 1 para bissexto e 0 se n�o for
	addi $16, $0, 12 # constante 400
	addi $17, $0, 'N' # constante N
	
	slt $9, $8, $0
	bne $9, $0, fim # verifica se o ano � negativo
bis:	div $8, $10
	mfhi $9
se:	bne $9, $0, mes # n�o � divisivel por 4?
	addi $15, $0, 1 # atualiza bissexto
	div $8, $11
	mfhi $9
senaoSe: bne $9, $0, mes # n�o � divisivel por 100?
	div $8, $12
	mfhi $9
senao:	beq $9, $0, mes # � divisivel por 400?
	addi $15, $0, 0 # atualiza bissexto
# Teste do m�s
mes:	slt $18, $16, $14
	bne $18, $0, fim
	slt $9, $0, $14
	beq $9, $0, fim # verifica se o mes � zero ou negativo
# Teste do dia
	slt $9, $0, $13
	beq $9, $0, fim # verifica se o dia � zero ou negativo
	addi $9, $0, 2 # constante 2
	beq $14, $9, dia # testa se � fevereiro
	addi $9, $0, 30 # constante 30
	addi $10, $0, 7 # constante 7
testeM:	slt $11, $10, $14 
	add $12, $14, $11
	addi $19, $0, 1 # constante 1
testeP:	and $20, $19, $12 # testa se n � par ou impar
	addi $21, $20, 30
	j teste
dia:	addi $21, $15, 28
teste:	slt $22, $21, $13
	bne $22, $0, fim
	addi $23, $13, 1 # dia seguinte
	addi $9, $14, 0 # mes seguinte
	addi $10, $8, 0 # ano seguinte
	slt $24, $21, $23
	beq $24, $0, segui
	addi $23, $24, 0 # dia seguinte
	addi $9, $14, 1 # mes seguinte
	addi $11, $0, 12 # constante 12
	slt $12, $11, $9
	beq $12, $0, segui
	addi $9, $12, 0 # mes seguinte
	addi $10, $8, 1 # ano seguinte
segui:	addi $4, $23, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	addi $4, $9, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	addi $4, $10, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	# data anterior
	addi $23, $13, -1 # dia anterior
	addi $9, $14, 0 # mes anterior
	addi $10, $8, 0 # ano anterior
	slt $24, $0, $23
	bne $24, $0, anter
	addi $9, $14, -1 # mes anterior
	slt $24, $0, $9
	bne $24, $0, verifM
	addi $10, $8, -1 # ano anterior
	slt $24, $10, $0
	bne $24, $0, fim
	addi $23, $0, 31 # dia anterior
	addi $9, $0, 12 # mes anterior
	
verifM: addi $11, $0, 2 # constante 2
	beq $11, $9, fev # testa se � fevereiro
	addi $11, $0, 30 # constante 30
	addi $12, $0, 7 # constante 7
	slt $13, $12, $9 
	add $14, $13, $9
	addi $16, $0, 1 # constante 1
	and $17, $16, $14 # testa se n � par ou impar
	addi $23, $17, 30
	j anter
fev:	addi $23, $15, 28
anter:	addi $4, $23, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	addi $4, $9, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	addi $4, $10, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall
	
fim: 	addi $4, $17, 0
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall