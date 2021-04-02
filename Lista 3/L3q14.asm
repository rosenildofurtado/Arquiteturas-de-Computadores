.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # n
	addi $9, $0, 1 # a
	addi $10, $0, 2 # b
	sub $11, $8, $9
c:	sub $11, $11, $10
	addi $12, $0, 0 # a + b + c
	addi $13, $0, 0 # a2
	addi $14, $0, 0 # b2
	addi $15, $0, 0 # c2
	addi $16, $0, 0 # a2 + b2
	srl $17, $8, 1 # n/2
	addi $17, $17, -1 # n/2-1
	addi $18, $0, 3 # constante 3
	div $8, $18
	mflo $18 # n/3
	
forA:	slt $24, $9, $10	
	beq $24, $0, naoTem
a2:	mul $13, $9, $9
	addi $10, $9, 1
forB:	slt $25, $10, $11
	beq $25, $0, fimForB
b2:	mul $14, $10, $10
	sub $11, $8, $9
	sub $11, $11, $10
c2:	mul $15, $11, $11
	add $16, $13, $14
	beq $16, $15, sai
	
	addi $10, $10, 1
	j forB
	
fimForB: addi $9, $9, 1
	j forA
	
naoTem: addi $4, $0, 'N'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'a'
	syscall
	addi $4, $0, 'o'
	syscall
	addi $4, $0, ' '
	syscall
	addi $4, $0, 't'
	syscall
	addi $4, $0, 'e'
	syscall
	addi $4, $0, 'm'
	syscall
	j fim
	
sai:	addi $4, $0, 'a'
	addi $2, $0, 11
	syscall
	addi $4, $9, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $4, $0, 'b'
	addi $2, $0, 11
	syscall
	addi $4, $10, 0
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $4, $0, 'c'
	addi $2, $0, 11
	syscall
	addi $4, $11, 0
	addi $2, $0, 1
	syscall
	j fim
	
fim:	addi $2, $0, 10
	syscall
