// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

@temp
M=0

(MAIN_LOOP)
    @KBD
    D=M
    @PAINT_BLACK
    D;JNE
    @PAINT_WHITE
    0;JMP

(PAINT_BLACK)
    @SCREEN
    D=A
    @temp
    M=D

(BLACK_LOOP)
    @temp
    D=M
    @24576
    D=D-A
    @MAIN_LOOP
    D;JEQ

    @temp
    A=M
    M=-1

    @temp
    M=M+1
    @BLACK_LOOP
    0;JMP

(PAINT_WHITE)
    @SCREEN
    D=A
    @temp
    M=D

(WHITE_LOOP)
    @temp
    D=M
    @24576
    D=D-A
    @MAIN_LOOP
    D;JEQ

    @temp
    A=M
    M=0

    @temp
    M=M+1
    @WHITE_LOOP
    0;JMP
