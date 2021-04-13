.data 0x10090000
	.word 0 0 0 1 0 2 0 3 0 4 0 5 0 6 # Pecas do domino
	.word 1 1 1 2 1 3 1 4 1 5 1 6
	.word 2 2 2 3 2 4 2 5 2 6
	.word 3 3 3 4 3 5 3 6
	.word 4 4 4 5 4 6
	.word 5 5 5 6
	.word 6 6

.data 0x10090200
	.word 0x00006600 0x00999999 0x00ffffff 0x00ffa500 0x00000088 
# cores:      verdeFundo,  cinza,    branco, 	laranja,   azulEsc,	

	.word 0x00008800 0x00ffff00 0x00880000 0x00ff0000 0x0000ff00 
# cores:	verdEsc,  amarelo,   vermEsc,  	vermelho,   verde
.data 0x10090300
	.word 256 512 20 40 4 # Dimensoes

.data 0x10090a00
	.word -1 -1 168 15 0 -1 -1 194 15 0 -1 -1 220 15 0 -1 -1 246 15 0 
	.word -1 -1 272 15 0 -1 -1 298 15 0 -1 -1 324 15 0 # pecas do jogador
.data 0x10090b00
	.word -1 -1 467 33 1 -1 -1 467 58 1 -1 -1 467 83 1 -1 -1 467 108 1 
	.word -1 -1 467 133 1 -1 -1 467 158 1 -1 -1 467 183 1 # pecas do computador a
.data 0x10090c00
	.word -1 -1 168 210 0 -1 -1 194 210 0 -1 -1 220 210 0 -1 -1 246 210 0 
	.word -1 -1 272 210 0 -1 -1 298 210 0 -1 -1 324 210 0 # pecas do computador b
.data 0x10090d00
	.word -1 -1 6 33 1 -1 -1 6 58 1 -1 -1 6 83 1 -1 -1 6 108 1 
	.word -1 -1 6 133 1 -1 -1 6 158 1 -1 -1 6 183 1 # pecas do computador c
.data 0x10090e00
	.word -1 -1 236 108 1 0 
.data 0x10090f00
	.word -1 -1 256 128 1 0
	
.text
main: 	
	addi $4, $0, 0x10090300 # quantas linha tem na tela
	lw $4, 0($4)
	addi $5, $0, 0x10090304 # quantas colunas tem na tela
	lw $5, 0($5)
	addi $6, $0, 0x10090200 # cor do background
	lw $6, 0($6)
	jal bgColor # Background verde
	
	jal numeros # mostra os numeros de 1 a 7

# Embaralha e distribui as pecas
	addi $7, $0, 0x10090a00
	addi $10, $0, 0x10090a00
	addi $8, $0, 28
distrib: addi $2, $0, 41 # gera um numero aleatorio
	syscall
	
	div $4, $8
	mfhi $5
	slt $4, $4, $0
	beq $4, $0, contDis
	sub $5, $0, $5
contDis: addi $12, $5, 0
	addi $6, $0, 0x10090000
	jal buscaEnd
	addi $6, $2, 0
	jal moveMem
	addi $6, $0, 4
	div $8, $6
	mfhi $9
	addi $6, $0, 1
	addi $7, $7, 256
	addi $8, $8, -1
	bne $6, $9, fimDist
	addi $10, $10, 20
	addi $7, $10, 0
fimDist: bne $8, $0, distrib
#	----------------------
	
	addi $7, $0, 0x10090a00
	addi $6, $0, 0
	jal peca
	addi $7, $0, 0x10090a00
	addi $7, $7, 20
	addi $6, $0, 0
	jal peca
	addi $7, $0, 0x10090a00
	addi $7, $7, 40
	addi $6, $0, 0
	jal peca
	addi $7, $0, 0x10090a00
	addi $7, $7, 60
	addi $6, $0, 0
	jal peca
	addi $7, $0, 0x10090a00
	addi $7, $7, 80
	addi $6, $0, 0
	jal peca
	addi $7, $0, 0x10090a00
	addi $7, $7, 100
	addi $6, $0, 0
	jal peca
	addi $7, $0, 0x10090a00
	addi $7, $7, 120
	addi $6, $0, 0
	jal peca

	addi $7, $0, 0x10090b00
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090b00
	addi $7, $7, 20
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090b00
	addi $7, $7, 40
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090b00
	addi $7, $7, 60
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090b00
	addi $7, $7, 80
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090b00
	addi $7, $7, 100
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090b00
	addi $7, $7, 120
	addi $6, $0, 1
	jal peca
	
	addi $7, $0, 0x10090c00
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090c00
	addi $7, $7, 20
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090c00
	addi $7, $7, 40
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090c00
	addi $7, $7, 60
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090c00
	addi $7, $7, 80
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090c00
	addi $7, $7, 100
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090c00
	addi $7, $7, 120
	addi $6, $0, 1
	jal peca

	addi $7, $0, 0x10090d00
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090d00
	addi $7, $7, 20
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090d00
	addi $7, $7, 40
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090d00
	addi $7, $7, 60
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090d00
	addi $7, $7, 80
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090d00
	addi $7, $7, 100
	addi $6, $0, 1
	jal peca
	addi $7, $0, 0x10090d00
	addi $7, $7, 120
	addi $6, $0, 1
	jal peca
	
	addi $4, $0, 0x10090e00
	addi $5, $0, 0 # 0 peca para cima, 1 peca para baixo
	addi $6, $0, 1
	addi $7, $0, 0x10090a00
	jal moveP
	addi $4, $0, 0x10090a00
	addi $5, $0, 1 # 0 peca para cima, 1 peca para baixo
	addi $6, $0, 0
	addi $7, $0, 0x10090e00
	jal moveP
	
fim:	addi $2, $0, 10
	syscall
	
# ========= ROTINAS ============================

#---------------ATRASO-----------------
# Rotina para atrasar o programa
# Entradas:	$4 tempo 
# Usa (sem preservar): $24, $25
atrasar: addi $5, $0, 0 # i
	addi $7, $0, 1000 # fim de i
forAtr:	slt $6 $0, $4
	beq $6, $0, fimAtr
	addi $5, $0, 0 # i
forAtri: slt $6 $5, $7
	beq $6, $0, fimAti
	nop
	addi $5, $5, 1
	j forAtri
fimAti:	addi $4, $4, -1
	j forAtr
fimAtr:	jr $31

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
	
#---------------MOVEMEM-----------------
# Rotina para mover a peca na memoria
# Entrada: $6, $7
# Saidas: 	
# Usa (sem preservar): $25
moveMem: lw $25, 0($6)
	sw $25, 0($7)
	lw $25, 4($6)
	sw $25, 4($7)
	addi $25, $0, -1
	sw $25, 0($6)
	sw $25, 4($6)
	addi $2, $7, 0
	jr $31	

#---------------BUSCAEND-----------------
# Rotina para buscar um endereco na memoria
# Entrada: $5, $6
# Saidas: $2	
# Usa (sem preservar): $25
buscaEnd: addi $2, $6, 0
	addi $25, $0, 0
forBus:	lw $24, 0($2)
	slt $24, $24, $0
	beq $24, $0, contBus
	addi $2, $2, 8
	j forBus
contBus: beq $25, $5, fimBus
	addi $25, $25, 1
	addi $2, $2, 8
	j forBus
fimBus: jr $31

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

#-----------------PECA--------------------
# Rotina para desenhar a peca
# Entradas:	$6 virada = 0 peca para cima, 1 peca para baixo
#		$7 endereco da peca
# Saida:	
# Usa (sem preservar): $8, $9, $11, $12, $13
peca:	addi $9, $7, 0
	lw $8, 16($9)
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	jal insPilha
	addi $4, $9, 0
	jal insPilha
	addi $4, $6, 0
	jal insPilha
	andi $8, $8, 1
	lw $11, 8($7)
	lw $12, 12($7)
	addi $4, $11, 1
	addi $5, $12, 1
	addi $10, $0, 19
	addi $13, $0, 39
	beq $8, $0, retP
	addi $10, $0, 39
	addi $13, $0, 19
	
retP:	addi $6, $10, 0
	addi $7, $13, 0
	addi $8, $0, 0x10090204		
	lw $8, 0($8)
	jal retang
	addi $4, $11, 0
	addi $5, $12, 0
	addi $6, $10, 1
	addi $7, $0, 1
	addi $8, $8, 0x00111111
	jal retang
	add $4, $11, $10
	addi $5, $12, 1
	addi $6, $0, 1
	addi $7, $13, 0
	jal retang
	addi $4, $11, 0
	addi $5, $12, 1
	addi $6, $0, 1
	addi $7, $13, 0
	subi $8, $8, 0x00222222
	jal retang
	addi $4, $11, 0
	add $5, $12, $13
	addi $6, $10, 0
	addi $7, $0, 1
	jal retang
	jal retPilha
	bne $3, $0, virada # testa se a peca esta virada
	j nVirada
virada: jal retPilha
	j fimPeca
nVirada: lw $13, 16($9)
	andi $13, $13, 1
	addi $4, $0, 1
	sub $4, $4, $13
	mul $4, $4, 9
	mul $7, $13, 19
	add $4, $4, $7
	add $4, $4, $11
	addi $8, $0, 0x00888888
	addi $5, $0, 1
	sub $5, $5, $13
	mul $5, $5, 19
	mul $7, $13, 9
	add $5, $5, $7
	add $5, $5, $12
	addi $6, $0, 0x10090304	
	lw $6, 0($6)
	lui $7, 0x1001
	jal endPxy
	sw $8, 0($2)
	addi $8, $0, 0x00aaaaaa
	sw $8, 4($2)
	sll $6, $6, 2
	add $2, $2, $6
	addi $8, $0, 0x00888888
	sw $8, 4($2)
	addi $8, $0, 0x00777777
	sw $8, 0($2) # termina de imprimir o ponto do meio da peca
	
	lw $10, 16($9)		
	lw $11, 0($9)
	lw $12, 4($9)
	srl $10, $10, 1
	beq $10, $0, leNums
	lw $11, 4($9)
	lw $12, 0($9)
leNums:	lw $4, 8($9)
	lw $5, 12($9)
		
	addi $6, $0, 1
	andi $7, $13, 1
	beq $11, $0, pxNum
	beq $11, $6, mostra1
	addi $6, $6, 1
	beq $11, $6, mostra2
	addi $6, $6, 1
	beq $11, $6, mostra3
	addi $6, $6, 1
	beq $11, $6, mostra4
	addi $6, $6, 1
	beq $11, $6, mostra5
	addi $6, $6, 1
	beq $11, $6, mostra6
	j pxNum
mostra1: addi $6, $0, 0x10090200	
	lw $6, 8($6)
	jal N1
	slt $4, $11, $0
	bne $4, $0, fimPeca
	j pxNum
mostra2: addi $6, $0, 0x10090200	
	lw $6, 12($6)
	jal N2
	slt $4, $11, $0
	bne $4, $0, fimPeca
	j pxNum
mostra3: addi $6, $0, 0x10090200	
	lw $6, 16($6)
	jal N3
	slt $4, $11, $0
	bne $4, $0, fimPeca
	j pxNum
mostra4: addi $6, $0, 0x10090200	
	lw $6, 20($6)
	jal N4
	slt $4, $11, $0
	bne $4, $0, fimPeca
	j pxNum
mostra5: addi $6, $0, 0x10090200	
	lw $6, 24($6)
	jal N5
	slt $4, $11, $0
	bne $4, $0, fimPeca
	j pxNum
mostra6: addi $6, $0, 0x10090200	
	lw $6, 28($6)
	jal N6
	slt $4, $11, $0
	bne $4, $0, fimPeca
	
pxNum:	
	jal retPilha
	addi $9, $3, 0
	lw $4, 8($9)
	lw $5, 12($9)
	lw $6, 16($9)	
	andi $6, $6, 1
	addi $5, $5, 19
	beq $6, $0, invN
	addi $4, $4, 19
	addi $5, $5, -19
invN:	addi $11, $0, -1
	addi $6, $0, 1
	andi $7, $13, 1
	beq $12, $0, fimPeca
	beq $12, $6, mostra1
	addi $6, $6, 1
	beq $12, $6, mostra2
	addi $6, $6, 1
	beq $12, $6, mostra3
	addi $6, $6, 1
	beq $12, $6, mostra4
	addi $6, $6, 1
	beq $12, $6, mostra5
	addi $6, $6, 1
	beq $12, $6, mostra6
	j pxNum
		
fimPeca: jal retPilha 
	addi $2, $3, 0
	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#----------------APAGAR-----------------
# Rotina para apagar uma peca
# Entradas:	$7 endereco da peca
# Saida:	
# Usa (sem preservar): $8, $24 e $25
apagar:	addi $4, $31, 0
	jal insPilha
	addi $4, $7, 0
	jal insPilha
	lw $4, 8($7) # leu px
	lw $5, 12($7) # leu py
	lw $8, 16($7) # leu gira
	addi $6, $0, 20
	addi $7, $0, 40
	andi $8, $8, 1
	beq $8, $0, apaga
	addi $7, $0, 20
	addi $6, $0, 40	
apaga:	addi $8, $0, 0x10090200 # Apaga a peca
	lw $8, 0($8)
	jal retang
fimApag: jal retPilha 
	addi $2, $3, 0
	jal retPilha 
	addi $31, $3, 0
	jr $31

	
#----------------MOVE PECA-----------------
# Rotina para deslocar uma peca
# Entradas:	$4 endereco da peca de destino
#		$5 vira = 0 peca para cima, 1 peca para baixo
#		$6 gira
#		$7 endereco da peca
# Saida:	
# Usa (sem preservar): $8 a 17
moveP:	addi $9, $4, 0 # endereco de destino
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	jal insPilha	
	addi $4, $5, 0
	jal insPilha
	addi $4, $6, 0
	jal insPilha
	addi $4, $7, 0
	jal insPilha # guardou os dados na pilha
	jal apagar # apaga a peca na origem
	
	jal retPilha
	addi $7, $3, 0
	jal retPilha
	addi $5, $3, 0
	sw $5, 16($7) # guarda o novo valor de gira na origem
	jal retPilha
	addi $6, $3, 0
	addi $4, $6, 0
	jal insPilha
	lw $4, 8($7) # leu px0
	lw $5, 8($9) # leu pxf
	sub $8, $5, $4 # pxf - px0
	addi $5, $0, 2 #constante 2
	div $8, $5 # (pxf - px0)/2
	mflo $8 # nao deslocou porque tambem preciso do resultado negativo
	add $4, $8, $4 # (pxf - px0)/2 + px0
	sw $4, 8($7) # guarda o novo valor de x na origem
	
	lw $4, 12($7) # leu py0
	lw $5, 12($9) # leu pyf
	sub $8, $5, $4 # pyf - py0
	addi $5, $0, 2 #constante 2
	div $8, $5 # (pyf - py0)/2
	mflo $8 # nao deslocou porque tambem preciso do resultado negativo
	add $4, $8, $4 # (pyf - py0)/2 + py0
	sw $4, 12($7) # guarda o novo valor de y na origem
	jal peca
	addi $4, $0, 100
	jal atrasar # atrasar
	addi $9, $2, 0
	addi $7, $9, 0
	jal apagar
	addi $6, $2, 0
		
	jal retPilha
	addi $9, $3, 0	
	jal retPilha 
	addi $7, $3, 0	
	jal moveMem
	addi $6, $9, 0
	jal peca
	
fimMove: jal retPilha 
	addi $31, $3, 0
	jr $31


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
ponto:	addi $8, $4, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $8, 1
	addi $8, $6, 0
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $4, -2
	addi $5, $5, 1
	addi $6, $0, 4
	addi $7, $0, 2
	jal retang
	addi $4, $4, -2
	addi $5, $5, 1
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	
	
saiP:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-------------- NUMEROS-------------
#-----------------N1----------------
# Rotina para desenhar o numero 1
# Entrada: $4, $5, $6, $7, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar: $9
N1:	addi $6, $0, 0x10090200	
	lw $6, 8($6)
	addi $7, $4, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $7, 8
	addi $5, $5, 8
	jal ponto
saiN1:	jal retPilha 

	addi $31, $3, 0
	jr $31

#-----------------N2----------------
# Rotina para desenhar o numero 2
# Entrada: $4, $5, $6, $7, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar $9, $8, $23
N2:	addi $8, $0, 0x10090200	
	lw $8, 12($8)
	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $6, $8, 0
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
	addi $6, $8, 0
	lui $7, 0x1001
	jal ponto
	
saiN2:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N3----------------
# Rotina para desenhar o numero 3
# Entrada: $4, $5, $6, $7, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar $8, $9, $23
N3:	addi $8, $0, 0x10090200	
	lw $8, 16($8)
	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $6, $8, 0
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
	addi $6, $8, 0
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
	addi $6, $8, 0
	lui $7, 0x1001
	jal ponto
	
	
saiN3:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N4----------------
# Rotina para desenhar o numero 4
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=cor
# Usa sem preservar: $8, $9
N4:	addi $8, $0, 0x10090200	
	lw $8, 20($8)
	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $6, $8, 0
	addi $4, $9, 2
	addi $5, $5, 2
	lui $7, 0x1001
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 14
	addi $5, $5, -3
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 14
	addi $5, $5, 9
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 2
	addi $5, $5, -3
	jal ponto
	
saiN4:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N5----------------
# Rotina para desenhar o numero 5
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=cor
# Usa sem preservar: $9, $22
N5:	addi $8, $0, 0x10090200	
	lw $8, 24($8)
	addi $9, $4, 0	
	addi $4, $31, 0
	jal insPilha
	addi $6, $8, 0
	addi $4, $9, 2
	addi $5, $5, 2
	lui $7, 0x1001
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 14
	addi $5, $5, -3
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 8
	addi $5, $5, 3
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 14
	addi $5, $5, 3
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 2
	addi $5, $5, -3
	jal ponto
	
saiN5:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------N6----------------
# Rotina para desenhar o numero 6
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=cor e $7=girar
# Usa sem preservar: $9, $21, $22, $23
N6:	addi $8, $0, 0x10090200	
	lw $8, 28($8)
	addi $6, $8, 0	
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	
	addi $10, $7, 0
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
	lui $7, 0x1001
	jal ponto
	
	addi $6, $8, 0 # guarda a cor
	addi $7, $10, 0 # guarda o giro
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
	lui $7, 0x1001
	jal ponto
	
	addi $6, $8, 0
	addi $4, $9, 2
	addi $5, $23, 2
	lui $7, 0x1001
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 14
	addi $5, $23, 2
	jal ponto
	addi $6, $8, 0
	addi $4, $9, 14
	addi $5, $23, 14
	jal ponto
	addi $6, $8, 0
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
num1:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 2
	addi $6, $0, 1
	addi $7, $0, 6
	jal retang
	addi $4, $9, 1
	addi $5, $23, 6
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 1
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
num2:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 3
	addi $5, $23, 3
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 2
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 6
	addi $6, $0, 5
	addi $7, $0, 1
	jal retang
	
sain2:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 3----------------
# Rotina para desenhar o algarismo 3
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num3:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 3
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $23, 6
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
sain3:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 4----------------
# Rotina para desenhar o algarismo 4
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num4:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 3
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 7
	jal retang
	addi $4, $9, 1
	addi $5, $23, 5
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 2
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
num5:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 0
	addi $6, $0, 5
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 0
	addi $5, $23, 3
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $23, 6
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
sain5:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 6----------------
# Rotina para desenhar o algarismo 6
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num6:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 3
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 6
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
sain6:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 7----------------
# Rotina para desenhar o algarismo 7
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num7:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 0
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 3
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 2
	addi $5, $23, 3
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
sain7:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
numeros: addi $4, $31, 0
	jal insPilha
	addi $4, $0, 178
	addi $5, $0, 3
	jal num1
	
	addi $4, $0, 204
	addi $5, $0, 3
	jal num2
	
	addi $4, $0, 230
	addi $5, $0, 3
	jal num3
	
	addi $4, $0, 256
	addi $5, $0, 3
	jal num4
	
	addi $4, $0, 282
	addi $5, $0, 3
	jal num5
	
	addi $4, $0, 308
	addi $5, $0, 3
	jal num6
	
	addi $4, $0, 334
	addi $5, $0, 3
	jal num7
	jal retPilha 
	addi $31, $3, 0
	jr $31
