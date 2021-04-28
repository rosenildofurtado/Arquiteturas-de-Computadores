.text

main: 
	addi $4, $0, 50	
	addi $5, $0, 30		
	addi $7, $0, 0x0000ff00
	jal carro
	
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
insPilha: lui $25, 0x1009
	addi $25, $25, 0x0400
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
retPilha: lui $25, 0x1009
	addi $25, $25, 0x0400
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
endPxy:	mul $25, $5, 128 # l*L
	add $25, $25, $4 # l*L+c
	sll $25, $25, 2 # (l*L+c)*4
	lui $2, 0x1001
	add $2, $2, $25 # Retorna a soma com o end0
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
	addi $6, $0, 128 # quantas colunas tem na tela
		
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
	addi $4, $31, 0
	jal insPilha
	
	addi $4, $21, 0
	add $20, $7, $5 # py+tamy
	add $19, $6, $21 # px+tamx
	addi $6, $21, 0
	
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
	
fimBordi: addi $4, $6, 0

bordj:	beq $22, $20, fimBordj
	addi $5, $22, 0
	jal endPxy
	sw $8, 0($2)
	addi $4, $19, 0
	jal endPxy
	sw $8, 0($2)
	addi $4, $6, 0
	addi $22, $22, 1
	j bordj
fimBordj: jal retPilha 
	addi $31, $3, 0
	jr $31

# Rotina para desenhar um carro
# Entradas: 	$4 px
#			$5 py
#			$7 cor
carro: addi $8, $7, 0 	# Guarda a cor
	addi $11, $4, 0		# Guarda o px
	addi $12, $5, 0		# Guarda o py
	
	addi $4, $11, 0 	
	addi $5, $12, 0	
	addi $6, $0, 6		
	addi $7, $0, 2
	jal retang	
	addi $4, $11, 1 	
	addi $5, $12, -1	
	addi $6, $0, 2		
	addi $7, $0, 4
	jal retang	
	addi $4, $11, 4	
	addi $5, $12, -1	
	addi $6, $0, 2		
	addi $7, $0, 4
	jal retang	
	jr $31