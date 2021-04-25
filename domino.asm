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

	.word 0x00009900 0x00ffff00 0x00880000 0x00ff0000 0x0000ff00 
# cores:	verdEsc,  amarelo,   vermEsc,  	vermelho,   verde
.data 0x10090300
	.word 256 512 20 40 4 # Dimensoes
	.word 420 23 220 0x00ff0000 0x0000ff00 # pontos do indica vez

.data 0x10090a00
	.word -1 -1 103 13 0 -1 -1 129 13 0 -1 -1 155 13 0 -1 -1 181 13 0 -1 -1 207 13 0 -1 -1 233 13 0 
	.word -1 -1 259 13 0 -1 -1 285 13 0 -1 -1 311 13 0 -1 -1 337 13 0 -1 -1 363 13 0 -1 -1 389 13 0 # pecas do jogador
	.word 12 0 # quantidad de pecas
.data 0x10090b00
	.word -1 -1 103 210 0 -1 -1 129 210 0 -1 -1 155 210 0 -1 -1 181 210 0 -1 -1 207 210 0 -1 -1 233 210 0 
	.word -1 -1 259 210 0 -1 -1 285 210 0 -1 -1 311 210 0 -1 -1 337 210 0 -1 -1 363 210 0 -1 -1 389 210 0 # pecas do computador
	.word 12 1 # quantidad de pecas
.data 0x10090c00
	.word -1 -1 4 13 0 -1 -1 24 13 0 -1 -1 44 13 0 -1 -1 64 13 0 # pecas do morto
.data 0x10090d00
	.word 0 0 0 0 0 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1 # quantidade de peÃ§as e quantos pontos o jogador tem
	.word 0 0 0 0 0 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1 # quantidade de peÃ§as e quantos pontos o computador tem
	.word 8 8 8 8 8 8 8 # Total de pecas que estao no jogo
.data 0x10090e00
	.word -1 -1 226 108 1
	.word 1 0 0 # indica qual jogador comeca, o jogador da vez e se passou
.data 0x10091000
	.word 8 -1 -1 -1 206 128 3 -1 -1 186 108 3 -1 -1 166 128 3 -1 -1 146 108 3 -1 -1 126 128 3 -1 -1 106 108 3 
	.word -1 -1 86 128 3 -1 -1 66 108 3 -1 -1 46 128 3 -1 -1 26 108 3 -1 -1 6 128 3 -1 -1 6 88 2 
	.word -1 -1 26 68 2 -1 -1 6 48 2 -1 -1 26 48 1 -1 -1 46 68 1 -1 -1 66 48 1 -1 -1 86 68 1 
	.word -1 -1 106 48 1 -1 -1 126 68 1 -1 -1 146 48 1 -1 -1 166 68 1 -1 -1 186 48 1 -1 -1 206 68 1 
	.word -1 -1 226 48 1 -1 -1 246 68 1 -1 -1 266 48 1
.data 0x10091800
	.word 8 -1 -1 -1 246 128 1 -1 -1 266 108 1 -1 -1 286 128 1 -1 -1 306 108 1 -1 -1 326 128 1 -1 -1 346 108 1 
	.word -1 -1 366 128 1 -1 -1 386 108 1 -1 -1 406 128 1 -1 -1 426 108 1 -1 -1 446 128 1 -1 -1 466 108 1 
	.word -1 -1 486 128 0 -1 -1 466 148 0 -1 -1 486 168 0 -1 -1 446 188 3 -1 -1 426 168 3 -1 -1 406 188 3 
	.word -1 -1 386 168 3 -1 -1 366 188 3 -1 -1 346 168 3 -1 -1 326 188 3 -1 -1 306 168 3 -1 -1 286 188 3 
	.word -1 -1 266 168 3 -1 -1 246 188 3 -1 -1 226 168 3

#===============.TEXT=====================
.text
main: 	lui $4, 0x1009
	addi $4, $4, 0x0300 # quantas linha tem na tela
	lw $4, 0($4)
	lui $5, 0x1009
	addi $5, $5, 0x0304 # quantas colunas tem na tela
	lw $5, 0($5)
	lui $6, 0x1009
	addi $6, $6, 0x0200 # cor do background
	lw $6, 0($6)
	jal bgColor # Background verde	
	jal strMorto
	jal numeros # mostra os numeros de 1 a 12
	jal passaVez
	jal embaralhar
	
	addi $4, $0, 1
	beq $4, $0, pxJogada
	jal passaVez
	j compComeca
pxJogada: jal selPeca
	beq $2, $0, vGanhou
	jal impPedras
compComeca: jal pecaComp
	beq $2, $0, vPerdeu
	jal impPedras
	j pxJogada
	
vGanhou: j fim
vPerdeu: j fim

fim:	addi $2, $0, 10
	syscall
	
# ========= ROTINAS ============================

#--------------PECA COMPUTADOR-------------------
# Rotina para selecionar uma peca do computador
# Entradas:	
# Usa (sem preservar): $24, $25
pecaComp: addi $4, $31, 0
	jal insPilha
	addi $5, $0, 1
	jal temPeca
	bne $2, $0, cNaoPas
	addi $5, $0, 1
	jal passou
	j fimJogC
cNaoPas: jal maisPeca
	lui $8, 0x1009
	addi $8, $8, 0x1000
	lw $4, 4($8)
	addi $5, $0, -1
	bne $4, $5, maiorP	
	jal escCarroca
	addi $7, $2, 0
	addi $5, $0, -1
	beq $5, $7, maiorP
	lui $6, 0x1009
	addi $6, $6, 0x0d00
	addi $6, $6, 64
	jal primPeca
	jal fimJogC

maiorP: jal escMP
	addi $4, $0, -1
	beq $4, $2, fimJogC
	addi $7, $2, 0
	jal jogaPeca
	
fimJogC: jal retPilha
	addi $31, $3, 0
	jr $31

#--------------JOGA PECA-------------------
# Rotina para jogar uma peca
# Entradas:	$7 endereco da peca
# Saidas: $2 0 para ganhou e outro valor para nao ganhou
# Usa (sem preservar): $24, $25
jogaPeca: addi $4, $31, 0
	jal insPilha
	lui $8, 0x1009
	addi $8, $8, 0x1000	
	lw $4, 4($8)
	addi $5, $8, 0x0800
	lw $6, 4($5)
	bne $4, $6, contAnalize # se as pontas sao iguais, tanto faz o lado
	jal jogaDir
	j fimJogada
	
contAnalize:	lw $24, 0($7)
	lw $25, 4($7)
	bne $24, $25, nCarroc
	beq $24, $4, jLadEsq
	jal jogaDir
	j fimJogada
jLadEsq: jal jogaEsq
	j fimJogada
	
nCarroc: beq $4, $24, jLadEsq
	beq $4, $25, jLadEsq
	jal jogaDir
	j fimJogada

	
fimJogada: 
	jal retPilha
	addi $31, $3, 0
	jr $31
	
#--------------JOGA NA ESQUERDA-------------------
# Rotina para jogar uma peca na ponta esquerda
# Entradas:	$7 endereco da peca
# Saidas: $2 0 para ganhou e outro valor para nao ganhou
# Usa (sem preservar): $8, $24, $25
jogaEsq: addi $4, $31, 0
	addi $2, $0, -1
	jal insPilha
	
	lui $8, 0x1009
	addi $8, $8, 0x1000	 # enderecos das pedras da direita
	lw $4, 4($8) # ler o numero da ponta
	lw $24, 0($7) 
	bne $4, $24, giraPecE # compara se os números sao iguais
	lw $24, 4($7)
	sw $24, 4($8) # grava o novo numero da ponta
	
contGiE:	lui $5, 0x1009
	addi $5, $5, 0x0b00
	lui $6, 0x1009
	addi $6, $6, 0x0d00
	addi $6, $6, 64
	slt $4, $7, $5
	beq $4, $0, verContE
	addi $6, $6, -64
	addi $5, $5, -0x0100
verContE: lw $4, 240($5)
	addi $4, $4, -1
	sw $4, 240($5)
	jal insPilha
	lw $5, 0($8)
	add $4, $5, $8 # endereco de destino
	jal insPilha
	addi $5, $5, 20
	sw $5, 0($8) # atualiza a posicao do proximo endereco
	addi $4, $7, 0
	jal insPilha
	j jogaE
	
giraPecE: sw $24, 4($8) # grava o novo numero da ponta
	addi $4, $24, 0
	lw $24, 4($7)
	sw $24, 0($7) # inverte os numeros da peca
	sw $4, 4($7)
	j contGiE
	
# tem que chegar aqui com:
# $6 = endereco do contador
# $7 = endereco da peca
# $8 = endereco de destino
jogaE:	 jal retPontos
	
	lui $8, 0x1009
	addi $8, $8, 0x0200
	lw $8, 0($8)
	lw $4, 8($7)
	addi $4, $4, -3
	lw $5, 12($7)
	addi $5, $5, -12
	addi $6, $0, 26
	addi $7, $0, 55
	jal bordaRet
	
	jal retPilha
	addi $7, $3, 0
	jal retPilha
	addi $4, $3, 0
	addi $5, $0, 0
	addi $6, $0, 1
	jal moveP
	
	jal passaVez	
		
fimJogadaE: lui $8, 0x1009
	addi $8, $8, 0x0e00
	sw $0, 28($8)
	jal retPilha
	addi $2, $3, 0
	
	jal retPilha
	addi $31, $3, 0
	jr $31

#--------------JOGA NA DIREITA-------------------
# Rotina para jogar uma peca na direita
# Entradas:	$7 endereco da peca
# Saidas: $2 0 para ganhou e outro valor para nao ganhou
# Usa (sem preservar): $8, $24, $25
jogaDir: addi $4, $31, 0
	addi $2, $0, -1
	jal insPilha
	
	lui $8, 0x1009
	addi $8, $8, 0x1800	 # enderecos das pedras da direita
	lw $4, 4($8) # ler o numero da ponta
	lw $24, 0($7) 
	bne $4, $24, giraPecaD # compara se os números sao iguais
	lw $24, 4($7)
	sw $24, 4($8) # grava o novo numero da ponta
	
contGiD:	lui $5, 0x1009
	addi $5, $5, 0x0b00
	lui $6, 0x1009
	addi $6, $6, 0x0d00
	addi $6, $6, 64
	slt $4, $7, $5
	beq $4, $0, verContD
	addi $6, $6, -64
	addi $5, $5, -0x0100
verContD: lw $4, 240($5)
	addi $4, $4, -1
	sw $4, 240($5)
	jal insPilha
	lw $5, 0($8)
	add $4, $5, $8 # endereco de destino
	jal insPilha
	addi $5, $5, 20
	sw $5, 0($8) # atualiza a posicao do proximo endereco
	addi $4, $7, 0
	jal insPilha
	j jogaD
	
giraPecaD: sw $24, 4($8) # grava o novo numero da ponta
	addi $4, $24, 0
	lw $24, 4($7)
	sw $24, 0($7) # inverte os numeros da peca
	sw $4, 4($7)
	j contGiD
	
# tem que chegar aqui com:
# $6 = endereco do contador
# $7 = endereco da peca
# $8 = endereco de destino
jogaD:	 jal retPontos
	
	lui $8, 0x1009
	addi $8, $8, 0x0200
	lw $8, 0($8)
	lw $4, 8($7)
	addi $4, $4, -3
	lw $5, 12($7)
	addi $5, $5, -12
	addi $6, $0, 26
	addi $7, $0, 55
	jal bordaRet
	
	jal retPilha
	addi $7, $3, 0
	jal retPilha
	addi $4, $3, 0
	addi $5, $0, 0
	addi $6, $0, 1
	jal moveP
	
	jal passaVez	
		
fimJogadaD: lui $8, 0x1009
	addi $8, $8, 0x0e00
	sw $0, 28($8)
	jal retPilha
	addi $2, $3, 0
	
	jal retPilha
	addi $31, $3, 0
	jr $31
	
#--------------TRANCOU-------------------
# Rotina do tranca
# Entradas:	$5 menor numero
#		$6 maior numero
#		#7 endereco
# Saidas:	$2 Endereco da peca ou -1 se nao achar
# Usa (sem preservar): $24, $25
trancou: jal retPilha
	addi $4, $31, 0
	jal insPilha
	
	jal retPilha
	addi $31, $3, 0
	jr $31

#--------------PROCURA PECA-------------------
# Rotina para procurar uma peca
# Entradas:	$5 menor numero
#		$6 maior numero
#		#7 endereco
# Saidas:	$2 Endereco da peca ou -1 se nao achar
# Usa (sem preservar): $25
procPeca: addi $4, $31, 0
	jal insPilha
	addi $2, $0, -1
	slt $4, $5, $6
	bne $4, $0, ctrocP
	addi $4, $5, 0
	addi $5, $6, 0
	addi $6, $4, 0
ctrocP:	addi $4, $0, 12
trocP: beq $4, $0, fimProcP
	lw $25, 0($7)
	bne $25, $5, pxProcP
	lw $25, 4($7)
	bne $25, $6, pxProcP
	addi $2, $7, 0
	j fimProcP
pxProcP: addi $4, $4, -1
	addi $7, $7, 20
	j trocP
	
fimProcP: jal retPilha
	addi $31, $3, 0
	jr $31


#--------------ESCOLHE MAIOR PECA-------------------
# Rotina para escolher o numero com mais pecas
# Entradas:	
# Saidas:	$2 endereco da peca
# Usa (sem preservar): $24, $25
escMP:	addi $4, $31, 0
	jal insPilha
	
	lui $7, 0x1009
	addi $7, $7, 0x0b00
	lui $8, 0x1009
	addi $8, $8, 0x1004
	lw $5 0($8) # numero da ponta esquerda
	slt $25, $5, $0
	bne $25, $0, primJog # testa se e a primeira jogada
	addi $8, $8, 0x0800
	lw $6 0($8)# numero da ponta direita
	beq $6, $5, procCarr
	slt $25, $5, $6
	addi $4, $5, 0
	beq $25, $0, invM
	addi $4, $6, 0
	addi $6, $5, 0
	addi $5, $4, 0
invM:	lui $8, 0x1009
	addi $8, $8, 0x0d40
	sll $25, $5, 2
	add $25, $25, $8
	lw $24, 0($25)
	beq $24, $0, naoTPE
	lw $23, 32($25)
	bne $23, $5, testOutP
	addi $6, $5, 0
	lui $7, 0x1009
	addi $7, $7, 0x0b00
	jal procPeca
	j fimEscMP
	
procCarr: jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	j testOutP
	
naoTPE: sll $25, $6, 2
	add $25, $25, $8
	lw $24, 0($25)
	beq $24, $0, naoTPE
	lw $23, 32($25)
	bne $23, $6, testOutP
	addi $5, $6, 0
	lui $7, 0x1009
	addi $7, $7, 0x0b00
	jal procPeca
	j fimEscMP

		
testOutP: lui $7, 0x1009
	addi $7, $7, 0x0b00
	addi $14, $7, 0
	lui $8, 0x1009
	addi $8, $8, 0x1004
	
	lw $5 248($7) # maior
	addi $16, $5, 0 # maior
	lw $17 252($7) # segundo maior
	
	lw $4 0($8) # numero da ponta esquerda
	addi $15, $4, 0 # numero da ponta esquerda
	addi $8, $8, 0x0800
	lw $6 0($8)# numero da ponta direita
	addi $16, $6, 0 # numero da ponta direita
	bne $6, $5, proc1
	addi $6, $4, 0
proc1:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $17, 0
	addi $6, $15, 0
	addi $7, $14, 0
	bne $6, $5, proc2
	addi $6, $16, 0
proc2:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $16, 0
	addi $6, $15, 0
	addi $7, $14, 0
proc3:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $0, 6
	addi $6, $15, 0
	addi $7, $14, 0
proc4:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	addi $5, $0, 6
	addi $6, $16, 0
	addi $7, $14, 0
proc5:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $0, 5
	addi $6, $15, 0
	addi $7, $14, 0
proc6:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	addi $5, $0, 5
	addi $6, $16, 0
	addi $7, $14, 0
proc7:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $0, 4
	addi $6, $15, 0
	addi $7, $14, 0
proc8:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	addi $5, $0, 4
	addi $6, $16, 0
	addi $7, $14, 0
proc9:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $0, 3
	addi $6, $15, 0
	addi $7, $14, 0
proc10:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	addi $5, $0, 3
	addi $6, $16, 0
	addi $7, $14, 0
proc11:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $0, 2
	addi $6, $15, 0
	addi $7, $14, 0
proc12:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	addi $5, $0, 2
	addi $6, $16, 0
	addi $7, $14, 0
proc13:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $0, 1
	addi $6, $15, 0
	addi $7, $14, 0
proc14:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	addi $5, $0, 1
	addi $6, $16, 0
	addi $7, $14, 0
proc15:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
	addi $5, $0, 0
	addi $6, $15, 0
	addi $7, $14, 0
proc16:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	addi $5, $0, 0
	addi $6, $16, 0
	addi $7, $14, 0
proc17:	jal procPeca
	addi $4, $0, -1
	bne $4, $2, fimEscMP
	
primJog: lui $7, 0x1009
	addi $7, $7, 0x0b00
	lw $5 248($7)
	lw $6 252($7)
	jal procPeca
	addi $4, $0, -1
	bne $2, $4, fimEscMP
	addi $8, $0, 6
priEncont: slt $7, $8, $0
	bne $7, $0, fimEscMP
	lui $7, 0x1009
	addi $7, $7, 0x0b00
	lw $5 248($7)
	lw $6 252($7)
	jal procPeca
	addi $4, $0, -1
	bne $2, $4, fimEscMP
	addi $8, $8, -1
	jal priEncont

fimEscMP: jal retPilha
	addi $31, $3, 0
	jr $31
	
#--------------ESCOLHE CARROCA-------------------
# Rotina para escolher uma carroca
# Entradas:	
# Usa (sem preservar): $24, $25
escCarroca: addi $4, $31, 0
	jal insPilha
	addi $5, $0, 5
	addi $6, $0, 1
	jal procCarroca
	addi $7, $0, -1
	bne $7, $2, fimProc
	addi $5, $0, 4
	addi $6, $0, 3
	jal procCarroca
	addi $7, $0, -1
	bne $7, $2, fimProc
	addi $5, $0, 6
	addi $6, $0, 1
	jal procCarroca
	addi $7, $0, -1
	bne $7, $2, fimProc

fimEscC: jal retPilha
	addi $31, $3, 0
	jr $31
	
#-----------PROCURA CARROCA--------------
# Rotina para o computador procurar  uma carroca
# Entradas:	$5 quantas pecas tem a carroca
#		$6 carroca maior ou igual a que
# Saidas:	$2 endereco da carroca
# Usa (sem preservar): $23, $24 e $25	
procCarroca: addi $2, $0, -1
	addi $4, $31, 0
	jal insPilha
	lui $10, 0x1009
	addi $10, $10, 0x0d00
	addi $10, $10, 64
	addi $4, $0, 6
vCarrocas: slt $7, $4, $6
	bne $7, $0, fimProc
	sll $7, $4, 2
	lui $11, 0x1009
	addi $11, $11, 0x0d00
	addi $11, $11, 128
	add $11, $11, $7
	lw $11, 0($11)
	addi $8, $0, 8
	sub $11, $8, $11
	add $7, $10, $7
	addi $7, $7, 32
	lw $9 0($7)
	bne $9, $4, dimProc
	addi $7, $7, -32
	lw $9 0($7)
	add $9, $9, $11
	bne $9, $5, dimProc
	j encCarroca
	
	
dimProc: addi $4, $4, -1
	j vCarrocas
	
encCarroca: lui $9, 0x1009
	addi $9, $9, 0x0b00
	addi $7, $7, 32
	sw $2, 0($7)
	addi $5, $0, 0
	addi $6, $0, 12
buscCarroca: beq $0, $6, fimProc
	lw $7, 0($9)
	bne $7, $4, contBusca
	lw $7, 4($9)
	bne $7, $4, contBusca
	addi $2, $9, 0
	j fimProc
	
contBusca: addi $9, $9, 20
	addi $6, $6, -1
	j buscCarroca

fimProc: jal retPilha
	addi $31, $3, 0
	jr $31

#--------------MAIS PECAS-------------------
# Rotina para ver qual numero tem mais pecas
# Entradas: 
# Usa (sem preservar): $23, $24 e $25
maisPeca: addi $4, $31, 0
	jal insPilha
	
	addi $4, $0, 6
	addi $24, $0, 0 # maior
	addi $23, $0, 0 # segundo maior
forMP:	lui $7, 0x1009
	addi $7, $7, 0x0d00
	addi $7, $7, 64
	lui $5, 0x1009
	addi $5, $5, 0x0d00
	addi $5, $5, 128
	slt $25, $4, $0
	bne $25, $0, fimMP
	sll $6, $4, 2
	add $5, $5, $6
	add $6, $6, $7
	lw $6, 0($6)
	beq $6, $0, incForMP
	addi $25, $0, 8
	lw $5, 0($5)
	sub $5, $25, $5 
	add $6, $6, $5
	slt $25, $24, $6
	beq $25, $0, testaSM # testa segundo maior
	lui $7, 0x1009
	addi $7, $7, 0x0b00
	addi $7, $7, 248
	lw $5, 0($7)
	sw $5, 4($7)
	sw $4, 0($7)
	add $23, $0, $24
	add $24, $0, $6
	
incForMP: addi $4, $4, -1
	j forMP
testaSM: slt $25, $23, $6
	beq $25, $0, incForMP
	lui $7, 0x1009
	addi $7, $7, 0x0b00
	addi $7, $7, 248
	sw $4, 4($7)
	add $23, $0, $6
	j incForMP
	
fimMP:	jal retPilha
	addi $31, $3, 0
	jr $31

#--------------SELECIONA PECA-------------------
# Rotina para selecionar uma peca
# Entradas:	
# Usa (sem preservar): $24, $25
selPeca: addi $4, $31, 0
	jal insPilha
	lui $9, 0x1009
	addi $9, $9, 0x0e00
	lw $9, 0($9)
	addi $5, $0, -1
	beq $5, $9, jNaoPas
	addi $5, $0, 0
	jal temPeca
	bne $2, $0, jNaoPas
	addi $5, $0, 0
	jal passou
	j fimSel
jNaoPas:
	lui $9, 0x1009
	addi $9, $9, 0x0a00
	addi $13, $9, 0
	addi $27, $0, 0 # contador
	lw $11, 240($9)
selProx: lw $12, 0($9)
	slt $12, $12, $0 # ver se existe uma peca. -1 = nao tem
	beq $12, $0, selRet
	addi $9, $9, 20
	j selProx # Se nao tem, checa a proxima posicao
selRet:	addi $27, $27, 1
bordaPeca: lui $8, 0x1009
	addi $8, $8, 0x0200
	lw $8, 8($8)
	lw $4, 8($9)
	lw $5, 12($9)
	addi $4, $4, -3
	addi $5, $5, -12
	addi $6, $0, 26
	addi $7, $0, 55
	jal bordaRet
	j lerTecl
retLixo: jal retPilha	
lerTecl: lui $4, 0xffff
	lw $5, 0($4)
	bne $5, $0, verCaracter
	j lerTecl
verCaracter: lw $4, 4($4)
	jal insPilha
	addi $5, $0, 'a'
	beq $4, $5, char_a
	addi $5, $0, 'd'
	beq $4, $5, char_d
	addi $5, $0, 'q'
	beq $4, $5, primeiraE
	addi $5, $0, 'e'
	beq $4, $5, primeiraD
	jal retPilha
	j lerTecl
	
primeiraE: lui $7, 0x1009
	addi $7, $7, 0x0e00
	lw $7, 0($7)
	addi $4, $0, -1
	beq $4, $7, primeira
	addi $7, $9, 0
	addi $4, $9, 0
	jal insPilha
	addi $5, $0, 0
	jal pecaErrada
	jal retPilha
	addi $9, $3, 0
	beq $2, $0, retLixo
	j primeira
primeiraD: lui $7, 0x1009
	addi $7, $7, 0x0e00
	lw $7, 0($7)
	addi $4, $0, -1
	beq $4, $7, primeira
	addi $7, $9, 0
	addi $4, $9, 0
	jal insPilha
	addi $5, $0, 1
	jal pecaErrada
	jal retPilha
	addi $9, $3, 0
	beq $2, $0, retLixo
	j primeira
	
char_a:	jal retPilha
	addi $13, $9, 0
	addi $7, $0, 1
	slt $7, $7, $27
	beq $7, $0, lerTecl
	addi $7, $0, -1
selReduz: addi $9, $9, -20
	lw $6, 0($9)
	beq $6, $7, selReduz
	addi $27, $27, -1
	j mudaSel
	
char_d:	jal retPilha
	addi $13, $9, 0
	lui $6, 0x1009
	addi $6, $6, 0x0a00
	lw $7, 240($6)
	slt $7, $27, $7
	beq $7, $0, lerTecl
	addi $7, $0, -1
selAum: addi $9, $9, 20
	lw $6, 0($9)
	beq $6, $7, selAum # testa se tem peca na posicao. -1 = nao tem
	addi $27, $27, 1
	j mudaSel
	
mudaSel: lui $8, 0x1009
	addi $8, $8, 0x0200
	lw $8, 0($8)
	lw $4, 8($13)
	lw $5, 12($13)
	addi $4, $4, -3
	addi $5, $5, -12
	addi $6, $0, 26
	addi $7, $0, 55
	jal bordaRet
	lui $8, 0x1009
	addi $8, $8, 0x0200
	lw $8, 8($8)
	lw $4, 8($9)
	lw $5, 12($9)
	addi $6, $0, 26
	addi $7, $0, 55
	j bordaPeca
	
primeira: lui $8, 0x1009
	addi $8, $8, 0x1000
	lui $6, 0x1009
	addi $6, $6, 0x0d00
	lw $4, 4($8)
	addi $5, $0, -1
	bne $4, $5, moveq
	addi $7, $9, 0
	jal primPeca
	jal retPilha
	j fimSel
	
moveq:	jal retPilha
	addi $8, $0, 'q'
	beq $8, $3, ladoEsq
	addi $7, $9, 0
	jal jogaDir
	j fimSel
	
ladoEsq: addi $5, $0, 0
	addi $6, $0, 0
	addi $7, $9, 0
	jal jogaEsq
	j fimSel

fimSel:	addi $27, $0, 0
	jal retPilha
	addi $31, $3, 0
	jr $31
	
#-----------PRIMEIRA PECA--------------
# Rotina para jogar a primeira peca
# Entradas:	$6 endereco do contador
#		$7 endereco da peca 
# Usa (sem preservar): $23, $24 e $25
primPeca: addi $4, $31, 0
	jal insPilha
	jal retPontos
	
	lui $25, 0x1009
	addi $25, $25, 0x1000
	lw $24, 0($7)
	sw $24, 4($25)
	lui $25, 0x1009
	addi $25, $25, 0x1800
	lw $24, 4($7)
	sw $24, 4($25)
	lui $8, 0x1009
	addi $8, $8, 0x0200
	lw $8, 0($8)
	addi $4, $7, 0
	jal insPilha
	lw $4, 8($7)
	addi $4, $4, -3
	lw $5, 12($7)
	addi $5, $5, -12
	addi $6, $0, 26
	addi $7, $0, 55
	jal bordaRet
	
	jal retPilha
	addi $7, $3, 0
	addi $4, $7, 0
	jal insPilha
	lui $4, 0x1009
	addi $4, $4, 0x0e00
	addi $5, $0, 0
	addi $6, $0, 1
	jal moveP
	jal passaVez	
	
	jal retPilha
	addi $7, $3, 0
	lui $8, 0x1009
	addi $8, $8, 0x0b00
	slt $7, $7, $8
	beq $7, $0, dimP
	lui $8, 0x1009
	addi $8, $8, 0x0a00
dimP:	lw $4, 240($8)
	addi $4, $4, -1
	sw $4, 240($8)
	lui $8, 0x1009
	addi $8, $8, 0x0e00
	lw $4, 28($8)
	addi $4, $0, 0
	sw $4, 28($8)
	
	jal retPilha
	addi $31, $3, 0
	jr $31
	
	

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
	addi $4, $0, 30
	jal atrasar # atrasar
	jal retPilha
	addi $7, $3, 0
	addi $4, $7, 0
	jal insPilha # guardou os dados na pilha
	jal apagar # apaga a peca na origem
	
	jal retPilha
	addi $7, $3, 0
	jal retPilha
	addi $5, $3, 0
	#sw $5, 16($7) # guarda o novo valor de gira na origem
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
	addi $4, $0, 30
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
endPxy:	mul $25, $5, 512 # l*L
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
	
#---------------TEM PECA-------------
# Rotina para ver se tem a peca
# Entrada: 	$5 0 para jogador ou 1 para computador
# Saidas: 	$2 0 para nao tem e 1 para tem
# Usa sem preservar: 
temPeca: addi $4, $31, 0
	jal insPilha
	addi $2, $0, 0
	lui $4, 0x1009
	addi $4, $4, 0x0d00
	beq $5, $0, verJogador
	addi $4, $4, 64
verJogador: lui $6, 0x1009
	addi $6, $6, 0x1004
	lw $5, 0($6)
	sll $5, $5, 2
	add $5, $5, $4
	lw $5, 0($5)
	bne $5, $0, temPec
	addi $6, $6, 0x0800
	lw $5, 0($6)
	sll $5, $5, 2
	add $5, $5, $4
	lw $5, 0($5)
	beq $5, $0, fimTemP
temPec: addi $2, $0, 1
	
fimTemP: jal retPilha 
	addi $31, $3, 0
	jr $31
	
#---------------PASSOU-------------
# Rotina para indicar que passou 
# Entrada: 	$5 0 para jogador ou 1 para computador
# Saidas: 	
# Usa sem preservar: 
passou: addi $4, $31, 0
	jal insPilha
	jal indAmarelo
	
	lui $4, 0x1009
	addi $4, $4, 0x0e00
	lw $5, 28($4)
	bne $5, $0, trancou
	addi $5, $5, 1
	sw $5, 28($4)
	jal passaVez
	
fimPassou: jal retPilha 
	addi $31, $3, 0
	jr $31
	
#---------------PECA ERRADA-------------
# Rotina para ver se a peca escolhida esta errada 
# Entrada: 	$5 lado 0 para esquerdo e 1 para direito
#		$7 endereco da peca
# Saidas: 	$2 0 para sim e 1 para nao
# Usa sem preservar: 
pecaErrada: addi $4, $31, 0
	jal insPilha
	addi $2, $0, 0
	lui $4, 0x1009
	addi $4, $4, 0x1000
	beq $5, $0, testPEE
	addi $4, $4, 0x0800
testPEE: lw $5, 4($4)
	lw $6, 0($7)
	beq $5, $6, taCerta
	lw $6, 4($7)
	beq $5, $6, taCerta
	addi $5, $0, 0
	jal indAmarelo
	lui $4, 0x1009
	addi $4, $4, 0x0e00
	addi $7, $4, -0x0b00
	
	lw $5, 24($7)
	lw $4, 20($7)
	lw $7, 32($7)
	jal indicaVez
	addi $2, $0, 0	
	j fimPErr
taCerta: addi $2, $0, 1	
fimPErr: jal retPilha 
	addi $31, $3, 0
	jr $31

#---------------INDICA AMARELO-------------
# Rotina para mudar o indicador para amarelo
# Entrada: $5 0 para jogador ou 1 para computador
# Saidas:
# Usa sem preservar  $25
indAmarelo: addi $4, $31, 0
	jal insPilha
	lui $6, 0x1009
	addi $6, $6, 0x0300
	addi $25, $5, 0
	
	lui $7, 0x1009
	addi $7, $7, 0x0200
	lw $7, 24($7)
	lw $5, 24($6)
	lw $4, 20($6)
	beq $25, $0, pintaInd
	lw $5, 28($6)
pintaInd: jal indicaVez
	addi $4, $0, 100
	jal atrasar
fimAmarelo: jal retPilha 
	addi $31, $3, 0
	jr $31
	
#---------------PASSA VEZ-------------
# Rotina para mudar os indicadores de vez
# Entrada: 
# Saidas:
# Usa sem preservar:
passaVez: addi $4, $31, 0
	jal insPilha
	lui $4, 0x1009
	addi $4, $4, 0x0300
	jal insPilha
	lw $6, 32($4)
	lw $7, 36($4)
	sw $7, 32($4)
	sw $6, 36($4)
	lw $5, 24($4)
	lw $4, 20($4)
	jal indicaVez
	jal retPilha
	lw $4, 20($3)
	lw $5, 28($3)
	lw $7, 36($3)
	jal indicaVez
	
	jal retPilha
	addi $31, $3, 0
	jr $31

	
#---------------INDICA VEZ-------------
# Rotina para desenhar um circulo para indicar de quem e a vez
# Entrada: $4, $5 e $7 onde:
#	$4 = px, $5=py, $7=cor
# Usa sem preservar  $8 ao $11
	
indicaVez: add $9, $0, $4 # px
	addi $10, $5, 0 # py
	add $8, $0, $7 # cor
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 4	
	addi $5, $10, 2
	addi $6, $0, 13
	addi $7, $0, 17
	jal retang
	addi $4, $9, 2
	addi $5, $10, 6
	addi $6, $0, 2
	addi $7, $0, 9
	jal retang
	addi $4, $9, 17
	addi $5, $10, 6
	addi $6, $0, 2
	addi $7, $0, 9
	jal retang
	
	addi $8, $0, 0x00bbbbbb
	addi $4, $9, 9
	addi $5, $10, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 20
	addi $5, $10, 9
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	addi $4, $9, 13
	addi $5, $10, 1
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 15
	addi $5, $10, 2
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 17
	addi $5, $10, 3
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 18
	addi $5, $10, 4
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 19
	addi $5, $10, 6
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
	addi $8, $0, 0x00999999
	addi $4, $9, 8
	addi $5, $10, 1
	addi $6, $0, 5
	addi $7, $0, 1
	jal retang
	addi $4, $9, 8
	addi $5, $10, 19
	addi $6, $0, 5
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $10, 8
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 19
	addi $5, $10, 8
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	
	addi $4, $9, 13
	addi $5, $10, 2
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 15
	addi $5, $10, 3
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 17
	addi $5, $10, 4
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 18
	addi $5, $10, 6
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
	addi $4, $9, 18
	addi $5, $10, 13
	addi $6, $0, 1
	addi $7, $0, 4
	jal retang
	addi $4, $9, 17
	addi $5, $10, 15
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 15
	addi $5, $10, 17
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 13
	addi $5, $10, 18
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	
	addi $4, $9, 6
	addi $5, $10, 18
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $10, 17
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 3
	addi $5, $10, 15
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $10, 13
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
	addi $4, $9, 2
	addi $5, $10, 4
	addi $6, $0, 1
	addi $7, $0, 4
	jal retang
	addi $4, $9, 3
	addi $5, $10, 4
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 4
	addi $5, $10, 3
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 6
	addi $5, $10, 2
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	
	addi $8, $0, 0x00aaaaaa
	addi $4, $9, 6
	addi $5, $10, 1
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $10, 2
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 3
	addi $5, $10, 3
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 19
	addi $5, $10, 13
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
	addi $8, $0, 0x00888888
	addi $4, $9, 17
	addi $5, $10, 17
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 15
	addi $5, $10, 18
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 13
	addi $5, $10, 19
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $10, 6
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	
	addi $8, $0, 0x00777777
	addi $4, $9, 9
	addi $5, $10, 20
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 6
	addi $5, $10, 19
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $10, 18
	addi $6, $0, 2
	addi $7, $0, 1
	jal retang
	addi $4, $9, 3
	addi $5, $10, 17
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 2
	addi $5, $10, 15
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $10, 13
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 0
	addi $5, $10, 9
	addi $6, $0, 1
	addi $7, $0, 3
	jal retang
	
fimVez: jal retPilha 
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
	
#-----------------NUM 8----------------
# Rotina para desenhar o algarismo 8
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num8:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 1
	addi $5, $23, 3
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 2
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
	
sain8:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 9----------------
# Rotina para desenhar o algarismo 9
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num9:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 1
	addi $5, $23, 3
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 6
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	
sain9:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------NUM 0----------------
# Rotina para desenhar o algarismo 0
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
num0:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 0
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 5
	jal retang
	addi $4, $9, 1
	addi $5, $23, 6
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	
sain0:	jal retPilha 
	addi $31, $3, 0
	jr $31

#-----------------LETRA M----------------
# Rotina para desenhar a letra M
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
letraM:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 7
	jal retang
	addi $4, $9, 4
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 7
	jal retang
	addi $4, $9, 1
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 2
	addi $5, $23, 2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 3
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
saiLM:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------LETRA R----------------
# Rotina para desenhar a letra R
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
letraR:	addi $8, $0, 0x10090200	
	lw $8, 8($8)
	addi $9, $4, 0	
	addi $23, $5, 0
	addi $4, $31, 0
	jal insPilha
	addi $4, $9, 0
	addi $5, $23, 0
	addi $6, $0, 1
	addi $7, $0, 7
	jal retang
	addi $4, $9, 1
	addi $5, $23, 0
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 1
	addi $5, $23, 3
	addi $6, $0, 3
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 2
	jal retang
	addi $4, $9, 2
	addi $5, $23, 4
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 3
	addi $5, $23, 5
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $9, 4
	addi $5, $23, 6
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
saiLR:	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#-----------------LETRA T----------------
# Rotina para desenhar a letra T
# Entrada: $4, $5, $6, onde:
#	$4 = px, $5=py, $6=escala
# Usa sem preservar: $9, $21, $22, $23
letraT:	addi $8, $0, 0x10090200	
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
	addi $4, $9, 2
	addi $5, $23, 1
	addi $6, $0, 1
	addi $7, $0, 6
	jal retang
	
saiLT:	jal retPilha 
	addi $31, $3, 0
	jr $31

#--------------NUMEROS---------------	
numeros: addi $4, $31, 0
	jal insPilha
	addi $4, $0, 114
	addi $5, $0, 3
	jal num1
	
	addi $4, $0, 140
	addi $5, $0, 3
	jal num2
	
	addi $4, $0, 166
	addi $5, $0, 3
	jal num3
	
	addi $4, $0, 192
	addi $5, $0, 3
	jal num4
	
	addi $4, $0, 218
	addi $5, $0, 3
	jal num5
	
	addi $4, $0, 244
	addi $5, $0, 3
	jal num6
	
	addi $4, $0, 270
	addi $5, $0, 3
	jal num7
	addi $4, $0, 296
	addi $5, $0, 3
	jal num8
	addi $4, $0, 322
	addi $5, $0, 3
	jal num9
	addi $4, $0, 341
	addi $5, $0, 3
	jal num1
	addi $4, $0, 348
	addi $5, $0, 3
	jal num0
	addi $4, $0, 367
	addi $5, $0, 3
	jal num1
	addi $4, $0, 374
	addi $5, $0, 3
	jal num1
	addi $4, $0, 393
	addi $5, $0, 3
	jal num1
	addi $4, $0, 400
	addi $5, $0, 3
	jal num2
	
	jal retPilha 
	addi $31, $3, 0
	jr $31
	
#--------------MORTO---------------	
strMorto: addi $4, $31, 0
	jal insPilha
	addi $4, $0, 30
	addi $5, $0, 3
	jal letraM
	
	addi $4, $0, 36
	addi $5, $0, 3
	jal num0
	
	addi $4, $0, 42
	addi $5, $0, 3
	jal letraR
	
	addi $4, $0, 48
	addi $5, $0, 3
	jal letraT
	
	addi $4, $0, 54
	addi $5, $0, 3
	jal num0
	
	jal retPilha 
	addi $31, $3, 0
	jr $31

#--------CONTA PONTOS-----------
# Rotina para contar os pontos dos jogadores
# Entrada: $6, $7, onde:
#	$6 = endereco do contador
#	$7 = endereco da peca
# Usa sem preservar: $23, $24 e $25
contPontos: addi $4, $31, 0
	jal insPilha
	lw $24, 0($7)
	lw $25, 4($7)
	bne $24, $25, carroca
	sll $23, $24, 2
	addi $23, $23, 32
	add $23, $23, $6
	sw $24, 0($23)
carroca: lw $23, 28($6)
	add $23, $23, $24
	add $23, $23, $25
	sw $23, 28($6)
	sll $24, $24, 2
	add $24, $6, $24
	lw $23, 0($24)
	addi $23, $23, 1
	sw $23, 0($24)
	sll $25, $25, 2
	add $25, $6, $25
	lw $23, 0($25)
	addi $23, $23, 1
	sw $23, 0($25)
	jal retPilha
	addi $31, $3, 0
	jr $31
	
#--------RETIRA PONTOS-----------
# Rotina para diminuir os pontos dos jogadores
# Entrada: $6, $7, onde:
#	$6 = endereco do contador
#	$7 = endereco da peca
# Usa sem preservar: $23, $24 e $25
retPontos: addi $4, $31, 0
	jal insPilha
	lw $24, 0($7)
	lw $25, 4($7)
	bne $24, $25, jCarroca
	addi $4, $0, -1
	sll $23, $24, 2
	addi $23, $23, 32
	add $23, $23, $6
	sw $4, 0($23)
jCarroca: lui $4, 0x1009
	addi $4, $4, 0x0d00
	addi $4, $4, 128
	lw $23, 28($6)
	sub $23, $23, $24
	sub $23, $23, $25
	sw $23, 28($6)
	sll $24, $24, 2
	add $4, $4, $24
	add $24, $6, $24
	lw $23, 0($24)
	addi $23, $23, -1
	sw $23, 0($24)
	lw $23, 0($4)
	addi $23, $23, -1
	sw $23, 0($4)
	lui $4, 0x1009
	addi $4, $4, 0x0d00
	addi $4, $4, 128
	sll $25, $25, 2
	add $4, $4, $25
	add $25, $6, $25
	lw $23, 0($25)
	addi $23, $23, -1
	sw $23, 0($25)
	lw $23, 0($4)
	addi $23, $23, -1
	sw $23, 0($4)
	jal retPilha
	addi $31, $3, 0
	jr $31
	
#--------IMPRIME PEDRAS-----------
# Rotina para imprimir as pecas jogadas
# Entrada: 
# Saidas:
# Usa sem preservar: $23, $24 e $25
impPedras: addi $4, $31, 0
	jal insPilha
	addi $6, $0, 0
	lui $7, 0x1009
	addi $7, $7, 0x0e00
	jal peca
	
	lui $7, 0x1009
	addi $7, $7, 0x1008
verPontE:	lw $5, 0($7)
	slt $4, $5, $0
	bne $4, $0, contImpD
	addi $6, $0, 0
	jal peca
	addi $7, $2, 20
	j verPontE
	
contImpD: lui $7, 0x1009
	addi $7, $7, 0x1808
verPontD:	lw $5, 0($7)
	slt $4, $5, $0
	bne $4, $0, fimImpP
	addi $6, $0, 0
	jal peca
	addi $7, $2, 20
	j verPontD
	
fimImpP:	jal retPilha
	addi $31, $3, 0
	jr $31

#---------DISTRIBUIR-------------	
# Embaralha e distribui as pecas
embaralhar: addi $4, $31, 0
	jal insPilha
	
	addi $10, $0, 0x10090a00
	addi $11, $0, 0x10090b00
	addi $8, $0, 28
distrib: addi $4, $10, 0
	jal insPilha
	addi $4, $11, 0
	jal insPilha
	addi $4, $8, 0
	jal insPilha
	addi $2, $0, 41 # gera um numero aleatorio
	syscall
	
	div $4, $8
	mfhi $5 # resto aleatorio
	slt $4, $4, $0
	beq $4, $0, contDis
	sub $5, $0, $5
contDis: addi $6, $0, 0x10090000
	jal buscaEnd
	addi $6, $2, 0
	lui $7, 0x1009
	addi $7, $7, 0x0e00
	jal moveMem
	addi $7, $0, 0x10090e00
	addi $6, $0, 1
	jal peca
	addi $7, $2, 0
	jal retPilha
	addi $8, $3, 0
	addi $4, $8, 0
	jal insPilha
	addi $4, $0, 7
	div $8, $4
	mfhi $9
	beq $9, $0, morto	
	jal retPilha
	addi $8, $3, 0
	jal retPilha
	addi $11, $3, 0
	jal retPilha
	addi $10, $3, 0
	
	andi $4, $8, 1
	beq $4, $0, dJog1
	addi $5, $11, 0
	addi $11, $11, 20
	addi $4, $10, 0
	jal insPilha
	addi $4, $11, 0
	jal insPilha
	addi $4, $8, 0
	jal insPilha
	lui $6, 0x1009
	addi $6, $6, 0x0d00
	addi $6, $6, 64
	jal contPontos
	addi $4, $5, 0
	
	addi $5, $0, 1 # esconde as pecas do computador
	
	addi $6, $0, 0
	lui $7, 0x1009
	addi $7, $7, 0x0e00
	j dist	
dJog1:	addi $5, $10, 0
	addi $10, $10, 20
	addi $4, $10, 0
	jal insPilha
	addi $4, $11, 0
	jal insPilha
	addi $4, $8, 0
	jal insPilha
	lui $6, 0x1009
	addi $6, $6, 0x0d00
	jal contPontos
	addi $4, $5, 0
	addi $5, $0, 0
	addi $6, $0, 0
	lui $7, 0x1009
	addi $7, $7, 0x0e00
	j dist	
	
morto:	jal retPilha
	addi $8, $3, 0
	addi $4, $8, 0
	jal insPilha
	andi $7, $8, 3
	mul $7, $7, 20
	lui $5, 0x1009
	addi $5, $5, 0x0c00
	add $7, $7, $5
	addi $4, $7, 0
	lui $7, 0x1009
	addi $7, $7, 0x0e00
	addi $6, $0, 0
	addi $5, $0, 1
	j dist
dist:	jal moveP
	addi $4, $0, 226
	lui $7, 0x1009
	addi $7, $7, 0x0e00
	sw $4, 8($7)
	addi $4, $0, 108
	sw $4, 12($7)
	addi $4, $0, 1
	sw $4, 16($7)
	jal retPilha
	addi $8, $3, 0
	jal retPilha
	addi $11, $3, 0
	jal retPilha
	addi $10, $3, 0
	addi $8, $8, -1
fimDist: bne $8, $0, distrib
	jal retPilha
	addi $31, $3, 0
	jr $31
