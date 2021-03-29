.text
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0
	addi $2, $0, 5
	syscall
	addi $9, $2, 0
	addi $10, $0, 1
	addi $11, $9, 1
inifor: addi $2, $0, 1
	mul $4, $8, $10
	syscall
	addi $10, $10, 1
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	beq $10, $11, fimfor
	j inifor
	
fimfor:	addi $2, $0, 10
	syscall