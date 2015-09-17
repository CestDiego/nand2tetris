// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

//   while t:
//     key = KBD
//     if key != 0:
//        dye = !0 // 1111111111111111
//     for i=screen_range, i=0, i--: // i is index of RAM for screen
//         RAM[i] = dye

@i
M=0

(MAINLOOP)


  // initialize i
  @8192
  D=A
  @i
  M=D

  @KBD // Check for keyboard
  D=M

  // check if KEY exists
  @TURN_ON_LOOP
  D;JNE

  @TURN_OFF_LOOP
  D;JEQ

(TURN_ON_LOOP)
  @i
  D=M-1
  M=D

  @MAINLOOP
  D;JLT
  
  @SCREEN
  A=D+A
  D=0
  M=!D

  @TURN_ON_LOOP
  0;JMP

(TURN_OFF_LOOP)
  @i
  D=M-1
  M=D

  @MAINLOOP
  D;JLT
  
  @SCREEN
  A=D+A
  M=0

  @TURN_OFF_LOOP
  0;JMP