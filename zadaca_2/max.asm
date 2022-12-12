@i
M=0

(LOOP_START)
	@i
	A=M
	D=M
	
	@novimax
	M=D
	
	(INNER_LOOP)
	@i
	D=M
	
	@4
	D=A-D
	
	@LOOP_END
	D; JLE        //4-i <= 0
	
	//dohvati max 
	@novimax
	D = M
	
	@i
	M = M + 1
	A = M
	D = M - D
	
	@LOOP_START
	D; JGT        // M-D > 0
	
	@INNER_LOOP
	0; JMP
	
(LOOP_END)

//dohvati max
@novimax
D = M

@R5
M = D

(END)
@END
0; JMP
