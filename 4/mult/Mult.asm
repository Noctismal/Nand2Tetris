// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// Make sure the sum reg is initalized to 0
    @R2
    M=0

// Make sure products wont be zero
    @R0
    D=M 
    @END
    D;JEQ

    @R1
    D=M
    @END
    D;JEQ

// put r0 M into r2 M 
    @R0
    D=M

    @R2
    M=D

// take 1 away from r1
    @R1
    D=M
    M=D-1

(LOOP)
// if r1 M == 0 jmp to end
    @R1
    D=M
    @END
    D;JEQ

// Otherwise add r0 to r2 and decrement r1 and jump to loop
    @R0
    D=M

    @R2
    M=D+M

    @R1
    D=M
    M=D-1

    @LOOP
    0;JMP
(END)
    @END
    0;JMP