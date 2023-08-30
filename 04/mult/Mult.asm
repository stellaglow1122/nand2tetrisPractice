// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// i = 1
// sum = 0
// n = R1
// Loop:
//      if i > n:
//          goto Stop
//      sum = sum + R0
//      goto Loop
// Stop:
//      R2 = sum
// End:
//      goto End
@i
M = 1 // i = 1

@sum
M = 0 // sum = 0

@R1
D = M // D = R1
@n
M = D // n = R1

(Loop)
    @i
    D = M // D = i
    @n
    D = D - M   // i = i - n
    @Stop
    D;JGT   // if i > n, goto Stop

    @sum
    D = M // D = sum
    @R0
    D = D + M  // D = D + R0
    @sum
    M = D // sum = D
    @i
    M = M + 1 // i = i + 1
    @Loop
    0;JMP
(Stop)
    @sum
    D = M // D = sum
    @R2
    M = D // R2 = sum
(End)
    @End
    0;JMP
