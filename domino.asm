.data 0x10090000
	.word 0 0 0 1 0 2 0 3 0 4 0 5 0 6 # Pecas do domino
	.word 1 1 1 2 1 3 1 4 1 5 1 6
	.word 2 2 2 3 2 4 2 5 2 6
	.word 3 3 3 4 3 5 3 6
	.word 4 4 4 5 4 6
	.word 5 5 5 6
	.word 6 6
.data 0x10090100
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # pecas do jogador
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # pecas do computador a
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # pecas do computador b
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # pecas do computador c
.data 0x10090200
	.word 0x00006600 0x00ffffff 0x00888888 0x00880000 0x00ffff00 # cores
	.word 0x00008800 0x00000088 0x00ffa500 0x00ff0000 0x0000ff00 # cores
.data 0x10090300
	.word 256 512 20 40 4 # Dimensoes
	
	
.text
main: 	
	addi $4, $0, 0x10090300 # quantas linha tem na tela
	lw $4, 0($4)
	addi $5, $0, 0x10090304 # quantas colunas tem na tela
	lw $5, 0($5)
	addi $6, $0, 0x10090200 # cor do background
	lw $6, 0($6)
	jal bgColor # Background verde
		
	addi $4, $0, 99
	addi $5, $0, 101
	addi $6, $0, 20
	addi $7, $0, 40
	add $8, $0, $0
	jal bordaRet
	
	addi $4, $0, 100
	addi $5, $0, 100
	addi $6, $0, 20
	addi $7, $0, 40
	addi $8, $0, 0x00888888
fimTela: jal retang

	addi $4, $0, 100
	addi $5, $0, 100
	addi $6, $0, 0x00880000
	addi $7, $0, 0
	jal N6
	
	addi $4, $0, 100
	addi $5, $0, 120
	addi $6, $0, 0x00ffff00
	addi $7, $0, 0
	jal N5
	
	addi $4, $0, 100
	addi $5, $0, 5
	jal num1
	
	addi $4, $0, 130
	addi $5, $0, 5
	jal num2
	
	addi $4, $0, 160
	addi $5, $0, 5
	jal num3
	
	addi $4, $0, 190
	addi $5, $0, 5
	jal num4
	
	addi $4, $0, 220
	addi $5, $0, 5
	jal num5
	
	addi $4, $0, 250
	addi $5, $0, 5
	jal num6
	
	addi $4, $0, 280
	addi $5, $0, 5
	jal num7
	
fim:	addi $2, $0, 10
	syscall
	
# ========= ROTINAS ============================

#---------------INSPILHA-----------------
# Rotina para inserir o PC na pilha
# Entradas:	$4 $31 anterior
# Usa (sem preservar): $24, $25
insPilha: addi $25, $0, 0x10090400
	lw $24, 0($25)
	addi $24, $24, 4
	sw $24, 0($25)
	add $25, $25, $24
	sw $4, 0($25)
	jr $31

#---------------RETPILHA-----------------
# Rotina para retirar o PC da pilha
# Saidas: $3	
# Usa (sem preservar): $24, $25
retPilha: addi $25, $0, 0x10090400
	lw $24, 0($25)
	add $3, $25, $24
	lw $3, 0($3)
	addi $24, $24, -4
	sw $24, 0($25)
	jr $31	

#----------------BGCOLOR------------------
# Rotina para preencher a cor de fundo
# Entradas:	$4 L
#		$5 C
#		$6 cor
# Usa (sem preservar): $23 ao $25
bgColor: lui $25, 0x1001 
	addi $24, $0, 0
	addi $23, $0, 0
forbgi:	beq $23, $5, fimBgi
	addi $24, $0, 0
forbgj:	beq $24, $4, contbgi
	sw $6, 0($25)
	addi $25, $25, 4
	addi $24, $24, 1
	j forbgj
contbgi: addi $23, $23, 1
	j forbgi
fimBgi: jr $31

#----------------ENDERECO-----------------
# Rotina para calcular um endereco
# Entradas:	$4 c
#		$5 l
#		$6 L
#		$7 end0
# Saida:	$2
# Usa (sem preservar): $25
endPxy:	mul $25, $5, $6 # l*L
	add $25, $25, $4 # l*L+c
	sll $25, $25, 2 # (l*L+c)*4
	add $2, $25, $7 # Retorna a soma com o end0
fimPxy:	jr $31 


#---------------RETANGULO-------------
# Rotina para desenhar um retangulo
# Entrada: $4, $5, $6, $7 e $8 onde:
#	$4 = px, $5=py, $6=tamx, $7=tamy e $8=cor
# Usa sem preservar  $17 ao $25
	
retang:	add $22, $0, $5 # j=$5
	add $21, $0, $4 # i=$4
	add $16, $0, $4 # i=$4
	add $20, $7, $5 # py+tamy
	add $19, $6, $4 # px+tamx
	addi $4, $31, 0
	jal insPilha
	lui $7, 0x1001
	addi $6, $0, 0x10090304 # quantas colunas tem na tela
	lw $6, 0($6)
		
fori:	slt $18, $22, $20
	beq $18, $0, fimFori
	addi $5, $22,0
	addi $21, $16, 0
forj:	slt $18, $21, $19
	beq $18, $0, conti
	addi $4, $21, 0
	jal endPxy
	sw $8, 0($2)
	addi $21, $21, 1
	j forj
conti:	addi $22, $22, 1
	j fori
fimFori: jal retPilha 
	addi $31, $3, 0
	jr $31


#---------------BORDARET-------------
# Rotina para desenhar a borda de um retangulo
# Entrada: $4, $5, $6, $7, $8, onde:
#	$4 = px, $5=py, $6=tamx, $7=tamy e $8 cor
# Usa sem preservar $17 ao $25
	
bordaRet: add $22, $0, $5 # j=$5
	add $21, $0, $4 # i=$4
	add $16, $0, $4 # i=$4
	add $20, $7, $5 # py+tamy
	add $19, $6, $4 # px+tamx
	addi $4, $31, 0
	jal insPilha
	lui $7, 0x1001
	addi $6, $0, 0x10090304 # quantas colunas tem na tela
	lw $6, 0($6)
	addi $23, $19, -1
	addi $24, $20, -1
	
	addi $5, $22, 0
bordi:	beq $21, $19, fimBordi
	addi $4, $21, 0
	jal endPxy
	sw $8, 0($2)
	addi $5, $24, 0
	jal endPxy
	sw $8, 0($2)
	addi $5, $22 , 0
contBi:	addi $21, $21, 1
	j bordi
	
fimBordi: addi $4, $16, 0

bordj:	beq $22, $20, fimBordj
	addi $5, $22, 0
	jal endPxy
	sw $8, 0($2)
	addi $4, $23, 0
	jal endPxy
	sw $8, 0($2)
	addi $4, $16, 0
	addi $22, $22, 1
	j bordj
fimBordj: jal retPilha 
	addi $31, $3, 0
	jr $31

#-------------- PONTO --------------
# Rotina para desenhar um ponto
# Entrada: $4, $5, $6, $7 onde:
#	$4 = px, $5=py, $6=cor, $7=end inicial
# Usa sem preservar
ponto:	addi $10, $0, 0x10090310 # dimensoes do ponto
	lw $10, 0($10)
	addi $11, $6, 0
	addi $12, $4, 0
	addi $6, $0, 0x10090304 # L 
	lw $6, 0($6)
	addi $4, $31, 0
	jal insPilha
	addi $13, $12, 3
	addi $14, $5, 3
	addi $15, $5, 0
pontoL:	slt $10, $14, $5
	bne $10, $0, saiP
	addi $4, $12, 0
pontoC:	slt $10, $13, $4
	bne $10, $0, contL
	beq $4, $12, tqe # testa a quina esquerda
	beq $4, $13, tqd # testa a quina direita
printP:	jal endPxy
	sw $11, 0($2)
contC:	addi $4, $4, 1
	j pontoC
tqe:	beq $5, $15, contC
	beq $5, $14, contC
	j printP
tqd:	beq $5, $15, contC
	beq $5, $14, contC
	j printP
	
contL:	addi $5, $5, 1
	j pontoL
saiP:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-------------- NUMEROS-------------
#-----------------N1----------------
# Rotina para desenhar o numero 1
# Entrada: $4, $5, $6, $7, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar: $9
N1:	addi $9, $0, 0x10090308
	lw $9, 0($9)
	srl $9, $9, 1
	addi $9, $9, -2
	add $5, $5, $9
	add $9, $4, $9
	addi $4, $31, 0
	jal insPilha
	add $4, $0, $9	
	lui $7, 0x1001
	jal ponto
saiN1:	jal retPilha 

	addi $31, $3, 0
	jr $31

#-----------------N2----------------
# Rotina para desenhar o numero 2
# Entrada: $4, $5, $6, $7, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar $9, $22, $23
N2:	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $22, $6, 0
	addi $23, $0, 1
	sub, $23, $23, $7
	sll $23, $23, 1
	add $4, $23, $9
	mul $23, $7, 14
	add $4, $4, $23
	addi $23, $7, 0
	addi $5, $5, 2
	lui $7, 0x1001
	jal ponto
	addi $7, $23, 0
	addi $23, $0, 1
	sub, $23, $23, $7
	mul $23, $23, 14
	add $4, $23, $9
	sll $23, $7, 1
	add $4, $4, $23
	addi $5, $5, 9
	addi $6, $22, 0
	lui $7, 0x1001
	jal ponto
	
saiN2:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N3----------------
# Rotina para desenhar o numero 3
# Entrada: $4, $5, $6, $7, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar $9, $22, $23
N3:	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $22, $6, 0
	addi $23, $0, 1
	sub, $23, $23, $7
	sll $23, $23, 1
	add $4, $23, $9
	mul $23, $7, 14
	add $4, $4, $23
	addi $23, $7, 0
	addi $5, $5, 2
	lui $7, 0x1001
	jal ponto
	addi $7, $23, 0
	addi $4, $9, 8
	addi $5, $5, 3
	addi $6, $22, 0
	lui $7, 0x1001
	jal ponto
	addi $7, $23, 0
	addi $23, $0, 1
	sub, $23, $23, $7
	mul $23, $23, 14
	add $4, $23, $9
	sll $23, $7, 1
	add $4, $4, $23
	addi $5, $5, 3
	addi $6, $22, 0
	lui $7, 0x1001
	jal ponto
	
saiN3:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N4----------------
# Rotina para desenhar o numero 4
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=cor
# Usa sem preservar: $9, $22
N4:	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $22, $6, 0
	addi $4, $9, 2
	addi $5, $5, 2
	lui $7, 0x1001
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 14
	addi $5, $5, -4
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 14
	addi $5, $5, 9
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 2
	addi $5, $5, -4
	jal ponto
	
saiN4:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N5----------------
# Rotina para desenhar o numero 5
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=cor
# Usa sem preservar: $9, $22
N5:	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $22, $6, 0
	addi $4, $9, 2
	addi $5, $5, 2
	lui $7, 0x1001
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 14
	addi $5, $5, -4
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 8
	addi $5, $5, 2
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 14
	addi $5, $5, 2
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 2
	addi $5, $5, -4
	jal ponto
	
saiN5:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N6----------------
# Rotina para desenhar o numero 6
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar: $9, $21, $22, $23
N6:	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	
	addi $4, $0, 1
	sub $4, $4, $7
	sll $4, $4, 1
	sll $22, $7, 3
	add $4, $4, $22
	add $4, $4, $9
	
	addi $5, $0, 1
	sub $5, $5, $7
	sll $5, $5, 3
	sll $22, $7, 1
	add $5, $5, $22
	add $5, $5, $23
	addi $21, $7, 0
	lui $7, 0x1001
	addi $22, $6, 0
	jal ponto
	
	addi $6, $22, 0
	addi $7, $21, 0
	addi $4, $0, 1
	sub $4, $4, $7
	mul $4, $4, 14
	sll $22, $7, 3
	add $4, $4, $22
	add $4, $4, $9
	
	addi $5, $0, 1
	sub $5, $5, $7
	sll $5, $5, 3
	mul $22, $7, 14
	add $5, $5, $22
	add $5, $5, $23
	addi $21, $7, 0
	lui $7, 0x1001
	addi $22, $6, 0
	jal ponto
	
	addi $6, $22, 0
	addi $4, $9, 2
	addi $5, $23, 2
	lui $7, 0x1001
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 14
	addi $5, $23, 2
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 14
	addi $5, $23, 14
	jal ponto
	addi $6, $22, 0
	addi $4, $9, 2
	addi $5, $23, 14
	jal ponto
	
saiN6:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 1----------------
# Rotina para desenhar o algarismo 1
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num1:	addi $8, $0, 0x10090204	
	lw $8, 0($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 3
	addi $6, $0, 2
	addi $7, $0, 11
	jal retang
	addi $4, $9, 0
	addi $5, $23, 11
	addi $6, $0, 8
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 2
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 1
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 2
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
sain1:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 2----------------
# Rotina para desenhar o algarismo 2
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num2:	addi $8, $0, 0x10090204	
	lw $8, 0($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 2
	jal retang
	addi $4, $9, 5
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 6
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 7
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 5
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 4
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 3
	addi $5, $23, 6
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 2
	addi $5, $23, 7
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 1
	addi $5, $23, 9
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 0
	addi $5, $23, 10
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 11
	addi $6, $0, 5
	addi $7, $0, 1
	jal retang
	addi $4, $9, 7
	addi $5, $23, 10
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
sain2:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 3----------------
# Rotina para desenhar o algarismo 3
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num3:	addi $8, $0, 0x10090204	
	lw $8, 0($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 2
	jal retang
	addi $4, $9, 5
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 6
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 10
	jal retang
	addi $4, $9, 7
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 5
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 4
	jal retang
	addi $4, $9, 3
	addi $5, $23, 5
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $9, 7
	addi $5, $23, 7
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 5
	addi $5, $23, 9
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 1
	addi $5, $23, 9
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 0
	addi $5, $23, 8
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 10
	addi $6, $0, 3
	addi $7, $0, 2
	jal retang
	
sain3:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 4----------------
# Rotina para desenhar o algarismo 4
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num4:	addi $8, $0, 0x10090204	
	lw $8, 0($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 9
	addi $6, $0, 8
	addi $7, $0, 1
	jal retang
	addi $4, $9, 5
	addi $5, $23, 0
	addi $6, $0, 2
	addi $7, $0, 12
	jal retang
	addi $4, $9, 0
	addi $5, $23, 8
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 4
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $9, 3
	addi $5, $23, 3
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
		
sain4:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 5----------------
# Rotina para desenhar o algarismo 5
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num5:	addi $8, $0, 0x10090204	
	lw $8, 0($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 0
	addi $6, $0, 7
	addi $7, $0, 1
	jal retang
	addi $4, $9, 7
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 2
	addi $7, $0, 5
	jal retang
	addi $4, $9, 3
	addi $5, $23, 3
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 2
	addi $5, $23, 4
	addi $6, $0, 5
	addi $7, $0, 1
	jal retang
	addi $4, $9, 5
	addi $5, $23, 5
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 6
	addi $5, $23, 6
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 7
	addi $5, $23, 6
	addi $6, $0, 1
	addi $7, $0, 4
	jal retang
	addi $4, $9, 5
	addi $5, $23, 9
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 2
	addi $5, $23, 10
	addi $6, $0, 3
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $23, 9
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 0
	addi $5, $23, 8
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
sain5:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 6----------------
# Rotina para desenhar o algarismo 6
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num6:	addi $8, $0, 0x10090204	
	lw $8, 0($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 1
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 10
	jal retang
	addi $4, $9, 7
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 6
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 0
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 8
	jal retang
	addi $4, $9, 3
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 5
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 6
	addi $5, $23, 6
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 7
	addi $5, $23, 7
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 3
	addi $5, $23, 5
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 6
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 9
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 3
	addi $5, $23, 10
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $9, 5
	addi $5, $23, 9
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	
sain6:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 7----------------
# Rotina para desenhar o algarismo 7
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num7:	addi $8, $0, 0x10090204	
	lw $8, 0($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 5
	addi $7, $0, 1
	jal retang
	addi $4, $9, 6
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 7
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 5
	addi $5, $23, 3
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 4
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 3
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 2
	addi $5, $23, 6
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 1
	addi $5, $23, 8
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 0
	addi $5, $23, 10
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
sain7:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
