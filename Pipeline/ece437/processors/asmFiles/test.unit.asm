    org 0x0000

    ori $1, $zero, 0x00af
    ori $2, $zero, 0x00fa
    ori $3, $zero, 0x00fa
    ori $4, $zero, 0xbeef
    ori $21, $zero, 0x0000
    beq $2, $3, equal
ret1:
    sw $4, 0($21)
    bne $1, $2, notequal
ret2:
    sw $4, 0($23)
    jal noret
    sw $4, 0($25)
    halt

equal:
    sw $4, 0($20)
    j ret1

notequal:
    sw $4, 0($22)
    j ret2

noret:
    sw $4, 0($24)
    jr $31
