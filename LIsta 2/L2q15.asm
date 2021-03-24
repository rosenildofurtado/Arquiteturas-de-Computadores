.test
	# Foi usado o algoritmo de Zeller, tirado de:
	# http://programacionnerd.blogspot.com/2012/05/c-ejemplos-congruencia-de-zeller-nivel.html
main: 	addi $2, $0, 5
	syscall
	add $8, $2, $0 # dia
	addi $2, $0, 5
	syscall
	add $9, $2, $0 # mes
	addi $2, $0, 5
	syscall
	add $10, $2, $0 # ano
	addi $11, $0, 12 # constante 12
	addi $12, $0, 3 # constante 3
	addi $13, $0, 1 # constante 1

if:	slt $14, $9, $12
	beq $14, $0, else
	addi $9, $9, 12 # mes + 12
	addi $10, $10, -1 # ano - 1
	j endif
else:	subi $9, $9, 2
	addi $12, $0, 100 # constante 100	
endif:	div $10, $12
j:	mflo $15
k:	mfhi $16

	# Aplicando na formula:
	# h = ((700 + ((26*mes - 2)/10) + dia + k + (k/4) + ((j/4) + 5*j)) % 7);
	addi $17, $0, 26
	addi $18, $0, 10
	addi $19, $0, 5
	addi $20, $0, 7
	mul $21, $17, $9
	subi $21, $21, 2
	div $21, $18
	mflo $21 # ((26*mes - 2)/10)
	srl $22, $16, 2 # (k/4)
	srl $23, $15, 2 # (j/4)
	mul $24, $15, $19 # 5*j
	addi $25, $21, 700
	add $25, $25, $8
	add $25, $25, $16
	add $25, $25, $22
	add $25, $25, $23
	add $25, $25, $24
	# addi $25, $25, -2
	div $25, $20
h:	mfhi $25

	# imprimi dia
	addi $8, $0, 0
	addi $9, $0, 'd'
	addi $10, $0, 'o'
	addi $11, $0, 'm'
	
	beq $25, $8, dia # domingo
	addi $8, $8, 1
	addi $9, $0, 's'
	addi $10, $0, 'e'
	addi $11, $0, 'g'
	
	beq $25, $8, dia # segunda
	addi $8, $8, 1
	addi $9, $0, 't'
	addi $10, $0, 'e'
	addi $11, $0, 'r'
	
	beq $25, $8, dia # terca
	addi $8, $8, 1
	addi $9, $0, 'q'
	addi $10, $0, 'u'
	addi $11, $0, 'a'
	
	beq $25, $8, dia # quarta
	addi $8, $8, 1
	addi $9, $0, 'q'
	addi $10, $0, 'u'
	addi $11, $0, 'i'
	
	beq $25, $8, dia # quinta
	addi $8, $8, 1
	addi $9, $0, 's'
	addi $10, $0, 'e'
	addi $11, $0, 'x'
	
	beq $25, $8, dia # sexta
	addi $8, $8, 1
	addi $9, $0, 's'
	addi $10, $0, 'a'
	addi $11, $0, 'b' # sabado
	
dia:	addi $4, $9, 0
	addi $2, $0, 11
	syscall
	addi $4, $10, 0
	addi $2, $0, 11
	syscall
	addi $4, $11, 0
	addi $2, $0, 11
	syscall
		
fim:	addi $2, $0, 10
	syscall
