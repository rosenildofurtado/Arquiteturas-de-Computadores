.text
main: 	addi $4, $0, 128
	addi $5, $0, 256
	addi $6, $0, 0x00006600
	jal bgColor
	
	addi $4, $0, 50
	addi $5, $0, 100
	addi $6, $0, 12
	addi $7, $0, 24
	addi $8, $0, 0x00101010
fimTela: jal retang
	
	addi $4, $0, 50
	addi $5, $0, 100
	addi $6, $0, 12
	addi $7, $0, 24
	add $8, $0, $0
	jal bordaRet
	
fim:	addi $2, $0, 10
	syscall
	
# ========= ROTINAS ============================

#----------------BGCOLOR------------------
# Rotina para preencher a cor de fundo
# Entradas:	$4 L
#		$5 C
#		$6 cor
# Usa (sem preservar): $23 ao $25
bgColor: addi $25, $0, 0x10010000
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
# Entradas:	$4 end0
#		$5 l
#		$6 L
#		$7 c
# Saida:	$2
# Usa (sem preservar): $25
endPxy:	mul $25, $5, $6 # l*L
	add $25, $25, $7 # l*L+c
	sll $25, $25, 2 # (l*L+c)*4
	add $2, $25, $4 # Retorna a soma com o end0
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
	lui $4, 0x1001
	addi $6, $0, 256
	
fori:	slt $18, $22, $20
	beq $18, $0, fimFori
	addi $5, $22,0
	addi $21, $16, 0
forj:	slt $18, $21, $19
	beq $18, $0, conti
	addi $7, $21, 0
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
	lui $4, 0x1001
	addi $6, $0, 256
	addi $23, $19, -1
	addi $24, $20, -1
	
	addi $5, $22, 0
bordi:	beq $21, $19, fimBordi
	addi $7, $21, 0
	jal endPxy
	sw $8, 0($2)
	addi $5, $24, 0
	jal endPxy
	sw $8, 0($2)
	addi $5, $22 , 0
contBi:	addi $21, $21, 1
	j bordi
	
fimBordi: addi $7, $16, 0

bordj:	beq $22, $20, fimBordj
	addi $5, $22, 0
	jal endPxy
	sw $8, 0($2)
	addi $7, $23, 0
	jal endPxy
	sw $8, 0($2)
	addi $7, $16, 0
	addi $22, $22, 1
	j bordj
fimBordj: addi $31, $17, 0
	jr $31
	
#-------------- NUMEROS-------------
#-----------------N0----------------
# Rotina para desenhar o numero 0
# Entrada: $4, $5, $6, $7, $8, onde:
#	$4 = px, $5=py, $6=numero, $7=rotacao e $8 cor
# Usa sem preservar
