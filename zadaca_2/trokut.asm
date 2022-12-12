@i
M = 0

@128
D = A
@k
M = D

@SCREEN
D = A
@address
M = D

@1100
D = A
@address
M = M + D


(KATETA1_START)
	@i
    D = M
    @k
    D = M - D
    @KATETA1_END
    D ; JLT
    
    @0
    D = !A
    
    @32767
    D = D - A
    
    @address
    A = M
    M = D
      
    @i
    M = M + 1
    
    @32
    D = A
    @address
    //A = M
    M = M + D
      
    @KATETA1_START
    0 ; JMP

(KATETA1_END)

@32
D = A
@address
M = M - D


@i
M = 0

@8
D = A
@k
M = D


(KATETA2_START)
    @i
    D = M
    @k
    D = M - D
    @KATETA2_END
    D; JLE

    @address
    A = M + 1
    M = -1

    @i
    M = M + 1

    @address
    M = M + 1
    @KATETA2_START
    0; JMP

(KATETA2_END)


@i
M = 0

@j
M = 0

@128
D = A
@k
M = D

@br
M = 1

// offset
@1100
D = A
@SCREEN
D = D + A
@address
M = D + 1

(HIPOTENUZA)
    @j
    D = M
    @k
    D = M - D
    @HIPOTENUZAEND
    D; JEQ

    @16
    D = A
    @i
    D = D - M
    @POVRATAK
    D; JLE

    // shift
    @br
    D = M
    M = D + M

    @address
    A = M
    M = D
        
    // iduci red
    @32
    D = A
    @address
    M = M + D

    @i
    M = M + 1
    @j
    M = M + 1

    @HIPOTENUZA
    0; JMP

(HIPOTENUZAEND)
@END
0; JMP


(POVRATAK)
@br
M = 1
@i
M = 0
@address
M = M + 1
@HIPOTENUZA
0 ; JMP


(END)
@END
0;JMP