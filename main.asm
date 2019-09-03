JMP main
dividend: 
	DB	20
divisor: 
	DB 	4


main:
	MOV	A, [dividend]
	MOV	B, [divisor]
	CALL	div
	HLT

div:
	PUSH	C
	MOV	C, 0

loop:
	SUB	A, B
	JC	done
	INC	C
	JMP	loop

done:
	RET	
	
