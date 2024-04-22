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
    move.b #4, d0
    trap #15
    move.b d1, d5
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
    add d0,d3
    move #$200, d1
    bra OUTPUT
SUB:
    add d0,d3
    move #$300, d1
    bra OUTPUT
MUL:
    add d0,d3
    move #$400, d1
    bra OUTPUT
DIV:
    add d0,d3
    move #$500, d1
    bra OUTPUT
OUTPUT:
    move.b #15, d0
    trap #15
    bra LOOP


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
