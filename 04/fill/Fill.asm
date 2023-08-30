// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// LoopForInput:
//        if RAM[KBD] != 0:
//            screenaddress = SCREEN
//            LoopForBlack:
//                if screenaddress > SCREEN + 8191:
//                    goto LoopForInput
//                RAM[screenaddress] = -1
//                screenaddress = screenaddress + 1
//                goto LoopForBlack
//            screenaddress = SCREEN
//            LoopForWhite:
//                if screenaddress > SCREEN + 8191:
//                    goto LoopForInput
//                RAM[screenaddress] = 0
//                screenaddress = screenaddress + 1
//                goto LoopForWhite
(LoopForInput)
    @KBD
    D = M // D = RAM[KBD]
    @InitLoopForWhite
    D;JEQ // if D == 0, goto InitLoopForWhite
    @SCREEN
    D = A // D = SCREEN
    @screenaddress
    M = D // screenaddress = D
    (LoopForBlack)
        @screenaddress
        D = M // D = screenaddress
        @8191
        D = D - A // screenaddress = screenaddress - 8191
        @SCREEN
        D = D - A // screenaddress = screenaddress - SCREEN
        @LoopForInput
        D;JGT // if screenaddress - SCREEN - 8191 > 0; goto LoopForInput
        @screenaddress
        A = M
        M = -1
        @screenaddress
        M = M + 1
        @LoopForBlack
        0;JMP
    (InitLoopForWhite)
        @SCREEN
        D = A
        @screenaddress
        M = D
    (LoopForWhite)
        @screenaddress
        D = M
        @8191
        D = D - A
        @SCREEN
        D = D - A
        @LoopForInput
        D;JGT
        @screenaddress
        A = M
        M = 0
        @screenaddress
        M = M + 1
        @LoopForWhite
        0;JMP
