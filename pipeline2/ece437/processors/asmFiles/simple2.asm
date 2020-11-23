org 0x0000

    ori     $2, $0, 0xbeef
    ori	    $1, $0, 0xF0
    beq     $1, $2, two
    bne     $1, $2, two
    ori     $5, $0, 0xdead
    halt
two:
    jal     three
    ori     $4, $0, 0xbeef
    halt

three:
    ori     $3, $0, 0xbeef
    jr      $31
    ori     $6, $0, 0xdead
    halt


org   0x00F0
cfw   0x7337
cfw   0x2701
cfw   0x1337
