.test
# assumindo que os valores permitidos são maiores do que 0.
# a partir de 01/01/0000.
main: 	addi $2, $0, 5
	syscall
	add $13, $2, $0 # dia
	addi $2, $0, 5
	syscall
	add $14, $2, $0 # mes
	addi $2, $0, 5
	syscall
	add $8, $2, $0 # ano
	addi $10, $0, 4 # constante 4
	addi $11, $0, 100 # constante 100
	addi $12, $0, 400 # constante 400
	addi $15, $0, 0 # constante que ao final do teste ano receberá 1 para bissexto e 0 se não for
	addi $16, $0, 12 # constante 400
	addi $17, $0, 'N' # constante N
	
	slt $9, $8, $0
	bne $9, $0, fim # verifica se o ano é negativo
bis:	div $8, $10
	mfhi $9
se:	bne $9, $0, mes # não é divisivel por 4?
	addi $15, $0, 1 # atualiza bissexto
	div $8, $11
	mfhi $9
senaoSe: bne $9, $0, mes # não é divisivel por 100?
	div $8, $12
	mfhi $9
senao:	beq $9, $0, mes # é divisivel por 400?
	addi $15, $0, 0 # atualiza bissexto
# Teste do mês
mes:	slt $18, $16, $14
	bne $18, $0, fim
	slt $9, $0, $14
	beq $9, $0, fim # verifica se o mes é zero ou negativo
# Teste do dia
	slt $9, $0, $13
	beq $9, $0, fim # verifica se o dia é zero ou negativo
	addi $9, $0, 2 # constante 2
	beq $14, $9, dia # testa se é fevereiro
	addi $9, $0, 30 # constante 30
	addi $10, $0, 7 # constante 7
testeM:	slt $11, $10, $14 
	add $12, $14, $11
	addi $19, $0, 1 # constante 1
testeP:	and $20, $19, $12 # testa se n é par ou impar
	addi $21, $20, 30
	j teste
dia:	addi $21, $15, 28
teste:	slt $22, $21, $13
	bne $22, $0, fim
	addi $17, $0, 'S' # constante S

fim: 	addi $4, $17, 0
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall