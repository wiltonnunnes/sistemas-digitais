JMP main
value:	
	DB 	119

main:
	MOV	A, [value]
	MOV	B, 0

loop:
	SUB	A, 100
	INC	B
	HLT
