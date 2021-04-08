.data 0x10200000
	.word 0 0 0 1 0 2 0 3 0 4 0 5 0 6 # Pecas do domino
	.word 1 1 1 2 1 3 1 4 1 5 1 6
	.word 2 2 2 3 2 4 2 5 2 6
	.word 3 3 3 4 3 5 3 6
	.word 4 4 4 5 4 6
	.word 5 5 5 6
	.word 6 6
.data 0x10200100
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # peças do jogador
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # peças do computador a
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # peças do computador b
	.word -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 # peças do computador c
.data 0x10200200
	.word 0x00006600 0x00ffffff 0x00888888 0x00880000 0x00ffff00 # cores
	.word 0x00008800 0x00000088 0x00ffa500 0x00ff0000 0x0000ff00 # cores
.data 0x10200300
	.word 256 512 20 40 4 # Dimensoes
	
	
.text
main: 	
	addi $4, $0, 0x10200300 # quantas linha tem na tela
	lw $4, 0($4)
	addi $5, $0, 0x10200304 # quantas colunas tem na tela
	lw $5, 0($5)
	addi $6, $0, 0x10200200 # cor do background
	lw $6, 0($6)
	jal bgColor # Background verde
		
	addi $4, $0, 49
	addi $5, $0, 101
	addi $6, $0, 20
	addi $7, $0, 40
	add $8, $0, $0
	jal bordaRet
	
	addi $4, $0, 50
	addi $5, $0, 100
	addi $6, $0, 20
	addi $7, $0, 40

fimTela: jal retang
	
fim:	addi $2, $0, 10
	syscall
	
# ========= ROTINAS ============================

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
# Entrada: $4, $5, $6, $7, onde:
#	$4 = px, $5=py, $6=tamx e $7=tamy
# Usa sem preservar  $17 ao $25
	
retang:	addi $17, $31, 0
	add $22, $0, $5 # j=$5
	add $21, $0, $4 # i=$4
	add $16, $0, $4 # i=$4
	add $20, $7, $5 # py+tamy
	add $19, $6, $4 # px+tamx
	lui $7, 0x1001
	addi $6, $0, 0x10200304 # quantas colunas tem na tela
	lw $6, 0($6)
	addi $8, $0, 0x10200208 # quantas colunas tem na tela
	lw $8, 0($8)
	
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
fimFori: addi $31, $17, 0
	jr $31


#---------------BORDARET-------------
# Rotina para desenhar a borda de um retangulo
# Entrada: $4, $5, $6, $7, $8, onde:
#	$4 = px, $5=py, $6=tamx, $7=tamy e $8 cor
# Usa sem preservar $17 ao $25
	
bordaRet: addi $17, $31, 0
	add $22, $0, $5 # j=$5
	add $21, $0, $4 # i=$4
	add $16, $0, $4 # i=$4
	add $20, $7, $5 # py+tamy
	add $19, $6, $4 # px+tamx
	lui $7, 0x1001
	addi $6, $0, 0x10200304 # quantas colunas tem na tela
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
fimBordj: addi $31, $17, 0
	jr $31

#-------------- PONTO --------------
# Rotina para desenhar um ponto
# Entrada: $4, $5, $6, $7 onde:
#	$4 = px, $5=py, $6=cor, $7=end inicial
# Usa sem preservar
ponto:	addi $9, $31, 0
	addi $10, $0, 0x10200310 # dimensoes do ponto
	lw $10, 0($10)
	addi $11, $0, 0x10200304 # L 
	lw $11, 0($11)
	
	
	
#-------------- NUMEROS-------------
#-----------------N1----------------
# Rotina para desenhar o numero 0
# Entrada: $4, $5, $6, $8, onde:
#	$4 = px, $5=py, $6=rotacao e $8 cor
# Usa sem preservar
N1:	addi $15, $31, 0
	addi $8, $0, 0x10200204
	lw $8, 0($8)
	addi $14, $0, 0x10200308
	lw $14, 0($14)
	

