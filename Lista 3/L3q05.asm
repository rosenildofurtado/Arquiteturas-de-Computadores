.text
main:	addi $8, $0, 0
	addi $9, $0, 0
	addi $10, $0, 10
inifor:	beq $9, $10, fimFor
le:	addi $2, $0, 5
	syscall
	add $8, $8, $2
	addi $9, $9, 1
	j inifor
	
fimFor:	addi $4, $8, 0
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
