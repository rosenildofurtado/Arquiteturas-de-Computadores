.text
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0
	addi $2, $0, 5
	syscall
	addi $9, $2, 0
	
ifmenor: slt $25, $9, $8
	beq $25, $0, fimIfm
	addi $24, $8, 0
	addi $8, $9, 0
	addi $9, $24, 0
fimIfm:	andi $10, $8, 1
	addi $11, $9, 1
	
if:	beq $10, $0, inifor
	addi $8, $8, 1
	
inifor: beq $8, $11, fimfor

	addi $4, $8, 0
	addi $2, $0, 1
	syscall
	addi $8, $8, 2
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	
fimif:	j inifor
	
fimfor:	addi $2, $0, 10
	syscall
