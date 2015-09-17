// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here

// R0 * R1 and stores in R2, ok so
// i = 1
// R2 = R0
// for i = 0, i = R1, i++:
//   R2 = R2 + R1
// return

  // i = 0
  @i
  M=0

  // R2 = 0;
  @R2
  M=0
  
  // D = RAM[0]
  @R0
  D=M

  // if R0 == 0; end
  @END
  D;JEQ

  // if R0 == 1; R2 = R1
  @ASSIGN_R1
  D-1;JEQ

  // D = RAM[1]
  @R1
  D=M

  // if R1 == 0; end
  @END
  D;JEQ

  // if R1 == 1; R2 = R1
  @ASSIGN_R0
  D-1;JEQ

// Here neither R1 or R0 is 0 or 1

(LOOP)
  // R2 = R2 + R0
  @R0
  D=M
  @R2
  M=D+M

  // i = i+1
  @i
  MD=M+1

  @R1
  D=D-M

  // if R1 - i, end
  @END
  D;JEQ

  @LOOP
  0;JMP

(ASSIGN_R1)
  @R1
  D=M
  @R2
  M=D
  @END
  0;JMP

(ASSIGN_R0)
  @R0
  D=M
  @R2
  M=D
  @END
  0;JMP

(END)
  @END
  0;JMP
