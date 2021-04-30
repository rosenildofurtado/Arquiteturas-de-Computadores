.text
	# Primeiro Piso
	addi $9,$0,50
	
	addi $12,$0,115
	addi $11,$0,0
	addi $13,$0,0 
	addi $14,$0,0 
	#addi $16,$0,0
	addi $15,$0,80 #posicao max do macaco em x
	addi $17,$0,6 #posicao do macaco em x
	
 main:	addi $8, $0, 0		#Main:
	addi $4, $0, 0
	addi $5, $0, 0
	addi $6, $0, 128
	addi $7, $0, 128
	jal retang
mover:	addi $8, $0, 0x00ffff00
	addi $4, $0, 2
	addi $5, $0, 124
	addi $6, $0, 60
	addi $7, $0, 2
	jal retang
	addi $4, $0, 62
	addi $5, $0, 123
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 72
	addi $5, $0, 122
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 82
	addi $5, $0, 121
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 92
	addi $5, $0, 120
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 102
	addi $5, $0, 119
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 112
	addi $5, $0, 118
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	
	# Segundo Piso	
	addi $4, $0, 90
	addi $5, $0, 96
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 80
	addi $5, $0, 95
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 70
	addi $5, $0, 94
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 60
	addi $5, $0, 93
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 50
	addi $5, $0, 92
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 40
	addi $5, $0, 91
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 30
	addi $5, $0, 90
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 20
	addi $5, $0, 89
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 10
	addi $5, $0, 88
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 0
	addi $5, $0, 87
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	
	# Terceiro Piso	
	addi $4, $0, 22
	addi $5, $0, 66
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 32
	addi $5, $0, 65
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 42
	addi $5, $0, 64
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 52
	addi $5, $0, 63
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 62
	addi $5, $0, 62
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 72
	addi $5, $0, 61
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 82
	addi $5, $0, 60
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 92
	addi $5, $0, 59
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 102
	addi $5, $0, 58
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 112
	addi $5, $0, 57
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	
	# Quarto Piso
	addi $4, $0, 92
	addi $5, $0, 36
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 82
	addi $5, $0, 35
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 72
	addi $5, $0, 34
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 62
	addi $5, $0, 33
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 52
	addi $5, $0, 32
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 42
	addi $5, $0, 31
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 32
	addi $5, $0, 30
	addi $6, $0, 10
	addi $7, $0, 2
	jal retang
	addi $4, $0, 1
	addi $5, $0, 29
	addi $6, $0, 31
	addi $7, $0, 2
	jal retang
	
	# Quinto piso
	addi $4, $0, 32
	addi $5, $0, 18
	addi $6, $0, 20
	addi $7, $0, 2
	jal retang
	
	# Escada
	addi $8, $0, 0x0000fff0
	addi $4, $0, 92
	addi $5, $0, 98
	addi $6, $0, 1
	addi $7, $0, 22
	jal retang
	addi $4, $0, 97
	addi $5, $0, 98
	addi $6, $0, 1
	addi $7, $0, 22
	jal retang
	addi $4, $0, 93
	addi $5, $0, 100
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 93
	addi $5, $0, 104
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 93
	addi $5, $0, 108
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 93
	addi $5, $0, 112
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 93
	addi $5, $0, 116
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	
	# Escada dois
	addi $8, $0, 0x0000fff0
	addi $4, $0, 22
	addi $5, $0, 68
	addi $6, $0, 1
	addi $7, $0, 21
	jal retang
	addi $4, $0, 27
	addi $5, $0, 68
	addi $6, $0, 1
	addi $7, $0, 21
	jal retang
	addi $4, $0, 23
	addi $5, $0, 70
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 23
	addi $5, $0, 74
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 23
	addi $5, $0, 78
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 23
	addi $5, $0, 82
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 23
	addi $5, $0, 86
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	
	# Escada tres
	addi $8, $0, 0x0000fff0
	addi $4, $0, 94
	addi $5, $0, 38
	addi $6, $0, 1
	addi $7, $0, 21
	jal retang
	addi $4, $0, 99
	addi $5, $0, 38
	addi $6, $0, 1
	addi $7, $0, 21
	jal retang
	addi $4, $0, 95
	addi $5, $0, 40
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 95
	addi $5, $0, 44
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 95
	addi $5, $0, 48
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 95
	addi $5, $0, 52
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 95
	addi $5, $0, 56
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	
	# Escada quatro
	addi $8, $0, 0x0000fff0
	addi $4, $0, 43
	addi $5, $0, 20
	addi $6, $0, 1
	addi $7, $0, 11
	jal retang
	addi $4, $0, 48
	addi $5, $0, 20
	addi $6, $0, 1
	addi $7, $0, 11
	jal retang
	addi $4, $0, 44
	addi $5, $0, 22
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 44
	addi $5, $0, 26
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	addi $4, $0, 44
	addi $5, $0, 30
	addi $6, $0, 4
	addi $7, $0, 1
	jal retang
	
	
	
	
	
	
	
	# Mario
	addi $8, $0, 0x000000aa
	addi $4, $11, 8
	addi $5, $12, 0 
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $4, $11, 9
	addi $5, $12, -3
	addi $6, $0, 6
	addi $7, $0, 4
	jal retang
	addi $8, $0, 0x00aa0000
	addi $4, $11, 10
	addi $5, $12, 1
	addi $6, $0, 4
	addi $7, $0, 4
	jal retang
	addi $4, $11, 6
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 16
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 9
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 13
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $8, $0, 0x00E5E5E5
	addi $4, $11, 10
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $11, 13
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
	addi $4,$0,1
	#jal atrasar
	
	
	andi $16, $13, 7
	bne $16, $0, pulaPrinc
	
#bonecos em preto
	# Princesa
	addi $8, $0, 0
	addi $4, $14, 34
	addi $5, $0, 9
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $4, $14, 35
	addi $5, $0, 6
	addi $6, $0, 6
	addi $7, $0, 3
	jal retang
	addi $8, $0, 0
	addi $4, $14, 36
	addi $5, $0, 10
	addi $6, $0, 4
	addi $7, $0, 4
	jal retang
	addi $4, $14, 32
	addi $5, $0, 10
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $14, 42
	addi $5, $0, 10
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $14, 35
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $14, 39
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $8, $0, 0
	addi $4, $14, 36
	addi $5, $0, 7
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $14, 39
	addi $5, $0, 7
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	jal movPrinc
	
	# Princesa
	addi $8, $0, 0x00993399
	addi $4, $14, 34
	addi $5, $0, 9
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $4, $14, 35
	addi $5, $0, 6
	addi $6, $0, 6
	addi $7, $0, 3
	jal retang
	addi $8, $0, 0x00FF007F
	addi $4, $14, 36
	addi $5, $0, 10
	addi $6, $0, 4
	addi $7, $0, 4
	jal retang
	addi $4, $14, 32
	addi $5, $0, 10
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $14, 42
	addi $5, $0, 10
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $14, 35
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $14, 39
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $8, $0, 0x00E5E5E5
	addi $4, $14, 36
	addi $5, $0, 7
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $14, 39
	addi $5, $0, 7
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
pulaPrinc: andi $16, $13, 15
	bne $16, $0, lerTecl
	
	# Macaco
	addi $8, $0, 0
	addi $4, $17, 0
	addi $5, $0, 18
	addi $6, $0, 12
	addi $7, $0, 8
	jal retang
	addi $4, $17, 2
	addi $5, $0, 14
	addi $6, $0, 8
	addi $7, $0, 4
	jal retang
	addi $4, $17, 2
	addi $5, $0, 25
	addi $6, $0, 2
	addi $7, $0, 3
	jal retang
	addi $4, $17, 8
	addi $5, $0, 25
	addi $6, $0, 2
	addi $7, $0, 3
	jal retang
	addi $4, $17, -3
	addi $5, $0, 20
	addi $6, $0, 3
	addi $7, $0, 3
	jal retang
	addi $4, $17, 12
	addi $5, $0, 20
	addi $6, $0, 3
	addi $7, $0, 3
	jal retang
	addi $8, $0, 0
	addi $4, $17, 2
	addi $5, $0, 19
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $8, $0, 0
	addi $4, $17, 3
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $17, 7
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	
	jal movMac

	# Macaco
	addi $8, $0, 0x00FF7A00
	addi $4, $17, 0
	addi $5, $0, 18
	addi $6, $0, 12
	addi $7, $0, 8
	jal retang
	addi $4, $17, 2
	addi $5, $0, 14
	addi $6, $0, 8
	addi $7, $0, 4
	jal retang
	addi $4, $17, 2
	addi $5, $0, 25
	addi $6, $0, 2
	addi $7, $0, 3
	jal retang
	addi $4, $17, 8
	addi $5, $0, 25
	addi $6, $0, 2
	addi $7, $0, 3
	jal retang
	addi $4, $17, -3
	addi $5, $0, 20
	addi $6, $0, 3
	addi $7, $0, 3
	jal retang
	addi $4, $17, 12
	addi $5, $0, 20
	addi $6, $0, 3
	addi $7, $0, 3
	jal retang
	addi $8, $0, 0x00463325
	addi $4, $17, 2
	addi $5, $0, 19
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $8, $0, 0x00E5E5E5
	addi $4, $17, 3
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $17, 7
	addi $5, $0, 15
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
			
	#addi $4,$0,50 #tempo do atraso
	#jal atrasar
	
lerTecl: lui $4, 0xffff
	lw $10, 0($4)
	bne $10, $0, verCaracter
	j cont
verCaracter: lw $10, 4($4)
	addi $4,$0,'d'
	beq $10,$4,MarioDir
	addi $4,$0,'a'
	beq $10,$4,MarioEsq
	addi $4,$0,'w'
	beq $10,$4,MarioSob
	addi $4,$0,'s'
	beq $10,$4,MarioDesc
	j cont
MarioDir: 
	addi $8, $0, 0
	addi $4, $11, 8
	addi $5, $12, 0 
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $4, $11, 9
	addi $5, $12, -3
	addi $6, $0, 6
	addi $7, $0, 4
	jal retang
	addi $4, $11, 10
	addi $5, $12, 1
	addi $6, $0, 4
	addi $7, $0, 4
	jal retang
	addi $4, $11, 6
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 16
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 9
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 13
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 10
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $11, 13
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
		
moveToRight:	
	addi $11,$11, 5
	j cont
	
MarioEsq:
	addi $8, $0, 0
	addi $4, $11, 8
	addi $5, $12, 0 
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $4, $11, 9
	addi $5, $12, -3
	addi $6, $0, 6
	addi $7, $0, 4
	jal retang
	addi $4, $11, 10
	addi $5, $12, 1
	addi $6, $0, 4
	addi $7, $0, 4
	jal retang
	addi $4, $11, 6
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 16
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 9
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 13
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 10
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $11, 13
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	
moveToLeft:
	addi $11,$11, -5
	j cont
	
MarioSob:
addi $8, $0, 0
	addi $4, $11, 8
	addi $5, $12, 0 
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $4, $11, 9
	addi $5, $12, -3
	addi $6, $0, 6
	addi $7, $0, 4
	jal retang
	addi $4, $11, 10
	addi $5, $12, 1
	addi $6, $0, 4
	addi $7, $0, 4
	jal retang
	addi $4, $11, 6
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 16
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 9
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 13
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 10
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $11, 13
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $12,$12, -5
	j cont

MarioDesc:
	addi $8, $0, 0
	addi $4, $11, 8
	addi $5, $12, 0 
	addi $6, $0, 8
	addi $7, $0, 6
	jal retang
	addi $4, $11, 9
	addi $5, $12, -3
	addi $6, $0, 6
	addi $7, $0, 4
	jal retang
	addi $4, $11, 10
	addi $5, $12, 1
	addi $6, $0, 4
	addi $7, $0, 4
	jal retang
	addi $4, $11, 6
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 16
	addi $5, $12, 1
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 9
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 13
	addi $5, $12, 6
	addi $6, $0, 2
	addi $7, $0, 2
	jal retang
	addi $4, $11, 10
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $4, $11, 13
	addi $5, $12, -2
	addi $6, $0, 1
	addi $7, $0, 1
	jal retang
	addi $12,$12, 5
	j cont		

			
cont:	#add $9,$9,$9
	beq $9,$0,fim
	addi $13, $13, 1
	j mover
fim:	addi $2, $0, 10
	syscall
	
# ========= ROTINAS ============================


#---------------MACACO-----------------
# Rotina para fazer o macaco se movimentar
# Entradas:	$17 posicao relativa 
# Usa (sem preservar): $17, $16,$15
movMac:
	addi $15,$0,18
	beq $17,$15,meioMac
	beq $17,$0,meioMac
	addi $17,$17,1
	j fimMovMac
	
meioMac:	addi $17,$0,6
	j fimMovMac	


fimMovMac:	jr $31
#---------------PRINCESA-----------------
# Rotina para fazer o macaco se movimentar
# Entradas:	$17 posicao relativa 
# Usa (sem preservar): $17, $16,$15
movPrinc:
	addi $15,$0,13
	beq $14,$15,meioPrinc
	addi $14,$14,1
	beq $14,$0,meioPrinc
	j fimMovMac
	
meioPrinc:	addi $14,$0, 0
	j fimMovPrinc	

fimMovPrinc:	jr $31




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
