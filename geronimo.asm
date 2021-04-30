.text
main:
# limpa tudo
	addi $8, $0, 0
	addi $4, $0, 0 	
	addi $5, $0, 0	
	addi $6, $0, 128		
	addi $7, $0, 64
	jal retang	
#pista externa
	lui $4, 0x1001
	addi $4, $4, 1036
	addi $6, $0, 61
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 31248
	addi $6, $0, 60
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 1036
	addi $5, $0, 30
	jal linhaV
	lui $4, 0x1001
	addi $4, $4, 2032
	addi $5, $0, 30
	jal linhaV
#pista interna
	lui $4, 0x1001
	addi $4, $4, 7232
	addi $6, $0, 48
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 24132 
	addi $6, $0, 47
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 7232
	addi $5, $0, 17
	jal linhaV
	lui $4, 0x1001
	addi $4, $4, 8124
	addi $5, $0, 17
	jal linhaV
#linha de largada
	lui $4, 0x1001
	addi $4, $4,25280 #endereço de cima da largada
	addi $9, $0, 0x00800080
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	sw $9, 5120($4)
	
	
	
#carrinho tunado	
	addi $7, $0, 0x00800080	# Guarda a cor
	addi $14, $0, 50
	addi $15,$0, 53
	addi $4, $14, 0 #coluna	
	addi $5, $15, 0	#linha
	addi $8, $7, 0
	addi $6, $0, 5		
	addi $7, $0, 2
	
	jal retang	
	###############
	#jal carro
	

#Construção de um cronometro com contagem regressiva para o ínicio (3, 2, 1... GO)	
#countdown3:
	lui $4, 0x1001 #inicio do countdown3
	addi $4, $4,13040 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o countdown3
	addi $4, $4,13572
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	sw $9, 5120($4)
	lui $4, 0x1001 #meio do countdown3
	addi $4, $4,16120
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	lui $4, 0x1001 #desenhar o countdown3 parte de baixo
	addi $4, $4,18672
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	addi $2, $0, 32 #delay 1 do countdown3
	addi $4, $0, 1000
	syscall
#Apagando o countdown3	
	lui $4, 0x1001 #inicio do countdown3
	addi $4, $4,13040 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o countdown3
	addi $4, $4,13572
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	sw $9, 5120($4)
	lui $4, 0x1001 #meio do countdown3
	addi $4, $4,16120
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	lui $4, 0x1001
	addi $4, $4,18672 #desenhar o countdown3 parte de baixo
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	addi $2, $0, 32 #delay 2 do countdown3
	addi $4, $0, 1000
	syscall

#countdown2:
	lui $4, 0x1001 #inicio do countdown2
	addi $4, $4,13040 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o countdown2
	addi $4, $4,13572
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	lui $4, 0x1001 #meio do countdown2
	addi $4, $4,16112
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o countdown2
	addi $4, $4,16624
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	lui $4, 0x1001 #parte de baixo do countdown2
	addi $4, $4,18672
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	addi $2, $0, 32 #delay 1 do countdown2
	addi $4, $0, 1000
	syscall
#Apagando o countdown2:
	lui $4, 0x1001 #inicio do countdown2
	addi $4, $4,13040 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o countdown2
	addi $4, $4,13572
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	lui $4, 0x1001 #meio do countdown2
	addi $4, $4,16112
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001
	addi $4, $4,16624 #descendo o countdown2
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	lui $4, 0x1001 #parte de baixo do countdown2
	addi $4, $4,18672
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	addi $2, $0, 32 #delay 2 do countdown2
	addi $4, $0, 1000
	syscall
#countdown 1:
	lui $4, 0x1001 #número 1
	addi $4, $4,13572
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	sw $9, 5120($4)
	addi $2, $0, 32 #delay 1 do countdown1
	addi $4, $0, 1000
	syscall
#apagando o countdown1:
	lui $4, 0x1001 #número 1
	addi $4, $4,13572
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	sw $9, 5120($4)
	addi $2, $0, 32 #delay 2 do countdown1
	addi $4, $0, 1000
	syscall
#countdown go!:
#construção do G
	lui $4, 0x1001 #inicio do G
	addi $4, $4,13000 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o G
	addi $4, $4,13512 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	lui $4, 0x1001 #parte de baixo do G
	addi $4, $4,18124 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	lui $4, 0x1001 #subindo o G
	addi $4, $4,16092 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	lui $4, 0x1001 #"pontinha de dentro" do G
	addi $4, $4,16088 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
#construção do O
	lui $4, 0x1001 #inicio do O
	addi $4, $4,13044
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o O
	addi $4, $4,13556 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	lui $4, 0x1001 #parte de baixo do O
	addi $4, $4,18168 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	lui $4, 0x1001 #subindo o O
	addi $4, $4,13576 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
#ponto de exclamação !
	lui $4, 0x1001 #descendo o !
	addi $4, $4,13076 
	addi $9, $0, 0x00ba3631
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 5120($4)
	addi $2, $0, 32 #delay 1 do countdown go!
	addi $4, $0, 1000
	syscall
#apagando o countdown go!:
#apagando o G
	lui $4, 0x1001 #inicio do G
	addi $4, $4,13000 
	addi $9, $0, 0x000000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o G
	addi $4, $4,13512 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	lui $4, 0x1001 #parte de baixo do G
	addi $4, $4,18124 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	lui $4, 0x1001 #subindo o G
	addi $4, $4,16092 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	lui $4, 0x1001 #"pontinha de dentro" do G
	addi $4, $4,16088 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
#apagando o O
	lui $4, 0x1001 #inicio do O
	addi $4, $4,13044
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	sw $9, 20($4)
	lui $4, 0x1001 #descendo o O
	addi $4, $4,13556 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	lui $4, 0x1001 #parte de baixo do O
	addi $4, $4,18168 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 4($4)
	sw $9, 8($4)
	sw $9, 12($4)
	sw $9, 16($4)
	lui $4, 0x1001 #subindo o O
	addi $4, $4,13576 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
#apagando o ponto de exclamação !
	lui $4, 0x1001 #descendo o !
	addi $4, $4,13076 
	addi $9, $0, 0x00000000
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 5120($4)
	addi $2, $0, 32 #delay 2 do countdown go!
	addi $4, $0, 1000
	syscall
	
#pista externa
lerTecl:	lui $4, 0x1001
	addi $4, $4, 1036
	addi $6, $0, 61
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 31248
	addi $6, $0, 60
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 1036
	addi $5, $0, 30
	jal linhaV
	lui $4, 0x1001
	addi $4, $4, 2032
	addi $5, $0, 30
	jal linhaV
#pista interna
	lui $4, 0x1001
	addi $4, $4, 7232
	addi $6, $0, 48
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 24132 
	addi $6, $0, 47
	jal linhaH
	lui $4, 0x1001
	addi $4, $4, 7232
	addi $5, $0, 17
	jal linhaV
	lui $4, 0x1001
	addi $4, $4, 8124
	addi $5, $0, 17
	jal linhaV
#linha de largada
	lui $4, 0x1001
	addi $4, $4,25280 #endereço de cima da largada
	addi $9, $0, 0x00800080
	sw $9, 0($4)
	sw $9, 512($4)
	sw $9, 1024($4)
	sw $9, 1536($4)
	sw $9, 2048($4)
	sw $9, 2560($4)
	sw $9, 3072($4)
	sw $9, 3584($4)
	sw $9, 4096($4)
	sw $9, 4608($4)
	sw $9, 5120($4)
	


	lui $24, 0xffff
	lw $5, 0($24)
	bne $5, $0, verCaracter
	j lerTecl
verCaracter: lw $4, 4($24)
	addi $5, $0, 'a'
	beq $4, $5, esquerda_a
	addi $5, $0, 'd'
	beq $4, $5, direita_d
	addi $5, $0, 'w'
	beq $4, $5, cima_w
	addi $5, $0, 's'
	beq $4, $5, baixo_s
	addi $5, $0, 'x'
	beq $4, $5, encerrar_x
	j lerTecl
esquerda_a: 
	addi $8, $0, 0
	addi $4, $14, 0 	
	addi $5, $15, 0	
	addi $6, $0, 5		
	addi $7, $0, 5
	jal retang	
	
	addi $14, $14, -1
	addi $7, $0,00800080	# Guarda a cor
	addi $4, $14, 0 #coluna	
	addi $5, $15, 0	#linha
	
	addi $8, $7, 0
	addi $6, $0, 5	
	addi $7, $0, 2
	jal retang	
	j lerTecl
direita_d: 
	addi $8, $0, 0
	addi $4, $14, 0 	
	addi $5, $15, 0	
	addi $6, $0, 5		
	addi $7, $0, 5
	jal retang	
	
	addi $14, $14, 1
	addi $7, $0,00800080	# Guarda a cor
	addi $4, $14, 0 #coluna	
	addi $5, $15, 0	#linha
	
	addi $8, $7, 0
	addi $6, $0, 5	
	addi $7, $0, 2
	jal retang	
	j lerTecl
cima_w: 
	 addi $8, $0, 0
	addi $4, $14, 0 	
	addi $5, $15, 0	
	addi $6, $0, 5		
	addi $7, $0, 5
	jal retang	
	
	addi $15, $15, -1
	addi $7, $0,00800080	# Guarda a cor
	addi $4, $14, 0 #coluna	
	addi $5, $15, 0	#linha
	
	##################
	addi $13, $7, 0 # Guarda a cor
	addi $11, $4, 0	# Guarda o px
	addi $12, $5, 0	# Guarda o py
	
	addi $8, $7, 0
	addi $6, $0, 2	
	addi $7, $0, 5
	jal retang	
	j lerTecl
	
baixo_s: addi $8, $0, 0
	addi $4, $14, 0 	
	addi $5, $15, 0	
	addi $6, $0, 5		
	addi $7, $0, 5
	jal retang	
	
	addi $15, $15, 1
	addi $7, $0,00800080	# Guarda a cor
	addi $4, $14, 0 #coluna	
	addi $5, $15, 0	#linha
	
	addi $8, $7, 0
	addi $6, $0, 2	
	addi $7, $0, 5
	jal retang	
	j lerTecl
	
	
encerrar_x:
	addi $2, $0, 10 
	syscall

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
	
#LINHA HORIZONTAL
#entrada: endereço posição inicial $4
#	    largura $6
linhaH: 	
for_linhaH: 
	beq  $6, $0, fim_linhaH
	addi $9, $0, 0x00800080
	sw $9, 0($4) 	
	addi $9, $0, 0x00000000
	sw $9, 4($4)
	addi $4, $4, 8
	addi $6, $6, -1
	j for_linhaH	
fim_linhaH:	
	jr $31
	
#LINHA VERTICAL
#entrada: endereço posição inicial $4
#	    altura $5
linhaV: 
for_linhaV:				 
	beq $5, $0, fim_linhaV
	addi $9, $0, 0x00800080
	sw $9, 0($4) 	
	addi $9, $0, 0x00000000
	sw $9, 512($4)
	addi $4, $4, 1024
	addi $5, $5, -1
	j for_linhaV	
fim_linhaV:	
	jr $31
	
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
#		$5 py
#		$7 cor
carro: 	addi $13, $7, 0 # Guarda a cor
	addi $11, $4, 0	# Guarda o px
	addi $12, $5, 0	# Guarda o py
	addi $8, $0, 0
	
	addi $4, $11, 0 	
	addi $5, $12, 0	
	addi $6, $0, 7		
	addi $7, $0, 4
	jal bordaRet	
	addi $4, $11, 1 	
	addi $5, $12, 1	
	addi $6, $0, 5		
	addi $7, $0, 2
	addi $8, $13, 0
	jal retang		
	jr $31
