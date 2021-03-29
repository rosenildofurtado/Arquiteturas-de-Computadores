.text
main:	addi $8, $0, 0
	addi $9, $0, 11
	
inifor: beq $8, $9, fimfor
	addi $2, $0, 1
	syscall
	addi $8, $8, 1
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	addi $4, $8, 0
	j inifor
	
fimfor:	addi $2, $0, 10
	syscall