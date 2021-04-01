.text	# Calculo do MDC pelo algoritmo de Euclides, tirado de:
	#https://pt.wikipedia.org/wiki/Algoritmo_de_Euclides#:~:text=O%20MDC%20de%20dois%20números,número%20for%20subtraído%20ao%20maior.&text=Nesse%20momento%2C%20o%20MDC%20é,número%20inteiro%2C%20maior%20que%20zero.
main:	addi $2, $0, 5
	syscall
	addi $8, $2, 0 # a
	addi $2, $0, 5
	syscall
	addi $9, $2, 0 # b
	
while:	beq $9, $0, sai
	div $8, $9 # r = a % b
	addi $8, $9, 0 # a = b
	mfhi $9	# b = r
	j while
	
sai:	addi $4, $8, 0
	addi $2, $0, 1
	syscall
fim:	addi $2, $0, 10
	syscall
