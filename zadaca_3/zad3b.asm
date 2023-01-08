//bubble sort

@100
D = A

@A
M = D

@B
M = D + 1 

@END_SWAP
0;JMP

(SWAP)

$SWP(swapA,swapB)

@swapA
D = M

@A
A = M
M = D

@swapB
D = M

@B
A = M
M = D

@mwhile
0;JMP

(END_SWAP)

@0 // 4 
M = M - 1
D = M

@2 //4
M = D

@1 // 4 
M = D

$WHILE(1)

$WHILE(0)

@A
A = M
D = M

@swapA
M = D

@B
A = M
D = M

@swapB
M = D

@swapA
D = M
@swapB
D = D - M

@SWAP
D;JGT

(mwhile)
@A
M = M + 1

@B
M = M + 1

@0
M = M - 1

$END

@100
D = A

@A
M = D

@B
M = D + 1 

@2
D = M

@0
M = D

@1
M = M - 1

$END

(END)
@END
0;JMP