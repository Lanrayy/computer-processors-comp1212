@0
D=M
@1
M=D
@2
M=D
@1
D=A
M=M-D
D=M
@58
D;JEQ
@1
D=M
@7
M=D
@2
D=M
@8
M=D
@28 // GOTO (start)
0;JMP
@9
D=M
@2
M=D
@6
0;JMP
@7  // first input (start)
D=M
@10
M=D
@1
D=A
@10
M=M-D
@8 // second input
D=M
@9 // Answer in RAM[8] (1)
M=D
@1
D=A
@10
M=M-D
D=M
@57
D;JLT
@8
D=M
@9
M=M+D
@10
D=M
@57 // GOTO (2)
D;JEQ
@40  // GOTo (1)
0;JMP
@22  // go back to fact
0;JMP
