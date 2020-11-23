org 0x0000  

ori $1,$0,0x0F0
ori $2, $0, 5
ori $3, $0, 3
ori $5, $0, 9
ori $4, $0, 9
beq $4, $5, checkbne

checkbeq:
sw $4, 0($1)
halt

checkbne:
ori $4, $0, 8
bne $2, $3, checkbeq
