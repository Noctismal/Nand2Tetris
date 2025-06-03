// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// store the address of the screen in reg 0
(RESTART)
    @SCREEN
    D=A
    @R0
    M=D

(KBDCHECK)
// get what is stored at keyboard and put it into the data reg
    @KBD
    D=M

// if d > 0 a key has been pressed
    @BLACK
    D;JGT

// d == 0 no key has been pressed
    @WHITE
    D;JEQ

// this is an infinate loop
    @KBDCHECK
    0;JMP

(BLACK)
// reg 1 holds what pixel coulor should be displayed on screen
    @R1
    M=-1

    // jump to change
    @CHANGE
    0;JMP

(WHITE)
    @R1
    M=0
    @CHANGE
    0;JMP

(CHANGE)
// get the color of the pixel
    @R1
    D=M

// get the address of the pixel to fill
    @R0
    A=M
// fill the pixel
    M=D

// incriment to the next pixel
    @R0
    D=M+1
    @KBD
    D=A-D

// incriment to next pixel
    @R0
    M=M+1
    A=M

// if change is just all black, this will not jump
    @CHANGE
    D;JGT

    @RESTART
    0;JMP