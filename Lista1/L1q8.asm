.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2 # Guarda o n�mero hh digitado em $8
	addi $2, $0, 5
	syscall
	add $9, $0, $2 # Guarda o n�mero mm digitado em $9
	addi $2, $0, 5
	syscall
	add $10, $0, $2 # Guarda o n�mero ss digitado em $10
	
	addi $11, $0, 60 # Vai guardar o valor das multiplica��es
	add $12, $0, $10 # V�riavel soma recebe segundos
	mult $11, $9 # multiplica 60*mm
	mflo $13
somaM:	add $12, $13, $12 # soma segundos com os minutos convertidos
	addi $11, $0, 3600 # Vai guardar o valor das multiplica��es
	mult $11, $10 # multiplica 3600*hh
	mflo $13
somaH:	add $12, $13, $12 # soma segundos com as horas convertidas
	addi $2, $0, 1
	add $4, $0, $12
	syscall
	addi $2, $0, 10
	syscall
