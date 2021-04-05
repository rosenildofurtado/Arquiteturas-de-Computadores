.text
main: 	addi $8, $0, 0 # contador i
	addi $9, $0, 0 # contador j
	addi $10, $0, 7 # constante 7
	addi $13, $0, 128 # constante 64
	addi $14, $0, 64 # constante 32
	lui $11, 0x00fa
	lui $23, 0x1001
	addi $12, $0, 0x00006600 # verde escuro
	
	
tela:	beq $8, $14, fimTela
	addi $9, $0, 0 # contador j
telaj:	beq $9, $13, tela
	sw $12, 0($23)
	addi $23, $23, 4
	addi $9, $9, 1
	j telaj
telai:	addi $8, $8, 1
	j tela
	
fimTela: j fim
	
	
	



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
fim:	addi $2, $0, 10
	syscall
