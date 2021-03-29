.text # Algoritmo de Meeus/Jones/Butcher (Wikipedia)
main:	addi $2, $0, 5
	syscall
	addi $8, $0, 100 # constante 100
	addi $9, $0, 31 # constante 31
	addi $10, $0, 25 # constante 25
	addi $11, $0, 114 # constante 114
	addi $12, $0, 8 # constante 8
	addi $13, $0, 19 # constante 19
	
	div $2, $13
a:	mfhi $14 # a = ANO MOD 19
	div $2, $8
b:	mflo $15 # b = ANO \ 100
c:	mfhi $16 # c = ANO MOD 100
	addi $17, $0, 4 # constante 4
	div $15, $17
d:	mflo $18 # d = b \ 4
e:	mfhi $19 # e = b MOD 4
	add $20, $15, $12
	div $20, $10 
f:	mflo $21 # f = (b + 8) \ 25
	addi $17, $0, 3 # constante 3
	sub $22, $15, $21
	addi $22, $22, 1
	div $22, $17
g:	mflo $23 # g = (b - f + 1) \ 3
	mult $13, $14
	mflo $24
	add $24, $24, $15
	sub $24, $24, $18
	sub $24, $24, $23
	addi $24, $24, 15
	addi $17, $0, 30 # constante 30
	div $24, $17
h:	mfhi $24 # h = (19 × a + b - d - g + 15) MOD 30
	addi $17, $0, 4 # constante 4
	div $16, $17
i:	mflo $25 # i = c \ 4
k:	mfhi $22 # k = c MOD 4		
	add $10, $25, $19
	sll $10, $10, 1
	addi $10, $10, 32
	sub $10, $10, $24
	sub $10, $10, $22
	addi $17, $0, 7 # constante 7
	div $10, $17
L:	mfhi $10 # L = (32 + 2 × e + 2 × i - h - k) MOD 7
	addi $20, $0, 11 # constante 11
	mult $24, $20
	mflo $8
	addi $20, $0, 22 # constante 22
	mult $10, $20
	mflo $9
	add $8, $8, $9
	add $8, $8, $14
	addi $20, $0, 451 # constante 451
	div $8, $20
m:	mflo $8 # m = (a + 11 × h + 22 × L) \ 451
	mult $8, $17
	mflo $9
	add $11, $10, $24
	sub $11, $11, $9
	addi $11, $11, 114
	addi $20, $0, 31 # constante 31
	div $11, $20
MES:	mflo $11 # MÊS = (h + L - 7 × m + 114) \ 31	
	mfhi $12
DIA:	addi $12, $12, 1 # DIA = 1+ (h + L - 7 × m + 114)MOD 31
ANO: 	addi $20, $2, 0 # guarda o ano digitado

saida:	addi $4, $12, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	addi $4, $11, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	addi $4, $20, 0
	addi $2, $0, 1
	syscall
	
	addi $2, $0, 10
	syscall