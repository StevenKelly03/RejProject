*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    move #16, d2
LOOP:
INPUT:
    move.b #4, d0
    trap #15
    move.b d1, d5
    move.b #4, d0
    trap #15
    move.b d1, d6
    move.b #4, d0
    trap #15
    move.b d1, d7
OPERATE:
    cmpi.b  #0, d5
    beq ADD
    cmpi.b  #1, d5
    beq SUB
    cmpi.b  #2, d5
    beq MUL
    cmpi.b  #3, d5
    beq DIV
    move #$100, d1
    bra OUTPUT
ADD:
    add d6,d7
    move d7, d1
    bra OUTPUT
SUB:
    sub d6,d7
    move d7, d1
    bra OUTPUT
MUL:
    mulu d6,d7
    move d7, d1
    bra OUTPUT
DIV:
    divu d6,d7
    move d7, d1
    bra OUTPUT
OUTPUT:
    move.b #15, d0
    trap #15
CLEAR:
    clr d0
    clr d1
    clr d5
    clr d6
    clr d7
    bra LOOP


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
