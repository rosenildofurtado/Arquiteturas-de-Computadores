.text
main: 	
	addi $4, $0, 126
	addi $5, $0, 256
	addi $6, $0, 0x00006600
	jal bgColor
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 256
	addi $7, $0, 128
	addi $19, $0, 0x00ff0000

			
fimTela: jal retang

	
fim:	addi $2, $0, 10
	syscall
	
# ========= ROTINAS ============================

#----------------BGCOLOR------------------
# Rotina para preencher a cor de fundo
# Entradas:	$4 L
#		$5 C
#		$6 cor
# Usa (sem preservar): $25
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
# Usa sem preservar
	
retang:	addi $17, $31, 0
	addi $24, $0, 256 
	addi $23, $0, 0x00006600
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
	sw $23, 0($2)
	
	addi $21, $21, 1
	j forj
conti:	addi $22, $22, 1
	j fori
fimFori: addi $31, $17, 0
	jr $31


	
	
	



	addi $2, $0, 5
	syscall
	add $8, $0, $2 # k
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # px
	addi $2, $0, 5
	syscall
	add $10, $0, $2 # py	
	addi $11, $0, -104 # constante -104
	addi $12, $0, 104 # constante 104
	addi $13, $0, 0 # contador
	
while:	beq $13, $8, fim
	addi $2, $0, 5
	syscall
	add $14, $0, $2 # px
	addi $2, $0, 5
	syscall
	add $15, $0, $2 # px
	beq $14, $9, DV
	beq $15, $10, DV
	slt $25, $14, $9
	beq $25, $0, testey
	slt $24, $15, $10
	beq $24, $0, NO
	j SO
	
testey: slt $24, $15, $10
	beq $24, $0, NE
	j SE
	
DV:	addi $4, $0, 'D'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'V'
	syscall
	addi $4, $0, ' '
	syscall
	addi $13, $13, 1
	j while
	
NO:	addi $4, $0, 'N'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'O'
	syscall
	addi $4, $0, ' '
	syscall
	addi $13, $13, 1
	j while
	
NE:	addi $4, $0, 'N'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'E'
	syscall
	addi $4, $0, ' '
	syscall
	addi $13, $13, 1
	j while
	
SO:	addi $4, $0, 'S'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'O'
	syscall
	addi $4, $0, ' '
	syscall
	addi $13, $13, 1
	j while
	
SE:	addi $4, $0, 'S'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'E'
	syscall
	addi $4, $0, ' '
	syscall
	addi $13, $13, 1
	j while
sai:

