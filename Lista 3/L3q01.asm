.text
main:	addi $2, $0, 1
	addi $8, $0, 1
	addi $9, $0, 3
	addi $10, $0, 11
inifor: mul $4, $8, $9
	syscall
	addi $8, $8, 1
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $2, $0, 1
	beq $10, $8, fimfor
	j inifor
	
fimfor:	addi $2, $0, 10
	syscall