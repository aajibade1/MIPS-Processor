org 0x0000
ori $29, $0, 0xFFFC
ori $2, $0, 5

main:
    ori $6, $0, 5
    ori $3, $0, 3
    j second_jump
first_jump:
    subu $3, $2, $3
    jr $31
second_jump:
   # sw $2, 0($3)
    jal first_jump
    ori $4, $0, 5
    halt

