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
	
(LOOP)
	@8192   // 8192 number of iterations required for filling entire screen
	D=A
	@R0
	M=D     // stored in R0
	
	@SCREEN // pixel region begins at addr 16384
	D=A
	@R1
	M=D     // stored in R1

	@24576
	D=M
	
	@FILL
	D;JNE
	
	@CLEAR
	D;JEQ

(FILL)
	@24576
	D=M

	@CLEAR
	D;JEQ

	@R1     // fetch val stored in address R1
	A=M     // address is R1 val / data is R1 val
	M=-1    // set all 16 bits to 1
	@R1		// back to R1
	M=M+1   // store address to next pixel chunk
	
	// do the above 8192 times
	@R0
	M=M-1
	D=M

	@FILL
	D;JNE
@LOOP
0;JMP

(CLEAR)
	@24576
	D=M

	@FILL
	D;JNE

	@R1     // fetch val stored in address R1
	A=M     // address is R1 val / data is R1 val
	M=0     // set all 16 bits to 0
	@R1		// back to R1
	M=M+1   // store address to next pixel chunk
	
	// do the above 8192 times
	@R0
	M=M-1
	D=M

	@CLEAR
	D;JNE	
@LOOP
0;JMP

	
	
	
	
	
